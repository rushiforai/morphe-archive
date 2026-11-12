.class public final Lhs8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lhs8;->a:B

    iput-object p1, p0, Lhs8;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .registers 9

    iget-byte v0, p0, Lhs8;->a:B

    const/4 v1, 0x3

    const/4 v2, 0x1

    const/4 v3, 0x0

    iget-object p0, p0, Lhs8;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_b6

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result p1

    check-cast p0, Lqt6;

    invoke-virtual {p0}, Lqt6;->k()Z

    move-result p2

    if-eqz p1, :cond_20

    const/4 v0, 0x5

    if-eq p1, v0, :cond_20

    if-eq p1, v1, :cond_1d

    if-ne p1, v2, :cond_22

    :cond_1d
    iput-boolean v3, p0, Lqt6;->b:Z

    goto :goto_22

    :cond_20
    iput-boolean v2, p0, Lqt6;->b:Z

    :cond_22
    :goto_22
    invoke-virtual {p0}, Lqt6;->k()Z

    move-result p1

    if-eq p1, p2, :cond_35

    iget-object p1, p0, Lqt6;->e:Ljava/lang/Object;

    check-cast p1, Lzy4;

    invoke-virtual {p0}, Lqt6;->k()Z

    move-result p0

    iput-boolean p0, p1, Lzy4;->k:Z

    invoke-virtual {p1}, Lzy4;->T()V

    :cond_35
    return v3

    :pswitch_36
    check-cast p1, Landroid/widget/Checkable;

    invoke-interface {p1}, Landroid/widget/Checkable;->isChecked()Z

    move-result p1

    if-eqz p1, :cond_44

    check-cast p0, Landroid/view/GestureDetector;

    invoke-virtual {p0, p2}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v3

    :cond_44
    return v3

    :pswitch_45
    check-cast p0, Landroidx/appcompat/widget/ListPopupWindow;

    iget-object p1, p0, Landroidx/appcompat/widget/ListPopupWindow;->t:Lnic;

    iget-object v0, p0, Landroidx/appcompat/widget/ListPopupWindow;->x:Landroid/os/Handler;

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v4

    float-to-int v4, v4

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result p2

    float-to-int p2, p2

    if-nez v1, :cond_7f

    iget-object v5, p0, Landroidx/appcompat/widget/ListPopupWindow;->B:Leq1;

    if-eqz v5, :cond_7f

    invoke-virtual {v5}, Landroid/widget/PopupWindow;->isShowing()Z

    move-result v5

    if-eqz v5, :cond_7f

    if-ltz v4, :cond_7f

    iget-object v5, p0, Landroidx/appcompat/widget/ListPopupWindow;->B:Leq1;

    invoke-virtual {v5}, Landroid/widget/PopupWindow;->getWidth()I

    move-result v5

    if-ge v4, v5, :cond_7f

    if-ltz p2, :cond_7f

    iget-object p0, p0, Landroidx/appcompat/widget/ListPopupWindow;->B:Leq1;

    invoke-virtual {p0}, Landroid/widget/PopupWindow;->getHeight()I

    move-result p0

    if-ge p2, p0, :cond_7f

    const-wide/16 v1, 0xfa

    invoke-virtual {v0, p1, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_84

    :cond_7f
    if-ne v1, v2, :cond_84

    invoke-virtual {v0, p1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    :cond_84
    :goto_84
    return v3

    :pswitch_85
    check-cast p0, Lota;

    iget-object p0, p0, Lota;->y:Landroid/view/GestureDetector;

    invoke-virtual {p0, p2}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    return v2

    :pswitch_8d
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result p2

    if-eqz p2, :cond_ab

    if-eq p2, v2, :cond_97

    if-ne p2, v1, :cond_b5

    :cond_97
    check-cast p0, Les8;

    iget-object p0, p0, Les8;->d:Lns8;

    if-eqz p0, :cond_a1

    iget-boolean p0, p0, Lns8;->a:Z

    if-nez p0, :cond_b5

    :cond_a1
    sget-object p0, Llf1;->a:Landroid/view/animation/AccelerateDecelerateInterpolator;

    const-wide/16 v0, 0x96

    const/high16 p2, 0x3f800000    # 1.0f

    invoke-static {p1, p0, v0, v1, p2}, Lw7d;->d(Landroid/view/View;Landroid/view/animation/BaseInterpolator;JF)V

    goto :goto_b5

    :cond_ab
    sget-object p0, Llf1;->b:Landroid/view/animation/AccelerateInterpolator;

    const-wide/16 v0, 0x32

    const p2, 0x3f866666    # 1.05f

    invoke-static {p1, p0, v0, v1, p2}, Lw7d;->d(Landroid/view/View;Landroid/view/animation/BaseInterpolator;JF)V

    :cond_b5
    :goto_b5
    return v3

    :pswitch_data_b6
    .packed-switch 0x0
        :pswitch_8d
        :pswitch_85
        :pswitch_45
        :pswitch_36
    .end packed-switch
.end method
