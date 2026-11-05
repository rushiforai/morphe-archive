.class public final Le/e/a/PlaybackNavigation114;
.super Ljava/lang/Object;
.source "PlaybackNavigation114.java"


# static fields
.field static final RETURN:Ljava/lang/String; = "nicoid_return_to_browse_114"

.field static last:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field

.field static route:Landroid/content/Intent;

.field static tab:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 7
    new-instance v0, Ljava/lang/ref/WeakReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Le/e/a/PlaybackNavigation114;->last:Ljava/lang/ref/WeakReference;

    const-string v0, ""

    sput-object v0, Le/e/a/PlaybackNavigation114;->tab:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static back(Landroid/app/Activity;)Z
    .registers 7

    .line 14
    const-string v0, "background"

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string v2, "nicoid_return_to_browse_114"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    if-nez v1, :cond_10

    return v3

    :cond_10
    invoke-static {p0}, Le/e/a/PopupReturn244;->matches(Landroid/app/Activity;)Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_18

    return v2

    :cond_18
    :try_start_18
    const-string v1, "v"

    invoke-static {p0, v1}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v4

    const-string v5, "back_playback"

    invoke-interface {v4, v5, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3f

    invoke-static {v1}, Le/e/a/MiniSession225;->minimize(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_35

    return v2

    :cond_35
    invoke-static {v1, v2}, Le/e/a/PlaybackTransfer221;->popup(Ljava/lang/Object;Z)Z

    move-result v0

    if-eqz v0, :cond_51

    invoke-static {p0, v3}, Le/e/a/PlaybackNavigation114;->showBrowse(Landroid/app/Activity;Z)Z

    return v2

    :cond_3f
    const-string v0, "popup"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_51

    invoke-static {v1, v3}, Le/e/a/PlaybackTransfer221;->popup(Ljava/lang/Object;Z)Z

    move-result v0

    if-eqz v0, :cond_51

    invoke-static {p0, v3}, Le/e/a/PlaybackNavigation114;->showBrowse(Landroid/app/Activity;Z)Z

    return v2

    :cond_51
    invoke-static {p0, v2}, Le/e/a/PlaybackNavigation114;->showBrowse(Landroid/app/Activity;Z)Z

    move-result p0
    :try_end_55
    .catch Ljava/lang/Exception; {:try_start_18 .. :try_end_55} :catch_56

    return p0

    :catch_56
    move-exception p0

    const-string v0, "nicoid-navigation"

    const-string v1, "Cannot leave restored playback"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return v3
.end method

.method static browseIntent(Landroid/app/Activity;Landroid/app/Activity;)Landroid/content/Intent;
    .registers 4

    .line 10
    invoke-static {}, Le/e/a/MultiTabs227;->enabled()Z

    move-result v0

    if-eqz v0, :cond_11

    invoke-static {}, Le/e/a/MultiTabs227;->data()Le/e/a/SavedTabs227;

    move-result-object v0

    sget-object v1, Le/e/a/PlaybackNavigation114;->tab:Ljava/lang/String;

    invoke-virtual {v0, v1}, Le/e/a/SavedTabs227;->find(Ljava/lang/String;)Le/e/a/SavedTabs227$Tab;

    move-result-object v0

    goto :goto_12

    :cond_11
    const/4 v0, 0x0

    :goto_12
    if-eqz v0, :cond_19

    invoke-static {p0, v0}, Le/e/a/TabRoutes228;->intent(Landroid/app/Activity;Le/e/a/SavedTabs227$Tab;)Landroid/content/Intent;

    move-result-object p0

    return-object p0

    :cond_19
    sget-object p0, Le/e/a/PlaybackNavigation114;->route:Landroid/content/Intent;

    if-eqz p0, :cond_25

    new-instance p0, Landroid/content/Intent;

    sget-object p1, Le/e/a/PlaybackNavigation114;->route:Landroid/content/Intent;

    invoke-direct {p0, p1}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    return-object p0

    :cond_25
    new-instance p0, Landroid/content/Intent;

    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    invoke-virtual {p1}, Landroid/app/Activity;->getComponentName()Landroid/content/ComponentName;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    move-result-object p0

    return-object p0
.end method

.method static browsed(Landroid/app/Activity;Ljava/lang/String;)V
    .registers 3

    .line 8
    if-eqz p0, :cond_57

    invoke-virtual {p0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v0

    if-nez v0, :cond_57

    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_57

    invoke-static {p0}, Le/e/a/PlaybackBar221;->player(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_57

    sget-object v0, Le/e/a/TabRoutes228;->foreground:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eq v0, p0, :cond_1d

    goto :goto_57

    :cond_1d
    invoke-static {}, Le/e/a/MultiTabs227;->enabled()Z

    move-result v0

    if-eqz v0, :cond_2c

    invoke-static {}, Le/e/a/MultiTabs227;->data()Le/e/a/SavedTabs227;

    move-result-object v0

    invoke-virtual {v0, p1}, Le/e/a/SavedTabs227;->find(Ljava/lang/String;)Le/e/a/SavedTabs227$Tab;

    move-result-object p1

    goto :goto_2d

    :cond_2c
    const/4 p1, 0x0

    :goto_2d
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Le/e/a/PlaybackNavigation114;->last:Ljava/lang/ref/WeakReference;

    if-nez p1, :cond_39

    const-string v0, ""

    goto :goto_3b

    :cond_39
    iget-object v0, p1, Le/e/a/SavedTabs227$Tab;->id:Ljava/lang/String;

    :goto_3b
    sput-object v0, Le/e/a/PlaybackNavigation114;->tab:Ljava/lang/String;

    if-nez p1, :cond_51

    new-instance p1, Landroid/content/Intent;

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-direct {p1, v0}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    invoke-virtual {p0}, Landroid/app/Activity;->getComponentName()Landroid/content/ComponentName;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    move-result-object p0

    goto :goto_55

    :cond_51
    invoke-static {p0, p1}, Le/e/a/TabRoutes228;->intent(Landroid/app/Activity;Le/e/a/SavedTabs227$Tab;)Landroid/content/Intent;

    move-result-object p0

    :goto_55
    sput-object p0, Le/e/a/PlaybackNavigation114;->route:Landroid/content/Intent;

    :cond_57
    :goto_57
    return-void
.end method

.method static destination(Landroid/app/Activity;)Landroid/app/Activity;
    .registers 5

    .line 9
    sget-object v0, Le/e/a/PlaybackNavigation114;->last:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-eqz v0, :cond_23

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v1

    if-nez v1, :cond_23

    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v1

    if-nez v1, :cond_23

    if-eq v0, p0, :cond_23

    invoke-virtual {v0}, Landroid/app/Activity;->getTaskId()I

    move-result v1

    invoke-virtual {p0}, Landroid/app/Activity;->getTaskId()I

    move-result v2

    if-ne v1, v2, :cond_23

    return-object v0

    :cond_23
    sget-object v0, Le/e/a/MultiTabs227;->HOSTS:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_2d
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_35

    const/4 p0, 0x0

    return-object p0

    :cond_35
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/MultiTabs227$Host;

    sget-object v2, Le/e/a/PlaybackNavigation114;->route:Landroid/content/Intent;

    if-eqz v2, :cond_2d

    iget-object v2, v1, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    invoke-virtual {v2}, Landroid/app/Activity;->getComponentName()Landroid/content/ComponentName;

    move-result-object v2

    sget-object v3, Le/e/a/PlaybackNavigation114;->route:Landroid/content/Intent;

    invoke-virtual {v3}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/content/ComponentName;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2d

    iget-object v2, v1, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    invoke-virtual {v2}, Landroid/app/Activity;->isDestroyed()Z

    move-result v2

    if-nez v2, :cond_2d

    iget-object v2, v1, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    invoke-virtual {v2}, Landroid/app/Activity;->isFinishing()Z

    move-result v2

    if-nez v2, :cond_2d

    iget-object v2, v1, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    if-eq v2, p0, :cond_2d

    iget-object v2, v1, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    invoke-virtual {v2}, Landroid/app/Activity;->getTaskId()I

    move-result v2

    invoke-virtual {p0}, Landroid/app/Activity;->getTaskId()I

    move-result v3

    if-ne v2, v3, :cond_2d

    iget-object p0, v1, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    return-object p0
.end method

.method static launch(Landroid/app/Service;Landroid/content/Intent;)V
    .registers 4

    .line 12
    invoke-static {p1}, Le/e/a/PlaybackNavigation114;->mark(Landroid/content/Intent;)V

    sget-object v0, Le/e/a/PlaybackNavigation114;->last:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-eqz v0, :cond_28

    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v1

    if-nez v1, :cond_28

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v1

    if-nez v1, :cond_28

    invoke-virtual {p1}, Landroid/content/Intent;->getFlags()I

    move-result p0

    const v1, -0x10000001

    and-int/2addr p0, v1

    invoke-virtual {p1, p0}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    invoke-virtual {v0, p1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    goto :goto_2b

    :cond_28
    invoke-virtual {p0, p1}, Landroid/app/Service;->startActivity(Landroid/content/Intent;)V

    :goto_2b
    return-void
.end method

.method static mark(Landroid/content/Intent;)V
    .registers 3

    .line 11
    const-string v0, "nicoid_return_to_browse_114"

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    return-void
.end method

.method static showBrowse(Landroid/app/Activity;Z)Z
    .registers 5

    .line 13
    const/4 v0, 0x0

    :try_start_1
    invoke-static {p0}, Le/e/a/PlaybackNavigation114;->destination(Landroid/app/Activity;)Landroid/app/Activity;

    move-result-object v1

    sget-object v2, Le/e/a/PlaybackNavigation114;->route:Landroid/content/Intent;

    if-nez v2, :cond_c

    if-nez v1, :cond_c

    return v0

    :cond_c
    invoke-static {p0, v1}, Le/e/a/PlaybackNavigation114;->browseIntent(Landroid/app/Activity;Landroid/app/Activity;)Landroid/content/Intent;

    move-result-object v1

    const/high16 v2, 0x20070000

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    invoke-virtual {p0, v1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    invoke-virtual {p0, v0, v0}, Landroid/app/Activity;->overridePendingTransition(II)V

    if-eqz p1, :cond_20

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V
    :try_end_20
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_20} :catch_22

    :cond_20
    const/4 p0, 0x1

    return p0

    :catch_22
    move-exception p0

    const-string p1, "nicoid-navigation"

    const-string v1, "Cannot restore browsing screen"

    invoke-static {p1, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return v0
.end method
