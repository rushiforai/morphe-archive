.class public Ll/wou;
.super Ll/ahu;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ahu<",
        "Ll/nou;",
        ">;"
    }
.end annotation


# instance fields
.field public f:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/knu;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ahu;-><init>(Ll/knu;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/nou;

    .line 5
    .line 6
    invoke-direct {p1}, Ll/nou;-><init>()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/l6t;->C(Ll/iam;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic R2(Ll/wou;Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAnchorCall;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wou;->X2(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAnchorCall;)V

    return-void
.end method

.method public static synthetic S2(Ll/wou;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/wou;->V2(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic T2(Ll/wou;Lcom/p1/mobile/putong/live/external/internal/vchat/b$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wou;->W2(Lcom/p1/mobile/putong/live/external/internal/vchat/b$a;)V

    return-void
.end method

.method public static synthetic U2(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/yvr;->a(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private V2(Ljava/lang/String;)V
    .locals 0

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
    invoke-static {p1}, Ll/yuk0;->f(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 16
    .line 17
    check-cast p0, Ll/nou;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/nou;->d()V

    .line 20
    .line 21
    .line 22
    :cond_0
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
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ll/xnu;->z()Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-virtual {p0, v0, v1}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Ll/sou;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Ll/sou;-><init>(Ll/wou;)V

    .line 24
    .line 25
    .line 26
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Ll/ahu;->K2()Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;->LiveVideoChatEvent:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$e;

    .line 38
    .line 39
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$e;->g()Ll/v3f$d;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    new-instance v1, Ll/tou;

    .line 44
    .line 45
    invoke-direct {v1, p0}, Ll/tou;-><init>(Ll/wou;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0, v0, v1}, Ll/ahu;->I2(Ll/v3f$b;Ll/y20;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public final synthetic W2(Lcom/p1/mobile/putong/live/external/internal/vchat/b$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wou;->Z2(Lcom/p1/mobile/putong/live/external/internal/vchat/b$a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic X2(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAnchorCall;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ahu;->K2()Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;->LiveVideoChatEvent:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$e;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$e;->e()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 15
    .line 16
    check-cast p0, Ll/nou;

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/nou;->d()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public Y2(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatMissedCall;)V
    .locals 4

    .line 1
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatMissedCall;->canCallUser:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Ll/btu;->e:Ljava/lang/String;

    .line 6
    .line 7
    new-instance v1, Ll/pf60;

    .line 8
    .line 9
    const-string v2, "receiver_id"

    .line 10
    .line 11
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatMissedCall;->userId:Ljava/lang/String;

    .line 12
    .line 13
    invoke-direct {v1, v2, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    filled-new-array {v1}, [Ll/pf60;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    const-string v2, "p_live_anchor_video_quickchat_calling"

    .line 21
    .line 22
    invoke-static {v0, v2, v1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 23
    .line 24
    .line 25
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatMissedCall;->userId:Ljava/lang/String;

    .line 26
    .line 27
    iget-object v0, p0, Ll/wou;->f:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {p1, v0}, Ll/jwu;->S(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    new-instance v0, Ll/uou;

    .line 38
    .line 39
    invoke-direct {v0, p0}, Ll/uou;-><init>(Ll/wou;)V

    .line 40
    .line 41
    .line 42
    new-instance p0, Ll/vou;

    .line 43
    .line 44
    invoke-direct {p0}, Ll/vou;-><init>()V

    .line 45
    .line 46
    .line 47
    invoke-static {v0, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_0
    const-string p0, "\u65e0\u6cd5\u547c\u53eb\uff0c\u8bf7\u9009\u62e9\u5176\u5b83\u7528\u6237"

    .line 56
    .line 57
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public final Z2(Lcom/p1/mobile/putong/live/external/internal/vchat/b$a;)V
    .locals 1

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/external/internal/vchat/b$a;->b:Ljava/lang/String;

    .line 2
    .line 3
    iput-object v0, p0, Ll/wou;->f:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 6
    .line 7
    check-cast v0, Ll/nou;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/ahu;->act()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/live/external/internal/vchat/b$a;->a:Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-virtual {v0, p0, p1}, Ll/nou;->k(Lcom/p1/mobile/android/app/Act;Ljava/util/List;)V

    .line 16
    .line 17
    .line 18
    sget-object p0, Ll/btu;->c:Ljava/lang/String;

    .line 19
    .line 20
    const-string p1, "p_live_anchor_video_quickchat_calling"

    .line 21
    .line 22
    invoke-static {p0, p1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method
