.class public Ll/ss30;
.super Ll/ts30;
.source "SourceFile"


# instance fields
.field private I:I

.field private J:I

.field private K:I

.field private L:I

.field private M:I

.field private N:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/ts30;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Ll/ss30;->I:I

    .line 6
    .line 7
    iput v0, p0, Ll/ss30;->J:I

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public G()I
    .locals 2

    .line 1
    iget v0, p0, Ll/xej;->a:I

    .line 2
    .line 3
    rem-int/lit8 v0, v0, 0x2

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    iget p0, p0, Ll/ss30;->M:I

    .line 9
    .line 10
    return p0

    .line 11
    :cond_0
    iget p0, p0, Ll/ss30;->N:I

    .line 12
    .line 13
    return p0
.end method

.method public H()I
    .locals 2

    .line 1
    iget v0, p0, Ll/xej;->a:I

    .line 2
    .line 3
    rem-int/lit8 v0, v0, 0x2

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    iget p0, p0, Ll/ss30;->N:I

    .line 9
    .line 10
    return p0

    .line 11
    :cond_0
    iget p0, p0, Ll/ss30;->M:I

    .line 12
    .line 13
    return p0
.end method

.method public Q()I
    .locals 0

    .line 1
    iget p0, p0, Ll/ss30;->N:I

    .line 2
    .line 3
    div-int/lit8 p0, p0, 0x2

    .line 4
    .line 5
    return p0
.end method

.method public R()I
    .locals 0

    .line 1
    iget p0, p0, Ll/ss30;->M:I

    .line 2
    .line 3
    div-int/lit8 p0, p0, 0x2

    .line 4
    .line 5
    return p0
.end method

.method public S(I)[F
    .locals 7

    .line 1
    iget v0, p0, Ll/ss30;->M:I

    .line 2
    .line 3
    iget v1, p0, Ll/ss30;->N:I

    .line 4
    .line 5
    iget v2, p0, Ll/ss30;->J:I

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    const/high16 v4, 0x3f800000    # 1.0f

    .line 9
    .line 10
    if-ltz v2, :cond_0

    .line 11
    .line 12
    if-lt v2, v0, :cond_1

    .line 13
    .line 14
    :cond_0
    iget v5, p0, Ll/ss30;->I:I

    .line 15
    .line 16
    if-ltz v5, :cond_2

    .line 17
    .line 18
    if-ge v5, v1, :cond_2

    .line 19
    .line 20
    :cond_1
    int-to-float v2, v2

    .line 21
    mul-float/2addr v2, v4

    .line 22
    int-to-float v0, v0

    .line 23
    div-float/2addr v2, v0

    .line 24
    invoke-static {v2, v4}, Ljava/lang/Math;->min(FF)F

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    iget v5, p0, Ll/ss30;->J:I

    .line 29
    .line 30
    iget v6, p0, Ll/ss30;->K:I

    .line 31
    .line 32
    add-int/2addr v5, v6

    .line 33
    int-to-float v5, v5

    .line 34
    mul-float/2addr v5, v4

    .line 35
    div-float/2addr v5, v0

    .line 36
    sub-float v0, v4, v5

    .line 37
    .line 38
    invoke-static {v0, v4}, Ljava/lang/Math;->min(FF)F

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    iget v5, p0, Ll/ss30;->I:I

    .line 43
    .line 44
    int-to-float v5, v5

    .line 45
    mul-float/2addr v5, v4

    .line 46
    int-to-float v1, v1

    .line 47
    div-float/2addr v5, v1

    .line 48
    invoke-static {v5, v4}, Ljava/lang/Math;->min(FF)F

    .line 49
    .line 50
    .line 51
    move-result v5

    .line 52
    iget v6, p0, Ll/ss30;->I:I

    .line 53
    .line 54
    iget p0, p0, Ll/ss30;->L:I

    .line 55
    .line 56
    add-int/2addr v6, p0

    .line 57
    int-to-float p0, v6

    .line 58
    mul-float/2addr p0, v4

    .line 59
    div-float/2addr p0, v1

    .line 60
    sub-float p0, v4, p0

    .line 61
    .line 62
    invoke-static {p0, v4}, Ljava/lang/Math;->min(FF)F

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    goto :goto_0

    .line 67
    :cond_2
    move p0, v3

    .line 68
    move v0, p0

    .line 69
    move v2, v0

    .line 70
    move v5, v2

    .line 71
    :goto_0
    add-float/2addr v2, v3

    .line 72
    sub-float v0, v4, v0

    .line 73
    .line 74
    add-float/2addr v5, v3

    .line 75
    sub-float p0, v4, p0

    .line 76
    .line 77
    const/4 v1, 0x2

    .line 78
    const/4 v6, 0x1

    .line 79
    if-eqz p1, :cond_5

    .line 80
    .line 81
    if-eq p1, v6, :cond_4

    .line 82
    .line 83
    if-eq p1, v1, :cond_3

    .line 84
    .line 85
    move v0, v3

    .line 86
    move v2, v4

    .line 87
    goto :goto_2

    .line 88
    :cond_3
    :goto_1
    move v3, p0

    .line 89
    move v4, v5

    .line 90
    goto :goto_2

    .line 91
    :cond_4
    move v3, v2

    .line 92
    move v2, v0

    .line 93
    move v0, v3

    .line 94
    goto :goto_1

    .line 95
    :cond_5
    move v4, p0

    .line 96
    move v3, v5

    .line 97
    :goto_2
    const/4 p0, 0x4

    .line 98
    new-array p0, p0, [F

    .line 99
    .line 100
    const/4 p1, 0x0

    .line 101
    aput v3, p0, p1

    .line 102
    .line 103
    aput v4, p0, v6

    .line 104
    .line 105
    aput v0, p0, v1

    .line 106
    .line 107
    const/4 p1, 0x3

    .line 108
    aput v2, p0, p1

    .line 109
    .line 110
    return-object p0
.end method

.method public T()I
    .locals 0

    .line 1
    iget p0, p0, Ll/ss30;->N:I

    .line 2
    .line 3
    return p0
.end method

.method public U()I
    .locals 0

    .line 1
    iget p0, p0, Ll/ss30;->M:I

    .line 2
    .line 3
    return p0
.end method

.method public W(IIIIII)V
    .locals 0

    .line 1
    iput p1, p0, Ll/ss30;->J:I

    .line 2
    .line 3
    iput p2, p0, Ll/ss30;->I:I

    .line 4
    .line 5
    iput p3, p0, Ll/ss30;->K:I

    .line 6
    .line 7
    iput p4, p0, Ll/ss30;->L:I

    .line 8
    .line 9
    iput p5, p0, Ll/ss30;->M:I

    .line 10
    .line 11
    iput p6, p0, Ll/ss30;->N:I

    .line 12
    .line 13
    return-void
.end method

.method public p()I
    .locals 2

    .line 1
    iget v0, p0, Ll/xej;->a:I

    .line 2
    .line 3
    rem-int/lit8 v0, v0, 0x2

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    iget p0, p0, Ll/ss30;->M:I

    .line 9
    .line 10
    return p0

    .line 11
    :cond_0
    iget p0, p0, Ll/ss30;->N:I

    .line 12
    .line 13
    return p0
.end method

.method public q()I
    .locals 2

    .line 1
    iget v0, p0, Ll/xej;->a:I

    .line 2
    .line 3
    rem-int/lit8 v0, v0, 0x2

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    iget p0, p0, Ll/ss30;->N:I

    .line 9
    .line 10
    return p0

    .line 11
    :cond_0
    iget p0, p0, Ll/ss30;->M:I

    .line 12
    .line 13
    return p0
.end method
