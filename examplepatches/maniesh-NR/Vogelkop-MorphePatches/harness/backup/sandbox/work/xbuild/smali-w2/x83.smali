.class public abstract Lx83;
.super Lcom/opera/android/ui/catalog/widget/OperaChip;
.source "SourceFile"

# interfaces
.implements Lw6f;


# static fields
.field public static final K:Lixh;

.field public static final L:Lixh;

.field public static final M:Lixh;

.field public static final N:Llxh;


# instance fields
.field public final A:Lhri;

.field public final B:Li7f;

.field public final C:Landroid/graphics/Rect;

.field public final D:Landroid/view/TouchDelegate;

.field public final E:Lw83;

.field public final F:Lw83;

.field public final G:Lw83;

.field public final H:I

.field public I:Lgri;

.field public final J:I


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lixh;

    const/high16 v1, 0x41c00000    # 24.0f

    invoke-direct {v0, v1}, Lixh;-><init>(F)V

    sput-object v0, Lx83;->K:Lixh;

    new-instance v0, Lixh;

    const/high16 v1, 0x41900000    # 18.0f

    invoke-direct {v0, v1}, Lixh;-><init>(F)V

    sput-object v0, Lx83;->L:Lixh;

    new-instance v0, Lixh;

    const/high16 v1, 0x41a00000    # 20.0f

    invoke-direct {v0, v1}, Lixh;-><init>(F)V

    sput-object v0, Lx83;->M:Lixh;

    new-instance v0, Llxh;

    const v1, 0x7f08052a

    invoke-direct {v0, v1}, Llxh;-><init>(I)V

    sput-object v0, Lx83;->N:Llxh;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lhri;)V
    .registers 13

    const/4 v0, 0x0

    const v1, 0x7f0401cb

    invoke-direct {p0, p1, v0, v1}, Lcom/google/android/material/chip/Chip;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    iput-object p2, p0, Lx83;->A:Lhri;

    new-instance p2, Li7f;

    invoke-direct {p2}, Li7f;-><init>()V

    iput-object p2, p0, Lx83;->B:Li7f;

    new-instance p2, Landroid/graphics/Rect;

    invoke-direct {p2}, Landroid/graphics/Rect;-><init>()V

    iput-object p2, p0, Lx83;->C:Landroid/graphics/Rect;

    new-instance v0, Landroid/view/TouchDelegate;

    invoke-direct {v0, p2, p0}, Landroid/view/TouchDelegate;-><init>(Landroid/graphics/Rect;Landroid/view/View;)V

    iput-object v0, p0, Lx83;->D:Landroid/view/TouchDelegate;

    new-instance v1, Lw83;

    const/high16 p2, 0x40800000    # 4.0f

    invoke-static {p1, p2}, Lz7h;->h(Landroid/content/Context;F)I

    move-result v0

    int-to-float v2, v0

    invoke-static {p1, p2}, Lz7h;->h(Landroid/content/Context;F)I

    move-result v0

    int-to-float v3, v0

    const/high16 v0, 0x41000000    # 8.0f

    invoke-static {p1, v0}, Lz7h;->h(Landroid/content/Context;F)I

    move-result v4

    int-to-float v4, v4

    invoke-static {p1, v0}, Lz7h;->h(Landroid/content/Context;F)I

    move-result v0

    int-to-float v5, v0

    invoke-static {p1, p2}, Lz7h;->h(Landroid/content/Context;F)I

    move-result v0

    int-to-float v6, v0

    invoke-direct/range {v1 .. v6}, Lw83;-><init>(FFFFF)V

    iput-object v1, p0, Lx83;->E:Lw83;

    const/high16 v0, 0x40c00000    # 6.0f

    invoke-static {p1, v0}, Lz7h;->h(Landroid/content/Context;F)I

    move-result v0

    int-to-float v0, v0

    move v7, v5

    move v5, v3

    new-instance v3, Lw83;

    move v8, v6

    move v6, v4

    move v4, v0

    invoke-direct/range {v3 .. v8}, Lw83;-><init>(FFFFF)V

    iput-object v3, p0, Lx83;->F:Lw83;

    new-instance v4, Lw83;

    invoke-static {p1, p2}, Lz7h;->h(Landroid/content/Context;F)I

    move-result v0

    int-to-float v5, v0

    invoke-static {p1, p2}, Lz7h;->h(Landroid/content/Context;F)I

    move-result p2

    int-to-float v6, p2

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v7, 0x0

    invoke-direct/range {v4 .. v9}, Lw83;-><init>(FFFFF)V

    iput-object v4, p0, Lx83;->G:Lw83;

    sget-object p2, Lx83;->K:Lixh;

    invoke-virtual {p2, p1}, Ly7h;->k(Landroid/content/Context;)I

    move-result p2

    iput p2, p0, Lx83;->H:I

    sget-object v0, Lgri;->j:Lgri;

    iput-object v0, p0, Lx83;->I:Lgri;

    const/high16 v0, 0x42400000    # 48.0f

    invoke-static {p1, v0}, Lz7h;->h(Landroid/content/Context;F)I

    move-result p1

    iput p1, p0, Lx83;->J:I

    const/4 p1, 0x3

    invoke-virtual {p0, p1}, Lcom/google/android/material/chip/Chip;->setLayoutDirection(I)V

    iget-object p1, p0, Lcom/google/android/material/chip/Chip;->e:Ltx4;

    if-eqz p1, :cond_9d

    iget v0, p1, Ltx4;->M:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-eqz v0, :cond_9d

    iput v1, p1, Ltx4;->M:F

    iget-object v0, p1, Ltx4;->m0:Landroid/graphics/Paint;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-boolean v0, p1, Ltx4;->L0:Z

    if-eqz v0, :cond_9a

    invoke-virtual {p1, v1}, Lzdd;->A(F)V

    :cond_9a
    invoke-virtual {p1}, Lzdd;->invalidateSelf()V

    :cond_9d
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const/high16 v0, 0x42000000    # 32.0f

    invoke-static {p1, v0}, Lz7h;->h(Landroid/content/Context;F)I

    move-result p1

    int-to-float p1, p1

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->e:Ltx4;

    if-eqz v0, :cond_ba

    iget v1, v0, Ltx4;->J:F

    cmpl-float v1, v1, p1

    if-eqz v1, :cond_ba

    iput p1, v0, Ltx4;->J:F

    invoke-virtual {v0}, Lzdd;->invalidateSelf()V

    invoke-virtual {v0}, Ltx4;->M()V

    :cond_ba
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const/high16 v0, 0x42c80000    # 100.0f

    invoke-static {p1, v0}, Lz7h;->h(Landroid/content/Context;F)I

    move-result p1

    int-to-float p1, p1

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->e:Ltx4;

    if-eqz v0, :cond_dc

    iget v1, v0, Ltx4;->K:F

    cmpl-float v1, v1, p1

    if-eqz v1, :cond_dc

    iput p1, v0, Ltx4;->K:F

    invoke-virtual {v0}, Lzdd;->l()Lsaj;

    move-result-object v1

    invoke-virtual {v1, p1}, Lsaj;->a(F)Lsaj;

    move-result-object p1

    invoke-virtual {v0, p1}, Lzdd;->k(Lsaj;)V

    :cond_dc
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const/high16 v0, 0x43480000    # 200.0f

    invoke-static {p1, v0}, Lz7h;->h(Landroid/content/Context;F)I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/google/android/material/chip/Chip;->setMaxWidth(I)V

    sget-object p1, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {p0, p1}, Lcom/google/android/material/chip/Chip;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    int-to-float p1, p2

    iget-object p2, p0, Lcom/google/android/material/chip/Chip;->e:Ltx4;

    if-eqz p2, :cond_10d

    iget v0, p2, Ltx4;->S:F

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_10d

    invoke-virtual {p2}, Ltx4;->H()F

    move-result v0

    iput p1, p2, Ltx4;->S:F

    invoke-virtual {p2}, Ltx4;->H()F

    move-result p1

    invoke-virtual {p2}, Lzdd;->invalidateSelf()V

    cmpl-float p1, v0, p1

    if-eqz p1, :cond_10d

    invoke-virtual {p2}, Ltx4;->M()V

    :cond_10d
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/google/android/material/chip/Chip;->o:Z

    iget p2, p0, Lcom/google/android/material/chip/Chip;->q:I

    invoke-virtual {p0, p2}, Lcom/google/android/material/chip/Chip;->b(I)V

    new-instance p2, Lv83;

    invoke-direct {p2, p0, p1}, Lv83;-><init>(Lx83;B)V

    invoke-virtual {p0, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    sget-object p1, Lx83;->M:Lixh;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p1, p2}, Ly7h;->k(Landroid/content/Context;)I

    move-result p1

    int-to-float p1, p1

    iget-object p2, p0, Lcom/google/android/material/chip/Chip;->e:Ltx4;

    if-eqz p2, :cond_140

    iget v0, p2, Ltx4;->Y:F

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_140

    iput p1, p2, Ltx4;->Y:F

    invoke-virtual {p2}, Lzdd;->invalidateSelf()V

    invoke-virtual {p2}, Ltx4;->W()Z

    move-result p1

    if-eqz p1, :cond_140

    invoke-virtual {p2}, Ltx4;->M()V

    :cond_140
    sget-object p1, Lx83;->N:Llxh;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p1, p2}, Lb8h;->f(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    iget-object p2, p0, Lcom/google/android/material/chip/Chip;->e:Ltx4;

    if-eqz p2, :cond_151

    invoke-virtual {p2, p1}, Ltx4;->R(Landroid/graphics/drawable/Drawable;)V

    :cond_151
    invoke-virtual {p0}, Lcom/google/android/material/chip/Chip;->i()V

    new-instance p1, Lv83;

    const/4 p2, 0x1

    invoke-direct {p1, p0, p2}, Lv83;-><init>(Lx83;B)V

    iput-object p1, p0, Lcom/google/android/material/chip/Chip;->h:Lv83;

    invoke-virtual {p0}, Lcom/google/android/material/chip/Chip;->i()V

    new-instance p1, Lu7;

    const/16 p2, 0x10

    invoke-direct {p1, p0, p2}, Lu7;-><init>(Ljava/lang/Object;B)V

    invoke-static {p0}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object p2

    if-eqz p2, :cond_16f

    invoke-static {p2, p0, p1}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_16f
    invoke-virtual {p0, p0}, Lx83;->q(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final F(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Ldv7;

    iget-object p0, p0, Lx83;->B:Li7f;

    invoke-virtual {p0, p1}, Li7f;->b(Ljava/lang/Object;)Z

    return-void
.end method

.method public final H(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Ldv7;

    iget-object p0, p0, Lx83;->B:Li7f;

    invoke-virtual {p0, p1}, Li7f;->c(Ljava/lang/Object;)Z

    return-void
.end method

.method public final onLayout(ZIIII)V
    .registers 9

    invoke-super/range {p0 .. p5}, Landroid/view/View;->onLayout(ZIIII)V

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result p1

    iget v0, p0, Lx83;->J:I

    sub-int p1, v0, p1

    const/4 v1, 0x0

    if-gez p1, :cond_f

    move p1, v1

    :cond_f
    div-int/lit8 p1, p1, 0x2

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v2

    sub-int/2addr v0, v2

    if-ltz v0, :cond_19

    move v1, v0

    :cond_19
    div-int/lit8 v1, v1, 0x2

    sub-int/2addr p2, p1

    sub-int/2addr p3, v1

    add-int/2addr p4, p1

    add-int/2addr p5, v1

    iget-object p0, p0, Lx83;->C:Landroid/graphics/Rect;

    invoke-virtual {p0, p2, p3, p4, p5}, Landroid/graphics/Rect;->set(IIII)V

    return-void
.end method

.method public final onMeasure(II)V
    .registers 3

    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    iget-object p1, p0, Lx83;->I:Lgri;

    iget-object p2, p1, Lgri;->e:Landroid/graphics/drawable/Drawable;

    if-eqz p2, :cond_20

    iget-object p2, p1, Lgri;->d:Ljava/lang/String;

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-eqz p2, :cond_20

    iget-boolean p1, p1, Lgri;->h:Z

    if-nez p1, :cond_20

    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    move-result p1

    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    move-result p2

    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    :cond_20
    return-void
.end method

.method public final p(Lgri;)V
    .registers 11

    iput-object p1, p0, Lx83;->I:Lgri;

    iget-boolean v0, p1, Lgri;->c:Z

    iget-boolean v1, p1, Lgri;->h:Z

    invoke-virtual {p0, v0}, Landroid/view/View;->setSelected(Z)V

    iget-object v0, p1, Lgri;->d:Ljava/lang/String;

    const/4 v2, 0x1

    if-eqz v0, :cond_2e

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-eqz v3, :cond_2e

    iget-object v3, p1, Lgri;->f:Lfri;

    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    move-result v3

    if-eqz v3, :cond_2b

    if-eq v3, v2, :cond_28

    const/4 v4, 0x2

    if-eq v3, v4, :cond_2b

    const/4 v4, 0x3

    if-eq v3, v4, :cond_2b

    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_28
    iget-object v3, p0, Lx83;->F:Lw83;

    goto :goto_30

    :cond_2b
    iget-object v3, p0, Lx83;->E:Lw83;

    goto :goto_30

    :cond_2e
    iget-object v3, p0, Lx83;->G:Lw83;

    :goto_30
    const/4 v4, 0x0

    if-eqz v1, :cond_36

    iget v5, v3, Lw83;->e:F

    goto :goto_37

    :cond_36
    move v5, v4

    :goto_37
    iget v6, v3, Lw83;->a:F

    iget-object v7, p0, Lcom/google/android/material/chip/Chip;->e:Ltx4;

    if-eqz v7, :cond_4b

    iget v8, v7, Ltx4;->d0:F

    cmpl-float v8, v8, v6

    if-eqz v8, :cond_4b

    iput v6, v7, Ltx4;->d0:F

    invoke-virtual {v7}, Lzdd;->invalidateSelf()V

    invoke-virtual {v7}, Ltx4;->M()V

    :cond_4b
    iget v6, v3, Lw83;->b:F

    add-float/2addr v6, v5

    if-eqz v7, :cond_5e

    iget v5, v7, Ltx4;->k0:F

    cmpl-float v5, v5, v6

    if-eqz v5, :cond_5e

    iput v6, v7, Ltx4;->k0:F

    invoke-virtual {v7}, Lzdd;->invalidateSelf()V

    invoke-virtual {v7}, Ltx4;->M()V

    :cond_5e
    iget-object v5, p1, Lgri;->e:Landroid/graphics/drawable/Drawable;

    if-nez v5, :cond_63

    const/4 v2, 0x0

    :cond_63
    if-eqz v7, :cond_68

    invoke-virtual {v7, v2}, Ltx4;->Q(Z)V

    :cond_68
    if-eqz v7, :cond_84

    iget v2, v7, Ltx4;->f0:F

    cmpl-float v2, v2, v4

    if-eqz v2, :cond_84

    invoke-virtual {v7}, Ltx4;->H()F

    move-result v2

    iput v4, v7, Ltx4;->f0:F

    invoke-virtual {v7}, Ltx4;->H()F

    move-result v4

    invoke-virtual {v7}, Lzdd;->invalidateSelf()V

    cmpl-float v2, v2, v4

    if-eqz v2, :cond_84

    invoke-virtual {v7}, Ltx4;->M()V

    :cond_84
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget v0, v3, Lw83;->c:F

    if-eqz v7, :cond_99

    iget v2, v7, Ltx4;->g0:F

    cmpl-float v2, v2, v0

    if-eqz v2, :cond_99

    iput v0, v7, Ltx4;->g0:F

    invoke-virtual {v7}, Lzdd;->invalidateSelf()V

    invoke-virtual {v7}, Ltx4;->M()V

    :cond_99
    iget v0, v3, Lw83;->d:F

    if-eqz v7, :cond_ab

    iget v2, v7, Ltx4;->h0:F

    cmpl-float v2, v2, v0

    if-eqz v2, :cond_ab

    iput v0, v7, Ltx4;->h0:F

    invoke-virtual {v7}, Lzdd;->invalidateSelf()V

    invoke-virtual {v7}, Ltx4;->M()V

    :cond_ab
    if-eqz v7, :cond_b0

    invoke-virtual {v7, v1}, Ltx4;->T(Z)V

    :cond_b0
    invoke-virtual {p0}, Lcom/google/android/material/chip/Chip;->i()V

    invoke-virtual {p0, p0}, Lx83;->q(Landroid/view/View;)V

    iget-object p1, p1, Lgri;->i:Lcv2;

    if-eqz p1, :cond_c1

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p1, p0}, Lcv2;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_c1
    return-void
.end method

.method public final q(Landroid/view/View;)V
    .registers 14

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p0}, Landroid/view/View;->isSelected()Z

    move-result v0

    if-eqz v0, :cond_e

    const v0, 0x7f0402e2

    goto :goto_11

    :cond_e
    const v0, 0x7f0402a7

    :goto_11
    const v1, 0x7f06063b

    invoke-static {v0, p1, v1}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p1

    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p1

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->e:Ltx4;

    if-eqz v0, :cond_2d

    iget-object v2, v0, Ltx4;->I:Landroid/content/res/ColorStateList;

    if-eq v2, p1, :cond_2d

    iput-object p1, v0, Ltx4;->I:Landroid/content/res/ColorStateList;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getState()[I

    move-result-object p1

    invoke-virtual {v0, p1}, Ltx4;->onStateChange([I)Z

    :cond_2d
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p0}, Landroid/view/View;->isSelected()Z

    move-result v2

    const v3, 0x7f0402a6

    const v4, 0x7f0402be

    if-eqz v2, :cond_3f

    move v2, v4

    goto :goto_40

    :cond_3f
    move v2, v3

    :goto_40
    invoke-static {v2, p1, v1}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p1

    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p1

    iget-object v2, p0, Lx83;->I:Lgri;

    iget-object v2, v2, Lgri;->f:Lfri;

    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    move-result v2

    if-eqz v2, :cond_10b

    const/4 v5, 0x1

    if-eq v2, v5, :cond_fc

    const/4 v6, 0x2

    const/16 v7, 0x11

    const v8, 0x7f080240

    iget v9, p0, Lx83;->H:I

    const/4 v10, 0x0

    if-eq v2, v6, :cond_d3

    const/4 v6, 0x3

    if-ne v2, v6, :cond_cf

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v8, v2}, Lj14;->i0(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-virtual {p0}, Landroid/view/View;->isSelected()Z

    move-result v8

    if-eqz v8, :cond_79

    const v8, 0x7f0402a4

    goto :goto_7c

    :cond_79
    const v8, 0x7f0402a5

    :goto_7c
    invoke-static {v8, v6, v1}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v6

    invoke-static {v6}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v6

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    invoke-virtual {v2, v6}, Landroid/graphics/drawable/Drawable;->setTintList(Landroid/content/res/ColorStateList;)V

    iget-object v6, p0, Lx83;->I:Lgri;

    iget-object v6, v6, Lgri;->e:Landroid/graphics/drawable/Drawable;

    if-eqz v6, :cond_aa

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v8

    invoke-virtual {p0}, Landroid/view/View;->isSelected()Z

    move-result v11

    if-eqz v11, :cond_9b

    move v3, v4

    :cond_9b
    invoke-static {v3, v8, v1}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v1

    invoke-static {v1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v1

    invoke-virtual {v6}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    invoke-virtual {v6, v1}, Landroid/graphics/drawable/Drawable;->setTintList(Landroid/content/res/ColorStateList;)V

    goto :goto_af

    :cond_aa
    new-instance v6, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v6, v10}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    :goto_af
    sget-object v1, Lx83;->L:Lixh;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v1, v3}, Ly7h;->k(Landroid/content/Context;)I

    move-result v1

    new-instance v3, Landroid/graphics/drawable/LayerDrawable;

    filled-new-array {v2, v6}, [Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-direct {v3, v2}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v3, v10, v7}, Landroid/graphics/drawable/LayerDrawable;->setLayerGravity(II)V

    invoke-virtual {v3, v10, v9, v9}, Landroid/graphics/drawable/LayerDrawable;->setLayerSize(III)V

    invoke-virtual {v3, v5, v7}, Landroid/graphics/drawable/LayerDrawable;->setLayerGravity(II)V

    invoke-virtual {v3, v5, v1, v1}, Landroid/graphics/drawable/LayerDrawable;->setLayerSize(III)V

    goto :goto_10f

    :cond_cf
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_d3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v8, v1}, Lj14;->i0(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iget-object v2, p0, Lx83;->I:Lgri;

    iget-object v2, v2, Lgri;->e:Landroid/graphics/drawable/Drawable;

    if-nez v2, :cond_e6

    new-instance v2, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v2, v10}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    :cond_e6
    new-instance v3, Landroid/graphics/drawable/LayerDrawable;

    filled-new-array {v1, v2}, [Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-direct {v3, v1}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v3, v10, v7}, Landroid/graphics/drawable/LayerDrawable;->setLayerGravity(II)V

    invoke-virtual {v3, v10, v9, v9}, Landroid/graphics/drawable/LayerDrawable;->setLayerSize(III)V

    invoke-virtual {v3, v5, v7}, Landroid/graphics/drawable/LayerDrawable;->setLayerGravity(II)V

    invoke-virtual {v3, v5, v9, v9}, Landroid/graphics/drawable/LayerDrawable;->setLayerSize(III)V

    goto :goto_10f

    :cond_fc
    iget-object v1, p0, Lx83;->I:Lgri;

    iget-object v3, v1, Lgri;->e:Landroid/graphics/drawable/Drawable;

    if-eqz v3, :cond_109

    invoke-virtual {v3}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    invoke-virtual {v3, p1}, Landroid/graphics/drawable/Drawable;->setTintList(Landroid/content/res/ColorStateList;)V

    goto :goto_10f

    :cond_109
    const/4 v3, 0x0

    goto :goto_10f

    :cond_10b
    iget-object v1, p0, Lx83;->I:Lgri;

    iget-object v3, v1, Lgri;->e:Landroid/graphics/drawable/Drawable;

    :goto_10f
    if-eqz v0, :cond_114

    invoke-virtual {v0, v3}, Ltx4;->P(Landroid/graphics/drawable/Drawable;)V

    :cond_114
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    if-eqz v0, :cond_131

    iget-object p0, v0, Ltx4;->X:Landroid/content/res/ColorStateList;

    if-eq p0, p1, :cond_131

    iput-object p1, v0, Ltx4;->X:Landroid/content/res/ColorStateList;

    invoke-virtual {v0}, Ltx4;->W()Z

    move-result p0

    if-eqz p0, :cond_12a

    iget-object p0, v0, Ltx4;->V:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->setTintList(Landroid/content/res/ColorStateList;)V

    :cond_12a
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getState()[I

    move-result-object p0

    invoke-virtual {v0, p0}, Ltx4;->onStateChange([I)Z

    :cond_131
    return-void
.end method
