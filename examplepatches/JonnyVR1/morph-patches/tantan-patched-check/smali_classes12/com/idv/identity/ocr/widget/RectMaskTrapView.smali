.class public Lcom/idv/identity/ocr/widget/RectMaskTrapView;
.super Landroid/view/View;
.source "SourceFile"


# instance fields
.field private a:I

.field private b:[F

.field private c:Landroid/graphics/Paint;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 18
    invoke-direct {p0, p1, v0}, Lcom/idv/identity/ocr/widget/RectMaskTrapView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 17
    invoke-direct {p0, p1, p2, v0}, Lcom/idv/identity/ocr/widget/RectMaskTrapView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    iput p1, p0, Lcom/idv/identity/ocr/widget/RectMaskTrapView;->a:I

    .line 6
    .line 7
    const/16 p1, 0x8

    .line 8
    .line 9
    new-array p1, p1, [F

    .line 10
    .line 11
    iput-object p1, p0, Lcom/idv/identity/ocr/widget/RectMaskTrapView;->b:[F

    .line 12
    .line 13
    invoke-direct {p0}, Lcom/idv/identity/ocr/widget/RectMaskTrapView;->b()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private a(Landroid/graphics/Canvas;FFFFFFFFLandroid/graphics/Paint;)V
    .locals 0

    .line 1
    new-instance p0, Landroid/graphics/Path;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/graphics/Path;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p2, p3}, Landroid/graphics/Path;->moveTo(FF)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p4, p5}, Landroid/graphics/Path;->lineTo(FF)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, p8, p9}, Landroid/graphics/Path;->lineTo(FF)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, p6, p7}, Landroid/graphics/Path;->lineTo(FF)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/graphics/Path;->close()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1, p0, p10}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method private b()V
    .locals 4

    .line 1
    new-instance v0, Landroid/graphics/Paint;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    .line 5
    .line 6
    .line 7
    iput-object v0, p0, Lcom/idv/identity/ocr/widget/RectMaskTrapView;->c:Landroid/graphics/Paint;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    sget v3, Ll/y9c0;->a:I

    .line 14
    .line 15
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/idv/identity/ocr/widget/RectMaskTrapView;->c:Landroid/graphics/Paint;

    .line 23
    .line 24
    iget v2, p0, Lcom/idv/identity/ocr/widget/RectMaskTrapView;->a:I

    .line 25
    .line 26
    int-to-float v2, v2

    .line 27
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/idv/identity/ocr/widget/RectMaskTrapView;->c:Landroid/graphics/Paint;

    .line 31
    .line 32
    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 33
    .line 34
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Lcom/idv/identity/ocr/widget/RectMaskTrapView;->c:Landroid/graphics/Paint;

    .line 38
    .line 39
    invoke-virtual {p0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 40
    .line 41
    .line 42
    return-void
.end method


# virtual methods
.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 13

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/idv/identity/ocr/widget/RectMaskTrapView;->b:[F

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    aget v4, v0, v1

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    aget v5, v0, v1

    .line 11
    .line 12
    const/4 v1, 0x2

    .line 13
    aget v6, v0, v1

    .line 14
    .line 15
    const/4 v1, 0x3

    .line 16
    aget v7, v0, v1

    .line 17
    .line 18
    const/4 v1, 0x4

    .line 19
    aget v8, v0, v1

    .line 20
    .line 21
    const/4 v1, 0x5

    .line 22
    aget v9, v0, v1

    .line 23
    .line 24
    const/4 v1, 0x6

    .line 25
    aget v10, v0, v1

    .line 26
    .line 27
    const/4 v1, 0x7

    .line 28
    aget v11, v0, v1

    .line 29
    .line 30
    iget-object v12, p0, Lcom/idv/identity/ocr/widget/RectMaskTrapView;->c:Landroid/graphics/Paint;

    .line 31
    .line 32
    move-object v2, p0

    .line 33
    move-object v3, p1

    .line 34
    invoke-direct/range {v2 .. v12}, Lcom/idv/identity/ocr/widget/RectMaskTrapView;->a(Landroid/graphics/Canvas;FFFFFFFFLandroid/graphics/Paint;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public setRectPoints([F)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/ocr/widget/RectMaskTrapView;->b:[F

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
