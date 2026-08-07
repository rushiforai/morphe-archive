.class public Ll/qyh;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;Landroid/view/View;FFFF)Lcom/tantan/library/svga/SVGAnimationView;
    .locals 3

    .line 1
    new-instance v0, Lcom/tantan/library/svga/SVGAnimationView;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/tantan/library/svga/SVGAnimationView;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    new-instance p0, Landroid/graphics/Rect;

    .line 7
    .line 8
    invoke-direct {p0}, Landroid/graphics/Rect;-><init>()V

    .line 9
    .line 10
    .line 11
    new-instance v1, Landroid/graphics/Rect;

    .line 12
    .line 13
    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p2, p0}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1, v1}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    check-cast v2, Landroid/widget/FrameLayout$LayoutParams;

    .line 30
    .line 31
    invoke-static {p5}, Ll/qa00;->d(F)I

    .line 32
    .line 33
    .line 34
    move-result p5

    .line 35
    iput p5, v2, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 36
    .line 37
    invoke-static {p6}, Ll/qa00;->d(F)I

    .line 38
    .line 39
    .line 40
    move-result p5

    .line 41
    iput p5, v2, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 42
    .line 43
    invoke-virtual {v0, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 44
    .line 45
    .line 46
    iget p5, p0, Landroid/graphics/Rect;->top:I

    .line 47
    .line 48
    iget p6, v1, Landroid/graphics/Rect;->top:I

    .line 49
    .line 50
    sub-int/2addr p5, p6

    .line 51
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    iget p6, v1, Landroid/graphics/Rect;->top:I

    .line 56
    .line 57
    add-int/2addr p1, p6

    .line 58
    iget p6, v1, Landroid/graphics/Rect;->bottom:I

    .line 59
    .line 60
    sub-int/2addr p1, p6

    .line 61
    add-int/2addr p5, p1

    .line 62
    invoke-virtual {p2}, Landroid/view/View;->getHeight()I

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    iget p6, p0, Landroid/graphics/Rect;->top:I

    .line 67
    .line 68
    add-int/2addr p1, p6

    .line 69
    iget p6, p0, Landroid/graphics/Rect;->bottom:I

    .line 70
    .line 71
    sub-int/2addr p1, p6

    .line 72
    sub-int/2addr p5, p1

    .line 73
    invoke-virtual {p2}, Landroid/view/View;->getHeight()I

    .line 74
    .line 75
    .line 76
    move-result p1

    .line 77
    const/high16 p6, 0x42400000    # 48.0f

    .line 78
    .line 79
    invoke-static {p6}, Ll/qa00;->d(F)I

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    sub-int/2addr p1, v1

    .line 84
    div-int/lit8 p1, p1, 0x2

    .line 85
    .line 86
    add-int/2addr p5, p1

    .line 87
    int-to-float p1, p5

    .line 88
    add-float/2addr p1, p4

    .line 89
    invoke-virtual {v0, p1}, Landroid/view/View;->setY(F)V

    .line 90
    .line 91
    .line 92
    iget p0, p0, Landroid/graphics/Rect;->left:I

    .line 93
    .line 94
    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    .line 95
    .line 96
    .line 97
    move-result p1

    .line 98
    invoke-static {p6}, Ll/qa00;->d(F)I

    .line 99
    .line 100
    .line 101
    move-result p2

    .line 102
    sub-int/2addr p1, p2

    .line 103
    div-int/lit8 p1, p1, 0x2

    .line 104
    .line 105
    add-int/2addr p0, p1

    .line 106
    int-to-float p0, p0

    .line 107
    add-float/2addr p0, p3

    .line 108
    invoke-virtual {v0, p0}, Landroid/view/View;->setX(F)V

    .line 109
    .line 110
    .line 111
    return-object v0
.end method
