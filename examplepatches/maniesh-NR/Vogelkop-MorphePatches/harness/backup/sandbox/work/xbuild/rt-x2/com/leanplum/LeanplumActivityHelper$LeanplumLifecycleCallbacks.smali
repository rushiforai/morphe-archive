.class Lcom/leanplum/LeanplumActivityHelper$LeanplumLifecycleCallbacks;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/app/Application$ActivityLifecycleCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/leanplum/LeanplumActivityHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "LeanplumLifecycleCallbacks"
.end annotation


# instance fields
.field private final mHandlePayloadOnResume:Z


# direct methods
.method public constructor <init>(Z)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lcom/leanplum/LeanplumActivityHelper$LeanplumLifecycleCallbacks;->mHandlePayloadOnResume:Z

    return-void
.end method

.method public static synthetic a(Lcom/leanplum/LeanplumActivityHelper$LeanplumLifecycleCallbacks;Landroid/os/Bundle;)V
    .registers 2

    invoke-direct {p0, p1}, Lcom/leanplum/LeanplumActivityHelper$LeanplumLifecycleCallbacks;->lambda$onActivityResumed$0(Landroid/os/Bundle;)V

    return-void
.end method

.method private handleNotificationPayload(Landroid/os/Bundle;)V
    .registers 4

    :try_start_0
    const-class p0, Lcom/leanplum/LeanplumPushService;

    sget-object v0, Lcom/leanplum/LeanplumPushService;->LEANPLUM_SENDER_ID:Ljava/lang/String;

    const-string v0, "onActivityNotificationClick"

    const-class v1, Landroid/os/Bundle;

    filled-new-array {v1}, [Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p0

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_18
    .catchall {:try_start_0 .. :try_end_18} :catchall_19

    return-void

    :catchall_19
    move-exception p0

    const-string p1, "Push Notification action not run. Did you forget leanplum-push module?"

    invoke-static {p1, p0}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method private synthetic lambda$onActivityResumed$0(Landroid/os/Bundle;)V
    .registers 2

    invoke-direct {p0, p1}, Lcom/leanplum/LeanplumActivityHelper$LeanplumLifecycleCallbacks;->handleNotificationPayload(Landroid/os/Bundle;)V

    return-void
.end method


# virtual methods
.method public onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 3

    return-void
.end method

.method public onActivityDestroyed(Landroid/app/Activity;)V
    .registers 2

    return-void
.end method

.method public onActivityPaused(Landroid/app/Activity;)V
    .registers 2

    :try_start_0
    # invokes: Lcom/leanplum/LeanplumActivityHelper;->onPause(Landroid/app/Activity;)V
    invoke-static {p1}, Lcom/leanplum/LeanplumActivityHelper;->access$400(Landroid/app/Activity;)V
    :try_end_3
    .catchall {:try_start_0 .. :try_end_3} :catchall_4

    return-void

    :catchall_4
    move-exception p0

    invoke-static {p0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    return-void
.end method

.method public onActivityResumed(Landroid/app/Activity;)V
    .registers 4

    :try_start_0
    # invokes: Lcom/leanplum/LeanplumActivityHelper;->onResume(Landroid/app/Activity;)V
    invoke-static {p1}, Lcom/leanplum/LeanplumActivityHelper;->access$300(Landroid/app/Activity;)V

    invoke-static {}, Lcom/leanplum/Leanplum;->isScreenTrackingEnabled()Z

    move-result v0

    if-eqz v0, :cond_15

    invoke-virtual {p1}, Landroid/app/Activity;->getLocalClassName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/leanplum/Leanplum;->advanceTo(Ljava/lang/String;)V
    :try_end_10
    .catchall {:try_start_0 .. :try_end_10} :catchall_11

    goto :goto_15

    :catchall_11
    move-exception v0

    invoke-static {v0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    :cond_15
    :goto_15
    iget-boolean v0, p0, Lcom/leanplum/LeanplumActivityHelper$LeanplumLifecycleCallbacks;->mHandlePayloadOnResume:Z

    if-eqz v0, :cond_3d

    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    if-eqz v0, :cond_3d

    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object p1

    if-eqz p1, :cond_3d

    const-string v0, "lp_message"

    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3d

    invoke-static {}, Lcom/leanplum/internal/OperationQueue;->sharedInstance()Lcom/leanplum/internal/OperationQueue;

    move-result-object v0

    new-instance v1, Lcom/leanplum/a;

    invoke-direct {v1, p0, p1}, Lcom/leanplum/a;-><init>(Lcom/leanplum/LeanplumActivityHelper$LeanplumLifecycleCallbacks;Landroid/os/Bundle;)V

    invoke-virtual {v0, v1}, Lcom/leanplum/internal/OperationQueue;->addParallelOperation(Ljava/lang/Runnable;)V

    :cond_3d
    return-void
.end method

.method public onActivitySaveInstanceState(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 3

    return-void
.end method

.method public onActivityStarted(Landroid/app/Activity;)V
    .registers 2

    return-void
.end method

.method public onActivityStopped(Landroid/app/Activity;)V
    .registers 2

    :try_start_0
    # invokes: Lcom/leanplum/LeanplumActivityHelper;->onStop(Landroid/app/Activity;)V
    invoke-static {p1}, Lcom/leanplum/LeanplumActivityHelper;->access$200(Landroid/app/Activity;)V
    :try_end_3
    .catchall {:try_start_0 .. :try_end_3} :catchall_4

    return-void

    :catchall_4
    move-exception p0

    invoke-static {p0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    return-void
.end method
