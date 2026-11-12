.class public Lcom/leanplum/LeanplumActivityHelper;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/leanplum/LeanplumActivityHelper$LeanplumLifecycleCallbacks;,
        Lcom/leanplum/LeanplumActivityHelper$DefaultLifecycleCallbacksHandler;
    }
.end annotation


# static fields
.field private static final OVERRIDDEN_ACTIVITIES:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/Class<",
            "+",
            "Landroid/app/Activity;",
            ">;>;"
        }
    .end annotation
.end field

.field private static currentActivity:Landroid/app/Activity;

.field private static deferredActivitiesStrategy:Lcom/leanplum/DeferredActivitiesStrategy;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field static isActivityPaused:Z

.field private static final pendingActions:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field private static registeredCallbacks:Z

.field private static final runPendingActionsRunnable:Ljava/lang/Runnable;


# instance fields
.field private final activity:Landroid/app/Activity;

.field private inflater:Lcom/leanplum/LeanplumInflater;

.field private res:Lcom/leanplum/LeanplumResources;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sput-object v0, Lcom/leanplum/LeanplumActivityHelper;->OVERRIDDEN_ACTIVITIES:Ljava/util/Set;

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Class;

    invoke-static {v0}, Lcom/leanplum/DeferredActivitiesStrategy$BlacklistStrategy;->create([Ljava/lang/Class;)Lcom/leanplum/DeferredActivitiesStrategy$BlacklistStrategy;

    move-result-object v0

    sput-object v0, Lcom/leanplum/LeanplumActivityHelper;->deferredActivitiesStrategy:Lcom/leanplum/DeferredActivitiesStrategy;

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    sput-object v0, Lcom/leanplum/LeanplumActivityHelper;->pendingActions:Ljava/util/Queue;

    new-instance v0, Lcom/leanplum/LeanplumActivityHelper$1;

    invoke-direct {v0}, Lcom/leanplum/LeanplumActivityHelper$1;-><init>()V

    sput-object v0, Lcom/leanplum/LeanplumActivityHelper;->runPendingActionsRunnable:Ljava/lang/Runnable;

    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/leanplum/LeanplumActivityHelper;->activity:Landroid/app/Activity;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lcom/leanplum/Leanplum;->setApplicationContext(Landroid/content/Context;)V

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Lcom/leanplum/annotations/Parser;->parseVariables([Ljava/lang/Object;)V

    return-void
.end method

.method public static synthetic access$000(Landroid/app/Activity;)Z
    .registers 1

    invoke-static {p0}, Lcom/leanplum/LeanplumActivityHelper;->isLifecycleCallbacksOverridden(Landroid/app/Activity;)Z

    move-result p0

    return p0
.end method

.method public static synthetic access$100()V
    .registers 0

    invoke-static {}, Lcom/leanplum/LeanplumActivityHelper;->runPendingActions()V

    return-void
.end method

.method public static synthetic access$200(Landroid/app/Activity;)V
    .registers 1

    invoke-static {p0}, Lcom/leanplum/LeanplumActivityHelper;->onStop(Landroid/app/Activity;)V

    return-void
.end method

.method public static synthetic access$300(Landroid/app/Activity;)V
    .registers 1

    invoke-static {p0}, Lcom/leanplum/LeanplumActivityHelper;->onResume(Landroid/app/Activity;)V

    return-void
.end method

.method public static synthetic access$400(Landroid/app/Activity;)V
    .registers 1

    invoke-static {p0}, Lcom/leanplum/LeanplumActivityHelper;->onPause(Landroid/app/Activity;)V

    return-void
.end method

.method public static varargs deferMessagesForActivities([Ljava/lang/Class;)V
    .registers 2

    if-eqz p0, :cond_b

    array-length v0, p0

    if-eqz v0, :cond_b

    invoke-static {p0}, Lcom/leanplum/DeferredActivitiesStrategy$BlacklistStrategy;->create([Ljava/lang/Class;)Lcom/leanplum/DeferredActivitiesStrategy$BlacklistStrategy;

    move-result-object p0

    sput-object p0, Lcom/leanplum/LeanplumActivityHelper;->deferredActivitiesStrategy:Lcom/leanplum/DeferredActivitiesStrategy;

    :cond_b
    return-void
.end method

.method public static enableLifecycleCallbacks(Landroid/app/Application;)V
    .registers 4

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/leanplum/Leanplum;->setApplicationContext(Landroid/content/Context;)V

    new-instance v0, Lcom/leanplum/LeanplumActivityHelper$DefaultLifecycleCallbacksHandler;

    new-instance v1, Lcom/leanplum/LeanplumActivityHelper$LeanplumLifecycleCallbacks;

    invoke-static {p0}, Lcom/leanplum/utils/BuildUtil;->shouldDisableTrampolines(Landroid/content/Context;)Z

    move-result v2

    invoke-direct {v1, v2}, Lcom/leanplum/LeanplumActivityHelper$LeanplumLifecycleCallbacks;-><init>(Z)V

    invoke-direct {v0, v1}, Lcom/leanplum/LeanplumActivityHelper$DefaultLifecycleCallbacksHandler;-><init>(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    invoke-virtual {p0, v0}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    const/4 p0, 0x1

    sput-boolean p0, Lcom/leanplum/LeanplumActivityHelper;->registeredCallbacks:Z

    sget-object p0, Lcom/leanplum/LeanplumActivityHelper;->runPendingActionsRunnable:Ljava/lang/Runnable;

    invoke-static {p0}, Lcom/leanplum/internal/LeanplumInternal;->addStartIssuedHandler(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static getCurrentActivity()Landroid/app/Activity;
    .registers 1

    sget-object v0, Lcom/leanplum/LeanplumActivityHelper;->currentActivity:Landroid/app/Activity;

    return-object v0
.end method

.method private static isActivityClassIgnored(Landroid/app/Activity;)Z
    .registers 2

    sget-object v0, Lcom/leanplum/LeanplumActivityHelper;->deferredActivitiesStrategy:Lcom/leanplum/DeferredActivitiesStrategy;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-interface {v0, p0}, Lcom/leanplum/DeferredActivitiesStrategy;->isActivityClassIgnored(Ljava/lang/Class;)Z

    move-result p0

    return p0
.end method

.method public static isActivityPaused()Z
    .registers 1

    sget-boolean v0, Lcom/leanplum/LeanplumActivityHelper;->isActivityPaused:Z

    return v0
.end method

.method private static isLifecycleCallbacksOverridden(Landroid/app/Activity;)Z
    .registers 2

    sget-object v0, Lcom/leanplum/LeanplumActivityHelper;->OVERRIDDEN_ACTIVITIES:Ljava/util/Set;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method private static onPause(Landroid/app/Activity;)V
    .registers 1

    const/4 p0, 0x1

    .line 15
    sput-boolean p0, Lcom/leanplum/LeanplumActivityHelper;->isActivityPaused:Z

    return-void
.end method

.method private static onResume(Landroid/app/Activity;)V
    .registers 2

    const/4 v0, 0x0

    sput-boolean v0, Lcom/leanplum/LeanplumActivityHelper;->isActivityPaused:Z

    sput-object p0, Lcom/leanplum/LeanplumActivityHelper;->currentActivity:Landroid/app/Activity;

    invoke-static {}, Lcom/leanplum/internal/LeanplumInternal;->isPaused()Z

    move-result p0

    if-nez p0, :cond_11

    invoke-static {}, Lcom/leanplum/internal/LeanplumInternal;->hasStartedInBackground()Z

    move-result p0

    if-eqz p0, :cond_20

    :cond_11
    invoke-static {}, Lcom/leanplum/Leanplum;->resume()V

    invoke-static {}, Lcom/leanplum/internal/ActionManager;->getLocationManager()Lcom/leanplum/LocationManager;

    move-result-object p0

    if-eqz p0, :cond_20

    invoke-interface {p0}, Lcom/leanplum/LocationManager;->updateGeofencing()V

    invoke-interface {p0}, Lcom/leanplum/LocationManager;->updateUserLocation()V

    :cond_20
    sget-object p0, Lcom/leanplum/LeanplumActivityHelper;->runPendingActionsRunnable:Ljava/lang/Runnable;

    invoke-static {p0}, Lcom/leanplum/internal/LeanplumInternal;->addStartIssuedHandler(Ljava/lang/Runnable;)V

    return-void
.end method

.method private static onStop(Landroid/app/Activity;)V
    .registers 2

    sget-boolean v0, Lcom/leanplum/LeanplumActivityHelper;->isActivityPaused:Z

    if-eqz v0, :cond_10

    invoke-static {}, Lcom/leanplum/Leanplum;->pause()V

    invoke-static {}, Lcom/leanplum/internal/ActionManager;->getLocationManager()Lcom/leanplum/LocationManager;

    move-result-object v0

    if-eqz v0, :cond_10

    invoke-interface {v0}, Lcom/leanplum/LocationManager;->updateGeofencing()V

    :cond_10
    sget-object v0, Lcom/leanplum/LeanplumActivityHelper;->currentActivity:Landroid/app/Activity;

    if-eqz v0, :cond_1d

    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1d

    const/4 p0, 0x0

    sput-object p0, Lcom/leanplum/LeanplumActivityHelper;->currentActivity:Landroid/app/Activity;

    :cond_1d
    return-void
.end method

.method public static overrideLifecycleCallbacksProvider(Landroid/app/Activity;Lcom/leanplum/ActivityLifecycleCallbacksProvider;)V
    .registers 4

    sget-object v0, Lcom/leanplum/LeanplumActivityHelper;->OVERRIDDEN_ACTIVITIES:Ljava/util/Set;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    new-instance v0, Lcom/leanplum/LeanplumActivityHelper$LeanplumLifecycleCallbacks;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lcom/leanplum/utils/BuildUtil;->shouldDisableTrampolines(Landroid/content/Context;)Z

    move-result p0

    invoke-direct {v0, p0}, Lcom/leanplum/LeanplumActivityHelper$LeanplumLifecycleCallbacks;-><init>(Z)V

    invoke-interface {p1, v0}, Lcom/leanplum/ActivityLifecycleCallbacksProvider;->registerLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    return-void
.end method

.method public static queueActionUponActive(Ljava/lang/Runnable;)V
    .registers 2

    :try_start_0
    sget-object v0, Lcom/leanplum/LeanplumActivityHelper;->currentActivity:Landroid/app/Activity;

    if-eqz v0, :cond_1e

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_1e

    sget-boolean v0, Lcom/leanplum/LeanplumActivityHelper;->isActivityPaused:Z

    if-nez v0, :cond_1e

    instance-of v0, p0, Lcom/leanplum/callbacks/PostponableAction;

    if-eqz v0, :cond_1a

    sget-object v0, Lcom/leanplum/LeanplumActivityHelper;->currentActivity:Landroid/app/Activity;

    invoke-static {v0}, Lcom/leanplum/LeanplumActivityHelper;->isActivityClassIgnored(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_1e

    :cond_1a
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void

    :cond_1e
    sget-object v0, Lcom/leanplum/LeanplumActivityHelper;->pendingActions:Ljava/util/Queue;

    monitor-enter v0
    :try_end_21
    .catchall {:try_start_0 .. :try_end_21} :catchall_2a

    :try_start_21
    invoke-interface {v0, p0}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    monitor-exit v0

    return-void

    :goto_26
    monitor-exit v0
    :try_end_27
    .catchall {:try_start_21 .. :try_end_27} :catchall_28

    :try_start_27
    throw p0
    :try_end_28
    .catchall {:try_start_27 .. :try_end_28} :catchall_2a

    :catchall_28
    move-exception p0

    goto :goto_26

    :catchall_2a
    move-exception p0

    invoke-static {p0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    return-void
.end method

.method private static runPendingActions()V
    .registers 3

    sget-boolean v0, Lcom/leanplum/LeanplumActivityHelper;->isActivityPaused:Z

    if-nez v0, :cond_3e

    sget-object v0, Lcom/leanplum/LeanplumActivityHelper;->currentActivity:Landroid/app/Activity;

    if-eqz v0, :cond_3e

    sget-object v0, Lcom/leanplum/LeanplumActivityHelper;->pendingActions:Ljava/util/Queue;

    monitor-enter v0

    :try_start_b
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1, v0}, Ljava/util/LinkedList;-><init>(Ljava/util/Collection;)V

    invoke-interface {v0}, Ljava/util/Collection;->clear()V

    monitor-exit v0
    :try_end_14
    .catchall {:try_start_b .. :try_end_14} :catchall_3c

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_18
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3e

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Runnable;

    instance-of v2, v1, Lcom/leanplum/callbacks/PostponableAction;

    if-eqz v2, :cond_36

    sget-object v2, Lcom/leanplum/LeanplumActivityHelper;->currentActivity:Landroid/app/Activity;

    invoke-static {v2}, Lcom/leanplum/LeanplumActivityHelper;->isActivityClassIgnored(Landroid/app/Activity;)Z

    move-result v2

    if-eqz v2, :cond_36

    sget-object v2, Lcom/leanplum/LeanplumActivityHelper;->pendingActions:Ljava/util/Queue;

    invoke-interface {v2, v1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    goto :goto_18

    :cond_36
    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    goto :goto_18

    :goto_3a
    :try_start_3a
    monitor-exit v0
    :try_end_3b
    .catchall {:try_start_3a .. :try_end_3b} :catchall_3c

    throw v1

    :catchall_3c
    move-exception v1

    goto :goto_3a

    :cond_3e
    return-void
.end method

.method public static setCurrentActivity(Landroid/content/Context;)V
    .registers 2

    instance-of v0, p0, Landroid/app/Activity;

    if-eqz v0, :cond_d

    check-cast p0, Landroid/app/Activity;

    sput-object p0, Lcom/leanplum/LeanplumActivityHelper;->currentActivity:Landroid/app/Activity;

    sget-object p0, Lcom/leanplum/LeanplumActivityHelper;->runPendingActionsRunnable:Ljava/lang/Runnable;

    invoke-static {p0}, Lcom/leanplum/internal/LeanplumInternal;->addStartIssuedHandler(Ljava/lang/Runnable;)V

    :cond_d
    return-void
.end method

.method public static setDeferredActivitiesStrategy(Lcom/leanplum/DeferredActivitiesStrategy;)V
    .registers 1
    .param p0    # Lcom/leanplum/DeferredActivitiesStrategy;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    sput-object p0, Lcom/leanplum/LeanplumActivityHelper;->deferredActivitiesStrategy:Lcom/leanplum/DeferredActivitiesStrategy;

    return-void
.end method


# virtual methods
.method public getLeanplumResources()Lcom/leanplum/LeanplumResources;
    .registers 2

    const/4 v0, 0x0

    .line 28
    invoke-virtual {p0, v0}, Lcom/leanplum/LeanplumActivityHelper;->getLeanplumResources(Landroid/content/res/Resources;)Lcom/leanplum/LeanplumResources;

    move-result-object p0

    return-object p0
.end method

.method public getLeanplumResources(Landroid/content/res/Resources;)Lcom/leanplum/LeanplumResources;
    .registers 3

    iget-object v0, p0, Lcom/leanplum/LeanplumActivityHelper;->res:Lcom/leanplum/LeanplumResources;

    if-eqz v0, :cond_5

    return-object v0

    :cond_5
    if-nez p1, :cond_d

    iget-object p1, p0, Lcom/leanplum/LeanplumActivityHelper;->activity:Landroid/app/Activity;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    :cond_d
    instance-of v0, p1, Lcom/leanplum/LeanplumResources;

    if-eqz v0, :cond_14

    check-cast p1, Lcom/leanplum/LeanplumResources;

    return-object p1

    :cond_14
    new-instance v0, Lcom/leanplum/LeanplumResources;

    invoke-direct {v0, p1}, Lcom/leanplum/LeanplumResources;-><init>(Landroid/content/res/Resources;)V

    iput-object v0, p0, Lcom/leanplum/LeanplumActivityHelper;->res:Lcom/leanplum/LeanplumResources;

    return-object v0
.end method

.method public onPause()V
    .registers 2

    :try_start_0
    sget-boolean v0, Lcom/leanplum/LeanplumActivityHelper;->registeredCallbacks:Z

    if-nez v0, :cond_9

    iget-object p0, p0, Lcom/leanplum/LeanplumActivityHelper;->activity:Landroid/app/Activity;

    invoke-static {p0}, Lcom/leanplum/LeanplumActivityHelper;->onPause(Landroid/app/Activity;)V
    :try_end_9
    .catchall {:try_start_0 .. :try_end_9} :catchall_a

    :cond_9
    return-void

    :catchall_a
    move-exception p0

    invoke-static {p0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    return-void
.end method

.method public onResume()V
    .registers 2

    .line 38
    :try_start_0
    sget-boolean v0, Lcom/leanplum/LeanplumActivityHelper;->registeredCallbacks:Z

    if-nez v0, :cond_9

    .line 39
    iget-object p0, p0, Lcom/leanplum/LeanplumActivityHelper;->activity:Landroid/app/Activity;

    invoke-static {p0}, Lcom/leanplum/LeanplumActivityHelper;->onResume(Landroid/app/Activity;)V
    :try_end_9
    .catchall {:try_start_0 .. :try_end_9} :catchall_a

    :cond_9
    return-void

    :catchall_a
    move-exception p0

    .line 40
    invoke-static {p0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    return-void
.end method

.method public onStop()V
    .registers 2

    .line 30
    :try_start_0
    sget-boolean v0, Lcom/leanplum/LeanplumActivityHelper;->registeredCallbacks:Z

    if-nez v0, :cond_9

    .line 31
    iget-object p0, p0, Lcom/leanplum/LeanplumActivityHelper;->activity:Landroid/app/Activity;

    invoke-static {p0}, Lcom/leanplum/LeanplumActivityHelper;->onStop(Landroid/app/Activity;)V
    :try_end_9
    .catchall {:try_start_0 .. :try_end_9} :catchall_a

    :cond_9
    return-void

    :catchall_a
    move-exception p0

    .line 32
    invoke-static {p0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    return-void
.end method

.method public setContentView(I)V
    .registers 3

    iget-object v0, p0, Lcom/leanplum/LeanplumActivityHelper;->inflater:Lcom/leanplum/LeanplumInflater;

    if-nez v0, :cond_c

    iget-object v0, p0, Lcom/leanplum/LeanplumActivityHelper;->activity:Landroid/app/Activity;

    invoke-static {v0}, Lcom/leanplum/LeanplumInflater;->from(Landroid/content/Context;)Lcom/leanplum/LeanplumInflater;

    move-result-object v0

    iput-object v0, p0, Lcom/leanplum/LeanplumActivityHelper;->inflater:Lcom/leanplum/LeanplumInflater;

    :cond_c
    iget-object p0, p0, Lcom/leanplum/LeanplumActivityHelper;->activity:Landroid/app/Activity;

    invoke-virtual {v0, p1}, Lcom/leanplum/LeanplumInflater;->inflate(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/app/Activity;->setContentView(Landroid/view/View;)V

    return-void
.end method
