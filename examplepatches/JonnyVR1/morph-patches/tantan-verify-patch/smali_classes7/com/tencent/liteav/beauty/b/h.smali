.class public Lcom/tencent/liteav/beauty/b/h;
.super Lcom/tencent/liteav/basic/c/h;
.source "SourceFile"


# instance fields
.field private r:I

.field private s:F


# direct methods
.method public constructor <init>()V
    .locals 1

    const v0, 0x3f99999a    # 1.2f

    .line 11
    invoke-direct {p0, v0}, Lcom/tencent/liteav/beauty/b/h;-><init>(F)V

    return-void
.end method

.method public constructor <init>(F)V
    .locals 2

    .line 1
    const-string v0, "attribute vec4 position;\nattribute vec4 inputTextureCoordinate;\n \nvarying vec2 textureCoordinate;\n \nvoid main()\n{\n    gl_Position = position;\n    textureCoordinate = inputTextureCoordinate.xy;\n}"

    .line 2
    .line 3
    const-string v1, "varying lowp vec2 textureCoordinate;\n \n uniform sampler2D inputImageTexture;\n uniform lowp float gamma;\n \n void main()\n {\n     lowp vec4 textureColor = texture2D(inputImageTexture, textureCoordinate);\n     \n     gl_FragColor = vec4(pow(textureColor.rgb, vec3(gamma)), textureColor.w);\n }"

    .line 4
    .line 5
    invoke-direct {p0, v0, v1}, Lcom/tencent/liteav/basic/c/h;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iput p1, p0, Lcom/tencent/liteav/beauty/b/h;->s:F

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a(F)V
    .locals 1

    .line 1
    iput p1, p0, Lcom/tencent/liteav/beauty/b/h;->s:F

    .line 2
    .line 3
    iget v0, p0, Lcom/tencent/liteav/beauty/b/h;->r:I

    .line 4
    .line 5
    invoke-virtual {p0, v0, p1}, Lcom/tencent/liteav/basic/c/h;->a(IF)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public b()Z
    .locals 3

    .line 1
    invoke-super {p0}, Lcom/tencent/liteav/basic/c/h;->b()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/c/h;->p()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const-string v2, "gamma"

    .line 10
    .line 11
    invoke-static {v1, v2}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    iput v1, p0, Lcom/tencent/liteav/beauty/b/h;->r:I

    .line 16
    .line 17
    return v0
.end method

.method public c()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/tencent/liteav/basic/c/h;->c()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/tencent/liteav/beauty/b/h;->s:F

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/beauty/b/h;->a(F)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
