.class Lio/agora/utils2/internal/ProcessLifecycleOwner;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/app/Application$ActivityLifecycleCallbacks;


# static fields
.field private static final TAG:Ljava/lang/String; = "ProcessLifecycleOwner"

.field private static final TIMEOUT_MS:J = 0x3e8L


# instance fields
.field private final handler:Landroid/os/Handler;

.field private isForeground:Z

.field private final mCommonUtility:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lio/agora/utils2/internal/CommonUtility;",
            ">;"
        }
    .end annotation
.end field

.field private final mDelayedPauseRunnable:Ljava/lang/Runnable;

.field private final mDelayedResumeRunnable:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(ZLio/agora/utils2/internal/CommonUtility;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lio/agora/utils2/internal/ProcessLifecycleOwner$1;

    invoke-direct {v0, p0}, Lio/agora/utils2/internal/ProcessLifecycleOwner$1;-><init>(Lio/agora/utils2/internal/ProcessLifecycleOwner;)V

    iput-object v0, p0, Lio/agora/utils2/internal/ProcessLifecycleOwner;->mDelayedPauseRunnable:Ljava/lang/Runnable;

    new-instance v0, Lio/agora/utils2/internal/ProcessLifecycleOwner$2;

    invoke-direct {v0, p0}, Lio/agora/utils2/internal/ProcessLifecycleOwner$2;-><init>(Lio/agora/utils2/internal/ProcessLifecycleOwner;)V

    iput-object v0, p0, Lio/agora/utils2/internal/ProcessLifecycleOwner;->mDelayedResumeRunnable:Ljava/lang/Runnable;

    iput-boolean p1, p0, Lio/agora/utils2/internal/ProcessLifecycleOwner;->isForeground:Z

    new-instance p1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object p1, p0, Lio/agora/utils2/internal/ProcessLifecycleOwner;->handler:Landroid/os/Handler;

    new-instance p1, Ljava/lang/ref/WeakReference;

    invoke-direct {p1, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lio/agora/utils2/internal/ProcessLifecycleOwner;->mCommonUtility:Ljava/lang/ref/WeakReference;

    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "ProcessLifecycleOwner, isForeground : "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-boolean p0, p0, Lio/agora/utils2/internal/ProcessLifecycleOwner;->isForeground:Z

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "ProcessLifecycleOwner"

    invoke-static {p1, p0}, Lio/agora/utils2/internal/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic access$000(Lio/agora/utils2/internal/ProcessLifecycleOwner;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lio/agora/utils2/internal/ProcessLifecycleOwner;->setForeground(Z)V

    return-void
.end method

.method private setForeground(Z)V
    .locals 1

    iget-boolean v0, p0, Lio/agora/utils2/internal/ProcessLifecycleOwner;->isForeground:Z

    if-ne v0, p1, :cond_0

    goto :goto_0

    :cond_0
    iput-boolean p1, p0, Lio/agora/utils2/internal/ProcessLifecycleOwner;->isForeground:Z

    iget-object p1, p0, Lio/agora/utils2/internal/ProcessLifecycleOwner;->mCommonUtility:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lio/agora/utils2/internal/CommonUtility;

    if-nez p1, :cond_1

    :goto_0
    return-void

    :cond_1
    iget-boolean p0, p0, Lio/agora/utils2/internal/ProcessLifecycleOwner;->isForeground:Z

    invoke-virtual {p1, p0}, Lio/agora/utils2/internal/CommonUtility;->onForegroundChanged(Z)V

    return-void
.end method


# virtual methods
.method public onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 0

    return-void
.end method

.method public onActivityDestroyed(Landroid/app/Activity;)V
    .locals 0

    return-void
.end method

.method public onActivityPaused(Landroid/app/Activity;)V
    .locals 2

    const-string p1, "ProcessLifecycleOwner"

    const-string v0, "onActivityPaused()"

    invoke-static {p1, v0}, Lio/agora/utils2/internal/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lio/agora/utils2/internal/ProcessLifecycleOwner;->handler:Landroid/os/Handler;

    iget-object v0, p0, Lio/agora/utils2/internal/ProcessLifecycleOwner;->mDelayedResumeRunnable:Ljava/lang/Runnable;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-object p1, p0, Lio/agora/utils2/internal/ProcessLifecycleOwner;->handler:Landroid/os/Handler;

    iget-object p0, p0, Lio/agora/utils2/internal/ProcessLifecycleOwner;->mDelayedPauseRunnable:Ljava/lang/Runnable;

    const-wide/16 v0, 0x3e8

    invoke-virtual {p1, p0, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method public onActivityResumed(Landroid/app/Activity;)V
    .locals 2

    const-string p1, "ProcessLifecycleOwner"

    const-string v0, "onActivityResumed()"

    invoke-static {p1, v0}, Lio/agora/utils2/internal/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lio/agora/utils2/internal/ProcessLifecycleOwner;->handler:Landroid/os/Handler;

    iget-object v0, p0, Lio/agora/utils2/internal/ProcessLifecycleOwner;->mDelayedPauseRunnable:Ljava/lang/Runnable;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-object p1, p0, Lio/agora/utils2/internal/ProcessLifecycleOwner;->handler:Landroid/os/Handler;

    iget-object p0, p0, Lio/agora/utils2/internal/ProcessLifecycleOwner;->mDelayedResumeRunnable:Ljava/lang/Runnable;

    const-wide/16 v0, 0x3e8

    invoke-virtual {p1, p0, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method public onActivitySaveInstanceState(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 0

    return-void
.end method

.method public onActivityStarted(Landroid/app/Activity;)V
    .locals 0

    return-void
.end method

.method public onActivityStopped(Landroid/app/Activity;)V
    .locals 0

    return-void
.end method
