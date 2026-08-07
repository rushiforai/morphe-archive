.class public final Ll/si0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/d13;

.field public final b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/ri0;",
            ">;"
        }
    .end annotation
.end field

.field public final c:I

.field public final d:I

.field public final e:I

.field public final f:I

.field public final g:F

.field public final h:[I

.field public final i:Ll/t5d0;


# direct methods
.method public constructor <init>(Ll/d13;IIIIFLl/t5d0;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/si0;->a:Ll/d13;

    .line 5
    .line 6
    new-instance p1, Ljava/util/ArrayList;

    .line 7
    .line 8
    const/4 v0, 0x5

    .line 9
    invoke-direct {p1, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 10
    .line 11
    .line 12
    iput-object p1, p0, Ll/si0;->b:Ljava/util/List;

    .line 13
    .line 14
    iput p2, p0, Ll/si0;->c:I

    .line 15
    .line 16
    iput p3, p0, Ll/si0;->d:I

    .line 17
    .line 18
    iput p4, p0, Ll/si0;->e:I

    .line 19
    .line 20
    iput p5, p0, Ll/si0;->f:I

    .line 21
    .line 22
    iput p6, p0, Ll/si0;->g:F

    .line 23
    .line 24
    const/4 p1, 0x3

    .line 25
    new-array p1, p1, [I

    .line 26
    .line 27
    iput-object p1, p0, Ll/si0;->h:[I

    .line 28
    .line 29
    iput-object p7, p0, Ll/si0;->i:Ll/t5d0;

    .line 30
    .line 31
    return-void
.end method

.method public static a([II)F
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    aget v0, p0, v0

    .line 3
    .line 4
    sub-int/2addr p1, v0

    .line 5
    int-to-float p1, p1

    .line 6
    const/4 v0, 0x1

    .line 7
    aget p0, p0, v0

    .line 8
    .line 9
    int-to-float p0, p0

    .line 10
    const/high16 v0, 0x40000000    # 2.0f

    .line 11
    .line 12
    div-float/2addr p0, v0

    .line 13
    sub-float/2addr p1, p0

    .line 14
    return p1
.end method


# virtual methods
.method public final b(IIII)F
    .locals 9

    .line 1
    iget-object v0, p0, Ll/si0;->a:Ll/d13;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/d13;->j()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    iget-object v2, p0, Ll/si0;->h:[I

    .line 8
    .line 9
    const/4 v3, 0x0

    .line 10
    aput v3, v2, v3

    .line 11
    .line 12
    const/4 v4, 0x1

    .line 13
    aput v3, v2, v4

    .line 14
    .line 15
    const/4 v5, 0x2

    .line 16
    aput v3, v2, v5

    .line 17
    .line 18
    move v6, p1

    .line 19
    :goto_0
    if-ltz v6, :cond_0

    .line 20
    .line 21
    invoke-virtual {v0, p2, v6}, Ll/d13;->d(II)Z

    .line 22
    .line 23
    .line 24
    move-result v7

    .line 25
    if-eqz v7, :cond_0

    .line 26
    .line 27
    aget v7, v2, v4

    .line 28
    .line 29
    if-gt v7, p3, :cond_0

    .line 30
    .line 31
    add-int/lit8 v7, v7, 0x1

    .line 32
    .line 33
    aput v7, v2, v4

    .line 34
    .line 35
    add-int/lit8 v6, v6, -0x1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    const/high16 v7, 0x7fc00000    # Float.NaN

    .line 39
    .line 40
    if-ltz v6, :cond_9

    .line 41
    .line 42
    aget v8, v2, v4

    .line 43
    .line 44
    if-le v8, p3, :cond_1

    .line 45
    .line 46
    goto/16 :goto_4

    .line 47
    .line 48
    :cond_1
    :goto_1
    if-ltz v6, :cond_2

    .line 49
    .line 50
    invoke-virtual {v0, p2, v6}, Ll/d13;->d(II)Z

    .line 51
    .line 52
    .line 53
    move-result v8

    .line 54
    if-nez v8, :cond_2

    .line 55
    .line 56
    aget v8, v2, v3

    .line 57
    .line 58
    if-gt v8, p3, :cond_2

    .line 59
    .line 60
    add-int/lit8 v8, v8, 0x1

    .line 61
    .line 62
    aput v8, v2, v3

    .line 63
    .line 64
    add-int/lit8 v6, v6, -0x1

    .line 65
    .line 66
    goto :goto_1

    .line 67
    :cond_2
    aget v6, v2, v3

    .line 68
    .line 69
    if-le v6, p3, :cond_3

    .line 70
    .line 71
    return v7

    .line 72
    :cond_3
    add-int/2addr p1, v4

    .line 73
    :goto_2
    if-ge p1, v1, :cond_4

    .line 74
    .line 75
    invoke-virtual {v0, p2, p1}, Ll/d13;->d(II)Z

    .line 76
    .line 77
    .line 78
    move-result v6

    .line 79
    if-eqz v6, :cond_4

    .line 80
    .line 81
    aget v6, v2, v4

    .line 82
    .line 83
    if-gt v6, p3, :cond_4

    .line 84
    .line 85
    add-int/lit8 v6, v6, 0x1

    .line 86
    .line 87
    aput v6, v2, v4

    .line 88
    .line 89
    add-int/lit8 p1, p1, 0x1

    .line 90
    .line 91
    goto :goto_2

    .line 92
    :cond_4
    if-eq p1, v1, :cond_9

    .line 93
    .line 94
    aget v6, v2, v4

    .line 95
    .line 96
    if-le v6, p3, :cond_5

    .line 97
    .line 98
    goto :goto_4

    .line 99
    :cond_5
    :goto_3
    if-ge p1, v1, :cond_6

    .line 100
    .line 101
    invoke-virtual {v0, p2, p1}, Ll/d13;->d(II)Z

    .line 102
    .line 103
    .line 104
    move-result v6

    .line 105
    if-nez v6, :cond_6

    .line 106
    .line 107
    aget v6, v2, v5

    .line 108
    .line 109
    if-gt v6, p3, :cond_6

    .line 110
    .line 111
    add-int/lit8 v6, v6, 0x1

    .line 112
    .line 113
    aput v6, v2, v5

    .line 114
    .line 115
    add-int/lit8 p1, p1, 0x1

    .line 116
    .line 117
    goto :goto_3

    .line 118
    :cond_6
    aget p2, v2, v5

    .line 119
    .line 120
    if-le p2, p3, :cond_7

    .line 121
    .line 122
    return v7

    .line 123
    :cond_7
    aget p3, v2, v3

    .line 124
    .line 125
    aget v0, v2, v4

    .line 126
    .line 127
    add-int/2addr p3, v0

    .line 128
    add-int/2addr p3, p2

    .line 129
    sub-int/2addr p3, p4

    .line 130
    invoke-static {p3}, Ljava/lang/Math;->abs(I)I

    .line 131
    .line 132
    .line 133
    move-result p2

    .line 134
    mul-int/lit8 p2, p2, 0x5

    .line 135
    .line 136
    mul-int/2addr p4, v5

    .line 137
    if-lt p2, p4, :cond_8

    .line 138
    .line 139
    return v7

    .line 140
    :cond_8
    invoke-virtual {p0, v2}, Ll/si0;->d([I)Z

    .line 141
    .line 142
    .line 143
    move-result p0

    .line 144
    if-eqz p0, :cond_9

    .line 145
    .line 146
    invoke-static {v2, p1}, Ll/si0;->a([II)F

    .line 147
    .line 148
    .line 149
    move-result p0

    .line 150
    return p0

    .line 151
    :cond_9
    :goto_4
    return v7
.end method

.method public c()Ll/ri0;
    .locals 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 1
    iget v0, p0, Ll/si0;->c:I

    .line 2
    .line 3
    iget v1, p0, Ll/si0;->f:I

    .line 4
    .line 5
    iget v2, p0, Ll/si0;->e:I

    .line 6
    .line 7
    add-int/2addr v2, v0

    .line 8
    iget v3, p0, Ll/si0;->d:I

    .line 9
    .line 10
    div-int/lit8 v4, v1, 0x2

    .line 11
    .line 12
    add-int/2addr v3, v4

    .line 13
    const/4 v4, 0x3

    .line 14
    new-array v4, v4, [I

    .line 15
    .line 16
    const/4 v5, 0x0

    .line 17
    move v6, v5

    .line 18
    :goto_0
    if-ge v6, v1, :cond_9

    .line 19
    .line 20
    and-int/lit8 v7, v6, 0x1

    .line 21
    .line 22
    const/4 v8, 0x2

    .line 23
    if-nez v7, :cond_0

    .line 24
    .line 25
    add-int/lit8 v7, v6, 0x1

    .line 26
    .line 27
    div-int/2addr v7, v8

    .line 28
    goto :goto_1

    .line 29
    :cond_0
    add-int/lit8 v7, v6, 0x1

    .line 30
    .line 31
    div-int/2addr v7, v8

    .line 32
    neg-int v7, v7

    .line 33
    :goto_1
    add-int/2addr v7, v3

    .line 34
    aput v5, v4, v5

    .line 35
    .line 36
    const/4 v9, 0x1

    .line 37
    aput v5, v4, v9

    .line 38
    .line 39
    aput v5, v4, v8

    .line 40
    .line 41
    move v10, v0

    .line 42
    :goto_2
    if-ge v10, v2, :cond_1

    .line 43
    .line 44
    iget-object v11, p0, Ll/si0;->a:Ll/d13;

    .line 45
    .line 46
    invoke-virtual {v11, v10, v7}, Ll/d13;->d(II)Z

    .line 47
    .line 48
    .line 49
    move-result v11

    .line 50
    if-nez v11, :cond_1

    .line 51
    .line 52
    add-int/lit8 v10, v10, 0x1

    .line 53
    .line 54
    goto :goto_2

    .line 55
    :cond_1
    move v11, v5

    .line 56
    :goto_3
    if-ge v10, v2, :cond_7

    .line 57
    .line 58
    iget-object v12, p0, Ll/si0;->a:Ll/d13;

    .line 59
    .line 60
    invoke-virtual {v12, v10, v7}, Ll/d13;->d(II)Z

    .line 61
    .line 62
    .line 63
    move-result v12

    .line 64
    if-eqz v12, :cond_5

    .line 65
    .line 66
    if-ne v11, v9, :cond_2

    .line 67
    .line 68
    aget v12, v4, v9

    .line 69
    .line 70
    add-int/2addr v12, v9

    .line 71
    aput v12, v4, v9

    .line 72
    .line 73
    goto :goto_4

    .line 74
    :cond_2
    if-ne v11, v8, :cond_4

    .line 75
    .line 76
    invoke-virtual {p0, v4}, Ll/si0;->d([I)Z

    .line 77
    .line 78
    .line 79
    move-result v11

    .line 80
    if-eqz v11, :cond_3

    .line 81
    .line 82
    invoke-virtual {p0, v4, v7, v10}, Ll/si0;->e([III)Ll/ri0;

    .line 83
    .line 84
    .line 85
    move-result-object v11

    .line 86
    if-eqz v11, :cond_3

    .line 87
    .line 88
    return-object v11

    .line 89
    :cond_3
    aget v11, v4, v8

    .line 90
    .line 91
    aput v11, v4, v5

    .line 92
    .line 93
    aput v9, v4, v9

    .line 94
    .line 95
    aput v5, v4, v8

    .line 96
    .line 97
    move v11, v9

    .line 98
    goto :goto_4

    .line 99
    :cond_4
    add-int/lit8 v11, v11, 0x1

    .line 100
    .line 101
    aget v12, v4, v11

    .line 102
    .line 103
    add-int/2addr v12, v9

    .line 104
    aput v12, v4, v11

    .line 105
    .line 106
    goto :goto_4

    .line 107
    :cond_5
    if-ne v11, v9, :cond_6

    .line 108
    .line 109
    add-int/lit8 v11, v11, 0x1

    .line 110
    .line 111
    :cond_6
    aget v12, v4, v11

    .line 112
    .line 113
    add-int/2addr v12, v9

    .line 114
    aput v12, v4, v11

    .line 115
    .line 116
    :goto_4
    add-int/lit8 v10, v10, 0x1

    .line 117
    .line 118
    goto :goto_3

    .line 119
    :cond_7
    invoke-virtual {p0, v4}, Ll/si0;->d([I)Z

    .line 120
    .line 121
    .line 122
    move-result v8

    .line 123
    if-eqz v8, :cond_8

    .line 124
    .line 125
    invoke-virtual {p0, v4, v7, v2}, Ll/si0;->e([III)Ll/ri0;

    .line 126
    .line 127
    .line 128
    move-result-object v7

    .line 129
    if-eqz v7, :cond_8

    .line 130
    .line 131
    return-object v7

    .line 132
    :cond_8
    add-int/lit8 v6, v6, 0x1

    .line 133
    .line 134
    goto :goto_0

    .line 135
    :cond_9
    iget-object v0, p0, Ll/si0;->b:Ljava/util/List;

    .line 136
    .line 137
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 138
    .line 139
    .line 140
    move-result v0

    .line 141
    if-nez v0, :cond_a

    .line 142
    .line 143
    iget-object p0, p0, Ll/si0;->b:Ljava/util/List;

    .line 144
    .line 145
    invoke-interface {p0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 146
    .line 147
    .line 148
    move-result-object p0

    .line 149
    check-cast p0, Ll/ri0;

    .line 150
    .line 151
    return-object p0

    .line 152
    :cond_a
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    .line 153
    .line 154
    .line 155
    move-result-object p0

    .line 156
    throw p0
.end method

.method public final d([I)Z
    .locals 4

    .line 1
    iget p0, p0, Ll/si0;->g:F

    .line 2
    .line 3
    const/high16 v0, 0x40000000    # 2.0f

    .line 4
    .line 5
    div-float v0, p0, v0

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    move v2, v1

    .line 9
    :goto_0
    const/4 v3, 0x3

    .line 10
    if-ge v2, v3, :cond_1

    .line 11
    .line 12
    aget v3, p1, v2

    .line 13
    .line 14
    int-to-float v3, v3

    .line 15
    sub-float v3, p0, v3

    .line 16
    .line 17
    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    cmpl-float v3, v3, v0

    .line 22
    .line 23
    if-ltz v3, :cond_0

    .line 24
    .line 25
    return v1

    .line 26
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    const/4 p0, 0x1

    .line 30
    return p0
.end method

.method public final e([III)Ll/ri0;
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    aget v1, p1, v0

    .line 3
    .line 4
    const/4 v2, 0x1

    .line 5
    aget v3, p1, v2

    .line 6
    .line 7
    add-int/2addr v1, v3

    .line 8
    const/4 v3, 0x2

    .line 9
    aget v4, p1, v3

    .line 10
    .line 11
    add-int/2addr v1, v4

    .line 12
    invoke-static {p1, p3}, Ll/si0;->a([II)F

    .line 13
    .line 14
    .line 15
    move-result p3

    .line 16
    float-to-int v4, p3

    .line 17
    aget v5, p1, v2

    .line 18
    .line 19
    mul-int/2addr v5, v3

    .line 20
    invoke-virtual {p0, p2, v4, v5, v1}, Ll/si0;->b(IIII)F

    .line 21
    .line 22
    .line 23
    move-result p2

    .line 24
    invoke-static {p2}, Ljava/lang/Float;->isNaN(F)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-nez v1, :cond_2

    .line 29
    .line 30
    aget v0, p1, v0

    .line 31
    .line 32
    aget v1, p1, v2

    .line 33
    .line 34
    add-int/2addr v0, v1

    .line 35
    aget p1, p1, v3

    .line 36
    .line 37
    add-int/2addr v0, p1

    .line 38
    int-to-float p1, v0

    .line 39
    const/high16 v0, 0x40400000    # 3.0f

    .line 40
    .line 41
    div-float/2addr p1, v0

    .line 42
    iget-object v0, p0, Ll/si0;->b:Ljava/util/List;

    .line 43
    .line 44
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    if-eqz v1, :cond_1

    .line 53
    .line 54
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    check-cast v1, Ll/ri0;

    .line 59
    .line 60
    invoke-virtual {v1, p1, p2, p3}, Ll/ri0;->f(FFF)Z

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    if-eqz v2, :cond_0

    .line 65
    .line 66
    invoke-virtual {v1, p2, p3, p1}, Ll/ri0;->g(FFF)Ll/ri0;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    return-object p0

    .line 71
    :cond_1
    new-instance v0, Ll/ri0;

    .line 72
    .line 73
    invoke-direct {v0, p3, p2, p1}, Ll/ri0;-><init>(FFF)V

    .line 74
    .line 75
    .line 76
    iget-object p1, p0, Ll/si0;->b:Ljava/util/List;

    .line 77
    .line 78
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    iget-object p0, p0, Ll/si0;->i:Ll/t5d0;

    .line 82
    .line 83
    if-eqz p0, :cond_2

    .line 84
    .line 85
    invoke-interface {p0, v0}, Ll/t5d0;->a(Ll/s5d0;)V

    .line 86
    .line 87
    .line 88
    :cond_2
    const/4 p0, 0x0

    .line 89
    return-object p0
.end method
