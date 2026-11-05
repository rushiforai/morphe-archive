.class final Le/e/a/PlayerDownloads116$Watcher;
.super Ljava/lang/Object;
.source "PlayerDownloads116.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;
.implements Landroid/view/View$OnAttachStateChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/PlayerDownloads116;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Watcher"
.end annotation


# instance fields
.field final activity:Landroid/app/Activity;

.field final owner:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field final root:Landroid/view/View;


# direct methods
.method constructor <init>(Ljava/lang/Object;Landroid/app/Activity;Landroid/view/View;)V
    .registers 5

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Le/e/a/PlayerDownloads116$Watcher;->owner:Ljava/lang/ref/WeakReference;

    iput-object p2, p0, Le/e/a/PlayerDownloads116$Watcher;->activity:Landroid/app/Activity;

    iput-object p3, p0, Le/e/a/PlayerDownloads116$Watcher;->root:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .registers 4

    .line 12
    iget-object v0, p0, Le/e/a/PlayerDownloads116$Watcher;->owner:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_3d

    iget-object v1, p0, Le/e/a/PlayerDownloads116$Watcher;->activity:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->isFinishing()Z

    move-result v1

    if-nez v1, :cond_3d

    iget-object v1, p0, Le/e/a/PlayerDownloads116$Watcher;->activity:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->isDestroyed()Z

    move-result v1

    if-eqz v1, :cond_19

    goto :goto_3d

    :cond_19
    :try_start_19
    const-string v1, "x1"

    invoke-static {v0, v1}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    iget-object v2, p0, Le/e/a/PlayerDownloads116$Watcher;->root:Landroid/view/View;

    if-eq v1, v2, :cond_27

    invoke-virtual {p0}, Le/e/a/PlayerDownloads116$Watcher;->stop()V
    :try_end_26
    .catch Ljava/lang/Exception; {:try_start_19 .. :try_end_26} :catch_3c

    return-void

    :cond_27
    iget-object v1, p0, Le/e/a/PlayerDownloads116$Watcher;->activity:Landroid/app/Activity;

    iget-object v2, p0, Le/e/a/PlayerDownloads116$Watcher;->root:Landroid/view/View;

    invoke-static {v0, v1, v2}, Le/e/a/PlayerDownloads116;->install(Ljava/lang/Object;Landroid/app/Activity;Landroid/view/View;)V

    iget-object v0, p0, Le/e/a/PlayerDownloads116$Watcher;->root:Landroid/view/View;

    const-string v1, "nicoid-save-mp4-116"

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_3b

    invoke-virtual {p0}, Le/e/a/PlayerDownloads116$Watcher;->stop()V

    :cond_3b
    return-void

    :catch_3c
    move-exception v0

    :cond_3d
    :goto_3d
    invoke-virtual {p0}, Le/e/a/PlayerDownloads116$Watcher;->stop()V

    return-void
.end method

.method public onViewAttachedToWindow(Landroid/view/View;)V
    .registers 2

    .line 12
    invoke-virtual {p0}, Le/e/a/PlayerDownloads116$Watcher;->onGlobalLayout()V

    return-void
.end method

.method public onViewDetachedFromWindow(Landroid/view/View;)V
    .registers 2

    .line 12
    invoke-virtual {p0}, Le/e/a/PlayerDownloads116$Watcher;->stop()V

    return-void
.end method

.method stop()V
    .registers 3

    .line 12
    iget-object v0, p0, Le/e/a/PlayerDownloads116$Watcher;->root:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_15

    iget-object v0, p0, Le/e/a/PlayerDownloads116$Watcher;->root:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    :cond_15
    iget-object v0, p0, Le/e/a/PlayerDownloads116$Watcher;->root:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    sget-object v0, Le/e/a/PlayerDownloads116;->WAITING:Ljava/util/WeakHashMap;

    iget-object v1, p0, Le/e/a/PlayerDownloads116$Watcher;->root:Landroid/view/View;

    invoke-virtual {v0, v1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_33

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p0, :cond_33

    sget-object v0, Le/e/a/PlayerDownloads116;->WAITING:Ljava/util/WeakHashMap;

    iget-object v1, p0, Le/e/a/PlayerDownloads116$Watcher;->root:Landroid/view/View;

    invoke-virtual {v0, v1}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_33
    return-void
.end method
