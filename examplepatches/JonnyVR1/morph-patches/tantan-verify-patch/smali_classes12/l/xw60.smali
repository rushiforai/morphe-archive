.class public final Ll/xw60;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:F

.field public final b:F

.field public final c:F

.field public final d:F

.field public final e:F

.field public final f:F

.field public final g:F

.field public final h:F

.field public final i:F


# direct methods
.method public constructor <init>(FFFFFFFFF)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/xw60;->a:F

    .line 5
    .line 6
    iput p4, p0, Ll/xw60;->b:F

    .line 7
    .line 8
    iput p7, p0, Ll/xw60;->c:F

    .line 9
    .line 10
    iput p2, p0, Ll/xw60;->d:F

    .line 11
    .line 12
    iput p5, p0, Ll/xw60;->e:F

    .line 13
    .line 14
    iput p8, p0, Ll/xw60;->f:F

    .line 15
    .line 16
    iput p3, p0, Ll/xw60;->g:F

    .line 17
    .line 18
    iput p6, p0, Ll/xw60;->h:F

    .line 19
    .line 20
    iput p9, p0, Ll/xw60;->i:F

    .line 21
    .line 22
    return-void
.end method

.method public static b(FFFFFFFFFFFFFFFF)Ll/xw60;
    .locals 0

    .line 1
    invoke-static/range {p0 .. p7}, Ll/xw60;->c(FFFFFFFF)Ll/xw60;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static/range {p8 .. p15}, Ll/xw60;->d(FFFFFFFF)Ll/xw60;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p1, p0}, Ll/xw60;->e(Ll/xw60;)Ll/xw60;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static c(FFFFFFFF)Ll/xw60;
    .locals 0

    .line 1
    invoke-static/range {p0 .. p7}, Ll/xw60;->d(FFFFFFFF)Ll/xw60;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/xw60;->a()Ll/xw60;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static d(FFFFFFFF)Ll/xw60;
    .locals 14

    .line 1
    sub-float v0, p0, p2

    .line 2
    .line 3
    add-float v0, v0, p4

    .line 4
    .line 5
    sub-float v0, v0, p6

    .line 6
    .line 7
    sub-float v1, p1, p3

    .line 8
    .line 9
    add-float v1, v1, p5

    .line 10
    .line 11
    sub-float v1, v1, p7

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    cmpl-float v3, v0, v2

    .line 15
    .line 16
    if-nez v3, :cond_0

    .line 17
    .line 18
    cmpl-float v2, v1, v2

    .line 19
    .line 20
    if-nez v2, :cond_0

    .line 21
    .line 22
    new-instance v3, Ll/xw60;

    .line 23
    .line 24
    sub-float v4, p2, p0

    .line 25
    .line 26
    sub-float v5, p4, p2

    .line 27
    .line 28
    sub-float v7, p3, p1

    .line 29
    .line 30
    sub-float v8, p5, p3

    .line 31
    .line 32
    const/4 v11, 0x0

    .line 33
    const/high16 v12, 0x3f800000    # 1.0f

    .line 34
    .line 35
    const/4 v10, 0x0

    .line 36
    move v6, p0

    .line 37
    move v9, p1

    .line 38
    invoke-direct/range {v3 .. v12}, Ll/xw60;-><init>(FFFFFFFFF)V

    .line 39
    .line 40
    .line 41
    return-object v3

    .line 42
    :cond_0
    sub-float v2, p2, p4

    .line 43
    .line 44
    sub-float v3, p6, p4

    .line 45
    .line 46
    sub-float v4, p3, p5

    .line 47
    .line 48
    sub-float v5, p7, p5

    .line 49
    .line 50
    mul-float v6, v2, v5

    .line 51
    .line 52
    mul-float v7, v3, v4

    .line 53
    .line 54
    sub-float/2addr v6, v7

    .line 55
    mul-float/2addr v5, v0

    .line 56
    mul-float/2addr v3, v1

    .line 57
    sub-float/2addr v5, v3

    .line 58
    div-float v11, v5, v6

    .line 59
    .line 60
    mul-float/2addr v2, v1

    .line 61
    mul-float/2addr v0, v4

    .line 62
    sub-float/2addr v2, v0

    .line 63
    div-float v12, v2, v6

    .line 64
    .line 65
    new-instance v4, Ll/xw60;

    .line 66
    .line 67
    sub-float v0, p2, p0

    .line 68
    .line 69
    mul-float v1, v11, p2

    .line 70
    .line 71
    add-float v5, v0, v1

    .line 72
    .line 73
    sub-float v0, p6, p0

    .line 74
    .line 75
    mul-float v1, v12, p6

    .line 76
    .line 77
    add-float v6, v0, v1

    .line 78
    .line 79
    sub-float v0, p3, p1

    .line 80
    .line 81
    mul-float v1, v11, p3

    .line 82
    .line 83
    add-float v8, v0, v1

    .line 84
    .line 85
    sub-float v0, p7, p1

    .line 86
    .line 87
    mul-float v1, v12, p7

    .line 88
    .line 89
    add-float v9, v0, v1

    .line 90
    .line 91
    const/high16 v13, 0x3f800000    # 1.0f

    .line 92
    .line 93
    move v7, p0

    .line 94
    move v10, p1

    .line 95
    invoke-direct/range {v4 .. v13}, Ll/xw60;-><init>(FFFFFFFFF)V

    .line 96
    .line 97
    .line 98
    return-object v4
.end method


# virtual methods
.method public a()Ll/xw60;
    .locals 14

    .line 1
    new-instance v0, Ll/xw60;

    .line 2
    .line 3
    iget v1, p0, Ll/xw60;->e:F

    .line 4
    .line 5
    iget v2, p0, Ll/xw60;->i:F

    .line 6
    .line 7
    mul-float v3, v1, v2

    .line 8
    .line 9
    iget v4, p0, Ll/xw60;->f:F

    .line 10
    .line 11
    iget v5, p0, Ll/xw60;->h:F

    .line 12
    .line 13
    mul-float v6, v4, v5

    .line 14
    .line 15
    sub-float/2addr v3, v6

    .line 16
    iget v6, p0, Ll/xw60;->g:F

    .line 17
    .line 18
    mul-float v7, v4, v6

    .line 19
    .line 20
    iget v8, p0, Ll/xw60;->d:F

    .line 21
    .line 22
    mul-float v9, v8, v2

    .line 23
    .line 24
    sub-float/2addr v7, v9

    .line 25
    mul-float v9, v8, v5

    .line 26
    .line 27
    mul-float v10, v1, v6

    .line 28
    .line 29
    sub-float/2addr v9, v10

    .line 30
    iget v10, p0, Ll/xw60;->c:F

    .line 31
    .line 32
    mul-float v11, v10, v5

    .line 33
    .line 34
    iget v12, p0, Ll/xw60;->b:F

    .line 35
    .line 36
    mul-float v13, v12, v2

    .line 37
    .line 38
    sub-float/2addr v11, v13

    .line 39
    iget p0, p0, Ll/xw60;->a:F

    .line 40
    .line 41
    mul-float/2addr v2, p0

    .line 42
    mul-float v13, v10, v6

    .line 43
    .line 44
    sub-float/2addr v2, v13

    .line 45
    mul-float/2addr v6, v12

    .line 46
    mul-float/2addr v5, p0

    .line 47
    sub-float/2addr v6, v5

    .line 48
    mul-float v5, v12, v4

    .line 49
    .line 50
    mul-float v13, v10, v1

    .line 51
    .line 52
    sub-float/2addr v5, v13

    .line 53
    mul-float/2addr v10, v8

    .line 54
    mul-float/2addr v4, p0

    .line 55
    sub-float/2addr v10, v4

    .line 56
    mul-float/2addr p0, v1

    .line 57
    mul-float/2addr v12, v8

    .line 58
    sub-float/2addr p0, v12

    .line 59
    move v1, v5

    .line 60
    move v5, v2

    .line 61
    move v2, v7

    .line 62
    move v7, v1

    .line 63
    move v1, v3

    .line 64
    move v3, v9

    .line 65
    move v8, v10

    .line 66
    move v4, v11

    .line 67
    move v9, p0

    .line 68
    invoke-direct/range {v0 .. v9}, Ll/xw60;-><init>(FFFFFFFFF)V

    .line 69
    .line 70
    .line 71
    return-object v0
.end method

.method public e(Ll/xw60;)Ll/xw60;
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    new-instance v2, Ll/xw60;

    .line 6
    .line 7
    iget v3, v0, Ll/xw60;->a:F

    .line 8
    .line 9
    iget v4, v1, Ll/xw60;->a:F

    .line 10
    .line 11
    mul-float v5, v3, v4

    .line 12
    .line 13
    iget v6, v0, Ll/xw60;->d:F

    .line 14
    .line 15
    iget v7, v1, Ll/xw60;->b:F

    .line 16
    .line 17
    mul-float v8, v6, v7

    .line 18
    .line 19
    add-float/2addr v5, v8

    .line 20
    iget v8, v0, Ll/xw60;->g:F

    .line 21
    .line 22
    iget v9, v1, Ll/xw60;->c:F

    .line 23
    .line 24
    mul-float v10, v8, v9

    .line 25
    .line 26
    add-float/2addr v5, v10

    .line 27
    iget v10, v1, Ll/xw60;->d:F

    .line 28
    .line 29
    mul-float v11, v3, v10

    .line 30
    .line 31
    iget v12, v1, Ll/xw60;->e:F

    .line 32
    .line 33
    mul-float v13, v6, v12

    .line 34
    .line 35
    add-float/2addr v11, v13

    .line 36
    iget v13, v1, Ll/xw60;->f:F

    .line 37
    .line 38
    mul-float v14, v8, v13

    .line 39
    .line 40
    add-float/2addr v11, v14

    .line 41
    iget v14, v1, Ll/xw60;->g:F

    .line 42
    .line 43
    mul-float/2addr v3, v14

    .line 44
    iget v15, v1, Ll/xw60;->h:F

    .line 45
    .line 46
    mul-float/2addr v6, v15

    .line 47
    add-float/2addr v3, v6

    .line 48
    iget v1, v1, Ll/xw60;->i:F

    .line 49
    .line 50
    mul-float/2addr v8, v1

    .line 51
    add-float/2addr v3, v8

    .line 52
    iget v6, v0, Ll/xw60;->b:F

    .line 53
    .line 54
    mul-float v8, v6, v4

    .line 55
    .line 56
    move/from16 p1, v1

    .line 57
    .line 58
    iget v1, v0, Ll/xw60;->e:F

    .line 59
    .line 60
    mul-float v16, v1, v7

    .line 61
    .line 62
    add-float v8, v8, v16

    .line 63
    .line 64
    move/from16 v16, v1

    .line 65
    .line 66
    iget v1, v0, Ll/xw60;->h:F

    .line 67
    .line 68
    mul-float v17, v1, v9

    .line 69
    .line 70
    add-float v8, v8, v17

    .line 71
    .line 72
    mul-float v17, v6, v10

    .line 73
    .line 74
    mul-float v18, v16, v12

    .line 75
    .line 76
    add-float v17, v17, v18

    .line 77
    .line 78
    mul-float v18, v1, v13

    .line 79
    .line 80
    add-float v17, v17, v18

    .line 81
    .line 82
    mul-float/2addr v6, v14

    .line 83
    mul-float v16, v16, v15

    .line 84
    .line 85
    add-float v6, v6, v16

    .line 86
    .line 87
    mul-float v1, v1, p1

    .line 88
    .line 89
    add-float/2addr v6, v1

    .line 90
    iget v1, v0, Ll/xw60;->c:F

    .line 91
    .line 92
    mul-float/2addr v4, v1

    .line 93
    move/from16 v16, v1

    .line 94
    .line 95
    iget v1, v0, Ll/xw60;->f:F

    .line 96
    .line 97
    mul-float/2addr v7, v1

    .line 98
    add-float/2addr v4, v7

    .line 99
    iget v0, v0, Ll/xw60;->i:F

    .line 100
    .line 101
    mul-float/2addr v9, v0

    .line 102
    add-float v7, v4, v9

    .line 103
    .line 104
    mul-float v4, v16, v10

    .line 105
    .line 106
    mul-float/2addr v12, v1

    .line 107
    add-float/2addr v4, v12

    .line 108
    mul-float/2addr v13, v0

    .line 109
    add-float/2addr v4, v13

    .line 110
    mul-float v9, v16, v14

    .line 111
    .line 112
    mul-float/2addr v1, v15

    .line 113
    add-float/2addr v9, v1

    .line 114
    mul-float v0, v0, p1

    .line 115
    .line 116
    add-float/2addr v9, v0

    .line 117
    move v0, v8

    .line 118
    move v8, v4

    .line 119
    move v4, v0

    .line 120
    move-object v0, v2

    .line 121
    move v1, v5

    .line 122
    move v2, v11

    .line 123
    move/from16 v5, v17

    .line 124
    .line 125
    invoke-direct/range {v0 .. v9}, Ll/xw60;-><init>(FFFFFFFFF)V

    .line 126
    .line 127
    .line 128
    return-object v0
.end method

.method public f([F)V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    array-length v2, v1

    .line 6
    iget v3, v0, Ll/xw60;->a:F

    .line 7
    .line 8
    iget v4, v0, Ll/xw60;->b:F

    .line 9
    .line 10
    iget v5, v0, Ll/xw60;->c:F

    .line 11
    .line 12
    iget v6, v0, Ll/xw60;->d:F

    .line 13
    .line 14
    iget v7, v0, Ll/xw60;->e:F

    .line 15
    .line 16
    iget v8, v0, Ll/xw60;->f:F

    .line 17
    .line 18
    iget v9, v0, Ll/xw60;->g:F

    .line 19
    .line 20
    iget v10, v0, Ll/xw60;->h:F

    .line 21
    .line 22
    iget v0, v0, Ll/xw60;->i:F

    .line 23
    .line 24
    const/4 v11, 0x0

    .line 25
    :goto_0
    if-ge v11, v2, :cond_0

    .line 26
    .line 27
    aget v12, v1, v11

    .line 28
    .line 29
    add-int/lit8 v13, v11, 0x1

    .line 30
    .line 31
    aget v14, v1, v13

    .line 32
    .line 33
    mul-float v15, v5, v12

    .line 34
    .line 35
    mul-float v16, v8, v14

    .line 36
    .line 37
    add-float v15, v15, v16

    .line 38
    .line 39
    add-float/2addr v15, v0

    .line 40
    mul-float v16, v3, v12

    .line 41
    .line 42
    mul-float v17, v6, v14

    .line 43
    .line 44
    add-float v16, v16, v17

    .line 45
    .line 46
    add-float v16, v16, v9

    .line 47
    .line 48
    div-float v16, v16, v15

    .line 49
    .line 50
    aput v16, v1, v11

    .line 51
    .line 52
    mul-float/2addr v12, v4

    .line 53
    mul-float/2addr v14, v7

    .line 54
    add-float/2addr v12, v14

    .line 55
    add-float/2addr v12, v10

    .line 56
    div-float/2addr v12, v15

    .line 57
    aput v12, v1, v13

    .line 58
    .line 59
    add-int/lit8 v11, v11, 0x2

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_0
    return-void
.end method
