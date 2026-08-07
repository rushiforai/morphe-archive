.class public Ll/zgx;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:I

.field public b:I

.field public c:I

.field public d:I


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


# virtual methods
.method public a()V
    .locals 1

    .line 1
    iget v0, p0, Ll/zgx;->c:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/zgx;->b(I)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iput v0, p0, Ll/zgx;->d:I

    .line 8
    .line 9
    return-void
.end method

.method public final b(I)I
    .locals 8

    .line 1
    const/16 v0, 0x64

    .line 2
    .line 3
    if-gez p1, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    if-le p1, v0, :cond_1

    .line 8
    .line 9
    move p1, v0

    .line 10
    :cond_1
    :goto_0
    iget v1, p0, Ll/zgx;->a:I

    .line 11
    .line 12
    invoke-static {v1}, Landroid/graphics/Color;->red(I)I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    iget v2, p0, Ll/zgx;->a:I

    .line 17
    .line 18
    invoke-static {v2}, Landroid/graphics/Color;->green(I)I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    iget v3, p0, Ll/zgx;->a:I

    .line 23
    .line 24
    invoke-static {v3}, Landroid/graphics/Color;->blue(I)I

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    iget v4, p0, Ll/zgx;->a:I

    .line 29
    .line 30
    invoke-static {v4}, Landroid/graphics/Color;->alpha(I)I

    .line 31
    .line 32
    .line 33
    move-result v4

    .line 34
    iget v5, p0, Ll/zgx;->b:I

    .line 35
    .line 36
    invoke-static {v5}, Landroid/graphics/Color;->red(I)I

    .line 37
    .line 38
    .line 39
    move-result v5

    .line 40
    iget v6, p0, Ll/zgx;->b:I

    .line 41
    .line 42
    invoke-static {v6}, Landroid/graphics/Color;->green(I)I

    .line 43
    .line 44
    .line 45
    move-result v6

    .line 46
    iget v7, p0, Ll/zgx;->b:I

    .line 47
    .line 48
    invoke-static {v7}, Landroid/graphics/Color;->blue(I)I

    .line 49
    .line 50
    .line 51
    move-result v7

    .line 52
    iget p0, p0, Ll/zgx;->b:I

    .line 53
    .line 54
    invoke-static {p0}, Landroid/graphics/Color;->alpha(I)I

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    sub-int/2addr v5, v1

    .line 59
    sub-int/2addr v6, v2

    .line 60
    sub-int/2addr v7, v3

    .line 61
    sub-int/2addr p0, v4

    .line 62
    mul-int/2addr v5, p1

    .line 63
    div-int/2addr v5, v0

    .line 64
    add-int/2addr v1, v5

    .line 65
    mul-int/2addr v6, p1

    .line 66
    div-int/2addr v6, v0

    .line 67
    add-int/2addr v2, v6

    .line 68
    mul-int/2addr v7, p1

    .line 69
    div-int/2addr v7, v0

    .line 70
    add-int/2addr v3, v7

    .line 71
    mul-int/2addr p1, p0

    .line 72
    div-int/2addr p1, v0

    .line 73
    add-int/2addr v4, p1

    .line 74
    invoke-static {v4, v1, v2, v3}, Landroid/graphics/Color;->argb(IIII)I

    .line 75
    .line 76
    .line 77
    move-result p0

    .line 78
    return p0
.end method

.method public c()I
    .locals 0

    .line 1
    iget p0, p0, Ll/zgx;->d:I

    .line 2
    .line 3
    return p0
.end method

.method public d(II)V
    .locals 0

    .line 1
    iput p1, p0, Ll/zgx;->a:I

    .line 2
    .line 3
    iput p2, p0, Ll/zgx;->b:I

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/zgx;->a()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public e(III)V
    .locals 0

    .line 1
    iput p2, p0, Ll/zgx;->a:I

    .line 2
    .line 3
    iput p3, p0, Ll/zgx;->b:I

    .line 4
    .line 5
    iput p1, p0, Ll/zgx;->c:I

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/zgx;->a()V

    .line 8
    .line 9
    .line 10
    return-void
.end method
