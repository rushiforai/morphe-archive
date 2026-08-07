.class public Lcom/momo/mcamera/mask/TriggerBlendFilter;
.super Ll/hs10;
.source "SourceFile"

# interfaces
.implements Ll/suf;


# static fields
.field private static final UNIFORM_BLEND:Ljava/lang/String; = "blend"

.field protected static final UNIFORM_TEXTURE_ALPHA:Ljava/lang/String; = "inputImageTexture2"


# instance fields
.field private alphaTexture:I

.field private blendHandler:I

.field private blendType:Ljava/lang/String;

.field protected intensity:F

.field private intensityHandle:I

.field protected isBlend:I

.field protected isSegmentBody:Z

.field protected isStroke:Z

.field private mmcvInfo:Ll/omw;

.field private strokeColorHandler:I

.field private strokeEnabled:I

.field private strokeEnabledHandler:I

.field protected strokeRadius:I

.field private strokeRadiusHandler:I

.field protected strokeRgbaColor:[F

.field private texelHeightHandler:I

.field private texelWidthHandler:I


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-direct {p0, v0}, Ll/hs10;-><init>(I)V

    .line 3
    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput v0, p0, Lcom/momo/mcamera/mask/TriggerBlendFilter;->isBlend:I

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/TriggerBlendFilter;->isSegmentBody:Z

    .line 10
    .line 11
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/TriggerBlendFilter;->isStroke:Z

    .line 12
    .line 13
    const/4 v2, 0x5

    .line 14
    iput v2, p0, Lcom/momo/mcamera/mask/TriggerBlendFilter;->strokeRadius:I

    .line 15
    .line 16
    iput v1, p0, Lcom/momo/mcamera/mask/TriggerBlendFilter;->alphaTexture:I

    .line 17
    .line 18
    iput v0, p0, Lcom/momo/mcamera/mask/TriggerBlendFilter;->strokeEnabled:I

    .line 19
    .line 20
    const/high16 v0, 0x3f800000    # 1.0f

    .line 21
    .line 22
    iput v0, p0, Lcom/momo/mcamera/mask/TriggerBlendFilter;->intensity:F

    .line 23
    .line 24
    return-void
.end method

.method public constructor <init>(I)V
    .locals 2

    .line 25
    invoke-direct {p0, p1}, Ll/hs10;-><init>(I)V

    const/4 p1, 0x1

    .line 26
    iput p1, p0, Lcom/momo/mcamera/mask/TriggerBlendFilter;->isBlend:I

    const/4 v0, 0x0

    .line 27
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/TriggerBlendFilter;->isSegmentBody:Z

    .line 28
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/TriggerBlendFilter;->isStroke:Z

    const/4 v1, 0x5

    .line 29
    iput v1, p0, Lcom/momo/mcamera/mask/TriggerBlendFilter;->strokeRadius:I

    .line 30
    iput v0, p0, Lcom/momo/mcamera/mask/TriggerBlendFilter;->alphaTexture:I

    .line 31
    iput p1, p0, Lcom/momo/mcamera/mask/TriggerBlendFilter;->strokeEnabled:I

    const/high16 p1, 0x3f800000    # 1.0f

    .line 32
    iput p1, p0, Lcom/momo/mcamera/mask/TriggerBlendFilter;->intensity:F

    return-void
.end method


# virtual methods
.method public destroy()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/hs10;->destroy()V

    .line 2
    .line 3
    .line 4
    iget p0, p0, Lcom/momo/mcamera/mask/TriggerBlendFilter;->alphaTexture:I

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    filled-new-array {p0}, [I

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    const/4 v0, 0x1

    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-static {v0, p0, v1}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public getFragmentShader()Ljava/lang/String;
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/momo/mcamera/mask/TriggerBlendFilter;->isSegmentBody:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-boolean p0, p0, Lcom/momo/mcamera/mask/TriggerBlendFilter;->isStroke:Z

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const-string p0, "precision mediump float;\nuniform sampler2D inputImageTexture0;\nuniform sampler2D inputImageTexture1;\nuniform sampler2D inputImageTexture2;\nuniform sampler2D inputImageTexture3;\nuniform int blend;\nvarying vec2 textureCoordinate;\n\nuniform float texelWidth;\nuniform float texelHeight;\n\nuniform int strokeRadius;\nuniform vec4 strokeColor;\nuniform int strokeEnabled;\nfloat stepWidth = 1.0;\n\nfloat intensityForEdge(vec2 center, vec2 step1) {\n    //bool isIntensity = false;\n    vec4 centerTex = texture2D(inputImageTexture3, center);\n    float intensity = centerTex.r;\n    for (int i = 0; i < strokeRadius; i++) {\n        vec2 left = center + vec2(step1.x * float(i), 0.0);\n        vec2 right = center + vec2(step1.x * -float(i), 0.0);\n        vec2 top = center + vec2(0.0, -step1.y * float(i));\n        vec2 bottom = center + vec2(0.0, +step1.y * float(i));\n        vec4 leftTex = texture2D( inputImageTexture3, left);\n        vec4 rightTex = texture2D( inputImageTexture3, right);\n        vec4 topTex = texture2D( inputImageTexture3, top);\n        vec4 bottomTex = texture2D( inputImageTexture3, bottom);\n        intensity = (intensity+(leftTex.r+rightTex.r+ topTex.r+ bottomTex.r)*(1.0-float(i)/float(strokeRadius)));\n    }\n    return intensity*float(strokeRadius);\n}\n\nvoid main(){\n vec4 color2 = texture2D(inputImageTexture0,textureCoordinate);\n if(blend==0) {\n   gl_FragColor = color2;\n} else {   \n   vec2 step1 = vec2(stepWidth*texelWidth, stepWidth*texelHeight);\n   vec4 picture = texture2D(inputImageTexture1, textureCoordinate);\n\n   vec4 color1;\n   float intensity = intensityForEdge(textureCoordinate, step1);\n   //if (intensity > 0.0) {\n   //   color1 = strokeColor;\n   //} else {\n   //   color1 = picture;\n   //}\n   color1 = mix(strokeColor, picture , step(0.0, -intensity));\n   color1 = mix(picture, color1, float(strokeEnabled));\n   //vec4 colorSobel = texture2D(inputImageTexture3,textureCoordinate);\n   //float c1AlphaDivisor = color1.a + step(color1.a, 0.0);\n   //color1.rgb = color1.rgb/c1AlphaDivisor;\n   vec4 outputColor;\n   float a = color1.a + color2.a * (1.0 - color1.a);\n   vec4 colorAlpha = texture2D(inputImageTexture2, textureCoordinate);\n   color1 = vec4(color1.rgb, color1.a * (colorAlpha.r > 0.9 ? 0.0 : (1.0 - colorAlpha.r * colorAlpha.r* colorAlpha.r)));\n   outputColor.r = (color1.r * color1.a + color2.r * color2.a * (1.0 - color1.a))/a;\n   outputColor.g = (color1.g * color1.a + color2.g * color2.a * (1.0 - color1.a))/a;\n   outputColor.b = (color1.b * color1.a + color2.b * color2.a * (1.0 - color1.a))/a;\n   outputColor.a = 1.0;\n   gl_FragColor = outputColor;\n   }\n }"

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    const-string p0, "precision mediump float;\nuniform sampler2D inputImageTexture0;\nuniform sampler2D inputImageTexture1;\nuniform sampler2D inputImageTexture2;\nuniform int blend;\nvarying vec2 textureCoordinate;\nvoid main(){\n vec4 color2 = texture2D(inputImageTexture0,textureCoordinate);\n if(blend==0) {     gl_FragColor = color2; }  else{   vec4 color1 = texture2D(inputImageTexture1,textureCoordinate);\n   vec4 outputColor;\n   float a = color1.a + color2.a * (1.0 - color1.a);\n   vec4 colorAlpha = texture2D(inputImageTexture2, textureCoordinate);\n   color1 = vec4(color1.rgb, color1.a * (colorAlpha.r > 0.9 ? 0.0 : (1.0 - colorAlpha.r * colorAlpha.r* colorAlpha.r)));\n   outputColor.r = (color1.r * color1.a + color2.r * color2.a * (1.0 - color1.a))/a;\n   outputColor.g = (color1.g * color1.a + color2.g * color2.a * (1.0 - color1.a))/a;\n   outputColor.b = (color1.b * color1.a + color2.b * color2.a * (1.0 - color1.a))/a;\n   outputColor.a = 1.0;\n   gl_FragColor = outputColor;\n }}\n"

    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_1
    iget-object v0, p0, Lcom/momo/mcamera/mask/TriggerBlendFilter;->blendType:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_2

    .line 22
    .line 23
    iget-object p0, p0, Lcom/momo/mcamera/mask/TriggerBlendFilter;->blendType:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {p0}, Ll/c43;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-nez v0, :cond_2

    .line 34
    .line 35
    return-object p0

    .line 36
    :cond_2
    const-string p0, "precision mediump float;\nuniform sampler2D inputImageTexture0;\nuniform sampler2D inputImageTexture1;\nuniform int blend;\nvarying vec2 textureCoordinate;\nvoid main(){\n vec4 color2 = texture2D(inputImageTexture0,textureCoordinate);\n if(blend==0) {     gl_FragColor = color2; }  else{   vec4 color1 = texture2D(inputImageTexture1,textureCoordinate);\n   vec4 outputColor;\n   float a = color1.a + color2.a * (1.0 - color1.a);\n   outputColor.r = (color1.r * color1.a + color2.r * color2.a * (1.0 - color1.a))/a;\n   outputColor.g = (color1.g * color1.a + color2.g * color2.a * (1.0 - color1.a))/a;\n   outputColor.b = (color1.b * color1.a + color2.b * color2.a * (1.0 - color1.a))/a;\n   outputColor.a = 1.0;\n   gl_FragColor = outputColor;\n }}\n"

    .line 37
    .line 38
    return-object p0
.end method

.method public initShaderHandles()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/hs10;->initShaderHandles()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/wej;->programHandle:I

    .line 5
    .line 6
    const-string v1, "blend"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Lcom/momo/mcamera/mask/TriggerBlendFilter;->blendHandler:I

    .line 13
    .line 14
    iget-boolean v0, p0, Lcom/momo/mcamera/mask/TriggerBlendFilter;->isSegmentBody:Z

    .line 15
    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    iget-boolean v0, p0, Lcom/momo/mcamera/mask/TriggerBlendFilter;->isStroke:Z

    .line 19
    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    iget v0, p0, Ll/wej;->programHandle:I

    .line 23
    .line 24
    const-string v1, "texelWidth"

    .line 25
    .line 26
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    iput v0, p0, Lcom/momo/mcamera/mask/TriggerBlendFilter;->texelWidthHandler:I

    .line 31
    .line 32
    iget v0, p0, Ll/wej;->programHandle:I

    .line 33
    .line 34
    const-string v1, "texelHeight"

    .line 35
    .line 36
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    iput v0, p0, Lcom/momo/mcamera/mask/TriggerBlendFilter;->texelHeightHandler:I

    .line 41
    .line 42
    iget v0, p0, Ll/wej;->programHandle:I

    .line 43
    .line 44
    const-string v1, "strokeRadius"

    .line 45
    .line 46
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    iput v0, p0, Lcom/momo/mcamera/mask/TriggerBlendFilter;->strokeRadiusHandler:I

    .line 51
    .line 52
    iget v0, p0, Ll/wej;->programHandle:I

    .line 53
    .line 54
    const-string v1, "strokeColor"

    .line 55
    .line 56
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    iput v0, p0, Lcom/momo/mcamera/mask/TriggerBlendFilter;->strokeColorHandler:I

    .line 61
    .line 62
    iget v0, p0, Ll/wej;->programHandle:I

    .line 63
    .line 64
    const-string v1, "strokeEnabled"

    .line 65
    .line 66
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    iput v0, p0, Lcom/momo/mcamera/mask/TriggerBlendFilter;->strokeEnabledHandler:I

    .line 71
    .line 72
    :cond_0
    iget v0, p0, Ll/wej;->programHandle:I

    .line 73
    .line 74
    const-string v1, "intensity"

    .line 75
    .line 76
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    iput v0, p0, Lcom/momo/mcamera/mask/TriggerBlendFilter;->intensityHandle:I

    .line 81
    .line 82
    return-void
.end method

.method public passShaderValues()V
    .locals 6

    .line 1
    invoke-super {p0}, Ll/hs10;->passShaderValues()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/momo/mcamera/mask/TriggerBlendFilter;->blendHandler:I

    .line 5
    .line 6
    iget v1, p0, Lcom/momo/mcamera/mask/TriggerBlendFilter;->isBlend:I

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 9
    .line 10
    .line 11
    iget-boolean v0, p0, Lcom/momo/mcamera/mask/TriggerBlendFilter;->isSegmentBody:Z

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-boolean v0, p0, Lcom/momo/mcamera/mask/TriggerBlendFilter;->isStroke:Z

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget v0, p0, Lcom/momo/mcamera/mask/TriggerBlendFilter;->texelWidthHandler:I

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    int-to-float v1, v1

    .line 26
    const/high16 v2, 0x3f800000    # 1.0f

    .line 27
    .line 28
    div-float v1, v2, v1

    .line 29
    .line 30
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 31
    .line 32
    .line 33
    iget v0, p0, Lcom/momo/mcamera/mask/TriggerBlendFilter;->texelHeightHandler:I

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    int-to-float v1, v1

    .line 40
    div-float/2addr v2, v1

    .line 41
    invoke-static {v0, v2}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 42
    .line 43
    .line 44
    iget v0, p0, Lcom/momo/mcamera/mask/TriggerBlendFilter;->strokeRadiusHandler:I

    .line 45
    .line 46
    iget v1, p0, Lcom/momo/mcamera/mask/TriggerBlendFilter;->strokeRadius:I

    .line 47
    .line 48
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 49
    .line 50
    .line 51
    iget v0, p0, Lcom/momo/mcamera/mask/TriggerBlendFilter;->strokeColorHandler:I

    .line 52
    .line 53
    iget-object v1, p0, Lcom/momo/mcamera/mask/TriggerBlendFilter;->strokeRgbaColor:[F

    .line 54
    .line 55
    const/4 v2, 0x0

    .line 56
    aget v2, v1, v2

    .line 57
    .line 58
    const/4 v3, 0x1

    .line 59
    aget v3, v1, v3

    .line 60
    .line 61
    const/4 v4, 0x2

    .line 62
    aget v4, v1, v4

    .line 63
    .line 64
    const/4 v5, 0x3

    .line 65
    aget v1, v1, v5

    .line 66
    .line 67
    invoke-static {v0, v2, v3, v4, v1}, Landroid/opengl/GLES20;->glUniform4f(IFFFF)V

    .line 68
    .line 69
    .line 70
    iget v0, p0, Lcom/momo/mcamera/mask/TriggerBlendFilter;->strokeEnabledHandler:I

    .line 71
    .line 72
    iget v1, p0, Lcom/momo/mcamera/mask/TriggerBlendFilter;->strokeEnabled:I

    .line 73
    .line 74
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 75
    .line 76
    .line 77
    :cond_0
    iget v0, p0, Lcom/momo/mcamera/mask/TriggerBlendFilter;->intensityHandle:I

    .line 78
    .line 79
    iget p0, p0, Lcom/momo/mcamera/mask/TriggerBlendFilter;->intensity:F

    .line 80
    .line 81
    invoke-static {v0, p0}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method public setBlend(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/gfj;->listLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iput p1, p0, Lcom/momo/mcamera/mask/TriggerBlendFilter;->isBlend:I

    .line 5
    .line 6
    monitor-exit v0

    .line 7
    return-void

    .line 8
    :catchall_0
    move-exception p0

    .line 9
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    throw p0
.end method

.method public setBlend(Z)V
    .locals 1

    .line 11
    iget-object v0, p0, Ll/gfj;->listLock:Ljava/lang/Object;

    monitor-enter v0

    .line 12
    :try_start_0
    iput p1, p0, Lcom/momo/mcamera/mask/TriggerBlendFilter;->isBlend:I

    .line 13
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public setBlendType(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/TriggerBlendFilter;->blendType:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setIntensity(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/TriggerBlendFilter;->intensity:F

    .line 2
    .line 3
    return-void
.end method

.method public setMMCVInfo(Ll/omw;)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iput-object p1, p0, Lcom/momo/mcamera/mask/TriggerBlendFilter;->mmcvInfo:Ll/omw;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-virtual {p1, v0}, Ll/omw;->j(I)Ll/nuf;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    if-eqz p1, :cond_1

    .line 12
    .line 13
    invoke-virtual {p1}, Ll/nuf;->o()[F

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    if-eqz v1, :cond_1

    .line 18
    .line 19
    invoke-virtual {p1}, Ll/nuf;->v()[F

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    if-eqz p1, :cond_1

    .line 24
    .line 25
    const/4 p1, 0x1

    .line 26
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/TriggerBlendFilter;->setStrokeEnabled(Z)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_1
    invoke-virtual {p0, v0}, Lcom/momo/mcamera/mask/TriggerBlendFilter;->setStrokeEnabled(Z)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public setSegmentBody(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/TriggerBlendFilter;->isSegmentBody:Z

    .line 2
    .line 3
    return-void
.end method

.method public setSegmentStrokeColor([F)V
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_1

    .line 3
    .line 4
    array-length v1, p1

    .line 5
    const/4 v2, 0x3

    .line 6
    if-lt v1, v2, :cond_1

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/TriggerBlendFilter;->isStroke:Z

    .line 10
    .line 11
    array-length v3, p1

    .line 12
    if-ne v3, v2, :cond_0

    .line 13
    .line 14
    aget v3, p1, v0

    .line 15
    .line 16
    aget v4, p1, v1

    .line 17
    .line 18
    const/4 v5, 0x2

    .line 19
    aget p1, p1, v5

    .line 20
    .line 21
    const/4 v6, 0x4

    .line 22
    new-array v6, v6, [F

    .line 23
    .line 24
    aput v3, v6, v0

    .line 25
    .line 26
    aput v4, v6, v1

    .line 27
    .line 28
    aput p1, v6, v5

    .line 29
    .line 30
    const/high16 p1, 0x3f800000    # 1.0f

    .line 31
    .line 32
    aput p1, v6, v2

    .line 33
    .line 34
    iput-object v6, p0, Lcom/momo/mcamera/mask/TriggerBlendFilter;->strokeRgbaColor:[F

    .line 35
    .line 36
    return-void

    .line 37
    :cond_0
    iput-object p1, p0, Lcom/momo/mcamera/mask/TriggerBlendFilter;->strokeRgbaColor:[F

    .line 38
    .line 39
    return-void

    .line 40
    :cond_1
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/TriggerBlendFilter;->isStroke:Z

    .line 41
    .line 42
    return-void
.end method

.method public setSegmentStrokeRadius(I)V
    .locals 0

    .line 1
    if-lez p1, :cond_0

    .line 2
    .line 3
    iput p1, p0, Lcom/momo/mcamera/mask/TriggerBlendFilter;->strokeRadius:I

    .line 4
    .line 5
    :cond_0
    return-void
.end method

.method public setStrokeEnabled(Z)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/TriggerBlendFilter;->strokeEnabled:I

    .line 2
    .line 3
    return-void
.end method
