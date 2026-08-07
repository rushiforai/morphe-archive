.class public final Ll/t7s0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/app/Application$ActivityLifecycleCallbacks;


# instance fields
.field public final a:Landroid/app/Application;

.field public final b:Ljava/lang/ref/WeakReference;

.field public c:Z


# direct methods
.method public constructor <init>(Landroid/app/Application;Landroid/app/Application$ActivityLifecycleCallbacks;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/t7s0;->c:Z

    .line 6
    .line 7
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 8
    .line 9
    invoke-direct {v0, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/t7s0;->b:Ljava/lang/ref/WeakReference;

    .line 13
    .line 14
    iput-object p1, p0, Ll/t7s0;->a:Landroid/app/Application;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final a(Ll/s7s0;)V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/t7s0;->b:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/app/Application$ActivityLifecycleCallbacks;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-interface {p1, v0}, Ll/s7s0;->a(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-boolean p1, p0, Ll/t7s0;->c:Z

    .line 16
    .line 17
    if-nez p1, :cond_1

    .line 18
    .line 19
    iget-object p1, p0, Ll/t7s0;->a:Landroid/app/Application;

    .line 20
    .line 21
    invoke-virtual {p1, p0}, Landroid/app/Application;->unregisterActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 22
    .line 23
    .line 24
    const/4 p1, 0x1

    .line 25
    iput-boolean p1, p0, Ll/t7s0;->c:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 26
    .line 27
    :cond_1
    return-void

    .line 28
    :catch_0
    move-exception p0

    .line 29
    const-string p1, "Error while dispatching lifecycle callback."

    .line 30
    .line 31
    invoke-static {p1, p0}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public final onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 1

    .line 1
    new-instance v0, Ll/c7s0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/c7s0;-><init>(Ll/t7s0;Landroid/app/Activity;Landroid/os/Bundle;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/t7s0;->a(Ll/s7s0;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final onActivityDestroyed(Landroid/app/Activity;)V
    .locals 1

    .line 1
    new-instance v0, Ll/r7s0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/r7s0;-><init>(Ll/t7s0;Landroid/app/Activity;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/t7s0;->a(Ll/s7s0;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final onActivityPaused(Landroid/app/Activity;)V
    .locals 1

    .line 1
    new-instance v0, Ll/f7s0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/f7s0;-><init>(Ll/t7s0;Landroid/app/Activity;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/t7s0;->a(Ll/s7s0;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final onActivityResumed(Landroid/app/Activity;)V
    .locals 1

    .line 1
    new-instance v0, Ll/e7s0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/e7s0;-><init>(Ll/t7s0;Landroid/app/Activity;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/t7s0;->a(Ll/s7s0;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final onActivitySaveInstanceState(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 1

    .line 1
    new-instance v0, Ll/q7s0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/q7s0;-><init>(Ll/t7s0;Landroid/app/Activity;Landroid/os/Bundle;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/t7s0;->a(Ll/s7s0;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final onActivityStarted(Landroid/app/Activity;)V
    .locals 1

    .line 1
    new-instance v0, Ll/d7s0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/d7s0;-><init>(Ll/t7s0;Landroid/app/Activity;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/t7s0;->a(Ll/s7s0;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final onActivityStopped(Landroid/app/Activity;)V
    .locals 1

    .line 1
    new-instance v0, Ll/g7s0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/g7s0;-><init>(Ll/t7s0;Landroid/app/Activity;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/t7s0;->a(Ll/s7s0;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
