.class Le/e/a/ListActions$Hold;
.super Ljava/lang/Object;
.source "ListActions.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;
.implements Landroid/view/View$OnLongClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/ListActions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Hold"
.end annotation


# instance fields
.field final adapter:Ljava/lang/Object;

.field cancelled:Z

.field down:Z

.field final handler:Landroid/os/Handler;

.field longPressed:Z

.field pending:Ljava/lang/Runnable;

.field popup:Landroid/widget/PopupWindow;

.field final row:Ljava/lang/Object;

.field startX:F

.field startY:F

.field started:J

.field superHandled:Z

.field final title:Ljava/lang/String;

.field final url:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)V
    .registers 6

    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    # getter for: Le/e/a/ListActions;->MAIN:Landroid/os/Handler;
    invoke-static {}, Le/e/a/ListActions;->access$0()Landroid/os/Handler;

    move-result-object v0

    iput-object v0, p0, Le/e/a/ListActions$Hold;->handler:Landroid/os/Handler;

    .line 54
    iput-object p1, p0, Le/e/a/ListActions$Hold;->adapter:Ljava/lang/Object;

    iput-object p2, p0, Le/e/a/ListActions$Hold;->row:Ljava/lang/Object;

    iput-object p3, p0, Le/e/a/ListActions$Hold;->url:Ljava/lang/String;

    iput-object p4, p0, Le/e/a/ListActions$Hold;->title:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method cancel()V
    .registers 3

    .line 74
    iget-object v0, p0, Le/e/a/ListActions$Hold;->pending:Ljava/lang/Runnable;

    if-eqz v0, :cond_c

    iget-object v1, p0, Le/e/a/ListActions$Hold;->handler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    const/4 v0, 0x0

    iput-object v0, p0, Le/e/a/ListActions$Hold;->pending:Ljava/lang/Runnable;

    :cond_c
    return-void
.end method

.method synthetic lambda$0$e-e-a-ListActions$Hold(Landroid/view/View;)V
    .registers 3

    .line 0
    const/4 v0, 0x0

    .line 58
    iput-object v0, p0, Le/e/a/ListActions$Hold;->pending:Ljava/lang/Runnable;

    iget-boolean v0, p0, Le/e/a/ListActions$Hold;->down:Z

    if-eqz v0, :cond_e

    iget-boolean v0, p0, Le/e/a/ListActions$Hold;->cancelled:Z

    if-nez v0, :cond_e

    invoke-virtual {p0, p1}, Le/e/a/ListActions$Hold;->open(Landroid/view/View;)V

    :cond_e
    return-void
.end method

.method synthetic lambda$1$e-e-a-ListActions$Hold(Landroid/view/View;Landroid/widget/AdapterView;)V
    .registers 5

    .line 63
    iget-boolean v0, p0, Le/e/a/ListActions$Hold;->down:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    iget-object v0, p0, Le/e/a/ListActions$Hold;->adapter:Ljava/lang/Object;

    iget-object v1, p0, Le/e/a/ListActions$Hold;->row:Ljava/lang/Object;

    # invokes: Le/e/a/ListActions;->dispatchSuperLong(Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;Landroid/widget/AdapterView;)Z
    invoke-static {p1, v0, v1, p2}, Le/e/a/ListActions;->access$1(Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;Landroid/widget/AdapterView;)Z

    move-result p1

    iput-boolean p1, p0, Le/e/a/ListActions$Hold;->superHandled:Z

    if-eqz p1, :cond_18

    iget-object p1, p0, Le/e/a/ListActions$Hold;->popup:Landroid/widget/PopupWindow;

    if-eqz p1, :cond_18

    invoke-virtual {p1}, Landroid/widget/PopupWindow;->dismiss()V

    :cond_18
    return-void
.end method

.method public onLongClick(Landroid/view/View;)Z
    .registers 12

    .line 56
    iget-boolean v0, p0, Le/e/a/ListActions$Hold;->cancelled:Z

    const/4 v1, 0x1

    if-nez v0, :cond_41

    iget-boolean v0, p0, Le/e/a/ListActions$Hold;->longPressed:Z

    if-nez v0, :cond_41

    iget-object v0, p0, Le/e/a/ListActions$Hold;->pending:Ljava/lang/Runnable;

    if-eqz v0, :cond_e

    goto :goto_41

    .line 57
    :cond_e
    iget-boolean v0, p0, Le/e/a/ListActions$Hold;->down:Z

    const-wide/16 v2, 0x0

    if-eqz v0, :cond_2c

    const/16 v0, 0x1f4

    invoke-static {}, Landroid/view/ViewConfiguration;->getLongPressTimeout()I

    move-result v4

    invoke-static {v0, v4}, Ljava/lang/Math;->max(II)I

    move-result v0

    int-to-long v4, v0

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v6

    iget-wide v8, p0, Le/e/a/ListActions$Hold;->started:J

    sub-long/2addr v6, v8

    sub-long/2addr v4, v6

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v4

    goto :goto_2d

    :cond_2c
    move-wide v4, v2

    :goto_2d
    cmp-long v0, v4, v2

    if-lez v0, :cond_3e

    .line 58
    new-instance v0, Le/e/a/ListActions$Hold$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0, p1}, Le/e/a/ListActions$Hold$$ExternalSyntheticLambda0;-><init>(Le/e/a/ListActions$Hold;Landroid/view/View;)V

    iput-object v0, p0, Le/e/a/ListActions$Hold;->pending:Ljava/lang/Runnable;

    iget-object p1, p0, Le/e/a/ListActions$Hold;->handler:Landroid/os/Handler;

    invoke-virtual {p1, v0, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_41

    :cond_3e
    invoke-virtual {p0, p1}, Le/e/a/ListActions$Hold;->open(Landroid/view/View;)V

    :cond_41
    :goto_41
    return v1
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .registers 7

    .line 67
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_27

    invoke-virtual {p0}, Le/e/a/ListActions$Hold;->cancel()V

    iput-boolean v2, p0, Le/e/a/ListActions$Hold;->down:Z

    iput-boolean v1, p0, Le/e/a/ListActions$Hold;->cancelled:Z

    iput-boolean v1, p0, Le/e/a/ListActions$Hold;->longPressed:Z

    iput-boolean v1, p0, Le/e/a/ListActions$Hold;->superHandled:Z

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    iput-wide v2, p0, Le/e/a/ListActions$Hold;->started:J

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result p1

    iput p1, p0, Le/e/a/ListActions$Hold;->startX:F

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    iput p1, p0, Le/e/a/ListActions$Hold;->startY:F

    goto/16 :goto_b4

    .line 68
    :cond_27
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v3, 0x2

    if-ne v0, v3, :cond_63

    iget-boolean v0, p0, Le/e/a/ListActions$Hold;->longPressed:Z

    if-nez v0, :cond_63

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result p1

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iget v3, p0, Le/e/a/ListActions$Hold;->startX:F

    sub-float/2addr v0, v3

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    int-to-float p1, p1

    cmpl-float v0, v0, p1

    if-gtz v0, :cond_5d

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result p2

    iget v0, p0, Le/e/a/ListActions$Hold;->startY:F

    sub-float/2addr p2, v0

    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result p2

    cmpl-float p1, p2, p1

    if-lez p1, :cond_b4

    :cond_5d
    iput-boolean v2, p0, Le/e/a/ListActions$Hold;->cancelled:Z

    invoke-virtual {p0}, Le/e/a/ListActions$Hold;->cancel()V

    goto :goto_b4

    .line 69
    :cond_63
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result p1

    const/4 v0, 0x5

    if-ne p1, v0, :cond_79

    iput-boolean v2, p0, Le/e/a/ListActions$Hold;->cancelled:Z

    iput-boolean v1, p0, Le/e/a/ListActions$Hold;->down:Z

    invoke-virtual {p0}, Le/e/a/ListActions$Hold;->cancel()V

    iget-object p1, p0, Le/e/a/ListActions$Hold;->popup:Landroid/widget/PopupWindow;

    if-eqz p1, :cond_b4

    invoke-virtual {p1}, Landroid/widget/PopupWindow;->dismiss()V

    goto :goto_b4

    .line 70
    :cond_79
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result p1

    if-ne p1, v2, :cond_9f

    iput-boolean v1, p0, Le/e/a/ListActions$Hold;->down:Z

    invoke-virtual {p0}, Le/e/a/ListActions$Hold;->cancel()V

    iget-object p1, p0, Le/e/a/ListActions$Hold;->popup:Landroid/widget/PopupWindow;

    if-eqz p1, :cond_b4

    iget-boolean p2, p0, Le/e/a/ListActions$Hold;->superHandled:Z

    if-nez p2, :cond_b4

    invoke-virtual {p1, v2}, Landroid/widget/PopupWindow;->setTouchable(Z)V

    iget-object p1, p0, Le/e/a/ListActions$Hold;->popup:Landroid/widget/PopupWindow;

    invoke-virtual {p1, v2}, Landroid/widget/PopupWindow;->setFocusable(Z)V

    iget-object p1, p0, Le/e/a/ListActions$Hold;->popup:Landroid/widget/PopupWindow;

    invoke-virtual {p1, v2}, Landroid/widget/PopupWindow;->setOutsideTouchable(Z)V

    iget-object p1, p0, Le/e/a/ListActions$Hold;->popup:Landroid/widget/PopupWindow;

    invoke-virtual {p1}, Landroid/widget/PopupWindow;->update()V

    goto :goto_b4

    .line 71
    :cond_9f
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result p1

    const/4 p2, 0x3

    if-ne p1, p2, :cond_b4

    iput-boolean v1, p0, Le/e/a/ListActions$Hold;->down:Z

    iput-boolean v2, p0, Le/e/a/ListActions$Hold;->cancelled:Z

    invoke-virtual {p0}, Le/e/a/ListActions$Hold;->cancel()V

    iget-object p1, p0, Le/e/a/ListActions$Hold;->popup:Landroid/widget/PopupWindow;

    if-eqz p1, :cond_b4

    invoke-virtual {p1}, Landroid/widget/PopupWindow;->dismiss()V

    :cond_b4
    :goto_b4
    return v1
.end method

.method open(Landroid/view/View;)V
    .registers 7

    const/4 v0, 0x1

    .line 62
    iput-boolean v0, p0, Le/e/a/ListActions$Hold;->longPressed:Z

    invoke-static {p1}, Le/e/a/ListActions;->findList(Landroid/view/View;)Landroid/widget/AdapterView;

    move-result-object v0

    if-eqz v0, :cond_25

    .line 63
    iget-object v1, p0, Le/e/a/ListActions$Hold;->adapter:Ljava/lang/Object;

    invoke-static {v1}, Le/e/a/LocalPlaylists;->hasAdapter(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_17

    invoke-static {v0}, Le/e/a/BulkSelection;->owner(Landroid/widget/AdapterView;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_25

    :cond_17
    new-instance v1, Le/e/a/ListActions$Hold$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0, p1, v0}, Le/e/a/ListActions$Hold$$ExternalSyntheticLambda1;-><init>(Le/e/a/ListActions$Hold;Landroid/view/View;Landroid/widget/AdapterView;)V

    iput-object v1, p0, Le/e/a/ListActions$Hold;->pending:Ljava/lang/Runnable;

    iget-object v0, p0, Le/e/a/ListActions$Hold;->handler:Landroid/os/Handler;

    const-wide/16 v2, 0x3b6

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 64
    :cond_25
    invoke-static {p0}, Le/e/a/ListActions;->access$2(Le/e/a/ListActions$Hold;)V

    const/4 v0, 0x0

    :try_start_29
    iget-object v1, p0, Le/e/a/ListActions$Hold;->adapter:Ljava/lang/Object;

    iget-object v2, p0, Le/e/a/ListActions$Hold;->row:Ljava/lang/Object;

    iget-object v3, p0, Le/e/a/ListActions$Hold;->url:Ljava/lang/String;

    iget-object v4, p0, Le/e/a/ListActions$Hold;->title:Ljava/lang/String;

    # invokes: Le/e/a/ListActions;->showActions(Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)V
    invoke-static {p1, v1, v2, v3, v4}, Le/e/a/ListActions;->access$3(Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_34
    .catchall {:try_start_29 .. :try_end_34} :catchall_38

    invoke-static {v0}, Le/e/a/ListActions;->access$2(Le/e/a/ListActions$Hold;)V

    return-void

    :catchall_38
    move-exception p1

    invoke-static {v0}, Le/e/a/ListActions;->access$2(Le/e/a/ListActions$Hold;)V

    throw p1
.end method
