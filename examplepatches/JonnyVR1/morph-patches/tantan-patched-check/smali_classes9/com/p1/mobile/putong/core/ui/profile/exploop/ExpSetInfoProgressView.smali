.class public Lcom/p1/mobile/putong/core/ui/profile/exploop/ExpSetInfoProgressView;
.super Landroid/view/View;
.source "SourceFile"


# instance fields
.field public a:I

.field public b:I

.field public c:I

.field public d:Landroid/graphics/Paint;

.field public e:Landroid/graphics/RectF;

.field public f:Landroid/graphics/RectF;

.field public g:Landroid/animation/ValueAnimator;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/ExpSetInfoProgressView;->c()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 8
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/ExpSetInfoProgressView;->c()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 10
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/ExpSetInfoProgressView;->c()V

    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/putong/core/ui/profile/exploop/ExpSetInfoProgressView;)Landroid/graphics/RectF;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/ExpSetInfoProgressView;->f:Landroid/graphics/RectF;

    return-object p0
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/putong/core/ui/profile/exploop/ExpSetInfoProgressView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/ExpSetInfoProgressView;->b:I

    return p0
.end method


# virtual methods
.method public final c()V
    .locals 2

    .line 1
    new-instance v0, Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/ExpSetInfoProgressView;->d:Landroid/graphics/Paint;

    .line 7
    .line 8
    const/high16 v1, -0x10000

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 11
    .line 12
    .line 13
    const/high16 v0, 0x40c00000    # 6.0f

    .line 14
    .line 15
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/ExpSetInfoProgressView;->b:I

    .line 20
    .line 21
    new-instance v0, Landroid/graphics/RectF;

    .line 22
    .line 23
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/ExpSetInfoProgressView;->e:Landroid/graphics/RectF;

    .line 27
    .line 28
    new-instance v0, Landroid/graphics/RectF;

    .line 29
    .line 30
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/ExpSetInfoProgressView;->f:Landroid/graphics/RectF;

    .line 34
    .line 35
    const/high16 v0, 0x40e00000    # 7.0f

    .line 36
    .line 37
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/ExpSetInfoProgressView;->c:I

    .line 42
    .line 43
    return-void
.end method

.method public d(II)V
    .locals 2

    .line 1
    if-gt p1, p2, :cond_2

    .line 2
    .line 3
    if-ltz p1, :cond_2

    .line 4
    .line 5
    if-gtz p2, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/ExpSetInfoProgressView;->g:Landroid/animation/ValueAnimator;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/ExpSetInfoProgressView;->g:Landroid/animation/ValueAnimator;

    .line 19
    .line 20
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 21
    .line 22
    .line 23
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/ExpSetInfoProgressView;->f:Landroid/graphics/RectF;

    .line 24
    .line 25
    iget v0, v0, Landroid/graphics/RectF;->right:F

    .line 26
    .line 27
    float-to-int v0, v0

    .line 28
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/ExpSetInfoProgressView;->a:I

    .line 29
    .line 30
    div-int/2addr v1, p2

    .line 31
    mul-int/2addr v1, p1

    .line 32
    filled-new-array {v0, v1}, [I

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    const-wide/16 v0, 0x12c

    .line 41
    .line 42
    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/ExpSetInfoProgressView;->g:Landroid/animation/ValueAnimator;

    .line 47
    .line 48
    new-instance p2, Lcom/p1/mobile/putong/core/ui/profile/exploop/ExpSetInfoProgressView$a;

    .line 49
    .line 50
    invoke-direct {p2, p0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/ExpSetInfoProgressView$a;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exploop/ExpSetInfoProgressView;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 54
    .line 55
    .line 56
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/ExpSetInfoProgressView;->g:Landroid/animation/ValueAnimator;

    .line 57
    .line 58
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 59
    .line 60
    .line 61
    :cond_2
    :goto_0
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 4

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/ExpSetInfoProgressView;->a:I

    .line 5
    .line 6
    if-lez v0, :cond_0

    .line 7
    .line 8
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/ExpSetInfoProgressView;->b:I

    .line 9
    .line 10
    if-lez v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/ExpSetInfoProgressView;->d:Landroid/graphics/Paint;

    .line 13
    .line 14
    const v1, -0x80809

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/ExpSetInfoProgressView;->e:Landroid/graphics/RectF;

    .line 21
    .line 22
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/ExpSetInfoProgressView;->c:I

    .line 23
    .line 24
    int-to-float v2, v1

    .line 25
    int-to-float v1, v1

    .line 26
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/ExpSetInfoProgressView;->d:Landroid/graphics/Paint;

    .line 27
    .line 28
    invoke-virtual {p1, v0, v2, v1, v3}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/ExpSetInfoProgressView;->d:Landroid/graphics/Paint;

    .line 32
    .line 33
    const v1, -0x181e3

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/ExpSetInfoProgressView;->f:Landroid/graphics/RectF;

    .line 40
    .line 41
    iget v1, v0, Landroid/graphics/RectF;->right:F

    .line 42
    .line 43
    const/4 v2, 0x0

    .line 44
    cmpl-float v1, v1, v2

    .line 45
    .line 46
    if-lez v1, :cond_0

    .line 47
    .line 48
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/ExpSetInfoProgressView;->c:I

    .line 49
    .line 50
    int-to-float v2, v1

    .line 51
    int-to-float v1, v1

    .line 52
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/ExpSetInfoProgressView;->d:Landroid/graphics/Paint;

    .line 53
    .line 54
    invoke-virtual {p1, v0, v2, v1, p0}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 55
    .line 56
    .line 57
    :cond_0
    return-void
.end method

.method public onMeasure(II)V
    .locals 2

    .line 1
    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/ExpSetInfoProgressView;->a:I

    .line 9
    .line 10
    iget p2, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/ExpSetInfoProgressView;->b:I

    .line 11
    .line 12
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/ExpSetInfoProgressView;->e:Landroid/graphics/RectF;

    .line 16
    .line 17
    iget p2, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/ExpSetInfoProgressView;->a:I

    .line 18
    .line 19
    int-to-float p2, p2

    .line 20
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/ExpSetInfoProgressView;->b:I

    .line 21
    .line 22
    int-to-float v0, v0

    .line 23
    const/4 v1, 0x0

    .line 24
    invoke-virtual {p1, v1, v1, p2, v0}, Landroid/graphics/RectF;->set(FFFF)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/ExpSetInfoProgressView;->d:Landroid/graphics/Paint;

    .line 28
    .line 29
    const/4 p1, 0x1

    .line 30
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 31
    .line 32
    .line 33
    return-void
.end method
