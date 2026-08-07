.class public final Ll/f2s0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/app/Application$ActivityLifecycleCallbacks;


# instance fields
.field public final a:Landroid/app/Activity;

.field public final synthetic b:Ll/e6s0;


# direct methods
.method public constructor <init>(Ll/e6s0;Landroid/app/Activity;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/f2s0;->b:Ll/e6s0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Ll/f2s0;->a:Landroid/app/Activity;

    .line 7
    .line 8
    return-void
.end method

.method public static bridge synthetic a(Ll/f2s0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/f2s0;->b()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final b()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/f2s0;->b:Ll/e6s0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/e6s0;->b(Ll/e6s0;)Landroid/app/Application;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p0}, Landroid/app/Application;->unregisterActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 1
    .param p2    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object p2, p0, Ll/f2s0;->b:Ll/e6s0;

    .line 2
    .line 3
    invoke-static {p2}, Ll/e6s0;->c(Ll/e6s0;)Landroid/app/Dialog;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    iget-boolean v0, p2, Ll/e6s0;->l:Z

    .line 10
    .line 11
    if-eqz v0, :cond_2

    .line 12
    .line 13
    invoke-static {p2}, Ll/e6s0;->c(Ll/e6s0;)Landroid/app/Dialog;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    invoke-virtual {p2, p1}, Landroid/app/Dialog;->setOwnerActivity(Landroid/app/Activity;)V

    .line 18
    .line 19
    .line 20
    iget-object p2, p0, Ll/f2s0;->b:Ll/e6s0;

    .line 21
    .line 22
    invoke-static {p2}, Ll/e6s0;->e(Ll/e6s0;)Ll/bxs0;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    invoke-static {p2}, Ll/e6s0;->e(Ll/e6s0;)Ll/bxs0;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    invoke-virtual {p2, p1}, Ll/bxs0;->a(Landroid/app/Activity;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    iget-object p2, p0, Ll/f2s0;->b:Ll/e6s0;

    .line 36
    .line 37
    invoke-static {p2}, Ll/e6s0;->f(Ll/e6s0;)Ljava/util/concurrent/atomic/AtomicReference;

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    const/4 v0, 0x0

    .line 42
    invoke-virtual {p2, v0}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object p2

    .line 46
    check-cast p2, Ll/f2s0;

    .line 47
    .line 48
    if-eqz p2, :cond_1

    .line 49
    .line 50
    invoke-virtual {p2}, Ll/f2s0;->b()V

    .line 51
    .line 52
    .line 53
    iget-object p2, p0, Ll/f2s0;->b:Ll/e6s0;

    .line 54
    .line 55
    new-instance v0, Ll/f2s0;

    .line 56
    .line 57
    invoke-direct {v0, p2, p1}, Ll/f2s0;-><init>(Ll/e6s0;Landroid/app/Activity;)V

    .line 58
    .line 59
    .line 60
    invoke-static {p2}, Ll/e6s0;->b(Ll/e6s0;)Landroid/app/Application;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-virtual {p1, v0}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 65
    .line 66
    .line 67
    iget-object p1, p0, Ll/f2s0;->b:Ll/e6s0;

    .line 68
    .line 69
    invoke-static {p1}, Ll/e6s0;->f(Ll/e6s0;)Ljava/util/concurrent/atomic/AtomicReference;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    invoke-virtual {p1, v0}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 74
    .line 75
    .line 76
    :cond_1
    iget-object p0, p0, Ll/f2s0;->b:Ll/e6s0;

    .line 77
    .line 78
    invoke-static {p0}, Ll/e6s0;->c(Ll/e6s0;)Landroid/app/Dialog;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    if-eqz p1, :cond_2

    .line 83
    .line 84
    invoke-static {p0}, Ll/e6s0;->c(Ll/e6s0;)Landroid/app/Dialog;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-virtual {p0}, Landroid/app/Dialog;->show()V

    .line 89
    .line 90
    .line 91
    :cond_2
    return-void
.end method

.method public final onActivityDestroyed(Landroid/app/Activity;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/f2s0;->a:Landroid/app/Activity;

    .line 2
    .line 3
    if-eq p1, v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p1}, Landroid/app/Activity;->isChangingConfigurations()Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-eqz p1, :cond_1

    .line 11
    .line 12
    iget-object p1, p0, Ll/f2s0;->b:Ll/e6s0;

    .line 13
    .line 14
    iget-boolean v0, p1, Ll/e6s0;->l:Z

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    invoke-static {p1}, Ll/e6s0;->c(Ll/e6s0;)Landroid/app/Dialog;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    invoke-static {p1}, Ll/e6s0;->c(Ll/e6s0;)Landroid/app/Dialog;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0}, Landroid/app/Dialog;->dismiss()V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    iget-object p0, p0, Ll/f2s0;->b:Ll/e6s0;

    .line 33
    .line 34
    new-instance p1, Lcom/google/android/gms/internal/consent_sdk/zzg;

    .line 35
    .line 36
    const/4 v0, 0x3

    .line 37
    const-string v1, "Activity is destroyed."

    .line 38
    .line 39
    invoke-direct {p1, v0, v1}, Lcom/google/android/gms/internal/consent_sdk/zzg;-><init>(ILjava/lang/String;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0, p1}, Ll/e6s0;->i(Lcom/google/android/gms/internal/consent_sdk/zzg;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public final onActivityPaused(Landroid/app/Activity;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final onActivityResumed(Landroid/app/Activity;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final onActivitySaveInstanceState(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final onActivityStarted(Landroid/app/Activity;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final onActivityStopped(Landroid/app/Activity;)V
    .locals 0

    .line 1
    return-void
.end method
