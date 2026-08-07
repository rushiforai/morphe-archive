.class public Ll/s2k0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/viewpager/widget/ViewPager$k;


# instance fields
.field public a:F


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/bnl0;->y0()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/high16 v1, 0x435a0000    # 218.0f

    .line 9
    .line 10
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    sub-int/2addr v0, v2

    .line 15
    div-int/lit8 v0, v0, 0x2

    .line 16
    .line 17
    int-to-float v0, v0

    .line 18
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    int-to-float v1, v1

    .line 23
    div-float/2addr v0, v1

    .line 24
    iput v0, p0, Ll/s2k0;->a:F

    .line 25
    .line 26
    return-void
.end method


# virtual methods
.method public a(Landroid/view/View;F)V
    .locals 8
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget v0, p0, Ll/s2k0;->a:F

    .line 2
    .line 3
    sub-float/2addr p2, v0

    .line 4
    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    float-to-double v0, v0

    .line 9
    const-wide v2, 0x3f847ae147ae147bL    # 0.01

    .line 10
    .line 11
    .line 12
    .line 13
    .line 14
    cmpg-double v0, v0, v2

    .line 15
    .line 16
    const/high16 v1, -0x40800000    # -1.0f

    .line 17
    .line 18
    const/high16 v4, 0x3f800000    # 1.0f

    .line 19
    .line 20
    const/4 v5, 0x0

    .line 21
    if-gtz v0, :cond_0

    .line 22
    .line 23
    move p2, v5

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    float-to-double v6, v0

    .line 30
    add-double/2addr v6, v2

    .line 31
    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    .line 32
    .line 33
    cmpl-double v0, v6, v2

    .line 34
    .line 35
    if-ltz v0, :cond_2

    .line 36
    .line 37
    cmpl-float p2, p2, v5

    .line 38
    .line 39
    if-lez p2, :cond_1

    .line 40
    .line 41
    move p2, v4

    .line 42
    goto :goto_0

    .line 43
    :cond_1
    move p2, v1

    .line 44
    :cond_2
    :goto_0
    cmpg-float v0, p2, v1

    .line 45
    .line 46
    const v1, 0x3f4ccccd    # 0.8f

    .line 47
    .line 48
    .line 49
    const v2, 0x3f19999a    # 0.6f

    .line 50
    .line 51
    .line 52
    if-gtz v0, :cond_3

    .line 53
    .line 54
    invoke-virtual {p1, v2}, Landroid/view/View;->setAlpha(F)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0, p1, v1}, Ll/s2k0;->d(Landroid/view/View;F)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_3
    cmpg-float v0, p2, v4

    .line 62
    .line 63
    if-gez v0, :cond_5

    .line 64
    .line 65
    cmpg-float v0, p2, v5

    .line 66
    .line 67
    if-gez v0, :cond_4

    .line 68
    .line 69
    invoke-virtual {p0, p2, v2}, Ll/s2k0;->c(FF)F

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p0, p2, v1}, Ll/s2k0;->c(FF)F

    .line 77
    .line 78
    .line 79
    move-result p2

    .line 80
    invoke-virtual {p0, p1, p2}, Ll/s2k0;->d(Landroid/view/View;F)V

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :cond_4
    invoke-virtual {p0, p2, v2}, Ll/s2k0;->b(FF)F

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {p0, p2, v1}, Ll/s2k0;->b(FF)F

    .line 92
    .line 93
    .line 94
    move-result p2

    .line 95
    invoke-virtual {p0, p1, p2}, Ll/s2k0;->d(Landroid/view/View;F)V

    .line 96
    .line 97
    .line 98
    return-void

    .line 99
    :cond_5
    invoke-virtual {p1, v2}, Landroid/view/View;->setAlpha(F)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {p0, p1, v1}, Ll/s2k0;->d(Landroid/view/View;F)V

    .line 103
    .line 104
    .line 105
    return-void
.end method

.method public final b(FF)F
    .locals 1

    .line 1
    const/high16 p0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    sub-float v0, p0, p2

    .line 4
    .line 5
    sub-float/2addr p0, p1

    .line 6
    mul-float/2addr v0, p0

    .line 7
    add-float/2addr p2, v0

    .line 8
    return p2
.end method

.method public final c(FF)F
    .locals 1

    .line 1
    const/high16 p0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    sub-float v0, p0, p2

    .line 4
    .line 5
    add-float/2addr p1, p0

    .line 6
    mul-float/2addr v0, p1

    .line 7
    add-float/2addr p2, v0

    .line 8
    return p2
.end method

.method public final d(Landroid/view/View;F)V
    .locals 0

    .line 1
    invoke-virtual {p1, p2}, Landroid/view/View;->setScaleX(F)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1, p2}, Landroid/view/View;->setScaleY(F)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
