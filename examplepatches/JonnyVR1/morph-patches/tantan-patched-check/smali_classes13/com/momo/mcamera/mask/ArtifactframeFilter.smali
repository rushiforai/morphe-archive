.class public Lcom/momo/mcamera/mask/ArtifactframeFilter;
.super Lcom/momo/mcamera/mask/TriggerBlendFilter;
.source "SourceFile"


# static fields
.field private static final UNIFORM_HORD:Ljava/lang/String; = "horizontalDisplacementComponent"

.field private static final UNIFORM_MAXH:Ljava/lang/String; = "maximumHorizontalDisplacement"

.field private static final UNIFORM_MAXV:Ljava/lang/String; = "maximumVerticalDisplacement"

.field private static final UNIFORM_TEXH:Ljava/lang/String; = "textureHeight"

.field private static final UNIFORM_TEXW:Ljava/lang/String; = "textureWidth"

.field private static final UNIFORM_VERD:Ljava/lang/String; = "verticalDisplacementComponent"


# instance fields
.field private hordHandler:I

.field private maxHHandler:I

.field private maxHfault:F

.field private maxVHandler:I

.field private maxVfault:F

.field private texhHandler:I

.field private texwHandler:I

.field private verdHandler:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/momo/mcamera/mask/TriggerBlendFilter;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/momo/mcamera/mask/ArtifactframeFilter;->maxHfault:F

    .line 6
    .line 7
    iput v0, p0, Lcom/momo/mcamera/mask/ArtifactframeFilter;->maxVfault:F

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision highp float;\nvarying highp vec2 textureCoordinate;\nuniform sampler2D inputImageTexture0;\nuniform sampler2D inputImageTexture1;\nuniform float maximumHorizontalDisplacement;\nuniform float maximumVerticalDisplacement;\nuniform int horizontalDisplacementComponent;\nuniform int verticalDisplacementComponent;\nuniform float textureWidth;\nuniform float textureHeight;\nvoid main() {\n    vec4 displacement = texture2D(inputImageTexture1,textureCoordinate);\n    float h = displacement.x ; \n    float v = displacement.x ;\n    float hOffset = (h - 0.5) * 2.0 * maximumHorizontalDisplacement;\n    float vOffset = (v -0.5) * 2.0 * maximumVerticalDisplacement;\n    vec2 textureSize = vec2(textureWidth, textureHeight);\n    const int count = 8;\n    vec2 subSampleOffsets[count];\n    subSampleOffsets[0] = vec2( 0.0625, -0.1875);\n    subSampleOffsets[1] = vec2(-0.0625,  0.1875);\n    subSampleOffsets[2] = vec2( 0.3125,  0.0625);\n    subSampleOffsets[3] = vec2(-0.1875, -0.3125);\n    subSampleOffsets[4] = vec2(-0.3125,  0.3125);\n    subSampleOffsets[5] = vec2(-0.4375, -0.0625);\n    subSampleOffsets[6] = vec2( 0.1875,  0.4375);\n    subSampleOffsets[7] = vec2( 0.4375, -0.4375);\n    vec2 textureCoordinates[count];\n    for (int i = 0; i < count; i += 1) {\n        textureCoordinates[i] = textureCoordinate + subSampleOffsets[i]/textureSize;\n    }\n    vec4 color = vec4(0.0, 0.0, 0.0, 0.0);\n    float count1 = float(count); vec4 origin;\n    for (int i = 0; i < count; i += 1) {\n       origin   = texture2D(inputImageTexture0, textureCoordinates[i] + vec2(hOffset, vOffset));\n       color += origin/count1;\n    }\n    gl_FragColor =  color;\n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public initShaderHandles()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/momo/mcamera/mask/TriggerBlendFilter;->initShaderHandles()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/wej;->programHandle:I

    .line 5
    .line 6
    const-string v1, "maximumHorizontalDisplacement"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Lcom/momo/mcamera/mask/ArtifactframeFilter;->maxHHandler:I

    .line 13
    .line 14
    iget v0, p0, Ll/wej;->programHandle:I

    .line 15
    .line 16
    const-string v1, "maximumVerticalDisplacement"

    .line 17
    .line 18
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Lcom/momo/mcamera/mask/ArtifactframeFilter;->maxVHandler:I

    .line 23
    .line 24
    iget v0, p0, Ll/wej;->programHandle:I

    .line 25
    .line 26
    const-string v1, "horizontalDisplacementComponent"

    .line 27
    .line 28
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iput v0, p0, Lcom/momo/mcamera/mask/ArtifactframeFilter;->hordHandler:I

    .line 33
    .line 34
    iget v0, p0, Ll/wej;->programHandle:I

    .line 35
    .line 36
    const-string v1, "verticalDisplacementComponent"

    .line 37
    .line 38
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    iput v0, p0, Lcom/momo/mcamera/mask/ArtifactframeFilter;->verdHandler:I

    .line 43
    .line 44
    iget v0, p0, Ll/wej;->programHandle:I

    .line 45
    .line 46
    const-string v1, "textureWidth"

    .line 47
    .line 48
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    iput v0, p0, Lcom/momo/mcamera/mask/ArtifactframeFilter;->texwHandler:I

    .line 53
    .line 54
    iget v0, p0, Ll/wej;->programHandle:I

    .line 55
    .line 56
    const-string v1, "textureHeight"

    .line 57
    .line 58
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    iput v0, p0, Lcom/momo/mcamera/mask/ArtifactframeFilter;->texhHandler:I

    .line 63
    .line 64
    return-void
.end method

.method public passShaderValues()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/momo/mcamera/mask/TriggerBlendFilter;->passShaderValues()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/momo/mcamera/mask/ArtifactframeFilter;->maxHHandler:I

    .line 5
    .line 6
    iget v1, p0, Lcom/momo/mcamera/mask/ArtifactframeFilter;->maxHfault:F

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 9
    .line 10
    .line 11
    iget v0, p0, Lcom/momo/mcamera/mask/ArtifactframeFilter;->maxVHandler:I

    .line 12
    .line 13
    iget v1, p0, Lcom/momo/mcamera/mask/ArtifactframeFilter;->maxVfault:F

    .line 14
    .line 15
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 16
    .line 17
    .line 18
    iget v0, p0, Lcom/momo/mcamera/mask/ArtifactframeFilter;->hordHandler:I

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 22
    .line 23
    .line 24
    iget v0, p0, Lcom/momo/mcamera/mask/ArtifactframeFilter;->verdHandler:I

    .line 25
    .line 26
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 27
    .line 28
    .line 29
    iget v0, p0, Lcom/momo/mcamera/mask/ArtifactframeFilter;->texwHandler:I

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    int-to-float v1, v1

    .line 36
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 37
    .line 38
    .line 39
    iget v0, p0, Lcom/momo/mcamera/mask/ArtifactframeFilter;->texhHandler:I

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    int-to-float p0, p0

    .line 46
    invoke-static {v0, p0}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public setFaultInfo(FF)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/ArtifactframeFilter;->maxHfault:F

    .line 2
    .line 3
    iput p2, p0, Lcom/momo/mcamera/mask/ArtifactframeFilter;->maxVfault:F

    .line 4
    .line 5
    return-void
.end method
