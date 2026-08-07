.class public Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/StrokeTextView;
.super Landroidx/appcompat/widget/AppCompatTextView;
.source "SourceFile"


# instance fields
.field public a:Landroid/text/TextPaint;

.field public b:F

.field public c:I
    .annotation build Landroidx/annotation/ColorInt;
    .end annotation
.end field

.field public d:Landroid/graphics/Rect;

.field public e:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 19
    invoke-direct {p0, p1}, Landroidx/appcompat/widget/AppCompatTextView;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x0

    .line 20
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/StrokeTextView;->b:F

    const/4 p1, 0x0

    .line 21
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/StrokeTextView;->c:I

    .line 22
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/StrokeTextView;->e:I

    .line 23
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/StrokeTextView;->h()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Landroidx/appcompat/widget/AppCompatTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/StrokeTextView;->b:F

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/StrokeTextView;->c:I

    .line 9
    .line 10
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/StrokeTextView;->e:I

    .line 11
    .line 12
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/StrokeTextView;->i(Landroid/util/AttributeSet;)V

    .line 13
    .line 14
    .line 15
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/StrokeTextView;->h()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 24
    invoke-direct {p0, p1, p2, p3}, Landroidx/appcompat/widget/AppCompatTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 25
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/StrokeTextView;->b:F

    const/4 p1, 0x0

    .line 26
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/StrokeTextView;->c:I

    .line 27
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/StrokeTextView;->e:I

    .line 28
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/StrokeTextView;->i(Landroid/util/AttributeSet;)V

    .line 29
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/StrokeTextView;->h()V

    return-void
.end method

.method private h()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/StrokeTextView;->a:Landroid/text/TextPaint;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroid/text/TextPaint;

    .line 6
    .line 7
    invoke-direct {v0}, Landroid/text/TextPaint;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/StrokeTextView;->a:Landroid/text/TextPaint;

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/StrokeTextView;->d:Landroid/graphics/Rect;

    .line 13
    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    new-instance v0, Landroid/graphics/Rect;

    .line 17
    .line 18
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/StrokeTextView;->d:Landroid/graphics/Rect;

    .line 22
    .line 23
    :cond_1
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/StrokeTextView;->a:Landroid/text/TextPaint;

    .line 28
    .line 29
    invoke-virtual {v0}, Landroid/graphics/Paint;->getTextSize()F

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 34
    .line 35
    .line 36
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/StrokeTextView;->a:Landroid/text/TextPaint;

    .line 37
    .line 38
    invoke-virtual {v0}, Landroid/graphics/Paint;->getTypeface()Landroid/graphics/Typeface;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 43
    .line 44
    .line 45
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/StrokeTextView;->a:Landroid/text/TextPaint;

    .line 46
    .line 47
    invoke-virtual {v0}, Landroid/graphics/Paint;->getFlags()I

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setFlags(I)V

    .line 52
    .line 53
    .line 54
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/StrokeTextView;->a:Landroid/text/TextPaint;

    .line 55
    .line 56
    invoke-virtual {v0}, Landroid/graphics/Paint;->getAlpha()I

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/StrokeTextView;->a:Landroid/text/TextPaint;

    .line 64
    .line 65
    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 66
    .line 67
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/StrokeTextView;->a:Landroid/text/TextPaint;

    .line 71
    .line 72
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/StrokeTextView;->c:I

    .line 73
    .line 74
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/StrokeTextView;->a:Landroid/text/TextPaint;

    .line 78
    .line 79
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/StrokeTextView;->b:F

    .line 80
    .line 81
    invoke-virtual {v0, p0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 82
    .line 83
    .line 84
    return-void
.end method


# virtual methods
.method public final i(Landroid/util/AttributeSet;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Ll/nhc0;->H:[I

    .line 8
    .line 9
    invoke-virtual {v0, p1, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    sget v0, Ll/nhc0;->J:I

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/StrokeTextView;->b:F

    .line 21
    .line 22
    sget v0, Ll/nhc0;->I:I

    .line 23
    .line 24
    const/4 v1, 0x0

    .line 25
    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/StrokeTextView;->c:I

    .line 30
    .line 31
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-nez v1, :cond_2

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/widget/TextView;->getGravity()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    and-int/lit8 v2, v1, 0x3

    .line 20
    .line 21
    const/4 v3, 0x3

    .line 22
    if-ne v2, v3, :cond_0

    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/widget/TextView;->getCompoundPaddingLeft()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    int-to-float v1, v1

    .line 29
    invoke-virtual {p0}, Landroid/view/View;->getBaseline()I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    int-to-float v2, v2

    .line 34
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/StrokeTextView;->a:Landroid/text/TextPaint;

    .line 35
    .line 36
    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    const/4 v2, 0x5

    .line 41
    and-int/2addr v1, v2

    .line 42
    if-ne v1, v2, :cond_1

    .line 43
    .line 44
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    invoke-virtual {p0}, Landroid/widget/TextView;->getCompoundPaddingRight()I

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    sub-int/2addr v1, v2

    .line 53
    int-to-float v1, v1

    .line 54
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    invoke-virtual {v2, v0}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    sub-float/2addr v1, v2

    .line 63
    invoke-virtual {p0}, Landroid/view/View;->getBaseline()I

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    int-to-float v2, v2

    .line 68
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/StrokeTextView;->a:Landroid/text/TextPaint;

    .line 69
    .line 70
    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 71
    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    invoke-virtual {p0}, Landroid/widget/TextView;->getCompoundPaddingRight()I

    .line 79
    .line 80
    .line 81
    move-result v2

    .line 82
    sub-int/2addr v1, v2

    .line 83
    invoke-virtual {p0}, Landroid/widget/TextView;->getCompoundPaddingLeft()I

    .line 84
    .line 85
    .line 86
    move-result v2

    .line 87
    sub-int/2addr v1, v2

    .line 88
    int-to-float v1, v1

    .line 89
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    invoke-virtual {v2, v0}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 94
    .line 95
    .line 96
    move-result v2

    .line 97
    sub-float/2addr v1, v2

    .line 98
    const/high16 v2, 0x40000000    # 2.0f

    .line 99
    .line 100
    div-float/2addr v1, v2

    .line 101
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 102
    .line 103
    .line 104
    move-result v2

    .line 105
    int-to-float v2, v2

    .line 106
    add-float/2addr v2, v1

    .line 107
    invoke-virtual {p0}, Landroid/view/View;->getBaseline()I

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    int-to-float v1, v1

    .line 112
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/StrokeTextView;->a:Landroid/text/TextPaint;

    .line 113
    .line 114
    invoke-virtual {p1, v0, v2, v1, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 115
    .line 116
    .line 117
    :cond_2
    :goto_0
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 118
    .line 119
    .line 120
    return-void
.end method

.method public onMeasure(II)V
    .locals 8

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/StrokeTextView;->e:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/StrokeTextView;->e:I

    .line 6
    .line 7
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    invoke-virtual {p0}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 24
    .line 25
    .line 26
    move-result-object v4

    .line 27
    invoke-interface {v4}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v4

    .line 31
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 32
    .line 33
    .line 34
    move-result-object v5

    .line 35
    invoke-virtual {v5, v4}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 36
    .line 37
    .line 38
    move-result v4

    .line 39
    const/4 v5, 0x0

    .line 40
    cmpl-float v5, v4, v5

    .line 41
    .line 42
    if-nez v5, :cond_0

    .line 43
    .line 44
    invoke-super {p0, p1, p2}, Landroidx/appcompat/widget/AppCompatTextView;->onMeasure(II)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_0
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-virtual {p1}, Landroid/graphics/Paint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    iget p2, p1, Landroid/graphics/Paint$FontMetrics;->descent:F

    .line 57
    .line 58
    iget p1, p1, Landroid/graphics/Paint$FontMetrics;->top:F

    .line 59
    .line 60
    sub-float/2addr p2, p1

    .line 61
    invoke-virtual {p0}, Landroid/widget/TextView;->getCompoundPaddingRight()I

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    invoke-virtual {p0}, Landroid/widget/TextView;->getCompoundPaddingLeft()I

    .line 66
    .line 67
    .line 68
    move-result v5

    .line 69
    add-int/2addr p1, v5

    .line 70
    int-to-float p1, p1

    .line 71
    add-float/2addr p1, v4

    .line 72
    iget v4, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/StrokeTextView;->b:F

    .line 73
    .line 74
    add-float/2addr p1, v4

    .line 75
    invoke-virtual {p0}, Landroid/widget/TextView;->getCompoundPaddingTop()I

    .line 76
    .line 77
    .line 78
    move-result v4

    .line 79
    invoke-virtual {p0}, Landroid/widget/TextView;->getCompoundPaddingBottom()I

    .line 80
    .line 81
    .line 82
    move-result v5

    .line 83
    add-int/2addr v4, v5

    .line 84
    int-to-float v4, v4

    .line 85
    add-float/2addr v4, p2

    .line 86
    iget p2, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/StrokeTextView;->b:F

    .line 87
    .line 88
    const/high16 v5, 0x40000000    # 2.0f

    .line 89
    .line 90
    div-float/2addr p2, v5

    .line 91
    add-float/2addr v4, p2

    .line 92
    const/4 p2, 0x2

    .line 93
    const/16 v5, 0x11

    .line 94
    .line 95
    const/high16 v6, 0x40000000    # 2.0f

    .line 96
    .line 97
    if-eq v2, v6, :cond_5

    .line 98
    .line 99
    if-ne v3, v6, :cond_1

    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_1
    const/high16 v7, -0x80000000

    .line 103
    .line 104
    if-eq v2, v7, :cond_2

    .line 105
    .line 106
    if-ne v3, v7, :cond_a

    .line 107
    .line 108
    :cond_2
    if-ne v2, v7, :cond_3

    .line 109
    .line 110
    float-to-int v0, p1

    .line 111
    invoke-virtual {p0, v5}, Landroid/widget/TextView;->setGravity(I)V

    .line 112
    .line 113
    .line 114
    :cond_3
    if-ne v3, v7, :cond_4

    .line 115
    .line 116
    float-to-int v1, v4

    .line 117
    invoke-virtual {p0, v5}, Landroid/widget/TextView;->setGravity(I)V

    .line 118
    .line 119
    .line 120
    :cond_4
    invoke-static {v0, v6}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 121
    .line 122
    .line 123
    move-result p1

    .line 124
    invoke-static {v1, v6}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 125
    .line 126
    .line 127
    move-result v0

    .line 128
    invoke-super {p0, p1, v0}, Landroidx/appcompat/widget/AppCompatTextView;->onMeasure(II)V

    .line 129
    .line 130
    .line 131
    goto :goto_1

    .line 132
    :cond_5
    :goto_0
    if-ne v2, v6, :cond_7

    .line 133
    .line 134
    iget v7, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/StrokeTextView;->e:I

    .line 135
    .line 136
    if-ge v7, p2, :cond_7

    .line 137
    .line 138
    int-to-float v7, v0

    .line 139
    invoke-static {v7, p1}, Ljava/lang/Math;->max(FF)F

    .line 140
    .line 141
    .line 142
    move-result p1

    .line 143
    float-to-int p1, p1

    .line 144
    if-eq p1, v0, :cond_6

    .line 145
    .line 146
    invoke-virtual {p0, v5}, Landroid/widget/TextView;->setGravity(I)V

    .line 147
    .line 148
    .line 149
    :cond_6
    move v0, p1

    .line 150
    :cond_7
    if-ne v3, v6, :cond_9

    .line 151
    .line 152
    int-to-float p1, v1

    .line 153
    invoke-static {p1, v4}, Ljava/lang/Math;->max(FF)F

    .line 154
    .line 155
    .line 156
    move-result p1

    .line 157
    float-to-int p1, p1

    .line 158
    if-eq p1, v1, :cond_8

    .line 159
    .line 160
    invoke-virtual {p0, v5}, Landroid/widget/TextView;->setGravity(I)V

    .line 161
    .line 162
    .line 163
    :cond_8
    move v1, p1

    .line 164
    :cond_9
    invoke-static {v0, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 165
    .line 166
    .line 167
    move-result p1

    .line 168
    invoke-static {v1, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 169
    .line 170
    .line 171
    move-result v0

    .line 172
    invoke-super {p0, p1, v0}, Landroidx/appcompat/widget/AppCompatTextView;->onMeasure(II)V

    .line 173
    .line 174
    .line 175
    :cond_a
    :goto_1
    iget p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/StrokeTextView;->e:I

    .line 176
    .line 177
    rem-int/2addr p1, p2

    .line 178
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/StrokeTextView;->e:I

    .line 179
    .line 180
    return-void
.end method

.method public setTypeface(Landroid/graphics/Typeface;)V
    .locals 1
    .param p1    # Landroid/graphics/Typeface;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 109
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/StrokeTextView;->a:Landroid/text/TextPaint;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/graphics/Paint;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v0

    if-eq v0, p1, :cond_0

    .line 110
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/StrokeTextView;->a:Landroid/text/TextPaint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 111
    :cond_0
    invoke-super {p0, p1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    return-void
.end method

.method public setTypeface(Landroid/graphics/Typeface;I)V
    .locals 6
    .param p1    # Landroid/graphics/Typeface;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x0

    .line 3
    if-lez p2, :cond_7

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    invoke-static {p2}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-static {p1, p2}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    :goto_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/StrokeTextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 17
    .line 18
    .line 19
    if-eqz p1, :cond_1

    .line 20
    .line 21
    invoke-virtual {p1}, Landroid/graphics/Typeface;->getStyle()I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    goto :goto_1

    .line 26
    :cond_1
    move p1, v1

    .line 27
    :goto_1
    not-int p1, p1

    .line 28
    and-int/2addr p1, p2

    .line 29
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    and-int/lit8 v2, p1, 0x1

    .line 34
    .line 35
    const/4 v3, 0x1

    .line 36
    if-eqz v2, :cond_2

    .line 37
    .line 38
    move v4, v3

    .line 39
    goto :goto_2

    .line 40
    :cond_2
    move v4, v1

    .line 41
    :goto_2
    invoke-virtual {p2, v4}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 45
    .line 46
    .line 47
    move-result-object p2

    .line 48
    and-int/lit8 p1, p1, 0x2

    .line 49
    .line 50
    const/high16 v4, -0x41800000    # -0.25f

    .line 51
    .line 52
    if-eqz p1, :cond_3

    .line 53
    .line 54
    move v5, v4

    .line 55
    goto :goto_3

    .line 56
    :cond_3
    move v5, v0

    .line 57
    :goto_3
    invoke-virtual {p2, v5}, Landroid/graphics/Paint;->setTextSkewX(F)V

    .line 58
    .line 59
    .line 60
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/StrokeTextView;->a:Landroid/text/TextPaint;

    .line 61
    .line 62
    if-eqz p2, :cond_6

    .line 63
    .line 64
    if-eqz v2, :cond_4

    .line 65
    .line 66
    move v1, v3

    .line 67
    :cond_4
    invoke-virtual {p2, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 68
    .line 69
    .line 70
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/StrokeTextView;->a:Landroid/text/TextPaint;

    .line 71
    .line 72
    if-eqz p1, :cond_5

    .line 73
    .line 74
    move v0, v4

    .line 75
    :cond_5
    invoke-virtual {p0, v0}, Landroid/graphics/Paint;->setTextSkewX(F)V

    .line 76
    .line 77
    .line 78
    :cond_6
    return-void

    .line 79
    :cond_7
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 80
    .line 81
    .line 82
    move-result-object p2

    .line 83
    invoke-virtual {p2, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 87
    .line 88
    .line 89
    move-result-object p2

    .line 90
    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setTextSkewX(F)V

    .line 91
    .line 92
    .line 93
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/StrokeTextView;->a:Landroid/text/TextPaint;

    .line 94
    .line 95
    if-eqz p2, :cond_8

    .line 96
    .line 97
    invoke-virtual {p2, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 98
    .line 99
    .line 100
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/StrokeTextView;->a:Landroid/text/TextPaint;

    .line 101
    .line 102
    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setTextSkewX(F)V

    .line 103
    .line 104
    .line 105
    :cond_8
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/StrokeTextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 106
    .line 107
    .line 108
    return-void
.end method
