.class public Lcom/momo/mcamera/mask/MmcvImageLoader;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field protected STICKER_MMTIME_PER_FRAME:I

.field protected currentTime:J

.field public imagePath:Ljava/lang/String;

.field protected lastCurSticker:I

.field protected lastFrameTime:J

.field protected mCurrentIndex:I

.field private mImageDelegateProvider:Lcom/momo/mcamera/mask/delegate/ImageDelegateProvider;

.field protected mMMCVImage:Ll/umw;

.field mRenderTime:J

.field protected sticker:Lcom/momo/mcamera/mask/Sticker;


# direct methods
.method public constructor <init>(Lcom/momo/mcamera/mask/Sticker;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x32

    .line 5
    .line 6
    iput v0, p0, Lcom/momo/mcamera/mask/MmcvImageLoader;->STICKER_MMTIME_PER_FRAME:I

    .line 7
    .line 8
    const-wide/16 v0, -0x1

    .line 9
    .line 10
    iput-wide v0, p0, Lcom/momo/mcamera/mask/MmcvImageLoader;->mRenderTime:J

    .line 11
    .line 12
    iput-object p1, p0, Lcom/momo/mcamera/mask/MmcvImageLoader;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 13
    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getImageProvider()Lcom/momo/mcamera/mask/delegate/ImageDelegateProvider;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iput-object p1, p0, Lcom/momo/mcamera/mask/MmcvImageLoader;->mImageDelegateProvider:Lcom/momo/mcamera/mask/delegate/ImageDelegateProvider;

    .line 21
    .line 22
    :cond_0
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/MmcvImageLoader;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    iput v1, v0, Lcom/momo/mcamera/mask/Sticker;->curIndex:I

    .line 5
    .line 6
    iget-object v0, p0, Lcom/momo/mcamera/mask/MmcvImageLoader;->mMMCVImage:Ll/umw;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput-object v0, p0, Lcom/momo/mcamera/mask/MmcvImageLoader;->mMMCVImage:Ll/umw;

    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public getCurrentStickerImageIndex()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/MmcvImageLoader;->mCurrentIndex:I

    .line 2
    .line 3
    return p0
.end method

.method public getDelegateBitmap()Landroid/graphics/Bitmap;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/MmcvImageLoader;->mImageDelegateProvider:Lcom/momo/mcamera/mask/delegate/ImageDelegateProvider;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/momo/mcamera/mask/delegate/ImageDelegateProvider;->getRealBitmap()Landroid/graphics/Bitmap;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public getImageIndexByPath(Ljava/lang/String;)I
    .locals 1

    .line 1
    const-string p0, "_"

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    array-length p1, p0

    .line 8
    add-int/lit8 p1, p1, -0x1

    .line 9
    .line 10
    aget-object p0, p0, p1

    .line 11
    .line 12
    const-string p1, ".png"

    .line 13
    .line 14
    const-string v0, ""

    .line 15
    .line 16
    invoke-virtual {p0, p1, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0
.end method

.method public getMmcvImage(Landroid/content/Context;)Ll/umw;
    .locals 10

    .line 1
    iget-wide v0, p0, Lcom/momo/mcamera/mask/MmcvImageLoader;->currentTime:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v2, v0, v2

    .line 6
    .line 7
    if-nez v2, :cond_0

    .line 8
    .line 9
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    :cond_0
    iget-object v2, p0, Lcom/momo/mcamera/mask/MmcvImageLoader;->mMMCVImage:Ll/umw;

    .line 14
    .line 15
    const/4 v3, 0x0

    .line 16
    const-wide/16 v4, -0x1

    .line 17
    .line 18
    if-nez v2, :cond_3

    .line 19
    .line 20
    iget-object v2, p0, Lcom/momo/mcamera/mask/MmcvImageLoader;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 21
    .line 22
    invoke-virtual {v2, p1}, Lcom/momo/mcamera/mask/Sticker;->getImagePath(Landroid/content/Context;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iput-object p1, p0, Lcom/momo/mcamera/mask/MmcvImageLoader;->imagePath:Ljava/lang/String;

    .line 27
    .line 28
    if-nez p1, :cond_1

    .line 29
    .line 30
    return-object v3

    .line 31
    :cond_1
    new-instance p1, Ll/umw;

    .line 32
    .line 33
    invoke-direct {p1}, Ll/umw;-><init>()V

    .line 34
    .line 35
    .line 36
    iput-object p1, p0, Lcom/momo/mcamera/mask/MmcvImageLoader;->mMMCVImage:Ll/umw;

    .line 37
    .line 38
    iget-object v2, p0, Lcom/momo/mcamera/mask/MmcvImageLoader;->imagePath:Ljava/lang/String;

    .line 39
    .line 40
    invoke-static {p1, v2}, Lcom/core/glcore/util/ImageUtils;->decodeMMCVImage(Ll/umw;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    iget-wide v2, p0, Lcom/momo/mcamera/mask/MmcvImageLoader;->mRenderTime:J

    .line 44
    .line 45
    cmp-long p1, v2, v4

    .line 46
    .line 47
    if-nez p1, :cond_2

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_2
    move-wide v0, v2

    .line 51
    :goto_0
    iput-wide v0, p0, Lcom/momo/mcamera/mask/MmcvImageLoader;->lastFrameTime:J

    .line 52
    .line 53
    goto :goto_3

    .line 54
    :cond_3
    iget-wide v6, p0, Lcom/momo/mcamera/mask/MmcvImageLoader;->mRenderTime:J

    .line 55
    .line 56
    cmp-long v2, v6, v4

    .line 57
    .line 58
    iget-wide v8, p0, Lcom/momo/mcamera/mask/MmcvImageLoader;->lastFrameTime:J

    .line 59
    .line 60
    if-nez v2, :cond_4

    .line 61
    .line 62
    sub-long v6, v0, v8

    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_4
    sub-long/2addr v6, v8

    .line 66
    :goto_1
    iget v2, p0, Lcom/momo/mcamera/mask/MmcvImageLoader;->STICKER_MMTIME_PER_FRAME:I

    .line 67
    .line 68
    int-to-long v8, v2

    .line 69
    cmp-long v2, v6, v8

    .line 70
    .line 71
    if-lez v2, :cond_7

    .line 72
    .line 73
    iget-object v2, p0, Lcom/momo/mcamera/mask/MmcvImageLoader;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 74
    .line 75
    invoke-virtual {v2, p1}, Lcom/momo/mcamera/mask/Sticker;->getImagePath(Landroid/content/Context;)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    iput-object p1, p0, Lcom/momo/mcamera/mask/MmcvImageLoader;->imagePath:Ljava/lang/String;

    .line 80
    .line 81
    if-nez p1, :cond_5

    .line 82
    .line 83
    return-object v3

    .line 84
    :cond_5
    iget-wide v2, p0, Lcom/momo/mcamera/mask/MmcvImageLoader;->mRenderTime:J

    .line 85
    .line 86
    cmp-long p1, v2, v4

    .line 87
    .line 88
    if-nez p1, :cond_6

    .line 89
    .line 90
    goto :goto_2

    .line 91
    :cond_6
    move-wide v0, v2

    .line 92
    :goto_2
    iput-wide v0, p0, Lcom/momo/mcamera/mask/MmcvImageLoader;->lastFrameTime:J

    .line 93
    .line 94
    :cond_7
    iget-object p1, p0, Lcom/momo/mcamera/mask/MmcvImageLoader;->mMMCVImage:Ll/umw;

    .line 95
    .line 96
    iget-object v0, p0, Lcom/momo/mcamera/mask/MmcvImageLoader;->imagePath:Ljava/lang/String;

    .line 97
    .line 98
    invoke-static {p1, v0}, Lcom/core/glcore/util/ImageUtils;->decodeMMCVImage(Ll/umw;Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    :goto_3
    iget-object p0, p0, Lcom/momo/mcamera/mask/MmcvImageLoader;->mMMCVImage:Ll/umw;

    .line 102
    .line 103
    return-object p0
.end method

.method public getMmcvImageByIndex(I)Ll/umw;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/MmcvImageLoader;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0, p1}, Lcom/momo/mcamera/mask/Sticker;->getImagePathByIndex(Landroid/content/Context;I)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    if-nez p0, :cond_0

    .line 9
    .line 10
    return-object v0

    .line 11
    :cond_0
    new-instance p1, Ll/umw;

    .line 12
    .line 13
    invoke-direct {p1}, Ll/umw;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-static {p1, p0}, Lcom/core/glcore/util/ImageUtils;->decodeMMCVImage(Ll/umw;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-object p1
.end method

.method public getMmcvTexture(Landroid/content/Context;I)I
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/MmcvImageLoader;->getMmcvImage(Landroid/content/Context;)Ll/umw;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-eqz p1, :cond_1

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/umw;->b()Lcom/momocv/MMFrame;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    if-nez p2, :cond_0

    .line 14
    .line 15
    invoke-static {p1}, Lcom/core/glcore/util/TextureHelper;->bitmapToTexture(Ll/umw;)I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0

    .line 20
    :cond_0
    invoke-static {p2, p1}, Lcom/core/glcore/util/TextureHelper;->loadDataToTexture(ILl/umw;)I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0

    .line 25
    :cond_1
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/MmcvImageLoader;->getDelegateBitmap()Landroid/graphics/Bitmap;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    if-eqz p0, :cond_2

    .line 30
    .line 31
    invoke-static {p0}, Lcom/core/glcore/util/TextureHelper;->bitmapToTexture(Landroid/graphics/Bitmap;)I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    return p0

    .line 36
    :cond_2
    const/4 p0, 0x0

    .line 37
    return p0
.end method

.method public setCurrentTime(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/momo/mcamera/mask/MmcvImageLoader;->currentTime:J

    .line 2
    .line 3
    return-void
.end method

.method public setFrameDuration(J)V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    if-lez v0, :cond_0

    .line 6
    .line 7
    long-to-int p1, p1

    .line 8
    iput p1, p0, Lcom/momo/mcamera/mask/MmcvImageLoader;->STICKER_MMTIME_PER_FRAME:I

    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public setRenderTime(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/momo/mcamera/mask/MmcvImageLoader;->mRenderTime:J

    .line 2
    .line 3
    return-void
.end method
