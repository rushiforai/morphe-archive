.class public Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;
.super Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerItemGeomeAttrInfo;
.source "SourceFile"

# interfaces
.implements Ll/gam;


# instance fields
.field private final SLIDING_VERTICAL:I

.field private animationEnd:Z

.field curStep:I

.field durationArray:[F

.field frameCount:I

.field horizoneRatio:F

.field lastTimeStampInMs:J

.field nextImage:Ll/umw;

.field preImage:Ll/umw;

.field slidingByOrder:J

.field private slidingMode:I

.field slidingTail:J

.field slidingUpRandom:J

.field speedArray:[F

.field speedOfSlidingPPs:F

.field startIndex:I

.field startIndexArray:[I

.field startPosArray:[F

.field startTimeStampInMs:J

.field startingNumber:I

.field tailOffset:F

.field textures:[I

.field private totalCnt:I

.field verticalRatio:F


# direct methods
.method public constructor <init>(Lcom/momo/mcamera/mask/Sticker;I)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerItemGeomeAttrInfo;-><init>(Lcom/momo/mcamera/mask/Sticker;Landroid/content/Context;)V

    .line 3
    .line 4
    .line 5
    const/high16 p1, 0x3f800000    # 1.0f

    .line 6
    .line 7
    iput p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->verticalRatio:F

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    iput p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->horizoneRatio:F

    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    iput p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->SLIDING_VERTICAL:I

    .line 14
    .line 15
    iput p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->slidingMode:I

    .line 16
    .line 17
    iput-boolean p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->animationEnd:Z

    .line 18
    .line 19
    const/16 v0, 0xa

    .line 20
    .line 21
    iput v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->totalCnt:I

    .line 22
    .line 23
    new-instance v0, Ll/umw;

    .line 24
    .line 25
    invoke-direct {v0}, Ll/umw;-><init>()V

    .line 26
    .line 27
    .line 28
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->preImage:Ll/umw;

    .line 29
    .line 30
    new-instance v0, Ll/umw;

    .line 31
    .line 32
    invoke-direct {v0}, Ll/umw;-><init>()V

    .line 33
    .line 34
    .line 35
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->nextImage:Ll/umw;

    .line 36
    .line 37
    const/4 v0, 0x2

    .line 38
    new-array v0, v0, [I

    .line 39
    .line 40
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->textures:[I

    .line 41
    .line 42
    const-wide/16 v0, -0x1

    .line 43
    .line 44
    iput-wide v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->startTimeStampInMs:J

    .line 45
    .line 46
    iput-wide v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->lastTimeStampInMs:J

    .line 47
    .line 48
    const-wide/16 v0, 0xe74

    .line 49
    .line 50
    iput-wide v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->slidingTail:J

    .line 51
    .line 52
    const-wide/16 v0, 0x320

    .line 53
    .line 54
    iput-wide v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->slidingUpRandom:J

    .line 55
    .line 56
    const-wide/16 v0, 0x898

    .line 57
    .line 58
    iput-wide v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->slidingByOrder:J

    .line 59
    .line 60
    const/4 v0, 0x1

    .line 61
    iput v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->startingNumber:I

    .line 62
    .line 63
    iput p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->startIndex:I

    .line 64
    .line 65
    iput p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->frameCount:I

    .line 66
    .line 67
    const/4 v0, 0x3

    .line 68
    new-array v1, v0, [I

    .line 69
    .line 70
    iput-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->startIndexArray:[I

    .line 71
    .line 72
    new-array v1, v0, [F

    .line 73
    .line 74
    iput-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->startPosArray:[F

    .line 75
    .line 76
    new-array v1, v0, [F

    .line 77
    .line 78
    fill-array-data v1, :array_0

    .line 79
    .line 80
    .line 81
    iput-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->speedArray:[F

    .line 82
    .line 83
    new-array v0, v0, [F

    .line 84
    .line 85
    fill-array-data v0, :array_1

    .line 86
    .line 87
    .line 88
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->durationArray:[F

    .line 89
    .line 90
    const v0, 0x3e4ccccd    # 0.2f

    .line 91
    .line 92
    .line 93
    iput v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->tailOffset:F

    .line 94
    .line 95
    iput p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->curStep:I

    .line 96
    .line 97
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerItemGeomeAttrInfo;->stickerLoader:Lcom/momo/mcamera/mask/MmcvImageLoader;

    .line 98
    .line 99
    invoke-virtual {v0, p1}, Lcom/momo/mcamera/mask/MmcvImageLoader;->getMmcvImageByIndex(I)Ll/umw;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    iput-object p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->nextImage:Ll/umw;

    .line 104
    .line 105
    invoke-virtual {p1}, Ll/umw;->e()I

    .line 106
    .line 107
    .line 108
    move-result p1

    .line 109
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->nextImage:Ll/umw;

    .line 110
    .line 111
    invoke-virtual {v0}, Ll/umw;->c()I

    .line 112
    .line 113
    .line 114
    move-result v0

    .line 115
    invoke-virtual {p0, p1, v0}, Ll/lim;->updateBitmapInfo(II)V

    .line 116
    .line 117
    .line 118
    iput p2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->startingNumber:I

    .line 119
    .line 120
    invoke-direct {p0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->initInternalParameter()V

    .line 121
    .line 122
    .line 123
    return-void

    .line 124
    nop

    .line 125
    :array_0
    .array-data 4
        0x3f000000    # 0.5f
        0x3e000000    # 0.125f
        -0x43dc28f6    # -0.01f
    .end array-data

    .line 126
    .line 127
    .line 128
    .line 129
    .line 130
    .line 131
    .line 132
    .line 133
    .line 134
    .line 135
    :array_1
    .array-data 4
        0x41600000    # 14.0f
        0x42340000    # 45.0f
        0x425c0000    # 55.0f
    .end array-data
.end method

.method private initInternalParameter()V
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->speedArray:[F

    .line 2
    .line 3
    iget v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->tailOffset:F

    .line 4
    .line 5
    neg-float v1, v1

    .line 6
    iget-object v2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->durationArray:[F

    .line 7
    .line 8
    const/4 v3, 0x2

    .line 9
    aget v4, v2, v3

    .line 10
    .line 11
    const/4 v5, 0x1

    .line 12
    aget v2, v2, v5

    .line 13
    .line 14
    sub-float/2addr v4, v2

    .line 15
    div-float/2addr v1, v4

    .line 16
    aput v1, v0, v3

    .line 17
    .line 18
    :goto_0
    const/4 v0, 0x3

    .line 19
    if-ge v5, v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->speedArray:[F

    .line 22
    .line 23
    aget v0, v0, v5

    .line 24
    .line 25
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->durationArray:[F

    .line 26
    .line 27
    aget v2, v1, v5

    .line 28
    .line 29
    add-int/lit8 v3, v5, -0x1

    .line 30
    .line 31
    aget v1, v1, v3

    .line 32
    .line 33
    sub-float/2addr v2, v1

    .line 34
    mul-float/2addr v0, v2

    .line 35
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->startPosArray:[F

    .line 36
    .line 37
    float-to-double v2, v0

    .line 38
    invoke-static {v2, v3}, Ljava/lang/Math;->ceil(D)D

    .line 39
    .line 40
    .line 41
    move-result-wide v6

    .line 42
    iget v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->tailOffset:F

    .line 43
    .line 44
    float-to-double v8, v0

    .line 45
    add-double/2addr v6, v8

    .line 46
    sub-double/2addr v6, v2

    .line 47
    double-to-float v0, v6

    .line 48
    aput v0, v1, v5

    .line 49
    .line 50
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->startIndexArray:[I

    .line 51
    .line 52
    iget v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->startingNumber:I

    .line 53
    .line 54
    int-to-double v6, v1

    .line 55
    invoke-static {v2, v3}, Ljava/lang/Math;->ceil(D)D

    .line 56
    .line 57
    .line 58
    move-result-wide v1

    .line 59
    sub-double/2addr v6, v1

    .line 60
    iget v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->totalCnt:I

    .line 61
    .line 62
    int-to-double v2, v1

    .line 63
    add-double/2addr v6, v2

    .line 64
    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    .line 65
    .line 66
    add-double/2addr v6, v2

    .line 67
    int-to-double v1, v1

    .line 68
    rem-double/2addr v6, v1

    .line 69
    double-to-int v1, v6

    .line 70
    aput v1, v0, v5

    .line 71
    .line 72
    add-int/lit8 v5, v5, 0x1

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_0
    return-void
.end method

.method private updateInfoByframe(I)V
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    const/high16 v1, 0x3f800000    # 1.0f

    .line 3
    .line 4
    const/4 v2, 0x1

    .line 5
    if-eqz p1, :cond_4

    .line 6
    .line 7
    if-eq p1, v2, :cond_2

    .line 8
    .line 9
    const/4 v3, 0x2

    .line 10
    if-eq p1, v3, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    iget p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->verticalRatio:F

    .line 14
    .line 15
    iget-object v4, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->speedArray:[F

    .line 16
    .line 17
    aget v3, v4, v3

    .line 18
    .line 19
    add-float/2addr p1, v3

    .line 20
    iput p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->verticalRatio:F

    .line 21
    .line 22
    cmpl-float v1, p1, v1

    .line 23
    .line 24
    if-ltz v1, :cond_1

    .line 25
    .line 26
    iget v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->startIndex:I

    .line 27
    .line 28
    int-to-float v0, v0

    .line 29
    add-float/2addr v0, p1

    .line 30
    iget p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->totalCnt:I

    .line 31
    .line 32
    int-to-float p1, p1

    .line 33
    rem-float/2addr v0, p1

    .line 34
    float-to-int p1, v0

    .line 35
    iput p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->startIndex:I

    .line 36
    .line 37
    iput-boolean v2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->needReload:Z

    .line 38
    .line 39
    const/high16 p1, -0x40800000    # -1.0f

    .line 40
    .line 41
    iput p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->verticalRatio:F

    .line 42
    .line 43
    return-void

    .line 44
    :cond_1
    cmpg-float p1, p1, v0

    .line 45
    .line 46
    if-gez p1, :cond_5

    .line 47
    .line 48
    iput v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->verticalRatio:F

    .line 49
    .line 50
    return-void

    .line 51
    :cond_2
    iget p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->curStep:I

    .line 52
    .line 53
    if-eq p1, v2, :cond_3

    .line 54
    .line 55
    iput v2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->curStep:I

    .line 56
    .line 57
    iget-object p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->startPosArray:[F

    .line 58
    .line 59
    aget p1, p1, v2

    .line 60
    .line 61
    iput p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->verticalRatio:F

    .line 62
    .line 63
    iget-object p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->startIndexArray:[I

    .line 64
    .line 65
    aget p1, p1, v2

    .line 66
    .line 67
    iput p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->startIndex:I

    .line 68
    .line 69
    iput-boolean v2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->needReload:Z

    .line 70
    .line 71
    :cond_3
    iget p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->verticalRatio:F

    .line 72
    .line 73
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->speedArray:[F

    .line 74
    .line 75
    aget v0, v0, v2

    .line 76
    .line 77
    add-float/2addr p1, v0

    .line 78
    iput p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->verticalRatio:F

    .line 79
    .line 80
    cmpl-float v0, p1, v1

    .line 81
    .line 82
    if-ltz v0, :cond_5

    .line 83
    .line 84
    iget v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->startIndex:I

    .line 85
    .line 86
    int-to-float v0, v0

    .line 87
    add-float/2addr v0, p1

    .line 88
    iget v3, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->totalCnt:I

    .line 89
    .line 90
    int-to-float v3, v3

    .line 91
    rem-float/2addr v0, v3

    .line 92
    float-to-int v0, v0

    .line 93
    iput v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->startIndex:I

    .line 94
    .line 95
    iput-boolean v2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->needReload:Z

    .line 96
    .line 97
    sub-float/2addr p1, v1

    .line 98
    iput p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->verticalRatio:F

    .line 99
    .line 100
    return-void

    .line 101
    :cond_4
    iget p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->verticalRatio:F

    .line 102
    .line 103
    float-to-double v3, p1

    .line 104
    const-wide/high16 v5, 0x3fe0000000000000L    # 0.5

    .line 105
    .line 106
    add-double/2addr v3, v5

    .line 107
    double-to-float p1, v3

    .line 108
    iput p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->verticalRatio:F

    .line 109
    .line 110
    cmpl-float v1, p1, v1

    .line 111
    .line 112
    if-ltz v1, :cond_5

    .line 113
    .line 114
    iget v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->startIndex:I

    .line 115
    .line 116
    int-to-float v1, v1

    .line 117
    add-float/2addr v1, p1

    .line 118
    iget p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->totalCnt:I

    .line 119
    .line 120
    int-to-float p1, p1

    .line 121
    rem-float/2addr v1, p1

    .line 122
    float-to-int p1, v1

    .line 123
    iput p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->startIndex:I

    .line 124
    .line 125
    iput-boolean v2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->needReload:Z

    .line 126
    .line 127
    iput v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->verticalRatio:F

    .line 128
    .line 129
    :cond_5
    :goto_0
    return-void
.end method


# virtual methods
.method public getFrameTexture()[I
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->updateStatusByFrame()V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->needReload:Z

    .line 5
    .line 6
    if-eqz v0, :cond_2

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->needReload:Z

    .line 10
    .line 11
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->nextImage:Ll/umw;

    .line 12
    .line 13
    invoke-virtual {v1}, Ll/umw;->e()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    const/4 v2, 0x1

    .line 18
    if-lez v1, :cond_0

    .line 19
    .line 20
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->nextImage:Ll/umw;

    .line 21
    .line 22
    iput-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->preImage:Ll/umw;

    .line 23
    .line 24
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerItemGeomeAttrInfo;->stickerLoader:Lcom/momo/mcamera/mask/MmcvImageLoader;

    .line 25
    .line 26
    iget v3, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->startIndex:I

    .line 27
    .line 28
    invoke-virtual {v1, v3}, Lcom/momo/mcamera/mask/MmcvImageLoader;->getMmcvImageByIndex(I)Ll/umw;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    iput-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->nextImage:Ll/umw;

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerItemGeomeAttrInfo;->stickerLoader:Lcom/momo/mcamera/mask/MmcvImageLoader;

    .line 36
    .line 37
    iget v3, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->startIndex:I

    .line 38
    .line 39
    invoke-virtual {v1, v3}, Lcom/momo/mcamera/mask/MmcvImageLoader;->getMmcvImageByIndex(I)Ll/umw;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    iput-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->preImage:Ll/umw;

    .line 44
    .line 45
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerItemGeomeAttrInfo;->stickerLoader:Lcom/momo/mcamera/mask/MmcvImageLoader;

    .line 46
    .line 47
    iget v3, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->startIndex:I

    .line 48
    .line 49
    add-int/2addr v3, v2

    .line 50
    iget v4, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->totalCnt:I

    .line 51
    .line 52
    rem-int/2addr v3, v4

    .line 53
    invoke-virtual {v1, v3}, Lcom/momo/mcamera/mask/MmcvImageLoader;->getMmcvImageByIndex(I)Ll/umw;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    iput-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->nextImage:Ll/umw;

    .line 58
    .line 59
    :goto_0
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->textures:[I

    .line 60
    .line 61
    aget v3, v1, v0

    .line 62
    .line 63
    iget-object v4, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->preImage:Ll/umw;

    .line 64
    .line 65
    if-nez v3, :cond_1

    .line 66
    .line 67
    invoke-static {v4}, Lcom/core/glcore/util/TextureHelper;->bitmapToTexture(Ll/umw;)I

    .line 68
    .line 69
    .line 70
    move-result v3

    .line 71
    aput v3, v1, v0

    .line 72
    .line 73
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->textures:[I

    .line 74
    .line 75
    iget-object v3, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->nextImage:Ll/umw;

    .line 76
    .line 77
    invoke-static {v3}, Lcom/core/glcore/util/TextureHelper;->bitmapToTexture(Ll/umw;)I

    .line 78
    .line 79
    .line 80
    move-result v3

    .line 81
    aput v3, v1, v2

    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_1
    invoke-static {v3, v4}, Lcom/core/glcore/util/TextureHelper;->loadDataToTexture(ILl/umw;)I

    .line 85
    .line 86
    .line 87
    move-result v3

    .line 88
    aput v3, v1, v0

    .line 89
    .line 90
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->textures:[I

    .line 91
    .line 92
    aget v3, v1, v2

    .line 93
    .line 94
    iget-object v4, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->nextImage:Ll/umw;

    .line 95
    .line 96
    invoke-static {v3, v4}, Lcom/core/glcore/util/TextureHelper;->loadDataToTexture(ILl/umw;)I

    .line 97
    .line 98
    .line 99
    move-result v3

    .line 100
    aput v3, v1, v2

    .line 101
    .line 102
    :goto_1
    iget-boolean v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->animationEnd:Z

    .line 103
    .line 104
    if-eqz v1, :cond_2

    .line 105
    .line 106
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->textures:[I

    .line 107
    .line 108
    aget v2, v1, v2

    .line 109
    .line 110
    aput v2, v1, v0

    .line 111
    .line 112
    :cond_2
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->preImage:Ll/umw;

    .line 113
    .line 114
    invoke-virtual {v0}, Ll/umw;->e()I

    .line 115
    .line 116
    .line 117
    move-result v0

    .line 118
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->preImage:Ll/umw;

    .line 119
    .line 120
    invoke-virtual {v1}, Ll/umw;->c()I

    .line 121
    .line 122
    .line 123
    move-result v1

    .line 124
    invoke-virtual {p0, v0, v1}, Ll/lim;->updateBitmapInfo(II)V

    .line 125
    .line 126
    .line 127
    iget-object p0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->textures:[I

    .line 128
    .line 129
    return-object p0
.end method

.method public getHorizoneRatio()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->horizoneRatio:F

    .line 2
    .line 3
    return p0
.end method

.method public getVerticalRatio()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->verticalRatio:F

    .line 2
    .line 3
    return p0
.end method

.method public recycleResourceInGlThread()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerItemGeomeAttrInfo;->recycleResourceInGlThread()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public resetStatus()V
    .locals 3

    .line 1
    invoke-super {p0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerItemGeomeAttrInfo;->resetStatus()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->animationEnd:Z

    .line 6
    .line 7
    iput v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->frameCount:I

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    iput-boolean v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->needReload:Z

    .line 11
    .line 12
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->nextImage:Ll/umw;

    .line 13
    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    invoke-virtual {v1, v0}, Ll/umw;->m(I)V

    .line 17
    .line 18
    .line 19
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->nextImage:Ll/umw;

    .line 20
    .line 21
    invoke-virtual {v1, v0}, Ll/umw;->j(I)V

    .line 22
    .line 23
    .line 24
    :cond_0
    const-wide/16 v1, -0x1

    .line 25
    .line 26
    iput-wide v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->startTimeStampInMs:J

    .line 27
    .line 28
    iput-wide v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->lastTimeStampInMs:J

    .line 29
    .line 30
    iput v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->curStep:I

    .line 31
    .line 32
    const/high16 v1, 0x3f800000    # 1.0f

    .line 33
    .line 34
    iput v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->verticalRatio:F

    .line 35
    .line 36
    iput v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->startIndex:I

    .line 37
    .line 38
    return-void
.end method

.method public setTimeStamp(J)V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->startTimeStampInMs:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    if-gez v0, :cond_0

    .line 8
    .line 9
    iput-wide p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->startTimeStampInMs:J

    .line 10
    .line 11
    :cond_0
    iput-wide p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->lastTimeStampInMs:J

    .line 12
    .line 13
    return-void
.end method

.method public updateAnimationRange([F)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->durationArray:[F

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->initInternalParameter()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public updateStatusByFrame()V
    .locals 6

    .line 1
    iget v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->frameCount:I

    .line 2
    .line 3
    int-to-float v1, v0

    .line 4
    iget-object v2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->durationArray:[F

    .line 5
    .line 6
    const/4 v3, 0x0

    .line 7
    aget v4, v2, v3

    .line 8
    .line 9
    cmpg-float v1, v1, v4

    .line 10
    .line 11
    const/4 v5, 0x1

    .line 12
    if-gtz v1, :cond_0

    .line 13
    .line 14
    invoke-direct {p0, v3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->updateInfoByframe(I)V

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    int-to-float v1, v0

    .line 19
    cmpl-float v1, v1, v4

    .line 20
    .line 21
    if-lez v1, :cond_1

    .line 22
    .line 23
    int-to-float v1, v0

    .line 24
    aget v3, v2, v5

    .line 25
    .line 26
    cmpg-float v1, v1, v3

    .line 27
    .line 28
    if-gtz v1, :cond_1

    .line 29
    .line 30
    invoke-direct {p0, v5}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->updateInfoByframe(I)V

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    int-to-float v1, v0

    .line 35
    aget v3, v2, v5

    .line 36
    .line 37
    cmpl-float v1, v1, v3

    .line 38
    .line 39
    if-lez v1, :cond_2

    .line 40
    .line 41
    int-to-float v0, v0

    .line 42
    const/4 v1, 0x2

    .line 43
    aget v2, v2, v1

    .line 44
    .line 45
    cmpg-float v0, v0, v2

    .line 46
    .line 47
    if-gtz v0, :cond_2

    .line 48
    .line 49
    invoke-direct {p0, v1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->updateInfoByframe(I)V

    .line 50
    .line 51
    .line 52
    :cond_2
    :goto_0
    iget v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->frameCount:I

    .line 53
    .line 54
    add-int/2addr v0, v5

    .line 55
    iput v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->frameCount:I

    .line 56
    .line 57
    return-void
.end method
