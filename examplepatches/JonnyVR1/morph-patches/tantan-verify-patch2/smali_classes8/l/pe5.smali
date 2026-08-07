.class public Ll/pe5;
.super Ll/jt2;
.source "SourceFile"


# instance fields
.field private a:I

.field private b:I

.field private c:I

.field private d:I

.field protected e:F

.field protected f:F

.field private g:F

.field private i:[F

.field private j:[F

.field private k:[F

.field private l:[F

.field private m:F

.field private n:F


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ll/jt2;-><init>()V

    .line 2
    .line 3
    .line 4
    const v0, 0x3d23d70a    # 0.04f

    .line 5
    .line 6
    .line 7
    iput v0, p0, Ll/pe5;->e:F

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput v0, p0, Ll/pe5;->f:F

    .line 11
    .line 12
    iput v0, p0, Ll/pe5;->g:F

    .line 13
    .line 14
    const/4 v1, 0x2

    .line 15
    new-array v2, v1, [F

    .line 16
    .line 17
    fill-array-data v2, :array_0

    .line 18
    .line 19
    .line 20
    iput-object v2, p0, Ll/pe5;->i:[F

    .line 21
    .line 22
    new-array v2, v1, [F

    .line 23
    .line 24
    fill-array-data v2, :array_1

    .line 25
    .line 26
    .line 27
    iput-object v2, p0, Ll/pe5;->j:[F

    .line 28
    .line 29
    new-array v2, v1, [F

    .line 30
    .line 31
    fill-array-data v2, :array_2

    .line 32
    .line 33
    .line 34
    iput-object v2, p0, Ll/pe5;->k:[F

    .line 35
    .line 36
    new-array v1, v1, [F

    .line 37
    .line 38
    fill-array-data v1, :array_3

    .line 39
    .line 40
    .line 41
    iput-object v1, p0, Ll/pe5;->l:[F

    .line 42
    .line 43
    iput v0, p0, Ll/pe5;->m:F

    .line 44
    .line 45
    const/high16 v0, 0x3f800000    # 1.0f

    .line 46
    .line 47
    iput v0, p0, Ll/pe5;->n:F

    .line 48
    .line 49
    return-void

    .line 50
    nop

    .line 51
    :array_0
    .array-data 4
        0x0
        0x0
    .end array-data

    .line 52
    .line 53
    .line 54
    .line 55
    .line 56
    .line 57
    .line 58
    .line 59
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 60
    .line 61
    .line 62
    .line 63
    .line 64
    .line 65
    .line 66
    .line 67
    :array_2
    .array-data 4
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
    .end array-data

    .line 68
    .line 69
    .line 70
    .line 71
    .line 72
    .line 73
    .line 74
    :array_3
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private Q1(FFFF)F
    .locals 0

    .line 1
    mul-float p0, p1, p3

    .line 2
    .line 3
    sub-float/2addr p0, p2

    .line 4
    const/high16 p2, 0x40000000    # 2.0f

    .line 5
    .line 6
    mul-float/2addr p0, p2

    .line 7
    mul-float/2addr p3, p3

    .line 8
    div-float/2addr p0, p3

    .line 9
    mul-float/2addr p1, p4

    .line 10
    mul-float/2addr p0, p4

    .line 11
    mul-float/2addr p0, p4

    .line 12
    div-float/2addr p0, p2

    .line 13
    sub-float/2addr p1, p0

    .line 14
    return p1
.end method

.method private R1(FF[F)F
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    aget p0, p3, p0

    .line 3
    .line 4
    sub-float/2addr p1, p0

    .line 5
    div-float/2addr p1, p2

    .line 6
    const/4 p0, 0x0

    .line 7
    aget p0, p3, p0

    .line 8
    .line 9
    add-float/2addr p1, p0

    .line 10
    return p1
.end method

.method private S1(FF[F)F
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    aget p0, p3, p0

    .line 3
    .line 4
    sub-float/2addr p1, p0

    .line 5
    mul-float/2addr p2, p1

    .line 6
    const/4 p0, 0x1

    .line 7
    aget p0, p3, p0

    .line 8
    .line 9
    add-float/2addr p2, p0

    .line 10
    return p2
.end method


# virtual methods
.method public T1(F)V
    .locals 0

    .line 1
    iput p1, p0, Ll/pe5;->g:F

    .line 2
    .line 3
    return-void
.end method

.method public declared-synchronized U1()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    const v0, 0x3d23d70a    # 0.04f

    .line 3
    .line 4
    .line 5
    :try_start_0
    iput v0, p0, Ll/pe5;->e:F

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput v0, p0, Ll/pe5;->f:F

    .line 9
    .line 10
    iput v0, p0, Ll/pe5;->g:F
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    .line 12
    monitor-exit p0

    .line 13
    return-void

    .line 14
    :catchall_0
    move-exception v0

    .line 15
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 16
    throw v0
.end method

.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision highp float;\n\nuniform sampler2D inputImageTexture0;\nvarying vec2 textureCoordinate;\n\nuniform vec2 pointA;\nuniform vec2 pointB;\n\nuniform vec2 pointC;\nuniform vec2 pointD;\n\nfloat determinant(vec2 lv, vec2 rv) {\n    return lv.x * rv.y - lv.y * rv.x;\n}\n\nvoid main() {\n    vec2 tlv = textureCoordinate - pointA;\n    vec2 trv = pointB - pointA;\n    \n    vec2 blv = textureCoordinate - pointC;\n    vec2 brv = pointD - pointC;\n    \n    float tResult = sign(determinant(tlv, trv));\n    float bResult = sign(determinant(blv, brv));\n    if (tResult * bResult > 0.0) {\n        gl_FragColor = texture2D(inputImageTexture0, textureCoordinate);\n    } else {\n        vec4 color = texture2D(inputImageTexture0, textureCoordinate);\n        gl_FragColor = vec4(color.rgb * 0.5, 1.0);\n    }\n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public initShaderHandles()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/wej;->initShaderHandles()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/wej;->programHandle:I

    .line 5
    .line 6
    const-string v1, "pointA"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Ll/pe5;->a:I

    .line 13
    .line 14
    iget v0, p0, Ll/wej;->programHandle:I

    .line 15
    .line 16
    const-string v1, "pointB"

    .line 17
    .line 18
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Ll/pe5;->b:I

    .line 23
    .line 24
    iget v0, p0, Ll/wej;->programHandle:I

    .line 25
    .line 26
    const-string v1, "pointC"

    .line 27
    .line 28
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iput v0, p0, Ll/pe5;->c:I

    .line 33
    .line 34
    iget v0, p0, Ll/wej;->programHandle:I

    .line 35
    .line 36
    const-string v1, "pointD"

    .line 37
    .line 38
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    iput v0, p0, Ll/pe5;->d:I

    .line 43
    .line 44
    return-void
.end method

.method public passShaderValues()V
    .locals 8

    .line 1
    iget v0, p0, Ll/pe5;->f:F

    .line 2
    .line 3
    iget v1, p0, Ll/pe5;->e:F

    .line 4
    .line 5
    add-float/2addr v0, v1

    .line 6
    iput v0, p0, Ll/pe5;->f:F

    .line 7
    .line 8
    invoke-super {p0}, Ll/wej;->passShaderValues()V

    .line 9
    .line 10
    .line 11
    iget v0, p0, Ll/pe5;->f:F

    .line 12
    .line 13
    iget v1, p0, Ll/pe5;->g:F

    .line 14
    .line 15
    cmpl-float v2, v0, v1

    .line 16
    .line 17
    const/4 v3, 0x1

    .line 18
    const/4 v4, 0x0

    .line 19
    if-ltz v2, :cond_8

    .line 20
    .line 21
    sub-float/2addr v0, v1

    .line 22
    iget v1, p0, Ll/pe5;->m:F

    .line 23
    .line 24
    float-to-double v1, v1

    .line 25
    const-wide/high16 v5, 0x3fe0000000000000L    # 0.5

    .line 26
    .line 27
    cmpg-double v1, v1, v5

    .line 28
    .line 29
    const v2, 0x3f333333    # 0.7f

    .line 30
    .line 31
    .line 32
    const/high16 v5, 0x3f000000    # 0.5f

    .line 33
    .line 34
    const/high16 v6, 0x3f800000    # 1.0f

    .line 35
    .line 36
    if-gez v1, :cond_1

    .line 37
    .line 38
    invoke-direct {p0, v6, v5, v2, v0}, Ll/pe5;->Q1(FFFF)F

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    cmpg-float v7, v1, v5

    .line 43
    .line 44
    if-gtz v7, :cond_0

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    move v1, v5

    .line 48
    :goto_0
    iput v1, p0, Ll/pe5;->m:F

    .line 49
    .line 50
    :cond_1
    iget v1, p0, Ll/pe5;->n:F

    .line 51
    .line 52
    const/4 v7, 0x0

    .line 53
    cmpl-float v1, v1, v7

    .line 54
    .line 55
    if-lez v1, :cond_3

    .line 56
    .line 57
    const/high16 v1, 0x40000000    # 2.0f

    .line 58
    .line 59
    invoke-direct {p0, v1, v6, v2, v0}, Ll/pe5;->Q1(FFFF)F

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    sub-float v0, v6, v0

    .line 64
    .line 65
    cmpl-float v1, v0, v7

    .line 66
    .line 67
    if-ltz v1, :cond_2

    .line 68
    .line 69
    goto :goto_1

    .line 70
    :cond_2
    move v0, v7

    .line 71
    :goto_1
    iput v0, p0, Ll/pe5;->n:F

    .line 72
    .line 73
    :cond_3
    iget-object v0, p0, Ll/pe5;->i:[F

    .line 74
    .line 75
    aput v7, v0, v4

    .line 76
    .line 77
    iget v1, p0, Ll/pe5;->m:F

    .line 78
    .line 79
    sub-float v1, v6, v1

    .line 80
    .line 81
    aput v1, v0, v3

    .line 82
    .line 83
    iget v1, p0, Ll/pe5;->n:F

    .line 84
    .line 85
    invoke-direct {p0, v6, v1, v0}, Ll/pe5;->R1(FF[F)F

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    cmpg-float v1, v0, v6

    .line 90
    .line 91
    if-gez v1, :cond_4

    .line 92
    .line 93
    iget-object v1, p0, Ll/pe5;->j:[F

    .line 94
    .line 95
    aput v0, v1, v4

    .line 96
    .line 97
    aput v6, v1, v3

    .line 98
    .line 99
    goto :goto_3

    .line 100
    :cond_4
    iget v0, p0, Ll/pe5;->n:F

    .line 101
    .line 102
    iget-object v1, p0, Ll/pe5;->i:[F

    .line 103
    .line 104
    invoke-direct {p0, v6, v0, v1}, Ll/pe5;->S1(FF[F)F

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    iget-object v1, p0, Ll/pe5;->j:[F

    .line 109
    .line 110
    aput v6, v1, v4

    .line 111
    .line 112
    cmpl-float v2, v0, v5

    .line 113
    .line 114
    if-lez v2, :cond_5

    .line 115
    .line 116
    goto :goto_2

    .line 117
    :cond_5
    move v0, v5

    .line 118
    :goto_2
    aput v0, v1, v3

    .line 119
    .line 120
    :goto_3
    iget-object v0, p0, Ll/pe5;->k:[F

    .line 121
    .line 122
    aput v6, v0, v4

    .line 123
    .line 124
    iget v1, p0, Ll/pe5;->m:F

    .line 125
    .line 126
    aput v1, v0, v3

    .line 127
    .line 128
    iget v1, p0, Ll/pe5;->n:F

    .line 129
    .line 130
    invoke-direct {p0, v7, v1, v0}, Ll/pe5;->R1(FF[F)F

    .line 131
    .line 132
    .line 133
    move-result v0

    .line 134
    cmpl-float v1, v0, v7

    .line 135
    .line 136
    if-lez v1, :cond_6

    .line 137
    .line 138
    iget-object v1, p0, Ll/pe5;->l:[F

    .line 139
    .line 140
    aput v0, v1, v4

    .line 141
    .line 142
    aput v7, v1, v3

    .line 143
    .line 144
    goto :goto_4

    .line 145
    :cond_6
    iget v0, p0, Ll/pe5;->n:F

    .line 146
    .line 147
    iget-object v1, p0, Ll/pe5;->k:[F

    .line 148
    .line 149
    invoke-direct {p0, v7, v0, v1}, Ll/pe5;->S1(FF[F)F

    .line 150
    .line 151
    .line 152
    move-result v0

    .line 153
    iget-object v1, p0, Ll/pe5;->l:[F

    .line 154
    .line 155
    aput v7, v1, v4

    .line 156
    .line 157
    cmpg-float v2, v0, v5

    .line 158
    .line 159
    if-gez v2, :cond_7

    .line 160
    .line 161
    move v5, v0

    .line 162
    :cond_7
    aput v5, v1, v3

    .line 163
    .line 164
    :cond_8
    :goto_4
    iget v0, p0, Ll/pe5;->a:I

    .line 165
    .line 166
    iget-object v1, p0, Ll/pe5;->i:[F

    .line 167
    .line 168
    invoke-static {v0, v3, v1, v4}, Landroid/opengl/GLES20;->glUniform2fv(II[FI)V

    .line 169
    .line 170
    .line 171
    iget v0, p0, Ll/pe5;->b:I

    .line 172
    .line 173
    iget-object v1, p0, Ll/pe5;->j:[F

    .line 174
    .line 175
    invoke-static {v0, v3, v1, v4}, Landroid/opengl/GLES20;->glUniform2fv(II[FI)V

    .line 176
    .line 177
    .line 178
    iget v0, p0, Ll/pe5;->c:I

    .line 179
    .line 180
    iget-object v1, p0, Ll/pe5;->k:[F

    .line 181
    .line 182
    invoke-static {v0, v3, v1, v4}, Landroid/opengl/GLES20;->glUniform2fv(II[FI)V

    .line 183
    .line 184
    .line 185
    iget v0, p0, Ll/pe5;->d:I

    .line 186
    .line 187
    iget-object p0, p0, Ll/pe5;->l:[F

    .line 188
    .line 189
    invoke-static {v0, v3, p0, v4}, Landroid/opengl/GLES20;->glUniform2fv(II[FI)V

    .line 190
    .line 191
    .line 192
    return-void
.end method
