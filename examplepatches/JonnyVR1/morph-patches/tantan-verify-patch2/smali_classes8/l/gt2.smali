.class public Ll/gt2;
.super Ll/hs10;
.source "SourceFile"


# instance fields
.field private a:I

.field private b:I

.field private c:Z

.field private d:Z

.field private e:Ljava/lang/String;

.field private f:F

.field protected g:F

.field protected i:F

.field private j:F

.field private k:F

.field private l:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-direct {p0, v0}, Ll/hs10;-><init>(I)V

    .line 3
    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p0, Ll/gt2;->c:Z

    .line 7
    .line 8
    iput-boolean v0, p0, Ll/gt2;->d:Z

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput v0, p0, Ll/gt2;->f:F

    .line 12
    .line 13
    const v1, 0x3d23d70a    # 0.04f

    .line 14
    .line 15
    .line 16
    iput v1, p0, Ll/gt2;->g:F

    .line 17
    .line 18
    iput v0, p0, Ll/gt2;->i:F

    .line 19
    .line 20
    const/high16 v1, 0x3f800000    # 1.0f

    .line 21
    .line 22
    iput v1, p0, Ll/gt2;->j:F

    .line 23
    .line 24
    iput v0, p0, Ll/gt2;->k:F

    .line 25
    .line 26
    const-string v0, "precision mediump float;\nuniform sampler2D inputImageTexture0;\nuniform sampler2D inputImageTexture1;\nuniform float blend;\nuniform float alpha;\nvarying vec2 textureCoordinate;\nvoid main(){\n vec4 base = texture2D(inputImageTexture0,textureCoordinate);\n if(blend==0.0) {     gl_FragColor = base; } else {     lowp vec4 overlayer = texture2D(inputImageTexture1,textureCoordinate) * alpha;\n          \n     gl_FragColor = overlayer * base + overlayer * (1.0 - base.a) + base * (1.0 - overlayer.a);\n}\n }"

    .line 27
    .line 28
    iput-object v0, p0, Ll/gt2;->l:Ljava/lang/String;

    .line 29
    .line 30
    return-void
.end method


# virtual methods
.method public Q1()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Ll/gt2;->f:F

    .line 3
    .line 4
    const v1, 0x3d23d70a    # 0.04f

    .line 5
    .line 6
    .line 7
    iput v1, p0, Ll/gt2;->g:F

    .line 8
    .line 9
    iput v0, p0, Ll/gt2;->i:F

    .line 10
    .line 11
    const/high16 v1, 0x3f800000    # 1.0f

    .line 12
    .line 13
    iput v1, p0, Ll/gt2;->j:F

    .line 14
    .line 15
    iput v0, p0, Ll/gt2;->k:F

    .line 16
    .line 17
    return-void
.end method

.method public R1(F)V
    .locals 0

    .line 1
    iput p1, p0, Ll/gt2;->f:F

    .line 2
    .line 3
    return-void
.end method

.method public getFragmentShader()Ljava/lang/String;
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/gt2;->d:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/gt2;->l:Ljava/lang/String;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    iget-object v0, p0, Ll/gt2;->e:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    iget-object v0, p0, Ll/gt2;->e:Ljava/lang/String;

    .line 17
    .line 18
    const-string v1, "Normal"

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_1

    .line 25
    .line 26
    iget-object p0, p0, Ll/gt2;->e:Ljava/lang/String;

    .line 27
    .line 28
    invoke-static {p0}, Ll/c43;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-nez v0, :cond_1

    .line 37
    .line 38
    return-object p0

    .line 39
    :cond_1
    const-string p0, "precision mediump float;\nuniform sampler2D inputImageTexture0;\nuniform sampler2D inputImageTexture1;\nuniform float blend;\nvarying vec2 textureCoordinate;\nvoid main(){\n vec4 color2 = texture2D(inputImageTexture0,textureCoordinate);\n if(blend==0.0) {     gl_FragColor = color2; }  else{   vec4 color1 = texture2D(inputImageTexture1,textureCoordinate);\n   vec4 outputColor;\n   float a = color1.a + color2.a * (1.0 - color1.a);\n   outputColor.r = (color1.r * color1.a + color2.r * color2.a * (1.0 - color1.a))/a;\n   outputColor.g = (color1.g * color1.a + color2.g * color2.a * (1.0 - color1.a))/a;\n   outputColor.b = (color1.b * color1.a + color2.b * color2.a * (1.0 - color1.a))/a;\n   outputColor.a = 1.0;\n   gl_FragColor = outputColor;\n }}\n"

    .line 40
    .line 41
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
    iput v0, p0, Ll/gt2;->a:I

    .line 13
    .line 14
    iget v0, p0, Ll/wej;->programHandle:I

    .line 15
    .line 16
    const-string v1, "alpha"

    .line 17
    .line 18
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Ll/gt2;->b:I

    .line 23
    .line 24
    return-void
.end method

.method public passShaderValues()V
    .locals 3

    .line 1
    iget v0, p0, Ll/gt2;->i:F

    .line 2
    .line 3
    iget v1, p0, Ll/gt2;->g:F

    .line 4
    .line 5
    add-float/2addr v0, v1

    .line 6
    iput v0, p0, Ll/gt2;->i:F

    .line 7
    .line 8
    invoke-super {p0}, Ll/hs10;->passShaderValues()V

    .line 9
    .line 10
    .line 11
    iget v0, p0, Ll/gt2;->i:F

    .line 12
    .line 13
    iget v1, p0, Ll/gt2;->f:F

    .line 14
    .line 15
    cmpl-float v0, v0, v1

    .line 16
    .line 17
    const/high16 v1, 0x3f800000    # 1.0f

    .line 18
    .line 19
    if-ltz v0, :cond_0

    .line 20
    .line 21
    const/4 v0, 0x1

    .line 22
    iput-boolean v0, p0, Ll/gt2;->c:Z

    .line 23
    .line 24
    iget v0, p0, Ll/gt2;->j:F

    .line 25
    .line 26
    iget v2, p0, Ll/gt2;->k:F

    .line 27
    .line 28
    add-float/2addr v0, v2

    .line 29
    iput v0, p0, Ll/gt2;->j:F

    .line 30
    .line 31
    cmpl-float v0, v0, v1

    .line 32
    .line 33
    if-lez v0, :cond_1

    .line 34
    .line 35
    iput v1, p0, Ll/gt2;->j:F

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    const/4 v0, 0x0

    .line 39
    iput-boolean v0, p0, Ll/gt2;->c:Z

    .line 40
    .line 41
    :cond_1
    :goto_0
    iget v0, p0, Ll/gt2;->a:I

    .line 42
    .line 43
    iget-boolean v2, p0, Ll/gt2;->c:Z

    .line 44
    .line 45
    if-eqz v2, :cond_2

    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_2
    const/4 v1, 0x0

    .line 49
    :goto_1
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 50
    .line 51
    .line 52
    iget v0, p0, Ll/gt2;->b:I

    .line 53
    .line 54
    iget p0, p0, Ll/gt2;->j:F

    .line 55
    .line 56
    invoke-static {v0, p0}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public setBlendType(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/gt2;->e:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method
