.class public final Lcom/opera/android/widget/ScheduleRangeSlider;
.super Lcom/google/android/material/slider/h;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u0008\u0007\u0018\u00002\u00020\u0001\u00a8\u0006\u0002"
    }
    d2 = {
        "Lcom/opera/android/widget/ScheduleRangeSlider;",
        "Lcom/google/android/material/slider/h;",
        "app"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public h1:Z

.field public i1:Landroid/content/res/ColorStateList;

.field public j1:Landroid/content/res/ColorStateList;

.field public k1:Landroid/content/res/ColorStateList;

.field public l1:Landroid/content/res/ColorStateList;

.field public final m1:Lf0a;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2}, Lcom/google/android/material/slider/h;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    invoke-virtual {p0}, Lcom/google/android/material/slider/h;->x0()Landroid/content/res/ColorStateList;

    move-result-object p1

    iput-object p1, p0, Lcom/opera/android/widget/ScheduleRangeSlider;->i1:Landroid/content/res/ColorStateList;

    invoke-virtual {p0}, Lcom/google/android/material/slider/h;->y0()Landroid/content/res/ColorStateList;

    move-result-object p1

    iput-object p1, p0, Lcom/opera/android/widget/ScheduleRangeSlider;->j1:Landroid/content/res/ColorStateList;

    invoke-virtual {p0}, Lcom/google/android/material/slider/h;->v0()Landroid/content/res/ColorStateList;

    move-result-object p1

    iput-object p1, p0, Lcom/opera/android/widget/ScheduleRangeSlider;->k1:Landroid/content/res/ColorStateList;

    invoke-virtual {p0}, Lcom/google/android/material/slider/h;->w0()Landroid/content/res/ColorStateList;

    move-result-object p1

    iput-object p1, p0, Lcom/opera/android/widget/ScheduleRangeSlider;->l1:Landroid/content/res/ColorStateList;

    new-instance p1, Lf0a;

    invoke-direct {p1}, Lf0a;-><init>()V

    iput-object p1, p0, Lcom/opera/android/widget/ScheduleRangeSlider;->m1:Lf0a;

    iget-boolean p1, p0, Lcom/opera/android/widget/ScheduleRangeSlider;->h1:Z

    invoke-virtual {p0}, Lcom/google/android/material/slider/h;->y()Ljava/util/ArrayList;

    move-result-object p2

    const/high16 v0, 0x3e800000    # 0.25f

    invoke-virtual {p0, v0}, Lcom/opera/android/widget/ScheduleRangeSlider;->E0(F)F

    move-result v0

    invoke-static {p1, p2}, Lkotlin/collections/CollectionsKt;->M(ILjava/util/List;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Float;

    if-eqz p1, :cond_3a

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result v0

    :cond_3a
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    invoke-virtual {p0}, Lcom/opera/android/widget/ScheduleRangeSlider;->F0()F

    move-result p2

    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p2

    filled-new-array {p1, p2}, [Ljava/lang/Float;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/opera/android/widget/ScheduleRangeSlider;->a0([Ljava/lang/Float;)V

    new-instance p1, Lkkf;

    const/16 p2, 0xd

    invoke-direct {p1, p0, p2}, Lkkf;-><init>(Ljava/lang/Object;B)V

    sget-object p2, Lq9n;->c:Ll5b;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Lhjf;->v(Landroid/content/Context;)Ldll;

    move-result-object p2

    if-nez p2, :cond_61

    return-void

    :cond_61
    invoke-static {p2, p0, p1}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    return-void
.end method


# virtual methods
.method public final E0(F)F
    .registers 5

    invoke-virtual {p0}, Lcom/google/android/material/slider/h;->w()F

    move-result v0

    invoke-virtual {p0}, Lcom/google/android/material/slider/h;->x()F

    move-result v1

    invoke-virtual {p0}, Lcom/google/android/material/slider/h;->w()F

    move-result v2

    sub-float/2addr v1, v2

    mul-float/2addr v1, p1

    add-float/2addr v1, v0

    invoke-virtual {p0}, Lcom/google/android/material/slider/h;->w()F

    move-result p1

    invoke-virtual {p0}, Lcom/google/android/material/slider/h;->x()F

    move-result p0

    invoke-static {v1, p1, p0}, Ldjh;->b(FFF)F

    move-result p0

    return p0
.end method

.method public final F0()F
    .registers 4

    iget-boolean v0, p0, Lcom/opera/android/widget/ScheduleRangeSlider;->h1:Z

    xor-int/lit8 v0, v0, 0x1

    invoke-virtual {p0}, Lcom/google/android/material/slider/h;->y()Ljava/util/ArrayList;

    move-result-object v1

    const/high16 v2, 0x3f400000    # 0.75f

    invoke-virtual {p0, v2}, Lcom/opera/android/widget/ScheduleRangeSlider;->E0(F)F

    move-result p0

    invoke-static {v0, v1}, Lkotlin/collections/CollectionsKt;->M(ILjava/util/List;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    if-eqz v0, :cond_1a

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result p0

    :cond_1a
    return p0
.end method

.method public final G0(Ljava/util/List;)V
    .registers 5

    iget-boolean v0, p0, Lcom/opera/android/widget/ScheduleRangeSlider;->h1:Z

    invoke-virtual {p0}, Lcom/google/android/material/slider/h;->y()Ljava/util/ArrayList;

    move-result-object v1

    const/high16 v2, 0x3e800000    # 0.25f

    invoke-virtual {p0, v2}, Lcom/opera/android/widget/ScheduleRangeSlider;->E0(F)F

    move-result v2

    invoke-static {v0, v1}, Lkotlin/collections/CollectionsKt;->M(ILjava/util/List;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    if-eqz v0, :cond_18

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v2

    :cond_18
    const/4 v0, 0x0

    invoke-static {v0, p1}, Lkotlin/collections/CollectionsKt;->M(ILjava/util/List;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    if-eqz v0, :cond_25

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v2

    :cond_25
    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    invoke-virtual {p0}, Lcom/opera/android/widget/ScheduleRangeSlider;->F0()F

    move-result v1

    const/4 v2, 0x1

    invoke-static {v2, p1}, Lkotlin/collections/CollectionsKt;->M(ILjava/util/List;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Float;

    if-eqz p1, :cond_3a

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    :cond_3a
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    filled-new-array {v0, p1}, [Ljava/lang/Float;

    move-result-object p1

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_70

    invoke-static {p1}, Lkotlin/collections/CollectionsKt;->K(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->floatValue()F

    move-result v0

    invoke-static {p1}, Lkotlin/collections/CollectionsKt;->Q(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->floatValue()F

    move-result v1

    cmpl-float v0, v0, v1

    if-lez v0, :cond_70

    iget-boolean v0, p0, Lcom/opera/android/widget/ScheduleRangeSlider;->h1:Z

    xor-int/lit8 v1, v0, 0x1

    if-eq v0, v1, :cond_70

    iput-boolean v1, p0, Lcom/opera/android/widget/ScheduleRangeSlider;->h1:Z

    invoke-virtual {p0, v1}, Lcom/opera/android/widget/ScheduleRangeSlider;->H0(Z)V

    :cond_70
    invoke-super {p0, p1}, Lcom/google/android/material/slider/h;->D0(Ljava/util/List;)V

    return-void
.end method

.method public final H0(Z)V
    .registers 3

    if-eqz p1, :cond_5

    iget-object v0, p0, Lcom/opera/android/widget/ScheduleRangeSlider;->l1:Landroid/content/res/ColorStateList;

    goto :goto_7

    :cond_5
    iget-object v0, p0, Lcom/opera/android/widget/ScheduleRangeSlider;->k1:Landroid/content/res/ColorStateList;

    :goto_7
    invoke-super {p0, v0}, Lcom/google/android/material/slider/h;->U(Landroid/content/res/ColorStateList;)V

    if-eqz p1, :cond_f

    iget-object v0, p0, Lcom/opera/android/widget/ScheduleRangeSlider;->k1:Landroid/content/res/ColorStateList;

    goto :goto_11

    :cond_f
    iget-object v0, p0, Lcom/opera/android/widget/ScheduleRangeSlider;->l1:Landroid/content/res/ColorStateList;

    :goto_11
    invoke-super {p0, v0}, Lcom/google/android/material/slider/h;->V(Landroid/content/res/ColorStateList;)V

    if-eqz p1, :cond_19

    iget-object v0, p0, Lcom/opera/android/widget/ScheduleRangeSlider;->j1:Landroid/content/res/ColorStateList;

    goto :goto_1b

    :cond_19
    iget-object v0, p0, Lcom/opera/android/widget/ScheduleRangeSlider;->i1:Landroid/content/res/ColorStateList;

    :goto_1b
    invoke-super {p0, v0}, Lcom/google/android/material/slider/h;->W(Landroid/content/res/ColorStateList;)V

    if-eqz p1, :cond_23

    iget-object p1, p0, Lcom/opera/android/widget/ScheduleRangeSlider;->i1:Landroid/content/res/ColorStateList;

    goto :goto_25

    :cond_23
    iget-object p1, p0, Lcom/opera/android/widget/ScheduleRangeSlider;->j1:Landroid/content/res/ColorStateList;

    :goto_25
    invoke-super {p0, p1}, Lcom/google/android/material/slider/h;->Y(Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method public final U(Landroid/content/res/ColorStateList;)V
    .registers 3

    iput-object p1, p0, Lcom/opera/android/widget/ScheduleRangeSlider;->k1:Landroid/content/res/ColorStateList;

    iget-boolean v0, p0, Lcom/opera/android/widget/ScheduleRangeSlider;->h1:Z

    if-eqz v0, :cond_8

    iget-object p1, p0, Lcom/opera/android/widget/ScheduleRangeSlider;->l1:Landroid/content/res/ColorStateList;

    :cond_8
    invoke-super {p0, p1}, Lcom/google/android/material/slider/h;->U(Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method public final V(Landroid/content/res/ColorStateList;)V
    .registers 3

    iput-object p1, p0, Lcom/opera/android/widget/ScheduleRangeSlider;->l1:Landroid/content/res/ColorStateList;

    iget-boolean v0, p0, Lcom/opera/android/widget/ScheduleRangeSlider;->h1:Z

    if-eqz v0, :cond_8

    iget-object p1, p0, Lcom/opera/android/widget/ScheduleRangeSlider;->k1:Landroid/content/res/ColorStateList;

    :cond_8
    invoke-super {p0, p1}, Lcom/google/android/material/slider/h;->V(Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method public final W(Landroid/content/res/ColorStateList;)V
    .registers 3

    iput-object p1, p0, Lcom/opera/android/widget/ScheduleRangeSlider;->i1:Landroid/content/res/ColorStateList;

    iget-boolean v0, p0, Lcom/opera/android/widget/ScheduleRangeSlider;->h1:Z

    if-eqz v0, :cond_8

    iget-object p1, p0, Lcom/opera/android/widget/ScheduleRangeSlider;->j1:Landroid/content/res/ColorStateList;

    :cond_8
    invoke-super {p0, p1}, Lcom/google/android/material/slider/h;->W(Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method public final Y(Landroid/content/res/ColorStateList;)V
    .registers 3

    iput-object p1, p0, Lcom/opera/android/widget/ScheduleRangeSlider;->j1:Landroid/content/res/ColorStateList;

    iget-boolean v0, p0, Lcom/opera/android/widget/ScheduleRangeSlider;->h1:Z

    if-eqz v0, :cond_8

    iget-object p1, p0, Lcom/opera/android/widget/ScheduleRangeSlider;->i1:Landroid/content/res/ColorStateList;

    :cond_8
    invoke-super {p0, p1}, Lcom/google/android/material/slider/h;->Y(Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method public final varargs a0([Ljava/lang/Float;)V
    .registers 2

    invoke-static {p1}, Le82;->p([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/opera/android/widget/ScheduleRangeSlider;->G0(Ljava/util/List;)V

    return-void
.end method

.method public final onLayout(ZIIII)V
    .registers 6

    invoke-super/range {p0 .. p5}, Lcom/google/android/material/slider/h;->onLayout(ZIIII)V

    iget-object p1, p0, Lcom/opera/android/widget/ScheduleRangeSlider;->m1:Lf0a;

    iget-object p1, p1, Lf0a;->a:Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/graphics/Rect;

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result p3

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result p4

    const/4 p5, 0x0

    invoke-virtual {p2, p5, p5, p3, p4}, Landroid/graphics/Rect;->set(IIII)V

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/graphics/Rect;

    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/view/View;->setSystemGestureExclusionRects(Ljava/util/List;)V

    return-void
.end method

.method public final onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 8

    invoke-super {p0, p1}, Lcom/google/android/material/slider/h;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_8

    return v1

    :cond_8
    invoke-virtual {p0}, Lcom/google/android/material/slider/h;->u0()I

    move-result v0

    const/4 v2, 0x1

    if-ltz v0, :cond_87

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v3

    const/4 v4, 0x2

    if-ne v3, v4, :cond_87

    add-int/lit8 v3, v0, -0x1

    invoke-static {v3}, Ljava/lang/Math;->abs(I)I

    move-result v3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result p1

    invoke-virtual {p0}, Lcom/google/android/material/slider/h;->z0()I

    move-result v4

    int-to-float v4, v4

    sub-float/2addr p1, v4

    invoke-virtual {p0}, Lcom/google/android/material/slider/h;->A0()I

    move-result v4

    int-to-float v4, v4

    div-float/2addr p1, v4

    invoke-virtual {p0}, Landroid/view/View;->getLayoutDirection()I

    move-result v4

    if-ne v4, v2, :cond_36

    const/high16 v4, 0x3f800000    # 1.0f

    sub-float p1, v4, p1

    :cond_36
    invoke-virtual {p0, p1}, Lcom/opera/android/widget/ScheduleRangeSlider;->E0(F)F

    move-result p1

    invoke-virtual {p0}, Lcom/google/android/material/slider/h;->y()Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Float;

    if-eqz v0, :cond_66

    if-eq v0, v2, :cond_55

    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v0

    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v4

    cmpl-float v4, p1, v4

    if-lez v4, :cond_73

    goto :goto_72

    :cond_55
    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v0

    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v4

    cmpg-float v4, p1, v4

    if-gez v4, :cond_62

    move v1, v2

    :cond_62
    move v5, v0

    move v0, p1

    move p1, v5

    goto :goto_73

    :cond_66
    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v0

    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v4

    cmpl-float v4, p1, v4

    if-lez v4, :cond_73

    :goto_72
    move v1, v2

    :cond_73
    :goto_73
    if-eqz v1, :cond_87

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    filled-new-array {p1, v0}, [Ljava/lang/Float;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/opera/android/widget/ScheduleRangeSlider;->a0([Ljava/lang/Float;)V

    invoke-virtual {p0, v3}, Lcom/google/android/material/slider/h;->K(I)V

    :cond_87
    return v2
.end method
