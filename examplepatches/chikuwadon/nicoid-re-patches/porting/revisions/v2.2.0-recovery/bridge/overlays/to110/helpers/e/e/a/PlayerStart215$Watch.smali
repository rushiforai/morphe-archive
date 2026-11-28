.class final Le/e/a/PlayerStart215$Watch;
.super Ljava/lang/Object;
.source "PlayerStart215.java"

# interfaces
.implements Ljava/lang/Runnable;
.implements Landroid/view/View$OnAttachStateChangeListener;
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/PlayerStart215;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Watch"
.end annotation


# instance fields
.field final buttons:[Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field finished:Z

.field hook:Le/e/a/PlayerStart215$Hook;

.field observer:Landroid/view/ViewTreeObserver;

.field pendingReveal:Z

.field final root:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field source:Landroid/view/TextureView;

.field final wanted:[Z


# direct methods
.method constructor <init>(Landroid/view/View;)V
    .registers 9

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x3

    .line 44
    new-array v1, v0, [Z

    iput-object v1, p0, Le/e/a/PlayerStart215$Watch;->wanted:[Z

    .line 51
    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v1, p0, Le/e/a/PlayerStart215$Watch;->root:Ljava/lang/ref/WeakReference;

    .line 52
    new-array v1, v0, [Ljava/lang/ref/WeakReference;

    iput-object v1, p0, Le/e/a/PlayerStart215$Watch;->buttons:[Ljava/lang/ref/WeakReference;

    .line 53
    const-string v1, "prevbutton"

    const-string v2, "nextbutton"

    const-string v3, "viewbutton"

    filled-new-array {v3, v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-lt v3, v0, :cond_0

    return-void

    .line 55
    :cond_0
    aget-object v4, v1, v3

    # invokes: Le/e/a/PlayerStart215;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;
    invoke-static {p1, v4}, Le/e/a/PlayerStart215;->access$0(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v4

    .line 56
    iget-object v5, p0, Le/e/a/PlayerStart215$Watch;->buttons:[Ljava/lang/ref/WeakReference;

    new-instance v6, Ljava/lang/ref/WeakReference;

    invoke-direct {v6, v4}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    aput-object v6, v5, v3

    .line 57
    iget-object v5, p0, Le/e/a/PlayerStart215$Watch;->wanted:[Z

    if-eqz v4, :cond_1

    invoke-virtual {v4}, Landroid/view/View;->getVisibility()I

    move-result v4

    if-nez v4, :cond_1

    const/4 v4, 0x1

    goto :goto_1

    :cond_1
    move v4, v2

    :goto_1
    aput-boolean v4, v5, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_0
.end method

.method static synthetic lambda$2(Ljava/lang/ref/WeakReference;)V
    .registers 2

    .line 207
    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le/e/a/PlayerStart215$Watch;

    if-eqz p0, :cond_1

    .line 208
    iget-boolean v0, p0, Le/e/a/PlayerStart215$Watch;->finished:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Le/e/a/PlayerStart215$Watch;->pendingReveal:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Le/e/a/PlayerStart215$Watch;->separateQueueButtons(Z)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Le/e/a/PlayerStart215$Watch;->reveal()V

    return-void

    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Le/e/a/PlayerStart215$Watch;->separateQueueButtons(Z)Z

    :cond_1
    return-void
.end method


# virtual methods
.method begin()V
    .registers 2

    .line 62
    iget-object v0, p0, Le/e/a/PlayerStart215$Watch;->root:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    if-nez v0, :cond_0

    return-void

    .line 64
    :cond_0
    invoke-virtual {p0}, Le/e/a/PlayerStart215$Watch;->hide()V

    .line 65
    invoke-virtual {v0, p0}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 66
    invoke-virtual {p0, v0}, Le/e/a/PlayerStart215$Watch;->observe(Landroid/view/View;)V

    .line 67
    invoke-virtual {v0, p0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method bind(Landroid/view/TextureView;)V
    .registers 4

    .line 112
    iget-object v0, p0, Le/e/a/PlayerStart215$Watch;->source:Landroid/view/TextureView;

    if-ne v0, p1, :cond_0

    iget-object v0, p0, Le/e/a/PlayerStart215$Watch;->hook:Le/e/a/PlayerStart215$Hook;

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Landroid/view/TextureView;->getSurfaceTextureListener()Landroid/view/TextureView$SurfaceTextureListener;

    move-result-object v0

    iget-object v1, p0, Le/e/a/PlayerStart215$Watch;->hook:Le/e/a/PlayerStart215$Hook;

    if-ne v0, v1, :cond_0

    return-void

    .line 113
    :cond_0
    invoke-virtual {p0}, Le/e/a/PlayerStart215$Watch;->unbind()V

    .line 114
    iput-object p1, p0, Le/e/a/PlayerStart215$Watch;->source:Landroid/view/TextureView;

    .line 116
    :try_start_0
    new-instance v0, Le/e/a/PlayerStart215$Hook;

    invoke-virtual {p1}, Landroid/view/TextureView;->getSurfaceTextureListener()Landroid/view/TextureView$SurfaceTextureListener;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Le/e/a/PlayerStart215$Hook;-><init>(Le/e/a/PlayerStart215$Watch;Landroid/view/TextureView$SurfaceTextureListener;)V

    iput-object v0, p0, Le/e/a/PlayerStart215$Watch;->hook:Le/e/a/PlayerStart215$Hook;

    .line 117
    invoke-virtual {p1, v0}, Landroid/view/TextureView;->setSurfaceTextureListener(Landroid/view/TextureView$SurfaceTextureListener;)V

    .line 118
    const-string p1, "player-center TextureView frame observer attached"

    invoke-static {p1}, Le/e/a/ModernDebug;->record(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 120
    const-string v0, "nicoid-start"

    const-string v1, "Could not observe decoded output"

    invoke-static {v0, v1, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    const/4 p1, 0x0

    .line 121
    iput-object p1, p0, Le/e/a/PlayerStart215$Watch;->source:Landroid/view/TextureView;

    iput-object p1, p0, Le/e/a/PlayerStart215$Watch;->hook:Le/e/a/PlayerStart215$Hook;

    return-void
.end method

.method firstFrame()V
    .registers 5

    .line 125
    iget-boolean v0, p0, Le/e/a/PlayerStart215$Watch;->finished:Z

    if-nez v0, :cond_0

    .line 126
    iget-object v0, p0, Le/e/a/PlayerStart215$Watch;->root:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    if-nez v0, :cond_1

    :cond_0
    return-void

    :cond_1
    const/4 v1, 0x1

    .line 128
    iput-boolean v1, p0, Le/e/a/PlayerStart215$Watch;->finished:Z

    .line 129
    invoke-virtual {v0, p0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 130
    invoke-virtual {p0}, Le/e/a/PlayerStart215$Watch;->unbind()V

    .line 131
    iput-boolean v1, p0, Le/e/a/PlayerStart215$Watch;->pendingReveal:Z

    .line 134
    invoke-virtual {p0, v1}, Le/e/a/PlayerStart215$Watch;->separateQueueButtons(Z)Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-virtual {p0}, Le/e/a/PlayerStart215$Watch;->reveal()V

    .line 135
    :cond_2
    new-instance v1, Le/e/a/PlayerStart215$Watch$0;

    invoke-direct {v1, p0}, Le/e/a/PlayerStart215$Watch$0;-><init>(Le/e/a/PlayerStart215$Watch;)V

    const-wide/16 v2, 0x7d0

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 142
    new-instance v1, Le/e/a/PlayerStart215$Watch$1;

    invoke-direct {v1, p0, v0}, Le/e/a/PlayerStart215$Watch$1;-><init>(Le/e/a/PlayerStart215$Watch;Landroid/view/View;)V

    const-wide/16 v2, 0x12c0

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 146
    # getter for: Le/e/a/PlayerStart215;->ACTIVE:Ljava/util/WeakHashMap;
    invoke-static {}, Le/e/a/PlayerStart215;->access$2()Ljava/util/WeakHashMap;

    move-result-object v1

    monitor-enter v1

    :try_start_0
    # getter for: Le/e/a/PlayerStart215;->ACTIVE:Ljava/util/WeakHashMap;
    invoke-static {}, Le/e/a/PlayerStart215;->access$2()Ljava/util/WeakHashMap;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 147
    invoke-static {v0}, Le/e/a/FullscreenHandoff211;->firstFrame(Landroid/view/View;)V

    invoke-static {v0}, Le/e/a/PausedCenter218;->afterFrame(Landroid/view/View;)V

    .line 148
    invoke-virtual {p0}, Le/e/a/PlayerStart215$Watch;->scheduleQueueSpacing()V

    .line 149
    const-string p0, "player-center first frame, queue positions checked before visible"

    invoke-static {p0}, Le/e/a/ModernDebug;->record(Ljava/lang/String;)V

    return-void

    .line 146
    :goto_0
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0

    :catchall_0
    move-exception p0

    goto :goto_0
.end method

.method hasControls()Z
    .registers 2

    .line 60
    iget-object p0, p0, Le/e/a/PlayerStart215$Watch;->buttons:[Ljava/lang/ref/WeakReference;

    const/4 v0, 0x0

    aget-object p0, p0, v0

    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    return v0
.end method

.method hide()V
    .registers 5

    const/4 v0, 0x0

    :goto_0
    const/4 v1, 0x3

    if-lt v0, v1, :cond_0

    return-void

    .line 71
    :cond_0
    iget-object v1, p0, Le/e/a/PlayerStart215$Watch;->buttons:[Ljava/lang/ref/WeakReference;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    if-eqz v1, :cond_1

    .line 73
    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    move-result v2

    if-nez v2, :cond_1

    .line 74
    iget-object v2, p0, Le/e/a/PlayerStart215$Watch;->wanted:[Z

    const/4 v3, 0x1

    aput-boolean v3, v2, v0

    const/4 v2, 0x4

    .line 75
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method synthetic lambda$0$e-e-a-PlayerStart215$Watch()V
    .registers 3

    .line 136
    iget-boolean v0, p0, Le/e/a/PlayerStart215$Watch;->pendingReveal:Z

    if-eqz v0, :cond_0

    .line 138
    const-string v0, "nicoid-start"

    const-string v1, "Queue controls not measurable; retaining native fallback"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 139
    invoke-virtual {p0}, Le/e/a/PlayerStart215$Watch;->reveal()V

    :cond_0
    return-void
.end method

.method synthetic lambda$1$e-e-a-PlayerStart215$Watch(Landroid/view/View;)V
    .registers 2

    .line 143
    invoke-virtual {p0}, Le/e/a/PlayerStart215$Watch;->unobserve()V

    .line 144
    invoke-virtual {p1, p0}, Landroid/view/View;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    return-void
.end method

.method observe(Landroid/view/View;)V
    .registers 3

    .line 90
    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object p1

    .line 91
    iget-object v0, p0, Le/e/a/PlayerStart215$Watch;->observer:Landroid/view/ViewTreeObserver;

    if-eq p1, v0, :cond_0

    .line 92
    invoke-virtual {p0}, Le/e/a/PlayerStart215$Watch;->unobserve()V

    .line 93
    invoke-virtual {p1}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1, p0}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    iput-object p1, p0, Le/e/a/PlayerStart215$Watch;->observer:Landroid/view/ViewTreeObserver;

    :cond_0
    return-void
.end method

.method public onPreDraw()Z
    .registers 3

    .line 100
    iget-boolean v0, p0, Le/e/a/PlayerStart215$Watch;->finished:Z

    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 101
    invoke-virtual {p0}, Le/e/a/PlayerStart215$Watch;->hide()V

    goto :goto_0

    .line 102
    :cond_0
    iget-boolean v0, p0, Le/e/a/PlayerStart215$Watch;->pendingReveal:Z

    if-eqz v0, :cond_1

    .line 104
    invoke-virtual {p0, v1}, Le/e/a/PlayerStart215$Watch;->separateQueueButtons(Z)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Le/e/a/PlayerStart215$Watch;->reveal()V

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 107
    invoke-virtual {p0, v0}, Le/e/a/PlayerStart215$Watch;->separateQueueButtons(Z)Z

    :cond_2
    :goto_0
    return v1
.end method

.method public onViewAttachedToWindow(Landroid/view/View;)V
    .registers 2

    .line 218
    invoke-virtual {p0, p1}, Le/e/a/PlayerStart215$Watch;->observe(Landroid/view/View;)V

    invoke-virtual {p1, p0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    invoke-virtual {p1, p0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public onViewDetachedFromWindow(Landroid/view/View;)V
    .registers 2

    .line 220
    invoke-virtual {p1, p0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 221
    invoke-virtual {p0}, Le/e/a/PlayerStart215$Watch;->unobserve()V

    .line 222
    invoke-virtual {p0}, Le/e/a/PlayerStart215$Watch;->unbind()V

    return-void
.end method

.method reveal()V
    .registers 6

    .line 152
    iget-boolean v0, p0, Le/e/a/PlayerStart215$Watch;->pendingReveal:Z

    if-eqz v0, :cond_0

    .line 153
    iget-object v0, p0, Le/e/a/PlayerStart215$Watch;->root:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    if-nez v0, :cond_1

    :cond_0
    return-void

    :cond_1
    const/4 v0, 0x0

    move v1, v0

    :goto_0
    const/4 v2, 0x3

    if-lt v1, v2, :cond_2

    .line 161
    iput-boolean v0, p0, Le/e/a/PlayerStart215$Watch;->pendingReveal:Z

    .line 162
    const-string p0, "nicoid-start"

    const-string v0, "Center controls revealed after queue geometry correction"

    invoke-static {p0, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 163
    const-string p0, "player-center revealed only after queue spacing"

    invoke-static {p0}, Le/e/a/ModernDebug;->record(Ljava/lang/String;)V

    return-void

    .line 157
    :cond_2
    iget-object v2, p0, Le/e/a/PlayerStart215$Watch;->buttons:[Ljava/lang/ref/WeakReference;

    aget-object v2, v2, v1

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    if-eqz v2, :cond_3

    .line 158
    iget-object v3, p0, Le/e/a/PlayerStart215$Watch;->wanted:[Z

    aget-boolean v3, v3, v1

    if-eqz v3, :cond_3

    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    move-result v3

    const/4 v4, 0x4

    if-ne v3, v4, :cond_3

    .line 159
    invoke-virtual {v2, v0}, Landroid/view/View;->setVisibility(I)V

    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public run()V
    .registers 4

    iget-object v0, p0, Le/e/a/PlayerStart215$Watch;->root:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-static {v0}, Le/e/a/PausedCenter218;->canUsePausedFrame(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Le/e/a/PlayerStart215$Watch;->firstFrame()V

    return-void

    .line 80
    :cond_0
    iget-object v0, p0, Le/e/a/PlayerStart215$Watch;->root:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    if-eqz v0, :cond_3

    .line 81
    iget-boolean v1, p0, Le/e/a/PlayerStart215$Watch;->finished:Z

    if-nez v1, :cond_3

    .line 82
    invoke-virtual {p0}, Le/e/a/PlayerStart215$Watch;->hide()V

    .line 83
    iget-object v1, p0, Le/e/a/PlayerStart215$Watch;->source:Landroid/view/TextureView;

    if-eqz v1, :cond_1

    invoke-virtual {v1}, Landroid/view/TextureView;->isAttachedToWindow()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Le/e/a/PlayerStart215$Watch;->source:Landroid/view/TextureView;

    invoke-virtual {v1}, Landroid/view/TextureView;->getSurfaceTextureListener()Landroid/view/TextureView$SurfaceTextureListener;

    move-result-object v1

    iget-object v2, p0, Le/e/a/PlayerStart215$Watch;->hook:Le/e/a/PlayerStart215$Hook;

    if-eq v1, v2, :cond_2

    .line 84
    :cond_1
    # invokes: Le/e/a/PlayerStart215;->texture(Landroid/view/View;)Landroid/view/TextureView;
    invoke-static {v0}, Le/e/a/PlayerStart215;->access$1(Landroid/view/View;)Landroid/view/TextureView;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 85
    invoke-virtual {v1}, Landroid/view/TextureView;->isAttachedToWindow()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-virtual {p0, v1}, Le/e/a/PlayerStart215$Watch;->bind(Landroid/view/TextureView;)V

    .line 87
    :cond_2
    iget-boolean v1, p0, Le/e/a/PlayerStart215$Watch;->finished:Z

    if-nez v1, :cond_3

    const-wide/16 v1, 0x20

    invoke-virtual {v0, p0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_3
    return-void
.end method

.method scheduleQueueSpacing()V
    .registers 9

    .line 203
    iget-object v0, p0, Le/e/a/PlayerStart215$Watch;->root:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    if-eqz v0, :cond_0

    .line 204
    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    const/4 p0, 0x7

    .line 205
    new-array v2, p0, [I

    const/16 v3, 0x50

    const/4 v4, 0x1

    aput v3, v2, v4

    const/4 v3, 0x2

    const/16 v4, 0xfa

    aput v4, v2, v3

    const/4 v3, 0x3

    const/16 v4, 0x226

    aput v4, v2, v3

    const/4 v3, 0x4

    const/16 v4, 0x4b0

    aput v4, v2, v3

    const/4 v3, 0x5

    const/16 v4, 0x9c4

    aput v4, v2, v3

    const/4 v3, 0x6

    const/16 v4, 0x1068

    aput v4, v2, v3

    const/4 v3, 0x0

    :goto_0
    if-lt v3, p0, :cond_1

    :cond_0
    return-void

    :cond_1
    aget v4, v2, v3

    .line 206
    new-instance v5, Le/e/a/PlayerStart215$Watch$2;

    invoke-direct {v5, v1}, Le/e/a/PlayerStart215$Watch$2;-><init>(Ljava/lang/ref/WeakReference;)V

    int-to-long v6, v4

    invoke-virtual {v0, v5, v6, v7}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    add-int/lit8 v3, v3, 0x1

    goto :goto_0
.end method

.method separateQueueButtons(Z)Z
    .registers 19

    move-object/from16 v0, p0

    .line 169
    iget-object v1, v0, Le/e/a/PlayerStart215$Watch;->root:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    const/4 v2, 0x0

    if-eqz v1, :cond_9

    .line 170
    invoke-virtual {v1}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v3

    if-eqz v3, :cond_9

    .line 171
    iget-object v3, v0, Le/e/a/PlayerStart215$Watch;->buttons:[Ljava/lang/ref/WeakReference;

    aget-object v3, v3, v2

    invoke-virtual {v3}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    .line 172
    const-string v4, "videoLayout"

    # invokes: Le/e/a/PlayerStart215;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;
    invoke-static {v1, v4}, Le/e/a/PlayerStart215;->access$0(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v4

    if-eqz v3, :cond_8

    if-eqz v4, :cond_8

    .line 173
    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    move-result v5

    const/4 v6, 0x1

    if-lt v5, v6, :cond_8

    invoke-virtual {v4}, Landroid/view/View;->getWidth()I

    move-result v5

    if-lt v5, v6, :cond_8

    const/4 v5, 0x2

    .line 174
    new-array v7, v5, [I

    new-array v8, v5, [I

    .line 175
    invoke-virtual {v3, v7}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 176
    invoke-virtual {v4, v8}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 177
    aget v7, v7, v2

    int-to-float v7, v7

    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    move-result v9

    int-to-float v9, v9

    const/high16 v10, 0x40000000    # 2.0f

    div-float/2addr v9, v10

    add-float/2addr v7, v9

    .line 178
    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    const/high16 v9, 0x41000000    # 8.0f

    mul-float/2addr v1, v9

    move v9, v6

    :goto_0
    const/4 v11, 0x3

    if-lt v9, v11, :cond_0

    return v6

    .line 180
    :cond_0
    iget-object v11, v0, Le/e/a/PlayerStart215$Watch;->buttons:[Ljava/lang/ref/WeakReference;

    aget-object v11, v11, v9

    invoke-virtual {v11}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Landroid/view/View;

    if-eqz v11, :cond_3

    .line 182
    invoke-virtual {v11}, Landroid/view/View;->getVisibility()I

    move-result v12

    if-eqz v12, :cond_1

    if-eqz p1, :cond_3

    .line 183
    iget-object v12, v0, Le/e/a/PlayerStart215$Watch;->wanted:[Z

    aget-boolean v12, v12, v9

    if-eqz v12, :cond_3

    invoke-virtual {v11}, Landroid/view/View;->getVisibility()I

    move-result v12

    const/4 v13, 0x4

    if-ne v12, v13, :cond_3

    .line 185
    :cond_1
    invoke-virtual {v11}, Landroid/view/View;->getWidth()I

    move-result v12

    if-ge v12, v6, :cond_2

    return v2

    .line 186
    :cond_2
    new-array v12, v5, [I

    invoke-virtual {v11, v12}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 187
    aget v12, v12, v2

    int-to-float v12, v12

    invoke-virtual {v11}, Landroid/view/View;->getWidth()I

    move-result v13

    int-to-float v13, v13

    div-float/2addr v13, v10

    add-float/2addr v12, v13

    .line 188
    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    move-result v13

    invoke-virtual {v11}, Landroid/view/View;->getWidth()I

    move-result v14

    add-int/2addr v13, v14

    int-to-float v13, v13

    div-float/2addr v13, v10

    const v14, 0x3e99999a    # 0.3f

    mul-float/2addr v14, v1

    add-float/2addr v13, v14

    sub-float v14, v12, v7

    .line 189
    invoke-static {v14}, Ljava/lang/Math;->abs(F)F

    move-result v14

    cmpl-float v13, v14, v13

    if-ltz v13, :cond_4

    :cond_3
    move/from16 v16, v2

    goto :goto_3

    :cond_4
    if-ne v9, v6, :cond_5

    const/4 v13, -0x1

    goto :goto_1

    :cond_5
    move v13, v6

    :goto_1
    int-to-float v13, v13

    .line 190
    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    move-result v14

    invoke-virtual {v11}, Landroid/view/View;->getWidth()I

    move-result v15

    add-int/2addr v14, v15

    int-to-float v14, v14

    div-float/2addr v14, v10

    add-float/2addr v14, v1

    mul-float/2addr v13, v14

    add-float/2addr v13, v7

    .line 191
    aget v14, v8, v2

    int-to-float v14, v14

    invoke-virtual {v11}, Landroid/view/View;->getWidth()I

    move-result v15

    int-to-float v15, v15

    div-float/2addr v15, v10

    add-float/2addr v14, v15

    add-float/2addr v14, v1

    .line 192
    aget v15, v8, v2

    invoke-virtual {v4}, Landroid/view/View;->getWidth()I

    move-result v16

    add-int v15, v15, v16

    int-to-float v15, v15

    move/from16 v16, v2

    invoke-virtual {v11}, Landroid/view/View;->getWidth()I

    move-result v2

    int-to-float v2, v2

    div-float/2addr v2, v10

    sub-float/2addr v15, v2

    sub-float/2addr v15, v1

    .line 193
    invoke-static {v15, v13}, Ljava/lang/Math;->min(FF)F

    move-result v2

    invoke-static {v14, v2}, Ljava/lang/Math;->max(FF)F

    move-result v2

    sub-float v13, v2, v12

    .line 194
    invoke-static {v13}, Ljava/lang/Math;->abs(F)F

    move-result v13

    const/high16 v14, 0x3f800000    # 1.0f

    cmpl-float v13, v13, v14

    if-lez v13, :cond_7

    .line 195
    invoke-virtual {v11}, Landroid/view/View;->getTranslationX()F

    move-result v13

    add-float/2addr v13, v2

    sub-float/2addr v13, v12

    invoke-virtual {v11, v13}, Landroid/view/View;->setTranslationX(F)V

    .line 196
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v11, "player-center separated "

    invoke-direct {v2, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    if-ne v9, v6, :cond_6

    const-string v11, "previous"

    goto :goto_2

    :cond_6
    const-string v11, "next"

    :goto_2
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 197
    const-string v11, " from center after queued first frame"

    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 196
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Le/e/a/ModernDebug;->record(Ljava/lang/String;)V

    :cond_7
    :goto_3
    add-int/lit8 v9, v9, 0x1

    move/from16 v2, v16

    goto/16 :goto_0

    :cond_8
    move/from16 v16, v2

    return v16

    :cond_9
    move/from16 v16, v2

    return v16
.end method

.method unbind()V
    .registers 4

    .line 213
    iget-object v0, p0, Le/e/a/PlayerStart215$Watch;->source:Landroid/view/TextureView;

    iget-object v1, p0, Le/e/a/PlayerStart215$Watch;->hook:Le/e/a/PlayerStart215$Hook;

    if-eqz v0, :cond_0

    if-eqz v1, :cond_0

    .line 214
    invoke-virtual {v0}, Landroid/view/TextureView;->getSurfaceTextureListener()Landroid/view/TextureView$SurfaceTextureListener;

    move-result-object v2

    if-ne v2, v1, :cond_0

    .line 215
    iget-object v1, v1, Le/e/a/PlayerStart215$Hook;->previous:Landroid/view/TextureView$SurfaceTextureListener;

    invoke-virtual {v0, v1}, Landroid/view/TextureView;->setSurfaceTextureListener(Landroid/view/TextureView$SurfaceTextureListener;)V

    :cond_0
    const/4 v0, 0x0

    .line 216
    iput-object v0, p0, Le/e/a/PlayerStart215$Watch;->source:Landroid/view/TextureView;

    iput-object v0, p0, Le/e/a/PlayerStart215$Watch;->hook:Le/e/a/PlayerStart215$Hook;

    return-void
.end method

.method unobserve()V
    .registers 2

    .line 96
    iget-object v0, p0, Le/e/a/PlayerStart215$Watch;->observer:Landroid/view/ViewTreeObserver;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Le/e/a/PlayerStart215$Watch;->observer:Landroid/view/ViewTreeObserver;

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    :cond_0
    const/4 v0, 0x0

    .line 97
    iput-object v0, p0, Le/e/a/PlayerStart215$Watch;->observer:Landroid/view/ViewTreeObserver;

    return-void
.end method
