.class public Ll/cm80;
.super Ll/jt2;
.source "SourceFile"


# instance fields
.field private A:F

.field private B:F

.field private C:F

.field private D:F

.field private E:F

.field private F:F

.field private G:F

.field private H:F

.field private I:F

.field private final J:Ljava/lang/String;

.field private final K:Ljava/lang/String;

.field protected final a:[S

.field protected final b:I

.field protected c:I

.field protected d:I

.field protected e:I

.field public f:Ljava/nio/ShortBuffer;

.field protected final g:[F

.field protected i:Ljava/nio/FloatBuffer;

.field protected j:[F

.field private k:Landroid/graphics/Bitmap;

.field public l:Ljava/nio/FloatBuffer;

.field public m:Ljava/nio/FloatBuffer;

.field public n:[F

.field public final o:[F

.field public p:F

.field public q:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "[F>;"
        }
    .end annotation
.end field

.field public r:Ljava/lang/Object;

.field public s:I

.field private t:Z

.field private u:F

.field private v:F

.field private x:F

.field private y:F

.field private z:F


# direct methods
.method public constructor <init>()V
    .locals 5

    .line 1
    invoke-direct {p0}, Ll/jt2;-><init>()V

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
    iput-object v0, p0, Ll/cm80;->a:[S

    .line 11
    .line 12
    const/16 v1, 0x8

    .line 13
    .line 14
    iput v1, p0, Ll/cm80;->b:I

    .line 15
    .line 16
    const/16 v1, 0x10

    .line 17
    .line 18
    new-array v2, v1, [F

    .line 19
    .line 20
    iput-object v2, p0, Ll/cm80;->g:[F

    .line 21
    .line 22
    new-array v1, v1, [F

    .line 23
    .line 24
    iput-object v1, p0, Ll/cm80;->o:[F

    .line 25
    .line 26
    new-instance v1, Ljava/util/ArrayList;

    .line 27
    .line 28
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-static {v1}, Ljava/util/Collections;->synchronizedList(Ljava/util/List;)Ljava/util/List;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    iput-object v1, p0, Ll/cm80;->q:Ljava/util/List;

    .line 36
    .line 37
    new-instance v1, Ljava/lang/Object;

    .line 38
    .line 39
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 40
    .line 41
    .line 42
    iput-object v1, p0, Ll/cm80;->r:Ljava/lang/Object;

    .line 43
    .line 44
    const/4 v1, -0x1

    .line 45
    iput v1, p0, Ll/cm80;->s:I

    .line 46
    .line 47
    const/4 v1, 0x0

    .line 48
    iput-boolean v1, p0, Ll/cm80;->t:Z

    .line 49
    .line 50
    const/high16 v2, 0x44200000    # 640.0f

    .line 51
    .line 52
    iput v2, p0, Ll/cm80;->u:F

    .line 53
    .line 54
    const/high16 v2, 0x3f000000    # 0.5f

    .line 55
    .line 56
    iput v2, p0, Ll/cm80;->v:F

    .line 57
    .line 58
    iput v2, p0, Ll/cm80;->x:F

    .line 59
    .line 60
    const/high16 v3, 0x3f800000    # 1.0f

    .line 61
    .line 62
    iput v3, p0, Ll/cm80;->y:F

    .line 63
    .line 64
    const v4, 0x3d23d70a    # 0.04f

    .line 65
    .line 66
    .line 67
    iput v4, p0, Ll/cm80;->z:F

    .line 68
    .line 69
    const/4 v4, 0x0

    .line 70
    iput v4, p0, Ll/cm80;->A:F

    .line 71
    .line 72
    iput v4, p0, Ll/cm80;->B:F

    .line 73
    .line 74
    iput v4, p0, Ll/cm80;->C:F

    .line 75
    .line 76
    iput v4, p0, Ll/cm80;->D:F

    .line 77
    .line 78
    iput v4, p0, Ll/cm80;->E:F

    .line 79
    .line 80
    iput v4, p0, Ll/cm80;->F:F

    .line 81
    .line 82
    iput v2, p0, Ll/cm80;->G:F

    .line 83
    .line 84
    iput v2, p0, Ll/cm80;->H:F

    .line 85
    .line 86
    iput v4, p0, Ll/cm80;->I:F

    .line 87
    .line 88
    const-string v2, "uniform mat4 uMVPMatrix;attribute vec4 position;\nattribute vec4   position2 ; varying vec2 textureCoordinate;\nvarying vec2 textureCoordinate1;\nuniform vec2 decorationSize;\nvoid main() {  gl_Position = position;  vec2 coord = position2.xy;  coord = (coord) / decorationSize;\n  textureCoordinate = vec2(1.0 - (coord.x + 0.5),1.0-(coord.y + 0.5));\n}"

    .line 89
    .line 90
    iput-object v2, p0, Ll/cm80;->J:Ljava/lang/String;

    .line 91
    .line 92
    const-string v2, "precision mediump float;uniform sampler2D inputImageTexture0;varying vec2 textureCoordinate;\nvarying vec2 textureCoordinate1;\nuniform float alpha;\nvoid main() {   vec4 color1  = texture2D(inputImageTexture0,textureCoordinate);\n   gl_FragColor = vec4(color1.rgb,color1.a * alpha);\n}"

    .line 93
    .line 94
    iput-object v2, p0, Ll/cm80;->K:Ljava/lang/String;

    .line 95
    .line 96
    array-length v2, v0

    .line 97
    mul-int/lit8 v2, v2, 0x2

    .line 98
    .line 99
    invoke-static {v2}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 100
    .line 101
    .line 102
    move-result-object v2

    .line 103
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 104
    .line 105
    .line 106
    move-result-object v4

    .line 107
    invoke-virtual {v2, v4}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 108
    .line 109
    .line 110
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->asShortBuffer()Ljava/nio/ShortBuffer;

    .line 111
    .line 112
    .line 113
    move-result-object v2

    .line 114
    iput-object v2, p0, Ll/cm80;->f:Ljava/nio/ShortBuffer;

    .line 115
    .line 116
    invoke-virtual {v2, v0}, Ljava/nio/ShortBuffer;->put([S)Ljava/nio/ShortBuffer;

    .line 117
    .line 118
    .line 119
    iget-object v0, p0, Ll/cm80;->f:Ljava/nio/ShortBuffer;

    .line 120
    .line 121
    invoke-virtual {v0, v1}, Ljava/nio/ShortBuffer;->position(I)Ljava/nio/Buffer;

    .line 122
    .line 123
    .line 124
    invoke-virtual {p0, v3, v3, v3, v3}, Ll/wej;->setBackgroundColour(FFFF)V

    .line 125
    .line 126
    .line 127
    return-void

    .line 128
    nop

    .line 129
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

.method private S1()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/cm80;->k:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    int-to-float v0, v0

    .line 8
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    int-to-float v1, v1

    .line 13
    const/high16 v2, 0x3f800000    # 1.0f

    .line 14
    .line 15
    mul-float/2addr v1, v2

    .line 16
    iget v2, p0, Ll/cm80;->u:F

    .line 17
    .line 18
    div-float/2addr v1, v2

    .line 19
    mul-float/2addr v0, v1

    .line 20
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    int-to-float v1, v1

    .line 25
    const/high16 v2, 0x40000000    # 2.0f

    .line 26
    .line 27
    div-float/2addr v1, v2

    .line 28
    div-float/2addr v0, v1

    .line 29
    iget v1, p0, Ll/cm80;->A:F

    .line 30
    .line 31
    iget v2, p0, Ll/cm80;->F:F

    .line 32
    .line 33
    cmpl-float v1, v1, v2

    .line 34
    .line 35
    const/4 v2, 0x0

    .line 36
    if-lez v1, :cond_3

    .line 37
    .line 38
    iget v1, p0, Ll/cm80;->G:F

    .line 39
    .line 40
    iget v3, p0, Ll/cm80;->D:F

    .line 41
    .line 42
    add-float/2addr v1, v3

    .line 43
    iput v1, p0, Ll/cm80;->G:F

    .line 44
    .line 45
    cmpl-float v3, v3, v2

    .line 46
    .line 47
    iget v4, p0, Ll/cm80;->v:F

    .line 48
    .line 49
    if-ltz v3, :cond_0

    .line 50
    .line 51
    cmpl-float v1, v1, v4

    .line 52
    .line 53
    if-lez v1, :cond_1

    .line 54
    .line 55
    iput v4, p0, Ll/cm80;->G:F

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_0
    cmpg-float v1, v1, v4

    .line 59
    .line 60
    if-gez v1, :cond_1

    .line 61
    .line 62
    iput v4, p0, Ll/cm80;->G:F

    .line 63
    .line 64
    :cond_1
    :goto_0
    iget v1, p0, Ll/cm80;->H:F

    .line 65
    .line 66
    iget v3, p0, Ll/cm80;->E:F

    .line 67
    .line 68
    add-float/2addr v1, v3

    .line 69
    iput v1, p0, Ll/cm80;->H:F

    .line 70
    .line 71
    cmpl-float v3, v3, v2

    .line 72
    .line 73
    iget v4, p0, Ll/cm80;->x:F

    .line 74
    .line 75
    if-ltz v3, :cond_2

    .line 76
    .line 77
    cmpl-float v1, v1, v4

    .line 78
    .line 79
    if-lez v1, :cond_3

    .line 80
    .line 81
    iput v4, p0, Ll/cm80;->H:F

    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_2
    cmpg-float v1, v1, v4

    .line 85
    .line 86
    if-gez v1, :cond_3

    .line 87
    .line 88
    iput v4, p0, Ll/cm80;->H:F

    .line 89
    .line 90
    :cond_3
    :goto_1
    iget v1, p0, Ll/cm80;->G:F

    .line 91
    .line 92
    const/high16 v3, 0x3f000000    # 0.5f

    .line 93
    .line 94
    cmpl-float v4, v1, v3

    .line 95
    .line 96
    if-lez v4, :cond_4

    .line 97
    .line 98
    iget-object v4, p0, Ll/cm80;->k:Landroid/graphics/Bitmap;

    .line 99
    .line 100
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getWidth()I

    .line 101
    .line 102
    .line 103
    move-result v4

    .line 104
    int-to-float v4, v4

    .line 105
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 106
    .line 107
    .line 108
    move-result v5

    .line 109
    int-to-float v5, v5

    .line 110
    div-float/2addr v4, v5

    .line 111
    sub-float/2addr v1, v4

    .line 112
    :cond_4
    iget v4, p0, Ll/cm80;->G:F

    .line 113
    .line 114
    cmpg-float v3, v4, v3

    .line 115
    .line 116
    if-gez v3, :cond_5

    .line 117
    .line 118
    iget-object v1, p0, Ll/cm80;->k:Landroid/graphics/Bitmap;

    .line 119
    .line 120
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 121
    .line 122
    .line 123
    move-result v1

    .line 124
    int-to-float v1, v1

    .line 125
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 126
    .line 127
    .line 128
    move-result v3

    .line 129
    int-to-float v3, v3

    .line 130
    div-float/2addr v1, v3

    .line 131
    add-float/2addr v1, v4

    .line 132
    :cond_5
    new-instance v3, Landroid/graphics/PointF;

    .line 133
    .line 134
    iget v4, p0, Ll/cm80;->H:F

    .line 135
    .line 136
    invoke-direct {v3, v1, v4}, Landroid/graphics/PointF;-><init>(FF)V

    .line 137
    .line 138
    .line 139
    const v1, 0x3f4ccccd    # 0.8f

    .line 140
    .line 141
    .line 142
    mul-float/2addr v0, v1

    .line 143
    invoke-virtual {p0, v0, v0, v3, v2}, Ll/cm80;->setParamForMatrix(FFLandroid/graphics/PointF;F)V

    .line 144
    .line 145
    .line 146
    return-void
.end method


# virtual methods
.method public Q1()F
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cm80;->k:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    const/high16 v1, 0x3f800000    # 1.0f

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    int-to-float v0, v0

    .line 12
    mul-float/2addr v0, v1

    .line 13
    iget-object p0, p0, Ll/cm80;->k:Landroid/graphics/Bitmap;

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    int-to-float p0, p0

    .line 20
    div-float/2addr v0, p0

    .line 21
    return v0

    .line 22
    :cond_0
    return v1
.end method

.method public R1([F)V
    .locals 14

    .line 1
    iget v0, p0, Ll/cm80;->A:F

    .line 2
    .line 3
    iget v1, p0, Ll/cm80;->B:F

    .line 4
    .line 5
    cmpl-float v0, v0, v1

    .line 6
    .line 7
    if-ltz v0, :cond_0

    .line 8
    .line 9
    iget v0, p0, Ll/cm80;->y:F

    .line 10
    .line 11
    iget v1, p0, Ll/cm80;->C:F

    .line 12
    .line 13
    add-float/2addr v0, v1

    .line 14
    iput v0, p0, Ll/cm80;->y:F

    .line 15
    .line 16
    const/high16 v1, 0x3f800000    # 1.0f

    .line 17
    .line 18
    cmpl-float v0, v0, v1

    .line 19
    .line 20
    if-ltz v0, :cond_0

    .line 21
    .line 22
    iput v1, p0, Ll/cm80;->y:F

    .line 23
    .line 24
    :cond_0
    iget-object v0, p0, Ll/cm80;->m:Ljava/nio/FloatBuffer;

    .line 25
    .line 26
    if-nez v0, :cond_1

    .line 27
    .line 28
    array-length v0, p1

    .line 29
    mul-int/lit8 v0, v0, 0x4

    .line 30
    .line 31
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    iput-object v0, p0, Ll/cm80;->m:Ljava/nio/FloatBuffer;

    .line 47
    .line 48
    :cond_1
    iget-object v0, p0, Ll/cm80;->m:Ljava/nio/FloatBuffer;

    .line 49
    .line 50
    const/4 v1, 0x0

    .line 51
    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Ll/cm80;->m:Ljava/nio/FloatBuffer;

    .line 55
    .line 56
    invoke-virtual {v0, p1}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 57
    .line 58
    .line 59
    iget-object p1, p0, Ll/cm80;->m:Ljava/nio/FloatBuffer;

    .line 60
    .line 61
    invoke-virtual {p1, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 62
    .line 63
    .line 64
    iget v2, p0, Ll/wej;->positionHandle:I

    .line 65
    .line 66
    const/16 v6, 0x8

    .line 67
    .line 68
    iget-object v7, p0, Ll/cm80;->m:Ljava/nio/FloatBuffer;

    .line 69
    .line 70
    const/4 v3, 0x2

    .line 71
    const/16 v4, 0x1406

    .line 72
    .line 73
    const/4 v5, 0x0

    .line 74
    invoke-static/range {v2 .. v7}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 75
    .line 76
    .line 77
    iget v8, p0, Ll/cm80;->d:I

    .line 78
    .line 79
    const/16 v12, 0x8

    .line 80
    .line 81
    iget-object v13, p0, Ll/cm80;->l:Ljava/nio/FloatBuffer;

    .line 82
    .line 83
    const/4 v9, 0x2

    .line 84
    const/16 v10, 0x1406

    .line 85
    .line 86
    const/4 v11, 0x0

    .line 87
    invoke-static/range {v8 .. v13}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 88
    .line 89
    .line 90
    iget p1, p0, Ll/wej;->positionHandle:I

    .line 91
    .line 92
    invoke-static {p1}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 93
    .line 94
    .line 95
    iget p1, p0, Ll/cm80;->d:I

    .line 96
    .line 97
    invoke-static {p1}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 98
    .line 99
    .line 100
    const p1, 0x84c0

    .line 101
    .line 102
    .line 103
    invoke-static {p1}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 104
    .line 105
    .line 106
    const/16 p1, 0xde1

    .line 107
    .line 108
    iget v0, p0, Ll/cm80;->s:I

    .line 109
    .line 110
    invoke-static {p1, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 111
    .line 112
    .line 113
    iget p1, p0, Ll/wej;->textureHandle:I

    .line 114
    .line 115
    invoke-static {p1, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 116
    .line 117
    .line 118
    iget p1, p0, Ll/cm80;->e:I

    .line 119
    .line 120
    iget p0, p0, Ll/cm80;->y:F

    .line 121
    .line 122
    invoke-static {p1, p0}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 123
    .line 124
    .line 125
    return-void
.end method

.method public T1()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/cm80;->t:Z

    .line 3
    .line 4
    const/high16 v0, 0x44200000    # 640.0f

    .line 5
    .line 6
    iput v0, p0, Ll/cm80;->u:F

    .line 7
    .line 8
    const/high16 v0, 0x3f000000    # 0.5f

    .line 9
    .line 10
    iput v0, p0, Ll/cm80;->v:F

    .line 11
    .line 12
    iput v0, p0, Ll/cm80;->x:F

    .line 13
    .line 14
    const/high16 v0, 0x3f800000    # 1.0f

    .line 15
    .line 16
    iput v0, p0, Ll/cm80;->y:F

    .line 17
    .line 18
    const v0, 0x3d23d70a    # 0.04f

    .line 19
    .line 20
    .line 21
    iput v0, p0, Ll/cm80;->z:F

    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    iput v0, p0, Ll/cm80;->A:F

    .line 25
    .line 26
    iput v0, p0, Ll/cm80;->B:F

    .line 27
    .line 28
    iput v0, p0, Ll/cm80;->C:F

    .line 29
    .line 30
    iput v0, p0, Ll/cm80;->D:F

    .line 31
    .line 32
    iput v0, p0, Ll/cm80;->E:F

    .line 33
    .line 34
    iput v0, p0, Ll/cm80;->F:F

    .line 35
    .line 36
    iput v0, p0, Ll/cm80;->I:F

    .line 37
    .line 38
    return-void
.end method

.method public U1(F)V
    .locals 0

    .line 1
    iput p1, p0, Ll/cm80;->C:F

    .line 2
    .line 3
    return-void
.end method

.method public V1(FF)V
    .locals 0

    .line 1
    iput p1, p0, Ll/cm80;->v:F

    .line 2
    .line 3
    iput p2, p0, Ll/cm80;->x:F

    .line 4
    .line 5
    return-void
.end method

.method public W1(F)V
    .locals 0

    .line 1
    iput p1, p0, Ll/cm80;->D:F

    .line 2
    .line 3
    return-void
.end method

.method public X1(FF)V
    .locals 0

    .line 1
    iput p1, p0, Ll/cm80;->G:F

    .line 2
    .line 3
    iput p2, p0, Ll/cm80;->H:F

    .line 4
    .line 5
    return-void
.end method

.method public Y1(Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/cm80;->k:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    iput-boolean p1, p0, Ll/cm80;->t:Z

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/cm80;->initCoordinate()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public Z1(F)V
    .locals 0

    .line 1
    iput p1, p0, Ll/cm80;->I:F

    .line 2
    .line 3
    return-void
.end method

.method public bindShaderAttributes()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/wej;->bindShaderAttributes()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/wej;->programHandle:I

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
    iget p0, p0, Ll/wej;->programHandle:I

    .line 13
    .line 14
    const/4 v0, 0x3

    .line 15
    const-string v1, "decorationSize"

    .line 16
    .line 17
    invoke-static {p0, v0, v1}, Landroid/opengl/GLES20;->glBindAttribLocation(IILjava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public bitmapToTexture(Landroid/graphics/Bitmap;)I
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

.method public clearPoints()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cm80;->r:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Ll/cm80;->q:Ljava/util/List;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 9
    .line 10
    .line 11
    goto :goto_0

    .line 12
    :catchall_0
    move-exception p0

    .line 13
    goto :goto_1

    .line 14
    :cond_0
    :goto_0
    monitor-exit v0

    .line 15
    return-void

    .line 16
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    throw p0
.end method

.method public destroy()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/gfj;->destroy()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/cm80;->s:I

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    filled-new-array {v0}, [I

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/4 v1, 0x1

    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 15
    .line 16
    .line 17
    iput v2, p0, Ll/cm80;->s:I

    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Ll/cm80;->k:Landroid/graphics/Bitmap;

    .line 20
    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    iput-object v0, p0, Ll/cm80;->k:Landroid/graphics/Bitmap;

    .line 25
    .line 26
    :cond_1
    return-void
.end method

.method public drawBackgroundImage()V
    .locals 11

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
    iget v0, p0, Ll/cm80;->c:I

    .line 26
    .line 27
    const/high16 v2, 0x3f800000    # 1.0f

    .line 28
    .line 29
    invoke-static {v0, v2, v2}, Landroid/opengl/GLES20;->glUniform2f(IFF)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/cm80;->j:[F

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
    iput-object v0, p0, Ll/cm80;->j:[F

    .line 41
    .line 42
    :cond_0
    iget-object v0, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 43
    .line 44
    iget v4, p0, Ll/wej;->curRotation:I

    .line 45
    .line 46
    aget-object v0, v0, v4

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 52
    .line 53
    iget v4, p0, Ll/wej;->curRotation:I

    .line 54
    .line 55
    aget-object v0, v0, v4

    .line 56
    .line 57
    iget-object v4, p0, Ll/cm80;->j:[F

    .line 58
    .line 59
    invoke-virtual {v0, v4}, Ljava/nio/FloatBuffer;->get([F)Ljava/nio/FloatBuffer;

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Ll/cm80;->i:Ljava/nio/FloatBuffer;

    .line 63
    .line 64
    const/4 v4, 0x4

    .line 65
    if-nez v0, :cond_1

    .line 66
    .line 67
    iget-object v0, p0, Ll/cm80;->j:[F

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
    iput-object v0, p0, Ll/cm80;->i:Ljava/nio/FloatBuffer;

    .line 88
    .line 89
    :cond_1
    move v0, v1

    .line 90
    :goto_0
    if-ge v0, v3, :cond_2

    .line 91
    .line 92
    iget-object v5, p0, Ll/cm80;->j:[F

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
    iget-object v0, p0, Ll/cm80;->i:Ljava/nio/FloatBuffer;

    .line 108
    .line 109
    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 110
    .line 111
    .line 112
    iget-object v0, p0, Ll/cm80;->i:Ljava/nio/FloatBuffer;

    .line 113
    .line 114
    iget-object v3, p0, Ll/cm80;->j:[F

    .line 115
    .line 116
    invoke-virtual {v0, v3}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 117
    .line 118
    .line 119
    iget-object v0, p0, Ll/cm80;->i:Ljava/nio/FloatBuffer;

    .line 120
    .line 121
    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 122
    .line 123
    .line 124
    iget v5, p0, Ll/cm80;->d:I

    .line 125
    .line 126
    const/16 v9, 0x8

    .line 127
    .line 128
    iget-object v10, p0, Ll/cm80;->i:Ljava/nio/FloatBuffer;

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
    iget v0, p0, Ll/cm80;->d:I

    .line 138
    .line 139
    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 140
    .line 141
    .line 142
    const v0, 0x84c0

    .line 143
    .line 144
    .line 145
    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 146
    .line 147
    .line 148
    const/16 v0, 0xde1

    .line 149
    .line 150
    iget v3, p0, Ll/wej;->texture_in:I

    .line 151
    .line 152
    invoke-static {v0, v3}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 153
    .line 154
    .line 155
    iget v0, p0, Ll/wej;->textureHandle:I

    .line 156
    .line 157
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 158
    .line 159
    .line 160
    iget p0, p0, Ll/cm80;->e:I

    .line 161
    .line 162
    invoke-static {p0, v2}, Landroid/opengl/GLES20;->glUniform1f(IF)V

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

.method public drawStick(F)V
    .locals 3

    .line 1
    iget v0, p0, Ll/cm80;->c:I

    .line 2
    .line 3
    const/high16 v1, 0x3f800000    # 1.0f

    .line 4
    .line 5
    invoke-static {v0, v1, p1}, Landroid/opengl/GLES20;->glUniform2f(IFF)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/cm80;->a:[S

    .line 9
    .line 10
    array-length p1, p1

    .line 11
    const/16 v0, 0x1403

    .line 12
    .line 13
    iget-object v1, p0, Ll/cm80;->f:Ljava/nio/ShortBuffer;

    .line 14
    .line 15
    const/4 v2, 0x4

    .line 16
    invoke-static {v2, p1, v0, v1}, Landroid/opengl/GLES20;->glDrawElements(IIILjava/nio/Buffer;)V

    .line 17
    .line 18
    .line 19
    iget p0, p0, Ll/wej;->positionHandle:I

    .line 20
    .line 21
    invoke-static {p0}, Landroid/opengl/GLES20;->glDisableVertexAttribArray(I)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public drawSub()V
    .locals 5

    .line 1
    iget v0, p0, Ll/cm80;->A:F

    .line 2
    .line 3
    iget v1, p0, Ll/cm80;->z:F

    .line 4
    .line 5
    add-float/2addr v0, v1

    .line 6
    iput v0, p0, Ll/cm80;->A:F

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    const/4 v2, 0x0

    .line 17
    invoke-static {v2, v2, v0, v1}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 18
    .line 19
    .line 20
    iget v0, p0, Ll/wej;->programHandle:I

    .line 21
    .line 22
    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 23
    .line 24
    .line 25
    const/high16 v0, 0x3f800000    # 1.0f

    .line 26
    .line 27
    const/4 v1, 0x0

    .line 28
    invoke-static {v0, v0, v0, v1}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    .line 29
    .line 30
    .line 31
    const/16 v0, 0x4100

    .line 32
    .line 33
    invoke-static {v0}, Landroid/opengl/GLES20;->glClear(I)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Ll/cm80;->drawBackgroundImage()V

    .line 37
    .line 38
    .line 39
    iget v0, p0, Ll/cm80;->A:F

    .line 40
    .line 41
    iget v1, p0, Ll/cm80;->I:F

    .line 42
    .line 43
    cmpl-float v0, v0, v1

    .line 44
    .line 45
    if-lez v0, :cond_3

    .line 46
    .line 47
    iget-object v0, p0, Ll/cm80;->k:Landroid/graphics/Bitmap;

    .line 48
    .line 49
    if-eqz v0, :cond_3

    .line 50
    .line 51
    const/16 v0, 0xbe2

    .line 52
    .line 53
    invoke-static {v0}, Landroid/opengl/GLES20;->glEnable(I)V

    .line 54
    .line 55
    .line 56
    const/16 v1, 0x302

    .line 57
    .line 58
    const/4 v3, 0x1

    .line 59
    const/16 v4, 0x303

    .line 60
    .line 61
    invoke-static {v1, v4, v3, v4}, Landroid/opengl/GLES20;->glBlendFuncSeparate(IIII)V

    .line 62
    .line 63
    .line 64
    invoke-direct {p0}, Ll/cm80;->S1()V

    .line 65
    .line 66
    .line 67
    iget v1, p0, Ll/cm80;->s:I

    .line 68
    .line 69
    const/4 v3, -0x1

    .line 70
    if-eq v1, v3, :cond_0

    .line 71
    .line 72
    iget-boolean v1, p0, Ll/cm80;->t:Z

    .line 73
    .line 74
    if-eqz v1, :cond_1

    .line 75
    .line 76
    :cond_0
    iget-object v1, p0, Ll/cm80;->k:Landroid/graphics/Bitmap;

    .line 77
    .line 78
    invoke-virtual {p0, v1}, Ll/cm80;->bitmapToTexture(Landroid/graphics/Bitmap;)I

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    iput v1, p0, Ll/cm80;->s:I

    .line 83
    .line 84
    iput-boolean v2, p0, Ll/cm80;->t:Z

    .line 85
    .line 86
    :cond_1
    iget-object v1, p0, Ll/cm80;->q:Ljava/util/List;

    .line 87
    .line 88
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 93
    .line 94
    .line 95
    move-result v2

    .line 96
    if-eqz v2, :cond_2

    .line 97
    .line 98
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object v2

    .line 102
    check-cast v2, [F

    .line 103
    .line 104
    invoke-virtual {p0, v2}, Ll/cm80;->R1([F)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {p0}, Ll/cm80;->Q1()F

    .line 108
    .line 109
    .line 110
    move-result v2

    .line 111
    invoke-virtual {p0, v2}, Ll/cm80;->drawStick(F)V

    .line 112
    .line 113
    .line 114
    goto :goto_0

    .line 115
    :cond_2
    invoke-virtual {p0}, Ll/cm80;->clearPoints()V

    .line 116
    .line 117
    .line 118
    invoke-static {v0}, Landroid/opengl/GLES20;->glDisable(I)V

    .line 119
    .line 120
    .line 121
    :cond_3
    return-void
.end method

.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision mediump float;uniform sampler2D inputImageTexture0;varying vec2 textureCoordinate;\nvarying vec2 textureCoordinate1;\nuniform float alpha;\nvoid main() {   vec4 color1  = texture2D(inputImageTexture0,textureCoordinate);\n   gl_FragColor = vec4(color1.rgb,color1.a * alpha);\n}"

    .line 2
    .line 3
    return-object p0
.end method

.method public getVertexShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "uniform mat4 uMVPMatrix;attribute vec4 position;\nattribute vec4   position2 ; varying vec2 textureCoordinate;\nvarying vec2 textureCoordinate1;\nuniform vec2 decorationSize;\nvoid main() {  gl_Position = position;  vec2 coord = position2.xy;  coord = (coord) / decorationSize;\n  textureCoordinate = vec2(1.0 - (coord.x + 0.5),1.0-(coord.y + 0.5));\n}"

    .line 2
    .line 3
    return-object p0
.end method

.method public handleSizeChange()V
    .locals 9

    .line 1
    invoke-super {p0}, Ll/gfj;->handleSizeChange()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-lez v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-lez v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    int-to-float v0, v0

    .line 21
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    int-to-float v1, v1

    .line 26
    div-float/2addr v0, v1

    .line 27
    iget-object v1, p0, Ll/cm80;->g:[F

    .line 28
    .line 29
    const/high16 p0, -0x40800000    # -1.0f

    .line 30
    .line 31
    div-float v5, p0, v0

    .line 32
    .line 33
    const/high16 p0, 0x3f800000    # 1.0f

    .line 34
    .line 35
    div-float v6, p0, v0

    .line 36
    .line 37
    const/high16 v7, 0x40400000    # 3.0f

    .line 38
    .line 39
    const/high16 v8, 0x40e00000    # 7.0f

    .line 40
    .line 41
    const/4 v2, 0x0

    .line 42
    const/high16 v3, -0x40800000    # -1.0f

    .line 43
    .line 44
    const/high16 v4, 0x3f800000    # 1.0f

    .line 45
    .line 46
    invoke-static/range {v1 .. v8}, Landroid/opengl/Matrix;->orthoM([FIFFFFFF)V

    .line 47
    .line 48
    .line 49
    :cond_0
    return-void
.end method

.method public initCoordinate()V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Ll/cm80;->k:Landroid/graphics/Bitmap;

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    int-to-float v1, v1

    .line 13
    iget-object v2, v0, Ll/cm80;->k:Landroid/graphics/Bitmap;

    .line 14
    .line 15
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    int-to-float v2, v2

    .line 20
    div-float/2addr v1, v2

    .line 21
    iput v1, v0, Ll/cm80;->p:F

    .line 22
    .line 23
    const/high16 v2, 0x3f000000    # 0.5f

    .line 24
    .line 25
    mul-float v3, v1, v2

    .line 26
    .line 27
    const/high16 v4, -0x41000000    # -0.5f

    .line 28
    .line 29
    mul-float v5, v4, v1

    .line 30
    .line 31
    mul-float v6, v4, v1

    .line 32
    .line 33
    mul-float/2addr v1, v2

    .line 34
    const/16 v7, 0x8

    .line 35
    .line 36
    new-array v8, v7, [F

    .line 37
    .line 38
    const/4 v9, 0x0

    .line 39
    aput v4, v8, v9

    .line 40
    .line 41
    const/4 v10, 0x1

    .line 42
    aput v3, v8, v10

    .line 43
    .line 44
    const/4 v3, 0x2

    .line 45
    aput v4, v8, v3

    .line 46
    .line 47
    const/4 v11, 0x3

    .line 48
    aput v5, v8, v11

    .line 49
    .line 50
    const/4 v5, 0x4

    .line 51
    aput v2, v8, v5

    .line 52
    .line 53
    const/4 v12, 0x5

    .line 54
    aput v6, v8, v12

    .line 55
    .line 56
    const/4 v6, 0x6

    .line 57
    aput v2, v8, v6

    .line 58
    .line 59
    const/4 v13, 0x7

    .line 60
    aput v1, v8, v13

    .line 61
    .line 62
    const/16 v1, 0x20

    .line 63
    .line 64
    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 69
    .line 70
    .line 71
    move-result-object v14

    .line 72
    invoke-virtual {v1, v14}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 73
    .line 74
    .line 75
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    iput-object v1, v0, Ll/cm80;->l:Ljava/nio/FloatBuffer;

    .line 80
    .line 81
    invoke-virtual {v1, v8}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 82
    .line 83
    .line 84
    iget-object v1, v0, Ll/cm80;->l:Ljava/nio/FloatBuffer;

    .line 85
    .line 86
    invoke-virtual {v1, v9}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 87
    .line 88
    .line 89
    iget v1, v0, Ll/cm80;->p:F

    .line 90
    .line 91
    mul-float v8, v1, v2

    .line 92
    .line 93
    mul-float v14, v4, v1

    .line 94
    .line 95
    mul-float v15, v4, v1

    .line 96
    .line 97
    mul-float/2addr v1, v2

    .line 98
    move/from16 v16, v2

    .line 99
    .line 100
    const/16 v2, 0x10

    .line 101
    .line 102
    new-array v2, v2, [F

    .line 103
    .line 104
    aput v4, v2, v9

    .line 105
    .line 106
    aput v8, v2, v10

    .line 107
    .line 108
    const/4 v8, 0x0

    .line 109
    aput v8, v2, v3

    .line 110
    .line 111
    const/high16 v3, 0x3f800000    # 1.0f

    .line 112
    .line 113
    aput v3, v2, v11

    .line 114
    .line 115
    aput v4, v2, v5

    .line 116
    .line 117
    aput v14, v2, v12

    .line 118
    .line 119
    aput v8, v2, v6

    .line 120
    .line 121
    aput v3, v2, v13

    .line 122
    .line 123
    aput v16, v2, v7

    .line 124
    .line 125
    const/16 v4, 0x9

    .line 126
    .line 127
    aput v15, v2, v4

    .line 128
    .line 129
    const/16 v4, 0xa

    .line 130
    .line 131
    aput v8, v2, v4

    .line 132
    .line 133
    const/16 v4, 0xb

    .line 134
    .line 135
    aput v3, v2, v4

    .line 136
    .line 137
    const/16 v4, 0xc

    .line 138
    .line 139
    aput v16, v2, v4

    .line 140
    .line 141
    const/16 v4, 0xd

    .line 142
    .line 143
    aput v1, v2, v4

    .line 144
    .line 145
    const/16 v1, 0xe

    .line 146
    .line 147
    aput v8, v2, v1

    .line 148
    .line 149
    const/16 v1, 0xf

    .line 150
    .line 151
    aput v3, v2, v1

    .line 152
    .line 153
    iput-object v2, v0, Ll/cm80;->n:[F

    .line 154
    .line 155
    iget-object v1, v0, Ll/cm80;->o:[F

    .line 156
    .line 157
    invoke-static {v1, v9}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    .line 158
    .line 159
    .line 160
    iget-object v0, v0, Ll/cm80;->o:[F

    .line 161
    .line 162
    const/high16 v1, -0x40800000    # -1.0f

    .line 163
    .line 164
    aput v1, v0, v9

    .line 165
    .line 166
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
    const-string v1, "position2"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Ll/cm80;->d:I

    .line 13
    .line 14
    iget v0, p0, Ll/wej;->programHandle:I

    .line 15
    .line 16
    const-string v1, "decorationSize"

    .line 17
    .line 18
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Ll/cm80;->c:I

    .line 23
    .line 24
    iget v0, p0, Ll/wej;->programHandle:I

    .line 25
    .line 26
    const-string v1, "alpha"

    .line 27
    .line 28
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iput v0, p0, Ll/cm80;->e:I

    .line 33
    .line 34
    return-void
.end method

.method public newTextureReady(ILl/gfj;Z)V
    .locals 0

    .line 1
    if-eqz p3, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/gfj;->markAsDirty()V

    .line 4
    .line 5
    .line 6
    :cond_0
    iput p1, p0, Ll/wej;->texture_in:I

    .line 7
    .line 8
    invoke-virtual {p2}, Ll/wej;->getWidth()I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    invoke-virtual {p0, p1}, Ll/wej;->setWidth(I)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p2}, Ll/wej;->getHeight()I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    invoke-virtual {p0, p1}, Ll/wej;->setHeight(I)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ll/wej;->onDrawFrame()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p2}, Ll/gfj;->unlockRenderBuffer()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public releaseFrameBuffer()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/gfj;->releaseFrameBuffer()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/cm80;->s:I

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    filled-new-array {v0}, [I

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/4 v1, 0x1

    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 15
    .line 16
    .line 17
    iput v2, p0, Ll/cm80;->s:I

    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Ll/cm80;->k:Landroid/graphics/Bitmap;

    .line 20
    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    iput-object v0, p0, Ll/cm80;->k:Landroid/graphics/Bitmap;

    .line 25
    .line 26
    :cond_1
    return-void
.end method

.method public setAlpha(F)V
    .locals 0

    .line 1
    iput p1, p0, Ll/cm80;->y:F

    .line 2
    .line 3
    return-void
.end method

.method public setParamForMatrix(FFLandroid/graphics/PointF;F)V
    .locals 10

    .line 1
    if-nez p3, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget v0, p3, Landroid/graphics/PointF;->x:F

    .line 5
    .line 6
    const/high16 v1, 0x40000000    # 2.0f

    .line 7
    .line 8
    mul-float/2addr v0, v1

    .line 9
    const/high16 v2, 0x3f800000    # 1.0f

    .line 10
    .line 11
    sub-float/2addr v0, v2

    .line 12
    neg-float v0, v0

    .line 13
    iget p3, p3, Landroid/graphics/PointF;->y:F

    .line 14
    .line 15
    neg-float p3, p3

    .line 16
    mul-float/2addr p3, v1

    .line 17
    add-float/2addr p3, v2

    .line 18
    const/16 v1, 0x10

    .line 19
    .line 20
    new-array v3, v1, [F

    .line 21
    .line 22
    new-array v1, v1, [F

    .line 23
    .line 24
    const/4 v9, 0x0

    .line 25
    invoke-static {v1, v9}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    .line 26
    .line 27
    .line 28
    neg-float v0, v0

    .line 29
    const/4 v4, 0x0

    .line 30
    invoke-static {v1, v9, v0, p3, v4}, Landroid/opengl/Matrix;->translateM([FIFFF)V

    .line 31
    .line 32
    .line 33
    iget-object v5, p0, Ll/cm80;->o:[F

    .line 34
    .line 35
    iget-object v7, p0, Ll/cm80;->g:[F

    .line 36
    .line 37
    const/4 v8, 0x0

    .line 38
    const/4 v4, 0x0

    .line 39
    const/4 v6, 0x0

    .line 40
    invoke-static/range {v3 .. v8}, Landroid/opengl/Matrix;->multiplyMM([FI[FI[FI)V

    .line 41
    .line 42
    .line 43
    move-object v7, v3

    .line 44
    move-object v5, v1

    .line 45
    invoke-static/range {v3 .. v8}, Landroid/opengl/Matrix;->multiplyMM([FI[FI[FI)V

    .line 46
    .line 47
    .line 48
    move-object p3, v5

    .line 49
    const/4 v7, 0x0

    .line 50
    const/high16 v8, 0x3f800000    # 1.0f

    .line 51
    .line 52
    const/4 v6, 0x0

    .line 53
    move v5, p4

    .line 54
    invoke-static/range {v3 .. v8}, Landroid/opengl/Matrix;->rotateM([FIFFFF)V

    .line 55
    .line 56
    .line 57
    mul-float/2addr p1, v2

    .line 58
    mul-float/2addr p2, v2

    .line 59
    invoke-static {v3, v9, p1, p2, v2}, Landroid/opengl/Matrix;->scaleM([FIFFF)V

    .line 60
    .line 61
    .line 62
    iget-object v7, p0, Ll/cm80;->n:[F

    .line 63
    .line 64
    const/4 v8, 0x0

    .line 65
    const/4 v6, 0x0

    .line 66
    move-object v5, v3

    .line 67
    move-object v3, p3

    .line 68
    invoke-static/range {v3 .. v8}, Landroid/opengl/Matrix;->multiplyMM([FI[FI[FI)V

    .line 69
    .line 70
    .line 71
    aget p1, p3, v9

    .line 72
    .line 73
    const/4 p2, 0x1

    .line 74
    aget p4, p3, p2

    .line 75
    .line 76
    const/4 v0, 0x4

    .line 77
    aget v1, p3, v0

    .line 78
    .line 79
    const/4 v2, 0x5

    .line 80
    aget v3, p3, v2

    .line 81
    .line 82
    const/16 v4, 0x8

    .line 83
    .line 84
    aget v5, p3, v4

    .line 85
    .line 86
    const/16 v6, 0x9

    .line 87
    .line 88
    aget v6, p3, v6

    .line 89
    .line 90
    const/16 v7, 0xc

    .line 91
    .line 92
    aget v7, p3, v7

    .line 93
    .line 94
    const/16 v8, 0xd

    .line 95
    .line 96
    aget p3, p3, v8

    .line 97
    .line 98
    new-array v4, v4, [F

    .line 99
    .line 100
    aput p1, v4, v9

    .line 101
    .line 102
    aput p4, v4, p2

    .line 103
    .line 104
    const/4 p1, 0x2

    .line 105
    aput v1, v4, p1

    .line 106
    .line 107
    const/4 p1, 0x3

    .line 108
    aput v3, v4, p1

    .line 109
    .line 110
    aput v5, v4, v0

    .line 111
    .line 112
    aput v6, v4, v2

    .line 113
    .line 114
    const/4 p1, 0x6

    .line 115
    aput v7, v4, p1

    .line 116
    .line 117
    const/4 p1, 0x7

    .line 118
    aput p3, v4, p1

    .line 119
    .line 120
    iget-object p0, p0, Ll/cm80;->q:Ljava/util/List;

    .line 121
    .line 122
    invoke-interface {p0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    return-void
.end method
