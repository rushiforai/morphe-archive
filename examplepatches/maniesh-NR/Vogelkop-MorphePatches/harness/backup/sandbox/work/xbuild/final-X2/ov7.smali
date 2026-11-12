.class public final synthetic Lov7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>()V
    .registers 2

    const/4 v0, 0x0

    iput-byte v0, p0, Lov7;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ligi;)V
    .registers 2

    .line 7
    const/4 p1, 0x1

    iput-byte p1, p0, Lov7;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .registers 7

    iget-byte p0, p0, Lov7;->a:B

    const/4 v0, 0x1

    const/4 v1, 0x0

    packed-switch p0, :pswitch_data_5c

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result p0

    if-nez p0, :cond_f

    move p2, v0

    goto :goto_10

    :cond_f
    move p2, v1

    :goto_10
    if-ne p0, v0, :cond_1a

    invoke-virtual {p1}, Landroid/view/View;->isPressed()Z

    move-result p0

    if-eqz p0, :cond_1a

    move p0, v0

    goto :goto_1b

    :cond_1a
    move p0, v1

    :goto_1b
    if-nez p2, :cond_1f

    if-eqz p0, :cond_27

    :cond_1f
    invoke-virtual {p1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    instance-of v3, v2, Landroid/graphics/drawable/RippleDrawable;

    if-nez v3, :cond_29

    :cond_27
    move v0, v1

    goto :goto_36

    :cond_29
    check-cast v2, Landroid/graphics/drawable/RippleDrawable;

    invoke-virtual {v2, p2, v0}, Landroid/graphics/drawable/RippleDrawable;->setVisible(ZZ)Z

    invoke-virtual {p1, p2}, Landroid/view/View;->setPressed(Z)V

    if-eqz p0, :cond_36

    invoke-virtual {p1}, Landroid/view/View;->performClick()Z

    :cond_36
    :goto_36
    return v0

    :pswitch_37
    invoke-virtual {p1, v0}, Landroid/view/View;->canScrollVertically(I)Z

    move-result p0

    if-nez p0, :cond_44

    const/4 p0, -0x1

    invoke-virtual {p1, p0}, Landroid/view/View;->canScrollVertically(I)Z

    move-result p0

    if-eqz p0, :cond_5b

    :cond_44
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    invoke-interface {p0, v0}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result p0

    if-eq p0, v0, :cond_54

    const/4 p2, 0x3

    if-ne p0, p2, :cond_5b

    :cond_54
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    invoke-interface {p0, v1}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    :cond_5b
    return v1

    :pswitch_data_5c
    .packed-switch 0x0
        :pswitch_37
    .end packed-switch
.end method
