.class public Ll/wt10;
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


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic J3(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkInviteNotify;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkInviteNotify;->getMultiPkInviteId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 p1, 0x1

    .line 6
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->w3(Ljava/lang/String;Z)Lrx/c;

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic K3(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkInviteNotify;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkInviteNotify;->getMultiPkInviteId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->w3(Ljava/lang/String;Z)Lrx/c;

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic L3(Ll/wt10;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkInviteNotify;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wt10;->M3(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkInviteNotify;)V

    return-void
.end method


# virtual methods
.method public final M3(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkInviteNotify;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkInviteNotify;->getFromUser()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkPlayer;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkPlayer;->getUserId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 10
    .line 11
    invoke-virtual {v1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    new-instance v0, Ll/th0$a;

    .line 23
    .line 24
    iget-object p0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    invoke-direct {v0, p0}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 27
    .line 28
    .line 29
    new-instance p0, Ljava/lang/StringBuilder;

    .line 30
    .line 31
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkInviteNotify;->getFromUser()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkPlayer;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkPlayer;->getUserName()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    const-string v1, "\u9080\u8bf7\u4f60\u518d\u6765\u4e00\u5c40"

    .line 46
    .line 47
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {v0, p0}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    const-string v0, "\u63a5\u53d7"

    .line 59
    .line 60
    invoke-virtual {p0, v0}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    new-instance v0, Ll/ut10;

    .line 65
    .line 66
    invoke-direct {v0, p1}, Ll/ut10;-><init>(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkInviteNotify;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0, v0}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    sget v0, Ll/n9c0;->d:I

    .line 74
    .line 75
    invoke-virtual {p0, v0}, Ll/th0$a;->p(I)Ll/th0$a;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    const-string v0, "\u62d2\u7edd"

    .line 80
    .line 81
    invoke-virtual {p0, v0}, Ll/th0$a;->f(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    const/4 v0, 0x0

    .line 86
    invoke-virtual {p0, v0}, Ll/th0$a;->h(Z)Ll/th0$a;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    new-instance v0, Ll/vt10;

    .line 91
    .line 92
    invoke-direct {v0, p1}, Ll/vt10;-><init>(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkInviteNotify;)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {p0, v0}, Ll/th0$a;->c(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 104
    .line 105
    .line 106
    return-void
.end method

.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->MultiPkEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$MultiPkEventGroup;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$MultiPkEventGroup;->multiPkOnRestartRequest()Ll/v3f$d;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lrx/c;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/tt10;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/tt10;-><init>(Ll/wt10;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    return-void
.end method
