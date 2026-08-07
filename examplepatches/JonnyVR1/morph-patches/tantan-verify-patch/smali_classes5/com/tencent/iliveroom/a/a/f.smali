.class public Lcom/tencent/iliveroom/a/a/f;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private A:[F

.field private B:[F

.field private C:[F

.field private D:[F

.field private E:[F

.field private a:[F

.field private b:[F

.field private c:[S

.field private d:Ljava/nio/FloatBuffer;

.field private e:Ljava/nio/FloatBuffer;

.field private f:Ljava/nio/ShortBuffer;

.field private g:[F

.field private h:[F

.field private i:[I

.field private j:I

.field private k:I

.field private l:I

.field private m:I

.field private n:I

.field private o:I

.field private p:I

.field private q:I

.field private r:I

.field private s:Z

.field private t:I

.field private u:I

.field private v:I

.field private w:I

.field private x:[F

.field private y:[F

.field private z:[F


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x10

    .line 5
    .line 6
    new-array v1, v0, [F

    .line 7
    .line 8
    iput-object v1, p0, Lcom/tencent/iliveroom/a/a/f;->g:[F

    .line 9
    .line 10
    new-array v0, v0, [F

    .line 11
    .line 12
    iput-object v0, p0, Lcom/tencent/iliveroom/a/a/f;->h:[F

    .line 13
    .line 14
    const/4 v0, -0x1

    .line 15
    iput v0, p0, Lcom/tencent/iliveroom/a/a/f;->q:I

    .line 16
    .line 17
    iput v0, p0, Lcom/tencent/iliveroom/a/a/f;->r:I

    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    iput-boolean v0, p0, Lcom/tencent/iliveroom/a/a/f;->s:Z

    .line 21
    .line 22
    const/16 v1, -0x3039

    .line 23
    .line 24
    iput v1, p0, Lcom/tencent/iliveroom/a/a/f;->v:I

    .line 25
    .line 26
    iput v1, p0, Lcom/tencent/iliveroom/a/a/f;->w:I

    .line 27
    .line 28
    const/16 v1, 0x9

    .line 29
    .line 30
    new-array v2, v1, [F

    .line 31
    .line 32
    fill-array-data v2, :array_0

    .line 33
    .line 34
    .line 35
    iput-object v2, p0, Lcom/tencent/iliveroom/a/a/f;->x:[F

    .line 36
    .line 37
    new-array v2, v1, [F

    .line 38
    .line 39
    fill-array-data v2, :array_1

    .line 40
    .line 41
    .line 42
    iput-object v2, p0, Lcom/tencent/iliveroom/a/a/f;->y:[F

    .line 43
    .line 44
    const/4 v2, 0x3

    .line 45
    new-array v3, v2, [F

    .line 46
    .line 47
    fill-array-data v3, :array_2

    .line 48
    .line 49
    .line 50
    iput-object v3, p0, Lcom/tencent/iliveroom/a/a/f;->z:[F

    .line 51
    .line 52
    new-array v3, v1, [F

    .line 53
    .line 54
    fill-array-data v3, :array_3

    .line 55
    .line 56
    .line 57
    iput-object v3, p0, Lcom/tencent/iliveroom/a/a/f;->A:[F

    .line 58
    .line 59
    new-array v3, v2, [F

    .line 60
    .line 61
    fill-array-data v3, :array_4

    .line 62
    .line 63
    .line 64
    iput-object v3, p0, Lcom/tencent/iliveroom/a/a/f;->B:[F

    .line 65
    .line 66
    new-array v3, v1, [F

    .line 67
    .line 68
    fill-array-data v3, :array_5

    .line 69
    .line 70
    .line 71
    iput-object v3, p0, Lcom/tencent/iliveroom/a/a/f;->C:[F

    .line 72
    .line 73
    new-array v2, v2, [F

    .line 74
    .line 75
    fill-array-data v2, :array_6

    .line 76
    .line 77
    .line 78
    iput-object v2, p0, Lcom/tencent/iliveroom/a/a/f;->D:[F

    .line 79
    .line 80
    new-array v1, v1, [F

    .line 81
    .line 82
    fill-array-data v1, :array_7

    .line 83
    .line 84
    .line 85
    iput-object v1, p0, Lcom/tencent/iliveroom/a/a/f;->E:[F

    .line 86
    .line 87
    const/16 v1, 0x8

    .line 88
    .line 89
    new-array v2, v1, [F

    .line 90
    .line 91
    fill-array-data v2, :array_8

    .line 92
    .line 93
    .line 94
    iput-object v2, p0, Lcom/tencent/iliveroom/a/a/f;->b:[F

    .line 95
    .line 96
    const/4 v3, 0x6

    .line 97
    new-array v3, v3, [S

    .line 98
    .line 99
    fill-array-data v3, :array_9

    .line 100
    .line 101
    .line 102
    iput-object v3, p0, Lcom/tencent/iliveroom/a/a/f;->c:[S

    .line 103
    .line 104
    new-array v1, v1, [F

    .line 105
    .line 106
    fill-array-data v1, :array_a

    .line 107
    .line 108
    .line 109
    iput-object v1, p0, Lcom/tencent/iliveroom/a/a/f;->a:[F

    .line 110
    .line 111
    array-length v1, v2

    .line 112
    mul-int/lit8 v1, v1, 0x4

    .line 113
    .line 114
    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 119
    .line 120
    .line 121
    move-result-object v2

    .line 122
    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 123
    .line 124
    .line 125
    move-result-object v1

    .line 126
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 127
    .line 128
    .line 129
    move-result-object v1

    .line 130
    iput-object v1, p0, Lcom/tencent/iliveroom/a/a/f;->e:Ljava/nio/FloatBuffer;

    .line 131
    .line 132
    iget-object v2, p0, Lcom/tencent/iliveroom/a/a/f;->b:[F

    .line 133
    .line 134
    invoke-virtual {v1, v2}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 135
    .line 136
    .line 137
    iget-object v1, p0, Lcom/tencent/iliveroom/a/a/f;->e:Ljava/nio/FloatBuffer;

    .line 138
    .line 139
    invoke-virtual {v1, v0}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 140
    .line 141
    .line 142
    iget-object v1, p0, Lcom/tencent/iliveroom/a/a/f;->a:[F

    .line 143
    .line 144
    array-length v1, v1

    .line 145
    mul-int/lit8 v1, v1, 0x4

    .line 146
    .line 147
    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 148
    .line 149
    .line 150
    move-result-object v1

    .line 151
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 152
    .line 153
    .line 154
    move-result-object v2

    .line 155
    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 156
    .line 157
    .line 158
    move-result-object v1

    .line 159
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 160
    .line 161
    .line 162
    move-result-object v1

    .line 163
    iput-object v1, p0, Lcom/tencent/iliveroom/a/a/f;->d:Ljava/nio/FloatBuffer;

    .line 164
    .line 165
    iget-object v2, p0, Lcom/tencent/iliveroom/a/a/f;->a:[F

    .line 166
    .line 167
    invoke-virtual {v1, v2}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 168
    .line 169
    .line 170
    iget-object v1, p0, Lcom/tencent/iliveroom/a/a/f;->d:Ljava/nio/FloatBuffer;

    .line 171
    .line 172
    invoke-virtual {v1, v0}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 173
    .line 174
    .line 175
    iget-object v1, p0, Lcom/tencent/iliveroom/a/a/f;->c:[S

    .line 176
    .line 177
    array-length v1, v1

    .line 178
    mul-int/lit8 v1, v1, 0x2

    .line 179
    .line 180
    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 181
    .line 182
    .line 183
    move-result-object v1

    .line 184
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 185
    .line 186
    .line 187
    move-result-object v2

    .line 188
    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 189
    .line 190
    .line 191
    move-result-object v1

    .line 192
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->asShortBuffer()Ljava/nio/ShortBuffer;

    .line 193
    .line 194
    .line 195
    move-result-object v1

    .line 196
    iput-object v1, p0, Lcom/tencent/iliveroom/a/a/f;->f:Ljava/nio/ShortBuffer;

    .line 197
    .line 198
    iget-object v2, p0, Lcom/tencent/iliveroom/a/a/f;->c:[S

    .line 199
    .line 200
    invoke-virtual {v1, v2}, Ljava/nio/ShortBuffer;->put([S)Ljava/nio/ShortBuffer;

    .line 201
    .line 202
    .line 203
    iget-object v1, p0, Lcom/tencent/iliveroom/a/a/f;->f:Ljava/nio/ShortBuffer;

    .line 204
    .line 205
    invoke-virtual {v1, v0}, Ljava/nio/ShortBuffer;->position(I)Ljava/nio/Buffer;

    .line 206
    .line 207
    .line 208
    invoke-direct {p0}, Lcom/tencent/iliveroom/a/a/f;->b()V

    .line 209
    .line 210
    .line 211
    return-void

    .line 212
    nop

    .line 213
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
        -0x4150624e    # -0.343f
        0x3fe1eb85    # 1.765f
        0x3fb33333    # 1.4f
        -0x40c9fbe7    # -0.711f
        0x0
    .end array-data

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
    .line 226
    .line 227
    .line 228
    .line 229
    .line 230
    .line 231
    .line 232
    .line 233
    .line 234
    .line 235
    :array_1
    .array-data 4
        0x3f94fdf4    # 1.164f
        0x3f94fdf4    # 1.164f
        0x3f94fdf4    # 1.164f
        0x0
        -0x41374bc7    # -0.392f
        0x40011687    # 2.017f
        0x3fcc49ba    # 1.596f
        -0x40afdf3b    # -0.813f
        0x0
    .end array-data

    .line 236
    .line 237
    .line 238
    .line 239
    .line 240
    :array_2
    .array-data 4
        0x0
        -0x41000000    # -0.5f
        -0x41000000    # -0.5f
    .end array-data

    :array_3
    .array-data 4
        0x3f94fdf4    # 1.164f
        0x3f94fdf4    # 1.164f
        0x3f94fdf4    # 1.164f
        0x0
        -0x41a5e354    # -0.213f
        0x40072b02    # 2.112f
        0x3fe58106    # 1.793f
        -0x40f78d50    # -0.533f
        0x0
    .end array-data

    :array_4
    .array-data 4
        -0x427f7f7f
        -0x40ff7f7f
        -0x40ff7f7f
    .end array-data

    :array_5
    .array-data 4
        0x3f950b0f    # 1.1644f
        0x3f950b0f    # 1.1644f
        0x3f950b0f    # 1.1644f
        0x0
        -0x413765fe    # -0.3918f
        0x400119ce    # 2.0172f
        0x3fcc49ba    # 1.596f
        -0x40afdf3b    # -0.813f
        0x0
    .end array-data

    :array_6
    .array-data 4
        0x0
        -0x40ff7f7f
        -0x40ff7f7f
    .end array-data

    :array_7
    .array-data 4
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
        -0x414fd220    # -0.3441f
        0x3fe2d0e5    # 1.772f
        0x3fb374bc    # 1.402f
        -0x40c930be    # -0.7141f
        0x0
    .end array-data

    :array_8
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

    :array_9
    .array-data 2
        0x0s
        0x1s
        0x2s
        0x1s
        0x3s
        0x2s
    .end array-data

    :array_a
    .array-data 4
        -0x40800000    # -1.0f
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        -0x40800000    # -1.0f
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private b()V
    .locals 4

    .line 1
    const v0, 0x8b31

    .line 2
    .line 3
    .line 4
    invoke-static {v0}, Landroid/opengl/GLES20;->glCreateShader(I)I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    invoke-direct {p0}, Lcom/tencent/iliveroom/a/a/f;->e()I

    .line 9
    .line 10
    .line 11
    const-string v1, "uniform mat4 uMatrix;uniform mat4 uTextureMatrix;attribute vec2 position;attribute vec2 inputTextureCoordinate;varying vec2 textureCoordinate;void main() {vec4 pos  = vec4(position, 0.0, 1.0);gl_Position = uMatrix * pos;textureCoordinate = (uTextureMatrix*vec4(inputTextureCoordinate, 0.0, 0.0)).xy;}"

    .line 12
    .line 13
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glShaderSource(ILjava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-direct {p0}, Lcom/tencent/iliveroom/a/a/f;->e()I

    .line 17
    .line 18
    .line 19
    invoke-static {v0}, Landroid/opengl/GLES20;->glCompileShader(I)V

    .line 20
    .line 21
    .line 22
    invoke-direct {p0}, Lcom/tencent/iliveroom/a/a/f;->e()I

    .line 23
    .line 24
    .line 25
    const v1, 0x8b30

    .line 26
    .line 27
    .line 28
    invoke-static {v1}, Landroid/opengl/GLES20;->glCreateShader(I)I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    invoke-direct {p0}, Lcom/tencent/iliveroom/a/a/f;->e()I

    .line 33
    .line 34
    .line 35
    const-string v2, "precision highp float;\nvarying vec2 textureCoordinate;\nuniform sampler2D yTexture;\nuniform sampler2D uTexture;\nuniform mat3 convertMatrix;\nuniform vec3 offset;\n\nvoid main()\n{\n    highp vec3 yuvColor;\n    highp vec3 rgbColor;\n\n    // Get the YUV values\n    yuvColor.x = texture2D(yTexture, textureCoordinate).r;\n    yuvColor.y = texture2D(uTexture, vec2(textureCoordinate.x * 0.5, textureCoordinate.y * 0.5)).r;\n    yuvColor.z = texture2D(uTexture, vec2(textureCoordinate.x * 0.5, textureCoordinate.y * 0.5 + 0.5)).r;\n\n    // Do the color transform   \n    yuvColor += offset;\n    rgbColor = convertMatrix * yuvColor; \n\n    gl_FragColor = vec4(rgbColor, 1.0);\n}\n"

    .line 36
    .line 37
    invoke-static {v1, v2}, Landroid/opengl/GLES20;->glShaderSource(ILjava/lang/String;)V

    .line 38
    .line 39
    .line 40
    invoke-direct {p0}, Lcom/tencent/iliveroom/a/a/f;->e()I

    .line 41
    .line 42
    .line 43
    invoke-static {v1}, Landroid/opengl/GLES20;->glCompileShader(I)V

    .line 44
    .line 45
    .line 46
    invoke-static {}, Landroid/opengl/GLES20;->glCreateProgram()I

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    iput v2, p0, Lcom/tencent/iliveroom/a/a/f;->j:I

    .line 51
    .line 52
    invoke-direct {p0}, Lcom/tencent/iliveroom/a/a/f;->e()I

    .line 53
    .line 54
    .line 55
    iget v2, p0, Lcom/tencent/iliveroom/a/a/f;->j:I

    .line 56
    .line 57
    invoke-static {v2, v0}, Landroid/opengl/GLES20;->glAttachShader(II)V

    .line 58
    .line 59
    .line 60
    invoke-direct {p0}, Lcom/tencent/iliveroom/a/a/f;->e()I

    .line 61
    .line 62
    .line 63
    iget v2, p0, Lcom/tencent/iliveroom/a/a/f;->j:I

    .line 64
    .line 65
    invoke-static {v2, v1}, Landroid/opengl/GLES20;->glAttachShader(II)V

    .line 66
    .line 67
    .line 68
    invoke-direct {p0}, Lcom/tencent/iliveroom/a/a/f;->e()I

    .line 69
    .line 70
    .line 71
    iget v2, p0, Lcom/tencent/iliveroom/a/a/f;->j:I

    .line 72
    .line 73
    invoke-static {v2}, Landroid/opengl/GLES20;->glLinkProgram(I)V

    .line 74
    .line 75
    .line 76
    invoke-direct {p0}, Lcom/tencent/iliveroom/a/a/f;->e()I

    .line 77
    .line 78
    .line 79
    invoke-static {v0}, Landroid/opengl/GLES20;->glDeleteShader(I)V

    .line 80
    .line 81
    .line 82
    invoke-static {v1}, Landroid/opengl/GLES20;->glDeleteShader(I)V

    .line 83
    .line 84
    .line 85
    iget v0, p0, Lcom/tencent/iliveroom/a/a/f;->j:I

    .line 86
    .line 87
    const-string v1, "uMatrix"

    .line 88
    .line 89
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    iput v0, p0, Lcom/tencent/iliveroom/a/a/f;->k:I

    .line 94
    .line 95
    invoke-direct {p0}, Lcom/tencent/iliveroom/a/a/f;->e()I

    .line 96
    .line 97
    .line 98
    iget v0, p0, Lcom/tencent/iliveroom/a/a/f;->j:I

    .line 99
    .line 100
    const-string v1, "uTextureMatrix"

    .line 101
    .line 102
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    iput v0, p0, Lcom/tencent/iliveroom/a/a/f;->l:I

    .line 107
    .line 108
    invoke-direct {p0}, Lcom/tencent/iliveroom/a/a/f;->e()I

    .line 109
    .line 110
    .line 111
    iget v0, p0, Lcom/tencent/iliveroom/a/a/f;->j:I

    .line 112
    .line 113
    const-string v1, "position"

    .line 114
    .line 115
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    iput v0, p0, Lcom/tencent/iliveroom/a/a/f;->m:I

    .line 120
    .line 121
    invoke-direct {p0}, Lcom/tencent/iliveroom/a/a/f;->e()I

    .line 122
    .line 123
    .line 124
    iget v0, p0, Lcom/tencent/iliveroom/a/a/f;->j:I

    .line 125
    .line 126
    const-string v1, "inputTextureCoordinate"

    .line 127
    .line 128
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    .line 129
    .line 130
    .line 131
    move-result v0

    .line 132
    iput v0, p0, Lcom/tencent/iliveroom/a/a/f;->n:I

    .line 133
    .line 134
    invoke-direct {p0}, Lcom/tencent/iliveroom/a/a/f;->e()I

    .line 135
    .line 136
    .line 137
    iget v0, p0, Lcom/tencent/iliveroom/a/a/f;->j:I

    .line 138
    .line 139
    const-string v1, "yTexture"

    .line 140
    .line 141
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 142
    .line 143
    .line 144
    move-result v0

    .line 145
    iput v0, p0, Lcom/tencent/iliveroom/a/a/f;->o:I

    .line 146
    .line 147
    invoke-direct {p0}, Lcom/tencent/iliveroom/a/a/f;->e()I

    .line 148
    .line 149
    .line 150
    iget v0, p0, Lcom/tencent/iliveroom/a/a/f;->j:I

    .line 151
    .line 152
    const-string v1, "uTexture"

    .line 153
    .line 154
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 155
    .line 156
    .line 157
    move-result v0

    .line 158
    iput v0, p0, Lcom/tencent/iliveroom/a/a/f;->p:I

    .line 159
    .line 160
    invoke-direct {p0}, Lcom/tencent/iliveroom/a/a/f;->e()I

    .line 161
    .line 162
    .line 163
    iget v0, p0, Lcom/tencent/iliveroom/a/a/f;->j:I

    .line 164
    .line 165
    const-string v1, "offset"

    .line 166
    .line 167
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 168
    .line 169
    .line 170
    move-result v0

    .line 171
    iput v0, p0, Lcom/tencent/iliveroom/a/a/f;->r:I

    .line 172
    .line 173
    iget-object v1, p0, Lcom/tencent/iliveroom/a/a/f;->D:[F

    .line 174
    .line 175
    invoke-static {v1}, Ljava/nio/FloatBuffer;->wrap([F)Ljava/nio/FloatBuffer;

    .line 176
    .line 177
    .line 178
    move-result-object v1

    .line 179
    const/4 v2, 0x1

    .line 180
    invoke-static {v0, v2, v1}, Landroid/opengl/GLES20;->glUniform3fv(IILjava/nio/FloatBuffer;)V

    .line 181
    .line 182
    .line 183
    iget v0, p0, Lcom/tencent/iliveroom/a/a/f;->j:I

    .line 184
    .line 185
    const-string v1, "convertMatrix"

    .line 186
    .line 187
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 188
    .line 189
    .line 190
    move-result v0

    .line 191
    iput v0, p0, Lcom/tencent/iliveroom/a/a/f;->q:I

    .line 192
    .line 193
    iget-object v1, p0, Lcom/tencent/iliveroom/a/a/f;->E:[F

    .line 194
    .line 195
    const/4 v3, 0x0

    .line 196
    invoke-static {v0, v2, v3, v1, v3}, Landroid/opengl/GLES20;->glUniformMatrix3fv(IIZ[FI)V

    .line 197
    .line 198
    .line 199
    const/4 v0, 0x2

    .line 200
    new-array v1, v0, [I

    .line 201
    .line 202
    iput-object v1, p0, Lcom/tencent/iliveroom/a/a/f;->i:[I

    .line 203
    .line 204
    invoke-static {v0, v1, v3}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 205
    .line 206
    .line 207
    return-void
.end method

.method private b(Ljava/nio/ByteBuffer;II)V
    .locals 8

    if-nez p1, :cond_0

    .line 208
    const-string p0, "TRTCYuvTextureRender"

    const-string p1, "drawFrameInner: byte buffer is null."

    invoke-static {p0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    const/4 v1, 0x0

    .line 209
    invoke-static {v1, v1, v1, v0}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    const/16 v0, 0x4100

    .line 210
    invoke-static {v0}, Landroid/opengl/GLES20;->glClear(I)V

    .line 211
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a/f;->g:[F

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    .line 212
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a/f;->h:[F

    invoke-static {v0, v1}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    .line 213
    iget v0, p0, Lcom/tencent/iliveroom/a/a/f;->j:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 214
    invoke-direct {p0}, Lcom/tencent/iliveroom/a/a/f;->e()I

    .line 215
    iget v0, p0, Lcom/tencent/iliveroom/a/a/f;->m:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 216
    invoke-direct {p0}, Lcom/tencent/iliveroom/a/a/f;->e()I

    .line 217
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a/f;->d:Ljava/nio/FloatBuffer;

    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 218
    iget v2, p0, Lcom/tencent/iliveroom/a/a/f;->m:I

    const/16 v6, 0x8

    iget-object v7, p0, Lcom/tencent/iliveroom/a/a/f;->d:Ljava/nio/FloatBuffer;

    const/4 v3, 0x2

    const/16 v4, 0x1406

    const/4 v5, 0x0

    invoke-static/range {v2 .. v7}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 219
    invoke-direct {p0}, Lcom/tencent/iliveroom/a/a/f;->e()I

    .line 220
    iget v0, p0, Lcom/tencent/iliveroom/a/a/f;->n:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 221
    invoke-direct {p0}, Lcom/tencent/iliveroom/a/a/f;->e()I

    .line 222
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a/f;->e:Ljava/nio/FloatBuffer;

    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 223
    iget v2, p0, Lcom/tencent/iliveroom/a/a/f;->n:I

    iget-object v7, p0, Lcom/tencent/iliveroom/a/a/f;->e:Ljava/nio/FloatBuffer;

    invoke-static/range {v2 .. v7}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 224
    invoke-direct {p0}, Lcom/tencent/iliveroom/a/a/f;->e()I

    .line 225
    iget v0, p0, Lcom/tencent/iliveroom/a/a/f;->k:I

    iget-object v2, p0, Lcom/tencent/iliveroom/a/a/f;->g:[F

    const/4 v3, 0x1

    invoke-static {v0, v3, v1, v2, v1}, Landroid/opengl/GLES20;->glUniformMatrix4fv(IIZ[FI)V

    .line 226
    invoke-direct {p0}, Lcom/tencent/iliveroom/a/a/f;->e()I

    .line 227
    iget v0, p0, Lcom/tencent/iliveroom/a/a/f;->l:I

    iget-object v2, p0, Lcom/tencent/iliveroom/a/a/f;->h:[F

    invoke-static {v0, v3, v1, v2, v1}, Landroid/opengl/GLES20;->glUniformMatrix4fv(IIZ[FI)V

    .line 228
    invoke-direct {p0}, Lcom/tencent/iliveroom/a/a/f;->e()I

    .line 229
    iget v0, p0, Lcom/tencent/iliveroom/a/a/f;->r:I

    iget-object v2, p0, Lcom/tencent/iliveroom/a/a/f;->D:[F

    invoke-static {v2}, Ljava/nio/FloatBuffer;->wrap([F)Ljava/nio/FloatBuffer;

    move-result-object v2

    invoke-static {v0, v3, v2}, Landroid/opengl/GLES20;->glUniform3fv(IILjava/nio/FloatBuffer;)V

    .line 230
    iget v0, p0, Lcom/tencent/iliveroom/a/a/f;->q:I

    iget-object v2, p0, Lcom/tencent/iliveroom/a/a/f;->E:[F

    invoke-static {v0, v3, v1, v2, v1}, Landroid/opengl/GLES20;->glUniformMatrix3fv(IIZ[FI)V

    .line 231
    iget v0, p0, Lcom/tencent/iliveroom/a/a/f;->o:I

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 232
    invoke-direct {p0}, Lcom/tencent/iliveroom/a/a/f;->e()I

    .line 233
    iget v0, p0, Lcom/tencent/iliveroom/a/a/f;->p:I

    invoke-static {v0, v3}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 234
    invoke-direct {p0}, Lcom/tencent/iliveroom/a/a/f;->e()I

    .line 235
    invoke-virtual {p1}, Ljava/nio/Buffer;->position()I

    move-result v0

    .line 236
    iget-object v1, p0, Lcom/tencent/iliveroom/a/a/f;->i:[I

    if-eqz v1, :cond_1

    .line 237
    invoke-static {p1, p2, p3, v1}, Lcom/tencent/liteav/renderer/TXCYuvTextureRender;->nativeLoadTexture(Ljava/nio/ByteBuffer;II[I)V

    .line 238
    :cond_1
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 239
    iget-object p1, p0, Lcom/tencent/iliveroom/a/a/f;->c:[S

    array-length p1, p1

    const/16 p2, 0x1403

    iget-object p3, p0, Lcom/tencent/iliveroom/a/a/f;->f:Ljava/nio/ShortBuffer;

    const/4 v0, 0x4

    invoke-static {v0, p1, p2, p3}, Landroid/opengl/GLES20;->glDrawElements(IIILjava/nio/Buffer;)V

    .line 240
    iget p1, p0, Lcom/tencent/iliveroom/a/a/f;->m:I

    invoke-static {p1}, Landroid/opengl/GLES20;->glDisableVertexAttribArray(I)V

    .line 241
    iget p0, p0, Lcom/tencent/iliveroom/a/a/f;->n:I

    invoke-static {p0}, Landroid/opengl/GLES20;->glDisableVertexAttribArray(I)V

    return-void
.end method

.method private c()V
    .locals 14

    .line 1
    iget-boolean v0, p0, Lcom/tencent/iliveroom/a/a/f;->s:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v1, "reloadFrameBuffer. size = "

    .line 9
    .line 10
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget v1, p0, Lcom/tencent/iliveroom/a/a/f;->u:I

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const-string v1, "*"

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    iget v1, p0, Lcom/tencent/iliveroom/a/a/f;->t:I

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const-string v1, "TRTCYuvTextureRender"

    .line 33
    .line 34
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-direct {p0}, Lcom/tencent/iliveroom/a/a/f;->d()V

    .line 38
    .line 39
    .line 40
    const/4 v0, 0x1

    .line 41
    new-array v2, v0, [I

    .line 42
    .line 43
    new-array v3, v0, [I

    .line 44
    .line 45
    const/4 v4, 0x0

    .line 46
    invoke-static {v0, v2, v4}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 47
    .line 48
    .line 49
    invoke-static {v0, v3, v4}, Landroid/opengl/GLES20;->glGenFramebuffers(I[II)V

    .line 50
    .line 51
    .line 52
    aget v0, v2, v4

    .line 53
    .line 54
    iput v0, p0, Lcom/tencent/iliveroom/a/a/f;->v:I

    .line 55
    .line 56
    aget v0, v3, v4

    .line 57
    .line 58
    iput v0, p0, Lcom/tencent/iliveroom/a/a/f;->w:I

    .line 59
    .line 60
    new-instance v0, Ljava/lang/StringBuilder;

    .line 61
    .line 62
    const-string v2, "frameBuffer id = "

    .line 63
    .line 64
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    iget v2, p0, Lcom/tencent/iliveroom/a/a/f;->w:I

    .line 68
    .line 69
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    const-string v2, ", texture id = "

    .line 73
    .line 74
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    iget v2, p0, Lcom/tencent/iliveroom/a/a/f;->v:I

    .line 78
    .line 79
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    iget v0, p0, Lcom/tencent/iliveroom/a/a/f;->v:I

    .line 90
    .line 91
    const/16 v1, 0xde1

    .line 92
    .line 93
    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 94
    .line 95
    .line 96
    iget v8, p0, Lcom/tencent/iliveroom/a/a/f;->u:I

    .line 97
    .line 98
    iget v9, p0, Lcom/tencent/iliveroom/a/a/f;->t:I

    .line 99
    .line 100
    const/16 v12, 0x1401

    .line 101
    .line 102
    const/4 v13, 0x0

    .line 103
    const/16 v5, 0xde1

    .line 104
    .line 105
    const/4 v6, 0x0

    .line 106
    const/16 v7, 0x1908

    .line 107
    .line 108
    const/4 v10, 0x0

    .line 109
    const/16 v11, 0x1908

    .line 110
    .line 111
    invoke-static/range {v5 .. v13}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    .line 112
    .line 113
    .line 114
    const/16 v0, 0x2801

    .line 115
    .line 116
    const v2, 0x46180400    # 9729.0f

    .line 117
    .line 118
    .line 119
    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 120
    .line 121
    .line 122
    const/16 v0, 0x2800

    .line 123
    .line 124
    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 125
    .line 126
    .line 127
    const/16 v0, 0x2802

    .line 128
    .line 129
    const v2, 0x812f

    .line 130
    .line 131
    .line 132
    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 133
    .line 134
    .line 135
    const/16 v0, 0x2803

    .line 136
    .line 137
    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 138
    .line 139
    .line 140
    iget v0, p0, Lcom/tencent/iliveroom/a/a/f;->w:I

    .line 141
    .line 142
    const v2, 0x8d40

    .line 143
    .line 144
    .line 145
    invoke-static {v2, v0}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 146
    .line 147
    .line 148
    const v0, 0x8ce0

    .line 149
    .line 150
    .line 151
    iget v3, p0, Lcom/tencent/iliveroom/a/a/f;->v:I

    .line 152
    .line 153
    invoke-static {v2, v0, v1, v3, v4}, Landroid/opengl/GLES20;->glFramebufferTexture2D(IIIII)V

    .line 154
    .line 155
    .line 156
    invoke-static {v1, v4}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 157
    .line 158
    .line 159
    invoke-static {v2, v4}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 160
    .line 161
    .line 162
    iput-boolean v4, p0, Lcom/tencent/iliveroom/a/a/f;->s:Z

    .line 163
    .line 164
    return-void
.end method

.method private d()V
    .locals 4

    .line 1
    iget v0, p0, Lcom/tencent/iliveroom/a/a/f;->w:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    const/16 v3, -0x3039

    .line 6
    .line 7
    if-eq v0, v3, :cond_0

    .line 8
    .line 9
    filled-new-array {v0}, [I

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v2, v0, v1}, Landroid/opengl/GLES20;->glDeleteFramebuffers(I[II)V

    .line 14
    .line 15
    .line 16
    iput v3, p0, Lcom/tencent/iliveroom/a/a/f;->w:I

    .line 17
    .line 18
    :cond_0
    iget v0, p0, Lcom/tencent/iliveroom/a/a/f;->v:I

    .line 19
    .line 20
    if-eq v0, v3, :cond_1

    .line 21
    .line 22
    filled-new-array {v0}, [I

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {v2, v0, v1}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 27
    .line 28
    .line 29
    iput v3, p0, Lcom/tencent/iliveroom/a/a/f;->v:I

    .line 30
    .line 31
    :cond_1
    return-void
.end method

.method private e()I
    .locals 2

    .line 1
    invoke-static {}, Landroid/opengl/GLES20;->glGetError()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v1, "check error:"

    .line 10
    .line 11
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "TRTCYuvTextureRender"

    .line 22
    .line 23
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return p0
.end method


# virtual methods
.method public a(Ljava/nio/ByteBuffer;II)I
    .locals 4

    .line 1
    iget v0, p0, Lcom/tencent/iliveroom/a/a/f;->u:I

    .line 2
    .line 3
    if-ne v0, p2, :cond_0

    .line 4
    .line 5
    iget v0, p0, Lcom/tencent/iliveroom/a/a/f;->t:I

    .line 6
    .line 7
    if-eq v0, p3, :cond_1

    .line 8
    .line 9
    :cond_0
    iput p2, p0, Lcom/tencent/iliveroom/a/a/f;->u:I

    .line 10
    .line 11
    iput p3, p0, Lcom/tencent/iliveroom/a/a/f;->t:I

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    iput-boolean v0, p0, Lcom/tencent/iliveroom/a/a/f;->s:Z

    .line 15
    .line 16
    :cond_1
    invoke-direct {p0}, Lcom/tencent/iliveroom/a/a/f;->c()V

    .line 17
    .line 18
    .line 19
    iget v0, p0, Lcom/tencent/iliveroom/a/a/f;->w:I

    .line 20
    .line 21
    const/16 v1, -0x3039

    .line 22
    .line 23
    if-ne v0, v1, :cond_2

    .line 24
    .line 25
    const-string p0, "TRTCYuvTextureRender"

    .line 26
    .line 27
    const-string p1, "invalid frame buffer id"

    .line 28
    .line 29
    invoke-static {p0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return v1

    .line 33
    :cond_2
    const v1, 0x8d40

    .line 34
    .line 35
    .line 36
    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 37
    .line 38
    .line 39
    iget v0, p0, Lcom/tencent/iliveroom/a/a/f;->u:I

    .line 40
    .line 41
    iget v2, p0, Lcom/tencent/iliveroom/a/a/f;->t:I

    .line 42
    .line 43
    const/4 v3, 0x0

    .line 44
    invoke-static {v3, v3, v0, v2}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 45
    .line 46
    .line 47
    invoke-direct {p0, p1, p2, p3}, Lcom/tencent/iliveroom/a/a/f;->b(Ljava/nio/ByteBuffer;II)V

    .line 48
    .line 49
    .line 50
    invoke-static {v1, v3}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 51
    .line 52
    .line 53
    iget p0, p0, Lcom/tencent/iliveroom/a/a/f;->v:I

    .line 54
    .line 55
    return p0
.end method

.method public a()V
    .locals 3

    .line 56
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a/f;->i:[I

    if-eqz v0, :cond_0

    const/4 v1, 0x2

    const/4 v2, 0x0

    .line 57
    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    const/4 v0, 0x0

    .line 58
    iput-object v0, p0, Lcom/tencent/iliveroom/a/a/f;->i:[I

    .line 59
    :cond_0
    invoke-direct {p0}, Lcom/tencent/iliveroom/a/a/f;->d()V

    .line 60
    iget p0, p0, Lcom/tencent/iliveroom/a/a/f;->j:I

    invoke-static {p0}, Landroid/opengl/GLES20;->glDeleteProgram(I)V

    return-void
.end method
