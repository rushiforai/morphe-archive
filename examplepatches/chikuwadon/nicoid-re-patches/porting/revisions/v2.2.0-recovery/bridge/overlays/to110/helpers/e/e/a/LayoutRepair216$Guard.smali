.class final Le/e/a/LayoutRepair216$Guard;
.super Ljava/lang/Object;
.source "LayoutRepair216.java"

# interfaces
.implements Landroid/view/Choreographer$FrameCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/LayoutRepair216;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Guard"
.end annotation


# instance fields
.field final activity:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field

.field cancelled:Z

.field final frames:Landroid/view/Choreographer;

.field final panel:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroid/app/Activity;Landroid/view/View;)V
    .registers 4

    .line 81
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 78
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    move-result-object v0

    iput-object v0, p0, Le/e/a/LayoutRepair216$Guard;->frames:Landroid/view/Choreographer;

    .line 82
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Le/e/a/LayoutRepair216$Guard;->activity:Ljava/lang/ref/WeakReference;

    .line 83
    new-instance p1, Ljava/lang/ref/WeakReference;

    invoke-direct {p1, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Le/e/a/LayoutRepair216$Guard;->panel:Ljava/lang/ref/WeakReference;

    .line 84
    return-void
.end method


# virtual methods
.method cancel()V
    .registers 2

    .line 86
    const/4 v0, 0x1

    iput-boolean v0, p0, Le/e/a/LayoutRepair216$Guard;->cancelled:Z

    .line 87
    iget-object v0, p0, Le/e/a/LayoutRepair216$Guard;->frames:Landroid/view/Choreographer;

    invoke-virtual {v0, p0}, Landroid/view/Choreographer;->removeFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 88
    return-void
.end method

.method public doFrame(J)V
    .registers 4

    .line 93
    iget-object p1, p0, Le/e/a/LayoutRepair216$Guard;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/app/Activity;

    .line 94
    iget-object p2, p0, Le/e/a/LayoutRepair216$Guard;->panel:Ljava/lang/ref/WeakReference;

    invoke-virtual {p2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/view/View;

    .line 95
    iget-boolean v0, p0, Le/e/a/LayoutRepair216$Guard;->cancelled:Z

    if-nez v0, :cond_2

    if-eqz p1, :cond_2

    invoke-virtual {p1}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {p1}, Landroid/app/Activity;->isDestroyed()Z

    move-result v0

    if-nez v0, :cond_2

    if-eqz p2, :cond_2

    .line 96
    invoke-virtual {p2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p2

    if-nez p2, :cond_0

    goto :goto_0

    .line 101
    :cond_0
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p1

    .line 102
    if-eqz p1, :cond_1

    invoke-virtual {p1}, Landroid/view/View;->isLayoutRequested()Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-static {p1}, Le/e/a/LayoutRepair216;->sanitize(Landroid/view/View;)V

    .line 103
    :cond_1
    invoke-virtual {p0}, Le/e/a/LayoutRepair216$Guard;->schedule()V

    .line 104
    return-void

    .line 97
    :cond_2
    :goto_0
    invoke-virtual {p0}, Le/e/a/LayoutRepair216$Guard;->cancel()V

    .line 98
    if-eqz p1, :cond_3

    # getter for: Le/e/a/LayoutRepair216;->GUARDS:Ljava/util/WeakHashMap;
    invoke-static {}, Le/e/a/LayoutRepair216;->access$000()Ljava/util/WeakHashMap;

    move-result-object p2

    invoke-virtual {p2, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    if-ne p2, p0, :cond_3

    # getter for: Le/e/a/LayoutRepair216;->GUARDS:Ljava/util/WeakHashMap;
    invoke-static {}, Le/e/a/LayoutRepair216;->access$000()Ljava/util/WeakHashMap;

    move-result-object p2

    invoke-virtual {p2, p1}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    :cond_3
    return-void
.end method

.method schedule()V
    .registers 2

    .line 90
    iget-boolean v0, p0, Le/e/a/LayoutRepair216$Guard;->cancelled:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Le/e/a/LayoutRepair216$Guard;->frames:Landroid/view/Choreographer;

    invoke-virtual {v0, p0}, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 91
    :cond_0
    return-void
.end method
