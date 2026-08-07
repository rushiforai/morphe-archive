.class public Ll/qgm;
.super Ll/jt2;
.source "SourceFile"


# instance fields
.field private a:I

.field private b:I

.field private c:I

.field private d:I

.field private e:I

.field private f:I

.field private g:I

.field private i:I

.field private j:F

.field private k:I

.field private l:F

.field private m:F

.field private n:F

.field private o:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/jt2;-><init>()V

    .line 2
    .line 3
    .line 4
    const v0, 0x3ecccccd    # 0.4f

    .line 5
    .line 6
    .line 7
    iput v0, p0, Ll/qgm;->j:F

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    iput v0, p0, Ll/qgm;->k:I

    .line 11
    .line 12
    const v0, 0x3c449ba6    # 0.012f

    .line 13
    .line 14
    .line 15
    iput v0, p0, Ll/qgm;->l:F

    .line 16
    .line 17
    const v0, 0x3f99999a    # 1.2f

    .line 18
    .line 19
    .line 20
    iput v0, p0, Ll/qgm;->m:F

    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    iput v0, p0, Ll/qgm;->n:F

    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    iput-boolean v0, p0, Ll/qgm;->o:Z

    .line 27
    .line 28
    return-void
.end method


# virtual methods
.method public Q1(F)V
    .locals 0

    .line 1
    iput p1, p0, Ll/qgm;->n:F

    .line 2
    .line 3
    return-void
.end method

.method public R1(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/qgm;->o:Z

    .line 2
    .line 3
    return-void
.end method

.method public S1(F)V
    .locals 0

    .line 1
    iput p1, p0, Ll/qgm;->m:F

    .line 2
    .line 3
    return-void
.end method

.method public T1(F)V
    .locals 0

    .line 1
    iput p1, p0, Ll/qgm;->j:F

    .line 2
    .line 3
    return-void
.end method

.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision mediump float;\n\nvarying vec2 textureCoordinate;\nuniform sampler2D inputImageTexture0;\n\nuniform float heightInv;\nuniform float widthInv;\nuniform int width;\nuniform bool deblurEnabled;\nuniform float weight;\nuniform float threshold;\nuniform float saturation;\nuniform float contrast;\nconst vec3 luminanceWeighting = vec3(0.2125, 0.7154, 0.0721);\n\nvoid main() {\n    vec4 outColor;\n    vec4 origin = texture2D(inputImageTexture0, textureCoordinate);\n    outColor = origin;\n    if (deblurEnabled) {\n        vec4 imageH = origin\n            - (texture2D(inputImageTexture0, clamp(textureCoordinate+vec2(-widthInv,-heightInv),0.0,1.0))*0.08\n            +texture2D(inputImageTexture0, clamp(textureCoordinate+vec2(      0.0,-heightInv),0.0,1.0))*0.12\n            +texture2D(inputImageTexture0, clamp(textureCoordinate+vec2( widthInv,-heightInv),0.0,1.0))*0.08\n            +texture2D(inputImageTexture0, clamp(textureCoordinate+vec2(-widthInv,       0.0),0.0,1.0))*0.12\n            +texture2D(inputImageTexture0, clamp(textureCoordinate+vec2( widthInv,       0.0),0.0,1.0))*0.12\n            +texture2D(inputImageTexture0, clamp(textureCoordinate+vec2(-widthInv, heightInv),0.0,1.0))*0.08\n            +texture2D(inputImageTexture0, clamp(textureCoordinate+vec2(      0.0, heightInv),0.0,1.0))*0.12\n            +texture2D(inputImageTexture0, clamp(textureCoordinate+vec2( widthInv, heightInv),0.0,1.0))*0.08\n            +origin*0.2);\n        vec4 diff = abs(imageH);\n        float minVal = min(diff.r, min(diff.g, diff.b));\n        float temp = step(minVal, threshold);\n        vec4 imageM = temp * origin + ((1.0 - temp) * clamp(origin + imageH * weight, 0.0, 1.0));\n        outColor = imageM;\n\n        if (saturation > 0.0) {\n            float luminance = dot(imageM.rgb,luminanceWeighting);\n            vec3 greyScaleColor = vec3(luminance);\n            vec4 imageS=vec4(mix(greyScaleColor,imageM.rgb,saturation), imageM.a);\n            outColor = imageS;\n        }\n        if (contrast > 0.0) {            outColor = vec4(((outColor.rgb - vec3(0.5)) * contrast + vec3(0.5)), outColor.a);\n        }\n    }\n    gl_FragColor = outColor;\n}\n"

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
    const-string v1, "widthInv"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Ll/qgm;->a:I

    .line 13
    .line 14
    iget v0, p0, Ll/wej;->programHandle:I

    .line 15
    .line 16
    const-string v1, "HeightInv"

    .line 17
    .line 18
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Ll/qgm;->b:I

    .line 23
    .line 24
    iget v0, p0, Ll/wej;->programHandle:I

    .line 25
    .line 26
    const-string v1, "width"

    .line 27
    .line 28
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iput v0, p0, Ll/qgm;->c:I

    .line 33
    .line 34
    iget v0, p0, Ll/wej;->programHandle:I

    .line 35
    .line 36
    const-string v1, "weight"

    .line 37
    .line 38
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    iput v0, p0, Ll/qgm;->d:I

    .line 43
    .line 44
    iget v0, p0, Ll/wej;->programHandle:I

    .line 45
    .line 46
    const-string v1, "threshold"

    .line 47
    .line 48
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    iput v0, p0, Ll/qgm;->i:I

    .line 53
    .line 54
    iget v0, p0, Ll/wej;->programHandle:I

    .line 55
    .line 56
    const-string v1, "saturation"

    .line 57
    .line 58
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    iput v0, p0, Ll/qgm;->f:I

    .line 63
    .line 64
    iget v0, p0, Ll/wej;->programHandle:I

    .line 65
    .line 66
    const-string v1, "contrast"

    .line 67
    .line 68
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    iput v0, p0, Ll/qgm;->g:I

    .line 73
    .line 74
    iget v0, p0, Ll/wej;->programHandle:I

    .line 75
    .line 76
    const-string v1, "deblurEnabled"

    .line 77
    .line 78
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    iput v0, p0, Ll/qgm;->e:I

    .line 83
    .line 84
    return-void
.end method

.method public passShaderValues()V
    .locals 3

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
    int-to-float v0, v0

    .line 9
    const/high16 v1, 0x3f800000    # 1.0f

    .line 10
    .line 11
    div-float v0, v1, v0

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    int-to-float v2, v2

    .line 18
    div-float/2addr v1, v2

    .line 19
    iget v2, p0, Ll/qgm;->a:I

    .line 20
    .line 21
    invoke-static {v2, v0}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 22
    .line 23
    .line 24
    iget v0, p0, Ll/qgm;->b:I

    .line 25
    .line 26
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 27
    .line 28
    .line 29
    iget v0, p0, Ll/qgm;->c:I

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 36
    .line 37
    .line 38
    iget v0, p0, Ll/qgm;->d:I

    .line 39
    .line 40
    iget v1, p0, Ll/qgm;->j:F

    .line 41
    .line 42
    const/high16 v2, 0x40400000    # 3.0f

    .line 43
    .line 44
    mul-float/2addr v1, v2

    .line 45
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 46
    .line 47
    .line 48
    iget v0, p0, Ll/qgm;->i:I

    .line 49
    .line 50
    iget v1, p0, Ll/qgm;->l:F

    .line 51
    .line 52
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 53
    .line 54
    .line 55
    iget v0, p0, Ll/qgm;->f:I

    .line 56
    .line 57
    iget v1, p0, Ll/qgm;->m:F

    .line 58
    .line 59
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 60
    .line 61
    .line 62
    iget v0, p0, Ll/qgm;->g:I

    .line 63
    .line 64
    iget v1, p0, Ll/qgm;->n:F

    .line 65
    .line 66
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 67
    .line 68
    .line 69
    iget v0, p0, Ll/qgm;->e:I

    .line 70
    .line 71
    iget-boolean p0, p0, Ll/qgm;->o:Z

    .line 72
    .line 73
    invoke-static {v0, p0}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 74
    .line 75
    .line 76
    return-void
.end method
