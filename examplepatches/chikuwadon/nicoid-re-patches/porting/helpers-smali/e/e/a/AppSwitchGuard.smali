.class public final Le/e/a/AppSwitchGuard;
.super Ljava/lang/Object;
.source "AppSwitchGuard.java"


# static fields
.field private static final DELAY_MS:I = 0x1f4

.field private static final MAIN:Landroid/os/Handler;

.field private static final PENDING:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/app/Activity;",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field private static application:Landroid/app/Application;

.field private static dispatching:Z

.field private static resumed:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 15
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Le/e/a/AppSwitchGuard;->MAIN:Landroid/os/Handler;

    .line 16
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/AppSwitchGuard;->PENDING:Ljava/util/WeakHashMap;

    .line 17
    new-instance v0, Ljava/lang/ref/WeakReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Le/e/a/AppSwitchGuard;->resumed:Ljava/lang/ref/WeakReference;

    .line 19
    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0()Ljava/util/WeakHashMap;
    .registers 1

    .line 16
    sget-object v0, Le/e/a/AppSwitchGuard;->PENDING:Ljava/util/WeakHashMap;

    return-object v0
.end method

.method static synthetic access$1()Ljava/lang/ref/WeakReference;
    .registers 1

    .line 17
    sget-object v0, Le/e/a/AppSwitchGuard;->resumed:Ljava/lang/ref/WeakReference;

    return-object v0
.end method

.method static synthetic access$2(Z)V
    .registers 1

    .line 19
    sput-boolean p0, Le/e/a/AppSwitchGuard;->dispatching:Z

    return-void
.end method

.method static synthetic access$3(Ljava/lang/ref/WeakReference;)V
    .registers 1

    .line 17
    sput-object p0, Le/e/a/AppSwitchGuard;->resumed:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method static synthetic access$4()Landroid/os/Handler;
    .registers 1

    .line 15
    sget-object v0, Le/e/a/AppSwitchGuard;->MAIN:Landroid/os/Handler;

    return-object v0
.end method

.method public static intercept(Ljava/lang/Object;Z)Z
    .registers 6

    .line 25
    if-nez p1, :cond_4a

    sget-boolean p1, Le/e/a/AppSwitchGuard;->dispatching:Z

    if-nez p1, :cond_4a

    instance-of p1, p0, Landroid/app/Activity;

    if-nez p1, :cond_b

    goto :goto_4a

    .line 26
    :cond_b
    check-cast p0, Landroid/app/Activity;

    .line 27
    invoke-static {p0}, Le/e/a/AppSwitchGuard;->track(Landroid/app/Activity;)V

    .line 28
    sget-object p1, Le/e/a/AppSwitchGuard;->resumed:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p1

    if-nez p1, :cond_1f

    new-instance p1, Ljava/lang/ref/WeakReference;

    invoke-direct {p1, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object p1, Le/e/a/AppSwitchGuard;->resumed:Ljava/lang/ref/WeakReference;

    .line 29
    :cond_1f
    invoke-static {p0}, Le/e/a/PlaybackTransfer;->capture(Landroid/app/Activity;)Ljava/lang/Runnable;

    move-result-object p1

    .line 30
    sget-object v0, Le/e/a/AppSwitchGuard;->PENDING:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Runnable;

    .line 31
    if-eqz v0, :cond_32

    sget-object v1, Le/e/a/AppSwitchGuard;->MAIN:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 32
    :cond_32
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 33
    new-instance v1, Le/e/a/AppSwitchGuard$1;

    invoke-direct {v1, v0, p1}, Le/e/a/AppSwitchGuard$1;-><init>(Ljava/lang/ref/WeakReference;Ljava/lang/Runnable;)V

    .line 53
    sget-object p1, Le/e/a/AppSwitchGuard;->PENDING:Ljava/util/WeakHashMap;

    invoke-virtual {p1, p0, v1}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    sget-object p0, Le/e/a/AppSwitchGuard;->MAIN:Landroid/os/Handler;

    const-wide/16 v2, 0x1f4

    invoke-virtual {p0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 55
    const/4 p0, 0x1

    return p0

    .line 25
    :cond_4a
    :goto_4a
    const/4 p0, 0x0

    return p0
.end method

.method private static track(Landroid/app/Activity;)V
    .registers 2

    .line 59
    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p0

    .line 60
    sget-object v0, Le/e/a/AppSwitchGuard;->application:Landroid/app/Application;

    if-ne v0, p0, :cond_9

    return-void

    .line 61
    :cond_9
    sput-object p0, Le/e/a/AppSwitchGuard;->application:Landroid/app/Application;

    .line 62
    new-instance v0, Le/e/a/AppSwitchGuard$2;

    invoke-direct {v0}, Le/e/a/AppSwitchGuard$2;-><init>()V

    invoke-virtual {p0, v0}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 82
    return-void
.end method
