.class public Lcom/p1/mobile/putong/core/newui/view/DataIntegrityProgressView;
.super Landroid/view/View;
.source "SourceFile"


# instance fields
.field public a:Landroid/graphics/Paint;

.field public b:I

.field public c:Landroid/graphics/RectF;

.field public d:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/view/DataIntegrityProgressView;->b:I

    .line 6
    .line 7
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/view/DataIntegrityProgressView;->d:I

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/view/DataIntegrityProgressView;->a()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 13
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 14
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/view/DataIntegrityProgressView;->b:I

    .line 15
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/view/DataIntegrityProgressView;->d:I

    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/view/DataIntegrityProgressView;->a()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 17
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 18
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/view/DataIntegrityProgressView;->b:I

    .line 19
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/view/DataIntegrityProgressView;->d:I

    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/view/DataIntegrityProgressView;->a()V

    return-void
.end method


# virtual methods
.method public final a()V
    .locals 2

    .line 1
    sget v0, Ll/qa00;->d:I

    .line 2
    .line 3
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/view/DataIntegrityProgressView;->b:I

    .line 4
    .line 5
    new-instance v0, Landroid/graphics/Paint;

    .line 6
    .line 7
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/view/DataIntegrityProgressView;->a:Landroid/graphics/Paint;

    .line 11
    .line 12
    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/view/DataIntegrityProgressView;->a:Landroid/graphics/Paint;

    .line 18
    .line 19
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/view/DataIntegrityProgressView;->b:I

    .line 20
    .line 21
    int-to-float v1, v1

    .line 22
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 23
    .line 24
    .line 25
    new-instance v0, Landroid/graphics/RectF;

    .line 26
    .line 27
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/view/DataIntegrityProgressView;->c:Landroid/graphics/RectF;

    .line 31
    .line 32
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 8

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/view/DataIntegrityProgressView;->a:Landroid/graphics/Paint;

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    sget v4, Ll/c9c0;->G:I

    .line 19
    .line 20
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 25
    .line 26
    .line 27
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/view/DataIntegrityProgressView;->c:Landroid/graphics/RectF;

    .line 28
    .line 29
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/view/DataIntegrityProgressView;->b:I

    .line 30
    .line 31
    int-to-float v4, v3

    .line 32
    const/high16 v5, 0x40000000    # 2.0f

    .line 33
    .line 34
    div-float/2addr v4, v5

    .line 35
    int-to-float v6, v3

    .line 36
    div-float/2addr v6, v5

    .line 37
    int-to-float v0, v0

    .line 38
    int-to-float v7, v3

    .line 39
    div-float/2addr v7, v5

    .line 40
    sub-float v7, v0, v7

    .line 41
    .line 42
    int-to-float v1, v1

    .line 43
    int-to-float v3, v3

    .line 44
    div-float/2addr v3, v5

    .line 45
    sub-float v3, v1, v3

    .line 46
    .line 47
    invoke-virtual {v2, v4, v6, v7, v3}, Landroid/graphics/RectF;->set(FFFF)V

    .line 48
    .line 49
    .line 50
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/view/DataIntegrityProgressView;->c:Landroid/graphics/RectF;

    .line 51
    .line 52
    div-float/2addr v0, v5

    .line 53
    div-float/2addr v1, v5

    .line 54
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/view/DataIntegrityProgressView;->a:Landroid/graphics/Paint;

    .line 55
    .line 56
    invoke-virtual {p1, v2, v0, v1, v3}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/view/DataIntegrityProgressView;->a:Landroid/graphics/Paint;

    .line 60
    .line 61
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    sget v2, Ll/c9c0;->I:I

    .line 66
    .line 67
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 72
    .line 73
    .line 74
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/view/DataIntegrityProgressView;->c:Landroid/graphics/RectF;

    .line 75
    .line 76
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/view/DataIntegrityProgressView;->d:I

    .line 77
    .line 78
    int-to-float v5, v0

    .line 79
    const/4 v6, 0x0

    .line 80
    iget-object v7, p0, Lcom/p1/mobile/putong/core/newui/view/DataIntegrityProgressView;->a:Landroid/graphics/Paint;

    .line 81
    .line 82
    const/high16 v4, 0x42b40000    # 90.0f

    .line 83
    .line 84
    move-object v2, p1

    .line 85
    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public setProgress(I)V
    .locals 1

    .line 1
    const/16 v0, 0x168

    .line 2
    .line 3
    mul-int/2addr p1, v0

    .line 4
    div-int/lit8 p1, p1, 0x64

    .line 5
    .line 6
    invoke-static {v0, p1}, Ljava/lang/Math;->min(II)I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/view/DataIntegrityProgressView;->d:I

    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 13
    .line 14
    .line 15
    return-void
.end method
