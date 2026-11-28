.class public final Le/e/a/DirectBackground235;
.super Ljava/lang/Object;
.source "DirectBackground235.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/DirectBackground235$State;
    }
.end annotation


# static fields
.field static final LIFECYCLE:Landroid/app/Application$ActivityLifecycleCallbacks;

.field static final MAIN:Landroid/os/Handler;

.field static final TOKEN:Ljava/lang/String; = "nicoid_direct_mini_token"

.field static active:Le/e/a/DirectBackground235$State;

.field static app:Landroid/app/Application;

.field static serial:J


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 5
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Le/e/a/DirectBackground235;->MAIN:Landroid/os/Handler;

    .line 25
    new-instance v0, Le/e/a/DirectBackground235$1;

    invoke-direct {v0}, Le/e/a/DirectBackground235$1;-><init>()V

    sput-object v0, Le/e/a/DirectBackground235;->LIFECYCLE:Landroid/app/Application$ActivityLifecycleCallbacks;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static adoptPopup(Ljava/lang/Object;Landroid/view/View;)V
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 13
    const-string v0, "b"

    const-string v1, "p0"

    check-cast p0, Landroid/app/Service;

    sget-object v2, Le/e/a/TabRoutes228;->foreground:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/Activity;

    if-eqz v2, :cond_3

    invoke-virtual {v2}, Landroid/app/Activity;->isFinishing()Z

    move-result v3

    if-nez v3, :cond_3

    invoke-virtual {v2}, Landroid/app/Activity;->isDestroyed()Z

    move-result v3

    if-nez v3, :cond_3

    invoke-static {v2}, Le/e/a/PlaybackBar221;->player(Landroid/app/Activity;)Z

    move-result v3

    if-nez v3, :cond_3

    sget-object v3, Le/e/a/DirectBackground235;->active:Le/e/a/DirectBackground235$State;

    if-nez v3, :cond_2

    const-string v3, "e"

    invoke-static {p0, v3}, Le/e/a/DirectBackground235;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    if-eqz v3, :cond_1

    invoke-static {v3}, Le/e/a/MiniSession225;->texture(Landroid/view/View;)Landroid/view/TextureView;

    move-result-object v3

    if-eqz v3, :cond_1

    invoke-static {v2}, Le/e/a/DirectBackground235;->track(Landroid/app/Activity;)V

    invoke-static {}, Le/e/a/MiniSession225;->closeCurrent()V

    new-instance v3, Le/e/a/DirectBackground235$State;

    sget-wide v4, Le/e/a/DirectBackground235;->serial:J

    const-wide/16 v6, 0x1

    add-long/2addr v4, v6

    sput-wide v4, Le/e/a/DirectBackground235;->serial:J

    const-string v6, "M"

    invoke-static {p0, v6}, Le/e/a/DirectBackground235;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v3, v4, v5, v6}, Le/e/a/DirectBackground235$State;-><init>(JLjava/lang/String;)V

    iput-object p0, v3, Le/e/a/DirectBackground235$State;->service:Landroid/app/Service;

    new-instance v4, Ljava/lang/ref/WeakReference;

    invoke-direct {v4, v2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v4, v3, Le/e/a/DirectBackground235$State;->foreground:Ljava/lang/ref/WeakReference;

    sput-object v3, Le/e/a/DirectBackground235;->active:Le/e/a/DirectBackground235$State;

    const/4 v2, 0x0

    :try_start_0
    invoke-static {p1}, Le/e/a/CommentTransfer245;->stop(Landroid/view/View;)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    const/4 v5, 0x1

    invoke-virtual {v4, v2, v5}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V

    invoke-static {p0}, Le/e/a/DirectBackground235;->prepared(Ljava/lang/Object;)V

    iget-object v4, v3, Le/e/a/DirectBackground235$State;->video:Landroid/view/View;

    if-eqz v4, :cond_0

    iget-object v4, v3, Le/e/a/DirectBackground235$State;->panel:Landroid/widget/FrameLayout;

    if-eqz v4, :cond_0

    invoke-static {p0, v0}, Le/e/a/DirectBackground235;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/view/WindowManager;

    invoke-interface {v4, p1}, Landroid/view/WindowManager;->removeViewImmediate(Landroid/view/View;)V

    sget-object p1, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    filled-new-array {p1}, [Ljava/lang/Class;

    move-result-object p1

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v4

    invoke-static {p0, v0, p1, v4}, Le/e/a/DirectBackground235;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {}, Le/e/a/PlaybackBar221;->refresh()V

    invoke-static {}, Le/e/a/PopupSwitch216;->cancelPending236()V

    const-string p1, "Popup moved to retained mini presentation"

    invoke-static {p1}, Le/e/a/ModernDebug;->record(Ljava/lang/String;)V

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Mini output not attached"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception p1

    const/4 v0, 0x0

    invoke-virtual {v3, v0}, Le/e/a/DirectBackground235$State;->close(Z)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p0

    invoke-virtual {p0, v2, v0}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V

    throw p1

    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "Popup output unavailable"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_2
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "Mini player already active"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_3
    invoke-static {p0, p1}, Le/e/a/DirectBackground235;->adoptWithoutHost236(Landroid/app/Service;Landroid/view/View;)V

    return-void
.end method

.method private static adoptWithoutHost236(Landroid/app/Service;Landroid/view/View;)V
    .registers 9

    check-cast p0, Lcom/sauzask/nicoid/NicoidPopupViewService;

    sget-object v0, Le/e/a/DirectBackground235;->active:Le/e/a/DirectBackground235$State;

    if-nez v0, :cond_2

    sget-boolean v0, Lcom/sauzask/nicoid/NicoidPopupViewService;->p0:Z

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->e:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    if-eqz v0, :cond_2

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->b:Landroid/view/WindowManager;

    if-eqz v1, :cond_2

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->a:Landroid/view/View;

    if-ne v2, p1, :cond_2

    invoke-virtual {p1}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-static {v0}, Le/e/a/MiniSession225;->texture(Landroid/view/View;)Landroid/view/TextureView;

    move-result-object v2

    if-eqz v2, :cond_2

    invoke-static {p0}, Le/e/a/Media3PlaybackHandoff;->owns(Landroid/app/Service;)Z

    move-result v2

    if-eqz v2, :cond_2

    iget-boolean v3, v0, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->releaseOnDetachFromWindow:Z

    const/4 v4, 0x0

    const/4 v5, 0x1

    const/4 v2, 0x0

    :try_start_0
    sput-boolean v5, Lcom/sauzask/nicoid/NicoidPopupViewService;->p0:Z

    invoke-static {p0, v4}, Le/e/a/DirectBackground235;->recover(Ljava/lang/Object;Landroid/app/Activity;)Le/e/a/DirectBackground235$State;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-static {p0}, Le/e/a/DirectBackground235;->prepared(Ljava/lang/Object;)V

    iget-object v6, v2, Le/e/a/DirectBackground235$State;->video:Landroid/view/View;

    if-ne v6, v0, :cond_0

    iget-object v6, v2, Le/e/a/DirectBackground235$State;->keeper:Le/e/a/MiniSession225$SurfaceKeeper;

    if-eqz v6, :cond_0

    sget-object v6, Le/e/a/DirectBackground235;->active:Le/e/a/DirectBackground235$State;

    if-ne v6, v2, :cond_0

    invoke-virtual {v0, v4}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->setReleaseOnDetachFromWindow(Z)V

    invoke-virtual {p0, v5}, Lcom/sauzask/nicoid/NicoidPopupViewService;->b(Z)V

    invoke-interface {v1, p1}, Landroid/view/WindowManager;->removeViewImmediate(Landroid/view/View;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    invoke-static {}, Le/e/a/PopupSwitch216;->cancelPending236()V

    :try_start_1
    invoke-static {v2}, Le/e/a/VideoMiniPlayer;->leaveDirectHost(Le/e/a/DirectBackground235$State;)V

    invoke-static {p1}, Le/e/a/CommentTransfer245;->stop(Landroid/view/View;)V

    invoke-static {}, Le/e/a/PlaybackBar221;->refresh()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    :goto_0
    const-string v0, "nicoid-popup"

    const-string v1, "Popup moved to background without Activity host; retained service/player"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :catch_0
    move-exception v0

    const-string v1, "nicoid-popup"

    const-string v2, "Background committed; presentation cleanup failed"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    :cond_0
    new-instance v6, Ljava/lang/IllegalStateException;

    const-string v5, "Retained background preparation failed"

    invoke-direct {v6, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    goto :goto_1

    :catch_1
    move-exception v6

    :goto_1
    sput-boolean v4, Lcom/sauzask/nicoid/NicoidPopupViewService;->p0:Z

    :try_start_2
    if-eqz v2, :cond_1

    invoke-virtual {v2, v4}, Le/e/a/DirectBackground235$State;->close(Z)V

    :cond_1
    invoke-virtual {v0, v3}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->setReleaseOnDetachFromWindow(Z)V

    invoke-virtual {p0, v4}, Lcom/sauzask/nicoid/NicoidPopupViewService;->b(Z)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    throw v6

    :catch_2
    move-exception v0

    const-string v1, "nicoid-popup"

    const-string v2, "Background rollback cleanup failed"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    throw v6

    :cond_2
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Popup cannot be retained without host"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method static background(Ljava/lang/Object;)Z
    .registers 3

    .line 7
    const/4 v0, 0x0

    :try_start_0
    instance-of v1, p0, Landroid/app/Service;

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    const-string v1, "p0"

    invoke-virtual {p0, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p0

    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    return v0

    :catch_0
    move-exception p0

    return v0
.end method

.method public static begin(Ljava/lang/Object;Landroid/content/Intent;)V
    .registers 9

    .line 14
    sget-object v0, Le/e/a/DirectBackground235;->active:Le/e/a/DirectBackground235$State;

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz p1, :cond_1

    const-string v3, "nicoid_direct_mini_token"

    invoke-virtual {p1, v3}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    const-wide/16 v4, -0x1

    invoke-virtual {p1, v3, v4, v5}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v3

    iget-wide v5, v0, Le/e/a/DirectBackground235$State;->token:J

    cmp-long v3, v3, v5

    if-nez v3, :cond_1

    move v3, v1

    goto :goto_0

    :cond_1
    move v3, v2

    .line 15
    :goto_0
    iget-object v4, v0, Le/e/a/DirectBackground235$State;->service:Landroid/app/Service;

    if-ne v4, p0, :cond_2

    if-eqz p1, :cond_2

    const-string v4, "MediaButtonCode"

    invoke-virtual {p1, v4}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    return-void

    .line 16
    :cond_2
    if-nez v3, :cond_4

    iget-object v3, v0, Le/e/a/DirectBackground235$State;->service:Landroid/app/Service;

    if-ne v3, p0, :cond_3

    if-eqz p1, :cond_3

    const-string v3, "isBackgroundPlay"

    invoke-virtual {p1, v3, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p1

    if-eqz p1, :cond_3

    goto :goto_1

    .line 17
    :cond_3
    iget-object p1, v0, Le/e/a/DirectBackground235$State;->service:Landroid/app/Service;

    if-ne p1, p0, :cond_6

    invoke-virtual {v0, v2}, Le/e/a/DirectBackground235$State;->close(Z)V

    goto :goto_2

    .line 16
    :cond_4
    :goto_1
    iput-boolean v1, v0, Le/e/a/DirectBackground235$State;->restarting:Z

    invoke-virtual {v0}, Le/e/a/DirectBackground235$State;->detach()V

    invoke-virtual {v0}, Le/e/a/DirectBackground235$State;->restoreControls()V

    invoke-virtual {v0}, Le/e/a/DirectBackground235$State;->returnVideo()V

    iget-object p1, v0, Le/e/a/DirectBackground235$State;->keeper:Le/e/a/MiniSession225$SurfaceKeeper;

    if-eqz p1, :cond_5

    iget-object p1, v0, Le/e/a/DirectBackground235$State;->keeper:Le/e/a/MiniSession225$SurfaceKeeper;

    invoke-virtual {p1}, Le/e/a/MiniSession225$SurfaceKeeper;->close()V

    :cond_5
    const/4 p1, 0x0

    iput-object p1, v0, Le/e/a/DirectBackground235$State;->keeper:Le/e/a/MiniSession225$SurfaceKeeper;

    iput-object p1, v0, Le/e/a/DirectBackground235$State;->texture:Landroid/view/TextureView;

    iput-object p1, v0, Le/e/a/DirectBackground235$State;->video:Landroid/view/View;

    iput-object p1, v0, Le/e/a/DirectBackground235$State;->original:Landroid/view/ViewGroup;

    check-cast p0, Landroid/app/Service;

    iput-object p0, v0, Le/e/a/DirectBackground235$State;->service:Landroid/app/Service;

    const-string p0, "nicoid-mini"

    const-string p1, "Direct session bound to Service"

    invoke-static {p0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 18
    :cond_6
    :goto_2
    return-void
.end method

.method static varargs call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4
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

    .line 6
    invoke-static {p0, p1, p2, p3}, Le/e/a/MiniSession225;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static created(Ljava/lang/Object;Landroid/content/Intent;)V
    .registers 7

    .line 19
    sget-object v0, Le/e/a/DirectBackground235;->active:Le/e/a/DirectBackground235$State;

    if-eqz p1, :cond_2

    const-string v1, "nicoid_direct_mini_token"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    if-eqz v0, :cond_1

    const-wide/16 v2, -0x1

    invoke-virtual {p1, v1, v2, v3}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v1

    iget-wide v3, v0, Le/e/a/DirectBackground235$State;->token:J

    cmp-long p1, v1, v3

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    move-object p1, p0

    check-cast p1, Landroid/app/Service;

    iput-object p1, v0, Le/e/a/DirectBackground235$State;->service:Landroid/app/Service;

    goto :goto_1

    :cond_1
    :goto_0
    check-cast p0, Landroid/app/Service;

    invoke-virtual {p0}, Landroid/app/Service;->stopSelf()V

    return-void

    :cond_2
    :goto_1
    if-eqz v0, :cond_3

    iget-object p1, v0, Le/e/a/DirectBackground235$State;->service:Landroid/app/Service;

    if-ne p1, p0, :cond_3

    const/4 p0, 0x0

    iput-boolean p0, v0, Le/e/a/DirectBackground235$State;->restarting:Z

    invoke-virtual {v0}, Le/e/a/DirectBackground235$State;->poll()V

    :cond_3
    return-void
.end method

.method public static destroyed(Ljava/lang/Object;)V
    .registers 3

    .line 23
    sget-object v0, Le/e/a/DirectBackground235;->active:Le/e/a/DirectBackground235$State;

    if-eqz v0, :cond_0

    iget-object v1, v0, Le/e/a/DirectBackground235$State;->service:Landroid/app/Service;

    if-ne v1, p0, :cond_0

    iget-boolean v1, v0, Le/e/a/DirectBackground235$State;->restarting:Z

    if-nez v1, :cond_0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Le/e/a/DirectBackground235$State;->close(Z)V

    :cond_0
    invoke-static {p0}, Le/e/a/PopupFrame233;->clear(Ljava/lang/Object;)V

    invoke-static {p0}, Le/e/a/PopupResize236;->cancel(Ljava/lang/Object;)V

    return-void
.end method

.method static get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 6
    invoke-static {p0, p1}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static owns(Ljava/lang/Object;)Z
    .registers 2

    .line 10
    sget-object v0, Le/e/a/DirectBackground235;->active:Le/e/a/DirectBackground235$State;

    if-eqz v0, :cond_0

    sget-object v0, Le/e/a/DirectBackground235;->active:Le/e/a/DirectBackground235$State;

    iget-object v0, v0, Le/e/a/DirectBackground235$State;->service:Landroid/app/Service;

    if-ne v0, p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static prepared(Ljava/lang/Object;)V
    .registers 7

    .line 20
    const-string v0, "nicoid-mini"

    sget-object v1, Le/e/a/DirectBackground235;->active:Le/e/a/DirectBackground235$State;

    if-nez v1, :cond_0

    sget-object v1, Le/e/a/TabRoutes228;->foreground:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/Activity;

    invoke-static {p0, v1}, Le/e/a/DirectBackground235;->recover(Ljava/lang/Object;Landroid/app/Activity;)Le/e/a/DirectBackground235$State;

    move-result-object v1

    :cond_0
    if-eqz v1, :cond_a

    iget-object v2, v1, Le/e/a/DirectBackground235$State;->service:Landroid/app/Service;

    if-eq v2, p0, :cond_1

    goto/16 :goto_1

    :cond_1
    const/4 v2, 0x1

    :try_start_0
    const-string v3, "e"

    invoke-static {p0, v3}, Le/e/a/DirectBackground235;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/View;

    if-nez p0, :cond_2

    return-void

    :cond_2
    iget-object v3, v1, Le/e/a/DirectBackground235$State;->video:Landroid/view/View;

    if-eq v3, p0, :cond_6

    invoke-virtual {v1}, Le/e/a/DirectBackground235$State;->detach()V

    invoke-virtual {v1}, Le/e/a/DirectBackground235$State;->restoreControls()V

    invoke-virtual {v1}, Le/e/a/DirectBackground235$State;->returnVideo()V

    iget-object v3, v1, Le/e/a/DirectBackground235$State;->keeper:Le/e/a/MiniSession225$SurfaceKeeper;

    if-eqz v3, :cond_3

    iget-object v3, v1, Le/e/a/DirectBackground235$State;->keeper:Le/e/a/MiniSession225$SurfaceKeeper;

    invoke-virtual {v3}, Le/e/a/MiniSession225$SurfaceKeeper;->close()V

    :cond_3
    iput-object p0, v1, Le/e/a/DirectBackground235$State;->video:Landroid/view/View;

    const-string v3, "setReleaseOnDetachFromWindow"

    sget-object v4, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    filled-new-array {v4}, [Ljava/lang/Class;

    move-result-object v4

    const/4 v5, 0x0

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    filled-new-array {v5}, [Ljava/lang/Object;

    move-result-object v5

    invoke-static {p0, v3, v4, v5}, Le/e/a/DirectBackground235;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {p0}, Le/e/a/MiniSession225;->texture(Landroid/view/View;)Landroid/view/TextureView;

    move-result-object v3

    iput-object v3, v1, Le/e/a/DirectBackground235$State;->texture:Landroid/view/TextureView;

    iget-object v3, v1, Le/e/a/DirectBackground235$State;->texture:Landroid/view/TextureView;

    if-eqz v3, :cond_4

    invoke-static {p0, v3}, Le/e/a/Dev139;->rememberOutput(Landroid/view/View;Landroid/view/TextureView;)V

    new-instance v3, Le/e/a/MiniSession225$SurfaceKeeper;

    iget-object v4, v1, Le/e/a/DirectBackground235$State;->texture:Landroid/view/TextureView;

    invoke-direct {v3, v4}, Le/e/a/MiniSession225$SurfaceKeeper;-><init>(Landroid/view/TextureView;)V

    iput-object v3, v1, Le/e/a/DirectBackground235$State;->keeper:Le/e/a/MiniSession225$SurfaceKeeper;

    :cond_4
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    instance-of v3, v3, Landroid/view/ViewGroup;

    if-eqz v3, :cond_5

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    check-cast v3, Landroid/view/ViewGroup;

    iput-object v3, v1, Le/e/a/DirectBackground235$State;->original:Landroid/view/ViewGroup;

    iget-object v3, v1, Le/e/a/DirectBackground235$State;->original:Landroid/view/ViewGroup;

    invoke-virtual {v3, p0}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result v3

    iput v3, v1, Le/e/a/DirectBackground235$State;->index:I

    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p0

    iput-object p0, v1, Le/e/a/DirectBackground235$State;->params:Landroid/view/ViewGroup$LayoutParams;

    :cond_5
    const-string p0, "Direct player attached to mini session"

    invoke-static {v0, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    :cond_6
    sget-object p0, Le/e/a/DirectBackground235;->MAIN:Landroid/os/Handler;

    iget-object v3, v1, Le/e/a/DirectBackground235$State;->timeout:Ljava/lang/Runnable;

    invoke-virtual {p0, v3}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-object p0, v1, Le/e/a/DirectBackground235$State;->foreground:Ljava/lang/ref/WeakReference;

    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/Activity;

    if-eqz p0, :cond_7

    invoke-static {p0}, Le/e/a/PlaybackBar221;->player(Landroid/app/Activity;)Z

    move-result v3

    if-nez v3, :cond_7

    invoke-static {p0}, Le/e/a/AppResume253;->deferMiniOnReturn(Landroid/app/Activity;)Z

    move-result v3

    if-nez v3, :cond_7

    invoke-virtual {v1, p0}, Le/e/a/DirectBackground235$State;->attach(Landroid/app/Activity;)V

    :cond_7
    iget-object p0, v1, Le/e/a/DirectBackground235$State;->host:Landroid/app/Activity;

    if-eqz p0, :cond_8

    iget-object p0, v1, Le/e/a/DirectBackground235$State;->keeper:Le/e/a/MiniSession225$SurfaceKeeper;

    if-eqz p0, :cond_8

    iget-object p0, v1, Le/e/a/DirectBackground235$State;->keeper:Le/e/a/MiniSession225$SurfaceKeeper;

    iget-object v3, v1, Le/e/a/DirectBackground235$State;->video:Landroid/view/View;

    invoke-virtual {p0, v3}, Le/e/a/MiniSession225$SurfaceKeeper;->output(Landroid/view/View;)V

    :cond_8
    iget-boolean p0, v1, Le/e/a/DirectBackground235$State;->wantsExpand:Z

    if-eqz p0, :cond_9

    invoke-virtual {v1}, Le/e/a/DirectBackground235$State;->ready()Z

    move-result p0

    if-eqz p0, :cond_9

    invoke-virtual {v1, v2}, Le/e/a/DirectBackground235$State;->settle(Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    goto :goto_0

    :catch_0
    move-exception p0

    const-string v3, "Cannot attach service player"

    invoke-static {v0, v3, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    invoke-virtual {v1, v2}, Le/e/a/DirectBackground235$State;->close(Z)V

    :cond_9
    :goto_0
    return-void

    .line 20
    :cond_a
    :goto_1
    return-void
.end method

.method static recover(Ljava/lang/Object;Landroid/app/Activity;)Le/e/a/DirectBackground235$State;
    .registers 8

    .line 8
    sget-object v0, Le/e/a/DirectBackground235;->active:Le/e/a/DirectBackground235$State;

    if-eqz v0, :cond_0

    sget-object p0, Le/e/a/DirectBackground235;->active:Le/e/a/DirectBackground235$State;

    return-object p0

    :cond_0
    invoke-static {p0}, Le/e/a/VideoMiniPlayer;->isAudioOnly(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    return-object v0

    :cond_1
    invoke-static {p0}, Le/e/a/DirectBackground235;->background(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_2

    return-object v1

    :cond_2
    :try_start_0
    check-cast p0, Landroid/app/Service;

    const-string v0, "e"

    invoke-static {p0, v0}, Le/e/a/DirectBackground235;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_3

    return-object v1

    :cond_3
    invoke-virtual {p0}, Landroid/app/Service;->getApplication()Landroid/app/Application;

    move-result-object v0

    sget-object v2, Le/e/a/DirectBackground235;->app:Landroid/app/Application;

    if-eq v2, v0, :cond_5

    sget-object v2, Le/e/a/DirectBackground235;->app:Landroid/app/Application;

    if-eqz v2, :cond_4

    sget-object v2, Le/e/a/DirectBackground235;->app:Landroid/app/Application;

    sget-object v3, Le/e/a/DirectBackground235;->LIFECYCLE:Landroid/app/Application$ActivityLifecycleCallbacks;

    invoke-virtual {v2, v3}, Landroid/app/Application;->unregisterActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    :cond_4
    sput-object v0, Le/e/a/DirectBackground235;->app:Landroid/app/Application;

    sget-object v0, Le/e/a/DirectBackground235;->app:Landroid/app/Application;

    sget-object v2, Le/e/a/DirectBackground235;->LIFECYCLE:Landroid/app/Application$ActivityLifecycleCallbacks;

    invoke-virtual {v0, v2}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    :cond_5
    new-instance v0, Le/e/a/DirectBackground235$State;

    sget-wide v2, Le/e/a/DirectBackground235;->serial:J

    const-wide/16 v4, 0x1

    add-long/2addr v2, v4

    sput-wide v2, Le/e/a/DirectBackground235;->serial:J

    const-string v4, "M"

    invoke-static {p0, v4}, Le/e/a/DirectBackground235;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v2, v3, v4}, Le/e/a/DirectBackground235$State;-><init>(JLjava/lang/String;)V

    iput-object p0, v0, Le/e/a/DirectBackground235$State;->service:Landroid/app/Service;

    if-eqz p1, :cond_6

    invoke-static {p1}, Le/e/a/PlaybackBar221;->player(Landroid/app/Activity;)Z

    move-result p0

    if-nez p0, :cond_6

    new-instance p0, Ljava/lang/ref/WeakReference;

    invoke-direct {p0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p0, v0, Le/e/a/DirectBackground235$State;->foreground:Ljava/lang/ref/WeakReference;

    :cond_6
    sput-object v0, Le/e/a/DirectBackground235;->active:Le/e/a/DirectBackground235$State;

    const-string p0, "Background presentation recovered using the existing Service player"

    invoke-static {p0}, Le/e/a/ModernDebug;->record(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception p0

    const-string p1, "nicoid-mini"

    const-string v0, "Cannot recover background presentation"

    invoke-static {p1, v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-object v1
.end method

.method public static refresh()V
    .registers 3

    .line 9
    sget-object v0, Le/e/a/DirectBackground235;->active:Le/e/a/DirectBackground235$State;

    if-eqz v0, :cond_0

    return-void

    :cond_0
    :try_start_0
    sget-object v0, Le/e/a/TabRoutes228;->foreground:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-eqz v0, :cond_3

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v1

    if-nez v1, :cond_3

    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v1

    if-nez v1, :cond_3

    invoke-static {v0}, Le/e/a/PlaybackBar221;->player(Landroid/app/Activity;)Z

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_1

    :cond_1
    invoke-static {}, Le/e/a/PlaybackBar221;->media()Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_2

    const/4 v1, 0x0

    goto :goto_0

    :cond_2
    const-string v2, "owner"

    invoke-static {v1, v2}, Le/e/a/DirectBackground235;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    :goto_0
    invoke-static {v1, v0}, Le/e/a/DirectBackground235;->recover(Ljava/lang/Object;Landroid/app/Activity;)Le/e/a/DirectBackground235$State;

    move-result-object v0

    if-eqz v0, :cond_4

    invoke-static {v1}, Le/e/a/DirectBackground235;->prepared(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :cond_3
    :goto_1
    return-void

    :catch_0
    move-exception v0

    const-string v1, "nicoid-mini"

    const-string v2, "Cannot restore background controls"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_4
    :goto_2
    return-void
.end method

.method public static showing()Z
    .registers 1

    .line 10
    sget-object v0, Le/e/a/DirectBackground235;->active:Le/e/a/DirectBackground235$State;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public static start(Landroid/app/Activity;Landroid/content/Intent;)Z
    .registers 9

    .line 12
    const-string v0, "tickerText"

    const/4 v1, 0x1

    :try_start_0
    invoke-static {p0}, Le/e/a/DirectBackground235;->track(Landroid/app/Activity;)V

    sget-object v2, Le/e/a/DirectBackground235;->active:Le/e/a/DirectBackground235$State;

    if-eqz v2, :cond_0

    sget-object v2, Le/e/a/DirectBackground235;->active:Le/e/a/DirectBackground235$State;

    invoke-virtual {v2, v1}, Le/e/a/DirectBackground235$State;->close(Z)V

    :cond_0
    new-instance v2, Le/e/a/DirectBackground235$State;

    sget-wide v3, Le/e/a/DirectBackground235;->serial:J

    const-wide/16 v5, 0x1

    add-long/2addr v3, v5

    sput-wide v3, Le/e/a/DirectBackground235;->serial:J

    const-string v5, "title"

    invoke-virtual {p1, v5}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v2, v3, v4, v5}, Le/e/a/DirectBackground235$State;-><init>(JLjava/lang/String;)V

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_1

    iget-object v0, v2, Le/e/a/DirectBackground235$State;->title:Ljava/lang/String;

    goto :goto_0

    :cond_1
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    iput-object v0, v2, Le/e/a/DirectBackground235$State;->title:Ljava/lang/String;

    const-string v0, "infodata"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getBundleExtra(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    iput-object v0, v2, Le/e/a/DirectBackground235$State;->info:Landroid/os/Bundle;

    sput-object v2, Le/e/a/DirectBackground235;->active:Le/e/a/DirectBackground235$State;

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, v2, Le/e/a/DirectBackground235$State;->foreground:Ljava/lang/ref/WeakReference;

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0, p1}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    const-string p1, "com.sauzask.nicoid.NicoidPopupViewService"

    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    const-string v0, "nicoid_direct_mini_token"

    iget-wide v3, v2, Le/e/a/DirectBackground235$State;->token:J

    invoke-virtual {p1, v0, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    move-result-object p1

    const-string v0, "isBackgroundPlay"

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object p1

    invoke-static {p0, p1}, Le/e/a/CacheFolders;->startForegroundService(Landroid/content/Context;Landroid/content/Intent;)Landroid/content/ComponentName;

    invoke-virtual {v2, p0}, Le/e/a/DirectBackground235$State;->attach(Landroid/app/Activity;)V

    invoke-static {}, Le/e/a/MiniSession225;->closeCurrent()V

    sget-object p0, Le/e/a/DirectBackground235;->MAIN:Landroid/os/Handler;

    iget-object p1, v2, Le/e/a/DirectBackground235$State;->timeout:Ljava/lang/Runnable;

    const-wide/16 v2, 0x7530

    invoke-virtual {p0, p1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return v1

    :catch_0
    move-exception p0

    sget-object p1, Le/e/a/DirectBackground235;->active:Le/e/a/DirectBackground235$State;

    if-eqz p1, :cond_2

    sget-object p1, Le/e/a/DirectBackground235;->active:Le/e/a/DirectBackground235$State;

    invoke-virtual {p1, v1}, Le/e/a/DirectBackground235$State;->close(Z)V

    :cond_2
    const-string p1, "nicoid-mini"

    const-string v0, "Direct background entry failed"

    invoke-static {p1, v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    const/4 p0, 0x0

    return p0
.end method

.method public static terminated(Ljava/lang/Object;)V
    .registers 3

    .line 24
    sget-object v0, Le/e/a/DirectBackground235;->active:Le/e/a/DirectBackground235$State;

    if-eqz v0, :cond_0

    iget-object v1, v0, Le/e/a/DirectBackground235$State;->service:Landroid/app/Service;

    if-ne v1, p0, :cond_0

    const/4 v1, 0x0

    iput-boolean v1, v0, Le/e/a/DirectBackground235$State;->restarting:Z

    invoke-virtual {v0, v1}, Le/e/a/DirectBackground235$State;->close(Z)V

    :cond_0
    invoke-static {p0}, Le/e/a/PopupFrame233;->clear(Ljava/lang/Object;)V

    invoke-static {p0}, Le/e/a/PopupResize236;->cancel(Ljava/lang/Object;)V

    return-void
.end method

.method static track(Landroid/app/Activity;)V
    .registers 3

    .line 11
    sget-object v0, Le/e/a/DirectBackground235;->app:Landroid/app/Application;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v1

    if-ne v0, v1, :cond_0

    return-void

    :cond_0
    sget-object v0, Le/e/a/DirectBackground235;->app:Landroid/app/Application;

    if-eqz v0, :cond_1

    sget-object v0, Le/e/a/DirectBackground235;->app:Landroid/app/Application;

    sget-object v1, Le/e/a/DirectBackground235;->LIFECYCLE:Landroid/app/Application$ActivityLifecycleCallbacks;

    invoke-virtual {v0, v1}, Landroid/app/Application;->unregisterActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    :cond_1
    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p0

    sput-object p0, Le/e/a/DirectBackground235;->app:Landroid/app/Application;

    sget-object p0, Le/e/a/DirectBackground235;->app:Landroid/app/Application;

    sget-object v0, Le/e/a/DirectBackground235;->LIFECYCLE:Landroid/app/Application$ActivityLifecycleCallbacks;

    invoke-virtual {p0, v0}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    return-void
.end method
