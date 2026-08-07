.class public Lcom/tencent/liteav/beauty/b/d;
.super Lcom/tencent/liteav/basic/c/h;
.source "SourceFile"


# instance fields
.field private r:F

.field private s:I

.field private t:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    const-string v0, "attribute vec4 position;\nattribute vec4 inputTextureCoordinate;\n \nvarying vec2 textureCoordinate;\n \nvoid main()\n{\n    gl_Position = position;\n    textureCoordinate = inputTextureCoordinate.xy;\n}"

    .line 2
    .line 3
    const-string v1, "precision highp float;  \n \nuniform sampler2D inputImageTexture;  \nvarying highp vec2 textureCoordinate; \nuniform float texelWidthOffset; \nuniform float texelHeightOffset; \nvec2 pos[9]; \n \nvoid main()  \n{  \n\tpos[0] = textureCoordinate + vec2(-texelWidthOffset, -texelHeightOffset); \n\tpos[1] = textureCoordinate + vec2(-texelWidthOffset, 0.0); \n\tpos[2] = textureCoordinate + vec2(-texelWidthOffset, texelHeightOffset); \n\tpos[3] = textureCoordinate + vec2(0.0, -texelHeightOffset); \n\tpos[4] = textureCoordinate + vec2(0.0, 0.0); \n\tpos[5] = textureCoordinate + vec2(0.0, texelHeightOffset); \n\tpos[6] = textureCoordinate + vec2(texelWidthOffset, -texelHeightOffset); \n\tpos[7] = textureCoordinate + vec2(texelWidthOffset, 0.0); \n\tpos[8] = textureCoordinate + vec2(texelWidthOffset, texelHeightOffset); \n\tvec4 fragmentColor = texture2D(inputImageTexture, pos[0]);  \n\tfragmentColor += texture2D(inputImageTexture, pos[1]);  \n\tfragmentColor += texture2D(inputImageTexture, pos[2]);  \n\tfragmentColor += texture2D(inputImageTexture, pos[3]);  \n\tfragmentColor += texture2D(inputImageTexture, pos[4]);  \n\tfragmentColor += texture2D(inputImageTexture, pos[5]);  \n\tfragmentColor += texture2D(inputImageTexture, pos[6]);  \n\tfragmentColor += texture2D(inputImageTexture, pos[7]);  \n\tfragmentColor += texture2D(inputImageTexture, pos[8]);  \n \n\tgl_FragColor = fragmentColor / 9.0;  \n} \n"

    .line 4
    .line 5
    invoke-direct {p0, v0, v1}, Lcom/tencent/liteav/basic/c/h;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/high16 v0, 0x40000000    # 2.0f

    .line 9
    .line 10
    iput v0, p0, Lcom/tencent/liteav/beauty/b/d;->r:F

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public a(F)V
    .locals 2

    .line 1
    iput p1, p0, Lcom/tencent/liteav/beauty/b/d;->r:F

    .line 2
    .line 3
    iget v0, p0, Lcom/tencent/liteav/beauty/b/d;->s:I

    .line 4
    .line 5
    iget v1, p0, Lcom/tencent/liteav/basic/c/h;->e:I

    .line 6
    .line 7
    int-to-float v1, v1

    .line 8
    div-float/2addr p1, v1

    .line 9
    invoke-virtual {p0, v0, p1}, Lcom/tencent/liteav/basic/c/h;->a(IF)V

    .line 10
    .line 11
    .line 12
    iget p1, p0, Lcom/tencent/liteav/beauty/b/d;->t:I

    .line 13
    .line 14
    iget v0, p0, Lcom/tencent/liteav/beauty/b/d;->r:F

    .line 15
    .line 16
    iget v1, p0, Lcom/tencent/liteav/basic/c/h;->f:I

    .line 17
    .line 18
    int-to-float v1, v1

    .line 19
    div-float/2addr v0, v1

    .line 20
    invoke-virtual {p0, p1, v0}, Lcom/tencent/liteav/basic/c/h;->a(IF)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public a(II)V
    .locals 0

    .line 24
    invoke-super {p0, p1, p2}, Lcom/tencent/liteav/basic/c/h;->a(II)V

    .line 25
    iget p1, p0, Lcom/tencent/liteav/beauty/b/d;->r:F

    invoke-virtual {p0, p1}, Lcom/tencent/liteav/beauty/b/d;->a(F)V

    return-void
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
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget v0, p0, Lcom/tencent/liteav/basic/c/h;->a:I

    .line 8
    .line 9
    const-string v1, "texelWidthOffset"

    .line 10
    .line 11
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iput v0, p0, Lcom/tencent/liteav/beauty/b/d;->s:I

    .line 16
    .line 17
    iget v0, p0, Lcom/tencent/liteav/basic/c/h;->a:I

    .line 18
    .line 19
    const-string v1, "texelHeightOffset"

    .line 20
    .line 21
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    iput v0, p0, Lcom/tencent/liteav/beauty/b/d;->t:I

    .line 26
    .line 27
    const/4 p0, 0x1

    .line 28
    return p0

    .line 29
    :cond_0
    const/4 p0, 0x0

    .line 30
    return p0
.end method
