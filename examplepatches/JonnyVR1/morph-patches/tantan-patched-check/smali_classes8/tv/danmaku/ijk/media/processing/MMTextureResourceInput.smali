.class public Ltv/danmaku/ijk/media/processing/MMTextureResourceInput;
.super Ll/gfj;
.source "SourceFile"


# static fields
.field private static final u:Ljava/lang/String; = "tv.danmaku.ijk.media.processing.MMTextureResourceInput"

.field public static final v:[F


# instance fields
.field private a:I

.field public b:Landroid/graphics/SurfaceTexture;

.field private c:I

.field private d:I

.field private e:I

.field private f:Z

.field private g:Z

.field private i:Landroid/graphics/Bitmap;

.field private j:I

.field private k:I

.field private l:I

.field private m:Landroid/graphics/SurfaceTexture;

.field private n:[I

.field protected o:I

.field private p:I

.field private q:F

.field private r:I

.field private s:I

.field private t:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/16 v0, 0x10

    .line 2
    .line 3
    new-array v0, v0, [F

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    sput-object v0, Ltv/danmaku/ijk/media/processing/MMTextureResourceInput;->v:[F

    .line 9
    .line 10
    return-void

    .line 11
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public constructor <init>()V
    .locals 9

    .line 1
    invoke-direct {p0}, Ll/gfj;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ltv/danmaku/ijk/media/processing/MMTextureResourceInput;->b:Landroid/graphics/SurfaceTexture;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    iput v1, p0, Ltv/danmaku/ijk/media/processing/MMTextureResourceInput;->c:I

    .line 9
    .line 10
    iput v1, p0, Ltv/danmaku/ijk/media/processing/MMTextureResourceInput;->d:I

    .line 11
    .line 12
    iput v1, p0, Ltv/danmaku/ijk/media/processing/MMTextureResourceInput;->e:I

    .line 13
    .line 14
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/processing/MMTextureResourceInput;->f:Z

    .line 15
    .line 16
    const/4 v2, 0x1

    .line 17
    iput-boolean v2, p0, Ltv/danmaku/ijk/media/processing/MMTextureResourceInput;->g:Z

    .line 18
    .line 19
    iput-object v0, p0, Ltv/danmaku/ijk/media/processing/MMTextureResourceInput;->i:Landroid/graphics/Bitmap;

    .line 20
    .line 21
    const/4 v3, -0x1

    .line 22
    iput v3, p0, Ltv/danmaku/ijk/media/processing/MMTextureResourceInput;->j:I

    .line 23
    .line 24
    iput v3, p0, Ltv/danmaku/ijk/media/processing/MMTextureResourceInput;->k:I

    .line 25
    .line 26
    iput v1, p0, Ltv/danmaku/ijk/media/processing/MMTextureResourceInput;->l:I

    .line 27
    .line 28
    iput-object v0, p0, Ltv/danmaku/ijk/media/processing/MMTextureResourceInput;->m:Landroid/graphics/SurfaceTexture;

    .line 29
    .line 30
    iput-object v0, p0, Ltv/danmaku/ijk/media/processing/MMTextureResourceInput;->n:[I

    .line 31
    .line 32
    const/high16 v3, 0x3f800000    # 1.0f

    .line 33
    .line 34
    iput v3, p0, Ltv/danmaku/ijk/media/processing/MMTextureResourceInput;->q:F

    .line 35
    .line 36
    iput v2, p0, Ltv/danmaku/ijk/media/processing/MMTextureResourceInput;->r:I

    .line 37
    .line 38
    iput v1, p0, Ltv/danmaku/ijk/media/processing/MMTextureResourceInput;->s:I

    .line 39
    .line 40
    iput v1, p0, Ltv/danmaku/ijk/media/processing/MMTextureResourceInput;->t:I

    .line 41
    .line 42
    const/4 v3, 0x4

    .line 43
    new-array v3, v3, [Ljava/nio/FloatBuffer;

    .line 44
    .line 45
    iput-object v3, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 46
    .line 47
    const/16 v4, 0x8

    .line 48
    .line 49
    new-array v5, v4, [F

    .line 50
    .line 51
    fill-array-data v5, :array_0

    .line 52
    .line 53
    .line 54
    const/16 v6, 0x20

    .line 55
    .line 56
    invoke-static {v6}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 57
    .line 58
    .line 59
    move-result-object v7

    .line 60
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 61
    .line 62
    .line 63
    move-result-object v8

    .line 64
    invoke-virtual {v7, v8}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 65
    .line 66
    .line 67
    move-result-object v7

    .line 68
    invoke-virtual {v7}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 69
    .line 70
    .line 71
    move-result-object v7

    .line 72
    aput-object v7, v3, v1

    .line 73
    .line 74
    iget-object v3, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 75
    .line 76
    aget-object v3, v3, v1

    .line 77
    .line 78
    invoke-virtual {v3, v5}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 79
    .line 80
    .line 81
    move-result-object v3

    .line 82
    invoke-virtual {v3, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 83
    .line 84
    .line 85
    new-array v3, v4, [F

    .line 86
    .line 87
    fill-array-data v3, :array_1

    .line 88
    .line 89
    .line 90
    iget-object v5, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 91
    .line 92
    invoke-static {v6}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 93
    .line 94
    .line 95
    move-result-object v7

    .line 96
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 97
    .line 98
    .line 99
    move-result-object v8

    .line 100
    invoke-virtual {v7, v8}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 101
    .line 102
    .line 103
    move-result-object v7

    .line 104
    invoke-virtual {v7}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 105
    .line 106
    .line 107
    move-result-object v7

    .line 108
    aput-object v7, v5, v2

    .line 109
    .line 110
    iget-object v5, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 111
    .line 112
    aget-object v5, v5, v2

    .line 113
    .line 114
    invoke-virtual {v5, v3}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 115
    .line 116
    .line 117
    move-result-object v3

    .line 118
    invoke-virtual {v3, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 119
    .line 120
    .line 121
    new-array v3, v4, [F

    .line 122
    .line 123
    fill-array-data v3, :array_2

    .line 124
    .line 125
    .line 126
    iget-object v5, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 127
    .line 128
    invoke-static {v6}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 129
    .line 130
    .line 131
    move-result-object v7

    .line 132
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 133
    .line 134
    .line 135
    move-result-object v8

    .line 136
    invoke-virtual {v7, v8}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 137
    .line 138
    .line 139
    move-result-object v7

    .line 140
    invoke-virtual {v7}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 141
    .line 142
    .line 143
    move-result-object v7

    .line 144
    const/4 v8, 0x2

    .line 145
    aput-object v7, v5, v8

    .line 146
    .line 147
    iget-object v5, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 148
    .line 149
    aget-object v5, v5, v8

    .line 150
    .line 151
    invoke-virtual {v5, v3}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 152
    .line 153
    .line 154
    move-result-object v3

    .line 155
    invoke-virtual {v3, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 156
    .line 157
    .line 158
    new-array v3, v4, [F

    .line 159
    .line 160
    fill-array-data v3, :array_3

    .line 161
    .line 162
    .line 163
    iget-object v4, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 164
    .line 165
    invoke-static {v6}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 166
    .line 167
    .line 168
    move-result-object v5

    .line 169
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 170
    .line 171
    .line 172
    move-result-object v6

    .line 173
    invoke-virtual {v5, v6}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 174
    .line 175
    .line 176
    move-result-object v5

    .line 177
    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 178
    .line 179
    .line 180
    move-result-object v5

    .line 181
    const/4 v6, 0x3

    .line 182
    aput-object v5, v4, v6

    .line 183
    .line 184
    iget-object v4, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 185
    .line 186
    aget-object v4, v4, v6

    .line 187
    .line 188
    invoke-virtual {v4, v3}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 189
    .line 190
    .line 191
    move-result-object v3

    .line 192
    invoke-virtual {v3, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 193
    .line 194
    .line 195
    iput v1, p0, Ltv/danmaku/ijk/media/processing/MMTextureResourceInput;->l:I

    .line 196
    .line 197
    iput-object v0, p0, Ltv/danmaku/ijk/media/processing/MMTextureResourceInput;->m:Landroid/graphics/SurfaceTexture;

    .line 198
    .line 199
    iput-boolean v2, p0, Ltv/danmaku/ijk/media/processing/MMTextureResourceInput;->g:Z

    .line 200
    .line 201
    iput-object v0, p0, Ltv/danmaku/ijk/media/processing/MMTextureResourceInput;->i:Landroid/graphics/Bitmap;

    .line 202
    .line 203
    return-void

    .line 204
    nop

    .line 205
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 206
    .line 207
    .line 208
    .line 209
    .line 210
    .line 211
    .line 212
    .line 213
    .line 214
    .line 215
    .line 216
    .line 217
    .line 218
    .line 219
    .line 220
    .line 221
    .line 222
    .line 223
    .line 224
    .line 225
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
        0x0
    .end array-data

    .line 226
    .line 227
    :array_2
    .array-data 4
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
        0x3f800000    # 1.0f
    .end array-data

    :array_3
    .array-data 4
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private bindTexture()V
    .locals 1

    .line 1
    const v0, 0x84c0

    .line 2
    .line 3
    .line 4
    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 5
    .line 6
    .line 7
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/processing/MMTextureResourceInput;->g:Z

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const v0, 0x8d65

    .line 12
    .line 13
    .line 14
    iget p0, p0, Ll/wej;->texture_in:I

    .line 15
    .line 16
    invoke-static {v0, p0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    const v0, 0x84c1

    .line 21
    .line 22
    .line 23
    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 24
    .line 25
    .line 26
    const/16 v0, 0xde1

    .line 27
    .line 28
    iget p0, p0, Ll/wej;->texture_in:I

    .line 29
    .line 30
    invoke-static {v0, p0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 31
    .line 32
    .line 33
    return-void
.end method


# virtual methods
.method public destroy()V
    .locals 4

    .line 1
    invoke-super {p0}, Ll/gfj;->destroy()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/wej;->texture_in:I

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    const/4 v2, 0x1

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    filled-new-array {v0}, [I

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-static {v2, v0, v1}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/MMTextureResourceInput;->m:Landroid/graphics/SurfaceTexture;

    .line 18
    .line 19
    const/4 v3, 0x0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    invoke-virtual {v0}, Landroid/graphics/SurfaceTexture;->release()V

    .line 23
    .line 24
    .line 25
    iput-object v3, p0, Ltv/danmaku/ijk/media/processing/MMTextureResourceInput;->m:Landroid/graphics/SurfaceTexture;

    .line 26
    .line 27
    :cond_1
    iput-object v3, p0, Ltv/danmaku/ijk/media/processing/MMTextureResourceInput;->b:Landroid/graphics/SurfaceTexture;

    .line 28
    .line 29
    iput v1, p0, Ltv/danmaku/ijk/media/processing/MMTextureResourceInput;->l:I

    .line 30
    .line 31
    iput-object v3, p0, Ltv/danmaku/ijk/media/processing/MMTextureResourceInput;->m:Landroid/graphics/SurfaceTexture;

    .line 32
    .line 33
    iput-boolean v2, p0, Ltv/danmaku/ijk/media/processing/MMTextureResourceInput;->g:Z

    .line 34
    .line 35
    iput-object v3, p0, Ltv/danmaku/ijk/media/processing/MMTextureResourceInput;->i:Landroid/graphics/Bitmap;

    .line 36
    .line 37
    sget-object p0, Ltv/danmaku/ijk/media/processing/MMTextureResourceInput;->u:Ljava/lang/String;

    .line 38
    .line 39
    const-string v0, "----destroy"

    .line 40
    .line 41
    invoke-static {p0, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public drawFrame()V
    .locals 4

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/MMTextureResourceInput;->b:Landroid/graphics/SurfaceTexture;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iget v2, p0, Ltv/danmaku/ijk/media/processing/MMTextureResourceInput;->c:I

    .line 7
    .line 8
    const/4 v3, 0x1

    .line 9
    if-ne v2, v3, :cond_0

    .line 10
    .line 11
    :try_start_0
    invoke-virtual {v0}, Landroid/graphics/SurfaceTexture;->updateTexImage()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :catch_0
    sget-object v0, Ltv/danmaku/ijk/media/processing/MMTextureResourceInput;->u:Ljava/lang/String;

    .line 16
    .line 17
    const-string v2, " mSurfaceTexture.updateTexImage exception "

    .line 18
    .line 19
    invoke-static {v0, v2}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 20
    .line 21
    .line 22
    :goto_0
    iput v1, p0, Ltv/danmaku/ijk/media/processing/MMTextureResourceInput;->c:I

    .line 23
    .line 24
    :cond_0
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/processing/MMTextureResourceInput;->f:Z

    .line 25
    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    invoke-virtual {p0}, Ll/gfj;->handleSizeChange()V

    .line 29
    .line 30
    .line 31
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/processing/MMTextureResourceInput;->f:Z

    .line 32
    .line 33
    :cond_1
    invoke-super {p0}, Ll/gfj;->drawFrame()V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "#extension GL_OES_EGL_image_external : require\nprecision mediump float;\nuniform samplerExternalOES inputImageTexture0;\nuniform sampler2D inputImageTexture1;\nvarying vec2 textureCoordinate;\nvarying float oes_flag; \nvoid main() {\nif (oes_flag ==1.0) {   gl_FragColor = texture2D(inputImageTexture0, textureCoordinate);\n} else { \ngl_FragColor = texture2D(inputImageTexture1, textureCoordinate);} \n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public getVertexShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "uniform mat4 u_Matrix;\nattribute vec4 position;\nattribute vec2 inputTextureCoordinate;\nvarying vec2 textureCoordinate;\nuniform float oesFlag; \nvarying float oes_flag; \nvoid main() {\n   oes_flag = oesFlag; \n   vec4 texPos = u_Matrix * vec4(inputTextureCoordinate, 1, 1);\n   textureCoordinate = texPos.xy;\n   gl_Position = position;\n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public initFBO()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/gfj;->initFBO()V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/processing/MMTextureResourceInput;->f:Z

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/processing/MMTextureResourceInput;->f:Z

    .line 10
    .line 11
    :cond_0
    return-void
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
    const-string v1, "u_Matrix"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Ltv/danmaku/ijk/media/processing/MMTextureResourceInput;->a:I

    .line 13
    .line 14
    iget v0, p0, Ll/wej;->programHandle:I

    .line 15
    .line 16
    const-string v1, "inputImageTexture1"

    .line 17
    .line 18
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Ltv/danmaku/ijk/media/processing/MMTextureResourceInput;->o:I

    .line 23
    .line 24
    iget v0, p0, Ll/wej;->programHandle:I

    .line 25
    .line 26
    const-string v1, "oesFlag"

    .line 27
    .line 28
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iput v0, p0, Ltv/danmaku/ijk/media/processing/MMTextureResourceInput;->p:I

    .line 33
    .line 34
    return-void
.end method

.method public initWithGLContext()V
    .locals 2

    .line 1
    sget-object v0, Ltv/danmaku/ijk/media/processing/MMTextureResourceInput;->u:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "----initWithGLContext"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-super {p0}, Ll/wej;->initWithGLContext()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public passShaderValues()V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/wej;->renderVertices:Ljava/nio/FloatBuffer;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 5
    .line 6
    .line 7
    iget v2, p0, Ll/wej;->positionHandle:I

    .line 8
    .line 9
    const/16 v6, 0x8

    .line 10
    .line 11
    iget-object v7, p0, Ll/wej;->renderVertices:Ljava/nio/FloatBuffer;

    .line 12
    .line 13
    const/4 v3, 0x2

    .line 14
    const/16 v4, 0x1406

    .line 15
    .line 16
    const/4 v5, 0x0

    .line 17
    invoke-static/range {v2 .. v7}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 18
    .line 19
    .line 20
    iget v0, p0, Ll/wej;->positionHandle:I

    .line 21
    .line 22
    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 26
    .line 27
    iget v2, p0, Ll/wej;->curRotation:I

    .line 28
    .line 29
    aget-object v0, v0, v2

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 32
    .line 33
    .line 34
    iget v2, p0, Ll/wej;->texCoordHandle:I

    .line 35
    .line 36
    iget-object v0, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 37
    .line 38
    iget v3, p0, Ll/wej;->curRotation:I

    .line 39
    .line 40
    aget-object v7, v0, v3

    .line 41
    .line 42
    const/4 v3, 0x2

    .line 43
    invoke-static/range {v2 .. v7}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 44
    .line 45
    .line 46
    iget v0, p0, Ll/wej;->texCoordHandle:I

    .line 47
    .line 48
    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 49
    .line 50
    .line 51
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/processing/MMTextureResourceInput;->g:Z

    .line 52
    .line 53
    iget v2, p0, Ltv/danmaku/ijk/media/processing/MMTextureResourceInput;->p:I

    .line 54
    .line 55
    if-eqz v0, :cond_0

    .line 56
    .line 57
    const/high16 v0, 0x3f800000    # 1.0f

    .line 58
    .line 59
    invoke-static {v2, v0}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 60
    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_0
    const/4 v0, 0x0

    .line 64
    invoke-static {v2, v0}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 65
    .line 66
    .line 67
    :goto_0
    invoke-direct {p0}, Ltv/danmaku/ijk/media/processing/MMTextureResourceInput;->bindTexture()V

    .line 68
    .line 69
    .line 70
    iget v0, p0, Ll/wej;->textureHandle:I

    .line 71
    .line 72
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 73
    .line 74
    .line 75
    iget v0, p0, Ltv/danmaku/ijk/media/processing/MMTextureResourceInput;->o:I

    .line 76
    .line 77
    const/4 v2, 0x1

    .line 78
    invoke-static {v0, v2}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 79
    .line 80
    .line 81
    iget p0, p0, Ltv/danmaku/ijk/media/processing/MMTextureResourceInput;->a:I

    .line 82
    .line 83
    sget-object v0, Ltv/danmaku/ijk/media/processing/MMTextureResourceInput;->v:[F

    .line 84
    .line 85
    invoke-static {p0, v2, v1, v0, v1}, Landroid/opengl/GLES20;->glUniformMatrix4fv(IIZ[FI)V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public setDisplayMode(III)V
    .locals 4

    .line 1
    iget v0, p0, Ltv/danmaku/ijk/media/processing/MMTextureResourceInput;->r:I

    .line 2
    .line 3
    if-ne v0, p3, :cond_1

    .line 4
    .line 5
    iget v0, p0, Ltv/danmaku/ijk/media/processing/MMTextureResourceInput;->t:I

    .line 6
    .line 7
    if-ne v0, p2, :cond_1

    .line 8
    .line 9
    iget v0, p0, Ltv/danmaku/ijk/media/processing/MMTextureResourceInput;->s:I

    .line 10
    .line 11
    if-eq v0, p1, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    return-void

    .line 15
    :cond_1
    :goto_0
    sget-object v0, Ltv/danmaku/ijk/media/processing/MMTextureResourceInput;->u:Ljava/lang/String;

    .line 16
    .line 17
    new-instance v1, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    const-string v2, "----setDisplayMode: (w,h,t)=("

    .line 20
    .line 21
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string v2, ","

    .line 28
    .line 29
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    const-string v3, "<---("

    .line 42
    .line 43
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    iget v3, p0, Ltv/danmaku/ijk/media/processing/MMTextureResourceInput;->s:I

    .line 47
    .line 48
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    iget v3, p0, Ltv/danmaku/ijk/media/processing/MMTextureResourceInput;->t:I

    .line 55
    .line 56
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    iget v2, p0, Ltv/danmaku/ijk/media/processing/MMTextureResourceInput;->r:I

    .line 63
    .line 64
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    const-string v2, ")"

    .line 68
    .line 69
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    invoke-static {v0, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 77
    .line 78
    .line 79
    iput p3, p0, Ltv/danmaku/ijk/media/processing/MMTextureResourceInput;->r:I

    .line 80
    .line 81
    iput p2, p0, Ltv/danmaku/ijk/media/processing/MMTextureResourceInput;->t:I

    .line 82
    .line 83
    iput p1, p0, Ltv/danmaku/ijk/media/processing/MMTextureResourceInput;->s:I

    .line 84
    .line 85
    invoke-super {p0, p1, p2, p3}, Ll/wej;->setDisplayMode(III)V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public setRenderSize(II)V
    .locals 3

    .line 1
    if-lez p1, :cond_3

    .line 2
    .line 3
    if-gtz p2, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget v0, p0, Ltv/danmaku/ijk/media/processing/MMTextureResourceInput;->e:I

    .line 7
    .line 8
    if-ne p1, v0, :cond_1

    .line 9
    .line 10
    iget v0, p0, Ltv/danmaku/ijk/media/processing/MMTextureResourceInput;->d:I

    .line 11
    .line 12
    if-eq p2, v0, :cond_2

    .line 13
    .line 14
    :cond_1
    sget-object v0, Ltv/danmaku/ijk/media/processing/MMTextureResourceInput;->u:Ljava/lang/String;

    .line 15
    .line 16
    new-instance v1, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    const-string v2, "----size: ["

    .line 19
    .line 20
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string v2, ", "

    .line 27
    .line 28
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    const-string v2, "]<---["

    .line 35
    .line 36
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    iget v2, p0, Ltv/danmaku/ijk/media/processing/MMTextureResourceInput;->e:I

    .line 40
    .line 41
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    const-string v2, ","

    .line 45
    .line 46
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    iget v2, p0, Ltv/danmaku/ijk/media/processing/MMTextureResourceInput;->d:I

    .line 50
    .line 51
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    const-string v2, "]"

    .line 55
    .line 56
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-static {v0, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 64
    .line 65
    .line 66
    const/4 v0, 0x1

    .line 67
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/processing/MMTextureResourceInput;->f:Z

    .line 68
    .line 69
    iput p2, p0, Ltv/danmaku/ijk/media/processing/MMTextureResourceInput;->d:I

    .line 70
    .line 71
    iput p1, p0, Ltv/danmaku/ijk/media/processing/MMTextureResourceInput;->e:I

    .line 72
    .line 73
    :cond_2
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/processing/MMTextureResourceInput;->f:Z

    .line 74
    .line 75
    if-eqz v0, :cond_3

    .line 76
    .line 77
    invoke-super {p0, p1, p2}, Ll/wej;->setRenderSize(II)V

    .line 78
    .line 79
    .line 80
    :cond_3
    :goto_0
    return-void
.end method
