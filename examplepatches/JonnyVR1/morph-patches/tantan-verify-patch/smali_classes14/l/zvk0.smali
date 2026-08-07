.class public Ll/zvk0;
.super Ll/ahu;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ahu<",
        "Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatPreviewView;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/knu;Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatPreviewView;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ahu;-><init>(Ll/knu;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic R2(Ll/zvk0;Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zvk0;->V2(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;)V

    return-void
.end method

.method public static synthetic S2(Ll/zvk0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zvk0;->W2(Ljava/lang/Throwable;)V

    return-void
.end method


# virtual methods
.method public T()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/ahu;->M2()Ll/knu;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Ll/knu;->e:Ll/xnu;

    .line 9
    .line 10
    iget-boolean v0, v0, Ll/xnu;->n:Z

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Ll/xnu;->B()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0}, Ll/xnu;->B()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;->status:Ljava/lang/String;

    .line 33
    .line 34
    const-string v1, "stopped"

    .line 35
    .line 36
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-nez v0, :cond_0

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 44
    .line 45
    check-cast v0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatPreviewView;

    .line 46
    .line 47
    const/4 v1, 0x1

    .line 48
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatPreviewView;->p0(Z)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {v0}, Ll/xnu;->u()Ll/gcl0;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {v0}, Ll/gcl0;->a()Ll/tzl;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {p0}, Ll/ahu;->act()Lcom/p1/mobile/android/app/Act;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    const/4 v2, 0x0

    .line 68
    invoke-interface {v0, v1, v2}, Ll/tzl;->F0(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {v0}, Ll/xnu;->u()Ll/gcl0;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-virtual {v0}, Ll/gcl0;->e()Ll/e0m;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    if-eqz v0, :cond_1

    .line 84
    .line 85
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 86
    .line 87
    check-cast p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatPreviewView;

    .line 88
    .line 89
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatPreviewView;->d:Lv/VFrame;

    .line 90
    .line 91
    invoke-interface {v0, p0}, Ll/e0m;->b(Landroid/widget/FrameLayout;)V

    .line 92
    .line 93
    .line 94
    invoke-interface {v0}, Ll/e0m;->a()V

    .line 95
    .line 96
    .line 97
    :cond_1
    :goto_0
    return-void
.end method

.method public T2()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Ll/ahu;->L2(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public U2()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ahu;->K2()Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;->LiveVideoChatEvent:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$e;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$e;->f()Ll/v3f$c;

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

.method public final V2(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/xnu;->u()Ll/gcl0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ll/gcl0;->a()Ll/tzl;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-interface {v0}, Ll/tzl;->a()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Ll/xnu;->u()Ll/gcl0;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Ll/gcl0;->e()Ll/e0m;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-interface {v0}, Ll/e0m;->c()V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 32
    .line 33
    check-cast v0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatPreviewView;

    .line 34
    .line 35
    const/4 v1, 0x0

    .line 36
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatPreviewView;->p0(Z)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Ll/ahu;->K2()Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;->LiveVideoChatEvent:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$e;

    .line 44
    .line 45
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$e;->j()Ll/v3f$d;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public final synthetic W2(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, ""

    .line 6
    .line 7
    invoke-virtual {v0, p0, p1, v1}, Ll/xnu;->b0(Ll/ahu;Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public X2()V
    .locals 3

    .line 1
    invoke-static {}, Ll/jwu;->W()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {p0, v0, v1}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    new-instance v1, Ll/xvk0;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Ll/xvk0;-><init>(Ll/zvk0;)V

    .line 13
    .line 14
    .line 15
    new-instance v2, Ll/yvk0;

    .line 16
    .line 17
    invoke-direct {v2, p0}, Ll/yvk0;-><init>(Ll/zvk0;)V

    .line 18
    .line 19
    .line 20
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 25
    .line 26
    .line 27
    return-void
.end method
