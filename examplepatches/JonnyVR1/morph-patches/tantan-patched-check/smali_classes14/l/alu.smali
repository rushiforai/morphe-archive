.class public final Ll/alu;
.super Ll/xgu;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/xgu<",
        "Ll/alu;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00000\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u000f\u0010\u0007\u001a\u00020\u0006H\u0016\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u0019\u0010\u000b\u001a\u00020\u00062\u0008\u0010\n\u001a\u0004\u0018\u00010\tH\u0002\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\u000f\u0010\r\u001a\u00020\u0006H\u0002\u00a2\u0006\u0004\u0008\r\u0010\u0008J\u000f\u0010\u000e\u001a\u00020\u0006H\u0002\u00a2\u0006\u0004\u0008\u000e\u0010\u0008J\u0017\u0010\u000f\u001a\u00020\u00062\u0006\u0010\n\u001a\u00020\tH\u0002\u00a2\u0006\u0004\u0008\u000f\u0010\u000cJ/\u0010\u0016\u001a\u00020\u00062\u0006\u0010\u0011\u001a\u00020\u00102\u0006\u0010\n\u001a\u00020\t2\u0006\u0010\u0013\u001a\u00020\u00122\u0006\u0010\u0015\u001a\u00020\u0014H\u0002\u00a2\u0006\u0004\u0008\u0016\u0010\u0017\u00a8\u0006\u0018"
    }
    d2 = {
        "Ll/alu;",
        "Ll/xgu;",
        "Ll/knu;",
        "info",
        "<init>",
        "(Ll/knu;)V",
        "",
        "T",
        "()V",
        "Ll/aiv$a;",
        "message",
        "W2",
        "(Ll/aiv$a;)V",
        "X2",
        "a3",
        "Y2",
        "Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;",
        "brief",
        "Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;",
        "giftItem",
        "Lcom/p1/mobile/putong/live/base/data/BLiveSendActivityGiftTrace;",
        "item",
        "Z2",
        "(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Ll/aiv$a;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Lcom/p1/mobile/putong/live/base/data/BLiveSendActivityGiftTrace;)V",
        "external_intlGmsRelease"
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
.method public constructor <init>(Ll/knu;)V
    .locals 0
    .param p1    # Ll/knu;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Ll/xgu;-><init>(Ll/knu;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static S2(Ll/aiv$a;Ljava/lang/Throwable;)V
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

.method public static T2(Ll/alu;Ll/aiv$a;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Lcom/p1/mobile/putong/live/base/data/BLiveSendActivityGiftTrace;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V
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
    invoke-virtual {p0, p4, p1, p2, p3}, Ll/alu;->Z2(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Ll/aiv$a;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Lcom/p1/mobile/putong/live/base/data/BLiveSendActivityGiftTrace;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static U2(Ll/aiv$a;Ljava/lang/Integer;)V
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

.method public static V2(Ll/alu;Ll/aiv$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/alu;->W2(Ll/aiv$a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
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
    new-instance v1, Ll/wku;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/wku;-><init>(Ll/alu;)V

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

.method public final W2(Ll/aiv$a;)V
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
    invoke-virtual {p0, p1}, Ll/alu;->Y2(Ll/aiv$a;)V

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
    invoke-virtual {p0}, Ll/alu;->a3()V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_2
    invoke-virtual {p1}, Ll/aiv$a;->c()Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-eqz p1, :cond_3

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/alu;->X2()V

    .line 31
    .line 32
    .line 33
    :cond_3
    :goto_0
    return-void
.end method

.method public final X2()V
    .locals 0

    .line 1
    invoke-static {}, Ll/aiv;->k1()Lrx/c;

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final Y2(Ll/aiv$a;)V
    .locals 14

    .line 1
    :try_start_0
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendActivityGiftTrace;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 2
    .line 3
    iget-object v1, p1, Ll/aiv$a;->b:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendActivityGiftTrace;

    .line 10
    .line 11
    new-instance v1, Ll/oqj;

    .line 12
    .line 13
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendActivityGiftTrace;->userId:Ljava/lang/String;

    .line 14
    .line 15
    const/4 v3, 0x0

    .line 16
    invoke-direct {v1, v3, v2}, Ll/oqj;-><init>(ILjava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, v1}, Ll/ahu;->Q2(Ll/hk2;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    check-cast v1, Landroid/util/Pair;

    .line 24
    .line 25
    sget-object v2, Ll/htd0;->c:Ll/htd0;

    .line 26
    .line 27
    invoke-static {v2}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    check-cast v2, Ll/hiv;

    .line 32
    .line 33
    iget-object v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendActivityGiftTrace;->giftId:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {v2, v3}, Ll/hiv;->m(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 36
    .line 37
    .line 38
    move-result-object v5

    .line 39
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendActivityGiftTrace;->traceActivityName:Ljava/lang/String;

    .line 40
    .line 41
    iget-object v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendActivityGiftTrace;->traceModule:Ljava/lang/String;

    .line 42
    .line 43
    invoke-static {v2, v3}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->getH5TraceServerData(Ljava/lang/String;Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;

    .line 44
    .line 45
    .line 46
    move-result-object v13

    .line 47
    iget-object v4, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendActivityGiftTrace;->giftId:Ljava/lang/String;

    .line 48
    .line 49
    new-instance v6, Ll/xku;

    .line 50
    .line 51
    invoke-direct {v6, p0, p1, v5, v0}, Ll/xku;-><init>(Ll/alu;Ll/aiv$a;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Lcom/p1/mobile/putong/live/base/data/BLiveSendActivityGiftTrace;)V

    .line 52
    .line 53
    .line 54
    new-instance v7, Ll/yku;

    .line 55
    .line 56
    invoke-direct {v7, p1}, Ll/yku;-><init>(Ll/aiv$a;)V

    .line 57
    .line 58
    .line 59
    new-instance v8, Ll/zku;

    .line 60
    .line 61
    invoke-direct {v8, p1}, Ll/zku;-><init>(Ll/aiv$a;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveSendActivityGiftTrace;->getRealGiftCount()I

    .line 65
    .line 66
    .line 67
    move-result v10

    .line 68
    if-eqz v1, :cond_1

    .line 69
    .line 70
    iget-object p1, v1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 71
    .line 72
    check-cast p1, Ljava/lang/String;

    .line 73
    .line 74
    if-nez p1, :cond_0

    .line 75
    .line 76
    goto :goto_1

    .line 77
    :cond_0
    :goto_0
    move-object v11, p1

    .line 78
    goto :goto_2

    .line 79
    :cond_1
    :goto_1
    const-string p1, "live"

    .line 80
    .line 81
    goto :goto_0

    .line 82
    :goto_2
    if-eqz v1, :cond_2

    .line 83
    .line 84
    iget-object p1, v1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 85
    .line 86
    check-cast p1, Ll/cqj;

    .line 87
    .line 88
    :goto_3
    move-object v12, p1

    .line 89
    goto :goto_4

    .line 90
    :cond_2
    const/4 p1, 0x0

    .line 91
    goto :goto_3

    .line 92
    :goto_4
    const/4 v9, 0x0

    .line 93
    invoke-static/range {v4 .. v13}, Ll/uoe0;->d(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ll/y20;Ll/y20;Ll/y20;ZILjava/lang/String;Ll/cqj;Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;)Ll/uoe0;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendActivityGiftTrace;->showSendGiftFirstConfirmDialogFlag:Ljava/lang/String;

    .line 98
    .line 99
    invoke-virtual {p1, v1}, Ll/uoe0;->p(Ljava/lang/String;)Ll/uoe0;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    iget-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendActivityGiftTrace;->showSendGiftConfirmDialogFlag:Z

    .line 104
    .line 105
    invoke-virtual {p1, v1}, Ll/uoe0;->o(Z)Ll/uoe0;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendActivityGiftTrace;->traceModule:Ljava/lang/String;

    .line 110
    .line 111
    invoke-virtual {p1, v1}, Ll/uoe0;->u(Ljava/lang/String;)Ll/uoe0;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendActivityGiftTrace;->traceActivityName:Ljava/lang/String;

    .line 116
    .line 117
    invoke-virtual {p1, v1}, Ll/uoe0;->t(Ljava/lang/String;)Ll/uoe0;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    const-string v1, "videoChat"

    .line 122
    .line 123
    iput-object v1, p1, Ll/uoe0;->B:Ljava/lang/String;

    .line 124
    .line 125
    const-string v1, "js"

    .line 126
    .line 127
    iput-object v1, p1, Ll/uoe0;->A:Ljava/lang/String;

    .line 128
    .line 129
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendActivityGiftTrace;->fromTag:Ljava/lang/String;

    .line 130
    .line 131
    iput-object v1, p1, Ll/uoe0;->N:Ljava/lang/String;

    .line 132
    .line 133
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendActivityGiftTrace;->userId:Ljava/lang/String;

    .line 134
    .line 135
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 136
    .line 137
    .line 138
    move-result v1

    .line 139
    if-nez v1, :cond_3

    .line 140
    .line 141
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendActivityGiftTrace;->userId:Ljava/lang/String;

    .line 142
    .line 143
    iput-object v0, p1, Ll/uoe0;->o:Ljava/lang/String;

    .line 144
    .line 145
    goto :goto_5

    .line 146
    :cond_3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendActivityGiftTrace;->toUserId:Ljava/lang/String;

    .line 147
    .line 148
    iput-object v0, p1, Ll/uoe0;->o:Ljava/lang/String;

    .line 149
    .line 150
    :goto_5
    invoke-virtual {p0}, Ll/ahu;->K2()Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;

    .line 151
    .line 152
    .line 153
    move-result-object p0

    .line 154
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;->SendGiftEventGroup:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$g;

    .line 155
    .line 156
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$g;->a()Ll/v3f$d;

    .line 157
    .line 158
    .line 159
    move-result-object p0

    .line 160
    new-instance v0, Ll/hne0$a;

    .line 161
    .line 162
    invoke-direct {v0}, Ll/hne0$a;-><init>()V

    .line 163
    .line 164
    .line 165
    invoke-virtual {v0, p1}, Ll/hne0$a;->y(Ll/uoe0;)Ll/hne0;

    .line 166
    .line 167
    .line 168
    move-result-object p1

    .line 169
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 170
    .line 171
    .line 172
    return-void

    .line 173
    :catch_0
    move-exception v0

    .line 174
    move-object p0, v0

    .line 175
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 176
    .line 177
    .line 178
    return-void
.end method

.method public final Z2(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Ll/aiv$a;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Lcom/p1/mobile/putong/live/base/data/BLiveSendActivityGiftTrace;)V
    .locals 0

    .line 1
    invoke-virtual {p2, p1}, Ll/aiv$a;->a(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p4}, Lcom/p1/mobile/putong/live/base/data/BLiveSendActivityGiftTrace;->getRealGiftCount()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Ll/xnu;->o()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const-string p2, ""

    .line 17
    .line 18
    invoke-static {p3, p2, p1, p0}, Ll/qzj;->s(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ljava/lang/String;ILjava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final a3()V
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$d;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ahu;->K2()Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$d;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$d;->a()Ll/v3f$c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Ll/v3f$c;->p()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Ll/ahu;->act()Lcom/p1/mobile/android/app/Act;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    const/4 v0, 0x0

    .line 25
    const/4 v1, 0x0

    .line 26
    invoke-static {p0, v0, v1}, Lcom/p1/mobile/putong/live/external/internal/vchat/a;->o(Lcom/p1/mobile/android/app/Act;ZLl/x20;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method
