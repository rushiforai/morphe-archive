.class public final Le/e/a/PopupReturn244;
.super Ljava/lang/Object;
.source "PopupReturn244.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/PopupReturn244$Pending;
    }
.end annotation


# static fields
.field static final MAIN:Landroid/os/Handler;

.field static final RETAINED_LOADERS:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field static final TOKEN:Ljava/lang/String; = "nicoid_popup_return_244"

.field static pending:Le/e/a/PopupReturn244$Pending;

.field static serial:J


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 5
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->newSetFromMap(Ljava/util/Map;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Le/e/a/PopupReturn244;->RETAINED_LOADERS:Ljava/util/Set;

    .line 7
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Le/e/a/PopupReturn244;->MAIN:Landroid/os/Handler;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static adopt(Ljava/lang/Object;)Z
    .registers 13

    .line 17
    const-string v0, "a0"

    sget-object v1, Le/e/a/PopupReturn244;->pending:Le/e/a/PopupReturn244$Pending;

    const/4 v2, 0x0

    if-nez v1, :cond_8

    return v2

    :cond_8
    :try_start_8
    const-string v3, "A1"

    invoke-static {p0, v3}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/app/Activity;

    invoke-static {v3}, Le/e/a/PopupReturn244;->matches(Landroid/app/Activity;)Z

    move-result v3

    if-nez v3, :cond_17

    return v2

    :cond_17
    iget-boolean v3, v1, Le/e/a/PopupReturn244$Pending;->adopted:Z

    const/4 v4, 0x1

    if-eqz v3, :cond_22

    iget-object v0, v1, Le/e/a/PopupReturn244$Pending;->owner:Ljava/lang/Object;

    if-ne v0, p0, :cond_21

    return v4

    :cond_21
    return v2

    :cond_22
    const-string v3, "b0"

    invoke-static {p0, v3}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    iget-object v5, v1, Le/e/a/PopupReturn244$Pending;->service:Landroid/app/Service;

    const-string v6, "f"

    invoke-static {v5, v6}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v5}, Le/e/a/HistoryRules;->same(Ljava/lang/String;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3f

    return v2

    :cond_3f
    invoke-static {p0, v0}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    iput-object v3, v1, Le/e/a/PopupReturn244$Pending;->empty:Landroid/view/View;

    iget-object v3, v1, Le/e/a/PopupReturn244$Pending;->service:Landroid/app/Service;

    const-string v5, "a"

    invoke-static {v3, v5}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    invoke-static {v3}, Le/e/a/CommentSafety110;->stop(Landroid/view/View;)V

    iget-object v3, v1, Le/e/a/PopupReturn244$Pending;->empty:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    instance-of v3, v3, Landroid/view/ViewGroup;

    if-eqz v3, :cond_101

    iget-object v3, v1, Le/e/a/PopupReturn244$Pending;->empty:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    check-cast v3, Landroid/view/ViewGroup;

    iget-object v5, v1, Le/e/a/PopupReturn244$Pending;->empty:Landroid/view/View;

    invoke-virtual {v3, v5}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result v5

    iget-object v6, v1, Le/e/a/PopupReturn244$Pending;->empty:Landroid/view/View;

    invoke-virtual {v6}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    iput-object v3, v1, Le/e/a/PopupReturn244$Pending;->normalParent:Landroid/view/ViewGroup;

    iput v5, v1, Le/e/a/PopupReturn244$Pending;->normalIndex:I

    iput-object v6, v1, Le/e/a/PopupReturn244$Pending;->normalParams:Landroid/view/ViewGroup$LayoutParams;

    sget-object v7, Le/e/a/DirectBackground235;->active:Le/e/a/DirectBackground235$State;

    iget-object v8, v1, Le/e/a/PopupReturn244$Pending;->video:Landroid/view/View;

    invoke-static {v8}, Le/e/a/MiniSession225;->texture(Landroid/view/View;)Landroid/view/TextureView;

    move-result-object v8

    if-eqz v7, :cond_94

    iget-object v9, v7, Le/e/a/DirectBackground235$State;->service:Landroid/app/Service;

    iget-object v10, v1, Le/e/a/PopupReturn244$Pending;->service:Landroid/app/Service;

    if-ne v9, v10, :cond_94

    iget-object v9, v7, Le/e/a/DirectBackground235$State;->keeper:Le/e/a/MiniSession225$SurfaceKeeper;

    if-eqz v9, :cond_94

    iget-object v8, v7, Le/e/a/DirectBackground235$State;->keeper:Le/e/a/MiniSession225$SurfaceKeeper;

    iput-object v8, v1, Le/e/a/PopupReturn244$Pending;->keeper:Le/e/a/MiniSession225$SurfaceKeeper;

    const/4 v8, 0x0

    iput-object v8, v7, Le/e/a/DirectBackground235$State;->keeper:Le/e/a/MiniSession225$SurfaceKeeper;

    goto :goto_9d

    :cond_94
    if-eqz v8, :cond_9d

    new-instance v9, Le/e/a/MiniSession225$SurfaceKeeper;

    invoke-direct {v9, v8}, Le/e/a/MiniSession225$SurfaceKeeper;-><init>(Landroid/view/TextureView;)V

    iput-object v9, v1, Le/e/a/PopupReturn244$Pending;->keeper:Le/e/a/MiniSession225$SurfaceKeeper;

    :cond_9d
    :goto_9d
    iget-object v8, v1, Le/e/a/PopupReturn244$Pending;->video:Landroid/view/View;

    const-string v9, "setReleaseOnDetachFromWindow"

    sget-object v10, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    filled-new-array {v10}, [Ljava/lang/Class;

    move-result-object v10

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v11

    filled-new-array {v11}, [Ljava/lang/Object;

    move-result-object v11

    invoke-static {v8, v9, v10, v11}, Le/e/a/MiniSession225;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz v7, :cond_bd

    iget-object v8, v7, Le/e/a/DirectBackground235$State;->service:Landroid/app/Service;

    iget-object v9, v1, Le/e/a/PopupReturn244$Pending;->service:Landroid/app/Service;

    if-ne v8, v9, :cond_bd

    invoke-virtual {v7}, Le/e/a/DirectBackground235$State;->detach()V

    :cond_bd
    iget-object v7, v1, Le/e/a/PopupReturn244$Pending;->video:Landroid/view/View;

    invoke-virtual {v7}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v7

    instance-of v7, v7, Landroid/view/ViewGroup;

    if-eqz v7, :cond_d4

    iget-object v7, v1, Le/e/a/PopupReturn244$Pending;->video:Landroid/view/View;

    invoke-virtual {v7}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v7

    check-cast v7, Landroid/view/ViewGroup;

    iget-object v8, v1, Le/e/a/PopupReturn244$Pending;->video:Landroid/view/View;

    invoke-virtual {v7, v8}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_d4
    iget-object v7, v1, Le/e/a/PopupReturn244$Pending;->empty:Landroid/view/View;

    invoke-virtual {v3, v7}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    iget-object v7, v1, Le/e/a/PopupReturn244$Pending;->video:Landroid/view/View;

    iget-object v8, v1, Le/e/a/PopupReturn244$Pending;->empty:Landroid/view/View;

    invoke-virtual {v8}, Landroid/view/View;->getId()I

    move-result v8

    invoke-virtual {v7, v8}, Landroid/view/View;->setId(I)V

    iget-object v7, v1, Le/e/a/PopupReturn244$Pending;->video:Landroid/view/View;

    invoke-virtual {v3, v7, v5, v6}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    iget-object v3, v1, Le/e/a/PopupReturn244$Pending;->video:Landroid/view/View;

    invoke-static {p0, v0, v3}, Le/e/a/MultiTabs227;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v0, "k0"

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {p0, v0, v3}, Le/e/a/MultiTabs227;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    iput-object p0, v1, Le/e/a/PopupReturn244$Pending;->owner:Ljava/lang/Object;

    iput-boolean v4, v1, Le/e/a/PopupReturn244$Pending;->adopted:Z

    const-string p0, "Existing popup decoder handed to normal view"

    invoke-static {p0}, Le/e/a/ModernDebug;->record(Ljava/lang/String;)V

    return v4

    :cond_101
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v0, "Normal video parent unavailable"

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_109
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_109} :catch_109

    :catch_109
    move-exception p0

    const-string v0, "nicoid-mini"

    const-string v3, "Cannot hand over popup decoder"

    invoke-static {v0, v3, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    invoke-static {v1}, Le/e/a/PopupReturn244;->cancel(Le/e/a/PopupReturn244$Pending;)V

    return v2
.end method

.method static cancel(Le/e/a/PopupReturn244$Pending;)V
    .registers 11

    .line 19
    sget-object v0, Le/e/a/PopupReturn244;->pending:Le/e/a/PopupReturn244$Pending;

    if-eq v0, p0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x0

    sput-object v0, Le/e/a/PopupReturn244;->pending:Le/e/a/PopupReturn244$Pending;

    iget-object v0, p0, Le/e/a/PopupReturn244$Pending;->timeout:Ljava/lang/Runnable;

    if-eqz v0, :cond_13

    sget-object v0, Le/e/a/PopupReturn244;->MAIN:Landroid/os/Handler;

    iget-object v1, p0, Le/e/a/PopupReturn244$Pending;->timeout:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    :cond_13
    iget-object v0, p0, Le/e/a/PopupReturn244$Pending;->loader:Ljava/lang/Object;

    const-string v1, "k"

    const-string v2, "nicoid-mini"

    if-eqz v0, :cond_30

    :try_start_1b
    sget-object v0, Le/e/a/PopupReturn244;->RETAINED_LOADERS:Ljava/util/Set;

    iget-object v3, p0, Le/e/a/PopupReturn244$Pending;->loader:Ljava/lang/Object;

    invoke-interface {v0, v3}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    iget-object v0, p0, Le/e/a/PopupReturn244$Pending;->loader:Ljava/lang/Object;

    iget-object v3, p0, Le/e/a/PopupReturn244$Pending;->loaderListener:Ljava/lang/Object;

    invoke-static {v0, v1, v3}, Le/e/a/MultiTabs227;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_29
    .catch Ljava/lang/Exception; {:try_start_1b .. :try_end_29} :catch_2a

    goto :goto_30

    :catch_2a
    move-exception v0

    const-string v3, "Cannot restore metadata owner"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_30
    :goto_30
    iget-boolean v0, p0, Le/e/a/PopupReturn244$Pending;->adopted:Z

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz v0, :cond_f0

    :try_start_36
    iget-object v0, p0, Le/e/a/PopupReturn244$Pending;->video:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v0, v0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_4d

    iget-object v0, p0, Le/e/a/PopupReturn244$Pending;->video:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iget-object v5, p0, Le/e/a/PopupReturn244$Pending;->video:Landroid/view/View;

    invoke-virtual {v0, v5}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_4d
    iget-object v0, p0, Le/e/a/PopupReturn244$Pending;->empty:Landroid/view/View;

    if-eqz v0, :cond_72

    iget-object v0, p0, Le/e/a/PopupReturn244$Pending;->normalParent:Landroid/view/ViewGroup;

    if-eqz v0, :cond_72

    iget-object v0, p0, Le/e/a/PopupReturn244$Pending;->empty:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-nez v0, :cond_72

    iget-object v0, p0, Le/e/a/PopupReturn244$Pending;->normalParent:Landroid/view/ViewGroup;

    iget-object v5, p0, Le/e/a/PopupReturn244$Pending;->empty:Landroid/view/View;

    iget v6, p0, Le/e/a/PopupReturn244$Pending;->normalIndex:I

    iget-object v7, p0, Le/e/a/PopupReturn244$Pending;->normalParent:Landroid/view/ViewGroup;

    invoke-virtual {v7}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v7

    invoke-static {v6, v7}, Ljava/lang/Math;->min(II)I

    move-result v6

    iget-object v7, p0, Le/e/a/PopupReturn244$Pending;->normalParams:Landroid/view/ViewGroup$LayoutParams;

    invoke-virtual {v0, v5, v6, v7}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    :cond_72
    iget-object v0, p0, Le/e/a/PopupReturn244$Pending;->owner:Ljava/lang/Object;

    if-eqz v0, :cond_7f

    iget-object v0, p0, Le/e/a/PopupReturn244$Pending;->owner:Ljava/lang/Object;

    const-string v5, "a0"

    iget-object v6, p0, Le/e/a/PopupReturn244$Pending;->empty:Landroid/view/View;

    invoke-static {v0, v5, v6}, Le/e/a/MultiTabs227;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_7f
    const-string v0, "setOnVideoSizedChangedListener"

    const-string v5, "i"

    const-string v6, "OnVideoSizeChangedListener"

    filled-new-array {v0, v5, v6}, [Ljava/lang/String;

    move-result-object v0

    const-string v5, "setOnCompletionListener"

    const-string v6, "j"

    const-string v7, "OnCompletionListener"

    filled-new-array {v5, v6, v7}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "setOnErrorListener"

    const-string v7, "OnErrorListener"

    filled-new-array {v6, v1, v7}, [Ljava/lang/String;

    move-result-object v1

    const-string v6, "setOnBufferUpdateListener"

    const-string v7, "l"

    const-string v8, "OnBufferUpdateListener"

    filled-new-array {v6, v7, v8}, [Ljava/lang/String;

    move-result-object v6

    const-string v7, "setOnPreparedListener"

    const-string v8, "n"

    const-string v9, "OnPreparedListener"

    filled-new-array {v7, v8, v9}, [Ljava/lang/String;

    move-result-object v7

    filled-new-array {v0, v5, v1, v6, v7}, [[Ljava/lang/String;

    move-result-object v0

    move v1, v4

    :goto_b4
    const/4 v5, 0x5

    if-lt v1, v5, :cond_b8

    goto :goto_f0

    :cond_b8
    aget-object v5, v0, v1

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "com.devbrackets.android.exomedia.listener."

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/4 v7, 0x2

    aget-object v7, v5, v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    iget-object v7, p0, Le/e/a/PopupReturn244$Pending;->video:Landroid/view/View;

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    aget-object v5, v5, v4

    filled-new-array {v6}, [Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v7, v5, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    iget-object v6, p0, Le/e/a/PopupReturn244$Pending;->video:Landroid/view/View;

    new-array v7, v3, [Ljava/lang/Object;

    invoke-virtual {v5, v6, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_e7
    .catch Ljava/lang/Exception; {:try_start_36 .. :try_end_e7} :catch_ea

    add-int/lit8 v1, v1, 0x1

    goto :goto_b4

    :catch_ea
    move-exception v0

    const-string v1, "Cannot fully undo popup handover"

    invoke-static {v2, v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_f0
    :goto_f0
    iget-object v0, p0, Le/e/a/PopupReturn244$Pending;->target:Landroid/app/Activity;

    if-eqz v0, :cond_101

    iget-object v0, p0, Le/e/a/PopupReturn244$Pending;->target:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_101

    iget-object v0, p0, Le/e/a/PopupReturn244$Pending;->target:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    :cond_101
    sget-object v0, Le/e/a/DirectBackground235;->active:Le/e/a/DirectBackground235$State;

    if-eqz v0, :cond_12a

    iget-object v1, v0, Le/e/a/DirectBackground235$State;->service:Landroid/app/Service;

    iget-object v2, p0, Le/e/a/PopupReturn244$Pending;->service:Landroid/app/Service;

    if-ne v1, v2, :cond_12a

    iput-boolean v4, v0, Le/e/a/DirectBackground235$State;->restoring:Z

    iget-boolean p0, p0, Le/e/a/PopupReturn244$Pending;->adopted:Z

    if-eqz p0, :cond_115

    invoke-virtual {v0, v3}, Le/e/a/DirectBackground235$State;->close(Z)V

    goto :goto_12a

    :cond_115
    iget-object p0, v0, Le/e/a/DirectBackground235$State;->foreground:Ljava/lang/ref/WeakReference;

    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/Activity;

    if-eqz p0, :cond_12a

    :try_start_11f
    invoke-static {p0}, Le/e/a/PlaybackBar221;->player(Landroid/app/Activity;)Z

    move-result v1

    if-nez v1, :cond_12a

    invoke-virtual {v0, p0}, Le/e/a/DirectBackground235$State;->attach(Landroid/app/Activity;)V
    :try_end_128
    .catch Ljava/lang/Exception; {:try_start_11f .. :try_end_128} :catch_129

    goto :goto_12a

    :catch_129
    move-exception p0

    :cond_12a
    :goto_12a
    const-string p0, "Retained popup return cancelled"

    invoke-static {p0}, Le/e/a/ModernDebug;->record(Ljava/lang/String;)V

    return-void
.end method

.method public static created(Ljava/lang/Object;)V
    .registers 5

    .line 16
    sget-object v0, Le/e/a/PopupReturn244;->pending:Le/e/a/PopupReturn244$Pending;

    if-nez v0, :cond_5

    return-void

    :cond_5
    :try_start_5
    const-string v1, "A1"

    invoke-static {p0, v1}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/Activity;

    invoke-static {v1}, Le/e/a/PopupReturn244;->matches(Landroid/app/Activity;)Z

    move-result v2

    if-eqz v2, :cond_3e

    iput-object v1, v0, Le/e/a/PopupReturn244$Pending;->target:Landroid/app/Activity;

    invoke-static {v0, p0}, Le/e/a/PopupReturn244;->deliverMetadata(Le/e/a/PopupReturn244$Pending;Ljava/lang/Object;)V

    iget-boolean v1, v0, Le/e/a/PopupReturn244$Pending;->adopted:Z

    if-nez v1, :cond_3e

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "b"

    const-class v3, Ljava/lang/String;

    filled-new-array {v3}, [Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v1, p0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_32
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_32} :catch_33

    goto :goto_3e

    :catch_33
    move-exception p0

    const-string v1, "nicoid-mini"

    const-string v2, "Retained popup view initialization failed"

    invoke-static {v1, v2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    invoke-static {v0}, Le/e/a/PopupReturn244;->cancel(Le/e/a/PopupReturn244$Pending;)V

    :cond_3e
    :goto_3e
    return-void
.end method

.method static deliverMetadata(Le/e/a/PopupReturn244$Pending;Ljava/lang/Object;)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 15
    iget-boolean v0, p0, Le/e/a/PopupReturn244$Pending;->metadataDelivered:Z

    if-nez v0, :cond_4a

    iget-object v0, p0, Le/e/a/PopupReturn244$Pending;->loader:Ljava/lang/Object;

    if-nez v0, :cond_9

    goto :goto_4a

    :cond_9
    iget-object v0, p0, Le/e/a/PopupReturn244$Pending;->loader:Ljava/lang/Object;

    const-string v1, "m"

    invoke-static {v0, v1}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    instance-of v1, v0, Landroid/os/Bundle;

    if-eqz v1, :cond_42

    check-cast v0, Landroid/os/Bundle;

    invoke-virtual {v0}, Landroid/os/Bundle;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_42

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1, v0}, Landroid/os/Bundle;-><init>(Landroid/os/Bundle;)V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-class v2, Landroid/os/Bundle;

    filled-new-array {v2}, [Ljava/lang/Class;

    move-result-object v2

    const-string v3, "a"

    invoke-virtual {v0, v3, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    const/4 p1, 0x1

    iput-boolean p1, p0, Le/e/a/PopupReturn244$Pending;->metadataDelivered:Z

    const-string p0, "Retained metadata delivered to normal information panels"

    invoke-static {p0}, Le/e/a/ModernDebug;->record(Ljava/lang/String;)V

    return-void

    :cond_42
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "Retained metadata is unavailable"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_4a
    :goto_4a
    return-void
.end method

.method public static keep(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    .line 13
    sget-object v0, Le/e/a/PopupReturn244;->pending:Le/e/a/PopupReturn244$Pending;

    if-nez v0, :cond_5

    goto :goto_9

    :cond_5
    sget-object p0, Le/e/a/PopupReturn244;->pending:Le/e/a/PopupReturn244$Pending;

    iget-object p0, p0, Le/e/a/PopupReturn244$Pending;->model:Ljava/lang/Object;

    :goto_9
    return-object p0
.end method

.method static synthetic lambda$0(Le/e/a/PopupReturn244$Pending;)V
    .registers 1

    .line 10
    invoke-static {p0}, Le/e/a/PopupReturn244;->cancel(Le/e/a/PopupReturn244$Pending;)V

    return-void
.end method

.method static synthetic lambda$1(Le/e/a/PopupReturn244$Pending;Ljava/lang/Object;)V
    .registers 9

    .line 18
    sget-object v0, Le/e/a/PopupReturn244;->pending:Le/e/a/PopupReturn244$Pending;

    if-eq v0, p0, :cond_5

    return-void

    :cond_5
    :try_start_5
    const-string v0, "com.sauzask.nicoid.NicoidVideoFragment$n"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Constructor;->setAccessible(Z)V

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    const-string v3, "onPrepared"

    const/4 v4, 0x0

    new-array v5, v4, [Ljava/lang/Class;

    invoke-virtual {v0, v3, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v3, v4, [Ljava/lang/Object;

    invoke-virtual {v0, v1, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Le/e/a/PopupReturn244$Pending;->video:Landroid/view/View;

    const-string v1, "getPlaybackSpeed"

    new-array v3, v4, [Ljava/lang/Class;

    new-array v5, v4, [Ljava/lang/Object;

    invoke-static {v0, v1, v3, v5}, Le/e/a/MiniSession225;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->floatValue()F

    move-result v0

    iget v1, p0, Le/e/a/PopupReturn244$Pending;->speed:F

    sub-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    const v1, 0x3a83126f    # 0.001f

    cmpl-float v0, v0, v1

    if-lez v0, :cond_68

    iget-object v0, p0, Le/e/a/PopupReturn244$Pending;->video:Landroid/view/View;

    const-string v1, "setPlaybackSpeed"

    sget-object v3, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    filled-new-array {v3}, [Ljava/lang/Class;

    move-result-object v3

    iget v5, p0, Le/e/a/PopupReturn244$Pending;->speed:F

    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v5

    filled-new-array {v5}, [Ljava/lang/Object;

    move-result-object v5

    invoke-static {v0, v1, v3, v5}, Le/e/a/MiniSession225;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    :cond_68
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    iget-object v1, p0, Le/e/a/PopupReturn244$Pending;->video:Landroid/view/View;

    const-string v3, "isPlaying"

    new-array v5, v4, [Ljava/lang/Class;

    new-array v6, v4, [Ljava/lang/Object;

    invoke-static {v1, v3, v5, v6}, Le/e/a/MiniSession225;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v0

    iget-boolean v1, p0, Le/e/a/PopupReturn244$Pending;->playing:Z

    if-eq v0, v1, :cond_90

    iget-object v0, p0, Le/e/a/PopupReturn244$Pending;->video:Landroid/view/View;

    iget-boolean v1, p0, Le/e/a/PopupReturn244$Pending;->playing:Z

    if-eqz v1, :cond_87

    const-string v1, "start"

    goto :goto_89

    :cond_87
    const-string v1, "pause"

    :goto_89
    new-array v3, v4, [Ljava/lang/Class;

    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {v0, v1, v3, v4}, Le/e/a/MiniSession225;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    :cond_90
    sget-object v0, Le/e/a/DirectBackground235;->active:Le/e/a/DirectBackground235$State;

    const/4 v1, 0x0

    if-eqz v0, :cond_b0

    iget-object v3, v0, Le/e/a/DirectBackground235$State;->service:Landroid/app/Service;

    iget-object v4, p0, Le/e/a/PopupReturn244$Pending;->service:Landroid/app/Service;

    if-ne v3, v4, :cond_b0

    sput-object v1, Le/e/a/DirectBackground235;->active:Le/e/a/DirectBackground235$State;

    invoke-virtual {v0}, Le/e/a/DirectBackground235$State;->detach()V

    invoke-virtual {v0}, Le/e/a/DirectBackground235$State;->restoreControls()V

    iget-object v3, v0, Le/e/a/DirectBackground235$State;->keeper:Le/e/a/MiniSession225$SurfaceKeeper;

    if-eqz v3, :cond_ac

    iget-object v3, v0, Le/e/a/DirectBackground235$State;->keeper:Le/e/a/MiniSession225$SurfaceKeeper;

    invoke-virtual {v3}, Le/e/a/MiniSession225$SurfaceKeeper;->close()V

    :cond_ac
    iput-object v1, v0, Le/e/a/DirectBackground235$State;->video:Landroid/view/View;

    iput-boolean v2, v0, Le/e/a/DirectBackground235$State;->closing:Z

    :cond_b0
    iget-object v0, p0, Le/e/a/PopupReturn244$Pending;->loader:Ljava/lang/Object;

    if-eqz v0, :cond_bb

    iget-object v0, p0, Le/e/a/PopupReturn244$Pending;->service:Landroid/app/Service;

    const-string v3, "z"

    invoke-static {v0, v3, v1}, Le/e/a/MultiTabs227;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_bb
    iget-object v0, p0, Le/e/a/PopupReturn244$Pending;->service:Landroid/app/Service;

    const-string v3, "e"

    iget-object v4, p0, Le/e/a/PopupReturn244$Pending;->empty:Landroid/view/View;

    invoke-static {v0, v3, v4}, Le/e/a/MultiTabs227;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v0, p0, Le/e/a/PopupReturn244$Pending;->service:Landroid/app/Service;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v3, "k0"

    invoke-virtual {v0, v3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, v1, v1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    sput-object v1, Le/e/a/PopupReturn244;->pending:Le/e/a/PopupReturn244$Pending;

    sget-object v0, Le/e/a/PopupReturn244;->MAIN:Landroid/os/Handler;

    iget-object v1, p0, Le/e/a/PopupReturn244$Pending;->timeout:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-object v0, p0, Le/e/a/PopupReturn244$Pending;->keeper:Le/e/a/MiniSession225$SurfaceKeeper;

    if-eqz v0, :cond_e7

    iget-object v0, p0, Le/e/a/PopupReturn244$Pending;->keeper:Le/e/a/MiniSession225$SurfaceKeeper;

    iget-object v1, p0, Le/e/a/PopupReturn244$Pending;->video:Landroid/view/View;

    invoke-virtual {v0, v1}, Le/e/a/MiniSession225$SurfaceKeeper;->restore(Landroid/view/View;)V

    :cond_e7
    iget-object v0, p0, Le/e/a/PopupReturn244$Pending;->video:Landroid/view/View;

    const-string v1, "setReleaseOnDetachFromWindow"

    sget-object v3, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    filled-new-array {v3}, [Ljava/lang/Class;

    move-result-object v3

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    invoke-static {v0, v1, v3, v2}, Le/e/a/MiniSession225;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {p1}, Le/e/a/PlaybackTransfer221;->portrait(Ljava/lang/Object;)V

    iget-object p1, p0, Le/e/a/PopupReturn244$Pending;->service:Landroid/app/Service;

    invoke-virtual {p1}, Landroid/app/Service;->stopSelf()V

    const-string p1, "Retained popup return completed without media reload"

    invoke-static {p1}, Le/e/a/ModernDebug;->record(Ljava/lang/String;)V
    :try_end_109
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_109} :catch_10a

    goto :goto_115

    :catch_10a
    move-exception p1

    const-string v0, "nicoid-mini"

    const-string v1, "Cannot finish retained popup return"

    invoke-static {v0, v1, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    invoke-static {p0}, Le/e/a/PopupReturn244;->cancel(Le/e/a/PopupReturn244$Pending;)V

    :goto_115
    return-void
.end method

.method static matches(Landroid/app/Activity;)Z
    .registers 5

    .line 11
    sget-object v0, Le/e/a/PopupReturn244;->pending:Le/e/a/PopupReturn244$Pending;

    if-eqz v0, :cond_1c

    if-eqz p0, :cond_1c

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p0

    const-string v0, "nicoid_popup_return_244"

    const-wide/16 v1, -0x1

    invoke-virtual {p0, v0, v1, v2}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v0

    sget-object p0, Le/e/a/PopupReturn244;->pending:Le/e/a/PopupReturn244$Pending;

    iget-wide v2, p0, Le/e/a/PopupReturn244$Pending;->token:J

    cmp-long p0, v0, v2

    if-nez p0, :cond_1c

    const/4 p0, 0x1

    return p0

    :cond_1c
    const/4 p0, 0x0

    return p0
.end method

.method public static ready(Ljava/lang/Object;)V
    .registers 4

    .line 18
    sget-object v0, Le/e/a/PopupReturn244;->pending:Le/e/a/PopupReturn244$Pending;

    if-eqz v0, :cond_1e

    iget-boolean v1, v0, Le/e/a/PopupReturn244$Pending;->adopted:Z

    if-eqz v1, :cond_1e

    iget-object v1, v0, Le/e/a/PopupReturn244$Pending;->owner:Ljava/lang/Object;

    if-ne v1, p0, :cond_1e

    iget-boolean v1, v0, Le/e/a/PopupReturn244$Pending;->finishing:Z

    if-eqz v1, :cond_11

    goto :goto_1e

    :cond_11
    const/4 v1, 0x1

    iput-boolean v1, v0, Le/e/a/PopupReturn244$Pending;->finishing:Z

    sget-object v1, Le/e/a/PopupReturn244;->MAIN:Landroid/os/Handler;

    new-instance v2, Le/e/a/PopupReturn244$$ExternalSyntheticLambda2;

    invoke-direct {v2, v0, p0}, Le/e/a/PopupReturn244$$ExternalSyntheticLambda2;-><init>(Le/e/a/PopupReturn244$Pending;Ljava/lang/Object;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_1e
    :goto_1e
    return-void
.end method

.method public static restore(Ljava/lang/Object;)Z
    .registers 2

    .line 9
    instance-of v0, p0, Landroid/app/Service;

    if-eqz v0, :cond_e

    check-cast p0, Landroid/app/Service;

    invoke-static {p0}, Le/e/a/PopupReturn244;->start(Landroid/app/Service;)Z

    move-result p0

    if-eqz p0, :cond_e

    const/4 p0, 0x1

    return p0

    :cond_e
    const/4 p0, 0x0

    return p0
.end method

.method public static retainedLoader(Ljava/lang/Object;)Z
    .registers 2

    .line 6
    sget-object v0, Le/e/a/PopupReturn244;->RETAINED_LOADERS:Ljava/util/Set;

    invoke-interface {v0, p0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public static retaining(Landroid/content/Context;Landroid/content/Intent;)Z
    .registers 3

    .line 12
    instance-of v0, p0, Landroid/app/Activity;

    if-eqz v0, :cond_26

    check-cast p0, Landroid/app/Activity;

    invoke-static {p0}, Le/e/a/PopupReturn244;->matches(Landroid/app/Activity;)Z

    move-result p0

    if-eqz p0, :cond_26

    if-eqz p1, :cond_26

    invoke-virtual {p1}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object p0

    if-eqz p0, :cond_26

    invoke-virtual {p1}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object p0

    const-string p1, "com.sauzask.nicoid.NicoidPopupViewService"

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_26

    const/4 p0, 0x1

    return p0

    :cond_26
    const/4 p0, 0x0

    return p0
.end method

.method public static reuseLoader(Ljava/lang/Object;)Z
    .registers 7

    .line 14
    const-string v0, "k"

    sget-object v1, Le/e/a/PopupReturn244;->pending:Le/e/a/PopupReturn244$Pending;

    const/4 v2, 0x0

    if-nez v1, :cond_8

    return v2

    :cond_8
    :try_start_8
    const-string v3, "A1"

    invoke-static {p0, v3}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/app/Activity;

    invoke-static {v3}, Le/e/a/PopupReturn244;->matches(Landroid/app/Activity;)Z

    move-result v3

    if-eqz v3, :cond_61

    const-string v3, "b0"

    invoke-static {p0, v3}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    iget-object v4, v1, Le/e/a/PopupReturn244$Pending;->service:Landroid/app/Service;

    const-string v5, "f"

    invoke-static {v4, v5}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Le/e/a/HistoryRules;->same(Ljava/lang/String;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_33

    goto :goto_61

    :cond_33
    iget-object v3, v1, Le/e/a/PopupReturn244$Pending;->service:Landroid/app/Service;

    const-string v4, "z"

    invoke-static {v3, v4}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_59

    iput-object v3, v1, Le/e/a/PopupReturn244$Pending;->loader:Ljava/lang/Object;

    sget-object v4, Le/e/a/PopupReturn244;->RETAINED_LOADERS:Ljava/util/Set;

    invoke-interface {v4, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    invoke-static {v3, v0}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    iput-object v4, v1, Le/e/a/PopupReturn244$Pending;->loaderListener:Ljava/lang/Object;

    invoke-static {v3, v0, p0}, Le/e/a/MultiTabs227;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v0, "h1"

    invoke-static {p0, v0, v3}, Le/e/a/MultiTabs227;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    const-string p0, "Reused prepared popup metadata without starting a second HLS session"

    invoke-static {p0}, Le/e/a/ModernDebug;->record(Ljava/lang/String;)V

    const/4 p0, 0x1

    return p0

    :cond_59
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v0, "Retained metadata loader unavailable"

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_61
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_61} :catch_62

    :cond_61
    :goto_61
    return v2

    :catch_62
    move-exception p0

    const-string v0, "nicoid-mini"

    const-string v1, "Cannot reuse retained metadata"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return v2
.end method

.method public static start(Landroid/app/Service;)Z
    .registers 15

    .line 10
    const-string v0, "m"

    const-string v1, "nicoid-mini"

    sget-object v2, Le/e/a/PopupReturn244;->pending:Le/e/a/PopupReturn244$Pending;

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz v2, :cond_12

    sget-object v0, Le/e/a/PopupReturn244;->pending:Le/e/a/PopupReturn244$Pending;

    iget-object v0, v0, Le/e/a/PopupReturn244$Pending;->service:Landroid/app/Service;

    if-ne v0, p0, :cond_11

    return v3

    :cond_11
    return v4

    :cond_12
    :try_start_12
    new-instance v2, Le/e/a/PopupReturn244$Pending;

    invoke-direct {v2, p0}, Le/e/a/PopupReturn244$Pending;-><init>(Landroid/app/Service;)V

    iget-object v5, v2, Le/e/a/PopupReturn244$Pending;->video:Landroid/view/View;

    if-eqz v5, :cond_15d

    iget-object v5, v2, Le/e/a/PopupReturn244$Pending;->video:Landroid/view/View;

    const-string v6, "getDuration"

    new-array v7, v4, [Ljava/lang/Class;

    new-array v8, v4, [Ljava/lang/Object;

    invoke-static {v5, v6, v7, v8}, Le/e/a/MiniSession225;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Number;

    invoke-virtual {v5}, Ljava/lang/Number;->longValue()J

    move-result-wide v5

    const-wide/16 v7, 0x0

    cmp-long v5, v5, v7

    if-gtz v5, :cond_35

    goto/16 :goto_15d

    :cond_35
    sget-wide v5, Le/e/a/PopupReturn244;->serial:J

    const-wide/16 v7, 0x1

    add-long/2addr v5, v7

    sput-wide v5, Le/e/a/PopupReturn244;->serial:J

    iput-wide v5, v2, Le/e/a/PopupReturn244$Pending;->token:J

    sput-object v2, Le/e/a/PopupReturn244;->pending:Le/e/a/PopupReturn244$Pending;

    const-string v5, "com.sauzask.nicoid.NicoidVideoFragment"

    invoke-static {v5}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    const-string v6, "V1"

    invoke-virtual {v5, v6}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v5

    iget-object v6, v2, Le/e/a/PopupReturn244$Pending;->model:Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-virtual {v5, v7, v6}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    const-string v5, "f"

    invoke-static {p0, v5}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Le/e/a/HistoryRules;->id(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_155

    const-string v6, "(?:sm|nm|so|ss)?[0-9]+"

    invoke-virtual {v5, v6}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_155

    new-instance v6, Landroid/content/Intent;

    const-string v8, "android.intent.action.VIEW"

    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "https://www.nicovideo.jp/watch/"

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    invoke-direct {v6, v8, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const-string v5, "com.sauzask.nicoid.NicoidVideoActivity"

    invoke-virtual {v6, p0, v5}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v5

    const/high16 v6, 0x10050000

    invoke-virtual {v5, v6}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    move-result-object v5

    const-string v6, "intentselect"

    invoke-virtual {v5, v6, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object v5

    const-string v6, "nicoid_portrait_restore"

    invoke-virtual {v5, v6, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object v5

    const-string v6, "nicoid_popup_return_244"

    iget-wide v8, v2, Le/e/a/PopupReturn244$Pending;->token:J

    invoke-virtual {v5, v6, v8, v9}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    move-result-object v5

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    const-string v8, "s0"

    invoke-virtual {v6, v8}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v6

    invoke-virtual {v6, v7}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    const-string v8, "z"

    invoke-static {p0, v8}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_cd

    invoke-static {v8, v0}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    instance-of v9, v9, Landroid/os/Bundle;

    if-eqz v9, :cond_cd

    new-instance v6, Landroid/os/Bundle;

    invoke-static {v8, v0}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Bundle;

    invoke-direct {v6, v0}, Landroid/os/Bundle;-><init>(Landroid/os/Bundle;)V

    :cond_cd
    instance-of v0, v6, Landroid/os/Bundle;

    if-eqz v0, :cond_d8

    const-string v0, "infodata"

    check-cast v6, Landroid/os/Bundle;

    invoke-virtual {v5, v0, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;
    :try_end_d8
    .catch Ljava/lang/Exception; {:try_start_12 .. :try_end_d8} :catch_15e

    :cond_d8
    :try_start_d8
    const-string v0, "O"

    invoke-static {p0, v0}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    instance-of v6, v0, Ljava/util/ArrayList;

    if-eqz v6, :cond_13e

    move-object v6, v0

    check-cast v6, Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_13e

    const-string v6, "P"

    invoke-static {p0, v6}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Number;

    invoke-virtual {v6}, Ljava/lang/Number;->intValue()I

    move-result v6

    const-string v8, "e.e.a.v0"

    invoke-static {v8}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    const-string v9, "a"

    const-class v10, Landroid/content/Intent;

    const-class v11, Ljava/util/ArrayList;

    sget-object v12, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    sget-object v13, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    filled-new-array {v10, v11, v12, v13}, [Ljava/lang/Class;

    move-result-object v10

    invoke-virtual {v8, v9, v10}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v8

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v10

    filled-new-array {v5, v0, v9, v10}, [Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v8, v7, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "playlistposition"

    invoke-virtual {v5, v0, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object v0

    const-string v6, "isContinuousPlay"

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    const-string v9, "j0"

    invoke-virtual {v8, v9}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v8

    invoke-virtual {v8, v7}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v7

    invoke-virtual {v0, v6, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;
    :try_end_137
    .catch Ljava/lang/Exception; {:try_start_d8 .. :try_end_137} :catch_138

    goto :goto_13e

    :catch_138
    move-exception v0

    :try_start_139
    const-string v6, "Cannot preserve native return queue"

    invoke-static {v1, v6, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_13e
    :goto_13e
    invoke-static {p0, v5, v3}, Le/e/a/TabPlayback110;->transfer(Ljava/lang/Object;Landroid/content/Intent;Z)V

    invoke-static {p0, v5}, Le/e/a/PlaybackNavigation114;->launch(Landroid/app/Service;Landroid/content/Intent;)V

    new-instance p0, Le/e/a/PopupReturn244$$ExternalSyntheticLambda3;

    invoke-direct {p0, v2}, Le/e/a/PopupReturn244$$ExternalSyntheticLambda3;-><init>(Le/e/a/PopupReturn244$Pending;)V

    iput-object p0, v2, Le/e/a/PopupReturn244$Pending;->timeout:Ljava/lang/Runnable;

    sget-object p0, Le/e/a/PopupReturn244;->MAIN:Landroid/os/Handler;

    iget-object v0, v2, Le/e/a/PopupReturn244$Pending;->timeout:Ljava/lang/Runnable;

    const-wide/16 v5, 0x7530

    invoke-virtual {p0, v0, v5, v6}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return v3

    :cond_155
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Invalid retained video identifier"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_15d
    .catch Ljava/lang/Exception; {:try_start_139 .. :try_end_15d} :catch_15e

    :cond_15d
    :goto_15d
    return v4

    :catch_15e
    move-exception p0

    sget-object v0, Le/e/a/PopupReturn244;->pending:Le/e/a/PopupReturn244$Pending;

    if-eqz v0, :cond_168

    sget-object v0, Le/e/a/PopupReturn244;->pending:Le/e/a/PopupReturn244$Pending;

    invoke-static {v0}, Le/e/a/PopupReturn244;->cancel(Le/e/a/PopupReturn244$Pending;)V

    :cond_168
    const-string v0, "Cannot return retained popup"

    invoke-static {v1, v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return v4
.end method
