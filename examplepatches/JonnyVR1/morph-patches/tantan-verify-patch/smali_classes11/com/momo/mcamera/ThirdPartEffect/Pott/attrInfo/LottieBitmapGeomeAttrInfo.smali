.class public Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieBitmapGeomeAttrInfo;
.super Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;
.source "SourceFile"


# instance fields
.field bitmap:Landroid/graphics/Bitmap;

.field bitmapFromeOutter:Z

.field bitmapPath:Ljava/lang/String;

.field maxHeight:I

.field maxWidth:I


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;-><init>(Ljava/lang/String;)V

    .line 3
    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieBitmapGeomeAttrInfo;->bitmapFromeOutter:Z

    .line 7
    .line 8
    const/16 v0, 0x438

    .line 9
    .line 10
    iput v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieBitmapGeomeAttrInfo;->maxWidth:I

    .line 11
    .line 12
    const/16 v0, 0x780

    .line 13
    .line 14
    iput v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieBitmapGeomeAttrInfo;->maxHeight:I

    .line 15
    .line 16
    iput-object p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieBitmapGeomeAttrInfo;->bitmapPath:Ljava/lang/String;

    .line 17
    .line 18
    return-void
.end method

.method private decodeOneImage()V
    .locals 9

    .line 1
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 8
    .line 9
    iget-object v2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieBitmapGeomeAttrInfo;->bitmapPath:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v2, v0}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 12
    .line 13
    .line 14
    iget v2, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    .line 15
    .line 16
    iget v3, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    .line 17
    .line 18
    iget-object v4, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieBitmapGeomeAttrInfo;->bitmapPath:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {v4}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    .line 21
    .line 22
    .line 23
    move-result-object v4

    .line 24
    iput-object v4, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieBitmapGeomeAttrInfo;->bitmap:Landroid/graphics/Bitmap;

    .line 25
    .line 26
    iget v4, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieBitmapGeomeAttrInfo;->maxWidth:I

    .line 27
    .line 28
    iget v5, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieBitmapGeomeAttrInfo;->maxHeight:I

    .line 29
    .line 30
    iget v6, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->targetWidth:I

    .line 31
    .line 32
    if-eqz v6, :cond_0

    .line 33
    .line 34
    iget v7, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->targetHeight:I

    .line 35
    .line 36
    if-eqz v7, :cond_0

    .line 37
    .line 38
    move v4, v6

    .line 39
    move v5, v7

    .line 40
    :cond_0
    if-gt v3, v4, :cond_1

    .line 41
    .line 42
    if-le v3, v5, :cond_3

    .line 43
    .line 44
    :cond_1
    if-le v2, v4, :cond_2

    .line 45
    .line 46
    div-int/2addr v2, v4

    .line 47
    int-to-float v1, v2

    .line 48
    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    goto :goto_0

    .line 53
    :cond_2
    div-int/2addr v3, v5

    .line 54
    int-to-float v1, v3

    .line 55
    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    :cond_3
    :goto_0
    const/4 v2, 0x0

    .line 60
    iput-boolean v2, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 61
    .line 62
    iput v1, v0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 63
    .line 64
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieBitmapGeomeAttrInfo;->bitmapPath:Ljava/lang/String;

    .line 65
    .line 66
    invoke-static {v1}, Lcom/core/glcore/util/ImageUtils;->getBitmapDegree(Ljava/lang/String;)I

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    iget-object v2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieBitmapGeomeAttrInfo;->bitmapPath:Ljava/lang/String;

    .line 71
    .line 72
    invoke-static {v2, v0}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieBitmapGeomeAttrInfo;->bitmap:Landroid/graphics/Bitmap;

    .line 77
    .line 78
    if-eqz v0, :cond_4

    .line 79
    .line 80
    if-eqz v1, :cond_4

    .line 81
    .line 82
    new-instance v7, Landroid/graphics/Matrix;

    .line 83
    .line 84
    invoke-direct {v7}, Landroid/graphics/Matrix;-><init>()V

    .line 85
    .line 86
    .line 87
    int-to-float v0, v1

    .line 88
    invoke-virtual {v7, v0}, Landroid/graphics/Matrix;->postRotate(F)Z

    .line 89
    .line 90
    .line 91
    iget-object v2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieBitmapGeomeAttrInfo;->bitmap:Landroid/graphics/Bitmap;

    .line 92
    .line 93
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    .line 94
    .line 95
    .line 96
    move-result v5

    .line 97
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieBitmapGeomeAttrInfo;->bitmap:Landroid/graphics/Bitmap;

    .line 98
    .line 99
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    .line 100
    .line 101
    .line 102
    move-result v6

    .line 103
    const/4 v8, 0x1

    .line 104
    const/4 v3, 0x0

    .line 105
    const/4 v4, 0x0

    .line 106
    invoke-static/range {v2 .. v8}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieBitmapGeomeAttrInfo;->bitmap:Landroid/graphics/Bitmap;

    .line 111
    .line 112
    :cond_4
    return-void
.end method


# virtual methods
.method public getFrameTexture()[I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieBitmapGeomeAttrInfo;->bitmap:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieBitmapGeomeAttrInfo;->bitmapFromeOutter:Z

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-direct {p0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieBitmapGeomeAttrInfo;->decodeOneImage()V

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieBitmapGeomeAttrInfo;->bitmap:Landroid/graphics/Bitmap;

    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieBitmapGeomeAttrInfo;->bitmap:Landroid/graphics/Bitmap;

    .line 19
    .line 20
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    invoke-virtual {p0, v0, v1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieBitmapGeomeAttrInfo;->updateBitmapInfo(II)V

    .line 25
    .line 26
    .line 27
    iget v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->frameTexture:I

    .line 28
    .line 29
    if-nez v0, :cond_1

    .line 30
    .line 31
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieBitmapGeomeAttrInfo;->bitmap:Landroid/graphics/Bitmap;

    .line 32
    .line 33
    invoke-static {v0}, Lcom/core/glcore/util/TextureHelper;->bitmapToTexture(Landroid/graphics/Bitmap;)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    iput v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->frameTexture:I

    .line 38
    .line 39
    :cond_1
    invoke-super {p0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->getFrameTexture()[I

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0}, Ll/lim;->getAlphaValue()F

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    const/4 v1, 0x0

    .line 47
    cmpg-float v0, v0, v1

    .line 48
    .line 49
    if-ltz v0, :cond_3

    .line 50
    .line 51
    iget p0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->frameTexture:I

    .line 52
    .line 53
    if-nez p0, :cond_2

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_2
    filled-new-array {p0}, [I

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    return-object p0

    .line 61
    :cond_3
    :goto_0
    const/4 p0, 0x0

    .line 62
    return-object p0
.end method

.method public recycleImageBuffers()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->recycleImageBuffers()V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieBitmapGeomeAttrInfo;->bitmapFromeOutter:Z

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieBitmapGeomeAttrInfo;->bitmap:Landroid/graphics/Bitmap;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 13
    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieBitmapGeomeAttrInfo;->bitmap:Landroid/graphics/Bitmap;

    .line 17
    .line 18
    const-string p0, "FilterProcess"

    .line 19
    .line 20
    const-string v0, "Recycle bitmap lottie info !"

    .line 21
    .line 22
    invoke-static {p0, v0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public recycleResourceInGlThread()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->recycleResourceInGlThread()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieBitmapGeomeAttrInfo;->bitmap:Landroid/graphics/Bitmap;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 10
    .line 11
    .line 12
    iput-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieBitmapGeomeAttrInfo;->bitmap:Landroid/graphics/Bitmap;

    .line 13
    .line 14
    :cond_0
    iput-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieBitmapGeomeAttrInfo;->bitmapPath:Ljava/lang/String;

    .line 15
    .line 16
    return-void
.end method

.method public setBitmap(Landroid/graphics/Bitmap;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieBitmapGeomeAttrInfo;->bitmapFromeOutter:Z

    .line 3
    .line 4
    iput-object p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieBitmapGeomeAttrInfo;->bitmap:Landroid/graphics/Bitmap;

    .line 5
    .line 6
    return-void
.end method

.method public setBitmapWithTarget(Landroid/graphics/Bitmap;II)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieBitmapGeomeAttrInfo;->bitmap:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    iput p2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->targetWidth:I

    .line 4
    .line 5
    iput p3, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->targetHeight:I

    .line 6
    .line 7
    const/4 p1, 0x1

    .line 8
    iput-boolean p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieBitmapGeomeAttrInfo;->bitmapFromeOutter:Z

    .line 9
    .line 10
    return-void
.end method

.method public setLottieConfig(Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/Layers;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->setLottieConfig(Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/Layers;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieBitmapGeomeAttrInfo;->bitmapPath:Ljava/lang/String;

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    invoke-direct {p0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieBitmapGeomeAttrInfo;->decodeOneImage()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public updateBitmapInfo(II)V
    .locals 5

    .line 1
    iget v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->targetWidth:I

    .line 2
    .line 3
    const/high16 v1, 0x3f800000    # 1.0f

    .line 4
    .line 5
    if-eqz v0, :cond_3

    .line 6
    .line 7
    iget v2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->targetHeight:I

    .line 8
    .line 9
    if-nez v2, :cond_0

    .line 10
    .line 11
    goto :goto_1

    .line 12
    :cond_0
    int-to-float v0, v0

    .line 13
    mul-float/2addr v0, v1

    .line 14
    int-to-float v2, v2

    .line 15
    div-float/2addr v0, v2

    .line 16
    int-to-float p1, p1

    .line 17
    mul-float v2, p1, v1

    .line 18
    .line 19
    int-to-float p2, p2

    .line 20
    div-float/2addr v2, p2

    .line 21
    cmpl-float v2, v0, v2

    .line 22
    .line 23
    const/high16 v3, 0x40000000    # 2.0f

    .line 24
    .line 25
    const/4 v4, 0x0

    .line 26
    if-lez v2, :cond_1

    .line 27
    .line 28
    div-float/2addr p1, v0

    .line 29
    sub-float p1, p2, p1

    .line 30
    .line 31
    div-float/2addr p1, p2

    .line 32
    div-float/2addr p1, v3

    .line 33
    goto :goto_0

    .line 34
    :cond_1
    mul-float/2addr p2, v0

    .line 35
    sub-float p2, p1, p2

    .line 36
    .line 37
    div-float/2addr p2, p1

    .line 38
    div-float/2addr p2, v3

    .line 39
    move p1, v4

    .line 40
    move v4, p2

    .line 41
    :goto_0
    cmpl-float p2, v4, v1

    .line 42
    .line 43
    if-eqz p2, :cond_2

    .line 44
    .line 45
    cmpl-float p2, p1, v1

    .line 46
    .line 47
    if-eqz p2, :cond_2

    .line 48
    .line 49
    invoke-virtual {p0, v4, p1}, Ll/lim;->cropWidthAndHeightInNormalTextureCoord(FF)V

    .line 50
    .line 51
    .line 52
    :cond_2
    iget p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->targetWidth:I

    .line 53
    .line 54
    iget p2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->targetHeight:I

    .line 55
    .line 56
    invoke-super {p0, p1, p2}, Ll/lim;->updateBitmapInfo(II)V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_3
    :goto_1
    iget v0, p0, Ll/lim;->baseRenderWidth:I

    .line 61
    .line 62
    int-to-float v2, v0

    .line 63
    mul-float/2addr v2, v1

    .line 64
    iget v3, p0, Ll/lim;->baseRenderHeight:I

    .line 65
    .line 66
    int-to-float v4, v3

    .line 67
    div-float/2addr v2, v4

    .line 68
    int-to-float p1, p1

    .line 69
    mul-float/2addr p1, v1

    .line 70
    int-to-float p2, p2

    .line 71
    div-float/2addr p1, p2

    .line 72
    cmpl-float p2, v2, p1

    .line 73
    .line 74
    if-lez p2, :cond_4

    .line 75
    .line 76
    int-to-float p2, v3

    .line 77
    mul-float/2addr p2, p1

    .line 78
    float-to-int p1, p2

    .line 79
    iput p1, p0, Ll/lim;->bitmapWidth:I

    .line 80
    .line 81
    iput v3, p0, Ll/lim;->bitmapHeight:I

    .line 82
    .line 83
    goto :goto_2

    .line 84
    :cond_4
    iput v0, p0, Ll/lim;->bitmapWidth:I

    .line 85
    .line 86
    int-to-float p2, v3

    .line 87
    div-float/2addr p2, p1

    .line 88
    float-to-int p1, p2

    .line 89
    iput p1, p0, Ll/lim;->bitmapHeight:I

    .line 90
    .line 91
    :goto_2
    iget p1, p0, Ll/lim;->bitmapWidth:I

    .line 92
    .line 93
    iget p2, p0, Ll/lim;->bitmapHeight:I

    .line 94
    .line 95
    invoke-super {p0, p1, p2}, Ll/lim;->updateBitmapInfo(II)V

    .line 96
    .line 97
    .line 98
    return-void
.end method
