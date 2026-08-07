.class public Ll/a980;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/dum;

.field public b:Ll/kcg0;


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/a980;->a:Ll/dum;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/a980;Ll/pf60;)Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/a980;->f(Ll/pf60;)Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic b(Ll/a980;Ljava/lang/String;Ll/y20;Ljava/lang/Long;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/a980;->g(Ljava/lang/String;Ll/y20;Ljava/lang/Long;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic c(Ll/a980;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/a980;->h(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/live/base/data/BLivePkStage;Lrx/Notification;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p1}, Lrx/Notification;->f()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->isTargetState(Lcom/p1/mobile/putong/live/base/data/BLivePkStage;)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;
    .locals 1

    .line 1
    const-string v0, "PkRequestLooper callback"

    .line 2
    .line 3
    invoke-static {v0, p0}, Ll/n180;->i(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 8
    .line 9
    return-object p0
.end method


# virtual methods
.method public final synthetic f(Ll/pf60;)Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 8
    .line 9
    iget-object v1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLivePk;

    .line 12
    .line 13
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast p1, Ljava/util/List;

    .line 16
    .line 17
    iget-object p0, p0, Ll/a980;->a:Ll/dum;

    .line 18
    .line 19
    iget-object p0, p0, Ll/dum;->h:Ll/oo2;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-direct {v0, v1, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;-><init>(Lcom/p1/mobile/putong/live/base/data/BLivePk;Ljava/util/List;Lcom/p1/mobile/putong/data/User;)V

    .line 26
    .line 27
    .line 28
    return-object v0

    .line 29
    :cond_0
    const/4 p0, 0x0

    .line 30
    return-object p0
.end method

.method public final synthetic g(Ljava/lang/String;Ll/y20;Ljava/lang/Long;)Lrx/c;
    .locals 1

    .line 1
    iget-object p3, p0, Ll/a980;->a:Ll/dum;

    .line 2
    .line 3
    iget-object p3, p3, Ll/dum;->g:Ll/ner;

    .line 4
    .line 5
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->e7(Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    new-instance v0, Ll/z880;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ll/z880;-><init>(Ll/a980;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-interface {p3, p0}, Ll/ner;->duringCreated(Lrx/c;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    new-instance p1, Ll/ea80;

    .line 23
    .line 24
    invoke-direct {p1}, Ll/ea80;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, p1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0, p2}, Lrx/c;->doOnError(Ll/y20;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p0}, Lrx/c;->materialize()Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0
.end method

.method public final synthetic h(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/a980;->j()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public i(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLivePkStage;Ll/y20;Ll/y20;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/live/base/data/BLivePkStage;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;",
            ">;",
            "Ll/y20<",
            "Ljava/lang/Throwable;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/a980;->b:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v1, "start runLooper pkId:"

    .line 9
    .line 10
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v1, "\uff0cstate ="

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

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
    invoke-static {v0}, Ll/n180;->j(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Ll/a980;->a:Ll/dum;

    .line 36
    .line 37
    iget-object v1, v0, Ll/dum;->g:Ll/ner;

    .line 38
    .line 39
    iget-object v0, v0, Ll/dum;->h:Ll/oo2;

    .line 40
    .line 41
    const/4 v2, 0x3

    .line 42
    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 43
    .line 44
    invoke-virtual {v0, v2, v3}, Ll/oo2;->h2(ILjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-interface {v1, v0}, Ll/ner;->duringCreated(Lrx/c;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    const/16 v1, 0xa

    .line 53
    .line 54
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-virtual {v0}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    new-instance v1, Ll/u880;

    .line 71
    .line 72
    invoke-direct {v1, p0, p1, p4}, Ll/u880;-><init>(Ll/a980;Ljava/lang/String;Ll/y20;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    invoke-virtual {p1}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    new-instance v0, Ll/f130;

    .line 84
    .line 85
    invoke-direct {v0}, Ll/f130;-><init>()V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p1, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    new-instance v0, Ll/qsu;

    .line 93
    .line 94
    invoke-direct {v0}, Ll/qsu;-><init>()V

    .line 95
    .line 96
    .line 97
    invoke-virtual {p1, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    new-instance v0, Ll/v880;

    .line 102
    .line 103
    invoke-direct {v0, p2}, Ll/v880;-><init>(Lcom/p1/mobile/putong/live/base/data/BLivePkStage;)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {p1, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    new-instance p2, Ll/w880;

    .line 111
    .line 112
    invoke-direct {p2}, Ll/w880;-><init>()V

    .line 113
    .line 114
    .line 115
    invoke-virtual {p1, p2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    const/4 p2, 0x1

    .line 120
    invoke-virtual {p1, p2}, Lrx/c;->take(I)Lrx/c;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    new-instance p2, Ll/x880;

    .line 125
    .line 126
    invoke-direct {p2, p0}, Ll/x880;-><init>(Ll/a980;)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {p1, p2}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    new-instance p2, Ll/y880;

    .line 134
    .line 135
    invoke-direct {p2}, Ll/y880;-><init>()V

    .line 136
    .line 137
    .line 138
    invoke-virtual {p1, p2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    invoke-static {p3, p4}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 143
    .line 144
    .line 145
    move-result-object p2

    .line 146
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 147
    .line 148
    .line 149
    move-result-object p1

    .line 150
    iput-object p1, p0, Ll/a980;->b:Ll/kcg0;

    .line 151
    .line 152
    return-void
.end method

.method public j()V
    .locals 1

    .line 1
    const-string v0, "PkRequestLooper stop"

    .line 2
    .line 3
    invoke-static {v0}, Ll/n180;->j(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/a980;->b:Ll/kcg0;

    .line 7
    .line 8
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
