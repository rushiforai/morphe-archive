.class final Le/e/a/FeedbackHud219$Notice;
.super Landroid/widget/Toast;
.source "FeedbackHud219.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/FeedbackHud219;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Notice"
.end annotation


# instance fields
.field activity:Landroid/app/Activity;

.field final context:Landroid/content/Context;

.field hide:Ljava/lang/Runnable;

.field hud:Landroid/widget/TextView;

.field final length:I

.field root:Landroid/view/ViewGroup;

.field final text:Ljava/lang/CharSequence;


# direct methods
.method constructor <init>(Landroid/content/Context;Ljava/lang/CharSequence;I)V
    .registers 4

    .line 54
    invoke-direct {p0, p1}, Landroid/widget/Toast;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Le/e/a/FeedbackHud219$Notice;->context:Landroid/content/Context;

    iput-object p2, p0, Le/e/a/FeedbackHud219$Notice;->text:Ljava/lang/CharSequence;

    iput p3, p0, Le/e/a/FeedbackHud219$Notice;->length:I

    return-void
.end method


# virtual methods
.method public cancel()V
    .registers 3

    .line 65
    iget-object v0, p0, Le/e/a/FeedbackHud219$Notice;->hide:Ljava/lang/Runnable;

    if-eqz v0, :cond_d

    # getter for: Le/e/a/FeedbackHud219;->MAIN:Landroid/os/Handler;
    invoke-static {}, Le/e/a/FeedbackHud219;->access$0()Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Le/e/a/FeedbackHud219$Notice;->hide:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    :cond_d
    iget-object v0, p0, Le/e/a/FeedbackHud219$Notice;->root:Landroid/view/ViewGroup;

    if-eqz v0, :cond_1e

    iget-object v1, p0, Le/e/a/FeedbackHud219$Notice;->hud:Landroid/widget/TextView;

    if-eqz v1, :cond_1e

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getOverlay()Landroid/view/ViewGroupOverlay;

    move-result-object v0

    iget-object v1, p0, Le/e/a/FeedbackHud219$Notice;->hud:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroupOverlay;->remove(Landroid/view/View;)V

    :cond_1e
    const/4 v0, 0x0

    iput-object v0, p0, Le/e/a/FeedbackHud219$Notice;->root:Landroid/view/ViewGroup;

    iput-object v0, p0, Le/e/a/FeedbackHud219$Notice;->hud:Landroid/widget/TextView;

    invoke-super {p0}, Landroid/widget/Toast;->cancel()V

    # getter for: Le/e/a/FeedbackHud219;->shown:Le/e/a/FeedbackHud219$Notice;
    invoke-static {}, Le/e/a/FeedbackHud219;->access$1()Le/e/a/FeedbackHud219$Notice;

    move-result-object v1

    if-ne v1, p0, :cond_2f

    invoke-static {v0}, Le/e/a/FeedbackHud219;->access$2(Le/e/a/FeedbackHud219$Notice;)V

    :cond_2f
    return-void
.end method

.method public show()V
    .registers 9

    .line 55
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    if-eq v0, v1, :cond_17

    # getter for: Le/e/a/FeedbackHud219;->MAIN:Landroid/os/Handler;
    invoke-static {}, Le/e/a/FeedbackHud219;->access$0()Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Le/e/a/FeedbackHud219$Notice$1;

    invoke-direct {v1, p0}, Le/e/a/FeedbackHud219$Notice$1;-><init>(Le/e/a/FeedbackHud219$Notice;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void

    .line 56
    :cond_17
    # getter for: Le/e/a/FeedbackHud219;->shown:Le/e/a/FeedbackHud219$Notice;
    invoke-static {}, Le/e/a/FeedbackHud219;->access$1()Le/e/a/FeedbackHud219$Notice;

    move-result-object v0

    if-eqz v0, :cond_24

    # getter for: Le/e/a/FeedbackHud219;->shown:Le/e/a/FeedbackHud219$Notice;
    invoke-static {}, Le/e/a/FeedbackHud219;->access$1()Le/e/a/FeedbackHud219$Notice;

    move-result-object v0

    invoke-virtual {v0}, Le/e/a/FeedbackHud219$Notice;->cancel()V

    :cond_24
    invoke-static {p0}, Le/e/a/FeedbackHud219;->access$2(Le/e/a/FeedbackHud219$Notice;)V

    iget-object v0, p0, Le/e/a/FeedbackHud219$Notice;->context:Landroid/content/Context;

    invoke-static {v0}, Le/e/a/FeedbackHud219;->activity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v0

    iput-object v0, p0, Le/e/a/FeedbackHud219$Notice;->activity:Landroid/app/Activity;

    const/4 v0, 0x0

    .line 57
    :try_start_30
    iget-object v1, p0, Le/e/a/FeedbackHud219$Notice;->context:Landroid/content/Context;

    instance-of v2, v1, Landroid/app/Service;

    if-eqz v2, :cond_60

    const-string v2, "e"

    invoke-static {v1, v2}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    iget-object v2, p0, Le/e/a/FeedbackHud219$Notice;->context:Landroid/content/Context;

    const-string v3, "a"

    invoke-static {v2, v3}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    instance-of v3, v1, Landroid/view/View;

    if-eqz v3, :cond_60

    instance-of v3, v2, Landroid/view/ViewGroup;

    if-eqz v3, :cond_60

    move-object v3, v2

    check-cast v3, Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v3

    if-eqz v3, :cond_60

    check-cast v1, Landroid/view/View;
    :try_end_57
    .catch Ljava/lang/Exception; {:try_start_30 .. :try_end_57} :catch_5f

    :try_start_57
    check-cast v2, Landroid/view/ViewGroup;

    iput-object v2, p0, Le/e/a/FeedbackHud219$Notice;->root:Landroid/view/ViewGroup;
    :try_end_5b
    .catch Ljava/lang/Exception; {:try_start_57 .. :try_end_5b} :catch_5d

    :goto_5b
    move-object v0, v1

    goto :goto_60

    :catch_5d
    nop

    goto :goto_5b

    :catch_5f
    nop

    .line 58
    :cond_60
    :goto_60
    iget-object v1, p0, Le/e/a/FeedbackHud219$Notice;->root:Landroid/view/ViewGroup;

    if-nez v1, :cond_9c

    iget-object v1, p0, Le/e/a/FeedbackHud219$Notice;->activity:Landroid/app/Activity;

    if-eqz v1, :cond_9c

    invoke-virtual {v1}, Landroid/app/Activity;->isFinishing()Z

    move-result v1

    if-nez v1, :cond_9c

    iget-object v1, p0, Le/e/a/FeedbackHud219$Notice;->activity:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    iput-object v1, p0, Le/e/a/FeedbackHud219$Notice;->root:Landroid/view/ViewGroup;

    :try_start_7c
    iget-object v1, p0, Le/e/a/FeedbackHud219$Notice;->activity:Landroid/app/Activity;

    const-string v2, "v"

    invoke-static {v1, v2}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    const-string v2, "a0"

    invoke-static {v1, v2}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    instance-of v2, v1, Landroid/view/View;

    if-eqz v2, :cond_9c

    move-object v2, v1

    check-cast v2, Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->isShown()Z

    move-result v2

    if-eqz v2, :cond_9c

    check-cast v1, Landroid/view/View;
    :try_end_99
    .catch Ljava/lang/Exception; {:try_start_7c .. :try_end_99} :catch_9b

    move-object v0, v1

    goto :goto_9c

    :catch_9b
    nop

    .line 59
    :cond_9c
    :goto_9c
    iget-object v1, p0, Le/e/a/FeedbackHud219$Notice;->context:Landroid/content/Context;

    iget-object v2, p0, Le/e/a/FeedbackHud219$Notice;->text:Ljava/lang/CharSequence;

    invoke-static {v1, v2}, Le/e/a/FeedbackHud219;->label(Landroid/content/Context;Ljava/lang/CharSequence;)Landroid/widget/TextView;

    move-result-object v1

    iput-object v1, p0, Le/e/a/FeedbackHud219$Notice;->hud:Landroid/widget/TextView;

    new-instance v1, Le/e/a/FeedbackHud219$Notice$2;

    invoke-direct {v1, p0}, Le/e/a/FeedbackHud219$Notice$2;-><init>(Le/e/a/FeedbackHud219$Notice;)V

    iput-object v1, p0, Le/e/a/FeedbackHud219$Notice;->hide:Ljava/lang/Runnable;

    .line 60
    iget-object v1, p0, Le/e/a/FeedbackHud219$Notice;->root:Landroid/view/ViewGroup;

    const/16 v2, 0xdac

    const/16 v3, 0x5dc

    const/4 v4, 0x1

    if-eqz v1, :cond_165

    invoke-virtual {v1}, Landroid/view/ViewGroup;->isAttachedToWindow()Z

    move-result v1

    if-nez v1, :cond_be

    goto/16 :goto_165

    .line 61
    :cond_be
    iget-object v1, p0, Le/e/a/FeedbackHud219$Notice;->root:Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getOverlay()Landroid/view/ViewGroupOverlay;

    move-result-object v1

    iget-object v5, p0, Le/e/a/FeedbackHud219$Notice;->hud:Landroid/widget/TextView;

    invoke-virtual {v1, v5}, Landroid/view/ViewGroupOverlay;->add(Landroid/view/View;)V

    if-eqz v0, :cond_d4

    .line 62
    iget-object v1, p0, Le/e/a/FeedbackHud219$Notice;->root:Landroid/view/ViewGroup;

    iget-object v5, p0, Le/e/a/FeedbackHud219$Notice;->hud:Landroid/widget/TextView;

    invoke-static {v1, v0, v5}, Le/e/a/FeedbackHud219;->position(Landroid/view/ViewGroup;Landroid/view/View;Landroid/widget/TextView;)V

    goto/16 :goto_153

    :cond_d4
    iget-object v0, p0, Le/e/a/FeedbackHud219$Notice;->root:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    iget-object v1, p0, Le/e/a/FeedbackHud219$Notice;->root:Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getWidth()I

    move-result v1

    const/high16 v5, 0x42000000    # 32.0f

    mul-float v5, v5, v0

    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v5

    sub-int/2addr v1, v5

    invoke-static {v4, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    iget-object v5, p0, Le/e/a/FeedbackHud219$Notice;->hud:Landroid/widget/TextView;

    invoke-virtual {v5, v1}, Landroid/widget/TextView;->setMaxWidth(I)V

    iget-object v5, p0, Le/e/a/FeedbackHud219$Notice;->hud:Landroid/widget/TextView;

    const/high16 v6, -0x80000000

    invoke-static {v1, v6}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    iget-object v7, p0, Le/e/a/FeedbackHud219$Notice;->root:Landroid/view/ViewGroup;

    invoke-virtual {v7}, Landroid/view/ViewGroup;->getHeight()I

    move-result v7

    invoke-static {v7, v6}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v6

    invoke-virtual {v5, v1, v6}, Landroid/widget/TextView;->measure(II)V

    iget-object v1, p0, Le/e/a/FeedbackHud219$Notice;->hud:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getMeasuredWidth()I

    move-result v5

    iget-object v6, p0, Le/e/a/FeedbackHud219$Notice;->hud:Landroid/widget/TextView;

    invoke-virtual {v6}, Landroid/widget/TextView;->getMeasuredHeight()I

    move-result v6

    const/4 v7, 0x0

    invoke-virtual {v1, v7, v7, v5, v6}, Landroid/widget/TextView;->layout(IIII)V

    iget-object v1, p0, Le/e/a/FeedbackHud219$Notice;->hud:Landroid/widget/TextView;

    iget-object v5, p0, Le/e/a/FeedbackHud219$Notice;->root:Landroid/view/ViewGroup;

    invoke-virtual {v5}, Landroid/view/ViewGroup;->getWidth()I

    move-result v5

    iget-object v6, p0, Le/e/a/FeedbackHud219$Notice;->hud:Landroid/widget/TextView;

    invoke-virtual {v6}, Landroid/widget/TextView;->getWidth()I

    move-result v6

    sub-int/2addr v5, v6

    int-to-float v5, v5

    const/high16 v6, 0x40000000    # 2.0f

    div-float/2addr v5, v6

    invoke-virtual {v1, v5}, Landroid/widget/TextView;->setX(F)V

    iget-object v1, p0, Le/e/a/FeedbackHud219$Notice;->hud:Landroid/widget/TextView;

    const/high16 v5, 0x41800000    # 16.0f

    mul-float v5, v5, v0

    iget-object v6, p0, Le/e/a/FeedbackHud219$Notice;->root:Landroid/view/ViewGroup;

    invoke-virtual {v6}, Landroid/view/ViewGroup;->getHeight()I

    move-result v6

    iget-object v7, p0, Le/e/a/FeedbackHud219$Notice;->hud:Landroid/widget/TextView;

    invoke-virtual {v7}, Landroid/widget/TextView;->getHeight()I

    move-result v7

    sub-int/2addr v6, v7

    int-to-float v6, v6

    const/high16 v7, 0x42800000    # 64.0f

    mul-float v0, v0, v7

    sub-float/2addr v6, v0

    invoke-static {v5, v6}, Ljava/lang/Math;->max(FF)F

    move-result v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setY(F)V

    .line 63
    :goto_153
    # getter for: Le/e/a/FeedbackHud219;->MAIN:Landroid/os/Handler;
    invoke-static {}, Le/e/a/FeedbackHud219;->access$0()Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Le/e/a/FeedbackHud219$Notice;->hide:Ljava/lang/Runnable;

    iget v5, p0, Le/e/a/FeedbackHud219$Notice;->length:I

    if-ne v5, v4, :cond_15e

    goto :goto_160

    :cond_15e
    const/16 v2, 0x5dc

    :goto_160
    int-to-long v2, v2

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void

    .line 60
    :cond_165
    :goto_165
    iget-object v0, p0, Le/e/a/FeedbackHud219$Notice;->hud:Landroid/widget/TextView;

    invoke-virtual {p0, v0}, Le/e/a/FeedbackHud219$Notice;->setView(Landroid/view/View;)V

    iget v0, p0, Le/e/a/FeedbackHud219$Notice;->length:I

    invoke-virtual {p0, v0}, Le/e/a/FeedbackHud219$Notice;->setDuration(I)V

    invoke-super {p0}, Landroid/widget/Toast;->show()V

    # getter for: Le/e/a/FeedbackHud219;->MAIN:Landroid/os/Handler;
    invoke-static {}, Le/e/a/FeedbackHud219;->access$0()Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Le/e/a/FeedbackHud219$Notice;->hide:Ljava/lang/Runnable;

    iget v5, p0, Le/e/a/FeedbackHud219$Notice;->length:I

    if-ne v5, v4, :cond_17d

    goto :goto_17f

    :cond_17d
    const/16 v2, 0x5dc

    :goto_17f
    int-to-long v2, v2

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method
