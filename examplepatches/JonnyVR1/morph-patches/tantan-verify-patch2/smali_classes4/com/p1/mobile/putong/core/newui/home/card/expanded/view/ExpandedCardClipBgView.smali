.class public Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardClipBgView;
.super Landroid/view/View;
.source "SourceFile"


# instance fields
.field public a:I

.field public b:I

.field public c:I

.field public d:I

.field public e:I

.field public f:I

.field public g:Landroid/graphics/Paint;

.field public h:Landroid/graphics/Xfermode;

.field public i:Landroid/graphics/Path;

.field public j:Landroid/graphics/RectF;

.field public k:[F

.field public l:F


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
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardClipBgView;->c:I

    .line 6
    .line 7
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardClipBgView;->d:I

    .line 8
    .line 9
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardClipBgView;->f:I

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardClipBgView;->a()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 15
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 16
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardClipBgView;->c:I

    .line 17
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardClipBgView;->d:I

    .line 18
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardClipBgView;->f:I

    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardClipBgView;->a()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 20
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 21
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardClipBgView;->c:I

    .line 22
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardClipBgView;->d:I

    .line 23
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardClipBgView;->f:I

    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardClipBgView;->a()V

    return-void
.end method


# virtual methods
.method public final a()V
    .locals 4

    .line 1
    new-instance v0, Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardClipBgView;->g:Landroid/graphics/Paint;

    .line 7
    .line 8
    const/4 v1, -0x1

    .line 9
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardClipBgView;->g:Landroid/graphics/Paint;

    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 16
    .line 17
    .line 18
    new-instance v0, Landroid/graphics/PorterDuffXfermode;

    .line 19
    .line 20
    sget-object v2, Landroid/graphics/PorterDuff$Mode;->DST_IN:Landroid/graphics/PorterDuff$Mode;

    .line 21
    .line 22
    invoke-direct {v0, v2}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardClipBgView;->h:Landroid/graphics/Xfermode;

    .line 26
    .line 27
    const/high16 v0, 0x41200000    # 10.0f

    .line 28
    .line 29
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardClipBgView;->e:I

    .line 34
    .line 35
    const/high16 v0, 0x41a00000    # 20.0f

    .line 36
    .line 37
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    int-to-float v0, v0

    .line 42
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardClipBgView;->l:F

    .line 43
    .line 44
    const/16 v2, 0x8

    .line 45
    .line 46
    new-array v2, v2, [F

    .line 47
    .line 48
    const/4 v3, 0x0

    .line 49
    aput v0, v2, v3

    .line 50
    .line 51
    aput v0, v2, v1

    .line 52
    .line 53
    const/4 v1, 0x2

    .line 54
    aput v0, v2, v1

    .line 55
    .line 56
    const/4 v1, 0x3

    .line 57
    aput v0, v2, v1

    .line 58
    .line 59
    const/4 v0, 0x4

    .line 60
    const/4 v1, 0x0

    .line 61
    aput v1, v2, v0

    .line 62
    .line 63
    const/4 v0, 0x5

    .line 64
    aput v1, v2, v0

    .line 65
    .line 66
    const/4 v0, 0x6

    .line 67
    aput v1, v2, v0

    .line 68
    .line 69
    const/4 v0, 0x7

    .line 70
    aput v1, v2, v0

    .line 71
    .line 72
    iput-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardClipBgView;->k:[F

    .line 73
    .line 74
    new-instance v0, Landroid/graphics/Path;

    .line 75
    .line 76
    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 77
    .line 78
    .line 79
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardClipBgView;->i:Landroid/graphics/Path;

    .line 80
    .line 81
    new-instance v0, Landroid/graphics/RectF;

    .line 82
    .line 83
    invoke-direct {v0, v1, v1, v1, v1}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 84
    .line 85
    .line 86
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardClipBgView;->j:Landroid/graphics/RectF;

    .line 87
    .line 88
    return-void
.end method

.method public b(II)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardClipBgView;->c:I

    .line 2
    .line 3
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardClipBgView;->d:I

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 8
    .param p1    # Landroid/graphics/Canvas;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v4, v0

    .line 6
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    int-to-float v5, v0

    .line 11
    const/4 v6, 0x0

    .line 12
    const/16 v7, 0x1f

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    const/4 v3, 0x0

    .line 16
    move-object v1, p1

    .line 17
    invoke-virtual/range {v1 .. v7}, Landroid/graphics/Canvas;->saveLayer(FFFFLandroid/graphics/Paint;I)I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    new-instance v0, Landroid/graphics/PaintFlagsDrawFilter;

    .line 22
    .line 23
    const/4 v2, 0x0

    .line 24
    const/4 v3, 0x3

    .line 25
    invoke-direct {v0, v2, v3}, Landroid/graphics/PaintFlagsDrawFilter;-><init>(II)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1, v0}, Landroid/graphics/Canvas;->setDrawFilter(Landroid/graphics/DrawFilter;)V

    .line 29
    .line 30
    .line 31
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardClipBgView;->l:F

    .line 32
    .line 33
    neg-float v0, v0

    .line 34
    float-to-int v0, v0

    .line 35
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardClipBgView;->d:I

    .line 36
    .line 37
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardClipBgView;->e:I

    .line 38
    .line 39
    add-int/2addr v2, v3

    .line 40
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardClipBgView;->f:I

    .line 41
    .line 42
    add-int/2addr v2, v3

    .line 43
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardClipBgView;->c:I

    .line 44
    .line 45
    sub-int/2addr v2, v3

    .line 46
    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardClipBgView;->i:Landroid/graphics/Path;

    .line 51
    .line 52
    invoke-virtual {v2}, Landroid/graphics/Path;->reset()V

    .line 53
    .line 54
    .line 55
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardClipBgView;->j:Landroid/graphics/RectF;

    .line 56
    .line 57
    int-to-float v0, v0

    .line 58
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardClipBgView;->b:I

    .line 59
    .line 60
    int-to-float v3, v3

    .line 61
    iget v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardClipBgView;->a:I

    .line 62
    .line 63
    int-to-float v4, v4

    .line 64
    const/4 v5, 0x0

    .line 65
    invoke-virtual {v2, v5, v0, v3, v4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardClipBgView;->i:Landroid/graphics/Path;

    .line 69
    .line 70
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardClipBgView;->j:Landroid/graphics/RectF;

    .line 71
    .line 72
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardClipBgView;->k:[F

    .line 73
    .line 74
    sget-object v4, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    .line 75
    .line 76
    invoke-virtual {v0, v2, v3, v4}, Landroid/graphics/Path;->addRoundRect(Landroid/graphics/RectF;[FLandroid/graphics/Path$Direction;)V

    .line 77
    .line 78
    .line 79
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardClipBgView;->i:Landroid/graphics/Path;

    .line 80
    .line 81
    invoke-virtual {v0}, Landroid/graphics/Path;->close()V

    .line 82
    .line 83
    .line 84
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardClipBgView;->i:Landroid/graphics/Path;

    .line 85
    .line 86
    invoke-virtual {v1, v0}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;)Z

    .line 87
    .line 88
    .line 89
    invoke-super {p0, v1}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {v1, p1}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method public onMeasure(II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    invoke-static {p2}, Ll/dox;->d(I)I

    .line 5
    .line 6
    .line 7
    move-result p2

    .line 8
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardClipBgView;->a:I

    .line 9
    .line 10
    invoke-static {p1}, Ll/dox;->d(I)I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardClipBgView;->b:I

    .line 15
    .line 16
    return-void
.end method

.method public setExtTop(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardClipBgView;->f:I

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
