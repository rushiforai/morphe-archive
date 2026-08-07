.class public Lcom/momo/mcamera/mask/StickerGameEngine;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/mcamera/mask/StickerGameEngine$Trajectory;
    }
.end annotation


# instance fields
.field public columnNumber:I

.field private imageHeight:I

.field private imageWidth:I

.field private mCoreNumber:I

.field mousePosLeftTopX:F

.field mousePosLeftTopY:F

.field mousePosRightBottomX:F

.field mousePosRightBottomY:F

.field private notUsedTrajectory:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field private srcImageHeightScaleRatio:F

.field private srcImageWidthScaleRatio:F

.field private stickHeightScaleRatio:F

.field private stickWidthScaleRatio:F

.field private stickerGroupCount:I

.field public stickerItemList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/momo/mcamera/mask/StickerGameItem;",
            ">;"
        }
    .end annotation
.end field

.field public stickerNumbers:I

.field public trajectoryList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/momo/mcamera/mask/StickerGameEngine$Trajectory;",
            ">;"
        }
    .end annotation
.end field

.field private usedTrajectory:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x5

    .line 5
    iput v0, p0, Lcom/momo/mcamera/mask/StickerGameEngine;->stickerNumbers:I

    .line 6
    .line 7
    const/16 v0, 0xa

    .line 8
    .line 9
    iput v0, p0, Lcom/momo/mcamera/mask/StickerGameEngine;->columnNumber:I

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput v0, p0, Lcom/momo/mcamera/mask/StickerGameEngine;->stickerGroupCount:I

    .line 13
    .line 14
    iput v0, p0, Lcom/momo/mcamera/mask/StickerGameEngine;->mCoreNumber:I

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    iput v1, p0, Lcom/momo/mcamera/mask/StickerGameEngine;->mousePosLeftTopX:F

    .line 18
    .line 19
    iput v1, p0, Lcom/momo/mcamera/mask/StickerGameEngine;->mousePosLeftTopY:F

    .line 20
    .line 21
    iput v1, p0, Lcom/momo/mcamera/mask/StickerGameEngine;->mousePosRightBottomY:F

    .line 22
    .line 23
    iput v1, p0, Lcom/momo/mcamera/mask/StickerGameEngine;->mousePosRightBottomX:F

    .line 24
    .line 25
    iput v0, p0, Lcom/momo/mcamera/mask/StickerGameEngine;->imageWidth:I

    .line 26
    .line 27
    iput v0, p0, Lcom/momo/mcamera/mask/StickerGameEngine;->imageHeight:I

    .line 28
    .line 29
    iput v1, p0, Lcom/momo/mcamera/mask/StickerGameEngine;->srcImageWidthScaleRatio:F

    .line 30
    .line 31
    iput v1, p0, Lcom/momo/mcamera/mask/StickerGameEngine;->srcImageHeightScaleRatio:F

    .line 32
    .line 33
    const v1, 0x3f4ccccd    # 0.8f

    .line 34
    .line 35
    .line 36
    iput v1, p0, Lcom/momo/mcamera/mask/StickerGameEngine;->stickWidthScaleRatio:F

    .line 37
    .line 38
    iput v1, p0, Lcom/momo/mcamera/mask/StickerGameEngine;->stickHeightScaleRatio:F

    .line 39
    .line 40
    new-instance v1, Ljava/util/ArrayList;

    .line 41
    .line 42
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 43
    .line 44
    .line 45
    iput-object v1, p0, Lcom/momo/mcamera/mask/StickerGameEngine;->stickerItemList:Ljava/util/List;

    .line 46
    .line 47
    new-instance v1, Ljava/util/ArrayList;

    .line 48
    .line 49
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 50
    .line 51
    .line 52
    iput-object v1, p0, Lcom/momo/mcamera/mask/StickerGameEngine;->trajectoryList:Ljava/util/List;

    .line 53
    .line 54
    :goto_0
    iget v1, p0, Lcom/momo/mcamera/mask/StickerGameEngine;->stickerNumbers:I

    .line 55
    .line 56
    if-ge v0, v1, :cond_0

    .line 57
    .line 58
    invoke-virtual {p0, v0}, Lcom/momo/mcamera/mask/StickerGameEngine;->generateNewTrajectory(I)V

    .line 59
    .line 60
    .line 61
    add-int/lit8 v0, v0, 0x1

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_0
    return-void
.end method

.method public static synthetic access$000(Lcom/momo/mcamera/mask/StickerGameEngine;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/StickerGameEngine;->mCoreNumber:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$008(Lcom/momo/mcamera/mask/StickerGameEngine;)I
    .locals 2

    .line 1
    iget v0, p0, Lcom/momo/mcamera/mask/StickerGameEngine;->mCoreNumber:I

    .line 2
    .line 3
    add-int/lit8 v1, v0, 0x1

    .line 4
    .line 5
    iput v1, p0, Lcom/momo/mcamera/mask/StickerGameEngine;->mCoreNumber:I

    .line 6
    .line 7
    return v0
.end method

.method public static synthetic access$100(Lcom/momo/mcamera/mask/StickerGameEngine;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/StickerGameEngine;->stickerGroupCount:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$200(Lcom/momo/mcamera/mask/StickerGameEngine;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerGameEngine;->notUsedTrajectory:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$300(Lcom/momo/mcamera/mask/StickerGameEngine;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerGameEngine;->usedTrajectory:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method private generateTrajectoryXPosition()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerGameEngine;->notUsedTrajectory:Ljava/util/List;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/momo/mcamera/mask/StickerGameEngine;->notUsedTrajectory:Ljava/util/List;

    .line 11
    .line 12
    new-instance v0, Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lcom/momo/mcamera/mask/StickerGameEngine;->usedTrajectory:Ljava/util/List;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerGameEngine;->usedTrajectory:Ljava/util/List;

    .line 24
    .line 25
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 26
    .line 27
    .line 28
    :goto_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerGameEngine;->notUsedTrajectory:Ljava/util/List;

    .line 29
    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    iget v0, p0, Lcom/momo/mcamera/mask/StickerGameEngine;->srcImageWidthScaleRatio:F

    .line 33
    .line 34
    float-to-double v1, v0

    .line 35
    const-wide/16 v3, 0x0

    .line 36
    .line 37
    cmpl-double v1, v1, v3

    .line 38
    .line 39
    if-lez v1, :cond_1

    .line 40
    .line 41
    const/high16 v1, 0x3f800000    # 1.0f

    .line 42
    .line 43
    sub-float v0, v1, v0

    .line 44
    .line 45
    const/high16 v2, 0x40000000    # 2.0f

    .line 46
    .line 47
    div-float/2addr v0, v2

    .line 48
    const v3, 0x3e19999a    # 0.15f

    .line 49
    .line 50
    .line 51
    add-float/2addr v0, v3

    .line 52
    mul-float/2addr v2, v0

    .line 53
    sub-float/2addr v1, v2

    .line 54
    iget v2, p0, Lcom/momo/mcamera/mask/StickerGameEngine;->columnNumber:I

    .line 55
    .line 56
    int-to-float v2, v2

    .line 57
    div-float/2addr v1, v2

    .line 58
    const/4 v2, 0x0

    .line 59
    :goto_1
    iget v3, p0, Lcom/momo/mcamera/mask/StickerGameEngine;->columnNumber:I

    .line 60
    .line 61
    if-ge v2, v3, :cond_1

    .line 62
    .line 63
    add-float/2addr v0, v1

    .line 64
    iget-object v3, p0, Lcom/momo/mcamera/mask/StickerGameEngine;->notUsedTrajectory:Ljava/util/List;

    .line 65
    .line 66
    new-instance v4, Ljava/lang/Float;

    .line 67
    .line 68
    invoke-direct {v4, v0}, Ljava/lang/Float;-><init>(F)V

    .line 69
    .line 70
    .line 71
    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    add-int/lit8 v2, v2, 0x1

    .line 75
    .line 76
    goto :goto_1

    .line 77
    :cond_1
    return-void
.end method

.method private isTriggerRegionMatches(Lcom/momo/mcamera/mask/StickerGameItem;Lcom/momo/mcamera/mask/StickerGameEngine$Trajectory;)Z
    .locals 4

    .line 1
    iget v0, p2, Lcom/momo/mcamera/mask/StickerGameEngine$Trajectory;->xPosition:F

    .line 2
    .line 3
    iget v1, p0, Lcom/momo/mcamera/mask/StickerGameEngine;->imageWidth:I

    .line 4
    .line 5
    int-to-float v1, v1

    .line 6
    mul-float/2addr v0, v1

    .line 7
    iget v1, p2, Lcom/momo/mcamera/mask/StickerGameEngine$Trajectory;->yPosition:F

    .line 8
    .line 9
    iget v2, p0, Lcom/momo/mcamera/mask/StickerGameEngine;->imageHeight:I

    .line 10
    .line 11
    int-to-float v2, v2

    .line 12
    mul-float/2addr v1, v2

    .line 13
    iget v2, p0, Lcom/momo/mcamera/mask/StickerGameEngine;->mousePosLeftTopX:F

    .line 14
    .line 15
    cmpg-float v2, v2, v0

    .line 16
    .line 17
    const/4 v3, 0x1

    .line 18
    if-gez v2, :cond_2

    .line 19
    .line 20
    iget v2, p0, Lcom/momo/mcamera/mask/StickerGameEngine;->mousePosRightBottomX:F

    .line 21
    .line 22
    cmpl-float v0, v2, v0

    .line 23
    .line 24
    if-lez v0, :cond_2

    .line 25
    .line 26
    iget v0, p0, Lcom/momo/mcamera/mask/StickerGameEngine;->mousePosRightBottomY:F

    .line 27
    .line 28
    cmpl-float v0, v0, v1

    .line 29
    .line 30
    if-lez v0, :cond_2

    .line 31
    .line 32
    iget v0, p0, Lcom/momo/mcamera/mask/StickerGameEngine;->mousePosLeftTopY:F

    .line 33
    .line 34
    cmpg-float v0, v0, v1

    .line 35
    .line 36
    if-gez v0, :cond_2

    .line 37
    .line 38
    iget-boolean v0, p1, Lcom/momo/mcamera/mask/StickerGameItem;->isGameLive:Z

    .line 39
    .line 40
    if-nez v0, :cond_0

    .line 41
    .line 42
    iput-boolean v3, p2, Lcom/momo/mcamera/mask/StickerGameEngine$Trajectory;->isTriggered:Z

    .line 43
    .line 44
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/StickerGameItem;->startPlay()V

    .line 45
    .line 46
    .line 47
    iget-object v0, p1, Lcom/momo/mcamera/mask/StickerGameItem;->gameScoreListener:Lcom/momo/mcamera/mask/delegate/GameScoreListener;

    .line 48
    .line 49
    if-eqz v0, :cond_0

    .line 50
    .line 51
    iget-boolean v1, p1, Lcom/momo/mcamera/mask/StickerGameItem;->isGameLive:Z

    .line 52
    .line 53
    if-nez v1, :cond_0

    .line 54
    .line 55
    iget-object p1, p1, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 56
    .line 57
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getAdditionalInfo()Lcom/momo/mcamera/mask/bean/StickerAdditionalInfo;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/bean/StickerAdditionalInfo;->getGameScore()I

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    invoke-interface {v0, p1}, Lcom/momo/mcamera/mask/delegate/GameScoreListener;->onItemTriggered(I)I

    .line 66
    .line 67
    .line 68
    :cond_0
    iput-boolean v3, p2, Lcom/momo/mcamera/mask/StickerGameEngine$Trajectory;->isFixed:Z

    .line 69
    .line 70
    const/4 p1, 0x0

    .line 71
    :goto_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerGameEngine;->usedTrajectory:Ljava/util/List;

    .line 72
    .line 73
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-ge p1, v0, :cond_2

    .line 78
    .line 79
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerGameEngine;->usedTrajectory:Ljava/util/List;

    .line 80
    .line 81
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    check-cast v0, Ljava/lang/Float;

    .line 86
    .line 87
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    .line 88
    .line 89
    .line 90
    move-result v1

    .line 91
    iget v2, p2, Lcom/momo/mcamera/mask/StickerGameEngine$Trajectory;->xPosition:F

    .line 92
    .line 93
    cmpl-float v1, v1, v2

    .line 94
    .line 95
    if-nez v1, :cond_1

    .line 96
    .line 97
    iget-object p2, p0, Lcom/momo/mcamera/mask/StickerGameEngine;->usedTrajectory:Ljava/util/List;

    .line 98
    .line 99
    invoke-interface {p2, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerGameEngine;->notUsedTrajectory:Ljava/util/List;

    .line 103
    .line 104
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    goto :goto_1

    .line 108
    :cond_1
    add-int/lit8 p1, p1, 0x1

    .line 109
    .line 110
    goto :goto_0

    .line 111
    :cond_2
    :goto_1
    return v3
.end method


# virtual methods
.method public addSticker(Lcom/momo/mcamera/mask/StickerGameItem;)V
    .locals 1

    .line 1
    iget-object v0, p1, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 2
    .line 3
    iget-boolean v0, v0, Lcom/momo/mcamera/mask/Sticker;->isGameSticker:Z

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerGameEngine;->stickerItemList:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    iget-boolean p1, p1, Lcom/momo/mcamera/mask/StickerGameItem;->isGameLive:Z

    .line 13
    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    iget p1, p0, Lcom/momo/mcamera/mask/StickerGameEngine;->stickerGroupCount:I

    .line 17
    .line 18
    add-int/lit8 p1, p1, 0x1

    .line 19
    .line 20
    iput p1, p0, Lcom/momo/mcamera/mask/StickerGameEngine;->stickerGroupCount:I

    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public generateNewTrajectory(I)V
    .locals 1

    .line 1
    new-instance v0, Lcom/momo/mcamera/mask/StickerGameEngine$Trajectory;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/momo/mcamera/mask/StickerGameEngine$Trajectory;-><init>(Lcom/momo/mcamera/mask/StickerGameEngine;)V

    .line 4
    .line 5
    .line 6
    iput p1, v0, Lcom/momo/mcamera/mask/StickerGameEngine$Trajectory;->bindStickerGroup:I

    .line 7
    .line 8
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerGameEngine;->trajectoryList:Ljava/util/List;

    .line 9
    .line 10
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public getAdjustHeightScale()F
    .locals 3

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/StickerGameEngine;->imageHeight:I

    .line 2
    .line 3
    int-to-float v0, p0

    .line 4
    const/high16 v1, 0x44200000    # 640.0f

    .line 5
    .line 6
    cmpl-float v0, v0, v1

    .line 7
    .line 8
    const/high16 v2, 0x3f800000    # 1.0f

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    return v2

    .line 13
    :cond_0
    int-to-float p0, p0

    .line 14
    mul-float/2addr p0, v2

    .line 15
    div-float/2addr p0, v1

    .line 16
    return p0
.end method

.method public setGameScoreListener(Lcom/momo/mcamera/mask/delegate/GameScoreListener;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerGameEngine;->stickerItemList:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/momo/mcamera/mask/StickerItem;

    .line 18
    .line 19
    check-cast v0, Lcom/momo/mcamera/mask/StickerGameItem;

    .line 20
    .line 21
    invoke-virtual {v0, p1}, Lcom/momo/mcamera/mask/StickerGameItem;->setGameScoreListener(Lcom/momo/mcamera/mask/delegate/GameScoreListener;)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    return-void
.end method

.method public setImageHeight(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/StickerGameEngine;->imageHeight:I

    .line 2
    .line 3
    return-void
.end method

.method public setImageWidth(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/StickerGameEngine;->imageWidth:I

    .line 2
    .line 3
    return-void
.end method

.method public setSrcImageHeightScaleRatio(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/StickerGameEngine;->srcImageHeightScaleRatio:F

    .line 2
    .line 3
    return-void
.end method

.method public setSrcImageWidthScaleRatio(F)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/momo/mcamera/mask/StickerGameEngine;->srcImageWidthScaleRatio:F

    .line 2
    .line 3
    cmpl-float v0, v0, p1

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iput p1, p0, Lcom/momo/mcamera/mask/StickerGameEngine;->srcImageWidthScaleRatio:F

    .line 8
    .line 9
    invoke-direct {p0}, Lcom/momo/mcamera/mask/StickerGameEngine;->generateTrajectoryXPosition()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public declared-synchronized setTimeStamp(J)V
    .locals 8

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerGameEngine;->notUsedTrajectory:Ljava/util/List;

    .line 3
    .line 4
    if-eqz v0, :cond_7

    .line 5
    .line 6
    iget v0, p0, Lcom/momo/mcamera/mask/StickerGameEngine;->imageWidth:I

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    goto :goto_2

    .line 11
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/momo/mcamera/mask/StickerGameEngine;->updateTrajectory(J)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Lcom/momo/mcamera/mask/StickerGameEngine;->trajectoryList:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    :cond_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 21
    .line 22
    .line 23
    move-result p2

    .line 24
    const/4 v0, 0x0

    .line 25
    if-eqz p2, :cond_6

    .line 26
    .line 27
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    check-cast p2, Lcom/momo/mcamera/mask/StickerGameEngine$Trajectory;

    .line 32
    .line 33
    iget-object v1, p0, Lcom/momo/mcamera/mask/StickerGameEngine;->stickerItemList:Ljava/util/List;

    .line 34
    .line 35
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    :cond_2
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    if-eqz v2, :cond_1

    .line 44
    .line 45
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    check-cast v2, Lcom/momo/mcamera/mask/StickerGameItem;

    .line 50
    .line 51
    iget-object v3, v2, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 52
    .line 53
    iget v3, v3, Lcom/momo/mcamera/mask/Sticker;->groupNumber:I

    .line 54
    .line 55
    iget v4, p2, Lcom/momo/mcamera/mask/StickerGameEngine$Trajectory;->bindStickerGroup:I

    .line 56
    .line 57
    if-ne v3, v4, :cond_2

    .line 58
    .line 59
    iget-boolean v3, p2, Lcom/momo/mcamera/mask/StickerGameEngine$Trajectory;->isFixed:Z

    .line 60
    .line 61
    if-eqz v3, :cond_3

    .line 62
    .line 63
    iget-boolean v4, v2, Lcom/momo/mcamera/mask/StickerGameItem;->isGameLive:Z

    .line 64
    .line 65
    if-eqz v4, :cond_4

    .line 66
    .line 67
    goto :goto_1

    .line 68
    :catchall_0
    move-exception p1

    .line 69
    goto :goto_3

    .line 70
    :cond_3
    :goto_1
    if-nez v3, :cond_2

    .line 71
    .line 72
    iget-boolean v3, v2, Lcom/momo/mcamera/mask/StickerGameItem;->isGameLive:Z

    .line 73
    .line 74
    if-eqz v3, :cond_2

    .line 75
    .line 76
    :cond_4
    iget-boolean v3, p2, Lcom/momo/mcamera/mask/StickerGameEngine$Trajectory;->isTriggered:Z

    .line 77
    .line 78
    if-nez v3, :cond_5

    .line 79
    .line 80
    invoke-direct {p0, v2, p2}, Lcom/momo/mcamera/mask/StickerGameEngine;->isTriggerRegionMatches(Lcom/momo/mcamera/mask/StickerGameItem;Lcom/momo/mcamera/mask/StickerGameEngine$Trajectory;)Z

    .line 81
    .line 82
    .line 83
    :cond_5
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/StickerGameEngine;->getAdjustHeightScale()F

    .line 84
    .line 85
    .line 86
    move-result v3

    .line 87
    const/high16 v4, 0x40000000    # 2.0f

    .line 88
    .line 89
    mul-float/2addr v3, v4

    .line 90
    const v4, 0x3dcccccd    # 0.1f

    .line 91
    .line 92
    .line 93
    iput v4, p0, Lcom/momo/mcamera/mask/StickerGameEngine;->stickWidthScaleRatio:F

    .line 94
    .line 95
    mul-float v5, v3, v4

    .line 96
    .line 97
    mul-float/2addr v3, v4

    .line 98
    new-instance v4, Landroid/graphics/PointF;

    .line 99
    .line 100
    iget v6, p2, Lcom/momo/mcamera/mask/StickerGameEngine$Trajectory;->xPosition:F

    .line 101
    .line 102
    iget v7, p2, Lcom/momo/mcamera/mask/StickerGameEngine$Trajectory;->yPosition:F

    .line 103
    .line 104
    invoke-direct {v4, v6, v7}, Landroid/graphics/PointF;-><init>(FF)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {v2, v5, v3, v4, v0}, Lcom/momo/mcamera/mask/StickerItem;->setParamForMatrix(FFLandroid/graphics/PointF;F)V

    .line 108
    .line 109
    .line 110
    goto :goto_0

    .line 111
    :cond_6
    iput v0, p0, Lcom/momo/mcamera/mask/StickerGameEngine;->mousePosLeftTopX:F

    .line 112
    .line 113
    iput v0, p0, Lcom/momo/mcamera/mask/StickerGameEngine;->mousePosLeftTopY:F

    .line 114
    .line 115
    iput v0, p0, Lcom/momo/mcamera/mask/StickerGameEngine;->mousePosRightBottomY:F

    .line 116
    .line 117
    iput v0, p0, Lcom/momo/mcamera/mask/StickerGameEngine;->mousePosRightBottomX:F
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 118
    .line 119
    monitor-exit p0

    .line 120
    return-void

    .line 121
    :cond_7
    :goto_2
    monitor-exit p0

    .line 122
    return-void

    .line 123
    :goto_3
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 124
    throw p1
.end method

.method public updateTrajectory(J)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerGameEngine;->trajectoryList:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_8

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lcom/momo/mcamera/mask/StickerGameEngine$Trajectory;

    .line 18
    .line 19
    iget-wide v2, v1, Lcom/momo/mcamera/mask/StickerGameEngine$Trajectory;->startTime:J

    .line 20
    .line 21
    const-wide/16 v4, 0x0

    .line 22
    .line 23
    cmp-long v2, v2, v4

    .line 24
    .line 25
    if-nez v2, :cond_1

    .line 26
    .line 27
    iput-wide p1, v1, Lcom/momo/mcamera/mask/StickerGameEngine$Trajectory;->startTime:J

    .line 28
    .line 29
    :cond_1
    iget v2, v1, Lcom/momo/mcamera/mask/StickerGameEngine$Trajectory;->fixedFrames:I

    .line 30
    .line 31
    iget v3, v1, Lcom/momo/mcamera/mask/StickerGameEngine$Trajectory;->maxFixFrames:I

    .line 32
    .line 33
    const/4 v4, 0x0

    .line 34
    const/4 v5, 0x1

    .line 35
    if-ne v2, v3, :cond_3

    .line 36
    .line 37
    iget-object v2, p0, Lcom/momo/mcamera/mask/StickerGameEngine;->stickerItemList:Ljava/util/List;

    .line 38
    .line 39
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    iget v3, v1, Lcom/momo/mcamera/mask/StickerGameEngine$Trajectory;->bindStickerGroup:I

    .line 44
    .line 45
    mul-int/lit8 v6, v3, 0x2

    .line 46
    .line 47
    if-le v2, v6, :cond_2

    .line 48
    .line 49
    iget-object v2, p0, Lcom/momo/mcamera/mask/StickerGameEngine;->stickerItemList:Ljava/util/List;

    .line 50
    .line 51
    mul-int/lit8 v3, v3, 0x2

    .line 52
    .line 53
    add-int/2addr v3, v5

    .line 54
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    check-cast v2, Lcom/momo/mcamera/mask/StickerGameItem;

    .line 59
    .line 60
    iget-object v2, v2, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 61
    .line 62
    iput v4, v2, Lcom/momo/mcamera/mask/Sticker;->curIndex:I

    .line 63
    .line 64
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/StickerGameEngine$Trajectory;->reset()V

    .line 65
    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_2
    iput-boolean v5, v1, Lcom/momo/mcamera/mask/StickerGameEngine$Trajectory;->needRandomStickerGroup:Z

    .line 69
    .line 70
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/StickerGameEngine$Trajectory;->reset()V

    .line 71
    .line 72
    .line 73
    :cond_3
    :goto_1
    iget-wide v2, v1, Lcom/momo/mcamera/mask/StickerGameEngine$Trajectory;->startTime:J

    .line 74
    .line 75
    sub-long v2, p1, v2

    .line 76
    .line 77
    long-to-float v2, v2

    .line 78
    const/high16 v3, 0x447a0000    # 1000.0f

    .line 79
    .line 80
    div-float/2addr v2, v3

    .line 81
    iput v2, v1, Lcom/momo/mcamera/mask/StickerGameEngine$Trajectory;->duration:F

    .line 82
    .line 83
    iget-boolean v3, v1, Lcom/momo/mcamera/mask/StickerGameEngine$Trajectory;->isFixed:Z

    .line 84
    .line 85
    if-nez v3, :cond_7

    .line 86
    .line 87
    const/4 v3, 0x0

    .line 88
    cmpl-float v3, v2, v3

    .line 89
    .line 90
    if-lez v3, :cond_4

    .line 91
    .line 92
    iget v3, v1, Lcom/momo/mcamera/mask/StickerGameEngine$Trajectory;->yPositionOffset:F

    .line 93
    .line 94
    iget v5, v1, Lcom/momo/mcamera/mask/StickerGameEngine$Trajectory;->velocity:F

    .line 95
    .line 96
    mul-float/2addr v5, v2

    .line 97
    add-float/2addr v3, v5

    .line 98
    iput v3, v1, Lcom/momo/mcamera/mask/StickerGameEngine$Trajectory;->yPosition:F

    .line 99
    .line 100
    :cond_4
    iget v2, v1, Lcom/momo/mcamera/mask/StickerGameEngine$Trajectory;->yPosition:F

    .line 101
    .line 102
    float-to-double v2, v2

    .line 103
    const-wide v5, 0x3ff199999999999aL    # 1.1

    .line 104
    .line 105
    .line 106
    .line 107
    .line 108
    cmpl-double v2, v2, v5

    .line 109
    .line 110
    if-lez v2, :cond_0

    .line 111
    .line 112
    :goto_2
    iget-object v2, p0, Lcom/momo/mcamera/mask/StickerGameEngine;->usedTrajectory:Ljava/util/List;

    .line 113
    .line 114
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 115
    .line 116
    .line 117
    move-result v2

    .line 118
    if-ge v4, v2, :cond_6

    .line 119
    .line 120
    iget-object v2, p0, Lcom/momo/mcamera/mask/StickerGameEngine;->usedTrajectory:Ljava/util/List;

    .line 121
    .line 122
    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 123
    .line 124
    .line 125
    move-result-object v2

    .line 126
    check-cast v2, Ljava/lang/Float;

    .line 127
    .line 128
    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    .line 129
    .line 130
    .line 131
    move-result v3

    .line 132
    iget v5, v1, Lcom/momo/mcamera/mask/StickerGameEngine$Trajectory;->xPosition:F

    .line 133
    .line 134
    cmpl-float v3, v3, v5

    .line 135
    .line 136
    if-nez v3, :cond_5

    .line 137
    .line 138
    iget-object v3, p0, Lcom/momo/mcamera/mask/StickerGameEngine;->usedTrajectory:Ljava/util/List;

    .line 139
    .line 140
    invoke-interface {v3, v4}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 141
    .line 142
    .line 143
    iget-object v3, p0, Lcom/momo/mcamera/mask/StickerGameEngine;->notUsedTrajectory:Ljava/util/List;

    .line 144
    .line 145
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 146
    .line 147
    .line 148
    goto :goto_3

    .line 149
    :cond_5
    add-int/lit8 v4, v4, 0x1

    .line 150
    .line 151
    goto :goto_2

    .line 152
    :cond_6
    :goto_3
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/StickerGameEngine$Trajectory;->reset()V

    .line 153
    .line 154
    .line 155
    goto/16 :goto_0

    .line 156
    .line 157
    :cond_7
    iget v2, v1, Lcom/momo/mcamera/mask/StickerGameEngine$Trajectory;->fixedFrames:I

    .line 158
    .line 159
    add-int/2addr v2, v5

    .line 160
    iput v2, v1, Lcom/momo/mcamera/mask/StickerGameEngine$Trajectory;->fixedFrames:I

    .line 161
    .line 162
    goto/16 :goto_0

    .line 163
    .line 164
    :cond_8
    return-void
.end method

.method public declared-synchronized updateTriggerStatus(FFFF)V
    .locals 0

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iput p1, p0, Lcom/momo/mcamera/mask/StickerGameEngine;->mousePosLeftTopX:F

    .line 3
    .line 4
    iput p2, p0, Lcom/momo/mcamera/mask/StickerGameEngine;->mousePosLeftTopY:F

    .line 5
    .line 6
    iput p3, p0, Lcom/momo/mcamera/mask/StickerGameEngine;->mousePosRightBottomX:F

    .line 7
    .line 8
    iput p4, p0, Lcom/momo/mcamera/mask/StickerGameEngine;->mousePosRightBottomY:F
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 9
    .line 10
    monitor-exit p0

    .line 11
    return-void

    .line 12
    :catchall_0
    move-exception p1

    .line 13
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 14
    throw p1
.end method
