.class public final synthetic Llxe;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:I

.field public final synthetic c:I

.field public final synthetic d:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(IILcom/opera/android/custom_views/StylingImageCheckableWithText;)V
    .registers 5

    const/4 v0, 0x1

    iput-byte v0, p0, Llxe;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Llxe;->b:I

    iput p2, p0, Llxe;->c:I

    iput-object p3, p0, Llxe;->d:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Lmxe;II)V
    .registers 5

    .line 13
    const/4 v0, 0x0

    iput-byte v0, p0, Llxe;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Llxe;->d:Ljava/lang/Object;

    iput p2, p0, Llxe;->b:I

    iput p3, p0, Llxe;->c:I

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .registers 5

    iget-byte v0, p0, Llxe;->a:B

    iget-object v1, p0, Llxe;->d:Ljava/lang/Object;

    iget v2, p0, Llxe;->c:I

    iget p0, p0, Llxe;->b:I

    packed-switch v0, :pswitch_data_42

    check-cast v1, Lcom/opera/android/custom_views/StylingImageCheckableWithText;

    sget-object v0, Lcom/opera/android/custom_views/StylingImageCheckableWithText;->x:[I

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    sub-int/2addr v2, p0

    int-to-float v0, v2

    mul-float/2addr v0, p1

    float-to-int p1, v0

    add-int/2addr p0, p1

    iget-object p1, v1, Lcom/opera/android/custom_views/StylingImageCheckableWithText;->p:Lov0;

    iget-object p1, p1, Lov0;->d:Ljava/lang/Object;

    check-cast p1, Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    iput p0, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    invoke-virtual {p1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-void

    :pswitch_2e
    check-cast v1, Lmxe;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    invoke-static {p1, p0, v2}, Lp37;->R(FII)I

    move-result p0

    invoke-virtual {v1, p0}, Lmxe;->S(I)V

    return-void

    :pswitch_data_42
    .packed-switch 0x0
        :pswitch_2e
    .end packed-switch
.end method
