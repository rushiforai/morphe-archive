.class public final Lvwj;
.super Landroid/text/method/LinkMovementMethod;
.source "SourceFile"


# instance fields
.field public a:Lagc;

.field public b:Landroid/view/GestureDetector;

.field public final c:Lyk4;

.field public final d:Lzt;


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Landroid/text/method/LinkMovementMethod;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lvwj;->c:Lyk4;

    iput-object v0, p0, Lvwj;->d:Lzt;

    return-void
.end method

.method public constructor <init>(Lyk4;Lzt;)V
    .registers 3

    .line 9
    invoke-direct {p0}, Landroid/text/method/LinkMovementMethod;-><init>()V

    .line 10
    iput-object p1, p0, Lvwj;->c:Lyk4;

    .line 11
    iput-object p2, p0, Lvwj;->d:Lzt;

    return-void
.end method

.method public static a(Landroid/widget/TextView;)V
    .registers 2

    invoke-static {p0}, Lphj;->Z(Landroid/widget/TextView;)V

    invoke-virtual {p0}, Landroid/widget/TextView;->getMovementMethod()Landroid/text/method/MovementMethod;

    move-result-object v0

    instance-of v0, v0, Lvwj;

    if-nez v0, :cond_13

    new-instance v0, Lvwj;

    invoke-direct {v0}, Lvwj;-><init>()V

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    :cond_13
    return-void
.end method


# virtual methods
.method public final onTouchEvent(Landroid/widget/TextView;Landroid/text/Spannable;Landroid/view/MotionEvent;)Z
    .registers 11

    invoke-virtual {p3}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    invoke-virtual {p3}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    float-to-int v1, v1

    invoke-virtual {p1}, Landroid/view/View;->getScrollX()I

    move-result v2

    add-int/2addr v2, v1

    invoke-virtual {p1}, Landroid/widget/TextView;->getTotalPaddingLeft()I

    move-result v1

    sub-int/2addr v2, v1

    invoke-virtual {p3}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    float-to-int v1, v1

    invoke-virtual {p1}, Landroid/view/View;->getScrollY()I

    move-result v3

    add-int/2addr v3, v1

    invoke-virtual {p1}, Landroid/widget/TextView;->getTotalPaddingTop()I

    move-result v1

    sub-int/2addr v3, v1

    const/4 v1, 0x0

    if-ltz v3, :cond_4f

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v4

    if-ge v3, v4, :cond_4f

    invoke-virtual {p1}, Landroid/widget/TextView;->getLayout()Landroid/text/Layout;

    move-result-object v4

    invoke-virtual {v4, v3}, Landroid/text/Layout;->getLineForVertical(I)I

    move-result v3

    invoke-virtual {v4, v3}, Landroid/text/Layout;->getLineLeft(I)F

    move-result v5

    float-to-int v5, v5

    invoke-virtual {v4, v3}, Landroid/text/Layout;->getLineRight(I)F

    move-result v6

    float-to-int v6, v6

    if-lt v2, v5, :cond_4f

    if-gt v2, v6, :cond_4f

    int-to-float v2, v2

    invoke-virtual {v4, v3, v2}, Landroid/text/Layout;->getOffsetForHorizontal(IF)I

    move-result v2

    const-class v3, Lagc;

    invoke-interface {p2, v2, v2, v3}, Landroid/text/Spanned;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object p2

    check-cast p2, [Lagc;

    goto :goto_50

    :cond_4f
    move-object p2, v1

    :goto_50
    const/4 v2, 0x0

    if-eqz p2, :cond_59

    array-length v3, p2

    if-lez v3, :cond_59

    aget-object p2, p2, v2

    goto :goto_5a

    :cond_59
    move-object p2, v1

    :goto_5a
    iget-object v3, p0, Lvwj;->b:Landroid/view/GestureDetector;

    const/4 v4, 0x1

    if-nez v3, :cond_6f

    new-instance v3, Landroid/view/GestureDetector;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v5

    new-instance v6, Lsgh;

    invoke-direct {v6, p0, p1, v4}, Lsgh;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {v3, v5, v6}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object v3, p0, Lvwj;->b:Landroid/view/GestureDetector;

    :cond_6f
    if-nez v0, :cond_7f

    instance-of v5, p2, Lp0d;

    if-nez v5, :cond_7b

    iget-object v5, p0, Lvwj;->d:Lzt;

    if-nez v5, :cond_7b

    move v5, v2

    goto :goto_7c

    :cond_7b
    move v5, v4

    :goto_7c
    invoke-virtual {v3, v5}, Landroid/view/GestureDetector;->setIsLongpressEnabled(Z)V

    :cond_7f
    invoke-virtual {v3, p3}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    if-eq v0, v4, :cond_a0

    const/4 p3, 0x3

    if-eq v0, p3, :cond_a0

    if-eqz v0, :cond_8c

    const/4 p3, 0x2

    if-ne v0, p3, :cond_a4

    :cond_8c
    iget-object p3, p0, Lvwj;->a:Lagc;

    if-eq p2, p3, :cond_a4

    invoke-virtual {p1}, Landroid/view/View;->invalidate()V

    iget-object p1, p0, Lvwj;->a:Lagc;

    if-eqz p1, :cond_99

    iput-boolean v2, p1, Lagc;->a:Z

    :cond_99
    iput-object p2, p0, Lvwj;->a:Lagc;

    if-eqz p2, :cond_a4

    iput-boolean v4, p2, Lagc;->a:Z

    return v4

    :cond_a0
    iget-object p2, p0, Lvwj;->a:Lagc;

    if-nez p2, :cond_a5

    :cond_a4
    return v4

    :cond_a5
    invoke-virtual {p1}, Landroid/view/View;->invalidate()V

    iget-object p1, p0, Lvwj;->a:Lagc;

    if-eqz p1, :cond_ae

    iput-boolean v2, p1, Lagc;->a:Z

    :cond_ae
    iput-object v1, p0, Lvwj;->a:Lagc;

    return v4
.end method
