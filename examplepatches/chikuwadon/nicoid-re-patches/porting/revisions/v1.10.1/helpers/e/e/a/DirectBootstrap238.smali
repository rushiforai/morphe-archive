.class public final Le/e/a/DirectBootstrap238;
.super Ljava/lang/Object;
.source "DirectBootstrap238.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/DirectBootstrap238$Pending;
    }
.end annotation


# static fields
.field static final LIFECYCLE:Landroid/app/Application$ActivityLifecycleCallbacks;

.field static final MAIN:Landroid/os/Handler;

.field static final TOKEN:Ljava/lang/String; = "nicoid_retained_start_token"

.field static app:Landroid/app/Application;

.field static pending:Le/e/a/DirectBootstrap238$Pending;

.field static sequence:J


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 5
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Le/e/a/DirectBootstrap238;->MAIN:Landroid/os/Handler;

    .line 16
    new-instance v0, Le/e/a/DirectBootstrap238$1;

    invoke-direct {v0}, Le/e/a/DirectBootstrap238$1;-><init>()V

    sput-object v0, Le/e/a/DirectBootstrap238;->LIFECYCLE:Landroid/app/Application$ActivityLifecycleCallbacks;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static cancel(Le/e/a/DirectBootstrap238$Pending;Z)V
    .registers 4

    .line 14
    sget-object v0, Le/e/a/DirectBootstrap238;->pending:Le/e/a/DirectBootstrap238$Pending;

    if-eq v0, p0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x0

    sput-object v0, Le/e/a/DirectBootstrap238;->pending:Le/e/a/DirectBootstrap238$Pending;

    sget-object v0, Le/e/a/DirectBootstrap238;->MAIN:Landroid/os/Handler;

    iget-object v1, p0, Le/e/a/DirectBootstrap238$Pending;->timeout:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-object v0, p0, Le/e/a/DirectBootstrap238$Pending;->source:Landroid/app/Activity;

    if-eqz v0, :cond_2f

    iget-object v0, p0, Le/e/a/DirectBootstrap238$Pending;->source:Landroid/app/Activity;

    invoke-static {v0}, Le/e/a/DirectBootstrap238;->reveal(Landroid/app/Activity;)V

    if-eqz p1, :cond_2f

    iget-object p1, p0, Le/e/a/DirectBootstrap238$Pending;->source:Landroid/app/Activity;

    invoke-virtual {p1}, Landroid/app/Activity;->isFinishing()Z

    move-result p1

    if-nez p1, :cond_2f

    iget-object p1, p0, Le/e/a/DirectBootstrap238$Pending;->source:Landroid/app/Activity;

    invoke-virtual {p1}, Landroid/app/Activity;->isDestroyed()Z

    move-result p1

    if-nez p1, :cond_2f

    iget-object p0, p0, Le/e/a/DirectBootstrap238$Pending;->source:Landroid/app/Activity;

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    :cond_2f
    return-void
.end method

.method public static created(Ljava/lang/Object;)V
    .registers 6

    .line 13
    sget-object v0, Le/e/a/DirectBootstrap238;->pending:Le/e/a/DirectBootstrap238$Pending;

    if-nez v0, :cond_5

    return-void

    :cond_5
    const/4 v1, 0x1

    :try_start_6
    const-string v2, "A1"

    invoke-static {p0, v2}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/Activity;

    invoke-static {v2, v0}, Le/e/a/DirectBootstrap238;->matches(Landroid/app/Activity;Le/e/a/DirectBootstrap238$Pending;)Z

    move-result v3

    if-nez v3, :cond_15

    return-void

    :cond_15
    iget-object v3, v0, Le/e/a/DirectBootstrap238$Pending;->destination:Ljava/lang/ref/WeakReference;

    invoke-virtual {v3}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/app/Activity;

    if-eqz v3, :cond_4f

    invoke-virtual {v3}, Landroid/app/Activity;->isFinishing()Z

    move-result v4

    if-nez v4, :cond_4f

    invoke-virtual {v3}, Landroid/app/Activity;->isDestroyed()Z

    move-result v4

    if-eqz v4, :cond_2c

    goto :goto_4f

    :cond_2c
    invoke-static {p0, v3}, Le/e/a/MiniSession225;->beginMinimized(Ljava/lang/Object;Landroid/app/Activity;)Z

    move-result p0

    if-nez p0, :cond_36

    invoke-static {v0, v1}, Le/e/a/DirectBootstrap238;->cancel(Le/e/a/DirectBootstrap238$Pending;Z)V

    return-void

    :cond_36
    const/4 p0, 0x0

    sput-object p0, Le/e/a/DirectBootstrap238;->pending:Le/e/a/DirectBootstrap238$Pending;

    sget-object p0, Le/e/a/DirectBootstrap238;->MAIN:Landroid/os/Handler;

    iget-object v3, v0, Le/e/a/DirectBootstrap238$Pending;->timeout:Ljava/lang/Runnable;

    invoke-virtual {p0, v3}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    invoke-virtual {v2}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p0

    const-string v2, "nicoid_retained_start_token"

    invoke-virtual {p0, v2}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    const-string p0, "Prepared retained mini host without playback transfer"

    invoke-static {p0}, Le/e/a/ModernDebug;->record(Ljava/lang/String;)V

    goto :goto_5c

    :cond_4f
    :goto_4f
    invoke-static {v0, v1}, Le/e/a/DirectBootstrap238;->cancel(Le/e/a/DirectBootstrap238$Pending;Z)V
    :try_end_52
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_52} :catch_53

    return-void

    :catch_53
    move-exception p0

    const-string v2, "Cannot retain direct background session"

    invoke-static {v2, p0}, Le/e/a/MiniSession225;->log(Ljava/lang/String;Ljava/lang/Exception;)V

    invoke-static {v0, v1}, Le/e/a/DirectBootstrap238;->cancel(Le/e/a/DirectBootstrap238$Pending;Z)V

    :goto_5c
    return-void
.end method

.method static id(Landroid/content/Intent;)Ljava/lang/String;
    .registers 3

    .line 7
    const-string v0, "url"

    invoke-virtual {p0, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_16

    invoke-virtual {p0}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    if-eqz v1, :cond_16

    invoke-virtual {p0}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_16
    const/4 p0, 0x0

    if-nez v0, :cond_1a

    return-object p0

    :cond_1a
    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_2a

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v0

    :cond_2a
    if-eqz v0, :cond_35

    const-string v1, "(?:sm|nm|so|ss)?[0-9]+"

    invoke-virtual {v0, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_35

    move-object p0, v0

    :cond_35
    return-object p0
.end method

.method static matches(Landroid/app/Activity;Le/e/a/DirectBootstrap238$Pending;)Z
    .registers 5

    .line 10
    if-eqz p1, :cond_1c

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    if-eqz v0, :cond_1c

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p0

    const-string v0, "nicoid_retained_start_token"

    const-wide/16 v1, -0x1

    invoke-virtual {p0, v0, v1, v2}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v0

    iget-wide p0, p1, Le/e/a/DirectBootstrap238$Pending;->token:J

    cmp-long p0, v0, p0

    if-nez p0, :cond_1c

    const/4 p0, 0x1

    return p0

    :cond_1c
    const/4 p0, 0x0

    return p0
.end method

.method public static prepare(Landroid/app/Activity;)V
    .registers 4

    .line 12
    sget-object v0, Le/e/a/DirectBootstrap238;->pending:Le/e/a/DirectBootstrap238$Pending;

    invoke-static {p0, v0}, Le/e/a/DirectBootstrap238;->matches(Landroid/app/Activity;Le/e/a/DirectBootstrap238$Pending;)Z

    move-result v1

    if-nez v1, :cond_9

    return-void

    :cond_9
    iput-object p0, v0, Le/e/a/DirectBootstrap238$Pending;->source:Landroid/app/Activity;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/app/Activity;->setVisible(Z)V

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v1

    const/4 v2, 0x0

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->alpha:F

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->dimAmount:F

    invoke-virtual {p0, v1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v1, v0}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {p0, v1}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0, v0}, Landroid/view/Window;->setWindowAnimations(I)V

    const-string p0, "Retained background window hidden before creation"

    invoke-static {p0}, Le/e/a/ModernDebug;->record(Ljava/lang/String;)V

    return-void
.end method

.method static reveal(Landroid/app/Activity;)V
    .registers 3

    .line 15
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    const/high16 v1, 0x3f800000    # 1.0f

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->alpha:F

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/app/Activity;->setVisible(Z)V

    return-void
.end method

.method public static start(Landroid/app/Activity;Landroid/content/Intent;)Z
    .registers 10

    .line 8
    invoke-static {p1}, Le/e/a/DirectBootstrap238;->id(Landroid/content/Intent;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_8

    return v1

    :cond_8
    const/4 v2, 0x1

    :try_start_9
    sget-object v3, Le/e/a/DirectBootstrap238;->pending:Le/e/a/DirectBootstrap238$Pending;

    if-eqz v3, :cond_12

    sget-object v3, Le/e/a/DirectBootstrap238;->pending:Le/e/a/DirectBootstrap238$Pending;

    invoke-static {v3, v2}, Le/e/a/DirectBootstrap238;->cancel(Le/e/a/DirectBootstrap238$Pending;Z)V

    :cond_12
    sget-object v3, Le/e/a/DirectBackground235;->active:Le/e/a/DirectBackground235$State;

    if-eqz v3, :cond_1b

    sget-object v3, Le/e/a/DirectBackground235;->active:Le/e/a/DirectBackground235$State;

    invoke-virtual {v3, v2}, Le/e/a/DirectBackground235$State;->close(Z)V

    :cond_1b
    invoke-static {}, Le/e/a/MiniSession225;->closeCurrent()V

    invoke-static {p0}, Le/e/a/MiniSession225;->track(Landroid/app/Activity;)V

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v3

    invoke-static {v3}, Le/e/a/DirectBootstrap238;->track(Landroid/app/Application;)V

    new-instance v3, Le/e/a/DirectBootstrap238$Pending;

    sget-wide v4, Le/e/a/DirectBootstrap238;->sequence:J

    const-wide/16 v6, 0x1

    add-long/2addr v4, v6

    sput-wide v4, Le/e/a/DirectBootstrap238;->sequence:J

    invoke-direct {v3, v4, v5, p0}, Le/e/a/DirectBootstrap238$Pending;-><init>(JLandroid/app/Activity;)V

    sput-object v3, Le/e/a/DirectBootstrap238;->pending:Le/e/a/DirectBootstrap238$Pending;

    new-instance v4, Landroid/content/Intent;

    invoke-direct {v4, p1}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    const-string p1, "com.sauzask.nicoid.NicoidVideoActivity"

    invoke-virtual {v4, p0, p1}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    const-string v4, "android.intent.action.VIEW"

    invoke-virtual {p1, v4}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "https://www.nicovideo.jp/watch/"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {p1, v4}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    move-result-object p1

    const-string v4, "url"

    invoke-virtual {p1, v4, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    const-string v0, "intentselect"

    invoke-virtual {p1, v0, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object p1

    const-string v0, "nicoid_retained_start_token"

    iget-wide v4, v3, Le/e/a/DirectBootstrap238$Pending;->token:J

    invoke-virtual {p1, v0, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    move-result-object p1

    const-string v0, "isBackgroundPlay"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    const-string v0, "nicoid_playback_transfer"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    const/high16 v0, 0x50000

    invoke-virtual {p1, v0}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    invoke-virtual {p0, p1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    invoke-virtual {p0, v1, v1}, Landroid/app/Activity;->overridePendingTransition(II)V

    sget-object p0, Le/e/a/DirectBootstrap238;->MAIN:Landroid/os/Handler;

    iget-object p1, v3, Le/e/a/DirectBootstrap238$Pending;->timeout:Ljava/lang/Runnable;

    const-wide/16 v3, 0x7530

    invoke-virtual {p0, p1, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    const-string p0, "Direct background entry uses retained normal player"

    invoke-static {p0}, Le/e/a/ModernDebug;->record(Ljava/lang/String;)V
    :try_end_95
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_95} :catch_96

    return v2

    :catch_96
    move-exception p0

    sget-object p1, Le/e/a/DirectBootstrap238;->pending:Le/e/a/DirectBootstrap238$Pending;

    if-eqz p1, :cond_a0

    sget-object p1, Le/e/a/DirectBootstrap238;->pending:Le/e/a/DirectBootstrap238$Pending;

    invoke-static {p1, v2}, Le/e/a/DirectBootstrap238;->cancel(Le/e/a/DirectBootstrap238$Pending;Z)V

    :cond_a0
    const-string p1, "Cannot initialize retained background player"

    invoke-static {p1, p0}, Le/e/a/MiniSession225;->log(Ljava/lang/String;Ljava/lang/Exception;)V

    return v1
.end method

.method static track(Landroid/app/Application;)V
    .registers 3

    .line 9
    sget-object v0, Le/e/a/DirectBootstrap238;->app:Landroid/app/Application;

    if-ne v0, p0, :cond_5

    return-void

    :cond_5
    sget-object v0, Le/e/a/DirectBootstrap238;->app:Landroid/app/Application;

    if-eqz v0, :cond_10

    sget-object v0, Le/e/a/DirectBootstrap238;->app:Landroid/app/Application;

    sget-object v1, Le/e/a/DirectBootstrap238;->LIFECYCLE:Landroid/app/Application$ActivityLifecycleCallbacks;

    invoke-virtual {v0, v1}, Landroid/app/Application;->unregisterActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    :cond_10
    sput-object p0, Le/e/a/DirectBootstrap238;->app:Landroid/app/Application;

    sget-object p0, Le/e/a/DirectBootstrap238;->app:Landroid/app/Application;

    sget-object v0, Le/e/a/DirectBootstrap238;->LIFECYCLE:Landroid/app/Application$ActivityLifecycleCallbacks;

    invoke-virtual {p0, v0}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    return-void
.end method
