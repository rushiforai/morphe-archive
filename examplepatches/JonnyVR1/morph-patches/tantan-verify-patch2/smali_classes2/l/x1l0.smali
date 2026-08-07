.class public Ll/x1l0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:[F

.field public final b:[J

.field public c:F

.field public d:I

.field public e:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x14

    .line 5
    .line 6
    new-array v1, v0, [F

    .line 7
    .line 8
    iput-object v1, p0, Ll/x1l0;->a:[F

    .line 9
    .line 10
    new-array v0, v0, [J

    .line 11
    .line 12
    iput-object v0, p0, Ll/x1l0;->b:[J

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput v0, p0, Ll/x1l0;->c:F

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    iput v0, p0, Ll/x1l0;->d:I

    .line 19
    .line 20
    iput v0, p0, Ll/x1l0;->e:I

    .line 21
    .line 22
    return-void
.end method

.method public static f(F)F
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    cmpg-float v0, p0, v0

    .line 3
    .line 4
    if-gez v0, :cond_0

    .line 5
    .line 6
    const/high16 v0, -0x40800000    # -1.0f

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    .line 10
    .line 11
    :goto_0
    const/high16 v1, 0x40000000    # 2.0f

    .line 12
    .line 13
    invoke-static {p0}, Ljava/lang/Math;->abs(F)F

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    mul-float/2addr p0, v1

    .line 18
    float-to-double v1, p0

    .line 19
    invoke-static {v1, v2}, Ljava/lang/Math;->sqrt(D)D

    .line 20
    .line 21
    .line 22
    move-result-wide v1

    .line 23
    double-to-float p0, v1

    .line 24
    mul-float/2addr v0, p0

    .line 25
    return v0
.end method


# virtual methods
.method public a(Landroid/view/MotionEvent;)V
    .locals 6
    .param p1    # Landroid/view/MotionEvent;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEventTime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget v2, p0, Ll/x1l0;->d:I

    .line 6
    .line 7
    if-eqz v2, :cond_0

    .line 8
    .line 9
    iget-object v2, p0, Ll/x1l0;->b:[J

    .line 10
    .line 11
    iget v3, p0, Ll/x1l0;->e:I

    .line 12
    .line 13
    aget-wide v3, v2, v3

    .line 14
    .line 15
    sub-long v2, v0, v3

    .line 16
    .line 17
    const-wide/16 v4, 0x28

    .line 18
    .line 19
    cmp-long v2, v2, v4

    .line 20
    .line 21
    if-lez v2, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/x1l0;->b()V

    .line 24
    .line 25
    .line 26
    :cond_0
    iget v2, p0, Ll/x1l0;->e:I

    .line 27
    .line 28
    add-int/lit8 v2, v2, 0x1

    .line 29
    .line 30
    const/16 v3, 0x14

    .line 31
    .line 32
    rem-int/2addr v2, v3

    .line 33
    iput v2, p0, Ll/x1l0;->e:I

    .line 34
    .line 35
    iget v4, p0, Ll/x1l0;->d:I

    .line 36
    .line 37
    if-eq v4, v3, :cond_1

    .line 38
    .line 39
    add-int/lit8 v4, v4, 0x1

    .line 40
    .line 41
    iput v4, p0, Ll/x1l0;->d:I

    .line 42
    .line 43
    :cond_1
    iget-object v3, p0, Ll/x1l0;->a:[F

    .line 44
    .line 45
    const/16 v4, 0x1a

    .line 46
    .line 47
    invoke-virtual {p1, v4}, Landroid/view/MotionEvent;->getAxisValue(I)F

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    aput p1, v3, v2

    .line 52
    .line 53
    iget-object p1, p0, Ll/x1l0;->b:[J

    .line 54
    .line 55
    iget p0, p0, Ll/x1l0;->e:I

    .line 56
    .line 57
    aput-wide v0, p1, p0

    .line 58
    .line 59
    return-void
.end method

.method public final b()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Ll/x1l0;->d:I

    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/x1l0;->c:F

    .line 6
    .line 7
    return-void
.end method

.method public c(IF)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/x1l0;->e()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float p1, p1

    .line 6
    mul-float/2addr v0, p1

    .line 7
    iput v0, p0, Ll/x1l0;->c:F

    .line 8
    .line 9
    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    neg-float p1, p1

    .line 14
    cmpg-float p1, v0, p1

    .line 15
    .line 16
    if-gez p1, :cond_0

    .line 17
    .line 18
    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    neg-float p1, p1

    .line 23
    iput p1, p0, Ll/x1l0;->c:F

    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    iget p1, p0, Ll/x1l0;->c:F

    .line 27
    .line 28
    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    cmpl-float p1, p1, v0

    .line 33
    .line 34
    if-lez p1, :cond_1

    .line 35
    .line 36
    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    iput p1, p0, Ll/x1l0;->c:F

    .line 41
    .line 42
    :cond_1
    return-void
.end method

.method public d(I)F
    .locals 1

    .line 1
    const/16 v0, 0x1a

    .line 2
    .line 3
    if-eq p1, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    iget p0, p0, Ll/x1l0;->c:F

    .line 8
    .line 9
    return p0
.end method

.method public final e()F
    .locals 14

    .line 1
    iget v0, p0, Ll/x1l0;->d:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x2

    .line 5
    if-ge v0, v2, :cond_0

    .line 6
    .line 7
    return v1

    .line 8
    :cond_0
    iget v3, p0, Ll/x1l0;->e:I

    .line 9
    .line 10
    add-int/lit8 v4, v3, 0x14

    .line 11
    .line 12
    const/4 v5, 0x1

    .line 13
    sub-int/2addr v0, v5

    .line 14
    sub-int/2addr v4, v0

    .line 15
    rem-int/lit8 v4, v4, 0x14

    .line 16
    .line 17
    iget-object v0, p0, Ll/x1l0;->b:[J

    .line 18
    .line 19
    aget-wide v6, v0, v3

    .line 20
    .line 21
    :goto_0
    iget-object v0, p0, Ll/x1l0;->b:[J

    .line 22
    .line 23
    aget-wide v8, v0, v4

    .line 24
    .line 25
    sub-long v10, v6, v8

    .line 26
    .line 27
    const-wide/16 v12, 0x64

    .line 28
    .line 29
    cmp-long v3, v10, v12

    .line 30
    .line 31
    iget v10, p0, Ll/x1l0;->d:I

    .line 32
    .line 33
    if-lez v3, :cond_1

    .line 34
    .line 35
    add-int/lit8 v10, v10, -0x1

    .line 36
    .line 37
    iput v10, p0, Ll/x1l0;->d:I

    .line 38
    .line 39
    add-int/lit8 v4, v4, 0x1

    .line 40
    .line 41
    rem-int/lit8 v4, v4, 0x14

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    if-ge v10, v2, :cond_2

    .line 45
    .line 46
    return v1

    .line 47
    :cond_2
    if-ne v10, v2, :cond_4

    .line 48
    .line 49
    add-int/2addr v4, v5

    .line 50
    rem-int/lit8 v4, v4, 0x14

    .line 51
    .line 52
    aget-wide v2, v0, v4

    .line 53
    .line 54
    cmp-long v0, v8, v2

    .line 55
    .line 56
    if-nez v0, :cond_3

    .line 57
    .line 58
    return v1

    .line 59
    :cond_3
    iget-object p0, p0, Ll/x1l0;->a:[F

    .line 60
    .line 61
    aget p0, p0, v4

    .line 62
    .line 63
    sub-long/2addr v2, v8

    .line 64
    long-to-float v0, v2

    .line 65
    div-float/2addr p0, v0

    .line 66
    return p0

    .line 67
    :cond_4
    const/4 v0, 0x0

    .line 68
    move v2, v1

    .line 69
    move v1, v0

    .line 70
    :goto_1
    iget v3, p0, Ll/x1l0;->d:I

    .line 71
    .line 72
    sub-int/2addr v3, v5

    .line 73
    if-ge v0, v3, :cond_7

    .line 74
    .line 75
    add-int v3, v0, v4

    .line 76
    .line 77
    iget-object v6, p0, Ll/x1l0;->b:[J

    .line 78
    .line 79
    rem-int/lit8 v7, v3, 0x14

    .line 80
    .line 81
    aget-wide v7, v6, v7

    .line 82
    .line 83
    add-int/2addr v3, v5

    .line 84
    rem-int/lit8 v3, v3, 0x14

    .line 85
    .line 86
    aget-wide v9, v6, v3

    .line 87
    .line 88
    cmp-long v6, v9, v7

    .line 89
    .line 90
    if-nez v6, :cond_5

    .line 91
    .line 92
    goto :goto_2

    .line 93
    :cond_5
    add-int/lit8 v1, v1, 0x1

    .line 94
    .line 95
    invoke-static {v2}, Ll/x1l0;->f(F)F

    .line 96
    .line 97
    .line 98
    move-result v6

    .line 99
    iget-object v9, p0, Ll/x1l0;->a:[F

    .line 100
    .line 101
    aget v9, v9, v3

    .line 102
    .line 103
    iget-object v10, p0, Ll/x1l0;->b:[J

    .line 104
    .line 105
    aget-wide v11, v10, v3

    .line 106
    .line 107
    sub-long/2addr v11, v7

    .line 108
    long-to-float v3, v11

    .line 109
    div-float/2addr v9, v3

    .line 110
    sub-float v3, v9, v6

    .line 111
    .line 112
    invoke-static {v9}, Ljava/lang/Math;->abs(F)F

    .line 113
    .line 114
    .line 115
    move-result v6

    .line 116
    mul-float/2addr v3, v6

    .line 117
    add-float/2addr v2, v3

    .line 118
    if-ne v1, v5, :cond_6

    .line 119
    .line 120
    const/high16 v3, 0x3f000000    # 0.5f

    .line 121
    .line 122
    mul-float/2addr v2, v3

    .line 123
    :cond_6
    :goto_2
    add-int/lit8 v0, v0, 0x1

    .line 124
    .line 125
    goto :goto_1

    .line 126
    :cond_7
    invoke-static {v2}, Ll/x1l0;->f(F)F

    .line 127
    .line 128
    .line 129
    move-result p0

    .line 130
    return p0
.end method
