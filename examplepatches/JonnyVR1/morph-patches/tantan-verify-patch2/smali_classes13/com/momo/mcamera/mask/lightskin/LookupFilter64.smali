.class public Lcom/momo/mcamera/mask/lightskin/LookupFilter64;
.super Ll/hs10;
.source "SourceFile"

# interfaces
.implements Ll/c5w;


# instance fields
.field private assetRes:Z

.field private context:Landroid/content/Context;

.field private filePath:Ljava/lang/String;

.field private intensity:F

.field private intensityHandler:I

.field private lookupBitmap:Landroid/graphics/Bitmap;

.field private lookup_texture:I

.field private resId:I


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x2

    .line 23
    invoke-direct {p0, v0}, Ll/hs10;-><init>(I)V

    const/high16 v0, 0x3f800000    # 1.0f

    .line 24
    iput v0, p0, Lcom/momo/mcamera/mask/lightskin/LookupFilter64;->intensity:F

    const/4 v0, 0x0

    .line 25
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/lightskin/LookupFilter64;->assetRes:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;I)V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-direct {p0, v0}, Ll/hs10;-><init>(I)V

    .line 3
    .line 4
    .line 5
    const/high16 v0, 0x3f800000    # 1.0f

    .line 6
    .line 7
    iput v0, p0, Lcom/momo/mcamera/mask/lightskin/LookupFilter64;->intensity:F

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/lightskin/LookupFilter64;->assetRes:Z

    .line 11
    .line 12
    iput-object p1, p0, Lcom/momo/mcamera/mask/lightskin/LookupFilter64;->context:Landroid/content/Context;

    .line 13
    .line 14
    iput p2, p0, Lcom/momo/mcamera/mask/lightskin/LookupFilter64;->resId:I

    .line 15
    .line 16
    invoke-direct {p0}, Lcom/momo/mcamera/mask/lightskin/LookupFilter64;->decodeLookupBitmapResource()Landroid/graphics/Bitmap;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iput-object p1, p0, Lcom/momo/mcamera/mask/lightskin/LookupFilter64;->lookupBitmap:Landroid/graphics/Bitmap;

    .line 21
    .line 22
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 0

    const/4 p1, 0x2

    .line 26
    invoke-direct {p0, p1}, Ll/hs10;-><init>(I)V

    const/high16 p1, 0x3f800000    # 1.0f

    .line 27
    iput p1, p0, Lcom/momo/mcamera/mask/lightskin/LookupFilter64;->intensity:F

    const/4 p1, 0x0

    .line 28
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/lightskin/LookupFilter64;->assetRes:Z

    .line 29
    iput-object p2, p0, Lcom/momo/mcamera/mask/lightskin/LookupFilter64;->filePath:Ljava/lang/String;

    .line 30
    invoke-direct {p0}, Lcom/momo/mcamera/mask/lightskin/LookupFilter64;->decodeLookupBitmapFile()Landroid/graphics/Bitmap;

    move-result-object p1

    iput-object p1, p0, Lcom/momo/mcamera/mask/lightskin/LookupFilter64;->lookupBitmap:Landroid/graphics/Bitmap;

    return-void
.end method

.method private decodeLookupAssetsRes()Landroid/graphics/Bitmap;
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    iget-object v1, p0, Lcom/momo/mcamera/mask/lightskin/LookupFilter64;->context:Landroid/content/Context;

    .line 3
    .line 4
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    invoke-virtual {v1}, Landroid/content/res/Resources;->getAssets()Landroid/content/res/AssetManager;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    iget-object p0, p0, Lcom/momo/mcamera/mask/lightskin/LookupFilter64;->filePath:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {v1, p0}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    .line 15
    .line 16
    .line 17
    move-result-object p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 18
    :try_start_1
    invoke-static {p0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    .line 19
    .line 20
    .line 21
    move-result-object v0
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 22
    :goto_0
    :try_start_2
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 23
    .line 24
    .line 25
    goto :goto_2

    .line 26
    :catch_0
    move-exception p0

    .line 27
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 28
    .line 29
    .line 30
    goto :goto_2

    .line 31
    :catchall_0
    move-exception v0

    .line 32
    goto :goto_3

    .line 33
    :catch_1
    move-exception v1

    .line 34
    goto :goto_1

    .line 35
    :catchall_1
    move-exception p0

    .line 36
    move-object v2, v0

    .line 37
    move-object v0, p0

    .line 38
    move-object p0, v2

    .line 39
    goto :goto_3

    .line 40
    :catch_2
    move-exception v1

    .line 41
    move-object p0, v0

    .line 42
    :goto_1
    :try_start_3
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :goto_2
    return-object v0

    .line 47
    :goto_3
    :try_start_4
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3

    .line 48
    .line 49
    .line 50
    goto :goto_4

    .line 51
    :catch_3
    move-exception p0

    .line 52
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 53
    .line 54
    .line 55
    :goto_4
    throw v0
.end method

.method private decodeLookupBitmapFile()Landroid/graphics/Bitmap;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/lightskin/LookupFilter64;->filePath:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return-object p0

    .line 11
    :cond_0
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    .line 12
    .line 13
    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 14
    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inScaled:Z

    .line 18
    .line 19
    iget-object p0, p0, Lcom/momo/mcamera/mask/lightskin/LookupFilter64;->filePath:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {p0, v0}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method private decodeLookupBitmapResource()Landroid/graphics/Bitmap;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/lightskin/LookupFilter64;->context:Landroid/content/Context;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget v0, p0, Lcom/momo/mcamera/mask/lightskin/LookupFilter64;->resId:I

    .line 6
    .line 7
    if-gtz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    .line 11
    .line 12
    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 13
    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inScaled:Z

    .line 17
    .line 18
    iget-object v1, p0, Lcom/momo/mcamera/mask/lightskin/LookupFilter64;->context:Landroid/content/Context;

    .line 19
    .line 20
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    iget p0, p0, Lcom/momo/mcamera/mask/lightskin/LookupFilter64;->resId:I

    .line 25
    .line 26
    invoke-static {v1, p0, v0}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;ILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0

    .line 31
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 32
    return-object p0
.end method


# virtual methods
.method public destroy()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/hs10;->destroy()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/momo/mcamera/mask/lightskin/LookupFilter64;->lookup_texture:I

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
    iput v2, p0, Lcom/momo/mcamera/mask/lightskin/LookupFilter64;->lookup_texture:I

    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/lightskin/LookupFilter64;->lookupBitmap:Landroid/graphics/Bitmap;

    .line 20
    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-nez v0, :cond_1

    .line 28
    .line 29
    iget-object v0, p0, Lcom/momo/mcamera/mask/lightskin/LookupFilter64;->lookupBitmap:Landroid/graphics/Bitmap;

    .line 30
    .line 31
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 32
    .line 33
    .line 34
    const/4 v0, 0x0

    .line 35
    iput-object v0, p0, Lcom/momo/mcamera/mask/lightskin/LookupFilter64;->lookupBitmap:Landroid/graphics/Bitmap;

    .line 36
    .line 37
    :cond_1
    return-void
.end method

.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision mediump float;\nuniform sampler2D inputImageTexture0;\nuniform sampler2D inputImageTexture1;\nvarying vec2 textureCoordinate;\nuniform float intensity;\nvoid main(){\n  vec4 texColour = texture2D(inputImageTexture0,textureCoordinate);\n  float blueColor = texColour.b * 15.0;\n  vec2 quad1;\n  quad1.y = floor(floor(blueColor) / 4.0);\n  quad1.x = floor(blueColor) - (quad1.y * 4.0);\n  vec2 quad2;\n  quad2.y = floor(ceil(blueColor) / 4.0);\n  quad2.x = ceil(blueColor) - (quad2.y * 4.0);\n  vec2 texPos1;\n  texPos1.x = (quad1.x * 0.25) + 0.5/64.0 + ((0.25 - 1.0/64.0) * texColour.r);\n  texPos1.y = (quad1.y * 0.25) + 0.5/64.0 + ((0.25 - 1.0/64.0) * texColour.g);\n  vec2 texPos2;\n  texPos2.x = (quad2.x * 0.25) + 0.5/64.0 + ((0.25 - 1.0/64.0) * texColour.r);\n  texPos2.y = (quad2.y * 0.25) + 0.5/64.0 + ((0.25 - 1.0/64.0) * texColour.g);\n  vec4 newColor1 = texture2D(inputImageTexture1, texPos1);\n  vec4 newColor2 = texture2D(inputImageTexture1, texPos2);\n  vec4 newColor = mix(newColor1, newColor2, fract(blueColor));\n  gl_FragColor = mix(texColour, vec4(newColor.rgb, texColour.a), intensity);\n}\n"

    .line 2
    .line 3
    return-object p0
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
    invoke-super {p0}, Ll/hs10;->initShaderHandles()V

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
    iput v0, p0, Lcom/momo/mcamera/mask/lightskin/LookupFilter64;->intensityHandler:I

    .line 13
    .line 14
    return-void
.end method

.method public newTextureReady(ILl/gfj;Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/hs10;->filterLocations:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x2

    .line 8
    const/4 v2, 0x0

    .line 9
    if-lt v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/hs10;->filterLocations:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p2, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    :cond_0
    invoke-virtual {p0}, Ll/hs10;->clearRegisteredFilterLocations()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, p2, v2}, Ll/hs10;->registerFilterLocation(Ll/gfj;I)V

    .line 27
    .line 28
    .line 29
    const/4 v0, 0x1

    .line 30
    invoke-virtual {p0, p0, v0}, Ll/hs10;->registerFilterLocation(Ll/gfj;I)V

    .line 31
    .line 32
    .line 33
    :cond_1
    iget v0, p0, Lcom/momo/mcamera/mask/lightskin/LookupFilter64;->lookup_texture:I

    .line 34
    .line 35
    if-nez v0, :cond_6

    .line 36
    .line 37
    iget-object v0, p0, Lcom/momo/mcamera/mask/lightskin/LookupFilter64;->lookupBitmap:Landroid/graphics/Bitmap;

    .line 38
    .line 39
    if-eqz v0, :cond_2

    .line 40
    .line 41
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_5

    .line 46
    .line 47
    :cond_2
    iget v0, p0, Lcom/momo/mcamera/mask/lightskin/LookupFilter64;->resId:I

    .line 48
    .line 49
    if-lez v0, :cond_3

    .line 50
    .line 51
    invoke-direct {p0}, Lcom/momo/mcamera/mask/lightskin/LookupFilter64;->decodeLookupBitmapResource()Landroid/graphics/Bitmap;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    goto :goto_0

    .line 56
    :cond_3
    iget-boolean v0, p0, Lcom/momo/mcamera/mask/lightskin/LookupFilter64;->assetRes:Z

    .line 57
    .line 58
    if-eqz v0, :cond_4

    .line 59
    .line 60
    invoke-direct {p0}, Lcom/momo/mcamera/mask/lightskin/LookupFilter64;->decodeLookupAssetsRes()Landroid/graphics/Bitmap;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    goto :goto_0

    .line 65
    :cond_4
    invoke-direct {p0}, Lcom/momo/mcamera/mask/lightskin/LookupFilter64;->decodeLookupBitmapFile()Landroid/graphics/Bitmap;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    :goto_0
    iput-object v0, p0, Lcom/momo/mcamera/mask/lightskin/LookupFilter64;->lookupBitmap:Landroid/graphics/Bitmap;

    .line 70
    .line 71
    :cond_5
    iget-object v0, p0, Lcom/momo/mcamera/mask/lightskin/LookupFilter64;->lookupBitmap:Landroid/graphics/Bitmap;

    .line 72
    .line 73
    invoke-static {v0}, Ll/oim;->a(Landroid/graphics/Bitmap;)I

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    iput v0, p0, Lcom/momo/mcamera/mask/lightskin/LookupFilter64;->lookup_texture:I

    .line 78
    .line 79
    :cond_6
    iget v0, p0, Lcom/momo/mcamera/mask/lightskin/LookupFilter64;->lookup_texture:I

    .line 80
    .line 81
    invoke-super {p0, v0, p0, p3}, Ll/hs10;->newTextureReady(ILl/gfj;Z)V

    .line 82
    .line 83
    .line 84
    invoke-super {p0, p1, p2, p3}, Ll/hs10;->newTextureReady(ILl/gfj;Z)V

    .line 85
    .line 86
    .line 87
    return-void
.end method

.method public passShaderValues()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/hs10;->passShaderValues()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/momo/mcamera/mask/lightskin/LookupFilter64;->intensityHandler:I

    .line 5
    .line 6
    iget p0, p0, Lcom/momo/mcamera/mask/lightskin/LookupFilter64;->intensity:F

    .line 7
    .line 8
    invoke-static {v0, p0}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public releaseFrameBuffer()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/gfj;->releaseFrameBuffer()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/momo/mcamera/mask/lightskin/LookupFilter64;->lookup_texture:I

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
    iput v2, p0, Lcom/momo/mcamera/mask/lightskin/LookupFilter64;->lookup_texture:I

    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public setAssetResourcesId(Landroid/content/Context;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/lightskin/LookupFilter64;->context:Landroid/content/Context;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/momo/mcamera/mask/lightskin/LookupFilter64;->filePath:Ljava/lang/String;

    .line 4
    .line 5
    const/4 p1, 0x1

    .line 6
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/lightskin/LookupFilter64;->assetRes:Z

    .line 7
    .line 8
    return-void
.end method

.method public setIntensity(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/lightskin/LookupFilter64;->intensity:F

    .line 2
    .line 3
    return-void
.end method

.method public setLookUpPath(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/lightskin/LookupFilter64;->filePath:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setLookupBitmap(Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/lightskin/LookupFilter64;->lookupBitmap:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    return-void
.end method
