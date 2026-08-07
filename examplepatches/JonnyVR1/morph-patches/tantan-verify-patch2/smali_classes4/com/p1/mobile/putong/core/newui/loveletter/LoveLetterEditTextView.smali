.class public Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditTextView;
.super Landroidx/appcompat/widget/AppCompatEditText;
.source "SourceFile"


# instance fields
.field public a:Landroid/graphics/Paint;

.field public b:Landroid/graphics/Rect;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/appcompat/widget/AppCompatEditText;-><init>(Landroid/content/Context;)V

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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditTextView;->a:Landroid/graphics/Paint;

    .line 10
    .line 11
    new-instance p1, Landroid/graphics/Rect;

    .line 12
    .line 13
    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditTextView;->b:Landroid/graphics/Rect;

    .line 17
    .line 18
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 19
    invoke-direct {p0, p1, p2}, Landroidx/appcompat/widget/AppCompatEditText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 20
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditTextView;->a:Landroid/graphics/Paint;

    .line 21
    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditTextView;->b:Landroid/graphics/Rect;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 22
    invoke-direct {p0, p1, p2, p3}, Landroidx/appcompat/widget/AppCompatEditText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 23
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditTextView;->a:Landroid/graphics/Paint;

    .line 24
    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditTextView;->b:Landroid/graphics/Rect;

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
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditTextView;->a:Landroid/graphics/Paint;

    .line 7
    .line 8
    const/4 v2, 0x1

    .line 9
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 10
    .line 11
    .line 12
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditTextView;->a:Landroid/graphics/Paint;

    .line 13
    .line 14
    const-string v3, "#1A9A916A"

    .line 15
    .line 16
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 21
    .line 22
    .line 23
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditTextView;->a:Landroid/graphics/Paint;

    .line 24
    .line 25
    const/high16 v3, 0x40000000    # 2.0f

    .line 26
    .line 27
    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    invoke-virtual {v0}, Landroid/widget/TextView;->getLineHeight()I

    .line 39
    .line 40
    .line 41
    move-result v4

    .line 42
    invoke-virtual {v0}, Landroid/widget/TextView;->getLineCount()I

    .line 43
    .line 44
    .line 45
    move-result v5

    .line 46
    if-le v5, v2, :cond_0

    .line 47
    .line 48
    invoke-virtual {v0}, Landroid/widget/TextView;->getLineCount()I

    .line 49
    .line 50
    .line 51
    move-result v4

    .line 52
    add-int/lit8 v4, v4, -0x2

    .line 53
    .line 54
    iget-object v5, v0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditTextView;->b:Landroid/graphics/Rect;

    .line 55
    .line 56
    invoke-virtual {v0, v4, v5}, Landroid/widget/TextView;->getLineBounds(ILandroid/graphics/Rect;)I

    .line 57
    .line 58
    .line 59
    iget-object v4, v0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditTextView;->b:Landroid/graphics/Rect;

    .line 60
    .line 61
    iget v4, v4, Landroid/graphics/Rect;->bottom:I

    .line 62
    .line 63
    invoke-virtual {v0}, Landroid/view/View;->getPaddingTop()I

    .line 64
    .line 65
    .line 66
    move-result v5

    .line 67
    sub-int/2addr v4, v5

    .line 68
    invoke-virtual {v0}, Landroid/widget/TextView;->getLineCount()I

    .line 69
    .line 70
    .line 71
    move-result v5

    .line 72
    sub-int/2addr v5, v2

    .line 73
    div-int/2addr v4, v5

    .line 74
    :cond_0
    div-int/2addr v1, v4

    .line 75
    const/4 v2, 0x0

    .line 76
    :goto_0
    if-ge v2, v1, :cond_1

    .line 77
    .line 78
    add-int/lit8 v2, v2, 0x1

    .line 79
    .line 80
    mul-int v5, v2, v4

    .line 81
    .line 82
    int-to-float v8, v5

    .line 83
    int-to-float v9, v3

    .line 84
    iget-object v11, v0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditTextView;->a:Landroid/graphics/Paint;

    .line 85
    .line 86
    const/4 v7, 0x0

    .line 87
    move v10, v8

    .line 88
    move-object/from16 v6, p1

    .line 89
    .line 90
    invoke-virtual/range {v6 .. v11}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 91
    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_1
    invoke-virtual {v0}, Landroid/widget/TextView;->getLineCount()I

    .line 95
    .line 96
    .line 97
    move-result v2

    .line 98
    if-le v2, v1, :cond_2

    .line 99
    .line 100
    :goto_1
    if-ge v1, v2, :cond_2

    .line 101
    .line 102
    add-int/lit8 v1, v1, 0x1

    .line 103
    .line 104
    mul-int v5, v1, v4

    .line 105
    .line 106
    int-to-float v14, v5

    .line 107
    int-to-float v15, v3

    .line 108
    iget-object v5, v0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditTextView;->a:Landroid/graphics/Paint;

    .line 109
    .line 110
    const/4 v13, 0x0

    .line 111
    move/from16 v16, v14

    .line 112
    .line 113
    move-object/from16 v12, p1

    .line 114
    .line 115
    move-object/from16 v17, v5

    .line 116
    .line 117
    invoke-virtual/range {v12 .. v17}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 118
    .line 119
    .line 120
    goto :goto_1

    .line 121
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
    const/16 v0, 0x30

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setGravity(I)V

    .line 7
    .line 8
    .line 9
    sget v0, Ll/qa00;->z:I

    .line 10
    .line 11
    invoke-static {p0, v0}, Ll/msi0;->m(Landroid/widget/TextView;I)V

    .line 12
    .line 13
    .line 14
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 15
    .line 16
    const/16 v2, 0x1c

    .line 17
    .line 18
    if-gt v1, v2, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    const/4 v2, 0x0

    .line 25
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->getFontMetricsInt(Landroid/graphics/Paint$FontMetricsInt;)I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    sub-int v2, v0, v1

    .line 30
    .line 31
    int-to-float v2, v2

    .line 32
    int-to-float v0, v0

    .line 33
    int-to-float v1, v1

    .line 34
    const/high16 v3, 0x3f800000    # 1.0f

    .line 35
    .line 36
    mul-float/2addr v3, v1

    .line 37
    sub-float/2addr v0, v3

    .line 38
    div-float/2addr v0, v1

    .line 39
    invoke-virtual {p0, v2, v0}, Landroid/widget/TextView;->setLineSpacing(FF)V

    .line 40
    .line 41
    .line 42
    :cond_0
    return-void
.end method
