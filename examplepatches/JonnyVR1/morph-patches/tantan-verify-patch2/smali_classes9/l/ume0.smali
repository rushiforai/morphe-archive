.class public final Ll/ume0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00004\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0004\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\r\u0010\u0007\u001a\u00020\u0006\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u0017\u0010\u000c\u001a\u00020\u000b2\u0006\u0010\n\u001a\u00020\tH\u0002\u00a2\u0006\u0004\u0008\u000c\u0010\rJ\u0019\u0010\u0011\u001a\u00020\u00102\u0008\u0010\u000f\u001a\u0004\u0018\u00010\u000eH\u0002\u00a2\u0006\u0004\u0008\u0011\u0010\u0012R\u0014\u0010\u0003\u001a\u00020\u00028\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0007\u0010\u0013\u00a8\u0006\u0014"
    }
    d2 = {
        "Ll/ume0;",
        "",
        "Ll/uoe0;",
        "requestInfo",
        "<init>",
        "(Ll/uoe0;)V",
        "Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveMultiGiftReq;",
        "a",
        "()Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveMultiGiftReq;",
        "Ll/coj;",
        "giftCall",
        "Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftReq;",
        "b",
        "(Ll/coj;)Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftReq;",
        "",
        "sendGiftSource",
        "",
        "c",
        "(Ljava/lang/String;)Z",
        "Ll/uoe0;",
        "livingroom_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# instance fields
.field public final a:Ll/uoe0;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/uoe0;)V
    .locals 0
    .param p1    # Ll/uoe0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Ll/ume0;->a:Ll/uoe0;

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final a()Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveMultiGiftReq;
    .locals 6
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveMultiGiftReq;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveMultiGiftReq;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    iput-object v0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveMultiGiftReq;->givenGifts:Ljava/util/List;

    .line 11
    .line 12
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-virtual {v2}, Ljava/util/UUID;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    iput-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveMultiGiftReq;->originalId:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v2, p0, Ll/ume0;->a:Ll/uoe0;

    .line 23
    .line 24
    invoke-virtual {v2}, Ll/uoe0;->e()Ljava/util/List;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 29
    .line 30
    .line 31
    check-cast v2, Ljava/lang/Iterable;

    .line 32
    .line 33
    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    if-eqz v3, :cond_0

    .line 42
    .line 43
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    check-cast v3, Ll/coj;

    .line 48
    .line 49
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveMultiGiftReqItem;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveMultiGiftReqItem;

    .line 50
    .line 51
    .line 52
    move-result-object v4

    .line 53
    iget-object v5, v3, Ll/coj;->e:Ll/h64;

    .line 54
    .line 55
    iget-object v5, v5, Ll/h64;->a:Ljava/lang/String;

    .line 56
    .line 57
    iput-object v5, v4, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveMultiGiftReqItem;->toUserId:Ljava/lang/String;

    .line 58
    .line 59
    invoke-virtual {p0, v3}, Ll/ume0;->b(Ll/coj;)Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftReq;

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    iput-object v3, v4, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveMultiGiftReqItem;->givenGift:Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftReq;

    .line 64
    .line 65
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_0
    return-object v1
.end method

.method public final b(Ll/coj;)Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftReq;
    .locals 11

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
    iget-object v2, p0, Ll/ume0;->a:Ll/uoe0;

    .line 20
    .line 21
    iget-object v2, v2, Ll/uoe0;->x:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;

    .line 22
    .line 23
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    iget-object v3, p0, Ll/ume0;->a:Ll/uoe0;

    .line 28
    .line 29
    if-eqz v2, :cond_0

    .line 30
    .line 31
    iget-object v2, v3, Ll/uoe0;->x:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;

    .line 32
    .line 33
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 34
    .line 35
    .line 36
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;->receiveGiftRole:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCallGiftRole;

    .line 37
    .line 38
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCallGiftRole;->roomIdRoleIn:Ljava/lang/String;

    .line 39
    .line 40
    iput-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftReq;->roomId:Ljava/lang/String;

    .line 41
    .line 42
    iget-object v2, p0, Ll/ume0;->a:Ll/uoe0;

    .line 43
    .line 44
    iget-object v2, v2, Ll/uoe0;->x:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;

    .line 45
    .line 46
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 47
    .line 48
    .line 49
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;->receiveGiftRole:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCallGiftRole;

    .line 50
    .line 51
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCallGiftRole;->liveIdRoleIn:Ljava/lang/String;

    .line 52
    .line 53
    iput-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftReq;->liveId:Ljava/lang/String;

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_0
    iget-object v2, v3, Ll/uoe0;->y:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;

    .line 57
    .line 58
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    iget-object v3, p0, Ll/ume0;->a:Ll/uoe0;

    .line 63
    .line 64
    if-eqz v2, :cond_1

    .line 65
    .line 66
    iget-object v2, v3, Ll/uoe0;->y:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;

    .line 67
    .line 68
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 69
    .line 70
    .line 71
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;->receiveGiftRole:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCallGiftRole;

    .line 72
    .line 73
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCallGiftRole;->roomIdRoleIn:Ljava/lang/String;

    .line 74
    .line 75
    iput-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftReq;->roomId:Ljava/lang/String;

    .line 76
    .line 77
    iget-object v2, p0, Ll/ume0;->a:Ll/uoe0;

    .line 78
    .line 79
    iget-object v2, v2, Ll/uoe0;->y:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;

    .line 80
    .line 81
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 82
    .line 83
    .line 84
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;->receiveGiftRole:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCallGiftRole;

    .line 85
    .line 86
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCallGiftRole;->liveIdRoleIn:Ljava/lang/String;

    .line 87
    .line 88
    iput-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftReq;->liveId:Ljava/lang/String;

    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_1
    iget-object v2, v3, Ll/uoe0;->b:Ljava/lang/String;

    .line 92
    .line 93
    iput-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftReq;->roomId:Ljava/lang/String;

    .line 94
    .line 95
    iget-object v2, v3, Ll/uoe0;->a:Ljava/lang/String;

    .line 96
    .line 97
    iput-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftReq;->liveId:Ljava/lang/String;

    .line 98
    .line 99
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveGiftInfo;

    .line 100
    .line 101
    .line 102
    move-result-object v2

    .line 103
    iget-object v3, p0, Ll/ume0;->a:Ll/uoe0;

    .line 104
    .line 105
    iget-object v3, v3, Ll/uoe0;->e:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 106
    .line 107
    const-string v4, ""

    .line 108
    .line 109
    if-nez v3, :cond_2

    .line 110
    .line 111
    move-object v3, v4

    .line 112
    goto :goto_1

    .line 113
    :cond_2
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 114
    .line 115
    .line 116
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->giftType:Ljava/lang/String;

    .line 117
    .line 118
    :goto_1
    iput-object v3, v2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftInfo;->giftType:Ljava/lang/String;

    .line 119
    .line 120
    iget-object v3, p0, Ll/ume0;->a:Ll/uoe0;

    .line 121
    .line 122
    iget v3, v3, Ll/uoe0;->f:I

    .line 123
    .line 124
    iput v3, v2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftInfo;->num:I

    .line 125
    .line 126
    filled-new-array {v2}, [Lcom/p1/mobile/putong/live/base/data/BLiveGiftInfo;

    .line 127
    .line 128
    .line 129
    move-result-object v2

    .line 130
    invoke-static {v2}, Lkotlin/collections/CollectionsKt;->mutableListOf([Ljava/lang/Object;)Ljava/util/List;

    .line 131
    .line 132
    .line 133
    move-result-object v2

    .line 134
    iput-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftReq;->giftInfo:Ljava/util/List;

    .line 135
    .line 136
    iget-object v5, p1, Ll/coj;->g:Ljava/lang/String;

    .line 137
    .line 138
    invoke-virtual {p0, v5}, Ll/ume0;->c(Ljava/lang/String;)Z

    .line 139
    .line 140
    .line 141
    move-result v2

    .line 142
    if-eqz v2, :cond_3

    .line 143
    .line 144
    const-string v1, "voiceLive"

    .line 145
    .line 146
    goto :goto_2

    .line 147
    :cond_3
    const-string v2, "guildCallAudience"

    .line 148
    .line 149
    invoke-static {v2, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 150
    .line 151
    .line 152
    move-result v2

    .line 153
    if-eqz v2, :cond_4

    .line 154
    .line 155
    const-string v1, "guildLive"

    .line 156
    .line 157
    :cond_4
    :goto_2
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftReq;->type:Ljava/lang/String;

    .line 158
    .line 159
    iget-object v1, p0, Ll/ume0;->a:Ll/uoe0;

    .line 160
    .line 161
    invoke-virtual {v1}, Ll/uoe0;->f()Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;

    .line 162
    .line 163
    .line 164
    move-result-object v1

    .line 165
    iget-object v2, p1, Ll/coj;->f:Ll/p54;

    .line 166
    .line 167
    iget-object v6, v2, Ll/p54;->a:Ljava/lang/String;

    .line 168
    .line 169
    iget-object v2, p1, Ll/coj;->e:Ll/h64;

    .line 170
    .line 171
    iget-object v7, v2, Ll/h64;->a:Ljava/lang/String;

    .line 172
    .line 173
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 174
    .line 175
    .line 176
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 177
    .line 178
    .line 179
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 180
    .line 181
    .line 182
    iget-object p1, p1, Ll/coj;->f:Ll/p54;

    .line 183
    .line 184
    iget v8, p1, Ll/p54;->d:I

    .line 185
    .line 186
    iget-object p1, p0, Ll/ume0;->a:Ll/uoe0;

    .line 187
    .line 188
    iget-object v9, p1, Ll/uoe0;->c:Ljava/lang/String;

    .line 189
    .line 190
    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 191
    .line 192
    .line 193
    iget-object p1, p0, Ll/ume0;->a:Ll/uoe0;

    .line 194
    .line 195
    invoke-virtual {p1}, Ll/uoe0;->j()Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object v10

    .line 199
    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 200
    .line 201
    .line 202
    invoke-static/range {v5 .. v10}, Ll/txj;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)Ll/sxj;

    .line 203
    .line 204
    .line 205
    move-result-object p1

    .line 206
    invoke-virtual {p1}, Ll/sxj;->a()Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraCallInfo;

    .line 207
    .line 208
    .line 209
    move-result-object v2

    .line 210
    iput-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->call:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraCallInfo;

    .line 211
    .line 212
    invoke-virtual {p1}, Ll/sxj;->b()Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVoiceInfo;

    .line 213
    .line 214
    .line 215
    move-result-object p1

    .line 216
    iput-object p1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->voiceLive:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVoiceInfo;

    .line 217
    .line 218
    sget-object v2, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->VOICE_LIVE_MODEL_BOSS:Ljava/lang/String;

    .line 219
    .line 220
    iget-object v3, p0, Ll/ume0;->a:Ll/uoe0;

    .line 221
    .line 222
    invoke-virtual {v3}, Ll/uoe0;->g()Ljava/lang/String;

    .line 223
    .line 224
    .line 225
    move-result-object v3

    .line 226
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 227
    .line 228
    .line 229
    move-result v2

    .line 230
    if-nez v2, :cond_5

    .line 231
    .line 232
    sget-object v2, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->VOICE_LIVE_MODEL_RADIO_3:Ljava/lang/String;

    .line 233
    .line 234
    iget-object v3, p0, Ll/ume0;->a:Ll/uoe0;

    .line 235
    .line 236
    invoke-virtual {v3}, Ll/uoe0;->g()Ljava/lang/String;

    .line 237
    .line 238
    .line 239
    move-result-object v3

    .line 240
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 241
    .line 242
    .line 243
    move-result v2

    .line 244
    if-nez v2, :cond_5

    .line 245
    .line 246
    sget-object v2, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->VOICE_LIVE_MODEL_RADIO_5:Ljava/lang/String;

    .line 247
    .line 248
    iget-object v3, p0, Ll/ume0;->a:Ll/uoe0;

    .line 249
    .line 250
    invoke-virtual {v3}, Ll/uoe0;->g()Ljava/lang/String;

    .line 251
    .line 252
    .line 253
    move-result-object v3

    .line 254
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 255
    .line 256
    .line 257
    move-result v2

    .line 258
    if-eqz v2, :cond_6

    .line 259
    .line 260
    :cond_5
    iget-object v2, p0, Ll/ume0;->a:Ll/uoe0;

    .line 261
    .line 262
    invoke-virtual {v2}, Ll/uoe0;->g()Ljava/lang/String;

    .line 263
    .line 264
    .line 265
    move-result-object v4

    .line 266
    :cond_6
    iput-object v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVoiceInfo;->voiceLiveMode:Ljava/lang/String;

    .line 267
    .line 268
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftReq;->extraInfo:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;

    .line 269
    .line 270
    sget-object p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->VOICE_LIVE_MODEL_BOSS:Ljava/lang/String;

    .line 271
    .line 272
    iget-object v1, p0, Ll/ume0;->a:Ll/uoe0;

    .line 273
    .line 274
    invoke-virtual {v1}, Ll/uoe0;->g()Ljava/lang/String;

    .line 275
    .line 276
    .line 277
    move-result-object v1

    .line 278
    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 279
    .line 280
    .line 281
    move-result p1

    .line 282
    if-nez p1, :cond_8

    .line 283
    .line 284
    sget-object p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->VOICE_LIVE_MODEL_RADIO_3:Ljava/lang/String;

    .line 285
    .line 286
    iget-object v1, p0, Ll/ume0;->a:Ll/uoe0;

    .line 287
    .line 288
    invoke-virtual {v1}, Ll/uoe0;->g()Ljava/lang/String;

    .line 289
    .line 290
    .line 291
    move-result-object v1

    .line 292
    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 293
    .line 294
    .line 295
    move-result p1

    .line 296
    if-nez p1, :cond_8

    .line 297
    .line 298
    sget-object p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->VOICE_LIVE_MODEL_RADIO_5:Ljava/lang/String;

    .line 299
    .line 300
    iget-object v1, p0, Ll/ume0;->a:Ll/uoe0;

    .line 301
    .line 302
    invoke-virtual {v1}, Ll/uoe0;->g()Ljava/lang/String;

    .line 303
    .line 304
    .line 305
    move-result-object v1

    .line 306
    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 307
    .line 308
    .line 309
    move-result p1

    .line 310
    if-eqz p1, :cond_7

    .line 311
    .line 312
    goto :goto_3

    .line 313
    :cond_7
    iget-object p0, p0, Ll/ume0;->a:Ll/uoe0;

    .line 314
    .line 315
    invoke-virtual {p0}, Ll/uoe0;->g()Ljava/lang/String;

    .line 316
    .line 317
    .line 318
    move-result-object p0

    .line 319
    goto :goto_4

    .line 320
    :cond_8
    :goto_3
    const-string p0, "normal"

    .line 321
    .line 322
    :goto_4
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftReq;->liveMode:Ljava/lang/String;

    .line 323
    .line 324
    invoke-static {}, Ll/eb20;->b()Z

    .line 325
    .line 326
    .line 327
    move-result p0

    .line 328
    if-eqz p0, :cond_9

    .line 329
    .line 330
    invoke-static {}, Ll/eb20;->a()Ljava/lang/String;

    .line 331
    .line 332
    .line 333
    move-result-object p0

    .line 334
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftReq;->fakeId:Ljava/lang/String;

    .line 335
    .line 336
    :cond_9
    return-object v0
.end method

.method public final c(Ljava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ume0;->a:Ll/uoe0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/uoe0;->n()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_1

    .line 8
    .line 9
    const-string p0, "voiceLiveMain"

    .line 10
    .line 11
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_1

    .line 16
    .line 17
    const-string p0, "voiceLiveVice"

    .line 18
    .line 19
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-nez p0, :cond_1

    .line 24
    .line 25
    const-string p0, "voiceLiveAudience"

    .line 26
    .line 27
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-nez p0, :cond_1

    .line 32
    .line 33
    const-string p0, "voice-chat-admin"

    .line 34
    .line 35
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    if-nez p0, :cond_1

    .line 40
    .line 41
    const-string p0, "voiceLiveConfessDetail"

    .line 42
    .line 43
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    if-eqz p0, :cond_0

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_0
    const/4 p0, 0x0

    .line 51
    return p0

    .line 52
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 53
    return p0
.end method
