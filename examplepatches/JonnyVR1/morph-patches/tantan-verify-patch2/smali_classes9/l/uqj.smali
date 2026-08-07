.class public final Ll/uqj;
.super Ll/qct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/qct<",
        "Ll/oo2;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0006\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001B\u0015\u0012\u000c\u0010\u0004\u001a\u0008\u0012\u0002\u0008\u0003\u0018\u00010\u0003\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u0019\u0010\n\u001a\u00020\t2\u0008\u0010\u0008\u001a\u0004\u0018\u00010\u0007H\u0002\u00a2\u0006\u0004\u0008\n\u0010\u000bJ\u000f\u0010\u000c\u001a\u00020\tH\u0002\u00a2\u0006\u0004\u0008\u000c\u0010\rJ\u000f\u0010\u000e\u001a\u00020\tH\u0002\u00a2\u0006\u0004\u0008\u000e\u0010\rJ\u0017\u0010\u000f\u001a\u00020\t2\u0006\u0010\u0008\u001a\u00020\u0007H\u0002\u00a2\u0006\u0004\u0008\u000f\u0010\u000bJ/\u0010\u0016\u001a\u00020\t2\u0006\u0010\u0011\u001a\u00020\u00102\u0006\u0010\u0008\u001a\u00020\u00072\u0006\u0010\u0013\u001a\u00020\u00122\u0006\u0010\u0015\u001a\u00020\u0014H\u0002\u00a2\u0006\u0004\u0008\u0016\u0010\u0017J\u000f\u0010\u0018\u001a\u00020\tH\u0016\u00a2\u0006\u0004\u0008\u0018\u0010\rJ\u000f\u0010\u0019\u001a\u00020\tH\u0002\u00a2\u0006\u0004\u0008\u0019\u0010\r\u00a8\u0006\u001a"
    }
    d2 = {
        "Ll/uqj;",
        "Ll/qct;",
        "Ll/oo2;",
        "Ll/dum;",
        "info",
        "<init>",
        "(Ll/dum;)V",
        "Ll/aiv$a;",
        "message",
        "",
        "N3",
        "(Ll/aiv$a;)V",
        "P3",
        "()V",
        "T3",
        "R3",
        "Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;",
        "brief",
        "Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;",
        "giftItem",
        "Lcom/p1/mobile/putong/live/base/data/BLiveSendActivityGiftTrace;",
        "item",
        "S3",
        "(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Ll/aiv$a;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Lcom/p1/mobile/putong/live/base/data/BLiveSendActivityGiftTrace;)V",
        "T",
        "O3",
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


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0
    .param p1    # Ll/dum;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "*>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static J3(Ll/aiv$a;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/aiv$a;->c:Ll/aiv$a$a;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/aiv$a$a;->b()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static K3(Ll/uqj;Ll/aiv$a;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Lcom/p1/mobile/putong/live/base/data/BLiveSendActivityGiftTrace;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V
    .locals 0

    .line 1
    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-direct {p0, p4, p1, p2, p3}, Ll/uqj;->S3(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Ll/aiv$a;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Lcom/p1/mobile/putong/live/base/data/BLiveSendActivityGiftTrace;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static L3(Ll/aiv$a;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/aiv$a;->c:Ll/aiv$a$a;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/aiv$a$a;->c()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static M3(Ll/uqj;Ll/aiv$a;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/uqj;->N3(Ll/aiv$a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final N3(Ll/aiv$a;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    invoke-virtual {p1}, Ll/aiv$a;->d()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    invoke-direct {p0, p1}, Ll/uqj;->R3(Ll/aiv$a;)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_1
    invoke-virtual {p1}, Ll/aiv$a;->e()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_2

    .line 19
    .line 20
    invoke-direct {p0}, Ll/uqj;->T3()V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_2
    invoke-virtual {p1}, Ll/aiv$a;->b()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_3

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/uqj;->O3()V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_3
    invoke-virtual {p1}, Ll/aiv$a;->c()Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-eqz p1, :cond_4

    .line 39
    .line 40
    invoke-direct {p0}, Ll/uqj;->P3()V

    .line 41
    .line 42
    .line 43
    :cond_4
    :goto_0
    return-void
.end method

.method private final P3()V
    .locals 0

    .line 1
    invoke-static {}, Ll/aiv;->k1()Lrx/c;

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final R3(Ll/aiv$a;)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    :try_start_0
    sget-object v2, Lcom/p1/mobile/putong/live/base/data/BLiveSendActivityGiftTrace;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 6
    .line 7
    iget-object v3, v1, Ll/aiv$a;->b:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v2, v3}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    check-cast v2, Lcom/p1/mobile/putong/live/base/data/BLiveSendActivityGiftTrace;

    .line 14
    .line 15
    new-instance v3, Ll/oqj;

    .line 16
    .line 17
    iget-object v4, v2, Lcom/p1/mobile/putong/live/base/data/BLiveSendActivityGiftTrace;->userId:Ljava/lang/String;

    .line 18
    .line 19
    const/4 v5, 0x0

    .line 20
    invoke-direct {v3, v5, v4}, Ll/oqj;-><init>(ILjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v3}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    check-cast v3, Landroid/util/Pair;

    .line 28
    .line 29
    sget-object v4, Ll/htd0;->c:Ll/htd0;

    .line 30
    .line 31
    invoke-static {v4}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v4

    .line 35
    check-cast v4, Ll/hiv;

    .line 36
    .line 37
    iget-object v5, v2, Lcom/p1/mobile/putong/live/base/data/BLiveSendActivityGiftTrace;->giftId:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {v4, v5}, Ll/hiv;->m(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 40
    .line 41
    .line 42
    move-result-object v4

    .line 43
    iget-object v5, v2, Lcom/p1/mobile/putong/live/base/data/BLiveSendActivityGiftTrace;->traceActivityName:Ljava/lang/String;

    .line 44
    .line 45
    iget-object v6, v2, Lcom/p1/mobile/putong/live/base/data/BLiveSendActivityGiftTrace;->traceModule:Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {v5, v6}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->getH5TraceServerData(Ljava/lang/String;Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;

    .line 48
    .line 49
    .line 50
    move-result-object v16

    .line 51
    iget-object v7, v2, Lcom/p1/mobile/putong/live/base/data/BLiveSendActivityGiftTrace;->giftId:Ljava/lang/String;

    .line 52
    .line 53
    new-instance v9, Ll/rqj;

    .line 54
    .line 55
    invoke-direct {v9, v0, v1, v4, v2}, Ll/rqj;-><init>(Ll/uqj;Ll/aiv$a;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Lcom/p1/mobile/putong/live/base/data/BLiveSendActivityGiftTrace;)V

    .line 56
    .line 57
    .line 58
    new-instance v10, Ll/sqj;

    .line 59
    .line 60
    invoke-direct {v10, v1}, Ll/sqj;-><init>(Ll/aiv$a;)V

    .line 61
    .line 62
    .line 63
    new-instance v11, Ll/tqj;

    .line 64
    .line 65
    invoke-direct {v11, v1}, Ll/tqj;-><init>(Ll/aiv$a;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/base/data/BLiveSendActivityGiftTrace;->getRealGiftCount()I

    .line 69
    .line 70
    .line 71
    move-result v13

    .line 72
    if-eqz v3, :cond_1

    .line 73
    .line 74
    iget-object v1, v3, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 75
    .line 76
    check-cast v1, Ljava/lang/String;

    .line 77
    .line 78
    if-nez v1, :cond_0

    .line 79
    .line 80
    goto :goto_1

    .line 81
    :cond_0
    :goto_0
    move-object v14, v1

    .line 82
    goto :goto_2

    .line 83
    :cond_1
    :goto_1
    const-string v1, "live"

    .line 84
    .line 85
    goto :goto_0

    .line 86
    :goto_2
    if-eqz v3, :cond_2

    .line 87
    .line 88
    iget-object v1, v3, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 89
    .line 90
    check-cast v1, Ll/cqj;

    .line 91
    .line 92
    :goto_3
    move-object v15, v1

    .line 93
    goto :goto_4

    .line 94
    :cond_2
    const/4 v1, 0x0

    .line 95
    goto :goto_3

    .line 96
    :goto_4
    const/4 v8, 0x0

    .line 97
    const/4 v12, 0x0

    .line 98
    invoke-static/range {v7 .. v16}, Ll/uoe0;->d(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ll/y20;Ll/y20;Ll/y20;ZILjava/lang/String;Ll/cqj;Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;)Ll/uoe0;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    iget-object v3, v2, Lcom/p1/mobile/putong/live/base/data/BLiveSendActivityGiftTrace;->showSendGiftFirstConfirmDialogFlag:Ljava/lang/String;

    .line 103
    .line 104
    invoke-virtual {v1, v3}, Ll/uoe0;->p(Ljava/lang/String;)Ll/uoe0;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    iget-boolean v3, v2, Lcom/p1/mobile/putong/live/base/data/BLiveSendActivityGiftTrace;->showSendGiftConfirmDialogFlag:Z

    .line 109
    .line 110
    invoke-virtual {v1, v3}, Ll/uoe0;->o(Z)Ll/uoe0;

    .line 111
    .line 112
    .line 113
    move-result-object v1

    .line 114
    iget-object v3, v2, Lcom/p1/mobile/putong/live/base/data/BLiveSendActivityGiftTrace;->traceModule:Ljava/lang/String;

    .line 115
    .line 116
    invoke-virtual {v1, v3}, Ll/uoe0;->u(Ljava/lang/String;)Ll/uoe0;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    iget-object v3, v2, Lcom/p1/mobile/putong/live/base/data/BLiveSendActivityGiftTrace;->traceActivityName:Ljava/lang/String;

    .line 121
    .line 122
    invoke-virtual {v1, v3}, Ll/uoe0;->t(Ljava/lang/String;)Ll/uoe0;

    .line 123
    .line 124
    .line 125
    move-result-object v1

    .line 126
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 127
    .line 128
    .line 129
    move-result-object v3

    .line 130
    invoke-virtual {v3}, Ll/oo2;->A0()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v3

    .line 134
    iput-object v3, v1, Ll/uoe0;->B:Ljava/lang/String;

    .line 135
    .line 136
    const-string v3, "js"

    .line 137
    .line 138
    iput-object v3, v1, Ll/uoe0;->A:Ljava/lang/String;

    .line 139
    .line 140
    iget-object v3, v2, Lcom/p1/mobile/putong/live/base/data/BLiveSendActivityGiftTrace;->fromTag:Ljava/lang/String;

    .line 141
    .line 142
    iput-object v3, v1, Ll/uoe0;->N:Ljava/lang/String;

    .line 143
    .line 144
    iget-object v3, v2, Lcom/p1/mobile/putong/live/base/data/BLiveSendActivityGiftTrace;->userId:Ljava/lang/String;

    .line 145
    .line 146
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 147
    .line 148
    .line 149
    move-result v3

    .line 150
    if-nez v3, :cond_3

    .line 151
    .line 152
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveSendActivityGiftTrace;->userId:Ljava/lang/String;

    .line 153
    .line 154
    iput-object v2, v1, Ll/uoe0;->o:Ljava/lang/String;

    .line 155
    .line 156
    goto :goto_5

    .line 157
    :cond_3
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveSendActivityGiftTrace;->toUserId:Ljava/lang/String;

    .line 158
    .line 159
    iput-object v2, v1, Ll/uoe0;->o:Ljava/lang/String;

    .line 160
    .line 161
    :goto_5
    invoke-virtual {v0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->SendGiftEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$SendGiftEventGroup;

    .line 166
    .line 167
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$SendGiftEventGroup;->sendGift()Ll/v3f$d;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    new-instance v2, Ll/hne0$a;

    .line 172
    .line 173
    invoke-direct {v2}, Ll/hne0$a;-><init>()V

    .line 174
    .line 175
    .line 176
    invoke-virtual {v2, v1}, Ll/hne0$a;->y(Ll/uoe0;)Ll/hne0;

    .line 177
    .line 178
    .line 179
    move-result-object v1

    .line 180
    invoke-virtual {v0, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 181
    .line 182
    .line 183
    return-void

    .line 184
    :catch_0
    move-exception v0

    .line 185
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 186
    .line 187
    .line 188
    return-void
.end method

.method private final S3(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Ll/aiv$a;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Lcom/p1/mobile/putong/live/base/data/BLiveSendActivityGiftTrace;)V
    .locals 0

    .line 1
    invoke-virtual {p2, p1}, Ll/aiv$a;->a(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p3}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->isPacketGift()Z

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->GiftDialogEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;

    .line 15
    .line 16
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->reloadGift()Ll/v3f$d;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    const/16 p2, 0x384

    .line 21
    .line 22
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    invoke-virtual {p1, p2}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p4}, Lcom/p1/mobile/putong/live/base/data/BLiveSendActivityGiftTrace;->getRealGiftCount()I

    .line 34
    .line 35
    .line 36
    move-result p2

    .line 37
    invoke-virtual {p0}, Ll/i6t;->j3()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-static {p3, p1, p2, p0}, Ll/qzj;->s(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ljava/lang/String;ILjava/lang/String;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method private final T3()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->GiftDialogEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->openGoWallet()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance v0, Ll/ox50;

    .line 12
    .line 13
    invoke-direct {v0}, Ll/ox50;-><init>()V

    .line 14
    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-virtual {v0, v1}, Ll/ox50;->d(Z)Ll/ox50;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const/4 v1, 0x0

    .line 22
    invoke-virtual {v0, v1}, Ll/ox50;->e(Ll/uoe0;)Ll/ox50;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const-string v1, "liveGiftH5Click"

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ll/ox50;->f(Ljava/lang/String;)Ll/ox50;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method


# virtual methods
.method public final O3()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->GiftDialogEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->closeH5Skin()Ll/v3f$c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/htd0;->c:Ll/htd0;

    .line 5
    .line 6
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Ll/hiv;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/hiv;->r()Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/qqj;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/qqj;-><init>(Ll/uqj;)V

    .line 23
    .line 24
    .line 25
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 30
    .line 31
    .line 32
    return-void
.end method
