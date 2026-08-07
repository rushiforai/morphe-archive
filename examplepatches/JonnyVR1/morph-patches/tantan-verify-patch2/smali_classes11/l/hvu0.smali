.class public final Ll/hvu0;
.super Ljava/lang/Object;
.source "SourceFile"


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
    iput p1, p0, Ll/hvu0;->a:I

    .line 5
    .line 6
    iput p2, p0, Ll/hvu0;->b:I

    .line 7
    .line 8
    iput p3, p0, Ll/hvu0;->c:F

    .line 9
    .line 10
    iput p4, p0, Ll/hvu0;->d:F

    .line 11
    .line 12
    int-to-float p3, p1

    .line 13
    int-to-float p4, p5

    .line 14
    div-float/2addr p3, p4

    .line 15
    iput p3, p0, Ll/hvu0;->e:F

    .line 16
    .line 17
    div-int/lit16 p3, p1, 0x190

    .line 18
    .line 19
    iput p3, p0, Ll/hvu0;->f:I

    .line 20
    .line 21
    div-int/lit8 p1, p1, 0x41

    .line 22
    .line 23
    iput p1, p0, Ll/hvu0;->g:I

    .line 24
    .line 25
    add-int/2addr p1, p1

    .line 26
    iput p1, p0, Ll/hvu0;->h:I

    .line 27
    .line 28
    new-array p3, p1, [S

    .line 29
    .line 30
    iput-object p3, p0, Ll/hvu0;->i:[S

    .line 31
    .line 32
    mul-int/2addr p1, p2

    .line 33
    new-array p2, p1, [S

    .line 34
    .line 35
    iput-object p2, p0, Ll/hvu0;->j:[S

    .line 36
    .line 37
    new-array p2, p1, [S

    .line 38
    .line 39
    iput-object p2, p0, Ll/hvu0;->l:[S

    .line 40
    .line 41
    new-array p1, p1, [S

    .line 42
    .line 43
    iput-object p1, p0, Ll/hvu0;->n:[S

    .line 44
    .line 45
    return-void
.end method

.method public static j(II[SI[SI[SI)V
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
    mul-int v3, p7, p1

    .line 8
    .line 9
    mul-int v4, p5, p1

    .line 10
    .line 11
    add-int/2addr v4, v1

    .line 12
    add-int/2addr v3, v1

    .line 13
    add-int/2addr v2, v1

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
.method public final a()I
    .locals 1

    .line 1
    iget v0, p0, Ll/hvu0;->m:I

    .line 2
    .line 3
    iget p0, p0, Ll/hvu0;->b:I

    .line 4
    .line 5
    mul-int/2addr v0, p0

    .line 6
    add-int/2addr v0, v0

    .line 7
    return v0
.end method

.method public final b()I
    .locals 1

    .line 1
    iget v0, p0, Ll/hvu0;->k:I

    .line 2
    .line 3
    iget p0, p0, Ll/hvu0;->b:I

    .line 4
    .line 5
    mul-int/2addr v0, p0

    .line 6
    add-int/2addr v0, v0

    .line 7
    return v0
.end method

.method public final c()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Ll/hvu0;->k:I

    .line 3
    .line 4
    iput v0, p0, Ll/hvu0;->m:I

    .line 5
    .line 6
    iput v0, p0, Ll/hvu0;->o:I

    .line 7
    .line 8
    iput v0, p0, Ll/hvu0;->p:I

    .line 9
    .line 10
    iput v0, p0, Ll/hvu0;->q:I

    .line 11
    .line 12
    iput v0, p0, Ll/hvu0;->r:I

    .line 13
    .line 14
    iput v0, p0, Ll/hvu0;->s:I

    .line 15
    .line 16
    iput v0, p0, Ll/hvu0;->t:I

    .line 17
    .line 18
    iput v0, p0, Ll/hvu0;->u:I

    .line 19
    .line 20
    iput v0, p0, Ll/hvu0;->v:I

    .line 21
    .line 22
    return-void
.end method

.method public final d(Ljava/nio/ShortBuffer;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Ljava/nio/Buffer;->remaining()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget v1, p0, Ll/hvu0;->b:I

    .line 6
    .line 7
    div-int/2addr v0, v1

    .line 8
    iget v1, p0, Ll/hvu0;->m:I

    .line 9
    .line 10
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iget v1, p0, Ll/hvu0;->b:I

    .line 15
    .line 16
    mul-int/2addr v1, v0

    .line 17
    iget-object v2, p0, Ll/hvu0;->l:[S

    .line 18
    .line 19
    const/4 v3, 0x0

    .line 20
    invoke-virtual {p1, v2, v3, v1}, Ljava/nio/ShortBuffer;->put([SII)Ljava/nio/ShortBuffer;

    .line 21
    .line 22
    .line 23
    iget p1, p0, Ll/hvu0;->m:I

    .line 24
    .line 25
    sub-int/2addr p1, v0

    .line 26
    iput p1, p0, Ll/hvu0;->m:I

    .line 27
    .line 28
    iget v1, p0, Ll/hvu0;->b:I

    .line 29
    .line 30
    mul-int/2addr v0, v1

    .line 31
    iget-object p0, p0, Ll/hvu0;->l:[S

    .line 32
    .line 33
    mul-int/2addr p1, v1

    .line 34
    invoke-static {p0, v0, p0, v3, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final e()V
    .locals 7

    .line 1
    iget v0, p0, Ll/hvu0;->k:I

    .line 2
    .line 3
    int-to-float v1, v0

    .line 4
    iget v2, p0, Ll/hvu0;->m:I

    .line 5
    .line 6
    iget v3, p0, Ll/hvu0;->o:I

    .line 7
    .line 8
    int-to-float v3, v3

    .line 9
    iget v4, p0, Ll/hvu0;->c:F

    .line 10
    .line 11
    iget v5, p0, Ll/hvu0;->e:F

    .line 12
    .line 13
    iget v6, p0, Ll/hvu0;->d:F

    .line 14
    .line 15
    div-float/2addr v4, v6

    .line 16
    div-float/2addr v1, v4

    .line 17
    add-float/2addr v1, v3

    .line 18
    mul-float/2addr v5, v6

    .line 19
    div-float/2addr v1, v5

    .line 20
    const/high16 v3, 0x3f000000    # 0.5f

    .line 21
    .line 22
    add-float/2addr v1, v3

    .line 23
    float-to-int v1, v1

    .line 24
    add-int/2addr v2, v1

    .line 25
    iget v1, p0, Ll/hvu0;->h:I

    .line 26
    .line 27
    add-int/2addr v1, v1

    .line 28
    add-int/2addr v1, v0

    .line 29
    iget-object v3, p0, Ll/hvu0;->j:[S

    .line 30
    .line 31
    invoke-virtual {p0, v3, v0, v1}, Ll/hvu0;->l([SII)[S

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    iput-object v1, p0, Ll/hvu0;->j:[S

    .line 36
    .line 37
    const/4 v1, 0x0

    .line 38
    move v3, v1

    .line 39
    :goto_0
    iget v4, p0, Ll/hvu0;->h:I

    .line 40
    .line 41
    iget v5, p0, Ll/hvu0;->b:I

    .line 42
    .line 43
    add-int/2addr v4, v4

    .line 44
    mul-int v6, v4, v5

    .line 45
    .line 46
    if-ge v3, v6, :cond_0

    .line 47
    .line 48
    iget-object v4, p0, Ll/hvu0;->j:[S

    .line 49
    .line 50
    mul-int/2addr v5, v0

    .line 51
    add-int/2addr v5, v3

    .line 52
    aput-short v1, v4, v5

    .line 53
    .line 54
    add-int/lit8 v3, v3, 0x1

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_0
    iget v0, p0, Ll/hvu0;->k:I

    .line 58
    .line 59
    add-int/2addr v0, v4

    .line 60
    iput v0, p0, Ll/hvu0;->k:I

    .line 61
    .line 62
    invoke-virtual {p0}, Ll/hvu0;->k()V

    .line 63
    .line 64
    .line 65
    iget v0, p0, Ll/hvu0;->m:I

    .line 66
    .line 67
    if-le v0, v2, :cond_1

    .line 68
    .line 69
    iput v2, p0, Ll/hvu0;->m:I

    .line 70
    .line 71
    :cond_1
    iput v1, p0, Ll/hvu0;->k:I

    .line 72
    .line 73
    iput v1, p0, Ll/hvu0;->r:I

    .line 74
    .line 75
    iput v1, p0, Ll/hvu0;->o:I

    .line 76
    .line 77
    return-void
.end method

.method public final f(Ljava/nio/ShortBuffer;)V
    .locals 5

    .line 1
    invoke-virtual {p1}, Ljava/nio/Buffer;->remaining()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget v1, p0, Ll/hvu0;->b:I

    .line 6
    .line 7
    div-int/2addr v0, v1

    .line 8
    mul-int/2addr v1, v0

    .line 9
    iget-object v2, p0, Ll/hvu0;->j:[S

    .line 10
    .line 11
    iget v3, p0, Ll/hvu0;->k:I

    .line 12
    .line 13
    invoke-virtual {p0, v2, v3, v0}, Ll/hvu0;->l([SII)[S

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    iput-object v2, p0, Ll/hvu0;->j:[S

    .line 18
    .line 19
    iget v3, p0, Ll/hvu0;->k:I

    .line 20
    .line 21
    iget v4, p0, Ll/hvu0;->b:I

    .line 22
    .line 23
    mul-int/2addr v3, v4

    .line 24
    add-int/2addr v1, v1

    .line 25
    div-int/lit8 v1, v1, 0x2

    .line 26
    .line 27
    invoke-virtual {p1, v2, v3, v1}, Ljava/nio/ShortBuffer;->get([SII)Ljava/nio/ShortBuffer;

    .line 28
    .line 29
    .line 30
    iget p1, p0, Ll/hvu0;->k:I

    .line 31
    .line 32
    add-int/2addr p1, v0

    .line 33
    iput p1, p0, Ll/hvu0;->k:I

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/hvu0;->k()V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final g([SIII)I
    .locals 9

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    const/16 v2, 0xff

    .line 4
    .line 5
    move v3, v0

    .line 6
    move v4, v3

    .line 7
    :goto_0
    if-gt p3, p4, :cond_5

    .line 8
    .line 9
    move v5, v0

    .line 10
    move v6, v5

    .line 11
    :goto_1
    if-ge v5, p3, :cond_0

    .line 12
    .line 13
    iget v7, p0, Ll/hvu0;->b:I

    .line 14
    .line 15
    mul-int/2addr v7, p2

    .line 16
    add-int v8, v7, v5

    .line 17
    .line 18
    aget-short v8, p1, v8

    .line 19
    .line 20
    add-int/2addr v7, p3

    .line 21
    add-int/2addr v7, v5

    .line 22
    aget-short v7, p1, v7

    .line 23
    .line 24
    sub-int/2addr v8, v7

    .line 25
    invoke-static {v8}, Ljava/lang/Math;->abs(I)I

    .line 26
    .line 27
    .line 28
    move-result v7

    .line 29
    add-int/2addr v6, v7

    .line 30
    add-int/lit8 v5, v5, 0x1

    .line 31
    .line 32
    goto :goto_1

    .line 33
    :cond_0
    mul-int v5, v6, v3

    .line 34
    .line 35
    mul-int v7, v1, p3

    .line 36
    .line 37
    if-ge v5, v7, :cond_1

    .line 38
    .line 39
    move v1, v6

    .line 40
    :cond_1
    if-ge v5, v7, :cond_2

    .line 41
    .line 42
    move v3, p3

    .line 43
    :cond_2
    mul-int v5, v6, v2

    .line 44
    .line 45
    mul-int v7, v4, p3

    .line 46
    .line 47
    if-le v5, v7, :cond_3

    .line 48
    .line 49
    move v4, v6

    .line 50
    :cond_3
    if-le v5, v7, :cond_4

    .line 51
    .line 52
    move v2, p3

    .line 53
    :cond_4
    add-int/lit8 p3, p3, 0x1

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_5
    div-int/2addr v1, v3

    .line 57
    iput v1, p0, Ll/hvu0;->u:I

    .line 58
    .line 59
    div-int/2addr v4, v2

    .line 60
    iput v4, p0, Ll/hvu0;->v:I

    .line 61
    .line 62
    return v3
.end method

.method public final h([SII)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/hvu0;->l:[S

    .line 2
    .line 3
    iget v1, p0, Ll/hvu0;->m:I

    .line 4
    .line 5
    invoke-virtual {p0, v0, v1, p3}, Ll/hvu0;->l([SII)[S

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Ll/hvu0;->l:[S

    .line 10
    .line 11
    iget v1, p0, Ll/hvu0;->m:I

    .line 12
    .line 13
    iget v2, p0, Ll/hvu0;->b:I

    .line 14
    .line 15
    mul-int/2addr v1, v2

    .line 16
    mul-int v3, p3, v2

    .line 17
    .line 18
    mul-int/2addr p2, v2

    .line 19
    invoke-static {p1, p2, v0, v1, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 20
    .line 21
    .line 22
    iget p1, p0, Ll/hvu0;->m:I

    .line 23
    .line 24
    add-int/2addr p1, p3

    .line 25
    iput p1, p0, Ll/hvu0;->m:I

    .line 26
    .line 27
    return-void
.end method

.method public final i([SII)V
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    iget v2, p0, Ll/hvu0;->h:I

    .line 4
    .line 5
    div-int/2addr v2, p3

    .line 6
    if-ge v1, v2, :cond_1

    .line 7
    .line 8
    move v2, v0

    .line 9
    move v3, v2

    .line 10
    :goto_1
    iget v4, p0, Ll/hvu0;->b:I

    .line 11
    .line 12
    mul-int v5, v4, p3

    .line 13
    .line 14
    if-ge v2, v5, :cond_0

    .line 15
    .line 16
    mul-int/2addr v4, p2

    .line 17
    mul-int/2addr v5, v1

    .line 18
    add-int/2addr v4, v5

    .line 19
    add-int/2addr v4, v2

    .line 20
    aget-short v4, p1, v4

    .line 21
    .line 22
    add-int/2addr v3, v4

    .line 23
    add-int/lit8 v2, v2, 0x1

    .line 24
    .line 25
    goto :goto_1

    .line 26
    :cond_0
    div-int/2addr v3, v5

    .line 27
    iget-object v2, p0, Ll/hvu0;->i:[S

    .line 28
    .line 29
    int-to-short v3, v3

    .line 30
    aput-short v3, v2, v1

    .line 31
    .line 32
    add-int/lit8 v1, v1, 0x1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    return-void
.end method

.method public final k()V
    .locals 21

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget v1, v0, Ll/hvu0;->c:F

    .line 4
    .line 5
    iget v2, v0, Ll/hvu0;->d:F

    .line 6
    .line 7
    div-float/2addr v1, v2

    .line 8
    float-to-double v2, v1

    .line 9
    const-wide v4, 0x3ff0000a7c5ac472L    # 1.00001

    .line 10
    .line 11
    .line 12
    .line 13
    .line 14
    cmpl-double v4, v2, v4

    .line 15
    .line 16
    iget v5, v0, Ll/hvu0;->m:I

    .line 17
    .line 18
    const/high16 v6, 0x3f800000    # 1.0f

    .line 19
    .line 20
    const/4 v7, 0x0

    .line 21
    const/4 v8, 0x1

    .line 22
    if-gtz v4, :cond_1

    .line 23
    .line 24
    const-wide v9, 0x3fefffeb074a771dL    # 0.99999

    .line 25
    .line 26
    .line 27
    .line 28
    .line 29
    cmpg-double v4, v2, v9

    .line 30
    .line 31
    if-gez v4, :cond_0

    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_0
    iget-object v1, v0, Ll/hvu0;->j:[S

    .line 35
    .line 36
    iget v2, v0, Ll/hvu0;->k:I

    .line 37
    .line 38
    invoke-virtual {v0, v1, v7, v2}, Ll/hvu0;->h([SII)V

    .line 39
    .line 40
    .line 41
    iput v7, v0, Ll/hvu0;->k:I

    .line 42
    .line 43
    :goto_0
    move/from16 v18, v6

    .line 44
    .line 45
    move/from16 v19, v8

    .line 46
    .line 47
    goto/16 :goto_b

    .line 48
    .line 49
    :cond_1
    :goto_1
    iget v4, v0, Ll/hvu0;->k:I

    .line 50
    .line 51
    iget v9, v0, Ll/hvu0;->h:I

    .line 52
    .line 53
    if-ge v4, v9, :cond_2

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_2
    move v15, v7

    .line 57
    :goto_2
    iget v9, v0, Ll/hvu0;->r:I

    .line 58
    .line 59
    if-lez v9, :cond_3

    .line 60
    .line 61
    iget v10, v0, Ll/hvu0;->h:I

    .line 62
    .line 63
    invoke-static {v10, v9}, Ljava/lang/Math;->min(II)I

    .line 64
    .line 65
    .line 66
    move-result v9

    .line 67
    iget-object v10, v0, Ll/hvu0;->j:[S

    .line 68
    .line 69
    invoke-virtual {v0, v10, v15, v9}, Ll/hvu0;->h([SII)V

    .line 70
    .line 71
    .line 72
    iget v10, v0, Ll/hvu0;->r:I

    .line 73
    .line 74
    sub-int/2addr v10, v9

    .line 75
    iput v10, v0, Ll/hvu0;->r:I

    .line 76
    .line 77
    add-int/2addr v15, v9

    .line 78
    :goto_3
    move/from16 v18, v6

    .line 79
    .line 80
    move/from16 v19, v8

    .line 81
    .line 82
    goto/16 :goto_a

    .line 83
    .line 84
    :cond_3
    iget-object v9, v0, Ll/hvu0;->j:[S

    .line 85
    .line 86
    iget v10, v0, Ll/hvu0;->a:I

    .line 87
    .line 88
    const/16 v11, 0xfa0

    .line 89
    .line 90
    if-le v10, v11, :cond_4

    .line 91
    .line 92
    div-int/lit16 v10, v10, 0xfa0

    .line 93
    .line 94
    goto :goto_4

    .line 95
    :cond_4
    move v10, v8

    .line 96
    :goto_4
    iget v11, v0, Ll/hvu0;->b:I

    .line 97
    .line 98
    if-ne v11, v8, :cond_5

    .line 99
    .line 100
    if-ne v10, v8, :cond_5

    .line 101
    .line 102
    iget v10, v0, Ll/hvu0;->f:I

    .line 103
    .line 104
    iget v11, v0, Ll/hvu0;->g:I

    .line 105
    .line 106
    invoke-virtual {v0, v9, v15, v10, v11}, Ll/hvu0;->g([SIII)I

    .line 107
    .line 108
    .line 109
    move-result v9

    .line 110
    goto :goto_5

    .line 111
    :cond_5
    invoke-virtual {v0, v9, v15, v10}, Ll/hvu0;->i([SII)V

    .line 112
    .line 113
    .line 114
    iget-object v11, v0, Ll/hvu0;->i:[S

    .line 115
    .line 116
    iget v12, v0, Ll/hvu0;->f:I

    .line 117
    .line 118
    iget v13, v0, Ll/hvu0;->g:I

    .line 119
    .line 120
    div-int/2addr v13, v10

    .line 121
    div-int/2addr v12, v10

    .line 122
    invoke-virtual {v0, v11, v7, v12, v13}, Ll/hvu0;->g([SIII)I

    .line 123
    .line 124
    .line 125
    move-result v11

    .line 126
    if-eq v10, v8, :cond_9

    .line 127
    .line 128
    mul-int/2addr v11, v10

    .line 129
    mul-int/lit8 v10, v10, 0x4

    .line 130
    .line 131
    iget v12, v0, Ll/hvu0;->f:I

    .line 132
    .line 133
    sub-int v13, v11, v10

    .line 134
    .line 135
    if-lt v13, v12, :cond_6

    .line 136
    .line 137
    move v12, v13

    .line 138
    :cond_6
    add-int/2addr v11, v10

    .line 139
    iget v10, v0, Ll/hvu0;->g:I

    .line 140
    .line 141
    if-le v11, v10, :cond_7

    .line 142
    .line 143
    move v11, v10

    .line 144
    :cond_7
    iget v10, v0, Ll/hvu0;->b:I

    .line 145
    .line 146
    if-ne v10, v8, :cond_8

    .line 147
    .line 148
    invoke-virtual {v0, v9, v15, v12, v11}, Ll/hvu0;->g([SIII)I

    .line 149
    .line 150
    .line 151
    move-result v9

    .line 152
    goto :goto_5

    .line 153
    :cond_8
    invoke-virtual {v0, v9, v15, v8}, Ll/hvu0;->i([SII)V

    .line 154
    .line 155
    .line 156
    iget-object v9, v0, Ll/hvu0;->i:[S

    .line 157
    .line 158
    invoke-virtual {v0, v9, v7, v12, v11}, Ll/hvu0;->g([SIII)I

    .line 159
    .line 160
    .line 161
    move-result v9

    .line 162
    goto :goto_5

    .line 163
    :cond_9
    move v9, v11

    .line 164
    :goto_5
    iget v10, v0, Ll/hvu0;->u:I

    .line 165
    .line 166
    iget v11, v0, Ll/hvu0;->v:I

    .line 167
    .line 168
    if-eqz v10, :cond_d

    .line 169
    .line 170
    iget v12, v0, Ll/hvu0;->s:I

    .line 171
    .line 172
    if-nez v12, :cond_a

    .line 173
    .line 174
    goto :goto_6

    .line 175
    :cond_a
    mul-int/lit8 v13, v10, 0x3

    .line 176
    .line 177
    if-le v11, v13, :cond_b

    .line 178
    .line 179
    goto :goto_6

    .line 180
    :cond_b
    add-int v11, v10, v10

    .line 181
    .line 182
    iget v13, v0, Ll/hvu0;->t:I

    .line 183
    .line 184
    mul-int/lit8 v13, v13, 0x3

    .line 185
    .line 186
    if-gt v11, v13, :cond_c

    .line 187
    .line 188
    goto :goto_6

    .line 189
    :cond_c
    move v11, v12

    .line 190
    goto :goto_7

    .line 191
    :cond_d
    :goto_6
    move v11, v9

    .line 192
    :goto_7
    add-int v17, v15, v11

    .line 193
    .line 194
    iput v10, v0, Ll/hvu0;->t:I

    .line 195
    .line 196
    iput v9, v0, Ll/hvu0;->s:I

    .line 197
    .line 198
    const-wide/high16 v9, 0x3ff0000000000000L    # 1.0

    .line 199
    .line 200
    cmpl-double v9, v2, v9

    .line 201
    .line 202
    int-to-float v10, v11

    .line 203
    iget-object v14, v0, Ll/hvu0;->j:[S

    .line 204
    .line 205
    const/high16 v12, -0x40800000    # -1.0f

    .line 206
    .line 207
    if-lez v9, :cond_f

    .line 208
    .line 209
    add-float/2addr v12, v1

    .line 210
    const/high16 v9, 0x40000000    # 2.0f

    .line 211
    .line 212
    cmpl-float v13, v1, v9

    .line 213
    .line 214
    if-ltz v13, :cond_e

    .line 215
    .line 216
    div-float/2addr v10, v12

    .line 217
    float-to-int v9, v10

    .line 218
    move v10, v9

    .line 219
    goto :goto_8

    .line 220
    :cond_e
    sub-float/2addr v9, v1

    .line 221
    mul-float/2addr v10, v9

    .line 222
    div-float/2addr v10, v12

    .line 223
    float-to-int v9, v10

    .line 224
    iput v9, v0, Ll/hvu0;->r:I

    .line 225
    .line 226
    move v10, v11

    .line 227
    :goto_8
    iget-object v9, v0, Ll/hvu0;->l:[S

    .line 228
    .line 229
    iget v12, v0, Ll/hvu0;->m:I

    .line 230
    .line 231
    invoke-virtual {v0, v9, v12, v10}, Ll/hvu0;->l([SII)[S

    .line 232
    .line 233
    .line 234
    move-result-object v12

    .line 235
    iput-object v12, v0, Ll/hvu0;->l:[S

    .line 236
    .line 237
    move v9, v11

    .line 238
    iget v11, v0, Ll/hvu0;->b:I

    .line 239
    .line 240
    iget v13, v0, Ll/hvu0;->m:I

    .line 241
    .line 242
    move-object/from16 v16, v14

    .line 243
    .line 244
    invoke-static/range {v10 .. v17}, Ll/hvu0;->j(II[SI[SI[SI)V

    .line 245
    .line 246
    .line 247
    iget v11, v0, Ll/hvu0;->m:I

    .line 248
    .line 249
    add-int/2addr v11, v10

    .line 250
    iput v11, v0, Ll/hvu0;->m:I

    .line 251
    .line 252
    add-int v11, v9, v10

    .line 253
    .line 254
    add-int/2addr v15, v11

    .line 255
    goto/16 :goto_3

    .line 256
    .line 257
    :cond_f
    move v9, v11

    .line 258
    sub-float v11, v6, v1

    .line 259
    .line 260
    const/high16 v13, 0x3f000000    # 0.5f

    .line 261
    .line 262
    cmpg-float v13, v1, v13

    .line 263
    .line 264
    if-gez v13, :cond_10

    .line 265
    .line 266
    mul-float/2addr v10, v1

    .line 267
    div-float/2addr v10, v11

    .line 268
    float-to-int v11, v10

    .line 269
    move v10, v11

    .line 270
    goto :goto_9

    .line 271
    :cond_10
    add-float v13, v1, v1

    .line 272
    .line 273
    add-float/2addr v13, v12

    .line 274
    mul-float/2addr v10, v13

    .line 275
    div-float/2addr v10, v11

    .line 276
    float-to-int v10, v10

    .line 277
    iput v10, v0, Ll/hvu0;->r:I

    .line 278
    .line 279
    move v10, v9

    .line 280
    :goto_9
    iget-object v11, v0, Ll/hvu0;->l:[S

    .line 281
    .line 282
    iget v12, v0, Ll/hvu0;->m:I

    .line 283
    .line 284
    add-int v13, v9, v10

    .line 285
    .line 286
    invoke-virtual {v0, v11, v12, v13}, Ll/hvu0;->l([SII)[S

    .line 287
    .line 288
    .line 289
    move-result-object v11

    .line 290
    iput-object v11, v0, Ll/hvu0;->l:[S

    .line 291
    .line 292
    iget v12, v0, Ll/hvu0;->b:I

    .line 293
    .line 294
    move/from16 v18, v6

    .line 295
    .line 296
    mul-int v6, v15, v12

    .line 297
    .line 298
    move/from16 v19, v8

    .line 299
    .line 300
    iget v8, v0, Ll/hvu0;->m:I

    .line 301
    .line 302
    mul-int/2addr v8, v12

    .line 303
    mul-int/2addr v12, v9

    .line 304
    invoke-static {v14, v6, v11, v8, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 305
    .line 306
    .line 307
    iget v11, v0, Ll/hvu0;->b:I

    .line 308
    .line 309
    iget-object v12, v0, Ll/hvu0;->l:[S

    .line 310
    .line 311
    iget v6, v0, Ll/hvu0;->m:I

    .line 312
    .line 313
    add-int/2addr v6, v9

    .line 314
    move-object/from16 v16, v14

    .line 315
    .line 316
    move/from16 v20, v13

    .line 317
    .line 318
    move v13, v6

    .line 319
    move/from16 v6, v20

    .line 320
    .line 321
    move/from16 v20, v17

    .line 322
    .line 323
    move/from16 v17, v15

    .line 324
    .line 325
    move/from16 v15, v20

    .line 326
    .line 327
    invoke-static/range {v10 .. v17}, Ll/hvu0;->j(II[SI[SI[SI)V

    .line 328
    .line 329
    .line 330
    move/from16 v15, v17

    .line 331
    .line 332
    iget v8, v0, Ll/hvu0;->m:I

    .line 333
    .line 334
    add-int/2addr v8, v6

    .line 335
    iput v8, v0, Ll/hvu0;->m:I

    .line 336
    .line 337
    add-int/2addr v15, v10

    .line 338
    :goto_a
    iget v6, v0, Ll/hvu0;->h:I

    .line 339
    .line 340
    add-int/2addr v6, v15

    .line 341
    if-le v6, v4, :cond_1a

    .line 342
    .line 343
    iget v1, v0, Ll/hvu0;->k:I

    .line 344
    .line 345
    sub-int/2addr v1, v15

    .line 346
    iget-object v2, v0, Ll/hvu0;->j:[S

    .line 347
    .line 348
    iget v3, v0, Ll/hvu0;->b:I

    .line 349
    .line 350
    mul-int/2addr v15, v3

    .line 351
    mul-int/2addr v3, v1

    .line 352
    invoke-static {v2, v15, v2, v7, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 353
    .line 354
    .line 355
    iput v1, v0, Ll/hvu0;->k:I

    .line 356
    .line 357
    :goto_b
    iget v1, v0, Ll/hvu0;->d:F

    .line 358
    .line 359
    iget v2, v0, Ll/hvu0;->e:F

    .line 360
    .line 361
    mul-float/2addr v2, v1

    .line 362
    cmpl-float v1, v2, v18

    .line 363
    .line 364
    if-eqz v1, :cond_19

    .line 365
    .line 366
    iget v1, v0, Ll/hvu0;->m:I

    .line 367
    .line 368
    if-ne v1, v5, :cond_11

    .line 369
    .line 370
    goto/16 :goto_12

    .line 371
    .line 372
    :cond_11
    iget v1, v0, Ll/hvu0;->a:I

    .line 373
    .line 374
    int-to-float v3, v1

    .line 375
    div-float/2addr v3, v2

    .line 376
    float-to-int v2, v3

    .line 377
    :goto_c
    const/16 v3, 0x4000

    .line 378
    .line 379
    if-gt v2, v3, :cond_18

    .line 380
    .line 381
    if-le v1, v3, :cond_12

    .line 382
    .line 383
    goto/16 :goto_11

    .line 384
    .line 385
    :cond_12
    iget v3, v0, Ll/hvu0;->m:I

    .line 386
    .line 387
    sub-int/2addr v3, v5

    .line 388
    iget-object v4, v0, Ll/hvu0;->n:[S

    .line 389
    .line 390
    iget v6, v0, Ll/hvu0;->o:I

    .line 391
    .line 392
    invoke-virtual {v0, v4, v6, v3}, Ll/hvu0;->l([SII)[S

    .line 393
    .line 394
    .line 395
    move-result-object v4

    .line 396
    iput-object v4, v0, Ll/hvu0;->n:[S

    .line 397
    .line 398
    iget-object v6, v0, Ll/hvu0;->l:[S

    .line 399
    .line 400
    iget v8, v0, Ll/hvu0;->b:I

    .line 401
    .line 402
    mul-int v9, v5, v8

    .line 403
    .line 404
    iget v10, v0, Ll/hvu0;->o:I

    .line 405
    .line 406
    mul-int/2addr v10, v8

    .line 407
    mul-int/2addr v8, v3

    .line 408
    invoke-static {v6, v9, v4, v10, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 409
    .line 410
    .line 411
    iput v5, v0, Ll/hvu0;->m:I

    .line 412
    .line 413
    iget v4, v0, Ll/hvu0;->o:I

    .line 414
    .line 415
    add-int/2addr v4, v3

    .line 416
    iput v4, v0, Ll/hvu0;->o:I

    .line 417
    .line 418
    move v3, v7

    .line 419
    :goto_d
    iget v4, v0, Ll/hvu0;->o:I

    .line 420
    .line 421
    add-int/lit8 v5, v4, -0x1

    .line 422
    .line 423
    if-ge v3, v5, :cond_17

    .line 424
    .line 425
    :goto_e
    iget v4, v0, Ll/hvu0;->p:I

    .line 426
    .line 427
    add-int/lit8 v4, v4, 0x1

    .line 428
    .line 429
    mul-int v5, v4, v2

    .line 430
    .line 431
    iget v6, v0, Ll/hvu0;->q:I

    .line 432
    .line 433
    mul-int v8, v6, v1

    .line 434
    .line 435
    if-le v5, v8, :cond_14

    .line 436
    .line 437
    iget-object v4, v0, Ll/hvu0;->l:[S

    .line 438
    .line 439
    iget v5, v0, Ll/hvu0;->m:I

    .line 440
    .line 441
    move/from16 v6, v19

    .line 442
    .line 443
    invoke-virtual {v0, v4, v5, v6}, Ll/hvu0;->l([SII)[S

    .line 444
    .line 445
    .line 446
    move-result-object v4

    .line 447
    iput-object v4, v0, Ll/hvu0;->l:[S

    .line 448
    .line 449
    move v4, v7

    .line 450
    :goto_f
    iget v5, v0, Ll/hvu0;->b:I

    .line 451
    .line 452
    if-ge v4, v5, :cond_13

    .line 453
    .line 454
    iget-object v6, v0, Ll/hvu0;->l:[S

    .line 455
    .line 456
    iget v8, v0, Ll/hvu0;->m:I

    .line 457
    .line 458
    mul-int/2addr v8, v5

    .line 459
    iget-object v9, v0, Ll/hvu0;->n:[S

    .line 460
    .line 461
    mul-int v10, v3, v5

    .line 462
    .line 463
    add-int/2addr v10, v4

    .line 464
    aget-short v11, v9, v10

    .line 465
    .line 466
    add-int/2addr v10, v5

    .line 467
    aget-short v5, v9, v10

    .line 468
    .line 469
    iget v9, v0, Ll/hvu0;->q:I

    .line 470
    .line 471
    mul-int/2addr v9, v1

    .line 472
    iget v10, v0, Ll/hvu0;->p:I

    .line 473
    .line 474
    mul-int v12, v10, v2

    .line 475
    .line 476
    const/16 v19, 0x1

    .line 477
    .line 478
    add-int/lit8 v10, v10, 0x1

    .line 479
    .line 480
    mul-int/2addr v10, v2

    .line 481
    sub-int v9, v10, v9

    .line 482
    .line 483
    mul-int/2addr v11, v9

    .line 484
    sub-int/2addr v10, v12

    .line 485
    sub-int v9, v10, v9

    .line 486
    .line 487
    mul-int/2addr v9, v5

    .line 488
    add-int/2addr v11, v9

    .line 489
    div-int/2addr v11, v10

    .line 490
    int-to-short v5, v11

    .line 491
    add-int/2addr v8, v4

    .line 492
    aput-short v5, v6, v8

    .line 493
    .line 494
    add-int/lit8 v4, v4, 0x1

    .line 495
    .line 496
    goto :goto_f

    .line 497
    :cond_13
    iget v4, v0, Ll/hvu0;->q:I

    .line 498
    .line 499
    const/16 v19, 0x1

    .line 500
    .line 501
    add-int/lit8 v4, v4, 0x1

    .line 502
    .line 503
    iput v4, v0, Ll/hvu0;->q:I

    .line 504
    .line 505
    iget v4, v0, Ll/hvu0;->m:I

    .line 506
    .line 507
    add-int/lit8 v4, v4, 0x1

    .line 508
    .line 509
    iput v4, v0, Ll/hvu0;->m:I

    .line 510
    .line 511
    goto :goto_e

    .line 512
    :cond_14
    iput v4, v0, Ll/hvu0;->p:I

    .line 513
    .line 514
    if-ne v4, v1, :cond_16

    .line 515
    .line 516
    iput v7, v0, Ll/hvu0;->p:I

    .line 517
    .line 518
    if-ne v6, v2, :cond_15

    .line 519
    .line 520
    move/from16 v6, v19

    .line 521
    .line 522
    goto :goto_10

    .line 523
    :cond_15
    move v6, v7

    .line 524
    :goto_10
    invoke-static {v6}, Ll/lev0;->f(Z)V

    .line 525
    .line 526
    .line 527
    iput v7, v0, Ll/hvu0;->q:I

    .line 528
    .line 529
    :cond_16
    add-int/lit8 v3, v3, 0x1

    .line 530
    .line 531
    goto :goto_d

    .line 532
    :cond_17
    if-eqz v5, :cond_19

    .line 533
    .line 534
    iget-object v1, v0, Ll/hvu0;->n:[S

    .line 535
    .line 536
    iget v2, v0, Ll/hvu0;->b:I

    .line 537
    .line 538
    sub-int/2addr v4, v5

    .line 539
    mul-int v3, v5, v2

    .line 540
    .line 541
    mul-int/2addr v4, v2

    .line 542
    invoke-static {v1, v3, v1, v7, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 543
    .line 544
    .line 545
    iget v1, v0, Ll/hvu0;->o:I

    .line 546
    .line 547
    sub-int/2addr v1, v5

    .line 548
    iput v1, v0, Ll/hvu0;->o:I

    .line 549
    .line 550
    return-void

    .line 551
    :cond_18
    :goto_11
    div-int/lit8 v2, v2, 0x2

    .line 552
    .line 553
    div-int/lit8 v1, v1, 0x2

    .line 554
    .line 555
    goto/16 :goto_c

    .line 556
    .line 557
    :cond_19
    :goto_12
    return-void

    .line 558
    :cond_1a
    move/from16 v6, v18

    .line 559
    .line 560
    move/from16 v8, v19

    .line 561
    .line 562
    goto/16 :goto_2
.end method

.method public final l([SII)[S
    .locals 1

    .line 1
    array-length v0, p1

    .line 2
    iget p0, p0, Ll/hvu0;->b:I

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
