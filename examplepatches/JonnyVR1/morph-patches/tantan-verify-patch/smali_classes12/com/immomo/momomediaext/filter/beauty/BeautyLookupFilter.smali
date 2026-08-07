.class public Lcom/immomo/momomediaext/filter/beauty/BeautyLookupFilter;
.super Ll/jt2;
.source "SourceFile"


# instance fields
.field private intensity:F

.field private intensityHandle:I

.field private isResourceChanged:Z

.field private lookupPath:Ljava/lang/String;

.field private lookupTexture:I

.field private lookupTextureHandle:I

.field private originHandle:I

.field private showOrigin:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/jt2;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyLookupFilter;->lookupTexture:I

    .line 6
    .line 7
    iput v0, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyLookupFilter;->lookupTextureHandle:I

    .line 8
    .line 9
    const-string v1, ""

    .line 10
    .line 11
    iput-object v1, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyLookupFilter;->lookupPath:Ljava/lang/String;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    iput v1, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyLookupFilter;->intensity:F

    .line 15
    .line 16
    iput v0, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyLookupFilter;->intensityHandle:I

    .line 17
    .line 18
    iput v0, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyLookupFilter;->originHandle:I

    .line 19
    .line 20
    const/4 v1, 0x1

    .line 21
    iput-boolean v1, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyLookupFilter;->showOrigin:Z

    .line 22
    .line 23
    iput-boolean v0, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyLookupFilter;->isResourceChanged:Z

    .line 24
    .line 25
    return-void
.end method


# virtual methods
.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision mediump float;\nuniform sampler2D inputImageTexture0;\nuniform sampler2D inputImageTexture1;\nvarying vec2 textureCoordinate;\nuniform float intensity;\nuniform float origin;\nvoid main(){\n  if (origin == 1.0) {\n      gl_FragColor = texture2D(inputImageTexture0,textureCoordinate);\n  } else {\n      vec4 texColour = texture2D(inputImageTexture0,textureCoordinate);\n      float blueColor = texColour.b * 63.0;\n      vec2 quad1;\n      quad1.y = floor(floor(blueColor) / 8.0);\n      quad1.x = floor(blueColor) - (quad1.y * 8.0);\n      vec2 quad2;\n      quad2.y = floor(ceil(blueColor) / 8.0);\n      quad2.x = ceil(blueColor) - (quad2.y * 8.0);\n      vec2 texPos1;\n      texPos1.x = (quad1.x * 0.125) + 0.5/512.0 + ((0.125 - 1.0/512.0) * texColour.r);\n      texPos1.y = (quad1.y * 0.125) + 0.5/512.0 + ((0.125 - 1.0/512.0) * texColour.g);\n      vec2 texPos2;\n      texPos2.x = (quad2.x * 0.125) + 0.5/512.0 + ((0.125 - 1.0/512.0) * texColour.r);\n      texPos2.y = (quad2.y * 0.125) + 0.5/512.0 + ((0.125 - 1.0/512.0) * texColour.g);\n      vec4 newColor1 = texture2D(inputImageTexture1, texPos1);\n      vec4 newColor2 = texture2D(inputImageTexture1, texPos2);\n      vec4 newColor = mix(newColor1, newColor2, fract(blueColor));\n      gl_FragColor = mix(texColour, vec4(newColor.rgb, texColour.a), intensity);\n  }\n}\n"

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
    const-string v1, "intensity"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyLookupFilter;->intensityHandle:I

    .line 13
    .line 14
    iget v0, p0, Ll/wej;->programHandle:I

    .line 15
    .line 16
    const-string v1, "origin"

    .line 17
    .line 18
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyLookupFilter;->originHandle:I

    .line 23
    .line 24
    iget v0, p0, Ll/wej;->programHandle:I

    .line 25
    .line 26
    const-string v1, "inputImageTexture1"

    .line 27
    .line 28
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iput v0, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyLookupFilter;->lookupTextureHandle:I

    .line 33
    .line 34
    return-void
.end method

.method public newTextureReady(ILl/gfj;Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/jt2;->newTextureReady(ILl/gfj;Z)V

    .line 2
    .line 3
    .line 4
    iget-boolean p1, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyLookupFilter;->isResourceChanged:Z

    .line 5
    .line 6
    if-eqz p1, :cond_1

    .line 7
    .line 8
    iget-object p1, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyLookupFilter;->lookupPath:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-nez p1, :cond_1

    .line 15
    .line 16
    new-instance p1, Ll/umw;

    .line 17
    .line 18
    invoke-direct {p1}, Ll/umw;-><init>()V

    .line 19
    .line 20
    .line 21
    iget-object p2, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyLookupFilter;->lookupPath:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {p1, p2}, Lcom/core/glcore/util/ImageUtils;->decodeMMCVImage(Ll/umw;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget p2, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyLookupFilter;->lookupTexture:I

    .line 27
    .line 28
    if-nez p2, :cond_0

    .line 29
    .line 30
    invoke-static {p1}, Lcom/core/glcore/util/TextureHelper;->bitmapToTexture(Ll/umw;)I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    iput p1, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyLookupFilter;->lookupTexture:I

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    invoke-static {p2, p1}, Lcom/core/glcore/util/TextureHelper;->loadDataToTexture(ILl/umw;)I

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    iput p1, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyLookupFilter;->lookupTexture:I

    .line 42
    .line 43
    :goto_0
    const/4 p1, 0x0

    .line 44
    iput-boolean p1, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyLookupFilter;->showOrigin:Z

    .line 45
    .line 46
    iput-boolean p1, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyLookupFilter;->isResourceChanged:Z

    .line 47
    .line 48
    :cond_1
    return-void
.end method

.method public passShaderValues()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/wej;->passShaderValues()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyLookupFilter;->intensityHandle:I

    .line 5
    .line 6
    iget v1, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyLookupFilter;->intensity:F

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 9
    .line 10
    .line 11
    iget v0, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyLookupFilter;->originHandle:I

    .line 12
    .line 13
    iget-boolean v1, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyLookupFilter;->showOrigin:Z

    .line 14
    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    const/high16 v1, 0x3f800000    # 1.0f

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 v1, 0x0

    .line 21
    :goto_0
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 22
    .line 23
    .line 24
    const v0, 0x84c1

    .line 25
    .line 26
    .line 27
    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 28
    .line 29
    .line 30
    const/16 v0, 0xde1

    .line 31
    .line 32
    iget v1, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyLookupFilter;->lookupTexture:I

    .line 33
    .line 34
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 35
    .line 36
    .line 37
    iget p0, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyLookupFilter;->lookupTextureHandle:I

    .line 38
    .line 39
    const/4 v0, 0x1

    .line 40
    invoke-static {p0, v0}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public setIntensity(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyLookupFilter;->intensity:F

    .line 2
    .line 3
    return-void
.end method

.method public setLookupPath(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyLookupFilter;->lookupPath:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iput-boolean p1, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyLookupFilter;->showOrigin:Z

    .line 8
    .line 9
    xor-int/lit8 p1, p1, 0x1

    .line 10
    .line 11
    iput-boolean p1, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyLookupFilter;->isResourceChanged:Z

    .line 12
    .line 13
    return-void
.end method
