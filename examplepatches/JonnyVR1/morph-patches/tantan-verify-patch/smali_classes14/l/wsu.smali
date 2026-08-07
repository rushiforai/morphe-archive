.class public Ll/wsu;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/knu;

.field public b:Ll/kcg0;


# direct methods
.method public constructor <init>(Ll/knu;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/wsu;->a:Ll/knu;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/wsu;Ljava/lang/String;Lrx/Notification;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/wsu;->h(Ljava/lang/String;Lrx/Notification;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic b(I)Lrx/c;
    .locals 2

    .line 1
    int-to-long v0, p0

    .line 2
    sget-object p0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 3
    .line 4
    invoke-static {v0, v1, p0}, Lrx/c;->interval(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method public static synthetic c(Ljava/lang/String;)Lrx/c;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/jwu;->F(Ljava/lang/String;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic d(Ll/wsu;Ljava/lang/String;Ll/y20;Ljava/lang/Long;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/wsu;->g(Ljava/lang/String;Ll/y20;Ljava/lang/Long;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic e(Ll/wsu;Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wsu;->i(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)V

    return-void
.end method


# virtual methods
.method public final f(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->status:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Ll/xnu;->x(Ljava/lang/String;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p2}, Ll/xnu;->x(Ljava/lang/String;)I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-le p0, p1, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public final synthetic g(Ljava/lang/String;Ll/y20;Ljava/lang/Long;)Lrx/c;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wsu;->a:Ll/knu;

    .line 2
    .line 3
    iget-object p0, p0, Ll/knu;->d:Ll/ner;

    .line 4
    .line 5
    new-instance p3, Ll/usu;

    .line 6
    .line 7
    invoke-direct {p3, p1}, Ll/usu;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    invoke-interface {p0, p3, p1}, Ll/ner;->duringCreated(Ll/pcj;Z)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    new-instance p1, Ll/vsu;

    .line 16
    .line 17
    invoke-direct {p1}, Ll/vsu;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, p1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0, p2}, Lrx/c;->doOnError(Ll/y20;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0}, Lrx/c;->materialize()Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method

.method public final synthetic h(Ljava/lang/String;Lrx/Notification;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p2}, Lrx/Notification;->f()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    check-cast p2, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 6
    .line 7
    invoke-virtual {p0, p2, p1}, Ll/wsu;->f(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;Ljava/lang/String;)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public final synthetic i(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/wsu;->k()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public j(ILjava/lang/String;Ljava/lang/String;Ll/y20;Ll/y20;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;",
            ">;",
            "Ll/y20<",
            "Ljava/lang/Throwable;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/wsu;->b:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v1, "status:"

    .line 9
    .line 10
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v1, ",interval:"

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const-string v1, "videoChat"

    .line 29
    .line 30
    invoke-static {v1, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/wsu;->a:Ll/knu;

    .line 34
    .line 35
    iget-object v0, v0, Ll/knu;->d:Ll/ner;

    .line 36
    .line 37
    new-instance v1, Ll/osu;

    .line 38
    .line 39
    invoke-direct {v1, p1}, Ll/osu;-><init>(I)V

    .line 40
    .line 41
    .line 42
    const/4 p1, 0x0

    .line 43
    invoke-interface {v0, v1, p1}, Ll/ner;->duringCreated(Ll/pcj;Z)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    const/16 v0, 0x1e

    .line 48
    .line 49
    invoke-virtual {p1, v0}, Lrx/c;->take(I)Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-virtual {p1}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-virtual {p1, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    new-instance v0, Ll/psu;

    .line 66
    .line 67
    invoke-direct {v0, p0, p2, p5}, Ll/psu;-><init>(Ll/wsu;Ljava/lang/String;Ll/y20;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p1, v0}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    invoke-virtual {p1}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    new-instance p2, Ll/f130;

    .line 79
    .line 80
    invoke-direct {p2}, Ll/f130;-><init>()V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p1, p2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    new-instance p2, Ll/qsu;

    .line 88
    .line 89
    invoke-direct {p2}, Ll/qsu;-><init>()V

    .line 90
    .line 91
    .line 92
    invoke-virtual {p1, p2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    new-instance p2, Ll/rsu;

    .line 97
    .line 98
    invoke-direct {p2, p0, p3}, Ll/rsu;-><init>(Ll/wsu;Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {p1, p2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    new-instance p2, Ll/ssu;

    .line 106
    .line 107
    invoke-direct {p2}, Ll/ssu;-><init>()V

    .line 108
    .line 109
    .line 110
    invoke-virtual {p1, p2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    const/4 p2, 0x1

    .line 115
    invoke-virtual {p1, p2}, Lrx/c;->take(I)Lrx/c;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    new-instance p2, Ll/tsu;

    .line 120
    .line 121
    invoke-direct {p2, p0}, Ll/tsu;-><init>(Ll/wsu;)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {p1, p2}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    invoke-static {p4, p5}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 129
    .line 130
    .line 131
    move-result-object p2

    .line 132
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 133
    .line 134
    .line 135
    move-result-object p1

    .line 136
    iput-object p1, p0, Ll/wsu;->b:Ll/kcg0;

    .line 137
    .line 138
    return-void
.end method

.method public k()V
    .locals 2

    .line 1
    const-string v0, "videoChat"

    .line 2
    .line 3
    const-string v1, " stop looper "

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/wsu;->b:Ll/kcg0;

    .line 9
    .line 10
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
