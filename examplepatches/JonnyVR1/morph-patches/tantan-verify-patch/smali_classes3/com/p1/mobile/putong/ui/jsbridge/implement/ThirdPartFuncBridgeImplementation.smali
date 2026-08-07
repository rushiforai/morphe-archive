.class public Lcom/p1/mobile/putong/ui/jsbridge/implement/ThirdPartFuncBridgeImplementation;
.super Ll/lf2;
.source "SourceFile"


# instance fields
.field public a:Ll/ft5;

.field public b:Ll/kcg0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public c:Lcom/p1/mobile/android/app/Dialog;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public d:Ll/kcg0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/lf2;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/ft5;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/ft5;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/ThirdPartFuncBridgeImplementation;->a:Ll/ft5;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/ThirdPartFuncBridgeImplementation;->b:Ll/kcg0;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/ThirdPartFuncBridgeImplementation;->d:Ll/kcg0;

    .line 15
    .line 16
    return-void
.end method

.method public static synthetic c(Ll/aqq;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    const-string v0, "[putong-common][zhimaauth]"

    .line 6
    .line 7
    if-eqz p3, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/aqq;->d()Ll/hqq;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {p0, p1}, Ll/hqq;->a(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string p0, "zhiMaAuth success in jsBridge"

    .line 17
    .line 18
    invoke-static {v0, p0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    invoke-virtual {p0}, Ll/aqq;->d()Ll/hqq;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const/4 p1, 0x0

    .line 27
    new-array p1, p1, [Ljava/lang/String;

    .line 28
    .line 29
    invoke-interface {p0, p2, p1}, Ll/hqq;->b(Ljava/lang/String;[Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    const-string p0, "zhiMaAuth fail in jsBridge"

    .line 33
    .line 34
    invoke-static {v0, p0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public static synthetic d(Ll/bqq;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/bqq;->d()Ll/hqq;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0, p1}, Ll/hqq;->a(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic e(Ll/bqq;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/bqq;->d()Ll/hqq;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0, p1}, Ll/hqq;->a(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/ui/jsbridge/implement/ThirdPartFuncBridgeImplementation;Ll/bqq;ZLjava/lang/String;Ljava/lang/String;Ll/y20;Ll/z20;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/ui/jsbridge/implement/ThirdPartFuncBridgeImplementation;->s(Ll/bqq;ZLjava/lang/String;Ljava/lang/String;Ll/y20;Ll/z20;)V

    return-void
.end method

.method public static synthetic g(Ll/ipq0$b;)Lrx/c;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ipq0$b;->c:Landroid/net/Uri;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/net/Uri;->getEncodedQuery()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Ll/ipq0;->b(Ljava/lang/String;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic h(Ll/bqq;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/bqq;->d()Ll/hqq;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    filled-new-array {p2}, [Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-interface {p0, p1, p2}, Ll/hqq;->b(Ljava/lang/String;[Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/ui/jsbridge/implement/ThirdPartFuncBridgeImplementation;Ll/bqq;Ll/z20;Ljava/lang/String;Ll/y20;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Lcom/p1/mobile/putong/ui/jsbridge/implement/ThirdPartFuncBridgeImplementation;->r(Ll/bqq;Ll/z20;Ljava/lang/String;Ll/y20;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic j(Ll/ipq0$b;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ipq0$b;->c:Landroid/net/Uri;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget p0, p0, Ll/ipq0$b;->b:I

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    if-ne p0, v0, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 v0, 0x0

    .line 12
    :goto_0
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public static synthetic k(Ll/aqq;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    const-string v0, "[putong-common][zhimaauth]"

    .line 2
    .line 3
    const-string v1, "zhiMaAuth fail in jsBridge"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    instance-of v0, p2, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    check-cast p2, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 13
    .line 14
    iget p2, p2, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->subCode:I

    .line 15
    .line 16
    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    invoke-virtual {p0}, Ll/aqq;->d()Ll/hqq;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    filled-new-array {p2}, [Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    invoke-interface {p0, p1, p2}, Ll/hqq;->b(Ljava/lang/String;[Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    invoke-virtual {p0}, Ll/aqq;->d()Ll/hqq;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    const/4 p2, 0x0

    .line 37
    new-array p2, p2, [Ljava/lang/String;

    .line 38
    .line 39
    invoke-interface {p0, p1, p2}, Ll/hqq;->b(Ljava/lang/String;[Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public static synthetic l(Lcom/p1/mobile/putong/ui/jsbridge/implement/ThirdPartFuncBridgeImplementation;Ll/bqq;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Lcom/p1/mobile/putong/ui/jsbridge/implement/ThirdPartFuncBridgeImplementation;->q(Ll/bqq;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic m(Ll/bqq;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/bqq;->d()Ll/hqq;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    filled-new-array {p2}, [Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-interface {p0, p1, p2}, Ll/hqq;->b(Ljava/lang/String;[Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/putong/ui/jsbridge/implement/ThirdPartFuncBridgeImplementation;Ll/aqq;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/ui/jsbridge/implement/ThirdPartFuncBridgeImplementation;->u(Ll/aqq;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public declared-synchronized a()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/ThirdPartFuncBridgeImplementation;->b:Ll/kcg0;

    .line 3
    .line 4
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/ThirdPartFuncBridgeImplementation;->b:Ll/kcg0;

    .line 11
    .line 12
    invoke-interface {v0}, Ll/kcg0;->unsubscribe()V

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catchall_0
    move-exception v0

    .line 17
    goto :goto_1

    .line 18
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/ThirdPartFuncBridgeImplementation;->c:Lcom/p1/mobile/android/app/Dialog;

    .line 19
    .line 20
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/ThirdPartFuncBridgeImplementation;->c:Lcom/p1/mobile/android/app/Dialog;

    .line 27
    .line 28
    invoke-virtual {v0}, Ll/g1e;->dismiss()V

    .line 29
    .line 30
    .line 31
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/ThirdPartFuncBridgeImplementation;->a:Ll/ft5;

    .line 32
    .line 33
    invoke-virtual {v0}, Ll/ft5;->c()V

    .line 34
    .line 35
    .line 36
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

.method public bindAlipay(Ll/aqq;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1    # Ll/aqq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation runtime Ll/lkq;
        key = "bindAlipay"
    .end annotation

    const/4 v0, 0x0

    .line 23
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/p1/mobile/putong/ui/jsbridge/implement/ThirdPartFuncBridgeImplementation;->o(Ll/bqq;Ljava/lang/String;Ljava/lang/String;Z)V

    return-void
.end method

.method public bindAlipay(Ll/aqq;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0
    .param p1    # Ll/aqq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation runtime Ll/lkq;
        key = "bindAlipay"
    .end annotation

    .line 24
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/ui/jsbridge/implement/ThirdPartFuncBridgeImplementation;->o(Ll/bqq;Ljava/lang/String;Ljava/lang/String;Z)V

    return-void
.end method

.method public bindAlipay(Ll/xc00;Lorg/json/JSONObject;)V
    .locals 3
    .param p1    # Ll/xc00;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation runtime Ll/lkq;
        isMkBridge = true
        key = "bindAlipay"
        nameSpace = "tantan_third_party"
    .end annotation

    .line 1
    const-string v0, "success"

    .line 2
    .line 3
    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "fail"

    .line 8
    .line 9
    invoke-virtual {p2, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const-string v2, "skipLiveAlert"

    .line 14
    .line 15
    invoke-virtual {p2, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    invoke-virtual {p0, p1, v0, v1, p2}, Lcom/p1/mobile/putong/ui/jsbridge/implement/ThirdPartFuncBridgeImplementation;->o(Ll/bqq;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public bindZhimaAuth(Ll/aqq;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1    # Ll/aqq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p5    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation runtime Ll/lkq;
        key = "bindZhimaAuth"
    .end annotation

    .line 1
    invoke-virtual {p1}, Ll/aqq;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/irq;->f(Landroid/content/Context;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p1}, Ll/aqq;->d()Ll/hqq;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string p1, "1000001"

    .line 16
    .line 17
    filled-new-array {p1}, [Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-interface {p0, p5, p1}, Ll/hqq;->b(Ljava/lang/String;[Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    invoke-static {p2, p3}, Ll/irq;->h(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    new-instance p3, Lcom/p1/mobile/putong/ui/jsbridge/implement/ThirdPartFuncBridgeImplementation$a;

    .line 30
    .line 31
    invoke-direct {p3, p0, p1, p5, p4}, Lcom/p1/mobile/putong/ui/jsbridge/implement/ThirdPartFuncBridgeImplementation$a;-><init>(Lcom/p1/mobile/putong/ui/jsbridge/implement/ThirdPartFuncBridgeImplementation;Ll/aqq;Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-static {p3}, Ll/psd0;->L(Ll/bb50;)Lcom/p1/mobile/android/rx/a;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p2, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/ThirdPartFuncBridgeImplementation;->a:Ll/ft5;

    .line 43
    .line 44
    invoke-virtual {p0, p1}, Ll/ft5;->a(Ll/kcg0;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public final o(Ll/bqq;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 7
    .param p1    # Ll/bqq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/ThirdPartFuncBridgeImplementation;->b:Ll/kcg0;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/ThirdPartFuncBridgeImplementation;->b:Ll/kcg0;

    .line 10
    .line 11
    invoke-interface {v0}, Ll/kcg0;->unsubscribe()V

    .line 12
    .line 13
    .line 14
    :cond_0
    invoke-static {}, Ll/irq;->g()Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/lvi0;

    .line 19
    .line 20
    move-object v2, p0

    .line 21
    move-object v3, p1

    .line 22
    move-object v5, p2

    .line 23
    move-object v6, p3

    .line 24
    move v4, p4

    .line 25
    invoke-direct/range {v1 .. v6}, Ll/lvi0;-><init>(Lcom/p1/mobile/putong/ui/jsbridge/implement/ThirdPartFuncBridgeImplementation;Ll/bqq;ZLjava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    iput-object p0, v2, Lcom/p1/mobile/putong/ui/jsbridge/implement/ThirdPartFuncBridgeImplementation;->b:Ll/kcg0;

    .line 37
    .line 38
    return-void
.end method

.method public final p(Ll/bqq;ZLjava/lang/String;Ljava/lang/String;Ll/y20;Ll/z20;)V
    .locals 7
    .param p1    # Ll/bqq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/bqq;",
            "Z",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;",
            "Ll/z20<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ll/bqq;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/irq;->f(Landroid/content/Context;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    const-string p0, "1000001"

    .line 12
    .line 13
    invoke-interface {p6, p4, p0}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    new-instance v0, Ll/vvi0;

    .line 18
    .line 19
    move-object v1, p0

    .line 20
    move-object v2, p1

    .line 21
    move-object v6, p3

    .line 22
    move-object v4, p4

    .line 23
    move-object v5, p5

    .line 24
    move-object v3, p6

    .line 25
    invoke-direct/range {v0 .. v6}, Ll/vvi0;-><init>(Lcom/p1/mobile/putong/ui/jsbridge/implement/ThirdPartFuncBridgeImplementation;Ll/bqq;Ll/z20;Ljava/lang/String;Ll/y20;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    if-nez p2, :cond_1

    .line 29
    .line 30
    invoke-interface {v2}, Ll/bqq;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    const-string p1, "\u7ed1\u5b9a\u548c\u5f00\u64ad\u8ba4\u8bc1\u8eab\u4efd\u59d3\u540d\u76f8\u540c\u7684\u652f\u4ed8\u5b9d\u8d26\u53f7\u624d\u80fd\u6210\u529f\u63d0\u73b0"

    .line 39
    .line 40
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->F(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    const-string p1, "\u524d\u5f80\u7ed1\u5b9a"

    .line 45
    .line 46
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/android/app/Dialog$e;->v0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    const-string p1, "\u5173\u95ed"

    .line 51
    .line 52
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->m0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    const/4 p1, 0x1

    .line 57
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    iput-object p0, v1, Lcom/p1/mobile/putong/ui/jsbridge/implement/ThirdPartFuncBridgeImplementation;->c:Lcom/p1/mobile/android/app/Dialog;

    .line 66
    .line 67
    return-void

    .line 68
    :cond_1
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public final synthetic q(Ll/bqq;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;)V
    .locals 7

    .line 1
    invoke-virtual {p5}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v5, Ll/rvi0;

    .line 8
    .line 9
    invoke-direct {v5, p1}, Ll/rvi0;-><init>(Ll/bqq;)V

    .line 10
    .line 11
    .line 12
    new-instance v6, Ll/svi0;

    .line 13
    .line 14
    invoke-direct {v6, p1}, Ll/svi0;-><init>(Ll/bqq;)V

    .line 15
    .line 16
    .line 17
    move-object v0, p0

    .line 18
    move-object v1, p1

    .line 19
    move v2, p2

    .line 20
    move-object v3, p3

    .line 21
    move-object v4, p4

    .line 22
    invoke-virtual/range {v0 .. v6}, Lcom/p1/mobile/putong/ui/jsbridge/implement/ThirdPartFuncBridgeImplementation;->t(Ll/bqq;ZLjava/lang/String;Ljava/lang/String;Ll/y20;Ll/z20;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    new-instance v5, Ll/tvi0;

    .line 27
    .line 28
    invoke-direct {v5, p1}, Ll/tvi0;-><init>(Ll/bqq;)V

    .line 29
    .line 30
    .line 31
    new-instance v6, Ll/uvi0;

    .line 32
    .line 33
    invoke-direct {v6, p1}, Ll/uvi0;-><init>(Ll/bqq;)V

    .line 34
    .line 35
    .line 36
    move-object v0, p0

    .line 37
    move-object v1, p1

    .line 38
    move v2, p2

    .line 39
    move-object v3, p3

    .line 40
    move-object v4, p4

    .line 41
    invoke-virtual/range {v0 .. v6}, Lcom/p1/mobile/putong/ui/jsbridge/implement/ThirdPartFuncBridgeImplementation;->p(Ll/bqq;ZLjava/lang/String;Ljava/lang/String;Ll/y20;Ll/z20;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public final synthetic r(Ll/bqq;Ll/z20;Ljava/lang/String;Ll/y20;Ljava/lang/String;)V
    .locals 6

    .line 1
    invoke-interface {p1}, Ll/bqq;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1}, Ll/irq;->c(Landroid/app/Activity;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    new-instance v0, Lcom/p1/mobile/putong/ui/jsbridge/implement/ThirdPartFuncBridgeImplementation$b;

    .line 10
    .line 11
    move-object v1, p0

    .line 12
    move-object v2, p2

    .line 13
    move-object v3, p3

    .line 14
    move-object v4, p4

    .line 15
    move-object v5, p5

    .line 16
    invoke-direct/range {v0 .. v5}, Lcom/p1/mobile/putong/ui/jsbridge/implement/ThirdPartFuncBridgeImplementation$b;-><init>(Lcom/p1/mobile/putong/ui/jsbridge/implement/ThirdPartFuncBridgeImplementation;Ll/z20;Ljava/lang/String;Ll/y20;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v0}, Ll/psd0;->L(Ll/bb50;)Lcom/p1/mobile/android/rx/a;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    iget-object p1, v1, Lcom/p1/mobile/putong/ui/jsbridge/implement/ThirdPartFuncBridgeImplementation;->a:Ll/ft5;

    .line 28
    .line 29
    invoke-virtual {p1, p0}, Ll/ft5;->a(Ll/kcg0;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final synthetic s(Ll/bqq;ZLjava/lang/String;Ljava/lang/String;Ll/y20;Ll/z20;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/ui/jsbridge/implement/ThirdPartFuncBridgeImplementation;->p(Ll/bqq;ZLjava/lang/String;Ljava/lang/String;Ll/y20;Ll/z20;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final t(Ll/bqq;ZLjava/lang/String;Ljava/lang/String;Ll/y20;Ll/z20;)V
    .locals 8
    .param p1    # Ll/bqq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/bqq;",
            "Z",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;",
            "Ll/z20<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/mvi0;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move-object v2, p1

    .line 5
    move v3, p2

    .line 6
    move-object v4, p3

    .line 7
    move-object v5, p4

    .line 8
    move-object v6, p5

    .line 9
    move-object v7, p6

    .line 10
    invoke-direct/range {v0 .. v7}, Ll/mvi0;-><init>(Lcom/p1/mobile/putong/ui/jsbridge/implement/ThirdPartFuncBridgeImplementation;Ll/bqq;ZLjava/lang/String;Ljava/lang/String;Ll/y20;Ll/z20;)V

    .line 11
    .line 12
    .line 13
    sget-object p0, Ll/uqb0;->c0:Ll/bn5;

    .line 14
    .line 15
    invoke-interface {v2}, Ll/bqq;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-interface {p0, p1, v0}, Ll/bn5;->c2(Lcom/p1/mobile/putong/app/PutongAct;Ll/x20;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final u(Ll/aqq;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1    # Ll/aqq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/ThirdPartFuncBridgeImplementation;->d:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "[putong-common][zhimaauth]"

    .line 7
    .line 8
    const-string v1, "start zhiMaAuth in jsBridge"

    .line 9
    .line 10
    invoke-static {v0, v1}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1}, Ll/aqq;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {}, Ll/ipq0;->a()Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    new-instance v2, Ll/nvi0;

    .line 22
    .line 23
    invoke-direct {v2}, Ll/nvi0;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    new-instance v2, Ll/ovi0;

    .line 31
    .line 32
    invoke-direct {v2}, Ll/ovi0;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v1, v2}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    const/4 v2, 0x0

    .line 40
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;Z)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    new-instance v1, Ll/pvi0;

    .line 45
    .line 46
    invoke-direct {v1, p1, p3, p4}, Ll/pvi0;-><init>(Ll/aqq;Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    new-instance p3, Ll/qvi0;

    .line 50
    .line 51
    invoke-direct {p3, p1, p4}, Ll/qvi0;-><init>(Ll/aqq;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    invoke-static {v1, p3}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 55
    .line 56
    .line 57
    move-result-object p3

    .line 58
    invoke-virtual {v0, p3}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 59
    .line 60
    .line 61
    move-result-object p3

    .line 62
    iput-object p3, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/ThirdPartFuncBridgeImplementation;->d:Ll/kcg0;

    .line 63
    .line 64
    invoke-virtual {p1}, Ll/aqq;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-virtual {p1}, Ll/aqq;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    const-string p3, "from_h5"

    .line 73
    .line 74
    invoke-static {p1, p2, p3}, Lcom/p1/mobile/putong/ui/ZhiMaAuthAct;->I1(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 79
    .line 80
    .line 81
    return-void
.end method
