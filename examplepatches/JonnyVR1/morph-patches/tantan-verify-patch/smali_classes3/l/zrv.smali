.class public Ll/zrv;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Ll/wrv;

.field public static b:Ll/csv;

.field public static c:Ll/tyr;

.field public static d:Ll/vwt;

.field public static e:Landroid/app/Application;

.field public static f:Ll/f2d0;

.field public static g:Ll/c3t;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 2
    .line 3
    sput-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 4
    .line 5
    new-instance v0, Ll/f2d0;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/f2d0;-><init>()V

    .line 8
    .line 9
    .line 10
    sput-object v0, Ll/zrv;->f:Ll/f2d0;

    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>(Ll/wrv;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string p0, "[live]living_room"

    .line 5
    .line 6
    const-string v0, "LivingRoomModule.init()"

    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sput-object p1, Ll/zrv;->a:Ll/wrv;

    .line 12
    .line 13
    new-instance p0, Ll/csv;

    .line 14
    .line 15
    invoke-direct {p0}, Ll/csv;-><init>()V

    .line 16
    .line 17
    .line 18
    sput-object p0, Ll/zrv;->b:Ll/csv;

    .line 19
    .line 20
    new-instance p0, Ll/tyr;

    .line 21
    .line 22
    invoke-direct {p0}, Ll/tyr;-><init>()V

    .line 23
    .line 24
    .line 25
    sput-object p0, Ll/zrv;->c:Ll/tyr;

    .line 26
    .line 27
    return-void
.end method

.method public static synthetic a()V
    .locals 3

    .line 1
    new-instance v0, Ljava/io/File;

    .line 2
    .line 3
    invoke-static {}, Ll/zs2;->v1()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 11
    .line 12
    const-string v2, "preset"

    .line 13
    .line 14
    invoke-static {v1, v2, v0}, Ll/xgt;->a(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static synthetic b()V
    .locals 3

    .line 1
    new-instance v0, Ljava/io/File;

    .line 2
    .line 3
    invoke-static {}, Ll/zs2;->v1()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 11
    .line 12
    const-string v2, "preset"

    .line 13
    .line 14
    invoke-static {v1, v2, v0}, Ll/xgt;->a(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static bridge synthetic c(Ll/zrv;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/zrv;->f()V

    return-void
.end method

.method public static bridge synthetic d(Ll/zrv;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/zrv;->o()V

    return-void
.end method

.method public static j()Ll/c3t;
    .locals 1

    .line 1
    sget-object v0, Ll/zrv;->g:Ll/c3t;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/c3t;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/c3t;-><init>()V

    .line 8
    .line 9
    .line 10
    sput-object v0, Ll/zrv;->g:Ll/c3t;

    .line 11
    .line 12
    :cond_0
    sget-object v0, Ll/zrv;->g:Ll/c3t;

    .line 13
    .line 14
    return-object v0
.end method

.method public static k()Ll/vwt;
    .locals 1

    .line 1
    sget-object v0, Ll/zrv;->d:Ll/vwt;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/wrv;->p()Ll/vwt;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sput-object v0, Ll/zrv;->d:Ll/vwt;

    .line 12
    .line 13
    :cond_0
    sget-object v0, Ll/zrv;->d:Ll/vwt;

    .line 14
    .line 15
    return-object v0
.end method

.method public static l(Ll/htd0;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/htd0<",
            "TV;>;)TV;"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/zrv;->b:Ll/csv;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ll/csv;->a(Ll/htd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static m()Z
    .locals 1

    .line 1
    sget-object v0, Ll/zrv;->b:Ll/csv;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    return v0

    .line 7
    :cond_0
    const/4 v0, 0x0

    .line 8
    return v0
.end method

.method public static n(Ljava/lang/String;)Z
    .locals 1

    .line 1
    const-string v0, "voice"

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/4 v0, 0x1

    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    const/4 p0, 0x3

    .line 11
    invoke-static {p0}, Ll/wft;->b(I)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    xor-int/2addr p0, v0

    .line 16
    return p0

    .line 17
    :cond_0
    sget-object p0, Ll/zrv;->a:Ll/wrv;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/wrv;->I()Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    const/4 p0, 0x2

    .line 26
    invoke-static {p0}, Ll/wft;->b(I)Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    if-nez p0, :cond_1

    .line 31
    .line 32
    return v0

    .line 33
    :cond_1
    const/4 p0, 0x0

    .line 34
    return p0
.end method

.method public static r()V
    .locals 1

    .line 1
    sget-object v0, Ll/zrv;->d:Ll/vwt;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget-object v0, Ll/zrv;->d:Ll/vwt;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 18
    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    :cond_0
    sget-object v0, Ll/zrv;->d:Ll/vwt;

    .line 22
    .line 23
    invoke-virtual {v0}, Ll/mof0;->z()Lrx/c;

    .line 24
    .line 25
    .line 26
    :cond_1
    return-void
.end method


# virtual methods
.method public e()V
    .locals 2

    .line 1
    invoke-static {}, Ll/ere;->i()Ll/ere;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/ere;->y()V

    .line 6
    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    invoke-static {p0}, Ll/wft;->b(I)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    invoke-static {}, Ll/lfp;->a()Ll/lfp;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Ll/lfp;->d()V

    .line 20
    .line 21
    .line 22
    :cond_0
    const/4 p0, 0x2

    .line 23
    invoke-static {p0}, Ll/wft;->b(I)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-eqz p0, :cond_1

    .line 28
    .line 29
    const-string p0, "unknown_"

    .line 30
    .line 31
    invoke-static {p0}, Lcom/p1/mobile/putong/data/LiveRegionTag;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LiveRegionTag;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-static {p0}, Ll/aiv;->Y0(Lcom/p1/mobile/putong/data/LiveRegionTag;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-static {}, Ll/dhw;->c()Ll/t9t;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 44
    .line 45
    .line 46
    invoke-static {}, Ll/aiv;->c1()Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-static {}, Ll/dhw;->c()Ll/t9t;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 55
    .line 56
    .line 57
    invoke-static {}, Ll/aiv;->g1()Lrx/c;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-static {}, Ll/dhw;->c()Ll/t9t;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 66
    .line 67
    .line 68
    invoke-static {}, Ll/g980;->n()Ll/g980;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-virtual {p0}, Ll/g980;->j()V

    .line 73
    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->a5()Lrx/c;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-static {}, Ll/dhw;->c()Ll/t9t;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 85
    .line 86
    .line 87
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->b5()Lrx/c;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    invoke-static {}, Ll/dhw;->c()Ll/t9t;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 96
    .line 97
    .line 98
    :goto_0
    sget-object p0, Ll/iit;->Companion:Ll/iit$a;

    .line 99
    .line 100
    invoke-virtual {p0}, Ll/iit$a;->S()I

    .line 101
    .line 102
    .line 103
    move-result p0

    .line 104
    const/4 v0, 0x0

    .line 105
    new-array v0, v0, [Ljava/lang/Object;

    .line 106
    .line 107
    const/4 v1, 0x0

    .line 108
    invoke-static {p0, v1, v0}, Ll/wgt;->p(ILcom/p1/mobile/android/app/Act;[Ljava/lang/Object;)Lrx/c;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    invoke-static {}, Ll/dhw;->c()Ll/t9t;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 117
    .line 118
    .line 119
    new-instance p0, Ll/yrv;

    .line 120
    .line 121
    invoke-direct {p0}, Ll/yrv;-><init>()V

    .line 122
    .line 123
    .line 124
    invoke-static {p0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 125
    .line 126
    .line 127
    return-void
.end method

.method public final f()V
    .locals 2

    .line 1
    const-string p0, "http dns open:"

    .line 2
    .line 3
    :try_start_0
    sget-object v0, Ll/v2t;->d:Ljava/lang/String;

    .line 4
    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    sget-object p0, Ll/zrv;->a:Ll/wrv;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/wrv;->F()Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {v0, p0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    sget-object p0, Ll/zrv;->a:Ll/wrv;

    .line 27
    .line 28
    invoke-virtual {p0}, Ll/wrv;->F()Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    if-eqz p0, :cond_0

    .line 33
    .line 34
    new-instance p0, Ljava/util/ArrayList;

    .line 35
    .line 36
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 37
    .line 38
    .line 39
    const-string v0, "live-api.immomo.com"

    .line 40
    .line 41
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    const-string v0, "sla-media.immomo.com"

    .line 45
    .line 46
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    const-string v0, "schedule-media.immomo.com"

    .line 50
    .line 51
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 55
    .line 56
    invoke-static {v0, p0}, Ll/v1c;->e(Landroid/content/Context;Ljava/util/List;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 57
    .line 58
    .line 59
    :cond_0
    return-void

    .line 60
    :catch_0
    move-exception p0

    .line 61
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public final g()V
    .locals 2

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
    new-instance v0, Ll/zrv$a;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/zrv$a;-><init>(Ll/zrv;)V

    .line 10
    .line 11
    .line 12
    invoke-static {v0}, Lrx/c;->fromCallable(Ljava/util/concurrent/Callable;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/zrv$b;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/zrv$b;-><init>(Ll/zrv;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_0
    invoke-virtual {p0}, Ll/zrv;->o()V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Ll/zrv;->f()V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public h()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/zrv;->p()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const-string v0, "unknown_"

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/putong/data/LiveRegionTag;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LiveRegionTag;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Ll/aiv;->Y0(Lcom/p1/mobile/putong/data/LiveRegionTag;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {}, Ll/dhw;->c()Ll/t9t;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 26
    .line 27
    .line 28
    invoke-static {}, Ll/aiv;->c1()Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-static {}, Ll/dhw;->c()Ll/t9t;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 37
    .line 38
    .line 39
    invoke-static {}, Ll/aiv;->g1()Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-static {}, Ll/dhw;->c()Ll/t9t;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 48
    .line 49
    .line 50
    invoke-static {}, Ll/g980;->n()Ll/g980;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {v0}, Ll/g980;->j()V

    .line 55
    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->a5()Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-static {}, Ll/dhw;->c()Ll/t9t;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 67
    .line 68
    .line 69
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->b5()Lrx/c;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-static {}, Ll/dhw;->c()Ll/t9t;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 78
    .line 79
    .line 80
    :goto_0
    invoke-virtual {p0}, Ll/zrv;->g()V

    .line 81
    .line 82
    .line 83
    sget-object p0, Ll/iit;->Companion:Ll/iit$a;

    .line 84
    .line 85
    invoke-virtual {p0}, Ll/iit$a;->S()I

    .line 86
    .line 87
    .line 88
    move-result p0

    .line 89
    const/4 v0, 0x0

    .line 90
    new-array v0, v0, [Ljava/lang/Object;

    .line 91
    .line 92
    const/4 v1, 0x0

    .line 93
    invoke-static {p0, v1, v0}, Ll/wgt;->p(ILcom/p1/mobile/android/app/Act;[Ljava/lang/Object;)Lrx/c;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    invoke-static {}, Ll/dhw;->c()Ll/t9t;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 102
    .line 103
    .line 104
    new-instance p0, Ll/xrv;

    .line 105
    .line 106
    invoke-direct {p0}, Ll/xrv;-><init>()V

    .line 107
    .line 108
    .line 109
    invoke-static {p0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 110
    .line 111
    .line 112
    return-void
.end method

.method public i(Ll/vwt;)V
    .locals 0

    .line 1
    sput-object p1, Ll/zrv;->d:Ll/vwt;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/zrv;->g()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final o()V
    .locals 2

    .line 1
    :try_start_0
    const-string p0, "mmcrypto"

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "mmssl"

    .line 7
    .line 8
    invoke-static {p0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string p0, "curl"

    .line 12
    .line 13
    invoke-static {p0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string p0, "mdlog"

    .line 17
    .line 18
    invoke-static {p0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const-string p0, "mmdns"

    .line 22
    .line 23
    invoke-static {p0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :catchall_0
    move-exception p0

    .line 28
    new-instance v0, Ljava/lang/RuntimeException;

    .line 29
    .line 30
    const-string v1, "enableDomainAnalysis"

    .line 31
    .line 32
    invoke-direct {v0, v1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 33
    .line 34
    .line 35
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final p()V
    .locals 0

    .line 1
    sget-object p0, Ll/zrv;->a:Ll/wrv;

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/wrv;->K()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-static {}, Ll/ere;->i()Ll/ere;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Ll/ere;->y()V

    .line 17
    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    invoke-static {p0}, Ll/wft;->b(I)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-nez p0, :cond_1

    .line 25
    .line 26
    invoke-static {}, Ll/lfp;->a()Ll/lfp;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0}, Ll/lfp;->d()V

    .line 31
    .line 32
    .line 33
    :cond_1
    :goto_0
    return-void
.end method

.method public q()V
    .locals 1

    .line 1
    invoke-static {}, Ll/cmp0;->d()Ll/cmp0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/cmp0;->a()V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ll/lti;->d()Ll/lti;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Ll/lti;->c()V

    .line 13
    .line 14
    .line 15
    invoke-static {}, Ll/pzm;->c()Ll/pzm;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const/4 v0, 0x1

    .line 20
    invoke-virtual {p0, v0}, Ll/pzm;->a(Z)V

    .line 21
    .line 22
    .line 23
    const/4 p0, 0x0

    .line 24
    sput-object p0, Ll/zrv;->d:Ll/vwt;

    .line 25
    .line 26
    return-void
.end method
