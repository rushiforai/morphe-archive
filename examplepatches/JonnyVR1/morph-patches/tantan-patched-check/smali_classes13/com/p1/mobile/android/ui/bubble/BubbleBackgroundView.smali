.class public Lcom/p1/mobile/android/ui/bubble/BubbleBackgroundView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/graphics/Paint;

.field public b:Landroid/graphics/Paint;

.field public c:I

.field public d:Landroid/graphics/Rect;

.field public e:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/bubble/BubbleBackgroundView;->a()V

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 2

    .line 1
    new-instance v0, Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/android/ui/bubble/BubbleBackgroundView;->a:Landroid/graphics/Paint;

    .line 7
    .line 8
    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 11
    .line 12
    .line 13
    new-instance v0, Landroid/graphics/Paint;

    .line 14
    .line 15
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lcom/p1/mobile/android/ui/bubble/BubbleBackgroundView;->b:Landroid/graphics/Paint;

    .line 19
    .line 20
    const/4 p0, 0x1

    .line 21
    invoke-virtual {v0, p0}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 8
    .param p1    # Landroid/graphics/Canvas;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/android/ui/bubble/BubbleBackgroundView;->a:Landroid/graphics/Paint;

    .line 5
    .line 6
    iget v1, p0, Lcom/p1/mobile/android/ui/bubble/BubbleBackgroundView;->c:I

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    int-to-float v4, v0

    .line 16
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    int-to-float v5, v0

    .line 21
    const/4 v6, 0x0

    .line 22
    const/16 v7, 0x1f

    .line 23
    .line 24
    const/4 v2, 0x0

    .line 25
    const/4 v3, 0x0

    .line 26
    move-object v1, p1

    .line 27
    invoke-virtual/range {v1 .. v7}, Landroid/graphics/Canvas;->saveLayer(FFFFLandroid/graphics/Paint;I)I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    move-object v0, v1

    .line 32
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    int-to-float v3, v1

    .line 37
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    int-to-float v4, v1

    .line 42
    iget-object v5, p0, Lcom/p1/mobile/android/ui/bubble/BubbleBackgroundView;->a:Landroid/graphics/Paint;

    .line 43
    .line 44
    const/4 v1, 0x0

    .line 45
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 46
    .line 47
    .line 48
    iget-object v1, p0, Lcom/p1/mobile/android/ui/bubble/BubbleBackgroundView;->b:Landroid/graphics/Paint;

    .line 49
    .line 50
    new-instance v2, Landroid/graphics/PorterDuffXfermode;

    .line 51
    .line 52
    sget-object v3, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    .line 53
    .line 54
    invoke-direct {v2, v3}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 58
    .line 59
    .line 60
    new-instance v1, Landroid/graphics/RectF;

    .line 61
    .line 62
    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    .line 63
    .line 64
    .line 65
    iget-object v2, p0, Lcom/p1/mobile/android/ui/bubble/BubbleBackgroundView;->d:Landroid/graphics/Rect;

    .line 66
    .line 67
    iget v3, v2, Landroid/graphics/Rect;->top:I

    .line 68
    .line 69
    int-to-float v3, v3

    .line 70
    iput v3, v1, Landroid/graphics/RectF;->top:F

    .line 71
    .line 72
    iget v3, v2, Landroid/graphics/Rect;->left:I

    .line 73
    .line 74
    int-to-float v3, v3

    .line 75
    iput v3, v1, Landroid/graphics/RectF;->left:F

    .line 76
    .line 77
    iget v3, v2, Landroid/graphics/Rect;->right:I

    .line 78
    .line 79
    int-to-float v3, v3

    .line 80
    iput v3, v1, Landroid/graphics/RectF;->right:F

    .line 81
    .line 82
    iget v2, v2, Landroid/graphics/Rect;->bottom:I

    .line 83
    .line 84
    int-to-float v2, v2

    .line 85
    iput v2, v1, Landroid/graphics/RectF;->bottom:F

    .line 86
    .line 87
    iget v2, p0, Lcom/p1/mobile/android/ui/bubble/BubbleBackgroundView;->e:I

    .line 88
    .line 89
    int-to-float v2, v2

    .line 90
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 91
    .line 92
    .line 93
    move-result v2

    .line 94
    int-to-float v2, v2

    .line 95
    iget v3, p0, Lcom/p1/mobile/android/ui/bubble/BubbleBackgroundView;->e:I

    .line 96
    .line 97
    int-to-float v3, v3

    .line 98
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 99
    .line 100
    .line 101
    move-result v3

    .line 102
    int-to-float v3, v3

    .line 103
    iget-object v4, p0, Lcom/p1/mobile/android/ui/bubble/BubbleBackgroundView;->b:Landroid/graphics/Paint;

    .line 104
    .line 105
    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 106
    .line 107
    .line 108
    iget-object p0, p0, Lcom/p1/mobile/android/ui/bubble/BubbleBackgroundView;->b:Landroid/graphics/Paint;

    .line 109
    .line 110
    const/4 v1, 0x0

    .line 111
    invoke-virtual {p0, v1}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 112
    .line 113
    .line 114
    invoke-virtual {v0, p1}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 115
    .line 116
    .line 117
    return-void
.end method

.method public setBackgroundPaintColor(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/android/ui/bubble/BubbleBackgroundView;->c:I

    .line 2
    .line 3
    return-void
.end method

.method public setTargetViewRadius(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/android/ui/bubble/BubbleBackgroundView;->e:I

    .line 2
    .line 3
    return-void
.end method

.method public setTargetViewRect(Landroid/graphics/Rect;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/android/ui/bubble/BubbleBackgroundView;->d:Landroid/graphics/Rect;

    .line 2
    .line 3
    return-void
.end method
