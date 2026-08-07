.class public Lcom/tencent/liteav/beauty/b/z;
.super Lcom/tencent/liteav/basic/c/h;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/liteav/beauty/b/z$a;
    }
.end annotation


# static fields
.field private static final A:[F

.field protected static final v:[S

.field private static final z:[F


# instance fields
.field private B:Ljava/lang/String;

.field protected r:[Lcom/tencent/liteav/beauty/b/z$a;

.field protected s:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/tencent/liteav/beauty/d$f;",
            ">;"
        }
    .end annotation
.end field

.field protected t:Z

.field protected u:I

.field protected w:Ljava/nio/ShortBuffer;

.field private x:Lcom/tencent/liteav/beauty/b/z$a;

.field private y:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/4 v0, 0x6

    .line 2
    new-array v0, v0, [S

    .line 3
    .line 4
    fill-array-data v0, :array_0

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/tencent/liteav/beauty/b/z;->v:[S

    .line 8
    .line 9
    const/16 v0, 0x8

    .line 10
    .line 11
    new-array v0, v0, [F

    .line 12
    .line 13
    fill-array-data v0, :array_1

    .line 14
    .line 15
    .line 16
    sput-object v0, Lcom/tencent/liteav/beauty/b/z;->z:[F

    .line 17
    .line 18
    const/16 v0, 0x10

    .line 19
    .line 20
    new-array v0, v0, [F

    .line 21
    .line 22
    fill-array-data v0, :array_2

    .line 23
    .line 24
    .line 25
    sput-object v0, Lcom/tencent/liteav/beauty/b/z;->A:[F

    .line 26
    .line 27
    return-void

    .line 28
    nop

    .line 29
    :array_0
    .array-data 2
        0x1s
        0x2s
        0x0s
        0x2s
        0x0s
        0x3s
    .end array-data

    .line 30
    .line 31
    .line 32
    .line 33
    .line 34
    .line 35
    .line 36
    .line 37
    .line 38
    .line 39
    :array_1
    .array-data 4
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
    .end array-data

    .line 40
    .line 41
    .line 42
    .line 43
    .line 44
    .line 45
    .line 46
    .line 47
    .line 48
    .line 49
    .line 50
    .line 51
    .line 52
    .line 53
    .line 54
    .line 55
    .line 56
    .line 57
    .line 58
    .line 59
    :array_2
    .array-data 4
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
        0x3f800000    # 1.0f
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public constructor <init>()V
    .locals 2

    .line 58
    const-string v0, "attribute vec4 position;\nattribute vec4 inputTextureCoordinate;\n \nvarying vec2 textureCoordinate;\n \nvoid main()\n{\n    gl_Position = position;\n    textureCoordinate = inputTextureCoordinate.xy;\n}"

    const-string v1, "varying lowp vec2 textureCoordinate;\n \nuniform sampler2D inputImageTexture;\n \nvoid main()\n{\n     gl_FragColor = texture2D(inputImageTexture, textureCoordinate);\n}"

    invoke-direct {p0, v0, v1}, Lcom/tencent/liteav/beauty/b/z;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/tencent/liteav/basic/c/h;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Lcom/tencent/liteav/beauty/b/z;->r:[Lcom/tencent/liteav/beauty/b/z$a;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/tencent/liteav/beauty/b/z;->x:Lcom/tencent/liteav/beauty/b/z$a;

    .line 8
    .line 9
    iput-object p1, p0, Lcom/tencent/liteav/beauty/b/z;->s:Ljava/util/List;

    .line 10
    .line 11
    const/4 p2, 0x0

    .line 12
    iput-boolean p2, p0, Lcom/tencent/liteav/beauty/b/z;->t:Z

    .line 13
    .line 14
    const/4 v0, 0x1

    .line 15
    iput v0, p0, Lcom/tencent/liteav/beauty/b/z;->u:I

    .line 16
    .line 17
    iput v0, p0, Lcom/tencent/liteav/beauty/b/z;->y:I

    .line 18
    .line 19
    iput-object p1, p0, Lcom/tencent/liteav/beauty/b/z;->w:Ljava/nio/ShortBuffer;

    .line 20
    .line 21
    const-string p1, "GPUWatermark"

    .line 22
    .line 23
    iput-object p1, p0, Lcom/tencent/liteav/beauty/b/z;->B:Ljava/lang/String;

    .line 24
    .line 25
    sget-object p1, Lcom/tencent/liteav/beauty/b/z;->v:[S

    .line 26
    .line 27
    array-length v1, p1

    .line 28
    mul-int/lit8 v1, v1, 0x2

    .line 29
    .line 30
    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->asShortBuffer()Ljava/nio/ShortBuffer;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    iput-object v1, p0, Lcom/tencent/liteav/beauty/b/z;->w:Ljava/nio/ShortBuffer;

    .line 46
    .line 47
    invoke-virtual {v1, p1}, Ljava/nio/ShortBuffer;->put([S)Ljava/nio/ShortBuffer;

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Lcom/tencent/liteav/beauty/b/z;->w:Ljava/nio/ShortBuffer;

    .line 51
    .line 52
    invoke-virtual {p1, p2}, Ljava/nio/ShortBuffer;->position(I)Ljava/nio/Buffer;

    .line 53
    .line 54
    .line 55
    iput-boolean v0, p0, Lcom/tencent/liteav/basic/c/h;->o:Z

    .line 56
    .line 57
    return-void
.end method

.method private q()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/z;->r:[Lcom/tencent/liteav/beauty/b/z$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_2

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    move v2, v0

    .line 8
    :goto_0
    iget-object v3, p0, Lcom/tencent/liteav/beauty/b/z;->r:[Lcom/tencent/liteav/beauty/b/z$a;

    .line 9
    .line 10
    array-length v4, v3

    .line 11
    if-ge v2, v4, :cond_2

    .line 12
    .line 13
    aget-object v3, v3, v2

    .line 14
    .line 15
    if-eqz v3, :cond_1

    .line 16
    .line 17
    iget-object v3, v3, Lcom/tencent/liteav/beauty/b/z$a;->d:[I

    .line 18
    .line 19
    if-eqz v3, :cond_0

    .line 20
    .line 21
    const/4 v4, 0x1

    .line 22
    invoke-static {v4, v3, v0}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 23
    .line 24
    .line 25
    :cond_0
    iget-object v3, p0, Lcom/tencent/liteav/beauty/b/z;->r:[Lcom/tencent/liteav/beauty/b/z$a;

    .line 26
    .line 27
    aget-object v4, v3, v2

    .line 28
    .line 29
    iput-object v1, v4, Lcom/tencent/liteav/beauty/b/z$a;->d:[I

    .line 30
    .line 31
    iput-object v1, v4, Lcom/tencent/liteav/beauty/b/z$a;->c:Landroid/graphics/Bitmap;

    .line 32
    .line 33
    aput-object v1, v3, v2

    .line 34
    .line 35
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_2
    iput-object v1, p0, Lcom/tencent/liteav/beauty/b/z;->r:[Lcom/tencent/liteav/beauty/b/z$a;

    .line 39
    .line 40
    return-void
.end method


# virtual methods
.method public a(IIFFFI)V
    .locals 5

    .line 169
    sget-object v0, Lcom/tencent/liteav/beauty/b/z;->z:[F

    array-length v1, v0

    const/4 v2, 0x4

    mul-int/2addr v1, v2

    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 170
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 171
    iget-object v3, p0, Lcom/tencent/liteav/beauty/b/z;->r:[Lcom/tencent/liteav/beauty/b/z$a;

    aget-object v3, v3, p6

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    move-result-object v1

    iput-object v1, v3, Lcom/tencent/liteav/beauty/b/z$a;->a:Ljava/nio/FloatBuffer;

    .line 172
    array-length v0, v0

    new-array v0, v0, [F

    int-to-float p2, p2

    int-to-float p1, p1

    div-float/2addr p2, p1

    mul-float/2addr p2, p5

    .line 173
    iget p1, p0, Lcom/tencent/liteav/basic/c/h;->e:I

    int-to-float p1, p1

    mul-float/2addr p2, p1

    iget p1, p0, Lcom/tencent/liteav/basic/c/h;->f:I

    int-to-float p1, p1

    div-float/2addr p2, p1

    const/high16 p1, 0x40000000    # 2.0f

    mul-float/2addr p3, p1

    const/high16 v1, 0x3f800000    # 1.0f

    sub-float/2addr p3, v1

    const/4 v3, 0x0

    .line 174
    aput p3, v0, v3

    mul-float/2addr p4, p1

    sub-float/2addr v1, p4

    const/4 p4, 0x1

    .line 175
    aput v1, v0, p4

    const/4 v4, 0x2

    .line 176
    aput p3, v0, v4

    mul-float/2addr p2, p1

    sub-float p2, v1, p2

    const/4 v4, 0x3

    .line 177
    aput p2, v0, v4

    mul-float/2addr p5, p1

    add-float/2addr p3, p5

    .line 178
    aput p3, v0, v2

    const/4 p1, 0x5

    .line 179
    aput p2, v0, p1

    const/4 p1, 0x6

    .line 180
    aput p3, v0, p1

    const/4 p1, 0x7

    .line 181
    aput v1, v0, p1

    :goto_0
    if-gt p4, p1, :cond_0

    .line 182
    aget p2, v0, p4

    const/high16 p3, -0x40800000    # -1.0f

    mul-float/2addr p2, p3

    aput p2, v0, p4

    add-int/lit8 p4, p4, 0x2

    goto :goto_0

    .line 183
    :cond_0
    iget-object p1, p0, Lcom/tencent/liteav/beauty/b/z;->r:[Lcom/tencent/liteav/beauty/b/z$a;

    aget-object p1, p1, p6

    iget-object p1, p1, Lcom/tencent/liteav/beauty/b/z$a;->a:Ljava/nio/FloatBuffer;

    invoke-virtual {p1, v0}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 184
    iget-object p1, p0, Lcom/tencent/liteav/beauty/b/z;->r:[Lcom/tencent/liteav/beauty/b/z$a;

    aget-object p1, p1, p6

    iget-object p1, p1, Lcom/tencent/liteav/beauty/b/z$a;->a:Ljava/nio/FloatBuffer;

    invoke-virtual {p1, v3}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 185
    sget-object p1, Lcom/tencent/liteav/beauty/b/z;->A:[F

    array-length p2, p1

    mul-int/2addr p2, v2

    invoke-static {p2}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object p2

    .line 186
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 187
    iget-object p3, p0, Lcom/tencent/liteav/beauty/b/z;->r:[Lcom/tencent/liteav/beauty/b/z$a;

    aget-object p3, p3, p6

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    move-result-object p2

    iput-object p2, p3, Lcom/tencent/liteav/beauty/b/z$a;->b:Ljava/nio/FloatBuffer;

    .line 188
    iget-object p2, p0, Lcom/tencent/liteav/beauty/b/z;->r:[Lcom/tencent/liteav/beauty/b/z$a;

    aget-object p2, p2, p6

    iget-object p2, p2, Lcom/tencent/liteav/beauty/b/z$a;->b:Ljava/nio/FloatBuffer;

    invoke-virtual {p2, p1}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 189
    iget-object p0, p0, Lcom/tencent/liteav/beauty/b/z;->r:[Lcom/tencent/liteav/beauty/b/z$a;

    aget-object p0, p0, p6

    iget-object p0, p0, Lcom/tencent/liteav/beauty/b/z$a;->b:Ljava/nio/FloatBuffer;

    invoke-virtual {p0, v3}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    return-void
.end method

.method public a(Landroid/graphics/Bitmap;FFF)V
    .locals 9

    .line 190
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/z;->r:[Lcom/tencent/liteav/beauty/b/z$a;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    .line 191
    new-array v0, v0, [Lcom/tencent/liteav/beauty/b/z$a;

    iput-object v0, p0, Lcom/tencent/liteav/beauty/b/z;->r:[Lcom/tencent/liteav/beauty/b/z$a;

    .line 192
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/z;->r:[Lcom/tencent/liteav/beauty/b/z$a;

    const/4 v1, 0x0

    aget-object v2, v0, v1

    if-nez v2, :cond_1

    .line 193
    new-instance v2, Lcom/tencent/liteav/beauty/b/z$a;

    invoke-direct {v2, p0}, Lcom/tencent/liteav/beauty/b/z$a;-><init>(Lcom/tencent/liteav/beauty/b/z;)V

    aput-object v2, v0, v1

    :cond_1
    const/4 v8, 0x0

    move-object v3, p0

    move-object v4, p1

    move v5, p2

    move v6, p3

    move v7, p4

    .line 194
    invoke-virtual/range {v3 .. v8}, Lcom/tencent/liteav/beauty/b/z;->a(Landroid/graphics/Bitmap;FFFI)V

    .line 195
    iget-object p0, v3, Lcom/tencent/liteav/beauty/b/z;->r:[Lcom/tencent/liteav/beauty/b/z$a;

    aget-object p0, p0, v1

    iput-object p0, v3, Lcom/tencent/liteav/beauty/b/z;->x:Lcom/tencent/liteav/beauty/b/z$a;

    return-void
.end method

.method public a(Landroid/graphics/Bitmap;FFFI)V
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/z;->r:[Lcom/tencent/liteav/beauty/b/z$a;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    if-nez p1, :cond_2

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    aget-object p1, v0, p5

    .line 10
    .line 11
    if-eqz p1, :cond_1

    .line 12
    .line 13
    iget-object p1, p1, Lcom/tencent/liteav/beauty/b/z$a;->d:[I

    .line 14
    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    invoke-static {v1, p1, v2}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object p0, p0, Lcom/tencent/liteav/beauty/b/z;->r:[Lcom/tencent/liteav/beauty/b/z$a;

    .line 21
    .line 22
    aget-object p1, p0, p5

    .line 23
    .line 24
    const/4 p2, 0x0

    .line 25
    iput-object p2, p1, Lcom/tencent/liteav/beauty/b/z$a;->d:[I

    .line 26
    .line 27
    iput-object p2, p1, Lcom/tencent/liteav/beauty/b/z$a;->c:Landroid/graphics/Bitmap;

    .line 28
    .line 29
    aput-object p2, p0, p5

    .line 30
    .line 31
    :cond_1
    return-void

    .line 32
    :cond_2
    aget-object v3, v0, p5

    .line 33
    .line 34
    if-eqz v3, :cond_3

    .line 35
    .line 36
    array-length v0, v0

    .line 37
    if-lt p5, v0, :cond_4

    .line 38
    .line 39
    :cond_3
    move-object v3, p0

    .line 40
    goto/16 :goto_1

    .line 41
    .line 42
    :cond_4
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 43
    .line 44
    .line 45
    move-result v4

    .line 46
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 47
    .line 48
    .line 49
    move-result v5

    .line 50
    move-object v3, p0

    .line 51
    move v6, p2

    .line 52
    move v7, p3

    .line 53
    move v8, p4

    .line 54
    move v9, p5

    .line 55
    invoke-virtual/range {v3 .. v9}, Lcom/tencent/liteav/beauty/b/z;->a(IIFFFI)V

    .line 56
    .line 57
    .line 58
    iget-object p0, v3, Lcom/tencent/liteav/beauty/b/z;->r:[Lcom/tencent/liteav/beauty/b/z$a;

    .line 59
    .line 60
    aget-object p0, p0, v9

    .line 61
    .line 62
    iget-object p2, p0, Lcom/tencent/liteav/beauty/b/z$a;->d:[I

    .line 63
    .line 64
    const/16 p3, 0xde1

    .line 65
    .line 66
    if-nez p2, :cond_5

    .line 67
    .line 68
    new-array p2, v1, [I

    .line 69
    .line 70
    iput-object p2, p0, Lcom/tencent/liteav/beauty/b/z$a;->d:[I

    .line 71
    .line 72
    invoke-static {v1, p2, v2}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 73
    .line 74
    .line 75
    iget-object p0, v3, Lcom/tencent/liteav/beauty/b/z;->r:[Lcom/tencent/liteav/beauty/b/z$a;

    .line 76
    .line 77
    aget-object p0, p0, v9

    .line 78
    .line 79
    iget-object p0, p0, Lcom/tencent/liteav/beauty/b/z$a;->d:[I

    .line 80
    .line 81
    aget p0, p0, v2

    .line 82
    .line 83
    invoke-static {p3, p0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 84
    .line 85
    .line 86
    const/16 p0, 0x2800

    .line 87
    .line 88
    const p2, 0x46180400    # 9729.0f

    .line 89
    .line 90
    .line 91
    invoke-static {p3, p0, p2}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 92
    .line 93
    .line 94
    const/16 p0, 0x2801

    .line 95
    .line 96
    invoke-static {p3, p0, p2}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 97
    .line 98
    .line 99
    const/16 p0, 0x2802

    .line 100
    .line 101
    const p2, 0x47012f00    # 33071.0f

    .line 102
    .line 103
    .line 104
    invoke-static {p3, p0, p2}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 105
    .line 106
    .line 107
    const/16 p0, 0x2803

    .line 108
    .line 109
    invoke-static {p3, p0, p2}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 110
    .line 111
    .line 112
    :cond_5
    iget-object p0, v3, Lcom/tencent/liteav/beauty/b/z;->r:[Lcom/tencent/liteav/beauty/b/z$a;

    .line 113
    .line 114
    aget-object p0, p0, v9

    .line 115
    .line 116
    iget-object p0, p0, Lcom/tencent/liteav/beauty/b/z$a;->c:Landroid/graphics/Bitmap;

    .line 117
    .line 118
    if-eqz p0, :cond_6

    .line 119
    .line 120
    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 121
    .line 122
    .line 123
    move-result p0

    .line 124
    if-nez p0, :cond_8

    .line 125
    .line 126
    :cond_6
    iget-object p0, v3, Lcom/tencent/liteav/beauty/b/z;->r:[Lcom/tencent/liteav/beauty/b/z$a;

    .line 127
    .line 128
    aget-object p0, p0, v9

    .line 129
    .line 130
    iget-object p0, p0, Lcom/tencent/liteav/beauty/b/z$a;->d:[I

    .line 131
    .line 132
    aget p0, p0, v2

    .line 133
    .line 134
    invoke-static {p3, p0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 138
    .line 139
    .line 140
    move-result p0

    .line 141
    if-nez p0, :cond_7

    .line 142
    .line 143
    invoke-static {p3, v2, p1, v2}, Landroid/opengl/GLUtils;->texImage2D(IILandroid/graphics/Bitmap;I)V

    .line 144
    .line 145
    .line 146
    goto :goto_0

    .line 147
    :cond_7
    iget-object p0, v3, Lcom/tencent/liteav/beauty/b/z;->B:Ljava/lang/String;

    .line 148
    .line 149
    const-string p2, "SetWaterMark when bitmap is recycled"

    .line 150
    .line 151
    invoke-static {p0, p2}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 152
    .line 153
    .line 154
    :cond_8
    :goto_0
    iget-object p0, v3, Lcom/tencent/liteav/beauty/b/z;->r:[Lcom/tencent/liteav/beauty/b/z$a;

    .line 155
    .line 156
    aget-object p0, p0, v9

    .line 157
    .line 158
    iput-object p1, p0, Lcom/tencent/liteav/beauty/b/z$a;->c:Landroid/graphics/Bitmap;

    .line 159
    .line 160
    return-void

    .line 161
    :goto_1
    iget-object p0, v3, Lcom/tencent/liteav/beauty/b/z;->B:Ljava/lang/String;

    .line 162
    .line 163
    const-string p1, "index is too large for mSzWaterMark!"

    .line 164
    .line 165
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 166
    .line 167
    .line 168
    return-void
.end method

.method public d()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/tencent/liteav/basic/c/h;->d()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/tencent/liteav/beauty/b/z;->t:Z

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/tencent/liteav/beauty/b/z;->q()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public d(Z)V
    .locals 0

    .line 11
    iput-boolean p1, p0, Lcom/tencent/liteav/beauty/b/z;->t:Z

    return-void
.end method

.method public j()V
    .locals 10

    .line 1
    invoke-super {p0}, Lcom/tencent/liteav/basic/c/h;->j()V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/tencent/liteav/beauty/b/z;->t:Z

    .line 5
    .line 6
    if-eqz v0, :cond_2

    .line 7
    .line 8
    const/16 v0, 0xbe2

    .line 9
    .line 10
    invoke-static {v0}, Landroid/opengl/GLES20;->glEnable(I)V

    .line 11
    .line 12
    .line 13
    iget v1, p0, Lcom/tencent/liteav/beauty/b/z;->u:I

    .line 14
    .line 15
    const/16 v2, 0x303

    .line 16
    .line 17
    invoke-static {v1, v2}, Landroid/opengl/GLES20;->glBlendFunc(II)V

    .line 18
    .line 19
    .line 20
    const v1, 0x84c0

    .line 21
    .line 22
    .line 23
    invoke-static {v1}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 24
    .line 25
    .line 26
    const/4 v1, 0x0

    .line 27
    move v2, v1

    .line 28
    :goto_0
    iget-object v3, p0, Lcom/tencent/liteav/beauty/b/z;->r:[Lcom/tencent/liteav/beauty/b/z$a;

    .line 29
    .line 30
    array-length v4, v3

    .line 31
    if-ge v2, v4, :cond_1

    .line 32
    .line 33
    aget-object v3, v3, v2

    .line 34
    .line 35
    if-eqz v3, :cond_0

    .line 36
    .line 37
    iget-object v3, v3, Lcom/tencent/liteav/beauty/b/z$a;->d:[I

    .line 38
    .line 39
    aget v3, v3, v1

    .line 40
    .line 41
    const/16 v4, 0xde1

    .line 42
    .line 43
    invoke-static {v4, v3}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 44
    .line 45
    .line 46
    iget v3, p0, Lcom/tencent/liteav/basic/c/h;->c:I

    .line 47
    .line 48
    invoke-static {v3, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 49
    .line 50
    .line 51
    iget v4, p0, Lcom/tencent/liteav/basic/c/h;->b:I

    .line 52
    .line 53
    iget-object v3, p0, Lcom/tencent/liteav/beauty/b/z;->r:[Lcom/tencent/liteav/beauty/b/z$a;

    .line 54
    .line 55
    aget-object v3, v3, v2

    .line 56
    .line 57
    iget-object v9, v3, Lcom/tencent/liteav/beauty/b/z$a;->a:Ljava/nio/FloatBuffer;

    .line 58
    .line 59
    const/4 v5, 0x2

    .line 60
    const/16 v6, 0x1406

    .line 61
    .line 62
    const/4 v7, 0x0

    .line 63
    const/16 v8, 0x8

    .line 64
    .line 65
    invoke-static/range {v4 .. v9}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 66
    .line 67
    .line 68
    iget v3, p0, Lcom/tencent/liteav/basic/c/h;->b:I

    .line 69
    .line 70
    invoke-static {v3}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 71
    .line 72
    .line 73
    iget v4, p0, Lcom/tencent/liteav/basic/c/h;->d:I

    .line 74
    .line 75
    iget-object v3, p0, Lcom/tencent/liteav/beauty/b/z;->r:[Lcom/tencent/liteav/beauty/b/z$a;

    .line 76
    .line 77
    aget-object v3, v3, v2

    .line 78
    .line 79
    iget-object v9, v3, Lcom/tencent/liteav/beauty/b/z$a;->b:Ljava/nio/FloatBuffer;

    .line 80
    .line 81
    const/4 v5, 0x4

    .line 82
    const/16 v8, 0x10

    .line 83
    .line 84
    invoke-static/range {v4 .. v9}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 85
    .line 86
    .line 87
    iget v3, p0, Lcom/tencent/liteav/basic/c/h;->d:I

    .line 88
    .line 89
    invoke-static {v3}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 90
    .line 91
    .line 92
    sget-object v3, Lcom/tencent/liteav/beauty/b/z;->v:[S

    .line 93
    .line 94
    array-length v3, v3

    .line 95
    const/16 v4, 0x1403

    .line 96
    .line 97
    iget-object v5, p0, Lcom/tencent/liteav/beauty/b/z;->w:Ljava/nio/ShortBuffer;

    .line 98
    .line 99
    const/4 v6, 0x4

    .line 100
    invoke-static {v6, v3, v4, v5}, Landroid/opengl/GLES20;->glDrawElements(IIILjava/nio/Buffer;)V

    .line 101
    .line 102
    .line 103
    iget v3, p0, Lcom/tencent/liteav/basic/c/h;->b:I

    .line 104
    .line 105
    invoke-static {v3}, Landroid/opengl/GLES20;->glDisableVertexAttribArray(I)V

    .line 106
    .line 107
    .line 108
    iget v3, p0, Lcom/tencent/liteav/basic/c/h;->d:I

    .line 109
    .line 110
    invoke-static {v3}, Landroid/opengl/GLES20;->glDisableVertexAttribArray(I)V

    .line 111
    .line 112
    .line 113
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 114
    .line 115
    goto :goto_0

    .line 116
    :cond_1
    invoke-static {v0}, Landroid/opengl/GLES20;->glDisable(I)V

    .line 117
    .line 118
    .line 119
    :cond_2
    return-void
.end method
