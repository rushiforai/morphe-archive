.class public Lcom/p1/mobile/putong/core/ui/messages/FixedAudioTextView;
.super Landroid/view/View;
.source "SourceFile"


# instance fields
.field public final a:I

.field public b:Ljava/lang/CharSequence;

.field public c:I

.field public d:I

.field public e:Landroid/graphics/Paint;

.field public f:Landroid/graphics/Rect;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const-string v0, "#8a000000"

    .line 5
    .line 6
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/messages/FixedAudioTextView;->a:I

    .line 11
    .line 12
    const-string v1, ""

    .line 13
    .line 14
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/FixedAudioTextView;->b:Ljava/lang/CharSequence;

    .line 15
    .line 16
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/messages/FixedAudioTextView;->c:I

    .line 17
    .line 18
    const/16 v0, 0xe

    .line 19
    .line 20
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/messages/FixedAudioTextView;->d:I

    .line 21
    .line 22
    new-instance v0, Landroid/graphics/Paint;

    .line 23
    .line 24
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 25
    .line 26
    .line 27
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/FixedAudioTextView;->e:Landroid/graphics/Paint;

    .line 28
    .line 29
    new-instance v0, Landroid/graphics/Rect;

    .line 30
    .line 31
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 32
    .line 33
    .line 34
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/FixedAudioTextView;->f:Landroid/graphics/Rect;

    .line 35
    .line 36
    const/4 v0, 0x0

    .line 37
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/messages/FixedAudioTextView;->a(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 41
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 42
    const-string v0, "#8a000000"

    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/p1/mobile/putong/core/ui/messages/FixedAudioTextView;->a:I

    .line 43
    const-string v1, ""

    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/FixedAudioTextView;->b:Ljava/lang/CharSequence;

    .line 44
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/messages/FixedAudioTextView;->c:I

    const/16 v0, 0xe

    .line 45
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/messages/FixedAudioTextView;->d:I

    .line 46
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/FixedAudioTextView;->e:Landroid/graphics/Paint;

    .line 47
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/FixedAudioTextView;->f:Landroid/graphics/Rect;

    .line 48
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/FixedAudioTextView;->a(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 49
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 50
    const-string p3, "#8a000000"

    invoke-static {p3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p3

    iput p3, p0, Lcom/p1/mobile/putong/core/ui/messages/FixedAudioTextView;->a:I

    .line 51
    const-string v0, ""

    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/FixedAudioTextView;->b:Ljava/lang/CharSequence;

    .line 52
    iput p3, p0, Lcom/p1/mobile/putong/core/ui/messages/FixedAudioTextView;->c:I

    const/16 p3, 0xe

    .line 53
    iput p3, p0, Lcom/p1/mobile/putong/core/ui/messages/FixedAudioTextView;->d:I

    .line 54
    new-instance p3, Landroid/graphics/Paint;

    invoke-direct {p3}, Landroid/graphics/Paint;-><init>()V

    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/FixedAudioTextView;->e:Landroid/graphics/Paint;

    .line 55
    new-instance p3, Landroid/graphics/Rect;

    invoke-direct {p3}, Landroid/graphics/Rect;-><init>()V

    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/FixedAudioTextView;->f:Landroid/graphics/Rect;

    .line 56
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/FixedAudioTextView;->a(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 1
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Ll/ohc0;->k:[I

    .line 8
    .line 9
    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    sget p2, Ll/ohc0;->l:I

    .line 14
    .line 15
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getText(I)Ljava/lang/CharSequence;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/FixedAudioTextView;->b:Ljava/lang/CharSequence;

    .line 20
    .line 21
    sget p2, Ll/ohc0;->m:I

    .line 22
    .line 23
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/FixedAudioTextView;->a:I

    .line 24
    .line 25
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 26
    .line 27
    .line 28
    move-result p2

    .line 29
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/messages/FixedAudioTextView;->c:I

    .line 30
    .line 31
    sget p2, Ll/ohc0;->n:I

    .line 32
    .line 33
    const/16 v0, 0xe

    .line 34
    .line 35
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 36
    .line 37
    .line 38
    move-result p2

    .line 39
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/messages/FixedAudioTextView;->d:I

    .line 40
    .line 41
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 42
    .line 43
    .line 44
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/FixedAudioTextView;->e:Landroid/graphics/Paint;

    .line 45
    .line 46
    const/4 p2, 0x1

    .line 47
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/FixedAudioTextView;->e:Landroid/graphics/Paint;

    .line 51
    .line 52
    iget p2, p0, Lcom/p1/mobile/putong/core/ui/messages/FixedAudioTextView;->c:I

    .line 53
    .line 54
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setColor(I)V

    .line 55
    .line 56
    .line 57
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/FixedAudioTextView;->e:Landroid/graphics/Paint;

    .line 58
    .line 59
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/messages/FixedAudioTextView;->d:I

    .line 60
    .line 61
    int-to-float p0, p0

    .line 62
    invoke-virtual {p1, p0}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 7

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/FixedAudioTextView;->b:Ljava/lang/CharSequence;

    .line 5
    .line 6
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/FixedAudioTextView;->e:Landroid/graphics/Paint;

    .line 21
    .line 22
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/FixedAudioTextView;->b:Ljava/lang/CharSequence;

    .line 23
    .line 24
    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/messages/FixedAudioTextView;->b:Ljava/lang/CharSequence;

    .line 29
    .line 30
    invoke-interface {v4}, Ljava/lang/CharSequence;->length()I

    .line 31
    .line 32
    .line 33
    move-result v4

    .line 34
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/messages/FixedAudioTextView;->f:Landroid/graphics/Rect;

    .line 35
    .line 36
    const/4 v6, 0x0

    .line 37
    invoke-virtual {v2, v3, v6, v4, v5}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 38
    .line 39
    .line 40
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/FixedAudioTextView;->f:Landroid/graphics/Rect;

    .line 41
    .line 42
    iget v3, v2, Landroid/graphics/Rect;->right:I

    .line 43
    .line 44
    iget v2, v2, Landroid/graphics/Rect;->left:I

    .line 45
    .line 46
    sub-int/2addr v3, v2

    .line 47
    sub-int/2addr v0, v3

    .line 48
    div-int/lit8 v0, v0, 0x2

    .line 49
    .line 50
    int-to-float v0, v0

    .line 51
    int-to-float v1, v1

    .line 52
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/FixedAudioTextView;->e:Landroid/graphics/Paint;

    .line 53
    .line 54
    invoke-virtual {v2}, Landroid/graphics/Paint;->descent()F

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    sub-float/2addr v1, v2

    .line 59
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/FixedAudioTextView;->e:Landroid/graphics/Paint;

    .line 60
    .line 61
    invoke-virtual {v2}, Landroid/graphics/Paint;->ascent()F

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    sub-float/2addr v1, v2

    .line 66
    const/high16 v2, 0x40000000    # 2.0f

    .line 67
    .line 68
    div-float/2addr v1, v2

    .line 69
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/FixedAudioTextView;->b:Ljava/lang/CharSequence;

    .line 70
    .line 71
    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/FixedAudioTextView;->e:Landroid/graphics/Paint;

    .line 76
    .line 77
    invoke-virtual {p1, v2, v0, v1, p0}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 78
    .line 79
    .line 80
    :cond_0
    return-void
.end method

.method public onMeasure(II)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/FixedAudioTextView;->b:Ljava/lang/CharSequence;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_5

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/FixedAudioTextView;->f:Landroid/graphics/Rect;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/graphics/Rect;->setEmpty()V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/FixedAudioTextView;->e:Landroid/graphics/Paint;

    .line 15
    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/FixedAudioTextView;->b:Ljava/lang/CharSequence;

    .line 17
    .line 18
    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/FixedAudioTextView;->b:Ljava/lang/CharSequence;

    .line 23
    .line 24
    invoke-interface {v2}, Ljava/lang/CharSequence;->length()I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/FixedAudioTextView;->f:Landroid/graphics/Rect;

    .line 29
    .line 30
    const/4 v4, 0x0

    .line 31
    invoke-virtual {v0, v1, v4, v2, v3}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/FixedAudioTextView;->f:Landroid/graphics/Rect;

    .line 35
    .line 36
    iget v1, v0, Landroid/graphics/Rect;->right:I

    .line 37
    .line 38
    iget v2, v0, Landroid/graphics/Rect;->left:I

    .line 39
    .line 40
    sub-int/2addr v1, v2

    .line 41
    iget v2, v0, Landroid/graphics/Rect;->bottom:I

    .line 42
    .line 43
    iget v0, v0, Landroid/graphics/Rect;->top:I

    .line 44
    .line 45
    sub-int/2addr v2, v0

    .line 46
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    const/high16 v3, -0x80000000

    .line 55
    .line 56
    if-eqz v0, :cond_1

    .line 57
    .line 58
    if-ne v0, v3, :cond_0

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_0
    move v1, p1

    .line 62
    goto :goto_1

    .line 63
    :cond_1
    :goto_0
    if-le p1, v1, :cond_0

    .line 64
    .line 65
    :goto_1
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 66
    .line 67
    .line 68
    move-result v4

    .line 69
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 70
    .line 71
    .line 72
    move-result p2

    .line 73
    if-eqz v4, :cond_2

    .line 74
    .line 75
    if-ne v4, v3, :cond_4

    .line 76
    .line 77
    :cond_2
    if-le p2, v2, :cond_3

    .line 78
    .line 79
    goto :goto_2

    .line 80
    :cond_3
    move v2, p1

    .line 81
    :goto_2
    move p2, v2

    .line 82
    :cond_4
    invoke-static {v1, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 83
    .line 84
    .line 85
    move-result p1

    .line 86
    invoke-static {p2, v4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 87
    .line 88
    .line 89
    move-result p2

    .line 90
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 91
    .line 92
    .line 93
    return-void

    .line 94
    :cond_5
    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    .line 95
    .line 96
    .line 97
    return-void
.end method

.method public setText(I)V
    .locals 1

    .line 1
    if-gtz p1, :cond_0

    .line 2
    .line 3
    const-string p1, ""

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/FixedAudioTextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/FixedAudioTextView;->setText(Ljava/lang/CharSequence;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public setText(Ljava/lang/CharSequence;)V
    .locals 1

    if-nez p1, :cond_0

    .line 21
    const-string p1, ""

    .line 22
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/FixedAudioTextView;->b:Ljava/lang/CharSequence;

    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    return-void

    .line 23
    :cond_1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/FixedAudioTextView;->b:Ljava/lang/CharSequence;

    .line 24
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void
.end method

.method public setTextColor(I)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/FixedAudioTextView;->c:I

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/FixedAudioTextView;->c:I

    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/FixedAudioTextView;->e:Landroid/graphics/Paint;

    .line 9
    .line 10
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public setTextSize(I)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/FixedAudioTextView;->d:I

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/FixedAudioTextView;->d:I

    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/FixedAudioTextView;->e:Landroid/graphics/Paint;

    .line 9
    .line 10
    int-to-float p1, p1

    .line 11
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 15
    .line 16
    .line 17
    return-void
.end method
