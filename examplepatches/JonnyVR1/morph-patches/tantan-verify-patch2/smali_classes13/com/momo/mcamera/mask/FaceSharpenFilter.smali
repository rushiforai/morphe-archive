.class public Lcom/momo/mcamera/mask/FaceSharpenFilter;
.super Lcom/momo/mcamera/mask/FaceDetectFilter;
.source "SourceFile"


# instance fields
.field private highSkinYUVThreshold:[I

.field private highSkinYUVThresholdHandle:I

.field private lowSkinYUVThreshold:[I

.field private lowSkinYUVThresholdHandle:I

.field private sharpenScaleHandle:I

.field private sharpenScaleValue:F


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/momo/mcamera/mask/FaceDetectFilter;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/momo/mcamera/mask/FaceSharpenFilter;->sharpenScaleValue:F

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    filled-new-array {v0, v0, v0}, [I

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    iput-object v1, p0, Lcom/momo/mcamera/mask/FaceSharpenFilter;->lowSkinYUVThreshold:[I

    .line 13
    .line 14
    filled-new-array {v0, v0, v0}, [I

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iput-object v0, p0, Lcom/momo/mcamera/mask/FaceSharpenFilter;->highSkinYUVThreshold:[I

    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public cancelDraw()V
    .locals 0

    return-void
.end method

.method public clearPoints()V
    .locals 0

    return-void
.end method

.method public drawSub()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/gfj;->drawSub()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision highp float;\nvarying highp vec2 textureCoordinate;\nvarying highp vec2 leftTextureCoordinate;\nvarying highp vec2 rightTextureCoordinate;\nvarying highp vec2 topTextureCoordinate;\nvarying highp vec2 bottomTextureCoordinate;\nvarying float sharpnessVary;\nvarying highp float centerMultiplier;\nvarying highp float edgeMultiplier;\nuniform sampler2D inputImageTexture0;\nuniform vec3 lowSkinYUVThreshold;\nuniform vec3 highSkinYUVThreshold;\nvoid main()\n{\n    mediump vec3 textureColor = texture2D(inputImageTexture0, textureCoordinate).rgb;\n    mediump vec3 leftTextureColor = texture2D(inputImageTexture0, leftTextureCoordinate).rgb;\n    mediump vec3 rightTextureColor = texture2D(inputImageTexture0, rightTextureCoordinate).rgb;\n    mediump vec3 topTextureColor = texture2D(inputImageTexture0, topTextureCoordinate).rgb;\n    mediump vec3 bottomTextureColor = texture2D(inputImageTexture0, bottomTextureCoordinate).rgb;\n    float u_low = lowSkinYUVThreshold.y/256.;\n    float v_low = lowSkinYUVThreshold.z/256.;\n    float u_height = highSkinYUVThreshold.y/256.;\n    float v_height = highSkinYUVThreshold.z/256.;\n    vec4 sourceColorVec4 = texture2D(inputImageTexture0, textureCoordinate);\n    if (sharpnessVary < 0.001){\n         gl_FragColor = sourceColorVec4;\n         return;}\n    float m_r = sourceColorVec4.r;\n    float m_g = sourceColorVec4.g;\n    float m_b = sourceColorVec4.b;\n    float m_max = max(m_r, max(m_g, m_b));\n    float m_min = min(m_r, min(m_g, m_b));\n    float u = -0.1687*m_r - 0.3313*m_g + 0.5*m_b + 128./256.;\n    float v = 0.5*m_r - 0.4187*m_g - 0.0813*m_b + 128./256.;\n    if(( u_low<u && u<u_height && v_low<v && v<v_height && m_r>m_g && m_r > m_b  && m_max - m_min > 15./256. && abs(m_r - m_g)>15./256. )) {\n         gl_FragColor = vec4((textureColor * centerMultiplier - (leftTextureColor * edgeMultiplier + rightTextureColor * edgeMultiplier + topTextureColor * edgeMultiplier + bottomTextureColor * edgeMultiplier)), texture2D(inputImageTexture0,  bottomTextureCoordinate).w);\n   }\n    else\n        gl_FragColor = sourceColorVec4;\n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public getSkinSmoothScale()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/FaceSharpenFilter;->sharpenScaleValue:F

    .line 2
    .line 3
    return p0
.end method

.method public getVertexShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision highp float;\nattribute vec4  position;\nattribute vec2 inputTextureCoordinate;\nfloat imageWidthFactor = 1./480.;\nfloat imageHeightFactor = 1./640.;\nuniform float sharpness;\nvarying vec2 textureCoordinate;\nvarying vec2 leftTextureCoordinate;\nvarying vec2 rightTextureCoordinate;\nvarying vec2 topTextureCoordinate;\nvarying vec2 bottomTextureCoordinate;\nvarying float centerMultiplier;\nvarying float edgeMultiplier;\nvarying float sharpnessVary;\nvoid main() {\nsharpnessVary = sharpness;\ngl_Position = position;\nvec2 widthStep = vec2(imageWidthFactor, 0.0);\nvec2 heightStep = vec2(0.0, imageHeightFactor);\ntextureCoordinate = inputTextureCoordinate;\nleftTextureCoordinate = inputTextureCoordinate - widthStep;\nrightTextureCoordinate = inputTextureCoordinate + widthStep;\ntopTextureCoordinate = inputTextureCoordinate + heightStep;\nbottomTextureCoordinate = inputTextureCoordinate - heightStep;\ncenterMultiplier = 1.0 + 4.0 * sharpnessVary;\nedgeMultiplier = sharpnessVary;\n}\n"

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
    const-string v1, "sharpness"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Lcom/momo/mcamera/mask/FaceSharpenFilter;->sharpenScaleHandle:I

    .line 13
    .line 14
    iget v0, p0, Ll/wej;->programHandle:I

    .line 15
    .line 16
    const-string v1, "lowSkinYUVThreshold"

    .line 17
    .line 18
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Lcom/momo/mcamera/mask/FaceSharpenFilter;->lowSkinYUVThresholdHandle:I

    .line 23
    .line 24
    iget v0, p0, Ll/wej;->programHandle:I

    .line 25
    .line 26
    const-string v1, "highSkinYUVThreshold"

    .line 27
    .line 28
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iput v0, p0, Lcom/momo/mcamera/mask/FaceSharpenFilter;->highSkinYUVThresholdHandle:I

    .line 33
    .line 34
    return-void
.end method

.method public passShaderValues()V
    .locals 7

    .line 1
    invoke-super {p0}, Ll/wej;->passShaderValues()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/momo/mcamera/mask/FaceSharpenFilter;->sharpenScaleHandle:I

    .line 5
    .line 6
    iget v1, p0, Lcom/momo/mcamera/mask/FaceSharpenFilter;->sharpenScaleValue:F

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 9
    .line 10
    .line 11
    iget v0, p0, Lcom/momo/mcamera/mask/FaceSharpenFilter;->lowSkinYUVThresholdHandle:I

    .line 12
    .line 13
    iget-object v1, p0, Lcom/momo/mcamera/mask/FaceSharpenFilter;->lowSkinYUVThreshold:[I

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    aget v3, v1, v2

    .line 17
    .line 18
    int-to-float v3, v3

    .line 19
    const/4 v4, 0x1

    .line 20
    aget v5, v1, v4

    .line 21
    .line 22
    int-to-float v5, v5

    .line 23
    const/4 v6, 0x2

    .line 24
    aget v1, v1, v6

    .line 25
    .line 26
    int-to-float v1, v1

    .line 27
    invoke-static {v0, v3, v5, v1}, Landroid/opengl/GLES20;->glUniform3f(IFFF)V

    .line 28
    .line 29
    .line 30
    iget v0, p0, Lcom/momo/mcamera/mask/FaceSharpenFilter;->highSkinYUVThresholdHandle:I

    .line 31
    .line 32
    iget-object p0, p0, Lcom/momo/mcamera/mask/FaceSharpenFilter;->highSkinYUVThreshold:[I

    .line 33
    .line 34
    aget v1, p0, v2

    .line 35
    .line 36
    int-to-float v1, v1

    .line 37
    aget v2, p0, v4

    .line 38
    .line 39
    int-to-float v2, v2

    .line 40
    aget p0, p0, v6

    .line 41
    .line 42
    int-to-float p0, p0

    .line 43
    invoke-static {v0, v1, v2, p0}, Landroid/opengl/GLES20;->glUniform3f(IFFF)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public resetSticker(Lcom/momo/mcamera/mask/Sticker;)V
    .locals 0

    return-void
.end method

.method public setMMCVInfo(Ll/omw;)V
    .locals 0

    .line 1
    return-void
.end method

.method public setSharpenScale(F)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/gfj;->getLockObject()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    monitor-enter v0

    .line 6
    :try_start_0
    iput p1, p0, Lcom/momo/mcamera/mask/FaceSharpenFilter;->sharpenScaleValue:F

    .line 7
    .line 8
    monitor-exit v0

    .line 9
    return-void

    .line 10
    :catchall_0
    move-exception p0

    .line 11
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 12
    throw p0
.end method
