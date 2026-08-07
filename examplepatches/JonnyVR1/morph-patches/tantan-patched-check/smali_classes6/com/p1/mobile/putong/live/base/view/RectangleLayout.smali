.class public Lcom/p1/mobile/putong/live/base/view/RectangleLayout;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:I

.field public final c:I

.field public final d:I

.field public final e:Landroid/graphics/Path;

.field public final f:[F


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 8
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/graphics/Path;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/view/RectangleLayout;->e:Landroid/graphics/Path;

    .line 10
    .line 11
    sget-object v0, Ll/thc0;->F:[I

    .line 12
    .line 13
    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    sget p2, Ll/thc0;->I:I

    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 21
    .line 22
    .line 23
    move-result p2

    .line 24
    sget v1, Ll/thc0;->J:I

    .line 25
    .line 26
    invoke-virtual {p1, v1, p2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    iput v1, p0, Lcom/p1/mobile/putong/live/base/view/RectangleLayout;->a:I

    .line 31
    .line 32
    sget v2, Ll/thc0;->K:I

    .line 33
    .line 34
    invoke-virtual {p1, v2, p2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    iput v2, p0, Lcom/p1/mobile/putong/live/base/view/RectangleLayout;->b:I

    .line 39
    .line 40
    sget v3, Ll/thc0;->G:I

    .line 41
    .line 42
    invoke-virtual {p1, v3, p2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    iput v3, p0, Lcom/p1/mobile/putong/live/base/view/RectangleLayout;->c:I

    .line 47
    .line 48
    sget v4, Ll/thc0;->H:I

    .line 49
    .line 50
    invoke-virtual {p1, v4, p2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 51
    .line 52
    .line 53
    move-result p2

    .line 54
    iput p2, p0, Lcom/p1/mobile/putong/live/base/view/RectangleLayout;->d:I

    .line 55
    .line 56
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 57
    .line 58
    .line 59
    int-to-float p1, v1

    .line 60
    int-to-float v1, v1

    .line 61
    int-to-float v4, v2

    .line 62
    int-to-float v2, v2

    .line 63
    int-to-float v5, p2

    .line 64
    int-to-float p2, p2

    .line 65
    int-to-float v6, v3

    .line 66
    int-to-float v3, v3

    .line 67
    const/16 v7, 0x8

    .line 68
    .line 69
    new-array v7, v7, [F

    .line 70
    .line 71
    aput p1, v7, v0

    .line 72
    .line 73
    const/4 p1, 0x1

    .line 74
    aput v1, v7, p1

    .line 75
    .line 76
    const/4 p1, 0x2

    .line 77
    aput v4, v7, p1

    .line 78
    .line 79
    const/4 p1, 0x3

    .line 80
    aput v2, v7, p1

    .line 81
    .line 82
    const/4 p1, 0x4

    .line 83
    aput v5, v7, p1

    .line 84
    .line 85
    const/4 p1, 0x5

    .line 86
    aput p2, v7, p1

    .line 87
    .line 88
    const/4 p1, 0x6

    .line 89
    aput v6, v7, p1

    .line 90
    .line 91
    const/4 p1, 0x7

    .line 92
    aput v3, v7, p1

    .line 93
    .line 94
    iput-object v7, p0, Lcom/p1/mobile/putong/live/base/view/RectangleLayout;->f:[F

    .line 95
    .line 96
    return-void
.end method


# virtual methods
.method public final a(Landroid/graphics/Canvas;)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/RectangleLayout;->e:Landroid/graphics/Path;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/view/RectangleLayout;->e:Landroid/graphics/Path;

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    int-to-float v4, v0

    .line 13
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    int-to-float v5, v0

    .line 18
    iget-object v6, p0, Lcom/p1/mobile/putong/live/base/view/RectangleLayout;->f:[F

    .line 19
    .line 20
    sget-object v7, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    .line 21
    .line 22
    const/4 v2, 0x0

    .line 23
    const/4 v3, 0x0

    .line 24
    invoke-virtual/range {v1 .. v7}, Landroid/graphics/Path;->addRoundRect(FFFF[FLandroid/graphics/Path$Direction;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/view/RectangleLayout;->e:Landroid/graphics/Path;

    .line 28
    .line 29
    invoke-virtual {p1, p0}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;)Z

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/live/base/view/RectangleLayout;->a:I

    .line 2
    .line 3
    iget v1, p0, Lcom/p1/mobile/putong/live/base/view/RectangleLayout;->b:I

    .line 4
    .line 5
    add-int/2addr v0, v1

    .line 6
    iget v1, p0, Lcom/p1/mobile/putong/live/base/view/RectangleLayout;->c:I

    .line 7
    .line 8
    add-int/2addr v0, v1

    .line 9
    iget v1, p0, Lcom/p1/mobile/putong/live/base/view/RectangleLayout;->d:I

    .line 10
    .line 11
    add-int/2addr v0, v1

    .line 12
    if-lez v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/view/RectangleLayout;->a(Landroid/graphics/Canvas;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    invoke-super {p0, p1}, Landroid/view/View;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method
