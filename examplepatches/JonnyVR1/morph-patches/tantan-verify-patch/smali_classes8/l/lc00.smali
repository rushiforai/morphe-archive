.class public Ll/lc00;
.super Ll/hs10;
.source "SourceFile"


# instance fields
.field a:I

.field b:I

.field c:I

.field d:[F

.field e:[F

.field f:[F

.field g:Ljava/lang/String;

.field i:Ljava/lang/String;


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
    const/4 v0, 0x3

    .line 6
    new-array v1, v0, [F

    .line 7
    .line 8
    iput-object v1, p0, Ll/lc00;->d:[F

    .line 9
    .line 10
    new-array v1, v0, [F

    .line 11
    .line 12
    iput-object v1, p0, Ll/lc00;->e:[F

    .line 13
    .line 14
    new-array v0, v0, [F

    .line 15
    .line 16
    iput-object v0, p0, Ll/lc00;->f:[F

    .line 17
    .line 18
    const-string v0, "precision highp float;\nvarying vec2 textureCoordinate;\nuniform sampler2D inputImageTexture0;//\u539f\u56fe\nuniform sampler2D inputImageTexture1;//\u661f\u661f\nuniform vec3 uCOLOR;\nuniform vec3 uTONE;\nuniform vec3 uFX;\nconst vec3 LumCoeff = vec3(0.2125, 0.7154, 0.0721);\nconst vec3 AvgLumin = vec3(0.5, 0.5, 0.5);\nvoid main(){ \n    vec3 col2; \n    vec3 col = texture2D(inputImageTexture0, textureCoordinate).rgb; \n    col2 = col * uTONE.y; \n\n    if(uFX.z>0.0) col+=(col-col2)*uFX.z; \n    if(uFX.x>0.0) col = 1.0 - (1.0 - col2*uFX.x) * (1.0 - col); \n\n    col2 = col * uTONE.y; \n    col = pow(mix(AvgLumin, mix(vec3(dot(col2, LumCoeff)), col2, uTONE.x), uTONE.z),uCOLOR); //uTone.x \u8c03\u8282\u9971\u548c\u5ea6\uff0c0\u9971\u548c\u5ea6\u6700\u4f4e\uff0c1\u9971\u548c\u5ea6\u6700\u9ad8\u3002 uTone.z \u8c03\u8282\u5bf9\u6bd4\u5ea6\uff0c0\u5bf9\u6bd4\u5ea6\u6700\u4f4e\uff0c1\u5bf9\u6bd4\u5ea6\u6700\u9ad8\n\n    col = clamp(col,0.0,1.0); \n\n    col += texture2D(inputImageTexture1, textureCoordinate).rgb; \n\n    if(uFX.y>0.0) col*=pow(1.0 - length(0.5 - textureCoordinate) / length(vec2(0.5)),uFX.y); \n\n    gl_FragColor = vec4(col, 1.0); \n}"

    .line 19
    .line 20
    iput-object v0, p0, Ll/lc00;->g:Ljava/lang/String;

    .line 21
    .line 22
    const-string v0, "precision highp float;\nvarying vec2 TexCoord;\nuniform sampler2D sceneTex;//\u539f\u56fe\nuniform sampler2D blurTex;//\u661f\u661f\nuniform sampler2D softTex;//\u539f\u56fe\u7684\u6a21\u7cca\u56fe\nuniform vec3 uCOLOR;\nuniform vec3 uTONE;\nuniform vec3 uFX;\nconst vec3 LumCoeff = vec3(0.2125, 0.7154, 0.0721);\nconst vec3 AvgLumin = vec3(0.5, 0.5, 0.5);\nvoid main(){ \n    vec3 col2; \n    vec3 col = texture2D(sceneTex, TexCoord).rgb; \n    col2 = texture2D(softTex, TexCoord).rgb; \n\n    if(uFX.z>0.0) col+=(col-col2)*uFX.z; \n    if(uFX.x>0.0) col = 1.0 - (1.0 - col2*uFX.x) * (1.0 - col); \n\n    col2 = col * uTONE.y; \n    col = pow(mix(AvgLumin, mix(vec3(dot(col2, LumCoeff)), col2, uTONE.x), uTONE.z),uCOLOR); //uTone.x \u8c03\u8282\u9971\u548c\u5ea6\uff0c0\u9971\u548c\u5ea6\u6700\u4f4e\uff0c1\u9971\u548c\u5ea6\u6700\u9ad8\u3002 uTone.z \u8c03\u8282\u5bf9\u6bd4\u5ea6\uff0c0\u5bf9\u6bd4\u5ea6\u6700\u4f4e\uff0c1\u5bf9\u6bd4\u5ea6\u6700\u9ad8\n\n    col = clamp(col,0.0,1.0); \n\n    col += texture2D(blurTex, TexCoord).rgb; \n\n    if(uFX.y>0.0) col*=pow(1.0 - length(0.5 - TexCoord) / length(vec2(0.5)),uFX.y); \n\n    gl_FragColor = vec4(col, 1.0); \n}"

    .line 23
    .line 24
    iput-object v0, p0, Ll/lc00;->i:Ljava/lang/String;

    .line 25
    .line 26
    const/4 v0, 0x1

    .line 27
    invoke-virtual {p0, v0}, Ll/gfj;->setFloatTexture(Z)V

    .line 28
    .line 29
    .line 30
    return-void
.end method


# virtual methods
.method public Q1(FFF)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/lc00;->d:[F

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    aput p1, p0, v0

    .line 5
    .line 6
    const/4 p1, 0x1

    .line 7
    aput p2, p0, p1

    .line 8
    .line 9
    const/4 p1, 0x2

    .line 10
    aput p3, p0, p1

    .line 11
    .line 12
    return-void
.end method

.method public R1(FFF)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/lc00;->f:[F

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    aput p1, p0, v0

    .line 5
    .line 6
    const/4 p1, 0x1

    .line 7
    aput p2, p0, p1

    .line 8
    .line 9
    const/4 p1, 0x2

    .line 10
    aput p3, p0, p1

    .line 11
    .line 12
    return-void
.end method

.method public S1(FFF)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/lc00;->e:[F

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    aput p1, p0, v0

    .line 5
    .line 6
    const/4 p1, 0x1

    .line 7
    aput p2, p0, p1

    .line 8
    .line 9
    const/4 p1, 0x2

    .line 10
    aput p3, p0, p1

    .line 11
    .line 12
    return-void
.end method

.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lc00;->g:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public initWithGLContext()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/wej;->initWithGLContext()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/wej;->programHandle:I

    .line 5
    .line 6
    const-string v1, "uCOLOR"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Ll/lc00;->a:I

    .line 13
    .line 14
    iget v0, p0, Ll/wej;->programHandle:I

    .line 15
    .line 16
    const-string v1, "uTONE"

    .line 17
    .line 18
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Ll/lc00;->b:I

    .line 23
    .line 24
    iget v0, p0, Ll/wej;->programHandle:I

    .line 25
    .line 26
    const-string v1, "uFX"

    .line 27
    .line 28
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iput v0, p0, Ll/lc00;->c:I

    .line 33
    .line 34
    return-void
.end method

.method public passShaderValues()V
    .locals 7

    .line 1
    invoke-super {p0}, Ll/hs10;->passShaderValues()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/lc00;->a:I

    .line 5
    .line 6
    iget-object v1, p0, Ll/lc00;->d:[F

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    aget v3, v1, v2

    .line 10
    .line 11
    const/4 v4, 0x1

    .line 12
    aget v5, v1, v4

    .line 13
    .line 14
    const/4 v6, 0x2

    .line 15
    aget v1, v1, v6

    .line 16
    .line 17
    invoke-static {v0, v3, v5, v1}, Landroid/opengl/GLES20;->glUniform3f(IFFF)V

    .line 18
    .line 19
    .line 20
    iget v0, p0, Ll/lc00;->b:I

    .line 21
    .line 22
    iget-object v1, p0, Ll/lc00;->e:[F

    .line 23
    .line 24
    aget v3, v1, v2

    .line 25
    .line 26
    aget v5, v1, v4

    .line 27
    .line 28
    aget v1, v1, v6

    .line 29
    .line 30
    invoke-static {v0, v3, v5, v1}, Landroid/opengl/GLES20;->glUniform3f(IFFF)V

    .line 31
    .line 32
    .line 33
    iget v0, p0, Ll/lc00;->c:I

    .line 34
    .line 35
    iget-object p0, p0, Ll/lc00;->f:[F

    .line 36
    .line 37
    aget v1, p0, v2

    .line 38
    .line 39
    aget v2, p0, v4

    .line 40
    .line 41
    aget p0, p0, v6

    .line 42
    .line 43
    invoke-static {v0, v1, v2, p0}, Landroid/opengl/GLES20;->glUniform3f(IFFF)V

    .line 44
    .line 45
    .line 46
    return-void
.end method
