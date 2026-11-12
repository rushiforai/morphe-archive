.class public final synthetic Lk85;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lo85;


# direct methods
.method public synthetic constructor <init>(Lo85;B)V
    .registers 3

    iput-byte p2, p0, Lk85;->a:B

    iput-object p1, p0, Lk85;->b:Lo85;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 5

    iget-byte v0, p0, Lk85;->a:B

    iget-object p0, p0, Lk85;->b:Lo85;

    packed-switch v0, :pswitch_data_54

    check-cast p1, Lkl5;

    iget-object p1, p0, Lo85;->i:Landroid/animation/ValueAnimator;

    if-eqz p1, :cond_16

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->cancel()V

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->removeAllUpdateListeners()V

    invoke-virtual {p1}, Landroid/animation/Animator;->removeAllListeners()V

    :cond_16
    const/4 p1, 0x0

    iput-object p1, p0, Lo85;->i:Landroid/animation/ValueAnimator;

    return-void

    :pswitch_1a
    check-cast p1, Lrmn;

    invoke-virtual {p0, p1}, Lo85;->f(Lrmn;)V

    return-void

    :pswitch_20
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iget-object p0, p0, Lo85;->a:Lp85;

    iget-object v0, p0, Lp85;->m:Landroid/view/View;

    check-cast v0, Lcom/opera/android/custom_views/DropShadowFrameLayout;

    invoke-virtual {v0}, Landroid/view/View;->getPaddingTop()I

    move-result v1

    invoke-virtual {v0}, Landroid/view/View;->getPaddingBottom()I

    move-result v2

    invoke-virtual {v0, p1, v1, p1, v2}, Landroid/view/View;->setPadding(IIII)V

    iget-object p0, p0, Lp85;->b:Landroid/widget/LinearLayout;

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    move-result v1

    invoke-virtual {p0, p1, v0, p1, v1}, Landroid/view/View;->setPadding(IIII)V

    return-void

    :pswitch_45
    check-cast p1, Lmnf;

    iget-object p0, p0, Lo85;->a:Lp85;

    iget-object p0, p0, Lp85;->e:Landroidx/constraintlayout/widget/ConstraintLayout;

    iget p1, p1, Lmnf;->b:I

    const/4 v0, 0x7

    const/4 v1, 0x0

    invoke-static {p0, v1, v1, p1, v0}, Lybh;->u(Landroid/view/View;IIII)V

    return-void

    nop

    :pswitch_data_54
    .packed-switch 0x0
        :pswitch_45
        :pswitch_20
        :pswitch_1a
    .end packed-switch
.end method
