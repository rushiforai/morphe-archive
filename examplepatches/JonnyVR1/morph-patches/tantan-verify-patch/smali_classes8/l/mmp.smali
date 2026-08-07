.class public Ll/mmp;
.super Landroid/view/ViewOutlineProvider;
.source "SourceFile"


# instance fields
.field public final a:F

.field public b:I


# direct methods
.method public constructor <init>(F)V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroid/view/ViewOutlineProvider;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/mmp;->b:I

    .line 6
    .line 7
    iput p1, p0, Ll/mmp;->a:F

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(FI)V
    .locals 0

    .line 10
    invoke-direct {p0}, Landroid/view/ViewOutlineProvider;-><init>()V

    .line 11
    iput p1, p0, Ll/mmp;->a:F

    .line 12
    iput p2, p0, Ll/mmp;->b:I

    return-void
.end method


# virtual methods
.method public getOutline(Landroid/view/View;Landroid/graphics/Outline;)V
    .locals 6

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    .line 7
    .line 8
    .line 9
    iget p1, p0, Ll/mmp;->b:I

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    if-nez p1, :cond_0

    .line 13
    .line 14
    new-instance p1, Landroid/graphics/Rect;

    .line 15
    .line 16
    iget v2, v0, Landroid/graphics/Rect;->right:I

    .line 17
    .line 18
    iget v3, v0, Landroid/graphics/Rect;->left:I

    .line 19
    .line 20
    sub-int/2addr v2, v3

    .line 21
    iget v3, v0, Landroid/graphics/Rect;->bottom:I

    .line 22
    .line 23
    iget v0, v0, Landroid/graphics/Rect;->top:I

    .line 24
    .line 25
    sub-int/2addr v3, v0

    .line 26
    invoke-direct {p1, v1, v1, v2, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 27
    .line 28
    .line 29
    iget p0, p0, Ll/mmp;->a:F

    .line 30
    .line 31
    invoke-virtual {p2, p1, p0}, Landroid/graphics/Outline;->setRoundRect(Landroid/graphics/Rect;F)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    iget v2, v0, Landroid/graphics/Rect;->bottom:I

    .line 36
    .line 37
    iget v3, v0, Landroid/graphics/Rect;->top:I

    .line 38
    .line 39
    sub-int/2addr v2, v3

    .line 40
    iget v3, v0, Landroid/graphics/Rect;->right:I

    .line 41
    .line 42
    iget v0, v0, Landroid/graphics/Rect;->left:I

    .line 43
    .line 44
    sub-int/2addr v3, v0

    .line 45
    const/4 v0, 0x1

    .line 46
    if-ne p1, v0, :cond_2

    .line 47
    .line 48
    int-to-float p1, v3

    .line 49
    iget v0, p0, Ll/mmp;->a:F

    .line 50
    .line 51
    add-float/2addr p1, v0

    .line 52
    float-to-int v3, p1

    .line 53
    :cond_1
    :goto_0
    move p1, v1

    .line 54
    goto :goto_1

    .line 55
    :cond_2
    const/4 v0, 0x2

    .line 56
    if-ne p1, v0, :cond_3

    .line 57
    .line 58
    int-to-float p1, v2

    .line 59
    iget v0, p0, Ll/mmp;->a:F

    .line 60
    .line 61
    add-float/2addr p1, v0

    .line 62
    float-to-int v2, p1

    .line 63
    goto :goto_0

    .line 64
    :cond_3
    const/4 v0, 0x3

    .line 65
    const/4 v4, 0x0

    .line 66
    if-ne p1, v0, :cond_4

    .line 67
    .line 68
    iget p1, p0, Ll/mmp;->a:F

    .line 69
    .line 70
    sub-float/2addr v4, p1

    .line 71
    float-to-int p1, v4

    .line 72
    move v5, v1

    .line 73
    move v1, p1

    .line 74
    move p1, v5

    .line 75
    goto :goto_1

    .line 76
    :cond_4
    const/4 v0, 0x4

    .line 77
    if-ne p1, v0, :cond_1

    .line 78
    .line 79
    iget p1, p0, Ll/mmp;->a:F

    .line 80
    .line 81
    sub-float/2addr v4, p1

    .line 82
    float-to-int p1, v4

    .line 83
    :goto_1
    new-instance v0, Landroid/graphics/Rect;

    .line 84
    .line 85
    invoke-direct {v0, v1, p1, v3, v2}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 86
    .line 87
    .line 88
    iget p0, p0, Ll/mmp;->a:F

    .line 89
    .line 90
    invoke-virtual {p2, v0, p0}, Landroid/graphics/Outline;->setRoundRect(Landroid/graphics/Rect;F)V

    .line 91
    .line 92
    .line 93
    return-void
.end method
