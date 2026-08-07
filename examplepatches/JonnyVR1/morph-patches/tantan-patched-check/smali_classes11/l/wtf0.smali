.class public final Ll/wtf0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final a:I

.field public final b:I

.field public final c:F

.field public final d:F

.field public final e:F

.field public final f:I

.field public final g:I

.field public final h:I

.field public final i:[S

.field public j:[S

.field public k:I

.field public l:[S

.field public m:I

.field public n:[S

.field public o:I

.field public p:I

.field public q:I

.field public r:I

.field public s:I

.field public t:I

.field public u:I

.field public v:I


# direct methods
.method public constructor <init>(IIFFI)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/wtf0;->a:I

    .line 5
    .line 6
    iput p2, p0, Ll/wtf0;->b:I

    .line 7
    .line 8
    iput p3, p0, Ll/wtf0;->c:F

    .line 9
    .line 10
    iput p4, p0, Ll/wtf0;->d:F

    .line 11
    .line 12
    int-to-float p3, p1

    .line 13
    int-to-float p4, p5

    .line 14
    div-float/2addr p3, p4

    .line 15
    iput p3, p0, Ll/wtf0;->e:F

    .line 16
    .line 17
    div-int/lit16 p3, p1, 0x190

    .line 18
    .line 19
    iput p3, p0, Ll/wtf0;->f:I

    .line 20
    .line 21
    div-int/lit8 p1, p1, 0x41

    .line 22
    .line 23
    iput p1, p0, Ll/wtf0;->g:I

    .line 24
    .line 25
    mul-int/lit8 p1, p1, 0x2

    .line 26
    .line 27
    iput p1, p0, Ll/wtf0;->h:I

    .line 28
    .line 29
    new-array p3, p1, [S

    .line 30
    .line 31
    iput-object p3, p0, Ll/wtf0;->i:[S

    .line 32
    .line 33
    mul-int p3, p1, p2

    .line 34
    .line 35
    new-array p3, p3, [S

    .line 36
    .line 37
    iput-object p3, p0, Ll/wtf0;->j:[S

    .line 38
    .line 39
    mul-int p3, p1, p2

    .line 40
    .line 41
    new-array p3, p3, [S

    .line 42
    .line 43
    iput-object p3, p0, Ll/wtf0;->l:[S

    .line 44
    .line 45
    mul-int/2addr p1, p2

    .line 46
    new-array p1, p1, [S

    .line 47
    .line 48
    iput-object p1, p0, Ll/wtf0;->n:[S

    .line 49
    .line 50
    return-void
.end method

.method public static p(II[SI[SI[SI)V
    .locals 8

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    if-ge v1, p1, :cond_1

    .line 4
    .line 5
    mul-int v2, p3, p1

    .line 6
    .line 7
    add-int/2addr v2, v1

    .line 8
    mul-int v3, p7, p1

    .line 9
    .line 10
    add-int/2addr v3, v1

    .line 11
    mul-int v4, p5, p1

    .line 12
    .line 13
    add-int/2addr v4, v1

    .line 14
    move v5, v0

    .line 15
    :goto_1
    if-ge v5, p0, :cond_0

    .line 16
    .line 17
    aget-short v6, p4, v4

    .line 18
    .line 19
    sub-int v7, p0, v5

    .line 20
    .line 21
    mul-int/2addr v6, v7

    .line 22
    aget-short v7, p6, v3

    .line 23
    .line 24
    mul-int/2addr v7, v5

    .line 25
    add-int/2addr v6, v7

    .line 26
    div-int/2addr v6, p0

    .line 27
    int-to-short v6, v6

    .line 28
    aput-short v6, p2, v2

    .line 29
    .line 30
    add-int/2addr v2, p1

    .line 31
    add-int/2addr v4, p1

    .line 32
    add-int/2addr v3, p1

    .line 33
    add-int/lit8 v5, v5, 0x1

    .line 34
    .line 35
    goto :goto_1

    .line 36
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    return-void
.end method


# virtual methods
.method public final a(FI)V
    .locals 8

    .line 1
    iget v0, p0, Ll/wtf0;->m:I

    .line 2
    .line 3
    if-ne v0, p2, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget v0, p0, Ll/wtf0;->a:I

    .line 7
    .line 8
    int-to-float v1, v0

    .line 9
    div-float/2addr v1, p1

    .line 10
    float-to-int p1, v1

    .line 11
    :goto_0
    const/16 v1, 0x4000

    .line 12
    .line 13
    if-gt p1, v1, :cond_7

    .line 14
    .line 15
    if-le v0, v1, :cond_1

    .line 16
    .line 17
    goto :goto_5

    .line 18
    :cond_1
    invoke-virtual {p0, p2}, Ll/wtf0;->o(I)V

    .line 19
    .line 20
    .line 21
    const/4 p2, 0x0

    .line 22
    move v1, p2

    .line 23
    :goto_1
    iget v2, p0, Ll/wtf0;->o:I

    .line 24
    .line 25
    add-int/lit8 v3, v2, -0x1

    .line 26
    .line 27
    const/4 v4, 0x1

    .line 28
    if-ge v1, v3, :cond_6

    .line 29
    .line 30
    :goto_2
    iget v2, p0, Ll/wtf0;->p:I

    .line 31
    .line 32
    add-int/lit8 v3, v2, 0x1

    .line 33
    .line 34
    mul-int/2addr v3, p1

    .line 35
    iget v5, p0, Ll/wtf0;->q:I

    .line 36
    .line 37
    mul-int v6, v5, v0

    .line 38
    .line 39
    if-le v3, v6, :cond_3

    .line 40
    .line 41
    iget-object v2, p0, Ll/wtf0;->l:[S

    .line 42
    .line 43
    iget v3, p0, Ll/wtf0;->m:I

    .line 44
    .line 45
    invoke-virtual {p0, v2, v3, v4}, Ll/wtf0;->f([SII)[S

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    iput-object v2, p0, Ll/wtf0;->l:[S

    .line 50
    .line 51
    move v2, p2

    .line 52
    :goto_3
    iget v3, p0, Ll/wtf0;->b:I

    .line 53
    .line 54
    if-ge v2, v3, :cond_2

    .line 55
    .line 56
    iget-object v5, p0, Ll/wtf0;->l:[S

    .line 57
    .line 58
    iget v6, p0, Ll/wtf0;->m:I

    .line 59
    .line 60
    mul-int/2addr v6, v3

    .line 61
    add-int/2addr v6, v2

    .line 62
    iget-object v7, p0, Ll/wtf0;->n:[S

    .line 63
    .line 64
    mul-int/2addr v3, v1

    .line 65
    add-int/2addr v3, v2

    .line 66
    invoke-virtual {p0, v7, v3, v0, p1}, Ll/wtf0;->n([SIII)S

    .line 67
    .line 68
    .line 69
    move-result v3

    .line 70
    aput-short v3, v5, v6

    .line 71
    .line 72
    add-int/lit8 v2, v2, 0x1

    .line 73
    .line 74
    goto :goto_3

    .line 75
    :cond_2
    iget v2, p0, Ll/wtf0;->q:I

    .line 76
    .line 77
    add-int/2addr v2, v4

    .line 78
    iput v2, p0, Ll/wtf0;->q:I

    .line 79
    .line 80
    iget v2, p0, Ll/wtf0;->m:I

    .line 81
    .line 82
    add-int/2addr v2, v4

    .line 83
    iput v2, p0, Ll/wtf0;->m:I

    .line 84
    .line 85
    goto :goto_2

    .line 86
    :cond_3
    add-int/lit8 v2, v2, 0x1

    .line 87
    .line 88
    iput v2, p0, Ll/wtf0;->p:I

    .line 89
    .line 90
    if-ne v2, v0, :cond_5

    .line 91
    .line 92
    iput p2, p0, Ll/wtf0;->p:I

    .line 93
    .line 94
    if-ne v5, p1, :cond_4

    .line 95
    .line 96
    goto :goto_4

    .line 97
    :cond_4
    move v4, p2

    .line 98
    :goto_4
    invoke-static {v4}, Ll/w11;->g(Z)V

    .line 99
    .line 100
    .line 101
    iput p2, p0, Ll/wtf0;->q:I

    .line 102
    .line 103
    :cond_5
    add-int/lit8 v1, v1, 0x1

    .line 104
    .line 105
    goto :goto_1

    .line 106
    :cond_6
    sub-int/2addr v2, v4

    .line 107
    invoke-virtual {p0, v2}, Ll/wtf0;->u(I)V

    .line 108
    .line 109
    .line 110
    return-void

    .line 111
    :cond_7
    :goto_5
    div-int/lit8 p1, p1, 0x2

    .line 112
    .line 113
    div-int/lit8 v0, v0, 0x2

    .line 114
    .line 115
    goto :goto_0
.end method

.method public final b(F)V
    .locals 7

    .line 1
    iget v0, p0, Ll/wtf0;->k:I

    .line 2
    .line 3
    iget v1, p0, Ll/wtf0;->h:I

    .line 4
    .line 5
    if-ge v0, v1, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const/4 v1, 0x0

    .line 9
    :cond_1
    iget v2, p0, Ll/wtf0;->r:I

    .line 10
    .line 11
    if-lez v2, :cond_2

    .line 12
    .line 13
    invoke-virtual {p0, v1}, Ll/wtf0;->c(I)I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    :goto_0
    add-int/2addr v1, v2

    .line 18
    goto :goto_1

    .line 19
    :cond_2
    iget-object v2, p0, Ll/wtf0;->j:[S

    .line 20
    .line 21
    invoke-virtual {p0, v2, v1}, Ll/wtf0;->g([SI)I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    float-to-double v3, p1

    .line 26
    const-wide/high16 v5, 0x3ff0000000000000L    # 1.0

    .line 27
    .line 28
    cmpl-double v3, v3, v5

    .line 29
    .line 30
    iget-object v4, p0, Ll/wtf0;->j:[S

    .line 31
    .line 32
    if-lez v3, :cond_3

    .line 33
    .line 34
    invoke-virtual {p0, v4, v1, p1, v2}, Ll/wtf0;->w([SIFI)I

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    add-int/2addr v2, v3

    .line 39
    goto :goto_0

    .line 40
    :cond_3
    invoke-virtual {p0, v4, v1, p1, v2}, Ll/wtf0;->m([SIFI)I

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    goto :goto_0

    .line 45
    :goto_1
    iget v2, p0, Ll/wtf0;->h:I

    .line 46
    .line 47
    add-int/2addr v2, v1

    .line 48
    if-le v2, v0, :cond_1

    .line 49
    .line 50
    invoke-virtual {p0, v1}, Ll/wtf0;->v(I)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public final c(I)I
    .locals 2

    .line 1
    iget v0, p0, Ll/wtf0;->h:I

    .line 2
    .line 3
    iget v1, p0, Ll/wtf0;->r:I

    .line 4
    .line 5
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget-object v1, p0, Ll/wtf0;->j:[S

    .line 10
    .line 11
    invoke-virtual {p0, v1, p1, v0}, Ll/wtf0;->d([SII)V

    .line 12
    .line 13
    .line 14
    iget p1, p0, Ll/wtf0;->r:I

    .line 15
    .line 16
    sub-int/2addr p1, v0

    .line 17
    iput p1, p0, Ll/wtf0;->r:I

    .line 18
    .line 19
    return v0
.end method

.method public final d([SII)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/wtf0;->l:[S

    .line 2
    .line 3
    iget v1, p0, Ll/wtf0;->m:I

    .line 4
    .line 5
    invoke-virtual {p0, v0, v1, p3}, Ll/wtf0;->f([SII)[S

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Ll/wtf0;->l:[S

    .line 10
    .line 11
    iget v1, p0, Ll/wtf0;->b:I

    .line 12
    .line 13
    mul-int/2addr p2, v1

    .line 14
    iget v2, p0, Ll/wtf0;->m:I

    .line 15
    .line 16
    mul-int/2addr v2, v1

    .line 17
    mul-int/2addr v1, p3

    .line 18
    invoke-static {p1, p2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 19
    .line 20
    .line 21
    iget p1, p0, Ll/wtf0;->m:I

    .line 22
    .line 23
    add-int/2addr p1, p3

    .line 24
    iput p1, p0, Ll/wtf0;->m:I

    .line 25
    .line 26
    return-void
.end method

.method public final e([SII)V
    .locals 6

    .line 1
    iget v0, p0, Ll/wtf0;->h:I

    .line 2
    .line 3
    div-int/2addr v0, p3

    .line 4
    iget v1, p0, Ll/wtf0;->b:I

    .line 5
    .line 6
    mul-int/2addr p3, v1

    .line 7
    mul-int/2addr p2, v1

    .line 8
    const/4 v1, 0x0

    .line 9
    move v2, v1

    .line 10
    :goto_0
    if-ge v2, v0, :cond_1

    .line 11
    .line 12
    move v3, v1

    .line 13
    move v4, v3

    .line 14
    :goto_1
    if-ge v3, p3, :cond_0

    .line 15
    .line 16
    mul-int v5, v2, p3

    .line 17
    .line 18
    add-int/2addr v5, p2

    .line 19
    add-int/2addr v5, v3

    .line 20
    aget-short v5, p1, v5

    .line 21
    .line 22
    add-int/2addr v4, v5

    .line 23
    add-int/lit8 v3, v3, 0x1

    .line 24
    .line 25
    goto :goto_1

    .line 26
    :cond_0
    div-int/2addr v4, p3

    .line 27
    iget-object v3, p0, Ll/wtf0;->i:[S

    .line 28
    .line 29
    int-to-short v4, v4

    .line 30
    aput-short v4, v3, v2

    .line 31
    .line 32
    add-int/lit8 v2, v2, 0x1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    return-void
.end method

.method public final f([SII)[S
    .locals 1

    .line 1
    array-length v0, p1

    .line 2
    iget p0, p0, Ll/wtf0;->b:I

    .line 3
    .line 4
    div-int/2addr v0, p0

    .line 5
    add-int/2addr p2, p3

    .line 6
    if-gt p2, v0, :cond_0

    .line 7
    .line 8
    return-object p1

    .line 9
    :cond_0
    mul-int/lit8 v0, v0, 0x3

    .line 10
    .line 11
    div-int/lit8 v0, v0, 0x2

    .line 12
    .line 13
    add-int/2addr v0, p3

    .line 14
    mul-int/2addr v0, p0

    .line 15
    invoke-static {p1, v0}, Ljava/util/Arrays;->copyOf([SI)[S

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public final g([SI)I
    .locals 6

    .line 1
    iget v0, p0, Ll/wtf0;->a:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/16 v2, 0xfa0

    .line 5
    .line 6
    if-le v0, v2, :cond_0

    .line 7
    .line 8
    div-int/2addr v0, v2

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    move v0, v1

    .line 11
    :goto_0
    iget v2, p0, Ll/wtf0;->b:I

    .line 12
    .line 13
    if-ne v2, v1, :cond_1

    .line 14
    .line 15
    if-ne v0, v1, :cond_1

    .line 16
    .line 17
    iget v0, p0, Ll/wtf0;->f:I

    .line 18
    .line 19
    iget v1, p0, Ll/wtf0;->g:I

    .line 20
    .line 21
    invoke-virtual {p0, p1, p2, v0, v1}, Ll/wtf0;->h([SIII)I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    goto :goto_1

    .line 26
    :cond_1
    invoke-virtual {p0, p1, p2, v0}, Ll/wtf0;->e([SII)V

    .line 27
    .line 28
    .line 29
    iget-object v2, p0, Ll/wtf0;->i:[S

    .line 30
    .line 31
    iget v3, p0, Ll/wtf0;->f:I

    .line 32
    .line 33
    div-int/2addr v3, v0

    .line 34
    iget v4, p0, Ll/wtf0;->g:I

    .line 35
    .line 36
    div-int/2addr v4, v0

    .line 37
    const/4 v5, 0x0

    .line 38
    invoke-virtual {p0, v2, v5, v3, v4}, Ll/wtf0;->h([SIII)I

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    if-eq v0, v1, :cond_5

    .line 43
    .line 44
    mul-int/2addr v2, v0

    .line 45
    mul-int/lit8 v0, v0, 0x4

    .line 46
    .line 47
    sub-int v3, v2, v0

    .line 48
    .line 49
    add-int/2addr v2, v0

    .line 50
    iget v0, p0, Ll/wtf0;->f:I

    .line 51
    .line 52
    if-ge v3, v0, :cond_2

    .line 53
    .line 54
    move v3, v0

    .line 55
    :cond_2
    iget v0, p0, Ll/wtf0;->g:I

    .line 56
    .line 57
    if-le v2, v0, :cond_3

    .line 58
    .line 59
    move v2, v0

    .line 60
    :cond_3
    iget v0, p0, Ll/wtf0;->b:I

    .line 61
    .line 62
    if-ne v0, v1, :cond_4

    .line 63
    .line 64
    invoke-virtual {p0, p1, p2, v3, v2}, Ll/wtf0;->h([SIII)I

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    goto :goto_1

    .line 69
    :cond_4
    invoke-virtual {p0, p1, p2, v1}, Ll/wtf0;->e([SII)V

    .line 70
    .line 71
    .line 72
    iget-object p1, p0, Ll/wtf0;->i:[S

    .line 73
    .line 74
    invoke-virtual {p0, p1, v5, v3, v2}, Ll/wtf0;->h([SIII)I

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    goto :goto_1

    .line 79
    :cond_5
    move p1, v2

    .line 80
    :goto_1
    iget p2, p0, Ll/wtf0;->u:I

    .line 81
    .line 82
    iget v0, p0, Ll/wtf0;->v:I

    .line 83
    .line 84
    invoke-virtual {p0, p2, v0}, Ll/wtf0;->q(II)Z

    .line 85
    .line 86
    .line 87
    move-result p2

    .line 88
    if-eqz p2, :cond_6

    .line 89
    .line 90
    iget p2, p0, Ll/wtf0;->s:I

    .line 91
    .line 92
    goto :goto_2

    .line 93
    :cond_6
    move p2, p1

    .line 94
    :goto_2
    iget v0, p0, Ll/wtf0;->u:I

    .line 95
    .line 96
    iput v0, p0, Ll/wtf0;->t:I

    .line 97
    .line 98
    iput p1, p0, Ll/wtf0;->s:I

    .line 99
    .line 100
    return p2
.end method

.method public final h([SIII)I
    .locals 9

    .line 1
    iget v0, p0, Ll/wtf0;->b:I

    .line 2
    .line 3
    mul-int/2addr p2, v0

    .line 4
    const/4 v0, 0x0

    .line 5
    const/16 v1, 0xff

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    move v3, v0

    .line 9
    move v4, v3

    .line 10
    :goto_0
    if-gt p3, p4, :cond_3

    .line 11
    .line 12
    move v5, v0

    .line 13
    move v6, v5

    .line 14
    :goto_1
    if-ge v5, p3, :cond_0

    .line 15
    .line 16
    add-int v7, p2, v5

    .line 17
    .line 18
    aget-short v7, p1, v7

    .line 19
    .line 20
    add-int v8, p2, p3

    .line 21
    .line 22
    add-int/2addr v8, v5

    .line 23
    aget-short v8, p1, v8

    .line 24
    .line 25
    sub-int/2addr v7, v8

    .line 26
    invoke-static {v7}, Ljava/lang/Math;->abs(I)I

    .line 27
    .line 28
    .line 29
    move-result v7

    .line 30
    add-int/2addr v6, v7

    .line 31
    add-int/lit8 v5, v5, 0x1

    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_0
    mul-int v5, v6, v3

    .line 35
    .line 36
    mul-int v7, v2, p3

    .line 37
    .line 38
    if-ge v5, v7, :cond_1

    .line 39
    .line 40
    move v3, p3

    .line 41
    move v2, v6

    .line 42
    :cond_1
    mul-int v5, v6, v1

    .line 43
    .line 44
    mul-int v7, v4, p3

    .line 45
    .line 46
    if-le v5, v7, :cond_2

    .line 47
    .line 48
    move v1, p3

    .line 49
    move v4, v6

    .line 50
    :cond_2
    add-int/lit8 p3, p3, 0x1

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_3
    div-int/2addr v2, v3

    .line 54
    iput v2, p0, Ll/wtf0;->u:I

    .line 55
    .line 56
    div-int/2addr v4, v1

    .line 57
    iput v4, p0, Ll/wtf0;->v:I

    .line 58
    .line 59
    return v3
.end method

.method public i()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Ll/wtf0;->k:I

    .line 3
    .line 4
    iput v0, p0, Ll/wtf0;->m:I

    .line 5
    .line 6
    iput v0, p0, Ll/wtf0;->o:I

    .line 7
    .line 8
    iput v0, p0, Ll/wtf0;->p:I

    .line 9
    .line 10
    iput v0, p0, Ll/wtf0;->q:I

    .line 11
    .line 12
    iput v0, p0, Ll/wtf0;->r:I

    .line 13
    .line 14
    iput v0, p0, Ll/wtf0;->s:I

    .line 15
    .line 16
    iput v0, p0, Ll/wtf0;->t:I

    .line 17
    .line 18
    iput v0, p0, Ll/wtf0;->u:I

    .line 19
    .line 20
    iput v0, p0, Ll/wtf0;->v:I

    .line 21
    .line 22
    return-void
.end method

.method public j(Ljava/nio/ShortBuffer;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Ljava/nio/Buffer;->remaining()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget v1, p0, Ll/wtf0;->b:I

    .line 6
    .line 7
    div-int/2addr v0, v1

    .line 8
    iget v1, p0, Ll/wtf0;->m:I

    .line 9
    .line 10
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iget-object v1, p0, Ll/wtf0;->l:[S

    .line 15
    .line 16
    iget v2, p0, Ll/wtf0;->b:I

    .line 17
    .line 18
    mul-int/2addr v2, v0

    .line 19
    const/4 v3, 0x0

    .line 20
    invoke-virtual {p1, v1, v3, v2}, Ljava/nio/ShortBuffer;->put([SII)Ljava/nio/ShortBuffer;

    .line 21
    .line 22
    .line 23
    iget p1, p0, Ll/wtf0;->m:I

    .line 24
    .line 25
    sub-int/2addr p1, v0

    .line 26
    iput p1, p0, Ll/wtf0;->m:I

    .line 27
    .line 28
    iget-object v1, p0, Ll/wtf0;->l:[S

    .line 29
    .line 30
    iget p0, p0, Ll/wtf0;->b:I

    .line 31
    .line 32
    mul-int/2addr v0, p0

    .line 33
    mul-int/2addr p1, p0

    .line 34
    invoke-static {v1, v0, v1, v3, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public k()I
    .locals 1

    .line 1
    iget v0, p0, Ll/wtf0;->m:I

    .line 2
    .line 3
    iget p0, p0, Ll/wtf0;->b:I

    .line 4
    .line 5
    mul-int/2addr v0, p0

    .line 6
    mul-int/lit8 v0, v0, 0x2

    .line 7
    .line 8
    return v0
.end method

.method public l()I
    .locals 1

    .line 1
    iget v0, p0, Ll/wtf0;->k:I

    .line 2
    .line 3
    iget p0, p0, Ll/wtf0;->b:I

    .line 4
    .line 5
    mul-int/2addr v0, p0

    .line 6
    mul-int/lit8 v0, v0, 0x2

    .line 7
    .line 8
    return v0
.end method

.method public final m([SIFI)I
    .locals 9

    .line 1
    const/high16 v0, 0x3f000000    # 0.5f

    .line 2
    .line 3
    cmpg-float v0, p3, v0

    .line 4
    .line 5
    const/high16 v1, 0x3f800000    # 1.0f

    .line 6
    .line 7
    if-gez v0, :cond_0

    .line 8
    .line 9
    int-to-float v0, p4

    .line 10
    mul-float/2addr v0, p3

    .line 11
    sub-float/2addr v1, p3

    .line 12
    div-float/2addr v0, v1

    .line 13
    float-to-int p3, v0

    .line 14
    move v0, p3

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    int-to-float v0, p4

    .line 17
    const/high16 v2, 0x40000000    # 2.0f

    .line 18
    .line 19
    mul-float/2addr v2, p3

    .line 20
    sub-float/2addr v2, v1

    .line 21
    mul-float/2addr v0, v2

    .line 22
    sub-float/2addr v1, p3

    .line 23
    div-float/2addr v0, v1

    .line 24
    float-to-int p3, v0

    .line 25
    iput p3, p0, Ll/wtf0;->r:I

    .line 26
    .line 27
    move v0, p4

    .line 28
    :goto_0
    iget-object p3, p0, Ll/wtf0;->l:[S

    .line 29
    .line 30
    iget v1, p0, Ll/wtf0;->m:I

    .line 31
    .line 32
    add-int v8, p4, v0

    .line 33
    .line 34
    invoke-virtual {p0, p3, v1, v8}, Ll/wtf0;->f([SII)[S

    .line 35
    .line 36
    .line 37
    move-result-object p3

    .line 38
    iput-object p3, p0, Ll/wtf0;->l:[S

    .line 39
    .line 40
    iget v1, p0, Ll/wtf0;->b:I

    .line 41
    .line 42
    mul-int v2, p2, v1

    .line 43
    .line 44
    iget v3, p0, Ll/wtf0;->m:I

    .line 45
    .line 46
    mul-int/2addr v3, v1

    .line 47
    mul-int/2addr v1, p4

    .line 48
    invoke-static {p1, v2, p3, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 49
    .line 50
    .line 51
    iget v1, p0, Ll/wtf0;->b:I

    .line 52
    .line 53
    iget-object v2, p0, Ll/wtf0;->l:[S

    .line 54
    .line 55
    iget p3, p0, Ll/wtf0;->m:I

    .line 56
    .line 57
    add-int v3, p3, p4

    .line 58
    .line 59
    add-int v5, p2, p4

    .line 60
    .line 61
    move-object v6, p1

    .line 62
    move-object v4, p1

    .line 63
    move v7, p2

    .line 64
    invoke-static/range {v0 .. v7}, Ll/wtf0;->p(II[SI[SI[SI)V

    .line 65
    .line 66
    .line 67
    iget p1, p0, Ll/wtf0;->m:I

    .line 68
    .line 69
    add-int/2addr p1, v8

    .line 70
    iput p1, p0, Ll/wtf0;->m:I

    .line 71
    .line 72
    return v0
.end method

.method public final n([SIII)S
    .locals 2

    .line 1
    aget-short v0, p1, p2

    .line 2
    .line 3
    iget v1, p0, Ll/wtf0;->b:I

    .line 4
    .line 5
    add-int/2addr p2, v1

    .line 6
    aget-short p1, p1, p2

    .line 7
    .line 8
    iget p2, p0, Ll/wtf0;->q:I

    .line 9
    .line 10
    mul-int/2addr p2, p3

    .line 11
    iget p0, p0, Ll/wtf0;->p:I

    .line 12
    .line 13
    mul-int p3, p0, p4

    .line 14
    .line 15
    add-int/lit8 p0, p0, 0x1

    .line 16
    .line 17
    mul-int/2addr p0, p4

    .line 18
    sub-int p2, p0, p2

    .line 19
    .line 20
    sub-int/2addr p0, p3

    .line 21
    mul-int/2addr v0, p2

    .line 22
    sub-int p2, p0, p2

    .line 23
    .line 24
    mul-int/2addr p2, p1

    .line 25
    add-int/2addr v0, p2

    .line 26
    div-int/2addr v0, p0

    .line 27
    int-to-short p0, v0

    .line 28
    return p0
.end method

.method public final o(I)V
    .locals 6

    .line 1
    iget v0, p0, Ll/wtf0;->m:I

    .line 2
    .line 3
    sub-int/2addr v0, p1

    .line 4
    iget-object v1, p0, Ll/wtf0;->n:[S

    .line 5
    .line 6
    iget v2, p0, Ll/wtf0;->o:I

    .line 7
    .line 8
    invoke-virtual {p0, v1, v2, v0}, Ll/wtf0;->f([SII)[S

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    iput-object v1, p0, Ll/wtf0;->n:[S

    .line 13
    .line 14
    iget-object v2, p0, Ll/wtf0;->l:[S

    .line 15
    .line 16
    iget v3, p0, Ll/wtf0;->b:I

    .line 17
    .line 18
    mul-int v4, p1, v3

    .line 19
    .line 20
    iget v5, p0, Ll/wtf0;->o:I

    .line 21
    .line 22
    mul-int/2addr v5, v3

    .line 23
    mul-int/2addr v3, v0

    .line 24
    invoke-static {v2, v4, v1, v5, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 25
    .line 26
    .line 27
    iput p1, p0, Ll/wtf0;->m:I

    .line 28
    .line 29
    iget p1, p0, Ll/wtf0;->o:I

    .line 30
    .line 31
    add-int/2addr p1, v0

    .line 32
    iput p1, p0, Ll/wtf0;->o:I

    .line 33
    .line 34
    return-void
.end method

.method public final q(II)Z
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_3

    .line 3
    .line 4
    iget v1, p0, Ll/wtf0;->s:I

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    mul-int/lit8 v1, p1, 0x3

    .line 10
    .line 11
    if-le p2, v1, :cond_1

    .line 12
    .line 13
    return v0

    .line 14
    :cond_1
    mul-int/lit8 p1, p1, 0x2

    .line 15
    .line 16
    iget p0, p0, Ll/wtf0;->t:I

    .line 17
    .line 18
    mul-int/lit8 p0, p0, 0x3

    .line 19
    .line 20
    if-gt p1, p0, :cond_2

    .line 21
    .line 22
    return v0

    .line 23
    :cond_2
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_3
    :goto_0
    return v0
.end method

.method public final r()V
    .locals 8

    .line 1
    iget v0, p0, Ll/wtf0;->m:I

    .line 2
    .line 3
    iget v1, p0, Ll/wtf0;->c:F

    .line 4
    .line 5
    iget v2, p0, Ll/wtf0;->d:F

    .line 6
    .line 7
    div-float/2addr v1, v2

    .line 8
    iget v3, p0, Ll/wtf0;->e:F

    .line 9
    .line 10
    mul-float/2addr v3, v2

    .line 11
    float-to-double v4, v1

    .line 12
    const-wide v6, 0x3ff0000a7c5ac472L    # 1.00001

    .line 13
    .line 14
    .line 15
    .line 16
    .line 17
    cmpl-double v2, v4, v6

    .line 18
    .line 19
    if-gtz v2, :cond_1

    .line 20
    .line 21
    const-wide v6, 0x3fefffeb074a771dL    # 0.99999

    .line 22
    .line 23
    .line 24
    .line 25
    .line 26
    cmpg-double v2, v4, v6

    .line 27
    .line 28
    if-gez v2, :cond_0

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    iget-object v1, p0, Ll/wtf0;->j:[S

    .line 32
    .line 33
    iget v2, p0, Ll/wtf0;->k:I

    .line 34
    .line 35
    const/4 v4, 0x0

    .line 36
    invoke-virtual {p0, v1, v4, v2}, Ll/wtf0;->d([SII)V

    .line 37
    .line 38
    .line 39
    iput v4, p0, Ll/wtf0;->k:I

    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_1
    :goto_0
    invoke-virtual {p0, v1}, Ll/wtf0;->b(F)V

    .line 43
    .line 44
    .line 45
    :goto_1
    const/high16 v1, 0x3f800000    # 1.0f

    .line 46
    .line 47
    cmpl-float v1, v3, v1

    .line 48
    .line 49
    if-eqz v1, :cond_2

    .line 50
    .line 51
    invoke-virtual {p0, v3, v0}, Ll/wtf0;->a(FI)V

    .line 52
    .line 53
    .line 54
    :cond_2
    return-void
.end method

.method public s()V
    .locals 7

    .line 1
    iget v0, p0, Ll/wtf0;->k:I

    .line 2
    .line 3
    iget v1, p0, Ll/wtf0;->c:F

    .line 4
    .line 5
    iget v2, p0, Ll/wtf0;->d:F

    .line 6
    .line 7
    div-float/2addr v1, v2

    .line 8
    iget v3, p0, Ll/wtf0;->e:F

    .line 9
    .line 10
    mul-float/2addr v3, v2

    .line 11
    iget v2, p0, Ll/wtf0;->m:I

    .line 12
    .line 13
    int-to-float v4, v0

    .line 14
    div-float/2addr v4, v1

    .line 15
    iget v1, p0, Ll/wtf0;->o:I

    .line 16
    .line 17
    int-to-float v1, v1

    .line 18
    add-float/2addr v4, v1

    .line 19
    div-float/2addr v4, v3

    .line 20
    const/high16 v1, 0x3f000000    # 0.5f

    .line 21
    .line 22
    add-float/2addr v4, v1

    .line 23
    float-to-int v1, v4

    .line 24
    add-int/2addr v2, v1

    .line 25
    iget-object v1, p0, Ll/wtf0;->j:[S

    .line 26
    .line 27
    iget v3, p0, Ll/wtf0;->h:I

    .line 28
    .line 29
    mul-int/lit8 v3, v3, 0x2

    .line 30
    .line 31
    add-int/2addr v3, v0

    .line 32
    invoke-virtual {p0, v1, v0, v3}, Ll/wtf0;->f([SII)[S

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    iput-object v1, p0, Ll/wtf0;->j:[S

    .line 37
    .line 38
    const/4 v1, 0x0

    .line 39
    move v3, v1

    .line 40
    :goto_0
    iget v4, p0, Ll/wtf0;->h:I

    .line 41
    .line 42
    mul-int/lit8 v5, v4, 0x2

    .line 43
    .line 44
    iget v6, p0, Ll/wtf0;->b:I

    .line 45
    .line 46
    mul-int/2addr v5, v6

    .line 47
    if-ge v3, v5, :cond_0

    .line 48
    .line 49
    iget-object v4, p0, Ll/wtf0;->j:[S

    .line 50
    .line 51
    mul-int/2addr v6, v0

    .line 52
    add-int/2addr v6, v3

    .line 53
    aput-short v1, v4, v6

    .line 54
    .line 55
    add-int/lit8 v3, v3, 0x1

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_0
    iget v0, p0, Ll/wtf0;->k:I

    .line 59
    .line 60
    mul-int/lit8 v4, v4, 0x2

    .line 61
    .line 62
    add-int/2addr v0, v4

    .line 63
    iput v0, p0, Ll/wtf0;->k:I

    .line 64
    .line 65
    invoke-virtual {p0}, Ll/wtf0;->r()V

    .line 66
    .line 67
    .line 68
    iget v0, p0, Ll/wtf0;->m:I

    .line 69
    .line 70
    if-le v0, v2, :cond_1

    .line 71
    .line 72
    iput v2, p0, Ll/wtf0;->m:I

    .line 73
    .line 74
    :cond_1
    iput v1, p0, Ll/wtf0;->k:I

    .line 75
    .line 76
    iput v1, p0, Ll/wtf0;->r:I

    .line 77
    .line 78
    iput v1, p0, Ll/wtf0;->o:I

    .line 79
    .line 80
    return-void
.end method

.method public t(Ljava/nio/ShortBuffer;)V
    .locals 5

    .line 1
    invoke-virtual {p1}, Ljava/nio/Buffer;->remaining()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget v1, p0, Ll/wtf0;->b:I

    .line 6
    .line 7
    div-int/2addr v0, v1

    .line 8
    mul-int/2addr v1, v0

    .line 9
    mul-int/lit8 v1, v1, 0x2

    .line 10
    .line 11
    iget-object v2, p0, Ll/wtf0;->j:[S

    .line 12
    .line 13
    iget v3, p0, Ll/wtf0;->k:I

    .line 14
    .line 15
    invoke-virtual {p0, v2, v3, v0}, Ll/wtf0;->f([SII)[S

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    iput-object v2, p0, Ll/wtf0;->j:[S

    .line 20
    .line 21
    iget v3, p0, Ll/wtf0;->k:I

    .line 22
    .line 23
    iget v4, p0, Ll/wtf0;->b:I

    .line 24
    .line 25
    mul-int/2addr v3, v4

    .line 26
    div-int/lit8 v1, v1, 0x2

    .line 27
    .line 28
    invoke-virtual {p1, v2, v3, v1}, Ljava/nio/ShortBuffer;->get([SII)Ljava/nio/ShortBuffer;

    .line 29
    .line 30
    .line 31
    iget p1, p0, Ll/wtf0;->k:I

    .line 32
    .line 33
    add-int/2addr p1, v0

    .line 34
    iput p1, p0, Ll/wtf0;->k:I

    .line 35
    .line 36
    invoke-virtual {p0}, Ll/wtf0;->r()V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final u(I)V
    .locals 4

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object v0, p0, Ll/wtf0;->n:[S

    .line 5
    .line 6
    iget v1, p0, Ll/wtf0;->b:I

    .line 7
    .line 8
    mul-int v2, p1, v1

    .line 9
    .line 10
    iget v3, p0, Ll/wtf0;->o:I

    .line 11
    .line 12
    sub-int/2addr v3, p1

    .line 13
    mul-int/2addr v3, v1

    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-static {v0, v2, v0, v1, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 16
    .line 17
    .line 18
    iget v0, p0, Ll/wtf0;->o:I

    .line 19
    .line 20
    sub-int/2addr v0, p1

    .line 21
    iput v0, p0, Ll/wtf0;->o:I

    .line 22
    .line 23
    return-void
.end method

.method public final v(I)V
    .locals 4

    .line 1
    iget v0, p0, Ll/wtf0;->k:I

    .line 2
    .line 3
    sub-int/2addr v0, p1

    .line 4
    iget-object v1, p0, Ll/wtf0;->j:[S

    .line 5
    .line 6
    iget v2, p0, Ll/wtf0;->b:I

    .line 7
    .line 8
    mul-int/2addr p1, v2

    .line 9
    const/4 v3, 0x0

    .line 10
    mul-int/2addr v2, v0

    .line 11
    invoke-static {v1, p1, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 12
    .line 13
    .line 14
    iput v0, p0, Ll/wtf0;->k:I

    .line 15
    .line 16
    return-void
.end method

.method public final w([SIFI)I
    .locals 8

    .line 1
    const/high16 v0, 0x40000000    # 2.0f

    .line 2
    .line 3
    cmpl-float v1, p3, v0

    .line 4
    .line 5
    const/high16 v2, 0x3f800000    # 1.0f

    .line 6
    .line 7
    if-ltz v1, :cond_0

    .line 8
    .line 9
    int-to-float v0, p4

    .line 10
    sub-float/2addr p3, v2

    .line 11
    div-float/2addr v0, p3

    .line 12
    float-to-int p3, v0

    .line 13
    move v0, p3

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    int-to-float v1, p4

    .line 16
    sub-float/2addr v0, p3

    .line 17
    mul-float/2addr v1, v0

    .line 18
    sub-float/2addr p3, v2

    .line 19
    div-float/2addr v1, p3

    .line 20
    float-to-int p3, v1

    .line 21
    iput p3, p0, Ll/wtf0;->r:I

    .line 22
    .line 23
    move v0, p4

    .line 24
    :goto_0
    iget-object p3, p0, Ll/wtf0;->l:[S

    .line 25
    .line 26
    iget v1, p0, Ll/wtf0;->m:I

    .line 27
    .line 28
    invoke-virtual {p0, p3, v1, v0}, Ll/wtf0;->f([SII)[S

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    iput-object v2, p0, Ll/wtf0;->l:[S

    .line 33
    .line 34
    iget v1, p0, Ll/wtf0;->b:I

    .line 35
    .line 36
    iget v3, p0, Ll/wtf0;->m:I

    .line 37
    .line 38
    add-int v7, p2, p4

    .line 39
    .line 40
    move-object v6, p1

    .line 41
    move-object v4, p1

    .line 42
    move v5, p2

    .line 43
    invoke-static/range {v0 .. v7}, Ll/wtf0;->p(II[SI[SI[SI)V

    .line 44
    .line 45
    .line 46
    iget p1, p0, Ll/wtf0;->m:I

    .line 47
    .line 48
    add-int/2addr p1, v0

    .line 49
    iput p1, p0, Ll/wtf0;->m:I

    .line 50
    .line 51
    return v0
.end method
