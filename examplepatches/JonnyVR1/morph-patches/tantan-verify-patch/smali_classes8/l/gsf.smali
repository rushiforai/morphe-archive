.class public Ll/gsf;
.super Ll/jt2;
.source "SourceFile"


# instance fields
.field private a:I

.field private b:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/jt2;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision highp float;\nuniform sampler2D inputImageTexture0;\nvarying vec2 textureCoordinate;\nuniform float width;\nuniform float height;\nconst float PI = 3.1415926535;\n\nvoid main(){\n    vec2 uv = textureCoordinate;\n    float aspectRatio = height/width;\n    float aperture = 178.0;\n    float apertureHalf = 0.5 * aperture * (PI / 180.0);\n    float maxFactor = sin(apertureHalf);    vec2 xy = 1.5 * uv * vec2(1.0,aspectRatio) - 0.75*vec2(1.0,aspectRatio);\n    float d = length(xy);\n    if (d < (2.0-maxFactor))\n    {\n      d = length(xy * maxFactor);\n      float z = sqrt(1.0 - d * d);\n      float r = atan(d, z) / PI;\n      float phi = atan(xy.y, xy.x);\n      \n      uv.x = 1.5*r * cos(phi) + 0.5;\n      uv.y = r * sin(phi) + 0.5;\n    gl_FragColor = texture2D(inputImageTexture0, uv); \n    } else {\n    gl_FragColor = vec4(0.0, 0.0, 0.0, 1);    }\n}"

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
    const-string v1, "width"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Ll/gsf;->a:I

    .line 13
    .line 14
    iget v0, p0, Ll/wej;->programHandle:I

    .line 15
    .line 16
    const-string v1, "height"

    .line 17
    .line 18
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Ll/gsf;->b:I

    .line 23
    .line 24
    return-void
.end method

.method public passShaderValues()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/wej;->passShaderValues()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget v0, p0, Ll/gsf;->a:I

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    int-to-float v1, v1

    .line 23
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 24
    .line 25
    .line 26
    iget v0, p0, Ll/gsf;->b:I

    .line 27
    .line 28
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    int-to-float p0, p0

    .line 33
    invoke-static {v0, p0}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method
