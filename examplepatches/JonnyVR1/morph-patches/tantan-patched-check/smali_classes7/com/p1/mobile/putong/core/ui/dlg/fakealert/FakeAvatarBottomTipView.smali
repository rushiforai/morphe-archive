.class public Lcom/p1/mobile/putong/core/ui/dlg/fakealert/FakeAvatarBottomTipView;
.super Landroid/view/View;
.source "SourceFile"


# instance fields
.field public a:I

.field public b:I

.field public c:Landroid/graphics/Bitmap;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 9
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/dlg/fakealert/FakeAvatarBottomTipView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 8
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/dlg/fakealert/FakeAvatarBottomTipView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

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
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/dlg/fakealert/FakeAvatarBottomTipView;->a(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 4

    .line 1
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    sget-object v0, Ll/khc0;->B0:[I

    .line 9
    .line 10
    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    sget p2, Ll/khc0;->D0:I

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 18
    .line 19
    .line 20
    move-result p2

    .line 21
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/dlg/fakealert/FakeAvatarBottomTipView;->a:I

    .line 22
    .line 23
    sget p2, Ll/khc0;->E0:I

    .line 24
    .line 25
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 26
    .line 27
    .line 28
    move-result p2

    .line 29
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/dlg/fakealert/FakeAvatarBottomTipView;->b:I

    .line 30
    .line 31
    sget p2, Ll/khc0;->C0:I

    .line 32
    .line 33
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 34
    .line 35
    .line 36
    move-result p2

    .line 37
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 38
    .line 39
    .line 40
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/dlg/fakealert/FakeAvatarBottomTipView;->b:I

    .line 41
    .line 42
    if-nez p1, :cond_1

    .line 43
    .line 44
    :goto_0
    return-void

    .line 45
    :cond_1
    new-instance p1, Landroid/graphics/RectF;

    .line 46
    .line 47
    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    .line 48
    .line 49
    .line 50
    new-instance v0, Landroid/graphics/Paint;

    .line 51
    .line 52
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 53
    .line 54
    .line 55
    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 56
    .line 57
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/dlg/fakealert/FakeAvatarBottomTipView;->b:I

    .line 58
    .line 59
    mul-int/lit8 v3, v2, 0x2

    .line 60
    .line 61
    mul-int/lit8 v2, v2, 0x2

    .line 62
    .line 63
    invoke-static {v3, v2, v1}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/dlg/fakealert/FakeAvatarBottomTipView;->c:Landroid/graphics/Bitmap;

    .line 68
    .line 69
    new-instance v1, Landroid/graphics/Canvas;

    .line 70
    .line 71
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/dlg/fakealert/FakeAvatarBottomTipView;->c:Landroid/graphics/Bitmap;

    .line 72
    .line 73
    invoke-direct {v1, v2}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 74
    .line 75
    .line 76
    const/4 v2, 0x1

    .line 77
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setDither(Z)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {v0, p2}, Landroid/graphics/Paint;->setColor(I)V

    .line 84
    .line 85
    .line 86
    const/4 p2, 0x0

    .line 87
    invoke-virtual {v0, p2}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 88
    .line 89
    .line 90
    iget p2, p0, Lcom/p1/mobile/putong/core/ui/dlg/fakealert/FakeAvatarBottomTipView;->b:I

    .line 91
    .line 92
    int-to-float v2, p2

    .line 93
    int-to-float v3, p2

    .line 94
    int-to-float p2, p2

    .line 95
    invoke-virtual {v1, v2, v3, p2, v0}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 96
    .line 97
    .line 98
    new-instance p2, Landroid/graphics/PorterDuffXfermode;

    .line 99
    .line 100
    sget-object v2, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    .line 101
    .line 102
    invoke-direct {p2, v2}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {v0, p2}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 106
    .line 107
    .line 108
    const/4 p2, 0x0

    .line 109
    iput p2, p1, Landroid/graphics/RectF;->left:F

    .line 110
    .line 111
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/dlg/fakealert/FakeAvatarBottomTipView;->b:I

    .line 112
    .line 113
    mul-int/lit8 v3, v2, 0x2

    .line 114
    .line 115
    int-to-float v3, v3

    .line 116
    iput v3, p1, Landroid/graphics/RectF;->right:F

    .line 117
    .line 118
    iput p2, p1, Landroid/graphics/RectF;->top:F

    .line 119
    .line 120
    mul-int/lit8 v2, v2, 0x2

    .line 121
    .line 122
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/dlg/fakealert/FakeAvatarBottomTipView;->a:I

    .line 123
    .line 124
    sub-int/2addr v2, p0

    .line 125
    int-to-float p0, v2

    .line 126
    iput p0, p1, Landroid/graphics/RectF;->bottom:F

    .line 127
    .line 128
    invoke-virtual {v1, p1, v0}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 129
    .line 130
    .line 131
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-lez v0, :cond_1

    .line 10
    .line 11
    if-lez v1, :cond_1

    .line 12
    .line 13
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/dlg/fakealert/FakeAvatarBottomTipView;->a:I

    .line 14
    .line 15
    if-eqz v2, :cond_1

    .line 16
    .line 17
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/dlg/fakealert/FakeAvatarBottomTipView;->b:I

    .line 18
    .line 19
    if-nez v2, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    div-int/lit8 v1, v1, 0x2

    .line 23
    .line 24
    sub-int/2addr v1, v2

    .line 25
    mul-int/lit8 v2, v2, 0x2

    .line 26
    .line 27
    sub-int/2addr v0, v2

    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/dlg/fakealert/FakeAvatarBottomTipView;->c:Landroid/graphics/Bitmap;

    .line 29
    .line 30
    int-to-float v1, v1

    .line 31
    int-to-float v0, v0

    .line 32
    const/4 v2, 0x0

    .line 33
    invoke-virtual {p1, p0, v1, v0, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 34
    .line 35
    .line 36
    :cond_1
    :goto_0
    return-void
.end method
