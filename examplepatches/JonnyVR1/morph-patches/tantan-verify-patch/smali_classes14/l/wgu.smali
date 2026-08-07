.class public Ll/wgu;
.super Ll/ahu;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ahu<",
        "Ll/wgu;",
        ">;",
        "Ll/iam<",
        "Ll/wgu;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/knu;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ahu;-><init>(Ll/knu;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic R2(Ll/wgu;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/wgu;->V2(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic S2(Ll/wgu;Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$MultiDevice;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wgu;->X2(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$MultiDevice;)V

    return-void
.end method

.method private V2(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {p1}, Ll/yuk0;->b(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->liveId:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v1}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->roomId:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {p1, v0, v1}, Ll/xnu;->d0(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    :cond_0
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-virtual {p1}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-static {p1}, Ll/yuk0;->g(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)Z

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    if-eqz p1, :cond_1

    .line 55
    .line 56
    invoke-virtual {p0}, Ll/wgu;->W2()V

    .line 57
    .line 58
    .line 59
    :cond_1
    return-void
.end method


# virtual methods
.method public T()V
    .locals 4

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    sget-object v1, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatAct;->i:Ljava/lang/String;

    .line 9
    .line 10
    sget-object v2, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->VIDEO_CHAT:Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 11
    .line 12
    new-instance v3, Ll/wgu$a;

    .line 13
    .line 14
    invoke-direct {v3, p0}, Ll/wgu$a;-><init>(Ll/wgu;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v1, v2, v3}, Ll/pb1;->f(Ljava/lang/String;Lcom/p1/mobile/putong/util/audio/AudioBusinessType;Ll/ga1;)V

    .line 18
    .line 19
    .line 20
    sget-object v0, Ll/iit;->Companion:Ll/iit$a;

    .line 21
    .line 22
    invoke-virtual {v0}, Ll/iit$a;->R()I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    invoke-virtual {p0}, Ll/ahu;->act()Lcom/p1/mobile/android/app/Act;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    const/4 v2, 0x0

    .line 31
    new-array v3, v2, [Ljava/lang/Object;

    .line 32
    .line 33
    invoke-static {v0, v1, v3}, Ll/wgt;->p(ILcom/p1/mobile/android/app/Act;[Ljava/lang/Object;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-static {}, Ll/dhw;->c()Ll/t9t;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {v0}, Ll/xnu;->z()Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {p0, v0, v2}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    new-instance v1, Ll/ugu;

    .line 61
    .line 62
    invoke-direct {v1, p0}, Ll/ugu;-><init>(Ll/wgu;)V

    .line 63
    .line 64
    .line 65
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    iget-object v0, v0, Ll/xnu;->c:Ll/ecl0;

    .line 77
    .line 78
    invoke-virtual {v0}, Ll/ecl0;->l()Ll/aj1;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    iget-object v0, v0, Ll/aj1;->V1:Lrx/subjects/b;

    .line 83
    .line 84
    invoke-virtual {p0, v0, v2}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    new-instance v1, Ll/vgu;

    .line 89
    .line 90
    invoke-direct {v1, p0}, Ll/vgu;-><init>(Ll/wgu;)V

    .line 91
    .line 92
    .line 93
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 98
    .line 99
    .line 100
    return-void
.end method

.method public T2(Ll/wgu;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final U2()V
    .locals 2

    .line 1
    const-string v0, "videoChat"

    .line 2
    .line 3
    const-string v1, "audience handleMultiDeviceLogin"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    sget-object v1, Ll/yuk0;->j:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ll/xnu;->S(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const-string v0, "stopped"

    .line 22
    .line 23
    const-string v1, "\u5df2\u5728\u5176\u5b83\u8bbe\u5907\u767b\u5f55"

    .line 24
    .line 25
    invoke-virtual {p0, v0, v1}, Ll/xnu;->i0(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final W2()V
    .locals 7

    .line 1
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-boolean v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->called:Z

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/ahu;->act()Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0}, Ll/ahu;->act()Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    invoke-virtual {v3}, Ll/xnu;->p()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 31
    .line 32
    .line 33
    move-result-object v4

    .line 34
    invoke-virtual {v4}, Ll/xnu;->o()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v4

    .line 38
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 39
    .line 40
    .line 41
    move-result-object v5

    .line 42
    invoke-virtual {v5}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 43
    .line 44
    .line 45
    move-result-object v5

    .line 46
    iget-object v5, v5, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->endTipMessage:Ljava/lang/String;

    .line 47
    .line 48
    const-string v6, ""

    .line 49
    .line 50
    invoke-static {v2, v3, v4, v5, v6}, Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;->i2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-virtual {v0, v2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 55
    .line 56
    .line 57
    const/4 v0, 0x0

    .line 58
    invoke-virtual {p0, v0}, Ll/ahu;->L2(Z)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0}, Ll/ahu;->act()Lcom/p1/mobile/android/app/Act;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    sget v3, Ll/q7c0;->d:I

    .line 66
    .line 67
    invoke-virtual {v2, v3, v0}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    iget-boolean v0, v0, Ll/xnu;->e:Z

    .line 75
    .line 76
    if-eqz v0, :cond_0

    .line 77
    .line 78
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/live/external/internal/vchat/a;->p(Ll/ahu;Z)V

    .line 79
    .line 80
    .line 81
    :cond_0
    return-void

    .line 82
    :cond_1
    invoke-virtual {p0, v1}, Ll/ahu;->L2(Z)V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public final synthetic X2(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$MultiDevice;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/wgu;->U2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/wgu;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/wgu;->T2(Ll/wgu;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public n()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/l6t;->n()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    sget-object v0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatAct;->i:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Ll/pb1;->a(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
