.class public Ll/ekl0;
.super Ll/it2;
.source "SourceFile"


# instance fields
.field protected E:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/k5g0;",
            ">;"
        }
    .end annotation
.end field

.field protected F:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/k5g0;",
            ">;"
        }
    .end annotation
.end field

.field protected final G:[S

.field protected final H:I

.field private I:I

.field protected J:I

.field private K:I

.field protected L:I

.field public M:Ljava/nio/ShortBuffer;

.field protected final N:[F

.field protected O:Ljava/nio/FloatBuffer;

.field protected P:[F

.field protected Q:Landroid/content/Context;

.field private R:J

.field private S:I

.field protected T:I

.field protected U:I

.field private V:I

.field private W:I

.field private X:I

.field protected Y:I

.field protected Z:I

.field public k0:Ljava/lang/String;

.field private p0:J


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ll/it2;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x6

    .line 5
    new-array v0, v0, [S

    .line 6
    .line 7
    fill-array-data v0, :array_0

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/ekl0;->G:[S

    .line 11
    .line 12
    const/16 v1, 0x8

    .line 13
    .line 14
    iput v1, p0, Ll/ekl0;->H:I

    .line 15
    .line 16
    const/16 v1, 0x10

    .line 17
    .line 18
    new-array v1, v1, [F

    .line 19
    .line 20
    iput-object v1, p0, Ll/ekl0;->N:[F

    .line 21
    .line 22
    const-wide/16 v1, 0x1770

    .line 23
    .line 24
    iput-wide v1, p0, Ll/ekl0;->R:J

    .line 25
    .line 26
    const-string v1, "mediump"

    .line 27
    .line 28
    iput-object v1, p0, Ll/ekl0;->k0:Ljava/lang/String;

    .line 29
    .line 30
    const-wide/16 v1, -0x1

    .line 31
    .line 32
    iput-wide v1, p0, Ll/ekl0;->p0:J

    .line 33
    .line 34
    iput-object p1, p0, Ll/ekl0;->Q:Landroid/content/Context;

    .line 35
    .line 36
    new-instance p1, Ljava/util/ArrayList;

    .line 37
    .line 38
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 39
    .line 40
    .line 41
    iput-object p1, p0, Ll/ekl0;->E:Ljava/util/List;

    .line 42
    .line 43
    new-instance p1, Ljava/util/ArrayList;

    .line 44
    .line 45
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 46
    .line 47
    .line 48
    iput-object p1, p0, Ll/ekl0;->F:Ljava/util/List;

    .line 49
    .line 50
    array-length p1, v0

    .line 51
    mul-int/lit8 p1, p1, 0x2

    .line 52
    .line 53
    invoke-static {p1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 62
    .line 63
    .line 64
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->asShortBuffer()Ljava/nio/ShortBuffer;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    iput-object p1, p0, Ll/ekl0;->M:Ljava/nio/ShortBuffer;

    .line 69
    .line 70
    invoke-virtual {p1, v0}, Ljava/nio/ShortBuffer;->put([S)Ljava/nio/ShortBuffer;

    .line 71
    .line 72
    .line 73
    iget-object p0, p0, Ll/ekl0;->M:Ljava/nio/ShortBuffer;

    .line 74
    .line 75
    const/4 p1, 0x0

    .line 76
    invoke-virtual {p0, p1}, Ljava/nio/ShortBuffer;->position(I)Ljava/nio/Buffer;

    .line 77
    .line 78
    .line 79
    return-void

    .line 80
    nop

    .line 81
    :array_0
    .array-data 2
        0x0s
        0x1s
        0x2s
        0x0s
        0x2s
        0x3s
    .end array-data
.end method

.method public static synthetic Q(Ll/ekl0;Ll/k5g0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ekl0;->a0(Ll/k5g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private S(Landroid/graphics/Bitmap;)I
    .locals 4

    .line 1
    const/4 p0, 0x1

    .line 2
    new-array v0, p0, [I

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    invoke-static {p0, v0, v1}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 6
    .line 7
    .line 8
    aget p0, v0, v1

    .line 9
    .line 10
    const/16 v2, 0xde1

    .line 11
    .line 12
    invoke-static {v2, p0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 13
    .line 14
    .line 15
    const/16 p0, 0x2800

    .line 16
    .line 17
    const v3, 0x46180400    # 9729.0f

    .line 18
    .line 19
    .line 20
    invoke-static {v2, p0, v3}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 21
    .line 22
    .line 23
    const/16 p0, 0x2801

    .line 24
    .line 25
    invoke-static {v2, p0, v3}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 26
    .line 27
    .line 28
    const/16 p0, 0x2802

    .line 29
    .line 30
    const v3, 0x47012f00    # 33071.0f

    .line 31
    .line 32
    .line 33
    invoke-static {v2, p0, v3}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 34
    .line 35
    .line 36
    const/16 p0, 0x2803

    .line 37
    .line 38
    invoke-static {v2, p0, v3}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 39
    .line 40
    .line 41
    if-eqz p1, :cond_0

    .line 42
    .line 43
    invoke-static {v2, v1, p1, v1}, Landroid/opengl/GLUtils;->texImage2D(IILandroid/graphics/Bitmap;I)V

    .line 44
    .line 45
    .line 46
    :cond_0
    aget p0, v0, v1

    .line 47
    .line 48
    return p0
.end method

.method private T()V
    .locals 11

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
    iget v0, p0, Ll/ekl0;->J:I

    .line 26
    .line 27
    const/high16 v2, 0x3f800000    # 1.0f

    .line 28
    .line 29
    invoke-static {v0, v2, v2}, Landroid/opengl/GLES20;->glUniform2f(IFF)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/ekl0;->P:[F

    .line 33
    .line 34
    const/16 v3, 0x8

    .line 35
    .line 36
    if-nez v0, :cond_0

    .line 37
    .line 38
    new-array v0, v3, [F

    .line 39
    .line 40
    iput-object v0, p0, Ll/ekl0;->P:[F

    .line 41
    .line 42
    :cond_0
    iget-object v0, p0, Ll/vej;->c:[Ljava/nio/FloatBuffer;

    .line 43
    .line 44
    iget v4, p0, Ll/vej;->a:I

    .line 45
    .line 46
    aget-object v0, v0, v4

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Ll/vej;->c:[Ljava/nio/FloatBuffer;

    .line 52
    .line 53
    iget v4, p0, Ll/vej;->a:I

    .line 54
    .line 55
    aget-object v0, v0, v4

    .line 56
    .line 57
    iget-object v4, p0, Ll/ekl0;->P:[F

    .line 58
    .line 59
    invoke-virtual {v0, v4}, Ljava/nio/FloatBuffer;->get([F)Ljava/nio/FloatBuffer;

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Ll/ekl0;->O:Ljava/nio/FloatBuffer;

    .line 63
    .line 64
    const/4 v4, 0x4

    .line 65
    if-nez v0, :cond_1

    .line 66
    .line 67
    iget-object v0, p0, Ll/ekl0;->P:[F

    .line 68
    .line 69
    array-length v0, v0

    .line 70
    mul-int/2addr v0, v4

    .line 71
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 76
    .line 77
    .line 78
    move-result-object v5

    .line 79
    invoke-virtual {v0, v5}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    iput-object v0, p0, Ll/ekl0;->O:Ljava/nio/FloatBuffer;

    .line 88
    .line 89
    :cond_1
    move v0, v1

    .line 90
    :goto_0
    if-ge v0, v3, :cond_2

    .line 91
    .line 92
    iget-object v5, p0, Ll/ekl0;->P:[F

    .line 93
    .line 94
    aget v6, v5, v0

    .line 95
    .line 96
    const/high16 v7, -0x40800000    # -1.0f

    .line 97
    .line 98
    mul-float/2addr v6, v7

    .line 99
    const/high16 v7, 0x3f000000    # 0.5f

    .line 100
    .line 101
    add-float/2addr v6, v7

    .line 102
    aput v6, v5, v0

    .line 103
    .line 104
    add-int/lit8 v0, v0, 0x1

    .line 105
    .line 106
    goto :goto_0

    .line 107
    :cond_2
    iget-object v0, p0, Ll/ekl0;->O:Ljava/nio/FloatBuffer;

    .line 108
    .line 109
    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 110
    .line 111
    .line 112
    iget-object v0, p0, Ll/ekl0;->O:Ljava/nio/FloatBuffer;

    .line 113
    .line 114
    iget-object v3, p0, Ll/ekl0;->P:[F

    .line 115
    .line 116
    invoke-virtual {v0, v3}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 117
    .line 118
    .line 119
    iget-object v0, p0, Ll/ekl0;->O:Ljava/nio/FloatBuffer;

    .line 120
    .line 121
    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 122
    .line 123
    .line 124
    iget v5, p0, Ll/ekl0;->L:I

    .line 125
    .line 126
    const/16 v9, 0x8

    .line 127
    .line 128
    iget-object v10, p0, Ll/ekl0;->O:Ljava/nio/FloatBuffer;

    .line 129
    .line 130
    const/4 v6, 0x2

    .line 131
    const/16 v7, 0x1406

    .line 132
    .line 133
    const/4 v8, 0x0

    .line 134
    invoke-static/range {v5 .. v10}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 135
    .line 136
    .line 137
    iget v0, p0, Ll/ekl0;->L:I

    .line 138
    .line 139
    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 140
    .line 141
    .line 142
    iget v0, p0, Ll/ekl0;->I:I

    .line 143
    .line 144
    invoke-static {v0, v2}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 145
    .line 146
    .line 147
    const v0, 0x84c0

    .line 148
    .line 149
    .line 150
    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 151
    .line 152
    .line 153
    const/16 v0, 0xde1

    .line 154
    .line 155
    iget v2, p0, Ll/vej;->h:I

    .line 156
    .line 157
    invoke-static {v0, v2}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 158
    .line 159
    .line 160
    iget p0, p0, Ll/vej;->e:I

    .line 161
    .line 162
    invoke-static {p0, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 163
    .line 164
    .line 165
    const/4 p0, 0x5

    .line 166
    invoke-static {p0, v1, v4}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 167
    .line 168
    .line 169
    return-void
.end method

.method private U(F)V
    .locals 3

    .line 1
    iget v0, p0, Ll/ekl0;->S:I

    .line 2
    .line 3
    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 4
    .line 5
    .line 6
    iget v0, p0, Ll/ekl0;->W:I

    .line 7
    .line 8
    const/high16 v1, 0x3f800000    # 1.0f

    .line 9
    .line 10
    invoke-static {v0, v1, p1}, Landroid/opengl/GLES20;->glUniform2f(IFF)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Ll/ekl0;->G:[S

    .line 14
    .line 15
    array-length p1, p1

    .line 16
    const/16 v0, 0x1403

    .line 17
    .line 18
    iget-object v1, p0, Ll/ekl0;->M:Ljava/nio/ShortBuffer;

    .line 19
    .line 20
    const/4 v2, 0x4

    .line 21
    invoke-static {v2, p1, v0, v1}, Landroid/opengl/GLES20;->glDrawElements(IIILjava/nio/Buffer;)V

    .line 22
    .line 23
    .line 24
    iget p0, p0, Ll/ekl0;->Y:I

    .line 25
    .line 26
    invoke-static {p0}, Landroid/opengl/GLES20;->glDisableVertexAttribArray(I)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method private V(F)V
    .locals 3

    .line 1
    iget v0, p0, Ll/ekl0;->J:I

    .line 2
    .line 3
    const/high16 v1, 0x3f800000    # 1.0f

    .line 4
    .line 5
    invoke-static {v0, v1, p1}, Landroid/opengl/GLES20;->glUniform2f(IFF)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/ekl0;->G:[S

    .line 9
    .line 10
    array-length p1, p1

    .line 11
    const/16 v0, 0x1403

    .line 12
    .line 13
    iget-object v1, p0, Ll/ekl0;->M:Ljava/nio/ShortBuffer;

    .line 14
    .line 15
    const/4 v2, 0x4

    .line 16
    invoke-static {v2, p1, v0, v1}, Landroid/opengl/GLES20;->glDrawElements(IIILjava/nio/Buffer;)V

    .line 17
    .line 18
    .line 19
    iget p0, p0, Ll/vej;->f:I

    .line 20
    .line 21
    invoke-static {p0}, Landroid/opengl/GLES20;->glDisableVertexAttribArray(I)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method private W()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "precision "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/ekl0;->k0:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string p0, " float;uniform sampler2D inputImageTexture0;varying vec2 textureCoordinate;\nuniform float alpha;\nfloat Circle(vec2 uv,vec2 p, float r,float blur){\n    float d = length(uv - p);\n    float c = smoothstep(r,r-blur,d);\n    return c;\n}void main() {   vec2 uv = textureCoordinate.xy;\n   vec4 color = texture2D(inputImageTexture0, uv).rgba;\n   uv -= 0.5;\n   float mask = Circle(uv, vec2(0.0,0.0), 0.5, 0.01);\n   vec4 colorMask = vec4(1.0,1.0,1.0,1.0);\n   vec4 ret = mix(colorMask*mask, color, 1.0 - smoothstep(0.46, 0.48, length(uv-vec2(0.0,0.0))));\n   float dis = distance(textureCoordinate,vec2(0.5,0.5));   if (dis > 0.49) {       ret.r = 1.0;       ret.b = 1.0;       ret.g = 1.0;       ret.a = 1.0 * (1.0 - smoothstep(0.49, 0.5, dis));   }\n   gl_FragColor = ret * alpha; }"

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method private X()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "uniform mat4 uMVPMatrix;attribute vec4 position;\nattribute vec4   position2 ; varying vec2 textureCoordinate;\nuniform vec2 decorationSize;\nvoid main() {  gl_Position = position;   vec2 coord = position2.xy;  coord = (coord) / decorationSize;\n  textureCoordinate = vec2(1.0 - (coord.x + 0.5),1.0-(coord.y + 0.5));\n}"

    .line 2
    .line 3
    return-object p0
.end method

.method private a0(Ll/k5g0;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ffj;->K()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    monitor-enter v0

    .line 6
    :try_start_0
    iget-object p0, p0, Ll/ekl0;->F:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {p0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    monitor-exit v0

    .line 12
    return-void

    .line 13
    :catchall_0
    move-exception p0

    .line 14
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    throw p0
.end method

.method private d0(Landroid/graphics/Bitmap;I)V
    .locals 1

    .line 1
    const/16 p0, 0xde1

    .line 2
    .line 3
    invoke-static {p0, p2}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 4
    .line 5
    .line 6
    const/16 p2, 0x2800

    .line 7
    .line 8
    const v0, 0x46180400    # 9729.0f

    .line 9
    .line 10
    .line 11
    invoke-static {p0, p2, v0}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 12
    .line 13
    .line 14
    const/16 p2, 0x2801

    .line 15
    .line 16
    invoke-static {p0, p2, v0}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 17
    .line 18
    .line 19
    const/16 p2, 0x2802

    .line 20
    .line 21
    const v0, 0x47012f00    # 33071.0f

    .line 22
    .line 23
    .line 24
    invoke-static {p0, p2, v0}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 25
    .line 26
    .line 27
    const/16 p2, 0x2803

    .line 28
    .line 29
    invoke-static {p0, p2, v0}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 30
    .line 31
    .line 32
    if-eqz p1, :cond_0

    .line 33
    .line 34
    const/4 p2, 0x0

    .line 35
    invoke-static {p0, p2, p2, p2, p1}, Landroid/opengl/GLUtils;->texSubImage2D(IIIILandroid/graphics/Bitmap;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method


# virtual methods
.method public J()V
    .locals 6

    .line 1
    invoke-virtual {p0}, Ll/vej;->s()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Ll/vej;->q()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-static {v2, v2, v0, v1}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 11
    .line 12
    .line 13
    iget v0, p0, Ll/vej;->d:I

    .line 14
    .line 15
    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 16
    .line 17
    .line 18
    const/high16 v0, 0x3f800000    # 1.0f

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    invoke-static {v0, v0, v0, v1}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    .line 22
    .line 23
    .line 24
    const/16 v0, 0x4100

    .line 25
    .line 26
    invoke-static {v0}, Landroid/opengl/GLES20;->glClear(I)V

    .line 27
    .line 28
    .line 29
    invoke-direct {p0}, Ll/ekl0;->T()V

    .line 30
    .line 31
    .line 32
    const/16 v0, 0xbe2

    .line 33
    .line 34
    invoke-static {v0}, Landroid/opengl/GLES20;->glEnable(I)V

    .line 35
    .line 36
    .line 37
    const/16 v1, 0x303

    .line 38
    .line 39
    const/4 v2, 0x1

    .line 40
    const/16 v3, 0x302

    .line 41
    .line 42
    invoke-static {v3, v1, v2, v1}, Landroid/opengl/GLES20;->glBlendFuncSeparate(IIII)V

    .line 43
    .line 44
    .line 45
    iget-object v1, p0, Ll/ekl0;->F:Ljava/util/List;

    .line 46
    .line 47
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-lez v1, :cond_1

    .line 52
    .line 53
    new-instance v1, Ljava/util/ArrayList;

    .line 54
    .line 55
    iget-object v2, p0, Ll/ekl0;->F:Ljava/util/List;

    .line 56
    .line 57
    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 58
    .line 59
    .line 60
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 65
    .line 66
    .line 67
    move-result v3

    .line 68
    if-eqz v3, :cond_0

    .line 69
    .line 70
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v3

    .line 74
    check-cast v3, Ll/k5g0;

    .line 75
    .line 76
    invoke-virtual {v3}, Ll/k5g0;->h()V

    .line 77
    .line 78
    .line 79
    iget-object v4, p0, Ll/ekl0;->F:Ljava/util/List;

    .line 80
    .line 81
    invoke-interface {v4, v3}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    iget-object v4, p0, Ll/ekl0;->E:Ljava/util/List;

    .line 85
    .line 86
    invoke-interface {v4, v3}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_0
    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 91
    .line 92
    .line 93
    :cond_1
    iget-object v1, p0, Ll/ekl0;->E:Ljava/util/List;

    .line 94
    .line 95
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 100
    .line 101
    .line 102
    move-result v2

    .line 103
    if-eqz v2, :cond_7

    .line 104
    .line 105
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object v2

    .line 109
    check-cast v2, Ll/k5g0;

    .line 110
    .line 111
    invoke-virtual {v2}, Ll/k5g0;->j()Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object v3

    .line 115
    monitor-enter v3

    .line 116
    :try_start_0
    invoke-virtual {p0}, Ll/vej;->s()I

    .line 117
    .line 118
    .line 119
    move-result v4

    .line 120
    int-to-float v4, v4

    .line 121
    iput v4, v2, Ll/k5g0;->g:F

    .line 122
    .line 123
    invoke-virtual {p0}, Ll/vej;->q()I

    .line 124
    .line 125
    .line 126
    move-result v4

    .line 127
    int-to-float v4, v4

    .line 128
    iput v4, v2, Ll/k5g0;->h:F

    .line 129
    .line 130
    iget-object v4, v2, Ll/k5g0;->o:Ljava/util/List;

    .line 131
    .line 132
    if-eqz v4, :cond_3

    .line 133
    .line 134
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 135
    .line 136
    .line 137
    move-result v4

    .line 138
    if-lez v4, :cond_3

    .line 139
    .line 140
    invoke-virtual {v2}, Ll/k5g0;->i()Landroid/graphics/Bitmap;

    .line 141
    .line 142
    .line 143
    move-result-object v4

    .line 144
    if-eqz v4, :cond_3

    .line 145
    .line 146
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 147
    .line 148
    .line 149
    move-result v5

    .line 150
    if-nez v5, :cond_3

    .line 151
    .line 152
    iget v5, v2, Ll/k5g0;->q:I

    .line 153
    .line 154
    if-lez v5, :cond_2

    .line 155
    .line 156
    invoke-direct {p0, v4, v5}, Ll/ekl0;->d0(Landroid/graphics/Bitmap;I)V

    .line 157
    .line 158
    .line 159
    goto :goto_2

    .line 160
    :catchall_0
    move-exception p0

    .line 161
    goto :goto_5

    .line 162
    :cond_2
    invoke-direct {p0, v4}, Ll/ekl0;->S(Landroid/graphics/Bitmap;)I

    .line 163
    .line 164
    .line 165
    move-result v4

    .line 166
    iput v4, v2, Ll/k5g0;->q:I

    .line 167
    .line 168
    :cond_3
    :goto_2
    iget v4, v2, Ll/k5g0;->q:I

    .line 169
    .line 170
    if-eqz v4, :cond_6

    .line 171
    .line 172
    iget-boolean v4, v2, Ll/k5g0;->t:Z

    .line 173
    .line 174
    if-eqz v4, :cond_4

    .line 175
    .line 176
    iget v4, p0, Ll/ekl0;->S:I

    .line 177
    .line 178
    invoke-static {v4}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 179
    .line 180
    .line 181
    iget-object v4, v2, Ll/k5g0;->o:Ljava/util/List;

    .line 182
    .line 183
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 184
    .line 185
    .line 186
    move-result-object v4

    .line 187
    :goto_3
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 188
    .line 189
    .line 190
    move-result v5

    .line 191
    if-eqz v5, :cond_5

    .line 192
    .line 193
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 194
    .line 195
    .line 196
    move-result-object v5

    .line 197
    check-cast v5, [F

    .line 198
    .line 199
    invoke-virtual {p0, v2, v5}, Ll/ekl0;->Y(Ll/k5g0;[F)V

    .line 200
    .line 201
    .line 202
    invoke-virtual {v2}, Ll/k5g0;->k()F

    .line 203
    .line 204
    .line 205
    move-result v5

    .line 206
    invoke-direct {p0, v5}, Ll/ekl0;->U(F)V

    .line 207
    .line 208
    .line 209
    goto :goto_3

    .line 210
    :cond_4
    iget v4, p0, Ll/vej;->d:I

    .line 211
    .line 212
    invoke-static {v4}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 213
    .line 214
    .line 215
    iget-object v4, v2, Ll/k5g0;->o:Ljava/util/List;

    .line 216
    .line 217
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 218
    .line 219
    .line 220
    move-result-object v4

    .line 221
    :goto_4
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 222
    .line 223
    .line 224
    move-result v5

    .line 225
    if-eqz v5, :cond_5

    .line 226
    .line 227
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 228
    .line 229
    .line 230
    move-result-object v5

    .line 231
    check-cast v5, [F

    .line 232
    .line 233
    invoke-virtual {p0, v2, v5}, Ll/ekl0;->Z(Ll/k5g0;[F)V

    .line 234
    .line 235
    .line 236
    invoke-virtual {v2}, Ll/k5g0;->k()F

    .line 237
    .line 238
    .line 239
    move-result v5

    .line 240
    invoke-direct {p0, v5}, Ll/ekl0;->V(F)V

    .line 241
    .line 242
    .line 243
    goto :goto_4

    .line 244
    :cond_5
    invoke-virtual {v2}, Ll/k5g0;->g()V

    .line 245
    .line 246
    .line 247
    :cond_6
    monitor-exit v3

    .line 248
    goto/16 :goto_1

    .line 249
    .line 250
    :goto_5
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 251
    throw p0

    .line 252
    :cond_7
    invoke-static {v0}, Landroid/opengl/GLES20;->glDisable(I)V

    .line 253
    .line 254
    .line 255
    return-void
.end method

.method public R(Ll/dkl0;)V
    .locals 3

    .line 1
    iget-object v0, p1, Ll/dkl0;->a:Lcom/immomo/velib/anim/model/Element;

    .line 2
    .line 3
    new-instance v1, Ll/k5g0;

    .line 4
    .line 5
    iget-object v2, p0, Ll/ekl0;->Q:Landroid/content/Context;

    .line 6
    .line 7
    invoke-direct {v1, p1, v2, v0}, Ll/k5g0;-><init>(Ll/dkl0;Landroid/content/Context;Lcom/immomo/velib/anim/model/Element;)V

    .line 8
    .line 9
    .line 10
    const/4 p1, 0x1

    .line 11
    iput-boolean p1, v1, Ll/k5g0;->p:Z

    .line 12
    .line 13
    iget-boolean p1, v0, Lcom/immomo/velib/anim/model/Element;->useCircle:Z

    .line 14
    .line 15
    iput-boolean p1, v1, Ll/k5g0;->t:Z

    .line 16
    .line 17
    iget-object p1, p0, Ll/ekl0;->N:[F

    .line 18
    .line 19
    invoke-virtual {v1, p1}, Ll/k5g0;->t([F)V

    .line 20
    .line 21
    .line 22
    new-instance p1, Ll/ekl0$a;

    .line 23
    .line 24
    invoke-direct {p1, p0, v1}, Ll/ekl0$a;-><init>(Ll/ekl0;Ll/k5g0;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v1, p1}, Ll/k5g0;->q(Ll/k5g0$b;)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Ll/ekl0;->E:Ljava/util/List;

    .line 31
    .line 32
    invoke-interface {p0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public Y(Ll/k5g0;[F)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    iget-object v3, v1, Ll/k5g0;->m:Ljava/nio/FloatBuffer;

    .line 8
    .line 9
    if-nez v3, :cond_0

    .line 10
    .line 11
    array-length v3, v2

    .line 12
    mul-int/lit8 v3, v3, 0x4

    .line 13
    .line 14
    invoke-static {v3}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 19
    .line 20
    .line 21
    move-result-object v4

    .line 22
    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    iput-object v3, v1, Ll/k5g0;->m:Ljava/nio/FloatBuffer;

    .line 30
    .line 31
    :cond_0
    iget-object v3, v1, Ll/k5g0;->m:Ljava/nio/FloatBuffer;

    .line 32
    .line 33
    const/4 v4, 0x0

    .line 34
    invoke-virtual {v3, v4}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 35
    .line 36
    .line 37
    iget-object v3, v1, Ll/k5g0;->m:Ljava/nio/FloatBuffer;

    .line 38
    .line 39
    invoke-virtual {v3, v2}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 40
    .line 41
    .line 42
    iget-object v2, v1, Ll/k5g0;->m:Ljava/nio/FloatBuffer;

    .line 43
    .line 44
    invoke-virtual {v2, v4}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 45
    .line 46
    .line 47
    iget v5, v0, Ll/ekl0;->Y:I

    .line 48
    .line 49
    const/16 v9, 0x8

    .line 50
    .line 51
    iget-object v10, v1, Ll/k5g0;->m:Ljava/nio/FloatBuffer;

    .line 52
    .line 53
    const/4 v6, 0x2

    .line 54
    const/16 v7, 0x1406

    .line 55
    .line 56
    const/4 v8, 0x0

    .line 57
    invoke-static/range {v5 .. v10}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 58
    .line 59
    .line 60
    iget v11, v0, Ll/ekl0;->Z:I

    .line 61
    .line 62
    const/16 v15, 0x8

    .line 63
    .line 64
    iget-object v2, v1, Ll/k5g0;->c:Ljava/nio/FloatBuffer;

    .line 65
    .line 66
    const/4 v12, 0x2

    .line 67
    const/16 v13, 0x1406

    .line 68
    .line 69
    const/4 v14, 0x0

    .line 70
    move-object/from16 v16, v2

    .line 71
    .line 72
    invoke-static/range {v11 .. v16}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 73
    .line 74
    .line 75
    iget v2, v0, Ll/ekl0;->Y:I

    .line 76
    .line 77
    invoke-static {v2}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 78
    .line 79
    .line 80
    iget v2, v0, Ll/ekl0;->Z:I

    .line 81
    .line 82
    invoke-static {v2}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 83
    .line 84
    .line 85
    const v2, 0x84c0

    .line 86
    .line 87
    .line 88
    invoke-static {v2}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 89
    .line 90
    .line 91
    const/16 v2, 0xde1

    .line 92
    .line 93
    iget v3, v1, Ll/k5g0;->q:I

    .line 94
    .line 95
    invoke-static {v2, v3}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 96
    .line 97
    .line 98
    iget v2, v0, Ll/ekl0;->T:I

    .line 99
    .line 100
    invoke-static {v2, v4}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 101
    .line 102
    .line 103
    iget v0, v0, Ll/ekl0;->V:I

    .line 104
    .line 105
    iget-object v1, v1, Ll/k5g0;->w:Ll/k5g0$a;

    .line 106
    .line 107
    iget v1, v1, Ll/k5g0$a;->a:F

    .line 108
    .line 109
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 110
    .line 111
    .line 112
    return-void
.end method

.method public Z(Ll/k5g0;[F)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    iget-object v3, v1, Ll/k5g0;->m:Ljava/nio/FloatBuffer;

    .line 8
    .line 9
    if-nez v3, :cond_0

    .line 10
    .line 11
    array-length v3, v2

    .line 12
    mul-int/lit8 v3, v3, 0x4

    .line 13
    .line 14
    invoke-static {v3}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 19
    .line 20
    .line 21
    move-result-object v4

    .line 22
    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    iput-object v3, v1, Ll/k5g0;->m:Ljava/nio/FloatBuffer;

    .line 30
    .line 31
    :cond_0
    iget-object v3, v1, Ll/k5g0;->m:Ljava/nio/FloatBuffer;

    .line 32
    .line 33
    const/4 v4, 0x0

    .line 34
    invoke-virtual {v3, v4}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 35
    .line 36
    .line 37
    iget-object v3, v1, Ll/k5g0;->m:Ljava/nio/FloatBuffer;

    .line 38
    .line 39
    invoke-virtual {v3, v2}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 40
    .line 41
    .line 42
    iget-object v2, v1, Ll/k5g0;->m:Ljava/nio/FloatBuffer;

    .line 43
    .line 44
    invoke-virtual {v2, v4}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 45
    .line 46
    .line 47
    iget v5, v0, Ll/vej;->f:I

    .line 48
    .line 49
    const/16 v9, 0x8

    .line 50
    .line 51
    iget-object v10, v1, Ll/k5g0;->m:Ljava/nio/FloatBuffer;

    .line 52
    .line 53
    const/4 v6, 0x2

    .line 54
    const/16 v7, 0x1406

    .line 55
    .line 56
    const/4 v8, 0x0

    .line 57
    invoke-static/range {v5 .. v10}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 58
    .line 59
    .line 60
    iget v11, v0, Ll/ekl0;->L:I

    .line 61
    .line 62
    const/16 v15, 0x8

    .line 63
    .line 64
    iget-object v2, v1, Ll/k5g0;->c:Ljava/nio/FloatBuffer;

    .line 65
    .line 66
    const/4 v12, 0x2

    .line 67
    const/16 v13, 0x1406

    .line 68
    .line 69
    const/4 v14, 0x0

    .line 70
    move-object/from16 v16, v2

    .line 71
    .line 72
    invoke-static/range {v11 .. v16}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 73
    .line 74
    .line 75
    iget v2, v0, Ll/vej;->f:I

    .line 76
    .line 77
    invoke-static {v2}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 78
    .line 79
    .line 80
    iget v2, v0, Ll/ekl0;->L:I

    .line 81
    .line 82
    invoke-static {v2}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 83
    .line 84
    .line 85
    const v2, 0x84c0

    .line 86
    .line 87
    .line 88
    invoke-static {v2}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 89
    .line 90
    .line 91
    const/16 v2, 0xde1

    .line 92
    .line 93
    iget v3, v1, Ll/k5g0;->q:I

    .line 94
    .line 95
    invoke-static {v2, v3}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 96
    .line 97
    .line 98
    iget v2, v0, Ll/vej;->e:I

    .line 99
    .line 100
    invoke-static {v2, v4}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 101
    .line 102
    .line 103
    iget v0, v0, Ll/ekl0;->I:I

    .line 104
    .line 105
    iget-object v1, v1, Ll/k5g0;->w:Ll/k5g0$a;

    .line 106
    .line 107
    iget v1, v1, Ll/k5g0$a;->a:F

    .line 108
    .line 109
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 110
    .line 111
    .line 112
    return-void
.end method

.method public b(ILl/ffj;Z)V
    .locals 8

    .line 1
    if-eqz p3, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ffj;->N()V

    .line 4
    .line 5
    .line 6
    :cond_0
    iput p1, p0, Ll/vej;->h:I

    .line 7
    .line 8
    invoke-virtual {p2}, Ll/vej;->s()I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    invoke-virtual {p0, p1}, Ll/vej;->G(I)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p2}, Ll/vej;->q()I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    invoke-virtual {p0, p1}, Ll/vej;->D(I)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ll/vej;->s()I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    int-to-float p1, p1

    .line 27
    invoke-virtual {p0}, Ll/vej;->q()I

    .line 28
    .line 29
    .line 30
    move-result p3

    .line 31
    int-to-float p3, p3

    .line 32
    div-float/2addr p1, p3

    .line 33
    iget-object v0, p0, Ll/ekl0;->N:[F

    .line 34
    .line 35
    const/high16 p3, -0x40800000    # -1.0f

    .line 36
    .line 37
    div-float v4, p3, p1

    .line 38
    .line 39
    const/high16 p3, 0x3f800000    # 1.0f

    .line 40
    .line 41
    div-float v5, p3, p1

    .line 42
    .line 43
    const/high16 v6, 0x40400000    # 3.0f

    .line 44
    .line 45
    const/high16 v7, 0x40e00000    # 7.0f

    .line 46
    .line 47
    const/4 v1, 0x0

    .line 48
    const/high16 v2, -0x40800000    # -1.0f

    .line 49
    .line 50
    const/high16 v3, 0x3f800000    # 1.0f

    .line 51
    .line 52
    invoke-static/range {v0 .. v7}, Landroid/opengl/Matrix;->orthoM([FIFFFFFF)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0}, Ll/vej;->w()V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p2}, Ll/ffj;->P()V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public b0(J)V
    .locals 4

    .line 1
    iget-wide v0, p0, Ll/ekl0;->p0:J

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    if-gez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Ll/ekl0;->E:Ljava/util/List;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    long-to-float v1, p1

    .line 13
    iget-wide v2, p0, Ll/ekl0;->R:J

    .line 14
    .line 15
    long-to-float v2, v2

    .line 16
    div-float/2addr v1, v2

    .line 17
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    if-eqz v2, :cond_1

    .line 26
    .line 27
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    check-cast v2, Ll/k5g0;

    .line 32
    .line 33
    invoke-virtual {v2, p1, p2}, Ll/k5g0;->u(J)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v2, v1}, Ll/k5g0;->s(F)V

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    iput-wide p1, p0, Ll/ekl0;->p0:J

    .line 41
    .line 42
    return-void
.end method

.method public c0(J)V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    if-lez v0, :cond_0

    .line 6
    .line 7
    iput-wide p1, p0, Ll/ekl0;->R:J

    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public h()V
    .locals 5

    .line 1
    invoke-super {p0}, Ll/vej;->h()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/vej;->d:I

    .line 5
    .line 6
    const/4 v1, 0x2

    .line 7
    const-string v2, "uMVPMatrix"

    .line 8
    .line 9
    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glBindAttribLocation(IILjava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget v0, p0, Ll/vej;->d:I

    .line 13
    .line 14
    const/4 v3, 0x3

    .line 15
    const-string v4, "decorationSize"

    .line 16
    .line 17
    invoke-static {v0, v3, v4}, Landroid/opengl/GLES20;->glBindAttribLocation(IILjava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget v0, p0, Ll/ekl0;->S:I

    .line 21
    .line 22
    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glBindAttribLocation(IILjava/lang/String;)V

    .line 23
    .line 24
    .line 25
    iget p0, p0, Ll/ekl0;->S:I

    .line 26
    .line 27
    invoke-static {p0, v3, v4}, Landroid/opengl/GLES20;->glBindAttribLocation(IILjava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public i()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/ffj;->i()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/ekl0;->E:Ljava/util/List;

    .line 5
    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-lez v0, :cond_1

    .line 13
    .line 14
    iget-object v0, p0, Ll/ekl0;->E:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_1

    .line 25
    .line 26
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Ll/k5g0;

    .line 31
    .line 32
    if-eqz v1, :cond_0

    .line 33
    .line 34
    invoke-virtual {v1}, Ll/k5g0;->h()V

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    iget-object v0, p0, Ll/ekl0;->F:Ljava/util/List;

    .line 39
    .line 40
    if-eqz v0, :cond_2

    .line 41
    .line 42
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-lez v0, :cond_2

    .line 47
    .line 48
    iget-object p0, p0, Ll/ekl0;->F:Ljava/util/List;

    .line 49
    .line 50
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-eqz v0, :cond_2

    .line 59
    .line 60
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    check-cast v0, Ll/k5g0;

    .line 65
    .line 66
    invoke-virtual {v0}, Ll/k5g0;->h()V

    .line 67
    .line 68
    .line 69
    goto :goto_1

    .line 70
    :cond_2
    return-void
.end method

.method public p()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "precision "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/ekl0;->k0:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string p0, " float;uniform sampler2D inputImageTexture0;varying vec2 textureCoordinate;\nuniform bool isAlpha;\nuniform float alpha;\nvoid main() {   vec4 color1  = texture2D(inputImageTexture0,textureCoordinate);\n   color1 = color1 * alpha; \n   gl_FragColor = color1; \n}"

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public r()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "uniform mat4 uMVPMatrix;attribute vec4 position;\nattribute vec4   position2 ; varying vec2 textureCoordinate;\nuniform vec2 decorationSize;\nvoid main() {  gl_Position = position;  vec2 coord = position2.xy;  coord = (coord) / decorationSize;\n  textureCoordinate = vec2(1.0 - (coord.x + 0.5),1.0-(coord.y + 0.5));\n}"

    .line 2
    .line 3
    return-object p0
.end method

.method public u()V
    .locals 6

    .line 1
    invoke-super {p0}, Ll/vej;->u()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/vej;->d:I

    .line 5
    .line 6
    const-string v1, "position2"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Ll/ekl0;->L:I

    .line 13
    .line 14
    iget v0, p0, Ll/vej;->d:I

    .line 15
    .line 16
    const-string v2, "uMVPMatrix"

    .line 17
    .line 18
    invoke-static {v0, v2}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Ll/ekl0;->K:I

    .line 23
    .line 24
    iget v0, p0, Ll/vej;->d:I

    .line 25
    .line 26
    const-string v3, "decorationSize"

    .line 27
    .line 28
    invoke-static {v0, v3}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iput v0, p0, Ll/ekl0;->J:I

    .line 33
    .line 34
    iget v0, p0, Ll/vej;->d:I

    .line 35
    .line 36
    const-string v4, "alpha"

    .line 37
    .line 38
    invoke-static {v0, v4}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    iput v0, p0, Ll/ekl0;->I:I

    .line 43
    .line 44
    iget v0, p0, Ll/ekl0;->S:I

    .line 45
    .line 46
    if-nez v0, :cond_0

    .line 47
    .line 48
    invoke-direct {p0}, Ll/ekl0;->X()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-direct {p0}, Ll/ekl0;->W()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v5

    .line 56
    invoke-static {v0, v5}, Ll/d0f0;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    iput v0, p0, Ll/ekl0;->S:I

    .line 61
    .line 62
    :cond_0
    iget v0, p0, Ll/ekl0;->S:I

    .line 63
    .line 64
    const-string v5, "inputImageTexture0"

    .line 65
    .line 66
    invoke-static {v0, v5}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    iput v0, p0, Ll/ekl0;->T:I

    .line 71
    .line 72
    iget v0, p0, Ll/ekl0;->S:I

    .line 73
    .line 74
    const-string v5, "inputTextureCoordinate"

    .line 75
    .line 76
    invoke-static {v0, v5}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    iput v0, p0, Ll/ekl0;->U:I

    .line 81
    .line 82
    iget v0, p0, Ll/ekl0;->S:I

    .line 83
    .line 84
    const-string v5, "position"

    .line 85
    .line 86
    invoke-static {v0, v5}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    iput v0, p0, Ll/ekl0;->Y:I

    .line 91
    .line 92
    iget v0, p0, Ll/ekl0;->S:I

    .line 93
    .line 94
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    iput v0, p0, Ll/ekl0;->Z:I

    .line 99
    .line 100
    iget v0, p0, Ll/ekl0;->S:I

    .line 101
    .line 102
    invoke-static {v0, v2}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    iput v0, p0, Ll/ekl0;->X:I

    .line 107
    .line 108
    iget v0, p0, Ll/ekl0;->S:I

    .line 109
    .line 110
    invoke-static {v0, v3}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    iput v0, p0, Ll/ekl0;->W:I

    .line 115
    .line 116
    iget v0, p0, Ll/ekl0;->S:I

    .line 117
    .line 118
    invoke-static {v0, v4}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 119
    .line 120
    .line 121
    move-result v0

    .line 122
    iput v0, p0, Ll/ekl0;->V:I

    .line 123
    .line 124
    return-void
.end method
