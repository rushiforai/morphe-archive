.class public Lcom/tencent/liteav/beauty/b/k;
.super Lcom/tencent/liteav/basic/c/h;
.source "SourceFile"


# static fields
.field private static y:Ljava/lang/String; = "YUV420pToRGBFilter"


# instance fields
.field private r:[B

.field private s:I

.field private t:[I

.field private u:[I

.field private v:I

.field private w:I

.field private x:[I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(I)V
    .locals 2

    .line 1
    const-string v0, "attribute vec4 position;\nattribute vec4 inputTextureCoordinate;\n \nvarying vec2 textureCoordinate;\n \nvoid main()\n{\n    gl_Position = position;\n    textureCoordinate = inputTextureCoordinate.xy;\n}"

    .line 2
    .line 3
    const-string v1, "varying lowp vec2 textureCoordinate;\n \nuniform sampler2D inputImageTexture;\n \nvoid main()\n{\n     gl_FragColor = texture2D(inputImageTexture, textureCoordinate);\n}"

    .line 4
    .line 5
    invoke-direct {p0, v0, v1}, Lcom/tencent/liteav/basic/c/h;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/tencent/liteav/beauty/b/k;->r:[B

    .line 10
    .line 11
    iput-object v0, p0, Lcom/tencent/liteav/beauty/b/k;->t:[I

    .line 12
    .line 13
    iput-object v0, p0, Lcom/tencent/liteav/beauty/b/k;->u:[I

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    iput v1, p0, Lcom/tencent/liteav/beauty/b/k;->v:I

    .line 17
    .line 18
    iput v1, p0, Lcom/tencent/liteav/beauty/b/k;->w:I

    .line 19
    .line 20
    iput-object v0, p0, Lcom/tencent/liteav/beauty/b/k;->x:[I

    .line 21
    .line 22
    iput p1, p0, Lcom/tencent/liteav/beauty/b/k;->s:I

    .line 23
    .line 24
    sget-object p0, Lcom/tencent/liteav/beauty/b/k;->y:Ljava/lang/String;

    .line 25
    .line 26
    new-instance v0, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    const-string v1, "yuv Type "

    .line 29
    .line 30
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-static {p0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method private r()I
    .locals 12

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/k;->x:[I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    aget v0, v0, v1

    .line 5
    .line 6
    const/16 v2, 0xde1

    .line 7
    .line 8
    invoke-static {v2, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/k;->r:[B

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-static {}, Lcom/tencent/liteav/beauty/NativeLoad;->getInstance()Lcom/tencent/liteav/beauty/NativeLoad;

    .line 16
    .line 17
    .line 18
    iget v5, p0, Lcom/tencent/liteav/basic/c/h;->e:I

    .line 19
    .line 20
    iget v6, p0, Lcom/tencent/liteav/basic/c/h;->f:I

    .line 21
    .line 22
    iget-object v10, p0, Lcom/tencent/liteav/beauty/b/k;->r:[B

    .line 23
    .line 24
    const/4 v11, 0x0

    .line 25
    const/16 v2, 0xde1

    .line 26
    .line 27
    const/4 v3, 0x0

    .line 28
    const/16 v4, 0x1908

    .line 29
    .line 30
    const/4 v7, 0x0

    .line 31
    const/16 v8, 0x1908

    .line 32
    .line 33
    const/16 v9, 0x1401

    .line 34
    .line 35
    invoke-static/range {v2 .. v11}, Lcom/tencent/liteav/beauty/NativeLoad;->nativeglTexImage2D(IIIIIIII[BI)V

    .line 36
    .line 37
    .line 38
    :cond_0
    iget-object p0, p0, Lcom/tencent/liteav/beauty/b/k;->x:[I

    .line 39
    .line 40
    aget p0, p0, v1

    .line 41
    .line 42
    return p0
.end method

.method private s()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/k;->t:[I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    const/4 v3, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    aget v4, v0, v3

    .line 9
    .line 10
    if-lez v4, :cond_0

    .line 11
    .line 12
    invoke-static {v2, v0, v3}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 13
    .line 14
    .line 15
    iput-object v1, p0, Lcom/tencent/liteav/beauty/b/k;->t:[I

    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/k;->u:[I

    .line 18
    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    aget v4, v0, v3

    .line 22
    .line 23
    if-lez v4, :cond_1

    .line 24
    .line 25
    invoke-static {v2, v0, v3}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 26
    .line 27
    .line 28
    iput-object v1, p0, Lcom/tencent/liteav/beauty/b/k;->u:[I

    .line 29
    .line 30
    :cond_1
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/k;->x:[I

    .line 31
    .line 32
    if-eqz v0, :cond_2

    .line 33
    .line 34
    aget v4, v0, v3

    .line 35
    .line 36
    if-lez v4, :cond_2

    .line 37
    .line 38
    invoke-static {v2, v0, v3}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 39
    .line 40
    .line 41
    iput-object v1, p0, Lcom/tencent/liteav/beauty/b/k;->x:[I

    .line 42
    .line 43
    :cond_2
    return-void
.end method


# virtual methods
.method public a(II)V
    .locals 8

    .line 1
    iget v0, p0, Lcom/tencent/liteav/basic/c/h;->f:I

    .line 2
    .line 3
    if-ne v0, p2, :cond_0

    .line 4
    .line 5
    iget v0, p0, Lcom/tencent/liteav/basic/c/h;->e:I

    .line 6
    .line 7
    if-ne v0, p1, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-direct {p0}, Lcom/tencent/liteav/beauty/b/k;->s()V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/k;->t:[I

    .line 14
    .line 15
    const/16 v1, 0x1909

    .line 16
    .line 17
    const/4 v2, 0x0

    .line 18
    const/4 v3, 0x1

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    new-array v0, v3, [I

    .line 22
    .line 23
    iput-object v0, p0, Lcom/tencent/liteav/beauty/b/k;->t:[I

    .line 24
    .line 25
    invoke-static {p1, p2, v1, v1, v0}, Lcom/tencent/liteav/basic/c/j;->a(IIII[I)I

    .line 26
    .line 27
    .line 28
    move-result v4

    .line 29
    aput v4, v0, v2

    .line 30
    .line 31
    :cond_1
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/c/h;->p()I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    const-string v4, "yTexture"

    .line 36
    .line 37
    invoke-static {v0, v4}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    iput v0, p0, Lcom/tencent/liteav/beauty/b/k;->v:I

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/c/h;->p()I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    const-string v5, "uvTexture"

    .line 48
    .line 49
    invoke-static {v0, v5}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    iput v0, p0, Lcom/tencent/liteav/beauty/b/k;->w:I

    .line 54
    .line 55
    iget v0, p0, Lcom/tencent/liteav/beauty/b/k;->s:I

    .line 56
    .line 57
    const v6, 0x84c1

    .line 58
    .line 59
    .line 60
    const v7, 0x84c0

    .line 61
    .line 62
    .line 63
    if-ne v3, v0, :cond_2

    .line 64
    .line 65
    invoke-static {v7}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 66
    .line 67
    .line 68
    invoke-static {v6}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 69
    .line 70
    .line 71
    new-array v0, v3, [I

    .line 72
    .line 73
    iput-object v0, p0, Lcom/tencent/liteav/beauty/b/k;->u:[I

    .line 74
    .line 75
    div-int/lit8 v4, p2, 0x2

    .line 76
    .line 77
    invoke-static {p1, v4, v1, v1, v0}, Lcom/tencent/liteav/basic/c/j;->a(IIII[I)I

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    aput v1, v0, v2

    .line 82
    .line 83
    iget v0, p0, Lcom/tencent/liteav/beauty/b/k;->v:I

    .line 84
    .line 85
    invoke-static {v0, v2}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 86
    .line 87
    .line 88
    iget v0, p0, Lcom/tencent/liteav/beauty/b/k;->w:I

    .line 89
    .line 90
    invoke-static {v0, v3}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 91
    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_2
    const/4 v1, 0x3

    .line 95
    if-ne v1, v0, :cond_3

    .line 96
    .line 97
    invoke-static {v7}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 98
    .line 99
    .line 100
    invoke-static {v6}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/c/h;->p()I

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    invoke-static {v0, v4}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    iput v0, p0, Lcom/tencent/liteav/beauty/b/k;->v:I

    .line 112
    .line 113
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/c/h;->p()I

    .line 114
    .line 115
    .line 116
    move-result v0

    .line 117
    invoke-static {v0, v5}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    iput v0, p0, Lcom/tencent/liteav/beauty/b/k;->w:I

    .line 122
    .line 123
    new-array v0, v3, [I

    .line 124
    .line 125
    iput-object v0, p0, Lcom/tencent/liteav/beauty/b/k;->u:[I

    .line 126
    .line 127
    div-int/lit8 v1, p1, 0x2

    .line 128
    .line 129
    div-int/lit8 v4, p2, 0x2

    .line 130
    .line 131
    const/16 v5, 0x190a

    .line 132
    .line 133
    invoke-static {v1, v4, v5, v5, v0}, Lcom/tencent/liteav/basic/c/j;->a(IIII[I)I

    .line 134
    .line 135
    .line 136
    move-result v1

    .line 137
    aput v1, v0, v2

    .line 138
    .line 139
    iget v0, p0, Lcom/tencent/liteav/beauty/b/k;->v:I

    .line 140
    .line 141
    invoke-static {v0, v2}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 142
    .line 143
    .line 144
    iget v0, p0, Lcom/tencent/liteav/beauty/b/k;->w:I

    .line 145
    .line 146
    invoke-static {v0, v3}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 147
    .line 148
    .line 149
    goto :goto_0

    .line 150
    :cond_3
    const/4 v1, 0x2

    .line 151
    if-ne v1, v0, :cond_4

    .line 152
    .line 153
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/k;->x:[I

    .line 154
    .line 155
    if-nez v0, :cond_4

    .line 156
    .line 157
    new-array v0, v3, [I

    .line 158
    .line 159
    iput-object v0, p0, Lcom/tencent/liteav/beauty/b/k;->x:[I

    .line 160
    .line 161
    const/16 v1, 0x1908

    .line 162
    .line 163
    invoke-static {p1, p2, v1, v1, v0}, Lcom/tencent/liteav/basic/c/j;->a(IIII[I)I

    .line 164
    .line 165
    .line 166
    move-result v1

    .line 167
    aput v1, v0, v2

    .line 168
    .line 169
    :cond_4
    :goto_0
    invoke-super {p0, p1, p2}, Lcom/tencent/liteav/basic/c/h;->a(II)V

    .line 170
    .line 171
    .line 172
    return-void
.end method

.method public a(ILjava/nio/FloatBuffer;Ljava/nio/FloatBuffer;)V
    .locals 0

    const/4 p1, -0x1

    .line 183
    invoke-super {p0, p1, p2, p3}, Lcom/tencent/liteav/basic/c/h;->a(ILjava/nio/FloatBuffer;Ljava/nio/FloatBuffer;)V

    return-void
.end method

.method public a([B)V
    .locals 0

    .line 182
    iput-object p1, p0, Lcom/tencent/liteav/beauty/b/k;->r:[B

    return-void
.end method

.method public a()Z
    .locals 5

    .line 173
    iget v0, p0, Lcom/tencent/liteav/beauty/b/k;->s:I

    const/4 v1, 0x7

    const/4 v2, 0x1

    if-ne v0, v2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v3, 0x3

    if-ne v0, v3, :cond_1

    const/16 v1, 0x9

    goto :goto_0

    :cond_1
    const/4 v3, 0x2

    if-ne v0, v3, :cond_2

    .line 174
    invoke-super {p0}, Lcom/tencent/liteav/basic/c/h;->a()Z

    move-result p0

    return p0

    .line 175
    :cond_2
    sget-object v0, Lcom/tencent/liteav/beauty/b/k;->y:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "don\'t support yuv format "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v4, p0, Lcom/tencent/liteav/beauty/b/k;->s:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 176
    :goto_0
    invoke-static {}, Lcom/tencent/liteav/beauty/NativeLoad;->getInstance()Lcom/tencent/liteav/beauty/NativeLoad;

    invoke-static {v1}, Lcom/tencent/liteav/beauty/NativeLoad;->nativeLoadGLProgram(I)I

    move-result v0

    iput v0, p0, Lcom/tencent/liteav/basic/c/h;->a:I

    if-eqz v0, :cond_3

    .line 177
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/c/h;->b()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 178
    iput-boolean v2, p0, Lcom/tencent/liteav/basic/c/h;->g:Z

    goto :goto_1

    :cond_3
    const/4 v0, 0x0

    .line 179
    iput-boolean v0, p0, Lcom/tencent/liteav/basic/c/h;->g:Z

    .line 180
    :goto_1
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/c/h;->c()V

    .line 181
    iget-boolean p0, p0, Lcom/tencent/liteav/basic/c/h;->g:Z

    return p0
.end method

.method public e()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/tencent/liteav/basic/c/h;->e()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/tencent/liteav/beauty/b/k;->s()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public i()V
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-super {v0}, Lcom/tencent/liteav/basic/c/h;->i()V

    .line 4
    .line 5
    .line 6
    iget v1, v0, Lcom/tencent/liteav/basic/c/h;->e:I

    .line 7
    .line 8
    const/4 v2, 0x4

    .line 9
    rem-int/2addr v1, v2

    .line 10
    const/16 v3, 0xcf5

    .line 11
    .line 12
    const/4 v4, 0x1

    .line 13
    const/4 v5, 0x0

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    new-array v1, v4, [I

    .line 17
    .line 18
    invoke-static {v3, v1, v5}, Landroid/opengl/GLES20;->glGetIntegerv(I[II)V

    .line 19
    .line 20
    .line 21
    invoke-static {v3, v4}, Landroid/opengl/GLES20;->glPixelStorei(II)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const/4 v1, 0x0

    .line 26
    :goto_0
    iget v6, v0, Lcom/tencent/liteav/beauty/b/k;->s:I

    .line 27
    .line 28
    const v7, 0x84c1

    .line 29
    .line 30
    .line 31
    const v8, 0x84c0

    .line 32
    .line 33
    .line 34
    const/16 v9, 0xde1

    .line 35
    .line 36
    if-ne v4, v6, :cond_1

    .line 37
    .line 38
    invoke-static {v8}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 39
    .line 40
    .line 41
    iget-object v6, v0, Lcom/tencent/liteav/beauty/b/k;->t:[I

    .line 42
    .line 43
    aget v6, v6, v5

    .line 44
    .line 45
    invoke-static {v9, v6}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 46
    .line 47
    .line 48
    iget v6, v0, Lcom/tencent/liteav/beauty/b/k;->v:I

    .line 49
    .line 50
    invoke-static {v6, v5}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 51
    .line 52
    .line 53
    invoke-static {}, Lcom/tencent/liteav/beauty/NativeLoad;->getInstance()Lcom/tencent/liteav/beauty/NativeLoad;

    .line 54
    .line 55
    .line 56
    iget v13, v0, Lcom/tencent/liteav/basic/c/h;->e:I

    .line 57
    .line 58
    iget v14, v0, Lcom/tencent/liteav/basic/c/h;->f:I

    .line 59
    .line 60
    iget-object v6, v0, Lcom/tencent/liteav/beauty/b/k;->r:[B

    .line 61
    .line 62
    const/16 v19, 0x0

    .line 63
    .line 64
    const/16 v10, 0xde1

    .line 65
    .line 66
    const/4 v11, 0x0

    .line 67
    const/16 v12, 0x1909

    .line 68
    .line 69
    const/4 v15, 0x0

    .line 70
    const/16 v16, 0x1909

    .line 71
    .line 72
    const/16 v17, 0x1401

    .line 73
    .line 74
    move-object/from16 v18, v6

    .line 75
    .line 76
    invoke-static/range {v10 .. v19}, Lcom/tencent/liteav/beauty/NativeLoad;->nativeglTexImage2D(IIIIIIII[BI)V

    .line 77
    .line 78
    .line 79
    invoke-static {v7}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 80
    .line 81
    .line 82
    iget-object v6, v0, Lcom/tencent/liteav/beauty/b/k;->u:[I

    .line 83
    .line 84
    aget v6, v6, v5

    .line 85
    .line 86
    invoke-static {v9, v6}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 87
    .line 88
    .line 89
    iget v6, v0, Lcom/tencent/liteav/beauty/b/k;->w:I

    .line 90
    .line 91
    invoke-static {v6, v4}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 92
    .line 93
    .line 94
    invoke-static {}, Lcom/tencent/liteav/beauty/NativeLoad;->getInstance()Lcom/tencent/liteav/beauty/NativeLoad;

    .line 95
    .line 96
    .line 97
    iget v10, v0, Lcom/tencent/liteav/basic/c/h;->e:I

    .line 98
    .line 99
    iget v4, v0, Lcom/tencent/liteav/basic/c/h;->f:I

    .line 100
    .line 101
    div-int/lit8 v11, v4, 0x2

    .line 102
    .line 103
    iget-object v15, v0, Lcom/tencent/liteav/beauty/b/k;->r:[B

    .line 104
    .line 105
    mul-int v16, v10, v4

    .line 106
    .line 107
    const/16 v7, 0xde1

    .line 108
    .line 109
    const/4 v8, 0x0

    .line 110
    const/16 v9, 0x1909

    .line 111
    .line 112
    const/4 v12, 0x0

    .line 113
    const/16 v13, 0x1909

    .line 114
    .line 115
    const/16 v14, 0x1401

    .line 116
    .line 117
    invoke-static/range {v7 .. v16}, Lcom/tencent/liteav/beauty/NativeLoad;->nativeglTexImage2D(IIIIIIII[BI)V

    .line 118
    .line 119
    .line 120
    goto :goto_1

    .line 121
    :cond_1
    const/4 v10, 0x3

    .line 122
    if-ne v10, v6, :cond_2

    .line 123
    .line 124
    invoke-static {v8}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 125
    .line 126
    .line 127
    iget-object v6, v0, Lcom/tencent/liteav/beauty/b/k;->t:[I

    .line 128
    .line 129
    aget v6, v6, v5

    .line 130
    .line 131
    invoke-static {v9, v6}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 132
    .line 133
    .line 134
    iget v6, v0, Lcom/tencent/liteav/beauty/b/k;->v:I

    .line 135
    .line 136
    invoke-static {v6, v5}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 137
    .line 138
    .line 139
    invoke-static {}, Lcom/tencent/liteav/beauty/NativeLoad;->getInstance()Lcom/tencent/liteav/beauty/NativeLoad;

    .line 140
    .line 141
    .line 142
    iget v13, v0, Lcom/tencent/liteav/basic/c/h;->e:I

    .line 143
    .line 144
    iget v14, v0, Lcom/tencent/liteav/basic/c/h;->f:I

    .line 145
    .line 146
    iget-object v6, v0, Lcom/tencent/liteav/beauty/b/k;->r:[B

    .line 147
    .line 148
    const/16 v19, 0x0

    .line 149
    .line 150
    const/16 v10, 0xde1

    .line 151
    .line 152
    const/4 v11, 0x0

    .line 153
    const/16 v12, 0x1909

    .line 154
    .line 155
    const/4 v15, 0x0

    .line 156
    const/16 v16, 0x1909

    .line 157
    .line 158
    const/16 v17, 0x1401

    .line 159
    .line 160
    move-object/from16 v18, v6

    .line 161
    .line 162
    invoke-static/range {v10 .. v19}, Lcom/tencent/liteav/beauty/NativeLoad;->nativeglTexImage2D(IIIIIIII[BI)V

    .line 163
    .line 164
    .line 165
    invoke-static {v7}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 166
    .line 167
    .line 168
    iget-object v6, v0, Lcom/tencent/liteav/beauty/b/k;->u:[I

    .line 169
    .line 170
    aget v6, v6, v5

    .line 171
    .line 172
    invoke-static {v9, v6}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 173
    .line 174
    .line 175
    iget v6, v0, Lcom/tencent/liteav/beauty/b/k;->w:I

    .line 176
    .line 177
    invoke-static {v6, v4}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 178
    .line 179
    .line 180
    invoke-static {}, Lcom/tencent/liteav/beauty/NativeLoad;->getInstance()Lcom/tencent/liteav/beauty/NativeLoad;

    .line 181
    .line 182
    .line 183
    iget v4, v0, Lcom/tencent/liteav/basic/c/h;->e:I

    .line 184
    .line 185
    div-int/lit8 v9, v4, 0x2

    .line 186
    .line 187
    iget v6, v0, Lcom/tencent/liteav/basic/c/h;->f:I

    .line 188
    .line 189
    div-int/lit8 v10, v6, 0x2

    .line 190
    .line 191
    iget-object v14, v0, Lcom/tencent/liteav/beauty/b/k;->r:[B

    .line 192
    .line 193
    mul-int v15, v4, v6

    .line 194
    .line 195
    const/16 v6, 0xde1

    .line 196
    .line 197
    const/4 v7, 0x0

    .line 198
    const/16 v8, 0x190a

    .line 199
    .line 200
    const/16 v12, 0x190a

    .line 201
    .line 202
    const/16 v13, 0x1401

    .line 203
    .line 204
    invoke-static/range {v6 .. v15}, Lcom/tencent/liteav/beauty/NativeLoad;->nativeglTexImage2D(IIIIIIII[BI)V

    .line 205
    .line 206
    .line 207
    goto :goto_1

    .line 208
    :cond_2
    const/4 v4, 0x2

    .line 209
    if-ne v4, v6, :cond_3

    .line 210
    .line 211
    invoke-direct {v0}, Lcom/tencent/liteav/beauty/b/k;->r()I

    .line 212
    .line 213
    .line 214
    :cond_3
    :goto_1
    iget v0, v0, Lcom/tencent/liteav/basic/c/h;->e:I

    .line 215
    .line 216
    rem-int/2addr v0, v2

    .line 217
    if-eqz v0, :cond_5

    .line 218
    .line 219
    if-eqz v1, :cond_4

    .line 220
    .line 221
    aget v0, v1, v5

    .line 222
    .line 223
    if-lez v0, :cond_4

    .line 224
    .line 225
    invoke-static {v3, v0}, Landroid/opengl/GLES20;->glPixelStorei(II)V

    .line 226
    .line 227
    .line 228
    return-void

    .line 229
    :cond_4
    invoke-static {v3, v2}, Landroid/opengl/GLES20;->glPixelStorei(II)V

    .line 230
    .line 231
    .line 232
    :cond_5
    return-void
.end method

.method public q()I
    .locals 2

    .line 1
    const/4 v0, 0x2

    .line 2
    iget v1, p0, Lcom/tencent/liteav/beauty/b/k;->s:I

    .line 3
    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    invoke-direct {p0}, Lcom/tencent/liteav/beauty/b/k;->r()I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    const/16 v0, 0xde1

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 14
    .line 15
    .line 16
    return p0

    .line 17
    :cond_0
    const/4 v0, -0x1

    .line 18
    invoke-super {p0, v0}, Lcom/tencent/liteav/basic/c/h;->b(I)I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0
.end method
