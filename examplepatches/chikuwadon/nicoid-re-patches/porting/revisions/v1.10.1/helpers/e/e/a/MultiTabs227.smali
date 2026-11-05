.class public final Le/e/a/MultiTabs227;
.super Ljava/lang/Object;
.source "MultiTabs227.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/MultiTabs227$Host;,
        Le/e/a/MultiTabs227$TabBadge;
    }
.end annotation


# static fields
.field static final CALLBACKS:Landroid/app/Application$ActivityLifecycleCallbacks;

.field static final CHANGED:Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;

.field static final ENABLE:Ljava/lang/String; = "multiple_video_tabs"

.field static final HOSTS:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/app/Activity;",
            "Le/e/a/MultiTabs227$Host;",
            ">;"
        }
    .end annotation
.end field

.field static final MAIN:Landroid/os/Handler;

.field static final STORE:Ljava/lang/String; = "nicoid_video_tabs_v1"

.field static app:Landroid/app/Application;

.field static lastSaved:Ljava/lang/String;

.field static listHost:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field

.field static model:Le/e/a/SavedTabs227;

.field static prefs:Landroid/content/SharedPreferences;

.field static restoreFirstHost:Z


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 6
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Le/e/a/MultiTabs227;->MAIN:Landroid/os/Handler;

    .line 7
    new-instance v0, Ljava/util/IdentityHashMap;

    invoke-direct {v0}, Ljava/util/IdentityHashMap;-><init>()V

    sput-object v0, Le/e/a/MultiTabs227;->HOSTS:Ljava/util/Map;

    new-instance v0, Ljava/lang/ref/WeakReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Le/e/a/MultiTabs227;->listHost:Ljava/lang/ref/WeakReference;

    const/4 v0, 0x1

    sput-boolean v0, Le/e/a/MultiTabs227;->restoreFirstHost:Z

    .line 17
    new-instance v0, Le/e/a/MultiTabs227$$ExternalSyntheticLambda5;

    invoke-direct {v0}, Le/e/a/MultiTabs227$$ExternalSyntheticLambda5;-><init>()V

    sput-object v0, Le/e/a/MultiTabs227;->CHANGED:Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;

    .line 18
    new-instance v0, Le/e/a/MultiTabs227$1;

    invoke-direct {v0}, Le/e/a/MultiTabs227$1;-><init>()V

    sput-object v0, Le/e/a/MultiTabs227;->CALLBACKS:Landroid/app/Application$ActivityLifecycleCallbacks;

    .line 24
    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static badge(Le/e/a/SavedTabs227$Tab;)I
    .registers 4

    .line 30
    const-string v0, "list"

    iget-object v1, p0, Le/e/a/SavedTabs227$Tab;->screen:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_39

    iget v0, p0, Le/e/a/SavedTabs227$Tab;->kind:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_18

    iget v0, p0, Le/e/a/SavedTabs227$Tab;->type:I

    const/16 v2, 0x8

    if-eq v0, v2, :cond_35

    const/4 v0, 0x4

    return v0

    :cond_18
    iget-object v0, p0, Le/e/a/SavedTabs227$Tab;->url:Ljava/lang/String;

    invoke-static {v0}, Le/e/a/CreatorTitles119;->uploads(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_35

    iget v1, p0, Le/e/a/SavedTabs227$Tab;->kind:I

    if-eqz v1, :cond_37

    iget v1, p0, Le/e/a/SavedTabs227$Tab;->type:I

    const/4 v2, 0x6

    if-ne v1, v2, :cond_39

    if-eqz v0, :cond_39

    const-string v1, "/ranking/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_39

    const/4 v0, 0x2

    return v0

    :cond_35
    const/4 v0, 0x3

    return v0

    :cond_37
    const/4 v0, 0x1

    return v0

    :cond_39
    const/4 v0, 0x0

    return v0

    nop
.end method

.method public static beforeSave(Landroid/app/Activity;)V
    .registers 6

    .line 26
    sget-object v0, Le/e/a/MultiTabs227;->HOSTS:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/MultiTabs227$Host;

    if-nez v0, :cond_b

    return-void

    :cond_b
    invoke-virtual {v0}, Le/e/a/MultiTabs227$Host;->capture()V

    invoke-static {}, Le/e/a/MultiTabs227;->save()V

    :try_start_11
    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, v0, Le/e/a/MultiTabs227$Host;->pages:Ljava/util/LinkedHashMap;

    invoke-virtual {v2}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_20
    :goto_20
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_3b

    const-string v0, "i"

    const/4 v1, 0x0

    new-array v2, v1, [Ljava/lang/Class;

    new-array v3, v1, [Ljava/lang/Object;

    invoke-static {p0, v0, v2, v3}, Le/e/a/MultiTabs227;->invoke(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    const-string v0, "n"

    new-array v2, v1, [Ljava/lang/Class;

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {p0, v0, v2, v1}, Le/e/a/MultiTabs227;->invoke(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_57

    :cond_3b
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iget-object v3, v0, Le/e/a/MultiTabs227$Host;->pages:Ljava/util/LinkedHashMap;

    invoke-virtual {v3, v2}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    iget-object v4, v0, Le/e/a/MultiTabs227$Host;->current:Ljava/lang/Object;

    if-eq v3, v4, :cond_20

    invoke-virtual {v0, v2}, Le/e/a/MultiTabs227$Host;->removePage(Ljava/lang/String;)V
    :try_end_4e
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_4e} :catch_4f

    goto :goto_20

    :catch_4f
    move-exception p0

    const-string v0, "nicoid-tabs"

    const-string v1, "Cannot trim saved Fragment state"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_57
    return-void
.end method

.method static bind(Landroid/app/Activity;I)V
    .registers 4

    .line 25
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-static {v0}, Le/e/a/TabRecovery244;->related(Landroid/content/Intent;)Z

    move-result v0

    if-eqz v0, :cond_b

    return-void

    :cond_b
    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_5e

    invoke-virtual {p0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v0

    if-nez v0, :cond_5e

    invoke-static {}, Le/e/a/MultiTabs227;->enabled()Z

    move-result v0

    if-eqz v0, :cond_5e

    sget-object v0, Le/e/a/TabRoutes228;->foreground:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eq v0, p0, :cond_26

    goto :goto_5e

    :cond_26
    :try_start_26
    sget-object v0, Le/e/a/MultiTabs227;->HOSTS:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/MultiTabs227$Host;

    if-nez v0, :cond_3a

    new-instance v0, Le/e/a/MultiTabs227$Host;

    invoke-direct {v0, p0}, Le/e/a/MultiTabs227$Host;-><init>(Landroid/app/Activity;)V

    sget-object v1, Le/e/a/MultiTabs227;->HOSTS:Ljava/util/Map;

    invoke-interface {v1, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_3a
    invoke-virtual {v0}, Le/e/a/MultiTabs227$Host;->resume()V

    invoke-static {v0}, Le/e/a/TabRoutes228;->attached(Le/e/a/MultiTabs227$Host;)V

    iget-object v0, v0, Le/e/a/MultiTabs227$Host;->currentId:Ljava/lang/String;

    invoke-static {p0, v0}, Le/e/a/PlaybackNavigation114;->browsed(Landroid/app/Activity;Ljava/lang/String;)V
    :try_end_45
    .catch Ljava/lang/Exception; {:try_start_26 .. :try_end_45} :catch_46

    goto :goto_5e

    :catch_46
    move-exception v0

    const/4 v1, 0x5

    if-ge p1, v1, :cond_57

    sget-object v0, Le/e/a/MultiTabs227;->MAIN:Landroid/os/Handler;

    new-instance v1, Le/e/a/MultiTabs227$$ExternalSyntheticLambda3;

    invoke-direct {v1, p0, p1}, Le/e/a/MultiTabs227$$ExternalSyntheticLambda3;-><init>(Landroid/app/Activity;I)V

    const-wide/16 p0, 0x20

    invoke-virtual {v0, v1, p0, p1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_5e

    :cond_57
    const-string p0, "nicoid-tabs"

    const-string p1, "Cannot attach native list tabs"

    invoke-static {p0, p1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_5e
    :goto_5e
    return-void
.end method

.method static data()Le/e/a/SavedTabs227;
    .registers 4

    .line 14
    sget-object v0, Le/e/a/MultiTabs227;->model:Le/e/a/SavedTabs227;

    if-nez v0, :cond_15

    new-instance v0, Le/e/a/SavedTabs227;

    sget-object v1, Le/e/a/MultiTabs227;->prefs:Landroid/content/SharedPreferences;

    const-string v2, "nicoid_video_tabs_v1"

    const-string v3, "{}"

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Le/e/a/SavedTabs227;-><init>(Ljava/lang/String;)V

    sput-object v0, Le/e/a/MultiTabs227;->model:Le/e/a/SavedTabs227;

    :cond_15
    sget-object v0, Le/e/a/MultiTabs227;->model:Le/e/a/SavedTabs227;

    return-object v0
.end method

.method static describe(Landroid/app/Activity;)Le/e/a/SavedTabs227$Tab;
    .registers 7

    .line 28
    new-instance v0, Le/e/a/SavedTabs227$Tab;

    invoke-direct {v0}, Le/e/a/SavedTabs227$Tab;-><init>()V

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Intent;->getDataString()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    if-nez v2, :cond_13

    move-object v2, v3

    goto :goto_17

    :cond_13
    invoke-virtual {v1}, Landroid/content/Intent;->getDataString()Ljava/lang/String;

    move-result-object v2

    :goto_17
    iput-object v2, v0, Le/e/a/SavedTabs227$Tab;->url:Ljava/lang/String;

    const-string v2, "type"

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    iput v2, v0, Le/e/a/SavedTabs227$Tab;->type:I

    const-string v2, "folderid"

    const/4 v5, -0x1

    invoke-virtual {v1, v2, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    iput v2, v0, Le/e/a/SavedTabs227$Tab;->folder:I

    const-string v2, "name"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Le/e/a/SavedTabs227$Tab;->label:Ljava/lang/String;

    iget-object v2, v0, Le/e/a/SavedTabs227$Tab;->label:Ljava/lang/String;

    if-nez v2, :cond_39

    iput-object v3, v0, Le/e/a/SavedTabs227$Tab;->label:Ljava/lang/String;

    :cond_39
    const-string v2, "item"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Le/e/a/SavedTabs227$Tab;->item:Ljava/lang/String;

    iget-object v2, v0, Le/e/a/SavedTabs227$Tab;->item:Ljava/lang/String;

    if-nez v2, :cond_47

    iput-object v3, v0, Le/e/a/SavedTabs227$Tab;->item:Ljava/lang/String;

    :cond_47
    const-string v2, "subtitle"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Le/e/a/SavedTabs227$Tab;->subtitle:Ljava/lang/String;

    iget-object v1, v0, Le/e/a/SavedTabs227$Tab;->subtitle:Ljava/lang/String;

    if-nez v1, :cond_55

    iput-object v3, v0, Le/e/a/SavedTabs227$Tab;->subtitle:Ljava/lang/String;

    :cond_55
    invoke-static {p0}, Le/e/a/TabRoutes228;->screen(Landroid/app/Activity;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Le/e/a/SavedTabs227$Tab;->screen:Ljava/lang/String;

    invoke-static {p0}, Le/e/a/MultiTabs227;->playlist(Landroid/app/Activity;)Z

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x2

    if-eqz v1, :cond_65

    const/4 v4, 0x2

    goto :goto_7f

    :cond_65
    iget v1, v0, Le/e/a/SavedTabs227$Tab;->type:I

    const/4 v5, 0x4

    if-eq v1, v5, :cond_7e

    iget v1, v0, Le/e/a/SavedTabs227$Tab;->type:I

    const/16 v5, 0x8

    if-ne v1, v5, :cond_71

    goto :goto_7e

    :cond_71
    iget-object v1, v0, Le/e/a/SavedTabs227$Tab;->url:Ljava/lang/String;

    const-string v5, "search/video"

    invoke-virtual {v1, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_7c

    goto :goto_7f

    :cond_7c
    const/4 v4, 0x3

    goto :goto_7f

    :cond_7e
    :goto_7e
    const/4 v4, 0x1

    :goto_7f
    iput v4, v0, Le/e/a/SavedTabs227$Tab;->kind:I

    iget v1, v0, Le/e/a/SavedTabs227$Tab;->kind:I

    if-ne v1, v3, :cond_91

    const-string v1, "Playlists"

    const-string v3, "\u64ad\u653e\u6e05\u55ae"

    const-string v4, "\u30d7\u30ec\u30a4\u30ea\u30b9\u30c8"

    invoke-static {p0, v4, v1, v3}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Le/e/a/SavedTabs227$Tab;->label:Ljava/lang/String;

    :cond_91
    iget v1, v0, Le/e/a/SavedTabs227$Tab;->kind:I

    if-ne v1, v2, :cond_a1

    const-string v1, "Watch history"

    const-string v2, "\u89c0\u770b\u7d00\u9304"

    const-string v3, "\u8996\u8074\u5c65\u6b74"

    invoke-static {p0, v3, v1, v2}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Le/e/a/SavedTabs227$Tab;->label:Ljava/lang/String;

    :cond_a1
    iget v1, v0, Le/e/a/SavedTabs227$Tab;->kind:I

    if-nez v1, :cond_c3

    iget-object v1, v0, Le/e/a/SavedTabs227$Tab;->url:Ljava/lang/String;

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    const-string v2, "keyword"

    invoke-virtual {v1, v2}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_bf

    iget-object v1, v0, Le/e/a/SavedTabs227$Tab;->url:Ljava/lang/String;

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    const-string v2, "tag"

    invoke-virtual {v1, v2}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :cond_bf
    if-eqz v1, :cond_c3

    iput-object v1, v0, Le/e/a/SavedTabs227$Tab;->label:Ljava/lang/String;

    :cond_c3
    invoke-static {p0, v0}, Le/e/a/CreatorTitles119;->repair(Landroid/app/Activity;Le/e/a/SavedTabs227$Tab;)V

    iget-object v1, v0, Le/e/a/SavedTabs227$Tab;->label:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_d8

    invoke-virtual {p0}, Landroid/app/Activity;->getTitle()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Le/e/a/SavedTabs227$Tab;->label:Ljava/lang/String;

    :cond_d8
    invoke-static {p0, v0}, Le/e/a/TabRoutes228;->label(Landroid/app/Activity;Le/e/a/SavedTabs227$Tab;)V

    return-object v0
.end method

.method static enabled()Z
    .registers 3

    .line 13
    sget-object v0, Le/e/a/MultiTabs227;->prefs:Landroid/content/SharedPreferences;

    const/4 v1, 0x0

    if-eqz v0, :cond_11

    sget-object v0, Le/e/a/MultiTabs227;->prefs:Landroid/content/SharedPreferences;

    const-string v2, "multiple_video_tabs"

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_11

    const/4 v0, 0x1

    return v0

    :cond_11
    return v1
.end method

.method static get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 8
    invoke-static {p0, p1}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method static intent(Landroid/app/Activity;Le/e/a/SavedTabs227$Tab;)Landroid/content/Intent;
    .registers 2

    .line 38
    invoke-static {p0, p1}, Le/e/a/TabRoutes228;->intent(Landroid/app/Activity;Le/e/a/SavedTabs227$Tab;)Landroid/content/Intent;

    move-result-object p0

    return-object p0
.end method

.method static varargs invoke(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
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

    .line 10
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p1

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    invoke-virtual {p1, p0, p3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$0(Landroid/content/SharedPreferences;Ljava/lang/String;)V
    .registers 2

    .line 17
    const-string p0, "multiple_video_tabs"

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_9

    return-void

    :cond_9
    sget-object p0, Le/e/a/MultiTabs227;->MAIN:Landroid/os/Handler;

    new-instance p1, Le/e/a/MultiTabs227$$ExternalSyntheticLambda4;

    invoke-direct {p1}, Le/e/a/MultiTabs227$$ExternalSyntheticLambda4;-><init>()V

    invoke-virtual {p0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method static synthetic lambda$1()V
    .registers 6

    .line 17
    new-instance v0, Ljava/util/ArrayList;

    sget-object v1, Le/e/a/MultiTabs227;->HOSTS:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_f
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_16

    return-void

    :cond_16
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/MultiTabs227$Host;

    invoke-static {}, Le/e/a/MultiTabs227;->enabled()Z

    move-result v2

    if-eqz v2, :cond_26

    invoke-virtual {v1}, Le/e/a/MultiTabs227$Host;->bar()V

    goto :goto_f

    :cond_26
    invoke-virtual {v1}, Le/e/a/MultiTabs227$Host;->capture()V

    invoke-virtual {v1}, Le/e/a/MultiTabs227$Host;->removeBar()V

    new-instance v2, Ljava/util/ArrayList;

    iget-object v3, v1, Le/e/a/MultiTabs227$Host;->pages:Ljava/util/LinkedHashMap;

    invoke-virtual {v3}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_3b
    :goto_3b
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_42

    goto :goto_f

    :cond_42
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    iget-object v4, v1, Le/e/a/MultiTabs227$Host;->pages:Ljava/util/LinkedHashMap;

    invoke-virtual {v4, v3}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    iget-object v5, v1, Le/e/a/MultiTabs227$Host;->current:Ljava/lang/Object;

    if-eq v4, v5, :cond_3b

    invoke-virtual {v1, v3}, Le/e/a/MultiTabs227$Host;->removePage(Ljava/lang/String;)V

    goto :goto_3b
.end method

.method static synthetic lambda$2(Landroid/app/Activity;I)V
    .registers 2

    .line 25
    add-int/lit8 p1, p1, 0x1

    invoke-static {p0, p1}, Le/e/a/MultiTabs227;->bind(Landroid/app/Activity;I)V

    return-void
.end method

.method static lists(Landroid/app/Activity;)Z
    .registers 2

    .line 11
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p0

    const-string v0, "com.sauzask.nicoid.NicoidVideoListActivity"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method static match(Le/e/a/SavedTabs227$Tab;)Le/e/a/SavedTabs227$Tab;
    .registers 5

    .line 37
    invoke-static {}, Le/e/a/MultiTabs227;->data()Le/e/a/SavedTabs227;

    move-result-object v0

    iget-object v0, v0, Le/e/a/SavedTabs227;->tabs:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_12

    const/4 p0, 0x0

    return-object p0

    :cond_12
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/SavedTabs227$Tab;

    iget-object v2, p0, Le/e/a/SavedTabs227$Tab;->screen:Ljava/lang/String;

    iget-object v3, v1, Le/e/a/SavedTabs227$Tab;->screen:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a

    iget v2, p0, Le/e/a/SavedTabs227$Tab;->kind:I

    iget v3, v1, Le/e/a/SavedTabs227$Tab;->kind:I

    if-ne v2, v3, :cond_a

    iget v2, p0, Le/e/a/SavedTabs227$Tab;->type:I

    iget v3, v1, Le/e/a/SavedTabs227$Tab;->type:I

    if-ne v2, v3, :cond_a

    iget v2, p0, Le/e/a/SavedTabs227$Tab;->folder:I

    iget v3, v1, Le/e/a/SavedTabs227$Tab;->folder:I

    if-ne v2, v3, :cond_a

    iget-object v2, p0, Le/e/a/SavedTabs227$Tab;->url:Ljava/lang/String;

    iget-object v3, v1, Le/e/a/SavedTabs227$Tab;->url:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a

    return-object v1
.end method

.method static playlist(Landroid/app/Activity;)Z
    .registers 3

    .line 12
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "com.sauzask.nicoid.NicoidNicorepoActivity"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1f

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p0

    const-string v0, "nicoid_local_playlists"

    invoke-virtual {p0, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p0

    if-eqz p0, :cond_1f

    const/4 p0, 0x1

    return p0

    :cond_1f
    return v1
.end method

.method static save()V
    .registers 3

    .line 15
    invoke-static {}, Le/e/a/MultiTabs227;->data()Le/e/a/SavedTabs227;

    move-result-object v0

    invoke-virtual {v0}, Le/e/a/SavedTabs227;->save()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Le/e/a/MultiTabs227;->lastSaved:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_11

    return-void

    :cond_11
    sget-object v1, Le/e/a/MultiTabs227;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v2, "nicoid_video_tabs_v1"

    invoke-interface {v1, v2, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    sput-object v0, Le/e/a/MultiTabs227;->lastSaved:Ljava/lang/String;

    return-void
.end method

.method static set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 9
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    :goto_4
    if-eqz v0, :cond_18

    :try_start_6
    invoke-virtual {v0, p1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    invoke-virtual {v1, p0, p2}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_11
    .catch Ljava/lang/NoSuchFieldException; {:try_start_6 .. :try_end_11} :catch_12

    return-void

    :catch_12
    move-exception v1

    invoke-virtual {v0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v0

    goto :goto_4

    :cond_18
    new-instance p0, Ljava/lang/NoSuchFieldException;

    invoke-direct {p0, p1}, Ljava/lang/NoSuchFieldException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static settings(Landroid/preference/PreferenceActivity;)V
    .registers 7

    .line 27
    const-string v0, "multiple_video_tabs"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    if-eqz v1, :cond_9

    return-void

    :cond_9
    const-string v1, "setting_whole"

    filled-new-array {v1}, [Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_11
    const/4 v4, 0x1

    if-lt v3, v4, :cond_16

    const/4 v1, 0x0

    goto :goto_23

    :cond_16
    aget-object v4, v1, v3

    invoke-virtual {p0, v4}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v4

    instance-of v5, v4, Landroid/preference/PreferenceGroup;

    if-eqz v5, :cond_59

    move-object v1, v4

    check-cast v1, Landroid/preference/PreferenceGroup;

    :goto_23
    if-nez v1, :cond_29

    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v1

    :cond_29
    if-nez v1, :cond_2c

    return-void

    :cond_2c
    new-instance v3, Landroid/preference/CheckBoxPreference;

    invoke-direct {v3, p0}, Landroid/preference/CheckBoxPreference;-><init>(Landroid/content/Context;)V

    invoke-virtual {v3, v0}, Landroid/preference/CheckBoxPreference;->setKey(Ljava/lang/String;)V

    const-string v0, "Use multiple tabs"

    const-string v4, "\u4f7f\u7528\u591a\u500b\u5206\u9801"

    const-string v5, "\u8907\u6570\u30bf\u30d6\u3092\u4f7f\u7528\u3059\u308b"

    invoke-static {p0, v5, v0, v4}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Landroid/preference/CheckBoxPreference;->setTitle(Ljava/lang/CharSequence;)V

    const-string v0, "Switch search results, watch history and playlists using tabs."

    const-string v4, "\u4f7f\u7528\u5206\u9801\u5207\u63db\u641c\u5c0b\u7d50\u679c\u3001\u89c0\u770b\u7d00\u9304\u8207\u64ad\u653e\u6e05\u55ae\u3002"

    const-string v5, "\u691c\u7d22\u7d50\u679c\u3084\u8996\u8074\u5c65\u6b74\u3001\u30d7\u30ec\u30a4\u30ea\u30b9\u30c8\u3092\u8907\u6570\u306e\u30bf\u30d6\u3067\u5207\u308a\u66ff\u3048\u3089\u308c\u308b\u3088\u3046\u306b\u3057\u307e\u3059\u3002"

    invoke-static {p0, v5, v0, v4}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v3, p0}, Landroid/preference/CheckBoxPreference;->setSummary(Ljava/lang/CharSequence;)V

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    invoke-virtual {v3, p0}, Landroid/preference/CheckBoxPreference;->setDefaultValue(Ljava/lang/Object;)V

    invoke-virtual {v1, v3}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    return-void

    :cond_59
    add-int/lit8 v3, v3, 0x1

    goto :goto_11
.end method

.method public static track(Landroid/app/Activity;)V
    .registers 4

    .line 16
    if-eqz p0, :cond_50

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    if-eqz v0, :cond_50

    sget-object v0, Le/e/a/MultiTabs227;->app:Landroid/app/Application;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v1

    if-ne v0, v1, :cond_11

    goto :goto_50

    :cond_11
    sget-object v0, Le/e/a/MultiTabs227;->app:Landroid/app/Application;

    const/4 v1, 0x0

    if-eqz v0, :cond_32

    sget-object v0, Le/e/a/MultiTabs227;->app:Landroid/app/Application;

    sget-object v2, Le/e/a/MultiTabs227;->CALLBACKS:Landroid/app/Application$ActivityLifecycleCallbacks;

    invoke-virtual {v0, v2}, Landroid/app/Application;->unregisterActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    sget-object v0, Le/e/a/MultiTabs227;->prefs:Landroid/content/SharedPreferences;

    if-eqz v0, :cond_28

    sget-object v0, Le/e/a/MultiTabs227;->prefs:Landroid/content/SharedPreferences;

    sget-object v2, Le/e/a/MultiTabs227;->CHANGED:Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;

    invoke-interface {v0, v2}, Landroid/content/SharedPreferences;->unregisterOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    :cond_28
    sget-object v0, Le/e/a/MultiTabs227;->HOSTS:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    sput-object v1, Le/e/a/MultiTabs227;->model:Le/e/a/SavedTabs227;

    const/4 v0, 0x1

    sput-boolean v0, Le/e/a/MultiTabs227;->restoreFirstHost:Z

    :cond_32
    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p0

    sput-object p0, Le/e/a/MultiTabs227;->app:Landroid/app/Application;

    sput-object v1, Le/e/a/MultiTabs227;->lastSaved:Ljava/lang/String;

    sget-object p0, Le/e/a/MultiTabs227;->app:Landroid/app/Application;

    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    sput-object p0, Le/e/a/MultiTabs227;->prefs:Landroid/content/SharedPreferences;

    sget-object p0, Le/e/a/MultiTabs227;->prefs:Landroid/content/SharedPreferences;

    sget-object v0, Le/e/a/MultiTabs227;->CHANGED:Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;

    invoke-interface {p0, v0}, Landroid/content/SharedPreferences;->registerOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    sget-object p0, Le/e/a/MultiTabs227;->app:Landroid/app/Application;

    sget-object v0, Le/e/a/MultiTabs227;->CALLBACKS:Landroid/app/Application$ActivityLifecycleCallbacks;

    invoke-virtual {p0, v0}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    :cond_50
    :goto_50
    return-void
.end method
