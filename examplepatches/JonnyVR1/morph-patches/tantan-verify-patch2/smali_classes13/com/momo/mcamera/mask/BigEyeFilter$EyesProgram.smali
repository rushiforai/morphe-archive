.class Lcom/momo/mcamera/mask/BigEyeFilter$EyesProgram;
.super Lcom/momo/mcamera/mask/GLProgram;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/mcamera/mask/BigEyeFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "EyesProgram"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/momo/mcamera/mask/BigEyeFilter;


# direct methods
.method public constructor <init>(Lcom/momo/mcamera/mask/BigEyeFilter;II)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/BigEyeFilter$EyesProgram;->this$0:Lcom/momo/mcamera/mask/BigEyeFilter;

    .line 2
    .line 3
    invoke-direct {p0, p2, p3}, Lcom/momo/mcamera/mask/GLProgram;-><init>(II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getSubFrameShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision highp float;\nuniform sampler2D inputImageTexture0;\nvarying vec2 textureCoordinate0;\nuniform vec2 textureSize;\nuniform vec2 centerLeft;\nuniform vec2 centerRight;\nuniform float radiusLeft;\nuniform float radiusRight; \nuniform float scale;\nvoid main() {\n    vec2 textureCoordinate = textureCoordinate0  * textureSize;\n    float distanceLeft = distance(centerLeft, textureCoordinate);\n    if (distanceLeft < radiusLeft) {\n        vec2 offset = textureCoordinate - centerLeft;\n        float percent = 1.0 - ((radiusLeft - distanceLeft) / radiusLeft) * scale;\n        percent = percent * percent;\n        offset *= percent;\n        gl_FragColor = texture2D(inputImageTexture0, (centerLeft + offset)/textureSize);\n        return;\n    }\n    float distanceRight = distance(centerRight, textureCoordinate);\n    if (distanceRight < radiusRight) {\n        vec2 offset = textureCoordinate - centerRight;\n        float percent = 1.0 - ((radiusRight - distanceRight) / radiusRight) * scale;\n        percent = percent * percent;\n        offset *= percent;\n        gl_FragColor = texture2D(inputImageTexture0, (centerRight + offset)/textureSize);\n        return;\n    }\n    gl_FragColor = texture2D(inputImageTexture0, textureCoordinate0);\n}"

    .line 2
    .line 3
    return-object p0
.end method

.method public initShaderHandles()V
    .locals 3

    .line 1
    invoke-super {p0}, Lcom/momo/mcamera/mask/GLProgram;->initShaderHandles()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/momo/mcamera/mask/BigEyeFilter$EyesProgram;->this$0:Lcom/momo/mcamera/mask/BigEyeFilter;

    .line 5
    .line 6
    iget v1, p0, Lcom/momo/mcamera/mask/GLProgram;->programHandle:I

    .line 7
    .line 8
    const-string v2, "textureSize"

    .line 9
    .line 10
    invoke-static {v1, v2}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    iput v1, v0, Lcom/momo/mcamera/mask/BigEyeFilter;->handleTextureSize:I

    .line 15
    .line 16
    iget-object v0, p0, Lcom/momo/mcamera/mask/BigEyeFilter$EyesProgram;->this$0:Lcom/momo/mcamera/mask/BigEyeFilter;

    .line 17
    .line 18
    iget v1, p0, Lcom/momo/mcamera/mask/GLProgram;->programHandle:I

    .line 19
    .line 20
    const-string v2, "centerLeft"

    .line 21
    .line 22
    invoke-static {v1, v2}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    iput v1, v0, Lcom/momo/mcamera/mask/BigEyeFilter;->handleCenterLeft:I

    .line 27
    .line 28
    iget-object v0, p0, Lcom/momo/mcamera/mask/BigEyeFilter$EyesProgram;->this$0:Lcom/momo/mcamera/mask/BigEyeFilter;

    .line 29
    .line 30
    iget v1, p0, Lcom/momo/mcamera/mask/GLProgram;->programHandle:I

    .line 31
    .line 32
    const-string v2, "centerRight"

    .line 33
    .line 34
    invoke-static {v1, v2}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    iput v1, v0, Lcom/momo/mcamera/mask/BigEyeFilter;->handleCenterRight:I

    .line 39
    .line 40
    iget-object v0, p0, Lcom/momo/mcamera/mask/BigEyeFilter$EyesProgram;->this$0:Lcom/momo/mcamera/mask/BigEyeFilter;

    .line 41
    .line 42
    iget v1, p0, Lcom/momo/mcamera/mask/GLProgram;->programHandle:I

    .line 43
    .line 44
    const-string v2, "radiusLeft"

    .line 45
    .line 46
    invoke-static {v1, v2}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    iput v1, v0, Lcom/momo/mcamera/mask/BigEyeFilter;->handleRadiusLeft:I

    .line 51
    .line 52
    iget-object v0, p0, Lcom/momo/mcamera/mask/BigEyeFilter$EyesProgram;->this$0:Lcom/momo/mcamera/mask/BigEyeFilter;

    .line 53
    .line 54
    iget v1, p0, Lcom/momo/mcamera/mask/GLProgram;->programHandle:I

    .line 55
    .line 56
    const-string v2, "radiusRight"

    .line 57
    .line 58
    invoke-static {v1, v2}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    iput v1, v0, Lcom/momo/mcamera/mask/BigEyeFilter;->handleRadiuRight:I

    .line 63
    .line 64
    iget-object v0, p0, Lcom/momo/mcamera/mask/BigEyeFilter$EyesProgram;->this$0:Lcom/momo/mcamera/mask/BigEyeFilter;

    .line 65
    .line 66
    iget p0, p0, Lcom/momo/mcamera/mask/GLProgram;->programHandle:I

    .line 67
    .line 68
    const-string v1, "scale"

    .line 69
    .line 70
    invoke-static {p0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 71
    .line 72
    .line 73
    move-result p0

    .line 74
    iput p0, v0, Lcom/momo/mcamera/mask/BigEyeFilter;->handleScale:I

    .line 75
    .line 76
    return-void
.end method

.method public passShaderValues([[F[I)V
    .locals 4

    .line 1
    invoke-super {p0, p1, p2}, Lcom/momo/mcamera/mask/GLProgram;->passShaderValues([[F[I)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/momo/mcamera/mask/BigEyeFilter$EyesProgram;->this$0:Lcom/momo/mcamera/mask/BigEyeFilter;

    .line 5
    .line 6
    iget-object p2, p1, Lcom/momo/mcamera/mask/BigEyeFilter;->textureSize:[F

    .line 7
    .line 8
    iget v0, p0, Lcom/momo/mcamera/mask/GLProgram;->width:I

    .line 9
    .line 10
    int-to-float v0, v0

    .line 11
    const/4 v1, 0x0

    .line 12
    aput v0, p2, v1

    .line 13
    .line 14
    iget v2, p0, Lcom/momo/mcamera/mask/GLProgram;->height:I

    .line 15
    .line 16
    int-to-float v2, v2

    .line 17
    const/4 v3, 0x1

    .line 18
    aput v2, p2, v3

    .line 19
    .line 20
    iget p1, p1, Lcom/momo/mcamera/mask/BigEyeFilter;->handleTextureSize:I

    .line 21
    .line 22
    invoke-static {p1, v0, v2}, Landroid/opengl/GLES20;->glUniform2f(IFF)V

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Lcom/momo/mcamera/mask/BigEyeFilter$EyesProgram;->this$0:Lcom/momo/mcamera/mask/BigEyeFilter;

    .line 26
    .line 27
    iget p2, p1, Lcom/momo/mcamera/mask/BigEyeFilter;->handleCenterLeft:I

    .line 28
    .line 29
    iget-object p1, p1, Lcom/momo/mcamera/mask/BigEyeFilter;->centerLeft:[F

    .line 30
    .line 31
    aget v0, p1, v1

    .line 32
    .line 33
    aget p1, p1, v3

    .line 34
    .line 35
    invoke-static {p2, v0, p1}, Landroid/opengl/GLES20;->glUniform2f(IFF)V

    .line 36
    .line 37
    .line 38
    iget-object p1, p0, Lcom/momo/mcamera/mask/BigEyeFilter$EyesProgram;->this$0:Lcom/momo/mcamera/mask/BigEyeFilter;

    .line 39
    .line 40
    iget p2, p1, Lcom/momo/mcamera/mask/BigEyeFilter;->handleCenterRight:I

    .line 41
    .line 42
    iget-object p1, p1, Lcom/momo/mcamera/mask/BigEyeFilter;->centerRight:[F

    .line 43
    .line 44
    aget v0, p1, v1

    .line 45
    .line 46
    aget p1, p1, v3

    .line 47
    .line 48
    invoke-static {p2, v0, p1}, Landroid/opengl/GLES20;->glUniform2f(IFF)V

    .line 49
    .line 50
    .line 51
    iget-object p1, p0, Lcom/momo/mcamera/mask/BigEyeFilter$EyesProgram;->this$0:Lcom/momo/mcamera/mask/BigEyeFilter;

    .line 52
    .line 53
    iget p2, p1, Lcom/momo/mcamera/mask/BigEyeFilter;->handleRadiusLeft:I

    .line 54
    .line 55
    iget p1, p1, Lcom/momo/mcamera/mask/BigEyeFilter;->radiusLeft:F

    .line 56
    .line 57
    invoke-static {p2, p1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 58
    .line 59
    .line 60
    iget-object p1, p0, Lcom/momo/mcamera/mask/BigEyeFilter$EyesProgram;->this$0:Lcom/momo/mcamera/mask/BigEyeFilter;

    .line 61
    .line 62
    iget p2, p1, Lcom/momo/mcamera/mask/BigEyeFilter;->handleRadiuRight:I

    .line 63
    .line 64
    iget p1, p1, Lcom/momo/mcamera/mask/BigEyeFilter;->radiusRight:F

    .line 65
    .line 66
    invoke-static {p2, p1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 67
    .line 68
    .line 69
    iget-object p0, p0, Lcom/momo/mcamera/mask/BigEyeFilter$EyesProgram;->this$0:Lcom/momo/mcamera/mask/BigEyeFilter;

    .line 70
    .line 71
    iget p1, p0, Lcom/momo/mcamera/mask/BigEyeFilter;->handleScale:I

    .line 72
    .line 73
    invoke-static {p0}, Lcom/momo/mcamera/mask/BigEyeFilter;->access$000(Lcom/momo/mcamera/mask/BigEyeFilter;)F

    .line 74
    .line 75
    .line 76
    move-result p0

    .line 77
    invoke-static {p1, p0}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 78
    .line 79
    .line 80
    return-void
.end method
