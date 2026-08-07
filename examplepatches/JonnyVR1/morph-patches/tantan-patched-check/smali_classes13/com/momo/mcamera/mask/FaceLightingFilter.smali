.class public Lcom/momo/mcamera/mask/FaceLightingFilter;
.super Lcom/momo/mcamera/mask/FaceDetectFilter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/mcamera/mask/FaceLightingFilter$WhiteningVersionEnum;
    }
.end annotation


# instance fields
.field private skinDefaultRGB:[I

.field private skinDefaultRGBHandle:I

.field public skinLightingScale:F

.field private skinLightingScaleHandle:I

.field private version:Lcom/momo/mcamera/mask/FaceLightingFilter$WhiteningVersionEnum;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/momo/mcamera/mask/FaceDetectFilter;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/momo/mcamera/mask/FaceLightingFilter;->skinLightingScale:F

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    filled-new-array {v0, v0, v0}, [I

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p0, Lcom/momo/mcamera/mask/FaceLightingFilter;->skinDefaultRGB:[I

    .line 13
    .line 14
    sget-object v0, Lcom/momo/mcamera/mask/FaceLightingFilter$WhiteningVersionEnum;->originWhiten:Lcom/momo/mcamera/mask/FaceLightingFilter$WhiteningVersionEnum;

    .line 15
    .line 16
    iput-object v0, p0, Lcom/momo/mcamera/mask/FaceLightingFilter;->version:Lcom/momo/mcamera/mask/FaceLightingFilter$WhiteningVersionEnum;

    .line 17
    .line 18
    return-void
.end method

.method public constructor <init>(Lcom/momo/mcamera/mask/FaceLightingFilter$WhiteningVersionEnum;)V
    .locals 1

    .line 19
    invoke-direct {p0}, Lcom/momo/mcamera/mask/FaceDetectFilter;-><init>()V

    const/4 v0, 0x0

    .line 20
    iput v0, p0, Lcom/momo/mcamera/mask/FaceLightingFilter;->skinLightingScale:F

    const/4 v0, 0x0

    .line 21
    filled-new-array {v0, v0, v0}, [I

    move-result-object v0

    iput-object v0, p0, Lcom/momo/mcamera/mask/FaceLightingFilter;->skinDefaultRGB:[I

    .line 22
    iput-object p1, p0, Lcom/momo/mcamera/mask/FaceLightingFilter;->version:Lcom/momo/mcamera/mask/FaceLightingFilter$WhiteningVersionEnum;

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
    .locals 1

    .line 1
    sget-object v0, Lcom/momo/mcamera/mask/FaceLightingFilter$1;->$SwitchMap$com$momo$mcamera$mask$FaceLightingFilter$WhiteningVersionEnum:[I

    .line 2
    .line 3
    iget-object p0, p0, Lcom/momo/mcamera/mask/FaceLightingFilter;->version:Lcom/momo/mcamera/mask/FaceLightingFilter$WhiteningVersionEnum;

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    aget p0, v0, p0

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    if-eq p0, v0, :cond_1

    .line 13
    .line 14
    const/4 v0, 0x2

    .line 15
    if-eq p0, v0, :cond_0

    .line 16
    .line 17
    const-string p0, ""

    .line 18
    .line 19
    return-object p0

    .line 20
    :cond_0
    const-string p0, "precision mediump float;\nuniform sampler2D inputImageTexture0;\nvarying vec2 textureCoordinate;\nuniform float skinLightingScale;\nuniform vec3 skinDefaultRGB;\nvec3 rgb2yuv(vec3 c)\n{\n    return clamp(vec3(0.299 * c.r + 0.587 * c.g + 0.114 * c.b, -0.169 * c.r - 0.331 * c.g + 0.499 * c.b + 0.5, 0.499 * c.r - 0.418 * c.g - 0.0813* c.b + 0.5), 0., 1.);\n}\nvec3 yuv2rgb(vec3 c)\n{\n    return clamp(vec3(c.r + 1.402 * (c.b - 0.5), c.r - 0.344 * (c.g - 0.5) - 0.714 * (c.b - 0.5), c.r + 1.772 * (c.g - 0.5)), 0., 1.);\n}\nvec3 adjustYUV(vec3 c, float highThreshold)\n{\n    if(c.x < 0.1){\n        c.x = 0.;\n    }else if (c.x > highThreshold){\n        c.x = 1.;\n    }else{\n        c.x = (c.x - 0.1)/(highThreshold - 0.1);\n    }\n    return c;\n}\nvoid main() {\n    vec4 source = texture2D(inputImageTexture0, textureCoordinate);\n    gl_FragColor = source;\n    if(abs(skinLightingScale - 0.1) < 0.05)\n    {\n        return;\n    }\n    vec3 faceYUV = rgb2yuv(skinDefaultRGB);\n    float lightScale = clamp((faceYUV.r - 0.32) * 2.55, 0.6, 1.);\n    vec3 relation = vec3(1.0) - max(skinDefaultRGB - source.xyz, vec3(0.));\n    relation = 1./(1. + exp(24. - 30. * relation));\n    vec3 relation2 = vec3(1.0) - abs(skinDefaultRGB - source.xyz);\n    relation2 = 1./(1. + exp(24. - 30. * relation2));\nfloat minColor = min(min(source.x, source.y), source.z);\ngl_FragColor.xyz = gl_FragColor.xyz - minColor;\nif(gl_FragColor.r > 0. && gl_FragColor.g > 0.){\n    minColor = min(gl_FragColor.g, gl_FragColor.r);\n    gl_FragColor.r = gl_FragColor.r - minColor;\n    gl_FragColor.g = gl_FragColor.g - minColor;\n}\nif(gl_FragColor.b > 0. && gl_FragColor.g > 0.){\n    minColor = min(gl_FragColor.g, gl_FragColor.b);\n    gl_FragColor.b = gl_FragColor.b - minColor;\n    gl_FragColor.g = gl_FragColor.g - minColor;\n}\nif(gl_FragColor.b > 0. && gl_FragColor.r > 0.){\n    minColor = min(gl_FragColor.r, gl_FragColor.b);\n    gl_FragColor.b = gl_FragColor.b - minColor;\n    gl_FragColor.r = gl_FragColor.r - minColor;\n}\nvec3 parameters = lightScale * vec3(1., 0.5, 0.4);\nvec3 delta = gl_FragColor.r * vec3((1.-source.x) * parameters.x, source.y * parameters.y, (1.-source.z) * parameters.z);\ndelta = 0.8 * delta * relation * relation;\ngl_FragColor.xyz = vec3(source.x + delta.x, source.y - delta.y, source.z + delta.z);\n    float param = relation2.x * relation2.y * relation2.z * skinLightingScale;\n    vec3 paramVec = vec3(param*1.4 + 1.05, param*1.2 + 1.05, param + 1.05);\n    vec3 a = log(gl_FragColor.rgb  * (paramVec - vec3(1.)) + vec3(1., 1., 1.));\n    gl_FragColor.rgb = a / log(paramVec);\n}\n"

    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_1
    const-string p0, "precision mediump float;\nuniform sampler2D inputImageTexture0;\nvarying vec2 textureCoordinate;\nuniform float skinLightingScale;\nvoid main() {\n    vec4 source = texture2D( inputImageTexture0, textureCoordinate);\n    gl_FragColor = source;\n    if(abs(skinLightingScale - 1.) < 0.01)\n    {\n        return;\n    }\n    vec3 a = log(gl_FragColor.rgb * (skinLightingScale - 1.) + vec3(1., 1., 1.));\n    float b = log(skinLightingScale);\n    gl_FragColor.rgb = a / b;\n}\n"

    .line 24
    .line 25
    return-object p0
.end method

.method public getSkinLightLevel()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/FaceLightingFilter;->skinLightingScale:F

    .line 2
    .line 3
    return p0
.end method

.method public getVertexShader()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-super {p0}, Ll/wej;->getVertexShader()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
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
    const-string v1, "skinLightingScale"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Lcom/momo/mcamera/mask/FaceLightingFilter;->skinLightingScaleHandle:I

    .line 13
    .line 14
    iget v0, p0, Ll/wej;->programHandle:I

    .line 15
    .line 16
    const-string v1, "skinDefaultRGB"

    .line 17
    .line 18
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Lcom/momo/mcamera/mask/FaceLightingFilter;->skinDefaultRGBHandle:I

    .line 23
    .line 24
    return-void
.end method

.method public passShaderValues()V
    .locals 5

    .line 1
    invoke-super {p0}, Ll/wej;->passShaderValues()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/momo/mcamera/mask/FaceLightingFilter;->skinLightingScale:F

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    cmpg-float v0, v0, v1

    .line 8
    .line 9
    if-gez v0, :cond_0

    .line 10
    .line 11
    iput v1, p0, Lcom/momo/mcamera/mask/FaceLightingFilter;->skinLightingScale:F

    .line 12
    .line 13
    :cond_0
    sget-object v0, Lcom/momo/mcamera/mask/FaceLightingFilter$1;->$SwitchMap$com$momo$mcamera$mask$FaceLightingFilter$WhiteningVersionEnum:[I

    .line 14
    .line 15
    iget-object v1, p0, Lcom/momo/mcamera/mask/FaceLightingFilter;->version:Lcom/momo/mcamera/mask/FaceLightingFilter$WhiteningVersionEnum;

    .line 16
    .line 17
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    aget v0, v0, v1

    .line 22
    .line 23
    const/4 v1, 0x1

    .line 24
    if-eq v0, v1, :cond_2

    .line 25
    .line 26
    const/4 v2, 0x2

    .line 27
    if-eq v0, v2, :cond_1

    .line 28
    .line 29
    return-void

    .line 30
    :cond_1
    iget v0, p0, Lcom/momo/mcamera/mask/FaceLightingFilter;->skinLightingScaleHandle:I

    .line 31
    .line 32
    iget v3, p0, Lcom/momo/mcamera/mask/FaceLightingFilter;->skinLightingScale:F

    .line 33
    .line 34
    const v4, 0x3dcccccd    # 0.1f

    .line 35
    .line 36
    .line 37
    add-float/2addr v3, v4

    .line 38
    invoke-static {v0, v3}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 39
    .line 40
    .line 41
    iget v0, p0, Lcom/momo/mcamera/mask/FaceLightingFilter;->skinDefaultRGBHandle:I

    .line 42
    .line 43
    iget-object p0, p0, Lcom/momo/mcamera/mask/FaceLightingFilter;->skinDefaultRGB:[I

    .line 44
    .line 45
    const/4 v3, 0x0

    .line 46
    aget v3, p0, v3

    .line 47
    .line 48
    int-to-float v3, v3

    .line 49
    const/high16 v4, 0x437f0000    # 255.0f

    .line 50
    .line 51
    div-float/2addr v3, v4

    .line 52
    aget v1, p0, v1

    .line 53
    .line 54
    int-to-float v1, v1

    .line 55
    div-float/2addr v1, v4

    .line 56
    aget p0, p0, v2

    .line 57
    .line 58
    add-int/lit8 p0, p0, -0xa

    .line 59
    .line 60
    int-to-float p0, p0

    .line 61
    div-float/2addr p0, v4

    .line 62
    invoke-static {v0, v3, v1, p0}, Landroid/opengl/GLES20;->glUniform3f(IFFF)V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_2
    iget v0, p0, Lcom/momo/mcamera/mask/FaceLightingFilter;->skinLightingScaleHandle:I

    .line 67
    .line 68
    iget p0, p0, Lcom/momo/mcamera/mask/FaceLightingFilter;->skinLightingScale:F

    .line 69
    .line 70
    const/high16 v1, 0x40a00000    # 5.0f

    .line 71
    .line 72
    mul-float/2addr p0, v1

    .line 73
    const/high16 v1, 0x3f800000    # 1.0f

    .line 74
    .line 75
    add-float/2addr p0, v1

    .line 76
    invoke-static {v0, p0}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public resetSticker(Lcom/momo/mcamera/mask/Sticker;)V
    .locals 0

    return-void
.end method

.method public setMMCVInfo(Ll/omw;)V
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p1, v0}, Ll/omw;->j(I)Ll/nuf;

    .line 3
    .line 4
    .line 5
    move-result-object p1

    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {p1}, Ll/nuf;->w()[I

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    :goto_0
    const/4 v1, 0x2

    .line 15
    const/4 v2, 0x1

    .line 16
    if-eqz p1, :cond_2

    .line 17
    .line 18
    array-length v3, p1

    .line 19
    const/4 v4, 0x6

    .line 20
    if-ge v3, v4, :cond_1

    .line 21
    .line 22
    goto :goto_1

    .line 23
    :cond_1
    iget-object p0, p0, Lcom/momo/mcamera/mask/FaceLightingFilter;->skinDefaultRGB:[I

    .line 24
    .line 25
    aget v3, p1, v4

    .line 26
    .line 27
    aput v3, p0, v0

    .line 28
    .line 29
    const/4 v0, 0x7

    .line 30
    aget v0, p1, v0

    .line 31
    .line 32
    aput v0, p0, v2

    .line 33
    .line 34
    const/16 v0, 0x8

    .line 35
    .line 36
    aget p1, p1, v0

    .line 37
    .line 38
    aput p1, p0, v1

    .line 39
    .line 40
    return-void

    .line 41
    :cond_2
    :goto_1
    iget-object p0, p0, Lcom/momo/mcamera/mask/FaceLightingFilter;->skinDefaultRGB:[I

    .line 42
    .line 43
    const/16 p1, 0x80

    .line 44
    .line 45
    aput p1, p0, v0

    .line 46
    .line 47
    aput p1, p0, v2

    .line 48
    .line 49
    aput p1, p0, v1

    .line 50
    .line 51
    return-void
.end method

.method public setSkinLightingScale(F)V
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
    iput p1, p0, Lcom/momo/mcamera/mask/FaceLightingFilter;->skinLightingScale:F

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
