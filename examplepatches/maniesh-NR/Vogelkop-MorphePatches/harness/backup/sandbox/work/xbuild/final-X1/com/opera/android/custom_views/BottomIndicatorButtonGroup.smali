.class public Lcom/opera/android/custom_views/BottomIndicatorButtonGroup;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# static fields
.field public static final i:Landroid/view/animation/PathInterpolator;


# instance fields
.field public final a:Lz22;

.field public final b:Landroid/graphics/Paint;

.field public c:Lcom/opera/android/custom_views/BottomIndicatorButton;

.field public d:Landroid/animation/ValueAnimator;

.field public e:F

.field public f:F

.field public g:F

.field public h:F


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Landroid/view/animation/PathInterpolator;

    const/4 v1, 0x0

    const v2, 0x3e4ccccd    # 0.2f

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-direct {v0, v1, v1, v2, v3}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    sput-object v0, Lcom/opera/android/custom_views/BottomIndicatorButtonGroup;->i:Landroid/view/animation/PathInterpolator;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 5
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    new-instance p1, Lz22;

    const/4 p2, 0x2

    invoke-direct {p1, p0, p2}, Lz22;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lcom/opera/android/custom_views/BottomIndicatorButtonGroup;->a:Lz22;

    new-instance p1, Landroid/graphics/Paint;

    const/4 p2, 0x1

    invoke-direct {p1, p2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Lcom/opera/android/custom_views/BottomIndicatorButtonGroup;->b:Landroid/graphics/Paint;

    invoke-virtual {p0, v0}, Landroid/view/View;->setWillNotDraw(Z)V

    const/high16 v0, 0x40000000    # 2.0f

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-static {v0, v1}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v0

    shl-int/2addr v0, p2

    int-to-float p2, v0

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    sget-object p2, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    sget-object p2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    new-instance p1, Lu7;

    const/16 p2, 0x13

    invoke-direct {p1, p0, p2}, Lu7;-><init>(Ljava/lang/Object;B)V

    invoke-static {p0}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object p2

    if-eqz p2, :cond_40

    invoke-static {p2, p0, p1}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_40
    invoke-virtual {p1, p0}, Lu7;->a(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final a(Lcom/opera/android/custom_views/BottomIndicatorButton;)V
    .registers 4

    invoke-virtual {p1}, Landroid/view/View;->isSelected()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    iget-object v0, p0, Lcom/opera/android/custom_views/BottomIndicatorButtonGroup;->c:Lcom/opera/android/custom_views/BottomIndicatorButton;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/opera/android/custom_views/BottomIndicatorButton;->setSelected(Z)V

    iget-object v0, p0, Lcom/opera/android/custom_views/BottomIndicatorButtonGroup;->c:Lcom/opera/android/custom_views/BottomIndicatorButton;

    iget-object v1, p0, Lcom/opera/android/custom_views/BottomIndicatorButtonGroup;->a:Lz22;

    invoke-virtual {v0, v1}, Landroid/view/View;->removeOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    iput-object p1, p0, Lcom/opera/android/custom_views/BottomIndicatorButtonGroup;->c:Lcom/opera/android/custom_views/BottomIndicatorButton;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/opera/android/custom_views/BottomIndicatorButton;->setSelected(Z)V

    iget-object p1, p0, Lcom/opera/android/custom_views/BottomIndicatorButtonGroup;->c:Lcom/opera/android/custom_views/BottomIndicatorButton;

    invoke-virtual {p1, v1}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    invoke-virtual {p0}, Lcom/opera/android/custom_views/BottomIndicatorButtonGroup;->b()V

    return-void
.end method

.method public final b()V
    .registers 11

    iget-object v0, p0, Lcom/opera/android/custom_views/BottomIndicatorButtonGroup;->c:Lcom/opera/android/custom_views/BottomIndicatorButton;

    invoke-virtual {v0}, Lcom/opera/android/custom_views/BottomIndicatorButton;->a()Z

    move-result v1

    const v2, 0x7f0a069d

    const v3, 0x7f0a0aad

    if-eqz v1, :cond_10

    move v1, v3

    goto :goto_11

    :cond_10
    move v1, v2

    :goto_11
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    move-result v0

    int-to-float v0, v0

    iget-object v1, p0, Lcom/opera/android/custom_views/BottomIndicatorButtonGroup;->c:Lcom/opera/android/custom_views/BottomIndicatorButton;

    invoke-virtual {v1}, Landroid/view/View;->getX()F

    move-result v4

    invoke-virtual {v1}, Lcom/opera/android/custom_views/BottomIndicatorButton;->a()Z

    move-result v5

    if-eqz v5, :cond_27

    move v2, v3

    :cond_27
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getX()F

    move-result v1

    add-float/2addr v1, v4

    iget-object v2, p0, Lcom/opera/android/custom_views/BottomIndicatorButtonGroup;->d:Landroid/animation/ValueAnimator;

    if-nez v2, :cond_41

    iget v3, p0, Lcom/opera/android/custom_views/BottomIndicatorButtonGroup;->h:F

    cmpl-float v3, v3, v0

    if-nez v3, :cond_4e

    iget v3, p0, Lcom/opera/android/custom_views/BottomIndicatorButtonGroup;->g:F

    cmpl-float v3, v3, v1

    if-eqz v3, :cond_4d

    goto :goto_4e

    :cond_41
    iget v3, p0, Lcom/opera/android/custom_views/BottomIndicatorButtonGroup;->e:F

    cmpl-float v3, v3, v1

    if-nez v3, :cond_4e

    iget v3, p0, Lcom/opera/android/custom_views/BottomIndicatorButtonGroup;->f:F

    cmpl-float v3, v3, v0

    if-nez v3, :cond_4e

    :cond_4d
    return-void

    :cond_4e
    :goto_4e
    if-eqz v2, :cond_53

    invoke-virtual {v2}, Landroid/animation/ValueAnimator;->cancel()V

    :cond_53
    iget v2, p0, Lcom/opera/android/custom_views/BottomIndicatorButtonGroup;->g:F

    cmpl-float v3, v1, v2

    const/4 v4, 0x1

    if-lez v3, :cond_5c

    move v3, v4

    goto :goto_5d

    :cond_5c
    const/4 v3, -0x1

    :goto_5d
    int-to-float v3, v3

    sub-float v5, v1, v2

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v5

    mul-float/2addr v5, v3

    iget v3, p0, Lcom/opera/android/custom_views/BottomIndicatorButtonGroup;->h:F

    const/4 v6, 0x2

    new-array v6, v6, [F

    const/4 v7, 0x0

    aput v3, v6, v7

    aput v0, v6, v4

    invoke-static {v6}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v3

    const-wide/16 v8, 0x12c

    invoke-virtual {v3, v8, v9}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    move-result-object v3

    iput-object v3, p0, Lcom/opera/android/custom_views/BottomIndicatorButtonGroup;->d:Landroid/animation/ValueAnimator;

    iput v0, p0, Lcom/opera/android/custom_views/BottomIndicatorButtonGroup;->f:F

    iput v1, p0, Lcom/opera/android/custom_views/BottomIndicatorButtonGroup;->e:F

    sget-object v0, Lcom/opera/android/custom_views/BottomIndicatorButtonGroup;->i:Landroid/view/animation/PathInterpolator;

    invoke-virtual {v3, v0}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    iget-object v0, p0, Lcom/opera/android/custom_views/BottomIndicatorButtonGroup;->d:Landroid/animation/ValueAnimator;

    new-instance v1, Lup3;

    invoke-direct {v1, p0, v2, v5, v7}, Lup3;-><init>(Ljava/lang/Object;FFB)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    iget-object v0, p0, Lcom/opera/android/custom_views/BottomIndicatorButtonGroup;->d:Landroid/animation/ValueAnimator;

    new-instance v1, Lkc;

    invoke-direct {v1, p0, v4}, Lkc;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    iget-object p0, p0, Lcom/opera/android/custom_views/BottomIndicatorButtonGroup;->d:Landroid/animation/ValueAnimator;

    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    return-void
.end method

.method public final onDraw(Landroid/graphics/Canvas;)V
    .registers 8

    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->onDraw(Landroid/graphics/Canvas;)V

    iget v1, p0, Lcom/opera/android/custom_views/BottomIndicatorButtonGroup;->g:F

    iget-object v0, p0, Lcom/opera/android/custom_views/BottomIndicatorButtonGroup;->c:Lcom/opera/android/custom_views/BottomIndicatorButton;

    invoke-virtual {v0}, Landroid/view/View;->getBottom()I

    move-result v0

    int-to-float v2, v0

    iget v0, p0, Lcom/opera/android/custom_views/BottomIndicatorButtonGroup;->h:F

    add-float v3, v1, v0

    iget-object v5, p0, Lcom/opera/android/custom_views/BottomIndicatorButtonGroup;->b:Landroid/graphics/Paint;

    move v4, v2

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    return-void
.end method

.method public final onFinishInflate()V
    .registers 2

    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/opera/android/custom_views/BottomIndicatorButton;

    iput-object v0, p0, Lcom/opera/android/custom_views/BottomIndicatorButtonGroup;->c:Lcom/opera/android/custom_views/BottomIndicatorButton;

    invoke-virtual {p0, v0}, Lcom/opera/android/custom_views/BottomIndicatorButtonGroup;->a(Lcom/opera/android/custom_views/BottomIndicatorButton;)V

    return-void
.end method
