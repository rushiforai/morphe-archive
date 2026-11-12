.class public final synthetic Lzpj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lbqj;


# direct methods
.method public synthetic constructor <init>(Lbqj;B)V
    .registers 3

    iput-byte p2, p0, Lzpj;->a:B

    iput-object p1, p0, Lzpj;->b:Lbqj;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .registers 3

    iget-byte v0, p0, Lzpj;->a:B

    iget-object p0, p0, Lzpj;->b:Lbqj;

    packed-switch v0, :pswitch_data_36

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iget-object v0, p0, Lbqj;->a:Lrf2;

    iget-object v0, v0, Lrf2;->e:Landroid/view/View;

    check-cast v0, Landroid/widget/FrameLayout;

    invoke-static {p1, v0}, Lp37;->t0(ILandroid/view/View;)V

    invoke-virtual {p0}, Lbqj;->b()V

    return-void

    :pswitch_1e
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iget-object v0, p0, Lbqj;->a:Lrf2;

    iget-object v0, v0, Lrf2;->e:Landroid/view/View;

    check-cast v0, Landroid/widget/FrameLayout;

    invoke-static {p1, v0}, Lp37;->t0(ILandroid/view/View;)V

    invoke-virtual {p0}, Lbqj;->b()V

    return-void

    nop

    :pswitch_data_36
    .packed-switch 0x0
        :pswitch_1e
    .end packed-switch
.end method
