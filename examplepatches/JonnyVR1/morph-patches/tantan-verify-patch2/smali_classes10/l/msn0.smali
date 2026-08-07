.class public Ll/msn0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/dn50;


# instance fields
.field public a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;

.field public b:Ljava/lang/String;

.field public c:Ll/xvl;

.field public d:Ll/yvl;

.field public e:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Ll/yvl;)V
    .locals 1
    .param p1    # Ll/yvl;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/msn0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;

    .line 9
    .line 10
    new-instance v0, Ll/msn0$a;

    .line 11
    .line 12
    invoke-direct {v0, p0}, Ll/msn0$a;-><init>(Ll/msn0;)V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Ll/msn0;->e:Ljava/lang/Runnable;

    .line 16
    .line 17
    iput-object p1, p0, Ll/msn0;->d:Ll/yvl;

    .line 18
    .line 19
    new-instance p1, Ll/r5r;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/msn0;->q()Ll/rwn0;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Ll/oo2;->H0()Ll/c0m;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-direct {p1, v0}, Ll/r5r;-><init>(Ll/c0m;)V

    .line 30
    .line 31
    .line 32
    iput-object p1, p0, Ll/msn0;->c:Ll/xvl;

    .line 33
    .line 34
    return-void
.end method

.method private synthetic O(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/msn0;->c:Ll/xvl;

    .line 2
    .line 3
    const-string p1, "hang up call"

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/xvl;->n0(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->state:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic d(Ll/msn0;Landroid/net/NetworkInfo;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/msn0;->P(Landroid/net/NetworkInfo;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic e(Ll/msn0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/msn0;->O(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    return-void
.end method

.method public static synthetic f(Landroid/net/NetworkInfo;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->g()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic g(Ll/msn0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/msn0;->N(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic h(Ll/msn0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/msn0;->M(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;)V

    return-void
.end method

.method public static synthetic i(Ll/msn0;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/msn0;->p(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic j(Ll/msn0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/msn0;->Q(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;)V

    return-void
.end method

.method public static synthetic k(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic l(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByAnchor:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByUser:Z

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    goto :goto_1

    .line 12
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 13
    :goto_1
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public static bridge synthetic m(Ll/msn0;)Ll/xvl;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/msn0;->c:Ll/xvl;

    return-object p0
.end method

.method private t(Lrx/c;)Lrx/c;
    .locals 0
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
    iget-object p0, p0, Ll/msn0;->d:Ll/yvl;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-object p1

    .line 6
    :cond_0
    invoke-interface {p0, p1}, Ll/yvl;->L1(Lrx/c;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method


# virtual methods
.method public B(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/msn0;->L()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/msn0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;->playInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->orderId:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/msn0;->q()Ll/rwn0;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p1}, Ll/vp20;->k()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    iget-object v0, p0, Ll/msn0;->b:Ljava/lang/String;

    .line 28
    .line 29
    sget-object v1, Ll/qd80;->h:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {p1, v0, v1}, Ll/rqn0;->l(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-direct {p0, p1}, Ll/msn0;->t(Lrx/c;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    new-instance p1, Ll/csn0;

    .line 40
    .line 41
    invoke-direct {p1}, Ll/csn0;-><init>()V

    .line 42
    .line 43
    .line 44
    new-instance v0, Ll/wnt;

    .line 45
    .line 46
    invoke-direct {v0}, Ll/wnt;-><init>()V

    .line 47
    .line 48
    .line 49
    invoke-static {p1, v0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 54
    .line 55
    .line 56
    :cond_0
    return-void
.end method

.method public C()Ljava/lang/Float;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/msn0;->c:Ll/xvl;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/xvl;->d()F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public D()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/msn0;->c:Ll/xvl;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/xvl;->k0()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public E()Ljava/lang/Integer;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/msn0;->c:Ll/xvl;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/xvl;->getStatus()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public F()Ljava/lang/Float;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/msn0;->c:Ll/xvl;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/xvl;->i()F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public final G(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;)V
    .locals 8

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;->playInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

    .line 2
    .line 3
    iget-object v1, p0, Ll/msn0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;

    .line 4
    .line 5
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;->playInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

    .line 6
    .line 7
    invoke-virtual {p0, v1, v0}, Ll/msn0;->u(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    const-string v2, "[voice][ktv]"

    .line 12
    .line 13
    if-eqz v1, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Ll/msn0;->H(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;)V

    .line 16
    .line 17
    .line 18
    iput-object p1, p0, Ll/msn0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/msn0;->q()Ll/rwn0;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iget-boolean p1, p1, Ll/rwn0;->Q:Z

    .line 25
    .line 26
    if-eqz p1, :cond_0

    .line 27
    .line 28
    iget-object p1, p0, Ll/msn0;->c:Ll/xvl;

    .line 29
    .line 30
    invoke-interface {p1}, Ll/xvl;->getStatus()I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    invoke-static {p1}, Ll/qd80;->a(I)Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-eqz p1, :cond_0

    .line 39
    .line 40
    invoke-static {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->isValid(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;)Z

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    if-eqz p1, :cond_0

    .line 45
    .line 46
    iget-object p0, p0, Ll/msn0;->c:Ll/xvl;

    .line 47
    .line 48
    iget-object p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->songCode:Ljava/lang/String;

    .line 49
    .line 50
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->lyricUrl:Ljava/lang/String;

    .line 51
    .line 52
    iget-object v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->lyricType:Ljava/lang/String;

    .line 53
    .line 54
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->provider:Ljava/lang/String;

    .line 55
    .line 56
    invoke-interface {p0, p1, v1, v3, v0}, Ll/xvl;->q0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    :cond_0
    const-string p0, "handleCurrentPlayInfo filtered"

    .line 60
    .line 61
    invoke-static {v2, p0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :cond_1
    iget-object v1, p0, Ll/msn0;->e:Ljava/lang/Runnable;

    .line 66
    .line 67
    invoke-static {v1}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 68
    .line 69
    .line 70
    invoke-static {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->isValid(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;)Z

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    if-eqz v1, :cond_5

    .line 75
    .line 76
    const-string v1, "playInfo is valid"

    .line 77
    .line 78
    invoke-static {v2, v1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->userId:Ljava/lang/String;

    .line 82
    .line 83
    sget-object v3, Ll/zrv;->a:Ll/wrv;

    .line 84
    .line 85
    invoke-virtual {v3}, Ll/wrv;->D0()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v3

    .line 89
    invoke-static {v1, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    if-eqz v1, :cond_3

    .line 94
    .line 95
    iget-object v1, p0, Ll/msn0;->c:Ll/xvl;

    .line 96
    .line 97
    invoke-interface {v1}, Ll/xvl;->getStatus()I

    .line 98
    .line 99
    .line 100
    move-result v1

    .line 101
    invoke-static {v1}, Ll/qd80;->b(I)Z

    .line 102
    .line 103
    .line 104
    move-result v1

    .line 105
    if-eqz v1, :cond_2

    .line 106
    .line 107
    iget-object v1, p0, Ll/msn0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;

    .line 108
    .line 109
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    move-result v1

    .line 113
    if-eqz v1, :cond_2

    .line 114
    .line 115
    iget-object v1, p0, Ll/msn0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;

    .line 116
    .line 117
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;->playInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

    .line 118
    .line 119
    invoke-static {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->isValid(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;)Z

    .line 120
    .line 121
    .line 122
    move-result v1

    .line 123
    if-eqz v1, :cond_2

    .line 124
    .line 125
    iget-object v1, p0, Ll/msn0;->c:Ll/xvl;

    .line 126
    .line 127
    const-string v3, "play new song and stop old "

    .line 128
    .line 129
    invoke-interface {v1, v3}, Ll/xvl;->n0(Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    const-string v1, "stop music before play "

    .line 133
    .line 134
    invoke-static {v2, v1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    :cond_2
    iget-object v1, p0, Ll/msn0;->c:Ll/xvl;

    .line 138
    .line 139
    const/4 v3, 0x1

    .line 140
    invoke-interface {v1, v3}, Ll/xvl;->setStatus(I)V

    .line 141
    .line 142
    .line 143
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 144
    .line 145
    iget-object v3, p0, Ll/msn0;->e:Ljava/lang/Runnable;

    .line 146
    .line 147
    iget-wide v4, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->prepareRemainSeconds:J

    .line 148
    .line 149
    const-wide/16 v6, 0x3e8

    .line 150
    .line 151
    mul-long/2addr v4, v6

    .line 152
    invoke-static {v1, v3, v4, v5}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 153
    .line 154
    .line 155
    iget-object v1, p0, Ll/msn0;->c:Ll/xvl;

    .line 156
    .line 157
    iget-object v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->songCode:Ljava/lang/String;

    .line 158
    .line 159
    iget-object v4, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->songUrl:Ljava/lang/String;

    .line 160
    .line 161
    invoke-interface {v1, v3, v4}, Ll/xvl;->U(Ljava/lang/String;Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    new-instance v1, Ljava/lang/StringBuilder;

    .line 165
    .line 166
    const-string v3, "delay to play music "

    .line 167
    .line 168
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 169
    .line 170
    .line 171
    iget-wide v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->prepareRemainSeconds:J

    .line 172
    .line 173
    invoke-virtual {v1, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 174
    .line 175
    .line 176
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object v1

    .line 180
    invoke-static {v2, v1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 181
    .line 182
    .line 183
    goto :goto_0

    .line 184
    :cond_3
    invoke-virtual {p0}, Ll/msn0;->K()Z

    .line 185
    .line 186
    .line 187
    move-result v1

    .line 188
    if-eqz v1, :cond_4

    .line 189
    .line 190
    iget-object v1, p0, Ll/msn0;->c:Ll/xvl;

    .line 191
    .line 192
    const-string v3, "new singer is not me"

    .line 193
    .line 194
    invoke-interface {v1, v3}, Ll/xvl;->n0(Ljava/lang/String;)V

    .line 195
    .line 196
    .line 197
    :cond_4
    :goto_0
    iget-object v1, p0, Ll/msn0;->c:Ll/xvl;

    .line 198
    .line 199
    iget-object v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->songCode:Ljava/lang/String;

    .line 200
    .line 201
    iget-object v4, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->lyricUrl:Ljava/lang/String;

    .line 202
    .line 203
    iget-object v5, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->lyricType:Ljava/lang/String;

    .line 204
    .line 205
    iget-object v6, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->provider:Ljava/lang/String;

    .line 206
    .line 207
    invoke-interface {v1, v3, v4, v5, v6}, Ll/xvl;->q0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 208
    .line 209
    .line 210
    new-instance v1, Ljava/lang/StringBuilder;

    .line 211
    .line 212
    const-string v3, "songCode:"

    .line 213
    .line 214
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 215
    .line 216
    .line 217
    iget-object v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->songCode:Ljava/lang/String;

    .line 218
    .line 219
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 220
    .line 221
    .line 222
    const-string v3, "\uff0cuseId:"

    .line 223
    .line 224
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 225
    .line 226
    .line 227
    iget-object v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->userId:Ljava/lang/String;

    .line 228
    .line 229
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 230
    .line 231
    .line 232
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 233
    .line 234
    .line 235
    move-result-object v1

    .line 236
    invoke-static {v2, v1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 237
    .line 238
    .line 239
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->orderId:Ljava/lang/String;

    .line 240
    .line 241
    iput-object v0, p0, Ll/msn0;->b:Ljava/lang/String;

    .line 242
    .line 243
    goto :goto_1

    .line 244
    :cond_5
    invoke-virtual {p0}, Ll/msn0;->K()Z

    .line 245
    .line 246
    .line 247
    move-result v0

    .line 248
    if-eqz v0, :cond_6

    .line 249
    .line 250
    iget-object v0, p0, Ll/msn0;->c:Ll/xvl;

    .line 251
    .line 252
    const-string v1, "new song is invalid"

    .line 253
    .line 254
    invoke-interface {v0, v1}, Ll/xvl;->n0(Ljava/lang/String;)V

    .line 255
    .line 256
    .line 257
    :cond_6
    const-string v0, ""

    .line 258
    .line 259
    iput-object v0, p0, Ll/msn0;->b:Ljava/lang/String;

    .line 260
    .line 261
    :goto_1
    iput-object p1, p0, Ll/msn0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;

    .line 262
    .line 263
    return-void
.end method

.method public final H(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;)V
    .locals 3

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->isValid(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Ll/msn0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;->playInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->isValid(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->userId:Ljava/lang/String;

    .line 18
    .line 19
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 20
    .line 21
    invoke-virtual {v1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    iget-object v0, p0, Ll/msn0;->c:Ll/xvl;

    .line 32
    .line 33
    invoke-interface {v0}, Ll/xvl;->getStatus()I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    invoke-static {v0}, Ll/qd80;->b(I)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_1

    .line 42
    .line 43
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->orderId:Ljava/lang/String;

    .line 44
    .line 45
    iget-object v1, p0, Ll/msn0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;

    .line 46
    .line 47
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;->playInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

    .line 48
    .line 49
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->orderId:Ljava/lang/String;

    .line 50
    .line 51
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-eqz v0, :cond_1

    .line 56
    .line 57
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->status:Lcom/p1/mobile/putong/live/base/data/BLiveKtvPlayInfoStatus;

    .line 58
    .line 59
    const-string v1, "pause"

    .line 60
    .line 61
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    const-string v1, "[voice][ktv]"

    .line 66
    .line 67
    if-eqz v0, :cond_0

    .line 68
    .line 69
    iget-object v0, p0, Ll/msn0;->c:Ll/xvl;

    .line 70
    .line 71
    invoke-interface {v0}, Ll/xvl;->getStatus()I

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    const/4 v2, 0x3

    .line 76
    if-ne v0, v2, :cond_0

    .line 77
    .line 78
    iget-object p0, p0, Ll/msn0;->c:Ll/xvl;

    .line 79
    .line 80
    invoke-interface {p0}, Ll/xvl;->pause()V

    .line 81
    .line 82
    .line 83
    const-string p0, "local started,but remote pause"

    .line 84
    .line 85
    invoke-static {v1, p0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    return-void

    .line 89
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->status:Lcom/p1/mobile/putong/live/base/data/BLiveKtvPlayInfoStatus;

    .line 90
    .line 91
    const-string v0, "playing"

    .line 92
    .line 93
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 94
    .line 95
    .line 96
    move-result p1

    .line 97
    if-eqz p1, :cond_1

    .line 98
    .line 99
    iget-object p1, p0, Ll/msn0;->c:Ll/xvl;

    .line 100
    .line 101
    invoke-interface {p1}, Ll/xvl;->getStatus()I

    .line 102
    .line 103
    .line 104
    move-result p1

    .line 105
    const/4 v0, 0x4

    .line 106
    if-ne p1, v0, :cond_1

    .line 107
    .line 108
    iget-object p0, p0, Ll/msn0;->c:Ll/xvl;

    .line 109
    .line 110
    invoke-interface {p0}, Ll/xvl;->resume()V

    .line 111
    .line 112
    .line 113
    const-string p0, "local paused,but remote playing"

    .line 114
    .line 115
    invoke-static {v1, p0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    :cond_1
    return-void
.end method

.method public H0(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/msn0;->L()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/msn0;->q()Ll/rwn0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object p0, p0, Ll/msn0;->b:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v0, p0, p1}, Ll/rqn0;->m(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public I(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "handleKtvGameInfo from"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string p2, ","

    .line 12
    .line 13
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;->toJson()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    const-string v0, "[voice][ktv]"

    .line 28
    .line 29
    invoke-static {v0, p2}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget-object p2, p0, Ll/msn0;->d:Ll/yvl;

    .line 33
    .line 34
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result p2

    .line 38
    if-eqz p2, :cond_0

    .line 39
    .line 40
    iget-object p2, p0, Ll/msn0;->d:Ll/yvl;

    .line 41
    .line 42
    invoke-interface {p2, p1}, Ll/yvl;->t1(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;)V

    .line 43
    .line 44
    .line 45
    :cond_0
    invoke-virtual {p0, p1}, Ll/msn0;->G(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0, p1}, Ll/msn0;->J(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;)V

    .line 49
    .line 50
    .line 51
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;->toast:Ljava/lang/String;

    .line 52
    .line 53
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    if-nez p0, :cond_1

    .line 58
    .line 59
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;->toast:Ljava/lang/String;

    .line 60
    .line 61
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    :cond_1
    return-void
.end method

.method public final J(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;)V
    .locals 5

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;->nextPlayInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->isValid(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;->nextPlayInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

    .line 13
    .line 14
    iget-object v0, p0, Ll/msn0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;

    .line 15
    .line 16
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;->nextPlayInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

    .line 17
    .line 18
    invoke-virtual {p0, v0, p1}, Ll/msn0;->u(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    iget-object v0, p0, Ll/msn0;->c:Ll/xvl;

    .line 26
    .line 27
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->songCode:Ljava/lang/String;

    .line 28
    .line 29
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->lyricUrl:Ljava/lang/String;

    .line 30
    .line 31
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->lyricType:Ljava/lang/String;

    .line 32
    .line 33
    iget-object v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->provider:Ljava/lang/String;

    .line 34
    .line 35
    invoke-interface {v0, v1, v2, v3, v4}, Ll/xvl;->q0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->userId:Ljava/lang/String;

    .line 39
    .line 40
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 41
    .line 42
    invoke-virtual {v1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-eqz v0, :cond_2

    .line 51
    .line 52
    iget-object p0, p0, Ll/msn0;->c:Ll/xvl;

    .line 53
    .line 54
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->songCode:Ljava/lang/String;

    .line 55
    .line 56
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->songUrl:Ljava/lang/String;

    .line 57
    .line 58
    invoke-interface {p0, v0, p1}, Ll/xvl;->U(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    :cond_2
    :goto_0
    return-void
.end method

.method public final K()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/msn0;->c:Ll/xvl;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/xvl;->getStatus()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-static {v0}, Ll/qd80;->b(I)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/msn0;->L()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method public final L()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/msn0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/msn0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;->playInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->isValid(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 20
    .line 21
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget-object p0, p0, Ll/msn0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;->playInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->userId:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-eqz p0, :cond_0

    .line 36
    .line 37
    const/4 p0, 0x1

    .line 38
    return p0

    .line 39
    :cond_0
    const/4 p0, 0x0

    .line 40
    return p0
.end method

.method public final synthetic M(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;)V
    .locals 1

    .line 1
    const-string v0, "long link"

    .line 2
    .line 3
    invoke-virtual {p0, p1, v0}, Ll/msn0;->I(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic N(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/msn0;->K()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final synthetic P(Landroid/net/NetworkInfo;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/msn0;->q()Ll/rwn0;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ll/vp20;->k()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {p1}, Ll/rqn0;->h(Ljava/lang/String;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-direct {p0, p1}, Ll/msn0;->t(Lrx/c;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public final synthetic Q(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;)V
    .locals 1

    .line 1
    const-string v0, "http"

    .line 2
    .line 3
    invoke-virtual {p0, p1, v0}, Ll/msn0;->I(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public R()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/msn0;->K()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/msn0;->c:Ll/xvl;

    .line 8
    .line 9
    invoke-interface {v0}, Ll/xvl;->pause()V

    .line 10
    .line 11
    .line 12
    :cond_0
    invoke-virtual {p0}, Ll/msn0;->q()Ll/rwn0;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget-object v1, p0, Ll/msn0;->b:Ljava/lang/String;

    .line 21
    .line 22
    sget-object v2, Ll/qd80;->i:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {v0, v1, v2}, Ll/rqn0;->l(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-direct {p0, v0}, Ll/msn0;->t(Lrx/c;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    new-instance v0, Ll/bsn0;

    .line 33
    .line 34
    invoke-direct {v0}, Ll/bsn0;-><init>()V

    .line 35
    .line 36
    .line 37
    new-instance v1, Ll/wnt;

    .line 38
    .line 39
    invoke-direct {v1}, Ll/wnt;-><init>()V

    .line 40
    .line 41
    .line 42
    invoke-static {v0, v1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public S(Ll/dn50;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/msn0;->c:Ll/xvl;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/xvl;->j0(Ll/dn50;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public T(Ll/dn50;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/msn0;->c:Ll/xvl;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/xvl;->J0(Ll/dn50;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public U()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/msn0;->K()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/msn0;->c:Ll/xvl;

    .line 8
    .line 9
    invoke-interface {v0}, Ll/xvl;->resume()V

    .line 10
    .line 11
    .line 12
    :cond_0
    invoke-virtual {p0}, Ll/msn0;->q()Ll/rwn0;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget-object v1, p0, Ll/msn0;->b:Ljava/lang/String;

    .line 21
    .line 22
    sget-object v2, Ll/qd80;->j:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {v0, v1, v2}, Ll/rqn0;->l(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-direct {p0, v0}, Ll/msn0;->t(Lrx/c;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    new-instance v0, Ll/asn0;

    .line 33
    .line 34
    invoke-direct {v0}, Ll/asn0;-><init>()V

    .line 35
    .line 36
    .line 37
    new-instance v1, Ll/wnt;

    .line 38
    .line 39
    invoke-direct {v1}, Ll/wnt;-><init>()V

    .line 40
    .line 41
    .line 42
    invoke-static {v0, v1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public V(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/msn0;->c:Ll/xvl;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/xvl;->h(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public W(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/msn0;->c:Ll/xvl;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-interface {p0, p1, v0}, Ll/xvl;->M0(Ljava/lang/Boolean;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public X(Ll/yvl;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/msn0;->d:Ll/yvl;

    .line 2
    .line 3
    return-void
.end method

.method public Y(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/msn0;->c:Ll/xvl;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/xvl;->H(Ljava/lang/Boolean;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public Z()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/msn0;->c:Ll/xvl;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/xvl;->init()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/msn0;->c:Ll/xvl;

    .line 7
    .line 8
    invoke-interface {v0, p0}, Ll/xvl;->j0(Ll/dn50;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/msn0;->q()Ll/rwn0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Ll/aj1;->B0()Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-direct {p0, v0}, Ll/msn0;->t(Lrx/c;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v1, Ll/zrn0;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Ll/zrn0;-><init>(Ll/msn0;)V

    .line 30
    .line 31
    .line 32
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Ll/msn0;->q()Ll/rwn0;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0}, Ll/rwn0;->Z2()Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-direct {p0, v0}, Ll/msn0;->t(Lrx/c;)Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    new-instance v1, Ll/dsn0;

    .line 52
    .line 53
    invoke-direct {v1}, Ll/dsn0;-><init>()V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0, v1}, Lrx/c;->distinctUntilChanged(Ll/qcj;)Lrx/c;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    new-instance v1, Ll/esn0;

    .line 61
    .line 62
    invoke-direct {v1}, Ll/esn0;-><init>()V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    new-instance v1, Ll/fsn0;

    .line 70
    .line 71
    invoke-direct {v1, p0}, Ll/fsn0;-><init>(Ll/msn0;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    new-instance v1, Ll/gsn0;

    .line 79
    .line 80
    invoke-direct {v1, p0}, Ll/gsn0;-><init>(Ll/msn0;)V

    .line 81
    .line 82
    .line 83
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 88
    .line 89
    .line 90
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->m()Lrx/c;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    invoke-direct {p0, v0}, Ll/msn0;->t(Lrx/c;)Lrx/c;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    const/4 v1, 0x1

    .line 99
    invoke-virtual {v0, v1}, Lrx/c;->skip(I)Lrx/c;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    new-instance v1, Ll/hsn0;

    .line 108
    .line 109
    invoke-direct {v1}, Ll/hsn0;-><init>()V

    .line 110
    .line 111
    .line 112
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    new-instance v1, Ll/isn0;

    .line 117
    .line 118
    invoke-direct {v1, p0}, Ll/isn0;-><init>(Ll/msn0;)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    new-instance v1, Ll/jsn0;

    .line 126
    .line 127
    invoke-direct {v1, p0}, Ll/jsn0;-><init>(Ll/msn0;)V

    .line 128
    .line 129
    .line 130
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 135
    .line 136
    .line 137
    invoke-virtual {p0}, Ll/msn0;->q()Ll/rwn0;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    invoke-virtual {v0}, Ll/rwn0;->Z2()Lrx/c;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    invoke-direct {p0, v0}, Ll/msn0;->t(Lrx/c;)Lrx/c;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    new-instance v1, Ll/ksn0;

    .line 150
    .line 151
    invoke-direct {v1}, Ll/ksn0;-><init>()V

    .line 152
    .line 153
    .line 154
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    new-instance v1, Ll/lsn0;

    .line 163
    .line 164
    invoke-direct {v1, p0}, Ll/lsn0;-><init>(Ll/msn0;)V

    .line 165
    .line 166
    .line 167
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 168
    .line 169
    .line 170
    move-result-object p0

    .line 171
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 172
    .line 173
    .line 174
    return-void
.end method

.method public n(Ljava/lang/Float;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/msn0;->c:Ll/xvl;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    invoke-interface {p0, p1}, Ll/xvl;->E0(F)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public o(Ljava/lang/Float;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/msn0;->c:Ll/xvl;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    invoke-interface {p0, p1}, Ll/xvl;->P0(F)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final p(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object p0, p0, Ll/msn0;->c:Ll/xvl;

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-interface {p0, p1, v0}, Ll/xvl;->M0(Ljava/lang/Boolean;Z)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-interface {p0}, Ll/xvl;->h0()Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    const/4 v0, 0x1

    .line 25
    invoke-interface {p0, p1, v0}, Ll/xvl;->M0(Ljava/lang/Boolean;Z)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final q()Ll/rwn0;
    .locals 3

    .line 1
    iget-object p0, p0, Ll/msn0;->d:Ll/yvl;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    new-instance p0, Ll/rwn0;

    .line 6
    .line 7
    new-instance v0, Ll/szn0;

    .line 8
    .line 9
    invoke-direct {v0}, Ll/szn0;-><init>()V

    .line 10
    .line 11
    .line 12
    new-instance v1, Ll/ajt;

    .line 13
    .line 14
    const-string v2, ""

    .line 15
    .line 16
    invoke-direct {v1, v2}, Ll/ajt;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-direct {p0, v0, v1}, Ll/rwn0;-><init>(Ll/szn0;Ll/ajt;)V

    .line 20
    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_0
    invoke-interface {p0}, Ll/yvl;->Y1()Ll/rwn0;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public r(Z)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "KTV detach \uff1a"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "[voice][ktv]"

    .line 16
    .line 17
    invoke-static {v1, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    if-eqz p1, :cond_2

    .line 21
    .line 22
    iget-object p1, p0, Ll/msn0;->e:Ljava/lang/Runnable;

    .line 23
    .line 24
    invoke-static {p1}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Ll/msn0;->c:Ll/xvl;

    .line 28
    .line 29
    invoke-interface {p1, p0}, Ll/xvl;->J0(Ll/dn50;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Ll/msn0;->q()Ll/rwn0;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p1}, Ll/rwn0;->P2()Ll/hrk0;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 41
    .line 42
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {p1, v0}, Ll/hrk0;->m(Ljava/lang/String;)Ll/nsv;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-static {p1}, Ll/l6o0;->c(Ll/nsv;)Ll/l6o0;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-virtual {p1}, Ll/l6o0;->d()Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-eqz v0, :cond_0

    .line 59
    .line 60
    iget-object p1, p1, Ll/l6o0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 61
    .line 62
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;

    .line 63
    .line 64
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;->frameConfig:Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;

    .line 65
    .line 66
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->checkNeedChangeVoice()Z

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    if-eqz p1, :cond_0

    .line 71
    .line 72
    iget-object p1, p0, Ll/msn0;->c:Ll/xvl;

    .line 73
    .line 74
    const/4 v0, 0x0

    .line 75
    invoke-interface {p1, v0}, Ll/xvl;->H0(Z)V

    .line 76
    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_0
    iget-object p1, p0, Ll/msn0;->c:Ll/xvl;

    .line 80
    .line 81
    const/4 v0, 0x1

    .line 82
    invoke-interface {p1, v0}, Ll/xvl;->H0(Z)V

    .line 83
    .line 84
    .line 85
    :goto_0
    iget-object p1, p0, Ll/msn0;->c:Ll/xvl;

    .line 86
    .line 87
    const/high16 v0, 0x3f800000    # 1.0f

    .line 88
    .line 89
    invoke-interface {p1, v0}, Ll/xvl;->E0(F)V

    .line 90
    .line 91
    .line 92
    iget-object p1, p0, Ll/msn0;->c:Ll/xvl;

    .line 93
    .line 94
    invoke-virtual {p0}, Ll/msn0;->q()Ll/rwn0;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    invoke-virtual {v1}, Ll/rwn0;->Y2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    invoke-static {v1}, Ll/guk0;->g(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 103
    .line 104
    .line 105
    move-result v1

    .line 106
    if-eqz v1, :cond_1

    .line 107
    .line 108
    const/4 v0, 0x0

    .line 109
    :cond_1
    invoke-interface {p1, v0}, Ll/xvl;->P0(F)V

    .line 110
    .line 111
    .line 112
    const/4 p1, 0x0

    .line 113
    iput-object p1, p0, Ll/msn0;->d:Ll/yvl;

    .line 114
    .line 115
    return-void

    .line 116
    :cond_2
    iget-object p1, p0, Ll/msn0;->c:Ll/xvl;

    .line 117
    .line 118
    invoke-interface {p1}, Ll/xvl;->O0()V

    .line 119
    .line 120
    .line 121
    iget-object p1, p0, Ll/msn0;->c:Ll/xvl;

    .line 122
    .line 123
    invoke-interface {p1, p0}, Ll/xvl;->j0(Ll/dn50;)V

    .line 124
    .line 125
    .line 126
    return-void
.end method

.method public s0()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/msn0;->L()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Ll/msn0;->c:Ll/xvl;

    .line 8
    .line 9
    iget-object v1, p0, Ll/msn0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;

    .line 10
    .line 11
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;->playInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

    .line 12
    .line 13
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->songCode:Ljava/lang/String;

    .line 14
    .line 15
    invoke-interface {v0, v1}, Ll/xvl;->p0(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Ll/msn0;->q()Ll/rwn0;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    invoke-virtual {p0}, Ll/msn0;->q()Ll/rwn0;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iget-object v1, p0, Ll/msn0;->b:Ljava/lang/String;

    .line 37
    .line 38
    sget-object v2, Ll/qd80;->g:Ljava/lang/String;

    .line 39
    .line 40
    invoke-static {v0, v1, v2}, Ll/rqn0;->l(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 41
    .line 42
    .line 43
    :cond_0
    iget-object v0, p0, Ll/msn0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;

    .line 44
    .line 45
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;->playInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

    .line 46
    .line 47
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->status:Lcom/p1/mobile/putong/live/base/data/BLiveKtvPlayInfoStatus;

    .line 48
    .line 49
    const-string v1, "pause"

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/data/BLiveKtvPlayInfoStatus;->equals(Ljava/lang/String;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-eqz v0, :cond_1

    .line 56
    .line 57
    iget-object p0, p0, Ll/msn0;->c:Ll/xvl;

    .line 58
    .line 59
    invoke-interface {p0}, Ll/xvl;->pause()V

    .line 60
    .line 61
    .line 62
    :cond_1
    return-void
.end method

.method public final u(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;)Z
    .locals 2

    .line 1
    invoke-static {p1, p2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x1

    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    return v0

    .line 9
    :cond_0
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->isValid(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-nez p0, :cond_1

    .line 14
    .line 15
    invoke-static {p2}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->isValid(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-nez p0, :cond_1

    .line 20
    .line 21
    return v0

    .line 22
    :cond_1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    if-eqz p0, :cond_2

    .line 27
    .line 28
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    if-eqz p0, :cond_2

    .line 33
    .line 34
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->songCode:Ljava/lang/String;

    .line 35
    .line 36
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->songCode:Ljava/lang/String;

    .line 37
    .line 38
    invoke-static {p0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    if-eqz p0, :cond_2

    .line 43
    .line 44
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->orderId:Ljava/lang/String;

    .line 45
    .line 46
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->orderId:Ljava/lang/String;

    .line 47
    .line 48
    invoke-static {p0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    if-eqz p0, :cond_2

    .line 53
    .line 54
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->userId:Ljava/lang/String;

    .line 55
    .line 56
    iget-object p1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->userId:Ljava/lang/String;

    .line 57
    .line 58
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    if-eqz p0, :cond_2

    .line 63
    .line 64
    return v0

    .line 65
    :cond_2
    const/4 p0, 0x0

    .line 66
    return p0
.end method

.method public v()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/msn0;->c:Ll/xvl;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/xvl;->G0()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public w()Ljava/lang/Long;
    .locals 2

    .line 1
    iget-object p0, p0, Ll/msn0;->c:Ll/xvl;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/xvl;->w()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public x()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/msn0;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public y()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/msn0;->c:Ll/xvl;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/xvl;->h0()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public z()Ljava/lang/Long;
    .locals 2

    .line 1
    iget-object p0, p0, Ll/msn0;->c:Ll/xvl;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/xvl;->c()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method
