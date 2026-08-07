.class public Lcom/p1/mobile/putong/core/view/LetterTextView;
.super Landroidx/appcompat/widget/AppCompatTextView;
.source "SourceFile"


# instance fields
.field public a:Landroid/graphics/Paint;

.field public b:Landroid/graphics/Rect;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/appcompat/widget/AppCompatTextView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Landroid/graphics/Paint;

    .line 5
    .line 6
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/core/view/LetterTextView;->a:Landroid/graphics/Paint;

    .line 10
    .line 11
    new-instance p1, Landroid/graphics/Rect;

    .line 12
    .line 13
    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lcom/p1/mobile/putong/core/view/LetterTextView;->b:Landroid/graphics/Rect;

    .line 17
    .line 18
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/view/LetterTextView;->h()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 22
    invoke-direct {p0, p1, p2}, Landroidx/appcompat/widget/AppCompatTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 23
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/view/LetterTextView;->a:Landroid/graphics/Paint;

    .line 24
    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/view/LetterTextView;->b:Landroid/graphics/Rect;

    .line 25
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/view/LetterTextView;->h()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 26
    invoke-direct {p0, p1, p2, p3}, Landroidx/appcompat/widget/AppCompatTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 27
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/view/LetterTextView;->a:Landroid/graphics/Paint;

    .line 28
    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/view/LetterTextView;->b:Landroid/graphics/Rect;

    .line 29
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/view/LetterTextView;->h()V

    return-void
.end method

.method private h()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/LetterTextView;->a:Landroid/graphics/Paint;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/LetterTextView;->a:Landroid/graphics/Paint;

    .line 8
    .line 9
    const-string v1, "#1A9A916A"

    .line 10
    .line 11
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/view/LetterTextView;->a:Landroid/graphics/Paint;

    .line 19
    .line 20
    sget v0, Ll/qa00;->a:I

    .line 21
    .line 22
    int-to-float v0, v0

    .line 23
    invoke-virtual {p0, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 24
    .line 25
    .line 26
    return-void
.end method


# virtual methods
.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-super/range {p0 .. p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    invoke-virtual {v0}, Landroid/widget/TextView;->getLineHeight()I

    .line 15
    .line 16
    .line 17
    move-result v3

    .line 18
    invoke-virtual {v0}, Landroid/widget/TextView;->getLineCount()I

    .line 19
    .line 20
    .line 21
    move-result v4

    .line 22
    const/4 v5, 0x1

    .line 23
    if-le v4, v5, :cond_0

    .line 24
    .line 25
    invoke-virtual {v0}, Landroid/widget/TextView;->getLineCount()I

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    add-int/lit8 v3, v3, -0x2

    .line 30
    .line 31
    iget-object v4, v0, Lcom/p1/mobile/putong/core/view/LetterTextView;->b:Landroid/graphics/Rect;

    .line 32
    .line 33
    invoke-virtual {v0, v3, v4}, Landroid/widget/TextView;->getLineBounds(ILandroid/graphics/Rect;)I

    .line 34
    .line 35
    .line 36
    iget-object v3, v0, Lcom/p1/mobile/putong/core/view/LetterTextView;->b:Landroid/graphics/Rect;

    .line 37
    .line 38
    iget v3, v3, Landroid/graphics/Rect;->bottom:I

    .line 39
    .line 40
    invoke-virtual {v0}, Landroid/view/View;->getPaddingTop()I

    .line 41
    .line 42
    .line 43
    move-result v4

    .line 44
    sub-int/2addr v3, v4

    .line 45
    invoke-virtual {v0}, Landroid/widget/TextView;->getLineCount()I

    .line 46
    .line 47
    .line 48
    move-result v4

    .line 49
    sub-int/2addr v4, v5

    .line 50
    div-int/2addr v3, v4

    .line 51
    :cond_0
    div-int/2addr v1, v3

    .line 52
    const/4 v4, 0x0

    .line 53
    :goto_0
    if-ge v4, v1, :cond_1

    .line 54
    .line 55
    add-int/lit8 v4, v4, 0x1

    .line 56
    .line 57
    mul-int v5, v4, v3

    .line 58
    .line 59
    int-to-float v8, v5

    .line 60
    int-to-float v9, v2

    .line 61
    iget-object v11, v0, Lcom/p1/mobile/putong/core/view/LetterTextView;->a:Landroid/graphics/Paint;

    .line 62
    .line 63
    const/4 v7, 0x0

    .line 64
    move v10, v8

    .line 65
    move-object/from16 v6, p1

    .line 66
    .line 67
    invoke-virtual/range {v6 .. v11}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 68
    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_1
    invoke-virtual {v0}, Landroid/widget/TextView;->getLineCount()I

    .line 72
    .line 73
    .line 74
    move-result v4

    .line 75
    if-le v4, v1, :cond_2

    .line 76
    .line 77
    :goto_1
    if-ge v1, v4, :cond_2

    .line 78
    .line 79
    add-int/lit8 v1, v1, 0x1

    .line 80
    .line 81
    mul-int v5, v1, v3

    .line 82
    .line 83
    int-to-float v14, v5

    .line 84
    int-to-float v15, v2

    .line 85
    iget-object v5, v0, Lcom/p1/mobile/putong/core/view/LetterTextView;->a:Landroid/graphics/Paint;

    .line 86
    .line 87
    const/4 v13, 0x0

    .line 88
    move/from16 v16, v14

    .line 89
    .line 90
    move-object/from16 v12, p1

    .line 91
    .line 92
    move-object/from16 v17, v5

    .line 93
    .line 94
    invoke-virtual/range {v12 .. v17}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 95
    .line 96
    .line 97
    goto :goto_1

    .line 98
    :cond_2
    return-void
.end method

.method public onFinishInflate()V
    .locals 4

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/qa00;->z:I

    .line 5
    .line 6
    invoke-static {p0, v0}, Ll/msi0;->m(Landroid/widget/TextView;I)V

    .line 7
    .line 8
    .line 9
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 10
    .line 11
    const/16 v2, 0x1c

    .line 12
    .line 13
    if-gt v1, v2, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const/4 v2, 0x0

    .line 20
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->getFontMetricsInt(Landroid/graphics/Paint$FontMetricsInt;)I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    sub-int v2, v0, v1

    .line 25
    .line 26
    int-to-float v2, v2

    .line 27
    int-to-float v0, v0

    .line 28
    int-to-float v1, v1

    .line 29
    const/high16 v3, 0x3f800000    # 1.0f

    .line 30
    .line 31
    mul-float/2addr v3, v1

    .line 32
    sub-float/2addr v0, v3

    .line 33
    div-float/2addr v0, v1

    .line 34
    invoke-virtual {p0, v2, v0}, Landroid/widget/TextView;->setLineSpacing(FF)V

    .line 35
    .line 36
    .line 37
    :cond_0
    return-void
.end method
