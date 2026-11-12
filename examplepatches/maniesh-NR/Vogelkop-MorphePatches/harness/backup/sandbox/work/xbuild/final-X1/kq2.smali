.class public final Lkq2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLayoutChangeListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lcom/opera/android/browser/passwordmanager/PasswordGenerationPopupView;Landroid/view/View;)V
    .registers 4

    const/4 v0, 0x0

    iput-byte v0, p0, Lkq2;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lkq2;->b:Ljava/lang/Object;

    iput-object p1, p0, Lkq2;->c:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    .line 11
    iput-byte p3, p0, Lkq2;->a:B

    iput-object p1, p0, Lkq2;->b:Ljava/lang/Object;

    iput-object p2, p0, Lkq2;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onLayoutChange(Landroid/view/View;IIIIIIII)V
    .registers 14

    iget-byte p2, p0, Lkq2;->a:B

    const/4 p3, 0x1

    iget-object p4, p0, Lkq2;->c:Ljava/lang/Object;

    iget-object p5, p0, Lkq2;->b:Ljava/lang/Object;

    packed-switch p2, :pswitch_data_b6

    invoke-virtual {p1, p0}, Landroid/view/View;->removeOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    check-cast p5, Lz63;

    new-instance p0, Landroid/graphics/Rect;

    check-cast p4, Lpqh;

    iget-object p1, p4, Lpqh;->a:Ljava/lang/Object;

    check-cast p1, Lr9b;

    iget p1, p1, Lr9b;->a:I

    iget-object p2, p5, Lz63;->b:Ljava/lang/Object;

    check-cast p2, Lpt1;

    iget-object p2, p2, Lpt1;->g:Landroid/view/View;

    check-cast p2, Landroid/widget/FrameLayout;

    invoke-virtual {p2}, Landroid/view/View;->getHeight()I

    move-result p2

    iget-object p3, p4, Lpqh;->a:Ljava/lang/Object;

    check-cast p3, Lr9b;

    iget p4, p3, Lr9b;->c:I

    iget p3, p3, Lr9b;->d:I

    invoke-direct {p0, p1, p2, p4, p3}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-virtual {p5, p0}, Lz63;->b(Landroid/graphics/Rect;)V

    return-void

    :pswitch_34
    invoke-virtual {p1, p0}, Landroid/view/View;->removeOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    check-cast p5, Lcom/opera/android/sheet/OperaBottomSheetBehavior;

    check-cast p4, Lknh;

    iget-object p0, p4, Lknh;->A:Ly83;

    const/4 p1, 0x0

    if-nez p0, :cond_41

    move-object p0, p1

    :cond_41
    iget-object p0, p0, Ly83;->g:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/widget/MeasurableHeightScrollView;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    iget-object p2, p4, Lknh;->A:Ly83;

    if-eqz p2, :cond_4e

    move-object p1, p2

    :cond_4e
    iget-object p1, p1, Ly83;->g:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/widget/MeasurableHeightScrollView;

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result p1

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const p2, 0x7f0709f8

    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p0

    int-to-double p6, p0

    const-wide/high16 p8, 0x401b000000000000L    # 6.75

    mul-double/2addr p8, p6

    if-lez p1, :cond_7c

    :goto_67
    int-to-double v0, p1

    div-double v0, p8, v0

    const-wide v2, 0x3feb333333333333L    # 0.85

    cmpl-double p2, v0, v2

    if-lez p2, :cond_7c

    shl-int/lit8 p2, p0, 0x1

    int-to-double v0, p2

    cmpl-double p2, p8, v0

    if-lez p2, :cond_7c

    sub-double/2addr p8, p6

    goto :goto_67

    :cond_7c
    double-to-int p0, p8

    invoke-virtual {p5, p0}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->H(I)V

    return-void

    :pswitch_81
    invoke-virtual {p1, p0}, Landroid/view/View;->removeOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    check-cast p5, Lcom/opera/api/Callback;

    invoke-static {p1}, Lq9n;->t(Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object p0

    invoke-virtual {p0}, Landroid/graphics/Rect;->centerX()I

    move-result p0

    check-cast p4, Lcom/opera/android/BrowserActivity;

    invoke-virtual {p4}, Lfp1;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    iget p1, p1, Landroid/util/DisplayMetrics;->widthPixels:I

    div-int/lit8 p1, p1, 0x2

    if-lt p0, p1, :cond_9f

    const/4 p3, 0x0

    :cond_9f
    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    invoke-interface {p5, p0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_a7
    invoke-virtual {p1, p0}, Landroid/view/View;->removeOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    check-cast p4, Lcom/opera/android/browser/passwordmanager/PasswordGenerationPopupView;

    iget-object p0, p4, Lcom/opera/android/browser/passwordmanager/PasswordGenerationPopupView;->e:Lb4g;

    if-eqz p0, :cond_b5

    check-cast p5, Landroid/view/View;

    invoke-virtual {p0, p5}, Lo73;->o(Landroid/view/View;)V

    :cond_b5
    return-void

    :pswitch_data_b6
    .packed-switch 0x0
        :pswitch_a7
        :pswitch_81
        :pswitch_34
    .end packed-switch
.end method
