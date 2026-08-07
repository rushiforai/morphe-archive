.class public Ll/uc4;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ljava/lang/String;

.field public static b:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Ll/qv5;->b()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, Ll/uc4;->a:Ljava/lang/String;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    sput-boolean v0, Ll/uc4;->b:Z

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Lkotlin/Unit;)Ll/uxj0;
    .locals 0

    .line 1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b(Ll/uxj0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic c(Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/uc4;->h(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic d(Lkotlin/Unit;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/uc4;->k()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static f()Z
    .locals 1

    .line 1
    :try_start_0
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/xeengine/XEnginePreferences;->setApplicationContext(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/momo/xeengine/XEnginePreferences;->checkEngineEnv()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    return v0

    .line 11
    :catchall_0
    const/4 v0, 0x0

    .line 12
    return v0
.end method

.method public static g(Ljava/lang/String;)Z
    .locals 4

    .line 1
    invoke-static {p0}, Ll/uc4;->m(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Double;->valueOf(Ljava/lang/String;)Ljava/lang/Double;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    const-wide/high16 v2, 0x401c000000000000L    # 7.0

    .line 16
    .line 17
    cmpg-double v0, v0, v2

    .line 18
    .line 19
    if-gtz v0, :cond_0

    .line 20
    .line 21
    invoke-static {p0}, Ljava/lang/Double;->valueOf(Ljava/lang/String;)Ljava/lang/Double;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    .line 26
    .line 27
    .line 28
    move-result-wide v0

    .line 29
    cmpl-double p0, v0, v2

    .line 30
    .line 31
    if-ltz p0, :cond_0

    .line 32
    .line 33
    const/4 p0, 0x1

    .line 34
    return p0

    .line 35
    :cond_0
    const/4 p0, 0x0

    .line 36
    return p0
.end method

.method public static h(Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/oc4;->E()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static i()Z
    .locals 2

    .line 1
    invoke-static {}, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;->k()Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "b_feed"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;->q(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    return v0
.end method

.method public static j()V
    .locals 3

    .line 1
    invoke-static {}, Ll/uc4;->n()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Lrx/schedulers/Schedulers;->io()Ll/f2e0;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/pc4;

    .line 14
    .line 15
    invoke-direct {v1}, Ll/pc4;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    new-instance v1, Ll/qc4;

    .line 31
    .line 32
    invoke-direct {v1}, Ll/qc4;-><init>()V

    .line 33
    .line 34
    .line 35
    new-instance v2, Ll/rc4;

    .line 36
    .line 37
    invoke-direct {v2}, Ll/rc4;-><init>()V

    .line 38
    .line 39
    .line 40
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public static k()V
    .locals 1

    .line 1
    sget-boolean v0, Ll/uc4;->b:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/momo/xeengine/XEnginePreferences;->setApplicationContext(Landroid/content/Context;)V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Ll/uc4;->l()V

    .line 12
    .line 13
    .line 14
    const/4 v0, 0x1

    .line 15
    sput-boolean v0, Ll/uc4;->b:Z

    .line 16
    .line 17
    return-void
.end method

.method public static l()V
    .locals 5

    .line 1
    new-instance v0, Ll/uc4$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/uc4$a;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/vxd0;

    .line 7
    .line 8
    const-string v2, "last_immediately_code"

    .line 9
    .line 10
    const/4 v3, 0x0

    .line 11
    invoke-direct {v1, v2, v3}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 12
    .line 13
    .line 14
    new-instance v2, Lcom/mm/mediasdk/bean/RecorderInitConfig$b;

    .line 15
    .line 16
    sget-object v3, Ll/uc4;->a:Ljava/lang/String;

    .line 17
    .line 18
    invoke-direct {v2, v3}, Lcom/mm/mediasdk/bean/RecorderInitConfig$b;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    sget-object v3, Ll/uqb0;->s:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {v2, v3}, Lcom/mm/mediasdk/bean/RecorderInitConfig$b;->k(Ljava/lang/String;)Lcom/mm/mediasdk/bean/RecorderInitConfig$b;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    sget v3, Ll/uqb0;->t:I

    .line 28
    .line 29
    invoke-virtual {v2, v3}, Lcom/mm/mediasdk/bean/RecorderInitConfig$b;->j(I)Lcom/mm/mediasdk/bean/RecorderInitConfig$b;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    invoke-interface {v3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    invoke-virtual {v2, v3}, Lcom/mm/mediasdk/bean/RecorderInitConfig$b;->i(Ljava/lang/String;)Lcom/mm/mediasdk/bean/RecorderInitConfig$b;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    check-cast v3, Ljava/lang/Integer;

    .line 50
    .line 51
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 52
    .line 53
    .line 54
    move-result v3

    .line 55
    sget v4, Ll/uqb0;->t:I

    .line 56
    .line 57
    if-ne v3, v4, :cond_0

    .line 58
    .line 59
    const/16 v1, 0x5a0

    .line 60
    .line 61
    invoke-virtual {v2, v1}, Lcom/mm/mediasdk/bean/RecorderInitConfig$b;->h(I)Lcom/mm/mediasdk/bean/RecorderInitConfig$b;

    .line 62
    .line 63
    .line 64
    const-wide/32 v3, 0x5265c00

    .line 65
    .line 66
    .line 67
    iput-wide v3, v0, Ll/ysd0;->a:J

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_0
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 71
    .line 72
    .line 73
    move-result-object v3

    .line 74
    invoke-virtual {v1, v3}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    :goto_0
    invoke-static {}, Ll/mx3;->e()Ll/mx3;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    sget-object v3, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 82
    .line 83
    invoke-virtual {v1, v3, v0}, Ll/mx3;->g(Landroid/content/Context;Ll/ysd0;)V

    .line 84
    .line 85
    .line 86
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 87
    .line 88
    invoke-virtual {v2}, Lcom/mm/mediasdk/bean/RecorderInitConfig$b;->g()Lcom/mm/mediasdk/bean/RecorderInitConfig;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    invoke-static {v0, v1}, Ll/be00;->c(Landroid/app/Application;Lcom/mm/mediasdk/bean/RecorderInitConfig;)V

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method public static m(Ljava/lang/String;)Z
    .locals 1

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    const-string v0, ""

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const-string v0, "^[1-9]\\d*\\.\\d*|0\\.\\d*[1-9]\\d*$"

    .line 13
    .line 14
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->matches()Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    return p0

    .line 27
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 28
    return p0
.end method

.method public static n()Lrx/c;
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
    invoke-static {}, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;->k()Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "b_feed"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;->r(Ljava/lang/String;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/sc4;

    .line 12
    .line 13
    invoke-direct {v1}, Ll/sc4;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/tc4;

    .line 21
    .line 22
    invoke-direct {v1}, Ll/tc4;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    return-object v0
.end method
