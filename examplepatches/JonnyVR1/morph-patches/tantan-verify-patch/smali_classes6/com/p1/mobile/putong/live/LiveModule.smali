.class public Lcom/p1/mobile/putong/live/LiveModule;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tantanapp/putong/module/Module;


# annotations
.annotation build Lcom/tantanapp/android/injecter/facade/annotation/Route;
    name = "me_"
    path = "/live_module/module"
.end annotation


# static fields
.field public static h:Landroid/app/Application;

.field public static i:Ll/h8s;


# instance fields
.field public a:Ll/tbs;

.field public b:Ll/zrv;

.field public c:Z

.field public d:Ll/meu;

.field public e:Ll/p6s;

.field public f:Z

.field public g:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/LiveModule;->c:Z

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/LiveModule;->f:Z

    .line 9
    .line 10
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/LiveModule;->g:Z

    .line 11
    .line 12
    return-void
.end method

.method public static synthetic F(Lcom/p1/mobile/putong/live/LiveModule;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/LiveModule;->d0(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic H(Lcom/p1/mobile/putong/live/LiveModule;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/LiveModule;->b0()V

    return-void
.end method

.method public static synthetic J(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/ppi0;->l()Ll/ppi0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Ll/ppi0;->g(Lcom/p1/mobile/android/app/Act;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic K()V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveData;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic L(Lcom/p1/mobile/putong/live/base/data/BLiveSettings;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/ppi0;->l()Ll/ppi0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Ll/ppi0;->v(Lcom/p1/mobile/putong/live/base/data/BLiveSettings;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic M(Lcom/p1/mobile/putong/live/LiveModule;ZLl/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/LiveModule;->e0(ZLl/uxj0;)V

    return-void
.end method

.method public static synthetic N(Ll/vwt;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/mof0;->k()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lrx/c;->subscribe()Ll/kcg0;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic P(Lcom/p1/mobile/putong/live/LiveModule;Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/LiveModule;->V(Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;)V

    return-void
.end method

.method public static synthetic Q(Lcom/p1/mobile/putong/live/LiveModule;Ll/vwt;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/LiveModule;->c0(Ll/vwt;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic R(Lcom/p1/mobile/putong/live/LiveModule;Landroid/net/NetworkInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/LiveModule;->f0(Landroid/net/NetworkInfo;)V

    return-void
.end method

.method public static synthetic S(Lcom/p1/mobile/putong/live/LiveModule;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/LiveModule;->g0()V

    return-void
.end method


# virtual methods
.method public Ai()V
    .locals 0

    .line 1
    return-void
.end method

.method public Ec()V
    .locals 0

    .line 1
    new-instance p0, Ll/mqr;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/mqr;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p0}, Lcom/p1/mobile/putong/api/ABManager;->R(Lcom/p1/mobile/putong/api/ABManager$d;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public Jh()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/LiveModule;->d:Ll/meu;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/meu;->e()V

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-static {}, Ll/nsh0;->i()V

    .line 9
    .line 10
    .line 11
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 12
    .line 13
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public Ma()V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/live/LiveModule;->i:Ll/h8s;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/h8s;->i()V

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-static {}, Ll/l9c;->o()Ll/l9c;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    new-instance v0, Ll/h8s;

    .line 13
    .line 14
    invoke-direct {v0}, Ll/h8s;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, v0}, Ll/l9c;->y(Ll/h9c;)V

    .line 18
    .line 19
    .line 20
    sput-object v0, Lcom/p1/mobile/putong/live/LiveModule;->i:Ll/h8s;

    .line 21
    .line 22
    return-void
.end method

.method public Qh()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/LiveModule;->h:Landroid/app/Application;

    .line 2
    .line 3
    sput-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 4
    .line 5
    new-instance v0, Ll/v5t;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/v5t;-><init>()V

    .line 8
    .line 9
    .line 10
    const-string v1, "tantan_live"

    .line 11
    .line 12
    invoke-static {v1, v0}, Ll/w0c;->O(Ljava/lang/String;Ll/scj;)V

    .line 13
    .line 14
    .line 15
    invoke-static {}, Ll/cqq;->e()Ll/cqq;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-class v1, Lcom/p1/mobile/putong/live/LiveBridgeImpl;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ll/cqq;->h(Ljava/lang/Class;)V

    .line 22
    .line 23
    .line 24
    invoke-static {}, Ll/cqq;->e()Ll/cqq;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const-class v1, Lcom/p1/mobile/putong/live/base/webview/LiveCameraBridgeImplementation;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ll/cqq;->h(Ljava/lang/Class;)V

    .line 31
    .line 32
    .line 33
    invoke-static {}, Ll/odt;->j()V

    .line 34
    .line 35
    .line 36
    invoke-static {}, Ll/ujt;->c()V

    .line 37
    .line 38
    .line 39
    sget-object v0, Lcom/p1/mobile/putong/live/LiveModule;->h:Landroid/app/Application;

    .line 40
    .line 41
    invoke-static {v0}, Lcom/p1/mobile/putong/live/external/square/home/LiveLocaleChangedReceiver;->register(Landroid/content/Context;)V

    .line 42
    .line 43
    .line 44
    invoke-static {}, Ll/fss;->r()V

    .line 45
    .line 46
    .line 47
    invoke-static {}, Ll/yw0;->a()Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_0

    .line 52
    .line 53
    return-void

    .line 54
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/LiveModule;->Y()Ll/tbs;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {p0}, Ll/tbs;->h()V

    .line 59
    .line 60
    .line 61
    invoke-static {}, Ll/vxr;->f()Ll/vxr;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {p0}, Ll/vxr;->b()V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public final T()V
    .locals 2

    .line 1
    sget-object v0, Ll/uqb0;->h0:Lcom/p1/mobile/putong/data/LiveRegionTag;

    .line 2
    .line 3
    const-string v1, "unknown_"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    xor-int/lit8 v0, v0, 0x1

    .line 10
    .line 11
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/LiveModule;->f:Z

    .line 12
    .line 13
    return-void
.end method

.method public final V(Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;->switches:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;->realtime:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitch;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitch;->on:Z

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitch;->config:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitchConfig;

    .line 16
    .line 17
    :try_start_0
    sget-object v0, Lcom/p1/mobile/putong/live/LiveModule;->h:Landroid/app/Application;

    .line 18
    .line 19
    sget-object v1, Ll/zrv;->f:Ll/f2d0;

    .line 20
    .line 21
    invoke-static {v0, p1, v1}, Ll/nsh0;->d(Landroid/app/Application;Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitchConfig;Ll/x4m;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :catch_0
    move-exception v0

    .line 26
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 27
    .line 28
    .line 29
    :goto_0
    new-instance v0, Ll/meu;

    .line 30
    .line 31
    invoke-direct {v0, p1}, Ll/meu;-><init>(Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitchConfig;)V

    .line 32
    .line 33
    .line 34
    iput-object v0, p0, Lcom/p1/mobile/putong/live/LiveModule;->d:Ll/meu;

    .line 35
    .line 36
    :cond_0
    return-void
.end method

.method public final W(Z)V
    .locals 6

    .line 1
    invoke-static {}, Ll/yw0;->a()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/LiveModule;->c:Z

    .line 6
    .line 7
    const-string v2, " , and newSignIn is "

    .line 8
    .line 9
    const-string v3, "LiveModule.ensureApi(). initApi is "

    .line 10
    .line 11
    const-string v4, "[live]living_room"

    .line 12
    .line 13
    const/4 v5, 0x1

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    new-instance v0, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-static {v4, v0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/LiveModule;->c:Z

    .line 38
    .line 39
    if-eqz v0, :cond_0

    .line 40
    .line 41
    if-eqz p1, :cond_3

    .line 42
    .line 43
    :cond_0
    iput-boolean v5, p0, Lcom/p1/mobile/putong/live/LiveModule;->c:Z

    .line 44
    .line 45
    new-instance p1, Ll/vwt;

    .line 46
    .line 47
    sget-object v0, Lcom/p1/mobile/putong/live/LiveModule;->h:Landroid/app/Application;

    .line 48
    .line 49
    new-instance v1, Ll/s5t;

    .line 50
    .line 51
    invoke-direct {v1}, Ll/s5t;-><init>()V

    .line 52
    .line 53
    .line 54
    invoke-direct {p1, v0, v1}, Ll/vwt;-><init>(Landroid/content/Context;Ll/y20;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/LiveModule;->Y()Ll/tbs;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-virtual {v0, p1}, Ll/tbs;->j(Ll/vwt;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/LiveModule;->Z()Ll/zrv;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {v0, p1}, Ll/zrv;->i(Ll/vwt;)V

    .line 69
    .line 70
    .line 71
    invoke-static {}, Lcom/p1/mobile/putong/api/ABManager;->q()Lrx/c;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {v0, v5}, Lrx/c;->take(I)Lrx/c;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    new-instance v1, Ll/t5t;

    .line 80
    .line 81
    invoke-direct {v1, p0, p1}, Ll/t5t;-><init>(Lcom/p1/mobile/putong/live/LiveModule;Ll/vwt;)V

    .line 82
    .line 83
    .line 84
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 89
    .line 90
    .line 91
    return-void

    .line 92
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 93
    .line 94
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    invoke-static {v4, v0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/LiveModule;->c:Z

    .line 114
    .line 115
    if-eqz v0, :cond_2

    .line 116
    .line 117
    if-eqz p1, :cond_3

    .line 118
    .line 119
    :cond_2
    iput-boolean v5, p0, Lcom/p1/mobile/putong/live/LiveModule;->c:Z

    .line 120
    .line 121
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/LiveModule;->Y()Ll/tbs;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    invoke-virtual {v0, p1}, Ll/tbs;->k(Z)V

    .line 126
    .line 127
    .line 128
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/LiveModule;->Z()Ll/zrv;

    .line 129
    .line 130
    .line 131
    move-result-object p1

    .line 132
    invoke-virtual {p1}, Ll/zrv;->h()V

    .line 133
    .line 134
    .line 135
    invoke-static {}, Lcom/p1/mobile/putong/api/ABManager;->q()Lrx/c;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    invoke-virtual {p1, v5}, Lrx/c;->take(I)Lrx/c;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    new-instance v0, Ll/u5t;

    .line 144
    .line 145
    invoke-direct {v0, p0}, Ll/u5t;-><init>(Lcom/p1/mobile/putong/live/LiveModule;)V

    .line 146
    .line 147
    .line 148
    invoke-static {v0}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 153
    .line 154
    .line 155
    iget-object p0, p0, Lcom/p1/mobile/putong/live/LiveModule;->e:Ll/p6s;

    .line 156
    .line 157
    if-eqz p0, :cond_3

    .line 158
    .line 159
    invoke-virtual {p0}, Ll/mof0;->z()Lrx/c;

    .line 160
    .line 161
    .line 162
    :cond_3
    return-void
.end method

.method public Wn()V
    .locals 1

    .line 1
    invoke-static {}, Ll/yw0;->a()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ll/p5t;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/p5t;-><init>(Lcom/p1/mobile/putong/live/LiveModule;)V

    .line 10
    .line 11
    .line 12
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public final X(Z)V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "LiveModule.ensureApi(). initApi is "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/LiveModule;->c:Z

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " , and newSignIn is "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "[live]living_room"

    .line 26
    .line 27
    invoke-static {v1, v0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/LiveModule;->c:Z

    .line 31
    .line 32
    if-eqz v0, :cond_3

    .line 33
    .line 34
    if-eqz p1, :cond_0

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    iget-boolean p1, p0, Lcom/p1/mobile/putong/live/LiveModule;->f:Z

    .line 38
    .line 39
    if-nez p1, :cond_2

    .line 40
    .line 41
    sget-object p1, Ll/uqb0;->h0:Lcom/p1/mobile/putong/data/LiveRegionTag;

    .line 42
    .line 43
    const-string v0, "unknown_"

    .line 44
    .line 45
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    if-eqz p1, :cond_1

    .line 50
    .line 51
    sget-object p1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 52
    .line 53
    new-instance v0, Ll/r5t;

    .line 54
    .line 55
    invoke-direct {v0, p0}, Ll/r5t;-><init>(Lcom/p1/mobile/putong/live/LiveModule;)V

    .line 56
    .line 57
    .line 58
    const-wide/16 v1, 0xc8

    .line 59
    .line 60
    invoke-static {p1, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/LiveModule;->g0()V

    .line 65
    .line 66
    .line 67
    :cond_2
    return-void

    .line 68
    :cond_3
    :goto_0
    const/4 v0, 0x1

    .line 69
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/LiveModule;->c:Z

    .line 70
    .line 71
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/LiveModule;->a0(Z)V

    .line 72
    .line 73
    .line 74
    invoke-static {}, Lcom/p1/mobile/putong/api/ABManager;->q()Lrx/c;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    invoke-virtual {v1, v0}, Lrx/c;->take(I)Lrx/c;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    new-instance v1, Ll/q5t;

    .line 83
    .line 84
    invoke-direct {v1, p0, p1}, Ll/q5t;-><init>(Lcom/p1/mobile/putong/live/LiveModule;Z)V

    .line 85
    .line 86
    .line 87
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    invoke-virtual {v0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 92
    .line 93
    .line 94
    iget-object p1, p0, Lcom/p1/mobile/putong/live/LiveModule;->e:Ll/p6s;

    .line 95
    .line 96
    if-eqz p1, :cond_4

    .line 97
    .line 98
    invoke-virtual {p1}, Ll/mof0;->z()Lrx/c;

    .line 99
    .line 100
    .line 101
    :cond_4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/LiveModule;->T()V

    .line 102
    .line 103
    .line 104
    return-void
.end method

.method public final Y()Ll/tbs;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/LiveModule;->a:Ll/tbs;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/tbs;

    .line 6
    .line 7
    sget-object v1, Lcom/p1/mobile/putong/live/LiveModule;->h:Landroid/app/Application;

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ll/tbs;-><init>(Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/live/LiveModule;->a:Ll/tbs;

    .line 13
    .line 14
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/LiveModule;->a:Ll/tbs;

    .line 15
    .line 16
    return-object p0
.end method

.method public final Z()Ll/zrv;
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/LiveModule;->b:Ll/zrv;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/zrv;

    .line 6
    .line 7
    new-instance v1, Ll/wrv;

    .line 8
    .line 9
    new-instance v2, Ll/lrf;

    .line 10
    .line 11
    invoke-direct {v2}, Ll/lrf;-><init>()V

    .line 12
    .line 13
    .line 14
    new-instance v3, Ll/grf;

    .line 15
    .line 16
    invoke-direct {v3}, Ll/grf;-><init>()V

    .line 17
    .line 18
    .line 19
    new-instance v4, Ll/arf;

    .line 20
    .line 21
    invoke-direct {v4}, Ll/arf;-><init>()V

    .line 22
    .line 23
    .line 24
    new-instance v5, Ll/irf;

    .line 25
    .line 26
    invoke-direct {v5}, Ll/irf;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-direct {v1, v2, v3, v4, v5}, Ll/wrv;-><init>(Ll/krf;Ll/frf;Ll/zqf;Ll/hrf;)V

    .line 30
    .line 31
    .line 32
    invoke-direct {v0, v1}, Ll/zrv;-><init>(Ll/wrv;)V

    .line 33
    .line 34
    .line 35
    iput-object v0, p0, Lcom/p1/mobile/putong/live/LiveModule;->b:Ll/zrv;

    .line 36
    .line 37
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/LiveModule;->b:Ll/zrv;

    .line 38
    .line 39
    return-object p0
.end method

.method public final a0(Z)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/LiveModule;->Y()Ll/tbs;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p1}, Ll/tbs;->k(Z)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/LiveModule;->Z()Ll/zrv;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Ll/zrv;->h()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic b0()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/LiveModule;->Y()Ll/tbs;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/tbs;->i()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/LiveModule;->Z()Ll/zrv;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Ll/zrv;->e()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic c0(Ll/vwt;Ll/uxj0;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/mqr;->l()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    const-string p2, "[live]living_room"

    .line 8
    .line 9
    const-string v0, "LiveModule.ensureApi(). After ABManager. LiveAbController.isLiveEnable() is true"

    .line 10
    .line 11
    invoke-static {p2, v0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-boolean p2, p0, Lcom/p1/mobile/putong/live/LiveModule;->g:Z

    .line 15
    .line 16
    if-eqz p2, :cond_0

    .line 17
    .line 18
    const/4 p2, 0x0

    .line 19
    iput-boolean p2, p0, Lcom/p1/mobile/putong/live/LiveModule;->g:Z

    .line 20
    .line 21
    invoke-static {}, Ll/srf;->a()Ll/srf;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    sget-object p2, Lcom/p1/mobile/android/app/ExtraActLifecycle;->onInitDataOnCreate:Lcom/p1/mobile/android/app/ExtraActLifecycle;

    .line 26
    .line 27
    new-instance v0, Ll/l5t;

    .line 28
    .line 29
    invoke-direct {v0}, Ll/l5t;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, p2, v0}, Ll/srf;->b(Lcom/p1/mobile/android/app/ExtraActLifecycle;Ll/y20;)V

    .line 33
    .line 34
    .line 35
    new-instance p0, Ll/m5t;

    .line 36
    .line 37
    invoke-direct {p0, p1}, Ll/m5t;-><init>(Ll/vwt;)V

    .line 38
    .line 39
    .line 40
    invoke-static {p0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 41
    .line 42
    .line 43
    :cond_0
    return-void
.end method

.method public final synthetic d0(Ll/uxj0;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/mqr;->l()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    const-string p1, "[live]living_room"

    .line 8
    .line 9
    const-string v0, "LiveModule.ensureApi(). After ABManager. LiveAbController.isLiveEnable() is true"

    .line 10
    .line 11
    invoke-static {p1, v0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/LiveModule;->Y()Ll/tbs;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, Ll/tbs;->g()V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public final synthetic e0(ZLl/uxj0;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/mqr;->l()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_1

    .line 6
    .line 7
    sget-boolean p2, Ll/tbs;->c:Z

    .line 8
    .line 9
    if-nez p2, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/LiveModule;->a0(Z)V

    .line 12
    .line 13
    .line 14
    :cond_0
    const-string p1, "[live]living_room"

    .line 15
    .line 16
    const-string p2, "LiveModule.ensureApi(). After ABManager. LiveAbController.isLiveEnable() is true"

    .line 17
    .line 18
    invoke-static {p1, p2}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/LiveModule;->Y()Ll/tbs;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Ll/tbs;->g()V

    .line 26
    .line 27
    .line 28
    :cond_1
    return-void
.end method

.method public final synthetic f0(Landroid/net/NetworkInfo;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/LiveModule;->e:Ll/p6s;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/mof0;->z()Lrx/c;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public ft()Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/yw0;->a()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 8
    .line 9
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_0
    const/4 v0, 0x1

    .line 15
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_1

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/LiveModule;->W(Z)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/LiveModule;->X(Z)V

    .line 26
    .line 27
    .line 28
    :goto_0
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 29
    .line 30
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0
.end method

.method public final g0()V
    .locals 0

    .line 1
    invoke-static {}, Ll/tbs;->p()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/LiveModule;->T()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public getContext()Landroid/content/Context;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/live/LiveModule;->h:Landroid/app/Application;

    .line 2
    .line 3
    return-object p0
.end method

.method public init(Landroid/content/Context;)V
    .locals 4

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Landroid/app/Application;

    .line 3
    .line 4
    sput-object v0, Lcom/p1/mobile/putong/live/LiveModule;->h:Landroid/app/Application;

    .line 5
    .line 6
    invoke-static {v0}, Ll/xau;->D(Landroid/app/Application;)V

    .line 7
    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 10
    .line 11
    invoke-static {}, Ll/mbs;->q()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    const-string v2, "bafc9b2dac43efae663ff86726e4863f"

    .line 16
    .line 17
    const/4 v3, 0x1

    .line 18
    invoke-static {v0, v1, v2, v3}, Lcom/momo/xeengine/XEnginePreferences;->initSDK(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 19
    .line 20
    .line 21
    new-instance v0, Ll/p6s;

    .line 22
    .line 23
    new-instance v1, Ll/k5t;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/k5t;-><init>(Lcom/p1/mobile/putong/live/LiveModule;)V

    .line 26
    .line 27
    .line 28
    invoke-direct {v0, p1, v1}, Ll/p6s;-><init>(Landroid/content/Context;Ll/y20;)V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Lcom/p1/mobile/putong/live/LiveModule;->e:Ll/p6s;

    .line 32
    .line 33
    invoke-virtual {v0}, Ll/mof0;->k()Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p1}, Lrx/c;->subscribe()Ll/kcg0;

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Lcom/p1/mobile/putong/live/LiveModule;->e:Ll/p6s;

    .line 41
    .line 42
    invoke-virtual {p1}, Ll/mof0;->z()Lrx/c;

    .line 43
    .line 44
    .line 45
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->m()Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-virtual {p1, v3}, Lrx/c;->skip(I)Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-virtual {p1}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    new-instance v0, Ll/n5t;

    .line 58
    .line 59
    invoke-direct {v0, p0}, Ll/n5t;-><init>(Lcom/p1/mobile/putong/live/LiveModule;)V

    .line 60
    .line 61
    .line 62
    invoke-static {v0}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/LiveModule;->Y()Ll/tbs;

    .line 70
    .line 71
    .line 72
    sget-object p1, Lcom/p1/mobile/putong/live/LiveModule;->h:Landroid/app/Application;

    .line 73
    .line 74
    new-instance v0, Ll/jrf;

    .line 75
    .line 76
    invoke-direct {v0}, Ll/jrf;-><init>()V

    .line 77
    .line 78
    .line 79
    iget-object v1, p0, Lcom/p1/mobile/putong/live/LiveModule;->e:Ll/p6s;

    .line 80
    .line 81
    invoke-static {p1, v0, v1}, Ll/vxr;->j(Landroid/content/Context;Ll/dyr;Ll/p6s;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/LiveModule;->Z()Ll/zrv;

    .line 85
    .line 86
    .line 87
    new-instance p0, Ll/o5t;

    .line 88
    .line 89
    invoke-direct {p0}, Ll/o5t;-><init>()V

    .line 90
    .line 91
    .line 92
    invoke-static {p0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method public ms()V
    .locals 1

    .line 1
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/sre0;->c:Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 4
    .line 5
    check-cast v0, Lcom/p1/mobile/putong/live/LiveServiceImpl;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/LiveServiceImpl;->release()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/LiveModule;->Z()Ll/zrv;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/zrv;->q()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/LiveModule;->Y()Ll/tbs;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Ll/tbs;->o()V

    .line 22
    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    iput-object v0, p0, Lcom/p1/mobile/putong/live/LiveModule;->a:Ll/tbs;

    .line 26
    .line 27
    iput-object v0, p0, Lcom/p1/mobile/putong/live/LiveModule;->b:Ll/zrv;

    .line 28
    .line 29
    const/4 v0, 0x0

    .line 30
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/LiveModule;->c:Z

    .line 31
    .line 32
    return-void
.end method

.method public tr(Z)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/LiveModule;->W(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method
