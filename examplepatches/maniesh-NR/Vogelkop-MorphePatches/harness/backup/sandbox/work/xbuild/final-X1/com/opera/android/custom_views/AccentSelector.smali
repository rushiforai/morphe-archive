.class public Lcom/opera/android/custom_views/AccentSelector;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Landroid/widget/Checkable;


# static fields
.field public static final synthetic n:I


# instance fields
.field public a:Lxj;

.field public b:Z

.field public final c:Landroid/graphics/Paint;

.field public final d:Landroid/graphics/Paint;

.field public final e:Landroid/graphics/Paint;

.field public final f:Landroid/graphics/Paint;

.field public final g:Landroid/graphics/Path;

.field public final h:Landroid/graphics/Path;

.field public final i:Landroid/graphics/Path;

.field public final j:Landroid/graphics/Path;

.field public final k:F

.field public final l:I

.field public final m:Lsll;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 10
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    sget-object v1, Lkhh;->a:[I

    invoke-virtual {p1, p2, v1, v0, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p2

    const v1, 0x7f0600a8

    :try_start_d
    invoke-virtual {p1, v1}, Landroid/content/Context;->getColor(I)I

    move-result v1

    invoke-virtual {p2, v0, v1}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v1
    :try_end_15
    .catchall {:try_start_d .. :try_end_15} :catchall_f9

    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    const/4 p2, 0x1

    invoke-virtual {p0, p2}, Landroid/view/View;->setClickable(Z)V

    invoke-virtual {p0, p2}, Landroid/view/View;->setFocusable(Z)V

    new-instance v2, Landroid/graphics/Paint;

    invoke-direct {v2}, Landroid/graphics/Paint;-><init>()V

    iput-object v2, p0, Lcom/opera/android/custom_views/AccentSelector;->c:Landroid/graphics/Paint;

    invoke-virtual {v2, p2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    new-instance v2, Landroid/graphics/Paint;

    invoke-direct {v2}, Landroid/graphics/Paint;-><init>()V

    iput-object v2, p0, Lcom/opera/android/custom_views/AccentSelector;->d:Landroid/graphics/Paint;

    invoke-virtual {v2, p2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    new-instance v2, Landroid/graphics/Paint;

    invoke-direct {v2}, Landroid/graphics/Paint;-><init>()V

    iput-object v2, p0, Lcom/opera/android/custom_views/AccentSelector;->e:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    invoke-virtual {v2, p2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-static {v4, v5}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {v2, v4}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    invoke-virtual {v2, v1}, Landroid/graphics/Paint;->setColor(I)V

    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    iput-object v1, p0, Lcom/opera/android/custom_views/AccentSelector;->f:Landroid/graphics/Paint;

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    invoke-virtual {v1, p2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    const/high16 p2, 0x40000000    # 2.0f

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-static {p2, v4}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result p2

    int-to-float p2, p2

    invoke-virtual {v1, p2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    const/high16 p2, 0x41400000    # 12.0f

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-static {p2, v4}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result p2

    int-to-float p2, p2

    iput p2, p0, Lcom/opera/android/custom_views/AccentSelector;->k:F

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f0709da

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v4

    iput v4, p0, Lcom/opera/android/custom_views/AccentSelector;->l:I

    int-to-float v5, v4

    sub-float p2, v5, p2

    invoke-static {p2}, Li41;->H(F)Landroid/graphics/Path;

    move-result-object v6

    iput-object v6, p0, Lcom/opera/android/custom_views/AccentSelector;->h:Landroid/graphics/Path;

    invoke-virtual {v2}, Landroid/graphics/Paint;->getStrokeWidth()F

    move-result v2

    sub-float v2, p2, v2

    invoke-static {v2}, Li41;->H(F)Landroid/graphics/Path;

    move-result-object v2

    iput-object v2, p0, Lcom/opera/android/custom_views/AccentSelector;->i:Landroid/graphics/Path;

    invoke-virtual {v1}, Landroid/graphics/Paint;->getStrokeWidth()F

    move-result v1

    sub-float v1, v5, v1

    invoke-static {v1}, Li41;->H(F)Landroid/graphics/Path;

    move-result-object v1

    iput-object v1, p0, Lcom/opera/android/custom_views/AccentSelector;->j:Landroid/graphics/Path;

    float-to-double v1, p2

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object p2

    const-string v1, "M0,@L@,@L@,0L0,@"

    const-string v2, "@"

    invoke-static {v1, v2, p2}, Lkotlin/text/c;->o(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Loup;->S(Ljava/lang/String;)Landroid/graphics/Path;

    move-result-object p2

    iput-object p2, p0, Lcom/opera/android/custom_views/AccentSelector;->g:Landroid/graphics/Path;

    new-instance p2, Landroid/graphics/drawable/ShapeDrawable;

    new-instance v1, Landroid/graphics/drawable/shapes/PathShape;

    invoke-static {v5}, Li41;->H(F)Landroid/graphics/Path;

    move-result-object v2

    invoke-direct {v1, v2, v5, v5}, Landroid/graphics/drawable/shapes/PathShape;-><init>(Landroid/graphics/Path;FF)V

    invoke-direct {p2, v1}, Landroid/graphics/drawable/ShapeDrawable;-><init>(Landroid/graphics/drawable/shapes/Shape;)V

    invoke-virtual {p2, v4}, Landroid/graphics/drawable/ShapeDrawable;->setIntrinsicWidth(I)V

    invoke-virtual {p2, v4}, Landroid/graphics/drawable/ShapeDrawable;->setIntrinsicHeight(I)V

    new-instance v1, Lsll;

    const/4 v2, 0x0

    invoke-direct {v1, p1, v2, p2}, Lsll;-><init>(Landroid/content/Context;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/ShapeDrawable;)V

    iput-object v1, p0, Lcom/opera/android/custom_views/AccentSelector;->m:Lsll;

    new-instance p2, Lvf9;

    const v2, 0x7f0404b7

    invoke-direct {p2, p1, v1, v3, v2}, Ltf9;-><init>(Landroid/content/Context;Lsll;Landroid/graphics/Paint$Style;I)V

    invoke-virtual {p0, p2}, Landroid/view/View;->setForeground(Landroid/graphics/drawable/Drawable;)V

    new-instance p1, Lu7;

    invoke-direct {p1, p0, v0}, Lu7;-><init>(Ljava/lang/Object;B)V

    sget-object p2, Lq9n;->c:Ll5b;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Lhjf;->v(Landroid/content/Context;)Ldll;

    move-result-object p2

    if-nez p2, :cond_f5

    return-void

    :cond_f5
    invoke-static {p2, p0, p1}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    return-void

    :catchall_f9
    move-exception p0

    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    throw p0
.end method


# virtual methods
.method public final a(Landroid/graphics/Canvas;Z)V
    .registers 6

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    iget v0, p0, Lcom/opera/android/custom_views/AccentSelector;->k:F

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    invoke-virtual {p1, v0, v0}, Landroid/graphics/Canvas;->translate(FF)V

    iget-object v0, p0, Lcom/opera/android/custom_views/AccentSelector;->c:Landroid/graphics/Paint;

    iget-object v2, p0, Lcom/opera/android/custom_views/AccentSelector;->h:Landroid/graphics/Path;

    invoke-virtual {p1, v2, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    iget-object v0, p0, Lcom/opera/android/custom_views/AccentSelector;->g:Landroid/graphics/Path;

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;)Z

    iget-object v0, p0, Lcom/opera/android/custom_views/AccentSelector;->d:Landroid/graphics/Paint;

    invoke-virtual {p1, v2, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    if-eqz p2, :cond_39

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    iget-object p2, p0, Lcom/opera/android/custom_views/AccentSelector;->e:Landroid/graphics/Paint;

    invoke-virtual {p2}, Landroid/graphics/Paint;->getStrokeWidth()F

    move-result v0

    div-float/2addr v0, v1

    invoke-virtual {p1, v0, v0}, Landroid/graphics/Canvas;->translate(FF)V

    iget-object p0, p0, Lcom/opera/android/custom_views/AccentSelector;->i:Landroid/graphics/Path;

    invoke-virtual {p1, p0, p2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    :cond_39
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    return-void
.end method

.method public final isChecked()Z
    .registers 1

    iget-boolean p0, p0, Lcom/opera/android/custom_views/AccentSelector;->b:Z

    return p0
.end method

.method public final onDraw(Landroid/graphics/Canvas;)V
    .registers 5

    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    iget-boolean v0, p0, Lcom/opera/android/custom_views/AccentSelector;->b:Z

    if-eqz v0, :cond_23

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/opera/android/custom_views/AccentSelector;->a(Landroid/graphics/Canvas;Z)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    iget-object v0, p0, Lcom/opera/android/custom_views/AccentSelector;->f:Landroid/graphics/Paint;

    invoke-virtual {v0}, Landroid/graphics/Paint;->getStrokeWidth()F

    move-result v1

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v1, v2

    invoke-virtual {p1, v1, v1}, Landroid/graphics/Canvas;->translate(FF)V

    iget-object p0, p0, Lcom/opera/android/custom_views/AccentSelector;->j:Landroid/graphics/Path;

    invoke-virtual {p1, p0, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    return-void

    :cond_23
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/opera/android/custom_views/AccentSelector;->a(Landroid/graphics/Canvas;Z)V

    return-void
.end method

.method public final onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V
    .registers 2

    invoke-super {p0, p1}, Landroid/view/View;->onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V

    iget-boolean p0, p0, Lcom/opera/android/custom_views/AccentSelector;->b:Z

    invoke-virtual {p1, p0}, Landroid/view/accessibility/AccessibilityRecord;->setChecked(Z)V

    return-void
.end method

.method public final onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .registers 2

    invoke-super {p0, p1}, Landroid/view/View;->onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    iget-boolean p0, p0, Lcom/opera/android/custom_views/AccentSelector;->b:Z

    invoke-static {p1, p0}, Lf03;->g0(Landroid/view/accessibility/AccessibilityNodeInfo;Z)V

    return-void
.end method

.method public final onMeasure(II)V
    .registers 3

    iget p1, p0, Lcom/opera/android/custom_views/AccentSelector;->l:I

    const/high16 p2, 0x40000000    # 2.0f

    invoke-static {p1, p2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p1

    invoke-virtual {p0, p1, p1}, Landroid/view/View;->setMeasuredDimension(II)V

    return-void
.end method

.method public final performClick()Z
    .registers 3

    invoke-virtual {p0}, Lcom/opera/android/custom_views/AccentSelector;->toggle()V

    invoke-super {p0}, Landroid/view/View;->performClick()Z

    move-result v0

    if-nez v0, :cond_d

    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Landroid/view/View;->playSoundEffect(I)V

    :cond_d
    return v0
.end method

.method public final setChecked(Z)V
    .registers 3

    iget-boolean v0, p0, Lcom/opera/android/custom_views/AccentSelector;->b:Z

    if-eq v0, p1, :cond_28

    iput-boolean p1, p0, Lcom/opera/android/custom_views/AccentSelector;->b:Z

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    iget-object p0, p0, Lcom/opera/android/custom_views/AccentSelector;->a:Lxj;

    if-eqz p0, :cond_28

    iget-object p1, p0, Lxj;->b:Ljava/lang/Object;

    check-cast p1, Ldt1;

    iget-object p0, p0, Lxj;->c:Ljava/lang/Object;

    check-cast p0, Lg7j;

    const/4 v0, 0x1

    invoke-virtual {p1, p0, v0}, Ldt1;->M(Lg7j;Z)V

    iget-object p1, p1, Ldt1;->b:Ljava/lang/Object;

    check-cast p1, Lmu1;

    iget-object p1, p1, Lmu1;->b:Lpu1;

    invoke-virtual {p1}, Lpu1;->I0()Ldv1;

    move-result-object p1

    iget-object p1, p1, Lj93;->b:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p1, p0, v0}, Lcom/opera/android/settings/SettingsManager;->U(Lg7j;Z)V

    :cond_28
    return-void
.end method

.method public final toggle()V
    .registers 2

    iget-boolean v0, p0, Lcom/opera/android/custom_views/AccentSelector;->b:Z

    if-nez v0, :cond_8

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/opera/android/custom_views/AccentSelector;->setChecked(Z)V

    :cond_8
    return-void
.end method
