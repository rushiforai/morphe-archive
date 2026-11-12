.class public final synthetic Lwo1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    iput-byte p3, p0, Lwo1;->a:B

    iput-object p1, p0, Lwo1;->b:Ljava/lang/Object;

    iput-object p2, p0, Lwo1;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .registers 4

    iget-byte v0, p0, Lwo1;->a:B

    iget-object v1, p0, Lwo1;->c:Ljava/lang/Object;

    iget-object p0, p0, Lwo1;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_a0

    check-cast p0, Lz4k;

    iget-object p0, p0, Lz4k;->b:Ljava/lang/Object;

    check-cast p0, Ly1o;

    iget-object p0, p0, Ly1o;->e:Landroidx/appcompat/widget/ActionBarContainer;

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    check-cast p0, Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void

    :pswitch_1b
    check-cast p0, Landroid/view/ViewGroup$LayoutParams;

    check-cast v1, Luvl;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iput p1, p0, Landroid/view/ViewGroup$LayoutParams;->height:I

    iget-object p0, v1, Luvl;->i:Landroid/widget/FrameLayout;

    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    return-void

    :pswitch_31
    check-cast p0, Lfwk;

    check-cast v1, Landroid/animation/ValueAnimator;

    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    move-result p1

    iget v0, p0, Lfwk;->e:F

    cmpg-float v0, p1, v0

    if-eqz v0, :cond_44

    iput p1, p0, Lfwk;->e:F

    invoke-virtual {p0}, Lfwk;->c()V

    :cond_44
    return-void

    :pswitch_45
    check-cast p0, Lf47;

    check-cast v1, Lp83;

    const/4 p1, 0x1

    invoke-virtual {v1, p1}, Lp83;->b(Z)Z

    move-result p1

    if-eqz p1, :cond_5d

    iget p1, v1, Lp83;->m:I

    if-eqz p1, :cond_5d

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->isVisible()Z

    move-result p1

    if-eqz p1, :cond_5d

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    :cond_5d
    return-void

    :pswitch_5e
    check-cast p0, Lcom/google/android/material/appbar/AppBarLayout;

    check-cast v1, Lzdd;

    sget v0, Lcom/google/android/material/appbar/AppBarLayout;->B:I

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    invoke-virtual {v1, p1}, Lzdd;->t(F)V

    iget-object v0, p0, Lcom/google/android/material/appbar/AppBarLayout;->x:Landroid/graphics/drawable/Drawable;

    instance-of v1, v0, Lzdd;

    if-eqz v1, :cond_7c

    check-cast v0, Lzdd;

    invoke-virtual {v0, p1}, Lzdd;->t(F)V

    :cond_7c
    iget-object p1, p0, Lcom/google/android/material/appbar/AppBarLayout;->r:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_9a

    iget-object p0, p0, Lcom/google/android/material/appbar/AppBarLayout;->s:Ljava/util/LinkedHashSet;

    invoke-virtual {p0}, Ljava/util/AbstractCollection;->iterator()Ljava/util/Iterator;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-nez p1, :cond_95

    return-void

    :cond_95
    invoke-static {p0}, Lp3p;->g(Ljava/util/Iterator;)Ljava/lang/ClassCastException;

    move-result-object p0

    throw p0

    :cond_9a
    invoke-static {p1}, Lp3p;->g(Ljava/util/Iterator;)Ljava/lang/ClassCastException;

    move-result-object p0

    throw p0

    nop

    :pswitch_data_a0
    .packed-switch 0x0
        :pswitch_5e
        :pswitch_45
        :pswitch_31
        :pswitch_1b
    .end packed-switch
.end method
