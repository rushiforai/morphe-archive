.class public final Lmxe;
.super Llim;
.source "SourceFile"

# interfaces
.implements Lp5j;
.implements Lnwe;


# instance fields
.field public final a:Lqwe;

.field public final b:Lsvb;

.field public final c:Lcom/opera/android/settings/SettingsManager;

.field public d:Landroid/animation/ValueAnimator;

.field public e:Z

.field public f:Z


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Lqwe;Lcom/opera/android/settings/SettingsManager;Lpde;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lmxe;->a:Lqwe;

    new-instance p2, Lsvb;

    invoke-direct {p2, p1, p4}, Lsvb;-><init>(Lcom/opera/android/BrowserActivity;Lpde;)V

    iput-object p2, p0, Lmxe;->b:Lsvb;

    iput-object p3, p0, Lmxe;->c:Lcom/opera/android/settings/SettingsManager;

    return-void
.end method


# virtual methods
.method public final M(Ljava/lang/String;)V
    .registers 3

    const-string v0, "night_mode_dimming"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_21

    const-string v0, "night_mode_temperature"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_21

    const-string v0, "night_mode_overlay_keyboard"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_21

    const-string v0, "night_mode_switch_theme"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_21

    return-void

    :cond_21
    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lmxe;->R(Z)V

    return-void
.end method

.method public final R(Z)V
    .registers 8

    iget-object v0, p0, Lmxe;->d:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_a

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    const/4 v0, 0x0

    iput-object v0, p0, Lmxe;->d:Landroid/animation/ValueAnimator;

    :cond_a
    const-string v0, "night_mode_overlay_keyboard"

    iget-object v1, p0, Lmxe;->c:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v1, v0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    const/4 v2, 0x0

    if-eqz v0, :cond_1f

    const-string v0, "night_mode_switch_theme"

    invoke-virtual {v1, v0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1f

    const/4 v0, 0x1

    goto :goto_20

    :cond_1f
    move v0, v2

    :goto_20
    iput-boolean v0, p0, Lmxe;->f:Z

    iget-object v0, p0, Lmxe;->a:Lqwe;

    iget-object v0, v0, Lqwe;->a:Lbp;

    iget v0, v0, Lbp;->a:I

    sget-object v3, Lowe;->c:Lowe;

    iget-object v3, v3, Lowe;->a:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v3

    if-nez v3, :cond_34

    const/4 v1, -0x1

    goto :goto_6c

    :cond_34
    const-string v3, "night_mode_temperature"

    invoke-virtual {v1, v3}, Lcom/opera/android/settings/SettingsManager;->n(Ljava/lang/String;)I

    move-result v3

    int-to-float v3, v3

    const/high16 v4, 0x447a0000    # 1000.0f

    div-float/2addr v3, v4

    const-string v5, "night_mode_dimming"

    invoke-virtual {v1, v5}, Lcom/opera/android/settings/SettingsManager;->n(Ljava/lang/String;)I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v1, v4

    const/4 v4, 0x0

    cmpg-float v4, v1, v4

    if-lez v4, :cond_51

    const/high16 v2, 0x42e40000    # 114.0f

    mul-float/2addr v1, v2

    float-to-int v1, v1

    add-int/lit8 v2, v1, 0x3a

    :cond_51
    const/16 v1, 0xff

    rsub-int v2, v2, 0xff

    const/high16 v4, 0x3f000000    # 0.5f

    mul-float/2addr v4, v3

    const/high16 v5, 0x3f800000    # 1.0f

    sub-float v4, v5, v4

    sub-float/2addr v5, v3

    int-to-float v3, v2

    mul-float/2addr v4, v3

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v4

    mul-float/2addr v3, v5

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    invoke-static {v1, v2, v4, v3}, Landroid/graphics/Color;->argb(IIII)I

    move-result v1

    :goto_6c
    if-ne v1, v0, :cond_72

    invoke-virtual {p0}, Lmxe;->T()V

    return-void

    :cond_72
    if-eqz p1, :cond_95

    const/4 p1, 0x2

    new-array p1, p1, [F

    fill-array-data p1, :array_9a

    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object p1

    iput-object p1, p0, Lmxe;->d:Landroid/animation/ValueAnimator;

    const-wide/16 v2, 0x12c

    invoke-virtual {p1, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    iget-object p1, p0, Lmxe;->d:Landroid/animation/ValueAnimator;

    new-instance v2, Llxe;

    invoke-direct {v2, p0, v0, v1}, Llxe;-><init>(Lmxe;II)V

    invoke-virtual {p1, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    iget-object p0, p0, Lmxe;->d:Landroid/animation/ValueAnimator;

    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    return-void

    :cond_95
    invoke-virtual {p0, v1}, Lmxe;->S(I)V

    return-void

    nop

    :array_9a
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final S(I)V
    .registers 5

    iget-object v0, p0, Lmxe;->a:Lqwe;

    iget-object v1, v0, Lqwe;->a:Lbp;

    iget v1, v1, Lbp;->a:I

    if-eq p1, v1, :cond_28

    new-instance v1, Lbp;

    invoke-direct {v1, p1}, Lbp;-><init>(I)V

    iput-object v1, v0, Lqwe;->a:Lbp;

    iget-object p1, v0, Lqwe;->b:Li7f;

    new-instance v1, Lg7f;

    invoke-direct {v1, p1}, Lg7f;-><init>(Li7f;)V

    :goto_16
    invoke-virtual {v1}, Lg7f;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_28

    invoke-virtual {v1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lpwe;

    iget-object v2, v0, Lqwe;->a:Lbp;

    invoke-interface {p1, v2}, Lpwe;->a(Lbp;)V

    goto :goto_16

    :cond_28
    invoke-virtual {p0}, Lmxe;->T()V

    return-void
.end method

.method public final T()V
    .registers 8

    iget-object v0, p0, Lmxe;->b:Lsvb;

    if-eqz v0, :cond_72

    iget-boolean v1, p0, Lmxe;->f:Z

    if-eqz v1, :cond_9e

    iget-boolean v1, p0, Lmxe;->e:Z

    if-eqz v1, :cond_9e

    iget-object v1, p0, Lmxe;->a:Lqwe;

    iget-object v1, v1, Lqwe;->a:Lbp;

    iget-object v2, v1, Lbp;->b:Ljava/lang/Object;

    check-cast v2, Landroid/graphics/LightingColorFilter;

    if-eqz v2, :cond_9e

    iget v1, v1, Lbp;->a:I

    invoke-static {v1}, Lp37;->t(I)F

    move-result v1

    const/high16 v2, 0x437f0000    # 255.0f

    mul-float/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    rsub-int v1, v1, 0xff

    const/4 v3, 0x0

    invoke-static {v1, v3, v3, v3}, Landroid/graphics/Color;->argb(IIII)I

    move-result v1

    iget-object v4, v0, Lsvb;->b:Ljava/lang/Object;

    check-cast v4, Lcom/opera/android/BrowserActivity;

    invoke-static {v1}, Landroid/graphics/Color;->alpha(I)I

    move-result v5

    int-to-float v5, v5

    div-float/2addr v5, v2

    invoke-static {v1}, Landroid/graphics/Color;->red(I)I

    move-result v2

    invoke-static {v1}, Landroid/graphics/Color;->green(I)I

    move-result v6

    invoke-static {v1}, Landroid/graphics/Color;->blue(I)I

    move-result v1

    invoke-static {v2, v6, v1}, Landroid/graphics/Color;->rgb(III)I

    move-result v1

    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0x1f

    if-lt v2, v6, :cond_51

    const v2, 0x3f4ccccd    # 0.8f

    invoke-static {v2, v5}, Ljava/lang/Math;->min(FF)F

    move-result v5

    :cond_51
    iget-object v2, v0, Lsvb;->e:Ljava/lang/Object;

    check-cast v2, Ld21;

    if-eqz v2, :cond_73

    iget-object p0, v2, Ld21;->b:Ljava/lang/Object;

    check-cast p0, Landroid/graphics/Paint;

    invoke-virtual {p0}, Landroid/graphics/Paint;->getColor()I

    move-result v3

    if-eq v1, v3, :cond_67

    invoke-virtual {p0, v1}, Landroid/graphics/Paint;->setColor(I)V

    invoke-virtual {v2}, Landroid/view/View;->invalidate()V

    :cond_67
    iget p0, v0, Lsvb;->a:F

    cmpl-float p0, v5, p0

    if-eqz p0, :cond_72

    iput v5, v0, Lsvb;->a:F

    invoke-virtual {v0}, Lsvb;->a()V

    :cond_72
    return-void

    :cond_73
    invoke-static {v4}, Landroid/provider/Settings;->canDrawOverlays(Landroid/content/Context;)Z

    move-result v2

    if-nez v2, :cond_81

    iget-object p0, p0, Lmxe;->c:Lcom/opera/android/settings/SettingsManager;

    const-string v0, "night_mode_overlay_keyboard"

    invoke-virtual {p0, v3, v0}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    return-void

    :cond_81
    iput v5, v0, Lsvb;->a:F

    new-instance p0, Ld21;

    invoke-direct {p0, v4}, Ld21;-><init>(Lcom/opera/android/BrowserActivity;)V

    iput-object p0, v0, Lsvb;->e:Ljava/lang/Object;

    iget-object v2, p0, Ld21;->b:Ljava/lang/Object;

    check-cast v2, Landroid/graphics/Paint;

    invoke-virtual {v2}, Landroid/graphics/Paint;->getColor()I

    move-result v3

    if-eq v1, v3, :cond_9a

    invoke-virtual {v2, v1}, Landroid/graphics/Paint;->setColor(I)V

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    :cond_9a
    invoke-virtual {v0}, Lsvb;->a()V

    return-void

    :cond_9e
    iget-object p0, v0, Lsvb;->f:Ljava/lang/Object;

    check-cast p0, Landroid/view/WindowManager;

    const/4 v1, 0x0

    if-eqz p0, :cond_ae

    iget-object v2, v0, Lsvb;->e:Ljava/lang/Object;

    check-cast v2, Ld21;

    invoke-interface {p0, v2}, Landroid/view/ViewManager;->removeView(Landroid/view/View;)V

    iput-object v1, v0, Lsvb;->f:Ljava/lang/Object;

    :cond_ae
    iput-object v1, v0, Lsvb;->e:Ljava/lang/Object;

    return-void
.end method

.method public final W(Lndc;)V
    .registers 2

    iget-object p1, p0, Lmxe;->c:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p1, p0}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    sget-object p1, Lowe;->c:Lowe;

    invoke-virtual {p1, p0}, Lowe;->a(Lnwe;)V

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lmxe;->R(Z)V

    return-void
.end method

.method public final onDestroy(Lndc;)V
    .registers 2

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    iget-object p1, p0, Lmxe;->c:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p1, p0}, Lcom/opera/android/settings/SettingsManager;->T(Lp5j;)V

    sget-object p1, Lowe;->c:Lowe;

    invoke-virtual {p1, p0}, Lowe;->b(Lnwe;)V

    return-void
.end method

.method public final onPause(Lndc;)V
    .registers 2

    const/4 p1, 0x0

    iput-boolean p1, p0, Lmxe;->e:Z

    invoke-virtual {p0}, Lmxe;->T()V

    return-void
.end method

.method public final onResume(Lndc;)V
    .registers 2

    const/4 p1, 0x1

    iput-boolean p1, p0, Lmxe;->e:Z

    invoke-virtual {p0}, Lmxe;->T()V

    return-void
.end method

.method public final y(Z)V
    .registers 2

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lmxe;->R(Z)V

    return-void
.end method
