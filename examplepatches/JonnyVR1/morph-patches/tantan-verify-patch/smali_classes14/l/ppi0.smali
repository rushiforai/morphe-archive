.class public Ll/ppi0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final k:Ljava/util/TimeZone;

.field public static volatile l:Ll/ppi0;

.field public static volatile m:Ljava/lang/String;


# instance fields
.field public a:Lcom/p1/mobile/putong/live/base/data/BLiveTeenMode;

.field public b:Lcom/p1/mobile/putong/data/UserLiveSettings;

.field public c:Ll/kcg0;

.field public d:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public e:Ll/kcg0;

.field public f:Ll/wyd0;

.field public g:Ll/vxd0;

.field public h:Ll/byd0;

.field public i:Ll/jxd0;

.field public j:Ll/jxd0;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, "GMT+8"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Ll/ppi0;->k:Ljava/util/TimeZone;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    sput-object v0, Ll/ppi0;->l:Ll/ppi0;

    .line 11
    .line 12
    const-string v0, ""

    .line 13
    .line 14
    sput-object v0, Ll/ppi0;->m:Ljava/lang/String;

    .line 15
    .line 16
    return-void
.end method

.method public constructor <init>()V
    .locals 4

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
    iput-object v0, p0, Ll/ppi0;->d:Lrx/subjects/a;

    .line 9
    .line 10
    new-instance v0, Ll/wyd0;

    .line 11
    .line 12
    new-instance v1, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    const-string v2, "teen_func_show"

    .line 15
    .line 16
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-static {}, Ll/mbs;->o0()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    const-string v2, ""

    .line 31
    .line 32
    invoke-direct {v0, v1, v2}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    iput-object v0, p0, Ll/ppi0;->f:Ll/wyd0;

    .line 36
    .line 37
    new-instance v0, Ll/jxd0;

    .line 38
    .line 39
    new-instance v1, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    const-string v2, "teen_func_enable"

    .line 42
    .line 43
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    invoke-static {}, Ll/mbs;->o0()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 58
    .line 59
    invoke-direct {v0, v1, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 60
    .line 61
    .line 62
    iput-object v0, p0, Ll/ppi0;->i:Ll/jxd0;

    .line 63
    .line 64
    new-instance v0, Ll/jxd0;

    .line 65
    .line 66
    new-instance v1, Ljava/lang/StringBuilder;

    .line 67
    .line 68
    const-string v3, "teen_mode_live_settings_enable_"

    .line 69
    .line 70
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    invoke-static {}, Ll/mbs;->o0()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v3

    .line 77
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    invoke-direct {v0, v1, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 85
    .line 86
    .line 87
    iput-object v0, p0, Ll/ppi0;->j:Ll/jxd0;

    .line 88
    .line 89
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->m()Lrx/c;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    const/4 v1, 0x1

    .line 94
    invoke-virtual {v0, v1}, Lrx/c;->skip(I)Lrx/c;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    new-instance v1, Ll/kpi0;

    .line 99
    .line 100
    invoke-direct {v1}, Ll/kpi0;-><init>()V

    .line 101
    .line 102
    .line 103
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    new-instance v1, Ll/lpi0;

    .line 108
    .line 109
    invoke-direct {v1}, Ll/lpi0;-><init>()V

    .line 110
    .line 111
    .line 112
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    new-instance v1, Ll/mpi0;

    .line 117
    .line 118
    invoke-direct {v1}, Ll/mpi0;-><init>()V

    .line 119
    .line 120
    .line 121
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 122
    .line 123
    .line 124
    move-result-object v1

    .line 125
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 126
    .line 127
    .line 128
    invoke-static {}, Ll/yw0;->a()Z

    .line 129
    .line 130
    .line 131
    move-result v0

    .line 132
    if-eqz v0, :cond_0

    .line 133
    .line 134
    goto :goto_0

    .line 135
    :cond_0
    sget-object v0, Ll/tbs;->b:Ll/vwt;

    .line 136
    .line 137
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 138
    .line 139
    .line 140
    move-result v0

    .line 141
    if-eqz v0, :cond_1

    .line 142
    .line 143
    sget-object v0, Ll/tbs;->b:Ll/vwt;

    .line 144
    .line 145
    invoke-virtual {v0}, Ll/vwt;->C5()Lcom/p1/mobile/putong/live/base/data/BLiveTeenMode;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    iput-object v0, p0, Ll/ppi0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveTeenMode;

    .line 150
    .line 151
    :cond_1
    :goto_0
    return-void
.end method

.method public static synthetic a(Ll/ppi0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ppi0;->o(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic b(Landroid/net/NetworkInfo;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/mqr;->l()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    sget-object p0, Ll/tbs;->b:Ll/vwt;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    invoke-static {}, Ll/mbs;->i0()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    invoke-static {}, Ll/ppi0;->l()Ll/ppi0;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0, p0}, Ll/ppi0;->v(Lcom/p1/mobile/putong/live/base/data/BLiveSettings;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public static synthetic c(Landroid/net/NetworkInfo;)Ljava/lang/Boolean;
    .locals 3

    .line 1
    sget-object p0, Ll/uqb0;->b0:Ll/sre0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/sre0;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 4
    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    new-instance p0, Ljava/lang/RuntimeException;

    .line 8
    .line 9
    const-string v0, "TeenModeManager Putong.service.account == null"

    .line 10
    .line 11
    invoke-direct {p0, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 15
    .line 16
    .line 17
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 18
    .line 19
    return-object p0

    .line 20
    :cond_0
    sget-object p0, Ll/uqb0;->c0:Ll/bn5;

    .line 21
    .line 22
    invoke-interface {p0}, Ll/bn5;->signedIn_()Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    if-eqz p0, :cond_1

    .line 27
    .line 28
    sget-object p0, Ll/uqb0;->j0:Ll/dg00;

    .line 29
    .line 30
    iget-object p0, p0, Ll/dg00;->b:Lrx/subjects/a;

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    sget-object p0, Ll/uqb0;->j0:Ll/dg00;

    .line 34
    .line 35
    iget-object p0, p0, Ll/dg00;->f:Lrx/subjects/a;

    .line 36
    .line 37
    :goto_0
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    const/4 v0, 0x1

    .line 42
    if-nez p0, :cond_2

    .line 43
    .line 44
    move p0, v0

    .line 45
    goto :goto_1

    .line 46
    :cond_2
    const/4 p0, 0x0

    .line 47
    :goto_1
    if-eqz p0, :cond_3

    .line 48
    .line 49
    new-instance v1, Ljava/lang/RuntimeException;

    .line 50
    .line 51
    const-string v2, "TeenModeManager moduleLoad false"

    .line 52
    .line 53
    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    invoke-static {v1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 57
    .line 58
    .line 59
    :cond_3
    xor-int/2addr p0, v0

    .line 60
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    return-object p0
.end method

.method public static synthetic d(Landroid/net/NetworkInfo;)Ljava/lang/Boolean;
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

.method public static synthetic e(Ll/ppi0;Lcom/p1/mobile/putong/live/base/data/BLiveSettings;Lcom/p1/mobile/putong/data/SettingGroups;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ppi0;->n(Lcom/p1/mobile/putong/live/base/data/BLiveSettings;Lcom/p1/mobile/putong/data/SettingGroups;)V

    return-void
.end method

.method public static l()Ll/ppi0;
    .locals 3

    .line 1
    invoke-static {}, Ll/mbs;->o0()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string v0, ""

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-static {}, Ll/mbs;->o0()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    :goto_0
    sget-object v1, Ll/ppi0;->l:Ll/ppi0;

    .line 15
    .line 16
    if-nez v1, :cond_2

    .line 17
    .line 18
    const-class v1, Ll/ppi0;

    .line 19
    .line 20
    monitor-enter v1

    .line 21
    :try_start_0
    sget-object v2, Ll/ppi0;->l:Ll/ppi0;

    .line 22
    .line 23
    if-nez v2, :cond_1

    .line 24
    .line 25
    sput-object v0, Ll/ppi0;->m:Ljava/lang/String;

    .line 26
    .line 27
    new-instance v0, Ll/ppi0;

    .line 28
    .line 29
    invoke-direct {v0}, Ll/ppi0;-><init>()V

    .line 30
    .line 31
    .line 32
    sput-object v0, Ll/ppi0;->l:Ll/ppi0;

    .line 33
    .line 34
    goto :goto_1

    .line 35
    :catchall_0
    move-exception v0

    .line 36
    goto :goto_2

    .line 37
    :cond_1
    :goto_1
    monitor-exit v1

    .line 38
    goto :goto_5

    .line 39
    :goto_2
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 40
    throw v0

    .line 41
    :cond_2
    sget-object v1, Ll/ppi0;->m:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-nez v1, :cond_4

    .line 48
    .line 49
    const-class v1, Ll/ppi0;

    .line 50
    .line 51
    monitor-enter v1

    .line 52
    :try_start_1
    sget-object v2, Ll/ppi0;->m:Ljava/lang/String;

    .line 53
    .line 54
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    if-nez v2, :cond_3

    .line 59
    .line 60
    sput-object v0, Ll/ppi0;->m:Ljava/lang/String;

    .line 61
    .line 62
    sget-object v0, Ll/ppi0;->l:Ll/ppi0;

    .line 63
    .line 64
    invoke-virtual {v0}, Ll/ppi0;->w()V

    .line 65
    .line 66
    .line 67
    new-instance v0, Ll/ppi0;

    .line 68
    .line 69
    invoke-direct {v0}, Ll/ppi0;-><init>()V

    .line 70
    .line 71
    .line 72
    sput-object v0, Ll/ppi0;->l:Ll/ppi0;

    .line 73
    .line 74
    goto :goto_3

    .line 75
    :catchall_1
    move-exception v0

    .line 76
    goto :goto_4

    .line 77
    :cond_3
    :goto_3
    monitor-exit v1

    .line 78
    goto :goto_5

    .line 79
    :goto_4
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 80
    throw v0

    .line 81
    :cond_4
    :goto_5
    sget-object v0, Ll/ppi0;->l:Ll/ppi0;

    .line 82
    .line 83
    return-object v0
.end method


# virtual methods
.method public A(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ppi0;->C(Lcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public B(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ppi0;->C(Lcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public C(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    sget-object p0, Ll/efv;->f:Ljava/lang/String;

    .line 2
    .line 3
    sget v0, Lcom/p1/mobile/putong/live/base/webview/LiveWebViewAct;->k:I

    .line 4
    .line 5
    invoke-static {p1, p0, v0}, Lcom/p1/mobile/putong/live/base/webview/LiveWebViewAct;->e2(Landroid/content/Context;Ljava/lang/String;I)Landroid/content/Intent;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public f()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public g(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/sre0;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->signedIn_()Z

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
    invoke-static {}, Ll/mqr;->l()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    :goto_0
    return-void

    .line 19
    :cond_1
    invoke-virtual {p0, p1}, Ll/ppi0;->m(Lcom/p1/mobile/android/app/Act;)Z

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final h()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->globalLifeCycle_()Ljava/util/HashMap;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_3

    .line 18
    .line 19
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Ljava/util/ArrayList;

    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_0

    .line 34
    .line 35
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    check-cast v1, Lcom/p1/mobile/android/app/Act$r;

    .line 40
    .line 41
    iget-object v1, v1, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 42
    .line 43
    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    check-cast v1, Landroid/app/Activity;

    .line 48
    .line 49
    if-nez v1, :cond_2

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_2
    sget-object v2, Ll/tbs;->f:Ll/j6t;

    .line 53
    .line 54
    invoke-virtual {v2, v1}, Ll/j6t;->m(Landroid/app/Activity;)Z

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    if-eqz v2, :cond_1

    .line 59
    .line 60
    invoke-virtual {v1}, Landroid/app/Activity;->finish()V

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_3
    return-void
.end method

.method public final i()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->globalLifeCycle_()Ljava/util/HashMap;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_3

    .line 18
    .line 19
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Ljava/util/ArrayList;

    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_0

    .line 34
    .line 35
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    check-cast v1, Lcom/p1/mobile/android/app/Act$r;

    .line 40
    .line 41
    iget-object v1, v1, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 42
    .line 43
    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    check-cast v1, Landroid/app/Activity;

    .line 48
    .line 49
    if-nez v1, :cond_2

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_2
    instance-of v2, v1, Lcom/p1/mobile/putong/live/external/page/teenmode/LiveTeenDialogAct;

    .line 53
    .line 54
    if-eqz v2, :cond_1

    .line 55
    .line 56
    invoke-virtual {v1}, Landroid/app/Activity;->finish()V

    .line 57
    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_3
    return-void
.end method

.method public j()Z
    .locals 4

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->globalLifeCycle_()Ljava/util/HashMap;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_4

    .line 18
    .line 19
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Ljava/util/ArrayList;

    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_0

    .line 34
    .line 35
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    check-cast v1, Lcom/p1/mobile/android/app/Act$r;

    .line 40
    .line 41
    iget-object v1, v1, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 42
    .line 43
    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    check-cast v1, Landroid/app/Activity;

    .line 48
    .line 49
    if-nez v1, :cond_2

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_2
    instance-of v2, v1, Lcom/p1/mobile/putong/live/external/page/teenmode/LiveTeenDialogAct;

    .line 53
    .line 54
    const/4 v3, 0x1

    .line 55
    if-eqz v2, :cond_3

    .line 56
    .line 57
    return v3

    .line 58
    :cond_3
    instance-of v2, v1, Lcom/p1/mobile/putong/live/base/webview/LiveWebViewAct;

    .line 59
    .line 60
    if-eqz v2, :cond_1

    .line 61
    .line 62
    check-cast v1, Lcom/p1/mobile/putong/live/base/webview/LiveWebViewAct;

    .line 63
    .line 64
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/webview/LiveWebViewAct;->g2()I

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    sget v2, Lcom/p1/mobile/putong/live/base/webview/LiveWebViewAct;->k:I

    .line 69
    .line 70
    if-ne v1, v2, :cond_1

    .line 71
    .line 72
    return v3

    .line 73
    :cond_4
    const/4 p0, 0x0

    .line 74
    return p0
.end method

.method public k()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public final m(Lcom/p1/mobile/android/app/Act;)Z
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/live/external/page/teenmode/LiveTeenDialogAct;

    .line 2
    .line 3
    if-nez p0, :cond_1

    .line 4
    .line 5
    instance-of p0, p1, Lcom/p1/mobile/putong/live/base/webview/LiveWebViewAct;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    check-cast p1, Lcom/p1/mobile/putong/live/base/webview/LiveWebViewAct;

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/webview/LiveWebViewAct;->g2()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    sget p1, Lcom/p1/mobile/putong/live/base/webview/LiveWebViewAct;->k:I

    .line 16
    .line 17
    if-ne p0, p1, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return p0

    .line 22
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 23
    return p0
.end method

.method public final synthetic n(Lcom/p1/mobile/putong/live/base/data/BLiveSettings;Lcom/p1/mobile/putong/data/SettingGroups;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 4
    .line 5
    if-eqz p1, :cond_1

    .line 6
    .line 7
    if-nez p2, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->teenMode:Lcom/p1/mobile/putong/live/base/data/BLiveTeenMode;

    .line 11
    .line 12
    iput-object p1, p0, Ll/ppi0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveTeenMode;

    .line 13
    .line 14
    iget-object p1, p2, Lcom/p1/mobile/putong/data/SettingGroups;->live:Lcom/p1/mobile/putong/data/UserLiveSettings;

    .line 15
    .line 16
    iput-object p1, p0, Ll/ppi0;->b:Lcom/p1/mobile/putong/data/UserLiveSettings;

    .line 17
    .line 18
    iget-object p2, p0, Ll/ppi0;->i:Ll/jxd0;

    .line 19
    .line 20
    iget-object p1, p1, Lcom/p1/mobile/putong/data/UserLiveSettings;->teenModeEnable:Ljava/lang/Boolean;

    .line 21
    .line 22
    invoke-virtual {p2, p1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Ll/ppi0;->d:Lrx/subjects/a;

    .line 26
    .line 27
    iget-object p0, p0, Ll/ppi0;->b:Lcom/p1/mobile/putong/data/UserLiveSettings;

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->teenModeEnable:Ljava/lang/Boolean;

    .line 30
    .line 31
    invoke-virtual {p1, p0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    :cond_1
    :goto_0
    return-void
.end method

.method public final synthetic o(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-object p1, p0, Ll/ppi0;->c:Ll/kcg0;

    .line 3
    .line 4
    return-void
.end method

.method public p(ZI)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    const/4 p1, 0x1

    .line 5
    if-ne p2, p1, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/ppi0;->s()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_1
    const/4 p1, 0x2

    .line 12
    if-ne p2, p1, :cond_2

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/ppi0;->q()V

    .line 15
    .line 16
    .line 17
    :cond_2
    :goto_0
    return-void
.end method

.method public q()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ppi0;->h:Ll/byd0;

    .line 2
    .line 3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 4
    .line 5
    .line 6
    move-result-wide v1

    .line 7
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ll/ppi0;->s()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public r(Z)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/ppi0;->h()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/ppi0;->i()V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/ppi0;->b:Lcom/p1/mobile/putong/data/UserLiveSettings;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    iget-object p1, p0, Ll/ppi0;->c:Ll/kcg0;

    .line 13
    .line 14
    invoke-static {p1}, Ll/psd0;->z(Ll/kcg0;)V

    .line 15
    .line 16
    .line 17
    iput-object v1, p0, Ll/ppi0;->c:Ll/kcg0;

    .line 18
    .line 19
    sget-object p1, Ll/tbs;->b:Ll/vwt;

    .line 20
    .line 21
    invoke-virtual {p1}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p0, p1}, Ll/ppi0;->v(Lcom/p1/mobile/putong/live/base/data/BLiveSettings;)V

    .line 26
    .line 27
    .line 28
    goto :goto_2

    .line 29
    :cond_0
    iget-object v0, v0, Lcom/p1/mobile/putong/data/UserLiveSettings;->teenModeEnable:Ljava/lang/Boolean;

    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eq v0, p1, :cond_1

    .line 36
    .line 37
    const/4 v0, 0x1

    .line 38
    goto :goto_0

    .line 39
    :cond_1
    const/4 v0, 0x0

    .line 40
    :goto_0
    iget-object v2, p0, Ll/ppi0;->b:Lcom/p1/mobile/putong/data/UserLiveSettings;

    .line 41
    .line 42
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    iput-object v3, v2, Lcom/p1/mobile/putong/data/UserLiveSettings;->teenModeEnable:Ljava/lang/Boolean;

    .line 47
    .line 48
    iget-object v2, p0, Ll/ppi0;->i:Ll/jxd0;

    .line 49
    .line 50
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    invoke-virtual {v2, v3}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    if-eqz p1, :cond_2

    .line 58
    .line 59
    goto :goto_1

    .line 60
    :cond_2
    iget-object v2, p0, Ll/ppi0;->e:Ll/kcg0;

    .line 61
    .line 62
    invoke-static {v2}, Ll/psd0;->z(Ll/kcg0;)V

    .line 63
    .line 64
    .line 65
    iput-object v1, p0, Ll/ppi0;->e:Ll/kcg0;

    .line 66
    .line 67
    invoke-virtual {p0}, Ll/ppi0;->t()V

    .line 68
    .line 69
    .line 70
    :goto_1
    if-eqz v0, :cond_3

    .line 71
    .line 72
    iget-object p0, p0, Ll/ppi0;->d:Lrx/subjects/a;

    .line 73
    .line 74
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 79
    .line 80
    .line 81
    :cond_3
    :goto_2
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 86
    .line 87
    if-eqz p0, :cond_4

    .line 88
    .line 89
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 94
    .line 95
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    move-object v1, p0

    .line 100
    check-cast v1, Landroid/app/Activity;

    .line 101
    .line 102
    :cond_4
    instance-of p0, v1, Lcom/p1/mobile/android/app/Act;

    .line 103
    .line 104
    if-eqz p0, :cond_5

    .line 105
    .line 106
    const-string p0, "live"

    .line 107
    .line 108
    invoke-static {p0}, Lcom/p1/mobile/putong/data/NavigationIntent;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/NavigationIntent;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    invoke-static {v1, p0}, Ll/mbs;->r(Landroid/content/Context;Lcom/p1/mobile/putong/data/NavigationIntent;)Landroid/content/Intent;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    invoke-virtual {v1, p0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 117
    .line 118
    .line 119
    :cond_5
    return-void
.end method

.method public s()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ppi0;->i()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/ppi0;->g:Ll/vxd0;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object p0, p0, Ll/ppi0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveTeenMode;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTeenMode;->accumulation:Lcom/p1/mobile/putong/live/base/data/BLiveTeenAccumulation;

    .line 11
    .line 12
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTeenAccumulation;->time:I

    .line 13
    .line 14
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {v0, p0}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public final t()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ppi0;->g:Ll/vxd0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/ppi0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveTeenMode;

    .line 6
    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/ppi0;->g:Ll/vxd0;

    .line 14
    .line 15
    iget-object p0, p0, Ll/ppi0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveTeenMode;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTeenMode;->accumulation:Lcom/p1/mobile/putong/live/base/data/BLiveTeenAccumulation;

    .line 18
    .line 19
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTeenAccumulation;->time:I

    .line 20
    .line 21
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {v0, p0}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public u(I)V
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    if-eq p1, p0, :cond_2

    .line 3
    .line 4
    const/4 p0, 0x2

    .line 5
    if-eq p1, p0, :cond_1

    .line 6
    .line 7
    const/4 p0, 0x3

    .line 8
    if-eq p1, p0, :cond_0

    .line 9
    .line 10
    const-string p0, ""

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    sget-object p0, Ll/tbs;->a:Landroid/app/Application;

    .line 14
    .line 15
    sget p1, Lcom/p1/mobile/putong/live/base/R$string;->z0:I

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    goto :goto_0

    .line 22
    :cond_1
    sget-object p0, Ll/tbs;->a:Landroid/app/Application;

    .line 23
    .line 24
    sget p1, Lcom/p1/mobile/putong/live/base/R$string;->A0:I

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    goto :goto_0

    .line 31
    :cond_2
    sget-object p0, Ll/tbs;->a:Landroid/app/Application;

    .line 32
    .line 33
    sget p1, Lcom/p1/mobile/putong/live/base/R$string;->J:I

    .line 34
    .line 35
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    :goto_0
    invoke-static {p0}, Lcom/p1/mobile/putong/live/external/page/teenmode/LiveTeenDialogAct;->Y1(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public v(Lcom/p1/mobile/putong/live/base/data/BLiveSettings;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/mqr;->l()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    invoke-static {}, Ll/mqr;->h()Z

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
    iget-object v0, p0, Ll/ppi0;->c:Ll/kcg0;

    .line 15
    .line 16
    if-nez v0, :cond_2

    .line 17
    .line 18
    if-eqz p1, :cond_2

    .line 19
    .line 20
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 21
    .line 22
    if-nez v0, :cond_1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    iget-object v1, p0, Ll/ppi0;->j:Ll/jxd0;

    .line 26
    .line 27
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->teenMode:Lcom/p1/mobile/putong/live/base/data/BLiveTeenMode;

    .line 28
    .line 29
    iget-boolean v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveTeenMode;->on:Z

    .line 30
    .line 31
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v1, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    invoke-static {}, Ll/mbs;->x()Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    new-instance v1, Ll/npi0;

    .line 43
    .line 44
    invoke-direct {v1, p0, p1}, Ll/npi0;-><init>(Ll/ppi0;Lcom/p1/mobile/putong/live/base/data/BLiveSettings;)V

    .line 45
    .line 46
    .line 47
    new-instance p1, Ll/opi0;

    .line 48
    .line 49
    invoke-direct {p1, p0}, Ll/opi0;-><init>(Ll/ppi0;)V

    .line 50
    .line 51
    .line 52
    invoke-static {v1, p1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-virtual {v0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    iput-object p1, p0, Ll/ppi0;->c:Ll/kcg0;

    .line 61
    .line 62
    :cond_2
    :goto_0
    return-void
.end method

.method public w()V
    .locals 2

    .line 1
    invoke-static {}, Ll/mqr;->l()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Ll/ppi0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveTeenMode;

    .line 10
    .line 11
    iput-object v0, p0, Ll/ppi0;->b:Lcom/p1/mobile/putong/data/UserLiveSettings;

    .line 12
    .line 13
    iget-object v1, p0, Ll/ppi0;->c:Ll/kcg0;

    .line 14
    .line 15
    invoke-static {v1}, Ll/psd0;->z(Ll/kcg0;)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Ll/ppi0;->c:Ll/kcg0;

    .line 19
    .line 20
    iget-object v1, p0, Ll/ppi0;->e:Ll/kcg0;

    .line 21
    .line 22
    invoke-static {v1}, Ll/psd0;->z(Ll/kcg0;)V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Ll/ppi0;->e:Ll/kcg0;

    .line 26
    .line 27
    return-void
.end method

.method public x()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public y()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ppi0;->d:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/c;->asObservable()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public z(Lcom/p1/mobile/android/app/Act;I)V
    .locals 1

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v0, Ll/efv;->g:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    sget p2, Lcom/p1/mobile/putong/live/base/webview/LiveWebViewAct;->k:I

    .line 19
    .line 20
    invoke-static {p1, p0, p2}, Lcom/p1/mobile/putong/live/base/webview/LiveWebViewAct;->e2(Landroid/content/Context;Ljava/lang/String;I)Landroid/content/Intent;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method
