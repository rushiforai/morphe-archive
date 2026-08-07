.class public Lcom/ss/bytertc/engine/utils/AppMonitor;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/app/Application$ActivityLifecycleCallbacks;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/bytertc/engine/utils/AppMonitor$Callback;
    }
.end annotation


# static fields
.field public static final BACKGROUND:I = 0x0

.field public static final FOREGROUND:I = 0x1

.field private static volatile INSTANCE:Lcom/ss/bytertc/engine/utils/AppMonitor;


# instance fields
.field private mCallbacks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/ss/bytertc/engine/utils/AppMonitor$Callback;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/ss/bytertc/engine/utils/AppMonitor;->mCallbacks:Ljava/util/List;

    .line 10
    .line 11
    invoke-direct {p0, p1}, Lcom/ss/bytertc/engine/utils/AppMonitor;->registerLifecycle(Landroid/content/Context;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static get(Landroid/content/Context;)Lcom/ss/bytertc/engine/utils/AppMonitor;
    .locals 2

    .line 1
    sget-object v0, Lcom/ss/bytertc/engine/utils/AppMonitor;->INSTANCE:Lcom/ss/bytertc/engine/utils/AppMonitor;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Lcom/ss/bytertc/engine/utils/AppMonitor;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Lcom/ss/bytertc/engine/utils/AppMonitor;->INSTANCE:Lcom/ss/bytertc/engine/utils/AppMonitor;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Lcom/ss/bytertc/engine/utils/AppMonitor;

    .line 13
    .line 14
    invoke-direct {v1, p0}, Lcom/ss/bytertc/engine/utils/AppMonitor;-><init>(Landroid/content/Context;)V

    .line 15
    .line 16
    .line 17
    sput-object v1, Lcom/ss/bytertc/engine/utils/AppMonitor;->INSTANCE:Lcom/ss/bytertc/engine/utils/AppMonitor;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception p0

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw p0

    .line 26
    :cond_1
    :goto_2
    sget-object p0, Lcom/ss/bytertc/engine/utils/AppMonitor;->INSTANCE:Lcom/ss/bytertc/engine/utils/AppMonitor;

    .line 27
    .line 28
    return-object p0
.end method

.method private registerLifecycle(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Landroid/app/Application;

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public notifyCallback(I)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/utils/AppMonitor;->mCallbacks:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/ss/bytertc/engine/utils/AppMonitor$Callback;

    .line 18
    .line 19
    invoke-interface {v0, p1}, Lcom/ss/bytertc/engine/utils/AppMonitor$Callback;->callback(I)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    return-void
.end method

.method public onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 0

    return-void
.end method

.method public onActivityDestroyed(Landroid/app/Activity;)V
    .locals 0

    return-void
.end method

.method public onActivityPaused(Landroid/app/Activity;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-virtual {p0, p1}, Lcom/ss/bytertc/engine/utils/AppMonitor;->notifyCallback(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public onActivityResumed(Landroid/app/Activity;)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    invoke-virtual {p0, p1}, Lcom/ss/bytertc/engine/utils/AppMonitor;->notifyCallback(I)V

    .line 3
    .line 4
    .line 5
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

.method public register(Landroid/content/Context;Lcom/ss/bytertc/engine/utils/AppMonitor$Callback;)Lcom/ss/bytertc/engine/utils/AppMonitor;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/utils/AppMonitor;->mCallbacks:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0, p2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/ss/bytertc/engine/utils/AppMonitor;->mCallbacks:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    :cond_0
    invoke-static {p1}, Lcom/ss/bytertc/engine/utils/CommonUtils;->isInForeground(Landroid/content/Context;)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    invoke-virtual {p0, p1}, Lcom/ss/bytertc/engine/utils/AppMonitor;->notifyCallback(I)V

    .line 19
    .line 20
    .line 21
    return-object p0
.end method

.method public release(Landroid/content/Context;)Z
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Landroid/app/Application;

    .line 8
    .line 9
    invoke-virtual {p1, p0}, Landroid/app/Application;->unregisterActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/ss/bytertc/engine/utils/AppMonitor;->mCallbacks:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 15
    .line 16
    .line 17
    const/4 p0, 0x0

    .line 18
    sput-object p0, Lcom/ss/bytertc/engine/utils/AppMonitor;->INSTANCE:Lcom/ss/bytertc/engine/utils/AppMonitor;

    .line 19
    .line 20
    const/4 p0, 0x1

    .line 21
    return p0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return p0
.end method

.method public unRegister(Lcom/ss/bytertc/engine/utils/AppMonitor$Callback;)Lcom/ss/bytertc/engine/utils/AppMonitor;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/utils/AppMonitor;->mCallbacks:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/ss/bytertc/engine/utils/AppMonitor;->mCallbacks:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    return-object p0
.end method
