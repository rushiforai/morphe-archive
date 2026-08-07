.class public Ll/rnw;
.super Ll/ffj;
.source "SourceFile"


# static fields
.field public static final W:[F


# instance fields
.field private D:I

.field public E:Landroid/graphics/SurfaceTexture;

.field protected F:I

.field private G:I

.field private H:I

.field protected I:Z

.field private J:Z

.field private K:Landroid/graphics/Bitmap;

.field private L:I

.field private M:I

.field private N:I

.field private O:Landroid/graphics/SurfaceTexture;

.field private P:[I

.field protected Q:I

.field private R:I

.field private S:F

.field private T:I

.field private U:I

.field private V:I


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
    sput-object v0, Ll/rnw;->W:[F

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
    invoke-direct {p0}, Ll/ffj;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/rnw;->E:Landroid/graphics/SurfaceTexture;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    iput v1, p0, Ll/rnw;->F:I

    .line 9
    .line 10
    iput v1, p0, Ll/rnw;->G:I

    .line 11
    .line 12
    iput v1, p0, Ll/rnw;->H:I

    .line 13
    .line 14
    iput-boolean v1, p0, Ll/rnw;->I:Z

    .line 15
    .line 16
    const/4 v2, 0x1

    .line 17
    iput-boolean v2, p0, Ll/rnw;->J:Z

    .line 18
    .line 19
    iput-object v0, p0, Ll/rnw;->K:Landroid/graphics/Bitmap;

    .line 20
    .line 21
    const/4 v3, -0x1

    .line 22
    iput v3, p0, Ll/rnw;->L:I

    .line 23
    .line 24
    iput v3, p0, Ll/rnw;->M:I

    .line 25
    .line 26
    iput v1, p0, Ll/rnw;->N:I

    .line 27
    .line 28
    iput-object v0, p0, Ll/rnw;->O:Landroid/graphics/SurfaceTexture;

    .line 29
    .line 30
    iput-object v0, p0, Ll/rnw;->P:[I

    .line 31
    .line 32
    const/high16 v3, 0x3f800000    # 1.0f

    .line 33
    .line 34
    iput v3, p0, Ll/rnw;->S:F

    .line 35
    .line 36
    iput v2, p0, Ll/rnw;->T:I

    .line 37
    .line 38
    iput v1, p0, Ll/rnw;->U:I

    .line 39
    .line 40
    iput v1, p0, Ll/rnw;->V:I

    .line 41
    .line 42
    const/4 v3, 0x4

    .line 43
    new-array v3, v3, [Ljava/nio/FloatBuffer;

    .line 44
    .line 45
    iput-object v3, p0, Ll/vej;->c:[Ljava/nio/FloatBuffer;

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
    iget-object v3, p0, Ll/vej;->c:[Ljava/nio/FloatBuffer;

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
    iget-object v5, p0, Ll/vej;->c:[Ljava/nio/FloatBuffer;

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
    iget-object v5, p0, Ll/vej;->c:[Ljava/nio/FloatBuffer;

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
    iget-object v5, p0, Ll/vej;->c:[Ljava/nio/FloatBuffer;

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
    iget-object v5, p0, Ll/vej;->c:[Ljava/nio/FloatBuffer;

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
    iget-object v4, p0, Ll/vej;->c:[Ljava/nio/FloatBuffer;

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
    iget-object v4, p0, Ll/vej;->c:[Ljava/nio/FloatBuffer;

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
    iput v1, p0, Ll/rnw;->N:I

    .line 196
    .line 197
    iput-object v0, p0, Ll/rnw;->O:Landroid/graphics/SurfaceTexture;

    .line 198
    .line 199
    iput-boolean v2, p0, Ll/rnw;->J:Z

    .line 200
    .line 201
    iput-object v0, p0, Ll/rnw;->K:Landroid/graphics/Bitmap;

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
    .line 228
    .line 229
    .line 230
    .line 231
    .line 232
    .line 233
    .line 234
    .line 235
    .line 236
    .line 237
    .line 238
    .line 239
    .line 240
    .line 241
    .line 242
    .line 243
    .line 244
    .line 245
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

    .line 246
    .line 247
    .line 248
    .line 249
    .line 250
    .line 251
    .line 252
    .line 253
    .line 254
    .line 255
    .line 256
    .line 257
    .line 258
    .line 259
    .line 260
    .line 261
    .line 262
    .line 263
    .line 264
    .line 265
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

.method private Q()V
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
    iget-boolean v0, p0, Ll/rnw;->J:Z

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const v0, 0x8d65

    .line 12
    .line 13
    .line 14
    iget p0, p0, Ll/vej;->h:I

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
    iget p0, p0, Ll/vej;->h:I

    .line 29
    .line 30
    invoke-static {v0, p0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 31
    .line 32
    .line 33
    return-void
.end method


# virtual methods
.method public E(II)V
    .locals 1

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
    iget v0, p0, Ll/rnw;->H:I

    .line 7
    .line 8
    if-ne p1, v0, :cond_1

    .line 9
    .line 10
    iget v0, p0, Ll/rnw;->G:I

    .line 11
    .line 12
    if-eq p2, v0, :cond_2

    .line 13
    .line 14
    :cond_1
    const/4 v0, 0x1

    .line 15
    iput-boolean v0, p0, Ll/rnw;->I:Z

    .line 16
    .line 17
    iput p2, p0, Ll/rnw;->G:I

    .line 18
    .line 19
    iput p1, p0, Ll/rnw;->H:I

    .line 20
    .line 21
    :cond_2
    iget-boolean v0, p0, Ll/rnw;->I:Z

    .line 22
    .line 23
    if-eqz v0, :cond_3

    .line 24
    .line 25
    invoke-super {p0, p1, p2}, Ll/vej;->E(II)V

    .line 26
    .line 27
    .line 28
    :cond_3
    :goto_0
    return-void
.end method

.method public M()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ffj;->x:Ll/kej;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/kej;->b()V

    .line 6
    .line 7
    .line 8
    :cond_0
    new-instance v0, Ll/kej;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/vej;->s()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    invoke-virtual {p0}, Ll/vej;->q()I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    invoke-direct {v0, v1, v2}, Ll/kej;-><init>(II)V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Ll/ffj;->x:Ll/kej;

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/vej;->s()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    invoke-virtual {p0}, Ll/vej;->q()I

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    invoke-virtual {v0, v1, v2}, Ll/kej;->a(II)V

    .line 32
    .line 33
    .line 34
    const v0, 0x8d40

    .line 35
    .line 36
    .line 37
    invoke-static {v0}, Landroid/opengl/GLES20;->glCheckFramebufferStatus(I)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    const v1, 0x8cd5

    .line 42
    .line 43
    .line 44
    if-ne v0, v1, :cond_2

    .line 45
    .line 46
    iget-boolean v0, p0, Ll/rnw;->I:Z

    .line 47
    .line 48
    if-eqz v0, :cond_1

    .line 49
    .line 50
    const/4 v0, 0x0

    .line 51
    iput-boolean v0, p0, Ll/rnw;->I:Z

    .line 52
    .line 53
    :cond_1
    return-void

    .line 54
    :cond_2
    new-instance v1, Ljava/lang/StringBuilder;

    .line 55
    .line 56
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-static {}, Landroid/opengl/GLES20;->glGetError()I

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    invoke-static {v1, v0, p0}, Ll/muf;->a(Ljava/lang/StringBuilder;II)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public R(ILandroid/graphics/SurfaceTexture;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/rnw;->J:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iput p1, p0, Ll/vej;->h:I

    .line 6
    .line 7
    iput-object p2, p0, Ll/rnw;->E:Landroid/graphics/SurfaceTexture;

    .line 8
    .line 9
    const/4 p1, 0x1

    .line 10
    iput p1, p0, Ll/rnw;->F:I

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/ffj;->N()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public i()V
    .locals 4

    .line 1
    invoke-super {p0}, Ll/ffj;->i()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/rnw;->E:Landroid/graphics/SurfaceTexture;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/graphics/SurfaceTexture;->release()V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget v0, p0, Ll/vej;->h:I

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    const/4 v2, 0x1

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    filled-new-array {v0}, [I

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {v2, v0, v1}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 22
    .line 23
    .line 24
    :cond_1
    iget-object v0, p0, Ll/rnw;->O:Landroid/graphics/SurfaceTexture;

    .line 25
    .line 26
    const/4 v3, 0x0

    .line 27
    if-eqz v0, :cond_2

    .line 28
    .line 29
    invoke-virtual {v0}, Landroid/graphics/SurfaceTexture;->release()V

    .line 30
    .line 31
    .line 32
    iput-object v3, p0, Ll/rnw;->O:Landroid/graphics/SurfaceTexture;

    .line 33
    .line 34
    :cond_2
    iput-object v3, p0, Ll/rnw;->E:Landroid/graphics/SurfaceTexture;

    .line 35
    .line 36
    iput v1, p0, Ll/rnw;->N:I

    .line 37
    .line 38
    iput-object v3, p0, Ll/rnw;->O:Landroid/graphics/SurfaceTexture;

    .line 39
    .line 40
    iput-boolean v2, p0, Ll/rnw;->J:Z

    .line 41
    .line 42
    iput-object v3, p0, Ll/rnw;->K:Landroid/graphics/Bitmap;

    .line 43
    .line 44
    return-void
.end method

.method public k()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/rnw;->E:Landroid/graphics/SurfaceTexture;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iget v2, p0, Ll/rnw;->F:I

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
    :catch_0
    iput v1, p0, Ll/rnw;->F:I

    .line 15
    .line 16
    :cond_0
    iget-boolean v0, p0, Ll/rnw;->I:Z

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/ffj;->t()V

    .line 21
    .line 22
    .line 23
    iput-boolean v1, p0, Ll/rnw;->I:Z

    .line 24
    .line 25
    :cond_1
    invoke-super {p0}, Ll/ffj;->k()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public p()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "#extension GL_OES_EGL_image_external : require\nprecision mediump float;\nuniform samplerExternalOES inputImageTexture0;\nuniform sampler2D inputImageTexture1;\nvarying vec2 textureCoordinate;\nvarying float oes_flag; \nvoid main() {\nif (oes_flag ==1.0) {   gl_FragColor = texture2D(inputImageTexture0, textureCoordinate);\n} else { \ngl_FragColor = texture2D(inputImageTexture1, textureCoordinate);} \n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public r()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "uniform mat4 u_Matrix;\nattribute vec4 position;\nattribute vec2 inputTextureCoordinate;\nvarying vec2 textureCoordinate;\nuniform float oesFlag; \nvarying float oes_flag; \nvoid main() {\n   oes_flag = oesFlag; \n   vec4 texPos = u_Matrix * vec4(inputTextureCoordinate, 1, 1);\n   textureCoordinate = texPos.xy;\n   gl_Position = position;\n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public u()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/vej;->u()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/vej;->d:I

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
    iput v0, p0, Ll/rnw;->D:I

    .line 13
    .line 14
    iget v0, p0, Ll/vej;->d:I

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
    iput v0, p0, Ll/rnw;->Q:I

    .line 23
    .line 24
    iget v0, p0, Ll/vej;->d:I

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
    iput v0, p0, Ll/rnw;->R:I

    .line 33
    .line 34
    return-void
.end method

.method public v()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/vej;->v()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public x()V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/vej;->b:Ljava/nio/FloatBuffer;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 5
    .line 6
    .line 7
    iget v2, p0, Ll/vej;->f:I

    .line 8
    .line 9
    const/16 v6, 0x8

    .line 10
    .line 11
    iget-object v7, p0, Ll/vej;->b:Ljava/nio/FloatBuffer;

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
    iget v0, p0, Ll/vej;->f:I

    .line 21
    .line 22
    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Ll/vej;->c:[Ljava/nio/FloatBuffer;

    .line 26
    .line 27
    iget v2, p0, Ll/vej;->a:I

    .line 28
    .line 29
    aget-object v0, v0, v2

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 32
    .line 33
    .line 34
    iget v2, p0, Ll/vej;->g:I

    .line 35
    .line 36
    iget-object v0, p0, Ll/vej;->c:[Ljava/nio/FloatBuffer;

    .line 37
    .line 38
    iget v3, p0, Ll/vej;->a:I

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
    iget v0, p0, Ll/vej;->g:I

    .line 47
    .line 48
    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 49
    .line 50
    .line 51
    iget-boolean v0, p0, Ll/rnw;->J:Z

    .line 52
    .line 53
    iget v2, p0, Ll/rnw;->R:I

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
    invoke-direct {p0}, Ll/rnw;->Q()V

    .line 68
    .line 69
    .line 70
    iget v0, p0, Ll/vej;->e:I

    .line 71
    .line 72
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 73
    .line 74
    .line 75
    iget v0, p0, Ll/rnw;->Q:I

    .line 76
    .line 77
    const/4 v2, 0x1

    .line 78
    invoke-static {v0, v2}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 79
    .line 80
    .line 81
    iget p0, p0, Ll/rnw;->D:I

    .line 82
    .line 83
    sget-object v0, Ll/rnw;->W:[F

    .line 84
    .line 85
    invoke-static {p0, v2, v1, v0, v1}, Landroid/opengl/GLES20;->glUniformMatrix4fv(IIZ[FI)V

    .line 86
    .line 87
    .line 88
    return-void
.end method
