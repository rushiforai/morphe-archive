.class public final Le/e/a/StartupRouter;
.super Landroid/app/Activity;
.source "StartupRouter.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 2
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method home()Landroid/content/Intent;
    .registers 4

    .line 4
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.MAIN"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "android.intent.category.LAUNCHER"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    const-string v1, "com.sauzask.nicoid.NicoidTopActivity"

    invoke-virtual {v0, p0, v1}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    const-string v1, "nicoid_home"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .registers 8

    .line 3
    const-string v0, "home"

    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Le/e/a/StartupRouter;->home()Landroid/content/Intent;

    move-result-object p1

    :try_start_9
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v2, "startup_screen"

    invoke-interface {v1, v2, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "shorts"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2
    :try_end_19
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_19} :catch_bf

    const-string v3, "android.intent.action.VIEW"

    if-eqz v2, :cond_30

    :try_start_1d
    new-instance p1, Landroid/content/Intent;

    const-string v0, "nicoid-re://shorts"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-direct {p1, v3, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const-string v0, "com.sauzask.nicoid.NicoidVideoActivity"

    invoke-virtual {p1, p0, v0}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    goto/16 :goto_bb

    :cond_30
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_bb

    const-string v0, "e.e.a.StartupScreen"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v2, "IDS"

    invoke-virtual {v0, v2}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    const-string v4, "LABELS"

    invoke-virtual {v0, v4}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    invoke-virtual {v0, v4}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    const/4 v4, 0x0

    invoke-virtual {v2, v4}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/lang/String;

    invoke-virtual {v0, v4}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    const/4 v4, 0x2

    :goto_5d
    array-length v5, v2

    if-ge v4, v5, :cond_bb

    aget-object v5, v2, v4

    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_b8

    new-instance p1, Landroid/content/Intent;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "https://sp.nicovideo.jp/api/ranking/genre/"

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "?term="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p0}, Le/e/a/RankingPeriod;->savedTerm(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-direct {p1, v3, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const-string v1, "com.sauzask.nicoid.NicoidVideoListActivity"

    invoke-virtual {p1, p0, v1}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    const-string v1, "type"

    const/4 v2, 0x6

    invoke-virtual {p1, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object p1

    const-string v1, "name"

    aget-object v0, v0, v4

    invoke-static {v0}, Le/e/a/FeedbackFixes;->tr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    const-string v0, "subtitle"

    const-string v1, "\u30e9\u30f3\u30ad\u30f3\u30b0"

    invoke-static {v1}, Le/e/a/FeedbackFixes;->tr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    goto :goto_bb

    :cond_b8
    add-int/lit8 v4, v4, 0x1

    goto :goto_5d

    :cond_bb
    :goto_bb
    invoke-virtual {p0, p1}, Le/e/a/StartupRouter;->startActivity(Landroid/content/Intent;)V
    :try_end_be
    .catch Ljava/lang/Exception; {:try_start_1d .. :try_end_be} :catch_bf

    goto :goto_ca

    :catch_bf
    move-exception p1

    invoke-static {p1}, Le/e/a/FeedbackFixes;->log(Ljava/lang/Exception;)V

    invoke-virtual {p0}, Le/e/a/StartupRouter;->home()Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p0, p1}, Le/e/a/StartupRouter;->startActivity(Landroid/content/Intent;)V

    :goto_ca
    invoke-virtual {p0}, Le/e/a/StartupRouter;->finish()V

    return-void
.end method
