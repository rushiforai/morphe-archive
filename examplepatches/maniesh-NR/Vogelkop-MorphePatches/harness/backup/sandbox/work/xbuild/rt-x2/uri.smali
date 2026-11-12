.class public final Luri;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# instance fields
.field public final a:F

.field public final b:Ltri;

.field public c:F

.field public d:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/content/res/Resources;Ltri;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const v0, 0x7f0708bc

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    iput p1, p0, Luri;->a:F

    iput-object p2, p0, Luri;->b:Ltri;

    return-void
.end method


# virtual methods
.method public final onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .registers 9

    iget-object v0, p0, Luri;->d:Landroid/view/View;

    const/4 v1, 0x1

    if-eqz v0, :cond_7

    if-ne v0, p1, :cond_6a

    :cond_7
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_6a

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result v0

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result p2

    if-eqz p2, :cond_95

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x2

    if-eq p2, v1, :cond_6b

    if-eq p2, v4, :cond_36

    const/4 v0, 0x3

    if-ne p2, v0, :cond_6a

    invoke-virtual {p1, v3}, Landroid/view/View;->setPressed(Z)V

    iget-object p2, p0, Luri;->d:Landroid/view/View;

    if-eqz p2, :cond_6a

    iput-object v2, p0, Luri;->d:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result p0

    sub-int/2addr v3, p0

    invoke-virtual {p1, v3}, Landroid/view/View;->offsetLeftAndRight(I)V

    invoke-virtual {p1}, Landroid/view/View;->invalidate()V

    return v1

    :cond_36
    iget-object p2, p0, Luri;->d:Landroid/view/View;

    if-nez p2, :cond_51

    iget p2, p0, Luri;->c:F

    sub-float p2, v0, p2

    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result p2

    iget v2, p0, Luri;->a:F

    cmpl-float p2, p2, v2

    if-lez p2, :cond_51

    iput-object p1, p0, Luri;->d:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p2

    invoke-interface {p2, v1}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    :cond_51
    iget-object p2, p0, Luri;->d:Landroid/view/View;

    if-eqz p2, :cond_6a

    iget p0, p0, Luri;->c:F

    sub-float/2addr v0, p0

    const/4 p0, 0x0

    invoke-static {p0, v0}, Ljava/lang/Math;->max(FF)F

    move-result p0

    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result p2

    int-to-float p2, p2

    sub-float/2addr p0, p2

    float-to-int p0, p0

    invoke-virtual {p1, p0}, Landroid/view/View;->offsetLeftAndRight(I)V

    invoke-virtual {p1}, Landroid/view/View;->invalidate()V

    :cond_6a
    return v1

    :cond_6b
    invoke-virtual {p1, v3}, Landroid/view/View;->setPressed(Z)V

    iget-object p2, p0, Luri;->d:Landroid/view/View;

    iget-object v5, p0, Luri;->b:Ltri;

    if-eqz p2, :cond_91

    iput-object v2, p0, Luri;->d:Landroid/view/View;

    iget p0, p0, Luri;->c:F

    sub-float/2addr v0, p0

    float-to-int p0, v0

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result p2

    div-int/2addr p2, v4

    if-le p0, p2, :cond_85

    invoke-interface {v5, p1}, Ltri;->d(Landroid/view/View;)V

    return v1

    :cond_85
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result p0

    sub-int/2addr v3, p0

    invoke-virtual {p1, v3}, Landroid/view/View;->offsetLeftAndRight(I)V

    invoke-virtual {p1}, Landroid/view/View;->invalidate()V

    return v1

    :cond_91
    invoke-interface {v5, p1}, Ltri;->l(Landroid/view/View;)V

    return v1

    :cond_95
    iput v0, p0, Luri;->c:F

    invoke-virtual {p1, v1}, Landroid/view/View;->setPressed(Z)V

    return v1
.end method
