.class public Lcom/momo/rtcbase/YuvConverter;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/rtcbase/YuvConverter$ShaderCallbacks;
    }
.end annotation


# static fields
.field private static final FRAGMENT_SHADER:Ljava/lang/String; = "uniform vec2 xUnit;\nuniform vec4 coeffs;\n\nvoid main() {\n  gl_FragColor.r = coeffs.a + dot(coeffs.rgb,\n      sample(tc - 1.5 * xUnit).rgb);\n  gl_FragColor.g = coeffs.a + dot(coeffs.rgb,\n      sample(tc - 0.5 * xUnit).rgb);\n  gl_FragColor.b = coeffs.a + dot(coeffs.rgb,\n      sample(tc + 0.5 * xUnit).rgb);\n  gl_FragColor.a = coeffs.a + dot(coeffs.rgb,\n      sample(tc + 1.5 * xUnit).rgb);\n}\n"


# instance fields
.field private final drawer:Lcom/momo/rtcbase/GlGenericDrawer;

.field private final i420TextureFrameBuffer:Lcom/momo/rtcbase/GlTextureFrameBuffer;

.field private final shaderCallbacks:Lcom/momo/rtcbase/YuvConverter$ShaderCallbacks;

.field private final threadChecker:Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/momo/rtcbase/YuvConverter;->threadChecker:Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;

    .line 10
    .line 11
    new-instance v1, Lcom/momo/rtcbase/GlTextureFrameBuffer;

    .line 12
    .line 13
    const/16 v2, 0x1908

    .line 14
    .line 15
    invoke-direct {v1, v2}, Lcom/momo/rtcbase/GlTextureFrameBuffer;-><init>(I)V

    .line 16
    .line 17
    .line 18
    iput-object v1, p0, Lcom/momo/rtcbase/YuvConverter;->i420TextureFrameBuffer:Lcom/momo/rtcbase/GlTextureFrameBuffer;

    .line 19
    .line 20
    new-instance v1, Lcom/momo/rtcbase/YuvConverter$ShaderCallbacks;

    .line 21
    .line 22
    const/4 v2, 0x0

    .line 23
    invoke-direct {v1, v2}, Lcom/momo/rtcbase/YuvConverter$ShaderCallbacks;-><init>(Lcom/momo/rtcbase/YuvConverter$1;)V

    .line 24
    .line 25
    .line 26
    iput-object v1, p0, Lcom/momo/rtcbase/YuvConverter;->shaderCallbacks:Lcom/momo/rtcbase/YuvConverter$ShaderCallbacks;

    .line 27
    .line 28
    new-instance v2, Lcom/momo/rtcbase/GlGenericDrawer;

    .line 29
    .line 30
    const-string v3, "uniform vec2 xUnit;\nuniform vec4 coeffs;\n\nvoid main() {\n  gl_FragColor.r = coeffs.a + dot(coeffs.rgb,\n      sample(tc - 1.5 * xUnit).rgb);\n  gl_FragColor.g = coeffs.a + dot(coeffs.rgb,\n      sample(tc - 0.5 * xUnit).rgb);\n  gl_FragColor.b = coeffs.a + dot(coeffs.rgb,\n      sample(tc + 0.5 * xUnit).rgb);\n  gl_FragColor.a = coeffs.a + dot(coeffs.rgb,\n      sample(tc + 1.5 * xUnit).rgb);\n}\n"

    .line 31
    .line 32
    invoke-direct {v2, v3, v1}, Lcom/momo/rtcbase/GlGenericDrawer;-><init>(Ljava/lang/String;Lcom/momo/rtcbase/GlGenericDrawer$ShaderCallbacks;)V

    .line 33
    .line 34
    .line 35
    iput-object v2, p0, Lcom/momo/rtcbase/YuvConverter;->drawer:Lcom/momo/rtcbase/GlGenericDrawer;

    .line 36
    .line 37
    invoke-virtual {v0}, Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;->detachThread()V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public static synthetic a(Ljava/nio/ByteBuffer;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/momo/rtcbase/JniCommon;->nativeFreeByteBuffer(Ljava/nio/ByteBuffer;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public convert(Lcom/momo/rtcbase/VideoFrame$TextureBuffer;)Lcom/momo/rtcbase/VideoFrame$I420Buffer;
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lcom/momo/rtcbase/YuvConverter;->threadChecker:Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;->checkIsOnValidThread()V

    .line 6
    .line 7
    .line 8
    invoke-interface/range {p1 .. p1}, Lcom/momo/rtcbase/VideoFrame$Buffer;->getWidth()I

    .line 9
    .line 10
    .line 11
    move-result v5

    .line 12
    invoke-interface/range {p1 .. p1}, Lcom/momo/rtcbase/VideoFrame$Buffer;->getHeight()I

    .line 13
    .line 14
    .line 15
    move-result v6

    .line 16
    add-int/lit8 v1, v5, 0x7

    .line 17
    .line 18
    div-int/lit8 v1, v1, 0x8

    .line 19
    .line 20
    mul-int/lit8 v1, v1, 0x8

    .line 21
    .line 22
    add-int/lit8 v2, v6, 0x1

    .line 23
    .line 24
    div-int/lit8 v11, v2, 0x2

    .line 25
    .line 26
    add-int v2, v6, v11

    .line 27
    .line 28
    mul-int v3, v1, v2

    .line 29
    .line 30
    invoke-static {v3}, Lcom/momo/rtcbase/JniCommon;->nativeAllocateByteBuffer(I)Ljava/nio/ByteBuffer;

    .line 31
    .line 32
    .line 33
    move-result-object v18

    .line 34
    div-int/lit8 v9, v1, 0x4

    .line 35
    .line 36
    new-instance v4, Landroid/graphics/Matrix;

    .line 37
    .line 38
    invoke-direct {v4}, Landroid/graphics/Matrix;-><init>()V

    .line 39
    .line 40
    .line 41
    const/high16 v3, 0x3f000000    # 0.5f

    .line 42
    .line 43
    invoke-virtual {v4, v3, v3}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 44
    .line 45
    .line 46
    const/high16 v3, 0x3f800000    # 1.0f

    .line 47
    .line 48
    const/high16 v7, -0x40800000    # -1.0f

    .line 49
    .line 50
    invoke-virtual {v4, v3, v7}, Landroid/graphics/Matrix;->preScale(FF)Z

    .line 51
    .line 52
    .line 53
    const/high16 v3, -0x41000000    # -0.5f

    .line 54
    .line 55
    invoke-virtual {v4, v3, v3}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 56
    .line 57
    .line 58
    iget-object v3, v0, Lcom/momo/rtcbase/YuvConverter;->i420TextureFrameBuffer:Lcom/momo/rtcbase/GlTextureFrameBuffer;

    .line 59
    .line 60
    invoke-virtual {v3, v9, v2}, Lcom/momo/rtcbase/GlTextureFrameBuffer;->setSize(II)V

    .line 61
    .line 62
    .line 63
    iget-object v2, v0, Lcom/momo/rtcbase/YuvConverter;->i420TextureFrameBuffer:Lcom/momo/rtcbase/GlTextureFrameBuffer;

    .line 64
    .line 65
    invoke-virtual {v2}, Lcom/momo/rtcbase/GlTextureFrameBuffer;->getFrameBufferId()I

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    const v12, 0x8d40

    .line 70
    .line 71
    .line 72
    invoke-static {v12, v2}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 73
    .line 74
    .line 75
    const-string v2, "glBindFramebuffer"

    .line 76
    .line 77
    invoke-static {v2}, Lcom/momo/rtcbase/GlUtil;->checkNoGLES2Error(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    iget-object v2, v0, Lcom/momo/rtcbase/YuvConverter;->shaderCallbacks:Lcom/momo/rtcbase/YuvConverter$ShaderCallbacks;

    .line 81
    .line 82
    invoke-virtual {v2}, Lcom/momo/rtcbase/YuvConverter$ShaderCallbacks;->setPlaneY()V

    .line 83
    .line 84
    .line 85
    iget-object v2, v0, Lcom/momo/rtcbase/YuvConverter;->drawer:Lcom/momo/rtcbase/GlGenericDrawer;

    .line 86
    .line 87
    const/4 v7, 0x0

    .line 88
    const/4 v8, 0x0

    .line 89
    move v10, v6

    .line 90
    move-object/from16 v3, p1

    .line 91
    .line 92
    invoke-static/range {v2 .. v10}, Lcom/momo/rtcbase/VideoFrameDrawer;->drawTexture(Lcom/momo/rtcbase/RendererCommon$GlDrawer;Lcom/momo/rtcbase/VideoFrame$TextureBuffer;Landroid/graphics/Matrix;IIIIII)V

    .line 93
    .line 94
    .line 95
    iget-object v2, v0, Lcom/momo/rtcbase/YuvConverter;->shaderCallbacks:Lcom/momo/rtcbase/YuvConverter$ShaderCallbacks;

    .line 96
    .line 97
    invoke-virtual {v2}, Lcom/momo/rtcbase/YuvConverter$ShaderCallbacks;->setPlaneU()V

    .line 98
    .line 99
    .line 100
    iget-object v2, v0, Lcom/momo/rtcbase/YuvConverter;->drawer:Lcom/momo/rtcbase/GlGenericDrawer;

    .line 101
    .line 102
    div-int/lit8 v7, v9, 0x2

    .line 103
    .line 104
    move v9, v7

    .line 105
    const/4 v7, 0x0

    .line 106
    move v8, v6

    .line 107
    move v10, v11

    .line 108
    invoke-static/range {v2 .. v10}, Lcom/momo/rtcbase/VideoFrameDrawer;->drawTexture(Lcom/momo/rtcbase/RendererCommon$GlDrawer;Lcom/momo/rtcbase/VideoFrame$TextureBuffer;Landroid/graphics/Matrix;IIIIII)V

    .line 109
    .line 110
    .line 111
    iget-object v2, v0, Lcom/momo/rtcbase/YuvConverter;->shaderCallbacks:Lcom/momo/rtcbase/YuvConverter$ShaderCallbacks;

    .line 112
    .line 113
    invoke-virtual {v2}, Lcom/momo/rtcbase/YuvConverter$ShaderCallbacks;->setPlaneV()V

    .line 114
    .line 115
    .line 116
    iget-object v2, v0, Lcom/momo/rtcbase/YuvConverter;->drawer:Lcom/momo/rtcbase/GlGenericDrawer;

    .line 117
    .line 118
    move v7, v9

    .line 119
    invoke-static/range {v2 .. v10}, Lcom/momo/rtcbase/VideoFrameDrawer;->drawTexture(Lcom/momo/rtcbase/RendererCommon$GlDrawer;Lcom/momo/rtcbase/VideoFrame$TextureBuffer;Landroid/graphics/Matrix;IIIIII)V

    .line 120
    .line 121
    .line 122
    iget-object v2, v0, Lcom/momo/rtcbase/YuvConverter;->i420TextureFrameBuffer:Lcom/momo/rtcbase/GlTextureFrameBuffer;

    .line 123
    .line 124
    invoke-virtual {v2}, Lcom/momo/rtcbase/GlTextureFrameBuffer;->getWidth()I

    .line 125
    .line 126
    .line 127
    move-result v14

    .line 128
    iget-object v0, v0, Lcom/momo/rtcbase/YuvConverter;->i420TextureFrameBuffer:Lcom/momo/rtcbase/GlTextureFrameBuffer;

    .line 129
    .line 130
    invoke-virtual {v0}, Lcom/momo/rtcbase/GlTextureFrameBuffer;->getHeight()I

    .line 131
    .line 132
    .line 133
    move-result v15

    .line 134
    const/16 v16, 0x1908

    .line 135
    .line 136
    const/16 v17, 0x1401

    .line 137
    .line 138
    move v0, v12

    .line 139
    const/4 v12, 0x0

    .line 140
    const/4 v13, 0x0

    .line 141
    invoke-static/range {v12 .. v18}, Landroid/opengl/GLES20;->glReadPixels(IIIIIILjava/nio/Buffer;)V

    .line 142
    .line 143
    .line 144
    move-object/from16 v2, v18

    .line 145
    .line 146
    const-string v3, "YuvConverter.convert"

    .line 147
    .line 148
    invoke-static {v3}, Lcom/momo/rtcbase/GlUtil;->checkNoGLES2Error(Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    const/4 v3, 0x0

    .line 152
    invoke-static {v0, v3}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 153
    .line 154
    .line 155
    mul-int v0, v1, v6

    .line 156
    .line 157
    div-int/lit8 v4, v1, 0x2

    .line 158
    .line 159
    add-int v7, v0, v4

    .line 160
    .line 161
    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 162
    .line 163
    .line 164
    invoke-virtual {v2, v0}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 165
    .line 166
    .line 167
    move v3, v4

    .line 168
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    .line 169
    .line 170
    .line 171
    move-result-object v4

    .line 172
    invoke-virtual {v2, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 173
    .line 174
    .line 175
    add-int/lit8 v11, v10, -0x1

    .line 176
    .line 177
    mul-int/2addr v11, v1

    .line 178
    add-int/2addr v11, v3

    .line 179
    add-int/2addr v0, v11

    .line 180
    invoke-virtual {v2, v0}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 181
    .line 182
    .line 183
    move v3, v6

    .line 184
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    .line 185
    .line 186
    .line 187
    move-result-object v6

    .line 188
    invoke-virtual {v2, v7}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 189
    .line 190
    .line 191
    add-int/2addr v7, v11

    .line 192
    invoke-virtual {v2, v7}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 193
    .line 194
    .line 195
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    .line 196
    .line 197
    .line 198
    move-result-object v8

    .line 199
    new-instance v10, Ll/bpq0;

    .line 200
    .line 201
    invoke-direct {v10, v2}, Ll/bpq0;-><init>(Ljava/nio/ByteBuffer;)V

    .line 202
    .line 203
    .line 204
    move v7, v1

    .line 205
    move v9, v1

    .line 206
    move v2, v5

    .line 207
    move v5, v1

    .line 208
    invoke-static/range {v2 .. v10}, Lcom/momo/rtcbase/JavaI420Buffer;->wrap(IILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/lang/Runnable;)Lcom/momo/rtcbase/JavaI420Buffer;

    .line 209
    .line 210
    .line 211
    move-result-object v0

    .line 212
    return-object v0
.end method

.method public release()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/YuvConverter;->threadChecker:Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;->checkIsOnValidThread()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/momo/rtcbase/YuvConverter;->drawer:Lcom/momo/rtcbase/GlGenericDrawer;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/momo/rtcbase/GlGenericDrawer;->release()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/momo/rtcbase/YuvConverter;->i420TextureFrameBuffer:Lcom/momo/rtcbase/GlTextureFrameBuffer;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/momo/rtcbase/GlTextureFrameBuffer;->release()V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/momo/rtcbase/YuvConverter;->threadChecker:Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;->detachThread()V

    .line 19
    .line 20
    .line 21
    return-void
.end method
