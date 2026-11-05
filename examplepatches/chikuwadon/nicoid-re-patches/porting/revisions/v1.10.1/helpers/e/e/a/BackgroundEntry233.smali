.class public final Le/e/a/BackgroundEntry233;
.super Ljava/lang/Object;
.source "BackgroundEntry233.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static activity(Landroid/content/Context;)Landroid/app/Activity;
    .registers 4

    .line 4
    const/4 v0, 0x0

    :goto_1
    const/16 v1, 0x8

    const/4 v2, 0x0

    if-ge v0, v1, :cond_27

    if-nez p0, :cond_9

    goto :goto_27

    :cond_9
    instance-of v1, p0, Landroid/app/Activity;

    if-eqz v1, :cond_10

    check-cast p0, Landroid/app/Activity;

    return-object p0

    :cond_10
    instance-of v1, p0, Landroid/app/Service;

    if-nez v1, :cond_27

    instance-of v1, p0, Landroid/content/ContextWrapper;

    if-nez v1, :cond_19

    goto :goto_27

    :cond_19
    move-object v1, p0

    check-cast v1, Landroid/content/ContextWrapper;

    invoke-virtual {v1}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object v1

    if-ne v1, p0, :cond_23

    return-object v2

    :cond_23
    add-int/lit8 v0, v0, 0x1

    move-object p0, v1

    goto :goto_1

    :cond_27
    :goto_27
    return-object v2
.end method

.method static synthetic lambda$0(Ljava/lang/Object;)V
    .registers 2

    .line 5
    invoke-static {p0}, Le/e/a/MiniSession225;->minimize(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_d

    const-string p0, "nicoid-mini"

    const-string v0, "Requested mini-player could not attach; normal player retained"

    invoke-static {p0, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_d
    return-void
.end method

.method public static prepared(Ljava/lang/Object;)V
    .registers 5

    .line 5
    const-string v0, "nicoid_start_minimized"

    invoke-static {p0}, Le/e/a/MiniSession225;->prepared(Ljava/lang/Object;)V

    :try_start_5
    const-string v1, "A1"

    invoke-static {p0, v1}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v0, v3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v2

    if-nez v2, :cond_19

    return-void

    :cond_19
    invoke-virtual {v1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    invoke-virtual {v1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    new-instance v1, Le/e/a/BackgroundEntry233$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0}, Le/e/a/BackgroundEntry233$$ExternalSyntheticLambda1;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z
    :try_end_30
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_30} :catch_31

    goto :goto_39

    :catch_31
    move-exception p0

    const-string v0, "nicoid-mini"

    const-string v1, "Cannot finish background entry"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_39
    return-void
.end method

.method public static start(Landroid/content/Context;Landroid/content/Intent;)Z
    .registers 4

    .line 4
    invoke-static {p0}, Le/e/a/BackgroundEntry233;->activity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object p0

    const/4 v0, 0x0

    if-eqz p0, :cond_54

    const-string v1, "isBackgroundPlay"

    invoke-virtual {p1, v1, v0}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    if-nez v1, :cond_10

    goto :goto_54

    :cond_10
    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v1

    if-nez v1, :cond_54

    invoke-virtual {p0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v1

    if-nez v1, :cond_54

    invoke-static {p0}, Le/e/a/PlaybackTransfer221;->retaining(Landroid/app/Activity;)Z

    move-result v1

    if-nez v1, :cond_54

    invoke-static {p0}, Le/e/a/MiniSession225;->retaining(Landroid/app/Activity;)Z

    move-result v1

    if-eqz v1, :cond_29

    goto :goto_54

    :cond_29
    :try_start_29
    const-string v1, "nicoid_playback_transfer"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_36

    invoke-static {p0, p1}, Le/e/a/DirectBackground235;->start(Landroid/app/Activity;Landroid/content/Intent;)Z

    move-result p0

    return p0

    :cond_36
    invoke-static {p0}, Le/e/a/PlaybackBar221;->player(Landroid/app/Activity;)Z

    move-result v1

    if-eqz v1, :cond_47

    const-string p1, "v"

    invoke-static {p0, p1}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Le/e/a/MiniSession225;->minimize(Ljava/lang/Object;)Z

    move-result p0

    return p0

    :cond_47
    invoke-static {p0, p1}, Le/e/a/DirectBootstrap238;->start(Landroid/app/Activity;Landroid/content/Intent;)Z

    move-result p0
    :try_end_4b
    .catch Ljava/lang/Exception; {:try_start_29 .. :try_end_4b} :catch_4c

    return p0

    :catch_4c
    move-exception p0

    const-string p1, "nicoid-mini"

    const-string v1, "Cannot open background player"

    invoke-static {p1, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_54
    :goto_54
    return v0
.end method
