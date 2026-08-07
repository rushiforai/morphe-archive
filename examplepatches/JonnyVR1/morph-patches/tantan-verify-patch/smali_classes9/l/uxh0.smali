.class public Ll/uxh0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ll/qwl;

.field public b:Ll/m8t;

.field public c:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Ll/uxh0;->c:Z

    .line 6
    .line 7
    return-void
.end method

.method public static synthetic a(Ll/uxh0;Ljava/util/Map;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/uxh0;->n(Ljava/util/Map;)V

    return-void
.end method

.method public static synthetic b(Ll/uxh0;ILjava/util/Map;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/uxh0;->m(ILjava/util/Map;)V

    return-void
.end method

.method public static synthetic c(JLjava/util/Map;)V
    .locals 1

    .line 1
    const-string v0, "watch_duration"

    .line 2
    .line 3
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p2, v0, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic d(Ll/uxh0;Ljava/util/Map;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/uxh0;->l(Ljava/util/Map;)V

    return-void
.end method


# virtual methods
.method public e(Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ll/m8t;

    .line 2
    .line 3
    new-instance v1, Ll/uxh0$a;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/uxh0$a;-><init>(Ll/uxh0;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Ll/m8t;-><init>(Ll/v120;)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Ll/uxh0;->b:Ll/m8t;

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Ll/m8t;->m(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public f()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/uxh0;->a:Ll/qwl;

    .line 3
    .line 4
    return-void
.end method

.method public g()Ll/qwl;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uxh0;->a:Ll/qwl;

    .line 2
    .line 3
    return-object p0
.end method

.method public h()F
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/uxh0;->i()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/uxh0;->a:Ll/qwl;

    .line 8
    .line 9
    invoke-interface {p0}, Ll/qwl;->k()F

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method public i()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uxh0;->a:Ll/qwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public j()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uxh0;->a:Ll/qwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/qwl;->isPlaying()Z

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

.method public k()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uxh0;->a:Ll/qwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/qwl;->e()Z

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

.method public final synthetic l(Ljava/util/Map;)V
    .locals 1

    .line 1
    iget-boolean p0, p0, Ll/uxh0;->c:Z

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "is_first_try"

    .line 8
    .line 9
    invoke-interface {p1, v0, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic m(ILjava/util/Map;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "errorMsg"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const-string v0, "error_msg"

    .line 16
    .line 17
    invoke-interface {p2, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    iget-boolean p0, p0, Ll/uxh0;->c:Z

    .line 21
    .line 22
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const-string p1, "is_first_try"

    .line 27
    .line 28
    invoke-interface {p2, p1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final synthetic n(Ljava/util/Map;)V
    .locals 1

    .line 1
    iget-boolean p0, p0, Ll/uxh0;->c:Z

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "is_first_try"

    .line 8
    .line 9
    invoke-interface {p1, v0, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public o(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Landroid/widget/FrameLayout;Ll/pwl;Ljava/lang/String;Ljava/lang/String;)I
    .locals 7

    .line 1
    iget-object v0, p0, Ll/uxh0;->a:Ll/qwl;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, -0x1

    .line 6
    return p0

    .line 7
    :cond_0
    if-eqz p2, :cond_1

    .line 8
    .line 9
    invoke-interface {v0, p2}, Ll/qwl;->f(Landroid/widget/FrameLayout;)V

    .line 10
    .line 11
    .line 12
    :cond_1
    iget-object p2, p0, Ll/uxh0;->a:Ll/qwl;

    .line 13
    .line 14
    invoke-interface {p2, p3}, Ll/qwl;->c(Ll/pwl;)V

    .line 15
    .line 16
    .line 17
    iget-object p2, p0, Ll/uxh0;->a:Ll/qwl;

    .line 18
    .line 19
    invoke-interface {p2}, Ll/qwl;->i()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamUrl:Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;->pullFlv:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {p2, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result p2

    .line 31
    const/4 v0, 0x0

    .line 32
    if-eqz p2, :cond_3

    .line 33
    .line 34
    iget-object p2, p0, Ll/uxh0;->a:Ll/qwl;

    .line 35
    .line 36
    invoke-interface {p2}, Ll/qwl;->e()Z

    .line 37
    .line 38
    .line 39
    move-result p2

    .line 40
    if-eqz p2, :cond_3

    .line 41
    .line 42
    iget-object p0, p0, Ll/uxh0;->a:Ll/qwl;

    .line 43
    .line 44
    invoke-interface {p0}, Ll/qwl;->isPlaying()Z

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    if-eqz p0, :cond_2

    .line 49
    .line 50
    invoke-interface {p3}, Ll/pwl;->p0()V

    .line 51
    .line 52
    .line 53
    :cond_2
    return v0

    .line 54
    :cond_3
    iget-object p2, p0, Ll/uxh0;->a:Ll/qwl;

    .line 55
    .line 56
    invoke-interface {p2}, Ll/qwl;->isPlaying()Z

    .line 57
    .line 58
    .line 59
    move-result p2

    .line 60
    if-eqz p2, :cond_4

    .line 61
    .line 62
    const/4 p2, 0x1

    .line 63
    invoke-virtual {p0, p2}, Ll/uxh0;->u(Z)V

    .line 64
    .line 65
    .line 66
    :cond_4
    invoke-virtual {p0, p1, p4, p5}, Ll/uxh0;->r(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    iget-object p2, p0, Ll/uxh0;->a:Ll/qwl;

    .line 70
    .line 71
    invoke-interface {p2, p4, p5, p1}, Ll/qwl;->l(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    .line 72
    .line 73
    .line 74
    iget-object v1, p0, Ll/uxh0;->a:Ll/qwl;

    .line 75
    .line 76
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamUrl:Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;

    .line 77
    .line 78
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;->pullFlv:Ljava/lang/String;

    .line 79
    .line 80
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;->pullFlvIpv6:Ljava/lang/String;

    .line 81
    .line 82
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 83
    .line 84
    iget-object v4, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 85
    .line 86
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamCdnInfo:Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

    .line 87
    .line 88
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;->provider:I

    .line 89
    .line 90
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v5

    .line 94
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamCdnInfo:Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

    .line 95
    .line 96
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;->businessType:I

    .line 97
    .line 98
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v6

    .line 102
    invoke-interface/range {v1 .. v6}, Ll/qwl;->j(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    return v0
.end method

.method public p(Ll/ig80;)V
    .locals 4

    .line 1
    new-instance v0, Ll/qxh0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/qxh0;-><init>(Ll/uxh0;)V

    .line 4
    .line 5
    .line 6
    const-string v1, "audience_player_success"

    .line 7
    .line 8
    invoke-static {p1, v1, v0}, Ll/fgt;->b(Ll/i6t;Ljava/lang/String;Ll/y20;)V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    iput-boolean v0, p0, Ll/uxh0;->c:Z

    .line 13
    .line 14
    invoke-static {}, Ll/pzi0;->o()J

    .line 15
    .line 16
    .line 17
    move-result-wide v0

    .line 18
    sget-wide v2, Ll/uhd0;->l:J

    .line 19
    .line 20
    sub-long/2addr v0, v2

    .line 21
    new-instance p0, Ll/rxh0;

    .line 22
    .line 23
    invoke-direct {p0, v0, v1}, Ll/rxh0;-><init>(J)V

    .line 24
    .line 25
    .line 26
    const-string v0, "audience_first_frame_loaded"

    .line 27
    .line 28
    invoke-static {p1, v0, p0}, Ll/fgt;->c(Ll/i6t;Ljava/lang/String;Ll/y20;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public q(Ll/ig80;I)V
    .locals 1

    .line 1
    new-instance v0, Ll/txh0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p2}, Ll/txh0;-><init>(Ll/uxh0;I)V

    .line 4
    .line 5
    .line 6
    const-string p2, "audience_player_error"

    .line 7
    .line 8
    invoke-static {p1, p2, v0}, Ll/fgt;->b(Ll/i6t;Ljava/lang/String;Ll/y20;)V

    .line 9
    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    iput-boolean p1, p0, Ll/uxh0;->c:Z

    .line 13
    .line 14
    return-void
.end method

.method public final r(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6

    .line 1
    new-instance v5, Ll/sxh0;

    .line 2
    .line 3
    invoke-direct {v5, p0}, Ll/sxh0;-><init>(Ll/uxh0;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "audience_player_start"

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    move-object v4, p1

    .line 10
    move-object v2, p2

    .line 11
    move-object v3, p3

    .line 12
    invoke-static/range {v0 .. v5}, Ll/fgt;->a(Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Ll/y20;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public s()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/uxh0;->c:Z

    .line 3
    .line 4
    return-void
.end method

.method public t(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uxh0;->a:Ll/qwl;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-interface {p0, p1}, Ll/qwl;->setMute(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public u(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uxh0;->a:Ll/qwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/qwl;->b(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public v()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/uxh0;->a:Ll/qwl;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-interface {v0, v1}, Ll/qwl;->b(Z)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/uxh0;->a:Ll/qwl;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/qwl;->reset()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public w()Ll/qwl;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/uxh0;->a:Ll/qwl;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iput-object v1, p0, Ll/uxh0;->a:Ll/qwl;

    .line 7
    .line 8
    return-object v0

    .line 9
    :cond_0
    return-object v1
.end method

.method public x()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/uxh0;->b:Ll/m8t;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/m8t;->d()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Ll/uxh0;->b:Ll/m8t;

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public y(Ll/qwl;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/uxh0;->a:Ll/qwl;

    .line 2
    .line 3
    return-void
.end method

.method public z(Landroid/widget/FrameLayout;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/uxh0;->a:Ll/qwl;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-interface {v0, v1}, Ll/qwl;->g(Z)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/uxh0;->a:Ll/qwl;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ll/qwl;->d(Landroid/widget/FrameLayout;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method
