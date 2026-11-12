.class public final synthetic Lug5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:I

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;IB)V
    .registers 4

    iput-byte p3, p0, Lug5;->a:B

    iput-object p1, p0, Lug5;->c:Ljava/lang/Object;

    iput p2, p0, Lug5;->b:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Lug5;->a:B

    const/4 v1, 0x0

    iget v2, p0, Lug5;->b:I

    iget-object p0, p0, Lug5;->c:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_7e

    check-cast p0, Lz3;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, v0}, Lz3;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_16
    check-cast p0, Lcom/opera/android/custom_views/StylingImageCheckableWithText;

    iput-object v1, p0, Lcom/opera/android/custom_views/StylingImageCheckableWithText;->q:Landroid/animation/ValueAnimator;

    new-instance v0, Ldnj;

    const/16 v1, 0x12

    invoke-direct {v0, p0, v1}, Ldnj;-><init>(Ljava/lang/Object;B)V

    const/4 v1, 0x0

    invoke-virtual {p0, v2, v1, v0, v1}, Lcom/opera/android/custom_views/StylingImageCheckableWithText;->t(IILkotlin/jvm/functions/Function0;Z)Landroid/animation/ValueAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/opera/android/custom_views/StylingImageCheckableWithText;->r:Landroid/animation/ValueAnimator;

    const-wide/16 v1, 0x384

    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setStartDelay(J)V

    iget-object p0, p0, Lcom/opera/android/custom_views/StylingImageCheckableWithText;->r:Landroid/animation/ValueAnimator;

    if-eqz p0, :cond_34

    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    :cond_34
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_37
    check-cast p0, Lr05;

    iget-object p0, p0, Lr05;->e:Ljava/lang/Object;

    check-cast p0, Lnjl;

    iget-object p0, p0, Lnjl;->b:Lxbe;

    invoke-virtual {p0, v2}, Lxbe;->d(I)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_48
    check-cast p0, Lrn9;

    iget-object p0, p0, Lrn9;->d:Ljava/lang/Object;

    check-cast p0, Lon9;

    invoke-interface {p0}, Lon9;->H()Lqe6;

    move-result-object p0

    if-eqz p0, :cond_5b

    iget-object p0, p0, Lqe6;->b:Ljava/lang/Object;

    check-cast p0, Llba;

    invoke-interface {p0, v2}, Llba;->e(I)V

    :cond_5b
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_5e
    check-cast p0, Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    instance-of v0, p0, Lf87;

    if-eqz v0, :cond_6b

    check-cast p0, Lf87;

    goto :goto_6c

    :cond_6b
    move-object p0, v1

    :goto_6c
    if-eqz p0, :cond_72

    invoke-interface {p0}, Lf87;->getWindow()Landroid/view/Window;

    move-result-object v1

    :cond_72
    if-eqz v1, :cond_7b

    invoke-static {v2}, Lp37;->u0(I)Z

    move-result p0

    invoke-static {v1, p0}, Lmcj;->s(Landroid/view/Window;Z)Z

    :cond_7b
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_data_7e
    .packed-switch 0x0
        :pswitch_5e
        :pswitch_48
        :pswitch_37
        :pswitch_16
    .end packed-switch
.end method
