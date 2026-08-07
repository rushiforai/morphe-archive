.class public Ll/tbs;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Landroid/app/Application;

.field public static b:Ll/vwt;

.field public static c:Z

.field public static d:Lcom/p1/mobile/putong/live/external/module/api/LiveAssertApi;

.field public static e:Ll/f1s;

.field public static f:Ll/j6t;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/j6t;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/j6t;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/tbs;->f:Ll/j6t;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    check-cast p1, Landroid/app/Application;

    .line 5
    .line 6
    sput-object p1, Ll/tbs;->a:Landroid/app/Application;

    .line 7
    .line 8
    invoke-static {}, Ll/yw0;->a()Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    new-instance p0, Lcom/p1/mobile/putong/live/external/module/api/LiveAssertApi;

    .line 15
    .line 16
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/module/api/LiveAssertApi;-><init>()V

    .line 17
    .line 18
    .line 19
    sput-object p0, Ll/tbs;->d:Lcom/p1/mobile/putong/live/external/module/api/LiveAssertApi;

    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    invoke-virtual {p0}, Ll/tbs;->l()Ll/j6t;

    .line 23
    .line 24
    .line 25
    new-instance p0, Ll/brf;

    .line 26
    .line 27
    invoke-direct {p0}, Ll/brf;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-static {p0}, Ll/e4s;->d(Ll/ctl;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public static synthetic a(Ll/vwt;Lcom/p1/mobile/putong/live/base/data/BLiveSettings;)V
    .locals 7

    .line 1
    :try_start_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/vwt;->O4()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {}, Ll/mbs;->J()Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-static {v1}, Ll/xau;->y(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {v0, v1}, Ll/bnw;->a(Ljava/lang/String;Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    invoke-virtual {p0}, Ll/vwt;->O4()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->license:Lcom/p1/mobile/putong/live/base/data/BLiveLicense;

    .line 31
    .line 32
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveLicense;->secretKey:Ljava/lang/String;

    .line 33
    .line 34
    sget-object p0, Ll/tbs;->a:Landroid/app/Application;

    .line 35
    .line 36
    invoke-static {p0}, Ll/wx0;->b(Landroid/content/Context;)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    invoke-static {}, Ll/mbs;->J()Lcom/p1/mobile/putong/data/User;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-static {p0}, Ll/xau;->y(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v4

    .line 48
    sget-object p0, Ll/tbs;->a:Landroid/app/Application;

    .line 49
    .line 50
    invoke-static {p0}, Ll/wx0;->a(Landroid/content/Context;)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v5

    .line 54
    const/4 v6, 0x0

    .line 55
    invoke-static/range {v1 .. v6}, Ll/bnw;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/jnw;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 56
    .line 57
    .line 58
    :catch_0
    :cond_1
    :goto_0
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/base/data/BLiveSettings;)V
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

.method public static synthetic c(Lcom/p1/mobile/android/app/Act;)V
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

.method public static synthetic d(Lcom/p1/mobile/android/app/Act$r;)V
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    sget-object p0, Ll/tbs;->b:Ll/vwt;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/mof0;->k()Lrx/c;

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const-string p0, "[live]"

    .line 10
    .line 11
    const-string v0, "\u5f00\u59cb\u540e\u53f0\u8bf7\u6c42\u914d\u7f6e\u63a5\u53e3 \uff0c \u8fdb\u5165\u62d2\u7edd\u7b56\u7565"

    .line 12
    .line 13
    invoke-static {p0, v0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/live/base/data/BLiveSettings;Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/live/base/data/BLiveSettings;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic f(Ll/vwt;Lcom/p1/mobile/android/app/Act$r;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/mof0;->k()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Lrx/c;->subscribe()Ll/kcg0;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/mof0;->z()Lrx/c;

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const-string p0, "[live]"

    .line 15
    .line 16
    const-string p1, "\u5f00\u59cb\u540e\u53f0\u8bf7\u6c42\u914d\u7f6e\u63a5\u53e3 \uff0c \u8fdb\u5165\u62d2\u7edd\u7b56\u7565"

    .line 17
    .line 18
    invoke-static {p0, p1}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static m(Ll/itd0;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/itd0<",
            "TV;>;)TV;"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/tbs;->e:Ll/f1s;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/f1s;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/f1s;-><init>()V

    .line 8
    .line 9
    .line 10
    sput-object v0, Ll/tbs;->e:Ll/f1s;

    .line 11
    .line 12
    :cond_0
    sget-object v0, Ll/tbs;->e:Ll/f1s;

    .line 13
    .line 14
    invoke-virtual {v0, p0}, Ll/f1s;->a(Ll/itd0;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public static n(Lcom/p1/mobile/putong/data/LiveRegionTag;)V
    .locals 1

    .line 1
    sget-object v0, Ll/tbs;->b:Ll/vwt;

    .line 2
    .line 3
    invoke-static {v0}, Ll/tbs;->q(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/tbs;->p()V

    .line 7
    .line 8
    .line 9
    sget-object v0, Ll/tbs;->f:Ll/j6t;

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ll/j6t;->r(Lcom/p1/mobile/putong/data/LiveRegionTag;)V

    .line 12
    .line 13
    .line 14
    invoke-static {}, Ll/vxr;->d()Ll/p6s;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, Ll/mof0;->z()Lrx/c;

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static p()V
    .locals 1

    .line 1
    sget-object v0, Ll/tbs;->d:Lcom/p1/mobile/putong/live/external/module/api/LiveAssertApi;

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
    sget-object v0, Ll/tbs;->d:Lcom/p1/mobile/putong/live/external/module/api/LiveAssertApi;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/module/api/LiveAssertApi;->refreshLiveAssets()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public static q(Ll/vwt;)V
    .locals 2

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-virtual {p0}, Ll/vwt;->s6()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground()Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const/4 v1, 0x1

    .line 15
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/nbs;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/nbs;-><init>(Ll/vwt;)V

    .line 22
    .line 23
    .line 24
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    invoke-virtual {p0}, Ll/mof0;->k()Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0}, Lrx/c;->subscribe()Ll/kcg0;

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Ll/mof0;->z()Lrx/c;

    .line 40
    .line 41
    .line 42
    return-void
.end method


# virtual methods
.method public g()V
    .locals 0

    .line 1
    invoke-static {}, Ll/yw0;->a()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/live/external/module/api/LiveSquareApi;->requestMyLiveHierarchy()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public h()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/tbs;->r()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public i()V
    .locals 1

    .line 1
    sget-boolean v0, Ll/tbs;->c:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-static {}, Ll/tdh0;->a()V

    .line 7
    .line 8
    .line 9
    sget-object v0, Ll/tbs;->b:Ll/vwt;

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/tbs;->s(Ll/vwt;)V

    .line 12
    .line 13
    .line 14
    sget-object p0, Ll/tbs;->b:Ll/vwt;

    .line 15
    .line 16
    invoke-static {p0}, Ll/tbs;->q(Ll/vwt;)V

    .line 17
    .line 18
    .line 19
    const/4 p0, 0x2

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
    invoke-static {}, Ll/ahn;->a()Ll/ahn;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0}, Ll/ahn;->e()V

    .line 31
    .line 32
    .line 33
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/live/external/module/api/LiveSquareApi;->requestMyLiveHierarchy()V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public j(Ll/vwt;)V
    .locals 0

    .line 1
    new-instance p0, Ll/f1s;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/f1s;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object p0, Ll/tbs;->e:Ll/f1s;

    .line 7
    .line 8
    sput-object p1, Ll/tbs;->b:Ll/vwt;

    .line 9
    .line 10
    new-instance p0, Ll/brf;

    .line 11
    .line 12
    invoke-direct {p0}, Ll/brf;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-static {p0}, Ll/e4s;->d(Ll/ctl;)V

    .line 16
    .line 17
    .line 18
    const/4 p0, 0x1

    .line 19
    sput-boolean p0, Ll/tbs;->c:Z

    .line 20
    .line 21
    return-void
.end method

.method public k(Z)V
    .locals 3

    .line 1
    sget-boolean v0, Ll/tbs;->c:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    if-eqz p1, :cond_4

    .line 6
    .line 7
    :cond_0
    const/4 p1, 0x1

    .line 8
    sput-boolean p1, Ll/tbs;->c:Z

    .line 9
    .line 10
    new-instance v0, Ll/f1s;

    .line 11
    .line 12
    invoke-direct {v0}, Ll/f1s;-><init>()V

    .line 13
    .line 14
    .line 15
    sput-object v0, Ll/tbs;->e:Ll/f1s;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/tbs;->l()Ll/j6t;

    .line 18
    .line 19
    .line 20
    new-instance v0, Ll/vwt;

    .line 21
    .line 22
    sget-object v1, Ll/tbs;->a:Landroid/app/Application;

    .line 23
    .line 24
    new-instance v2, Ll/qbs;

    .line 25
    .line 26
    invoke-direct {v2}, Ll/qbs;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-direct {v0, v1, v2}, Ll/vwt;-><init>(Landroid/content/Context;Ll/y20;)V

    .line 30
    .line 31
    .line 32
    sput-object v0, Ll/tbs;->b:Ll/vwt;

    .line 33
    .line 34
    invoke-virtual {p0, v0}, Ll/tbs;->s(Ll/vwt;)V

    .line 35
    .line 36
    .line 37
    sget-object p0, Landroid/os/Build;->BRAND:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    const-string v0, "realme"

    .line 44
    .line 45
    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    if-nez p0, :cond_1

    .line 50
    .line 51
    invoke-static {}, Ll/ive0;->l()Z

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    if-eqz p0, :cond_2

    .line 56
    .line 57
    :cond_1
    sget-object p0, Ll/tbs;->b:Ll/vwt;

    .line 58
    .line 59
    invoke-virtual {p0}, Ll/vwt;->s6()Z

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    if-eqz p0, :cond_2

    .line 64
    .line 65
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground()Lrx/c;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-virtual {p0, p1}, Lrx/c;->take(I)Lrx/c;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    new-instance p1, Ll/rbs;

    .line 74
    .line 75
    invoke-direct {p1}, Ll/rbs;-><init>()V

    .line 76
    .line 77
    .line 78
    invoke-static {p1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 83
    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_2
    invoke-static {p1}, Ll/wft;->b(I)Z

    .line 87
    .line 88
    .line 89
    move-result p0

    .line 90
    if-nez p0, :cond_3

    .line 91
    .line 92
    sget-object p0, Ll/tbs;->b:Ll/vwt;

    .line 93
    .line 94
    invoke-virtual {p0}, Ll/mof0;->k()Lrx/c;

    .line 95
    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_3
    sget-object p0, Ll/tbs;->b:Ll/vwt;

    .line 99
    .line 100
    invoke-virtual {p0}, Ll/mof0;->z()Lrx/c;

    .line 101
    .line 102
    .line 103
    :goto_0
    new-instance p0, Lcom/p1/mobile/putong/live/external/module/api/LiveAssertApi;

    .line 104
    .line 105
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/module/api/LiveAssertApi;-><init>()V

    .line 106
    .line 107
    .line 108
    sput-object p0, Ll/tbs;->d:Lcom/p1/mobile/putong/live/external/module/api/LiveAssertApi;

    .line 109
    .line 110
    const/4 p0, 0x2

    .line 111
    invoke-static {p0}, Ll/wft;->b(I)Z

    .line 112
    .line 113
    .line 114
    move-result p0

    .line 115
    if-nez p0, :cond_4

    .line 116
    .line 117
    invoke-static {}, Ll/ahn;->a()Ll/ahn;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    invoke-virtual {p0}, Ll/ahn;->e()V

    .line 122
    .line 123
    .line 124
    :cond_4
    return-void
.end method

.method public final l()Ll/j6t;
    .locals 0

    .line 1
    sget-object p0, Ll/tbs;->f:Ll/j6t;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    new-instance p0, Ll/j6t;

    .line 6
    .line 7
    invoke-direct {p0}, Ll/j6t;-><init>()V

    .line 8
    .line 9
    .line 10
    sput-object p0, Ll/tbs;->f:Ll/j6t;

    .line 11
    .line 12
    :cond_0
    sget-object p0, Ll/tbs;->f:Ll/j6t;

    .line 13
    .line 14
    return-object p0
.end method

.method public o()V
    .locals 0

    .line 1
    invoke-static {}, Ll/vb10;->v()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/ppi0;->l()Ll/ppi0;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0}, Ll/ppi0;->w()V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Ll/lwk0;->b()Ll/lwk0;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/lwk0;->a()V

    .line 16
    .line 17
    .line 18
    sget-object p0, Ll/tbs;->d:Lcom/p1/mobile/putong/live/external/module/api/LiveAssertApi;

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/module/api/LiveAssertApi;->clean()V

    .line 21
    .line 22
    .line 23
    invoke-static {}, Ll/mjj;->b()V

    .line 24
    .line 25
    .line 26
    invoke-static {}, Ll/mbs;->G()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-interface {p0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->r9()Ll/c8m0;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-interface {p0}, Ll/c8m0;->a()V

    .line 35
    .line 36
    .line 37
    const/4 p0, 0x0

    .line 38
    sput-boolean p0, Ll/tbs;->c:Z

    .line 39
    .line 40
    return-void
.end method

.method public final r()V
    .locals 2

    .line 1
    invoke-static {}, Ll/srf;->a()Ll/srf;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Lcom/p1/mobile/android/app/ExtraActLifecycle;->onInitDataOnCreate:Lcom/p1/mobile/android/app/ExtraActLifecycle;

    .line 6
    .line 7
    new-instance v1, Ll/sbs;

    .line 8
    .line 9
    invoke-direct {v1}, Ll/sbs;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v0, v1}, Ll/srf;->b(Lcom/p1/mobile/android/app/ExtraActLifecycle;Ll/y20;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final s(Ll/vwt;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/mof0;->k()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {}, Ll/mbs;->I()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/obs;

    .line 10
    .line 11
    invoke-direct {v1}, Ll/obs;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-static {p0, v0, v1}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const/4 v0, 0x1

    .line 19
    invoke-virtual {p0, v0}, Lrx/c;->take(I)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    new-instance v0, Ll/pbs;

    .line 24
    .line 25
    invoke-direct {v0, p1}, Ll/pbs;-><init>(Ll/vwt;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v0}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 33
    .line 34
    .line 35
    return-void
.end method
