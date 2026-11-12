.class Lcom/leanplum/LeanplumActivityHelper$DefaultLifecycleCallbacksHandler;
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
    name = "DefaultLifecycleCallbacksHandler"
.end annotation


# instance fields
.field private final callback:Landroid/app/Application$ActivityLifecycleCallbacks;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/app/Application$ActivityLifecycleCallbacks;)V
    .registers 2
    .param p1    # Landroid/app/Application$ActivityLifecycleCallbacks;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/leanplum/LeanplumActivityHelper$DefaultLifecycleCallbacksHandler;->callback:Landroid/app/Application$ActivityLifecycleCallbacks;

    return-void
.end method


# virtual methods
.method public onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 4
    .param p1    # Landroid/app/Activity;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    # invokes: Lcom/leanplum/LeanplumActivityHelper;->isLifecycleCallbacksOverridden(Landroid/app/Activity;)Z
    invoke-static {p1}, Lcom/leanplum/LeanplumActivityHelper;->access$000(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    iget-object p0, p0, Lcom/leanplum/LeanplumActivityHelper$DefaultLifecycleCallbacksHandler;->callback:Landroid/app/Application$ActivityLifecycleCallbacks;

    invoke-interface {p0, p1, p2}, Landroid/app/Application$ActivityLifecycleCallbacks;->onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V

    return-void
.end method

.method public onActivityDestroyed(Landroid/app/Activity;)V
    .registers 3
    .param p1    # Landroid/app/Activity;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    # invokes: Lcom/leanplum/LeanplumActivityHelper;->isLifecycleCallbacksOverridden(Landroid/app/Activity;)Z
    invoke-static {p1}, Lcom/leanplum/LeanplumActivityHelper;->access$000(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    iget-object p0, p0, Lcom/leanplum/LeanplumActivityHelper$DefaultLifecycleCallbacksHandler;->callback:Landroid/app/Application$ActivityLifecycleCallbacks;

    invoke-interface {p0, p1}, Landroid/app/Application$ActivityLifecycleCallbacks;->onActivityDestroyed(Landroid/app/Activity;)V

    return-void
.end method

.method public onActivityPaused(Landroid/app/Activity;)V
    .registers 3

    # invokes: Lcom/leanplum/LeanplumActivityHelper;->isLifecycleCallbacksOverridden(Landroid/app/Activity;)Z
    invoke-static {p1}, Lcom/leanplum/LeanplumActivityHelper;->access$000(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    iget-object p0, p0, Lcom/leanplum/LeanplumActivityHelper$DefaultLifecycleCallbacksHandler;->callback:Landroid/app/Application$ActivityLifecycleCallbacks;

    invoke-interface {p0, p1}, Landroid/app/Application$ActivityLifecycleCallbacks;->onActivityPaused(Landroid/app/Activity;)V

    return-void
.end method

.method public onActivityResumed(Landroid/app/Activity;)V
    .registers 3

    # invokes: Lcom/leanplum/LeanplumActivityHelper;->isLifecycleCallbacksOverridden(Landroid/app/Activity;)Z
    invoke-static {p1}, Lcom/leanplum/LeanplumActivityHelper;->access$000(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    iget-object p0, p0, Lcom/leanplum/LeanplumActivityHelper$DefaultLifecycleCallbacksHandler;->callback:Landroid/app/Application$ActivityLifecycleCallbacks;

    invoke-interface {p0, p1}, Landroid/app/Application$ActivityLifecycleCallbacks;->onActivityResumed(Landroid/app/Activity;)V

    return-void
.end method

.method public onActivitySaveInstanceState(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 4
    .param p1    # Landroid/app/Activity;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    # invokes: Lcom/leanplum/LeanplumActivityHelper;->isLifecycleCallbacksOverridden(Landroid/app/Activity;)Z
    invoke-static {p1}, Lcom/leanplum/LeanplumActivityHelper;->access$000(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    iget-object p0, p0, Lcom/leanplum/LeanplumActivityHelper$DefaultLifecycleCallbacksHandler;->callback:Landroid/app/Application$ActivityLifecycleCallbacks;

    invoke-interface {p0, p1, p2}, Landroid/app/Application$ActivityLifecycleCallbacks;->onActivitySaveInstanceState(Landroid/app/Activity;Landroid/os/Bundle;)V

    return-void
.end method

.method public onActivityStarted(Landroid/app/Activity;)V
    .registers 3
    .param p1    # Landroid/app/Activity;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    # invokes: Lcom/leanplum/LeanplumActivityHelper;->isLifecycleCallbacksOverridden(Landroid/app/Activity;)Z
    invoke-static {p1}, Lcom/leanplum/LeanplumActivityHelper;->access$000(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    iget-object p0, p0, Lcom/leanplum/LeanplumActivityHelper$DefaultLifecycleCallbacksHandler;->callback:Landroid/app/Application$ActivityLifecycleCallbacks;

    invoke-interface {p0, p1}, Landroid/app/Application$ActivityLifecycleCallbacks;->onActivityStarted(Landroid/app/Activity;)V

    return-void
.end method

.method public onActivityStopped(Landroid/app/Activity;)V
    .registers 3

    # invokes: Lcom/leanplum/LeanplumActivityHelper;->isLifecycleCallbacksOverridden(Landroid/app/Activity;)Z
    invoke-static {p1}, Lcom/leanplum/LeanplumActivityHelper;->access$000(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    iget-object p0, p0, Lcom/leanplum/LeanplumActivityHelper$DefaultLifecycleCallbacksHandler;->callback:Landroid/app/Application$ActivityLifecycleCallbacks;

    invoke-interface {p0, p1}, Landroid/app/Application$ActivityLifecycleCallbacks;->onActivityStopped(Landroid/app/Activity;)V

    return-void
.end method
