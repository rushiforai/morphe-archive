.class public abstract Ll/cyr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/k3m;
.implements Ll/ner;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V::",
        "Ll/iam;",
        ">",
        "Ljava/lang/Object;",
        "Ll/k3m<",
        "TV;>;",
        "Ll/ner;"
    }
.end annotation


# instance fields
.field protected volatile endSubscribeSignal:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field protected lifecycleProviderImpl:Ll/ner;

.field protected viewModel:Ll/iam;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TV;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/cyr;->endSubscribeSignal:Lrx/subjects/b;

    .line 9
    .line 10
    iput-object p1, p0, Ll/cyr;->lifecycleProviderImpl:Ll/ner;

    .line 11
    .line 12
    return-void
.end method

.method public static synthetic i2(Lrx/c;)Lrx/c;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic k2(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->f:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-eq p0, v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/android/app/c;->c:Ljava/lang/String;

    .line 6
    .line 7
    const-string v1, "CreateView"

    .line 8
    .line 9
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    sget-object v0, Lcom/p1/mobile/android/app/c;->g:Lcom/p1/mobile/android/app/c;

    .line 16
    .line 17
    if-eq p0, v0, :cond_1

    .line 18
    .line 19
    sget-object v0, Lcom/p1/mobile/android/app/c;->h:Lcom/p1/mobile/android/app/c;

    .line 20
    .line 21
    if-eq p0, v0, :cond_1

    .line 22
    .line 23
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 24
    .line 25
    if-eq p0, v0, :cond_1

    .line 26
    .line 27
    sget-object v0, Lcom/p1/mobile/android/app/c;->k:Lcom/p1/mobile/android/app/c;

    .line 28
    .line 29
    if-eq p0, v0, :cond_1

    .line 30
    .line 31
    sget-object v0, Lcom/p1/mobile/android/app/c;->l:Lcom/p1/mobile/android/app/c;

    .line 32
    .line 33
    if-eq p0, v0, :cond_1

    .line 34
    .line 35
    sget-object v0, Lcom/p1/mobile/android/app/c;->m:Lcom/p1/mobile/android/app/c;

    .line 36
    .line 37
    if-eq p0, v0, :cond_1

    .line 38
    .line 39
    sget-object v0, Lcom/p1/mobile/android/app/c;->o:Lcom/p1/mobile/android/app/c;

    .line 40
    .line 41
    if-ne p0, v0, :cond_0

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    const/4 p0, 0x0

    .line 45
    goto :goto_1

    .line 46
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 47
    :goto_1
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    return-object p0
.end method

.method public static synthetic l2(Lrx/c;)Lrx/c;
    .locals 1

    .line 1
    new-instance v0, Ll/ayr;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/ayr;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    new-instance v0, Ll/byr;

    .line 11
    .line 12
    invoke-direct {v0}, Ll/byr;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public static synthetic m2(Lcom/p1/mobile/android/app/c;)Landroid/util/Pair;
    .locals 2

    .line 1
    new-instance v0, Landroid/util/Pair;

    .line 2
    .line 3
    iget-boolean v1, p0, Lcom/p1/mobile/android/app/c;->d:Z

    .line 4
    .line 5
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-boolean p0, p0, Lcom/p1/mobile/android/app/c;->a:Z

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-direct {v0, v1, p0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    return-object v0
.end method

.method public static synthetic n2(Lrx/c;)Lrx/c;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static p2()Lrx/c$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c$d<",
            "Lcom/p1/mobile/android/app/c;",
            "Landroid/util/Pair<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Boolean;",
            ">;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/yxr;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/yxr;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public C(Ll/iam;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    invoke-interface {p1, p0}, Ll/iam;->i1(Ll/k3m;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/iam;->C0()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public creates(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Landroid/os/Bundle;",
            ">;)V"
        }
    .end annotation

    .line 7
    iget-object p0, p0, Ll/cyr;->lifecycleProviderImpl:Ll/ner;

    invoke-interface {p0, p1}, Ll/ner;->creates(Ll/y20;)V

    return-void
.end method

.method public creates(Ll/y20;Ll/x20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Landroid/os/Bundle;",
            ">;",
            "Ll/x20;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/cyr;->lifecycleProviderImpl:Ll/ner;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Ll/ner;->creates(Ll/y20;Ll/x20;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public destroy()V
    .locals 1
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/cyr;->endSubscribeSignal:Lrx/subjects/b;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance p0, Ljava/lang/Exception;

    .line 6
    .line 7
    const-string v0, "LiveBasePresenter\'s endSubscribeSignal is null"

    .line 8
    .line 9
    invoke-direct {p0, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    iget-object p0, p0, Ll/cyr;->endSubscribeSignal:Lrx/subjects/b;

    .line 17
    .line 18
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public duringCreated(Ll/pcj;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/pcj<",
            "Lrx/c<",
            "TT;>;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    const/4 v0, 0x1

    .line 27
    invoke-virtual {p0, p1, v0}, Ll/cyr;->duringCreated(Ll/pcj;Z)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public duringCreated(Ll/pcj;Z)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/pcj<",
            "Lrx/c<",
            "TT;>;>;Z)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/cyr;->lifecycleProviderImpl:Ll/ner;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/ner;->lifecycle()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {}, Ll/cyr;->p2()Lrx/c$d;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object p0, p0, Ll/cyr;->endSubscribeSignal:Lrx/subjects/b;

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Lrx/c;->takeUntil(Lrx/c;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-static {p1, p0, p2}, Ll/psd0;->D(Ll/pcj;Lrx/c;Z)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public duringCreated(Lrx/c;)Lrx/c;
    .locals 1
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

    .line 26
    new-instance v0, Ll/zxr;

    invoke-direct {v0, p1}, Ll/zxr;-><init>(Lrx/c;)V

    const/4 p1, 0x1

    invoke-virtual {p0, v0, p1}, Ll/cyr;->duringCreated(Ll/pcj;Z)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public lifecycle()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/android/app/c;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/cyr;->lifecycleProviderImpl:Ll/ner;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/ner;->lifecycle()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public lifecycle_()Lcom/p1/mobile/android/app/c;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->lifecycleProviderImpl:Ll/ner;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/ner;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public o2(Lrx/c;Z)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "TT;>;Z)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/xxr;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/xxr;-><init>(Lrx/c;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0, p2}, Ll/cyr;->duringCreated(Ll/pcj;Z)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method
