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

    if-eqz v2, :cond_c4

    invoke-virtual {v2}, Landroid/app/Activity;->isFinishing()Z

    move-result v3

    if-nez v3, :cond_c4

    invoke-virtual {v2}, Landroid/app/Activity;->isDestroyed()Z

    move-result v3

    if-nez v3, :cond_c4

    invoke-static {v2}, Le/e/a/PlaybackBar221;->player(Landroid/app/Activity;)Z

    move-result v3

    if-nez v3, :cond_c4

    sget-object v3, Le/e/a/DirectBackground235;->active:Le/e/a/DirectBackground235$State;

    if-nez v3, :cond_bc

    const-string v3, "e"

    invoke-static {p0, v3}, Le/e/a/DirectBackground235;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    if-eqz v3, :cond_b4

    invoke-static {v3}, Le/e/a/MiniSession225;->texture(Landroid/view/View;)Landroid/view/TextureView;

    move-result-object v3

    if-eqz v3, :cond_b4

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

    :try_start_5e
    invoke-static {p1}, Le/e/a/CommentTransfer245;->stop(Landroid/view/View;)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    const/4 v5, 0x1

    invoke-virtual {v4, v2, v5}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V

    invoke-static {p0}, Le/e/a/DirectBackground235;->prepared(Ljava/lang/Object;)V

    iget-object v4, v3, Le/e/a/DirectBackground235$State;->video:Landroid/view/View;

    if-eqz v4, :cond_9b

    iget-object v4, v3, Le/e/a/DirectBackground235$State;->panel:Landroid/widget/FrameLayout;

    if-eqz v4, :cond_9b

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

    const-string p1, "Popup moved to retained mini presentation"

    invoke-static {p1}, Le/e/a/ModernDebug;->record(Ljava/lang/String;)V

    return-void

    :cond_9b
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Mini output not attached"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_a3
    .catch Ljava/lang/Exception; {:try_start_5e .. :try_end_a3} :catch_a3

    :catch_a3
    move-exception p1

    const/4 v0, 0x0

    invoke-virtual {v3, v0}, Le/e/a/DirectBackground235$State;->close(Z)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p0

    invoke-virtual {p0, v2, v0}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V

    throw p1

    :cond_b4
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "Popup output unavailable"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_bc
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "Mini player already active"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_c4
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "No app list to host mini player"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static background(Ljava/lang/Object;)Z
    .registers 3

    .line 7
    const/4 v0, 0x0

    :try_start_1
    instance-of v1, p0, Landroid/app/Service;

    if-eqz v1, :cond_18

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    const-string v1, "p0"

    invoke-virtual {p0, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p0

    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result p0
    :try_end_14
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_14} :catch_19

    if-eqz p0, :cond_18

    const/4 p0, 0x1

    return p0

    :cond_18
    return v0

    :catch_19
    move-exception p0

    return v0
.end method

.method public static begin(Ljava/lang/Object;Landroid/content/Intent;)V
    .registers 9

    .line 14
    sget-object v0, Le/e/a/DirectBackground235;->active:Le/e/a/DirectBackground235$State;

    if-nez v0, :cond_5

    return-void

    :cond_5
    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz p1, :cond_1f

    const-string v3, "nicoid_direct_mini_token"

    invoke-virtual {p1, v3}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1f

    const-wide/16 v4, -0x1

    invoke-virtual {p1, v3, v4, v5}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v3

    iget-wide v5, v0, Le/e/a/DirectBackground235$State;->token:J

    cmp-long v3, v3, v5

    if-nez v3, :cond_1f

    move v3, v1

    goto :goto_20

    :cond_1f
    move v3, v2

    .line 15
    :goto_20
    iget-object v4, v0, Le/e/a/DirectBackground235$State;->service:Landroid/app/Service;

    if-ne v4, p0, :cond_2f

    if-eqz p1, :cond_2f

    const-string v4, "MediaButtonCode"

    invoke-virtual {p1, v4}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2f

    return-void

    .line 16
    :cond_2f
    if-nez v3, :cond_48

    iget-object v3, v0, Le/e/a/DirectBackground235$State;->service:Landroid/app/Service;

    if-ne v3, p0, :cond_40

    if-eqz p1, :cond_40

    const-string v3, "isBackgroundPlay"

    invoke-virtual {p1, v3, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p1

    if-eqz p1, :cond_40

    goto :goto_48

    .line 17
    :cond_40
    iget-object p1, v0, Le/e/a/DirectBackground235$State;->service:Landroid/app/Service;

    if-ne p1, p0, :cond_70

    invoke-virtual {v0, v2}, Le/e/a/DirectBackground235$State;->close(Z)V

    goto :goto_70

    .line 16
    :cond_48
    :goto_48
    iput-boolean v1, v0, Le/e/a/DirectBackground235$State;->restarting:Z

    invoke-virtual {v0}, Le/e/a/DirectBackground235$State;->detach()V

    invoke-virtual {v0}, Le/e/a/DirectBackground235$State;->restoreControls()V

    invoke-virtual {v0}, Le/e/a/DirectBackground235$State;->returnVideo()V

    iget-object p1, v0, Le/e/a/DirectBackground235$State;->keeper:Le/e/a/MiniSession225$SurfaceKeeper;

    if-eqz p1, :cond_5c

    iget-object p1, v0, Le/e/a/DirectBackground235$State;->keeper:Le/e/a/MiniSession225$SurfaceKeeper;

    invoke-virtual {p1}, Le/e/a/MiniSession225$SurfaceKeeper;->close()V

    :cond_5c
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
    :cond_70
    :goto_70
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

    if-eqz p1, :cond_27

    const-string v1, "nicoid_direct_mini_token"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_27

    if-eqz v0, :cond_21

    const-wide/16 v2, -0x1

    invoke-virtual {p1, v1, v2, v3}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v1

    iget-wide v3, v0, Le/e/a/DirectBackground235$State;->token:J

    cmp-long p1, v1, v3

    if-eqz p1, :cond_1b

    goto :goto_21

    :cond_1b
    move-object p1, p0

    check-cast p1, Landroid/app/Service;

    iput-object p1, v0, Le/e/a/DirectBackground235$State;->service:Landroid/app/Service;

    goto :goto_27

    :cond_21
    :goto_21
    check-cast p0, Landroid/app/Service;

    invoke-virtual {p0}, Landroid/app/Service;->stopSelf()V

    return-void

    :cond_27
    :goto_27
    if-eqz v0, :cond_33

    iget-object p1, v0, Le/e/a/DirectBackground235$State;->service:Landroid/app/Service;

    if-ne p1, p0, :cond_33

    const/4 p0, 0x0

    iput-boolean p0, v0, Le/e/a/DirectBackground235$State;->restarting:Z

    invoke-virtual {v0}, Le/e/a/DirectBackground235$State;->poll()V

    :cond_33
    return-void
.end method

.method public static destroyed(Ljava/lang/Object;)V
    .registers 3

    .line 23
    sget-object v0, Le/e/a/DirectBackground235;->active:Le/e/a/DirectBackground235$State;

    if-eqz v0, :cond_10

    iget-object v1, v0, Le/e/a/DirectBackground235$State;->service:Landroid/app/Service;

    if-ne v1, p0, :cond_10

    iget-boolean v1, v0, Le/e/a/DirectBackground235$State;->restarting:Z

    if-nez v1, :cond_10

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Le/e/a/DirectBackground235$State;->close(Z)V

    :cond_10
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

    if-eqz v0, :cond_c

    sget-object v0, Le/e/a/DirectBackground235;->active:Le/e/a/DirectBackground235$State;

    iget-object v0, v0, Le/e/a/DirectBackground235$State;->service:Landroid/app/Service;

    if-ne v0, p0, :cond_c

    const/4 p0, 0x1

    return p0

    :cond_c
    const/4 p0, 0x0

    return p0
.end method

.method public static prepared(Ljava/lang/Object;)V
    .registers 7

    .line 20
    const-string v0, "nicoid-mini"

    sget-object v1, Le/e/a/DirectBackground235;->active:Le/e/a/DirectBackground235$State;

    if-nez v1, :cond_12

    sget-object v1, Le/e/a/TabRoutes228;->foreground:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/Activity;

    invoke-static {p0, v1}, Le/e/a/DirectBackground235;->recover(Ljava/lang/Object;Landroid/app/Activity;)Le/e/a/DirectBackground235$State;

    move-result-object v1

    :cond_12
    if-eqz v1, :cond_c9

    iget-object v2, v1, Le/e/a/DirectBackground235$State;->service:Landroid/app/Service;

    if-eq v2, p0, :cond_1a

    goto/16 :goto_c9

    :cond_1a
    const/4 v2, 0x1

    :try_start_1b
    const-string v3, "e"

    invoke-static {p0, v3}, Le/e/a/DirectBackground235;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/View;

    if-nez p0, :cond_26

    return-void

    :cond_26
    iget-object v3, v1, Le/e/a/DirectBackground235$State;->video:Landroid/view/View;

    if-eq v3, p0, :cond_88

    invoke-virtual {v1}, Le/e/a/DirectBackground235$State;->detach()V

    invoke-virtual {v1}, Le/e/a/DirectBackground235$State;->restoreControls()V

    invoke-virtual {v1}, Le/e/a/DirectBackground235$State;->returnVideo()V

    iget-object v3, v1, Le/e/a/DirectBackground235$State;->keeper:Le/e/a/MiniSession225$SurfaceKeeper;

    if-eqz v3, :cond_3c

    iget-object v3, v1, Le/e/a/DirectBackground235$State;->keeper:Le/e/a/MiniSession225$SurfaceKeeper;

    invoke-virtual {v3}, Le/e/a/MiniSession225$SurfaceKeeper;->close()V

    :cond_3c
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

    if-eqz v3, :cond_65

    new-instance v3, Le/e/a/MiniSession225$SurfaceKeeper;

    iget-object v4, v1, Le/e/a/DirectBackground235$State;->texture:Landroid/view/TextureView;

    invoke-direct {v3, v4}, Le/e/a/MiniSession225$SurfaceKeeper;-><init>(Landroid/view/TextureView;)V

    iput-object v3, v1, Le/e/a/DirectBackground235$State;->keeper:Le/e/a/MiniSession225$SurfaceKeeper;

    :cond_65
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    instance-of v3, v3, Landroid/view/ViewGroup;

    if-eqz v3, :cond_83

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

    :cond_83
    const-string p0, "Direct player attached to mini session"

    invoke-static {v0, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    :cond_88
    sget-object p0, Le/e/a/DirectBackground235;->MAIN:Landroid/os/Handler;

    iget-object v3, v1, Le/e/a/DirectBackground235$State;->timeout:Ljava/lang/Runnable;

    invoke-virtual {p0, v3}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-object p0, v1, Le/e/a/DirectBackground235$State;->foreground:Ljava/lang/ref/WeakReference;

    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/Activity;

    if-eqz p0, :cond_a2

    invoke-static {p0}, Le/e/a/PlaybackBar221;->player(Landroid/app/Activity;)Z

    move-result v3

    if-nez v3, :cond_a2

    invoke-virtual {v1, p0}, Le/e/a/DirectBackground235$State;->attach(Landroid/app/Activity;)V

    :cond_a2
    iget-object p0, v1, Le/e/a/DirectBackground235$State;->host:Landroid/app/Activity;

    if-eqz p0, :cond_b1

    iget-object p0, v1, Le/e/a/DirectBackground235$State;->keeper:Le/e/a/MiniSession225$SurfaceKeeper;

    if-eqz p0, :cond_b1

    iget-object p0, v1, Le/e/a/DirectBackground235$State;->keeper:Le/e/a/MiniSession225$SurfaceKeeper;

    iget-object v3, v1, Le/e/a/DirectBackground235$State;->video:Landroid/view/View;

    invoke-virtual {p0, v3}, Le/e/a/MiniSession225$SurfaceKeeper;->output(Landroid/view/View;)V

    :cond_b1
    iget-boolean p0, v1, Le/e/a/DirectBackground235$State;->wantsExpand:Z

    if-eqz p0, :cond_c8

    invoke-virtual {v1}, Le/e/a/DirectBackground235$State;->ready()Z

    move-result p0

    if-eqz p0, :cond_c8

    invoke-virtual {v1, v2}, Le/e/a/DirectBackground235$State;->settle(Z)V
    :try_end_be
    .catch Ljava/lang/Exception; {:try_start_1b .. :try_end_be} :catch_bf

    .line 22
    goto :goto_c8

    :catch_bf
    move-exception p0

    const-string v3, "Cannot attach service player"

    invoke-static {v0, v3, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    invoke-virtual {v1, v2}, Le/e/a/DirectBackground235$State;->close(Z)V

    :cond_c8
    :goto_c8
    return-void

    .line 20
    :cond_c9
    :goto_c9
    return-void
.end method

.method static recover(Ljava/lang/Object;Landroid/app/Activity;)Le/e/a/DirectBackground235$State;
    .registers 8

    .line 8
    sget-object v0, Le/e/a/DirectBackground235;->active:Le/e/a/DirectBackground235$State;

    if-eqz v0, :cond_7

    sget-object p0, Le/e/a/DirectBackground235;->active:Le/e/a/DirectBackground235$State;

    return-object p0

    :cond_7
    invoke-static {p0}, Le/e/a/DirectBackground235;->background(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_f

    return-object v1

    :cond_f
    :try_start_f
    check-cast p0, Landroid/app/Service;

    const-string v0, "e"

    invoke-static {p0, v0}, Le/e/a/DirectBackground235;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_1a

    return-object v1

    :cond_1a
    invoke-virtual {p0}, Landroid/app/Service;->getApplication()Landroid/app/Application;

    move-result-object v0

    sget-object v2, Le/e/a/DirectBackground235;->app:Landroid/app/Application;

    if-eq v2, v0, :cond_36

    sget-object v2, Le/e/a/DirectBackground235;->app:Landroid/app/Application;

    if-eqz v2, :cond_2d

    sget-object v2, Le/e/a/DirectBackground235;->app:Landroid/app/Application;

    sget-object v3, Le/e/a/DirectBackground235;->LIFECYCLE:Landroid/app/Application$ActivityLifecycleCallbacks;

    invoke-virtual {v2, v3}, Landroid/app/Application;->unregisterActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    :cond_2d
    sput-object v0, Le/e/a/DirectBackground235;->app:Landroid/app/Application;

    sget-object v0, Le/e/a/DirectBackground235;->app:Landroid/app/Application;

    sget-object v2, Le/e/a/DirectBackground235;->LIFECYCLE:Landroid/app/Application$ActivityLifecycleCallbacks;

    invoke-virtual {v0, v2}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    :cond_36
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

    if-eqz p1, :cond_5d

    invoke-static {p1}, Le/e/a/PlaybackBar221;->player(Landroid/app/Activity;)Z

    move-result p0

    if-nez p0, :cond_5d

    new-instance p0, Ljava/lang/ref/WeakReference;

    invoke-direct {p0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p0, v0, Le/e/a/DirectBackground235$State;->foreground:Ljava/lang/ref/WeakReference;

    :cond_5d
    sput-object v0, Le/e/a/DirectBackground235;->active:Le/e/a/DirectBackground235$State;

    const-string p0, "Background presentation recovered using the existing Service player"

    invoke-static {p0}, Le/e/a/ModernDebug;->record(Ljava/lang/String;)V
    :try_end_64
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_64} :catch_65

    return-object v0

    :catch_65
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

    if-eqz v0, :cond_5

    return-void

    :cond_5
    :try_start_5
    sget-object v0, Le/e/a/TabRoutes228;->foreground:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-eqz v0, :cond_3a

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v1

    if-nez v1, :cond_3a

    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v1

    if-nez v1, :cond_3a

    invoke-static {v0}, Le/e/a/PlaybackBar221;->player(Landroid/app/Activity;)Z

    move-result v1

    if-eqz v1, :cond_22

    goto :goto_3a

    :cond_22
    invoke-static {}, Le/e/a/PlaybackBar221;->media()Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_2a

    const/4 v1, 0x0

    goto :goto_30

    :cond_2a
    const-string v2, "owner"

    invoke-static {v1, v2}, Le/e/a/DirectBackground235;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    :goto_30
    invoke-static {v1, v0}, Le/e/a/DirectBackground235;->recover(Ljava/lang/Object;Landroid/app/Activity;)Le/e/a/DirectBackground235$State;

    move-result-object v0

    if-eqz v0, :cond_43

    invoke-static {v1}, Le/e/a/DirectBackground235;->prepared(Ljava/lang/Object;)V
    :try_end_39
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_39} :catch_3b

    goto :goto_43

    :cond_3a
    :goto_3a
    return-void

    :catch_3b
    move-exception v0

    const-string v1, "nicoid-mini"

    const-string v2, "Cannot restore background controls"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_43
    :goto_43
    return-void
.end method

.method public static showing()Z
    .registers 1

    .line 10
    sget-object v0, Le/e/a/DirectBackground235;->active:Le/e/a/DirectBackground235$State;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    return v0

    :cond_6
    const/4 v0, 0x0

    return v0
.end method

.method public static start(Landroid/app/Activity;Landroid/content/Intent;)Z
    .registers 9

    .line 12
    const-string v0, "tickerText"

    const/4 v1, 0x1

    :try_start_3
    invoke-static {p0}, Le/e/a/DirectBackground235;->track(Landroid/app/Activity;)V

    sget-object v2, Le/e/a/DirectBackground235;->active:Le/e/a/DirectBackground235$State;

    if-eqz v2, :cond_f

    sget-object v2, Le/e/a/DirectBackground235;->active:Le/e/a/DirectBackground235$State;

    invoke-virtual {v2, v1}, Le/e/a/DirectBackground235$State;->close(Z)V

    :cond_f
    invoke-static {}, Le/e/a/MiniSession225;->closeCurrent()V

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

    if-nez v3, :cond_2d

    iget-object v0, v2, Le/e/a/DirectBackground235$State;->title:Ljava/lang/String;

    goto :goto_31

    :cond_2d
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_31
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

    sget-object p0, Le/e/a/DirectBackground235;->MAIN:Landroid/os/Handler;

    iget-object p1, v2, Le/e/a/DirectBackground235$State;->timeout:Ljava/lang/Runnable;

    const-wide/16 v2, 0x7530

    invoke-virtual {p0, p1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_6c
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_6c} :catch_6d

    return v1

    :catch_6d
    move-exception p0

    sget-object p1, Le/e/a/DirectBackground235;->active:Le/e/a/DirectBackground235$State;

    if-eqz p1, :cond_77

    sget-object p1, Le/e/a/DirectBackground235;->active:Le/e/a/DirectBackground235$State;

    invoke-virtual {p1, v1}, Le/e/a/DirectBackground235$State;->close(Z)V

    :cond_77
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

    if-eqz v0, :cond_e

    iget-object v1, v0, Le/e/a/DirectBackground235$State;->service:Landroid/app/Service;

    if-ne v1, p0, :cond_e

    const/4 v1, 0x0

    iput-boolean v1, v0, Le/e/a/DirectBackground235$State;->restarting:Z

    invoke-virtual {v0, v1}, Le/e/a/DirectBackground235$State;->close(Z)V

    :cond_e
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

    if-ne v0, v1, :cond_9

    return-void

    :cond_9
    sget-object v0, Le/e/a/DirectBackground235;->app:Landroid/app/Application;

    if-eqz v0, :cond_14

    sget-object v0, Le/e/a/DirectBackground235;->app:Landroid/app/Application;

    sget-object v1, Le/e/a/DirectBackground235;->LIFECYCLE:Landroid/app/Application$ActivityLifecycleCallbacks;

    invoke-virtual {v0, v1}, Landroid/app/Application;->unregisterActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    :cond_14
    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p0

    sput-object p0, Le/e/a/DirectBackground235;->app:Landroid/app/Application;

    sget-object p0, Le/e/a/DirectBackground235;->app:Landroid/app/Application;

    sget-object v0, Le/e/a/DirectBackground235;->LIFECYCLE:Landroid/app/Application$ActivityLifecycleCallbacks;

    invoke-virtual {p0, v0}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    return-void
.end method
