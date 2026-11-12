.class public final synthetic Lnvl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lp12;


# direct methods
.method public synthetic constructor <init>(Lp12;B)V
    .registers 3

    iput-byte p2, p0, Lnvl;->a:B

    iput-object p1, p0, Lnvl;->b:Lp12;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .registers 4

    iget-byte v0, p0, Lnvl;->a:B

    iget-object p0, p0, Lnvl;->b:Lp12;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    packed-switch v0, :pswitch_data_40

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p0, p0, Lp12;->c:Ljava/lang/Object;

    check-cast p0, Llvl;

    invoke-virtual {p0, p1}, Llvl;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_1b
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result v0

    iget-object v1, p0, Lp12;->b:Ljava/lang/Object;

    check-cast v1, Llvl;

    invoke-virtual {v1, p1}, Llvl;->run(Ljava/lang/Object;)V

    iget-object p0, p0, Lp12;->a:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/bar/LimitedSideActionsAppbar;

    invoke-virtual {p0, v0}, Landroid/view/View;->setAlpha(F)V

    const/4 p1, 0x0

    cmpl-float p1, v0, p1

    if-nez p1, :cond_3b

    const/16 p1, 0x8

    goto :goto_3c

    :cond_3b
    const/4 p1, 0x0

    :goto_3c
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    return-void

    :pswitch_data_40
    .packed-switch 0x0
        :pswitch_1b
    .end packed-switch
.end method
