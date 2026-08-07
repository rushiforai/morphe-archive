.class public Ll/r1f;
.super Ll/kt2;
.source "SourceFile"

# interfaces
.implements Ll/gul;


# static fields
.field public static final J:[F

.field public static final K:[F


# instance fields
.field private D:I

.field private E:Ljava/nio/FloatBuffer;

.field private F:Ljava/nio/FloatBuffer;

.field private volatile G:Z

.field private final H:Ljava/lang/String;

.field private final I:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    new-array v1, v0, [F

    .line 4
    .line 5
    fill-array-data v1, :array_0

    .line 6
    .line 7
    .line 8
    sput-object v1, Ll/r1f;->J:[F

    .line 9
    .line 10
    new-array v0, v0, [F

    .line 11
    .line 12
    fill-array-data v0, :array_1

    .line 13
    .line 14
    .line 15
    sput-object v0, Ll/r1f;->K:[F

    .line 16
    .line 17
    return-void

    .line 18
    nop

    .line 19
    :array_0
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
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/kt2;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Ll/r1f;->D:I

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    iput-boolean v0, p0, Ll/r1f;->G:Z

    .line 9
    .line 10
    const-string v0, "precision mediump float;\nattribute vec4 position;\nattribute vec2 inputTextureCoordinate;\nvarying vec2 textureCoordinate;\nvoid main() {\n   gl_Position = position;\n  textureCoordinate = inputTextureCoordinate;\n}"

    .line 11
    .line 12
    iput-object v0, p0, Ll/r1f;->H:Ljava/lang/String;

    .line 13
    .line 14
    const-string v0, "#extension GL_OES_EGL_image_external : require\nprecision highp float;\nvarying vec2 textureCoordinate;\nuniform samplerExternalOES inputImageTexture0;\nvoid main() {\n        gl_FragColor = texture2D(inputImageTexture0,textureCoordinate);\n}"

    .line 15
    .line 16
    iput-object v0, p0, Ll/r1f;->I:Ljava/lang/String;

    .line 17
    .line 18
    invoke-direct {p0}, Ll/r1f;->O()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method private O()V
    .locals 3

    .line 1
    sget-object v0, Ll/r1f;->J:[F

    .line 2
    .line 3
    array-length v1, v0

    .line 4
    mul-int/lit8 v1, v1, 0x4

    .line 5
    .line 6
    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iput-object v1, p0, Ll/r1f;->E:Ljava/nio/FloatBuffer;

    .line 22
    .line 23
    invoke-virtual {v1, v0}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/r1f;->E:Ljava/nio/FloatBuffer;

    .line 27
    .line 28
    const/4 v1, 0x0

    .line 29
    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 30
    .line 31
    .line 32
    const/16 v0, 0x20

    .line 33
    .line 34
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    iput-object v0, p0, Ll/r1f;->F:Ljava/nio/FloatBuffer;

    .line 50
    .line 51
    sget-object v2, Ll/r1f;->K:[F

    .line 52
    .line 53
    invoke-virtual {v0, v2}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 54
    .line 55
    .line 56
    iget-object p0, p0, Ll/r1f;->F:Ljava/nio/FloatBuffer;

    .line 57
    .line 58
    invoke-virtual {p0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 59
    .line 60
    .line 61
    return-void
.end method


# virtual methods
.method public F()V
    .locals 9

    .line 1
    invoke-virtual {p0}, Ll/xej;->r()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Ll/xej;->n()I

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
    iget v0, p0, Ll/xej;->d:I

    .line 14
    .line 15
    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Ll/xej;->l()F

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    invoke-virtual {p0}, Ll/xej;->k()F

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    invoke-virtual {p0}, Ll/xej;->j()F

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    invoke-virtual {p0}, Ll/xej;->i()F

    .line 31
    .line 32
    .line 33
    move-result v4

    .line 34
    invoke-static {v0, v1, v3, v4}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    .line 35
    .line 36
    .line 37
    const/16 v0, 0x4100

    .line 38
    .line 39
    invoke-static {v0}, Landroid/opengl/GLES20;->glClear(I)V

    .line 40
    .line 41
    .line 42
    iget v0, p0, Ll/xej;->f:I

    .line 43
    .line 44
    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 45
    .line 46
    .line 47
    iget v3, p0, Ll/xej;->f:I

    .line 48
    .line 49
    const/16 v7, 0x8

    .line 50
    .line 51
    iget-object v8, p0, Ll/r1f;->E:Ljava/nio/FloatBuffer;

    .line 52
    .line 53
    const/4 v4, 0x2

    .line 54
    const/16 v5, 0x1406

    .line 55
    .line 56
    const/4 v6, 0x0

    .line 57
    invoke-static/range {v3 .. v8}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 58
    .line 59
    .line 60
    iget v0, p0, Ll/xej;->g:I

    .line 61
    .line 62
    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 63
    .line 64
    .line 65
    iget v3, p0, Ll/xej;->g:I

    .line 66
    .line 67
    iget-object v8, p0, Ll/r1f;->F:Ljava/nio/FloatBuffer;

    .line 68
    .line 69
    invoke-static/range {v3 .. v8}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 70
    .line 71
    .line 72
    const v0, 0x84c0

    .line 73
    .line 74
    .line 75
    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 76
    .line 77
    .line 78
    const v0, 0x8d65

    .line 79
    .line 80
    .line 81
    iget v1, p0, Ll/r1f;->D:I

    .line 82
    .line 83
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 84
    .line 85
    .line 86
    const/4 v0, 0x5

    .line 87
    const/4 v1, 0x4

    .line 88
    invoke-static {v0, v2, v1}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 89
    .line 90
    .line 91
    const/4 v0, 0x1

    .line 92
    iput-boolean v0, p0, Ll/r1f;->G:Z

    .line 93
    .line 94
    return-void
.end method

.method public P(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/r1f;->D:I

    .line 2
    .line 3
    return-void
.end method

.method public b()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/r1f;->G:Z

    .line 2
    .line 3
    return p0
.end method

.method public m()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "#extension GL_OES_EGL_image_external : require\nprecision highp float;\nvarying vec2 textureCoordinate;\nuniform samplerExternalOES inputImageTexture0;\nvoid main() {\n        gl_FragColor = texture2D(inputImageTexture0,textureCoordinate);\n}"

    .line 2
    .line 3
    return-object p0
.end method

.method public o()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision mediump float;\nattribute vec4 position;\nattribute vec2 inputTextureCoordinate;\nvarying vec2 textureCoordinate;\nvoid main() {\n   gl_Position = position;\n  textureCoordinate = inputTextureCoordinate;\n}"

    .line 2
    .line 3
    return-object p0
.end method

.method public v()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/hfj;->L()V

    .line 2
    .line 3
    .line 4
    invoke-super {p0}, Ll/xej;->v()V

    .line 5
    .line 6
    .line 7
    return-void
.end method
