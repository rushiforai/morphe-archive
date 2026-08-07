.class public Lcom/bef/effectsdk/game/RenderTextureUtils;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static flipY_uvArray:[F = null

.field public static final renderFS:Ljava/lang/String; = "precision highp float;\n\nuniform sampler2D uTexture;\nvarying vec2 textureCoord;\nvoid main() {\n    gl_FragColor = texture2D(uTexture, textureCoord);\n}\n"

.field public static final renderVS:Ljava/lang/String; = "attribute vec2 attUV;\nattribute vec2 attPosition;\nvarying vec2 textureCoord;\nuniform mat4 mvpMatrix;\n\nvoid main() {\n    gl_Position  = mvpMatrix * vec4(attPosition, 0.,1.);\n    textureCoord = attUV;\n}\n"

.field private static uvArray:[F

.field private static vertexArray:[F


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
    sput-object v1, Lcom/bef/effectsdk/game/RenderTextureUtils;->vertexArray:[F

    .line 9
    .line 10
    new-array v1, v0, [F

    .line 11
    .line 12
    fill-array-data v1, :array_1

    .line 13
    .line 14
    .line 15
    sput-object v1, Lcom/bef/effectsdk/game/RenderTextureUtils;->uvArray:[F

    .line 16
    .line 17
    new-array v0, v0, [F

    .line 18
    .line 19
    fill-array-data v0, :array_2

    .line 20
    .line 21
    .line 22
    sput-object v0, Lcom/bef/effectsdk/game/RenderTextureUtils;->flipY_uvArray:[F

    .line 23
    .line 24
    return-void

    .line 25
    :array_0
    .array-data 4
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        -0x40800000    # -1.0f
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        -0x40800000    # -1.0f
    .end array-data

    .line 26
    .line 27
    .line 28
    .line 29
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
    .line 40
    .line 41
    .line 42
    .line 43
    .line 44
    .line 45
    :array_1
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
    .line 60
    .line 61
    .line 62
    .line 63
    .line 64
    .line 65
    :array_2
    .array-data 4
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static generateBlankTexture(II)I
    .locals 12

    .line 1
    mul-int v0, p0, p1

    .line 2
    .line 3
    mul-int/lit8 v0, v0, 0x4

    .line 4
    .line 5
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 18
    .line 19
    .line 20
    move-result-object v9

    .line 21
    const/4 v0, 0x0

    .line 22
    invoke-virtual {v9, v0}, Ljava/nio/FloatBuffer;->put(F)Ljava/nio/FloatBuffer;

    .line 23
    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    invoke-virtual {v9, v0}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 27
    .line 28
    .line 29
    const/4 v1, 0x1

    .line 30
    new-array v10, v1, [I

    .line 31
    .line 32
    invoke-static {v1, v10, v0}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 33
    .line 34
    .line 35
    aget v1, v10, v0

    .line 36
    .line 37
    const/16 v11, 0xde1

    .line 38
    .line 39
    invoke-static {v11, v1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 40
    .line 41
    .line 42
    const/16 v1, 0x2800

    .line 43
    .line 44
    const v2, 0x46180400    # 9729.0f

    .line 45
    .line 46
    .line 47
    invoke-static {v11, v1, v2}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 48
    .line 49
    .line 50
    const/16 v1, 0x2801

    .line 51
    .line 52
    invoke-static {v11, v1, v2}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 53
    .line 54
    .line 55
    const/16 v1, 0x2802

    .line 56
    .line 57
    const v2, 0x47012f00    # 33071.0f

    .line 58
    .line 59
    .line 60
    invoke-static {v11, v1, v2}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 61
    .line 62
    .line 63
    const/16 v1, 0x2803

    .line 64
    .line 65
    invoke-static {v11, v1, v2}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 66
    .line 67
    .line 68
    const/16 v7, 0x1908

    .line 69
    .line 70
    const/16 v8, 0x1401

    .line 71
    .line 72
    const/16 v1, 0xde1

    .line 73
    .line 74
    const/4 v2, 0x0

    .line 75
    const/16 v3, 0x1908

    .line 76
    .line 77
    const/4 v6, 0x0

    .line 78
    move v4, p0

    .line 79
    move v5, p1

    .line 80
    invoke-static/range {v1 .. v9}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    .line 81
    .line 82
    .line 83
    invoke-static {v11, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 84
    .line 85
    .line 86
    aget p0, v10, v0

    .line 87
    .line 88
    return p0
.end method

.method public static getFlipY_uvBuffer()Ljava/nio/FloatBuffer;
    .locals 1

    .line 1
    sget-object v0, Lcom/bef/effectsdk/game/RenderTextureUtils;->flipY_uvArray:[F

    .line 2
    .line 3
    invoke-static {v0}, Lcom/bef/effectsdk/game/RenderTextureUtils;->getFloatBuffer([F)Ljava/nio/FloatBuffer;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    return-object v0
.end method

.method public static getFloatBuffer([F)Ljava/nio/FloatBuffer;
    .locals 2

    .line 1
    array-length v0, p0

    .line 2
    mul-int/lit8 v0, v0, 0x4

    .line 3
    .line 4
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0, p0}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    const/4 v0, 0x0

    .line 25
    invoke-virtual {p0, v0}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 26
    .line 27
    .line 28
    return-object p0
.end method

.method public static getUVBuffer()Ljava/nio/FloatBuffer;
    .locals 1

    .line 1
    sget-object v0, Lcom/bef/effectsdk/game/RenderTextureUtils;->uvArray:[F

    .line 2
    .line 3
    invoke-static {v0}, Lcom/bef/effectsdk/game/RenderTextureUtils;->getFloatBuffer([F)Ljava/nio/FloatBuffer;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    return-object v0
.end method

.method public static getUVBufferWithParams(FFFF)Ljava/nio/FloatBuffer;
    .locals 2

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    new-array v0, v0, [F

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    aput p0, v0, v1

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    aput p2, v0, v1

    .line 10
    .line 11
    const/4 v1, 0x2

    .line 12
    aput p1, v0, v1

    .line 13
    .line 14
    const/4 v1, 0x3

    .line 15
    aput p2, v0, v1

    .line 16
    .line 17
    const/4 p2, 0x4

    .line 18
    aput p0, v0, p2

    .line 19
    .line 20
    const/4 p0, 0x5

    .line 21
    aput p3, v0, p0

    .line 22
    .line 23
    const/4 p0, 0x6

    .line 24
    aput p1, v0, p0

    .line 25
    .line 26
    const/4 p0, 0x7

    .line 27
    aput p3, v0, p0

    .line 28
    .line 29
    invoke-static {v0}, Lcom/bef/effectsdk/game/RenderTextureUtils;->getFloatBuffer([F)Ljava/nio/FloatBuffer;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0
.end method

.method public static getVertexBuffer()Ljava/nio/FloatBuffer;
    .locals 1

    .line 1
    sget-object v0, Lcom/bef/effectsdk/game/RenderTextureUtils;->vertexArray:[F

    .line 2
    .line 3
    invoke-static {v0}, Lcom/bef/effectsdk/game/RenderTextureUtils;->getFloatBuffer([F)Ljava/nio/FloatBuffer;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    return-object v0
.end method

.method public static getVertexBufferWithParams(FFFF)Ljava/nio/FloatBuffer;
    .locals 2

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    new-array v0, v0, [F

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    aput p0, v0, v1

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    aput p2, v0, v1

    .line 10
    .line 11
    const/4 v1, 0x2

    .line 12
    aput p1, v0, v1

    .line 13
    .line 14
    const/4 v1, 0x3

    .line 15
    aput p2, v0, v1

    .line 16
    .line 17
    const/4 p2, 0x4

    .line 18
    aput p0, v0, p2

    .line 19
    .line 20
    const/4 p0, 0x5

    .line 21
    aput p3, v0, p0

    .line 22
    .line 23
    const/4 p0, 0x6

    .line 24
    aput p1, v0, p0

    .line 25
    .line 26
    const/4 p0, 0x7

    .line 27
    aput p3, v0, p0

    .line 28
    .line 29
    invoke-static {v0}, Lcom/bef/effectsdk/game/RenderTextureUtils;->getFloatBuffer([F)Ljava/nio/FloatBuffer;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0
.end method
