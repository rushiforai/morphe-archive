.class public Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveStrokeTextView;
.super Landroidx/appcompat/widget/AppCompatTextView;
.source "SourceFile"


# instance fields
.field public a:I

.field public b:Landroid/graphics/Paint;

.field public final c:Landroid/graphics/Rect;

.field public final d:Landroid/graphics/CornerPathEffect;

.field public e:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Landroidx/appcompat/widget/AppCompatTextView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Landroid/graphics/Rect;

    .line 5
    .line 6
    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveStrokeTextView;->c:Landroid/graphics/Rect;

    .line 10
    .line 11
    new-instance p1, Landroid/graphics/CornerPathEffect;

    .line 12
    .line 13
    const/high16 v0, 0x40400000    # 3.0f

    .line 14
    .line 15
    invoke-direct {p1, v0}, Landroid/graphics/CornerPathEffect;-><init>(F)V

    .line 16
    .line 17
    .line 18
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveStrokeTextView;->d:Landroid/graphics/CornerPathEffect;

    .line 19
    .line 20
    const/16 p1, 0xa

    .line 21
    .line 22
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveStrokeTextView;->e:I

    .line 23
    .line 24
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 25
    invoke-direct {p0, p1, p2}, Landroidx/appcompat/widget/AppCompatTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 26
    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveStrokeTextView;->c:Landroid/graphics/Rect;

    .line 27
    new-instance p1, Landroid/graphics/CornerPathEffect;

    const/high16 p2, 0x40400000    # 3.0f

    invoke-direct {p1, p2}, Landroid/graphics/CornerPathEffect;-><init>(F)V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveStrokeTextView;->d:Landroid/graphics/CornerPathEffect;

    const/16 p1, 0xa

    .line 28
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveStrokeTextView;->e:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 29
    invoke-direct {p0, p1, p2, p3}, Landroidx/appcompat/widget/AppCompatTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 30
    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveStrokeTextView;->c:Landroid/graphics/Rect;

    .line 31
    new-instance p1, Landroid/graphics/CornerPathEffect;

    const/high16 p2, 0x40400000    # 3.0f

    invoke-direct {p1, p2}, Landroid/graphics/CornerPathEffect;-><init>(F)V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveStrokeTextView;->d:Landroid/graphics/CornerPathEffect;

    const/16 p1, 0xa

    .line 32
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveStrokeTextView;->e:I

    return-void
.end method

.method private h()V
    .locals 2

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
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveStrokeTextView;->b:Landroid/graphics/Paint;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveStrokeTextView;->b:Landroid/graphics/Paint;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setDither(Z)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveStrokeTextView;->b:Landroid/graphics/Paint;

    .line 18
    .line 19
    sget-object v0, Landroid/graphics/Paint$Style;->FILL_AND_STROKE:Landroid/graphics/Paint$Style;

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 6

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
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {p0}, Landroid/widget/TextView;->getTypeface()Landroid/graphics/Typeface;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    if-eqz v2, :cond_0

    .line 18
    .line 19
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 20
    .line 21
    .line 22
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 27
    .line 28
    .line 29
    move-result v4

    .line 30
    sub-int/2addr v3, v4

    .line 31
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 32
    .line 33
    .line 34
    move-result v4

    .line 35
    sub-int/2addr v3, v4

    .line 36
    int-to-float v3, v3

    .line 37
    sget-object v4, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    .line 38
    .line 39
    invoke-static {v0, v1, v3, v4}, Landroid/text/TextUtils;->ellipsize(Ljava/lang/CharSequence;Landroid/text/TextPaint;FLandroid/text/TextUtils$TruncateAt;)Ljava/lang/CharSequence;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    if-eqz v2, :cond_1

    .line 48
    .line 49
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveStrokeTextView;->b:Landroid/graphics/Paint;

    .line 50
    .line 51
    invoke-virtual {v3, v2}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 52
    .line 53
    .line 54
    :cond_1
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveStrokeTextView;->b:Landroid/graphics/Paint;

    .line 55
    .line 56
    iget v3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveStrokeTextView;->e:I

    .line 57
    .line 58
    int-to-float v3, v3

    .line 59
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 60
    .line 61
    .line 62
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveStrokeTextView;->b:Landroid/graphics/Paint;

    .line 63
    .line 64
    iget v3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveStrokeTextView;->a:I

    .line 65
    .line 66
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 67
    .line 68
    .line 69
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveStrokeTextView;->b:Landroid/graphics/Paint;

    .line 70
    .line 71
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveStrokeTextView;->d:Landroid/graphics/CornerPathEffect;

    .line 72
    .line 73
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setPathEffect(Landroid/graphics/PathEffect;)Landroid/graphics/PathEffect;

    .line 74
    .line 75
    .line 76
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveStrokeTextView;->b:Landroid/graphics/Paint;

    .line 77
    .line 78
    invoke-virtual {p0}, Landroid/widget/TextView;->getTextSize()F

    .line 79
    .line 80
    .line 81
    move-result v3

    .line 82
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 83
    .line 84
    .line 85
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveStrokeTextView;->b:Landroid/graphics/Paint;

    .line 86
    .line 87
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 88
    .line 89
    .line 90
    move-result v3

    .line 91
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveStrokeTextView;->c:Landroid/graphics/Rect;

    .line 92
    .line 93
    const/4 v5, 0x0

    .line 94
    invoke-virtual {v2, v0, v5, v3, v4}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 95
    .line 96
    .line 97
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveStrokeTextView;->c:Landroid/graphics/Rect;

    .line 98
    .line 99
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    int-to-float v0, v0

    .line 104
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveStrokeTextView;->c:Landroid/graphics/Rect;

    .line 105
    .line 106
    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    .line 107
    .line 108
    .line 109
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 110
    .line 111
    .line 112
    move-result v2

    .line 113
    int-to-float v2, v2

    .line 114
    const/high16 v3, 0x40000000    # 2.0f

    .line 115
    .line 116
    div-float/2addr v2, v3

    .line 117
    div-float/2addr v0, v3

    .line 118
    sub-float/2addr v2, v0

    .line 119
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 120
    .line 121
    .line 122
    invoke-virtual {p0}, Landroid/view/View;->getBaseline()I

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    int-to-float v0, v0

    .line 127
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveStrokeTextView;->b:Landroid/graphics/Paint;

    .line 128
    .line 129
    invoke-virtual {p1, v1, v2, v0, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 130
    .line 131
    .line 132
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveStrokeTextView;->b:Landroid/graphics/Paint;

    .line 133
    .line 134
    invoke-virtual {p0}, Landroid/widget/TextView;->getCurrentTextColor()I

    .line 135
    .line 136
    .line 137
    move-result v3

    .line 138
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 139
    .line 140
    .line 141
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveStrokeTextView;->b:Landroid/graphics/Paint;

    .line 142
    .line 143
    const/4 v3, 0x0

    .line 144
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 145
    .line 146
    .line 147
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveStrokeTextView;->b:Landroid/graphics/Paint;

    .line 148
    .line 149
    const/4 v3, 0x0

    .line 150
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setPathEffect(Landroid/graphics/PathEffect;)Landroid/graphics/PathEffect;

    .line 151
    .line 152
    .line 153
    invoke-virtual {p0}, Landroid/view/View;->getBaseline()I

    .line 154
    .line 155
    .line 156
    move-result v0

    .line 157
    int-to-float v0, v0

    .line 158
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveStrokeTextView;->b:Landroid/graphics/Paint;

    .line 159
    .line 160
    invoke-virtual {p1, v1, v2, v0, p0}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 161
    .line 162
    .line 163
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveStrokeTextView;->h()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public setStrokeColor(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveStrokeTextView;->a:I

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setStrokeWidth(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveStrokeTextView;->e:I

    .line 2
    .line 3
    return-void
.end method
