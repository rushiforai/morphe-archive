.class public final synthetic Ln2a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lw73;


# instance fields
.field public final synthetic a:Lcom/opera/android/widget/GradientSlider;

.field public final synthetic b:Landroid/content/Context;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/widget/GradientSlider;Landroid/content/Context;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ln2a;->a:Lcom/opera/android/widget/GradientSlider;

    iput-object p2, p0, Ln2a;->b:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final b(Ljava/lang/Object;FZ)V
    .registers 6

    check-cast p1, Lcom/google/android/material/slider/Slider;

    sget-object p1, Lcom/opera/android/widget/GradientSlider;->m1:Landroid/content/res/ColorStateList;

    iget-object p1, p0, Ln2a;->b:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    iget-object p0, p0, Ln2a;->a:Lcom/opera/android/widget/GradientSlider;

    iget p2, p0, Lcom/opera/android/widget/GradientSlider;->h1:I

    invoke-virtual {p0}, Lcom/google/android/material/slider/Slider;->x()F

    move-result p3

    invoke-virtual {p0}, Lcom/google/android/material/slider/Slider;->w()F

    move-result v0

    sub-float/2addr p3, v0

    invoke-virtual {p0}, Lcom/google/android/material/slider/Slider;->z0()F

    move-result v0

    invoke-virtual {p0}, Lcom/google/android/material/slider/Slider;->w()F

    move-result v1

    sub-float/2addr v0, v1

    div-float/2addr v0, p3

    const/high16 p3, 0x42c80000    # 100.0f

    mul-float/2addr v0, p3

    float-to-int p3, v0

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    filled-new-array {p3}, [Ljava/lang/Object;

    move-result-object p3

    invoke-virtual {p1, p2, p3}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    return-void
.end method
