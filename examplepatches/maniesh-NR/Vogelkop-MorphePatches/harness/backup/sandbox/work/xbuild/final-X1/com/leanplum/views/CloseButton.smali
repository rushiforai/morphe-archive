.class public Lcom/leanplum/views/CloseButton;
.super Landroid/view/View;
.source "SourceFile"


# instance fields
.field private circlePaint:Landroid/graphics/Paint;

.field private circlePressedPaint:Landroid/graphics/Paint;

.field private isPressed:Z

.field private linePaint:Landroid/graphics/Paint;

.field private size:F

.field private x1:F

.field private x2:F

.field private y1:F

.field private y2:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/leanplum/views/CloseButton;->circlePaint:Landroid/graphics/Paint;

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/leanplum/views/CloseButton;->circlePressedPaint:Landroid/graphics/Paint;

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/leanplum/views/CloseButton;->linePaint:Landroid/graphics/Paint;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/leanplum/views/CloseButton;->isPressed:Z

    invoke-static {p1}, Lcom/leanplum/utils/SizeUtil;->init(Landroid/content/Context;)V

    invoke-direct {p0}, Lcom/leanplum/views/CloseButton;->initLabelView()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3

    .line 34
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 35
    new-instance p2, Landroid/graphics/Paint;

    invoke-direct {p2}, Landroid/graphics/Paint;-><init>()V

    iput-object p2, p0, Lcom/leanplum/views/CloseButton;->circlePaint:Landroid/graphics/Paint;

    .line 36
    new-instance p2, Landroid/graphics/Paint;

    invoke-direct {p2}, Landroid/graphics/Paint;-><init>()V

    iput-object p2, p0, Lcom/leanplum/views/CloseButton;->circlePressedPaint:Landroid/graphics/Paint;

    .line 37
    new-instance p2, Landroid/graphics/Paint;

    invoke-direct {p2}, Landroid/graphics/Paint;-><init>()V

    iput-object p2, p0, Lcom/leanplum/views/CloseButton;->linePaint:Landroid/graphics/Paint;

    const/4 p2, 0x0

    .line 38
    iput-boolean p2, p0, Lcom/leanplum/views/CloseButton;->isPressed:Z

    .line 39
    invoke-static {p1}, Lcom/leanplum/utils/SizeUtil;->init(Landroid/content/Context;)V

    .line 40
    invoke-direct {p0}, Lcom/leanplum/views/CloseButton;->initLabelView()V

    return-void
.end method

.method private initLabelView()V
    .registers 6

    iget-object v0, p0, Lcom/leanplum/views/CloseButton;->circlePaint:Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    iget-object v0, p0, Lcom/leanplum/views/CloseButton;->circlePaint:Landroid/graphics/Paint;

    const v2, -0x222223

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v0, p0, Lcom/leanplum/views/CloseButton;->circlePaint:Landroid/graphics/Paint;

    const/high16 v2, 0x40000000    # 2.0f

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v0, p0, Lcom/leanplum/views/CloseButton;->circlePaint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->FILL_AND_STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v0, p0, Lcom/leanplum/views/CloseButton;->circlePressedPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    iget-object v0, p0, Lcom/leanplum/views/CloseButton;->circlePressedPaint:Landroid/graphics/Paint;

    const v4, -0x666667

    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v0, p0, Lcom/leanplum/views/CloseButton;->circlePressedPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v0, p0, Lcom/leanplum/views/CloseButton;->circlePressedPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v0, p0, Lcom/leanplum/views/CloseButton;->linePaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    iget-object v0, p0, Lcom/leanplum/views/CloseButton;->linePaint:Landroid/graphics/Paint;

    const/high16 v1, -0x1000000

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v0, p0, Lcom/leanplum/views/CloseButton;->linePaint:Landroid/graphics/Paint;

    const/high16 v1, 0x40400000    # 3.0f

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v0, p0, Lcom/leanplum/views/CloseButton;->linePaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    sget v0, Lcom/leanplum/utils/SizeUtil;->dp30:I

    int-to-float v0, v0

    iput v0, p0, Lcom/leanplum/views/CloseButton;->size:F

    const v1, 0x3eaaaaab

    mul-float v2, v0, v1

    iput v2, p0, Lcom/leanplum/views/CloseButton;->x1:F

    const v2, 0x3f2aaaab

    mul-float v3, v0, v2

    iput v3, p0, Lcom/leanplum/views/CloseButton;->x2:F

    mul-float/2addr v1, v0

    iput v1, p0, Lcom/leanplum/views/CloseButton;->y1:F

    mul-float/2addr v0, v2

    iput v0, p0, Lcom/leanplum/views/CloseButton;->y2:F

    return-void
.end method


# virtual methods
.method public onDraw(Landroid/graphics/Canvas;)V
    .registers 13

    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    iget-boolean v0, p0, Lcom/leanplum/views/CloseButton;->isPressed:Z

    if-eqz v0, :cond_a

    iget-object v0, p0, Lcom/leanplum/views/CloseButton;->circlePressedPaint:Landroid/graphics/Paint;

    goto :goto_c

    :cond_a
    iget-object v0, p0, Lcom/leanplum/views/CloseButton;->circlePaint:Landroid/graphics/Paint;

    :goto_c
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v1

    int-to-float v1, v1

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v1, v2

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v3

    int-to-float v3, v3

    div-float/2addr v3, v2

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v4

    int-to-float v4, v4

    div-float/2addr v4, v2

    const/high16 v2, 0x3f800000    # 1.0f

    sub-float/2addr v4, v2

    invoke-virtual {p1, v1, v3, v4, v0}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    iget v6, p0, Lcom/leanplum/views/CloseButton;->x1:F

    iget v7, p0, Lcom/leanplum/views/CloseButton;->y1:F

    iget v8, p0, Lcom/leanplum/views/CloseButton;->x2:F

    iget v9, p0, Lcom/leanplum/views/CloseButton;->y2:F

    iget-object v10, p0, Lcom/leanplum/views/CloseButton;->linePaint:Landroid/graphics/Paint;

    move-object v5, p1

    invoke-virtual/range {v5 .. v10}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object v0, v5

    iget v1, p0, Lcom/leanplum/views/CloseButton;->x2:F

    iget v2, p0, Lcom/leanplum/views/CloseButton;->y1:F

    iget v3, p0, Lcom/leanplum/views/CloseButton;->x1:F

    iget v4, p0, Lcom/leanplum/views/CloseButton;->y2:F

    iget-object v5, p0, Lcom/leanplum/views/CloseButton;->linePaint:Landroid/graphics/Paint;

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    return-void
.end method

.method public onMeasure(II)V
    .registers 3

    invoke-super {p0, p1, p1}, Landroid/view/View;->onMeasure(II)V

    iget p1, p0, Lcom/leanplum/views/CloseButton;->size:F

    float-to-int p2, p1

    float-to-int p1, p1

    invoke-virtual {p0, p2, p1}, Landroid/view/View;->setMeasuredDimension(II)V

    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 4

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_d

    iput-boolean v1, p0, Lcom/leanplum/views/CloseButton;->isPressed:Z

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return v1

    :cond_d
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    if-ne v0, v1, :cond_1d

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/leanplum/views/CloseButton;->isPressed:Z

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    invoke-virtual {p0}, Lcom/leanplum/views/CloseButton;->performClick()Z

    return v1

    :cond_1d
    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method

.method public performClick()Z
    .registers 1

    invoke-super {p0}, Landroid/view/View;->performClick()Z

    move-result p0

    return p0
.end method
