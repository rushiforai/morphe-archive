.class public final Le/e/a/Dev111;
.super Ljava/lang/Object;
.source "Dev111.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/Dev111$Position;
    }
.end annotation


# static fields
.field private static final INITIAL:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Object;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private static final MAIN:Landroid/os/Handler;

.field private static final RESUME:Ljava/lang/String; = "nicoid_app_resume_playback"

.field private static final SAVED:Ljava/lang/String; = "nicoid_tab_scroll111_"

.field private static final SCROLL:Ljava/lang/String; = "nicoid_restore_tab_scroll"

.field private static final SETTINGS_LISTENERS:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/preference/PreferenceActivity;",
            "Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;",
            ">;"
        }
    .end annotation
.end field

.field private static final STARTED:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/app/Activity;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private static final VIEWS:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/app/Activity;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Le/e/a/Dev111$Position;",
            ">;>;"
        }
    .end annotation
.end field

.field private static backgroundAt:J

.field private static leftApp:Z

.field private static resumeAttempt:I

.field private static resumeScheduled:Z

.field private static returnInFlight:Z

.field private static returnStartedAt:J

.field private static wasBackground:Z


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 32
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Le/e/a/Dev111;->MAIN:Landroid/os/Handler;

    .line 33
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/Dev111;->INITIAL:Ljava/util/Map;

    .line 34
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/Dev111;->VIEWS:Ljava/util/Map;

    .line 35
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/Dev111;->SETTINGS_LISTENERS:Ljava/util/Map;

    .line 40
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/Dev111;->STARTED:Ljava/util/WeakHashMap;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 72
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static activeBackgroundService()Landroid/app/Service;
    .registers 7

    .line 197
    const-string v0, "active"

    const/4 v1, 0x0

    :try_start_0
    const-string v2, "e.e.a.DirectBackground235"

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    .line 198
    .local v2, "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {v2, v0}, Le/e/a/Dev111;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    .line 199
    .local v3, "current":Ljava/lang/reflect/Field;
    invoke-virtual {v3, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 200
    .local v4, "state":Ljava/lang/Object;
    if-eqz v4, :cond_0

    .line 201
    const-string v5, "service"

    invoke-static {v4, v5}, Le/e/a/Dev111;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    .line 202
    .local v5, "owner":Ljava/lang/Object;
    instance-of v6, v5, Landroid/app/Service;

    if-eqz v6, :cond_0

    move-object v6, v5

    check-cast v6, Landroid/app/Service;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v6

    .line 206
    .end local v2    # "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v3    # "current":Ljava/lang/reflect/Field;
    .end local v4    # "state":Ljava/lang/Object;
    .end local v5    # "owner":Ljava/lang/Object;
    :cond_0
    goto :goto_0

    .line 204
    :catch_0
    move-exception v2

    .line 205
    .local v2, "error":Ljava/lang/Exception;
    const-string v3, "nicoid-return"

    const-string v4, "Cannot inspect retained background session"

    invoke-static {v3, v4, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 209
    .end local v2    # "error":Ljava/lang/Exception;
    :goto_0
    :try_start_1
    const-string v2, "e.e.a.PlaybackReturn"

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    invoke-static {v2, v0}, Le/e/a/Dev111;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ref/Reference;

    .line 210
    .local v0, "ref":Ljava/lang/ref/Reference;, "Ljava/lang/ref/Reference<*>;"
    if-nez v0, :cond_1

    move-object v2, v1

    goto :goto_1

    :cond_1
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v2

    .line 211
    .local v2, "owner":Ljava/lang/Object;
    :goto_1
    instance-of v3, v2, Landroid/app/Service;

    if-eqz v3, :cond_2

    move-object v3, v2

    check-cast v3, Landroid/app/Service;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-object v1, v3

    :cond_2
    return-object v1

    .line 212
    .end local v0    # "ref":Ljava/lang/ref/Reference;, "Ljava/lang/ref/Reference<*>;"
    .end local v2    # "owner":Ljava/lang/Object;
    :catch_1
    move-exception v0

    .local v0, "ignored":Ljava/lang/Exception;
    return-object v1
.end method

.method public static declared-synchronized appStarted(Landroid/app/Activity;)V
    .registers 8
    .param p0, "activity"    # Landroid/app/Activity;

    const-class v0, Le/e/a/Dev111;

    monitor-enter v0

    .line 44
    if-nez p0, :cond_0

    monitor-exit v0

    return-void

    .line 45
    :cond_0
    :try_start_0
    sget-object v1, Le/e/a/Dev111;->STARTED:Ljava/util/WeakHashMap;

    invoke-virtual {v1}, Ljava/util/WeakHashMap;->isEmpty()Z

    move-result v1

    .line 46
    .local v1, "wasEmpty":Z
    sget-object v2, Le/e/a/Dev111;->STARTED:Ljava/util/WeakHashMap;

    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v2, p0, v3}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    if-eqz v1, :cond_1

    sget-boolean v2, Le/e/a/Dev111;->wasBackground:Z

    if-eqz v2, :cond_1

    .line 48
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    sget-wide v4, Le/e/a/Dev111;->backgroundAt:J

    sub-long/2addr v2, v4

    const-wide/16 v4, 0xb4

    cmp-long v6, v2, v4

    if-ltz v6, :cond_1

    .line 49
    const/4 v2, 0x1

    sput-boolean v2, Le/e/a/Dev111;->leftApp:Z

    .line 50
    const-string v2, "nicoid-return"

    const-string v3, "Application re-entered foreground"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 52
    :cond_1
    const/4 v2, 0x0

    sput-boolean v2, Le/e/a/Dev111;->wasBackground:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 53
    monitor-exit v0

    return-void

    .line 43
    .end local v1    # "wasEmpty":Z
    .end local p0    # "activity":Landroid/app/Activity;
    :catchall_0
    move-exception p0

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method public static declared-synchronized appStopped(Landroid/app/Activity;)V
    .registers 4
    .param p0, "activity"    # Landroid/app/Activity;

    const-class v0, Le/e/a/Dev111;

    monitor-enter v0

    .line 55
    if-nez p0, :cond_0

    monitor-exit v0

    return-void

    .line 56
    :cond_0
    :try_start_0
    sget-object v1, Le/e/a/Dev111;->STARTED:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    sget-object v1, Le/e/a/Dev111;->STARTED:Ljava/util/WeakHashMap;

    invoke-virtual {v1}, Ljava/util/WeakHashMap;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 58
    const/4 v1, 0x1

    sput-boolean v1, Le/e/a/Dev111;->wasBackground:Z

    .line 59
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    sput-wide v1, Le/e/a/Dev111;->backgroundAt:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 61
    :cond_1
    monitor-exit v0

    return-void

    .line 54
    .end local p0    # "activity":Landroid/app/Activity;
    :catchall_0
    move-exception p0

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method public static cancelPendingReturn(Landroid/app/Activity;)Z
    .registers 11
    .param p0, "activity"    # Landroid/app/Activity;

    .line 143
    const/4 v0, 0x0

    if-nez p0, :cond_0

    return v0

    .line 145
    :cond_0
    :try_start_0
    const-string v1, "e.e.a.PopupReturn244"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 146
    .local v1, "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v2, "matches"

    const/4 v3, 0x1

    new-array v4, v3, [Ljava/lang/Class;

    const-class v5, Landroid/app/Activity;

    aput-object v5, v4, v0

    invoke-virtual {v1, v2, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 147
    .local v2, "matches":Ljava/lang/reflect/Method;
    invoke-virtual {v2, v3}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 148
    sget-object v4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    new-array v5, v3, [Ljava/lang/Object;

    aput-object p0, v5, v0

    const/4 v6, 0x0

    invoke-virtual {v2, v6, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    return v0

    .line 149
    :cond_1
    const-string v4, "pending"

    invoke-virtual {v1, v4}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    .line 150
    .local v4, "pending":Ljava/lang/reflect/Field;
    invoke-virtual {v4, v3}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 151
    invoke-virtual {v4, v6}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    .line 152
    .local v5, "handoff":Ljava/lang/Object;
    if-nez v5, :cond_2

    return v0

    .line 153
    :cond_2
    const-string v7, "cancel"

    new-array v8, v3, [Ljava/lang/Class;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    aput-object v9, v8, v0

    invoke-virtual {v1, v7, v8}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v7

    .line 154
    .local v7, "cancel":Ljava/lang/reflect/Method;
    invoke-virtual {v7, v3}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 155
    new-array v8, v3, [Ljava/lang/Object;

    aput-object v5, v8, v0

    invoke-virtual {v7, v6, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 156
    invoke-static {}, Le/e/a/Dev111;->resetReturn()V

    .line 157
    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v6

    if-nez v6, :cond_3

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 158
    :cond_3
    return v3

    .line 159
    .end local v1    # "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "matches":Ljava/lang/reflect/Method;
    .end local v4    # "pending":Ljava/lang/reflect/Field;
    .end local v5    # "handoff":Ljava/lang/Object;
    .end local v7    # "cancel":Ljava/lang/reflect/Method;
    :catch_0
    move-exception v1

    .line 160
    .local v1, "error":Ljava/lang/Exception;
    const-string v2, "nicoid-return"

    const-string v3, "Cannot cancel retained return"

    invoke-static {v2, v3, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 161
    return v0
.end method

.method public static capturePage(Landroid/app/Activity;)V
    .registers 9
    .param p0, "activity"    # Landroid/app/Activity;

    .line 484
    if-eqz p0, :cond_a

    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_4

    .line 485
    :cond_0
    invoke-static {p0}, Le/e/a/Dev111;->root(Landroid/app/Activity;)Landroid/view/View;

    move-result-object v0

    .line 486
    .local v0, "content":Landroid/view/View;
    if-nez v0, :cond_1

    return-void

    .line 487
    :cond_1
    new-instance v1, Le/e/a/Dev111$Position;

    invoke-direct {v1}, Le/e/a/Dev111$Position;-><init>()V

    .line 488
    .local v1, "p":Le/e/a/Dev111$Position;
    const-class v2, Landroid/widget/ListView;

    invoke-static {v0, v2}, Le/e/a/Dev111;->find(Landroid/view/View;Ljava/lang/Class;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ListView;

    .line 489
    .local v2, "list":Landroid/widget/ListView;
    if-nez v2, :cond_2

    const-class v3, Landroid/widget/ScrollView;

    invoke-static {v0, v3}, Le/e/a/Dev111;->find(Landroid/view/View;Ljava/lang/Class;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ScrollView;

    goto :goto_0

    :cond_2
    const/4 v3, 0x0

    .line 490
    .local v3, "scroll":Landroid/widget/ScrollView;
    :goto_0
    if-nez v2, :cond_3

    if-nez v3, :cond_3

    return-void

    .line 491
    :cond_3
    const/4 v4, 0x1

    const/4 v5, 0x0

    if-eqz v2, :cond_5

    .line 492
    iput-boolean v4, v1, Le/e/a/Dev111$Position;->list:Z

    .line 493
    invoke-virtual {v2}, Landroid/widget/ListView;->getFirstVisiblePosition()I

    move-result v6

    iput v6, v1, Le/e/a/Dev111$Position;->index:I

    .line 494
    invoke-virtual {v2, v5}, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    .line 495
    .local v6, "first":Landroid/view/View;
    if-nez v6, :cond_4

    const/4 v7, 0x0

    goto :goto_1

    :cond_4
    invoke-virtual {v6}, Landroid/view/View;->getTop()I

    move-result v7

    :goto_1
    iput v7, v1, Le/e/a/Dev111$Position;->top:I

    .line 496
    .end local v6    # "first":Landroid/view/View;
    goto :goto_2

    :cond_5
    invoke-virtual {v3}, Landroid/widget/ScrollView;->getScrollY()I

    move-result v6

    iput v6, v1, Le/e/a/Dev111$Position;->scroll:I

    .line 497
    :goto_2
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v6

    const-string v7, "nicoid_local_playlists"

    invoke-virtual {v6, v7, v5}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v5

    if-eqz v5, :cond_7

    .line 498
    invoke-static {p0}, Le/e/a/Dev111;->playlistPage(Landroid/app/Activity;)Ljava/lang/Object;

    move-result-object v5

    .line 499
    .local v5, "page":Ljava/lang/Object;
    if-eqz v5, :cond_6

    :try_start_0
    const-string v6, "folder"

    invoke-static {v5, v6}, Le/e/a/Dev111;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    iput-object v6, v1, Le/e/a/Dev111$Position;->folder:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_3

    .line 500
    :catch_0
    move-exception v6

    :cond_6
    :goto_3
    nop

    .line 502
    .end local v5    # "page":Ljava/lang/Object;
    :cond_7
    sget-object v5, Le/e/a/Dev111;->VIEWS:Ljava/util/Map;

    invoke-interface {v5, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map;

    .line 503
    .local v5, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Le/e/a/Dev111$Position;>;"
    if-nez v5, :cond_8

    .line 504
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    move-object v5, v6

    .line 505
    sget-object v6, Le/e/a/Dev111;->VIEWS:Ljava/util/Map;

    invoke-interface {v6, p0, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 507
    :cond_8
    invoke-static {p0}, Le/e/a/Dev111;->key(Landroid/app/Activity;)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 508
    invoke-static {p0}, Le/e/a/Dev111;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v6

    const-string v7, "nicoid_restore_tab_scroll"

    invoke-interface {v6, v7, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v4

    if-eqz v4, :cond_9

    .line 509
    invoke-static {p0}, Le/e/a/Dev111;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v4

    invoke-interface {v4}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "nicoid_tab_scroll111_"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-static {p0}, Le/e/a/Dev111;->key(Landroid/app/Activity;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1}, Le/e/a/Dev111$Position;->json()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v4, v6, v7}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    invoke-interface {v4}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 511
    :cond_9
    return-void

    .line 484
    .end local v0    # "content":Landroid/view/View;
    .end local v1    # "p":Le/e/a/Dev111$Position;
    .end local v2    # "list":Landroid/widget/ListView;
    .end local v3    # "scroll":Landroid/widget/ScrollView;
    .end local v5    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Le/e/a/Dev111$Position;>;"
    :cond_a
    :goto_4
    return-void
.end method

.method public static enteredPage(Landroid/app/Activity;)V
    .registers 9
    .param p0, "activity"    # Landroid/app/Activity;

    .line 523
    if-eqz p0, :cond_b

    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_b

    invoke-virtual {p0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_7

    .line 524
    :cond_0
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "nicoid_local_playlists"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    .line 525
    .local v0, "playlist":Z
    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 528
    :try_start_0
    const-string v3, "e.e.a.LocalPlaylists"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    const-string v4, "show"

    const/4 v5, 0x1

    new-array v6, v5, [Ljava/lang/Class;

    const-class v7, Landroid/content/Context;

    aput-object v7, v6, v2

    invoke-virtual {v3, v4, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    new-array v4, v5, [Ljava/lang/Object;

    aput-object p0, v4, v2

    invoke-virtual {v3, v1, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 531
    goto :goto_0

    .line 529
    :catch_0
    move-exception v2

    .line 530
    .local v2, "error":Ljava/lang/Exception;
    const-string v3, "nicoid-playlist"

    const-string v4, "Cached page refresh skipped"

    invoke-static {v3, v4, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 533
    .end local v2    # "error":Ljava/lang/Exception;
    :cond_1
    :goto_0
    invoke-static {p0}, Le/e/a/Dev111;->getPosition(Landroid/app/Activity;)Le/e/a/Dev111$Position;

    move-result-object v2

    .line 534
    .local v2, "saved":Le/e/a/Dev111$Position;
    invoke-static {p0}, Le/e/a/Dev111;->root(Landroid/app/Activity;)Landroid/view/View;

    move-result-object v3

    .line 535
    .local v3, "content":Landroid/view/View;
    if-eqz v3, :cond_a

    if-nez v2, :cond_2

    goto :goto_6

    .line 536
    :cond_2
    if-eqz v0, :cond_6

    .line 537
    invoke-static {p0}, Le/e/a/Dev111;->playlistPage(Landroid/app/Activity;)Ljava/lang/Object;

    move-result-object v4

    .line 539
    .local v4, "page":Ljava/lang/Object;
    if-nez v4, :cond_3

    move-object v5, v1

    goto :goto_1

    :cond_3
    :try_start_1
    const-string v5, "folder"

    invoke-static {v4, v5}, Le/e/a/Dev111;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 540
    .local v5, "folder":Ljava/lang/String;
    :goto_1
    iget-object v6, v2, Le/e/a/Dev111$Position;->folder:Ljava/lang/String;

    if-nez v6, :cond_4

    if-eqz v5, :cond_5

    :goto_2
    goto :goto_3

    :cond_4
    iget-object v6, v2, Le/e/a/Dev111$Position;->folder:Ljava/lang/String;

    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    if-nez v6, :cond_5

    goto :goto_2

    :goto_3
    return-void

    .line 541
    .end local v5    # "folder":Ljava/lang/String;
    :cond_5
    goto :goto_4

    :catch_1
    move-exception v1

    .local v1, "ignored":Ljava/lang/Exception;
    return-void

    .line 543
    .end local v1    # "ignored":Ljava/lang/Exception;
    .end local v4    # "page":Ljava/lang/Object;
    :cond_6
    :goto_4
    const-class v4, Landroid/widget/ListView;

    invoke-static {v3, v4}, Le/e/a/Dev111;->find(Landroid/view/View;Ljava/lang/Class;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/ListView;

    .line 544
    .local v4, "list":Landroid/widget/ListView;
    if-nez v4, :cond_7

    const-class v1, Landroid/widget/ScrollView;

    invoke-static {v3, v1}, Le/e/a/Dev111;->find(Landroid/view/View;Ljava/lang/Class;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ScrollView;

    .line 545
    .local v1, "scroll":Landroid/widget/ScrollView;
    :cond_7
    if-eqz v4, :cond_8

    iget-boolean v5, v2, Le/e/a/Dev111$Position;->list:Z

    if-eqz v5, :cond_8

    .line 546
    iget v5, v2, Le/e/a/Dev111$Position;->index:I

    iget v6, v2, Le/e/a/Dev111$Position;->top:I

    invoke-static {v4, v5, v6}, Le/e/a/Dev112;->restoreList(Landroid/widget/ListView;II)V

    goto :goto_5

    .line 547
    :cond_8
    if-eqz v1, :cond_9

    iget-boolean v5, v2, Le/e/a/Dev111$Position;->list:Z

    if-nez v5, :cond_9

    .line 548
    new-instance v5, Le/e/a/Dev111$3;

    invoke-direct {v5, v1, v2}, Le/e/a/Dev111$3;-><init>(Landroid/widget/ScrollView;Le/e/a/Dev111$Position;)V

    invoke-virtual {v1, v5}, Landroid/widget/ScrollView;->post(Ljava/lang/Runnable;)Z

    .line 550
    :cond_9
    :goto_5
    return-void

    .line 535
    .end local v1    # "scroll":Landroid/widget/ScrollView;
    .end local v4    # "list":Landroid/widget/ListView;
    :cond_a
    :goto_6
    return-void

    .line 523
    .end local v0    # "playlist":Z
    .end local v2    # "saved":Le/e/a/Dev111$Position;
    .end local v3    # "content":Landroid/view/View;
    :cond_b
    :goto_7
    return-void
.end method

.method private static field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/reflect/Field;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 90
    .local p0, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    move-object v0, p0

    .local v0, "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_0
    if-eqz v0, :cond_0

    .line 92
    :try_start_0
    invoke-virtual {v0, p1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    .line 93
    .local v1, "f":Ljava/lang/reflect/Field;
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V
    :try_end_0
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_0

    .line 94
    return-object v1

    .line 95
    .end local v1    # "f":Ljava/lang/reflect/Field;
    :catch_0
    move-exception v1

    .line 90
    invoke-virtual {v0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v0

    goto :goto_0

    .line 97
    .end local v0    # "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_0
    new-instance v0, Ljava/lang/NoSuchFieldException;

    invoke-direct {v0, p1}, Ljava/lang/NoSuchFieldException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static find(Landroid/view/View;Ljava/lang/Class;)Landroid/view/View;
    .registers 6
    .param p0, "root"    # Landroid/view/View;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroid/view/View;",
            ">(",
            "Landroid/view/View;",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation

    .line 455
    .local p1, "type":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    const/4 v0, 0x0

    if-nez p0, :cond_0

    return-object v0

    .line 456
    :cond_0
    invoke-virtual {p1, p0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {p1, p0}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    return-object v0

    .line 457
    :cond_1
    instance-of v1, p0, Landroid/view/ViewGroup;

    if-eqz v1, :cond_3

    .line 458
    move-object v1, p0

    check-cast v1, Landroid/view/ViewGroup;

    .line 459
    .local v1, "group":Landroid/view/ViewGroup;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v3

    if-ge v2, v3, :cond_3

    .line 460
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-static {v3, p1}, Le/e/a/Dev111;->find(Landroid/view/View;Ljava/lang/Class;)Landroid/view/View;

    move-result-object v3

    .line 461
    .local v3, "child":Landroid/view/View;, "TT;"
    if-eqz v3, :cond_2

    return-object v3

    .line 459
    .end local v3    # "child":Landroid/view/View;, "TT;"
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 464
    .end local v1    # "group":Landroid/view/ViewGroup;
    .end local v2    # "i":I
    :cond_3
    return-object v0
.end method

.method private static get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 3
    .param p0, "owner"    # Ljava/lang/Object;
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 100
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0, p1}, Le/e/a/Dev111;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method private static getPosition(Landroid/app/Activity;)Le/e/a/Dev111$Position;
    .registers 6
    .param p0, "activity"    # Landroid/app/Activity;

    .line 474
    sget-object v0, Le/e/a/Dev111;->VIEWS:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    .line 475
    .local v0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Le/e/a/Dev111$Position;>;"
    if-nez v0, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    invoke-static {p0}, Le/e/a/Dev111;->key(Landroid/app/Activity;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/Dev111$Position;

    .line 476
    .local v1, "p":Le/e/a/Dev111$Position;
    :goto_0
    if-nez v1, :cond_1

    invoke-static {p0}, Le/e/a/Dev111;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    const-string v3, "nicoid_restore_tab_scroll"

    const/4 v4, 0x1

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 477
    invoke-static {p0}, Le/e/a/Dev111;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "nicoid_tab_scroll111_"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {p0}, Le/e/a/Dev111;->key(Landroid/app/Activity;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "{}"

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Le/e/a/Dev111$Position;->parse(Ljava/lang/String;)Le/e/a/Dev111$Position;

    move-result-object v1

    .line 479
    :cond_1
    return-object v1
.end method

.method public static initialTab(Ljava/lang/Object;)V
    .registers 18
    .param p0, "host"    # Ljava/lang/Object;

    .line 390
    move-object/from16 v1, p0

    const-string v0, "position"

    sget-object v2, Le/e/a/Dev111;->INITIAL:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    return-void

    .line 391
    :cond_0
    sget-object v2, Le/e/a/Dev111;->INITIAL:Ljava/util/Map;

    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-interface {v2, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 393
    :try_start_0
    const-string v2, "a"

    invoke-static {v1, v2}, Le/e/a/Dev111;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/Activity;

    .line 394
    .local v2, "activity":Landroid/app/Activity;
    invoke-static {v2}, Le/e/a/Dev111;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v3

    const-string v4, "nicoid_restore_tab_scroll"

    const/4 v5, 0x1

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    if-nez v3, :cond_1

    return-void

    .line 395
    :cond_1
    const-string v3, "current"

    invoke-static {v1, v3}, Le/e/a/Dev111;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    .line 396
    .local v3, "fragment":Ljava/lang/Object;
    if-nez v3, :cond_2

    return-void

    .line 397
    :cond_2
    const-string v4, "e.e.a.MultiTabs227"

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    .line 398
    .local v4, "multi":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v6, "data"

    const/4 v7, 0x0

    new-array v8, v7, [Ljava/lang/Class;

    invoke-virtual {v4, v6, v8}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v6

    .line 399
    .local v6, "data":Ljava/lang/reflect/Method;
    invoke-virtual {v6, v5}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 400
    new-array v8, v7, [Ljava/lang/Object;

    const/4 v9, 0x0

    invoke-virtual {v6, v9, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    .line 401
    .local v8, "model":Ljava/lang/Object;
    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    const-string v10, "find"

    new-array v11, v5, [Ljava/lang/Class;

    const-class v12, Ljava/lang/String;

    aput-object v12, v11, v7

    invoke-virtual {v9, v10, v11}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v9

    .line 402
    .local v9, "find":Ljava/lang/reflect/Method;
    invoke-virtual {v9, v5}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 403
    const-string v10, "currentId"

    invoke-static {v1, v10}, Le/e/a/Dev111;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    new-array v11, v5, [Ljava/lang/Object;

    aput-object v10, v11, v7

    invoke-virtual {v9, v8, v11}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    .line 404
    .local v10, "tab":Ljava/lang/Object;
    if-eqz v10, :cond_5

    invoke-static {v10, v0}, Le/e/a/Dev111;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/Integer;

    invoke-virtual {v11}, Ljava/lang/Integer;->intValue()I

    move-result v11
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const-string v12, "top"

    if-nez v11, :cond_3

    .line 405
    :try_start_1
    invoke-static {v10, v12}, Le/e/a/Dev111;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/Integer;

    invoke-virtual {v11}, Ljava/lang/Integer;->intValue()I

    move-result v11

    if-nez v11, :cond_3

    goto :goto_0

    .line 406
    :cond_3
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v11

    const-string v13, "restoreScroll"

    const/4 v14, 0x2

    new-array v15, v14, [Ljava/lang/Class;

    const-class v16, Ljava/lang/Object;

    aput-object v16, v15, v7

    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v16

    aput-object v16, v15, v5

    invoke-virtual {v11, v13, v15}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v11

    .line 407
    .local v11, "restore":Ljava/lang/reflect/Method;
    invoke-virtual {v11, v5}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 408
    new-array v13, v14, [Ljava/lang/Object;

    aput-object v3, v13, v7

    aput-object v10, v13, v5

    invoke-virtual {v11, v1, v13}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 411
    const-string v5, "b0"

    invoke-static {v3, v5}, Le/e/a/Dev111;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    .line 412
    .local v5, "view":Ljava/lang/Object;
    instance-of v7, v5, Landroid/widget/ListView;

    if-eqz v7, :cond_4

    .line 413
    move-object v7, v5

    check-cast v7, Landroid/widget/ListView;

    invoke-static {v10, v0}, Le/e/a/Dev111;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-static {v10, v12}, Le/e/a/Dev111;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/Integer;

    invoke-virtual {v12}, Ljava/lang/Integer;->intValue()I

    move-result v12

    invoke-static {v7, v0, v12}, Le/e/a/Dev112;->restoreList(Landroid/widget/ListView;II)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 416
    .end local v2    # "activity":Landroid/app/Activity;
    .end local v3    # "fragment":Ljava/lang/Object;
    .end local v4    # "multi":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v5    # "view":Ljava/lang/Object;
    .end local v6    # "data":Ljava/lang/reflect/Method;
    .end local v8    # "model":Ljava/lang/Object;
    .end local v9    # "find":Ljava/lang/reflect/Method;
    .end local v10    # "tab":Ljava/lang/Object;
    .end local v11    # "restore":Ljava/lang/reflect/Method;
    :cond_4
    goto :goto_1

    .line 405
    .restart local v2    # "activity":Landroid/app/Activity;
    .restart local v3    # "fragment":Ljava/lang/Object;
    .restart local v4    # "multi":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v6    # "data":Ljava/lang/reflect/Method;
    .restart local v8    # "model":Ljava/lang/Object;
    .restart local v9    # "find":Ljava/lang/reflect/Method;
    .restart local v10    # "tab":Ljava/lang/Object;
    :cond_5
    :goto_0
    return-void

    .line 414
    .end local v2    # "activity":Landroid/app/Activity;
    .end local v3    # "fragment":Ljava/lang/Object;
    .end local v4    # "multi":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v6    # "data":Ljava/lang/reflect/Method;
    .end local v8    # "model":Ljava/lang/Object;
    .end local v9    # "find":Ljava/lang/reflect/Method;
    .end local v10    # "tab":Ljava/lang/Object;
    :catch_0
    move-exception v0

    .line 415
    .local v0, "error":Ljava/lang/Exception;
    const-string v2, "nicoid-tabs"

    const-string v3, "Initial scroll restoration skipped"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 417
    .end local v0    # "error":Ljava/lang/Exception;
    :goto_1
    return-void
.end method

.method private static key(Landroid/app/Activity;)Ljava/lang/String;
    .registers 4
    .param p0, "a"    # Landroid/app/Activity;

    .line 445
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "nicoid_saved_tab_id"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 446
    .local v0, "id":Ljava/lang/String;
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    const/16 v2, 0x64

    if-le v1, v2, :cond_0

    goto :goto_0

    :cond_0
    move-object v1, v0

    goto :goto_1

    :cond_1
    :goto_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    :goto_1
    return-object v1
.end method

.method static synthetic lambda$enteredPage$4(Landroid/widget/ScrollView;Le/e/a/Dev111$Position;)V
    .registers 4
    .param p0, "scroll"    # Landroid/widget/ScrollView;
    .param p1, "saved"    # Le/e/a/Dev111$Position;

    .line 548
    const/4 v0, 0x0

    iget v1, p1, Le/e/a/Dev111$Position;->scroll:I

    invoke-virtual {p0, v0, v1}, Landroid/widget/ScrollView;->scrollTo(II)V

    return-void
.end method

.method static synthetic lambda$resumeCheck$0(Ljava/lang/ref/WeakReference;)V
    .registers 1
    .param p0, "target"    # Ljava/lang/ref/WeakReference;

    .line 261
    invoke-static {p0}, Le/e/a/Dev111;->resumeCheck(Ljava/lang/ref/WeakReference;)V

    return-void
.end method

.method static synthetic lambda$settings$1(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .registers 4
    .param p0, "preference"    # Landroid/preference/Preference;
    .param p1, "newValue"    # Ljava/lang/Object;

    .line 304
    move-object v0, p0

    check-cast v0, Landroid/preference/ListPreference;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/preference/ListPreference;->findIndexOfValue(Ljava/lang/String;)I

    move-result v0

    .line 305
    .local v0, "index":I
    if-ltz v0, :cond_0

    move-object v1, p0

    check-cast v1, Landroid/preference/ListPreference;

    invoke-virtual {v1}, Landroid/preference/ListPreference;->getEntries()[Ljava/lang/CharSequence;

    move-result-object v1

    aget-object v1, v1, v0

    invoke-virtual {p0, v1}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 306
    :cond_0
    const/4 v1, 0x1

    return v1
.end method

.method static synthetic lambda$settings$2(Ljava/lang/ref/WeakReference;)V
    .registers 3
    .param p0, "weak"    # Ljava/lang/ref/WeakReference;

    .line 315
    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/preference/PreferenceActivity;

    .line 316
    .local v0, "current":Landroid/preference/PreferenceActivity;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/preference/PreferenceActivity;->isFinishing()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {v0}, Landroid/preference/PreferenceActivity;->isDestroyed()Z

    move-result v1

    if-nez v1, :cond_0

    .line 317
    invoke-static {v0}, Le/e/a/Dev111;->updateSummaries(Landroid/preference/PreferenceActivity;)V

    .line 319
    :cond_0
    return-void
.end method

.method static synthetic lambda$settings$3(Ljava/lang/ref/WeakReference;Landroid/content/SharedPreferences;Ljava/lang/String;)V
    .registers 5
    .param p0, "weak"    # Ljava/lang/ref/WeakReference;
    .param p1, "preferences"    # Landroid/content/SharedPreferences;
    .param p2, "key"    # Ljava/lang/String;

    .line 313
    const-string v0, "nicoid_app_resume_playback"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "startup_screen"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "app_switch_playback"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "custom_palette_enabled"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 314
    :cond_0
    sget-object v0, Le/e/a/Dev111;->MAIN:Landroid/os/Handler;

    new-instance v1, Le/e/a/Dev111$2;

    invoke-direct {v1, p0}, Le/e/a/Dev111$2;-><init>(Ljava/lang/ref/WeakReference;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 320
    return-void
.end method

.method private static language(Landroid/content/Context;)I
    .registers 7
    .param p0, "c"    # Landroid/content/Context;

    .line 78
    invoke-static {p0}, Le/e/a/Dev111;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "app_lang"

    const-string v2, "0"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 79
    .local v0, "setting":Ljava/lang/String;
    const-string v1, "-1"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x2

    if-eqz v1, :cond_2

    .line 80
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v1

    .line 81
    .local v1, "system":Ljava/lang/String;
    const-string v5, "zh"

    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    const/4 v2, 0x2

    goto :goto_0

    :cond_0
    const-string v4, "ja"

    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    const/4 v2, 0x0

    :cond_1
    :goto_0
    return v2

    .line 83
    .end local v1    # "system":Ljava/lang/String;
    :cond_2
    const-string v1, "2"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    const/4 v2, 0x2

    goto :goto_1

    :cond_3
    const-string v1, "1"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    goto :goto_1

    :cond_4
    const/4 v2, 0x0

    :goto_1
    return v2
.end method

.method public static declared-synchronized left()V
    .registers 2

    const-class v0, Le/e/a/Dev111;

    monitor-enter v0

    .line 106
    :try_start_0
    invoke-static {}, Le/e/a/Dev111;->transferring()Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v1, 0x1

    sput-boolean v1, Le/e/a/Dev111;->leftApp:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 107
    :cond_0
    monitor-exit v0

    return-void

    .line 105
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public static loadedTabs(Ljava/lang/Object;Landroid/content/Context;)V
    .registers 7
    .param p0, "model"    # Ljava/lang/Object;
    .param p1, "context"    # Landroid/content/Context;

    .line 377
    if-eqz p0, :cond_2

    if-eqz p1, :cond_2

    invoke-static {p1}, Le/e/a/Dev111;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "nicoid_restore_tab_scroll"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_2

    .line 379
    :cond_0
    :try_start_0
    const-string v0, "tabs"

    invoke-static {p0, v0}, Le/e/a/Dev111;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 380
    .local v1, "tab":Ljava/lang/Object;
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v3, "position"

    invoke-static {v2, v3}, Le/e/a/Dev111;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v1, v3}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V

    .line 381
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v4, "top"

    invoke-static {v2, v4}, Le/e/a/Dev111;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    invoke-virtual {v2, v1, v3}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 382
    .end local v1    # "tab":Ljava/lang/Object;
    goto :goto_0

    .line 385
    :cond_1
    goto :goto_1

    .line 383
    :catch_0
    move-exception v0

    .line 384
    .local v0, "error":Ljava/lang/Exception;
    const-string v1, "nicoid-tabs"

    const-string v2, "Could not clear persisted scroll position"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 386
    .end local v0    # "error":Ljava/lang/Exception;
    :goto_1
    return-void

    .line 377
    :cond_2
    :goto_2
    return-void
.end method

.method private static normalAlreadyPlaying(Landroid/app/Activity;)Z
    .registers 8
    .param p0, "activity"    # Landroid/app/Activity;

    .line 165
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "com.sauzask.nicoid.NicoidVideoActivity"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 167
    :cond_0
    :try_start_0
    const-string v0, "v"

    invoke-static {p0, v0}, Le/e/a/Dev111;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 168
    .local v0, "fragment":Ljava/lang/Object;
    if-nez v0, :cond_1

    const/4 v2, 0x0

    goto :goto_0

    :cond_1
    const-string v2, "a0"

    invoke-static {v0, v2}, Le/e/a/Dev111;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    .line 169
    .local v2, "player":Ljava/lang/Object;
    :goto_0
    if-eqz v2, :cond_2

    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    const-string v5, "isPlaying"

    new-array v6, v1, [Ljava/lang/Class;

    invoke-virtual {v4, v5, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    new-array v5, v1, [Ljava/lang/Object;

    invoke-virtual {v4, v2, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v3, :cond_2

    const/4 v1, 0x1

    :cond_2
    return v1

    .line 170
    .end local v0    # "fragment":Ljava/lang/Object;
    .end local v2    # "player":Ljava/lang/Object;
    :catch_0
    move-exception v0

    .local v0, "ignored":Ljava/lang/Exception;
    return v1
.end method

.method public static declared-synchronized notificationReturnOpened()V
    .registers 3

    const-class v0, Le/e/a/Dev111;

    monitor-enter v0

    .line 137
    :try_start_0
    invoke-static {}, Le/e/a/Dev111;->resetReturn()V

    .line 138
    const/4 v1, 0x1

    sput-boolean v1, Le/e/a/Dev111;->returnInFlight:Z

    .line 139
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    sput-wide v1, Le/e/a/Dev111;->returnStartedAt:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 140
    monitor-exit v0

    return-void

    .line 136
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public static pageResumed(Landroid/app/Activity;)V
    .registers 1
    .param p0, "a"    # Landroid/app/Activity;

    .line 579
    invoke-static {p0}, Le/e/a/Dev111;->enteredPage(Landroid/app/Activity;)V

    .line 580
    return-void
.end method

.method private static playlistPage(Landroid/app/Activity;)Ljava/lang/Object;
    .registers 4
    .param p0, "activity"    # Landroid/app/Activity;

    .line 468
    const/4 v0, 0x0

    :try_start_0
    const-string v1, "e.e.a.LocalPlaylists"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 469
    .local v1, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v2, "PAGES"

    invoke-static {v1, v2}, Le/e/a/Dev111;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    .line 470
    .local v2, "pages":Ljava/util/Map;, "Ljava/util/Map<**>;"
    invoke-interface {v2, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 471
    .end local v1    # "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "pages":Ljava/util/Map;, "Ljava/util/Map<**>;"
    :catch_0
    move-exception v1

    .local v1, "ignored":Ljava/lang/Exception;
    return-object v0
.end method

.method public static playlistsChanged()V
    .registers 9

    .line 557
    :try_start_0
    const-string v0, "e.e.a.LocalPlaylists"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 558
    .local v0, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v1, "PAGES"

    invoke-static {v0, v1}, Le/e/a/Dev111;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    .line 559
    .local v1, "pages":Ljava/util/Map;, "Ljava/util/Map<**>;"
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 560
    .local v2, "visible":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/app/Activity;>;"
    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    .line 561
    .local v4, "entry":Ljava/lang/Object;
    instance-of v5, v4, Landroid/app/Activity;

    if-nez v5, :cond_0

    goto :goto_0

    .line 562
    :cond_0
    move-object v5, v4

    check-cast v5, Landroid/app/Activity;

    .line 563
    .local v5, "activity":Landroid/app/Activity;
    invoke-virtual {v5}, Landroid/app/Activity;->isFinishing()Z

    move-result v6

    if-nez v6, :cond_1

    invoke-virtual {v5}, Landroid/app/Activity;->isDestroyed()Z

    move-result v6

    if-nez v6, :cond_1

    .line 564
    invoke-virtual {v5}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v6

    const-string v7, "nicoid_local_playlists"

    const/4 v8, 0x0

    invoke-virtual {v6, v7, v8}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 565
    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 567
    .end local v4    # "entry":Ljava/lang/Object;
    .end local v5    # "activity":Landroid/app/Activity;
    :cond_1
    goto :goto_0

    .line 568
    :cond_2
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/app/Activity;

    .line 569
    .local v4, "activity":Landroid/app/Activity;
    invoke-static {v4}, Le/e/a/Dev111;->capturePage(Landroid/app/Activity;)V

    .line 570
    invoke-static {v4}, Le/e/a/Dev111;->enteredPage(Landroid/app/Activity;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 571
    .end local v4    # "activity":Landroid/app/Activity;
    goto :goto_1

    .line 574
    .end local v0    # "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "pages":Ljava/util/Map;, "Ljava/util/Map<**>;"
    .end local v2    # "visible":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/app/Activity;>;"
    :cond_3
    goto :goto_2

    .line 572
    :catch_0
    move-exception v0

    .line 573
    .local v0, "error":Ljava/lang/Exception;
    const-string v1, "nicoid-playlist"

    const-string v2, "Playlist change notification skipped"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 575
    .end local v0    # "error":Ljava/lang/Exception;
    :goto_2
    return-void
.end method

.method private static prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .registers 2
    .param p0, "c"    # Landroid/content/Context;

    .line 75
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    return-object v0
.end method

.method public static preparePlaylist(Landroid/app/Activity;)V
    .registers 5
    .param p0, "activity"    # Landroid/app/Activity;

    .line 515
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "nicoid_local_playlists"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 516
    invoke-static {p0}, Le/e/a/Dev111;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "nicoid_restore_tab_scroll"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 517
    :cond_0
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "nicoid_playlist_folder"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    return-void

    .line 518
    :cond_1
    invoke-static {p0}, Le/e/a/Dev111;->getPosition(Landroid/app/Activity;)Le/e/a/Dev111$Position;

    move-result-object v0

    .line 519
    .local v0, "p":Le/e/a/Dev111$Position;
    if-eqz v0, :cond_2

    iget-object v2, v0, Le/e/a/Dev111$Position;->folder:Ljava/lang/String;

    if-eqz v2, :cond_2

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    iget-object v3, v0, Le/e/a/Dev111$Position;->folder:Ljava/lang/String;

    invoke-virtual {v2, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 520
    :cond_2
    return-void

    .line 516
    .end local v0    # "p":Le/e/a/Dev111$Position;
    :cond_3
    :goto_0
    return-void
.end method

.method private static resetReturn()V
    .registers 2

    .line 132
    const-class v0, Le/e/a/Dev111;

    monitor-enter v0

    .line 133
    const/4 v1, 0x0

    :try_start_0
    sput-boolean v1, Le/e/a/Dev111;->leftApp:Z

    sput v1, Le/e/a/Dev111;->resumeAttempt:I

    sput-boolean v1, Le/e/a/Dev111;->resumeScheduled:Z

    sput-boolean v1, Le/e/a/Dev111;->returnInFlight:Z

    .line 134
    monitor-exit v0

    .line 135
    return-void

    .line 134
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private static resumeCheck(Ljava/lang/ref/WeakReference;)V
    .registers 18
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/ref/WeakReference<",
            "Landroid/app/Activity;",
            ">;)V"
        }
    .end annotation

    .line 215
    .local p0, "target":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Landroid/app/Activity;>;"
    invoke-virtual/range {p0 .. p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Landroid/app/Activity;

    .line 216
    .local v1, "activity":Landroid/app/Activity;
    const/4 v0, 0x0

    if-eqz v1, :cond_c

    invoke-virtual {v1}, Landroid/app/Activity;->isDestroyed()Z

    move-result v2

    if-nez v2, :cond_c

    invoke-virtual {v1}, Landroid/app/Activity;->isFinishing()Z

    move-result v2

    if-eqz v2, :cond_0

    const/16 v16, 0x0

    move-object/from16 v6, p0

    goto/16 :goto_a

    .line 220
    :cond_0
    invoke-static {v1}, Le/e/a/Dev111;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 221
    .local v2, "settings":Landroid/content/SharedPreferences;
    const-string v3, "background"

    const-string v4, "app_switch_playback"

    const-string v5, "none"

    invoke-interface {v2, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const-string v3, "normal"

    const-string v4, "nicoid_app_resume_playback"

    const-string v5, "background"

    .line 222
    invoke-interface {v2, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    move-object/from16 v6, p0

    goto/16 :goto_9

    .line 226
    :cond_1
    const-class v3, Le/e/a/Dev111;

    monitor-enter v3

    :try_start_0
    sget-boolean v4, Le/e/a/Dev111;->leftApp:Z

    .local v4, "pending":Z
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_4

    .line 227
    if-nez v4, :cond_2

    .line 228
    const-class v3, Le/e/a/Dev111;

    monitor-enter v3

    :try_start_1
    sput-boolean v0, Le/e/a/Dev111;->resumeScheduled:Z

    monitor-exit v3

    .line 229
    return-void

    .line 228
    :catchall_0
    move-exception v0

    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    .line 232
    :cond_2
    const/4 v3, 0x1

    :try_start_2
    invoke-static {}, Le/e/a/Dev111;->activeBackgroundService()Landroid/app/Service;

    move-result-object v5

    .line 233
    .local v5, "service":Landroid/app/Service;
    if-eqz v5, :cond_3

    const/4 v6, 0x1

    goto :goto_0

    :cond_3
    const/4 v6, 0x0

    .line 234
    .local v6, "ready":Z
    :goto_0
    if-eqz v6, :cond_8

    .line 235
    const-string v7, "f"

    invoke-static {v5, v7}, Le/e/a/Dev111;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    .local v7, "id":Ljava/lang/Object;
    const-string v8, "e"

    invoke-static {v5, v8}, Le/e/a/Dev111;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    .line 236
    .local v8, "player":Ljava/lang/Object;
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    const-string v10, "p0"

    invoke-static {v9, v10}, Le/e/a/Dev111;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v9

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v9

    .line 238
    .local v9, "background":Z
    if-eqz v8, :cond_4

    sget-object v10, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 239
    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v11

    const-string v12, "isPlaying"

    new-array v13, v0, [Ljava/lang/Class;

    invoke-virtual {v11, v12, v13}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v11

    new-array v12, v0, [Ljava/lang/Object;

    invoke-virtual {v11, v8, v12}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    .line 238
    invoke-virtual {v10, v11}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_4

    const/4 v10, 0x1

    goto :goto_1

    :cond_4
    const/4 v10, 0x0

    .line 240
    .local v10, "playing":Z
    :goto_1
    const-wide/16 v11, 0x0

    if-nez v8, :cond_5

    move-wide v13, v11

    goto :goto_2

    .line 241
    :cond_5
    nop

    .line 240
    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v13

    const-string v14, "getDuration"

    new-array v15, v0, [Ljava/lang/Class;

    .line 241
    invoke-virtual {v13, v14, v15}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v13

    new-array v14, v0, [Ljava/lang/Object;

    invoke-virtual {v13, v8, v14}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/Number;

    invoke-virtual {v13}, Ljava/lang/Number;->longValue()J

    move-result-wide v13

    :goto_2
    nop

    .line 242
    .local v13, "duration":J
    instance-of v15, v7, Ljava/lang/String;

    if-eqz v15, :cond_6

    move-object v15, v7

    check-cast v15, Ljava/lang/String;

    const/16 v16, 0x0

    const-string v0, "(?:sm|nm|so|ss)?[0-9]+"

    invoke-virtual {v15, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_7

    if-eqz v9, :cond_7

    if-eqz v10, :cond_7

    cmp-long v0, v13, v11

    if-lez v0, :cond_7

    const/4 v0, 0x1

    goto :goto_3

    :cond_6
    const/16 v16, 0x0

    :cond_7
    const/4 v0, 0x0

    :goto_3
    move v6, v0

    goto :goto_4

    .line 234
    .end local v7    # "id":Ljava/lang/Object;
    .end local v8    # "player":Ljava/lang/Object;
    .end local v9    # "background":Z
    .end local v10    # "playing":Z
    .end local v13    # "duration":J
    :cond_8
    const/16 v16, 0x0

    .line 245
    :goto_4
    if-eqz v6, :cond_9

    invoke-static {v5}, Le/e/a/Dev115;->seamlessReturn(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 246
    const-class v7, Le/e/a/Dev111;

    monitor-enter v7
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 247
    :try_start_3
    sput-boolean v16, Le/e/a/Dev111;->leftApp:Z

    sput-boolean v16, Le/e/a/Dev111;->resumeScheduled:Z

    sput v16, Le/e/a/Dev111;->resumeAttempt:I

    .line 248
    sput-boolean v3, Le/e/a/Dev111;->returnInFlight:Z

    .line 249
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v8

    sput-wide v8, Le/e/a/Dev111;->returnStartedAt:J

    .line 250
    monitor-exit v7
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 251
    :try_start_4
    const-string v0, "nicoid-return"

    const-string v7, "Retained return requested from active Service"

    invoke-static {v0, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 252
    return-void

    .line 250
    :catchall_1
    move-exception v0

    :try_start_5
    monitor-exit v7
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .end local v1    # "activity":Landroid/app/Activity;
    .end local v2    # "settings":Landroid/content/SharedPreferences;
    .end local v4    # "pending":Z
    .end local p0    # "target":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Landroid/app/Activity;>;"
    :try_start_6
    throw v0
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_0

    .line 256
    .end local v5    # "service":Landroid/app/Service;
    .end local v6    # "ready":Z
    .restart local v1    # "activity":Landroid/app/Activity;
    .restart local v2    # "settings":Landroid/content/SharedPreferences;
    .restart local v4    # "pending":Z
    .restart local p0    # "target":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Landroid/app/Activity;>;"
    :cond_9
    goto :goto_5

    .line 254
    :catch_0
    move-exception v0

    .line 255
    .local v0, "error":Ljava/lang/Exception;
    const-string v5, "nicoid-return"

    const-string v6, "Waiting for stable background player"

    invoke-static {v5, v6, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 258
    .end local v0    # "error":Ljava/lang/Exception;
    :goto_5
    const-class v5, Le/e/a/Dev111;

    monitor-enter v5

    .line 259
    :try_start_7
    sget v0, Le/e/a/Dev111;->resumeAttempt:I

    add-int/2addr v0, v3

    sput v0, Le/e/a/Dev111;->resumeAttempt:I

    .line 260
    .local v0, "count":I
    monitor-exit v5
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    .line 261
    const/16 v3, 0x28

    if-ge v0, v3, :cond_a

    sget-object v3, Le/e/a/Dev111;->MAIN:Landroid/os/Handler;

    new-instance v5, Le/e/a/Dev111$4;

    move-object/from16 v6, p0

    invoke-direct {v5, v6}, Le/e/a/Dev111$4;-><init>(Ljava/lang/ref/WeakReference;)V

    const-wide/16 v7, 0x96

    invoke-virtual {v3, v5, v7, v8}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_6

    .line 263
    :cond_a
    move-object/from16 v6, p0

    const-string v3, "nicoid-return"

    const-string v5, "Retained background service was not ready after resume"

    invoke-static {v3, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 264
    invoke-static {}, Le/e/a/Dev111;->resetReturn()V

    .line 266
    :goto_6
    return-void

    .line 260
    .end local v0    # "count":I
    :catchall_2
    move-exception v0

    move-object/from16 v6, p0

    :goto_7
    :try_start_8
    monitor-exit v5
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    throw v0

    :catchall_3
    move-exception v0

    goto :goto_7

    .line 226
    .end local v4    # "pending":Z
    :catchall_4
    move-exception v0

    move-object/from16 v6, p0

    :goto_8
    :try_start_9
    monitor-exit v3
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_5

    throw v0

    :catchall_5
    move-exception v0

    goto :goto_8

    .line 221
    :cond_b
    move-object/from16 v6, p0

    .line 223
    :goto_9
    invoke-static {}, Le/e/a/Dev111;->resetReturn()V

    return-void

    .line 216
    .end local v2    # "settings":Landroid/content/SharedPreferences;
    :cond_c
    const/16 v16, 0x0

    move-object/from16 v6, p0

    .line 217
    :goto_a
    const-class v2, Le/e/a/Dev111;

    monitor-enter v2

    :try_start_a
    sput-boolean v16, Le/e/a/Dev111;->resumeScheduled:Z

    monitor-exit v2

    .line 218
    return-void

    .line 217
    :catchall_6
    move-exception v0

    monitor-exit v2
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_6

    throw v0
.end method

.method public static resumed(Landroid/app/Activity;)V
    .registers 6
    .param p0, "activity"    # Landroid/app/Activity;

    .line 173
    if-eqz p0, :cond_9

    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_9

    invoke-virtual {p0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_3

    .line 175
    :cond_0
    const-class v0, Le/e/a/Dev111;

    monitor-enter v0

    .line 176
    :try_start_0
    invoke-static {}, Le/e/a/Dev111;->transferring()Z

    move-result v1

    if-nez v1, :cond_8

    sget-boolean v1, Le/e/a/Dev111;->resumeScheduled:Z

    if-eqz v1, :cond_1

    goto :goto_2

    .line 177
    :cond_1
    sget-boolean v1, Le/e/a/Dev111;->leftApp:Z

    .line 178
    .local v1, "pending":Z
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 179
    if-nez v1, :cond_2

    return-void

    .line 180
    :cond_2
    invoke-static {p0}, Le/e/a/Dev111;->normalAlreadyPlaying(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-static {}, Le/e/a/Dev111;->resetReturn()V

    return-void

    .line 181
    :cond_3
    invoke-static {p0}, Le/e/a/Dev111;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 182
    .local v0, "settings":Landroid/content/SharedPreferences;
    const-string v2, "background"

    const-string v3, "app_switch_playback"

    const-string v4, "none"

    invoke-interface {v0, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    const-string v2, "normal"

    const-string v3, "nicoid_app_resume_playback"

    const-string v4, "background"

    .line 183
    invoke-interface {v0, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    goto :goto_1

    .line 188
    :cond_4
    const-class v2, Le/e/a/Dev111;

    monitor-enter v2

    .line 189
    :try_start_1
    invoke-static {}, Le/e/a/Dev111;->transferring()Z

    move-result v3

    if-nez v3, :cond_6

    sget-boolean v3, Le/e/a/Dev111;->resumeScheduled:Z

    if-eqz v3, :cond_5

    goto :goto_0

    .line 190
    :cond_5
    const/4 v3, 0x1

    sput-boolean v3, Le/e/a/Dev111;->resumeScheduled:Z

    .line 191
    const/4 v3, 0x0

    sput v3, Le/e/a/Dev111;->resumeAttempt:I

    .line 192
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 193
    new-instance v2, Ljava/lang/ref/WeakReference;

    invoke-direct {v2, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-static {v2}, Le/e/a/Dev111;->resumeCheck(Ljava/lang/ref/WeakReference;)V

    .line 194
    return-void

    .line 189
    :cond_6
    :goto_0
    :try_start_2
    monitor-exit v2

    return-void

    .line 192
    :catchall_0
    move-exception v3

    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v3

    .line 184
    :cond_7
    :goto_1
    invoke-static {}, Le/e/a/Dev111;->resetReturn()V

    .line 185
    return-void

    .line 176
    .end local v0    # "settings":Landroid/content/SharedPreferences;
    .end local v1    # "pending":Z
    :cond_8
    :goto_2
    :try_start_3
    monitor-exit v0

    return-void

    .line 178
    :catchall_1
    move-exception v1

    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw v1

    .line 173
    :cond_9
    :goto_3
    return-void
.end method

.method private static root(Landroid/app/Activity;)Landroid/view/View;
    .registers 4
    .param p0, "a"    # Landroid/app/Activity;

    .line 450
    const/4 v0, 0x0

    :try_start_0
    const-string v1, "y"

    invoke-static {p0, v1}, Le/e/a/Dev111;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 451
    .local v1, "value":Ljava/lang/Object;
    instance-of v2, v1, Landroid/view/View;

    if-eqz v2, :cond_0

    move-object v2, v1

    check-cast v2, Landroid/view/View;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v2

    :cond_0
    return-object v0

    .line 452
    .end local v1    # "value":Ljava/lang/Object;
    :catch_0
    move-exception v1

    .local v1, "ignored":Ljava/lang/Exception;
    return-object v0
.end method

.method public static settings(Landroid/preference/PreferenceActivity;)V
    .registers 34
    .param p0, "activity"    # Landroid/preference/PreferenceActivity;

    .line 269
    move-object/from16 v0, p0

    const-string v1, "setting_whole"

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    .line 270
    .local v1, "groupItem":Landroid/preference/Preference;
    instance-of v2, v1, Landroid/preference/PreferenceGroup;

    if-nez v2, :cond_0

    return-void

    .line 271
    :cond_0
    move-object v2, v1

    check-cast v2, Landroid/preference/PreferenceGroup;

    .line 272
    .local v2, "group":Landroid/preference/PreferenceGroup;
    const-string v3, "nicoid_restore_tab_scroll"

    invoke-virtual {v0, v3}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v4

    if-nez v4, :cond_1

    .line 273
    new-instance v4, Landroid/preference/CheckBoxPreference;

    invoke-direct {v4, v0}, Landroid/preference/CheckBoxPreference;-><init>(Landroid/content/Context;)V

    .line 274
    .local v4, "p":Landroid/preference/CheckBoxPreference;
    invoke-virtual {v4, v3}, Landroid/preference/CheckBoxPreference;->setKey(Ljava/lang/String;)V

    .line 275
    const-string v3, "Restore tab scroll positions"

    const-string/jumbo v5, "\u9084\u539f\u5206\u9801\u6372\u52d5\u4f4d\u7f6e"

    const-string v6, "\u30bf\u30d6\u306e\u30b9\u30af\u30ed\u30fc\u30eb\u4f4d\u7f6e\u3092\u5fa9\u5143"

    invoke-static {v0, v6, v3, v5}, Le/e/a/Dev111;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Landroid/preference/CheckBoxPreference;->setTitle(Ljava/lang/CharSequence;)V

    .line 276
    const-string v3, "Restore tab scroll positions after relaunching the app."

    const-string/jumbo v5, "\u91cd\u65b0\u555f\u52d5\u61c9\u7528\u7a0b\u5f0f\u5f8c\u9084\u539f\u5206\u9801\u7684\u6372\u52d5\u4f4d\u7f6e\u3002"

    const-string v6, "\u30a2\u30d7\u30ea\u518d\u8d77\u52d5\u5f8c\u3082\u5404\u30bf\u30d6\u306e\u30b9\u30af\u30ed\u30fc\u30eb\u4f4d\u7f6e\u3092\u5fa9\u5143\u3057\u307e\u3059\u3002"

    invoke-static {v0, v6, v3, v5}, Le/e/a/Dev111;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Landroid/preference/CheckBoxPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 278
    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v4, v3}, Landroid/preference/CheckBoxPreference;->setDefaultValue(Ljava/lang/Object;)V

    .line 279
    invoke-virtual {v2, v4}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    .line 281
    .end local v4    # "p":Landroid/preference/CheckBoxPreference;
    :cond_1
    const-string v3, "nicoid_app_resume_playback"

    invoke-virtual {v0, v3}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v4

    const/4 v5, 0x0

    if-nez v4, :cond_2

    .line 282
    new-instance v4, Landroid/preference/ListPreference;

    invoke-direct {v4, v0}, Landroid/preference/ListPreference;-><init>(Landroid/content/Context;)V

    .line 283
    .local v4, "p":Landroid/preference/ListPreference;
    invoke-virtual {v4, v3}, Landroid/preference/ListPreference;->setKey(Ljava/lang/String;)V

    .line 284
    const-string v6, "When returning to the app"

    const-string/jumbo v7, "\u8fd4\u56de\u61c9\u7528\u7a0b\u5f0f\u6642\u7684\u52d5\u4f5c"

    const-string v8, "\u30a2\u30d7\u30ea\u5fa9\u5e30\u6642\u306e\u52d5\u4f5c"

    invoke-static {v0, v8, v6, v7}, Le/e/a/Dev111;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Landroid/preference/ListPreference;->setTitle(Ljava/lang/CharSequence;)V

    .line 285
    const/4 v6, 0x2

    new-array v7, v6, [Ljava/lang/CharSequence;

    .line 286
    const-string v8, "\u30d0\u30c3\u30af\u30b0\u30e9\u30a6\u30f3\u30c9\u518d\u751f\u3092\u7d99\u7d9a"

    const-string v9, "Keep background playback"

    const-string/jumbo v10, "\u7e7c\u7e8c\u80cc\u666f\u64ad\u653e"

    invoke-static {v0, v8, v9, v10}, Le/e/a/Dev111;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v7, v5

    .line 287
    const-string/jumbo v8, "\u901a\u5e38\u518d\u751f\u306b\u623b\u308b"

    const-string v9, "Return to normal playback"

    const-string/jumbo v10, "\u8fd4\u56de\u4e00\u822c\u64ad\u653e"

    invoke-static {v0, v8, v9, v10}, Le/e/a/Dev111;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x1

    aput-object v8, v7, v9

    .line 285
    invoke-virtual {v4, v7}, Landroid/preference/ListPreference;->setEntries([Ljava/lang/CharSequence;)V

    .line 288
    new-array v6, v6, [Ljava/lang/CharSequence;

    const-string v7, "background"

    aput-object v7, v6, v5

    const-string v8, "normal"

    aput-object v8, v6, v9

    invoke-virtual {v4, v6}, Landroid/preference/ListPreference;->setEntryValues([Ljava/lang/CharSequence;)V

    .line 289
    invoke-virtual {v4, v7}, Landroid/preference/ListPreference;->setDefaultValue(Ljava/lang/Object;)V

    .line 290
    invoke-virtual {v2, v4}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    .line 292
    .end local v4    # "p":Landroid/preference/ListPreference;
    :cond_2
    invoke-static {v0}, Le/e/a/Dev112;->exitSettings(Landroid/preference/PreferenceActivity;)V

    .line 293
    invoke-static {v0}, Le/e/a/StorageDiagnostics112;->install(Landroid/preference/PreferenceActivity;)V

    .line 294
    invoke-static {v0}, Le/e/a/LegacyCacheCleanup113;->install(Landroid/preference/PreferenceActivity;)V

    .line 295
    invoke-static {v0}, Le/e/a/Dev115;->cacheSettings(Landroid/preference/PreferenceActivity;)V

    invoke-static {v0}, Le/e/a/TemporaryCache221;->install(Landroid/preference/PreferenceActivity;)V

    .line 296
    invoke-static {v0}, Le/e/a/Dev116;->settings(Landroid/preference/PreferenceActivity;)V

    .line 297
    invoke-static {v0}, Le/e/a/Dev119;->installSettings(Landroid/preference/PreferenceActivity;)V

    .line 298
    invoke-static {v0}, Le/e/a/Dev132;->installSettings(Landroid/preference/PreferenceActivity;)V

    .line 299
    invoke-virtual {v0, v3}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    .line 300
    .local v3, "returnPreference":Landroid/preference/Preference;
    invoke-static {v0}, Le/e/a/Dev111;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v4

    .line 301
    .local v4, "shared":Landroid/content/SharedPreferences;
    invoke-static {v0}, Le/e/a/Dev111;->updateSummaries(Landroid/preference/PreferenceActivity;)V

    .line 302
    instance-of v6, v3, Landroid/preference/ListPreference;

    if-eqz v6, :cond_3

    .line 303
    move-object v6, v3

    check-cast v6, Landroid/preference/ListPreference;

    new-instance v7, Le/e/a/Dev111$0;

    invoke-direct {v7}, Le/e/a/Dev111$0;-><init>()V

    invoke-virtual {v6, v7}, Landroid/preference/ListPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 309
    :cond_3
    sget-object v6, Le/e/a/Dev111;->SETTINGS_LISTENERS:Ljava/util/Map;

    invoke-interface {v6, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;

    .line 310
    .local v6, "previous":Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;
    if-eqz v6, :cond_4

    invoke-interface {v4, v6}, Landroid/content/SharedPreferences;->unregisterOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    .line 311
    :cond_4
    new-instance v7, Ljava/lang/ref/WeakReference;

    invoke-direct {v7, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 312
    .local v7, "weak":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Landroid/preference/PreferenceActivity;>;"
    new-instance v8, Le/e/a/Dev111$1;

    invoke-direct {v8, v7}, Le/e/a/Dev111$1;-><init>(Ljava/lang/ref/WeakReference;)V

    .line 321
    .local v8, "listener":Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;
    invoke-interface {v4, v8}, Landroid/content/SharedPreferences;->registerOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    .line 322
    sget-object v9, Le/e/a/Dev111;->SETTINGS_LISTENERS:Ljava/util/Map;

    invoke-interface {v9, v0, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 324
    const-string v31, "display_mode"

    const-string v32, "play_mode"

    const-string v10, "app_theme"

    const-string v11, "custom_palette"

    const-string v12, "multiple_video_tabs"

    const-string v13, "nicoid_tab_bar_buttons"

    const-string v14, "startup_screen"

    const-string v15, "list_gestures_enabled"

    const-string v16, "videolist_tap"

    const-string v17, "intent_type"

    const-string v18, "app_switch_playback"

    const-string v19, "nicoid_app_resume_playback"

    const-string v20, "back_playback"

    const-string v21, "nicoid_keep_audio_screen_off"

    const-string v22, "nicoid_confirm_exit"

    const-string v23, "tab_swipe_animation"

    const-string v24, "tab_switch_animation"

    const-string v25, "tab_animation_enabled"

    const-string v26, "nicoid_restore_tab_scroll"

    const-string v27, "show_watch_progress"

    const-string v28, "video_menu_options"

    const-string v29, "main_rotation"

    const-string v30, "player_rotation"

    filled-new-array/range {v10 .. v32}, [Ljava/lang/String;

    move-result-object v9

    .line 332
    .local v9, "desired":[Ljava/lang/String;
    invoke-static {v2, v9}, Le/e/a/MultiTabPlacement;->settingsOrder(Landroid/preference/PreferenceGroup;[Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v9

    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 333
    .local v10, "all":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/preference/Preference;>;"
    const/4 v11, 0x0

    .local v11, "i":I
    :goto_0
    invoke-virtual {v2}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v12

    if-ge v11, v12, :cond_5

    invoke-virtual {v2, v11}, Landroid/preference/PreferenceGroup;->getPreference(I)Landroid/preference/Preference;

    move-result-object v12

    invoke-virtual {v10, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v11, v11, 0x1

    goto :goto_0

    .line 334
    .end local v11    # "i":I
    :cond_5
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 335
    .local v11, "sorted":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/preference/Preference;>;"
    array-length v12, v9

    :goto_1
    if-ge v5, v12, :cond_8

    aget-object v13, v9, v5

    .local v13, "key":Ljava/lang/String;
    invoke-virtual {v10}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :goto_2
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_7

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Landroid/preference/Preference;

    .local v15, "p":Landroid/preference/Preference;
    invoke-virtual {v15}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v13, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-virtual {v11, v15}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6

    invoke-virtual {v11, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .end local v15    # "p":Landroid/preference/Preference;
    :cond_6
    move-object/from16 v0, p0

    goto :goto_2

    .end local v13    # "key":Ljava/lang/String;
    :cond_7
    add-int/lit8 v5, v5, 0x1

    move-object/from16 v0, p0

    goto :goto_1

    .line 336
    :cond_8
    invoke-virtual {v10}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_9
    :goto_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_a

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/preference/Preference;

    .local v5, "p":Landroid/preference/Preference;
    invoke-virtual {v11, v5}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_9

    invoke-virtual {v11, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 337
    .end local v5    # "p":Landroid/preference/Preference;
    :cond_a
    const/4 v0, 0x0

    .line 338
    .local v0, "changed":Z
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_4
    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v12

    if-ge v5, v12, :cond_c

    invoke-virtual {v11, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    invoke-virtual {v10, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v13

    if-eq v12, v13, :cond_b

    const/4 v0, 0x1

    goto :goto_5

    :cond_b
    add-int/lit8 v5, v5, 0x1

    goto :goto_4

    .line 339
    .end local v5    # "i":I
    :cond_c
    :goto_5
    if-eqz v0, :cond_f

    .line 340
    invoke-virtual {v10}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_6
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_d

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Landroid/preference/Preference;

    .local v12, "p":Landroid/preference/Preference;
    invoke-virtual {v2, v12}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    goto :goto_6

    .line 341
    .end local v12    # "p":Landroid/preference/Preference;
    :cond_d
    const/4 v5, 0x0

    .restart local v5    # "i":I
    :goto_7
    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v12

    if-ge v5, v12, :cond_e

    invoke-virtual {v11, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Landroid/preference/Preference;

    .restart local v12    # "p":Landroid/preference/Preference;
    mul-int/lit8 v13, v5, 0xa

    invoke-virtual {v12, v13}, Landroid/preference/Preference;->setOrder(I)V

    invoke-virtual {v2, v12}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    .end local v12    # "p":Landroid/preference/Preference;
    add-int/lit8 v5, v5, 0x1

    goto :goto_7

    .end local v5    # "i":I
    :cond_e
    goto :goto_9

    .line 342
    :cond_f
    const/4 v5, 0x0

    .restart local v5    # "i":I
    :goto_8
    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v12

    if-ge v5, v12, :cond_10

    invoke-virtual {v11, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Landroid/preference/Preference;

    mul-int/lit8 v13, v5, 0xa

    invoke-virtual {v12, v13}, Landroid/preference/Preference;->setOrder(I)V

    add-int/lit8 v5, v5, 0x1

    goto :goto_8

    .line 343
    .end local v5    # "i":I
    :cond_10
    :goto_9
    invoke-virtual/range {p0 .. p0}, Landroid/preference/PreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v5

    invoke-static {v5}, Le/e/a/Dev135;->roundSettings(Landroid/preference/PreferenceGroup;)V

    .line 344
    invoke-static/range {p0 .. p0}, Le/e/a/FullscreenOptions265;->settings(Landroid/preference/PreferenceActivity;)V

    invoke-static/range {p0 .. p0}, Le/e/a/FullscreenSettings270;->reconcile(Landroid/preference/PreferenceActivity;)V

    return-void
.end method

.method public static singleReturnOwner(Landroid/app/Activity;)Z
    .registers 6
    .param p0, "activity"    # Landroid/app/Activity;

    .line 116
    const-string v0, "nicoid-return"

    const/4 v1, 0x0

    if-eqz p0, :cond_4

    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v2

    if-nez v2, :cond_4

    invoke-virtual {p0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_2

    .line 117
    :cond_0
    invoke-static {p0}, Le/e/a/Dev111;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 118
    .local v2, "p":Landroid/content/SharedPreferences;
    const-string v3, "app_switch_playback"

    const-string v4, "none"

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "background"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 119
    const-string v3, "nicoid_app_resume_playback"

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "normal"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    goto :goto_1

    .line 120
    :cond_1
    invoke-static {}, Le/e/a/Dev111;->activeBackgroundService()Landroid/app/Service;

    move-result-object v3

    if-nez v3, :cond_2

    return v1

    .line 122
    :cond_2
    :try_start_0
    const-string v1, "e.e.a.PlaybackReturn"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 123
    .local v1, "legacy":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v3, "automaticVideo"

    invoke-static {v1, v3}, Le/e/a/Dev111;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    .line 124
    .local v3, "armed":Ljava/lang/reflect/Field;
    const/4 v4, 0x0

    invoke-virtual {v3, v4, v4}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 127
    .end local v1    # "legacy":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v3    # "armed":Ljava/lang/reflect/Field;
    goto :goto_0

    .line 125
    :catch_0
    move-exception v1

    .line 126
    .local v1, "error":Ljava/lang/Exception;
    const-string v3, "Could not clear legacy auto-return arm"

    invoke-static {v0, v3, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 128
    .end local v1    # "error":Ljava/lang/Exception;
    :goto_0
    const-string v1, "Legacy auto-return suppressed; direct decoder handoff owns restoration"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 129
    const/4 v0, 0x1

    return v0

    .line 119
    :cond_3
    :goto_1
    return v1

    .line 116
    .end local v2    # "p":Landroid/content/SharedPreferences;
    :cond_4
    :goto_2
    return v1
.end method

.method public static suppressAutoReturn()V
    .registers 0

    .line 109
    invoke-static {}, Le/e/a/Dev111;->resetReturn()V

    return-void
.end method

.method private static tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p0, "c"    # Landroid/content/Context;
    .param p1, "ja"    # Ljava/lang/String;
    .param p2, "en"    # Ljava/lang/String;
    .param p3, "zh"    # Ljava/lang/String;

    .line 86
    invoke-static {p0}, Le/e/a/Dev111;->language(Landroid/content/Context;)I

    move-result v0

    .line 87
    .local v0, "lang":I
    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    move-object v1, p3

    goto :goto_0

    :cond_0
    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    move-object v1, p2

    goto :goto_0

    :cond_1
    move-object v1, p1

    :goto_0
    return-object v1
.end method

.method private static declared-synchronized transferring()Z
    .registers 6

    const-class v0, Le/e/a/Dev111;

    monitor-enter v0

    .line 67
    :try_start_0
    sget-boolean v1, Le/e/a/Dev111;->returnInFlight:Z

    if-eqz v1, :cond_0

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    sget-wide v3, Le/e/a/Dev111;->returnStartedAt:J

    sub-long/2addr v1, v3

    const-wide/16 v3, 0x1f40

    cmp-long v5, v1, v3

    if-ltz v5, :cond_0

    .line 68
    const/4 v1, 0x0

    sput-boolean v1, Le/e/a/Dev111;->returnInFlight:Z

    .line 69
    :cond_0
    sget-boolean v1, Le/e/a/Dev111;->returnInFlight:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return v1

    .line 66
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method private static updateSummaries(Landroid/preference/PreferenceActivity;)V
    .registers 10
    .param p0, "activity"    # Landroid/preference/PreferenceActivity;

    .line 347
    invoke-static {p0}, Le/e/a/Dev111;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 348
    .local v0, "shared":Landroid/content/SharedPreferences;
    invoke-static {p0}, Le/e/a/AppResume253;->refresh(Landroid/preference/PreferenceActivity;)V

    const-string v1, "startup_screen"

    invoke-virtual {p0, v1}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    .line 356
    .local v1, "startup":Landroid/preference/Preference;
    instance-of v3, v1, Landroid/preference/ListPreference;

    if-eqz v3, :cond_1

    .line 357
    move-object v3, v1

    check-cast v3, Landroid/preference/ListPreference;

    .line 358
    .restart local v3
    invoke-virtual {v3}, Landroid/preference/ListPreference;->getEntry()Ljava/lang/CharSequence;

    move-result-object v4

    .line 359
    .local v4, "entry":Ljava/lang/CharSequence;
    if-nez v4, :cond_0

    invoke-virtual {v3}, Landroid/preference/ListPreference;->getEntries()[Ljava/lang/CharSequence;

    move-result-object v5

    if-eqz v5, :cond_0

    .line 360
    const-string v5, "home"

    invoke-virtual {v3, v5}, Landroid/preference/ListPreference;->findIndexOfValue(Ljava/lang/String;)I

    move-result v5

    .line 361
    .local v5, "home":I
    if-ltz v5, :cond_0

    invoke-virtual {v3}, Landroid/preference/ListPreference;->getEntries()[Ljava/lang/CharSequence;

    move-result-object v6

    aget-object v4, v6, v5

    .line 363
    .end local v5    # "home":I
    :cond_0
    invoke-virtual {v3, v4}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 365
    .end local v3
    .end local v4    # "entry":Ljava/lang/CharSequence;
    :cond_1
    const-string v3, "custom_palette"

    invoke-virtual {p0, v3}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    .line 366
    .local v3, "customPreference":Landroid/preference/Preference;
    if-eqz v3, :cond_3

    .line 367
    const-string v4, "custom_palette_enabled"

    const/4 v5, 0x0

    invoke-interface {v0, v4, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v4

    .line 368
    .local v4, "on":Z
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    if-eqz v4, :cond_2

    const-string v6, "ON"

    goto :goto_0

    :cond_2
    const-string v6, "OFF"

    :goto_0
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, "\uff1a"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "Set accent, background, text and other colors individually."

    const-string v7, "\u500b\u5225\u8a2d\u5b9a\u5f37\u8abf\u8272\u3001\u80cc\u666f\u3001\u6587\u5b57\u7b49\u984f\u8272\u3002"

    const-string v8, "\u30a2\u30af\u30bb\u30f3\u30c8\u30ab\u30e9\u30fc\u3084\u80cc\u666f\u3001\u6587\u5b57\u306a\u3069\u306e\u8272\u3092\u500b\u5225\u306b\u8a2d\u5b9a\u3057\u307e\u3059\u3002"

    invoke-static {p0, v8, v6, v7}, Le/e/a/Dev111;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 373
    .end local v4    # "on":Z
    :cond_3
    return-void
.end method
