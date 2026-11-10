.class public final LD/b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;)V
    .locals 0

    iput p1, p0, LD/b;->a:I

    iput-object p2, p0, LD/b;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(LC/j;I)V
    .locals 0

    const/4 p2, 0x7

    iput p2, p0, LD/b;->a:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, LD/b;->b:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 17

    move-object/from16 v1, p0

    const/4 v0, 0x1

    const/4 v2, 0x0

    iget-object v3, v1, LD/b;->b:Ljava/lang/Object;

    iget v4, v1, LD/b;->a:I

    packed-switch v4, :pswitch_data_0

    check-cast v3, LC/j;

    iget-object v0, v3, LC/j;->b:Ljava/lang/Object;

    return-void

    :pswitch_0
    check-cast v3, Landroidx/appcompat/widget/Toolbar;

    iget-object v0, v3, Landroidx/appcompat/widget/Toolbar;->a:Landroidx/appcompat/widget/ActionMenuView;

    if-eqz v0, :cond_0

    iget-object v0, v0, Landroidx/appcompat/widget/ActionMenuView;->t:Li/l;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Li/l;->l()Z

    :cond_0
    return-void

    :pswitch_1
    check-cast v3, Landroidx/appcompat/widget/SearchView$SearchAutoComplete;

    iget-boolean v0, v3, Landroidx/appcompat/widget/SearchView$SearchAutoComplete;->f:Z

    if-eqz v0, :cond_1

    invoke-virtual {v3}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v4, "input_method"

    invoke-virtual {v0, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    invoke-virtual {v0, v3, v2}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;I)Z

    iput-boolean v2, v3, Landroidx/appcompat/widget/SearchView$SearchAutoComplete;->f:Z

    :cond_1
    return-void

    :pswitch_2
    const/4 v0, 0x0

    check-cast v3, Li/t0;

    iput-object v0, v3, Li/t0;->l:LD/b;

    invoke-virtual {v3}, Li/t0;->drawableStateChanged()V

    return-void

    :pswitch_3
    check-cast v3, Landroidx/fragment/app/p;

    invoke-virtual {v3, v0}, Landroidx/fragment/app/p;->e(Z)Z

    return-void

    :pswitch_4
    :try_start_0
    check-cast v3, Landroidx/activity/l;

    invoke-static {v3}, Landroidx/activity/l;->e(Landroidx/activity/l;)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    goto :goto_1

    :goto_0
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    const-string v3, "Attempt to invoke virtual method \'android.os.Handler android.app.FragmentHostCallback.getHandler()\' on a null object reference"

    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_2

    goto :goto_2

    :cond_2
    throw v0

    :goto_1
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    const-string v3, "Can not perform this action after onSaveInstanceState"

    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_3

    :goto_2
    return-void

    :cond_3
    throw v0

    :pswitch_5
    check-cast v3, Landroid/app/NotificationManager;

    invoke-virtual {v3, v0}, Landroid/app/NotificationManager;->cancel(I)V

    return-void

    :pswitch_6
    check-cast v3, LD/i;

    iget-boolean v0, v3, LD/i;->o:Z

    if-nez v0, :cond_4

    goto/16 :goto_4

    :cond_4
    iget-boolean v0, v3, LD/i;->m:Z

    iget-object v4, v3, LD/i;->a:LD/a;

    if-eqz v0, :cond_5

    iput-boolean v2, v3, LD/i;->m:Z

    invoke-static {}, Landroid/view/animation/AnimationUtils;->currentAnimationTimeMillis()J

    move-result-wide v5

    iput-wide v5, v4, LD/a;->e:J

    const-wide/16 v7, -0x1

    iput-wide v7, v4, LD/a;->g:J

    iput-wide v5, v4, LD/a;->f:J

    const/high16 v0, 0x3f000000    # 0.5f

    iput v0, v4, LD/a;->h:F

    :cond_5
    iget-wide v5, v4, LD/a;->g:J

    const-wide/16 v7, 0x0

    cmp-long v0, v5, v7

    if-lez v0, :cond_6

    invoke-static {}, Landroid/view/animation/AnimationUtils;->currentAnimationTimeMillis()J

    move-result-wide v5

    iget-wide v9, v4, LD/a;->g:J

    iget v0, v4, LD/a;->i:I

    int-to-long v11, v0

    add-long/2addr v9, v11

    cmp-long v0, v5, v9

    if-lez v0, :cond_6

    goto :goto_3

    :cond_6
    invoke-virtual {v3}, LD/i;->e()Z

    move-result v0

    if-nez v0, :cond_7

    :goto_3
    iput-boolean v2, v3, LD/i;->o:Z

    goto :goto_4

    :cond_7
    iget-boolean v0, v3, LD/i;->n:Z

    iget-object v5, v3, LD/i;->c:Landroid/widget/ListView;

    if-eqz v0, :cond_8

    iput-boolean v2, v3, LD/i;->n:Z

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v9

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/4 v13, 0x3

    const/4 v14, 0x0

    move-wide v11, v9

    invoke-static/range {v9 .. v16}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    move-result-object v0

    invoke-virtual {v5, v0}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    invoke-virtual {v0}, Landroid/view/MotionEvent;->recycle()V

    :cond_8
    iget-wide v9, v4, LD/a;->f:J

    cmp-long v0, v9, v7

    if-eqz v0, :cond_9

    invoke-static {}, Landroid/view/animation/AnimationUtils;->currentAnimationTimeMillis()J

    move-result-wide v6

    invoke-virtual {v4, v6, v7}, LD/a;->a(J)F

    move-result v0

    const/high16 v2, -0x3f800000    # -4.0f

    mul-float/2addr v2, v0

    mul-float/2addr v2, v0

    const/high16 v8, 0x40800000    # 4.0f

    mul-float/2addr v0, v8

    add-float/2addr v0, v2

    iget-wide v8, v4, LD/a;->f:J

    sub-long v8, v6, v8

    iput-wide v6, v4, LD/a;->f:J

    long-to-float v2, v8

    mul-float/2addr v2, v0

    iget v0, v4, LD/a;->d:F

    mul-float/2addr v2, v0

    float-to-int v0, v2

    iget-object v2, v3, LD/i;->q:Li/t0;

    invoke-virtual {v2, v0}, Landroid/widget/AbsListView;->scrollListBy(I)V

    sget-object v0, Ly/K;->a:Ljava/util/WeakHashMap;

    invoke-virtual {v5, v1}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    :goto_4
    return-void

    :cond_9
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v2, "Cannot compute scroll delta before calling start()"

    invoke-direct {v0, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
