.class public final Lgi7;
.super Lnv5;
.source "SourceFile"


# instance fields
.field public a:Z

.field public final synthetic b:Lhi7;


# direct methods
.method public constructor <init>(Lhi7;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lgi7;->b:Lhi7;

    return-void
.end method

.method public static x(Landroid/view/View;)Z
    .registers 6

    instance-of v0, p0, Ldi7;

    const/4 v1, 0x0

    if-nez v0, :cond_37

    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    instance-of v2, v0, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v3, 0x50

    const/16 v4, 0x30

    if-eqz v2, :cond_1d

    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    iget v0, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    and-int/lit8 v2, v0, 0x50

    if-ne v2, v3, :cond_1c

    and-int/2addr v0, v4

    if-ne v0, v4, :cond_2c

    :cond_1c
    return v1

    :cond_1d
    instance-of v2, v0, Lqv5;

    if-eqz v2, :cond_37

    check-cast v0, Lqv5;

    iget v0, v0, Lqv5;->c:I

    and-int/lit8 v2, v0, 0x50

    if-ne v2, v3, :cond_37

    and-int/2addr v0, v4

    if-eq v0, v4, :cond_37

    :cond_2c
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p0

    iget p0, p0, Landroid/view/ViewGroup$LayoutParams;->height:I

    const/4 v0, -0x1

    if-eq p0, v0, :cond_37

    const/4 p0, 0x1

    return p0

    :cond_37
    return v1
.end method


# virtual methods
.method public final f(Landroid/view/View;Landroid/view/View;)Z
    .registers 3

    invoke-static {p2}, Lgi7;->x(Landroid/view/View;)Z

    move-result p0

    return p0
.end method

.method public final h(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;)Z
    .registers 4

    iget-boolean p1, p0, Lgi7;->a:Z

    if-nez p1, :cond_19

    const/4 p1, 0x1

    iput-boolean p1, p0, Lgi7;->a:Z

    iget-object p1, p0, Lgi7;->b:Lhi7;

    iget-object p1, p1, Lhi7;->e:Ligi;

    iget-object p1, p1, Ligi;->e:Ljava/lang/Object;

    check-cast p1, Landroid/view/View;

    new-instance p2, Lbl6;

    const/16 p3, 0x1b

    invoke-direct {p2, p0, p3}, Lbl6;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    :cond_19
    const/4 p0, 0x0

    return p0
.end method

.method public final i(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;)V
    .registers 4

    iget-boolean p1, p0, Lgi7;->a:Z

    if-eqz p1, :cond_5

    return-void

    :cond_5
    const/4 p1, 0x1

    iput-boolean p1, p0, Lgi7;->a:Z

    iget-object p1, p0, Lgi7;->b:Lhi7;

    iget-object p1, p1, Lhi7;->e:Ligi;

    iget-object p1, p1, Ligi;->e:Ljava/lang/Object;

    check-cast p1, Landroid/view/View;

    new-instance p2, Lbl6;

    const/16 v0, 0x1b

    invoke-direct {p2, p0, v0}, Lbl6;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    return-void
.end method
