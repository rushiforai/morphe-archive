.class public Ll/bd4;
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

.method public static a(Landroid/graphics/Rect;Landroid/graphics/Rect;I)Z
    .locals 5

    .line 1
    invoke-virtual {p0}, Landroid/graphics/Rect;->width()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    invoke-virtual {p0}, Landroid/graphics/Rect;->height()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    int-to-float v1, v1

    .line 11
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    int-to-float v2, v2

    .line 16
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    int-to-float v3, v3

    .line 21
    sub-float/2addr v2, v0

    .line 22
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    int-to-float v2, p2

    .line 27
    cmpl-float v0, v0, v2

    .line 28
    .line 29
    const/4 v4, 0x1

    .line 30
    if-gtz v0, :cond_2

    .line 31
    .line 32
    sub-float/2addr v3, v1

    .line 33
    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    cmpl-float v0, v0, v2

    .line 38
    .line 39
    if-lez v0, :cond_0

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    iget v0, p0, Landroid/graphics/Rect;->left:I

    .line 43
    .line 44
    iget v1, p1, Landroid/graphics/Rect;->left:I

    .line 45
    .line 46
    sub-int/2addr v0, v1

    .line 47
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-gt v0, p2, :cond_2

    .line 52
    .line 53
    iget v0, p0, Landroid/graphics/Rect;->right:I

    .line 54
    .line 55
    iget v1, p1, Landroid/graphics/Rect;->right:I

    .line 56
    .line 57
    sub-int/2addr v0, v1

    .line 58
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-gt v0, p2, :cond_2

    .line 63
    .line 64
    iget v0, p0, Landroid/graphics/Rect;->top:I

    .line 65
    .line 66
    iget v1, p1, Landroid/graphics/Rect;->top:I

    .line 67
    .line 68
    sub-int/2addr v0, v1

    .line 69
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-gt v0, p2, :cond_2

    .line 74
    .line 75
    iget p0, p0, Landroid/graphics/Rect;->bottom:I

    .line 76
    .line 77
    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    .line 78
    .line 79
    sub-int/2addr p0, p1

    .line 80
    invoke-static {p0}, Ljava/lang/Math;->abs(I)I

    .line 81
    .line 82
    .line 83
    move-result p0

    .line 84
    if-le p0, p2, :cond_1

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_1
    const/4 p0, 0x0

    .line 88
    return p0

    .line 89
    :cond_2
    :goto_0
    return v4
.end method
