.class public final Lc48;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(BLandroid/view/View;Ljava/lang/Object;)V
    .registers 4

    .line 12
    iput-byte p1, p0, Lc48;->a:B

    iput-object p2, p0, Lc48;->b:Landroid/view/View;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroid/view/View;)V
    .registers 3

    const/4 v0, 0x0

    iput-byte v0, p0, Lc48;->a:B

    iput-object p1, p0, Lc48;->b:Landroid/view/View;

    .line 13
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method

.method public constructor <init>(Lqe6;Landroid/view/View;)V
    .registers 4

    const/4 v0, 0x3

    iput-byte v0, p0, Lc48;->a:B

    iput-object p2, p0, Lc48;->b:Landroid/view/View;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public final onAnimationCancel(Landroid/animation/Animator;)V
    .registers 3

    iget-byte v0, p0, Lc48;->a:B

    packed-switch v0, :pswitch_data_1e

    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationCancel(Landroid/animation/Animator;)V

    return-void

    :pswitch_9
    iget-object p0, p0, Lc48;->b:Landroid/view/View;

    const/high16 p1, 0x3f800000    # 1.0f

    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/view/View;->setTranslationX(F)V

    invoke-virtual {p0, v0}, Landroid/view/View;->setTranslationY(F)V

    invoke-virtual {p0, p1}, Landroid/view/View;->setScaleX(F)V

    invoke-virtual {p0, p1}, Landroid/view/View;->setScaleY(F)V

    return-void

    :pswitch_data_1e
    .packed-switch 0x0
        :pswitch_9
    .end packed-switch
.end method

.method public final onAnimationEnd(Landroid/animation/Animator;)V
    .registers 5

    iget-byte v0, p0, Lc48;->a:B

    const/16 v1, 0x8

    iget-object v2, p0, Lc48;->b:Landroid/view/View;

    packed-switch v0, :pswitch_data_22

    :pswitch_9
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    return-void

    :pswitch_d
    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    return-void

    :pswitch_11
    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    return-void

    :pswitch_15
    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    return-void

    :pswitch_19
    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    return-void

    :pswitch_1d
    invoke-virtual {v2}, Landroid/view/View;->resetPivot()V

    return-void

    nop

    :pswitch_data_22
    .packed-switch 0x0
        :pswitch_1d
        :pswitch_9
        :pswitch_19
        :pswitch_9
        :pswitch_15
        :pswitch_9
        :pswitch_11
        :pswitch_9
        :pswitch_d
    .end packed-switch
.end method

.method public final onAnimationStart(Landroid/animation/Animator;)V
    .registers 5

    iget-byte v0, p0, Lc48;->a:B

    const/4 v1, 0x0

    iget-object v2, p0, Lc48;->b:Landroid/view/View;

    packed-switch v0, :pswitch_data_1c

    :pswitch_8
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationStart(Landroid/animation/Animator;)V

    return-void

    :pswitch_c
    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    return-void

    :pswitch_10
    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    return-void

    :pswitch_14
    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    return-void

    :pswitch_18
    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    return-void

    :pswitch_data_1c
    .packed-switch 0x1
        :pswitch_18
        :pswitch_8
        :pswitch_14
        :pswitch_8
        :pswitch_10
        :pswitch_8
        :pswitch_c
    .end packed-switch
.end method
