.class public Lproject/android/imageprocessing/ext/a;
.super Ll/jt2;
.source "SourceFile"


# instance fields
.field private a:F

.field private b:F

.field private c:F

.field private d:I

.field private e:Z

.field private f:I

.field private g:I

.field private i:I

.field private j:I

.field private k:I

.field private l:I

.field private m:[Ljava/nio/FloatBuffer;

.field private n:[F

.field private o:[F

.field private p:[F

.field private q:[F

.field private r:Z

.field private s:I

.field private t:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/jt2;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lproject/android/imageprocessing/ext/a;->d:I

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    iput-boolean v1, p0, Lproject/android/imageprocessing/ext/a;->e:Z

    .line 9
    .line 10
    iput v0, p0, Lproject/android/imageprocessing/ext/a;->f:I

    .line 11
    .line 12
    iput v1, p0, Lproject/android/imageprocessing/ext/a;->g:I

    .line 13
    .line 14
    iput v0, p0, Lproject/android/imageprocessing/ext/a;->s:I

    .line 15
    .line 16
    const-string v1, ""

    .line 17
    .line 18
    iput-object v1, p0, Lproject/android/imageprocessing/ext/a;->t:Ljava/lang/String;

    .line 19
    .line 20
    iput-boolean v0, p0, Lproject/android/imageprocessing/ext/a;->r:Z

    .line 21
    .line 22
    const v0, 0x3faaaaab

    .line 23
    .line 24
    .line 25
    iput v0, p0, Lproject/android/imageprocessing/ext/a;->a:F

    .line 26
    .line 27
    return-void
.end method

.method private Q1(II)V
    .locals 2

    .line 1
    int-to-float p1, p1

    .line 2
    const/high16 v0, 0x3f800000    # 1.0f

    .line 3
    .line 4
    mul-float/2addr p1, v0

    .line 5
    iget v1, p0, Lproject/android/imageprocessing/ext/a;->b:F

    .line 6
    .line 7
    div-float/2addr p1, v1

    .line 8
    int-to-float p2, p2

    .line 9
    mul-float/2addr p2, v0

    .line 10
    iget v0, p0, Lproject/android/imageprocessing/ext/a;->c:F

    .line 11
    .line 12
    div-float/2addr p2, v0

    .line 13
    const/high16 v0, 0x3f000000    # 0.5f

    .line 14
    .line 15
    cmpg-float p1, p1, v0

    .line 16
    .line 17
    if-gtz p1, :cond_0

    .line 18
    .line 19
    cmpg-float p1, p2, v0

    .line 20
    .line 21
    if-gtz p1, :cond_0

    .line 22
    .line 23
    const/4 p1, 0x2

    .line 24
    iput p1, p0, Lproject/android/imageprocessing/ext/a;->f:I

    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    const/4 p1, 0x0

    .line 28
    iput p1, p0, Lproject/android/imageprocessing/ext/a;->f:I

    .line 29
    .line 30
    return-void
.end method

.method private R1()V
    .locals 7

    .line 1
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    int-to-float v2, v1

    .line 10
    iget v3, p0, Lproject/android/imageprocessing/ext/a;->b:F

    .line 11
    .line 12
    const/high16 v4, 0x3f800000    # 1.0f

    .line 13
    .line 14
    mul-float v5, v3, v4

    .line 15
    .line 16
    iget v6, p0, Lproject/android/imageprocessing/ext/a;->c:F

    .line 17
    .line 18
    div-float/2addr v5, v6

    .line 19
    mul-float/2addr v2, v5

    .line 20
    float-to-int v2, v2

    .line 21
    int-to-float v5, v0

    .line 22
    mul-float/2addr v6, v4

    .line 23
    div-float/2addr v6, v3

    .line 24
    mul-float/2addr v5, v6

    .line 25
    float-to-int v3, v5

    .line 26
    const/4 v5, 0x0

    .line 27
    if-ge v2, v0, :cond_0

    .line 28
    .line 29
    sub-int/2addr v0, v2

    .line 30
    div-int/lit8 v0, v0, 0x2

    .line 31
    .line 32
    move v3, v1

    .line 33
    move v1, v5

    .line 34
    goto :goto_0

    .line 35
    :cond_0
    if-ge v3, v1, :cond_1

    .line 36
    .line 37
    sub-int/2addr v1, v3

    .line 38
    div-int/lit8 v1, v1, 0x2

    .line 39
    .line 40
    move v2, v0

    .line 41
    move v0, v5

    .line 42
    goto :goto_0

    .line 43
    :cond_1
    move v2, v0

    .line 44
    move v3, v1

    .line 45
    move v0, v5

    .line 46
    move v1, v0

    .line 47
    :goto_0
    add-int/lit8 v2, v2, 0x1

    .line 48
    .line 49
    invoke-static {v0, v1, v2, v3}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 50
    .line 51
    .line 52
    const/4 v0, 0x0

    .line 53
    invoke-static {v0, v0, v0, v4}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    .line 54
    .line 55
    .line 56
    const/16 v0, 0x4100

    .line 57
    .line 58
    invoke-static {v0}, Landroid/opengl/GLES20;->glClear(I)V

    .line 59
    .line 60
    .line 61
    iget v0, p0, Ll/wej;->programHandle:I

    .line 62
    .line 63
    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0}, Lproject/android/imageprocessing/ext/a;->passShaderValues()V

    .line 67
    .line 68
    .line 69
    const/4 v0, 0x5

    .line 70
    const/4 v1, 0x4

    .line 71
    invoke-static {v0, v5, v1}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0}, Ll/wej;->disableDrawArray()V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method private S1(F)V
    .locals 7

    .line 1
    iget v0, p0, Lproject/android/imageprocessing/ext/a;->c:F

    .line 2
    .line 3
    div-float v1, v0, p1

    .line 4
    .line 5
    float-to-int v1, v1

    .line 6
    iget v2, p0, Lproject/android/imageprocessing/ext/a;->b:F

    .line 7
    .line 8
    mul-float/2addr p1, v2

    .line 9
    float-to-int p1, p1

    .line 10
    int-to-float v1, v1

    .line 11
    cmpg-float v3, v1, v2

    .line 12
    .line 13
    const/4 v4, 0x0

    .line 14
    const/high16 v5, 0x3f000000    # 0.5f

    .line 15
    .line 16
    const/high16 v6, 0x3f800000    # 1.0f

    .line 17
    .line 18
    if-gez v3, :cond_0

    .line 19
    .line 20
    sub-float p1, v2, v1

    .line 21
    .line 22
    mul-float/2addr p1, v5

    .line 23
    div-float/2addr p1, v2

    .line 24
    sub-float v0, v6, p1

    .line 25
    .line 26
    invoke-direct {p0, p1, v0, v4, v6}, Lproject/android/imageprocessing/ext/a;->T1(FFFF)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    int-to-float p1, p1

    .line 31
    sub-float p1, v0, p1

    .line 32
    .line 33
    mul-float/2addr p1, v5

    .line 34
    div-float/2addr p1, v0

    .line 35
    sub-float v0, v6, p1

    .line 36
    .line 37
    invoke-direct {p0, v4, v6, p1, v0}, Lproject/android/imageprocessing/ext/a;->T1(FFFF)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method private T1(FFFF)V
    .locals 11

    .line 1
    iget-boolean v0, p0, Lproject/android/imageprocessing/ext/a;->r:Z

    .line 2
    .line 3
    const/4 v1, 0x4

    .line 4
    const/4 v2, 0x1

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    new-array v0, v1, [Ljava/nio/FloatBuffer;

    .line 8
    .line 9
    iput-object v0, p0, Lproject/android/imageprocessing/ext/a;->m:[Ljava/nio/FloatBuffer;

    .line 10
    .line 11
    const/16 v0, 0x8

    .line 12
    .line 13
    new-array v3, v0, [F

    .line 14
    .line 15
    iput-object v3, p0, Lproject/android/imageprocessing/ext/a;->n:[F

    .line 16
    .line 17
    new-array v3, v0, [F

    .line 18
    .line 19
    iput-object v3, p0, Lproject/android/imageprocessing/ext/a;->o:[F

    .line 20
    .line 21
    new-array v3, v0, [F

    .line 22
    .line 23
    iput-object v3, p0, Lproject/android/imageprocessing/ext/a;->p:[F

    .line 24
    .line 25
    new-array v0, v0, [F

    .line 26
    .line 27
    iput-object v0, p0, Lproject/android/imageprocessing/ext/a;->q:[F

    .line 28
    .line 29
    iput-boolean v2, p0, Lproject/android/imageprocessing/ext/a;->r:Z

    .line 30
    .line 31
    :cond_0
    iget-boolean v0, p0, Lproject/android/imageprocessing/ext/a;->r:Z

    .line 32
    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    iget-object v0, p0, Lproject/android/imageprocessing/ext/a;->n:[F

    .line 36
    .line 37
    const/4 v3, 0x0

    .line 38
    aput p1, v0, v3

    .line 39
    .line 40
    aput p3, v0, v2

    .line 41
    .line 42
    const/4 v4, 0x2

    .line 43
    aput p2, v0, v4

    .line 44
    .line 45
    const/4 v5, 0x3

    .line 46
    aput p3, v0, v5

    .line 47
    .line 48
    aput p1, v0, v1

    .line 49
    .line 50
    const/4 v6, 0x5

    .line 51
    aput p4, v0, v6

    .line 52
    .line 53
    const/4 v7, 0x6

    .line 54
    aput p2, v0, v7

    .line 55
    .line 56
    const/4 v8, 0x7

    .line 57
    aput p4, v0, v8

    .line 58
    .line 59
    iget-object v9, p0, Lproject/android/imageprocessing/ext/a;->m:[Ljava/nio/FloatBuffer;

    .line 60
    .line 61
    aget-object v10, v9, v3

    .line 62
    .line 63
    invoke-static {v10, v0}, Ll/ch3;->a(Ljava/nio/FloatBuffer;[F)Ljava/nio/FloatBuffer;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    aput-object v0, v9, v3

    .line 68
    .line 69
    iget-object v0, p0, Lproject/android/imageprocessing/ext/a;->o:[F

    .line 70
    .line 71
    aput p1, v0, v3

    .line 72
    .line 73
    aput p4, v0, v2

    .line 74
    .line 75
    aput p1, v0, v4

    .line 76
    .line 77
    aput p3, v0, v5

    .line 78
    .line 79
    aput p2, v0, v1

    .line 80
    .line 81
    aput p4, v0, v6

    .line 82
    .line 83
    aput p2, v0, v7

    .line 84
    .line 85
    aput p3, v0, v8

    .line 86
    .line 87
    iget-object v9, p0, Lproject/android/imageprocessing/ext/a;->m:[Ljava/nio/FloatBuffer;

    .line 88
    .line 89
    aget-object v10, v9, v2

    .line 90
    .line 91
    invoke-static {v10, v0}, Ll/ch3;->a(Ljava/nio/FloatBuffer;[F)Ljava/nio/FloatBuffer;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    aput-object v0, v9, v2

    .line 96
    .line 97
    iget-object v0, p0, Lproject/android/imageprocessing/ext/a;->p:[F

    .line 98
    .line 99
    aput p2, v0, v3

    .line 100
    .line 101
    aput p4, v0, v2

    .line 102
    .line 103
    aput p1, v0, v4

    .line 104
    .line 105
    aput p4, v0, v5

    .line 106
    .line 107
    aput p2, v0, v1

    .line 108
    .line 109
    aput p3, v0, v6

    .line 110
    .line 111
    aput p1, v0, v7

    .line 112
    .line 113
    aput p3, v0, v8

    .line 114
    .line 115
    iget-object v9, p0, Lproject/android/imageprocessing/ext/a;->m:[Ljava/nio/FloatBuffer;

    .line 116
    .line 117
    aget-object v10, v9, v4

    .line 118
    .line 119
    invoke-static {v10, v0}, Ll/ch3;->a(Ljava/nio/FloatBuffer;[F)Ljava/nio/FloatBuffer;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    aput-object v0, v9, v4

    .line 124
    .line 125
    iget-object v0, p0, Lproject/android/imageprocessing/ext/a;->q:[F

    .line 126
    .line 127
    aput p2, v0, v3

    .line 128
    .line 129
    aput p3, v0, v2

    .line 130
    .line 131
    aput p2, v0, v4

    .line 132
    .line 133
    aput p4, v0, v5

    .line 134
    .line 135
    aput p1, v0, v1

    .line 136
    .line 137
    aput p3, v0, v6

    .line 138
    .line 139
    aput p1, v0, v7

    .line 140
    .line 141
    aput p4, v0, v8

    .line 142
    .line 143
    iget-object p0, p0, Lproject/android/imageprocessing/ext/a;->m:[Ljava/nio/FloatBuffer;

    .line 144
    .line 145
    aget-object p1, p0, v5

    .line 146
    .line 147
    invoke-static {p1, v0}, Ll/ch3;->a(Ljava/nio/FloatBuffer;[F)Ljava/nio/FloatBuffer;

    .line 148
    .line 149
    .line 150
    move-result-object p1

    .line 151
    aput-object p1, p0, v5

    .line 152
    .line 153
    :cond_1
    return-void
.end method

.method private drawIndeed()V
    .locals 5

    .line 1
    iget v0, p0, Ll/wej;->texture_in:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget v0, p0, Lproject/android/imageprocessing/ext/a;->g:I

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    const/high16 v2, 0x3f800000    # 1.0f

    .line 10
    .line 11
    if-ne v0, v1, :cond_2

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    invoke-direct {p0, v0, v1}, Lproject/android/imageprocessing/ext/a;->Q1(II)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    int-to-float v0, v0

    .line 29
    mul-float/2addr v0, v2

    .line 30
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    int-to-float v1, v1

    .line 35
    div-float/2addr v0, v1

    .line 36
    iget v1, p0, Lproject/android/imageprocessing/ext/a;->a:F

    .line 37
    .line 38
    cmpl-float v0, v0, v1

    .line 39
    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    int-to-float v0, v0

    .line 47
    mul-float/2addr v0, v2

    .line 48
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    int-to-float v1, v1

    .line 53
    div-float/2addr v0, v1

    .line 54
    invoke-direct {p0, v0}, Lproject/android/imageprocessing/ext/a;->S1(F)V

    .line 55
    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_1
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    int-to-float v0, v0

    .line 63
    mul-float/2addr v0, v2

    .line 64
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    int-to-float v1, v1

    .line 69
    div-float/2addr v0, v1

    .line 70
    invoke-direct {p0, v0}, Lproject/android/imageprocessing/ext/a;->S1(F)V

    .line 71
    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_2
    const/4 v1, 0x2

    .line 75
    if-ne v0, v1, :cond_4

    .line 76
    .line 77
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 82
    .line 83
    .line 84
    move-result v1

    .line 85
    invoke-direct {p0, v0, v1}, Lproject/android/imageprocessing/ext/a;->Q1(II)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    int-to-float v0, v0

    .line 93
    mul-float/2addr v0, v2

    .line 94
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    int-to-float v1, v1

    .line 99
    div-float/2addr v0, v1

    .line 100
    iget v1, p0, Lproject/android/imageprocessing/ext/a;->a:F

    .line 101
    .line 102
    cmpl-float v0, v0, v1

    .line 103
    .line 104
    if-eqz v0, :cond_3

    .line 105
    .line 106
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    int-to-float v0, v0

    .line 111
    mul-float/2addr v0, v2

    .line 112
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 113
    .line 114
    .line 115
    move-result v1

    .line 116
    int-to-float v1, v1

    .line 117
    div-float/2addr v0, v1

    .line 118
    invoke-direct {p0, v0}, Lproject/android/imageprocessing/ext/a;->S1(F)V

    .line 119
    .line 120
    .line 121
    goto :goto_0

    .line 122
    :cond_3
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    int-to-float v0, v0

    .line 127
    mul-float/2addr v0, v2

    .line 128
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 129
    .line 130
    .line 131
    move-result v1

    .line 132
    int-to-float v1, v1

    .line 133
    div-float/2addr v0, v1

    .line 134
    invoke-direct {p0, v0}, Lproject/android/imageprocessing/ext/a;->S1(F)V

    .line 135
    .line 136
    .line 137
    :cond_4
    :goto_0
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 138
    .line 139
    .line 140
    move-result v0

    .line 141
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 142
    .line 143
    .line 144
    move-result v1

    .line 145
    const/4 v2, 0x0

    .line 146
    invoke-static {v2, v2, v0, v1}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 147
    .line 148
    .line 149
    iget v0, p0, Ll/wej;->programHandle:I

    .line 150
    .line 151
    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 152
    .line 153
    .line 154
    const/16 v0, 0x4100

    .line 155
    .line 156
    invoke-static {v0}, Landroid/opengl/GLES20;->glClear(I)V

    .line 157
    .line 158
    .line 159
    invoke-virtual {p0}, Ll/wej;->getBackgroundRed()F

    .line 160
    .line 161
    .line 162
    move-result v0

    .line 163
    invoke-virtual {p0}, Ll/wej;->getBackgroundGreen()F

    .line 164
    .line 165
    .line 166
    move-result v1

    .line 167
    invoke-virtual {p0}, Ll/wej;->getBackgroundBlue()F

    .line 168
    .line 169
    .line 170
    move-result v3

    .line 171
    invoke-virtual {p0}, Ll/wej;->getBackgroundAlpha()F

    .line 172
    .line 173
    .line 174
    move-result v4

    .line 175
    invoke-static {v0, v1, v3, v4}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    .line 176
    .line 177
    .line 178
    invoke-virtual {p0}, Lproject/android/imageprocessing/ext/a;->passShaderValues()V

    .line 179
    .line 180
    .line 181
    const/4 v0, 0x5

    .line 182
    const/4 v1, 0x4

    .line 183
    invoke-static {v0, v2, v1}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 184
    .line 185
    .line 186
    invoke-virtual {p0}, Ll/wej;->disableDrawArray()V

    .line 187
    .line 188
    .line 189
    return-void
.end method


# virtual methods
.method public U1(I)V
    .locals 0

    .line 1
    iput p1, p0, Lproject/android/imageprocessing/ext/a;->s:I

    .line 2
    .line 3
    return-void
.end method

.method public V1(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lproject/android/imageprocessing/ext/a;->t:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public W1(I)V
    .locals 0

    .line 1
    iput p1, p0, Lproject/android/imageprocessing/ext/a;->g:I

    .line 2
    .line 3
    return-void
.end method

.method public drawSub()V
    .locals 1

    .line 1
    iget v0, p0, Lproject/android/imageprocessing/ext/a;->s:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lproject/android/imageprocessing/ext/a;->drawIndeed()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-direct {p0}, Lproject/android/imageprocessing/ext/a;->R1()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public getFragmentShader()Ljava/lang/String;
    .locals 2

    .line 1
    iget v0, p0, Lproject/android/imageprocessing/ext/a;->s:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    invoke-super {p0}, Ll/wej;->getFragmentShader()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0

    .line 11
    :cond_0
    const-string p0, "precision mediump float;\nuniform sampler2D inputImageTexture0;\nvarying vec2 textureCoordinate;\nvarying vec2 xy_step;\nvarying float pos; \nvarying float smooth; \nvoid main(){\nvec2 point = textureCoordinate; \nvec4 image_c = texture2D(inputImageTexture0,point); \nvec4 image = image_c;\nif (smooth >= 0.1) { \nvec4 image_lt=texture2D(inputImageTexture0, clamp(point+vec2(-xy_step.x,  xy_step.y), 0.0, 1.0)); \nvec4 image_lb=texture2D(inputImageTexture0, clamp(point+vec2(-xy_step.x, -xy_step.y), 0.0, 1.0)); \nvec4 image_rt=texture2D(inputImageTexture0, clamp(point+vec2( xy_step.x,  xy_step.y), 0.0, 1.0)); \nvec4 image_rb=texture2D(inputImageTexture0, clamp(point+vec2( xy_step.x, -xy_step.y), 0.0, 1.0)); \nvec4 image_l =texture2D(inputImageTexture0, clamp(point+vec2(-xy_step.x,     0.0), 0.0, 1.0)); \nvec4 image_r =texture2D(inputImageTexture0, clamp(point+vec2( xy_step.x,     0.0), 0.0, 1.0)); \nvec4 image_t =texture2D(inputImageTexture0, clamp(point+vec2(    0.0,  xy_step.y), 0.0, 1.0)); \nvec4 image_b =texture2D(inputImageTexture0, clamp(point+vec2(    0.0, -xy_step.y), 0.0, 1.0)); \nimage = clamp(image_c*0.25+(image_lt+image_lb+image_rt+image_rb)*0.125+(image_l+image_t+image_b+image_r)*0.0625, 0.0, 1.0); \n} \ngl_FragColor = image;\n}\n"

    .line 12
    .line 13
    return-object p0
.end method

.method public getVertexShader()Ljava/lang/String;
    .locals 2

    .line 1
    iget v0, p0, Lproject/android/imageprocessing/ext/a;->s:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    invoke-super {p0}, Ll/wej;->getVertexShader()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0

    .line 11
    :cond_0
    const-string p0, "attribute vec4 position;\nattribute vec2 inputTextureCoordinate;\nvarying vec2 textureCoordinate;\nuniform float widthStep; \nuniform float heightStep; \nuniform float displayPos; \nuniform float smoothMode; \nvarying float smooth; \nvarying float pos; \nvarying vec2 xy_step;\nvoid main() {\npos = displayPos; \nsmooth = smoothMode; \n  textureCoordinate = inputTextureCoordinate;\nxy_step = vec2(widthStep, heightStep);\ngl_Position = position;\n}\n"

    .line 12
    .line 13
    return-object p0
.end method

.method public initShaderHandles()V
    .locals 2

    .line 1
    iget v0, p0, Lproject/android/imageprocessing/ext/a;->s:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    invoke-super {p0}, Ll/wej;->initShaderHandles()V

    .line 7
    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget v0, p0, Ll/wej;->programHandle:I

    .line 11
    .line 12
    const-string v1, "inputImageTexture0"

    .line 13
    .line 14
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iput v0, p0, Ll/wej;->textureHandle:I

    .line 19
    .line 20
    iget v0, p0, Ll/wej;->programHandle:I

    .line 21
    .line 22
    const-string v1, "position"

    .line 23
    .line 24
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    iput v0, p0, Ll/wej;->positionHandle:I

    .line 29
    .line 30
    iget v0, p0, Ll/wej;->programHandle:I

    .line 31
    .line 32
    const-string v1, "inputTextureCoordinate"

    .line 33
    .line 34
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    iput v0, p0, Ll/wej;->texCoordHandle:I

    .line 39
    .line 40
    iget v0, p0, Ll/wej;->programHandle:I

    .line 41
    .line 42
    const-string v1, "widthStep"

    .line 43
    .line 44
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    iput v0, p0, Lproject/android/imageprocessing/ext/a;->i:I

    .line 49
    .line 50
    iget v0, p0, Ll/wej;->programHandle:I

    .line 51
    .line 52
    const-string v1, "heightStep"

    .line 53
    .line 54
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    iput v0, p0, Lproject/android/imageprocessing/ext/a;->j:I

    .line 59
    .line 60
    iget v0, p0, Ll/wej;->programHandle:I

    .line 61
    .line 62
    const-string v1, "displayPos"

    .line 63
    .line 64
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    iput v0, p0, Lproject/android/imageprocessing/ext/a;->k:I

    .line 69
    .line 70
    iget v0, p0, Ll/wej;->programHandle:I

    .line 71
    .line 72
    const-string v1, "smoothMode"

    .line 73
    .line 74
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    iput v0, p0, Lproject/android/imageprocessing/ext/a;->l:I

    .line 79
    .line 80
    return-void
.end method

.method public initWithGLContext()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/wej;->initWithGLContext()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public newTextureReady(ILl/gfj;Z)V
    .locals 1

    .line 1
    if-eqz p3, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/gfj;->markAsDirty()V

    .line 4
    .line 5
    .line 6
    :cond_0
    iget-object p3, p2, Ll/gfj;->glFrameBuffer:Ll/lej;

    .line 7
    .line 8
    iput-object p3, p0, Ll/gfj;->inputFrameBuffer:Ll/lej;

    .line 9
    .line 10
    iput p1, p0, Ll/wej;->texture_in:I

    .line 11
    .line 12
    invoke-virtual {p2}, Ll/wej;->getWidth()I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    int-to-float p1, p1

    .line 17
    iput p1, p0, Lproject/android/imageprocessing/ext/a;->b:F

    .line 18
    .line 19
    invoke-virtual {p2}, Ll/wej;->getHeight()I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    int-to-float p1, p1

    .line 24
    iput p1, p0, Lproject/android/imageprocessing/ext/a;->c:F

    .line 25
    .line 26
    iget p3, p0, Lproject/android/imageprocessing/ext/a;->b:F

    .line 27
    .line 28
    const/high16 v0, 0x3f800000    # 1.0f

    .line 29
    .line 30
    mul-float/2addr p3, v0

    .line 31
    div-float/2addr p1, p3

    .line 32
    iput p1, p0, Lproject/android/imageprocessing/ext/a;->a:F

    .line 33
    .line 34
    invoke-virtual {p0}, Ll/wej;->onDrawFrame()V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p2}, Ll/gfj;->unlockRenderBuffer()V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public passShaderValues()V
    .locals 10

    .line 1
    iget v0, p0, Lproject/android/imageprocessing/ext/a;->s:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    invoke-super {p0}, Ll/wej;->passShaderValues()V

    .line 7
    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget v0, p0, Ll/wej;->curRotation:I

    .line 11
    .line 12
    iget-object v2, p0, Ll/wej;->renderVertices:Ljava/nio/FloatBuffer;

    .line 13
    .line 14
    const/4 v3, 0x0

    .line 15
    invoke-virtual {v2, v3}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 16
    .line 17
    .line 18
    iget-boolean v2, p0, Lproject/android/imageprocessing/ext/a;->e:Z

    .line 19
    .line 20
    iget v4, p0, Lproject/android/imageprocessing/ext/a;->d:I

    .line 21
    .line 22
    if-eqz v2, :cond_1

    .line 23
    .line 24
    add-int/2addr v4, v1

    .line 25
    iput v4, p0, Lproject/android/imageprocessing/ext/a;->d:I

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    sub-int/2addr v4, v1

    .line 29
    iput v4, p0, Lproject/android/imageprocessing/ext/a;->d:I

    .line 30
    .line 31
    :goto_0
    iget v2, p0, Lproject/android/imageprocessing/ext/a;->d:I

    .line 32
    .line 33
    iget v4, p0, Lproject/android/imageprocessing/ext/a;->b:F

    .line 34
    .line 35
    float-to-int v5, v4

    .line 36
    if-lt v2, v5, :cond_2

    .line 37
    .line 38
    iput-boolean v3, p0, Lproject/android/imageprocessing/ext/a;->e:Z

    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_2
    if-gtz v2, :cond_3

    .line 42
    .line 43
    iput-boolean v1, p0, Lproject/android/imageprocessing/ext/a;->e:Z

    .line 44
    .line 45
    :cond_3
    :goto_1
    const/high16 v2, 0x3f800000    # 1.0f

    .line 46
    .line 47
    div-float v4, v2, v4

    .line 48
    .line 49
    iget v5, p0, Lproject/android/imageprocessing/ext/a;->c:F

    .line 50
    .line 51
    div-float v5, v2, v5

    .line 52
    .line 53
    iget v6, p0, Lproject/android/imageprocessing/ext/a;->i:I

    .line 54
    .line 55
    invoke-static {v6, v4}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 56
    .line 57
    .line 58
    iget v4, p0, Lproject/android/imageprocessing/ext/a;->j:I

    .line 59
    .line 60
    invoke-static {v4, v5}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 61
    .line 62
    .line 63
    iget v4, p0, Lproject/android/imageprocessing/ext/a;->k:I

    .line 64
    .line 65
    iget v5, p0, Lproject/android/imageprocessing/ext/a;->d:I

    .line 66
    .line 67
    int-to-float v5, v5

    .line 68
    mul-float/2addr v5, v2

    .line 69
    iget v2, p0, Lproject/android/imageprocessing/ext/a;->b:F

    .line 70
    .line 71
    div-float/2addr v5, v2

    .line 72
    invoke-static {v4, v5}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 73
    .line 74
    .line 75
    iget v2, p0, Lproject/android/imageprocessing/ext/a;->l:I

    .line 76
    .line 77
    iget v4, p0, Lproject/android/imageprocessing/ext/a;->f:I

    .line 78
    .line 79
    int-to-float v4, v4

    .line 80
    const/high16 v5, 0x41200000    # 10.0f

    .line 81
    .line 82
    div-float/2addr v4, v5

    .line 83
    invoke-static {v2, v4}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 84
    .line 85
    .line 86
    iget v2, p0, Lproject/android/imageprocessing/ext/a;->g:I

    .line 87
    .line 88
    if-ne v2, v1, :cond_4

    .line 89
    .line 90
    goto :goto_2

    .line 91
    :cond_4
    const/4 v1, 0x2

    .line 92
    if-ne v2, v1, :cond_5

    .line 93
    .line 94
    add-int/lit8 v0, v0, 0x1

    .line 95
    .line 96
    :cond_5
    :goto_2
    rem-int/lit8 v0, v0, 0x4

    .line 97
    .line 98
    iget v4, p0, Ll/wej;->positionHandle:I

    .line 99
    .line 100
    const/16 v8, 0x8

    .line 101
    .line 102
    iget-object v9, p0, Ll/wej;->renderVertices:Ljava/nio/FloatBuffer;

    .line 103
    .line 104
    const/4 v5, 0x2

    .line 105
    const/16 v6, 0x1406

    .line 106
    .line 107
    const/4 v7, 0x0

    .line 108
    invoke-static/range {v4 .. v9}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 109
    .line 110
    .line 111
    iget v1, p0, Ll/wej;->positionHandle:I

    .line 112
    .line 113
    invoke-static {v1}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 114
    .line 115
    .line 116
    iget-object v1, p0, Lproject/android/imageprocessing/ext/a;->m:[Ljava/nio/FloatBuffer;

    .line 117
    .line 118
    aget-object v1, v1, v0

    .line 119
    .line 120
    invoke-virtual {v1, v3}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 121
    .line 122
    .line 123
    iget v4, p0, Ll/wej;->texCoordHandle:I

    .line 124
    .line 125
    iget-object v1, p0, Lproject/android/imageprocessing/ext/a;->m:[Ljava/nio/FloatBuffer;

    .line 126
    .line 127
    aget-object v9, v1, v0

    .line 128
    .line 129
    invoke-static/range {v4 .. v9}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 130
    .line 131
    .line 132
    iget v0, p0, Ll/wej;->texCoordHandle:I

    .line 133
    .line 134
    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 135
    .line 136
    .line 137
    const v0, 0x84c0

    .line 138
    .line 139
    .line 140
    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 141
    .line 142
    .line 143
    const/16 v0, 0xde1

    .line 144
    .line 145
    iget v1, p0, Ll/wej;->texture_in:I

    .line 146
    .line 147
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 148
    .line 149
    .line 150
    iget p0, p0, Ll/wej;->textureHandle:I

    .line 151
    .line 152
    invoke-static {p0, v3}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 153
    .line 154
    .line 155
    return-void
.end method
