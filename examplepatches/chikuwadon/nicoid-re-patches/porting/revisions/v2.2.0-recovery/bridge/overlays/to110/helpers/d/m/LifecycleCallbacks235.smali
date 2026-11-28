.class public final Ld/m/LifecycleCallbacks235;
.super Ljava/lang/Object;
.source "LifecycleCallbacks235.java"

# interfaces
.implements Landroid/app/Application$ActivityLifecycleCallbacks;


# static fields
.field private static final registered:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/app/Activity;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 9
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Ld/m/LifecycleCallbacks235;->registered:Ljava/util/WeakHashMap;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static register(Landroid/app/Activity;)V
    .registers 3

    .line 11
    sget-object v0, Ld/m/LifecycleCallbacks235;->registered:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 12
    :cond_0
    new-instance v0, Ld/m/LifecycleCallbacks235;

    invoke-direct {v0}, Ld/m/LifecycleCallbacks235;-><init>()V

    invoke-virtual {p0, v0}, Landroid/app/Activity;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 13
    sget-object v0, Ld/m/LifecycleCallbacks235;->registered:Ljava/util/WeakHashMap;

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v0, p0, v1}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    return-void
.end method


# virtual methods
.method public onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 3

    .line 21
    return-void
.end method

.method public onActivityDestroyed(Landroid/app/Activity;)V
    .registers 3

    .line 27
    sget-object v0, Ld/m/LifecycleCallbacks235;->registered:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public onActivityPaused(Landroid/app/Activity;)V
    .registers 2

    .line 24
    return-void
.end method

.method public onActivityPostCreated(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 3

    .line 15
    sget-object p2, Ld/m/e$a;->ON_CREATE:Ld/m/e$a;

    invoke-static {p1, p2}, Ld/m/p;->dispatch235(Landroid/app/Activity;Ld/m/e$a;)V

    return-void
.end method

.method public onActivityPostResumed(Landroid/app/Activity;)V
    .registers 3

    .line 17
    sget-object v0, Ld/m/e$a;->ON_RESUME:Ld/m/e$a;

    invoke-static {p1, v0}, Ld/m/p;->dispatch235(Landroid/app/Activity;Ld/m/e$a;)V

    return-void
.end method

.method public onActivityPostStarted(Landroid/app/Activity;)V
    .registers 3

    .line 16
    sget-object v0, Ld/m/e$a;->ON_START:Ld/m/e$a;

    invoke-static {p1, v0}, Ld/m/p;->dispatch235(Landroid/app/Activity;Ld/m/e$a;)V

    return-void
.end method

.method public onActivityPreDestroyed(Landroid/app/Activity;)V
    .registers 3

    .line 20
    sget-object v0, Ld/m/e$a;->ON_DESTROY:Ld/m/e$a;

    invoke-static {p1, v0}, Ld/m/p;->dispatch235(Landroid/app/Activity;Ld/m/e$a;)V

    return-void
.end method

.method public onActivityPrePaused(Landroid/app/Activity;)V
    .registers 3

    .line 18
    sget-object v0, Ld/m/e$a;->ON_PAUSE:Ld/m/e$a;

    invoke-static {p1, v0}, Ld/m/p;->dispatch235(Landroid/app/Activity;Ld/m/e$a;)V

    return-void
.end method

.method public onActivityPreStopped(Landroid/app/Activity;)V
    .registers 3

    .line 19
    sget-object v0, Ld/m/e$a;->ON_STOP:Ld/m/e$a;

    invoke-static {p1, v0}, Ld/m/p;->dispatch235(Landroid/app/Activity;Ld/m/e$a;)V

    return-void
.end method

.method public onActivityResumed(Landroid/app/Activity;)V
    .registers 2

    .line 23
    return-void
.end method

.method public onActivitySaveInstanceState(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 3

    .line 26
    return-void
.end method

.method public onActivityStarted(Landroid/app/Activity;)V
    .registers 2

    .line 22
    return-void
.end method

.method public onActivityStopped(Landroid/app/Activity;)V
    .registers 2

    .line 25
    return-void
.end method
