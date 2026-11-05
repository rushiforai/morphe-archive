.class public final Le/e/a/MiniSession225;
.super Ljava/lang/Object;
.source "MiniSession225.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/MiniSession225$Session;,
        Le/e/a/MiniSession225$SurfaceKeeper;
    }
.end annotation


# static fields
.field private static final CALLBACKS:Landroid/app/Application$ActivityLifecycleCallbacks;

.field private static final EXPANDED:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/app/Activity;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private static final MAIN:Landroid/os/Handler;

.field private static active:Le/e/a/MiniSession225$Session;

.field private static app:Landroid/app/Application;

.field private static foreground:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field

.field private static previous:Ljava/lang/ref/WeakReference;
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

    sput-object v0, Le/e/a/MiniSession225;->MAIN:Landroid/os/Handler;

    .line 17
    new-instance v0, Ljava/lang/ref/WeakReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Le/e/a/MiniSession225;->previous:Ljava/lang/ref/WeakReference;

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Le/e/a/MiniSession225;->foreground:Ljava/lang/ref/WeakReference;

    .line 19
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/MiniSession225;->EXPANDED:Ljava/util/WeakHashMap;

    .line 43
    new-instance v0, Le/e/a/MiniSession225$1;

    invoke-direct {v0}, Le/e/a/MiniSession225$1;-><init>()V

    sput-object v0, Le/e/a/MiniSession225;->CALLBACKS:Landroid/app/Application$ActivityLifecycleCallbacks;

    .line 59
    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Ljava/lang/ref/WeakReference;)V
    .registers 1

    .line 17
    sput-object p0, Le/e/a/MiniSession225;->foreground:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method static synthetic access$1(Ljava/lang/ref/WeakReference;)V
    .registers 1

    .line 17
    sput-object p0, Le/e/a/MiniSession225;->previous:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method static synthetic access$2()Le/e/a/MiniSession225$Session;
    .registers 1

    .line 18
    sget-object v0, Le/e/a/MiniSession225;->active:Le/e/a/MiniSession225$Session;

    return-object v0
.end method

.method static synthetic access$3()Landroid/os/Handler;
    .registers 1

    .line 15
    sget-object v0, Le/e/a/MiniSession225;->MAIN:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$4()Ljava/lang/ref/WeakReference;
    .registers 1

    .line 17
    sget-object v0, Le/e/a/MiniSession225;->foreground:Ljava/lang/ref/WeakReference;

    return-object v0
.end method

.method static synthetic access$5()Ljava/lang/ref/WeakReference;
    .registers 1

    .line 17
    sget-object v0, Le/e/a/MiniSession225;->previous:Ljava/lang/ref/WeakReference;

    return-object v0
.end method

.method static synthetic access$6()Ljava/util/WeakHashMap;
    .registers 1

    .line 19
    sget-object v0, Le/e/a/MiniSession225;->EXPANDED:Ljava/util/WeakHashMap;

    return-object v0
.end method

.method static synthetic access$7(Le/e/a/MiniSession225$Session;)V
    .registers 1

    .line 18
    sput-object p0, Le/e/a/MiniSession225;->active:Le/e/a/MiniSession225$Session;

    return-void
.end method

.method public static back(Ljava/lang/Object;Z)Z
    .registers 5

    .line 63
    const/4 v0, 0x0

    if-eqz p1, :cond_2f

    instance-of p1, p0, Landroid/app/Activity;

    if-nez p1, :cond_8

    goto :goto_2f

    .line 64
    :cond_8
    check-cast p0, Landroid/app/Activity;

    .line 65
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    const-string v1, "back_playback"

    const-string v2, "background"

    invoke-interface {p1, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1d

    return v0

    .line 66
    :cond_1d
    :try_start_1d
    const-string p1, "v"

    invoke-static {p0, p1}, Le/e/a/MiniSession225;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Le/e/a/MiniSession225;->minimize(Ljava/lang/Object;)Z

    move-result p0
    :try_end_27
    .catch Ljava/lang/Exception; {:try_start_1d .. :try_end_27} :catch_28

    return p0

    :catch_28
    move-exception p0

    const-string p1, "Cannot minimize player"

    invoke-static {p1, p0}, Le/e/a/MiniSession225;->log(Ljava/lang/String;Ljava/lang/Exception;)V

    return v0

    .line 63
    :cond_2f
    :goto_2f
    return v0
.end method

.method public static beginMinimized(Ljava/lang/Object;Landroid/app/Activity;)Z
    .registers 9

    .line 96
    const/4 v0, 0x0

    const/4 v1, 0x0

    :try_start_2
    const-string v2, "A1"

    invoke-static {p0, v2}, Le/e/a/MiniSession225;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/Activity;

    const-string v3, "a0"

    invoke-static {p0, v3}, Le/e/a/MiniSession225;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    invoke-static {v3}, Le/e/a/MiniSession225;->texture(Landroid/view/View;)Landroid/view/TextureView;

    move-result-object v4

    if-eqz v2, :cond_5b

    invoke-virtual {v2}, Landroid/app/Activity;->isFinishing()Z

    move-result v5

    if-nez v5, :cond_5b

    invoke-virtual {v2}, Landroid/app/Activity;->isDestroyed()Z

    move-result v5

    if-nez v5, :cond_5b

    if-eq p1, v2, :cond_5b

    if-eqz v4, :cond_5b

    invoke-virtual {v3}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v5

    instance-of v5, v5, Landroid/view/ViewGroup;

    if-nez v5, :cond_31

    goto :goto_5b

    .line 97
    :cond_31
    sget-object v5, Le/e/a/MiniSession225;->active:Le/e/a/MiniSession225$Session;

    const/4 v6, 0x1

    if-eqz v5, :cond_3b

    sget-object v5, Le/e/a/MiniSession225;->active:Le/e/a/MiniSession225$Session;

    invoke-virtual {v5, v6}, Le/e/a/MiniSession225$Session;->close(Z)V

    :cond_3b
    new-instance v5, Le/e/a/MiniSession225$Session;

    invoke-direct {v5, p0, v2, v3, v4}, Le/e/a/MiniSession225$Session;-><init>(Ljava/lang/Object;Landroid/app/Activity;Landroid/view/View;Landroid/view/TextureView;)V
    :try_end_40
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_40} :catch_5c

    :try_start_40
    iput-boolean v6, v5, Le/e/a/MiniSession225$Session;->openingDirect:Z

    iput-boolean v6, v5, Le/e/a/MiniSession225$Session;->directEntry:Z

    const/4 p0, 0x0

    iput p0, v5, Le/e/a/MiniSession225$Session;->initialExpansion:F

    new-instance p0, Ljava/lang/ref/WeakReference;

    invoke-direct {p0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p0, v5, Le/e/a/MiniSession225$Session;->directDestination:Ljava/lang/ref/WeakReference;

    sput-object v5, Le/e/a/MiniSession225;->active:Le/e/a/MiniSession225$Session;

    sget-object p0, Le/e/a/MiniSession225;->MAIN:Landroid/os/Handler;

    iget-object p1, v5, Le/e/a/MiniSession225$Session;->navigateDirect:Ljava/lang/Runnable;

    invoke-virtual {p0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_57
    .catch Ljava/lang/Exception; {:try_start_40 .. :try_end_57} :catch_58

    return v6

    .line 98
    :catch_58
    move-exception p0

    move-object v1, v5

    goto :goto_5d

    .line 96
    :cond_5b
    :goto_5b
    return v0

    .line 98
    :catch_5c
    move-exception p0

    :goto_5d
    if-eqz v1, :cond_62

    invoke-virtual {v1, v0}, Le/e/a/MiniSession225$Session;->close(Z)V

    :cond_62
    const-string p1, "Cannot initialize retained mini presentation"

    invoke-static {p1, p0}, Le/e/a/MiniSession225;->log(Ljava/lang/String;Ljava/lang/Exception;)V

    return v0
.end method

.method static varargs call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Class<",
            "*>;[",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 23
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p1

    invoke-virtual {p1, p0, p3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static closeCurrent()V
    .registers 2

    .line 37
    sget-object v0, Le/e/a/MiniSession225;->active:Le/e/a/MiniSession225$Session;

    if-eqz v0, :cond_8

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Le/e/a/MiniSession225$Session;->close(Z)V

    :cond_8
    return-void
.end method

.method public static destroyed(Ljava/lang/Object;)V
    .registers 3

    .line 216
    sget-object v0, Le/e/a/MiniSession225;->active:Le/e/a/MiniSession225$Session;

    if-eqz v0, :cond_c

    iget-object v1, v0, Le/e/a/MiniSession225$Session;->owner:Ljava/lang/Object;

    if-ne v1, p0, :cond_c

    const/4 p0, 0x0

    invoke-virtual {v0, p0}, Le/e/a/MiniSession225$Session;->close(Z)V

    :cond_c
    return-void
.end method

.method static get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 22
    invoke-static {p0, p1}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method static log(Ljava/lang/String;Ljava/lang/Exception;)V
    .registers 3

    .line 60
    const-string v0, "nicoid-mini"

    invoke-static {v0, p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-void
.end method

.method public static minimize(Ljava/lang/Object;)Z
    .registers 12

    .line 70
    invoke-static {p0}, Le/e/a/MiniSession225;->owns(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_8

    return v1

    .line 71
    :cond_8
    nop

    .line 73
    const/4 v0, 0x0

    const/4 v2, 0x0

    :try_start_b
    const-string v3, "A1"

    invoke-static {p0, v3}, Le/e/a/MiniSession225;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/app/Activity;

    invoke-static {v3}, Le/e/a/PlaybackNavigation114;->destination(Landroid/app/Activity;)Landroid/app/Activity;

    move-result-object v4

    if-nez v4, :cond_21

    sget-object v4, Le/e/a/MiniSession225;->previous:Ljava/lang/ref/WeakReference;

    invoke-virtual {v4}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/app/Activity;

    .line 74
    :cond_21
    if-eqz v3, :cond_127

    invoke-virtual {v3}, Landroid/app/Activity;->isFinishing()Z

    move-result v5

    if-nez v5, :cond_127

    invoke-virtual {v3}, Landroid/app/Activity;->isDestroyed()Z

    move-result v5

    if-eqz v5, :cond_31

    goto/16 :goto_127

    .line 75
    :cond_31
    if-nez v4, :cond_3a

    const-string p0, "no previous app screen"

    invoke-static {p0}, Le/e/a/MiniSession225;->unavailable(Ljava/lang/String;)Z

    move-result p0

    return p0

    .line 76
    :cond_3a
    invoke-virtual {v4}, Landroid/app/Activity;->isFinishing()Z

    move-result v5

    if-nez v5, :cond_120

    invoke-virtual {v4}, Landroid/app/Activity;->isDestroyed()Z

    move-result v5

    if-eqz v5, :cond_48

    goto/16 :goto_120

    .line 77
    :cond_48
    if-eq v3, v4, :cond_119

    invoke-static {v4}, Le/e/a/MiniSession225;->player(Landroid/app/Activity;)Z

    move-result v5

    if-eqz v5, :cond_52

    goto/16 :goto_119

    .line 78
    :cond_52
    invoke-virtual {v3}, Landroid/app/Activity;->getTaskId()I

    move-result v5

    invoke-virtual {v4}, Landroid/app/Activity;->getTaskId()I

    move-result v6

    if-eq v5, v6, :cond_63

    const-string p0, "different activity task"

    invoke-static {p0}, Le/e/a/MiniSession225;->unavailable(Ljava/lang/String;)Z

    move-result p0

    return p0

    .line 79
    :cond_63
    invoke-static {v3}, Le/e/a/ModernShorts;->active(Landroid/app/Activity;)Z

    move-result v5

    if-nez v5, :cond_112

    const-string v5, "x0"

    invoke-static {p0, v5}, Le/e/a/PlayerGestures219;->flag(Ljava/lang/Object;Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_73

    goto/16 :goto_112

    .line 80
    :cond_73
    const-string v5, "a0"

    invoke-static {p0, v5}, Le/e/a/MiniSession225;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/view/View;

    invoke-static {v5}, Le/e/a/MiniSession225;->texture(Landroid/view/View;)Landroid/view/TextureView;

    move-result-object v6

    .line 81
    if-nez v6, :cond_a9

    const-string p0, "unknown"
    :try_end_83
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_83} :catch_12e

    :try_start_83
    const-string v1, "videoViewImpl"

    invoke-static {v5, v1}, Le/e/a/MiniSession225;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_95

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p0
    :try_end_93
    .catch Ljava/lang/Exception; {:try_start_83 .. :try_end_93} :catch_94

    goto :goto_95

    :catch_94
    move-exception v1

    :cond_95
    :goto_95
    :try_start_95
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "renderer "

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le/e/a/MiniSession225;->unavailable(Ljava/lang/String;)Z

    move-result p0

    return p0

    .line 82
    :cond_a9
    invoke-virtual {v6}, Landroid/view/TextureView;->isAvailable()Z

    move-result v7

    if-eqz v7, :cond_10b

    invoke-virtual {v6}, Landroid/view/TextureView;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v7

    if-eqz v7, :cond_10b

    invoke-virtual {v5}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v7

    if-nez v7, :cond_bc

    goto :goto_10b

    .line 83
    :cond_bc
    const-string v7, "getDuration"

    new-array v8, v0, [Ljava/lang/Class;

    new-array v9, v0, [Ljava/lang/Object;

    invoke-static {v5, v7, v8, v9}, Le/e/a/MiniSession225;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Number;

    invoke-virtual {v7}, Ljava/lang/Number;->longValue()J

    move-result-wide v7

    const-wide/16 v9, 0x0

    cmp-long v7, v7, v9

    if-gtz v7, :cond_d9

    const-string p0, "video not prepared"

    invoke-static {p0}, Le/e/a/MiniSession225;->unavailable(Ljava/lang/String;)Z

    move-result p0

    return p0

    .line 84
    :cond_d9
    sget-object v7, Le/e/a/MiniSession225;->active:Le/e/a/MiniSession225$Session;

    if-eqz v7, :cond_e2

    sget-object v7, Le/e/a/MiniSession225;->active:Le/e/a/MiniSession225$Session;

    invoke-virtual {v7, v1}, Le/e/a/MiniSession225$Session;->close(Z)V

    .line 85
    :cond_e2
    new-instance v7, Le/e/a/MiniSession225$Session;

    invoke-direct {v7, p0, v3, v5, v6}, Le/e/a/MiniSession225$Session;-><init>(Ljava/lang/Object;Landroid/app/Activity;Landroid/view/View;Landroid/view/TextureView;)V
    :try_end_e7
    .catch Ljava/lang/Exception; {:try_start_95 .. :try_end_e7} :catch_12e

    :try_start_e7
    sput-object v7, Le/e/a/MiniSession225;->active:Le/e/a/MiniSession225$Session;

    .line 87
    invoke-static {v3, v4}, Le/e/a/PlaybackNavigation114;->browseIntent(Landroid/app/Activity;Landroid/app/Activity;)Landroid/content/Intent;

    move-result-object p0

    .line 88
    const/high16 v2, 0x20070000

    invoke-virtual {p0, v2}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 89
    invoke-virtual {v3, p0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    invoke-virtual {v3, v0, v0}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 90
    nop

    .line 91
    sget-object p0, Le/e/a/MiniSession225;->MAIN:Landroid/os/Handler;

    iget-object v2, v7, Le/e/a/MiniSession225$Session;->launchTimeout:Ljava/lang/Runnable;

    const-wide/16 v3, 0x708

    invoke-virtual {p0, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 92
    const-string p0, "In-app player retained for background presentation"

    invoke-static {p0}, Le/e/a/ModernDebug;->record(Ljava/lang/String;)V
    :try_end_107
    .catch Ljava/lang/Exception; {:try_start_e7 .. :try_end_107} :catch_108

    return v1

    .line 93
    :catch_108
    move-exception p0

    move-object v2, v7

    goto :goto_12f

    .line 82
    :cond_10b
    :goto_10b
    :try_start_10b
    const-string p0, "video surface not ready"

    invoke-static {p0}, Le/e/a/MiniSession225;->unavailable(Ljava/lang/String;)Z

    move-result p0

    return p0

    .line 79
    :cond_112
    :goto_112
    const-string p0, "short or remote playback"

    invoke-static {p0}, Le/e/a/MiniSession225;->unavailable(Ljava/lang/String;)Z

    move-result p0

    return p0

    .line 77
    :cond_119
    :goto_119
    const-string p0, "previous screen is a player"

    invoke-static {p0}, Le/e/a/MiniSession225;->unavailable(Ljava/lang/String;)Z

    move-result p0

    return p0

    .line 76
    :cond_120
    :goto_120
    const-string p0, "previous screen closed"

    invoke-static {p0}, Le/e/a/MiniSession225;->unavailable(Ljava/lang/String;)Z

    move-result p0

    return p0

    .line 74
    :cond_127
    :goto_127
    const-string p0, "source closed"

    invoke-static {p0}, Le/e/a/MiniSession225;->unavailable(Ljava/lang/String;)Z

    move-result p0
    :try_end_12d
    .catch Ljava/lang/Exception; {:try_start_10b .. :try_end_12d} :catch_12e

    return p0

    .line 93
    :catch_12e
    move-exception p0

    :goto_12f
    if-eqz v2, :cond_134

    invoke-virtual {v2, v0}, Le/e/a/MiniSession225$Session;->close(Z)V

    :cond_134
    const-string v1, "Retained playback unavailable"

    invoke-static {v1, p0}, Le/e/a/MiniSession225;->log(Ljava/lang/String;Ljava/lang/Exception;)V

    return v0
.end method

.method public static minimizeDragged(Ljava/lang/Object;F)Z
    .registers 5

    .line 68
    invoke-static {p0}, Le/e/a/MiniSession225;->minimize(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3f

    invoke-static {p0}, Le/e/a/MiniSession225;->owns(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_3f

    sget-object p0, Le/e/a/MiniSession225;->active:Le/e/a/MiniSession225$Session;

    iget-object p0, p0, Le/e/a/MiniSession225$Session;->source:Landroid/app/Activity;

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result p0

    sget-object v1, Le/e/a/MiniSession225;->active:Le/e/a/MiniSession225$Session;

    iget-object v1, v1, Le/e/a/MiniSession225$Session;->source:Landroid/app/Activity;

    const/16 v2, 0x40

    invoke-static {v1, v2}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v1

    sub-int/2addr p0, v1

    const/4 v1, 0x1

    invoke-static {v1, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    int-to-float p0, p0

    sget-object v1, Le/e/a/MiniSession225;->active:Le/e/a/MiniSession225$Session;

    div-float/2addr p1, p0

    const/high16 p0, 0x3f800000    # 1.0f

    sub-float p1, p0, p1

    invoke-static {p0, p1}, Ljava/lang/Math;->min(FF)F

    move-result p0

    const/4 p1, 0x0

    invoke-static {p1, p0}, Ljava/lang/Math;->max(FF)F

    move-result p0

    iput p0, v1, Le/e/a/MiniSession225$Session;->initialExpansion:F

    :cond_3f
    return v0
.end method

.method public static owns(Ljava/lang/Object;)Z
    .registers 2

    .line 32
    sget-object v0, Le/e/a/MiniSession225;->active:Le/e/a/MiniSession225$Session;

    if-eqz v0, :cond_16

    sget-object v0, Le/e/a/MiniSession225;->active:Le/e/a/MiniSession225$Session;

    iget-object v0, v0, Le/e/a/MiniSession225$Session;->owner:Ljava/lang/Object;

    if-ne v0, p0, :cond_16

    sget-object p0, Le/e/a/MiniSession225;->active:Le/e/a/MiniSession225$Session;

    iget-object p0, p0, Le/e/a/MiniSession225$Session;->state:Le/e/a/MiniState225;

    invoke-virtual {p0}, Le/e/a/MiniState225;->live()Z

    move-result p0

    if-eqz p0, :cond_16

    const/4 p0, 0x1

    return p0

    :cond_16
    const/4 p0, 0x0

    return p0
.end method

.method static player(Landroid/app/Activity;)Z
    .registers 1

    .line 24
    invoke-static {p0}, Le/e/a/PlaybackBar221;->player(Landroid/app/Activity;)Z

    move-result p0

    return p0
.end method

.method public static prepared(Ljava/lang/Object;)V
    .registers 7

    .line 100
    sget-object v0, Le/e/a/MiniSession225;->active:Le/e/a/MiniSession225$Session;

    if-eqz v0, :cond_62

    iget-object v1, v0, Le/e/a/MiniSession225$Session;->owner:Ljava/lang/Object;

    if-eq v1, p0, :cond_9

    goto :goto_62

    :cond_9
    const/4 v1, 0x1

    iput-boolean v1, v0, Le/e/a/MiniSession225$Session;->directPrepared:Z

    invoke-virtual {v0}, Le/e/a/MiniSession225$Session;->update()V

    iget-boolean v1, v0, Le/e/a/MiniSession225$Session;->directEntry:Z

    if-nez v1, :cond_14

    return-void

    :cond_14
    const/4 v1, 0x0

    :try_start_15
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    iget-object v3, v0, Le/e/a/MiniSession225$Session;->video:Landroid/view/View;

    const-string v4, "audioFocusHelper"

    invoke-static {v3, v4}, Le/e/a/MiniSession225;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    const-string v4, "pausedForLoss"

    invoke-static {v3, v4}, Le/e/a/MiniSession225;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v2
    :try_end_29
    .catch Ljava/lang/Exception; {:try_start_15 .. :try_end_29} :catch_2a

    goto :goto_2c

    :catch_2a
    move-exception v2

    move v2, v1

    :goto_2c
    :try_start_2c
    sget-object v3, Le/e/a/MiniSession225;->foreground:Ljava/lang/ref/WeakReference;

    invoke-virtual {v3}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_62

    if-nez v2, :cond_62

    invoke-static {p0}, Le/e/a/PlaybackSession;->allowRetry(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_62

    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    iget-object v2, v0, Le/e/a/MiniSession225$Session;->video:Landroid/view/View;

    const-string v3, "isPlaying"

    new-array v4, v1, [Ljava/lang/Class;

    new-array v5, v1, [Ljava/lang/Object;

    invoke-static {v2, v3, v4, v5}, Le/e/a/MiniSession225;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p0, v2}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_62

    iget-object p0, v0, Le/e/a/MiniSession225$Session;->video:Landroid/view/View;

    const-string v0, "start"

    new-array v2, v1, [Ljava/lang/Class;

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {p0, v0, v2, v1}, Le/e/a/MiniSession225;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_5b
    .catch Ljava/lang/Exception; {:try_start_2c .. :try_end_5b} :catch_5c

    goto :goto_62

    :catch_5c
    move-exception p0

    const-string v0, "Cannot start prepared retained session"

    invoke-static {v0, p0}, Le/e/a/MiniSession225;->log(Ljava/lang/String;Ljava/lang/Exception;)V

    :cond_62
    :goto_62
    return-void
.end method

.method public static retainNavigation(Landroid/app/Activity;)Z
    .registers 2

    .line 35
    invoke-static {p0}, Le/e/a/MiniSession225;->retaining(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_c

    invoke-static {p0}, Le/e/a/PlaybackTransfer221;->retaining(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_1a

    :cond_c
    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_1a

    invoke-virtual {p0}, Landroid/app/Activity;->isDestroyed()Z

    move-result p0

    if-nez p0, :cond_1a

    const/4 p0, 0x1

    return p0

    :cond_1a
    const/4 p0, 0x0

    return p0
.end method

.method public static retaining(Landroid/app/Activity;)Z
    .registers 2

    .line 33
    sget-object v0, Le/e/a/MiniSession225;->active:Le/e/a/MiniSession225$Session;

    if-eqz v0, :cond_16

    sget-object v0, Le/e/a/MiniSession225;->active:Le/e/a/MiniSession225$Session;

    iget-object v0, v0, Le/e/a/MiniSession225$Session;->source:Landroid/app/Activity;

    if-ne v0, p0, :cond_16

    sget-object p0, Le/e/a/MiniSession225;->active:Le/e/a/MiniSession225$Session;

    iget-object p0, p0, Le/e/a/MiniSession225$Session;->state:Le/e/a/MiniState225;

    invoke-virtual {p0}, Le/e/a/MiniState225;->live()Z

    move-result p0

    if-eqz p0, :cond_16

    const/4 p0, 0x1

    return p0

    :cond_16
    const/4 p0, 0x0

    return p0
.end method

.method static settings(Landroid/app/Activity;)Z
    .registers 2

    .line 36
    instance-of v0, p0, Landroid/preference/PreferenceActivity;

    if-nez v0, :cond_16

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p0

    const-string v0, "NicoidSetting"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_16

    const/4 p0, 0x0

    return p0

    :cond_16
    const/4 p0, 0x1

    return p0
.end method

.method public static showing()Z
    .registers 1

    .line 37
    invoke-static {}, Le/e/a/DirectBackground235;->showing()Z

    move-result v0

    if-nez v0, :cond_16

    sget-object v0, Le/e/a/MiniSession225;->active:Le/e/a/MiniSession225$Session;

    if-eqz v0, :cond_14

    sget-object v0, Le/e/a/MiniSession225;->active:Le/e/a/MiniSession225$Session;

    iget-object v0, v0, Le/e/a/MiniSession225$Session;->state:Le/e/a/MiniState225;

    invoke-virtual {v0}, Le/e/a/MiniState225;->live()Z

    move-result v0

    if-nez v0, :cond_16

    :cond_14
    const/4 v0, 0x0

    return v0

    :cond_16
    const/4 v0, 0x1

    return v0
.end method

.method static texture(Landroid/view/View;)Landroid/view/TextureView;
    .registers 3

    .line 102
    instance-of v0, p0, Landroid/view/TextureView;

    if-eqz v0, :cond_17

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "com.devbrackets.android.exomedia.core.video.exo.ExoTextureVideoView"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_17

    check-cast p0, Landroid/view/TextureView;

    return-object p0

    .line 103
    :cond_17
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_33

    check-cast p0, Landroid/view/ViewGroup;

    const/4 v0, 0x0

    :goto_1e
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-lt v0, v1, :cond_25

    goto :goto_33

    :cond_25
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-static {v1}, Le/e/a/MiniSession225;->texture(Landroid/view/View;)Landroid/view/TextureView;

    move-result-object v1

    if-eqz v1, :cond_30

    return-object v1

    :cond_30
    add-int/lit8 v0, v0, 0x1

    goto :goto_1e

    :cond_33
    :goto_33
    const/4 p0, 0x0

    return-object p0
.end method

.method public static textureBacking(Landroid/content/Context;Z)Z
    .registers 6

    .line 26
    const/4 v0, 0x0

    move v1, v0

    :goto_2
    const/16 v2, 0x8

    if-ge v1, v2, :cond_3e

    if-nez p0, :cond_9

    goto :goto_3e

    .line 27
    :cond_9
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "com.sauzask.nicoid.NicoidPopupViewService"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :cond_1b

    return v3

    :cond_1b
    instance-of v2, p0, Landroid/app/Activity;

    if-eqz v2, :cond_2b

    check-cast p0, Landroid/app/Activity;

    invoke-static {p0}, Le/e/a/MiniSession225;->player(Landroid/app/Activity;)Z

    move-result p0

    if-nez p0, :cond_2a

    if-nez p1, :cond_2a

    return v0

    :cond_2a
    return v3

    .line 28
    :cond_2b
    instance-of v2, p0, Landroid/content/ContextWrapper;

    if-nez v2, :cond_30

    :goto_2f
    goto :goto_3e

    :cond_30
    move-object v2, p0

    check-cast v2, Landroid/content/ContextWrapper;

    invoke-virtual {v2}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object v2

    if-ne v2, p0, :cond_3a

    goto :goto_2f

    .line 26
    :cond_3a
    add-int/lit8 v1, v1, 0x1

    move-object p0, v2

    goto :goto_2

    .line 29
    :cond_3e
    :goto_3e
    return p1
.end method

.method public static track(Landroid/app/Activity;)V
    .registers 3

    .line 40
    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p0

    if-eqz p0, :cond_20

    sget-object v0, Le/e/a/MiniSession225;->app:Landroid/app/Application;

    if-ne v0, p0, :cond_b

    goto :goto_20

    .line 41
    :cond_b
    sget-object v0, Le/e/a/MiniSession225;->app:Landroid/app/Application;

    if-eqz v0, :cond_16

    sget-object v0, Le/e/a/MiniSession225;->app:Landroid/app/Application;

    sget-object v1, Le/e/a/MiniSession225;->CALLBACKS:Landroid/app/Application$ActivityLifecycleCallbacks;

    invoke-virtual {v0, v1}, Landroid/app/Application;->unregisterActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    :cond_16
    sput-object p0, Le/e/a/MiniSession225;->app:Landroid/app/Application;

    sget-object p0, Le/e/a/MiniSession225;->app:Landroid/app/Application;

    sget-object v0, Le/e/a/MiniSession225;->CALLBACKS:Landroid/app/Application$ActivityLifecycleCallbacks;

    invoke-virtual {p0, v0}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 42
    return-void

    .line 40
    :cond_20
    :goto_20
    return-void
.end method

.method static unavailable(Ljava/lang/String;)Z
    .registers 3

    .line 31
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "In-app mini-player unavailable: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le/e/a/ModernDebug;->record(Ljava/lang/String;)V

    const/4 p0, 0x0

    return p0
.end method

.method public static videoLayout(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    .registers 4

    .line 38
    sget-object v0, Le/e/a/MiniSession225;->active:Le/e/a/MiniSession225$Session;

    if-eqz v0, :cond_13

    iget-object v1, v0, Le/e/a/MiniSession225$Session;->state:Le/e/a/MiniState225;

    invoke-virtual {v1}, Le/e/a/MiniState225;->live()Z

    move-result v1

    if-eqz v1, :cond_13

    iget-object v1, v0, Le/e/a/MiniSession225$Session;->video:Landroid/view/View;

    if-ne v1, p0, :cond_13

    iput-object p1, v0, Le/e/a/MiniSession225$Session;->originalParams:Landroid/view/ViewGroup$LayoutParams;

    return-void

    :cond_13
    invoke-virtual {p0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method public static wasExpanded(Landroid/app/Activity;)Z
    .registers 2

    .line 20
    sget-object v0, Le/e/a/MiniSession225;->EXPANDED:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method
