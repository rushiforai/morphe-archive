.class public Ll/zwk0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/k3m;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/k3m<",
        "Ll/axk0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ll/kcg0;

.field public b:Ll/xnu;

.field public c:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Landroid/util/Pair<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Boolean;",
            ">;>;"
        }
    .end annotation
.end field

.field public d:Ll/axk0;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/zwk0;->c:Lrx/subjects/a;

    .line 9
    .line 10
    return-void
.end method

.method private synthetic G(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/zwk0;->t()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private I()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zwk0;->b:Ll/xnu;

    .line 2
    .line 3
    const-string v1, "video_chat_window"

    .line 4
    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/xnu;->B()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_2

    .line 12
    .line 13
    iget-object v0, p0, Ll/zwk0;->b:Ll/xnu;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/xnu;->B()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;->id:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    iget-object v0, p0, Ll/zwk0;->b:Ll/xnu;

    .line 29
    .line 30
    invoke-virtual {v0}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-static {v0}, Ll/yuk0;->e(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-nez v0, :cond_1

    .line 39
    .line 40
    const-string p0, "return because video chat data"

    .line 41
    .line 42
    invoke-static {v1, p0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_1
    const-string v0, "start refresh"

    .line 47
    .line 48
    invoke-static {v1, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Ll/zwk0;->b:Ll/xnu;

    .line 52
    .line 53
    invoke-virtual {v0}, Ll/xnu;->B()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;->id:Ljava/lang/String;

    .line 58
    .line 59
    invoke-static {v0}, Ll/jwu;->E(Ljava/lang/String;)Lrx/c;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    new-instance v1, Ll/owk0;

    .line 64
    .line 65
    invoke-direct {v1, p0}, Ll/owk0;-><init>(Ll/zwk0;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    new-instance v1, Ll/pwk0;

    .line 73
    .line 74
    invoke-direct {v1, p0}, Ll/pwk0;-><init>(Ll/zwk0;)V

    .line 75
    .line 76
    .line 77
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 82
    .line 83
    .line 84
    return-void

    .line 85
    :cond_2
    :goto_0
    const-string p0, "return because live"

    .line 86
    .line 87
    invoke-static {v1, p0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method private K()V
    .locals 3

    .line 1
    sget-object v0, Ll/tbs;->b:Ll/vwt;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/vwt;->P5()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    int-to-long v0, v0

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
    invoke-virtual {p0, v0}, Ll/zwk0;->v(Lrx/c;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v0, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    new-instance v1, Ll/xwk0;

    .line 31
    .line 32
    invoke-direct {v1, p0}, Ll/xwk0;-><init>(Ll/zwk0;)V

    .line 33
    .line 34
    .line 35
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    iput-object v0, p0, Ll/zwk0;->a:Ll/kcg0;

    .line 44
    .line 45
    return-void
.end method

.method public static synthetic b(Ll/zwk0;Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatLiveChange;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zwk0;->D(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatLiveChange;)V

    return-void
.end method

.method public static synthetic c(Ll/zwk0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/zwk0;->A()V

    return-void
.end method

.method public static synthetic d(Ll/zwk0;Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/zwk0;->s(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;)V

    return-void
.end method

.method public static synthetic e(Ll/zwk0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/zwk0;->z()V

    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic g(Ll/zwk0;Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zwk0;->B(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)V

    return-void
.end method

.method public static synthetic h(Ll/zwk0;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zwk0;->H(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic k(Ll/zwk0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/zwk0;->x(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic l(Ll/zwk0;Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$MultiDevice;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zwk0;->E(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$MultiDevice;)V

    return-void
.end method

.method public static synthetic m(Ll/zwk0;Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zwk0;->F(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic n(Lrx/c;)Lrx/c;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic o(Ll/zwk0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/zwk0;->G(Landroid/view/View;)V

    return-void
.end method

.method private s(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    const-string v0, "stopped"

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;->status:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    return-void

    .line 15
    :cond_1
    :goto_0
    const/4 p1, 0x1

    .line 16
    invoke-virtual {p0, p1}, Ll/zwk0;->u(Z)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method private x(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/zwk0;->b:Ll/xnu;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p1}, Ll/yuk0;->f(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->isAppVisible()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/zwk0;->t()V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->getAttendee()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatUser;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatUser;->userName:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {p0}, Ll/awk0;->a(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_1
    const p0, 0xf4240

    .line 34
    .line 35
    .line 36
    invoke-static {p0}, Ll/toh0;->g(I)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method private y()V
    .locals 3

    .line 1
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Ll/zwk0;->c:Lrx/subjects/a;

    .line 6
    .line 7
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 8
    .line 9
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 10
    .line 11
    invoke-static {v1, v2}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/zwk0;->b:Ll/xnu;

    .line 19
    .line 20
    invoke-virtual {v0}, Ll/xnu;->V()V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/zwk0;->b:Ll/xnu;

    .line 24
    .line 25
    iget-object v0, v0, Ll/xnu;->c:Ll/ecl0;

    .line 26
    .line 27
    invoke-virtual {v0}, Ll/ecl0;->l()Ll/aj1;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iget-object v0, v0, Ll/aj1;->S1:Lrx/subjects/b;

    .line 32
    .line 33
    invoke-virtual {p0, v0}, Ll/zwk0;->v(Lrx/c;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    new-instance v1, Ll/rwk0;

    .line 38
    .line 39
    invoke-direct {v1, p0}, Ll/rwk0;-><init>(Ll/zwk0;)V

    .line 40
    .line 41
    .line 42
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Ll/zwk0;->b:Ll/xnu;

    .line 50
    .line 51
    invoke-virtual {v0}, Ll/xnu;->z()Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {p0, v0}, Ll/zwk0;->v(Lrx/c;)Lrx/c;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    new-instance v1, Ll/swk0;

    .line 64
    .line 65
    invoke-direct {v1, p0}, Ll/swk0;-><init>(Ll/zwk0;)V

    .line 66
    .line 67
    .line 68
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Ll/zwk0;->b:Ll/xnu;

    .line 76
    .line 77
    iget-object v0, v0, Ll/xnu;->c:Ll/ecl0;

    .line 78
    .line 79
    invoke-virtual {v0}, Ll/ecl0;->l()Ll/aj1;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-virtual {v0}, Ll/aj1;->r0()Lrx/c;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-virtual {p0, v0}, Ll/zwk0;->v(Lrx/c;)Lrx/c;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    new-instance v1, Ll/twk0;

    .line 92
    .line 93
    invoke-direct {v1, p0}, Ll/twk0;-><init>(Ll/zwk0;)V

    .line 94
    .line 95
    .line 96
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 101
    .line 102
    .line 103
    iget-object v0, p0, Ll/zwk0;->b:Ll/xnu;

    .line 104
    .line 105
    iget-object v0, v0, Ll/xnu;->c:Ll/ecl0;

    .line 106
    .line 107
    invoke-virtual {v0}, Ll/ecl0;->l()Ll/aj1;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    iget-object v0, v0, Ll/aj1;->V1:Lrx/subjects/b;

    .line 112
    .line 113
    invoke-virtual {p0, v0}, Ll/zwk0;->v(Lrx/c;)Lrx/c;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    new-instance v1, Ll/uwk0;

    .line 118
    .line 119
    invoke-direct {v1, p0}, Ll/uwk0;-><init>(Ll/zwk0;)V

    .line 120
    .line 121
    .line 122
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 123
    .line 124
    .line 125
    move-result-object v1

    .line 126
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 127
    .line 128
    .line 129
    invoke-direct {p0}, Ll/zwk0;->K()V

    .line 130
    .line 131
    .line 132
    invoke-direct {p0}, Ll/zwk0;->I()V

    .line 133
    .line 134
    .line 135
    return-void
.end method


# virtual methods
.method public final synthetic A()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Ll/zwk0;->u(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic B(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/zwk0;->b:Ll/xnu;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p0, p1, v0}, Ll/xnu;->h0(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic D(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatLiveChange;)V
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
    invoke-virtual {p0, p1, v0}, Ll/zwk0;->w(Ljava/lang/String;Z)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public final synthetic E(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$MultiDevice;)V
    .locals 1

    .line 1
    const-string p1, ""

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p0, p1, v0}, Ll/zwk0;->w(Ljava/lang/String;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic F(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zwk0;->b:Ll/xnu;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xnu;->B()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;->status:Ljava/lang/String;

    .line 8
    .line 9
    const-string p1, "stopped"

    .line 10
    .line 11
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    xor-int/lit8 p0, p0, 0x1

    .line 16
    .line 17
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public final synthetic H(Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/zwk0;->I()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public J(Ll/xnu;)Z
    .locals 1

    .line 1
    iput-object p1, p0, Ll/zwk0;->b:Ll/xnu;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/zwk0;->y()V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/zwk0;->d:Ll/axk0;

    .line 7
    .line 8
    new-instance v0, Ll/qwk0;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Ll/qwk0;-><init>(Ll/zwk0;)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Ll/mbs;->J()Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {p1, v0, p0}, Ll/axk0;->c(Landroid/view/View$OnClickListener;Ljava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    return p0
.end method

.method public isShowing()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zwk0;->d:Ll/axk0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/axk0;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public r(Ll/axk0;)V
    .locals 0

    .line 1
    invoke-virtual {p1, p0}, Ll/axk0;->a(Ll/zwk0;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/zwk0;->d:Ll/axk0;

    .line 5
    .line 6
    return-void
.end method

.method public t()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->globalLifeCycle_()Ljava/util/HashMap;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/util/HashMap;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_2

    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->globalLifeCycle_()Ljava/util/HashMap;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_2

    .line 24
    .line 25
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->globalLifeCycle_()Ljava/util/HashMap;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    check-cast v0, Ljava/util/List;

    .line 42
    .line 43
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    const/4 v2, 0x1

    .line 48
    if-nez v1, :cond_1

    .line 49
    .line 50
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    sub-int/2addr v1, v2

    .line 55
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    check-cast v0, Lcom/p1/mobile/android/app/Act$r;

    .line 60
    .line 61
    iget-object v0, v0, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 62
    .line 63
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    check-cast v0, Landroid/app/Activity;

    .line 68
    .line 69
    instance-of v1, v0, Lcom/p1/mobile/android/app/Act;

    .line 70
    .line 71
    if-eqz v1, :cond_0

    .line 72
    .line 73
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 74
    .line 75
    iget-object v1, p0, Ll/zwk0;->b:Ll/xnu;

    .line 76
    .line 77
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartAct;->g2(Lcom/p1/mobile/android/app/Act;Ll/xnu;)V

    .line 78
    .line 79
    .line 80
    const/4 v0, 0x0

    .line 81
    invoke-virtual {p0, v0}, Ll/zwk0;->u(Z)V

    .line 82
    .line 83
    .line 84
    return-void

    .line 85
    :cond_0
    invoke-virtual {p0, v2}, Ll/zwk0;->u(Z)V

    .line 86
    .line 87
    .line 88
    return-void

    .line 89
    :cond_1
    invoke-virtual {p0, v2}, Ll/zwk0;->u(Z)V

    .line 90
    .line 91
    .line 92
    :cond_2
    return-void
.end method

.method public u(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zwk0;->c:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/subjects/a;->onCompleted()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/zwk0;->d:Ll/axk0;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/axk0;->b()V

    .line 9
    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    sget-object v0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatAct;->i:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Ll/pb1;->a(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Ll/zwk0;->b:Ll/xnu;

    .line 23
    .line 24
    if-eqz p1, :cond_0

    .line 25
    .line 26
    const/4 v0, 0x1

    .line 27
    invoke-virtual {p1, v0}, Ll/xnu;->m(Z)V

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Ll/zwk0;->b:Ll/xnu;

    .line 31
    .line 32
    invoke-virtual {p1}, Ll/xnu;->B()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;->id:Ljava/lang/String;

    .line 37
    .line 38
    invoke-static {p1}, Ll/jwu;->Y(Ljava/lang/String;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    new-instance v0, Ll/nwk0;

    .line 43
    .line 44
    invoke-direct {v0}, Ll/nwk0;-><init>()V

    .line 45
    .line 46
    .line 47
    invoke-static {v0}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 52
    .line 53
    .line 54
    :cond_0
    const/4 p1, 0x0

    .line 55
    iput-object p1, p0, Ll/zwk0;->b:Ll/xnu;

    .line 56
    .line 57
    return-void
.end method

.method public v(Lrx/c;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/ywk0;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/ywk0;-><init>(Lrx/c;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/zwk0;->c:Lrx/subjects/a;

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    invoke-static {v0, p0, p1}, Ll/psd0;->D(Ll/pcj;Lrx/c;Z)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public w(Ljava/lang/String;Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zwk0;->a:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/zwk0;->b:Ll/xnu;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/xnu;->B()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Ll/zwk0;->b:Ll/xnu;

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/xnu;->B()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "stopped"

    .line 23
    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;->status:Ljava/lang/String;

    .line 25
    .line 26
    :cond_0
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    if-nez v0, :cond_1

    .line 31
    .line 32
    const/4 v0, 0x0

    .line 33
    goto :goto_0

    .line 34
    :cond_1
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iget-object v0, v0, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 39
    .line 40
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    check-cast v0, Landroid/app/Activity;

    .line 45
    .line 46
    :goto_0
    if-nez v0, :cond_2

    .line 47
    .line 48
    const/4 p1, 0x1

    .line 49
    invoke-virtual {p0, p1}, Ll/zwk0;->u(Z)V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_2
    iget-object v1, p0, Ll/zwk0;->b:Ll/xnu;

    .line 54
    .line 55
    if-eqz p2, :cond_3

    .line 56
    .line 57
    new-instance p1, Ll/vwk0;

    .line 58
    .line 59
    invoke-direct {p1, p0}, Ll/vwk0;-><init>(Ll/zwk0;)V

    .line 60
    .line 61
    .line 62
    const-string p0, "\u5df2\u5728\u5176\u4ed6\u8bbe\u5907\u767b\u5f55"

    .line 63
    .line 64
    invoke-virtual {v1, v0, p0, p1}, Ll/xnu;->a0(Landroid/app/Activity;Ljava/lang/String;Ll/x20;)V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_3
    new-instance p2, Ll/wwk0;

    .line 69
    .line 70
    invoke-direct {p2, p0}, Ll/wwk0;-><init>(Ll/zwk0;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {v1, v0, p1, p2}, Ll/xnu;->a0(Landroid/app/Activity;Ljava/lang/String;Ll/x20;)V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public final synthetic z()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Ll/zwk0;->u(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method
