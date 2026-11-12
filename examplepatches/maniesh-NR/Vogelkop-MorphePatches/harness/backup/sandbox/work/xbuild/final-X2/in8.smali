.class public final Lin8;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public b:Z

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(BLjava/lang/Object;Z)V
    .registers 4

    .line 13
    iput-byte p1, p0, Lin8;->a:B

    iput-object p2, p0, Lin8;->c:Ljava/lang/Object;

    iput-boolean p3, p0, Lin8;->b:Z

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroid/view/View;Z)V
    .registers 4

    const/4 v0, 0x0

    iput-byte v0, p0, Lin8;->a:B

    .line 12
    iput-boolean p2, p0, Lin8;->b:Z

    iput-object p1, p0, Lin8;->c:Ljava/lang/Object;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method

.method public constructor <init>(Leq8;)V
    .registers 3

    const/4 v0, 0x1

    iput-byte v0, p0, Lin8;->a:B

    .line 14
    iput-object p1, p0, Lin8;->c:Ljava/lang/Object;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    const/4 p1, 0x0

    .line 15
    iput-boolean p1, p0, Lin8;->b:Z

    return-void
.end method

.method public constructor <init>(Ltah;)V
    .registers 3

    const/4 v0, 0x5

    iput-byte v0, p0, Lin8;->a:B

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lin8;->c:Ljava/lang/Object;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public final onAnimationCancel(Landroid/animation/Animator;)V
    .registers 3

    iget-byte v0, p0, Lin8;->a:B

    packed-switch v0, :pswitch_data_24

    :pswitch_5
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationCancel(Landroid/animation/Animator;)V

    return-void

    :pswitch_9
    const/4 p1, 0x1

    iput-boolean p1, p0, Lin8;->b:Z

    return-void

    :pswitch_d
    iget-object p1, p0, Lin8;->c:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/flow/MyFlowMessageRoot;

    iget-object p1, p1, Lcom/opera/android/flow/MyFlowMessageRoot;->h:Landroid/view/View;

    iget-boolean p0, p0, Lin8;->b:Z

    if-eqz p0, :cond_1a

    const/high16 p0, 0x3f800000    # 1.0f

    goto :goto_1b

    :cond_1a
    const/4 p0, 0x0

    :goto_1b
    invoke-virtual {p1, p0}, Landroid/view/View;->setAlpha(F)V

    return-void

    :pswitch_1f
    const/4 p1, 0x1

    iput-boolean p1, p0, Lin8;->b:Z

    return-void

    nop

    :pswitch_data_24
    .packed-switch 0x1
        :pswitch_1f
        :pswitch_5
        :pswitch_5
        :pswitch_d
        :pswitch_9
    .end packed-switch
.end method

.method public final onAnimationEnd(Landroid/animation/Animator;)V
    .registers 7

    iget-byte v0, p0, Lin8;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    iget-object v4, p0, Lin8;->c:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_72

    :pswitch_a
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    return-void

    :pswitch_e
    iget-boolean p0, p0, Lin8;->b:Z

    if-nez p0, :cond_1b

    check-cast v4, Liji;

    iget-object p0, v4, Liji;->h:Landroid/widget/FrameLayout;

    const/16 p1, 0x8

    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    :cond_1b
    return-void

    :pswitch_1c
    iget-boolean p0, p0, Lin8;->b:Z

    if-nez p0, :cond_29

    check-cast v4, Ltah;

    iget-object p0, v4, Ltah;->g:Ljava/lang/Object;

    check-cast p0, Landroid/widget/FrameLayout;

    invoke-virtual {p0, v3}, Landroid/view/View;->setAlpha(F)V

    :cond_29
    return-void

    :pswitch_2a
    check-cast v4, Lfge;

    iput-object v2, v4, Lfge;->G:Landroid/animation/ValueAnimator;

    iget-object p1, v4, Lfge;->C:Landroid/view/View;

    iget-boolean p0, p0, Lin8;->b:Z

    xor-int/lit8 p0, p0, 0x1

    invoke-virtual {p1, p0}, Landroid/view/View;->setClickable(Z)V

    return-void

    :pswitch_38
    check-cast v4, Lc99;

    iput-byte v1, v4, Lc99;->q:B

    iput-object v2, v4, Lc99;->l:Landroid/animation/Animator;

    return-void

    :pswitch_3f
    check-cast v4, Leq8;

    iget-boolean p1, p0, Lin8;->b:Z

    if-eqz p1, :cond_48

    iput-boolean v1, p0, Lin8;->b:Z

    goto :goto_66

    :cond_48
    iget-object p0, v4, Leq8;->z:Landroid/animation/ValueAnimator;

    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Float;

    invoke-virtual {p0}, Ljava/lang/Float;->floatValue()F

    move-result p0

    cmpl-float p0, p0, v3

    if-nez p0, :cond_5e

    iput-byte v1, v4, Leq8;->A:B

    invoke-virtual {v4, v1}, Leq8;->h(I)V

    goto :goto_66

    :cond_5e
    const/4 p0, 0x2

    iput-byte p0, v4, Leq8;->A:B

    iget-object p0, v4, Leq8;->s:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    :goto_66
    return-void

    :pswitch_67
    iget-boolean p0, p0, Lin8;->b:Z

    if-nez p0, :cond_71

    check-cast v4, Landroid/view/View;

    const/4 p0, 0x4

    invoke-virtual {v4, p0}, Landroid/view/View;->setVisibility(I)V

    :cond_71
    return-void

    :pswitch_data_72
    .packed-switch 0x0
        :pswitch_67
        :pswitch_3f
        :pswitch_38
        :pswitch_2a
        :pswitch_a
        :pswitch_1c
        :pswitch_e
    .end packed-switch
.end method

.method public final onAnimationStart(Landroid/animation/Animator;)V
    .registers 5

    iget-byte v0, p0, Lin8;->a:B

    const/4 v1, 0x0

    iget-object v2, p0, Lin8;->c:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_26

    :pswitch_8
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationStart(Landroid/animation/Animator;)V

    return-void

    :pswitch_c
    check-cast v2, Lc99;

    iget-object v0, v2, Lc99;->r:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    iget-boolean p0, p0, Lin8;->b:Z

    invoke-virtual {v0, v1, p0}, Lsan;->a(IZ)V

    const/4 p0, 0x2

    iput-byte p0, v2, Lc99;->q:B

    iput-object p1, v2, Lc99;->l:Landroid/animation/Animator;

    return-void

    :pswitch_1b
    iget-boolean p0, p0, Lin8;->b:Z

    if-eqz p0, :cond_24

    check-cast v2, Landroid/view/View;

    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    :cond_24
    return-void

    nop

    :pswitch_data_26
    .packed-switch 0x0
        :pswitch_1b
        :pswitch_8
        :pswitch_c
    .end packed-switch
.end method
