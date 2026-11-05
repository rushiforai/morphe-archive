.class public Lcom/sauzask/nicoid/NicoidPopupViewService$k;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;
.source ""


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sauzask/nicoid/NicoidPopupViewService;->onStartCommand(Landroid/content/Intent;II)I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/sauzask/nicoid/NicoidPopupViewService;


# virtual methods
.method public onDoubleTap(Landroid/view/MotionEvent;)Z
    .registers 5

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService$k;->a:Lcom/sauzask/nicoid/NicoidPopupViewService;

    invoke-static {v0, p1}, Le/e/a/PopupGestures;->doubleTap(Ljava/lang/Object;Landroid/view/MotionEvent;)Z

    move-result v1

    if-eqz v1, :cond_a

    const/4 v1, 0x1

    return v1

    .line 1
    :cond_a
    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidPopupViewService;->b0:Landroid/content/Context;

    .line 2
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/sauzask/nicoid/NicoidPopupViewService;

    invoke-direct {v1, v0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v1}, Landroid/content/Context;->stopService(Landroid/content/Intent;)Z

    invoke-super {p0, p1}, Landroid/view/GestureDetector$SimpleOnGestureListener;->onDoubleTap(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method
