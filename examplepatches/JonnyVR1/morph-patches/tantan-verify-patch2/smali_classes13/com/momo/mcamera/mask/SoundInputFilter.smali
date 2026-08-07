.class public Lcom/momo/mcamera/mask/SoundInputFilter;
.super Ll/jt2;
.source "SourceFile"


# static fields
.field private static final UNIFORM_IGLOBAL_TIME:Ljava/lang/String; = "iGlobalTime"

.field private static final UNIFORM_ITIME_DELTA:Ljava/lang/String; = "iTimeDelta"

.field private static final UNIFORM_PCM_FLAG:Ljava/lang/String; = "pcmFlag"


# instance fields
.field private hasVoiceData:Z

.field private iGlobalTimeHandler:I

.field private iPcmFlagHandler:I

.field private iTimeDeltaHandler:I

.field private mByteBuffer:Ljava/nio/ByteBuffer;

.field private needUpdate:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/jt2;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/gfj;->useCache:Z

    .line 6
    .line 7
    return-void
.end method

.method private deleteTexture()V
    .locals 3

    .line 1
    iget v0, p0, Ll/wej;->texture_in:I

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    filled-new-array {v0}, [I

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x1

    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 12
    .line 13
    .line 14
    iput v2, p0, Ll/wej;->texture_in:I

    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method private getByteBuffer()Ljava/nio/ByteBuffer;
    .locals 1

    .line 1
    const/16 p0, 0x800

    .line 2
    .line 3
    invoke-static {p0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const/4 v0, 0x0

    .line 16
    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 17
    .line 18
    .line 19
    return-object p0
.end method


# virtual methods
.method public destroy()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/gfj;->destroy()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/momo/mcamera/mask/SoundInputFilter;->mByteBuffer:Ljava/nio/ByteBuffer;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-object v0, p0, Lcom/momo/mcamera/mask/SoundInputFilter;->mByteBuffer:Ljava/nio/ByteBuffer;

    .line 13
    .line 14
    :cond_0
    invoke-direct {p0}, Lcom/momo/mcamera/mask/SoundInputFilter;->deleteTexture()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision mediump float;\nuniform sampler2D inputImageTexture0;\nvarying vec2 textureCoordinate;\nuniform float     iGlobalTime;           // shader playback time (in seconds)\nuniform float     iTimeDelta;            // render time (in seconds)\nuniform float     pcmFlag;            // flag\nvec3 B2_spline(vec3 x) { // returns 3 B-spline functions of degree 2\n    vec3 t = 3.0 * x;\n    vec3 b0 = step(0.0, t)     * step(0.0, 1.0-t);\n    vec3 b1 = step(0.0, t-1.0) * step(0.0, 2.0-t);\n    vec3 b2 = step(0.0, t-2.0) * step(0.0, 3.0-t);\n    return 0.5 * (\n      b0 * pow(t, vec3(2.0)) +\n      b1 * (-2.0*pow(t, vec3(2.0)) + 6.0*t - 3.0) + \n      b2 * pow(3.0-t,vec3(2.0))\n    );\n}\nvoid main(){\nif (pcmFlag < 1.0) {\n   gl_FragColor = texture2D(inputImageTexture0,textureCoordinate);\n   return;\n   }\n    // create pixel coordinates\n    vec2 uv =  textureCoordinate.xy;\n\n    float fVBars = 30.0;\n    float fHSpacing = 10.00;\n    \n    \n    float x = floor(uv.x * fVBars)/fVBars;\n    float fSample = texture2D(inputImageTexture0, vec2(abs(2.0 * x - 1.0), 0.25)).x;\n  \n    float squarewave = sign(mod(uv.x, 1.0/fVBars)-0.012);\n    float fft = squarewave * fSample* 0.5;\n    \n    float fHBars = 100.0;\n    float fVSpacing = 0.0;\n    float fVFreq = (uv.y * 3.14);\n    fVFreq = sign(sin(fVFreq * fHBars)+1.0-fVSpacing);\n\n    vec2 centered = vec2(1.0) * uv - vec2(1.0) ;\n    float t = iGlobalTime / 100.0;\n    float polychrome = 1.0;\n    vec3 spline_args = fract(vec3(polychrome*uv.x-t) + vec3(0.0, -1.0/3.0, -2.0/3.0));\n    vec3 spline = B2_spline(spline_args);\n    \n    float f = abs(centered.y);\n    vec3 base_color  = vec3(1.0, 1.0, 1.0);\n    vec3 flame_color = base_color;\n    \n    float tt = 0.5 - uv.y;\n    float df = sign(tt);\n    df = (df + 1.0)/0.5;\n    vec3 col = flame_color * vec3(1.0 - step(fft, abs(0.5-uv.y))) * vec3(fVFreq);\n    \n  // output final color\n  gl_FragColor = vec4(col, 1.0 - step(col,vec3(0.0,0.0,0.0)).x);\n}"

    .line 2
    .line 3
    return-object p0
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
    const-string v1, "iGlobalTime"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Lcom/momo/mcamera/mask/SoundInputFilter;->iGlobalTimeHandler:I

    .line 13
    .line 14
    iget v0, p0, Ll/wej;->programHandle:I

    .line 15
    .line 16
    const-string v1, "iTimeDelta"

    .line 17
    .line 18
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Lcom/momo/mcamera/mask/SoundInputFilter;->iTimeDeltaHandler:I

    .line 23
    .line 24
    iget v0, p0, Ll/wej;->programHandle:I

    .line 25
    .line 26
    const-string v1, "pcmFlag"

    .line 27
    .line 28
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iput v0, p0, Lcom/momo/mcamera/mask/SoundInputFilter;->iPcmFlagHandler:I

    .line 33
    .line 34
    return-void
.end method

.method public newTextureReady(ILl/gfj;Z)V
    .locals 2

    .line 1
    iget-object p1, p2, Ll/gfj;->glFrameBuffer:Ll/lej;

    .line 2
    .line 3
    iput-object p1, p0, Ll/gfj;->inputFrameBuffer:Ll/lej;

    .line 4
    .line 5
    iget-boolean p1, p0, Lcom/momo/mcamera/mask/SoundInputFilter;->hasVoiceData:Z

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    const/16 v1, 0x100

    .line 9
    .line 10
    if-nez p1, :cond_1

    .line 11
    .line 12
    iget p1, p0, Ll/wej;->texture_in:I

    .line 13
    .line 14
    if-nez p1, :cond_0

    .line 15
    .line 16
    iget-object p1, p0, Lcom/momo/mcamera/mask/SoundInputFilter;->mByteBuffer:Ljava/nio/ByteBuffer;

    .line 17
    .line 18
    invoke-static {p1, v1, v0}, Lcom/core/glcore/util/TextureHelper;->byteToTexture(Ljava/nio/ByteBuffer;II)I

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    iput p1, p0, Ll/wej;->texture_in:I

    .line 23
    .line 24
    :cond_0
    iget p1, p0, Ll/wej;->texture_in:I

    .line 25
    .line 26
    invoke-super {p0, p1, p2, p3}, Ll/jt2;->newTextureReady(ILl/gfj;Z)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_1
    if-eqz p3, :cond_2

    .line 31
    .line 32
    invoke-virtual {p0}, Ll/gfj;->markAsDirty()V

    .line 33
    .line 34
    .line 35
    :cond_2
    iget-boolean p1, p0, Lcom/momo/mcamera/mask/SoundInputFilter;->needUpdate:Z

    .line 36
    .line 37
    if-eqz p1, :cond_3

    .line 38
    .line 39
    invoke-direct {p0}, Lcom/momo/mcamera/mask/SoundInputFilter;->deleteTexture()V

    .line 40
    .line 41
    .line 42
    :cond_3
    invoke-virtual {p2}, Ll/wej;->getWidth()I

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    invoke-virtual {p0, p1}, Ll/wej;->setWidth(I)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p2}, Ll/wej;->getHeight()I

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    invoke-virtual {p0, p1}, Ll/wej;->setHeight(I)V

    .line 54
    .line 55
    .line 56
    iget p1, p0, Ll/wej;->texture_in:I

    .line 57
    .line 58
    if-eqz p1, :cond_4

    .line 59
    .line 60
    iget-boolean p1, p0, Lcom/momo/mcamera/mask/SoundInputFilter;->needUpdate:Z

    .line 61
    .line 62
    if-eqz p1, :cond_5

    .line 63
    .line 64
    :cond_4
    iget-object p1, p0, Lcom/momo/mcamera/mask/SoundInputFilter;->mByteBuffer:Ljava/nio/ByteBuffer;

    .line 65
    .line 66
    invoke-static {p1, v1, v0}, Lcom/core/glcore/util/TextureHelper;->byteToTexture(Ljava/nio/ByteBuffer;II)I

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    iput p1, p0, Ll/wej;->texture_in:I

    .line 71
    .line 72
    const/4 p1, 0x0

    .line 73
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/SoundInputFilter;->needUpdate:Z

    .line 74
    .line 75
    :cond_5
    invoke-virtual {p0}, Ll/wej;->onDrawFrame()V

    .line 76
    .line 77
    .line 78
    invoke-virtual {p2}, Ll/gfj;->unlockRenderBuffer()V

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method public passShaderValues()V
    .locals 3

    .line 1
    iget v0, p0, Lcom/momo/mcamera/mask/SoundInputFilter;->iGlobalTimeHandler:I

    .line 2
    .line 3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 4
    .line 5
    .line 6
    move-result-wide v1

    .line 7
    long-to-float v1, v1

    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 9
    .line 10
    .line 11
    iget v0, p0, Lcom/momo/mcamera/mask/SoundInputFilter;->iPcmFlagHandler:I

    .line 12
    .line 13
    iget-boolean v1, p0, Lcom/momo/mcamera/mask/SoundInputFilter;->hasVoiceData:Z

    .line 14
    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    const/high16 v1, 0x3f800000    # 1.0f

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 v1, 0x0

    .line 21
    :goto_0
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 22
    .line 23
    .line 24
    invoke-super {p0}, Ll/wej;->passShaderValues()V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public setSoundBytes([B)V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    move v2, v0

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    move v2, v1

    .line 8
    :goto_0
    iput-boolean v2, p0, Lcom/momo/mcamera/mask/SoundInputFilter;->hasVoiceData:Z

    .line 9
    .line 10
    iget-object v2, p0, Lcom/momo/mcamera/mask/SoundInputFilter;->mByteBuffer:Ljava/nio/ByteBuffer;

    .line 11
    .line 12
    if-nez v2, :cond_1

    .line 13
    .line 14
    invoke-direct {p0}, Lcom/momo/mcamera/mask/SoundInputFilter;->getByteBuffer()Ljava/nio/ByteBuffer;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    iput-object v2, p0, Lcom/momo/mcamera/mask/SoundInputFilter;->mByteBuffer:Ljava/nio/ByteBuffer;

    .line 19
    .line 20
    :cond_1
    iget-object v2, p0, Lcom/momo/mcamera/mask/SoundInputFilter;->mByteBuffer:Ljava/nio/ByteBuffer;

    .line 21
    .line 22
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 23
    .line 24
    .line 25
    if-eqz p1, :cond_2

    .line 26
    .line 27
    iget-object v2, p0, Lcom/momo/mcamera/mask/SoundInputFilter;->mByteBuffer:Ljava/nio/ByteBuffer;

    .line 28
    .line 29
    invoke-virtual {v2, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 30
    .line 31
    .line 32
    iget-object v2, p0, Lcom/momo/mcamera/mask/SoundInputFilter;->mByteBuffer:Ljava/nio/ByteBuffer;

    .line 33
    .line 34
    invoke-virtual {v2, p1}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Lcom/momo/mcamera/mask/SoundInputFilter;->mByteBuffer:Ljava/nio/ByteBuffer;

    .line 38
    .line 39
    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 40
    .line 41
    .line 42
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/SoundInputFilter;->needUpdate:Z

    .line 43
    .line 44
    :cond_2
    return-void
.end method
