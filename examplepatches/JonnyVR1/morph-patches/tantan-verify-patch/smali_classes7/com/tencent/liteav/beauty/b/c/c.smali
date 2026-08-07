.class public Lcom/tencent/liteav/beauty/b/c/c;
.super Lcom/tencent/liteav/beauty/b/t;
.source "SourceFile"


# instance fields
.field private A:I

.field private B:I

.field private C:I

.field private D:I

.field private E:I

.field private F:I

.field private final x:Ljava/lang/String;

.field private y:I

.field private z:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    const-string v0, "attribute vec4 position;\n attribute vec4 inputTextureCoordinate;\n attribute vec4 inputTextureCoordinate2;\n attribute vec4 inputTextureCoordinate3;\n uniform float texelWidthOffset;\n uniform float texelHeightOffset;\n \n varying vec2 textureCoordinate;\n varying vec2 textureCoordinate2;\n varying vec2 textureCoordinate3;\n varying vec4 textureShift_1;\n varying vec4 textureShift_2;\n varying vec4 textureShift_3;\n varying vec4 textureShift_4;\n \n void main(void)\n {\n     gl_Position = position;\n     textureCoordinate = inputTextureCoordinate.xy;\n     textureCoordinate2 = inputTextureCoordinate2.xy;\n     textureCoordinate3 = inputTextureCoordinate3.xy;\n     textureShift_1 = vec4(textureCoordinate + vec2(-texelWidthOffset,0.0),textureCoordinate + vec2(texelWidthOffset,0.0));\n     textureShift_2 = vec4(textureCoordinate + vec2(0.0,-texelHeightOffset),textureCoordinate + vec2(0.0,texelHeightOffset));\n     textureShift_3 = vec4(textureCoordinate + vec2(texelWidthOffset,texelHeightOffset),textureCoordinate + vec2(-texelWidthOffset,-texelHeightOffset));\n     textureShift_4 = vec4(textureCoordinate + vec2(-texelWidthOffset,texelHeightOffset),textureCoordinate + vec2(texelWidthOffset,-texelHeightOffset));\n }\n"

    .line 2
    .line 3
    const-string v1, "precision mediump float;\n varying highp vec2 textureCoordinate;\n varying highp vec2 textureCoordinate2;\n varying highp vec2 textureCoordinate3;\n varying highp vec4 textureShift_1;\n varying highp vec4 textureShift_2;\n varying highp vec4 textureShift_3;\n varying highp vec4 textureShift_4;\n \n uniform sampler2D inputImageTexture;\n uniform sampler2D inputImageTexture2;\n uniform sampler2D inputImageTexture3;\n uniform highp float blurStrength;\n uniform highp float sharpenStrength;\n uniform highp float whitenStrength;\n uniform highp float ruddyStrength;\n\n \n const mediump vec3 luminanceWeighting = vec3(0.2125, 0.7154, 0.0721);\n  const highp mat3 saturateMatrix = mat3(\n                                        1.1102, -0.0598, -0.061,\n                                        -0.0774, 1.0826, -0.1186,\n                                        -0.0228, -0.0228, 1.1772);\n highp vec3 rgb2hsv(highp vec3 c)\n {\n     highp vec4 K = vec4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);\n     highp vec4 p = mix(vec4(c.bg, K.wz), vec4(c.gb, K.xy), step(c.b, c.g));\n     highp vec4 q = mix(vec4(p.xyw, c.r), vec4(c.r, p.yzx), step(p.x, c.r));\n     \n     highp float d = q.x - min(q.w, q.y);\n     highp float e = 1.0e-10;\n     return vec3(abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);\n }\n void main()\n {\n     lowp vec4 iColor = texture2D(inputImageTexture, textureCoordinate);\n     lowp vec4 meanColor = texture2D(inputImageTexture2, textureCoordinate2);\n     lowp vec4 varColor = texture2D(inputImageTexture3, textureCoordinate3);\n     \n     lowp float iSkinR = iColor.r;\n     lowp float mSkinR = meanColor.r;\n     \n     // smooth\n     mediump float p = clamp((min(iSkinR, mSkinR - 0.1) - 0.2) * 4.0, 0.0, 1.0);\n     mediump float meanVar = (varColor.r + varColor.g + varColor.b) / 3.0;\n     mediump float diffFactor = (1.0 - meanVar / (meanVar + 0.1));\n     mediump float kMin = diffFactor * p;\n     lowp vec3 smoothColor = mix(iColor.rgb, meanColor.rgb, kMin * blurStrength);\n     \n     // sharpen\n     mediump vec3 sum = 0.25* iColor.rgb;// 0.25*iColor.rgb;\n     sum += 0.125 *texture2D(inputImageTexture,textureShift_1.xy).rgb;\n     sum += 0.125 *texture2D(inputImageTexture,textureShift_1.zw).rgb;\n     sum += 0.125 *texture2D(inputImageTexture,textureShift_2.xy).rgb;\n     sum += 0.125 *texture2D(inputImageTexture,textureShift_2.zw).rgb;\n     sum += 0.0625*texture2D(inputImageTexture,textureShift_3.xy).rgb;\n     sum += 0.0625*texture2D(inputImageTexture,textureShift_3.zw).rgb;\n     sum += 0.0625*texture2D(inputImageTexture,textureShift_4.xy).rgb;\n     sum += 0.0625*texture2D(inputImageTexture,textureShift_4.zw).rgb;\n     vec3 hPass = iColor.rgb - sum;\n     lowp vec3 sharpenResult = clamp(smoothColor + hPass.g + hPass.rgb * max(0.0, meanVar - 0.05) / (meanVar + 0.1), vec3(0.0), vec3(1.0));\n     lowp vec3 sharpenColor = clamp(mix(smoothColor.rgb, sharpenResult.rgb, sharpenStrength), vec3(0.0), vec3(1.0));\n     \n     //\u7f8e\u767d\n     //\u63d0\u5347\u5bf9\u6bd4\u5ea6\uff0c\u9ed1\u767d\u5206\u660e\n     lowp vec4 white = vec4(((sharpenColor.rgb - vec3(0.5)) * (1.0 + whitenStrength * 0.125) + vec3(0.5)), iColor.a);\n     //\u8d8a\u4eae\u8d8a\u767d\uff0c\u8d8a\u6697\u8d8a\u4e0d\u767d\n     lowp vec3 hsv = rgb2hsv(white.rgb);\n     highp float wDegree = 4.0 * hsv.z * whitenStrength + 0.00001;\n     //log\u66f2\u7ebf\u7f8e\u767d\n     white.r = log(1.0 + wDegree * white.r)/log(wDegree + 1.0);\n     white.gb = log(1.0 + wDegree * white.gb)/log(wDegree + 1.0);\n     white = mix(vec4(sharpenColor, iColor.a), white, min(wDegree, 0.8));\n     //\u9971\u548c\u5ea6\u7ea2\u6da6\n     lowp vec3 ruddy = white.rgb * saturateMatrix;\n     ruddy = mix(white.rgb, ruddy, ruddyStrength * 0.7);\n     gl_FragColor = vec4(ruddy, iColor.a);     // whiten red\n\n }"

    .line 4
    .line 5
    invoke-direct {p0, v0, v1}, Lcom/tencent/liteav/beauty/b/t;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const-string v0, "TXCYTBeautySmoothFilter"

    .line 9
    .line 10
    iput-object v0, p0, Lcom/tencent/liteav/beauty/b/c/c;->x:Ljava/lang/String;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public a(III)I
    .locals 3

    .line 23
    iget v0, p0, Lcom/tencent/liteav/beauty/b/c/c;->E:I

    iget v1, p0, Lcom/tencent/liteav/beauty/b/c/c;->F:I

    const/4 v2, 0x0

    invoke-static {v2, v2, v0, v1}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 24
    invoke-super {p0, p1, p2, p3}, Lcom/tencent/liteav/beauty/b/t;->a(III)I

    move-result p0

    return p0
.end method

.method public a(F)V
    .locals 2

    .line 21
    iget v0, p0, Lcom/tencent/liteav/beauty/b/c/c;->A:I

    invoke-virtual {p0, v0, p1}, Lcom/tencent/liteav/basic/c/h;->a(IF)V

    .line 22
    iget v0, p0, Lcom/tencent/liteav/beauty/b/c/c;->B:I

    const v1, 0x3e99999a    # 0.3f

    mul-float/2addr v1, p1

    mul-float/2addr v1, p1

    invoke-virtual {p0, v0, v1}, Lcom/tencent/liteav/basic/c/h;->a(IF)V

    return-void
.end method

.method public a(FF)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/tencent/liteav/beauty/b/c/c;->y:I

    .line 2
    .line 3
    const/high16 v1, 0x3f800000    # 1.0f

    .line 4
    .line 5
    div-float p1, v1, p1

    .line 6
    .line 7
    invoke-virtual {p0, v0, p1}, Lcom/tencent/liteav/basic/c/h;->a(IF)V

    .line 8
    .line 9
    .line 10
    iget p1, p0, Lcom/tencent/liteav/beauty/b/c/c;->z:I

    .line 11
    .line 12
    div-float/2addr v1, p2

    .line 13
    invoke-virtual {p0, p1, v1}, Lcom/tencent/liteav/basic/c/h;->a(IF)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public a(II)V
    .locals 0

    .line 17
    invoke-super {p0, p1, p2}, Lcom/tencent/liteav/beauty/b/t;->a(II)V

    .line 18
    iput p1, p0, Lcom/tencent/liteav/beauty/b/c/c;->E:I

    .line 19
    iput p2, p0, Lcom/tencent/liteav/beauty/b/c/c;->F:I

    int-to-float p1, p1

    int-to-float p2, p2

    .line 20
    invoke-virtual {p0, p1, p2}, Lcom/tencent/liteav/beauty/b/c/c;->a(FF)V

    return-void
.end method

.method public b(F)V
    .locals 1

    .line 84
    iget v0, p0, Lcom/tencent/liteav/beauty/b/c/c;->D:I

    invoke-virtual {p0, v0, p1}, Lcom/tencent/liteav/basic/c/h;->a(IF)V

    return-void
.end method

.method public b()Z
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/tencent/liteav/beauty/b/t;->b()Z

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/c/h;->p()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const-string v1, "texelWidthOffset"

    .line 9
    .line 10
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iput v0, p0, Lcom/tencent/liteav/beauty/b/c/c;->y:I

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/c/h;->p()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    const-string v1, "texelHeightOffset"

    .line 21
    .line 22
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    iput v0, p0, Lcom/tencent/liteav/beauty/b/c/c;->z:I

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/c/h;->p()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    const-string v1, "blurStrength"

    .line 33
    .line 34
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    iput v0, p0, Lcom/tencent/liteav/beauty/b/c/c;->A:I

    .line 39
    .line 40
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/c/h;->p()I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    const-string v1, "sharpenStrength"

    .line 45
    .line 46
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    iput v0, p0, Lcom/tencent/liteav/beauty/b/c/c;->B:I

    .line 51
    .line 52
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/c/h;->p()I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    const-string v1, "ruddyStrength"

    .line 57
    .line 58
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    iput v0, p0, Lcom/tencent/liteav/beauty/b/c/c;->C:I

    .line 63
    .line 64
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/c/h;->p()I

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    const-string v1, "whitenStrength"

    .line 69
    .line 70
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    iput v0, p0, Lcom/tencent/liteav/beauty/b/c/c;->D:I

    .line 75
    .line 76
    iget p0, p0, Lcom/tencent/liteav/basic/c/h;->a:I

    .line 77
    .line 78
    if-eqz p0, :cond_0

    .line 79
    .line 80
    const/4 p0, 0x1

    .line 81
    return p0

    .line 82
    :cond_0
    const/4 p0, 0x0

    .line 83
    return p0
.end method

.method public c(F)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/tencent/liteav/beauty/b/c/c;->C:I

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Lcom/tencent/liteav/basic/c/h;->a(IF)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public d(F)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/tencent/liteav/beauty/b/c/c;->B:I

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Lcom/tencent/liteav/basic/c/h;->a(IF)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
