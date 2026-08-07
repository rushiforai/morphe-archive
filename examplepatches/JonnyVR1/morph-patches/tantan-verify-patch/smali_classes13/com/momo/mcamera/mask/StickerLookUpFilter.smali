.class public Lcom/momo/mcamera/mask/StickerLookUpFilter;
.super Lcom/momo/mcamera/mask/FaceDetectFilter;
.source "SourceFile"


# instance fields
.field private lookUpBitmap:Landroid/graphics/Bitmap;

.field private lookup_texture:I

.field private numOfInputs:I

.field sticker:Lcom/momo/mcamera/mask/Sticker;

.field protected texture:[I

.field private textureHandle:[I


# direct methods
.method public constructor <init>(Lcom/momo/mcamera/mask/Sticker;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/momo/mcamera/mask/FaceDetectFilter;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    iput v0, p0, Lcom/momo/mcamera/mask/StickerLookUpFilter;->numOfInputs:I

    .line 6
    .line 7
    iput-object p1, p0, Lcom/momo/mcamera/mask/StickerLookUpFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    rsub-int/lit8 v2, v1, 0x2

    .line 11
    .line 12
    new-array v2, v2, [I

    .line 13
    .line 14
    iput-object v2, p0, Lcom/momo/mcamera/mask/StickerLookUpFilter;->textureHandle:[I

    .line 15
    .line 16
    sub-int/2addr v0, v1

    .line 17
    new-array v0, v0, [I

    .line 18
    .line 19
    iput-object v0, p0, Lcom/momo/mcamera/mask/StickerLookUpFilter;->texture:[I

    .line 20
    .line 21
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    .line 22
    .line 23
    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 24
    .line 25
    .line 26
    const/4 v1, 0x0

    .line 27
    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inScaled:Z

    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getLookUpModel()Lcom/momo/mcamera/mask/LookUpModel;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/LookUpModel;->getLookupPath()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-static {p1, v0}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    iput-object p1, p0, Lcom/momo/mcamera/mask/StickerLookUpFilter;->lookUpBitmap:Landroid/graphics/Bitmap;

    .line 42
    .line 43
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

.method public destroy()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/gfj;->destroy()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerLookUpFilter;->lookUpBitmap:Landroid/graphics/Bitmap;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-object v0, p0, Lcom/momo/mcamera/mask/StickerLookUpFilter;->lookUpBitmap:Landroid/graphics/Bitmap;

    .line 13
    .line 14
    :cond_0
    iget v0, p0, Lcom/momo/mcamera/mask/StickerLookUpFilter;->lookup_texture:I

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    filled-new-array {v0}, [I

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const/4 v1, 0x1

    .line 23
    const/4 v2, 0x0

    .line 24
    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 25
    .line 26
    .line 27
    iput v2, p0, Lcom/momo/mcamera/mask/StickerLookUpFilter;->lookup_texture:I

    .line 28
    .line 29
    :cond_1
    return-void
.end method

.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision mediump float;\nuniform sampler2D inputImageTexture0;\nuniform sampler2D inputImageTexture1;\nvarying vec2 textureCoordinate;\nvoid main(){\n  vec4 texColour = texture2D(inputImageTexture0,textureCoordinate);\n  float blueColor = texColour.b * 63.0;\n  vec2 quad1;\n  quad1.y = floor(floor(blueColor) / 8.0);\n  quad1.x = floor(blueColor) - (quad1.y * 8.0);\n  vec2 quad2;\n  quad2.y = floor(ceil(blueColor) / 8.0);\n  quad2.x = ceil(blueColor) - (quad2.y * 8.0);\n  vec2 texPos1;\n  texPos1.x = (quad1.x * 0.125) + 0.5/512.0 + ((0.125 - 1.0/512.0) * texColour.r);\n  texPos1.y = (quad1.y * 0.125) + 0.5/512.0 + ((0.125 - 1.0/512.0) * texColour.g);\n  vec2 texPos2;\n  texPos2.x = (quad2.x * 0.125) + 0.5/512.0 + ((0.125 - 1.0/512.0) * texColour.r);\n  texPos2.y = (quad2.y * 0.125) + 0.5/512.0 + ((0.125 - 1.0/512.0) * texColour.g);\n  vec4 newColor1 = texture2D(inputImageTexture1, texPos1);\n  vec4 newColor2 = texture2D(inputImageTexture1, texPos2);\n  vec4 newColor = mix(newColor1, newColor2, fract(blueColor));\n  gl_FragColor = vec4(newColor.rgb, texColour.a);\n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public initShaderHandles()V
    .locals 5

    .line 1
    invoke-super {p0}, Ll/wej;->initShaderHandles()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    :goto_0
    iget v1, p0, Lcom/momo/mcamera/mask/StickerLookUpFilter;->numOfInputs:I

    .line 6
    .line 7
    add-int/lit8 v1, v1, -0x1

    .line 8
    .line 9
    if-ge v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v1, p0, Lcom/momo/mcamera/mask/StickerLookUpFilter;->textureHandle:[I

    .line 12
    .line 13
    iget v2, p0, Ll/wej;->programHandle:I

    .line 14
    .line 15
    new-instance v3, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    const-string v4, "inputImageTexture"

    .line 18
    .line 19
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    add-int/lit8 v4, v0, 0x1

    .line 23
    .line 24
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    invoke-static {v2, v3}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    aput v2, v1, v0

    .line 36
    .line 37
    move v0, v4

    .line 38
    goto :goto_0

    .line 39
    :cond_0
    return-void
.end method

.method public newTextureReady(ILl/gfj;Z)V
    .locals 1

    .line 1
    if-eqz p3, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/gfj;->markAsDirty()V

    .line 4
    .line 5
    .line 6
    :cond_0
    iget p3, p0, Lcom/momo/mcamera/mask/StickerLookUpFilter;->lookup_texture:I

    .line 7
    .line 8
    if-nez p3, :cond_1

    .line 9
    .line 10
    iget-object p3, p0, Lcom/momo/mcamera/mask/StickerLookUpFilter;->lookUpBitmap:Landroid/graphics/Bitmap;

    .line 11
    .line 12
    invoke-static {p3}, Ll/oim;->a(Landroid/graphics/Bitmap;)I

    .line 13
    .line 14
    .line 15
    move-result p3

    .line 16
    iput p3, p0, Lcom/momo/mcamera/mask/StickerLookUpFilter;->lookup_texture:I

    .line 17
    .line 18
    :cond_1
    iput p1, p0, Ll/wej;->texture_in:I

    .line 19
    .line 20
    iget-object p1, p0, Lcom/momo/mcamera/mask/StickerLookUpFilter;->texture:[I

    .line 21
    .line 22
    const/4 p3, 0x0

    .line 23
    iget v0, p0, Lcom/momo/mcamera/mask/StickerLookUpFilter;->lookup_texture:I

    .line 24
    .line 25
    aput v0, p1, p3

    .line 26
    .line 27
    invoke-virtual {p2}, Ll/wej;->getWidth()I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    invoke-virtual {p0, p1}, Ll/wej;->setWidth(I)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p2}, Ll/wej;->getHeight()I

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    invoke-virtual {p0, p1}, Ll/wej;->setHeight(I)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Ll/wej;->onDrawFrame()V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p2}, Ll/gfj;->unlockRenderBuffer()V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public passShaderValues()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/wej;->passShaderValues()V

    .line 2
    .line 3
    .line 4
    const v0, 0x84c1

    .line 5
    .line 6
    .line 7
    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerLookUpFilter;->texture:[I

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    aget v0, v0, v1

    .line 14
    .line 15
    const/16 v2, 0xde1

    .line 16
    .line 17
    invoke-static {v2, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerLookUpFilter;->textureHandle:[I

    .line 21
    .line 22
    aget p0, p0, v1

    .line 23
    .line 24
    const/4 v0, 0x1

    .line 25
    invoke-static {p0, v0}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public releaseFrameBuffer()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/gfj;->releaseFrameBuffer()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/momo/mcamera/mask/StickerLookUpFilter;->lookup_texture:I

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    filled-new-array {v0}, [I

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/4 v1, 0x1

    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 15
    .line 16
    .line 17
    iput v2, p0, Lcom/momo/mcamera/mask/StickerLookUpFilter;->lookup_texture:I

    .line 18
    .line 19
    :cond_0
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
