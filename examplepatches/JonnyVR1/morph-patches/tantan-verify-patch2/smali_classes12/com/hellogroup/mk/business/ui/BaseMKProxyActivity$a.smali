.class Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/hellogroup/mk/business/base/ui/MKWebView$f;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;


# direct methods
.method public constructor <init>(Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$a;->a:Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic e(Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$a;Ljava/lang/String;I)V
    .locals 10

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const-string v0, "MKActivity"

    .line 5
    .line 6
    const-string v1, "loadError"

    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/jzv;->g(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$a;->a:Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-virtual {v0, v2, v2, v1}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->D2(ZZLjava/lang/String;)V

    .line 15
    .line 16
    .line 17
    iget-object v3, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$a;->a:Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;

    .line 18
    .line 19
    invoke-static {v3, p2}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->m1(Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;I)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v8

    .line 23
    invoke-static {}, Ll/wi20;->a()I

    .line 24
    .line 25
    .line 26
    move-result p2

    .line 27
    const/4 v0, -0x1

    .line 28
    if-eq p2, v0, :cond_0

    .line 29
    .line 30
    const/4 v2, 0x1

    .line 31
    :cond_0
    move v9, v2

    .line 32
    const/4 v4, 0x1

    .line 33
    const/4 v6, 0x0

    .line 34
    const-string v7, "loadError"

    .line 35
    .line 36
    move-object v5, p1

    .line 37
    invoke-virtual/range {v3 .. v9}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->F2(ZLjava/lang/String;ZLjava/lang/String;Ljava/lang/String;Z)V

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$a;->a:Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;

    .line 41
    .line 42
    invoke-static {p0}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->n1(Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public static synthetic f(Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$a;ZLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$a;->g(ZLjava/lang/String;)V

    return-void
.end method

.method private synthetic g(ZLjava/lang/String;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$a;->a:Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-string v2, "native"

    .line 5
    .line 6
    const/4 v3, 0x1

    .line 7
    invoke-virtual {v0, v3, v1, v2}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->D2(ZZLjava/lang/String;)V

    .line 8
    .line 9
    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    iget-object p1, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$a;->a:Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;

    .line 13
    .line 14
    invoke-static {p1}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->n1(Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$a;->a:Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;

    .line 18
    .line 19
    invoke-static {p1}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->p1(Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    int-to-long v0, v0

    .line 24
    sget-object v2, Lcom/hellogroup/common/thread/MMThreadExecutors;->INSTANCE:Lcom/hellogroup/common/thread/MMThreadExecutors;

    .line 25
    .line 26
    invoke-virtual {v2}, Lcom/hellogroup/common/thread/MMThreadExecutors;->a()Ll/tl80;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-interface {v2}, Ll/tl80;->a()Lio/reactivex/Scheduler;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 35
    .line 36
    invoke-static {v0, v1, v3, v2}, Lio/reactivex/Flowable;->timer(JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)Lio/reactivex/Flowable;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    new-instance v1, Lcom/hellogroup/mk/business/ui/c;

    .line 41
    .line 42
    invoke-direct {v1, p0, p2}, Lcom/hellogroup/mk/business/ui/c;-><init>(Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$a;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, v1}, Lio/reactivex/Flowable;->subscribe(Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-static {p1, p0}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->o1(Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;Lio/reactivex/disposables/Disposable;)Lio/reactivex/disposables/Disposable;

    .line 50
    .line 51
    .line 52
    :cond_0
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$a;->a:Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->Q2()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$a;->a:Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;

    .line 10
    .line 11
    invoke-static {p0, p1}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->f1(Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public b(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$a;->a:Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->Q2()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$a;->a:Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;

    .line 10
    .line 11
    invoke-static {p0, p1}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->f1(Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public c(Ljava/lang/String;Z)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "loadUrlStart url --> "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "MKActivity"

    .line 16
    .line 17
    invoke-static {v1, v0}, Ll/jzv;->g(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$a;->a:Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;

    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    iput-boolean v1, v0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->P:Z

    .line 24
    .line 25
    invoke-static {v0}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->d1(Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    new-instance v1, Lcom/hellogroup/mk/business/ui/a;

    .line 30
    .line 31
    invoke-direct {v1, p0, p2, p1}, Lcom/hellogroup/mk/business/ui/a;-><init>(Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$a;ZLjava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-static {v0, v1}, Ll/x310;->c(Ljava/lang/Object;Ljava/lang/Runnable;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public d(Ljava/lang/String;ILjava/lang/String;)V
    .locals 1

    .line 1
    iget-object p3, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$a;->a:Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    iput-boolean v0, p3, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->P:Z

    .line 5
    .line 6
    invoke-static {p3}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->d1(Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p3

    .line 10
    new-instance v0, Lcom/hellogroup/mk/business/ui/b;

    .line 11
    .line 12
    invoke-direct {v0, p0, p1, p2}, Lcom/hellogroup/mk/business/ui/b;-><init>(Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$a;Ljava/lang/String;I)V

    .line 13
    .line 14
    .line 15
    invoke-static {p3, v0}, Ll/x310;->c(Ljava/lang/Object;Ljava/lang/Runnable;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
