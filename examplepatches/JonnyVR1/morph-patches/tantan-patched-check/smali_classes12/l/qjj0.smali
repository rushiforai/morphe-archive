.class public Ll/qjj0;
.super Ll/is10;
.source "SourceFile"

# interfaces
.implements Ll/ruf;


# instance fields
.field private I:I

.field private J:I

.field private K:I

.field private L:I

.field private M:I

.field private N:I

.field protected O:I

.field protected P:Z

.field protected Q:Z

.field protected R:[F

.field protected S:I

.field private T:Lcom/immomo/components/interfaces/IProcessOutput;

.field private U:I

.field private V:Ljava/lang/String;

.field private W:I

.field protected X:F

.field private Y:I


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-direct {p0, v0}, Ll/is10;-><init>(I)V

    .line 3
    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput v0, p0, Ll/qjj0;->O:I

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    iput-boolean v1, p0, Ll/qjj0;->P:Z

    .line 10
    .line 11
    iput-boolean v1, p0, Ll/qjj0;->Q:Z

    .line 12
    .line 13
    const/4 v2, 0x5

    .line 14
    iput v2, p0, Ll/qjj0;->S:I

    .line 15
    .line 16
    iput v1, p0, Ll/qjj0;->U:I

    .line 17
    .line 18
    iput v0, p0, Ll/qjj0;->W:I

    .line 19
    .line 20
    const/high16 v0, 0x3f800000    # 1.0f

    .line 21
    .line 22
    iput v0, p0, Ll/qjj0;->X:F

    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public R(Z)V
    .locals 0

    .line 1
    iput p1, p0, Ll/qjj0;->W:I

    .line 2
    .line 3
    return-void
.end method

.method public d(Lcom/immomo/components/interfaces/IProcessOutput;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iput-object p1, p0, Ll/qjj0;->T:Lcom/immomo/components/interfaces/IProcessOutput;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-interface {p1, v0}, Lcom/immomo/components/interfaces/IProcessOutput;->b(I)Ll/ftl;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Ll/qjj0;->R(Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public f()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/is10;->f()V

    .line 2
    .line 3
    .line 4
    iget p0, p0, Ll/qjj0;->U:I

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

.method public m()Ljava/lang/String;
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/qjj0;->P:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-boolean p0, p0, Ll/qjj0;->Q:Z

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
    iget-object v0, p0, Ll/qjj0;->V:Ljava/lang/String;

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
    iget-object p0, p0, Ll/qjj0;->V:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {p0}, Ll/d43;->b(Ljava/lang/String;)Ljava/lang/String;

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

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/is10;->t()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/xej;->d:I

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
    iput v0, p0, Ll/qjj0;->I:I

    .line 13
    .line 14
    iget-boolean v0, p0, Ll/qjj0;->P:Z

    .line 15
    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    iget-boolean v0, p0, Ll/qjj0;->Q:Z

    .line 19
    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    iget v0, p0, Ll/xej;->d:I

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
    iput v0, p0, Ll/qjj0;->J:I

    .line 31
    .line 32
    iget v0, p0, Ll/xej;->d:I

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
    iput v0, p0, Ll/qjj0;->K:I

    .line 41
    .line 42
    iget v0, p0, Ll/xej;->d:I

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
    iput v0, p0, Ll/qjj0;->L:I

    .line 51
    .line 52
    iget v0, p0, Ll/xej;->d:I

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
    iput v0, p0, Ll/qjj0;->M:I

    .line 61
    .line 62
    iget v0, p0, Ll/xej;->d:I

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
    iput v0, p0, Ll/qjj0;->N:I

    .line 71
    .line 72
    :cond_0
    iget v0, p0, Ll/xej;->d:I

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
    iput v0, p0, Ll/qjj0;->Y:I

    .line 81
    .line 82
    return-void
.end method

.method public w()V
    .locals 6

    .line 1
    invoke-super {p0}, Ll/is10;->w()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/qjj0;->I:I

    .line 5
    .line 6
    iget v1, p0, Ll/qjj0;->O:I

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 9
    .line 10
    .line 11
    iget-boolean v0, p0, Ll/qjj0;->P:Z

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-boolean v0, p0, Ll/qjj0;->Q:Z

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget v0, p0, Ll/qjj0;->J:I

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/xej;->r()I

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
    iget v0, p0, Ll/qjj0;->K:I

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/xej;->n()I

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
    iget v0, p0, Ll/qjj0;->L:I

    .line 45
    .line 46
    iget v1, p0, Ll/qjj0;->S:I

    .line 47
    .line 48
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 49
    .line 50
    .line 51
    iget v0, p0, Ll/qjj0;->M:I

    .line 52
    .line 53
    iget-object v1, p0, Ll/qjj0;->R:[F

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
    iget v0, p0, Ll/qjj0;->N:I

    .line 71
    .line 72
    iget v1, p0, Ll/qjj0;->W:I

    .line 73
    .line 74
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 75
    .line 76
    .line 77
    :cond_0
    iget v0, p0, Ll/qjj0;->Y:I

    .line 78
    .line 79
    iget p0, p0, Ll/qjj0;->X:F

    .line 80
    .line 81
    invoke-static {v0, p0}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 82
    .line 83
    .line 84
    return-void
.end method
