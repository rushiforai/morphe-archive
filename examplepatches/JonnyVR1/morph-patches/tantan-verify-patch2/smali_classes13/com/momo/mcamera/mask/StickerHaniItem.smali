.class public Lcom/momo/mcamera/mask/StickerHaniItem;
.super Lcom/momo/mcamera/mask/StickerItem;
.source "SourceFile"


# instance fields
.field private frameRate:I

.field private haniStartTime:J

.field public mFaceParam:Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;

.field private stickerCount:I

.field private stickerIndex:I


# direct methods
.method public constructor <init>(Lcom/momo/mcamera/mask/Sticker;Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/momo/mcamera/mask/StickerItem;-><init>(Lcom/momo/mcamera/mask/Sticker;Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput p1, p0, Lcom/momo/mcamera/mask/StickerHaniItem;->stickerIndex:I

    .line 6
    .line 7
    const-wide/16 p1, 0x0

    .line 8
    .line 9
    iput-wide p1, p0, Lcom/momo/mcamera/mask/StickerHaniItem;->haniStartTime:J

    .line 10
    .line 11
    iget-object p1, p0, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getFrameNumber()I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    iput p1, p0, Lcom/momo/mcamera/mask/StickerHaniItem;->stickerCount:I

    .line 18
    .line 19
    iget-object p1, p0, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getFrameRate()I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    iput p1, p0, Lcom/momo/mcamera/mask/StickerHaniItem;->frameRate:I

    .line 26
    .line 27
    return-void
.end method


# virtual methods
.method public getMmcvImage(Landroid/content/Context;)Ll/umw;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 2
    .line 3
    iget v1, p0, Lcom/momo/mcamera/mask/StickerHaniItem;->stickerIndex:I

    .line 4
    .line 5
    invoke-virtual {v0, p1, v1}, Lcom/momo/mcamera/mask/Sticker;->getImagePathByIndex(Landroid/content/Context;I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerItem;->mmcvImage:Ll/umw;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    new-instance v0, Ll/umw;

    .line 14
    .line 15
    invoke-direct {v0}, Ll/umw;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lcom/momo/mcamera/mask/StickerItem;->mmcvImage:Ll/umw;

    .line 19
    .line 20
    invoke-static {p1}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget-object v1, p0, Lcom/momo/mcamera/mask/StickerItem;->mmcvImage:Ll/umw;

    .line 25
    .line 26
    invoke-virtual {v1}, Ll/umw;->a()[B

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    if-nez v1, :cond_0

    .line 31
    .line 32
    iget-object v1, p0, Lcom/momo/mcamera/mask/StickerItem;->mmcvImage:Ll/umw;

    .line 33
    .line 34
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    mul-int/2addr v2, v3

    .line 43
    mul-int/lit8 v2, v2, 0x4

    .line 44
    .line 45
    new-array v2, v2, [B

    .line 46
    .line 47
    invoke-virtual {v1, v2}, Ll/umw;->g([B)V

    .line 48
    .line 49
    .line 50
    :cond_0
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 51
    .line 52
    .line 53
    :cond_1
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerItem;->mmcvImage:Ll/umw;

    .line 54
    .line 55
    invoke-static {v0, p1}, Lcom/core/glcore/util/ImageUtils;->decodeMMCVImage(Ll/umw;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerItem;->mmcvImage:Ll/umw;

    .line 59
    .line 60
    return-object p0
.end method

.method public setDetectParam(Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerItem;->maskLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget v1, p1, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->scaleW:F

    .line 5
    .line 6
    iget v2, p1, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->scaleH:F

    .line 7
    .line 8
    iget-object v3, p1, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->centerPoint:Landroid/graphics/PointF;

    .line 9
    .line 10
    iget v4, p1, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->angle:F

    .line 11
    .line 12
    invoke-virtual {p0, v1, v2, v3, v4}, Lcom/momo/mcamera/mask/StickerItem;->setParamForMatrix(FFLandroid/graphics/PointF;F)V

    .line 13
    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/StickerItem;->isDraw:Z

    .line 17
    .line 18
    iget-object v1, p0, Lcom/momo/mcamera/mask/StickerHaniItem;->mFaceParam:Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;

    .line 19
    .line 20
    if-nez v1, :cond_0

    .line 21
    .line 22
    new-instance v1, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;

    .line 23
    .line 24
    invoke-direct {v1}, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;-><init>()V

    .line 25
    .line 26
    .line 27
    iput-object v1, p0, Lcom/momo/mcamera/mask/StickerHaniItem;->mFaceParam:Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :catchall_0
    move-exception p0

    .line 31
    goto :goto_1

    .line 32
    :cond_0
    :goto_0
    iput-object p1, p0, Lcom/momo/mcamera/mask/StickerHaniItem;->mFaceParam:Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;

    .line 33
    .line 34
    monitor-exit v0

    .line 35
    return-void

    .line 36
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 37
    throw p0
.end method

.method public setRenderTime(J)V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/momo/mcamera/mask/StickerHaniItem;->haniStartTime:J

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    if-gez v0, :cond_0

    .line 6
    .line 7
    iput-wide p1, p0, Lcom/momo/mcamera/mask/StickerHaniItem;->haniStartTime:J

    .line 8
    .line 9
    :cond_0
    iget-wide v0, p0, Lcom/momo/mcamera/mask/StickerHaniItem;->haniStartTime:J

    .line 10
    .line 11
    const-wide/16 v2, 0x0

    .line 12
    .line 13
    cmp-long v0, v0, v2

    .line 14
    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    iput-wide p1, p0, Lcom/momo/mcamera/mask/StickerHaniItem;->haniStartTime:J

    .line 18
    .line 19
    :cond_1
    iget-wide v0, p0, Lcom/momo/mcamera/mask/StickerHaniItem;->haniStartTime:J

    .line 20
    .line 21
    sub-long/2addr p1, v0

    .line 22
    const/16 v0, 0x3e8

    .line 23
    .line 24
    iget v1, p0, Lcom/momo/mcamera/mask/StickerHaniItem;->frameRate:I

    .line 25
    .line 26
    div-int/2addr v0, v1

    .line 27
    int-to-long v0, v0

    .line 28
    div-long/2addr p1, v0

    .line 29
    long-to-int p1, p1

    .line 30
    iget p2, p0, Lcom/momo/mcamera/mask/StickerHaniItem;->stickerCount:I

    .line 31
    .line 32
    rem-int/2addr p1, p2

    .line 33
    iput p1, p0, Lcom/momo/mcamera/mask/StickerHaniItem;->stickerIndex:I

    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/StickerItem;->clearPoints()V

    .line 36
    .line 37
    .line 38
    iget-object p1, p0, Lcom/momo/mcamera/mask/StickerHaniItem;->mFaceParam:Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;

    .line 39
    .line 40
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/StickerHaniItem;->setDetectParam(Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method
