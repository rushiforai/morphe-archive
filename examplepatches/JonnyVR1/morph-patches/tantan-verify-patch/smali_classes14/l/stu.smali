.class public Ll/stu;
.super Ll/ahu;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ahu<",
        "Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatWaitingOrderView;",
        ">;"
    }
.end annotation


# instance fields
.field public f:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;

.field public g:Ll/kcg0;

.field public h:Ll/l4g0;

.field public i:Ll/kcg0;


# direct methods
.method public constructor <init>(Ll/knu;Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatWaitingOrderView;)V
    .locals 3

    .line 1
    invoke-direct {p0, p1}, Ll/ahu;-><init>(Ll/knu;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/l4g0;

    .line 5
    .line 6
    const-string v1, "p_live_anchor_video_quickchat_calling"

    .line 7
    .line 8
    const-string v2, "LiveVChatWaitingOrderModule"

    .line 9
    .line 10
    invoke-direct {v0, v1, v2}, Ll/l4g0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Ll/stu;->h:Ll/l4g0;

    .line 14
    .line 15
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 16
    .line 17
    .line 18
    new-instance p2, Ll/sl0;

    .line 19
    .line 20
    invoke-direct {p2, p1}, Ll/sl0;-><init>(Ll/knu;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, p2}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 24
    .line 25
    .line 26
    new-instance p2, Ll/wou;

    .line 27
    .line 28
    invoke-direct {p2, p1}, Ll/wou;-><init>(Ll/knu;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, p2}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public static synthetic R2(Ll/stu;Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/stu;->o3(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic S2(Ll/stu;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/stu;->q3(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method

.method public static synthetic T2(Ll/stu;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/stu;->n3()V

    return-void
.end method

.method public static synthetic U2(Ll/stu;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/stu;->i3(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic V2(Ljava/lang/Throwable;)V
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

.method public static synthetic W2(Ll/stu;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/stu;->r3(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic X2(Ll/stu;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/stu;->m3()V

    return-void
.end method

.method public static synthetic Y2(Ll/stu;Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/stu;->C3(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;)V

    return-void
.end method

.method public static synthetic Z2(Ll/stu;Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/stu;->f3(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;)V

    return-void
.end method

.method public static synthetic a3(Ll/stu;Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/stu;->s3(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic b3(Ll/stu;Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatLiveChange;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/stu;->j3(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatLiveChange;)V

    return-void
.end method

.method public static synthetic c3(Ll/stu;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/stu;->t3(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic d3(Ll/stu;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/stu;->p3(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method

.method public static synthetic e3(Ll/stu;Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$MultiDevice;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/stu;->k3(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$MultiDevice;)V

    return-void
.end method

.method private i3(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatWaitingOrderView;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Ll/yuk0;->e(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatWaitingOrderView;->n(Z)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p1}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-static {p1}, Ll/yuk0;->e(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    if-eqz p1, :cond_0

    .line 33
    .line 34
    const p1, 0xf4240

    .line 35
    .line 36
    .line 37
    invoke-static {p1}, Ll/toh0;->g(I)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Ll/stu;->x3()V

    .line 41
    .line 42
    .line 43
    :cond_0
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-virtual {p1}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-static {p1}, Ll/yuk0;->f(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)Z

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    if-eqz p1, :cond_1

    .line 56
    .line 57
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->isAppVisible()Z

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    if-nez p1, :cond_1

    .line 62
    .line 63
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {p0}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->getAttendee()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatUser;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatUser;->userName:Ljava/lang/String;

    .line 76
    .line 77
    invoke-static {p0}, Ll/awk0;->a(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    :cond_1
    return-void
.end method

.method private w3()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/stu;->f:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-static {v0}, Ll/yuk0;->e(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    iget-object v0, p0, Ll/stu;->f:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;

    .line 30
    .line 31
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;->id:Ljava/lang/String;

    .line 32
    .line 33
    invoke-static {v0}, Ll/jwu;->E(Ljava/lang/String;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    new-instance v1, Ll/ftu;

    .line 38
    .line 39
    invoke-direct {v1, p0}, Ll/ftu;-><init>(Ll/stu;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    new-instance v1, Ll/ptu;

    .line 47
    .line 48
    invoke-direct {v1, p0}, Ll/ptu;-><init>(Ll/stu;)V

    .line 49
    .line 50
    .line 51
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 56
    .line 57
    .line 58
    new-instance v0, Ljava/lang/StringBuilder;

    .line 59
    .line 60
    const-string v1, "refresh live:"

    .line 61
    .line 62
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    iget-object v1, p0, Ll/stu;->f:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;

    .line 66
    .line 67
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;->id:Ljava/lang/String;

    .line 68
    .line 69
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    iget-object v1, p0, Ll/stu;->f:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;

    .line 73
    .line 74
    invoke-virtual {p0, v1}, Ll/stu;->u3(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    const-string v0, "videoChat"

    .line 86
    .line 87
    invoke-static {v0, p0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    :cond_2
    :goto_0
    return-void
.end method


# virtual methods
.method public final B3(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/stu;->g:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    const-wide/16 v0, 0x1

    .line 7
    .line 8
    sget-object v2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 9
    .line 10
    invoke-static {v0, v1, v2}, Lrx/c;->interval(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Ll/gtu;

    .line 27
    .line 28
    invoke-direct {v1, p0, p1}, Ll/gtu;-><init>(Ll/stu;Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;)V

    .line 29
    .line 30
    .line 31
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {v0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    iput-object p1, p0, Ll/stu;->g:Ll/kcg0;

    .line 40
    .line 41
    return-void
.end method

.method public final C3(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;)V
    .locals 2

    .line 1
    iput-object p1, p0, Ll/stu;->f:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;->autoAnswerConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ll/xnu;->W(Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;->roomId:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ll/xnu;->X(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget-boolean v0, v0, Ll/xnu;->n:Z

    .line 26
    .line 27
    if-nez v0, :cond_0

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;->id:Ljava/lang/String;

    .line 34
    .line 35
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;->roomId:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {v0, v1, p1}, Ll/xnu;->d0(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    :cond_0
    invoke-virtual {p0}, Ll/stu;->z3()V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0}, Ll/stu;->x3()V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public D3()V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "stopWaitingOrder"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Ll/stu;->f:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;

    .line 9
    .line 10
    invoke-virtual {p0, v1}, Ll/stu;->u3(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "videoChat"

    .line 22
    .line 23
    invoke-static {v1, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-static {}, Ll/btu;->j()V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/stu;->f:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;

    .line 30
    .line 31
    if-nez v0, :cond_0

    .line 32
    .line 33
    const/4 v0, 0x1

    .line 34
    invoke-virtual {p0, v0}, Ll/stu;->g3(Z)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_0
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;->id:Ljava/lang/String;

    .line 39
    .line 40
    invoke-static {v0}, Ll/jwu;->Y(Ljava/lang/String;)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    const/4 v1, 0x0

    .line 45
    invoke-virtual {p0, v0, v1}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    new-instance v1, Ll/ptu;

    .line 50
    .line 51
    invoke-direct {v1, p0}, Ll/ptu;-><init>(Ll/stu;)V

    .line 52
    .line 53
    .line 54
    new-instance v2, Ll/qtu;

    .line 55
    .line 56
    invoke-direct {v2, p0}, Ll/qtu;-><init>(Ll/stu;)V

    .line 57
    .line 58
    .line 59
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 64
    .line 65
    .line 66
    return-void
.end method

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
    new-instance v3, Ll/stu$a;

    .line 13
    .line 14
    invoke-direct {v3, p0}, Ll/stu$a;-><init>(Ll/stu;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v1, v2, v3}, Ll/pb1;->f(Ljava/lang/String;Lcom/p1/mobile/putong/util/audio/AudioBusinessType;Ll/ga1;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Ll/ahu;->K2()Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;->LiveVideoChatEvent:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$e;

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$e;->j()Ll/v3f$d;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    new-instance v1, Ll/etu;

    .line 31
    .line 32
    invoke-direct {v1, p0}, Ll/etu;-><init>(Ll/stu;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0, v0, v1}, Ll/ahu;->I2(Ll/v3f$b;Ll/y20;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0}, Ll/xnu;->z()Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    const/4 v1, 0x0

    .line 47
    invoke-virtual {p0, v0, v1}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    new-instance v2, Ll/jtu;

    .line 56
    .line 57
    invoke-direct {v2, p0}, Ll/jtu;-><init>(Ll/stu;)V

    .line 58
    .line 59
    .line 60
    invoke-static {v2}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    iget-object v0, v0, Ll/xnu;->c:Ll/ecl0;

    .line 72
    .line 73
    invoke-virtual {v0}, Ll/ecl0;->l()Ll/aj1;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-virtual {v0}, Ll/aj1;->r0()Lrx/c;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-virtual {p0, v0, v1}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    new-instance v2, Ll/ktu;

    .line 86
    .line 87
    invoke-direct {v2, p0}, Ll/ktu;-><init>(Ll/stu;)V

    .line 88
    .line 89
    .line 90
    invoke-static {v2}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 91
    .line 92
    .line 93
    move-result-object v2

    .line 94
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 95
    .line 96
    .line 97
    iget-object v0, p0, Ll/stu;->h:Ll/l4g0;

    .line 98
    .line 99
    invoke-virtual {v0}, Ll/l4g0;->i()V

    .line 100
    .line 101
    .line 102
    iget-object v0, p0, Ll/stu;->h:Ll/l4g0;

    .line 103
    .line 104
    invoke-virtual {v0}, Ll/l4g0;->l()V

    .line 105
    .line 106
    .line 107
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    iget-object v0, v0, Ll/xnu;->c:Ll/ecl0;

    .line 112
    .line 113
    invoke-virtual {v0}, Ll/ecl0;->l()Ll/aj1;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    iget-object v0, v0, Ll/aj1;->V1:Lrx/subjects/b;

    .line 118
    .line 119
    invoke-virtual {p0, v0, v1}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    new-instance v1, Ll/ltu;

    .line 124
    .line 125
    invoke-direct {v1, p0}, Ll/ltu;-><init>(Ll/stu;)V

    .line 126
    .line 127
    .line 128
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 133
    .line 134
    .line 135
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    iget-boolean v0, v0, Ll/xnu;->n:Z

    .line 140
    .line 141
    if-eqz v0, :cond_0

    .line 142
    .line 143
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    invoke-virtual {v0}, Ll/xnu;->B()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    if-eqz v0, :cond_0

    .line 152
    .line 153
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    invoke-virtual {v0}, Ll/xnu;->B()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    invoke-virtual {p0, v0}, Ll/stu;->C3(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;)V

    .line 162
    .line 163
    .line 164
    :cond_0
    return-void
.end method

.method public final f3(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;)V
    .locals 4

    .line 1
    invoke-virtual {p0, p1}, Ll/stu;->u3(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/stu;->f:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;

    .line 6
    .line 7
    invoke-virtual {p0, v1}, Ll/stu;->u3(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    new-instance v2, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    const-string v3, "checkEndWaitingOrder old"

    .line 14
    .line 15
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v1, ",new"

    .line 22
    .line 23
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const-string v1, "videoChat"

    .line 34
    .line 35
    invoke-static {v1, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    const/4 v0, 0x1

    .line 39
    if-eqz p1, :cond_3

    .line 40
    .line 41
    iget-object v1, p0, Ll/stu;->f:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;

    .line 42
    .line 43
    if-nez v1, :cond_0

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    const-string v1, "stopped"

    .line 47
    .line 48
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;->status:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    if-eqz v1, :cond_2

    .line 55
    .line 56
    iget-object v1, p0, Ll/stu;->f:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;

    .line 57
    .line 58
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;->status:Ljava/lang/String;

    .line 59
    .line 60
    iput-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;->status:Ljava/lang/String;

    .line 61
    .line 62
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;->punishMessage:Ljava/lang/String;

    .line 63
    .line 64
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    if-eqz v1, :cond_1

    .line 69
    .line 70
    invoke-virtual {p0, v0}, Ll/stu;->g3(Z)V

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :cond_1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;->punishMessage:Ljava/lang/String;

    .line 75
    .line 76
    const/4 v0, 0x0

    .line 77
    invoke-virtual {p0, p1, v0}, Ll/stu;->h3(Ljava/lang/String;Z)V

    .line 78
    .line 79
    .line 80
    :cond_2
    return-void

    .line 81
    :cond_3
    :goto_0
    invoke-virtual {p0, v0}, Ll/stu;->g3(Z)V

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method public g3(Z)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    iput-boolean v1, v0, Ll/xnu;->m:Z

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/ahu;->L2(Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public h3(Ljava/lang/String;Z)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "handleLiveStop:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, ",isMultiDevice:"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    iget-object v1, p0, Ll/stu;->f:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;

    .line 20
    .line 21
    invoke-virtual {p0, v1}, Ll/stu;->u3(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const-string v1, "videoChat"

    .line 33
    .line 34
    invoke-static {v1, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Ll/stu;->i:Ll/kcg0;

    .line 38
    .line 39
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Ll/stu;->f:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;

    .line 43
    .line 44
    const-string v1, "stopped"

    .line 45
    .line 46
    if-eqz v0, :cond_0

    .line 47
    .line 48
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;->status:Ljava/lang/String;

    .line 49
    .line 50
    :cond_0
    if-eqz p2, :cond_2

    .line 51
    .line 52
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-virtual {p1}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-static {p1}, Ll/yuk0;->e(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)Z

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    const-string p2, "\u5df2\u5728\u5176\u4ed6\u8bbe\u5907\u767b\u5f55"

    .line 65
    .line 66
    if-nez p1, :cond_1

    .line 67
    .line 68
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    sget-object v0, Ll/yuk0;->j:Ljava/lang/String;

    .line 73
    .line 74
    invoke-virtual {p1, v0}, Ll/xnu;->S(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    invoke-virtual {p1}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    sget-object v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$EndType;->banAnchor:Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$EndType;

    .line 86
    .line 87
    invoke-virtual {v0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    iput-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->endType:Ljava/lang/String;

    .line 92
    .line 93
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    invoke-virtual {p0, v1, p2}, Ll/xnu;->i0(Ljava/lang/String;Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    return-void

    .line 101
    :cond_1
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    invoke-virtual {p0}, Ll/ahu;->act()Lcom/p1/mobile/android/app/Act;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    new-instance v1, Ll/ntu;

    .line 110
    .line 111
    invoke-direct {v1, p0}, Ll/ntu;-><init>(Ll/stu;)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {p1, v0, p2, v1}, Ll/xnu;->a0(Landroid/app/Activity;Ljava/lang/String;Ll/x20;)V

    .line 115
    .line 116
    .line 117
    return-void

    .line 118
    :cond_2
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 119
    .line 120
    .line 121
    move-result-object p2

    .line 122
    invoke-virtual {p0}, Ll/ahu;->act()Lcom/p1/mobile/android/app/Act;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    new-instance v1, Ll/otu;

    .line 127
    .line 128
    invoke-direct {v1, p0}, Ll/otu;-><init>(Ll/stu;)V

    .line 129
    .line 130
    .line 131
    invoke-virtual {p2, v0, p1, v1}, Ll/xnu;->a0(Landroid/app/Activity;Ljava/lang/String;Ll/x20;)V

    .line 132
    .line 133
    .line 134
    return-void
.end method

.method public final synthetic j3(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatLiveChange;)V
    .locals 2

    .line 1
    const-string v0, "stopped"

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatLiveChange;->getStatus()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatLiveChange;->getReason()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    const/4 v0, 0x0

    .line 18
    invoke-virtual {p0, p1, v0}, Ll/stu;->h3(Ljava/lang/String;Z)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public final synthetic k3(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$MultiDevice;)V
    .locals 1

    .line 1
    const-string p1, ""

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p0, p1, v0}, Ll/stu;->h3(Ljava/lang/String;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic m3()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Ll/stu;->g3(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public n()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->n()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/stu;->g:Ll/kcg0;

    .line 5
    .line 6
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-boolean v0, v0, Ll/xnu;->m:Z

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    sget-object v1, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatAct;->i:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ll/pb1;->a(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    iget-object v0, p0, Ll/stu;->h:Ll/l4g0;

    .line 27
    .line 28
    invoke-virtual {v0}, Ll/l4g0;->k()V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Ll/stu;->h:Ll/l4g0;

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/l4g0;->j()V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final synthetic n3()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Ll/stu;->g3(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic o3(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/stu;->f:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;->status:Ljava/lang/String;

    .line 4
    .line 5
    const-string p1, "stopped"

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    xor-int/lit8 p0, p0, 0x1

    .line 12
    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public final synthetic p3(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatWaitingOrderView;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 6
    .line 7
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->missedCallCount:I

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatWaitingOrderView;->m(I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic q3(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 3

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
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$e;->g()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Lcom/p1/mobile/putong/live/external/internal/vchat/b$a;

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 14
    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->missedCalls:Ljava/util/List;

    .line 16
    .line 17
    iget-object v2, p0, Ll/stu;->f:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;

    .line 18
    .line 19
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;->id:Ljava/lang/String;

    .line 20
    .line 21
    invoke-direct {v1, p1, v2}, Lcom/p1/mobile/putong/live/external/internal/vchat/b$a;-><init>(Ljava/util/List;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Ll/stu;->x3()V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final synthetic r3(Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/stu;->w3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic s3(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;Ljava/lang/Long;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatWaitingOrderView;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatWaitingOrderView;->k(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic t3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    invoke-virtual {p0, p1}, Ll/stu;->g3(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public u3(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;)Ljava/lang/String;
    .locals 1

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v0, " liveStatus:"

    .line 4
    .line 5
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    if-nez p1, :cond_0

    .line 9
    .line 10
    const-string p1, "null"

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;->status:Ljava/lang/String;

    .line 14
    .line 15
    :goto_0
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public v3()V
    .locals 4

    .line 1
    invoke-static {}, Ll/lwk0;->b()Ll/lwk0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Ll/lwk0;->e(Ll/xnu;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const/4 v1, 0x1

    .line 20
    iput-boolean v1, v0, Ll/xnu;->m:Z

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget-object v1, p0, Ll/stu;->f:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ll/xnu;->Z(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iget-boolean v0, v0, Ll/xnu;->p:Z

    .line 36
    .line 37
    const/4 v1, 0x0

    .line 38
    if-eqz v0, :cond_0

    .line 39
    .line 40
    invoke-virtual {p0}, Ll/ahu;->act()Lcom/p1/mobile/android/app/Act;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {p0}, Ll/ahu;->act()Lcom/p1/mobile/android/app/Act;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    const-string v3, "menu"

    .line 49
    .line 50
    invoke-static {v3}, Lcom/p1/mobile/putong/data/NavigationIntent;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/NavigationIntent;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    invoke-static {v2, v3}, Ll/mbs;->r(Landroid/content/Context;Lcom/p1/mobile/putong/data/NavigationIntent;)Landroid/content/Intent;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    invoke-virtual {v0, v2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    iput-boolean v1, v0, Ll/xnu;->p:Z

    .line 66
    .line 67
    :cond_0
    invoke-virtual {p0, v1}, Ll/ahu;->L2(Z)V

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :cond_1
    invoke-virtual {p0}, Ll/stu;->D3()V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public x3()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/stu;->f:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0}, Ll/jwu;->C(Ljava/lang/String;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ll/mtu;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Ll/mtu;-><init>(Ll/stu;)V

    .line 18
    .line 19
    .line 20
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public y3()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/stu;->f:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;->id:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {v0}, Ll/jwu;->D(Ljava/lang/String;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v1, Ll/htu;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Ll/htu;-><init>(Ll/stu;)V

    .line 19
    .line 20
    .line 21
    new-instance p0, Ll/itu;

    .line 22
    .line 23
    invoke-direct {p0}, Ll/itu;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 31
    .line 32
    .line 33
    sget-object p0, Ll/btu;->b:Ljava/lang/String;

    .line 34
    .line 35
    const-string v0, "p_live_anchor_video_quickchat_calling"

    .line 36
    .line 37
    invoke-static {p0, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final z3()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatWaitingOrderView;

    .line 4
    .line 5
    iget-object v1, p0, Ll/stu;->f:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatWaitingOrderView;->l(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/stu;->f:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Ll/stu;->B3(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;)V

    .line 13
    .line 14
    .line 15
    sget-object v0, Ll/tbs;->b:Ll/vwt;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/vwt;->P5()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    int-to-long v0, v0

    .line 22
    sget-object v2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 23
    .line 24
    invoke-static {v0, v1, v2}, Lrx/c;->interval(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const/4 v1, 0x0

    .line 29
    invoke-virtual {p0, v0, v1}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v0, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    new-instance v1, Ll/rtu;

    .line 46
    .line 47
    invoke-direct {v1, p0}, Ll/rtu;-><init>(Ll/stu;)V

    .line 48
    .line 49
    .line 50
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    iput-object v0, p0, Ll/stu;->i:Ll/kcg0;

    .line 59
    .line 60
    return-void
.end method
