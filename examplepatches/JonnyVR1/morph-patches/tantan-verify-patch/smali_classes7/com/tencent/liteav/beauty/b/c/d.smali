.class Lcom/tencent/liteav/beauty/b/c/d;
.super Lcom/tencent/liteav/basic/c/h;
.source "SourceFile"


# instance fields
.field private final r:Z

.field private s:I

.field private t:I

.field private u:I

.field private v:I


# direct methods
.method public constructor <init>(Z)V
    .locals 2

    .line 1
    const-string v0, " attribute vec4 position;\n attribute vec4 inputTextureCoordinate;\n \n uniform float texelWidthOffset;\n uniform float texelHeightOffset;\n \n varying vec2 textureCoordinate;\n varying vec4 textureShift_1;\n varying vec4 textureShift_2;\n varying vec4 textureShift_3;\n varying vec4 textureShift_4;\n \n void main(void)\n {\n     gl_Position = position;\n     textureCoordinate = inputTextureCoordinate.xy;\n     \n     vec2 singleStepOffset = vec2(texelWidthOffset, texelHeightOffset);\n     textureShift_1 = vec4(textureCoordinate - singleStepOffset, textureCoordinate + singleStepOffset);\n     textureShift_2 = vec4(textureCoordinate - 2.0 * singleStepOffset, textureCoordinate + 2.0 * singleStepOffset);\n     textureShift_3 = vec4(textureCoordinate - 3.0 * singleStepOffset, textureCoordinate + 3.0 * singleStepOffset);\n     textureShift_4 = vec4(textureCoordinate - 4.0 * singleStepOffset, textureCoordinate + 4.0 * singleStepOffset);\n }\n"

    .line 2
    .line 3
    const-string v1, "uniform sampler2D inputImageTexture;\n varying highp vec2 textureCoordinate;\n varying highp vec4 textureShift_1;\n varying highp vec4 textureShift_2;\n varying highp vec4 textureShift_3;\n varying highp vec4 textureShift_4;\n \n void main()\n {\n     mediump vec3 sum = texture2D(inputImageTexture, textureCoordinate).rgb;\n     sum += texture2D(inputImageTexture, textureShift_1.xy).rgb;\n     sum += texture2D(inputImageTexture, textureShift_1.zw).rgb;\n     sum += texture2D(inputImageTexture, textureShift_2.xy).rgb;\n     sum += texture2D(inputImageTexture, textureShift_2.zw).rgb;\n     sum += texture2D(inputImageTexture, textureShift_3.xy).rgb;\n     sum += texture2D(inputImageTexture, textureShift_3.zw).rgb;\n     sum += texture2D(inputImageTexture, textureShift_4.xy).rgb;\n     sum += texture2D(inputImageTexture, textureShift_4.zw).rgb;\n     \n     gl_FragColor = vec4(sum * 0.1111, 1.0);\n }\n"

    .line 4
    .line 5
    invoke-direct {p0, v0, v1}, Lcom/tencent/liteav/basic/c/h;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/4 v0, -0x1

    .line 9
    iput v0, p0, Lcom/tencent/liteav/beauty/b/c/d;->s:I

    .line 10
    .line 11
    iput v0, p0, Lcom/tencent/liteav/beauty/b/c/d;->t:I

    .line 12
    .line 13
    iput-boolean p1, p0, Lcom/tencent/liteav/beauty/b/c/d;->r:Z

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public a(II)V
    .locals 2

    .line 1
    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/high16 v1, 0x43b40000    # 360.0f

    .line 6
    .line 7
    int-to-float v0, v0

    .line 8
    div-float/2addr v1, v0

    .line 9
    const/high16 v0, 0x3f800000    # 1.0f

    .line 10
    .line 11
    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    int-to-float p1, p1

    .line 16
    mul-float/2addr p1, v0

    .line 17
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    iput p1, p0, Lcom/tencent/liteav/beauty/b/c/d;->u:I

    .line 22
    .line 23
    int-to-float p1, p2

    .line 24
    mul-float/2addr p1, v0

    .line 25
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    iput p1, p0, Lcom/tencent/liteav/beauty/b/c/d;->v:I

    .line 30
    .line 31
    iget p2, p0, Lcom/tencent/liteav/beauty/b/c/d;->u:I

    .line 32
    .line 33
    invoke-super {p0, p2, p1}, Lcom/tencent/liteav/basic/c/h;->a(II)V

    .line 34
    .line 35
    .line 36
    iget-boolean p1, p0, Lcom/tencent/liteav/beauty/b/c/d;->r:Z

    .line 37
    .line 38
    iget p2, p0, Lcom/tencent/liteav/beauty/b/c/d;->s:I

    .line 39
    .line 40
    const/high16 v0, 0x3fc00000    # 1.5f

    .line 41
    .line 42
    const/4 v1, 0x0

    .line 43
    if-eqz p1, :cond_0

    .line 44
    .line 45
    invoke-virtual {p0, p2, v1}, Lcom/tencent/liteav/basic/c/h;->a(IF)V

    .line 46
    .line 47
    .line 48
    iget p1, p0, Lcom/tencent/liteav/beauty/b/c/d;->t:I

    .line 49
    .line 50
    iget p2, p0, Lcom/tencent/liteav/beauty/b/c/d;->v:I

    .line 51
    .line 52
    int-to-float p2, p2

    .line 53
    div-float/2addr v0, p2

    .line 54
    invoke-virtual {p0, p1, v0}, Lcom/tencent/liteav/basic/c/h;->a(IF)V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_0
    iget p1, p0, Lcom/tencent/liteav/beauty/b/c/d;->u:I

    .line 59
    .line 60
    int-to-float p1, p1

    .line 61
    div-float/2addr v0, p1

    .line 62
    invoke-virtual {p0, p2, v0}, Lcom/tencent/liteav/basic/c/h;->a(IF)V

    .line 63
    .line 64
    .line 65
    iget p1, p0, Lcom/tencent/liteav/beauty/b/c/d;->t:I

    .line 66
    .line 67
    invoke-virtual {p0, p1, v1}, Lcom/tencent/liteav/basic/c/h;->a(IF)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public b(I)I
    .locals 3

    .line 35
    iget v0, p0, Lcom/tencent/liteav/beauty/b/c/d;->u:I

    iget v1, p0, Lcom/tencent/liteav/beauty/b/c/d;->v:I

    const/4 v2, 0x0

    invoke-static {v2, v2, v0, v1}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 36
    iget v0, p0, Lcom/tencent/liteav/basic/c/h;->m:I

    iget v1, p0, Lcom/tencent/liteav/basic/c/h;->n:I

    invoke-super {p0, p1, v0, v1}, Lcom/tencent/liteav/basic/c/h;->a(III)I

    move-result p0

    return p0
.end method

.method public b()Z
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/tencent/liteav/basic/c/h;->b()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/c/h;->p()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const-string v1, "texelWidthOffset"

    .line 14
    .line 15
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iput v0, p0, Lcom/tencent/liteav/beauty/b/c/d;->s:I

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/c/h;->p()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    const-string v1, "texelHeightOffset"

    .line 26
    .line 27
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    iput v0, p0, Lcom/tencent/liteav/beauty/b/c/d;->t:I

    .line 32
    .line 33
    const/4 p0, 0x1

    .line 34
    return p0
.end method
