.class public Ll/psd0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/psd0$c;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static A(Ljava/lang/Exception;)[Ljava/lang/StackTraceElement;
    .locals 3

    .line 1
    invoke-virtual {p0}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    array-length v0, p0

    .line 8
    const/4 v1, 0x2

    .line 9
    if-gt v0, v1, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 v0, 0x0

    .line 13
    aget-object v0, p0, v0

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    aget-object v2, p0, v2

    .line 17
    .line 18
    aget-object p0, p0, v1

    .line 19
    .line 20
    filled-new-array {v0, v2, p0}, [Ljava/lang/StackTraceElement;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0

    .line 25
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 26
    return-object p0
.end method

.method public static B()Ll/gcg0;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()",
            "Ll/gcg0<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/psd0$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/psd0$a;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/icg0;->b(Ll/bb50;)Ll/gcg0;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    return-object v0
.end method

.method public static C()Lrx/c$d;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()",
            "Lrx/c$d<",
            "TT;TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/Exception;

    .line 2
    .line 3
    const-string v1, "run in UI thread after subscribeOn(io)\uff0cCheck it before ANR"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    new-instance v1, Ll/bsd0;

    .line 9
    .line 10
    invoke-direct {v1, v0}, Ll/bsd0;-><init>(Ljava/lang/Exception;)V

    .line 11
    .line 12
    .line 13
    return-object v1
.end method

.method public static D(Ll/pcj;Lrx/c;Z)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/pcj<",
            "Lrx/c<",
            "TT;>;>;",
            "Lrx/c<",
            "Landroid/util/Pair<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Boolean;",
            ">;>;Z)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/psd0$c;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/psd0$c;-><init>(Ll/pcj;Lrx/c;Z)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static E()Lrx/c$d;
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
    new-instance v0, Ll/gsd0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/gsd0;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static F()Lcom/p1/mobile/android/rx/a;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()",
            "Lcom/p1/mobile/android/rx/a<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/psd0;->o()[Ljava/lang/StackTraceElement;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/p1/mobile/android/rx/a;->c([Ljava/lang/StackTraceElement;)Lcom/p1/mobile/android/rx/a;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    return-object v0
.end method

.method public static G(Ll/y20;)Lcom/p1/mobile/android/rx/a;
    .locals 1
    .param p0    # Ll/y20;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/y20<",
            "TT;>;)",
            "Lcom/p1/mobile/android/rx/a<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/psd0;->o()[Ljava/lang/StackTraceElement;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0, p0}, Lcom/p1/mobile/android/rx/a;->d([Ljava/lang/StackTraceElement;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;
    .locals 1
    .param p0    # Ll/y20;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/y20<",
            "TT;>;",
            "Ll/y20<",
            "Ljava/lang/Throwable;",
            ">;)",
            "Lcom/p1/mobile/android/rx/a<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/psd0;->o()[Ljava/lang/StackTraceElement;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0, p0, p1}, Lcom/p1/mobile/android/rx/a;->e([Ljava/lang/StackTraceElement;Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static I(Ll/y20;Ll/y20;Ll/x20;)Lcom/p1/mobile/android/rx/a;
    .locals 2
    .param p0    # Ll/y20;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/y20<",
            "TT;>;",
            "Ll/y20<",
            "Ljava/lang/Throwable;",
            ">;",
            "Ll/x20;",
            ")",
            "Lcom/p1/mobile/android/rx/a<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/psd0;->o()[Ljava/lang/StackTraceElement;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-static {v0, p0, p1, p2, v1}, Lcom/p1/mobile/android/rx/a;->f([Ljava/lang/StackTraceElement;Ll/y20;Ll/y20;Ll/x20;Z)Lcom/p1/mobile/android/rx/a;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static J(Ll/y20;Ll/y20;Ll/x20;Z)Lcom/p1/mobile/android/rx/a;
    .locals 1
    .param p0    # Ll/y20;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/y20<",
            "TT;>;",
            "Ll/y20<",
            "Ljava/lang/Throwable;",
            ">;",
            "Ll/x20;",
            "Z)",
            "Lcom/p1/mobile/android/rx/a<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/psd0;->o()[Ljava/lang/StackTraceElement;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0, p0, p1, p2, p3}, Lcom/p1/mobile/android/rx/a;->f([Ljava/lang/StackTraceElement;Ll/y20;Ll/y20;Ll/x20;Z)Lcom/p1/mobile/android/rx/a;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static K(Ll/y20;Ll/y20;Z)Lcom/p1/mobile/android/rx/a;
    .locals 1
    .param p0    # Ll/y20;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/y20<",
            "TT;>;",
            "Ll/y20<",
            "Ljava/lang/Throwable;",
            ">;Z)",
            "Lcom/p1/mobile/android/rx/a<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/psd0;->o()[Ljava/lang/StackTraceElement;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0, p0, p1, p2}, Lcom/p1/mobile/android/rx/a;->g([Ljava/lang/StackTraceElement;Ll/y20;Ll/y20;Z)Lcom/p1/mobile/android/rx/a;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static L(Ll/bb50;)Lcom/p1/mobile/android/rx/a;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/bb50<",
            "TT;>;)",
            "Lcom/p1/mobile/android/rx/a<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/psd0;->o()[Ljava/lang/StackTraceElement;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0, p0}, Lcom/p1/mobile/android/rx/a;->h([Ljava/lang/StackTraceElement;Ll/bb50;)Lcom/p1/mobile/android/rx/a;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static M(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static N()Lrx/c$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()",
            "Lrx/c$d<",
            "TT;",
            "Lrx/Notification<",
            "TT;>;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/esd0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/esd0;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static O(Landroid/view/View;)Lrx/c$d;
    .locals 3
    .param p0    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/view/View;",
            ")",
            "Lrx/c$d<",
            "TT;TT;>;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/psd0$b;

    .line 6
    .line 7
    invoke-direct {v1, v0}, Ll/psd0$b;-><init>(Lrx/subjects/b;)V

    .line 8
    .line 9
    .line 10
    new-instance v2, Ll/ksd0;

    .line 11
    .line 12
    invoke-direct {v2, p0, v1, v0}, Ll/ksd0;-><init>(Landroid/view/View;Landroid/view/View$OnAttachStateChangeListener;Lrx/subjects/b;)V

    .line 13
    .line 14
    .line 15
    return-object v2
.end method

.method public static P()Lrx/c$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()",
            "Lrx/c$d<",
            "TT;TT;>;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lrx/schedulers/Schedulers;->computation()Ll/f2e0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/trd0;->e(Ll/f2e0;)Lrx/c$d;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    return-object v0
.end method

.method public static Q()Lrx/c$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()",
            "Lrx/c$d<",
            "TT;TT;>;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lrx/schedulers/Schedulers;->io()Ll/f2e0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/trd0;->e(Ll/f2e0;)Lrx/c$d;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    return-object v0
.end method

.method public static R()Lrx/c$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()",
            "Lrx/c$d<",
            "TT;TT;>;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/trd0;->e(Ll/f2e0;)Lrx/c$d;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    return-object v0
.end method

.method public static synthetic a(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->f:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-eq p0, v0, :cond_1

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/android/app/c;->g:Lcom/p1/mobile/android/app/c;

    .line 6
    .line 7
    if-eq p0, v0, :cond_1

    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/android/app/c;->h:Lcom/p1/mobile/android/app/c;

    .line 10
    .line 11
    if-eq p0, v0, :cond_1

    .line 12
    .line 13
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 14
    .line 15
    if-eq p0, v0, :cond_1

    .line 16
    .line 17
    sget-object v0, Lcom/p1/mobile/android/app/c;->k:Lcom/p1/mobile/android/app/c;

    .line 18
    .line 19
    if-eq p0, v0, :cond_1

    .line 20
    .line 21
    sget-object v0, Lcom/p1/mobile/android/app/c;->l:Lcom/p1/mobile/android/app/c;

    .line 22
    .line 23
    if-eq p0, v0, :cond_1

    .line 24
    .line 25
    sget-object v0, Lcom/p1/mobile/android/app/c;->m:Lcom/p1/mobile/android/app/c;

    .line 26
    .line 27
    if-eq p0, v0, :cond_1

    .line 28
    .line 29
    sget-object v0, Lcom/p1/mobile/android/app/c;->o:Lcom/p1/mobile/android/app/c;

    .line 30
    .line 31
    if-ne p0, v0, :cond_0

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    const/4 p0, 0x0

    .line 35
    goto :goto_1

    .line 36
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 37
    :goto_1
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0
.end method

.method public static synthetic b(Ljava/lang/Exception;Lrx/c;)Lrx/c;
    .locals 1

    .line 1
    invoke-static {}, Lrx/schedulers/Schedulers;->computation()Ll/f2e0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1, v0}, Lrx/c;->subscribeOn(Ll/f2e0;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    new-instance v0, Ll/dsd0;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ll/dsd0;-><init>(Ljava/lang/Exception;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p0, p1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method

.method public static synthetic c(Landroid/view/View;Landroid/view/View$OnAttachStateChangeListener;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroid/view/View;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(Landroid/view/View;Landroid/view/View$OnAttachStateChangeListener;Lrx/subjects/b;Lrx/c;)Lrx/c;
    .locals 1

    .line 1
    new-instance v0, Ll/nsd0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/nsd0;-><init>(Landroid/view/View;Landroid/view/View$OnAttachStateChangeListener;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p3, v0}, Lrx/c;->doOnSubscribe(Ll/x20;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p3

    .line 10
    new-instance v0, Ll/osd0;

    .line 11
    .line 12
    invoke-direct {v0, p0, p1}, Ll/osd0;-><init>(Landroid/view/View;Landroid/view/View$OnAttachStateChangeListener;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p3, v0}, Lrx/c;->doOnUnsubscribe(Ll/x20;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0, p2}, Lrx/c;->takeUntil(Lrx/c;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public static synthetic e(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/App;->d:Lcom/p1/mobile/android/app/App;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/p1/mobile/android/app/App;->k(Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic f(Lrx/c;)Lrx/c;
    .locals 1

    .line 1
    new-instance v0, Ll/fsd0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/fsd0;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lrx/c;->doOnError(Ll/y20;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0}, Lrx/c;->materialize()Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public static synthetic g(Ljava/lang/Exception;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/trd0;->d(Ljava/lang/Exception;)V

    .line 2
    .line 3
    .line 4
    return-object p1
.end method

.method public static synthetic h(Ljava/lang/Exception;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/trd0;->d(Ljava/lang/Exception;)V

    .line 2
    .line 3
    .line 4
    return-object p1
.end method

.method public static synthetic i(Lcom/p1/mobile/android/app/c;)Landroid/util/Pair;
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

.method public static synthetic j([Z[Ljava/lang/StackTraceElement;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    aget-boolean p0, p0, v0

    .line 3
    .line 4
    if-nez p0, :cond_0

    .line 5
    .line 6
    new-instance p0, Ljava/lang/RuntimeException;

    .line 7
    .line 8
    const-string v0, "combineLatest never emit next\n"

    .line 9
    .line 10
    invoke-direct {p0, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->setStackTrace([Ljava/lang/StackTraceElement;)V

    .line 14
    .line 15
    .line 16
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public static synthetic k(Lrx/c;)Lrx/c;
    .locals 1

    .line 1
    new-instance v0, Ll/lsd0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/lsd0;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    new-instance v0, Ll/msd0;

    .line 11
    .line 12
    invoke-direct {v0}, Ll/msd0;-><init>()V

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

.method public static synthetic l(Ljava/lang/Exception;Lrx/c;)Lrx/c;
    .locals 1

    .line 1
    invoke-static {}, Lrx/schedulers/Schedulers;->io()Ll/f2e0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1, v0}, Lrx/c;->subscribeOn(Ll/f2e0;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    new-instance v0, Ll/jsd0;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ll/jsd0;-><init>(Ljava/lang/Exception;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p0, p1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method

.method public static synthetic m([ZLjava/lang/Object;)V
    .locals 1

    .line 1
    const/4 p1, 0x0

    .line 2
    const/4 v0, 0x1

    .line 3
    aput-boolean v0, p0, p1

    .line 4
    .line 5
    return-void
.end method

.method public static synthetic n(Landroid/view/View;Landroid/view/View$OnAttachStateChangeListener;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static o()[Ljava/lang/StackTraceElement;
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/Exception;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Exception;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/psd0;->A(Ljava/lang/Exception;)[Ljava/lang/StackTraceElement;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    return-object v0
.end method

.method public static p(Ljava/util/List;Ll/zcj;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List<",
            "+",
            "Lrx/c<",
            "+TT;>;>;",
            "Ll/zcj<",
            "+TR;>;)",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/psd0;->o()[Ljava/lang/StackTraceElement;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p0, p1, v0}, Ll/psd0;->q(Ljava/util/List;Ll/zcj;[Ljava/lang/StackTraceElement;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static q(Ljava/util/List;Ll/zcj;[Ljava/lang/StackTraceElement;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List<",
            "+",
            "Lrx/c<",
            "+TT;>;>;",
            "Ll/zcj<",
            "+TR;>;[",
            "Ljava/lang/StackTraceElement;",
            ")",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    new-array v0, v0, [Z

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    aput-boolean v1, v0, v1

    .line 6
    .line 7
    invoke-static {p0, p1}, Lrx/c;->combineLatest(Ljava/util/List;Ll/zcj;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance p1, Ll/hsd0;

    .line 12
    .line 13
    invoke-direct {p1, v0}, Ll/hsd0;-><init>([Z)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    new-instance p1, Ll/isd0;

    .line 21
    .line 22
    invoke-direct {p1, v0, p2}, Ll/isd0;-><init>([Z[Ljava/lang/StackTraceElement;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, p1}, Lrx/c;->doOnCompleted(Ll/x20;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method public static r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T1:",
            "Ljava/lang/Object;",
            "T2:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+TT1;>;",
            "Lrx/c<",
            "+TT2;>;",
            "Ll/rcj<",
            "-TT1;-TT2;+TR;>;)",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 1
    filled-new-array {p0, p1}, [Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p2}, Ll/edj;->a(Ll/rcj;)Ll/zcj;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-static {}, Ll/psd0;->o()[Ljava/lang/StackTraceElement;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    invoke-static {p0, p1, p2}, Ll/psd0;->q(Ljava/util/List;Ll/zcj;[Ljava/lang/StackTraceElement;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public static s(Lrx/c;Lrx/c;Lrx/c;Ll/scj;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T1:",
            "Ljava/lang/Object;",
            "T2:",
            "Ljava/lang/Object;",
            "T3:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+TT1;>;",
            "Lrx/c<",
            "+TT2;>;",
            "Lrx/c<",
            "+TT3;>;",
            "Ll/scj<",
            "-TT1;-TT2;-TT3;+TR;>;)",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 1
    filled-new-array {p0, p1, p2}, [Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p3}, Ll/edj;->b(Ll/scj;)Ll/zcj;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-static {}, Ll/psd0;->o()[Ljava/lang/StackTraceElement;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    invoke-static {p0, p1, p2}, Ll/psd0;->q(Ljava/util/List;Ll/zcj;[Ljava/lang/StackTraceElement;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public static t(Lrx/c;Lrx/c;Lrx/c;Lrx/c;Ll/tcj;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T1:",
            "Ljava/lang/Object;",
            "T2:",
            "Ljava/lang/Object;",
            "T3:",
            "Ljava/lang/Object;",
            "T4:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+TT1;>;",
            "Lrx/c<",
            "+TT2;>;",
            "Lrx/c<",
            "+TT3;>;",
            "Lrx/c<",
            "+TT4;>;",
            "Ll/tcj<",
            "-TT1;-TT2;-TT3;-TT4;+TR;>;)",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 1
    filled-new-array {p0, p1, p2, p3}, [Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p4}, Ll/edj;->c(Ll/tcj;)Ll/zcj;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-static {}, Ll/psd0;->o()[Ljava/lang/StackTraceElement;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    invoke-static {p0, p1, p2}, Ll/psd0;->q(Ljava/util/List;Ll/zcj;[Ljava/lang/StackTraceElement;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public static u(Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Ll/ucj;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T1:",
            "Ljava/lang/Object;",
            "T2:",
            "Ljava/lang/Object;",
            "T3:",
            "Ljava/lang/Object;",
            "T4:",
            "Ljava/lang/Object;",
            "T5:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+TT1;>;",
            "Lrx/c<",
            "+TT2;>;",
            "Lrx/c<",
            "+TT3;>;",
            "Lrx/c<",
            "+TT4;>;",
            "Lrx/c<",
            "+TT5;>;",
            "Ll/ucj<",
            "-TT1;-TT2;-TT3;-TT4;-TT5;+TR;>;)",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 1
    filled-new-array {p0, p1, p2, p3, p4}, [Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p5}, Ll/edj;->d(Ll/ucj;)Ll/zcj;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-static {}, Ll/psd0;->o()[Ljava/lang/StackTraceElement;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    invoke-static {p0, p1, p2}, Ll/psd0;->q(Ljava/util/List;Ll/zcj;[Ljava/lang/StackTraceElement;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public static v(Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Ll/vcj;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T1:",
            "Ljava/lang/Object;",
            "T2:",
            "Ljava/lang/Object;",
            "T3:",
            "Ljava/lang/Object;",
            "T4:",
            "Ljava/lang/Object;",
            "T5:",
            "Ljava/lang/Object;",
            "T6:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+TT1;>;",
            "Lrx/c<",
            "+TT2;>;",
            "Lrx/c<",
            "+TT3;>;",
            "Lrx/c<",
            "+TT4;>;",
            "Lrx/c<",
            "+TT5;>;",
            "Lrx/c<",
            "+TT6;>;",
            "Ll/vcj<",
            "-TT1;-TT2;-TT3;-TT4;-TT5;-TT6;+TR;>;)",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 1
    filled-new-array/range {p0 .. p5}, [Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p6}, Ll/edj;->e(Ll/vcj;)Ll/zcj;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-static {}, Ll/psd0;->o()[Ljava/lang/StackTraceElement;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    invoke-static {p0, p1, p2}, Ll/psd0;->q(Ljava/util/List;Ll/zcj;[Ljava/lang/StackTraceElement;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public static w(Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Ll/xcj;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T1:",
            "Ljava/lang/Object;",
            "T2:",
            "Ljava/lang/Object;",
            "T3:",
            "Ljava/lang/Object;",
            "T4:",
            "Ljava/lang/Object;",
            "T5:",
            "Ljava/lang/Object;",
            "T6:",
            "Ljava/lang/Object;",
            "T7:",
            "Ljava/lang/Object;",
            "T8:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+TT1;>;",
            "Lrx/c<",
            "+TT2;>;",
            "Lrx/c<",
            "+TT3;>;",
            "Lrx/c<",
            "+TT4;>;",
            "Lrx/c<",
            "+TT5;>;",
            "Lrx/c<",
            "+TT6;>;",
            "Lrx/c<",
            "+TT7;>;",
            "Lrx/c<",
            "+TT8;>;",
            "Ll/xcj<",
            "-TT1;-TT2;-TT3;-TT4;-TT5;-TT6;-TT7;-TT8;+TR;>;)",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 1
    filled-new-array/range {p0 .. p7}, [Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p8}, Ll/edj;->g(Ll/xcj;)Ll/zcj;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-static {}, Ll/psd0;->o()[Ljava/lang/StackTraceElement;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    invoke-static {p0, p1, p2}, Ll/psd0;->q(Ljava/util/List;Ll/zcj;[Ljava/lang/StackTraceElement;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public static x(Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Ll/ycj;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T1:",
            "Ljava/lang/Object;",
            "T2:",
            "Ljava/lang/Object;",
            "T3:",
            "Ljava/lang/Object;",
            "T4:",
            "Ljava/lang/Object;",
            "T5:",
            "Ljava/lang/Object;",
            "T6:",
            "Ljava/lang/Object;",
            "T7:",
            "Ljava/lang/Object;",
            "T8:",
            "Ljava/lang/Object;",
            "T9:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+TT1;>;",
            "Lrx/c<",
            "+TT2;>;",
            "Lrx/c<",
            "+TT3;>;",
            "Lrx/c<",
            "+TT4;>;",
            "Lrx/c<",
            "+TT5;>;",
            "Lrx/c<",
            "+TT6;>;",
            "Lrx/c<",
            "+TT7;>;",
            "Lrx/c<",
            "+TT8;>;",
            "Lrx/c<",
            "+TT9;>;",
            "Ll/ycj<",
            "-TT1;-TT2;-TT3;-TT4;-TT5;-TT6;-TT7;-TT8;-TT9;+TR;>;)",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 1
    filled-new-array/range {p0 .. p8}, [Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p9}, Ll/edj;->h(Ll/ycj;)Ll/zcj;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-static {}, Ll/psd0;->o()[Ljava/lang/StackTraceElement;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    invoke-static {p0, p1, p2}, Ll/psd0;->q(Ljava/util/List;Ll/zcj;[Ljava/lang/StackTraceElement;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public static y()Lrx/c$d;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()",
            "Lrx/c$d<",
            "TT;TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/Exception;

    .line 2
    .line 3
    const-string v1, "run in UI thread after subscribeOn(computation)\uff0cCheck it before ANR"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    new-instance v1, Ll/csd0;

    .line 9
    .line 10
    invoke-direct {v1, v0}, Ll/csd0;-><init>(Ljava/lang/Exception;)V

    .line 11
    .line 12
    .line 13
    return-object v1
.end method

.method public static z(Ll/kcg0;)V
    .locals 1
    .param p0    # Ll/kcg0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-interface {p0}, Ll/kcg0;->isUnsubscribed()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-interface {p0}, Ll/kcg0;->unsubscribe()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method
