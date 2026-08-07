.class public Lcom/p1/mobile/putong/ui/jsbridge/implement/ActionBridgeImplementation;
.super Ll/lf2;
.source "SourceFile"


# instance fields
.field public a:Ll/kcg0;

.field public b:Ll/kcg0;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/lf2;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/android/app/Act$r;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

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

.method public static synthetic d(Ll/aqq;Ljava/lang/String;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-nez p2, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/aqq;->d()Ll/hqq;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-interface {p0, p1}, Ll/hqq;->a(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/android/app/Act$r;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

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

.method public static synthetic f(Ll/aqq;Ljava/lang/String;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/aqq;->d()Ll/hqq;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-interface {p0, p1}, Ll/hqq;->a(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method


# virtual methods
.method public declared-synchronized a()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/ActionBridgeImplementation;->a:Ll/kcg0;

    .line 3
    .line 4
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/4 v1, 0x0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/ActionBridgeImplementation;->a:Ll/kcg0;

    .line 12
    .line 13
    invoke-interface {v0}, Ll/kcg0;->unsubscribe()V

    .line 14
    .line 15
    .line 16
    iput-object v1, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/ActionBridgeImplementation;->a:Ll/kcg0;

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :catchall_0
    move-exception v0

    .line 20
    goto :goto_1

    .line 21
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/ActionBridgeImplementation;->b:Ll/kcg0;

    .line 22
    .line 23
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/ActionBridgeImplementation;->b:Ll/kcg0;

    .line 30
    .line 31
    invoke-interface {v0}, Ll/kcg0;->unsubscribe()V

    .line 32
    .line 33
    .line 34
    iput-object v1, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/ActionBridgeImplementation;->b:Ll/kcg0;

    .line 35
    .line 36
    :cond_1
    invoke-super {p0}, Ll/lf2;->a()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 37
    .line 38
    .line 39
    monitor-exit p0

    .line 40
    return-void

    .line 41
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 42
    throw v0
.end method

.method public subscribe(Ll/aqq;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1    # Ll/aqq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation runtime Ll/lkq;
        key = "subscribe"
    .end annotation

    .line 1
    const-string p5, "onAppEnterBackground"

    .line 2
    .line 3
    invoke-virtual {p2, p5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p5

    .line 7
    if-eqz p5, :cond_0

    .line 8
    .line 9
    iget-object p2, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/ActionBridgeImplementation;->b:Ll/kcg0;

    .line 10
    .line 11
    if-nez p2, :cond_1

    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground()Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    new-instance p5, Ll/g30;

    .line 18
    .line 19
    invoke-direct {p5}, Ll/g30;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p2, p5}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    invoke-virtual {p2}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    new-instance p5, Ll/h30;

    .line 31
    .line 32
    invoke-direct {p5, p1, p3}, Ll/h30;-><init>(Ll/aqq;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-static {p5}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 36
    .line 37
    .line 38
    move-result-object p3

    .line 39
    invoke-virtual {p2, p3}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    iput-object p2, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/ActionBridgeImplementation;->b:Ll/kcg0;

    .line 44
    .line 45
    invoke-virtual {p1}, Ll/aqq;->d()Ll/hqq;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-interface {p0, p4}, Ll/hqq;->a(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_0
    const-string p5, "onAppEnterForeground"

    .line 54
    .line 55
    invoke-virtual {p2, p5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result p2

    .line 59
    if-eqz p2, :cond_1

    .line 60
    .line 61
    iget-object p2, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/ActionBridgeImplementation;->a:Ll/kcg0;

    .line 62
    .line 63
    if-nez p2, :cond_1

    .line 64
    .line 65
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground()Lrx/c;

    .line 66
    .line 67
    .line 68
    move-result-object p2

    .line 69
    new-instance p5, Ll/i30;

    .line 70
    .line 71
    invoke-direct {p5}, Ll/i30;-><init>()V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p2, p5}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 75
    .line 76
    .line 77
    move-result-object p2

    .line 78
    invoke-virtual {p2}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 79
    .line 80
    .line 81
    move-result-object p2

    .line 82
    new-instance p5, Ll/j30;

    .line 83
    .line 84
    invoke-direct {p5, p1, p3}, Ll/j30;-><init>(Ll/aqq;Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    invoke-static {p5}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 88
    .line 89
    .line 90
    move-result-object p3

    .line 91
    invoke-virtual {p2, p3}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 92
    .line 93
    .line 94
    move-result-object p2

    .line 95
    iput-object p2, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/ActionBridgeImplementation;->a:Ll/kcg0;

    .line 96
    .line 97
    invoke-virtual {p1}, Ll/aqq;->d()Ll/hqq;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    invoke-interface {p0, p4}, Ll/hqq;->a(Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    :cond_1
    return-void
.end method
