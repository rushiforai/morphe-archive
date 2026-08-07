.class public Lcom/momo/mcamera/mask/StickerCutFaceItem;
.super Lcom/momo/mcamera/mask/StickerItem;
.source "SourceFile"


# instance fields
.field private mBitmap:Ll/umw;

.field public mCutFaceList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "[F>;"
        }
    .end annotation
.end field

.field public mFacePositions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/momo/mcamera/mask/FacePositions;",
            ">;"
        }
    .end annotation
.end field

.field mStickerScale:F

.field realWidth:F

.field renderHeight:I

.field renderWidth:I

.field texData1:[F


# direct methods
.method public constructor <init>(Lcom/momo/mcamera/mask/Sticker;Landroid/content/Context;)V
    .locals 9

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/momo/mcamera/mask/StickerItem;-><init>(Lcom/momo/mcamera/mask/Sticker;Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p2, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    invoke-static {p2}, Ljava/util/Collections;->synchronizedList(Ljava/util/List;)Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    iput-object p2, p0, Lcom/momo/mcamera/mask/StickerCutFaceItem;->mCutFaceList:Ljava/util/List;

    .line 14
    .line 15
    const/high16 p2, 0x3f000000    # 0.5f

    .line 16
    .line 17
    iput p2, p0, Lcom/momo/mcamera/mask/StickerCutFaceItem;->realWidth:F

    .line 18
    .line 19
    const v0, 0x3fe38e39

    .line 20
    .line 21
    .line 22
    iput v0, p0, Lcom/momo/mcamera/mask/StickerCutFaceItem;->mStickerScale:F

    .line 23
    .line 24
    const/4 v1, 0x0

    .line 25
    iput v1, p0, Lcom/momo/mcamera/mask/StickerCutFaceItem;->renderWidth:I

    .line 26
    .line 27
    iput v1, p0, Lcom/momo/mcamera/mask/StickerCutFaceItem;->renderHeight:I

    .line 28
    .line 29
    neg-float v2, p2

    .line 30
    mul-float v3, p2, v0

    .line 31
    .line 32
    neg-float v3, v3

    .line 33
    neg-float v4, p2

    .line 34
    mul-float/2addr v4, v0

    .line 35
    neg-float v5, p2

    .line 36
    mul-float v6, p2, v0

    .line 37
    .line 38
    mul-float/2addr v0, p2

    .line 39
    const/16 v7, 0x10

    .line 40
    .line 41
    new-array v7, v7, [F

    .line 42
    .line 43
    aput v2, v7, v1

    .line 44
    .line 45
    const/4 v1, 0x1

    .line 46
    aput v3, v7, v1

    .line 47
    .line 48
    const/4 v2, 0x2

    .line 49
    const/4 v3, 0x0

    .line 50
    aput v3, v7, v2

    .line 51
    .line 52
    const/4 v2, 0x3

    .line 53
    const/high16 v8, 0x3f800000    # 1.0f

    .line 54
    .line 55
    aput v8, v7, v2

    .line 56
    .line 57
    const/4 v2, 0x4

    .line 58
    aput p2, v7, v2

    .line 59
    .line 60
    const/4 v2, 0x5

    .line 61
    aput v4, v7, v2

    .line 62
    .line 63
    const/4 v2, 0x6

    .line 64
    aput v3, v7, v2

    .line 65
    .line 66
    const/4 v2, 0x7

    .line 67
    aput v8, v7, v2

    .line 68
    .line 69
    const/16 v2, 0x8

    .line 70
    .line 71
    aput v5, v7, v2

    .line 72
    .line 73
    const/16 v2, 0x9

    .line 74
    .line 75
    aput v6, v7, v2

    .line 76
    .line 77
    const/16 v2, 0xa

    .line 78
    .line 79
    aput v3, v7, v2

    .line 80
    .line 81
    const/16 v2, 0xb

    .line 82
    .line 83
    aput v8, v7, v2

    .line 84
    .line 85
    const/16 v2, 0xc

    .line 86
    .line 87
    aput p2, v7, v2

    .line 88
    .line 89
    const/16 p2, 0xd

    .line 90
    .line 91
    aput v0, v7, p2

    .line 92
    .line 93
    const/16 p2, 0xe

    .line 94
    .line 95
    aput v3, v7, p2

    .line 96
    .line 97
    const/16 p2, 0xf

    .line 98
    .line 99
    aput v8, v7, p2

    .line 100
    .line 101
    iput-object v7, p0, Lcom/momo/mcamera/mask/StickerCutFaceItem;->texData1:[F

    .line 102
    .line 103
    const/4 p2, 0x0

    .line 104
    iput-object p2, p0, Lcom/momo/mcamera/mask/StickerCutFaceItem;->mBitmap:Ll/umw;

    .line 105
    .line 106
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/StickerItem;->isDraw:Z

    .line 107
    .line 108
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getAdditionalInfo()Lcom/momo/mcamera/mask/bean/StickerAdditionalInfo;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/bean/StickerAdditionalInfo;->getFacePositions()Ljava/util/List;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    iput-object p1, p0, Lcom/momo/mcamera/mask/StickerCutFaceItem;->mFacePositions:Ljava/util/List;

    .line 117
    .line 118
    return-void
.end method


# virtual methods
.method public calculateCutFaceMatrix(FFLandroid/graphics/PointF;F[F)V
    .locals 10

    .line 1
    if-nez p3, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget v0, p3, Landroid/graphics/PointF;->x:F

    .line 5
    .line 6
    const/high16 v1, 0x40000000    # 2.0f

    .line 7
    .line 8
    mul-float/2addr v0, v1

    .line 9
    const/high16 v2, 0x3f800000    # 1.0f

    .line 10
    .line 11
    sub-float/2addr v0, v2

    .line 12
    neg-float v0, v0

    .line 13
    iget p3, p3, Landroid/graphics/PointF;->y:F

    .line 14
    .line 15
    neg-float p3, p3

    .line 16
    mul-float/2addr p3, v1

    .line 17
    add-float/2addr p3, v2

    .line 18
    const/16 v1, 0x10

    .line 19
    .line 20
    new-array v3, v1, [F

    .line 21
    .line 22
    new-array v9, v1, [F

    .line 23
    .line 24
    new-array v5, v1, [F

    .line 25
    .line 26
    const/4 v1, 0x0

    .line 27
    invoke-static {v5, v1}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    .line 28
    .line 29
    .line 30
    const/high16 v4, -0x40800000    # -1.0f

    .line 31
    .line 32
    aput v4, v5, v1

    .line 33
    .line 34
    invoke-static {v9, v1}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    .line 35
    .line 36
    .line 37
    neg-float v0, v0

    .line 38
    const/4 v4, 0x0

    .line 39
    invoke-static {v9, v1, v0, p3, v4}, Landroid/opengl/Matrix;->translateM([FIFFF)V

    .line 40
    .line 41
    .line 42
    iget-object v7, p0, Lcom/momo/mcamera/mask/StickerItem;->mProjectionMatrix:[F

    .line 43
    .line 44
    const/4 v8, 0x0

    .line 45
    const/4 v4, 0x0

    .line 46
    const/4 v6, 0x0

    .line 47
    invoke-static/range {v3 .. v8}, Landroid/opengl/Matrix;->multiplyMM([FI[FI[FI)V

    .line 48
    .line 49
    .line 50
    iget-object v7, p0, Lcom/momo/mcamera/mask/StickerItem;->mProjectionMatrix:[F

    .line 51
    .line 52
    move-object v5, v9

    .line 53
    invoke-static/range {v3 .. v8}, Landroid/opengl/Matrix;->multiplyMM([FI[FI[FI)V

    .line 54
    .line 55
    .line 56
    move-object p3, v5

    .line 57
    const/4 v7, 0x0

    .line 58
    const/high16 v8, 0x3f800000    # 1.0f

    .line 59
    .line 60
    const/4 v6, 0x0

    .line 61
    move v5, p4

    .line 62
    invoke-static/range {v3 .. v8}, Landroid/opengl/Matrix;->rotateM([FIFFFF)V

    .line 63
    .line 64
    .line 65
    mul-float/2addr p1, v2

    .line 66
    mul-float/2addr p2, v2

    .line 67
    invoke-static {v3, v1, p1, p2, v2}, Landroid/opengl/Matrix;->scaleM([FIFFF)V

    .line 68
    .line 69
    .line 70
    const/4 v6, 0x0

    .line 71
    const/4 v8, 0x0

    .line 72
    move-object v7, p5

    .line 73
    move-object v5, v3

    .line 74
    move-object v3, p3

    .line 75
    invoke-static/range {v3 .. v8}, Landroid/opengl/Matrix;->multiplyMM([FI[FI[FI)V

    .line 76
    .line 77
    .line 78
    aget p1, p3, v1

    .line 79
    .line 80
    const/4 p2, 0x1

    .line 81
    aget p4, p3, p2

    .line 82
    .line 83
    const/4 p5, 0x4

    .line 84
    aget v0, p3, p5

    .line 85
    .line 86
    const/4 v2, 0x5

    .line 87
    aget v3, p3, v2

    .line 88
    .line 89
    const/16 v4, 0x8

    .line 90
    .line 91
    aget v5, p3, v4

    .line 92
    .line 93
    const/16 v6, 0x9

    .line 94
    .line 95
    aget v6, p3, v6

    .line 96
    .line 97
    const/16 v7, 0xc

    .line 98
    .line 99
    aget v7, p3, v7

    .line 100
    .line 101
    const/16 v8, 0xd

    .line 102
    .line 103
    aget p3, p3, v8

    .line 104
    .line 105
    new-array v4, v4, [F

    .line 106
    .line 107
    aput p1, v4, v1

    .line 108
    .line 109
    aput p4, v4, p2

    .line 110
    .line 111
    const/4 p1, 0x2

    .line 112
    aput v0, v4, p1

    .line 113
    .line 114
    const/4 p1, 0x3

    .line 115
    aput v3, v4, p1

    .line 116
    .line 117
    aput v5, v4, p5

    .line 118
    .line 119
    aput v6, v4, v2

    .line 120
    .line 121
    const/4 p1, 0x6

    .line 122
    aput v7, v4, p1

    .line 123
    .line 124
    const/4 p1, 0x7

    .line 125
    aput p3, v4, p1

    .line 126
    .line 127
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerCutFaceItem;->mCutFaceList:Ljava/util/List;

    .line 128
    .line 129
    invoke-interface {p0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 130
    .line 131
    .line 132
    return-void
.end method

.method public clearCutFacePoints()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerItem;->maskLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerCutFaceItem;->mCutFaceList:Ljava/util/List;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 9
    .line 10
    .line 11
    goto :goto_0

    .line 12
    :catchall_0
    move-exception p0

    .line 13
    goto :goto_1

    .line 14
    :cond_0
    :goto_0
    monitor-exit v0

    .line 15
    return-void

    .line 16
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    throw p0
.end method

.method public clearPoints()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/momo/mcamera/mask/StickerItem;->clearPoints()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerCutFaceItem;->mCutFaceList:Ljava/util/List;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
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

.method public getMMcvImageLoader()Lcom/momo/mcamera/mask/MmcvImageLoader;
    .locals 2

    .line 1
    new-instance v0, Lcom/momo/mcamera/mask/MmcvImageCacheLoader;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerItem;->context:Landroid/content/Context;

    .line 6
    .line 7
    invoke-direct {v0, v1, p0}, Lcom/momo/mcamera/mask/MmcvImageCacheLoader;-><init>(Lcom/momo/mcamera/mask/Sticker;Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method public getMmcvImage(Landroid/content/Context;)Ll/umw;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerCutFaceItem;->mBitmap:Ll/umw;

    .line 2
    .line 3
    return-object p0
.end method

.method public setDetectParam(Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V
    .locals 12

    .line 1
    invoke-super {p0, p1}, Lcom/momo/mcamera/mask/StickerItem;->setDetectParam(Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/momo/mcamera/mask/StickerCutFaceItem;->renderWidth:I

    .line 5
    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    iget v0, p0, Lcom/momo/mcamera/mask/StickerCutFaceItem;->renderHeight:I

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    goto/16 :goto_1

    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerItem;->mmcvImageLoader:Lcom/momo/mcamera/mask/MmcvImageLoader;

    .line 15
    .line 16
    iget-object v1, p0, Lcom/momo/mcamera/mask/StickerItem;->context:Landroid/content/Context;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lcom/momo/mcamera/mask/MmcvImageLoader;->getMmcvImage(Landroid/content/Context;)Ll/umw;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iput-object v0, p0, Lcom/momo/mcamera/mask/StickerCutFaceItem;->mBitmap:Ll/umw;

    .line 23
    .line 24
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerItem;->mvpLists:Ljava/util/List;

    .line 25
    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-lez v0, :cond_1

    .line 33
    .line 34
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerCutFaceItem;->mCutFaceList:Ljava/util/List;

    .line 35
    .line 36
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerItem;->mmcvImageLoader:Lcom/momo/mcamera/mask/MmcvImageLoader;

    .line 40
    .line 41
    iget-object v0, v0, Lcom/momo/mcamera/mask/MmcvImageLoader;->imagePath:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {p0, v0}, Lcom/momo/mcamera/mask/StickerCutFaceItem;->getImageIndexByPath(Ljava/lang/String;)I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    iget-object v1, p0, Lcom/momo/mcamera/mask/StickerCutFaceItem;->mFacePositions:Ljava/util/List;

    .line 48
    .line 49
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    check-cast v0, Lcom/momo/mcamera/mask/FacePositions;

    .line 54
    .line 55
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/FacePositions;->getStickerFacePositions()Ljava/util/List;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    new-instance v1, Ljava/lang/StringBuilder;

    .line 60
    .line 61
    const-string v2, "in "

    .line 62
    .line 63
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    iget-object v2, p0, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 67
    .line 68
    iget v2, v2, Lcom/momo/mcamera/mask/Sticker;->curIndex:I

    .line 69
    .line 70
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    const-string v2, "huli"

    .line 78
    .line 79
    invoke-static {v2, v1}, Lcom/core/glcore/util/Log4Cam;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 80
    .line 81
    .line 82
    if-eqz v0, :cond_1

    .line 83
    .line 84
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 85
    .line 86
    .line 87
    move-result v1

    .line 88
    if-lez v1, :cond_1

    .line 89
    .line 90
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    if-eqz v1, :cond_1

    .line 99
    .line 100
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    check-cast v1, Lcom/momo/mcamera/mask/StickerFacePosition;

    .line 105
    .line 106
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/StickerFacePosition;->getFacex()I

    .line 107
    .line 108
    .line 109
    move-result v2

    .line 110
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/StickerFacePosition;->getFacey()I

    .line 111
    .line 112
    .line 113
    move-result v3

    .line 114
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/StickerFacePosition;->getRadius()I

    .line 115
    .line 116
    .line 117
    move-result v4

    .line 118
    int-to-double v4, v4

    .line 119
    const-wide v6, 0x3ff199999999999aL    # 1.1

    .line 120
    .line 121
    .line 122
    .line 123
    .line 124
    mul-double/2addr v4, v6

    .line 125
    double-to-int v4, v4

    .line 126
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/StickerFacePosition;->getAngle()I

    .line 127
    .line 128
    .line 129
    move-result v1

    .line 130
    iget v5, p0, Lcom/momo/mcamera/mask/StickerCutFaceItem;->renderWidth:I

    .line 131
    .line 132
    int-to-float v5, v5

    .line 133
    iget-object v6, p0, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 134
    .line 135
    invoke-virtual {v6}, Lcom/momo/mcamera/mask/Sticker;->getImageHeight()I

    .line 136
    .line 137
    .line 138
    move-result v6

    .line 139
    int-to-float v6, v6

    .line 140
    mul-float/2addr v5, v6

    .line 141
    iget v6, p0, Lcom/momo/mcamera/mask/StickerCutFaceItem;->renderHeight:I

    .line 142
    .line 143
    int-to-float v6, v6

    .line 144
    div-float/2addr v5, v6

    .line 145
    int-to-float v2, v2

    .line 146
    iget-object v6, p0, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 147
    .line 148
    invoke-virtual {v6}, Lcom/momo/mcamera/mask/Sticker;->getImageWidth()I

    .line 149
    .line 150
    .line 151
    move-result v6

    .line 152
    int-to-float v6, v6

    .line 153
    sub-float v6, v5, v6

    .line 154
    .line 155
    const/high16 v7, 0x40000000    # 2.0f

    .line 156
    .line 157
    div-float/2addr v6, v7

    .line 158
    add-float/2addr v2, v6

    .line 159
    div-float/2addr v2, v5

    .line 160
    int-to-float v3, v3

    .line 161
    iget-object v5, p0, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 162
    .line 163
    invoke-virtual {v5}, Lcom/momo/mcamera/mask/Sticker;->getImageHeight()I

    .line 164
    .line 165
    .line 166
    move-result v5

    .line 167
    int-to-float v5, v5

    .line 168
    div-float/2addr v3, v5

    .line 169
    iget v5, p1, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->scaleW:F

    .line 170
    .line 171
    iget-object v6, p0, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 172
    .line 173
    invoke-virtual {v6}, Lcom/momo/mcamera/mask/Sticker;->getImageWidth()I

    .line 174
    .line 175
    .line 176
    move-result v6

    .line 177
    int-to-float v6, v6

    .line 178
    div-float/2addr v5, v6

    .line 179
    mul-int/lit8 v4, v4, 0x2

    .line 180
    .line 181
    int-to-float v4, v4

    .line 182
    mul-float v7, v4, v5

    .line 183
    .line 184
    iget v4, p1, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->angle:F

    .line 185
    .line 186
    int-to-float v1, v1

    .line 187
    add-float v10, v4, v1

    .line 188
    .line 189
    const/high16 v1, 0x41800000    # 16.0f

    .line 190
    .line 191
    div-float v1, v7, v1

    .line 192
    .line 193
    const/high16 v4, 0x41100000    # 9.0f

    .line 194
    .line 195
    mul-float v8, v1, v4

    .line 196
    .line 197
    new-instance v9, Landroid/graphics/PointF;

    .line 198
    .line 199
    invoke-direct {v9, v2, v3}, Landroid/graphics/PointF;-><init>(FF)V

    .line 200
    .line 201
    .line 202
    iget-object v11, p0, Lcom/momo/mcamera/mask/StickerCutFaceItem;->texData1:[F

    .line 203
    .line 204
    move-object v6, p0

    .line 205
    invoke-virtual/range {v6 .. v11}, Lcom/momo/mcamera/mask/StickerCutFaceItem;->calculateCutFaceMatrix(FFLandroid/graphics/PointF;F[F)V

    .line 206
    .line 207
    .line 208
    goto :goto_0

    .line 209
    :cond_1
    :goto_1
    return-void
.end method

.method public setRenderSize(II)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/StickerCutFaceItem;->renderWidth:I

    .line 2
    .line 3
    iput p2, p0, Lcom/momo/mcamera/mask/StickerCutFaceItem;->renderHeight:I

    .line 4
    .line 5
    return-void
.end method
