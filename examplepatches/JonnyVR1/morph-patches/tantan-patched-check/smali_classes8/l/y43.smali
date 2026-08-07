.class public Ll/y43;
.super Ll/jt2;
.source "SourceFile"


# instance fields
.field final a:Ljava/lang/String;

.field b:I

.field c:[F

.field d:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ll/jt2;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "direction"

    .line 5
    .line 6
    iput-object v0, p0, Ll/y43;->a:Ljava/lang/String;

    .line 7
    .line 8
    const/4 v0, 0x2

    .line 9
    new-array v0, v0, [F

    .line 10
    .line 11
    iput-object v0, p0, Ll/y43;->c:[F

    .line 12
    .line 13
    const-string v1, "precision highp float;\nuniform vec2 direction;\nuniform sampler2D inputImageTexture0;\nvarying vec2 textureCoordinate;\nvec3 sum = vec3(0.0);\nvec2 texcoord;\nvoid main(){ \ntexcoord = textureCoordinate + vec2(-4.0, -4.0) * direction;\nsum += texture2D(inputImageTexture0, texcoord).rgb*0.002690;\ntexcoord = textureCoordinate + vec2(-3.0, -3.0) * direction;\nsum += texture2D(inputImageTexture0, texcoord).rgb*0.021400;\ntexcoord = textureCoordinate + vec2(-2.0, -2.0) * direction;\nsum += texture2D(inputImageTexture0, texcoord).rgb*0.093900;\ntexcoord = textureCoordinate + vec2(-1.0, -1.0) * direction;\nsum += texture2D(inputImageTexture0, texcoord).rgb*0.228;\ntexcoord = textureCoordinate + vec2(1.0, 1.0) * direction;\nsum += texture2D(inputImageTexture0, texcoord).rgb*0.228000;\ntexcoord = textureCoordinate + vec2(2.0, 2.0) * direction;\nsum += texture2D(inputImageTexture0, texcoord).rgb*0.093900;\ntexcoord = textureCoordinate + vec2(3.0, 3.0) * direction;\nsum += texture2D(inputImageTexture0, texcoord).rgb*0.021400;\ntexcoord = textureCoordinate + vec2(4.0, 4.0) * direction;\nsum += texture2D(inputImageTexture0, texcoord).rgb*0.002690;\nsum += texture2D(inputImageTexture0, textureCoordinate).rgb*0.306870;\ngl_FragColor = vec4(sum, 1.0);}"

    .line 14
    .line 15
    iput-object v1, p0, Ll/y43;->d:Ljava/lang/String;

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    const/high16 v2, 0x3f800000    # 1.0f

    .line 19
    .line 20
    aput v2, v0, v1

    .line 21
    .line 22
    const/4 v1, 0x1

    .line 23
    aput v2, v0, v1

    .line 24
    .line 25
    invoke-virtual {p0, v1}, Ll/gfj;->setFloatTexture(Z)V

    .line 26
    .line 27
    .line 28
    return-void
.end method


# virtual methods
.method public Q1(FF)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/y43;->c:[F

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
    return-void
.end method

.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y43;->d:Ljava/lang/String;

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
    const-string v1, "direction"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Ll/y43;->b:I

    .line 13
    .line 14
    return-void
.end method

.method public newTextureReady(ILl/gfj;Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/jt2;->newTextureReady(ILl/gfj;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public passShaderValues()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/wej;->passShaderValues()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/y43;->b:I

    .line 5
    .line 6
    iget-object p0, p0, Ll/y43;->c:[F

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    aget v1, p0, v1

    .line 10
    .line 11
    const/4 v2, 0x1

    .line 12
    aget p0, p0, v2

    .line 13
    .line 14
    invoke-static {v0, v1, p0}, Landroid/opengl/GLES20;->glUniform2f(IFF)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
