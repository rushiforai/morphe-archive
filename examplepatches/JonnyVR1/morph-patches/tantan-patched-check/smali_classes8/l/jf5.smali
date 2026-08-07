.class public Ll/jf5;
.super Ll/jt2;
.source "SourceFile"


# instance fields
.field private a:[F

.field private b:F

.field private c:I

.field private d:I


# direct methods
.method public constructor <init>([FF)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/jt2;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/jf5;->a:[F

    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    cmpg-float v0, p2, p1

    .line 8
    .line 9
    if-gez v0, :cond_0

    .line 10
    .line 11
    move p2, p1

    .line 12
    :cond_0
    const/high16 p1, 0x3f800000    # 1.0f

    .line 13
    .line 14
    cmpl-float v0, p2, p1

    .line 15
    .line 16
    if-lez v0, :cond_1

    .line 17
    .line 18
    move p2, p1

    .line 19
    :cond_1
    iput p2, p0, Ll/jf5;->b:F

    .line 20
    .line 21
    return-void
.end method


# virtual methods
.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision mediump float;\nuniform sampler2D inputImageTexture0;\nvarying vec2 textureCoordinate;\nuniform float u_Intensity;\nuniform mat4 u_ColorMatrix;\nvoid main(){\n   vec4 color = texture2D(inputImageTexture0,textureCoordinate);\n   vec4 matrixResult = vec4(color.rgb, 1.0) * u_ColorMatrix;\n   vec4 colorResult = u_Intensity * matrixResult + (1.0 - u_Intensity) * color;\n   gl_FragColor = vec4(colorResult.rgb, color.a);\n}\n"

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
    const-string v1, "u_ColorMatrix"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Ll/jf5;->c:I

    .line 13
    .line 14
    iget v0, p0, Ll/wej;->programHandle:I

    .line 15
    .line 16
    const-string v1, "u_Intensity"

    .line 17
    .line 18
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Ll/jf5;->d:I

    .line 23
    .line 24
    return-void
.end method

.method public passShaderValues()V
    .locals 4

    .line 1
    invoke-super {p0}, Ll/wej;->passShaderValues()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/jf5;->c:I

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    iget-object v2, p0, Ll/jf5;->a:[F

    .line 8
    .line 9
    const/4 v3, 0x1

    .line 10
    invoke-static {v0, v3, v1, v2, v1}, Landroid/opengl/GLES20;->glUniformMatrix4fv(IIZ[FI)V

    .line 11
    .line 12
    .line 13
    iget v0, p0, Ll/jf5;->d:I

    .line 14
    .line 15
    iget p0, p0, Ll/jf5;->b:F

    .line 16
    .line 17
    invoke-static {v0, p0}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 18
    .line 19
    .line 20
    return-void
.end method
