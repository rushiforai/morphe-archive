.class public Lcom/bytedance/realx/video/YuvConverter;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bytedance/realx/video/YuvConverter$ShaderCallbacks;
    }
.end annotation


# static fields
.field public static final FORMAT_TEXTURE_2D:I = 0xa

.field public static final FORMAT_TEXTURE_OES:I = 0xb

.field private static final FRAGMENT_SHADER:Ljava/lang/String; = "uniform vec2 xUnit;\nuniform vec4 coeffs;\n\nvoid main() {\n  gl_FragColor.r = coeffs.a + dot(coeffs.rgb,\n      sample(tc - 1.5 * xUnit).rgb);\n  gl_FragColor.g = coeffs.a + dot(coeffs.rgb,\n      sample(tc - 0.5 * xUnit).rgb);\n  gl_FragColor.b = coeffs.a + dot(coeffs.rgb,\n      sample(tc + 0.5 * xUnit).rgb);\n  gl_FragColor.a = coeffs.a + dot(coeffs.rgb,\n      sample(tc + 1.5 * xUnit).rgb);\n}\n"

.field private static final TEXTURE_MAX_COUNT:I = 0x2d

.field private static TEX_MATRIX:[F


# instance fields
.field private final drawer:Lcom/bytedance/realx/video/GlGenericDrawer;

.field private final i420TextureFrameBuffer:Lcom/bytedance/realx/video/GlTextureFrameBuffer;

.field private mFrameBufferId:I

.field private mTextureCnt:I

.field private mTextureDrawer:Lcom/bytedance/realx/video/GlRectDrawer;

.field private mTextureFreeQueue:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mTextureHeightMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mTextureUsedQueue:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mTextureWidthMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private final shaderCallbacks:Lcom/bytedance/realx/video/YuvConverter$ShaderCallbacks;

.field private final threadChecker:Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;


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
    sput-object v0, Lcom/bytedance/realx/video/YuvConverter;->TEX_MATRIX:[F

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/LinkedList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/bytedance/realx/video/YuvConverter;->mTextureFreeQueue:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ljava/util/LinkedList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/bytedance/realx/video/YuvConverter;->mTextureUsedQueue:Ljava/util/List;

    .line 17
    .line 18
    new-instance v0, Ljava/util/HashMap;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lcom/bytedance/realx/video/YuvConverter;->mTextureWidthMap:Ljava/util/HashMap;

    .line 24
    .line 25
    new-instance v0, Ljava/util/HashMap;

    .line 26
    .line 27
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Lcom/bytedance/realx/video/YuvConverter;->mTextureHeightMap:Ljava/util/HashMap;

    .line 31
    .line 32
    const/4 v0, 0x0

    .line 33
    iput v0, p0, Lcom/bytedance/realx/video/YuvConverter;->mTextureCnt:I

    .line 34
    .line 35
    iput v0, p0, Lcom/bytedance/realx/video/YuvConverter;->mFrameBufferId:I

    .line 36
    .line 37
    new-instance v0, Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;

    .line 38
    .line 39
    invoke-direct {v0}, Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;-><init>()V

    .line 40
    .line 41
    .line 42
    iput-object v0, p0, Lcom/bytedance/realx/video/YuvConverter;->threadChecker:Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;

    .line 43
    .line 44
    new-instance v1, Lcom/bytedance/realx/video/GlTextureFrameBuffer;

    .line 45
    .line 46
    const/16 v2, 0x1908

    .line 47
    .line 48
    invoke-direct {v1, v2}, Lcom/bytedance/realx/video/GlTextureFrameBuffer;-><init>(I)V

    .line 49
    .line 50
    .line 51
    iput-object v1, p0, Lcom/bytedance/realx/video/YuvConverter;->i420TextureFrameBuffer:Lcom/bytedance/realx/video/GlTextureFrameBuffer;

    .line 52
    .line 53
    new-instance v1, Lcom/bytedance/realx/video/YuvConverter$ShaderCallbacks;

    .line 54
    .line 55
    const/4 v2, 0x0

    .line 56
    invoke-direct {v1, v2}, Lcom/bytedance/realx/video/YuvConverter$ShaderCallbacks;-><init>(Lcom/bytedance/realx/video/YuvConverter$1;)V

    .line 57
    .line 58
    .line 59
    iput-object v1, p0, Lcom/bytedance/realx/video/YuvConverter;->shaderCallbacks:Lcom/bytedance/realx/video/YuvConverter$ShaderCallbacks;

    .line 60
    .line 61
    new-instance v2, Lcom/bytedance/realx/video/GlGenericDrawer;

    .line 62
    .line 63
    const-string v3, "uniform vec2 xUnit;\nuniform vec4 coeffs;\n\nvoid main() {\n  gl_FragColor.r = coeffs.a + dot(coeffs.rgb,\n      sample(tc - 1.5 * xUnit).rgb);\n  gl_FragColor.g = coeffs.a + dot(coeffs.rgb,\n      sample(tc - 0.5 * xUnit).rgb);\n  gl_FragColor.b = coeffs.a + dot(coeffs.rgb,\n      sample(tc + 0.5 * xUnit).rgb);\n  gl_FragColor.a = coeffs.a + dot(coeffs.rgb,\n      sample(tc + 1.5 * xUnit).rgb);\n}\n"

    .line 64
    .line 65
    invoke-direct {v2, v3, v1}, Lcom/bytedance/realx/video/GlGenericDrawer;-><init>(Ljava/lang/String;Lcom/bytedance/realx/video/GlGenericDrawer$ShaderCallbacks;)V

    .line 66
    .line 67
    .line 68
    iput-object v2, p0, Lcom/bytedance/realx/video/YuvConverter;->drawer:Lcom/bytedance/realx/video/GlGenericDrawer;

    .line 69
    .line 70
    invoke-virtual {v0}, Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;->detachThread()V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public static synthetic a(Ljava/nio/ByteBuffer;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/bytedance/realx/base/JniCommon;->nativeFreeByteBuffer(Ljava/nio/ByteBuffer;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private generateTexture(III)I
    .locals 12

    .line 1
    iget v0, p0, Lcom/bytedance/realx/video/YuvConverter;->mTextureCnt:I

    .line 2
    .line 3
    const/16 v1, 0x2d

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    return v2

    .line 9
    :cond_0
    invoke-static {p1}, Lcom/bytedance/realx/video/GlUtil;->generateTexture(I)I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    const v0, 0x84c0

    .line 14
    .line 15
    .line 16
    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 17
    .line 18
    .line 19
    const/16 v0, 0xde1

    .line 20
    .line 21
    invoke-static {v0, p1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 22
    .line 23
    .line 24
    const/16 v10, 0x1401

    .line 25
    .line 26
    const/4 v11, 0x0

    .line 27
    const/16 v3, 0xde1

    .line 28
    .line 29
    const/4 v4, 0x0

    .line 30
    const/16 v5, 0x1908

    .line 31
    .line 32
    const/4 v8, 0x0

    .line 33
    const/16 v9, 0x1908

    .line 34
    .line 35
    move v6, p2

    .line 36
    move v7, p3

    .line 37
    invoke-static/range {v3 .. v11}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    .line 38
    .line 39
    .line 40
    invoke-static {v0, v2}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 41
    .line 42
    .line 43
    invoke-static {}, Landroid/opengl/GLES20;->glGetError()I

    .line 44
    .line 45
    .line 46
    move-result p2

    .line 47
    if-eqz p2, :cond_1

    .line 48
    .line 49
    return v2

    .line 50
    :cond_1
    iget p2, p0, Lcom/bytedance/realx/video/YuvConverter;->mTextureCnt:I

    .line 51
    .line 52
    add-int/lit8 p2, p2, 0x1

    .line 53
    .line 54
    iput p2, p0, Lcom/bytedance/realx/video/YuvConverter;->mTextureCnt:I

    .line 55
    .line 56
    return p1
.end method


# virtual methods
.method public convert(Lcom/bytedance/realx/video/VideoFrame$TextureBuffer;)Lcom/bytedance/realx/video/VideoFrame$I420Buffer;
    .locals 2

    .line 326
    sget-object v0, Lcom/bytedance/realx/video/FilterType;->Origin:Lcom/bytedance/realx/video/FilterType;

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v0, v1, v1}, Lcom/bytedance/realx/video/YuvConverter;->convert(Lcom/bytedance/realx/video/VideoFrame$TextureBuffer;Lcom/bytedance/realx/video/FilterType;II)Lcom/bytedance/realx/video/VideoFrame$I420Buffer;

    move-result-object p0

    return-object p0
.end method

.method public convert(Lcom/bytedance/realx/video/VideoFrame$TextureBuffer;Lcom/bytedance/realx/video/FilterType;II)Lcom/bytedance/realx/video/VideoFrame$I420Buffer;
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lcom/bytedance/realx/video/YuvConverter;->threadChecker:Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;->checkIsOnValidThread()V

    .line 6
    .line 7
    .line 8
    const-string v1, "YUVConverter"

    .line 9
    .line 10
    invoke-static {v1}, Lcom/bytedance/realx/video/GlUtil;->clearGLES2Error(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-interface/range {p1 .. p1}, Lcom/bytedance/realx/video/VideoFrame$Buffer;->getWidth()I

    .line 14
    .line 15
    .line 16
    move-result v5

    .line 17
    invoke-interface/range {p1 .. p1}, Lcom/bytedance/realx/video/VideoFrame$Buffer;->getHeight()I

    .line 18
    .line 19
    .line 20
    move-result v6

    .line 21
    add-int/lit8 v2, v5, 0x3f

    .line 22
    .line 23
    div-int/lit8 v2, v2, 0x40

    .line 24
    .line 25
    mul-int/lit8 v14, v2, 0x40

    .line 26
    .line 27
    add-int/lit8 v2, v5, 0x7

    .line 28
    .line 29
    div-int/lit8 v2, v2, 0x8

    .line 30
    .line 31
    mul-int/lit8 v2, v2, 0x8

    .line 32
    .line 33
    add-int/lit8 v3, v6, 0x1

    .line 34
    .line 35
    div-int/lit8 v15, v3, 0x2

    .line 36
    .line 37
    add-int v3, v6, v15

    .line 38
    .line 39
    mul-int v4, v14, v3

    .line 40
    .line 41
    add-int/2addr v4, v14

    .line 42
    invoke-static {v4}, Lcom/bytedance/realx/base/JniCommon;->nativeAllocateByteBuffer(I)Ljava/nio/ByteBuffer;

    .line 43
    .line 44
    .line 45
    move-result-object v16

    .line 46
    const/16 v17, 0x0

    .line 47
    .line 48
    if-nez v16, :cond_0

    .line 49
    .line 50
    return-object v17

    .line 51
    :cond_0
    div-int/lit8 v4, v14, 0x4

    .line 52
    .line 53
    div-int/lit8 v9, v2, 0x4

    .line 54
    .line 55
    new-instance v7, Landroid/graphics/Matrix;

    .line 56
    .line 57
    invoke-direct {v7}, Landroid/graphics/Matrix;-><init>()V

    .line 58
    .line 59
    .line 60
    const/high16 v8, 0x3f000000    # 0.5f

    .line 61
    .line 62
    invoke-virtual {v7, v8, v8}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 63
    .line 64
    .line 65
    const/high16 v8, -0x40800000    # -1.0f

    .line 66
    .line 67
    const/high16 v10, 0x3f800000    # 1.0f

    .line 68
    .line 69
    invoke-virtual {v7, v10, v8}, Landroid/graphics/Matrix;->preScale(FF)Z

    .line 70
    .line 71
    .line 72
    const/high16 v8, -0x41000000    # -0.5f

    .line 73
    .line 74
    invoke-virtual {v7, v8, v8}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 75
    .line 76
    .line 77
    if-eq v2, v5, :cond_1

    .line 78
    .line 79
    int-to-float v2, v2

    .line 80
    mul-float/2addr v2, v10

    .line 81
    int-to-float v8, v5

    .line 82
    div-float/2addr v2, v8

    .line 83
    invoke-virtual {v7, v2, v10}, Landroid/graphics/Matrix;->preScale(FF)Z

    .line 84
    .line 85
    .line 86
    :cond_1
    iget-object v2, v0, Lcom/bytedance/realx/video/YuvConverter;->i420TextureFrameBuffer:Lcom/bytedance/realx/video/GlTextureFrameBuffer;

    .line 87
    .line 88
    invoke-virtual {v2, v4, v3}, Lcom/bytedance/realx/video/GlTextureFrameBuffer;->setSize(II)V

    .line 89
    .line 90
    .line 91
    iget-object v2, v0, Lcom/bytedance/realx/video/YuvConverter;->i420TextureFrameBuffer:Lcom/bytedance/realx/video/GlTextureFrameBuffer;

    .line 92
    .line 93
    invoke-virtual {v2}, Lcom/bytedance/realx/video/GlTextureFrameBuffer;->getFrameBufferId()I

    .line 94
    .line 95
    .line 96
    move-result v2

    .line 97
    const v3, 0x8d40

    .line 98
    .line 99
    .line 100
    invoke-static {v3, v2}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 101
    .line 102
    .line 103
    const-string v2, "glBindFramebuffer"

    .line 104
    .line 105
    invoke-static {v2}, Lcom/bytedance/realx/video/GlUtil;->checkNoGLES2Error(Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    iget-object v2, v0, Lcom/bytedance/realx/video/YuvConverter;->shaderCallbacks:Lcom/bytedance/realx/video/YuvConverter$ShaderCallbacks;

    .line 109
    .line 110
    invoke-virtual {v2}, Lcom/bytedance/realx/video/YuvConverter$ShaderCallbacks;->setPlaneY()V

    .line 111
    .line 112
    .line 113
    iget-object v2, v0, Lcom/bytedance/realx/video/YuvConverter;->drawer:Lcom/bytedance/realx/video/GlGenericDrawer;

    .line 114
    .line 115
    move v8, v4

    .line 116
    move-object v4, v7

    .line 117
    const/4 v7, 0x0

    .line 118
    move v10, v8

    .line 119
    const/4 v8, 0x0

    .line 120
    move v11, v10

    .line 121
    move v10, v6

    .line 122
    move/from16 v12, p3

    .line 123
    .line 124
    move/from16 v13, p4

    .line 125
    .line 126
    move/from16 v18, v11

    .line 127
    .line 128
    move/from16 v19, v14

    .line 129
    .line 130
    move-object/from16 v11, p2

    .line 131
    .line 132
    move v14, v3

    .line 133
    move-object/from16 v3, p1

    .line 134
    .line 135
    invoke-static/range {v2 .. v13}, Lcom/bytedance/realx/video/RTCVideoFrameDrawer;->drawTexture(Lcom/bytedance/realx/video/RendererCommon$GlDrawer;Lcom/bytedance/realx/video/VideoFrame$TextureBuffer;Landroid/graphics/Matrix;IIIIIILcom/bytedance/realx/video/FilterType;II)V

    .line 136
    .line 137
    .line 138
    iget-object v2, v0, Lcom/bytedance/realx/video/YuvConverter;->shaderCallbacks:Lcom/bytedance/realx/video/YuvConverter$ShaderCallbacks;

    .line 139
    .line 140
    invoke-virtual {v2}, Lcom/bytedance/realx/video/YuvConverter$ShaderCallbacks;->setPlaneU()V

    .line 141
    .line 142
    .line 143
    iget-object v2, v0, Lcom/bytedance/realx/video/YuvConverter;->drawer:Lcom/bytedance/realx/video/GlGenericDrawer;

    .line 144
    .line 145
    div-int/lit8 v9, v9, 0x2

    .line 146
    .line 147
    move v8, v6

    .line 148
    move v10, v15

    .line 149
    invoke-static/range {v2 .. v13}, Lcom/bytedance/realx/video/RTCVideoFrameDrawer;->drawTexture(Lcom/bytedance/realx/video/RendererCommon$GlDrawer;Lcom/bytedance/realx/video/VideoFrame$TextureBuffer;Landroid/graphics/Matrix;IIIIIILcom/bytedance/realx/video/FilterType;II)V

    .line 150
    .line 151
    .line 152
    iget-object v2, v0, Lcom/bytedance/realx/video/YuvConverter;->shaderCallbacks:Lcom/bytedance/realx/video/YuvConverter$ShaderCallbacks;

    .line 153
    .line 154
    invoke-virtual {v2}, Lcom/bytedance/realx/video/YuvConverter$ShaderCallbacks;->setPlaneV()V

    .line 155
    .line 156
    .line 157
    iget-object v2, v0, Lcom/bytedance/realx/video/YuvConverter;->drawer:Lcom/bytedance/realx/video/GlGenericDrawer;

    .line 158
    .line 159
    div-int/lit8 v7, v18, 0x2

    .line 160
    .line 161
    invoke-static/range {v2 .. v13}, Lcom/bytedance/realx/video/RTCVideoFrameDrawer;->drawTexture(Lcom/bytedance/realx/video/RendererCommon$GlDrawer;Lcom/bytedance/realx/video/VideoFrame$TextureBuffer;Landroid/graphics/Matrix;IIIIIILcom/bytedance/realx/video/FilterType;II)V

    .line 162
    .line 163
    .line 164
    move v3, v10

    .line 165
    iget-object v2, v0, Lcom/bytedance/realx/video/YuvConverter;->i420TextureFrameBuffer:Lcom/bytedance/realx/video/GlTextureFrameBuffer;

    .line 166
    .line 167
    invoke-virtual {v2}, Lcom/bytedance/realx/video/GlTextureFrameBuffer;->getWidth()I

    .line 168
    .line 169
    .line 170
    move-result v9

    .line 171
    iget-object v0, v0, Lcom/bytedance/realx/video/YuvConverter;->i420TextureFrameBuffer:Lcom/bytedance/realx/video/GlTextureFrameBuffer;

    .line 172
    .line 173
    invoke-virtual {v0}, Lcom/bytedance/realx/video/GlTextureFrameBuffer;->getHeight()I

    .line 174
    .line 175
    .line 176
    move-result v10

    .line 177
    const/16 v11, 0x1908

    .line 178
    .line 179
    const/16 v12, 0x1401

    .line 180
    .line 181
    const/4 v7, 0x0

    .line 182
    const/4 v8, 0x0

    .line 183
    move-object/from16 v13, v16

    .line 184
    .line 185
    invoke-static/range {v7 .. v13}, Landroid/opengl/GLES20;->glReadPixels(IIIIIILjava/nio/Buffer;)V

    .line 186
    .line 187
    .line 188
    invoke-static {}, Landroid/opengl/GLES20;->glGetError()I

    .line 189
    .line 190
    .line 191
    move-result v0

    .line 192
    if-eqz v0, :cond_4

    .line 193
    .line 194
    new-instance v2, Ljava/lang/StringBuilder;

    .line 195
    .line 196
    const-string v3, "error: "

    .line 197
    .line 198
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 199
    .line 200
    .line 201
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 202
    .line 203
    .line 204
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 205
    .line 206
    .line 207
    move-result-object v2

    .line 208
    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 209
    .line 210
    .line 211
    new-instance v2, Ljava/lang/StringBuilder;

    .line 212
    .line 213
    const-string v3, "convert i420 failed as opengl error "

    .line 214
    .line 215
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 216
    .line 217
    .line 218
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 219
    .line 220
    .line 221
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 222
    .line 223
    .line 224
    move-result-object v2

    .line 225
    invoke-static {v1, v2}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 226
    .line 227
    .line 228
    const/16 v1, 0x505

    .line 229
    .line 230
    if-eq v1, v0, :cond_3

    .line 231
    .line 232
    const/16 v1, 0x502

    .line 233
    .line 234
    if-ne v1, v0, :cond_2

    .line 235
    .line 236
    goto :goto_0

    .line 237
    :cond_2
    new-instance v1, Ljava/lang/RuntimeException;

    .line 238
    .line 239
    new-instance v2, Ljava/lang/StringBuilder;

    .line 240
    .line 241
    const-string v3, "YuvConverter.convert: GLES20 error: "

    .line 242
    .line 243
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 244
    .line 245
    .line 246
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 247
    .line 248
    .line 249
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 250
    .line 251
    .line 252
    move-result-object v0

    .line 253
    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 254
    .line 255
    .line 256
    throw v1

    .line 257
    :cond_3
    :goto_0
    invoke-static {v13}, Lcom/bytedance/realx/base/JniCommon;->nativeFreeByteBuffer(Ljava/nio/ByteBuffer;)V

    .line 258
    .line 259
    .line 260
    return-object v17

    .line 261
    :cond_4
    const/4 v0, 0x0

    .line 262
    invoke-static {v14, v0}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 263
    .line 264
    .line 265
    mul-int v14, v19, v6

    .line 266
    .line 267
    div-int/lit8 v1, v19, 0x2

    .line 268
    .line 269
    add-int v2, v14, v1

    .line 270
    .line 271
    invoke-virtual {v13, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 272
    .line 273
    .line 274
    invoke-virtual {v13, v14}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 275
    .line 276
    .line 277
    invoke-virtual {v13}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    .line 278
    .line 279
    .line 280
    move-result-object v4

    .line 281
    invoke-virtual {v13, v14}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 282
    .line 283
    .line 284
    add-int/lit8 v15, v3, -0x1

    .line 285
    .line 286
    mul-int v0, v19, v15

    .line 287
    .line 288
    add-int/2addr v0, v1

    .line 289
    add-int/2addr v14, v0

    .line 290
    invoke-virtual {v13, v14}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 291
    .line 292
    .line 293
    move v3, v6

    .line 294
    invoke-virtual {v13}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    .line 295
    .line 296
    .line 297
    move-result-object v6

    .line 298
    invoke-virtual {v13, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 299
    .line 300
    .line 301
    add-int/2addr v2, v0

    .line 302
    invoke-virtual {v13, v2}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 303
    .line 304
    .line 305
    invoke-virtual {v13}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    .line 306
    .line 307
    .line 308
    move-result-object v8

    .line 309
    new-instance v10, Ll/cpq0;

    .line 310
    .line 311
    invoke-direct {v10, v13}, Ll/cpq0;-><init>(Ljava/nio/ByteBuffer;)V

    .line 312
    .line 313
    .line 314
    move/from16 v7, v19

    .line 315
    .line 316
    move/from16 v9, v19

    .line 317
    .line 318
    move v2, v5

    .line 319
    move/from16 v5, v19

    .line 320
    .line 321
    invoke-static/range {v2 .. v10}, Lcom/bytedance/realx/video/JavaI420Buffer;->wrap(IILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/lang/Runnable;)Lcom/bytedance/realx/video/JavaI420Buffer;

    .line 322
    .line 323
    .line 324
    move-result-object v0

    .line 325
    return-object v0
.end method

.method public dequeueTexture(II)I
    .locals 6

    .line 1
    const/4 v0, 0x1

    .line 2
    new-array v0, v0, [I

    .line 3
    .line 4
    iget-object v1, p0, Lcom/bytedance/realx/video/YuvConverter;->mTextureFreeQueue:Ljava/util/List;

    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    if-eqz v1, :cond_4

    .line 8
    .line 9
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/16 v3, 0xde1

    .line 14
    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    invoke-direct {p0, v3, p1, p2}, Lcom/bytedance/realx/video/YuvConverter;->generateTexture(III)I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    aput v1, v0, v2

    .line 22
    .line 23
    if-lez v1, :cond_4

    .line 24
    .line 25
    iget-object v3, p0, Lcom/bytedance/realx/video/YuvConverter;->mTextureUsedQueue:Ljava/util/List;

    .line 26
    .line 27
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    iget-object v1, p0, Lcom/bytedance/realx/video/YuvConverter;->mTextureWidthMap:Ljava/util/HashMap;

    .line 35
    .line 36
    aget v3, v0, v2

    .line 37
    .line 38
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-virtual {v1, v3, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    iget-object p0, p0, Lcom/bytedance/realx/video/YuvConverter;->mTextureHeightMap:Ljava/util/HashMap;

    .line 50
    .line 51
    aget p1, v0, v2

    .line 52
    .line 53
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 58
    .line 59
    .line 60
    move-result-object p2

    .line 61
    invoke-virtual {p0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    goto/16 :goto_2

    .line 65
    .line 66
    :cond_0
    move v1, v2

    .line 67
    :goto_0
    iget-object v4, p0, Lcom/bytedance/realx/video/YuvConverter;->mTextureFreeQueue:Ljava/util/List;

    .line 68
    .line 69
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 70
    .line 71
    .line 72
    move-result v4

    .line 73
    if-ge v1, v4, :cond_2

    .line 74
    .line 75
    iget-object v4, p0, Lcom/bytedance/realx/video/YuvConverter;->mTextureFreeQueue:Ljava/util/List;

    .line 76
    .line 77
    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object v4

    .line 81
    check-cast v4, Ljava/lang/Integer;

    .line 82
    .line 83
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 84
    .line 85
    .line 86
    iget-object v5, p0, Lcom/bytedance/realx/video/YuvConverter;->mTextureWidthMap:Ljava/util/HashMap;

    .line 87
    .line 88
    invoke-virtual {v5, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object v5

    .line 92
    check-cast v5, Ljava/lang/Integer;

    .line 93
    .line 94
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    .line 95
    .line 96
    .line 97
    move-result v5

    .line 98
    if-ne v5, p1, :cond_1

    .line 99
    .line 100
    iget-object v5, p0, Lcom/bytedance/realx/video/YuvConverter;->mTextureHeightMap:Ljava/util/HashMap;

    .line 101
    .line 102
    invoke-virtual {v5, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object v4

    .line 106
    check-cast v4, Ljava/lang/Integer;

    .line 107
    .line 108
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 109
    .line 110
    .line 111
    move-result v4

    .line 112
    if-ne v4, p2, :cond_1

    .line 113
    .line 114
    goto :goto_1

    .line 115
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 116
    .line 117
    goto :goto_0

    .line 118
    :cond_2
    const/4 v1, -0x1

    .line 119
    :goto_1
    if-ltz v1, :cond_3

    .line 120
    .line 121
    iget-object p1, p0, Lcom/bytedance/realx/video/YuvConverter;->mTextureFreeQueue:Ljava/util/List;

    .line 122
    .line 123
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    move-result-object p1

    .line 127
    check-cast p1, Ljava/lang/Integer;

    .line 128
    .line 129
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 130
    .line 131
    .line 132
    move-result p1

    .line 133
    aput p1, v0, v2

    .line 134
    .line 135
    iget-object p1, p0, Lcom/bytedance/realx/video/YuvConverter;->mTextureFreeQueue:Ljava/util/List;

    .line 136
    .line 137
    invoke-interface {p1, v2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 138
    .line 139
    .line 140
    iget-object p0, p0, Lcom/bytedance/realx/video/YuvConverter;->mTextureUsedQueue:Ljava/util/List;

    .line 141
    .line 142
    aget p1, v0, v2

    .line 143
    .line 144
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 145
    .line 146
    .line 147
    move-result-object p1

    .line 148
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 149
    .line 150
    .line 151
    goto :goto_2

    .line 152
    :cond_3
    invoke-direct {p0, v3, p1, p2}, Lcom/bytedance/realx/video/YuvConverter;->generateTexture(III)I

    .line 153
    .line 154
    .line 155
    move-result v1

    .line 156
    aput v1, v0, v2

    .line 157
    .line 158
    if-lez v1, :cond_4

    .line 159
    .line 160
    iget-object v3, p0, Lcom/bytedance/realx/video/YuvConverter;->mTextureUsedQueue:Ljava/util/List;

    .line 161
    .line 162
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 163
    .line 164
    .line 165
    move-result-object v1

    .line 166
    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 167
    .line 168
    .line 169
    iget-object v1, p0, Lcom/bytedance/realx/video/YuvConverter;->mTextureWidthMap:Ljava/util/HashMap;

    .line 170
    .line 171
    aget v3, v0, v2

    .line 172
    .line 173
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 174
    .line 175
    .line 176
    move-result-object v3

    .line 177
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 178
    .line 179
    .line 180
    move-result-object p1

    .line 181
    invoke-virtual {v1, v3, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 182
    .line 183
    .line 184
    iget-object p0, p0, Lcom/bytedance/realx/video/YuvConverter;->mTextureHeightMap:Ljava/util/HashMap;

    .line 185
    .line 186
    aget p1, v0, v2

    .line 187
    .line 188
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 189
    .line 190
    .line 191
    move-result-object p1

    .line 192
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 193
    .line 194
    .line 195
    move-result-object p2

    .line 196
    invoke-virtual {p0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 197
    .line 198
    .line 199
    :cond_4
    :goto_2
    aget p0, v0, v2

    .line 200
    .line 201
    return p0
.end method

.method public drawTexture(IIIII)V
    .locals 24

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p1

    .line 4
    .line 5
    iget-object v2, v0, Lcom/bytedance/realx/video/YuvConverter;->mTextureDrawer:Lcom/bytedance/realx/video/GlRectDrawer;

    .line 6
    .line 7
    if-nez v2, :cond_0

    .line 8
    .line 9
    new-instance v2, Lcom/bytedance/realx/video/GlRectDrawer;

    .line 10
    .line 11
    invoke-direct {v2}, Lcom/bytedance/realx/video/GlRectDrawer;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object v2, v0, Lcom/bytedance/realx/video/YuvConverter;->mTextureDrawer:Lcom/bytedance/realx/video/GlRectDrawer;

    .line 15
    .line 16
    :cond_0
    const-string v2, "TextureHelper construct"

    .line 17
    .line 18
    invoke-static {v2}, Lcom/bytedance/realx/video/GlUtil;->checkNoGLES2Error(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    sget-object v2, Lcom/bytedance/realx/video/YuvConverter;->TEX_MATRIX:[F

    .line 22
    .line 23
    const/4 v3, 0x0

    .line 24
    invoke-static {v2, v3}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    .line 25
    .line 26
    .line 27
    iget v2, v0, Lcom/bytedance/realx/video/YuvConverter;->mFrameBufferId:I

    .line 28
    .line 29
    if-nez v2, :cond_1

    .line 30
    .line 31
    const/4 v2, 0x1

    .line 32
    new-array v4, v2, [I

    .line 33
    .line 34
    invoke-static {v2, v4, v3}, Landroid/opengl/GLES20;->glGenFramebuffers(I[II)V

    .line 35
    .line 36
    .line 37
    aget v2, v4, v3

    .line 38
    .line 39
    iput v2, v0, Lcom/bytedance/realx/video/YuvConverter;->mFrameBufferId:I

    .line 40
    .line 41
    :cond_1
    iget v2, v0, Lcom/bytedance/realx/video/YuvConverter;->mFrameBufferId:I

    .line 42
    .line 43
    const v4, 0x8d40

    .line 44
    .line 45
    .line 46
    invoke-static {v4, v2}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 47
    .line 48
    .line 49
    const v2, 0x8ce0

    .line 50
    .line 51
    .line 52
    const/16 v5, 0xde1

    .line 53
    .line 54
    move/from16 v6, p3

    .line 55
    .line 56
    invoke-static {v4, v2, v5, v6, v3}, Landroid/opengl/GLES20;->glFramebufferTexture2D(IIIII)V

    .line 57
    .line 58
    .line 59
    const/16 v2, 0xa

    .line 60
    .line 61
    if-eq v1, v2, :cond_3

    .line 62
    .line 63
    const/16 v2, 0xb

    .line 64
    .line 65
    if-eq v1, v2, :cond_2

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_2
    iget-object v6, v0, Lcom/bytedance/realx/video/YuvConverter;->mTextureDrawer:Lcom/bytedance/realx/video/GlRectDrawer;

    .line 69
    .line 70
    sget-object v8, Lcom/bytedance/realx/video/YuvConverter;->TEX_MATRIX:[F

    .line 71
    .line 72
    const/4 v11, 0x0

    .line 73
    const/4 v12, 0x0

    .line 74
    move/from16 v13, p4

    .line 75
    .line 76
    move/from16 v14, p5

    .line 77
    .line 78
    move/from16 v7, p2

    .line 79
    .line 80
    move/from16 v9, p4

    .line 81
    .line 82
    move/from16 v10, p5

    .line 83
    .line 84
    invoke-virtual/range {v6 .. v14}, Lcom/bytedance/realx/video/GlGenericDrawer;->drawOes(I[FIIIIII)V

    .line 85
    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_3
    iget-object v15, v0, Lcom/bytedance/realx/video/YuvConverter;->mTextureDrawer:Lcom/bytedance/realx/video/GlRectDrawer;

    .line 89
    .line 90
    sget-object v17, Lcom/bytedance/realx/video/YuvConverter;->TEX_MATRIX:[F

    .line 91
    .line 92
    const/16 v20, 0x0

    .line 93
    .line 94
    const/16 v21, 0x0

    .line 95
    .line 96
    move/from16 v22, p4

    .line 97
    .line 98
    move/from16 v23, p5

    .line 99
    .line 100
    move/from16 v16, p2

    .line 101
    .line 102
    move/from16 v18, p4

    .line 103
    .line 104
    move/from16 v19, p5

    .line 105
    .line 106
    invoke-virtual/range {v15 .. v23}, Lcom/bytedance/realx/video/GlGenericDrawer;->drawRgb(I[FIIIIII)V

    .line 107
    .line 108
    .line 109
    :goto_0
    invoke-static {v5, v3}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 110
    .line 111
    .line 112
    invoke-static {v4, v3}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 113
    .line 114
    .line 115
    invoke-static {}, Landroid/opengl/GLES20;->glFinish()V

    .line 116
    .line 117
    .line 118
    const-string v0, "TextureHelper drawTexture"

    .line 119
    .line 120
    invoke-static {v0}, Lcom/bytedance/realx/video/GlUtil;->checkNoGLES2Error(Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    return-void
.end method

.method public queueTexture(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/bytedance/realx/video/YuvConverter;->mTextureUsedQueue:Ljava/util/List;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/bytedance/realx/video/YuvConverter;->mTextureUsedQueue:Ljava/util/List;

    .line 16
    .line 17
    new-instance v1, Ljava/lang/Integer;

    .line 18
    .line 19
    invoke-direct {v1, p1}, Ljava/lang/Integer;-><init>(I)V

    .line 20
    .line 21
    .line 22
    invoke-interface {v0, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Lcom/bytedance/realx/video/YuvConverter;->mTextureFreeQueue:Ljava/util/List;

    .line 26
    .line 27
    if-eqz p0, :cond_0

    .line 28
    .line 29
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method

.method public release()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/bytedance/realx/video/YuvConverter;->threadChecker:Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;->checkIsOnValidThread()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/bytedance/realx/video/YuvConverter;->drawer:Lcom/bytedance/realx/video/GlGenericDrawer;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/bytedance/realx/video/GlGenericDrawer;->release()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/bytedance/realx/video/YuvConverter;->i420TextureFrameBuffer:Lcom/bytedance/realx/video/GlTextureFrameBuffer;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/bytedance/realx/video/GlTextureFrameBuffer;->release()V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/bytedance/realx/video/YuvConverter;->mTextureDrawer:Lcom/bytedance/realx/video/GlRectDrawer;

    .line 17
    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/bytedance/realx/video/GlGenericDrawer;->release()V

    .line 21
    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    iput-object v0, p0, Lcom/bytedance/realx/video/YuvConverter;->mTextureDrawer:Lcom/bytedance/realx/video/GlRectDrawer;

    .line 25
    .line 26
    :cond_0
    iget v0, p0, Lcom/bytedance/realx/video/YuvConverter;->mFrameBufferId:I

    .line 27
    .line 28
    const/4 v1, 0x1

    .line 29
    const/4 v2, 0x0

    .line 30
    if-lez v0, :cond_1

    .line 31
    .line 32
    filled-new-array {v0}, [I

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glDeleteFramebuffers(I[II)V

    .line 37
    .line 38
    .line 39
    iput v2, p0, Lcom/bytedance/realx/video/YuvConverter;->mFrameBufferId:I

    .line 40
    .line 41
    :cond_1
    iget-object v0, p0, Lcom/bytedance/realx/video/YuvConverter;->mTextureFreeQueue:Ljava/util/List;

    .line 42
    .line 43
    if-eqz v0, :cond_3

    .line 44
    .line 45
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-lez v0, :cond_3

    .line 50
    .line 51
    iget-object v0, p0, Lcom/bytedance/realx/video/YuvConverter;->mTextureFreeQueue:Ljava/util/List;

    .line 52
    .line 53
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 58
    .line 59
    .line 60
    move-result v3

    .line 61
    if-eqz v3, :cond_2

    .line 62
    .line 63
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v3

    .line 67
    check-cast v3, Ljava/lang/Integer;

    .line 68
    .line 69
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 70
    .line 71
    .line 72
    move-result v3

    .line 73
    filled-new-array {v3}, [I

    .line 74
    .line 75
    .line 76
    move-result-object v3

    .line 77
    invoke-static {v1, v3, v2}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 78
    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_2
    iget-object v0, p0, Lcom/bytedance/realx/video/YuvConverter;->mTextureFreeQueue:Ljava/util/List;

    .line 82
    .line 83
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 84
    .line 85
    .line 86
    :cond_3
    iget-object v0, p0, Lcom/bytedance/realx/video/YuvConverter;->mTextureUsedQueue:Ljava/util/List;

    .line 87
    .line 88
    if-eqz v0, :cond_5

    .line 89
    .line 90
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    if-lez v0, :cond_5

    .line 95
    .line 96
    iget-object v0, p0, Lcom/bytedance/realx/video/YuvConverter;->mTextureUsedQueue:Ljava/util/List;

    .line 97
    .line 98
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 103
    .line 104
    .line 105
    move-result v3

    .line 106
    if-eqz v3, :cond_4

    .line 107
    .line 108
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    move-result-object v3

    .line 112
    check-cast v3, Ljava/lang/Integer;

    .line 113
    .line 114
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 115
    .line 116
    .line 117
    move-result v3

    .line 118
    filled-new-array {v3}, [I

    .line 119
    .line 120
    .line 121
    move-result-object v3

    .line 122
    invoke-static {v1, v3, v2}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 123
    .line 124
    .line 125
    goto :goto_1

    .line 126
    :cond_4
    iget-object v0, p0, Lcom/bytedance/realx/video/YuvConverter;->mTextureUsedQueue:Ljava/util/List;

    .line 127
    .line 128
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 129
    .line 130
    .line 131
    :cond_5
    iget-object p0, p0, Lcom/bytedance/realx/video/YuvConverter;->threadChecker:Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;

    .line 132
    .line 133
    invoke-virtual {p0}, Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;->detachThread()V

    .line 134
    .line 135
    .line 136
    return-void
.end method
