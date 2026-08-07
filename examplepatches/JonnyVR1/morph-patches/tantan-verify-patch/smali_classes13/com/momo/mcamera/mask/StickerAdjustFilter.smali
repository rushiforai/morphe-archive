.class public Lcom/momo/mcamera/mask/StickerAdjustFilter;
.super Lcom/momo/mcamera/mask/StickerGroupFilter;
.source "SourceFile"

# interfaces
.implements Ll/gam;
.implements Ll/c5w;
.implements Lcom/momo/mcamera/mask/detect/IDetectManager$IGestureDetectListener;
.implements Lcom/momo/mcamera/mask/detect/IDetectManager$IObjectDetectListener;
.implements Lcom/momo/mcamera/mask/detect/IDetectManager$IExpressDetectListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/mcamera/mask/StickerAdjustFilter$IOrderable;,
        Lcom/momo/mcamera/mask/StickerAdjustFilter$GestureDetectedListener;,
        Lcom/momo/mcamera/mask/StickerAdjustFilter$StickerMaskFinishListener;,
        Lcom/momo/mcamera/mask/StickerAdjustFilter$SoundPoolInfo;
    }
.end annotation


# static fields
.field private static final DEFAULT_DURATION:J = 0x1c9c380L

.field public static final DEFAULT_LONG_DURATION:J = 0x174876e7ffL

.field private static final EFFECT_GROUP_ORDERED_INDEX:I = 0x3e8

.field private static final MULTI_STICKER_ORDERED_INDEX:I = 0x320

.field public static final POINTS_LENGTH:I = 0x44

.field private static final SOUND_PULL_SIZE:I = 0x5


# instance fields
.field private final TAG:Ljava/lang/String;

.field public enableSelfRender:Z

.field private enableSoundPool:Z

.field private expressDetector:Lcom/momo/mcamera/mask/express/ExpressDetector;

.field private face3DMaskFilters:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/momo/mcamera/mask/Face3DMaskFilter;",
            ">;"
        }
    .end annotation
.end field

.field private filterTriggerManager:Lcom/momo/mcamera/mask/FilterTriggerManager;

.field private filtersToDestroy:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/wej;",
            ">;"
        }
    .end annotation
.end field

.field private finishListener:Lcom/momo/mcamera/mask/StickerAdjustFilter$StickerMaskFinishListener;

.field private gestureDetectedListener:Lcom/momo/mcamera/mask/StickerAdjustFilter$GestureDetectedListener;

.field private gestureDetector:Lcom/momo/mcamera/mask/gesture/CVDetector;

.field private gestureDetectorListener:Lcom/momo/mcamera/mask/gesture/CVDetector$GestureDetectorListener;

.field private groupNumber:I

.field private hasExpressionModel:Z

.field private isCameraFront:Z

.field private isplayStatusTriggered:Z

.field lastFacePosition:Landroid/graphics/PointF;

.field lastFacesCnt:I

.field private mBeautyFace:Lcom/momo/mcamera/mask/BeautyFace;

.field private mBigEye:F

.field private mBigEyeValue:F

.field private mContext:Landroid/content/Context;

.field private mCount:I

.field private mCurCVInfo:Ll/omw;

.field private mDistorationMask:Lcom/momo/mcamera/mask/Mask;

.field mEffectGroupFilter:Lcom/momo/mcamera/mask/EffectGroupFilter;

.field private mFaceBeauty:Z

.field private mFaceBeautyHaveFinish:Z

.field private mFaceMaskFilter:Lcom/momo/mcamera/mask/FaceMaskFilter;

.field private mFaceStateChange:Z

.field private mFaceThinValue:F

.field private mGestureTrackingFilter:Lcom/momo/mcamera/mask/StickerGestureTrackingFilter;

.field mGestureTriggerModels:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Lcom/momo/mcamera/mask/MaskModel;",
            ">;"
        }
    .end annotation
.end field

.field private mLastRenderTime:J

.field private mLookupFilter:Ll/hqf0;

.field private mMultiStickerMaskFilter:Lcom/momo/mcamera/mask/MultiStickerMaskFilter;

.field private mNormalFilter:Lcom/momo/mcamera/mask/NormalFilter;

.field mOrderFilterList:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Lcom/momo/mcamera/mask/StickerAdjustFilter$IOrderable;",
            ">;"
        }
    .end annotation
.end field

.field private mPollGroupNum:I

.field public mSoundInput:Lcom/momo/mcamera/mask/SoundInputFilter;

.field mStickerFilterMap:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Lcom/momo/mcamera/mask/StickerBlendFilter;",
            ">;"
        }
    .end annotation
.end field

.field private mSwapFacialMaskSticker:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/momo/mcamera/mask/Sticker;",
            ">;"
        }
    .end annotation
.end field

.field private mTerminalFilter:Ll/jt2;

.field private mThinFace:F

.field private mmcvBoxes:Lcom/core/glcore/cv/MMCVBoxes;

.field private mmcvRect:Lcom/momocv/MMRect;

.field private multiSwitchEnable:Z

.field private playStatusListener:Ll/aqw;

.field private scaleHeight:I

.field private scaleHeightRatio:F

.field private scaleWidth:I

.field private scaleWidthRatio:F

.field private soundIds:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private soundInfoMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/momo/mcamera/mask/StickerAdjustFilter$SoundPoolInfo;",
            ">;"
        }
    .end annotation
.end field

.field private soundPlayer:Landroid/media/MediaPlayer;

.field private soundPool:Landroid/media/SoundPool;

.field private startTime:J

.field private stickerStateChangeListener:Lcom/momo/mcamera/mask/StickerBlendFilter$StickerStateChangeListener;

.field private time:J

.field private useBlendFilter:Z

.field private videoMergeGroupFilter:Lcom/momo/mcamera/mask/videomix/VideoMergeGroupFilter;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 7

    .line 1
    invoke-direct {p0}, Lcom/momo/mcamera/mask/StickerGroupFilter;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "StickerAdjustFilter"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->TAG:Ljava/lang/String;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->enableSelfRender:Z

    .line 10
    .line 11
    iput v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->lastFacesCnt:I

    .line 12
    .line 13
    new-instance v1, Landroid/graphics/PointF;

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    invoke-direct {v1, v2, v2}, Landroid/graphics/PointF;-><init>(FF)V

    .line 17
    .line 18
    .line 19
    iput-object v1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->lastFacePosition:Landroid/graphics/PointF;

    .line 20
    .line 21
    new-instance v1, Ljava/util/ArrayList;

    .line 22
    .line 23
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object v1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->soundIds:Ljava/util/ArrayList;

    .line 27
    .line 28
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->isCameraFront:Z

    .line 29
    .line 30
    const-wide/16 v3, 0x0

    .line 31
    .line 32
    iput-wide v3, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->startTime:J

    .line 33
    .line 34
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 35
    .line 36
    .line 37
    move-result-wide v5

    .line 38
    iput-wide v5, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->time:J

    .line 39
    .line 40
    iput v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->scaleWidth:I

    .line 41
    .line 42
    iput v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->scaleHeight:I

    .line 43
    .line 44
    const/high16 v1, 0x3f800000    # 1.0f

    .line 45
    .line 46
    iput v1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->scaleWidthRatio:F

    .line 47
    .line 48
    iput v1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->scaleHeightRatio:F

    .line 49
    .line 50
    iput v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->groupNumber:I

    .line 51
    .line 52
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->useBlendFilter:Z

    .line 53
    .line 54
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->hasExpressionModel:Z

    .line 55
    .line 56
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->isplayStatusTriggered:Z

    .line 57
    .line 58
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->multiSwitchEnable:Z

    .line 59
    .line 60
    iput v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mCount:I

    .line 61
    .line 62
    const/4 v1, 0x0

    .line 63
    iput-object v1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mDistorationMask:Lcom/momo/mcamera/mask/Mask;

    .line 64
    .line 65
    iput-object v1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mBeautyFace:Lcom/momo/mcamera/mask/BeautyFace;

    .line 66
    .line 67
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mFaceBeauty:Z

    .line 68
    .line 69
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mFaceStateChange:Z

    .line 70
    .line 71
    iput v2, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mFaceThinValue:F

    .line 72
    .line 73
    iput v2, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mBigEyeValue:F

    .line 74
    .line 75
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mFaceBeautyHaveFinish:Z

    .line 76
    .line 77
    iput v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mPollGroupNum:I

    .line 78
    .line 79
    iput-wide v3, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mLastRenderTime:J

    .line 80
    .line 81
    iput-object v1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mLookupFilter:Ll/hqf0;

    .line 82
    .line 83
    new-instance v0, Ljava/util/HashMap;

    .line 84
    .line 85
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 86
    .line 87
    .line 88
    iput-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->soundInfoMap:Ljava/util/Map;

    .line 89
    .line 90
    iput-object p1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mContext:Landroid/content/Context;

    .line 91
    .line 92
    new-instance p1, Lcom/momo/mcamera/mask/FilterTriggerManager;

    .line 93
    .line 94
    invoke-direct {p1}, Lcom/momo/mcamera/mask/FilterTriggerManager;-><init>()V

    .line 95
    .line 96
    .line 97
    iput-object p1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->filterTriggerManager:Lcom/momo/mcamera/mask/FilterTriggerManager;

    .line 98
    .line 99
    new-instance p1, Lcom/momo/mcamera/mask/NormalFilter;

    .line 100
    .line 101
    invoke-direct {p1}, Lcom/momo/mcamera/mask/NormalFilter;-><init>()V

    .line 102
    .line 103
    .line 104
    iput-object p1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mNormalFilter:Lcom/momo/mcamera/mask/NormalFilter;

    .line 105
    .line 106
    invoke-virtual {p1, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 107
    .line 108
    .line 109
    new-instance p1, Ljava/util/concurrent/ConcurrentHashMap;

    .line 110
    .line 111
    invoke-direct {p1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 112
    .line 113
    .line 114
    iput-object p1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mStickerFilterMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 115
    .line 116
    new-instance p1, Ljava/util/LinkedList;

    .line 117
    .line 118
    invoke-direct {p1}, Ljava/util/LinkedList;-><init>()V

    .line 119
    .line 120
    .line 121
    iput-object p1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mOrderFilterList:Ljava/util/LinkedList;

    .line 122
    .line 123
    new-instance p1, Ljava/util/concurrent/ConcurrentHashMap;

    .line 124
    .line 125
    invoke-direct {p1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 126
    .line 127
    .line 128
    iput-object p1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mGestureTriggerModels:Ljava/util/concurrent/ConcurrentHashMap;

    .line 129
    .line 130
    iget-object p1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mNormalFilter:Lcom/momo/mcamera/mask/NormalFilter;

    .line 131
    .line 132
    invoke-virtual {p0, p1}, Ll/ogk;->registerInitialFilter(Ll/jt2;)V

    .line 133
    .line 134
    .line 135
    iget-object p1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mNormalFilter:Lcom/momo/mcamera/mask/NormalFilter;

    .line 136
    .line 137
    invoke-virtual {p0, p1}, Ll/ogk;->registerTerminalFilter(Ll/jt2;)V

    .line 138
    .line 139
    .line 140
    iget-object p1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mNormalFilter:Lcom/momo/mcamera/mask/NormalFilter;

    .line 141
    .line 142
    iput-object p1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mTerminalFilter:Ll/jt2;

    .line 143
    .line 144
    new-instance p1, Ljava/util/ArrayList;

    .line 145
    .line 146
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 147
    .line 148
    .line 149
    iput-object p1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->filtersToDestroy:Ljava/util/List;

    .line 150
    .line 151
    new-instance p1, Landroid/media/SoundPool;

    .line 152
    .line 153
    const/4 v0, 0x5

    .line 154
    const/4 v1, 0x3

    .line 155
    invoke-direct {p1, v0, v1, v0}, Landroid/media/SoundPool;-><init>(III)V

    .line 156
    .line 157
    .line 158
    iput-object p1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->soundPool:Landroid/media/SoundPool;

    .line 159
    .line 160
    return-void
.end method

.method public static synthetic access$002(Lcom/momo/mcamera/mask/StickerAdjustFilter;Lcom/core/glcore/cv/MMCVBoxes;)Lcom/core/glcore/cv/MMCVBoxes;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mmcvBoxes:Lcom/core/glcore/cv/MMCVBoxes;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$100(Lcom/momo/mcamera/mask/StickerAdjustFilter;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->addGestureMaskModel(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1000(Lcom/momo/mcamera/mask/StickerAdjustFilter;)Landroid/media/SoundPool;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->soundPool:Landroid/media/SoundPool;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1100(Lcom/momo/mcamera/mask/StickerAdjustFilter;ILjava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->setRunableCalledWhenLoaded(ILjava/lang/Runnable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1200(Lcom/momo/mcamera/mask/StickerAdjustFilter;)Lcom/momo/mcamera/mask/StickerAdjustFilter$StickerMaskFinishListener;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->finishListener:Lcom/momo/mcamera/mask/StickerAdjustFilter$StickerMaskFinishListener;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1300(Lcom/momo/mcamera/mask/StickerAdjustFilter;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mBigEye:F

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$1400(Lcom/momo/mcamera/mask/StickerAdjustFilter;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mThinFace:F

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$200(Lcom/momo/mcamera/mask/StickerAdjustFilter;)Lcom/momo/mcamera/mask/StickerAdjustFilter$GestureDetectedListener;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->gestureDetectedListener:Lcom/momo/mcamera/mask/StickerAdjustFilter$GestureDetectedListener;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$300(Lcom/momo/mcamera/mask/StickerAdjustFilter;)Lcom/momo/mcamera/mask/StickerGestureTrackingFilter;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mGestureTrackingFilter:Lcom/momo/mcamera/mask/StickerGestureTrackingFilter;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$400(Lcom/momo/mcamera/mask/StickerAdjustFilter;Landroid/media/SoundPool;II)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->updateSoundPoolLoadedStatus(Landroid/media/SoundPool;II)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$500(Lcom/momo/mcamera/mask/StickerAdjustFilter;Ll/jt2;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->removeEffectFilter(Ll/jt2;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$600(Lcom/momo/mcamera/mask/StickerAdjustFilter;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->filtersToDestroy:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$700(Lcom/momo/mcamera/mask/StickerAdjustFilter;Lcom/momo/mcamera/mask/Sticker;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->removeStickerFilter(Lcom/momo/mcamera/mask/Sticker;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$800(Lcom/momo/mcamera/mask/StickerAdjustFilter;Lcom/momo/mcamera/mask/Sticker;II)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->updateplayStatus(Lcom/momo/mcamera/mask/Sticker;II)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$900(Lcom/momo/mcamera/mask/StickerAdjustFilter;)Lcom/momo/mcamera/mask/StickerBlendFilter$StickerStateChangeListener;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->stickerStateChangeListener:Lcom/momo/mcamera/mask/StickerBlendFilter$StickerStateChangeListener;

    .line 2
    .line 3
    return-object p0
.end method

.method private addCommonModel(Lcom/momo/mcamera/mask/MaskModel;)V
    .locals 10

    .line 1
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getAdditionalInfo()Lcom/momo/mcamera/mask/AdditionalInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "FACE_MASK_TYPE"

    .line 6
    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getAdditionalInfo()Lcom/momo/mcamera/mask/AdditionalInfo;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/AdditionalInfo;->isComic()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_2

    .line 18
    .line 19
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getStickers()Ljava/util/List;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    new-instance v2, Ljava/util/ArrayList;

    .line 24
    .line 25
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 33
    .line 34
    .line 35
    move-result v4

    .line 36
    if-eqz v4, :cond_1

    .line 37
    .line 38
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    check-cast v4, Lcom/momo/mcamera/mask/Sticker;

    .line 43
    .line 44
    invoke-virtual {v4}, Lcom/momo/mcamera/mask/Sticker;->getStickerType()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v5

    .line 48
    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v5

    .line 52
    if-eqz v5, :cond_0

    .line 53
    .line 54
    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    invoke-interface {v3}, Ljava/util/Iterator;->remove()V

    .line 58
    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_1
    invoke-interface {v0, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 62
    .line 63
    .line 64
    invoke-virtual {p1, v0}, Lcom/momo/mcamera/mask/MaskModel;->setStickers(Ljava/util/List;)V

    .line 65
    .line 66
    .line 67
    :cond_2
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getPollGroupNum()I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    iput v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mPollGroupNum:I

    .line 72
    .line 73
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getStickers()Ljava/util/List;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    const/4 v2, 0x0

    .line 82
    move v3, v2

    .line 83
    move v4, v3

    .line 84
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 85
    .line 86
    .line 87
    move-result v5

    .line 88
    if-eqz v5, :cond_e

    .line 89
    .line 90
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object v5

    .line 94
    check-cast v5, Lcom/momo/mcamera/mask/Sticker;

    .line 95
    .line 96
    const-string v6, "audio_visualizer"

    .line 97
    .line 98
    invoke-virtual {v5}, Lcom/momo/mcamera/mask/Sticker;->getResourceType()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v7

    .line 102
    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    move-result v6

    .line 106
    if-eqz v6, :cond_3

    .line 107
    .line 108
    goto :goto_1

    .line 109
    :cond_3
    invoke-virtual {v5}, Lcom/momo/mcamera/mask/Sticker;->getStickerType()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v6

    .line 113
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 114
    .line 115
    .line 116
    move-result v6

    .line 117
    if-nez v6, :cond_4

    .line 118
    .line 119
    invoke-virtual {v5}, Lcom/momo/mcamera/mask/Sticker;->getStickerType()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v6

    .line 123
    invoke-virtual {v6, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 124
    .line 125
    .line 126
    move-result v6

    .line 127
    if-eqz v6, :cond_4

    .line 128
    .line 129
    invoke-virtual {v5, v1}, Lcom/momo/mcamera/mask/Sticker;->setStickerType(Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    goto :goto_2

    .line 133
    :cond_4
    invoke-virtual {v5}, Lcom/momo/mcamera/mask/Sticker;->getStickerType()Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object v6

    .line 137
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 138
    .line 139
    .line 140
    move-result v6

    .line 141
    if-nez v6, :cond_5

    .line 142
    .line 143
    invoke-virtual {v5}, Lcom/momo/mcamera/mask/Sticker;->getStickerType()Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object v6

    .line 147
    const-string v7, "FACE_LOOK_UP_TYPE"

    .line 148
    .line 149
    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 150
    .line 151
    .line 152
    move-result v6

    .line 153
    if-eqz v6, :cond_5

    .line 154
    .line 155
    invoke-virtual {v5, v7}, Lcom/momo/mcamera/mask/Sticker;->setStickerType(Ljava/lang/String;)V

    .line 156
    .line 157
    .line 158
    goto :goto_2

    .line 159
    :cond_5
    invoke-virtual {v5}, Lcom/momo/mcamera/mask/Sticker;->getStickerType()Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object v6

    .line 163
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 164
    .line 165
    .line 166
    move-result v6

    .line 167
    if-nez v6, :cond_6

    .line 168
    .line 169
    invoke-virtual {v5}, Lcom/momo/mcamera/mask/Sticker;->getStickerType()Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object v6

    .line 173
    const-string v7, "STICKER_TYPE_VOICE"

    .line 174
    .line 175
    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 176
    .line 177
    .line 178
    move-result v6

    .line 179
    if-eqz v6, :cond_6

    .line 180
    .line 181
    invoke-virtual {v5, v7}, Lcom/momo/mcamera/mask/Sticker;->setStickerType(Ljava/lang/String;)V

    .line 182
    .line 183
    .line 184
    goto :goto_2

    .line 185
    :cond_6
    invoke-virtual {v5}, Lcom/momo/mcamera/mask/Sticker;->getStickerType()Ljava/lang/String;

    .line 186
    .line 187
    .line 188
    move-result-object v6

    .line 189
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 190
    .line 191
    .line 192
    move-result v6

    .line 193
    if-eqz v6, :cond_7

    .line 194
    .line 195
    new-instance v6, Ljava/lang/StringBuilder;

    .line 196
    .line 197
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 198
    .line 199
    .line 200
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getModelType()I

    .line 201
    .line 202
    .line 203
    move-result v7

    .line 204
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 205
    .line 206
    .line 207
    const-string v7, "_"

    .line 208
    .line 209
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 210
    .line 211
    .line 212
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 213
    .line 214
    .line 215
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 216
    .line 217
    .line 218
    move-result-object v6

    .line 219
    invoke-virtual {v5, v6}, Lcom/momo/mcamera/mask/Sticker;->setStickerType(Ljava/lang/String;)V

    .line 220
    .line 221
    .line 222
    :cond_7
    :goto_2
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getModelType()I

    .line 223
    .line 224
    .line 225
    move-result v6

    .line 226
    invoke-virtual {v5, v6}, Lcom/momo/mcamera/mask/Sticker;->setModelType(I)V

    .line 227
    .line 228
    .line 229
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getFrameRate()I

    .line 230
    .line 231
    .line 232
    move-result v6

    .line 233
    invoke-virtual {v5, v6}, Lcom/momo/mcamera/mask/Sticker;->setFrameRate(I)V

    .line 234
    .line 235
    .line 236
    invoke-virtual {v5}, Lcom/momo/mcamera/mask/Sticker;->getDuration()J

    .line 237
    .line 238
    .line 239
    move-result-wide v6

    .line 240
    const-wide/16 v8, 0x0

    .line 241
    .line 242
    cmp-long v6, v6, v8

    .line 243
    .line 244
    if-nez v6, :cond_9

    .line 245
    .line 246
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getDuration()J

    .line 247
    .line 248
    .line 249
    move-result-wide v6

    .line 250
    cmp-long v6, v6, v8

    .line 251
    .line 252
    if-lez v6, :cond_8

    .line 253
    .line 254
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getDuration()J

    .line 255
    .line 256
    .line 257
    move-result-wide v6

    .line 258
    goto :goto_3

    .line 259
    :cond_8
    const-wide v6, 0x174876e7ffL

    .line 260
    .line 261
    .line 262
    .line 263
    .line 264
    :goto_3
    invoke-virtual {v5, v6, v7}, Lcom/momo/mcamera/mask/Sticker;->setDuration(J)V

    .line 265
    .line 266
    .line 267
    :cond_9
    const-string v6, "3d"

    .line 268
    .line 269
    invoke-virtual {v5}, Lcom/momo/mcamera/mask/Sticker;->getLayerType()Ljava/lang/String;

    .line 270
    .line 271
    .line 272
    move-result-object v7

    .line 273
    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 274
    .line 275
    .line 276
    move-result v6

    .line 277
    const/4 v7, 0x1

    .line 278
    if-eqz v6, :cond_a

    .line 279
    .line 280
    iput-boolean v7, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->useBlendFilter:Z

    .line 281
    .line 282
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getXengineEsPath()Ljava/lang/String;

    .line 283
    .line 284
    .line 285
    move-result-object v6

    .line 286
    invoke-virtual {v5, v6}, Lcom/momo/mcamera/mask/Sticker;->setXengineEsPath(Ljava/lang/String;)V

    .line 287
    .line 288
    .line 289
    :cond_a
    invoke-virtual {v5}, Lcom/momo/mcamera/mask/Sticker;->isClearsBodyArea()Z

    .line 290
    .line 291
    .line 292
    move-result v6

    .line 293
    if-eqz v6, :cond_b

    .line 294
    .line 295
    iput-boolean v7, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->useBlendFilter:Z

    .line 296
    .line 297
    add-int/lit8 v2, v2, 0x1

    .line 298
    .line 299
    :cond_b
    invoke-direct {p0, v5}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->isBlendSticker(Lcom/momo/mcamera/mask/Sticker;)Z

    .line 300
    .line 301
    .line 302
    move-result v6

    .line 303
    if-eqz v6, :cond_c

    .line 304
    .line 305
    iput-boolean v7, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->useBlendFilter:Z

    .line 306
    .line 307
    :cond_c
    invoke-virtual {v5}, Lcom/momo/mcamera/mask/Sticker;->getSound()Ljava/lang/String;

    .line 308
    .line 309
    .line 310
    move-result-object v6

    .line 311
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 312
    .line 313
    .line 314
    move-result v6

    .line 315
    if-nez v6, :cond_d

    .line 316
    .line 317
    add-int/lit8 v3, v3, 0x1

    .line 318
    .line 319
    :cond_d
    invoke-virtual {p0, v5}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->addSticker(Lcom/momo/mcamera/mask/Sticker;)V

    .line 320
    .line 321
    .line 322
    add-int/lit8 v4, v4, 0x1

    .line 323
    .line 324
    goto/16 :goto_1

    .line 325
    .line 326
    :cond_e
    if-lez v2, :cond_f

    .line 327
    .line 328
    invoke-static {v2}, Lcom/core/glcore/util/SegmentHelper;->setSegmentCount(I)V

    .line 329
    .line 330
    .line 331
    :cond_f
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getSound()Ljava/lang/String;

    .line 332
    .line 333
    .line 334
    move-result-object v0

    .line 335
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 336
    .line 337
    .line 338
    move-result v0

    .line 339
    if-nez v0, :cond_10

    .line 340
    .line 341
    add-int/lit8 v3, v3, 0x1

    .line 342
    .line 343
    :cond_10
    iget-boolean v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->enableSoundPool:Z

    .line 344
    .line 345
    if-eqz v0, :cond_11

    .line 346
    .line 347
    invoke-direct {p0, p1, v3}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->tryLoadSound(Lcom/momo/mcamera/mask/MaskModel;I)V

    .line 348
    .line 349
    .line 350
    :cond_11
    return-void
.end method

.method private addEffectProcessFilter(Lcom/momo/mcamera/mask/MaskModel;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mEffectGroupFilter:Lcom/momo/mcamera/mask/EffectGroupFilter;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/momo/mcamera/mask/EffectGroupFilter;

    .line 6
    .line 7
    invoke-direct {v0}, Lcom/momo/mcamera/mask/EffectGroupFilter;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mEffectGroupFilter:Lcom/momo/mcamera/mask/EffectGroupFilter;

    .line 11
    .line 12
    const/16 v1, 0x3e8

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lcom/momo/mcamera/mask/EffectGroupFilter;->setOrderedIndex(I)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mEffectGroupFilter:Lcom/momo/mcamera/mask/EffectGroupFilter;

    .line 18
    .line 19
    new-instance v1, Lcom/momo/mcamera/mask/StickerAdjustFilter$5;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Lcom/momo/mcamera/mask/StickerAdjustFilter$5;-><init>(Lcom/momo/mcamera/mask/StickerAdjustFilter;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Lcom/momo/mcamera/mask/EffectGroupFilter;->setRenderFinishListener(Lcom/momo/mcamera/mask/EffectGroupFilter$EffectRenderFinishListener;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mEffectGroupFilter:Lcom/momo/mcamera/mask/EffectGroupFilter;

    .line 28
    .line 29
    invoke-direct {p0, v0}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->addOrderableTerminalFilter(Ll/jt2;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getEffectList()Ljava/util/List;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    if-eqz v1, :cond_2

    .line 45
    .line 46
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    check-cast v1, Lcom/momo/mcamera/mask/bean/EffectFilterItem;

    .line 51
    .line 52
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getModelType()I

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    invoke-virtual {v1, v2}, Lcom/momo/mcamera/mask/bean/EffectFilterItem;->setModelType(I)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/bean/EffectFilterItem;->getDuration()J

    .line 60
    .line 61
    .line 62
    move-result-wide v2

    .line 63
    const-wide/16 v4, 0x0

    .line 64
    .line 65
    cmp-long v2, v2, v4

    .line 66
    .line 67
    if-nez v2, :cond_1

    .line 68
    .line 69
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getDuration()J

    .line 70
    .line 71
    .line 72
    move-result-wide v2

    .line 73
    invoke-virtual {v1, v2, v3}, Lcom/momo/mcamera/mask/bean/EffectFilterItem;->setDuration(J)V

    .line 74
    .line 75
    .line 76
    :cond_1
    iget-object v2, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mEffectGroupFilter:Lcom/momo/mcamera/mask/EffectGroupFilter;

    .line 77
    .line 78
    invoke-virtual {v2, v1}, Lcom/momo/mcamera/mask/EffectGroupFilter;->addEffectFilterItem(Lcom/momo/mcamera/mask/bean/EffectFilterItem;)V

    .line 79
    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_2
    return-void
.end method

.method private addGestureMaskModel(Ljava/lang/String;)V
    .locals 2

    .line 96
    const-string v0, "FilterProcess"

    const-string v1, "StickerAdjustFilter addGestureMaskModel "

    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 97
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mGestureTriggerModels:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/momo/mcamera/mask/MaskModel;

    .line 98
    invoke-virtual {p0, p1, v0}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->addGestureMaskModel(Ljava/lang/String;Lcom/momo/mcamera/mask/MaskModel;)Z

    return-void
.end method

.method private addOrderableTerminalFilter(Ll/jt2;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ll/jt2;",
            ":",
            "Lcom/momo/mcamera/mask/StickerAdjustFilter$IOrderable;",
            ">(TT;)V"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_1

    .line 4
    :cond_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mOrderFilterList:Ljava/util/LinkedList;

    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-gtz v0, :cond_1

    .line 11
    .line 12
    invoke-direct {p0, p1}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->addTerminalFilter(Ll/jt2;)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mOrderFilterList:Ljava/util/LinkedList;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_1
    move-object v0, p1

    .line 22
    check-cast v0, Lcom/momo/mcamera/mask/StickerAdjustFilter$IOrderable;

    .line 23
    .line 24
    invoke-interface {v0}, Lcom/momo/mcamera/mask/StickerAdjustFilter$IOrderable;->getOrderedIndex()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    iget-object v1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mOrderFilterList:Ljava/util/LinkedList;

    .line 29
    .line 30
    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    add-int/lit8 v1, v1, -0x1

    .line 35
    .line 36
    move v2, v1

    .line 37
    :goto_0
    if-ltz v2, :cond_5

    .line 38
    .line 39
    iget-object v3, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mOrderFilterList:Ljava/util/LinkedList;

    .line 40
    .line 41
    invoke-virtual {v3, v2}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    check-cast v3, Lcom/momo/mcamera/mask/StickerAdjustFilter$IOrderable;

    .line 46
    .line 47
    invoke-interface {v3}, Lcom/momo/mcamera/mask/StickerAdjustFilter$IOrderable;->getOrderedIndex()I

    .line 48
    .line 49
    .line 50
    move-result v4

    .line 51
    if-le v4, v0, :cond_3

    .line 52
    .line 53
    if-nez v2, :cond_2

    .line 54
    .line 55
    check-cast v3, Ll/jt2;

    .line 56
    .line 57
    invoke-direct {p0, v3, p1}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->insertSpecifiedPosition(Ll/jt2;Ll/jt2;)V

    .line 58
    .line 59
    .line 60
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mOrderFilterList:Ljava/util/LinkedList;

    .line 61
    .line 62
    invoke-virtual {p0, p1}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_2
    add-int/lit8 v2, v2, -0x1

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_3
    if-ge v2, v1, :cond_4

    .line 70
    .line 71
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mOrderFilterList:Ljava/util/LinkedList;

    .line 72
    .line 73
    add-int/lit8 v2, v2, 0x1

    .line 74
    .line 75
    invoke-virtual {v0, v2}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    if-eqz v0, :cond_4

    .line 80
    .line 81
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mOrderFilterList:Ljava/util/LinkedList;

    .line 82
    .line 83
    invoke-virtual {v0, v2}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    check-cast v0, Ll/jt2;

    .line 88
    .line 89
    invoke-direct {p0, v0, p1}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->insertSpecifiedPosition(Ll/jt2;Ll/jt2;)V

    .line 90
    .line 91
    .line 92
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mOrderFilterList:Ljava/util/LinkedList;

    .line 93
    .line 94
    invoke-virtual {p0, v2, p1}, Ljava/util/LinkedList;->add(ILjava/lang/Object;)V

    .line 95
    .line 96
    .line 97
    return-void

    .line 98
    :cond_4
    invoke-direct {p0, p1}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->addTerminalFilter(Ll/jt2;)V

    .line 99
    .line 100
    .line 101
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mOrderFilterList:Ljava/util/LinkedList;

    .line 102
    .line 103
    invoke-virtual {p0, p1}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 104
    .line 105
    .line 106
    :cond_5
    :goto_1
    return-void
.end method

.method private addTerminalFilter(Ll/jt2;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mTerminalFilter:Ll/jt2;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ll/gfj;->removeTarget(Ll/dfj;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mTerminalFilter:Ll/jt2;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mTerminalFilter:Ll/jt2;

    .line 12
    .line 13
    iput-object v0, p1, Ll/jt2;->parentFilter:Ll/jt2;

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Ll/ogk;->removeTerminalFilter(Ll/jt2;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mTerminalFilter:Ll/jt2;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/ogk;->registerFilter(Ll/jt2;)V

    .line 21
    .line 22
    .line 23
    iput-object p1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mTerminalFilter:Ll/jt2;

    .line 24
    .line 25
    invoke-virtual {p1, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mTerminalFilter:Ll/jt2;

    .line 29
    .line 30
    invoke-virtual {p0, p1}, Ll/ogk;->registerTerminalFilter(Ll/jt2;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method private addTerminalMultiStickerFilter(Ll/jt2;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mTerminalFilter:Ll/jt2;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mEffectGroupFilter:Lcom/momo/mcamera/mask/EffectGroupFilter;

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    invoke-direct {p0, v0, p1}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->insertSpecifiedPosition(Ll/jt2;Ll/jt2;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-direct {p0, p1}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->addTerminalFilter(Ll/jt2;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private calculateFaceIndex(Ll/omw;)I
    .locals 13

    .line 1
    invoke-virtual {p1}, Ll/omw;->n()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x1

    .line 7
    if-ne v0, v2, :cond_0

    .line 8
    .line 9
    return v1

    .line 10
    :cond_0
    iget v3, p1, Ll/omw;->b:I

    .line 11
    .line 12
    div-int/lit8 v3, v3, 0x5a

    .line 13
    .line 14
    rem-int/lit8 v3, v3, 0x2

    .line 15
    .line 16
    if-nez v3, :cond_1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    move v2, v1

    .line 20
    :goto_0
    iget v3, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->lastFacesCnt:I

    .line 21
    .line 22
    const v4, 0x461c4000    # 10000.0f

    .line 23
    .line 24
    .line 25
    const/16 v5, 0x44

    .line 26
    .line 27
    if-lt v0, v3, :cond_4

    .line 28
    .line 29
    move v2, v1

    .line 30
    move v3, v2

    .line 31
    :goto_1
    if-ge v2, v0, :cond_3

    .line 32
    .line 33
    invoke-virtual {p1, v2}, Ll/omw;->j(I)Ll/nuf;

    .line 34
    .line 35
    .line 36
    move-result-object v6

    .line 37
    invoke-virtual {v6}, Ll/nuf;->l()[F

    .line 38
    .line 39
    .line 40
    move-result-object v6

    .line 41
    new-instance v7, Landroid/graphics/PointF;

    .line 42
    .line 43
    aget v8, v6, v1

    .line 44
    .line 45
    aget v6, v6, v5

    .line 46
    .line 47
    invoke-direct {v7, v8, v6}, Landroid/graphics/PointF;-><init>(FF)V

    .line 48
    .line 49
    .line 50
    iget-object v6, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->lastFacePosition:Landroid/graphics/PointF;

    .line 51
    .line 52
    invoke-static {v7, v6}, Lcom/momo/mcamera/util/PointHelper;->getmDistancePoint(Landroid/graphics/PointF;Landroid/graphics/PointF;)D

    .line 53
    .line 54
    .line 55
    move-result-wide v6

    .line 56
    double-to-float v6, v6

    .line 57
    cmpg-float v7, v6, v4

    .line 58
    .line 59
    if-gez v7, :cond_2

    .line 60
    .line 61
    move v3, v2

    .line 62
    move v4, v6

    .line 63
    :cond_2
    add-int/lit8 v2, v2, 0x1

    .line 64
    .line 65
    goto :goto_1

    .line 66
    :cond_3
    return v3

    .line 67
    :cond_4
    invoke-virtual {p1, v1}, Ll/omw;->j(I)Ll/nuf;

    .line 68
    .line 69
    .line 70
    move-result-object v3

    .line 71
    invoke-virtual {v3}, Ll/nuf;->l()[F

    .line 72
    .line 73
    .line 74
    move-result-object v3

    .line 75
    if-eqz v2, :cond_5

    .line 76
    .line 77
    aget v3, v3, v5

    .line 78
    .line 79
    goto :goto_2

    .line 80
    :cond_5
    aget v3, v3, v1

    .line 81
    .line 82
    :goto_2
    const/4 v6, -0x1

    .line 83
    move v7, v1

    .line 84
    move v9, v7

    .line 85
    move v8, v6

    .line 86
    :goto_3
    if-ge v7, v0, :cond_d

    .line 87
    .line 88
    invoke-virtual {p1, v7}, Ll/omw;->j(I)Ll/nuf;

    .line 89
    .line 90
    .line 91
    move-result-object v10

    .line 92
    invoke-virtual {v10}, Ll/nuf;->l()[F

    .line 93
    .line 94
    .line 95
    move-result-object v10

    .line 96
    if-nez v2, :cond_6

    .line 97
    .line 98
    aget v11, v10, v1

    .line 99
    .line 100
    cmpg-float v11, v11, v3

    .line 101
    .line 102
    if-ltz v11, :cond_7

    .line 103
    .line 104
    :cond_6
    if-eqz v2, :cond_9

    .line 105
    .line 106
    aget v11, v10, v5

    .line 107
    .line 108
    cmpg-float v11, v11, v3

    .line 109
    .line 110
    if-gez v11, :cond_9

    .line 111
    .line 112
    :cond_7
    if-eqz v2, :cond_8

    .line 113
    .line 114
    aget v3, v10, v5

    .line 115
    .line 116
    goto :goto_4

    .line 117
    :cond_8
    aget v3, v10, v1

    .line 118
    .line 119
    :goto_4
    move v9, v7

    .line 120
    :cond_9
    if-nez v2, :cond_a

    .line 121
    .line 122
    aget v11, v10, v1

    .line 123
    .line 124
    iget-object v12, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->lastFacePosition:Landroid/graphics/PointF;

    .line 125
    .line 126
    iget v12, v12, Landroid/graphics/PointF;->x:F

    .line 127
    .line 128
    cmpg-float v11, v11, v12

    .line 129
    .line 130
    if-lez v11, :cond_c

    .line 131
    .line 132
    :cond_a
    if-eqz v2, :cond_b

    .line 133
    .line 134
    aget v11, v10, v5

    .line 135
    .line 136
    iget-object v12, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->lastFacePosition:Landroid/graphics/PointF;

    .line 137
    .line 138
    iget v12, v12, Landroid/graphics/PointF;->y:F

    .line 139
    .line 140
    cmpg-float v11, v11, v12

    .line 141
    .line 142
    if-gez v11, :cond_b

    .line 143
    .line 144
    goto :goto_5

    .line 145
    :cond_b
    new-instance v11, Landroid/graphics/PointF;

    .line 146
    .line 147
    aget v12, v10, v1

    .line 148
    .line 149
    aget v10, v10, v5

    .line 150
    .line 151
    invoke-direct {v11, v12, v10}, Landroid/graphics/PointF;-><init>(FF)V

    .line 152
    .line 153
    .line 154
    iget-object v10, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->lastFacePosition:Landroid/graphics/PointF;

    .line 155
    .line 156
    invoke-static {v11, v10}, Lcom/momo/mcamera/util/PointHelper;->getmDistancePoint(Landroid/graphics/PointF;Landroid/graphics/PointF;)D

    .line 157
    .line 158
    .line 159
    move-result-wide v10

    .line 160
    double-to-float v10, v10

    .line 161
    cmpg-float v11, v10, v4

    .line 162
    .line 163
    if-gez v11, :cond_c

    .line 164
    .line 165
    move v8, v7

    .line 166
    move v4, v10

    .line 167
    :cond_c
    :goto_5
    add-int/lit8 v7, v7, 0x1

    .line 168
    .line 169
    goto :goto_3

    .line 170
    :cond_d
    if-eq v8, v6, :cond_e

    .line 171
    .line 172
    return v8

    .line 173
    :cond_e
    return v9
.end method

.method private declared-synchronized clearAllSoundPoolInfo()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    const-string v0, "media"

    .line 3
    .line 4
    const-string v1, "[SoundPool]clear all soundInfo "

    .line 5
    .line 6
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->soundInfoMap:Ljava/util/Map;

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/Map;->clear()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 12
    .line 13
    .line 14
    monitor-exit p0

    .line 15
    return-void

    .line 16
    :catchall_0
    move-exception v0

    .line 17
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 18
    throw v0
.end method

.method private createStickerBlendFilter(Lcom/momo/mcamera/mask/Sticker;Ll/jt2;)Lcom/momo/mcamera/mask/StickerBlendFilter;
    .locals 1

    .line 1
    new-instance v0, Lcom/momo/mcamera/mask/StickerBlendFilter;

    .line 2
    .line 3
    invoke-direct {v0, p2, p1}, Lcom/momo/mcamera/mask/StickerBlendFilter;-><init>(Ll/jt2;Lcom/momo/mcamera/mask/Sticker;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->isClearsBodyArea()Z

    .line 7
    .line 8
    .line 9
    move-result p2

    .line 10
    invoke-virtual {v0, p2}, Lcom/momo/mcamera/mask/StickerBlendFilter;->setSegmentBody(Z)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getStrokeColor()[F

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    invoke-virtual {v0, p2}, Lcom/momo/mcamera/mask/StickerBlendFilter;->setSegmentStrokeColor([F)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getStrokeRadius()I

    .line 21
    .line 22
    .line 23
    move-result p2

    .line 24
    invoke-virtual {v0, p2}, Lcom/momo/mcamera/mask/StickerBlendFilter;->setSegmentStrokeRadius(I)V

    .line 25
    .line 26
    .line 27
    new-instance p2, Lcom/momo/mcamera/mask/StickerAdjustFilter$9;

    .line 28
    .line 29
    invoke-direct {p2, p0, p1}, Lcom/momo/mcamera/mask/StickerAdjustFilter$9;-><init>(Lcom/momo/mcamera/mask/StickerAdjustFilter;Lcom/momo/mcamera/mask/Sticker;)V

    .line 30
    .line 31
    .line 32
    iput-object p2, v0, Lcom/momo/mcamera/mask/StickerBlendFilter;->stickerStateChangeListener:Lcom/momo/mcamera/mask/StickerBlendFilter$StickerStateChangeListener;

    .line 33
    .line 34
    return-object v0
.end method

.method private drawAbsPostionAdjustResolution(Lcom/momo/mcamera/mask/StickerBlendFilter;Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    const/high16 v1, 0x43f00000    # 480.0f

    .line 7
    .line 8
    cmpl-float v0, v0, v1

    .line 9
    .line 10
    if-lez v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    int-to-float v0, v0

    .line 17
    const/high16 v1, 0x43b00000    # 352.0f

    .line 18
    .line 19
    div-float/2addr v0, v1

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    .line 22
    .line 23
    :goto_0
    iget-object v1, p1, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 24
    .line 25
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/Sticker;->getImageWidth()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    int-to-float v1, v1

    .line 30
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    int-to-float v2, v2

    .line 35
    const/high16 v3, 0x40000000    # 2.0f

    .line 36
    .line 37
    div-float/2addr v2, v3

    .line 38
    div-float/2addr v1, v2

    .line 39
    mul-float/2addr v1, v0

    .line 40
    iget-object v0, p1, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getAbsolutePos()Lcom/momo/mcamera/mask/bean/AbsolutePosition;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    if-eqz v0, :cond_1

    .line 47
    .line 48
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/bean/AbsolutePosition;->getCenter()Lcom/momo/mcamera/mask/bean/ObjectRegion;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    if-eqz v2, :cond_1

    .line 53
    .line 54
    new-instance v2, Landroid/graphics/PointF;

    .line 55
    .line 56
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/bean/AbsolutePosition;->getCenter()Lcom/momo/mcamera/mask/bean/ObjectRegion;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    iget v3, v3, Lcom/momo/mcamera/mask/bean/ObjectRegion;->x:F

    .line 61
    .line 62
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/bean/AbsolutePosition;->getCenter()Lcom/momo/mcamera/mask/bean/ObjectRegion;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    iget v0, v0, Lcom/momo/mcamera/mask/bean/ObjectRegion;->y:F

    .line 67
    .line 68
    invoke-direct {v2, v3, v0}, Landroid/graphics/PointF;-><init>(FF)V

    .line 69
    .line 70
    .line 71
    iput-object v2, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->centerPoint:Landroid/graphics/PointF;

    .line 72
    .line 73
    goto :goto_1

    .line 74
    :cond_1
    new-instance v0, Landroid/graphics/PointF;

    .line 75
    .line 76
    const/high16 v2, 0x3f000000    # 0.5f

    .line 77
    .line 78
    invoke-direct {v0, v2, v2}, Landroid/graphics/PointF;-><init>(FF)V

    .line 79
    .line 80
    .line 81
    iput-object v0, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->centerPoint:Landroid/graphics/PointF;

    .line 82
    .line 83
    :goto_1
    iput v1, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->scaleW:F

    .line 84
    .line 85
    iput v1, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->scaleH:F

    .line 86
    .line 87
    const/4 v0, 0x0

    .line 88
    iput v0, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->angle:F

    .line 89
    .line 90
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->filterTriggerManager:Lcom/momo/mcamera/mask/FilterTriggerManager;

    .line 91
    .line 92
    iput-object p0, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->filterTrigerManager:Lcom/momo/mcamera/mask/FilterTriggerManager;

    .line 93
    .line 94
    invoke-virtual {p1, p2}, Lcom/momo/mcamera/mask/StickerBlendFilter;->setDetectParam(Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V

    .line 95
    .line 96
    .line 97
    return-void
.end method

.method private drawAbsolutePostion(Lcom/momo/mcamera/mask/StickerBlendFilter;Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V
    .locals 5

    .line 1
    iget-object v0, p1, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getAbsolutePos()Lcom/momo/mcamera/mask/bean/AbsolutePosition;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p1, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 8
    .line 9
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/Sticker;->getImageWidth()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    int-to-float v1, v1

    .line 14
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->getAdjustHeightScale()F

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    mul-float/2addr v1, v2

    .line 19
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    int-to-float v2, v2

    .line 24
    const/high16 v3, 0x40000000    # 2.0f

    .line 25
    .line 26
    div-float/2addr v2, v3

    .line 27
    div-float/2addr v1, v2

    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/bean/AbsolutePosition;->getCenter()Lcom/momo/mcamera/mask/bean/ObjectRegion;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    if-eqz v2, :cond_0

    .line 35
    .line 36
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    int-to-float v2, v2

    .line 41
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/bean/AbsolutePosition;->getCenter()Lcom/momo/mcamera/mask/bean/ObjectRegion;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    iget v3, v3, Lcom/momo/mcamera/mask/bean/ObjectRegion;->x:F

    .line 46
    .line 47
    mul-float/2addr v2, v3

    .line 48
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 49
    .line 50
    .line 51
    move-result v3

    .line 52
    int-to-float v3, v3

    .line 53
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/bean/AbsolutePosition;->getCenter()Lcom/momo/mcamera/mask/bean/ObjectRegion;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    iget v0, v0, Lcom/momo/mcamera/mask/bean/ObjectRegion;->y:F

    .line 58
    .line 59
    mul-float/2addr v3, v0

    .line 60
    new-instance v0, Landroid/graphics/PointF;

    .line 61
    .line 62
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 63
    .line 64
    .line 65
    move-result v4

    .line 66
    int-to-float v4, v4

    .line 67
    div-float/2addr v2, v4

    .line 68
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 69
    .line 70
    .line 71
    move-result v4

    .line 72
    int-to-float v4, v4

    .line 73
    div-float/2addr v3, v4

    .line 74
    invoke-direct {v0, v2, v3}, Landroid/graphics/PointF;-><init>(FF)V

    .line 75
    .line 76
    .line 77
    iput-object v0, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->centerPoint:Landroid/graphics/PointF;

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_0
    new-instance v0, Landroid/graphics/PointF;

    .line 81
    .line 82
    const/high16 v2, 0x3f000000    # 0.5f

    .line 83
    .line 84
    invoke-direct {v0, v2, v2}, Landroid/graphics/PointF;-><init>(FF)V

    .line 85
    .line 86
    .line 87
    iput-object v0, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->centerPoint:Landroid/graphics/PointF;

    .line 88
    .line 89
    :goto_0
    iput v1, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->scaleW:F

    .line 90
    .line 91
    iput v1, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->scaleH:F

    .line 92
    .line 93
    const/4 v0, 0x0

    .line 94
    iput v0, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->angle:F

    .line 95
    .line 96
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->filterTriggerManager:Lcom/momo/mcamera/mask/FilterTriggerManager;

    .line 97
    .line 98
    iput-object p0, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->filterTrigerManager:Lcom/momo/mcamera/mask/FilterTriggerManager;

    .line 99
    .line 100
    invoke-virtual {p1, p2}, Lcom/momo/mcamera/mask/StickerBlendFilter;->setDetectParam(Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V

    .line 101
    .line 102
    .line 103
    return-void
.end method

.method private drawAbsolutePostionUseStcikerDim(Lcom/momo/mcamera/mask/StickerBlendFilter;Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V
    .locals 5

    .line 1
    iget-object v0, p1, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getAbsolutePos()Lcom/momo/mcamera/mask/bean/AbsolutePosition;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p1, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 8
    .line 9
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/Sticker;->getImageWidth()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    int-to-float v1, v1

    .line 14
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    int-to-float v2, v2

    .line 19
    const/high16 v3, 0x3f800000    # 1.0f

    .line 20
    .line 21
    mul-float/2addr v2, v3

    .line 22
    iget-object v3, p1, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 23
    .line 24
    invoke-virtual {v3}, Lcom/momo/mcamera/mask/Sticker;->getBaseDemensionHeight()I

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    int-to-float v3, v3

    .line 29
    div-float/2addr v2, v3

    .line 30
    mul-float/2addr v1, v2

    .line 31
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    int-to-float v2, v2

    .line 36
    const/high16 v3, 0x40000000    # 2.0f

    .line 37
    .line 38
    div-float/2addr v2, v3

    .line 39
    div-float/2addr v1, v2

    .line 40
    if-eqz v0, :cond_0

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/bean/AbsolutePosition;->getCenter()Lcom/momo/mcamera/mask/bean/ObjectRegion;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    if-eqz v2, :cond_0

    .line 47
    .line 48
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    int-to-float v2, v2

    .line 53
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/bean/AbsolutePosition;->getCenter()Lcom/momo/mcamera/mask/bean/ObjectRegion;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    iget v3, v3, Lcom/momo/mcamera/mask/bean/ObjectRegion;->x:F

    .line 58
    .line 59
    mul-float/2addr v2, v3

    .line 60
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 61
    .line 62
    .line 63
    move-result v3

    .line 64
    int-to-float v3, v3

    .line 65
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/bean/AbsolutePosition;->getCenter()Lcom/momo/mcamera/mask/bean/ObjectRegion;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    iget v0, v0, Lcom/momo/mcamera/mask/bean/ObjectRegion;->y:F

    .line 70
    .line 71
    mul-float/2addr v3, v0

    .line 72
    new-instance v0, Landroid/graphics/PointF;

    .line 73
    .line 74
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 75
    .line 76
    .line 77
    move-result v4

    .line 78
    int-to-float v4, v4

    .line 79
    div-float/2addr v2, v4

    .line 80
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 81
    .line 82
    .line 83
    move-result v4

    .line 84
    int-to-float v4, v4

    .line 85
    div-float/2addr v3, v4

    .line 86
    invoke-direct {v0, v2, v3}, Landroid/graphics/PointF;-><init>(FF)V

    .line 87
    .line 88
    .line 89
    iput-object v0, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->centerPoint:Landroid/graphics/PointF;

    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_0
    new-instance v0, Landroid/graphics/PointF;

    .line 93
    .line 94
    const/high16 v2, 0x3f000000    # 0.5f

    .line 95
    .line 96
    invoke-direct {v0, v2, v2}, Landroid/graphics/PointF;-><init>(FF)V

    .line 97
    .line 98
    .line 99
    iput-object v0, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->centerPoint:Landroid/graphics/PointF;

    .line 100
    .line 101
    :goto_0
    iput v1, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->scaleW:F

    .line 102
    .line 103
    iput v1, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->scaleH:F

    .line 104
    .line 105
    const/4 v0, 0x0

    .line 106
    iput v0, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->angle:F

    .line 107
    .line 108
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->filterTriggerManager:Lcom/momo/mcamera/mask/FilterTriggerManager;

    .line 109
    .line 110
    iput-object p0, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->filterTrigerManager:Lcom/momo/mcamera/mask/FilterTriggerManager;

    .line 111
    .line 112
    invoke-virtual {p1, p2}, Lcom/momo/mcamera/mask/StickerBlendFilter;->setDetectParam(Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V

    .line 113
    .line 114
    .line 115
    return-void
.end method

.method private drawFixedSticker(Lcom/momo/mcamera/mask/StickerBlendFilter;Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V
    .locals 6

    .line 1
    iget-object v0, p1, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    int-to-float v1, v1

    .line 8
    const/high16 v2, 0x40000000    # 2.0f

    .line 9
    .line 10
    div-float/2addr v1, v2

    .line 11
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->isShowTop()Z

    .line 12
    .line 13
    .line 14
    move-result v3

    .line 15
    if-eqz v3, :cond_0

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getImageHeight()I

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    int-to-float v3, v3

    .line 22
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->getAdjustHeightScale()F

    .line 23
    .line 24
    .line 25
    move-result v4

    .line 26
    mul-float/2addr v3, v4

    .line 27
    div-float/2addr v3, v2

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    int-to-float v3, v3

    .line 34
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getImageHeight()I

    .line 35
    .line 36
    .line 37
    move-result v4

    .line 38
    int-to-float v4, v4

    .line 39
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->getAdjustHeightScale()F

    .line 40
    .line 41
    .line 42
    move-result v5

    .line 43
    mul-float/2addr v4, v5

    .line 44
    div-float/2addr v4, v2

    .line 45
    sub-float/2addr v3, v4

    .line 46
    :goto_0
    new-instance v4, Landroid/graphics/PointF;

    .line 47
    .line 48
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 49
    .line 50
    .line 51
    move-result v5

    .line 52
    int-to-float v5, v5

    .line 53
    div-float/2addr v1, v5

    .line 54
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 55
    .line 56
    .line 57
    move-result v5

    .line 58
    int-to-float v5, v5

    .line 59
    div-float/2addr v3, v5

    .line 60
    invoke-direct {v4, v1, v3}, Landroid/graphics/PointF;-><init>(FF)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getImageWidth()I

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    int-to-float v0, v0

    .line 68
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->getAdjustHeightScale()F

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    mul-float/2addr v0, v1

    .line 73
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    int-to-float v1, v1

    .line 78
    div-float/2addr v1, v2

    .line 79
    div-float/2addr v0, v1

    .line 80
    iput v0, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->scaleW:F

    .line 81
    .line 82
    iput v0, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->scaleH:F

    .line 83
    .line 84
    iput-object v4, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->centerPoint:Landroid/graphics/PointF;

    .line 85
    .line 86
    const/4 v0, 0x0

    .line 87
    iput v0, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->angle:F

    .line 88
    .line 89
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->filterTriggerManager:Lcom/momo/mcamera/mask/FilterTriggerManager;

    .line 90
    .line 91
    iput-object p0, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->filterTrigerManager:Lcom/momo/mcamera/mask/FilterTriggerManager;

    .line 92
    .line 93
    invoke-virtual {p1, p2}, Lcom/momo/mcamera/mask/StickerBlendFilter;->setDetectParam(Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method private drawFullScreenFixed(Lcom/momo/mcamera/mask/StickerBlendFilter;Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    const/high16 v1, 0x40000000    # 2.0f

    .line 7
    .line 8
    div-float/2addr v0, v1

    .line 9
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    int-to-float v2, v2

    .line 14
    iget-object v3, p1, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 15
    .line 16
    invoke-virtual {v3}, Lcom/momo/mcamera/mask/Sticker;->getImageHeight()I

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    int-to-float v3, v3

    .line 21
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->getAdjustHeightScale()F

    .line 22
    .line 23
    .line 24
    move-result v4

    .line 25
    mul-float/2addr v3, v4

    .line 26
    sub-float/2addr v2, v3

    .line 27
    div-float/2addr v2, v1

    .line 28
    iget-object v3, p1, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 29
    .line 30
    invoke-virtual {v3}, Lcom/momo/mcamera/mask/Sticker;->getImageHeight()I

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    int-to-float v3, v3

    .line 35
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->getAdjustHeightScale()F

    .line 36
    .line 37
    .line 38
    move-result v4

    .line 39
    mul-float/2addr v3, v4

    .line 40
    div-float/2addr v3, v1

    .line 41
    add-float/2addr v2, v3

    .line 42
    new-instance v3, Landroid/graphics/PointF;

    .line 43
    .line 44
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 45
    .line 46
    .line 47
    move-result v4

    .line 48
    int-to-float v4, v4

    .line 49
    div-float/2addr v0, v4

    .line 50
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 51
    .line 52
    .line 53
    move-result v4

    .line 54
    int-to-float v4, v4

    .line 55
    div-float/2addr v2, v4

    .line 56
    invoke-direct {v3, v0, v2}, Landroid/graphics/PointF;-><init>(FF)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p1, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 60
    .line 61
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getImageWidth()I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    const/16 v2, 0x168

    .line 66
    .line 67
    if-le v0, v2, :cond_0

    .line 68
    .line 69
    :goto_0
    move v0, v1

    .line 70
    goto :goto_1

    .line 71
    :cond_0
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    const/16 v2, 0x2d0

    .line 76
    .line 77
    if-ne v0, v2, :cond_1

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_1
    const/high16 v1, 0x3fc00000    # 1.5f

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :goto_1
    iput v1, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->scaleW:F

    .line 84
    .line 85
    iput v0, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->scaleH:F

    .line 86
    .line 87
    iput-object v3, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->centerPoint:Landroid/graphics/PointF;

    .line 88
    .line 89
    const/4 v0, 0x0

    .line 90
    iput v0, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->angle:F

    .line 91
    .line 92
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->filterTriggerManager:Lcom/momo/mcamera/mask/FilterTriggerManager;

    .line 93
    .line 94
    iput-object p0, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->filterTrigerManager:Lcom/momo/mcamera/mask/FilterTriggerManager;

    .line 95
    .line 96
    invoke-virtual {p1, p2}, Lcom/momo/mcamera/mask/StickerBlendFilter;->setDetectParam(Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V

    .line 97
    .line 98
    .line 99
    return-void
.end method

.method private drawGestureFilter(Lcom/momo/mcamera/mask/StickerBlendFilter;Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V
    .locals 1

    .line 1
    iget-object v0, p1, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->isDonotTrack()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-direct {p0, p1, p2}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->drawGestureFixedFilter(Lcom/momo/mcamera/mask/StickerBlendFilter;Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->drawGestureTrackingFilter(Lcom/momo/mcamera/mask/StickerBlendFilter;Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private drawGestureFixedFilter(Lcom/momo/mcamera/mask/StickerBlendFilter;Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V
    .locals 11

    .line 1
    iget-object v0, p1, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getObjectTriggerType()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_1

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mmcvBoxes:Lcom/core/glcore/cv/MMCVBoxes;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    if-eqz v0, :cond_4

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/core/glcore/cv/MMCVBoxes;->getDetectResult()[Lcom/momocv/MMBox;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    if-eqz v0, :cond_4

    .line 20
    .line 21
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mmcvBoxes:Lcom/core/glcore/cv/MMCVBoxes;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/core/glcore/cv/MMCVBoxes;->getDetectResult()[Lcom/momocv/MMBox;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    array-length v0, v0

    .line 28
    if-nez v0, :cond_1

    .line 29
    .line 30
    goto :goto_2

    .line 31
    :cond_1
    iget-object v0, p1, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getObjectTriggerType()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iput-object v0, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->triggerType:Ljava/lang/String;

    .line 38
    .line 39
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mmcvBoxes:Lcom/core/glcore/cv/MMCVBoxes;

    .line 40
    .line 41
    invoke-virtual {v0}, Lcom/core/glcore/cv/MMCVBoxes;->getDetectResult()[Lcom/momocv/MMBox;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    array-length v2, v0

    .line 46
    const/4 v3, 0x0

    .line 47
    :goto_0
    if-ge v3, v2, :cond_3

    .line 48
    .line 49
    aget-object v4, v0, v3

    .line 50
    .line 51
    iget v5, v4, Lcom/momocv/MMBox;->class_index_:I

    .line 52
    .line 53
    if-lez v5, :cond_2

    .line 54
    .line 55
    iget-object v5, v4, Lcom/momocv/MMBox;->class_name_:Ljava/lang/String;

    .line 56
    .line 57
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 58
    .line 59
    .line 60
    move-result v5

    .line 61
    if-nez v5, :cond_2

    .line 62
    .line 63
    iget-object v5, v4, Lcom/momocv/MMBox;->class_name_:Ljava/lang/String;

    .line 64
    .line 65
    iget-object v6, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->triggerType:Ljava/lang/String;

    .line 66
    .line 67
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result v5

    .line 71
    if-eqz v5, :cond_2

    .line 72
    .line 73
    new-instance v5, Landroid/graphics/RectF;

    .line 74
    .line 75
    iget v6, v4, Lcom/momocv/MMRect;->x_:I

    .line 76
    .line 77
    int-to-float v7, v6

    .line 78
    iget v8, v4, Lcom/momocv/MMRect;->y_:I

    .line 79
    .line 80
    int-to-float v9, v8

    .line 81
    iget v10, v4, Lcom/momocv/MMRect;->width_:I

    .line 82
    .line 83
    add-int/2addr v6, v10

    .line 84
    int-to-float v6, v6

    .line 85
    iget v4, v4, Lcom/momocv/MMRect;->height_:I

    .line 86
    .line 87
    add-int/2addr v8, v4

    .line 88
    int-to-float v4, v8

    .line 89
    invoke-direct {v5, v7, v9, v6, v4}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 90
    .line 91
    .line 92
    iput-object v5, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->gestureRect:Landroid/graphics/RectF;

    .line 93
    .line 94
    iget-object v4, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->filterTriggerManager:Lcom/momo/mcamera/mask/FilterTriggerManager;

    .line 95
    .line 96
    iput-object v4, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->filterTrigerManager:Lcom/momo/mcamera/mask/FilterTriggerManager;

    .line 97
    .line 98
    new-instance v4, Landroid/graphics/PointF;

    .line 99
    .line 100
    invoke-direct {v4, v1, v1}, Landroid/graphics/PointF;-><init>(FF)V

    .line 101
    .line 102
    .line 103
    iput-object v4, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->centerPoint:Landroid/graphics/PointF;

    .line 104
    .line 105
    invoke-virtual {p1, p2}, Lcom/momo/mcamera/mask/StickerBlendFilter;->setDetectParam(Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V

    .line 106
    .line 107
    .line 108
    :cond_2
    add-int/lit8 v3, v3, 0x1

    .line 109
    .line 110
    goto :goto_0

    .line 111
    :cond_3
    :goto_1
    return-void

    .line 112
    :cond_4
    :goto_2
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->filterTriggerManager:Lcom/momo/mcamera/mask/FilterTriggerManager;

    .line 113
    .line 114
    iput-object p0, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->filterTrigerManager:Lcom/momo/mcamera/mask/FilterTriggerManager;

    .line 115
    .line 116
    new-instance p0, Landroid/graphics/PointF;

    .line 117
    .line 118
    invoke-direct {p0, v1, v1}, Landroid/graphics/PointF;-><init>(FF)V

    .line 119
    .line 120
    .line 121
    iput-object p0, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->centerPoint:Landroid/graphics/PointF;

    .line 122
    .line 123
    invoke-virtual {p1, p2}, Lcom/momo/mcamera/mask/StickerBlendFilter;->setDetectParam(Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V

    .line 124
    .line 125
    .line 126
    return-void
.end method

.method private drawGestureTrackingFilter(Lcom/momo/mcamera/mask/StickerBlendFilter;Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mGestureTrackingFilter:Lcom/momo/mcamera/mask/StickerGestureTrackingFilter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/StickerGestureTrackingFilter;->isTrackingInit()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto/16 :goto_2

    .line 12
    .line 13
    :cond_0
    iget-object v0, p1, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getObjectTriggerType()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    goto/16 :goto_2

    .line 22
    .line 23
    :cond_1
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mmcvBoxes:Lcom/core/glcore/cv/MMCVBoxes;

    .line 24
    .line 25
    const/4 v1, 0x0

    .line 26
    if-eqz v0, :cond_7

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/core/glcore/cv/MMCVBoxes;->getDetectResult()[Lcom/momocv/MMBox;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    if-eqz v0, :cond_7

    .line 33
    .line 34
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mmcvBoxes:Lcom/core/glcore/cv/MMCVBoxes;

    .line 35
    .line 36
    invoke-virtual {v0}, Lcom/core/glcore/cv/MMCVBoxes;->getDetectResult()[Lcom/momocv/MMBox;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    array-length v0, v0

    .line 41
    if-nez v0, :cond_2

    .line 42
    .line 43
    goto/16 :goto_3

    .line 44
    .line 45
    :cond_2
    iget-object v0, p1, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 46
    .line 47
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getObjectTriggerType()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    iput-object v0, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->triggerType:Ljava/lang/String;

    .line 52
    .line 53
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mmcvBoxes:Lcom/core/glcore/cv/MMCVBoxes;

    .line 54
    .line 55
    invoke-virtual {v0}, Lcom/core/glcore/cv/MMCVBoxes;->getDetectResult()[Lcom/momocv/MMBox;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    array-length v2, v0

    .line 60
    const/4 v3, 0x0

    .line 61
    :goto_0
    if-ge v3, v2, :cond_6

    .line 62
    .line 63
    aget-object v4, v0, v3

    .line 64
    .line 65
    iget v5, v4, Lcom/momocv/MMBox;->class_index_:I

    .line 66
    .line 67
    if-lez v5, :cond_5

    .line 68
    .line 69
    iget-object v5, v4, Lcom/momocv/MMBox;->class_name_:Ljava/lang/String;

    .line 70
    .line 71
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 72
    .line 73
    .line 74
    move-result v5

    .line 75
    if-nez v5, :cond_5

    .line 76
    .line 77
    iget-object v5, v4, Lcom/momocv/MMBox;->class_name_:Ljava/lang/String;

    .line 78
    .line 79
    iget-object v6, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->triggerType:Ljava/lang/String;

    .line 80
    .line 81
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result v5

    .line 85
    if-eqz v5, :cond_5

    .line 86
    .line 87
    new-instance v5, Landroid/graphics/RectF;

    .line 88
    .line 89
    iget v6, v4, Lcom/momocv/MMRect;->x_:I

    .line 90
    .line 91
    int-to-float v7, v6

    .line 92
    iget v8, v4, Lcom/momocv/MMRect;->y_:I

    .line 93
    .line 94
    int-to-float v9, v8

    .line 95
    iget v10, v4, Lcom/momocv/MMRect;->width_:I

    .line 96
    .line 97
    add-int/2addr v6, v10

    .line 98
    int-to-float v6, v6

    .line 99
    iget v4, v4, Lcom/momocv/MMRect;->height_:I

    .line 100
    .line 101
    add-int/2addr v8, v4

    .line 102
    int-to-float v4, v8

    .line 103
    invoke-direct {v5, v7, v9, v6, v4}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 104
    .line 105
    .line 106
    iput-object v5, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->gestureRect:Landroid/graphics/RectF;

    .line 107
    .line 108
    new-instance v4, Lcom/momocv/MMRect;

    .line 109
    .line 110
    invoke-direct {v4}, Lcom/momocv/MMRect;-><init>()V

    .line 111
    .line 112
    .line 113
    iput-object v4, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mmcvRect:Lcom/momocv/MMRect;

    .line 114
    .line 115
    iget-object v4, p1, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 116
    .line 117
    invoke-virtual {v4}, Lcom/momo/mcamera/mask/Sticker;->getTrackingRegion()Lcom/momo/mcamera/mask/bean/ObjectRegion;

    .line 118
    .line 119
    .line 120
    move-result-object v4

    .line 121
    if-eqz v4, :cond_3

    .line 122
    .line 123
    iget-object v4, p1, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 124
    .line 125
    invoke-virtual {v4}, Lcom/momo/mcamera/mask/Sticker;->getTrackingRegion()Lcom/momo/mcamera/mask/bean/ObjectRegion;

    .line 126
    .line 127
    .line 128
    move-result-object v4

    .line 129
    new-instance v6, Landroid/graphics/RectF;

    .line 130
    .line 131
    invoke-direct {v6, v5}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    .line 132
    .line 133
    .line 134
    iget-object v5, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mmcvRect:Lcom/momocv/MMRect;

    .line 135
    .line 136
    iget v7, v6, Landroid/graphics/RectF;->left:F

    .line 137
    .line 138
    invoke-virtual {v6}, Landroid/graphics/RectF;->width()F

    .line 139
    .line 140
    .line 141
    move-result v8

    .line 142
    iget v9, v4, Lcom/momo/mcamera/mask/bean/ObjectRegion;->x:F

    .line 143
    .line 144
    mul-float/2addr v8, v9

    .line 145
    add-float/2addr v7, v8

    .line 146
    float-to-int v7, v7

    .line 147
    iput v7, v5, Lcom/momocv/MMRect;->x_:I

    .line 148
    .line 149
    iget-object v5, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mmcvRect:Lcom/momocv/MMRect;

    .line 150
    .line 151
    iget v7, v6, Landroid/graphics/RectF;->top:F

    .line 152
    .line 153
    invoke-virtual {v6}, Landroid/graphics/RectF;->height()F

    .line 154
    .line 155
    .line 156
    move-result v8

    .line 157
    iget v9, v4, Lcom/momo/mcamera/mask/bean/ObjectRegion;->y:F

    .line 158
    .line 159
    mul-float/2addr v8, v9

    .line 160
    add-float/2addr v7, v8

    .line 161
    float-to-int v7, v7

    .line 162
    iput v7, v5, Lcom/momocv/MMRect;->y_:I

    .line 163
    .line 164
    iget-object v5, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mmcvRect:Lcom/momocv/MMRect;

    .line 165
    .line 166
    iget v7, v5, Lcom/momocv/MMRect;->x_:I

    .line 167
    .line 168
    int-to-float v7, v7

    .line 169
    invoke-virtual {v6}, Landroid/graphics/RectF;->width()F

    .line 170
    .line 171
    .line 172
    move-result v8

    .line 173
    iget v9, v4, Lcom/momo/mcamera/mask/bean/ObjectRegion;->w:F

    .line 174
    .line 175
    mul-float/2addr v8, v9

    .line 176
    add-float/2addr v7, v8

    .line 177
    float-to-int v7, v7

    .line 178
    iput v7, v5, Lcom/momocv/MMRect;->width_:I

    .line 179
    .line 180
    iget-object v5, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mmcvRect:Lcom/momocv/MMRect;

    .line 181
    .line 182
    iget v7, v5, Lcom/momocv/MMRect;->y_:I

    .line 183
    .line 184
    int-to-float v7, v7

    .line 185
    invoke-virtual {v6}, Landroid/graphics/RectF;->height()F

    .line 186
    .line 187
    .line 188
    move-result v6

    .line 189
    iget v4, v4, Lcom/momo/mcamera/mask/bean/ObjectRegion;->h:F

    .line 190
    .line 191
    mul-float/2addr v6, v4

    .line 192
    add-float/2addr v7, v6

    .line 193
    float-to-int v4, v7

    .line 194
    iput v4, v5, Lcom/momocv/MMRect;->height_:I

    .line 195
    .line 196
    goto :goto_1

    .line 197
    :cond_3
    iget-object v4, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mmcvRect:Lcom/momocv/MMRect;

    .line 198
    .line 199
    iget v6, v5, Landroid/graphics/RectF;->left:F

    .line 200
    .line 201
    float-to-int v7, v6

    .line 202
    iput v7, v4, Lcom/momocv/MMRect;->x_:I

    .line 203
    .line 204
    iget v7, v5, Landroid/graphics/RectF;->top:F

    .line 205
    .line 206
    float-to-int v8, v7

    .line 207
    iput v8, v4, Lcom/momocv/MMRect;->y_:I

    .line 208
    .line 209
    iget v8, v5, Landroid/graphics/RectF;->right:F

    .line 210
    .line 211
    sub-float/2addr v8, v6

    .line 212
    float-to-int v6, v8

    .line 213
    iput v6, v4, Lcom/momocv/MMRect;->width_:I

    .line 214
    .line 215
    iget v5, v5, Landroid/graphics/RectF;->bottom:F

    .line 216
    .line 217
    sub-float/2addr v5, v7

    .line 218
    float-to-int v5, v5

    .line 219
    iput v5, v4, Lcom/momocv/MMRect;->height_:I

    .line 220
    .line 221
    :goto_1
    iget-object v4, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mGestureTrackingFilter:Lcom/momo/mcamera/mask/StickerGestureTrackingFilter;

    .line 222
    .line 223
    if-eqz v4, :cond_4

    .line 224
    .line 225
    iget-object v5, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mmcvRect:Lcom/momocv/MMRect;

    .line 226
    .line 227
    invoke-virtual {v4, v5}, Lcom/momo/mcamera/mask/StickerGestureTrackingFilter;->setMMCVRect(Lcom/momocv/MMRect;)V

    .line 228
    .line 229
    .line 230
    :cond_4
    iget-object v4, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->filterTriggerManager:Lcom/momo/mcamera/mask/FilterTriggerManager;

    .line 231
    .line 232
    iput-object v4, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->filterTrigerManager:Lcom/momo/mcamera/mask/FilterTriggerManager;

    .line 233
    .line 234
    new-instance v4, Landroid/graphics/PointF;

    .line 235
    .line 236
    invoke-direct {v4, v1, v1}, Landroid/graphics/PointF;-><init>(FF)V

    .line 237
    .line 238
    .line 239
    iput-object v4, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->centerPoint:Landroid/graphics/PointF;

    .line 240
    .line 241
    invoke-virtual {p1, p2}, Lcom/momo/mcamera/mask/StickerBlendFilter;->setDetectParam(Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V

    .line 242
    .line 243
    .line 244
    iget-object v4, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mGestureTrackingFilter:Lcom/momo/mcamera/mask/StickerGestureTrackingFilter;

    .line 245
    .line 246
    if-eqz v4, :cond_5

    .line 247
    .line 248
    invoke-virtual {v4}, Lcom/momo/mcamera/mask/StickerGestureTrackingFilter;->startTracking()V

    .line 249
    .line 250
    .line 251
    :cond_5
    add-int/lit8 v3, v3, 0x1

    .line 252
    .line 253
    goto/16 :goto_0

    .line 254
    .line 255
    :cond_6
    :goto_2
    return-void

    .line 256
    :cond_7
    :goto_3
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->filterTriggerManager:Lcom/momo/mcamera/mask/FilterTriggerManager;

    .line 257
    .line 258
    iput-object p0, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->filterTrigerManager:Lcom/momo/mcamera/mask/FilterTriggerManager;

    .line 259
    .line 260
    new-instance p0, Landroid/graphics/PointF;

    .line 261
    .line 262
    invoke-direct {p0, v1, v1}, Landroid/graphics/PointF;-><init>(FF)V

    .line 263
    .line 264
    .line 265
    iput-object p0, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->centerPoint:Landroid/graphics/PointF;

    .line 266
    .line 267
    invoke-virtual {p1, p2}, Lcom/momo/mcamera/mask/StickerBlendFilter;->setDetectParam(Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V

    .line 268
    .line 269
    .line 270
    return-void
.end method

.method private drawPositionSetFixed(Lcom/momo/mcamera/mask/StickerBlendFilter;Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V
    .locals 3

    .line 1
    iget-object v0, p1, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getImageWidth()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    int-to-float v0, v0

    .line 8
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    int-to-float v1, v1

    .line 13
    const/high16 v2, 0x40000000    # 2.0f

    .line 14
    .line 15
    div-float/2addr v1, v2

    .line 16
    div-float/2addr v0, v1

    .line 17
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    int-to-float v1, v1

    .line 22
    iget-object v2, p1, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 23
    .line 24
    invoke-virtual {v2}, Lcom/momo/mcamera/mask/Sticker;->getImageHeight()I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    int-to-float v2, v2

    .line 29
    div-float/2addr v1, v2

    .line 30
    mul-float/2addr v1, v0

    .line 31
    iput v1, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->scaleH:F

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    int-to-float v1, v1

    .line 38
    iget-object v2, p1, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 39
    .line 40
    invoke-virtual {v2}, Lcom/momo/mcamera/mask/Sticker;->getImageWidth()I

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    int-to-float v2, v2

    .line 45
    div-float/2addr v1, v2

    .line 46
    mul-float/2addr v1, v0

    .line 47
    iput v1, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->scaleW:F

    .line 48
    .line 49
    new-instance v0, Landroid/graphics/PointF;

    .line 50
    .line 51
    const/high16 v1, 0x3f000000    # 0.5f

    .line 52
    .line 53
    invoke-direct {v0, v1, v1}, Landroid/graphics/PointF;-><init>(FF)V

    .line 54
    .line 55
    .line 56
    iput-object v0, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->centerPoint:Landroid/graphics/PointF;

    .line 57
    .line 58
    const/4 v0, 0x0

    .line 59
    iput v0, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->angle:F

    .line 60
    .line 61
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->filterTriggerManager:Lcom/momo/mcamera/mask/FilterTriggerManager;

    .line 62
    .line 63
    iput-object p0, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->filterTrigerManager:Lcom/momo/mcamera/mask/FilterTriggerManager;

    .line 64
    .line 65
    invoke-virtual {p1, p2}, Lcom/momo/mcamera/mask/StickerBlendFilter;->setDetectParam(Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method private drawScaleCenterCrop(Lcom/momo/mcamera/mask/StickerBlendFilter;Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V
    .locals 4

    .line 1
    iget-object v0, p1, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getImageWidth()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    int-to-float v0, v0

    .line 8
    iget-object v1, p1, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 9
    .line 10
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/Sticker;->getImageHeight()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    int-to-float v1, v1

    .line 15
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    int-to-float v2, v2

    .line 20
    mul-float/2addr v2, v0

    .line 21
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    int-to-float v3, v3

    .line 26
    mul-float/2addr v3, v1

    .line 27
    cmpl-float v2, v2, v3

    .line 28
    .line 29
    if-lez v2, :cond_0

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    int-to-float v0, v0

    .line 36
    div-float/2addr v0, v1

    .line 37
    goto :goto_0

    .line 38
    :cond_0
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    int-to-float v1, v1

    .line 43
    div-float v0, v1, v0

    .line 44
    .line 45
    :goto_0
    const/high16 v1, 0x40000000    # 2.0f

    .line 46
    .line 47
    mul-float/2addr v0, v1

    .line 48
    iput v0, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->scaleW:F

    .line 49
    .line 50
    iput v0, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->scaleH:F

    .line 51
    .line 52
    new-instance v0, Landroid/graphics/PointF;

    .line 53
    .line 54
    const/high16 v1, 0x3f000000    # 0.5f

    .line 55
    .line 56
    invoke-direct {v0, v1, v1}, Landroid/graphics/PointF;-><init>(FF)V

    .line 57
    .line 58
    .line 59
    iput-object v0, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->centerPoint:Landroid/graphics/PointF;

    .line 60
    .line 61
    const/4 v0, 0x0

    .line 62
    iput v0, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->angle:F

    .line 63
    .line 64
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->filterTriggerManager:Lcom/momo/mcamera/mask/FilterTriggerManager;

    .line 65
    .line 66
    iput-object p0, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->filterTrigerManager:Lcom/momo/mcamera/mask/FilterTriggerManager;

    .line 67
    .line 68
    invoke-virtual {p1, p2}, Lcom/momo/mcamera/mask/StickerBlendFilter;->setDetectParam(Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method private drawTrackerSticker(Lcom/momo/mcamera/mask/StickerBlendFilter;Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V
    .locals 0

    .line 1
    invoke-virtual {p1, p2}, Lcom/momo/mcamera/mask/StickerBlendFilter;->setDetectParam(Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private insertSpecifiedPosition(Ll/jt2;Ll/jt2;)V
    .locals 1

    .line 1
    iget-object v0, p1, Ll/jt2;->parentFilter:Ll/jt2;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/gfj;->removeTarget(Ll/dfj;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p2}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p2}, Ll/ogk;->registerFilter(Ll/jt2;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p2, Ll/jt2;->parentFilter:Ll/jt2;

    .line 13
    .line 14
    iput-object p2, p1, Ll/jt2;->parentFilter:Ll/jt2;

    .line 15
    .line 16
    invoke-virtual {p2, p1}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method private isBitmapValid(Landroid/graphics/Bitmap;)Z
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method private isBlendSticker(Lcom/momo/mcamera/mask/Sticker;)Z
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getBlendMode()Lcom/momo/mcamera/mask/Sticker$BlendMode;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getBlendMode()Lcom/momo/mcamera/mask/Sticker$BlendMode;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iget-object p0, p0, Lcom/momo/mcamera/mask/Sticker$BlendMode;->name:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method private multiStickerFilterAddListener(Lcom/momo/mcamera/mask/Sticker;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mMultiStickerMaskFilter:Lcom/momo/mcamera/mask/MultiStickerMaskFilter;

    .line 2
    .line 3
    new-instance v1, Lcom/momo/mcamera/mask/StickerAdjustFilter$10;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Lcom/momo/mcamera/mask/StickerAdjustFilter$10;-><init>(Lcom/momo/mcamera/mask/StickerAdjustFilter;Lcom/momo/mcamera/mask/Sticker;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1, v1}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->addSticker(Lcom/momo/mcamera/mask/Sticker;Lcom/momo/mcamera/mask/StickerBlendFilter$StickerStateChangeListener;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mMultiStickerMaskFilter:Lcom/momo/mcamera/mask/MultiStickerMaskFilter;

    .line 12
    .line 13
    new-instance v0, Lcom/momo/mcamera/mask/StickerAdjustFilter$11;

    .line 14
    .line 15
    invoke-direct {v0, p0}, Lcom/momo/mcamera/mask/StickerAdjustFilter$11;-><init>(Lcom/momo/mcamera/mask/StickerAdjustFilter;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1, v0}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->setStickerFinishListener(Lcom/momo/mcamera/mask/MultiStickerMaskFilter$StickerFinishListener;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method private processDistortionState()V
    .locals 14

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mDistorationMask:Lcom/momo/mcamera/mask/Mask;

    .line 2
    .line 3
    if-eqz v0, :cond_a

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mFaceStateChange:Z

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    if-nez v0, :cond_1

    .line 9
    .line 10
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mmcvBoxes:Lcom/core/glcore/cv/MMCVBoxes;

    .line 11
    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/core/glcore/cv/MMCVBoxes;->getDetectResult()[Lcom/momocv/MMBox;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    array-length v2, v0

    .line 19
    const/4 v3, 0x0

    .line 20
    :goto_0
    if-ge v3, v2, :cond_1

    .line 21
    .line 22
    aget-object v4, v0, v3

    .line 23
    .line 24
    iget-object v4, v4, Lcom/momocv/MMBox;->class_name_:Ljava/lang/String;

    .line 25
    .line 26
    iget-object v5, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mDistorationMask:Lcom/momo/mcamera/mask/Mask;

    .line 27
    .line 28
    invoke-virtual {v5}, Lcom/momo/mcamera/mask/Mask;->getHidingObjectTriggerType()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v5

    .line 32
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v4

    .line 36
    if-eqz v4, :cond_0

    .line 37
    .line 38
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mFaceStateChange:Z

    .line 39
    .line 40
    :cond_0
    add-int/lit8 v3, v3, 0x1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    iget-boolean v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mFaceStateChange:Z

    .line 44
    .line 45
    if-eqz v0, :cond_a

    .line 46
    .line 47
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mDistorationMask:Lcom/momo/mcamera/mask/Mask;

    .line 48
    .line 49
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Mask;->getStrengthStep()F

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    const/4 v2, 0x0

    .line 54
    cmpl-float v0, v0, v2

    .line 55
    .line 56
    if-nez v0, :cond_2

    .line 57
    .line 58
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mDistorationMask:Lcom/momo/mcamera/mask/Mask;

    .line 59
    .line 60
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Mask;->getStrengthStepB()F

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    cmpl-float v0, v0, v2

    .line 65
    .line 66
    if-nez v0, :cond_2

    .line 67
    .line 68
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mFaceBeauty:Z

    .line 69
    .line 70
    goto :goto_1

    .line 71
    :cond_2
    iget-boolean v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mFaceBeauty:Z

    .line 72
    .line 73
    if-nez v0, :cond_5

    .line 74
    .line 75
    iget v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mFaceThinValue:F

    .line 76
    .line 77
    cmpl-float v3, v0, v2

    .line 78
    .line 79
    if-lez v3, :cond_3

    .line 80
    .line 81
    iget-object v3, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mDistorationMask:Lcom/momo/mcamera/mask/Mask;

    .line 82
    .line 83
    invoke-virtual {v3}, Lcom/momo/mcamera/mask/Mask;->getStrengthStep()F

    .line 84
    .line 85
    .line 86
    move-result v3

    .line 87
    sub-float/2addr v0, v3

    .line 88
    iput v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mFaceThinValue:F

    .line 89
    .line 90
    :cond_3
    iget v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mBigEyeValue:F

    .line 91
    .line 92
    cmpl-float v3, v0, v2

    .line 93
    .line 94
    if-lez v3, :cond_4

    .line 95
    .line 96
    iget-object v3, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mDistorationMask:Lcom/momo/mcamera/mask/Mask;

    .line 97
    .line 98
    invoke-virtual {v3}, Lcom/momo/mcamera/mask/Mask;->getStrengthStepB()F

    .line 99
    .line 100
    .line 101
    move-result v3

    .line 102
    sub-float/2addr v0, v3

    .line 103
    iput v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mBigEyeValue:F

    .line 104
    .line 105
    :cond_4
    iget v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mFaceThinValue:F

    .line 106
    .line 107
    cmpg-float v0, v0, v2

    .line 108
    .line 109
    if-gtz v0, :cond_5

    .line 110
    .line 111
    iget v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mBigEyeValue:F

    .line 112
    .line 113
    cmpg-float v0, v0, v2

    .line 114
    .line 115
    if-gtz v0, :cond_5

    .line 116
    .line 117
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mFaceBeauty:Z

    .line 118
    .line 119
    :cond_5
    :goto_1
    iget-boolean v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mFaceBeauty:Z

    .line 120
    .line 121
    if-eqz v0, :cond_9

    .line 122
    .line 123
    iget-boolean v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mFaceBeautyHaveFinish:Z

    .line 124
    .line 125
    if-nez v0, :cond_9

    .line 126
    .line 127
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mDistorationMask:Lcom/momo/mcamera/mask/Mask;

    .line 128
    .line 129
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Mask;->getStrengthStep()F

    .line 130
    .line 131
    .line 132
    move-result v0

    .line 133
    cmpl-float v0, v0, v2

    .line 134
    .line 135
    if-nez v0, :cond_6

    .line 136
    .line 137
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mBeautyFace:Lcom/momo/mcamera/mask/BeautyFace;

    .line 138
    .line 139
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/BeautyFace;->getThinFaceValue()F

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    iput v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mFaceThinValue:F

    .line 144
    .line 145
    goto :goto_2

    .line 146
    :cond_6
    iget v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mFaceThinValue:F

    .line 147
    .line 148
    iget-object v3, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mDistorationMask:Lcom/momo/mcamera/mask/Mask;

    .line 149
    .line 150
    invoke-virtual {v3}, Lcom/momo/mcamera/mask/Mask;->getStrengthStep()F

    .line 151
    .line 152
    .line 153
    move-result v3

    .line 154
    add-float/2addr v0, v3

    .line 155
    iput v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mFaceThinValue:F

    .line 156
    .line 157
    :goto_2
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mDistorationMask:Lcom/momo/mcamera/mask/Mask;

    .line 158
    .line 159
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Mask;->getStrengthStepB()F

    .line 160
    .line 161
    .line 162
    move-result v0

    .line 163
    cmpl-float v0, v0, v2

    .line 164
    .line 165
    if-nez v0, :cond_7

    .line 166
    .line 167
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mBeautyFace:Lcom/momo/mcamera/mask/BeautyFace;

    .line 168
    .line 169
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/BeautyFace;->getBigEyeValue()F

    .line 170
    .line 171
    .line 172
    move-result v0

    .line 173
    iput v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mBigEyeValue:F

    .line 174
    .line 175
    goto :goto_3

    .line 176
    :cond_7
    iget v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mBigEyeValue:F

    .line 177
    .line 178
    iget-object v2, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mDistorationMask:Lcom/momo/mcamera/mask/Mask;

    .line 179
    .line 180
    invoke-virtual {v2}, Lcom/momo/mcamera/mask/Mask;->getStrengthStepB()F

    .line 181
    .line 182
    .line 183
    move-result v2

    .line 184
    add-float/2addr v0, v2

    .line 185
    iput v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mBigEyeValue:F

    .line 186
    .line 187
    :goto_3
    iget v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mFaceThinValue:F

    .line 188
    .line 189
    iget-object v2, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mBeautyFace:Lcom/momo/mcamera/mask/BeautyFace;

    .line 190
    .line 191
    invoke-virtual {v2}, Lcom/momo/mcamera/mask/BeautyFace;->getThinFaceValue()F

    .line 192
    .line 193
    .line 194
    move-result v2

    .line 195
    cmpl-float v0, v0, v2

    .line 196
    .line 197
    if-ltz v0, :cond_8

    .line 198
    .line 199
    iget v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mBigEyeValue:F

    .line 200
    .line 201
    iget-object v2, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mBeautyFace:Lcom/momo/mcamera/mask/BeautyFace;

    .line 202
    .line 203
    invoke-virtual {v2}, Lcom/momo/mcamera/mask/BeautyFace;->getBigEyeValue()F

    .line 204
    .line 205
    .line 206
    move-result v2

    .line 207
    cmpl-float v0, v0, v2

    .line 208
    .line 209
    if-ltz v0, :cond_8

    .line 210
    .line 211
    iget-object v2, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->stickerStateChangeListener:Lcom/momo/mcamera/mask/StickerBlendFilter$StickerStateChangeListener;

    .line 212
    .line 213
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mBeautyFace:Lcom/momo/mcamera/mask/BeautyFace;

    .line 214
    .line 215
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/BeautyFace;->getThinFaceValue()F

    .line 216
    .line 217
    .line 218
    move-result v4

    .line 219
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mBeautyFace:Lcom/momo/mcamera/mask/BeautyFace;

    .line 220
    .line 221
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/BeautyFace;->getBigEyeValue()F

    .line 222
    .line 223
    .line 224
    move-result v5

    .line 225
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mBeautyFace:Lcom/momo/mcamera/mask/BeautyFace;

    .line 226
    .line 227
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/BeautyFace;->getSkinSmoothingValue()F

    .line 228
    .line 229
    .line 230
    move-result v6

    .line 231
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mBeautyFace:Lcom/momo/mcamera/mask/BeautyFace;

    .line 232
    .line 233
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/BeautyFace;->getSkinWhitenValue()F

    .line 234
    .line 235
    .line 236
    move-result v7

    .line 237
    const/4 v3, 0x1

    .line 238
    invoke-interface/range {v2 .. v7}, Lcom/momo/mcamera/mask/StickerBlendFilter$StickerStateChangeListener;->distortionStateChanged(ZFFFF)V

    .line 239
    .line 240
    .line 241
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mFaceBeautyHaveFinish:Z

    .line 242
    .line 243
    return-void

    .line 244
    :cond_8
    iget-object v8, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->stickerStateChangeListener:Lcom/momo/mcamera/mask/StickerBlendFilter$StickerStateChangeListener;

    .line 245
    .line 246
    iget v10, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mFaceThinValue:F

    .line 247
    .line 248
    iget v11, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mBigEyeValue:F

    .line 249
    .line 250
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mBeautyFace:Lcom/momo/mcamera/mask/BeautyFace;

    .line 251
    .line 252
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/BeautyFace;->getSkinSmoothingValue()F

    .line 253
    .line 254
    .line 255
    move-result v12

    .line 256
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mBeautyFace:Lcom/momo/mcamera/mask/BeautyFace;

    .line 257
    .line 258
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/BeautyFace;->getSkinWhitenValue()F

    .line 259
    .line 260
    .line 261
    move-result v13

    .line 262
    const/4 v9, 0x1

    .line 263
    invoke-interface/range {v8 .. v13}, Lcom/momo/mcamera/mask/StickerBlendFilter$StickerStateChangeListener;->distortionStateChanged(ZFFFF)V

    .line 264
    .line 265
    .line 266
    return-void

    .line 267
    :cond_9
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->stickerStateChangeListener:Lcom/momo/mcamera/mask/StickerBlendFilter$StickerStateChangeListener;

    .line 268
    .line 269
    iget v2, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mFaceThinValue:F

    .line 270
    .line 271
    iget v3, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mBigEyeValue:F

    .line 272
    .line 273
    const/4 v4, 0x0

    .line 274
    const/4 v5, 0x0

    .line 275
    const/4 v1, 0x0

    .line 276
    invoke-interface/range {v0 .. v5}, Lcom/momo/mcamera/mask/StickerBlendFilter$StickerStateChangeListener;->distortionStateChanged(ZFFFF)V

    .line 277
    .line 278
    .line 279
    :cond_a
    return-void
.end method

.method private removeEffectFilter(Ll/jt2;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mOrderFilterList:Ljava/util/LinkedList;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    iget-object v0, p1, Ll/jt2;->parentFilter:Ll/jt2;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ll/gfj;->removeTarget(Ll/dfj;)V

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mTerminalFilter:Ll/jt2;

    .line 12
    .line 13
    if-ne v1, p1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ll/ogk;->removeTerminalFilter(Ll/jt2;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, v0}, Ll/ogk;->registerTerminalFilter(Ll/jt2;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mTerminalFilter:Ll/jt2;

    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    invoke-virtual {p0, p1}, Ll/ogk;->removeFilter(Ll/jt2;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p1}, Ll/gfj;->getTargets()Ljava/util/List;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    const/4 v1, 0x0

    .line 35
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    check-cast p0, Ll/jt2;

    .line 40
    .line 41
    invoke-virtual {p1, p0}, Ll/gfj;->removeTarget(Ll/dfj;)V

    .line 42
    .line 43
    .line 44
    iput-object v0, p0, Ll/jt2;->parentFilter:Ll/jt2;

    .line 45
    .line 46
    invoke-virtual {v0, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method private removeStickerBlendFilter(Lcom/momo/mcamera/mask/StickerBlendFilter;)V
    .locals 2

    .line 1
    iget-object v0, p1, Ll/jt2;->parentFilter:Ll/jt2;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/gfj;->removeTarget(Ll/dfj;)V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mTerminalFilter:Ll/jt2;

    .line 7
    .line 8
    if-ne v1, p1, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ll/ogk;->removeTerminalFilter(Ll/jt2;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, v0}, Ll/ogk;->registerTerminalFilter(Ll/jt2;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mTerminalFilter:Ll/jt2;

    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    invoke-virtual {p0, p1}, Ll/ogk;->removeFilter(Ll/jt2;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1}, Ll/gfj;->getTargets()Ljava/util/List;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const/4 v1, 0x0

    .line 30
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    instance-of p0, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;

    .line 35
    .line 36
    if-eqz p0, :cond_1

    .line 37
    .line 38
    invoke-virtual {p1}, Ll/gfj;->getTargets()Ljava/util/List;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    check-cast p0, Lcom/momo/mcamera/mask/StickerBlendFilter;

    .line 47
    .line 48
    iput-object v0, p0, Ll/jt2;->parentFilter:Ll/jt2;

    .line 49
    .line 50
    invoke-virtual {v0, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_1
    invoke-virtual {p1}, Ll/gfj;->getTargets()Ljava/util/List;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    check-cast p0, Ll/jt2;

    .line 63
    .line 64
    iput-object v0, p0, Ll/jt2;->parentFilter:Ll/jt2;

    .line 65
    .line 66
    invoke-virtual {v0, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method private removeStickerFilter(Lcom/momo/mcamera/mask/Sticker;)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/gfj;->getLockObject()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    monitor-enter v0

    .line 6
    :try_start_0
    iget-object v1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mStickerFilterMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getStickerType()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-virtual {v1, v2}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    check-cast v1, Lcom/momo/mcamera/mask/StickerBlendFilter;

    .line 17
    .line 18
    const/4 v2, 0x0

    .line 19
    invoke-virtual {v1, v2}, Lcom/momo/mcamera/mask/StickerBlendFilter;->setFinishListener(Lcom/momo/mcamera/mask/StickerBlendFilter$StickerMaskFinishListener;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1, v2}, Lcom/momo/mcamera/mask/StickerBlendFilter;->setFinishListener(Lcom/momo/mcamera/mask/StickerBlendFilter$StickerMaskFinishListener;)V

    .line 23
    .line 24
    .line 25
    invoke-direct {p0, v1}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->removeStickerBlendFilter(Lcom/momo/mcamera/mask/StickerBlendFilter;)V

    .line 26
    .line 27
    .line 28
    iget-object v2, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mOrderFilterList:Ljava/util/LinkedList;

    .line 29
    .line 30
    invoke-virtual {v2, v1}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    iget-object v2, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mStickerFilterMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 34
    .line 35
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getStickerType()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    invoke-virtual {v2, v3}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    iget-object v2, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->filtersToDestroy:Ljava/util/List;

    .line 43
    .line 44
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    iget-object v1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->finishListener:Lcom/momo/mcamera/mask/StickerAdjustFilter$StickerMaskFinishListener;

    .line 48
    .line 49
    if-eqz v1, :cond_2

    .line 50
    .line 51
    iget v2, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mBigEye:F

    .line 52
    .line 53
    const/4 v3, 0x0

    .line 54
    cmpl-float v2, v2, v3

    .line 55
    .line 56
    const/4 v4, 0x1

    .line 57
    if-lez v2, :cond_0

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_0
    iget v2, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mThinFace:F

    .line 61
    .line 62
    add-float/2addr v2, v3

    .line 63
    cmpl-float v2, v2, v3

    .line 64
    .line 65
    if-lez v2, :cond_1

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_1
    const/4 v4, 0x0

    .line 69
    :goto_0
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mStickerFilterMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 70
    .line 71
    invoke-virtual {p0}, Ljava/util/concurrent/ConcurrentHashMap;->size()I

    .line 72
    .line 73
    .line 74
    move-result p0

    .line 75
    add-int/2addr p0, v4

    .line 76
    invoke-interface {v1, p0, p1}, Lcom/momo/mcamera/mask/StickerAdjustFilter$StickerMaskFinishListener;->stickerRenderFinished(ILcom/momo/mcamera/mask/Sticker;)V

    .line 77
    .line 78
    .line 79
    goto :goto_1

    .line 80
    :catchall_0
    move-exception p0

    .line 81
    goto :goto_2

    .line 82
    :cond_2
    :goto_1
    monitor-exit v0

    .line 83
    return-void

    .line 84
    :goto_2
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 85
    throw p0
.end method

.method private declared-synchronized setRunableCalledWhenLoaded(ILjava/lang/Runnable;)V
    .locals 3

    .line 1
    const-string v0, "[SoundPool] set runable info id = "

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    const-string v1, "media"

    .line 5
    .line 6
    new-instance v2, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    if-lez p1, :cond_2

    .line 22
    .line 23
    if-eqz p2, :cond_2

    .line 24
    .line 25
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->soundInfoMap:Ljava/util/Map;

    .line 26
    .line 27
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, Lcom/momo/mcamera/mask/StickerAdjustFilter$SoundPoolInfo;

    .line 36
    .line 37
    if-eqz v0, :cond_0

    .line 38
    .line 39
    iget-boolean v1, v0, Lcom/momo/mcamera/mask/StickerAdjustFilter$SoundPoolInfo;->isLoaded:Z

    .line 40
    .line 41
    if-eqz v1, :cond_0

    .line 42
    .line 43
    const-string v0, "media"

    .line 44
    .line 45
    const-string v1, "[SoundPool] sample is is loaded , execute runable   + sampleid="

    .line 46
    .line 47
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-static {v0, v1, p1}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 56
    .line 57
    .line 58
    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    .line 59
    .line 60
    .line 61
    goto :goto_0

    .line 62
    :catchall_0
    move-exception p1

    .line 63
    goto :goto_1

    .line 64
    :cond_0
    const-string v1, "media"

    .line 65
    .line 66
    const-string v2, "[SoundPool] sample is not loaded, just update it "

    .line 67
    .line 68
    invoke-static {v1, v2}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    if-nez v0, :cond_1

    .line 72
    .line 73
    new-instance v0, Lcom/momo/mcamera/mask/StickerAdjustFilter$SoundPoolInfo;

    .line 74
    .line 75
    invoke-direct {v0, p0}, Lcom/momo/mcamera/mask/StickerAdjustFilter$SoundPoolInfo;-><init>(Lcom/momo/mcamera/mask/StickerAdjustFilter;)V

    .line 76
    .line 77
    .line 78
    :cond_1
    iput p1, v0, Lcom/momo/mcamera/mask/StickerAdjustFilter$SoundPoolInfo;->soundId:I

    .line 79
    .line 80
    iput-object p2, v0, Lcom/momo/mcamera/mask/StickerAdjustFilter$SoundPoolInfo;->runnable:Ljava/lang/Runnable;

    .line 81
    .line 82
    iget-object p2, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->soundInfoMap:Ljava/util/Map;

    .line 83
    .line 84
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    invoke-interface {p2, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 89
    .line 90
    .line 91
    :cond_2
    :goto_0
    monitor-exit p0

    .line 92
    return-void

    .line 93
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 94
    throw p1
.end method

.method private tryLoadSound(Lcom/momo/mcamera/mask/MaskModel;I)V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->clearAllSoundPoolInfo()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->soundPool:Landroid/media/SoundPool;

    .line 5
    .line 6
    if-eqz v0, :cond_2

    .line 7
    .line 8
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->soundIds:Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Ljava/lang/Integer;

    .line 25
    .line 26
    iget-object v2, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->soundPool:Landroid/media/SoundPool;

    .line 27
    .line 28
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    invoke-virtual {v2, v1}, Landroid/media/SoundPool;->unload(I)Z

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->soundPool:Landroid/media/SoundPool;

    .line 37
    .line 38
    invoke-virtual {v0}, Landroid/media/SoundPool;->release()V

    .line 39
    .line 40
    .line 41
    new-instance v0, Landroid/media/SoundPool;

    .line 42
    .line 43
    const/4 v1, 0x3

    .line 44
    const/4 v2, 0x5

    .line 45
    invoke-direct {v0, p2, v1, v2}, Landroid/media/SoundPool;-><init>(III)V

    .line 46
    .line 47
    .line 48
    iput-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->soundPool:Landroid/media/SoundPool;

    .line 49
    .line 50
    new-instance p2, Lcom/momo/mcamera/mask/StickerAdjustFilter$6;

    .line 51
    .line 52
    invoke-direct {p2, p0}, Lcom/momo/mcamera/mask/StickerAdjustFilter$6;-><init>(Lcom/momo/mcamera/mask/StickerAdjustFilter;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0, p2}, Landroid/media/SoundPool;->setOnLoadCompleteListener(Landroid/media/SoundPool$OnLoadCompleteListener;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getStickers()Ljava/util/List;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    :cond_1
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 67
    .line 68
    .line 69
    move-result p2

    .line 70
    if-eqz p2, :cond_2

    .line 71
    .line 72
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object p2

    .line 76
    check-cast p2, Lcom/momo/mcamera/mask/Sticker;

    .line 77
    .line 78
    invoke-virtual {p2}, Lcom/momo/mcamera/mask/Sticker;->getSound()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    if-nez v0, :cond_1

    .line 87
    .line 88
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->soundPool:Landroid/media/SoundPool;

    .line 89
    .line 90
    invoke-virtual {p2}, Lcom/momo/mcamera/mask/Sticker;->getSoundPath()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    const/16 v2, 0x3e7

    .line 95
    .line 96
    invoke-virtual {v0, v1, v2}, Landroid/media/SoundPool;->load(Ljava/lang/String;I)I

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    new-instance v1, Ljava/lang/StringBuilder;

    .line 101
    .line 102
    const-string v2, "[SoundPool]load tag is "

    .line 103
    .line 104
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v1

    .line 114
    const-string v2, "media"

    .line 115
    .line 116
    invoke-static {v2, v1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {p2, v0}, Lcom/momo/mcamera/mask/Sticker;->setSoundId(I)V

    .line 120
    .line 121
    .line 122
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->soundIds:Ljava/util/ArrayList;

    .line 123
    .line 124
    invoke-virtual {p2}, Lcom/momo/mcamera/mask/Sticker;->getSoundId()I

    .line 125
    .line 126
    .line 127
    move-result p2

    .line 128
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 129
    .line 130
    .line 131
    move-result-object p2

    .line 132
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 133
    .line 134
    .line 135
    goto :goto_1

    .line 136
    :cond_2
    return-void
.end method

.method private declared-synchronized updateSoundPoolLoadedStatus(Landroid/media/SoundPool;II)V
    .locals 5

    .line 1
    const-string v0, "[SoundPool]sticker is playing now , so execute runable id="

    .line 2
    .line 3
    const-string v1, "[SoundPool]sticker is not playing, so put info to map id="

    .line 4
    .line 5
    const-string v2, "update loadedStatus cur id="

    .line 6
    .line 7
    monitor-enter p0

    .line 8
    :try_start_0
    const-string v3, "media"

    .line 9
    .line 10
    new-instance v4, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    invoke-direct {v4, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-static {v3, v2}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    if-eqz p1, :cond_1

    .line 26
    .line 27
    if-lez p2, :cond_1

    .line 28
    .line 29
    if-nez p3, :cond_1

    .line 30
    .line 31
    iget-object p1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->soundInfoMap:Ljava/util/Map;

    .line 32
    .line 33
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 34
    .line 35
    .line 36
    move-result-object p3

    .line 37
    invoke-interface {p1, p3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    check-cast p1, Lcom/momo/mcamera/mask/StickerAdjustFilter$SoundPoolInfo;

    .line 42
    .line 43
    const/4 p3, 0x1

    .line 44
    if-nez p1, :cond_0

    .line 45
    .line 46
    new-instance p1, Lcom/momo/mcamera/mask/StickerAdjustFilter$SoundPoolInfo;

    .line 47
    .line 48
    invoke-direct {p1, p0}, Lcom/momo/mcamera/mask/StickerAdjustFilter$SoundPoolInfo;-><init>(Lcom/momo/mcamera/mask/StickerAdjustFilter;)V

    .line 49
    .line 50
    .line 51
    iput p2, p1, Lcom/momo/mcamera/mask/StickerAdjustFilter$SoundPoolInfo;->soundId:I

    .line 52
    .line 53
    iput-boolean p3, p1, Lcom/momo/mcamera/mask/StickerAdjustFilter$SoundPoolInfo;->isLoaded:Z

    .line 54
    .line 55
    iget-object p3, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->soundInfoMap:Ljava/util/Map;

    .line 56
    .line 57
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-interface {p3, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    const-string p1, "media"

    .line 65
    .line 66
    new-instance p3, Ljava/lang/StringBuilder;

    .line 67
    .line 68
    invoke-direct {p3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p2

    .line 78
    invoke-static {p1, p2}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    goto :goto_0

    .line 82
    :catchall_0
    move-exception p1

    .line 83
    goto :goto_1

    .line 84
    :cond_0
    const-string v1, "media"

    .line 85
    .line 86
    new-instance v2, Ljava/lang/StringBuilder;

    .line 87
    .line 88
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object p2

    .line 98
    invoke-static {v1, p2}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    iput-boolean p3, p1, Lcom/momo/mcamera/mask/StickerAdjustFilter$SoundPoolInfo;->isLoaded:Z

    .line 102
    .line 103
    iget-object p2, p1, Lcom/momo/mcamera/mask/StickerAdjustFilter$SoundPoolInfo;->runnable:Ljava/lang/Runnable;

    .line 104
    .line 105
    if-eqz p2, :cond_1

    .line 106
    .line 107
    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    .line 108
    .line 109
    .line 110
    const/4 p2, 0x0

    .line 111
    iput-object p2, p1, Lcom/momo/mcamera/mask/StickerAdjustFilter$SoundPoolInfo;->runnable:Ljava/lang/Runnable;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 112
    .line 113
    :cond_1
    :goto_0
    monitor-exit p0

    .line 114
    return-void

    .line 115
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 116
    throw p1
.end method

.method private updateplayStatus(Lcom/momo/mcamera/mask/Sticker;II)V
    .locals 0

    return-void
.end method


# virtual methods
.method public addFaceDetectFilter(Lcom/momo/mcamera/mask/FaceDetectFilter;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/gfj;->getLockObject()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    monitor-enter p0

    .line 6
    :try_start_0
    monitor-exit p0

    .line 7
    return-void

    .line 8
    :catchall_0
    move-exception p1

    .line 9
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    throw p1
.end method

.method public addGestureMaskModel(Ljava/lang/String;Lcom/momo/mcamera/mask/MaskModel;)Z
    .locals 9

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "StickerAdjustFilter addGestureMaskModel gestureTriggerType = "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "FilterProcess"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    if-nez p2, :cond_0

    .line 22
    .line 23
    return v0

    .line 24
    :cond_0
    iget-object v1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mmcvBoxes:Lcom/core/glcore/cv/MMCVBoxes;

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    invoke-static {v1, p1, p2, v2, v3}, Lcom/momo/mcamera/mask/FilterTriggerManager;->isTriggerRegionMatches(Lcom/core/glcore/cv/MMCVBoxes;Ljava/lang/String;Lcom/momo/mcamera/mask/MaskModel;II)Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-nez v1, :cond_1

    .line 39
    .line 40
    return v0

    .line 41
    :cond_1
    iget-object v1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->gestureDetectedListener:Lcom/momo/mcamera/mask/StickerAdjustFilter$GestureDetectedListener;

    .line 42
    .line 43
    if-eqz v1, :cond_2

    .line 44
    .line 45
    invoke-interface {v1, p1}, Lcom/momo/mcamera/mask/StickerAdjustFilter$GestureDetectedListener;->onPreGestureAdded(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    :cond_2
    iget-wide v1, p2, Lcom/momo/mcamera/mask/MaskModel;->addTime:J

    .line 49
    .line 50
    const-wide/16 v3, 0x0

    .line 51
    .line 52
    cmp-long p1, v1, v3

    .line 53
    .line 54
    if-eqz p1, :cond_4

    .line 55
    .line 56
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 57
    .line 58
    .line 59
    move-result-wide v1

    .line 60
    iget-wide v5, p2, Lcom/momo/mcamera/mask/MaskModel;->addTime:J

    .line 61
    .line 62
    sub-long/2addr v1, v5

    .line 63
    invoke-virtual {p2}, Lcom/momo/mcamera/mask/MaskModel;->getDuration()J

    .line 64
    .line 65
    .line 66
    move-result-wide v5

    .line 67
    const-wide/16 v7, 0x3e8

    .line 68
    .line 69
    add-long/2addr v5, v7

    .line 70
    cmp-long p1, v1, v5

    .line 71
    .line 72
    if-lez p1, :cond_3

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_3
    return v0

    .line 76
    :cond_4
    :goto_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 77
    .line 78
    .line 79
    move-result-wide v0

    .line 80
    iput-wide v0, p2, Lcom/momo/mcamera/mask/MaskModel;->addTime:J

    .line 81
    .line 82
    invoke-virtual {p2}, Lcom/momo/mcamera/mask/MaskModel;->getDuration()J

    .line 83
    .line 84
    .line 85
    move-result-wide v0

    .line 86
    invoke-virtual {p2, v0, v1}, Lcom/momo/mcamera/mask/MaskModel;->setDuration(J)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {p0, p2}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->addMaskModel(Lcom/momo/mcamera/mask/MaskModel;)V

    .line 90
    .line 91
    .line 92
    iput-wide v3, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->startTime:J

    .line 93
    .line 94
    const/4 p0, 0x1

    .line 95
    return p0
.end method

.method public addGestureModel(Ljava/lang/String;Lcom/momo/mcamera/mask/MaskModel;)V
    .locals 2

    .line 1
    const-string v0, "FilterProcess"

    .line 2
    .line 3
    const-string v1, "StickerAdjustFilter addGestureModel "

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x4

    .line 9
    invoke-virtual {p2, v0}, Lcom/momo/mcamera/mask/MaskModel;->setModelType(I)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mGestureTriggerModels:Ljava/util/concurrent/ConcurrentHashMap;

    .line 13
    .line 14
    invoke-virtual {v0, p1, p2}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->gestureDetector:Lcom/momo/mcamera/mask/gesture/CVDetector;

    .line 18
    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    iget-object p2, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->gestureDetectorListener:Lcom/momo/mcamera/mask/gesture/CVDetector$GestureDetectorListener;

    .line 22
    .line 23
    invoke-virtual {p1, p2}, Lcom/momo/mcamera/mask/gesture/CVDetector;->setGestureDetectorListener(Lcom/momo/mcamera/mask/gesture/CVDetector$GestureDetectorListener;)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->gestureDetector:Lcom/momo/mcamera/mask/gesture/CVDetector;

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/gesture/CVDetector;->startDetect()V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method public addHaniSticker(Lcom/momo/mcamera/mask/MaskModel;I)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mMultiStickerMaskFilter:Lcom/momo/mcamera/mask/MultiStickerMaskFilter;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;

    .line 6
    .line 7
    iget-object v1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mContext:Landroid/content/Context;

    .line 8
    .line 9
    invoke-direct {v0, v1}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;-><init>(Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mMultiStickerMaskFilter:Lcom/momo/mcamera/mask/MultiStickerMaskFilter;

    .line 13
    .line 14
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getPollGroupNum()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    invoke-virtual {v0, v1}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->setPollGroupNumber(I)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mMultiStickerMaskFilter:Lcom/momo/mcamera/mask/MultiStickerMaskFilter;

    .line 22
    .line 23
    invoke-direct {p0, v0}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->addTerminalMultiStickerFilter(Ll/jt2;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    if-nez p1, :cond_1

    .line 27
    .line 28
    goto :goto_2

    .line 29
    :cond_1
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getStickers()Ljava/util/List;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-eqz v1, :cond_3

    .line 42
    .line 43
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    check-cast v1, Lcom/momo/mcamera/mask/Sticker;

    .line 48
    .line 49
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/Sticker;->getObjectTriggerType()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    if-eqz v2, :cond_2

    .line 58
    .line 59
    const-string v2, ""

    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_2
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/Sticker;->getObjectTriggerType()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    :goto_1
    new-instance v3, Ljava/lang/StringBuilder;

    .line 67
    .line 68
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getModelType()I

    .line 72
    .line 73
    .line 74
    move-result v4

    .line 75
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    const-string v4, "_"

    .line 79
    .line 80
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    invoke-virtual {v1, v2}, Lcom/momo/mcamera/mask/Sticker;->setStickerType(Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {v1, p2}, Lcom/momo/mcamera/mask/Sticker;->setModelType(I)V

    .line 97
    .line 98
    .line 99
    const-wide v2, 0x174876e7ffL

    .line 100
    .line 101
    .line 102
    .line 103
    .line 104
    invoke-virtual {v1, v2, v3}, Lcom/momo/mcamera/mask/Sticker;->setDuration(J)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getFrameRate()I

    .line 108
    .line 109
    .line 110
    move-result v2

    .line 111
    invoke-virtual {v1, v2}, Lcom/momo/mcamera/mask/Sticker;->setFrameRate(I)V

    .line 112
    .line 113
    .line 114
    const/4 v2, 0x1

    .line 115
    iput-boolean v2, v1, Lcom/momo/mcamera/mask/Sticker;->isHaniSticker:Z

    .line 116
    .line 117
    invoke-virtual {p0, v1}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->addSticker(Lcom/momo/mcamera/mask/Sticker;)V

    .line 118
    .line 119
    .line 120
    goto :goto_0

    .line 121
    :cond_3
    :goto_2
    return-void
.end method

.method public declared-synchronized addMaskModel(Lcom/momo/mcamera/mask/MaskModel;)V
    .locals 16

    move-object/from16 v1, p0

    move-object/from16 v0, p1

    monitor-enter p0

    .line 1
    :try_start_0
    const-string v2, "FilterProcess"

    const-string v3, "StickerAdjustFilter addMaskModel "

    invoke-static {v2, v3}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v2, 0x0

    if-nez v0, :cond_0

    .line 2
    invoke-static {}, Ll/mpc0;->a()Ll/mpc0;

    move-result-object v0

    invoke-virtual {v0, v2}, Ll/mpc0;->c(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    goto/16 :goto_11

    .line 4
    :cond_0
    :try_start_1
    invoke-static {}, Ll/mpc0;->a()Ll/mpc0;

    move-result-object v3

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Ll/mpc0;->c(Z)V

    .line 5
    iput-boolean v2, v1, Lcom/momo/mcamera/mask/StickerAdjustFilter;->useBlendFilter:Z

    .line 6
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getModelType()I

    move-result v3

    const/4 v5, 0x3

    const/4 v6, 0x7

    const-wide v7, 0x174876e7ffL

    if-eqz v3, :cond_11

    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getModelType()I

    move-result v3

    if-ne v3, v6, :cond_1

    goto/16 :goto_6

    .line 7
    :cond_1
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getModelType()I

    move-result v3

    const/4 v6, 0x4

    if-ne v3, v6, :cond_9

    .line 8
    iget-object v3, v1, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mGestureTrackingFilter:Lcom/momo/mcamera/mask/StickerGestureTrackingFilter;

    if-eqz v3, :cond_2

    invoke-virtual {v3}, Lcom/momo/mcamera/mask/StickerGestureTrackingFilter;->isTrackingInit()Z

    move-result v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v3, :cond_2

    .line 9
    monitor-exit p0

    return-void

    .line 10
    :cond_2
    :try_start_2
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getStickers()Ljava/util/List;

    move-result-object v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-nez v3, :cond_3

    .line 11
    monitor-exit p0

    return-void

    .line 12
    :cond_3
    :try_start_3
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getModelType()I

    move-result v3

    invoke-virtual {v1, v3}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->clearMaskWithModelType(I)V

    .line 13
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getPollGroupNum()I

    move-result v3

    iput v3, v1, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mPollGroupNum:I

    .line 14
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getStickers()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    move v4, v2

    move v5, v4

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_7

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/momo/mcamera/mask/Sticker;

    .line 15
    invoke-virtual {v6}, Lcom/momo/mcamera/mask/Sticker;->getObjectTriggerType()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_4

    const-string v9, ""

    goto :goto_1

    .line 16
    :cond_4
    invoke-virtual {v6}, Lcom/momo/mcamera/mask/Sticker;->getObjectTriggerType()Ljava/lang/String;

    move-result-object v9

    .line 17
    :goto_1
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getModelType()I

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v11, "_"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v6, v9}, Lcom/momo/mcamera/mask/Sticker;->setStickerType(Ljava/lang/String;)V

    .line 18
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getTriggerRegion()[I

    move-result-object v9

    invoke-virtual {v6, v9}, Lcom/momo/mcamera/mask/Sticker;->setTriggerRegion([I)V

    .line 19
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getModelType()I

    move-result v9

    invoke-virtual {v6, v9}, Lcom/momo/mcamera/mask/Sticker;->setModelType(I)V

    .line 20
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getFrameRate()I

    move-result v9

    invoke-virtual {v6, v9}, Lcom/momo/mcamera/mask/Sticker;->setFrameRate(I)V

    .line 21
    const-string v9, "object_follower"

    invoke-virtual {v6}, Lcom/momo/mcamera/mask/Sticker;->getLayerType()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_5

    invoke-virtual {v6}, Lcom/momo/mcamera/mask/Sticker;->isDonotTrack()Z

    move-result v9

    if-nez v9, :cond_5

    .line 22
    invoke-virtual {v6, v7, v8}, Lcom/momo/mcamera/mask/Sticker;->setDuration(J)V

    goto :goto_2

    .line 23
    :cond_5
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getDuration()J

    move-result-wide v9

    invoke-virtual {v6, v9, v10}, Lcom/momo/mcamera/mask/Sticker;->setDuration(J)V

    .line 24
    :goto_2
    invoke-virtual {v6}, Lcom/momo/mcamera/mask/Sticker;->getSound()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_6

    add-int/lit8 v4, v4, 0x1

    .line 25
    :cond_6
    invoke-virtual {v1, v6}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->addSticker(Lcom/momo/mcamera/mask/Sticker;)V

    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 26
    :cond_7
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getSoundPath()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_8

    add-int/lit8 v4, v4, 0x1

    .line 27
    :cond_8
    iget-boolean v3, v1, Lcom/momo/mcamera/mask/StickerAdjustFilter;->enableSoundPool:Z

    if-eqz v3, :cond_2d

    .line 28
    invoke-direct {v1, v0, v4}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->tryLoadSound(Lcom/momo/mcamera/mask/MaskModel;I)V

    goto/16 :goto_f

    .line 29
    :cond_9
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getModelType()I

    move-result v3

    const/4 v6, 0x6

    if-ne v3, v6, :cond_10

    .line 30
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getPollGroupNum()I

    move-result v3

    iput v3, v1, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mPollGroupNum:I

    .line 31
    iget-object v3, v1, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mMultiStickerMaskFilter:Lcom/momo/mcamera/mask/MultiStickerMaskFilter;

    if-nez v3, :cond_a

    .line 32
    new-instance v3, Lcom/momo/mcamera/mask/MultiStickerGameMaskFilter;

    iget-object v6, v1, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mContext:Landroid/content/Context;

    invoke-direct {v3, v6}, Lcom/momo/mcamera/mask/MultiStickerGameMaskFilter;-><init>(Landroid/content/Context;)V

    iput-object v3, v1, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mMultiStickerMaskFilter:Lcom/momo/mcamera/mask/MultiStickerMaskFilter;

    .line 33
    invoke-direct {v1, v3}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->addTerminalMultiStickerFilter(Ll/jt2;)V

    .line 34
    :cond_a
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getStickers()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    const/4 v9, 0x5

    if-eqz v6, :cond_c

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/momo/mcamera/mask/Sticker;

    .line 35
    invoke-virtual {v6, v7, v8}, Lcom/momo/mcamera/mask/Sticker;->setDuration(J)V

    .line 36
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getFrameRate()I

    move-result v10

    invoke-virtual {v6, v10}, Lcom/momo/mcamera/mask/Sticker;->setFrameRate(I)V

    .line 37
    invoke-virtual {v6}, Lcom/momo/mcamera/mask/Sticker;->getObjectTriggerType()Ljava/lang/String;

    move-result-object v10

    .line 38
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getModelType()I

    move-result v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v12, "_"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v6, v11}, Lcom/momo/mcamera/mask/Sticker;->setStickerType(Ljava/lang/String;)V

    if-eqz v10, :cond_b

    .line 39
    const-string v11, "game_over"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_b

    .line 40
    invoke-virtual {v6, v9}, Lcom/momo/mcamera/mask/Sticker;->setType(I)V

    .line 41
    invoke-virtual {v6, v4}, Lcom/momo/mcamera/mask/Sticker;->setAlwaysShow(Z)V

    .line 42
    new-instance v9, Lcom/momo/mcamera/mask/bean/AbsolutePosition;

    invoke-direct {v9}, Lcom/momo/mcamera/mask/bean/AbsolutePosition;-><init>()V

    .line 43
    new-instance v10, Lcom/momo/mcamera/mask/bean/ObjectRegion;

    invoke-direct {v10}, Lcom/momo/mcamera/mask/bean/ObjectRegion;-><init>()V

    const/high16 v11, 0x3f000000    # 0.5f

    .line 44
    iput v11, v10, Lcom/momo/mcamera/mask/bean/ObjectRegion;->x:F

    const/high16 v11, 0x3e800000    # 0.25f

    .line 45
    iput v11, v10, Lcom/momo/mcamera/mask/bean/ObjectRegion;->y:F

    .line 46
    invoke-virtual {v6}, Lcom/momo/mcamera/mask/Sticker;->getImageWidth()I

    move-result v11

    int-to-float v11, v11

    iput v11, v10, Lcom/momo/mcamera/mask/bean/ObjectRegion;->w:F

    .line 47
    invoke-virtual {v6}, Lcom/momo/mcamera/mask/Sticker;->getImageHeight()I

    move-result v11

    int-to-float v11, v11

    iput v11, v10, Lcom/momo/mcamera/mask/bean/ObjectRegion;->h:F

    .line 48
    new-instance v11, Lcom/momo/mcamera/mask/bean/ViewPortProportion;

    invoke-direct {v11}, Lcom/momo/mcamera/mask/bean/ViewPortProportion;-><init>()V

    const/16 v12, 0x780

    .line 49
    iput v12, v11, Lcom/momo/mcamera/mask/bean/ViewPortProportion;->height:I

    const/16 v12, 0x438

    .line 50
    iput v12, v11, Lcom/momo/mcamera/mask/bean/ViewPortProportion;->width:I

    .line 51
    invoke-virtual {v9, v10}, Lcom/momo/mcamera/mask/bean/AbsolutePosition;->setCenter(Lcom/momo/mcamera/mask/bean/ObjectRegion;)V

    .line 52
    invoke-virtual {v9, v11}, Lcom/momo/mcamera/mask/bean/AbsolutePosition;->setViewport(Lcom/momo/mcamera/mask/bean/ViewPortProportion;)V

    .line 53
    invoke-virtual {v6, v9}, Lcom/momo/mcamera/mask/Sticker;->setAbsolutePos(Lcom/momo/mcamera/mask/bean/AbsolutePosition;)V

    goto :goto_4

    .line 54
    :cond_b
    iput-boolean v4, v6, Lcom/momo/mcamera/mask/Sticker;->isGameSticker:Z

    .line 55
    const-string v9, "face"

    invoke-virtual {v6, v9}, Lcom/momo/mcamera/mask/Sticker;->setLayerType(Ljava/lang/String;)V

    .line 56
    iget v9, v1, Lcom/momo/mcamera/mask/StickerAdjustFilter;->groupNumber:I

    invoke-virtual {v6, v9}, Lcom/momo/mcamera/mask/Sticker;->setGroupNumber(I)V

    .line 57
    invoke-virtual {v6, v4}, Lcom/momo/mcamera/mask/Sticker;->setAlwaysShow(Z)V

    .line 58
    :goto_4
    invoke-virtual {v1, v6}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->addSticker(Lcom/momo/mcamera/mask/Sticker;)V

    goto/16 :goto_3

    .line 59
    :cond_c
    iget v3, v1, Lcom/momo/mcamera/mask/StickerAdjustFilter;->groupNumber:I

    add-int/2addr v3, v4

    iput v3, v1, Lcom/momo/mcamera/mask/StickerAdjustFilter;->groupNumber:I

    .line 60
    iget-boolean v3, v1, Lcom/momo/mcamera/mask/StickerAdjustFilter;->enableSoundPool:Z

    if-eqz v3, :cond_2d

    .line 61
    iget-object v3, v1, Lcom/momo/mcamera/mask/StickerAdjustFilter;->soundPool:Landroid/media/SoundPool;

    if-nez v3, :cond_d

    .line 62
    new-instance v3, Landroid/media/SoundPool;

    invoke-direct {v3, v9, v5, v9}, Landroid/media/SoundPool;-><init>(III)V

    iput-object v3, v1, Lcom/momo/mcamera/mask/StickerAdjustFilter;->soundPool:Landroid/media/SoundPool;

    .line 63
    :cond_d
    iget-object v3, v1, Lcom/momo/mcamera/mask/StickerAdjustFilter;->soundPool:Landroid/media/SoundPool;

    if-eqz v3, :cond_2d

    .line 64
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getSound()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    const/16 v4, 0x3e7

    if-nez v3, :cond_e

    .line 65
    iget-object v3, v1, Lcom/momo/mcamera/mask/StickerAdjustFilter;->soundPool:Landroid/media/SoundPool;

    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getSoundPath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5, v4}, Landroid/media/SoundPool;->load(Ljava/lang/String;I)I

    move-result v3

    invoke-virtual {v0, v3}, Lcom/momo/mcamera/mask/MaskModel;->setSoundId(I)V

    .line 66
    iget-object v5, v1, Lcom/momo/mcamera/mask/StickerAdjustFilter;->soundPool:Landroid/media/SoundPool;

    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getSoundId()I

    move-result v6

    const/4 v10, 0x1

    const/high16 v11, 0x3f800000    # 1.0f

    const/high16 v7, 0x3f800000    # 1.0f

    const/high16 v8, 0x3f800000    # 1.0f

    const/4 v9, 0x1

    invoke-virtual/range {v5 .. v11}, Landroid/media/SoundPool;->play(IFFIIF)I

    .line 67
    iget-object v3, v1, Lcom/momo/mcamera/mask/StickerAdjustFilter;->soundIds:Ljava/util/ArrayList;

    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getSoundId()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 68
    :cond_e
    iget-object v3, v1, Lcom/momo/mcamera/mask/StickerAdjustFilter;->soundPool:Landroid/media/SoundPool;

    new-instance v5, Lcom/momo/mcamera/mask/StickerAdjustFilter$4;

    invoke-direct {v5, v1}, Lcom/momo/mcamera/mask/StickerAdjustFilter$4;-><init>(Lcom/momo/mcamera/mask/StickerAdjustFilter;)V

    invoke-virtual {v3, v5}, Landroid/media/SoundPool;->setOnLoadCompleteListener(Landroid/media/SoundPool$OnLoadCompleteListener;)V

    .line 69
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getStickers()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_f
    :goto_5
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2d

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/momo/mcamera/mask/Sticker;

    .line 70
    invoke-virtual {v5}, Lcom/momo/mcamera/mask/Sticker;->getSound()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_f

    .line 71
    iget-object v6, v1, Lcom/momo/mcamera/mask/StickerAdjustFilter;->soundPool:Landroid/media/SoundPool;

    invoke-virtual {v5}, Lcom/momo/mcamera/mask/Sticker;->getSoundPath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7, v4}, Landroid/media/SoundPool;->load(Ljava/lang/String;I)I

    move-result v6

    invoke-virtual {v5, v6}, Lcom/momo/mcamera/mask/Sticker;->setSoundId(I)V

    .line 72
    iget-object v6, v1, Lcom/momo/mcamera/mask/StickerAdjustFilter;->soundIds:Ljava/util/ArrayList;

    invoke-virtual {v5}, Lcom/momo/mcamera/mask/Sticker;->getSoundId()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v6, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_5

    .line 73
    :cond_10
    invoke-direct/range {p0 .. p1}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->addCommonModel(Lcom/momo/mcamera/mask/MaskModel;)V

    goto/16 :goto_f

    .line 74
    :cond_11
    :goto_6
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getModelType()I

    move-result v3

    if-nez v3, :cond_12

    .line 75
    invoke-virtual {v1, v2}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->clearMaskWithModelType(I)V

    .line 76
    :cond_12
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getAdditionalInfo()Lcom/momo/mcamera/mask/AdditionalInfo;

    move-result-object v3

    if-eqz v3, :cond_13

    .line 77
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getAdditionalInfo()Lcom/momo/mcamera/mask/AdditionalInfo;

    move-result-object v3

    invoke-virtual {v3}, Lcom/momo/mcamera/mask/AdditionalInfo;->isBodyDetectEnable()Z

    move-result v3

    invoke-static {v3}, Lcom/core/glcore/util/BodyLandHelper;->setUseBodyLand(Z)V

    .line 78
    :cond_13
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getPollGroupNum()I

    move-result v3

    iput v3, v1, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mPollGroupNum:I

    .line 79
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getModelType()I

    move-result v3

    if-nez v3, :cond_14

    .line 80
    iput-boolean v2, v1, Lcom/momo/mcamera/mask/StickerAdjustFilter;->hasExpressionModel:Z

    .line 81
    iput-boolean v2, v1, Lcom/momo/mcamera/mask/StickerAdjustFilter;->multiSwitchEnable:Z

    goto :goto_7

    .line 82
    :cond_14
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getModelType()I

    move-result v3

    if-ne v3, v6, :cond_16

    .line 83
    iget-boolean v3, v1, Lcom/momo/mcamera/mask/StickerAdjustFilter;->hasExpressionModel:Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    if-ne v3, v4, :cond_15

    .line 84
    monitor-exit p0

    return-void

    .line 85
    :cond_15
    :try_start_4
    iput-boolean v4, v1, Lcom/momo/mcamera/mask/StickerAdjustFilter;->hasExpressionModel:Z

    .line 86
    :cond_16
    :goto_7
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getAdditionalInfo()Lcom/momo/mcamera/mask/AdditionalInfo;

    move-result-object v3

    if-eqz v3, :cond_17

    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getAdditionalInfo()Lcom/momo/mcamera/mask/AdditionalInfo;

    move-result-object v3

    invoke-virtual {v3}, Lcom/momo/mcamera/mask/AdditionalInfo;->isMultiFaceSwitchEnable()Z

    move-result v3

    if-eqz v3, :cond_17

    .line 87
    iput-boolean v4, v1, Lcom/momo/mcamera/mask/StickerAdjustFilter;->multiSwitchEnable:Z

    .line 88
    invoke-static {}, Lcom/core/glcore/datadot/DataDotUtils;->getInstance()Lcom/core/glcore/datadot/DataDotUtils;

    move-result-object v3

    invoke-virtual {v3}, Lcom/core/glcore/datadot/DataDotUtils;->getRecoderDataDotInfo()Lcom/core/glcore/datadot/RecoderDataDotInfo;

    move-result-object v3

    iget-boolean v6, v1, Lcom/momo/mcamera/mask/StickerAdjustFilter;->multiSwitchEnable:Z

    invoke-virtual {v3, v6}, Lcom/core/glcore/datadot/RecoderDataDotInfo;->setCameraEnableMultiFaces(Z)V

    .line 89
    :cond_17
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getAdditionalInfo()Lcom/momo/mcamera/mask/AdditionalInfo;

    move-result-object v3

    if-eqz v3, :cond_18

    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getAdditionalInfo()Lcom/momo/mcamera/mask/AdditionalInfo;

    move-result-object v3

    invoke-virtual {v3}, Lcom/momo/mcamera/mask/AdditionalInfo;->isAnimojiDetectEnable()Z

    move-result v3

    if-eqz v3, :cond_18

    .line 90
    invoke-static {v4}, Lcom/core/glcore/util/FacerigHelper;->setUseAnimojiFaceRig(Z)V

    goto :goto_8

    .line 91
    :cond_18
    invoke-static {v2}, Lcom/core/glcore/util/FacerigHelper;->setUseAnimojiFaceRig(Z)V

    .line 92
    :goto_8
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getAdditionalInfo()Lcom/momo/mcamera/mask/AdditionalInfo;

    move-result-object v3

    if-eqz v3, :cond_1c

    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getAdditionalInfo()Lcom/momo/mcamera/mask/AdditionalInfo;

    move-result-object v3

    invoke-virtual {v3}, Lcom/momo/mcamera/mask/AdditionalInfo;->isComic()Z

    move-result v3

    if-eqz v3, :cond_1c

    .line 93
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getStickers()Ljava/util/List;

    move-result-object v3

    .line 94
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    move v9, v2

    .line 95
    :goto_9
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v10

    if-ge v9, v10, :cond_1a

    .line 96
    invoke-interface {v3, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/momo/mcamera/mask/Sticker;

    invoke-virtual {v10}, Lcom/momo/mcamera/mask/Sticker;->getStickerType()Ljava/lang/String;

    move-result-object v10

    const-string v11, "FACE_MASK_TYPE"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_19

    .line 97
    invoke-interface {v3, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    invoke-interface {v6, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 98
    invoke-interface {v3, v9}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    :cond_19
    add-int/lit8 v9, v9, 0x1

    goto :goto_9

    .line 99
    :cond_1a
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_a
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_1b

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/momo/mcamera/mask/Sticker;

    .line 100
    invoke-interface {v3, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_a

    .line 101
    :cond_1b
    invoke-virtual {v0, v3}, Lcom/momo/mcamera/mask/MaskModel;->setStickers(Ljava/util/List;)V

    .line 102
    :cond_1c
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getStickers()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    move v6, v2

    move v9, v6

    move v10, v9

    :goto_b
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_28

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/momo/mcamera/mask/Sticker;

    .line 103
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getAdditionalInfo()Lcom/momo/mcamera/mask/AdditionalInfo;

    move-result-object v12

    if-eqz v12, :cond_1d

    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getAdditionalInfo()Lcom/momo/mcamera/mask/AdditionalInfo;

    move-result-object v12

    invoke-virtual {v12}, Lcom/momo/mcamera/mask/AdditionalInfo;->isComic()Z

    move-result v12

    if-eqz v12, :cond_1d

    .line 104
    invoke-virtual {v11, v4}, Lcom/momo/mcamera/mask/Sticker;->setComic(Z)V

    .line 105
    :cond_1d
    invoke-virtual {v11}, Lcom/momo/mcamera/mask/Sticker;->getStickerType()Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v12

    if-nez v12, :cond_1e

    invoke-virtual {v11}, Lcom/momo/mcamera/mask/Sticker;->getStickerType()Ljava/lang/String;

    move-result-object v12

    const-string v13, "STICKER_TYPE_VOICE"

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_21

    invoke-virtual {v11}, Lcom/momo/mcamera/mask/Sticker;->getStickerType()Ljava/lang/String;

    move-result-object v12

    const-string v13, "FACE_MASK_TYPE"

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_21

    invoke-virtual {v11}, Lcom/momo/mcamera/mask/Sticker;->getStickerType()Ljava/lang/String;

    move-result-object v12

    const-string v13, "FACE_LOOK_UP_TYPE"

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_21

    .line 106
    :cond_1e
    iget-object v12, v1, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mMultiStickerMaskFilter:Lcom/momo/mcamera/mask/MultiStickerMaskFilter;

    if-eqz v12, :cond_1f

    .line 107
    invoke-virtual {v12}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->getStickerItemListSize()I

    move-result v12

    add-int/2addr v12, v10

    goto :goto_c

    :cond_1f
    move v12, v10

    .line 108
    :goto_c
    iget-object v13, v1, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mStickerFilterMap:Ljava/util/concurrent/ConcurrentHashMap;

    if-eqz v13, :cond_20

    .line 109
    invoke-virtual {v13}, Ljava/util/concurrent/ConcurrentHashMap;->size()I

    move-result v13

    add-int/2addr v12, v13

    .line 110
    :cond_20
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getModelType()I

    move-result v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v14, "_"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Lcom/momo/mcamera/mask/Sticker;->setStickerType(Ljava/lang/String;)V

    .line 111
    invoke-virtual {v11, v7, v8}, Lcom/momo/mcamera/mask/Sticker;->setDuration(J)V

    .line 112
    :cond_21
    invoke-virtual {v11}, Lcom/momo/mcamera/mask/Sticker;->getStickerType()Ljava/lang/String;

    move-result-object v12

    const-string v13, "FACE_LOOK_UP_TYPE"

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_22

    .line 113
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getLookUpFilters()Ljava/util/List;

    move-result-object v12

    invoke-interface {v12}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :goto_d
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_22

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/momo/mcamera/mask/LookUpModel;

    .line 114
    iget-object v14, v1, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mContext:Landroid/content/Context;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    .line 115
    invoke-virtual {v11}, Lcom/momo/mcamera/mask/Sticker;->getImageFolderPath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v15, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, "/"

    invoke-virtual {v15, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Lcom/momo/mcamera/mask/LookUpModel;->getFolder()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v15, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 116
    invoke-static {v14, v7}, Lcom/momo/mcamera/filtermanager/MMPresetFilterStore;->getPresetFilterByFolder(Landroid/content/Context;Ljava/lang/String;)Lcom/momo/mcamera/filtermanager/MMPresetFilter;

    move-result-object v7

    invoke-virtual {v13, v7}, Lcom/momo/mcamera/mask/LookUpModel;->setPresetFilter(Lcom/momo/mcamera/filtermanager/MMPresetFilter;)V

    .line 117
    const-string v7, "FACE_LOOK_UP_TYPE"

    invoke-virtual {v11, v7}, Lcom/momo/mcamera/mask/Sticker;->setStickerType(Ljava/lang/String;)V

    .line 118
    invoke-virtual {v13}, Lcom/momo/mcamera/mask/LookUpModel;->getTriggerType()I

    move-result v7

    invoke-virtual {v11, v7}, Lcom/momo/mcamera/mask/Sticker;->setTriggerType(I)V

    .line 119
    invoke-virtual {v11, v13}, Lcom/momo/mcamera/mask/Sticker;->setLookUpModel(Lcom/momo/mcamera/mask/LookUpModel;)V

    .line 120
    invoke-virtual {v13}, Lcom/momo/mcamera/mask/LookUpModel;->getHiddenTriggerType()I

    move-result v7

    invoke-virtual {v11, v7}, Lcom/momo/mcamera/mask/Sticker;->setHiddenTriggerType(I)V

    const-wide v7, 0x174876e7ffL

    goto :goto_d

    .line 121
    :cond_22
    invoke-virtual {v11}, Lcom/momo/mcamera/mask/Sticker;->getLayerType()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_23

    invoke-virtual {v11}, Lcom/momo/mcamera/mask/Sticker;->getLayerType()Ljava/lang/String;

    move-result-object v7

    const-string v8, "3d"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_23

    .line 122
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getXengineEsPath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v11, v7}, Lcom/momo/mcamera/mask/Sticker;->setXengineEsPath(Ljava/lang/String;)V

    .line 123
    iput-boolean v4, v1, Lcom/momo/mcamera/mask/StickerAdjustFilter;->useBlendFilter:Z

    .line 124
    :cond_23
    invoke-virtual {v11}, Lcom/momo/mcamera/mask/Sticker;->isClearsBodyArea()Z

    move-result v7

    if-eqz v7, :cond_24

    .line 125
    iput-boolean v4, v1, Lcom/momo/mcamera/mask/StickerAdjustFilter;->useBlendFilter:Z

    .line 126
    iput-boolean v2, v1, Lcom/momo/mcamera/mask/StickerAdjustFilter;->enableSelfRender:Z

    add-int/lit8 v6, v6, 0x1

    .line 127
    :cond_24
    invoke-direct {v1, v11}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->isBlendSticker(Lcom/momo/mcamera/mask/Sticker;)Z

    move-result v7

    if-eqz v7, :cond_25

    .line 128
    iput-boolean v4, v1, Lcom/momo/mcamera/mask/StickerAdjustFilter;->useBlendFilter:Z

    .line 129
    :cond_25
    invoke-virtual {v11}, Lcom/momo/mcamera/mask/Sticker;->getAdditionalInfo()Lcom/momo/mcamera/mask/bean/StickerAdditionalInfo;

    move-result-object v7

    if-eqz v7, :cond_26

    .line 130
    invoke-virtual {v11}, Lcom/momo/mcamera/mask/Sticker;->getAdditionalInfo()Lcom/momo/mcamera/mask/bean/StickerAdditionalInfo;

    move-result-object v7

    invoke-virtual {v7}, Lcom/momo/mcamera/mask/bean/StickerAdditionalInfo;->getFacePositions()Ljava/util/List;

    move-result-object v7

    if-eqz v7, :cond_26

    .line 131
    iput-boolean v4, v11, Lcom/momo/mcamera/mask/Sticker;->isCutFaceSticker:Z

    .line 132
    :cond_26
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getModelType()I

    move-result v7

    invoke-virtual {v11, v7}, Lcom/momo/mcamera/mask/Sticker;->setModelType(I)V

    .line 133
    invoke-virtual {v11}, Lcom/momo/mcamera/mask/Sticker;->getSound()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_27

    add-int/lit8 v9, v9, 0x1

    .line 134
    :cond_27
    invoke-virtual {v1, v11}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->addSticker(Lcom/momo/mcamera/mask/Sticker;)V

    add-int/lit8 v10, v10, 0x1

    const-wide v7, 0x174876e7ffL

    goto/16 :goto_b

    .line 135
    :cond_28
    iget-object v3, v1, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mFaceMaskFilter:Lcom/momo/mcamera/mask/FaceMaskFilter;

    if-eqz v3, :cond_29

    .line 136
    iget-object v4, v1, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mSwapFacialMaskSticker:Ljava/util/List;

    invoke-virtual {v3, v4}, Lcom/momo/mcamera/mask/FaceMaskFilter;->addStickerList(Ljava/util/List;)V

    :cond_29
    if-lez v6, :cond_2a

    .line 137
    invoke-static {v6}, Lcom/core/glcore/util/SegmentHelper;->setSegmentCount(I)V

    .line 138
    :cond_2a
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getSoundPath()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_2b

    add-int/lit8 v9, v9, 0x1

    .line 139
    :cond_2b
    iget-boolean v3, v1, Lcom/momo/mcamera/mask/StickerAdjustFilter;->enableSoundPool:Z

    if-eqz v3, :cond_2d

    .line 140
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getSound()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_2c

    .line 141
    iget-object v3, v1, Lcom/momo/mcamera/mask/StickerAdjustFilter;->soundPlayer:Landroid/media/MediaPlayer;

    if-nez v3, :cond_2c

    .line 142
    new-instance v3, Landroid/media/MediaPlayer;

    invoke-direct {v3}, Landroid/media/MediaPlayer;-><init>()V

    iput-object v3, v1, Lcom/momo/mcamera/mask/StickerAdjustFilter;->soundPlayer:Landroid/media/MediaPlayer;

    .line 143
    new-instance v4, Lcom/momo/mcamera/mask/StickerAdjustFilter$2;

    invoke-direct {v4, v1}, Lcom/momo/mcamera/mask/StickerAdjustFilter$2;-><init>(Lcom/momo/mcamera/mask/StickerAdjustFilter;)V

    invoke-virtual {v3, v4}, Landroid/media/MediaPlayer;->setOnErrorListener(Landroid/media/MediaPlayer$OnErrorListener;)V

    .line 144
    iget-object v3, v1, Lcom/momo/mcamera/mask/StickerAdjustFilter;->soundPlayer:Landroid/media/MediaPlayer;

    new-instance v4, Lcom/momo/mcamera/mask/StickerAdjustFilter$3;

    invoke-direct {v4, v1}, Lcom/momo/mcamera/mask/StickerAdjustFilter$3;-><init>(Lcom/momo/mcamera/mask/StickerAdjustFilter;)V

    invoke-virtual {v3, v4}, Landroid/media/MediaPlayer;->setOnPreparedListener(Landroid/media/MediaPlayer$OnPreparedListener;)V

    .line 145
    iget-object v3, v1, Lcom/momo/mcamera/mask/StickerAdjustFilter;->soundPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v3, v5}, Landroid/media/MediaPlayer;->setAudioStreamType(I)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 146
    :try_start_5
    iget-object v3, v1, Lcom/momo/mcamera/mask/StickerAdjustFilter;->soundPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getSoundPath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/media/MediaPlayer;->setDataSource(Ljava/lang/String;)V

    .line 147
    iget-object v3, v1, Lcom/momo/mcamera/mask/StickerAdjustFilter;->soundPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v3}, Landroid/media/MediaPlayer;->prepareAsync()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_e

    .line 148
    :catch_0
    :try_start_6
    const-string v3, "FilterProcess"

    const-string v4, "MediaPlayerDataSourceHelper.setMediaPlayerDataSource Error"

    invoke-static {v3, v4}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 149
    iget-object v3, v1, Lcom/momo/mcamera/mask/StickerAdjustFilter;->soundPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v3}, Landroid/media/MediaPlayer;->release()V

    const/4 v3, 0x0

    .line 150
    iput-object v3, v1, Lcom/momo/mcamera/mask/StickerAdjustFilter;->soundPlayer:Landroid/media/MediaPlayer;

    .line 151
    :cond_2c
    :goto_e
    invoke-direct {v1, v0, v9}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->tryLoadSound(Lcom/momo/mcamera/mask/MaskModel;I)V

    .line 152
    :cond_2d
    :goto_f
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getEffectList()Ljava/util/List;

    move-result-object v3

    if-eqz v3, :cond_2e

    .line 153
    invoke-direct/range {p0 .. p1}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->addEffectProcessFilter(Lcom/momo/mcamera/mask/MaskModel;)V

    .line 154
    :cond_2e
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getDistortionList()Ljava/util/List;

    move-result-object v3

    if-eqz v3, :cond_30

    .line 155
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getDistortionList()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_2f
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_30

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/momo/mcamera/mask/Mask;

    .line 156
    invoke-virtual {v4}, Lcom/momo/mcamera/mask/Mask;->getHidingObjectTriggerType()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_2f

    .line 157
    iput-object v4, v1, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mDistorationMask:Lcom/momo/mcamera/mask/Mask;

    .line 158
    invoke-virtual {v4}, Lcom/momo/mcamera/mask/Mask;->getStrength()F

    move-result v3

    iput v3, v1, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mFaceThinValue:F

    .line 159
    iget-object v3, v1, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mDistorationMask:Lcom/momo/mcamera/mask/Mask;

    invoke-virtual {v3}, Lcom/momo/mcamera/mask/Mask;->getStrengthB()F

    move-result v3

    iput v3, v1, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mBigEyeValue:F

    .line 160
    :cond_30
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getBeautyFace()Lcom/momo/mcamera/mask/BeautyFace;

    move-result-object v3

    if-eqz v3, :cond_31

    iget-object v3, v1, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mDistorationMask:Lcom/momo/mcamera/mask/Mask;

    if-eqz v3, :cond_31

    .line 161
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getBeautyFace()Lcom/momo/mcamera/mask/BeautyFace;

    move-result-object v3

    iput-object v3, v1, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mBeautyFace:Lcom/momo/mcamera/mask/BeautyFace;

    .line 162
    :cond_31
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getAdditionalInfo()Lcom/momo/mcamera/mask/AdditionalInfo;

    move-result-object v3

    if-eqz v3, :cond_34

    .line 163
    iget-object v3, v1, Lcom/momo/mcamera/mask/StickerAdjustFilter;->face3DMaskFilters:Ljava/util/List;

    if-eqz v3, :cond_33

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-lez v3, :cond_33

    .line 164
    iget-object v3, v1, Lcom/momo/mcamera/mask/StickerAdjustFilter;->face3DMaskFilters:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_32
    :goto_10
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_33

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/momo/mcamera/mask/Face3DMaskFilter;

    .line 165
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getStickers()Ljava/util/List;

    move-result-object v5

    if-eqz v5, :cond_32

    invoke-virtual {v4}, Lcom/momo/mcamera/mask/Face3DMaskFilter;->getSticker()Lcom/momo/mcamera/mask/Sticker;

    move-result-object v5

    if-eqz v5, :cond_32

    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getStickers()Ljava/util/List;

    move-result-object v5

    invoke-virtual {v4}, Lcom/momo/mcamera/mask/Face3DMaskFilter;->getSticker()Lcom/momo/mcamera/mask/Sticker;

    move-result-object v6

    invoke-interface {v5, v6}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_32

    .line 166
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getAdditionalInfo()Lcom/momo/mcamera/mask/AdditionalInfo;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/momo/mcamera/mask/Face3DMaskFilter;->setAdditionalInfo(Lcom/momo/mcamera/mask/AdditionalInfo;)V

    goto :goto_10

    .line 167
    :cond_33
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getAdditionalInfo()Lcom/momo/mcamera/mask/AdditionalInfo;

    move-result-object v0

    invoke-virtual {v0}, Lcom/momo/mcamera/mask/AdditionalInfo;->isObjectDetectEnable()Z

    move-result v0

    if-eqz v0, :cond_34

    .line 168
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->startGestureDetect()V

    .line 169
    :cond_34
    iput-boolean v2, v1, Lcom/momo/mcamera/mask/StickerAdjustFilter;->useBlendFilter:Z
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 170
    monitor-exit p0

    return-void

    :goto_11
    :try_start_7
    monitor-exit p0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    throw v0
.end method

.method public declared-synchronized addSticker(Lcom/momo/mcamera/mask/Sticker;)V
    .locals 12

    monitor-enter p0

    .line 1
    :try_start_0
    invoke-virtual {p0}, Ll/gfj;->getLockObject()Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    const/4 v0, 0x0

    .line 2
    :try_start_1
    iput v0, p1, Lcom/momo/mcamera/mask/Sticker;->curIndex:I

    .line 3
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->isClearsBodyArea()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    .line 4
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->useBlendFilter:Z

    goto :goto_0

    :catchall_0
    move-exception v0

    move-object p1, v0

    goto/16 :goto_8

    .line 5
    :cond_0
    :goto_0
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getTriggerType()I

    move-result v0

    if-lez v0, :cond_1

    .line 6
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->filterTriggerManager:Lcom/momo/mcamera/mask/FilterTriggerManager;

    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getTriggerType()I

    move-result v2

    invoke-virtual {v0, v2}, Lcom/momo/mcamera/mask/FilterTriggerManager;->setTriggerType(I)V

    .line 7
    :cond_1
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getHiddenTriggerType()I

    move-result v0

    if-lez v0, :cond_2

    .line 8
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->filterTriggerManager:Lcom/momo/mcamera/mask/FilterTriggerManager;

    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getHiddenTriggerType()I

    move-result v2

    invoke-virtual {v0, v2}, Lcom/momo/mcamera/mask/FilterTriggerManager;->setHiddenTriggerType(I)V

    .line 9
    :cond_2
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mStickerFilterMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getStickerType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/momo/mcamera/mask/StickerBlendFilter;

    const-wide/16 v2, 0x0

    const-wide/32 v4, 0x1c9c380

    if-nez v0, :cond_1a

    .line 10
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getStickerType()Ljava/lang/String;

    move-result-object v0

    const-string v6, "STICKER_TYPE_VOICE"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 11
    new-instance v0, Lcom/momo/mcamera/mask/SoundInputFilter;

    invoke-direct {v0}, Lcom/momo/mcamera/mask/SoundInputFilter;-><init>()V

    .line 12
    iput-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mSoundInput:Lcom/momo/mcamera/mask/SoundInputFilter;

    .line 13
    const-string v6, "FilterProcess"

    const-string v7, " Sticker Type STICKER_TYPE_VOICE SoundInputFilter !!!"

    invoke-static {v6, v7}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_5

    .line 14
    :cond_3
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getLayerType()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_4

    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getLayerType()Ljava/lang/String;

    move-result-object v0

    const-string v6, "object_follower"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    iget-boolean v0, p1, Lcom/momo/mcamera/mask/Sticker;->isHaniSticker:Z

    if-nez v0, :cond_4

    .line 15
    new-instance v0, Lcom/momo/mcamera/mask/StickerGestureMaskFilter;

    iget-object v6, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mContext:Landroid/content/Context;

    invoke-direct {v0, v6, p1}, Lcom/momo/mcamera/mask/StickerGestureMaskFilter;-><init>(Landroid/content/Context;Lcom/momo/mcamera/mask/Sticker;)V

    .line 16
    const-string v6, "FilterProcess"

    const-string v7, " Sticker Type LAYER_TYPE_GESTURE StickerGestureMaskFilter !!!"

    invoke-static {v6, v7}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_5

    .line 17
    :cond_4
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getStickerType()Ljava/lang/String;

    move-result-object v0

    const-string v6, "FACE_MASK_TYPE"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 18
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mSwapFacialMaskSticker:Ljava/util/List;

    if-nez v0, :cond_5

    .line 19
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mSwapFacialMaskSticker:Ljava/util/List;

    .line 20
    :cond_5
    new-instance v0, Lcom/momo/mcamera/mask/FaceMaskFilter;

    invoke-direct {v0, p1}, Lcom/momo/mcamera/mask/FaceMaskFilter;-><init>(Lcom/momo/mcamera/mask/Sticker;)V

    iput-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mFaceMaskFilter:Lcom/momo/mcamera/mask/FaceMaskFilter;

    .line 21
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getMask()Lcom/momo/mcamera/mask/Mask;

    move-result-object v6

    iget-boolean v6, v6, Lcom/momo/mcamera/mask/Mask;->swapFacialMask:Z

    if-eqz v6, :cond_6

    .line 22
    iget-object v6, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mSwapFacialMaskSticker:Ljava/util/List;

    invoke-interface {v6, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 23
    :cond_6
    const-string v6, "FilterProcess"

    const-string v7, " Sticker Type FACE_MASK_TYPE FaceMaskFilter !!!"

    invoke-static {v6, v7}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_5

    .line 24
    :cond_7
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getLayerType()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_9

    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getLayerType()Ljava/lang/String;

    move-result-object v0

    const-string v6, "3d"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    invoke-static {}, Ll/cyx;->a()Z

    move-result v0

    if-eqz v0, :cond_9

    .line 25
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->face3DMaskFilters:Ljava/util/List;

    if-nez v0, :cond_8

    .line 26
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->face3DMaskFilters:Ljava/util/List;

    .line 27
    :cond_8
    new-instance v0, Lcom/momo/mcamera/mask/Face3DMaskFilter;

    iget-boolean v6, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->isCameraFront:Z

    iget-object v7, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mContext:Landroid/content/Context;

    invoke-direct {v0, p1, v6, v7}, Lcom/momo/mcamera/mask/Face3DMaskFilter;-><init>(Lcom/momo/mcamera/mask/Sticker;ZLandroid/content/Context;)V

    .line 28
    iget-object v6, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->face3DMaskFilters:Ljava/util/List;

    invoke-interface {v6, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 29
    const-string v6, "FilterProcess"

    const-string v7, " Sticker Type FACE_3D_MASK_TYPE Face3DMaskFilter !!!"

    invoke-static {v6, v7}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_5

    .line 30
    :cond_9
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getStickerType()Ljava/lang/String;

    move-result-object v0

    const-string v6, "FACE_LOOK_UP_TYPE"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 31
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getLookUpModel()Lcom/momo/mcamera/mask/LookUpModel;

    move-result-object v0

    if-eqz v0, :cond_a

    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getLookUpModel()Lcom/momo/mcamera/mask/LookUpModel;

    move-result-object v0

    invoke-virtual {v0}, Lcom/momo/mcamera/mask/LookUpModel;->getPresetFilter()Lcom/momo/mcamera/filtermanager/MMPresetFilter;

    move-result-object v0

    if-eqz v0, :cond_a

    .line 32
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getLookUpModel()Lcom/momo/mcamera/mask/LookUpModel;

    move-result-object v0

    invoke-virtual {v0}, Lcom/momo/mcamera/mask/LookUpModel;->getPresetFilter()Lcom/momo/mcamera/filtermanager/MMPresetFilter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/momo/mcamera/filtermanager/MMFilter;->getFilterGroup()Ll/hqf0;

    move-result-object v0

    .line 33
    iput-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mLookupFilter:Ll/hqf0;

    goto :goto_1

    .line 34
    :cond_a
    new-instance v0, Lcom/momo/mcamera/mask/NormalFilter;

    invoke-direct {v0}, Lcom/momo/mcamera/mask/NormalFilter;-><init>()V

    .line 35
    :goto_1
    const-string v6, "FilterProcess"

    const-string v7, " Sticker Type FACE_LOOK_UP_TYPE !!!"

    invoke-static {v6, v7}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_5

    .line 36
    :cond_b
    const-string v0, "video_file"

    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getLayerType()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c

    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getVideoFileConfig()Lcom/momo/mcamera/mask/Sticker$VideoFileConfig;

    move-result-object v0

    if-eqz v0, :cond_c

    .line 37
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getVideoFileConfig()Lcom/momo/mcamera/mask/Sticker$VideoFileConfig;

    move-result-object v9

    .line 38
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getImageFolderPath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v6, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getImagePreName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 39
    new-instance v6, Lcom/momo/mcamera/mask/videomix/VideoMergeGroupFilter;

    iget-object v7, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mContext:Landroid/content/Context;

    .line 40
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getDuration()J

    move-result-wide v10

    invoke-direct/range {v6 .. v11}, Lcom/momo/mcamera/mask/videomix/VideoMergeGroupFilter;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/momo/mcamera/mask/Sticker$VideoFileConfig;J)V

    .line 41
    new-instance v0, Lcom/momo/mcamera/mask/StickerAdjustFilter$7;

    invoke-direct {v0, p0, p1}, Lcom/momo/mcamera/mask/StickerAdjustFilter$7;-><init>(Lcom/momo/mcamera/mask/StickerAdjustFilter;Lcom/momo/mcamera/mask/Sticker;)V

    invoke-virtual {v6, v0}, Lcom/momo/mcamera/mask/videomix/VideoMergeGroupFilter;->setOnVideoTimeoutListener(Lcom/momo/mcamera/mask/videomix/IVideoTimeoutListener;)V

    .line 42
    iput-object v6, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->videoMergeGroupFilter:Lcom/momo/mcamera/mask/videomix/VideoMergeGroupFilter;

    .line 43
    const-string v0, "FilterProcess"

    const-string v7, " Sticker Type LAYER_TYPE_VIDEO_FILE !!!"

    invoke-static {v0, v7}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    move-object v0, v6

    goto/16 :goto_5

    .line 44
    :cond_c
    iget-boolean v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->useBlendFilter:Z

    if-eqz v0, :cond_d

    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getStickerType()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_e

    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getStickerType()Ljava/lang/String;

    move-result-object v0

    const-string v6, "weex"

    invoke-virtual {v0, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_e

    :cond_d
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->isComic()Z

    move-result v0

    if-eqz v0, :cond_10

    .line 45
    :cond_e
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getEtcTextureBatch()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_f

    .line 46
    new-instance v0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;

    iget-object v6, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mContext:Landroid/content/Context;

    invoke-direct {v0, v6, p1}, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;-><init>(Landroid/content/Context;Lcom/momo/mcamera/mask/Sticker;)V

    goto :goto_2

    .line 47
    :cond_f
    new-instance v0, Lcom/momo/mcamera/mask/StickerMaskFilter;

    iget-object v6, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getImageProvider()Lcom/momo/mcamera/mask/delegate/ImageDelegateProvider;

    move-result-object v7

    invoke-direct {v0, v6, p1, v7}, Lcom/momo/mcamera/mask/StickerMaskFilter;-><init>(Landroid/content/Context;Lcom/momo/mcamera/mask/Sticker;Lcom/momo/mcamera/mask/delegate/ImageDelegateProvider;)V

    .line 48
    :goto_2
    const-string v6, "FilterProcess"

    const-string v7, " Sticker Type StickerMaskFilter !!!"

    invoke-static {v6, v7}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_5

    .line 49
    :cond_10
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mMultiStickerMaskFilter:Lcom/momo/mcamera/mask/MultiStickerMaskFilter;

    if-nez v0, :cond_12

    .line 50
    const-string v0, "FilterProcess"

    const-string v6, "optimization"

    invoke-static {v0, v6}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    iget-boolean v0, p1, Lcom/momo/mcamera/mask/Sticker;->isCutFaceSticker:Z

    if-eqz v0, :cond_11

    .line 52
    new-instance v0, Lcom/momo/mcamera/mask/MultiStickerCutFaceMaskFilter;

    iget-object v6, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mContext:Landroid/content/Context;

    invoke-direct {v0, v6}, Lcom/momo/mcamera/mask/MultiStickerCutFaceMaskFilter;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mMultiStickerMaskFilter:Lcom/momo/mcamera/mask/MultiStickerMaskFilter;

    goto :goto_3

    .line 53
    :cond_11
    new-instance v0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;

    iget-object v6, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mContext:Landroid/content/Context;

    invoke-direct {v0, v6}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mMultiStickerMaskFilter:Lcom/momo/mcamera/mask/MultiStickerMaskFilter;

    .line 54
    :goto_3
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mMultiStickerMaskFilter:Lcom/momo/mcamera/mask/MultiStickerMaskFilter;

    const/16 v6, 0x320

    invoke-virtual {v0, v6}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->setOrderedIndex(I)V

    .line 55
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mMultiStickerMaskFilter:Lcom/momo/mcamera/mask/MultiStickerMaskFilter;

    iget v6, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mPollGroupNum:I

    invoke-virtual {v0, v6}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->setPollGroupNumber(I)V

    .line 56
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mMultiStickerMaskFilter:Lcom/momo/mcamera/mask/MultiStickerMaskFilter;

    invoke-direct {p0, v0}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->addOrderableTerminalFilter(Ll/jt2;)V

    .line 57
    :cond_12
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mMultiStickerMaskFilter:Lcom/momo/mcamera/mask/MultiStickerMaskFilter;

    if-eqz v0, :cond_15

    .line 58
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getLayerType()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_13

    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getLayerType()Ljava/lang/String;

    move-result-object v0

    const-string v6, "native"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_13

    .line 59
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    .line 60
    :cond_13
    :try_start_2
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mMultiStickerMaskFilter:Lcom/momo/mcamera/mask/MultiStickerMaskFilter;

    invoke-virtual {v0, p1}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->isHaveSameSticker(Lcom/momo/mcamera/mask/Sticker;)Z

    move-result v0

    if-eqz v0, :cond_14

    .line 61
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return-void

    .line 62
    :cond_14
    :try_start_3
    invoke-direct {p0, p1}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->multiStickerFilterAddListener(Lcom/momo/mcamera/mask/Sticker;)V

    .line 63
    const-string v0, "FilterProcess"

    const-string v6, " Sticker Type MultiStickerMaskFilter !!!"

    invoke-static {v0, v6}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    goto :goto_5

    .line 64
    :cond_15
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getStickerType()Ljava/lang/String;

    move-result-object v0

    const-string v6, "weex"

    invoke-virtual {v0, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_16

    .line 65
    new-instance v0, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;

    invoke-direct {v0, p1}, Lcom/momo/mcamera/mask/WeexStickerMaskFilter;-><init>(Lcom/momo/mcamera/mask/Sticker;)V

    .line 66
    const-string v6, "FilterProcess"

    const-string v7, " Sticker Type WeexStickerMaskFilter !!!"

    invoke-static {v6, v7}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_5

    .line 67
    :cond_16
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getEtcTextureBatch()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_17

    .line 68
    new-instance v0, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;

    iget-object v6, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mContext:Landroid/content/Context;

    invoke-direct {v0, v6, p1}, Lcom/momo/mcamera/mask/StickerEtc1MaskFilter;-><init>(Landroid/content/Context;Lcom/momo/mcamera/mask/Sticker;)V

    goto :goto_4

    .line 69
    :cond_17
    new-instance v0, Lcom/momo/mcamera/mask/StickerMaskFilter;

    iget-object v6, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getImageProvider()Lcom/momo/mcamera/mask/delegate/ImageDelegateProvider;

    move-result-object v7

    invoke-direct {v0, v6, p1, v7}, Lcom/momo/mcamera/mask/StickerMaskFilter;-><init>(Landroid/content/Context;Lcom/momo/mcamera/mask/Sticker;Lcom/momo/mcamera/mask/delegate/ImageDelegateProvider;)V

    .line 70
    :goto_4
    const-string v6, "FilterProcess"

    const-string v7, " Sticker Type StickerMaskFilter !!!"

    invoke-static {v6, v7}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    :goto_5
    if-eqz v0, :cond_1e

    .line 71
    const-string v6, "FilterProcess"

    const-string v7, " Sticker Type StickerBlendFilter !!!"

    invoke-static {v6, v7}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 72
    invoke-direct {p0, p1, v0}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->createStickerBlendFilter(Lcom/momo/mcamera/mask/Sticker;Ll/jt2;)Lcom/momo/mcamera/mask/StickerBlendFilter;

    move-result-object v0

    .line 73
    const-string v6, "STICKER_TYPE_VOICE"

    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getStickerType()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_18

    const/16 v6, 0x321

    .line 74
    invoke-virtual {v0, v6}, Lcom/momo/mcamera/mask/StickerBlendFilter;->setOrderedIndex(I)V

    .line 75
    :cond_18
    iget-object v6, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mStickerFilterMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getStickerType()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7, v0}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    invoke-direct {p0, v0}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->addOrderableTerminalFilter(Ll/jt2;)V

    .line 77
    iput-object p1, v0, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 78
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getDuration()J

    move-result-wide v6

    cmp-long v2, v6, v2

    if-lez v2, :cond_19

    .line 79
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getDuration()J

    move-result-wide v2

    iput-wide v2, v0, Lcom/momo/mcamera/mask/StickerBlendFilter;->mStickerDuration:J

    goto :goto_6

    .line 80
    :cond_19
    iput-wide v4, v0, Lcom/momo/mcamera/mask/StickerBlendFilter;->mStickerDuration:J

    .line 81
    :goto_6
    new-instance v2, Lcom/momo/mcamera/mask/StickerAdjustFilter$8;

    invoke-direct {v2, p0, p1}, Lcom/momo/mcamera/mask/StickerAdjustFilter$8;-><init>(Lcom/momo/mcamera/mask/StickerAdjustFilter;Lcom/momo/mcamera/mask/Sticker;)V

    invoke-virtual {v0, v2}, Lcom/momo/mcamera/mask/StickerBlendFilter;->setFinishListener(Lcom/momo/mcamera/mask/StickerBlendFilter$StickerMaskFinishListener;)V

    goto :goto_7

    .line 82
    :cond_1a
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getImageFolderPath()Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_1c

    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getImageFolderPath()Ljava/lang/String;

    move-result-object v6

    iget-object v7, v0, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    invoke-virtual {v7}, Lcom/momo/mcamera/mask/Sticker;->getImageFolderPath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1c

    .line 83
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getStickerType()Ljava/lang/String;

    move-result-object v2

    const-string v3, "FACE_MASK_TYPE"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1b

    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getMask()Lcom/momo/mcamera/mask/Mask;

    move-result-object v2

    iget-boolean v2, v2, Lcom/momo/mcamera/mask/Mask;->swapFacialMask:Z

    if-eqz v2, :cond_1b

    .line 84
    iput-wide v4, v0, Lcom/momo/mcamera/mask/StickerBlendFilter;->mStickerDuration:J

    .line 85
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getMask()Lcom/momo/mcamera/mask/Mask;

    move-result-object v0

    iget-boolean v0, v0, Lcom/momo/mcamera/mask/Mask;->swapFacialMask:Z

    if-eqz v0, :cond_1e

    .line 86
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mSwapFacialMaskSticker:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_7

    .line 87
    :cond_1b
    iget-wide v2, v0, Lcom/momo/mcamera/mask/StickerBlendFilter;->mStickerDuration:J

    .line 88
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/StickerBlendFilter;->getEscapedTime()J

    move-result-wide v4

    sub-long/2addr v2, v4

    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getDuration()J

    move-result-wide v4

    add-long/2addr v2, v4

    iput-wide v2, v0, Lcom/momo/mcamera/mask/StickerBlendFilter;->mStickerDuration:J

    goto :goto_7

    .line 89
    :cond_1c
    iput-object p1, v0, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 90
    invoke-virtual {v0, p1}, Lcom/momo/mcamera/mask/StickerBlendFilter;->resetSticker(Lcom/momo/mcamera/mask/Sticker;)V

    .line 91
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getDuration()J

    move-result-wide v6

    cmp-long v2, v6, v2

    if-lez v2, :cond_1d

    .line 92
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getDuration()J

    move-result-wide v2

    iput-wide v2, v0, Lcom/momo/mcamera/mask/StickerBlendFilter;->mStickerDuration:J

    goto :goto_7

    .line 93
    :cond_1d
    iput-wide v4, v0, Lcom/momo/mcamera/mask/StickerBlendFilter;->mStickerDuration:J

    .line 94
    :cond_1e
    :goto_7
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 95
    monitor-exit p0

    return-void

    .line 96
    :goto_8
    :try_start_4
    monitor-exit v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :try_start_5
    throw p1

    :catchall_1
    move-exception v0

    move-object p1, v0

    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    throw p1
.end method

.method public changeDeviceOrientation(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mSoundInput:Lcom/momo/mcamera/mask/SoundInputFilter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/wej;->resetClockDegrees()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mSoundInput:Lcom/momo/mcamera/mask/SoundInputFilter;

    .line 9
    .line 10
    div-int/lit8 v1, p1, 0x5a

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ll/wej;->rotateClockwise90Degrees(I)V

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mMultiStickerMaskFilter:Lcom/momo/mcamera/mask/MultiStickerMaskFilter;

    .line 16
    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->setDeviceOrientation(I)V

    .line 20
    .line 21
    .line 22
    :cond_1
    return-void
.end method

.method public clearMaskFilters()V
    .locals 8

    .line 1
    invoke-virtual {p0}, Ll/gfj;->getLockObject()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    monitor-enter v0

    .line 6
    const/4 v1, 0x0

    .line 7
    :try_start_0
    iput v1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mPollGroupNum:I

    .line 8
    .line 9
    iget-object v2, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mStickerFilterMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 10
    .line 11
    invoke-virtual {v2}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    const/4 v4, 0x0

    .line 24
    const/4 v5, 0x0

    .line 25
    if-eqz v3, :cond_3

    .line 26
    .line 27
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    check-cast v3, Lcom/momo/mcamera/mask/StickerBlendFilter;

    .line 32
    .line 33
    invoke-virtual {v3, v5}, Lcom/momo/mcamera/mask/StickerBlendFilter;->setFinishListener(Lcom/momo/mcamera/mask/StickerBlendFilter$StickerMaskFinishListener;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v3, v5}, Lcom/momo/mcamera/mask/StickerBlendFilter;->setFinishListener(Lcom/momo/mcamera/mask/StickerBlendFilter$StickerMaskFinishListener;)V

    .line 37
    .line 38
    .line 39
    invoke-direct {p0, v3}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->removeStickerBlendFilter(Lcom/momo/mcamera/mask/StickerBlendFilter;)V

    .line 40
    .line 41
    .line 42
    iget-object v5, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->filtersToDestroy:Ljava/util/List;

    .line 43
    .line 44
    invoke-interface {v5, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    iget-object v5, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->finishListener:Lcom/momo/mcamera/mask/StickerAdjustFilter$StickerMaskFinishListener;

    .line 48
    .line 49
    if-eqz v5, :cond_0

    .line 50
    .line 51
    iget v6, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mBigEye:F

    .line 52
    .line 53
    cmpl-float v6, v6, v4

    .line 54
    .line 55
    const/4 v7, 0x1

    .line 56
    if-lez v6, :cond_1

    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_1
    iget v6, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mThinFace:F

    .line 60
    .line 61
    add-float/2addr v6, v4

    .line 62
    cmpl-float v4, v6, v4

    .line 63
    .line 64
    if-lez v4, :cond_2

    .line 65
    .line 66
    goto :goto_1

    .line 67
    :cond_2
    move v7, v1

    .line 68
    :goto_1
    iget-object v3, v3, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 69
    .line 70
    iget-object v4, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mStickerFilterMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 71
    .line 72
    invoke-virtual {v4}, Ljava/util/concurrent/ConcurrentHashMap;->size()I

    .line 73
    .line 74
    .line 75
    move-result v4

    .line 76
    add-int/2addr v4, v7

    .line 77
    invoke-interface {v5, v4, v3}, Lcom/momo/mcamera/mask/StickerAdjustFilter$StickerMaskFinishListener;->stickerRenderFinished(ILcom/momo/mcamera/mask/Sticker;)V

    .line 78
    .line 79
    .line 80
    goto :goto_0

    .line 81
    :catchall_0
    move-exception p0

    .line 82
    goto/16 :goto_3

    .line 83
    .line 84
    :cond_3
    iget-object v2, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->face3DMaskFilters:Ljava/util/List;

    .line 85
    .line 86
    if-eqz v2, :cond_4

    .line 87
    .line 88
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 89
    .line 90
    .line 91
    move-result v2

    .line 92
    if-lez v2, :cond_4

    .line 93
    .line 94
    iget-object v2, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->face3DMaskFilters:Ljava/util/List;

    .line 95
    .line 96
    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 97
    .line 98
    .line 99
    iput-object v5, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->face3DMaskFilters:Ljava/util/List;

    .line 100
    .line 101
    :cond_4
    invoke-static {}, Lcom/core/glcore/util/BodyLandHelper;->isUseBodyLand()Z

    .line 102
    .line 103
    .line 104
    move-result v2

    .line 105
    if-eqz v2, :cond_5

    .line 106
    .line 107
    invoke-static {v1}, Lcom/core/glcore/util/BodyLandHelper;->setUseBodyLand(Z)V

    .line 108
    .line 109
    .line 110
    :cond_5
    iget-object v2, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mMultiStickerMaskFilter:Lcom/momo/mcamera/mask/MultiStickerMaskFilter;

    .line 111
    .line 112
    if-eqz v2, :cond_7

    .line 113
    .line 114
    iget-object v3, v2, Ll/jt2;->parentFilter:Ll/jt2;

    .line 115
    .line 116
    invoke-virtual {v3, v2}, Ll/gfj;->removeTarget(Ll/dfj;)V

    .line 117
    .line 118
    .line 119
    iget-object v2, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mTerminalFilter:Ll/jt2;

    .line 120
    .line 121
    iget-object v6, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mMultiStickerMaskFilter:Lcom/momo/mcamera/mask/MultiStickerMaskFilter;

    .line 122
    .line 123
    if-ne v2, v6, :cond_6

    .line 124
    .line 125
    invoke-virtual {p0, v6}, Ll/ogk;->removeTerminalFilter(Ll/jt2;)V

    .line 126
    .line 127
    .line 128
    invoke-virtual {p0, v3}, Ll/ogk;->registerTerminalFilter(Ll/jt2;)V

    .line 129
    .line 130
    .line 131
    invoke-virtual {v3, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 132
    .line 133
    .line 134
    iput-object v3, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mTerminalFilter:Ll/jt2;

    .line 135
    .line 136
    goto :goto_2

    .line 137
    :cond_6
    invoke-virtual {p0, v6}, Ll/ogk;->removeFilter(Ll/jt2;)V

    .line 138
    .line 139
    .line 140
    iget-object v2, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mMultiStickerMaskFilter:Lcom/momo/mcamera/mask/MultiStickerMaskFilter;

    .line 141
    .line 142
    invoke-virtual {v2}, Ll/gfj;->getTargets()Ljava/util/List;

    .line 143
    .line 144
    .line 145
    move-result-object v2

    .line 146
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 147
    .line 148
    .line 149
    move-result-object v2

    .line 150
    check-cast v2, Ll/jt2;

    .line 151
    .line 152
    iput-object v3, v2, Ll/jt2;->parentFilter:Ll/jt2;

    .line 153
    .line 154
    invoke-virtual {v3, v2}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 155
    .line 156
    .line 157
    :goto_2
    iget-object v2, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->filtersToDestroy:Ljava/util/List;

    .line 158
    .line 159
    iget-object v3, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mMultiStickerMaskFilter:Lcom/momo/mcamera/mask/MultiStickerMaskFilter;

    .line 160
    .line 161
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 162
    .line 163
    .line 164
    iput-object v5, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mMultiStickerMaskFilter:Lcom/momo/mcamera/mask/MultiStickerMaskFilter;

    .line 165
    .line 166
    :cond_7
    iget-object v2, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mEffectGroupFilter:Lcom/momo/mcamera/mask/EffectGroupFilter;

    .line 167
    .line 168
    if-eqz v2, :cond_8

    .line 169
    .line 170
    invoke-virtual {v2}, Lcom/momo/mcamera/mask/EffectGroupFilter;->clearAll()V

    .line 171
    .line 172
    .line 173
    :cond_8
    iget-object v2, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mFaceMaskFilter:Lcom/momo/mcamera/mask/FaceMaskFilter;

    .line 174
    .line 175
    if-eqz v2, :cond_9

    .line 176
    .line 177
    iget-object v3, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->filtersToDestroy:Ljava/util/List;

    .line 178
    .line 179
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 180
    .line 181
    .line 182
    iput-object v5, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mFaceMaskFilter:Lcom/momo/mcamera/mask/FaceMaskFilter;

    .line 183
    .line 184
    :cond_9
    iget-object v2, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mSwapFacialMaskSticker:Ljava/util/List;

    .line 185
    .line 186
    if-eqz v2, :cond_a

    .line 187
    .line 188
    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 189
    .line 190
    .line 191
    iput-object v5, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mSwapFacialMaskSticker:Ljava/util/List;

    .line 192
    .line 193
    :cond_a
    iget-object v2, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mDistorationMask:Lcom/momo/mcamera/mask/Mask;

    .line 194
    .line 195
    if-eqz v2, :cond_b

    .line 196
    .line 197
    iput-object v5, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mDistorationMask:Lcom/momo/mcamera/mask/Mask;

    .line 198
    .line 199
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mFaceBeauty:Z

    .line 200
    .line 201
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mFaceStateChange:Z

    .line 202
    .line 203
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mFaceBeautyHaveFinish:Z

    .line 204
    .line 205
    iput v4, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mFaceThinValue:F

    .line 206
    .line 207
    iput v4, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mBigEyeValue:F

    .line 208
    .line 209
    :cond_b
    iget-object v1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mBeautyFace:Lcom/momo/mcamera/mask/BeautyFace;

    .line 210
    .line 211
    if-eqz v1, :cond_c

    .line 212
    .line 213
    iput-object v5, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mBeautyFace:Lcom/momo/mcamera/mask/BeautyFace;

    .line 214
    .line 215
    :cond_c
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->releaseSoundPlayer()V

    .line 216
    .line 217
    .line 218
    invoke-static {}, Lcom/core/glcore/util/SegmentHelper;->release()V

    .line 219
    .line 220
    .line 221
    invoke-static {}, Lcom/core/glcore/util/HandSegmentHelper;->release()V

    .line 222
    .line 223
    .line 224
    invoke-static {}, Lcom/core/glcore/util/TietieHeartHelper;->getInstance()Lcom/core/glcore/util/TietieHeartHelper;

    .line 225
    .line 226
    .line 227
    move-result-object v1

    .line 228
    invoke-virtual {v1}, Lcom/core/glcore/util/TietieHeartHelper;->release()V

    .line 229
    .line 230
    .line 231
    invoke-static {}, Lcom/core/glcore/util/FacerigHelper;->releseFaceRigInfo()V

    .line 232
    .line 233
    .line 234
    iget-object v1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mStickerFilterMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 235
    .line 236
    invoke-virtual {v1}, Ljava/util/concurrent/ConcurrentHashMap;->clear()V

    .line 237
    .line 238
    .line 239
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mOrderFilterList:Ljava/util/LinkedList;

    .line 240
    .line 241
    invoke-virtual {p0}, Ljava/util/LinkedList;->clear()V

    .line 242
    .line 243
    .line 244
    monitor-exit v0

    .line 245
    return-void

    .line 246
    :goto_3
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 247
    throw p0
.end method

.method public clearMaskWithModelType(I)V
    .locals 8

    .line 1
    invoke-virtual {p0}, Ll/gfj;->getLockObject()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    monitor-enter v0

    .line 6
    const/4 v1, 0x0

    .line 7
    :try_start_0
    iput v1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mPollGroupNum:I

    .line 8
    .line 9
    iget-object v2, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mStickerFilterMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 10
    .line 11
    invoke-virtual {v2}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    const/4 v4, 0x0

    .line 24
    const/4 v5, 0x0

    .line 25
    if-eqz v3, :cond_5

    .line 26
    .line 27
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    check-cast v3, Lcom/momo/mcamera/mask/StickerBlendFilter;

    .line 32
    .line 33
    iget-object v6, v3, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 34
    .line 35
    invoke-virtual {v6}, Lcom/momo/mcamera/mask/Sticker;->getModelType()I

    .line 36
    .line 37
    .line 38
    move-result v6

    .line 39
    if-eq v6, p1, :cond_1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    invoke-virtual {v3, v4}, Lcom/momo/mcamera/mask/StickerBlendFilter;->setFinishListener(Lcom/momo/mcamera/mask/StickerBlendFilter$StickerMaskFinishListener;)V

    .line 43
    .line 44
    .line 45
    invoke-direct {p0, v3}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->removeStickerBlendFilter(Lcom/momo/mcamera/mask/StickerBlendFilter;)V

    .line 46
    .line 47
    .line 48
    iget-object v4, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->filtersToDestroy:Ljava/util/List;

    .line 49
    .line 50
    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    iget-object v4, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->finishListener:Lcom/momo/mcamera/mask/StickerAdjustFilter$StickerMaskFinishListener;

    .line 54
    .line 55
    if-eqz v4, :cond_4

    .line 56
    .line 57
    iget v6, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mBigEye:F

    .line 58
    .line 59
    cmpl-float v6, v6, v5

    .line 60
    .line 61
    const/4 v7, 0x1

    .line 62
    if-lez v6, :cond_2

    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_2
    iget v6, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mThinFace:F

    .line 66
    .line 67
    add-float/2addr v6, v5

    .line 68
    cmpl-float v5, v6, v5

    .line 69
    .line 70
    if-lez v5, :cond_3

    .line 71
    .line 72
    goto :goto_1

    .line 73
    :cond_3
    move v7, v1

    .line 74
    :goto_1
    iget-object v5, v3, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 75
    .line 76
    iget-object v6, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mStickerFilterMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 77
    .line 78
    invoke-virtual {v6}, Ljava/util/concurrent/ConcurrentHashMap;->size()I

    .line 79
    .line 80
    .line 81
    move-result v6

    .line 82
    add-int/2addr v6, v7

    .line 83
    invoke-interface {v4, v6, v5}, Lcom/momo/mcamera/mask/StickerAdjustFilter$StickerMaskFinishListener;->stickerRenderFinished(ILcom/momo/mcamera/mask/Sticker;)V

    .line 84
    .line 85
    .line 86
    goto :goto_2

    .line 87
    :catchall_0
    move-exception p0

    .line 88
    goto :goto_3

    .line 89
    :cond_4
    :goto_2
    iget-object v4, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mStickerFilterMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 90
    .line 91
    iget-object v5, v3, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 92
    .line 93
    invoke-virtual {v5}, Lcom/momo/mcamera/mask/Sticker;->getStickerType()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v5

    .line 97
    invoke-virtual {v4, v5}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    iget-object v4, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mOrderFilterList:Ljava/util/LinkedList;

    .line 101
    .line 102
    invoke-virtual {v4, v3}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    iget-object v3, v3, Lcom/momo/mcamera/mask/StickerBlendFilter;->stickerMaskFilter:Lcom/momo/mcamera/mask/FaceDetectFilter;

    .line 106
    .line 107
    instance-of v4, v3, Lcom/momo/mcamera/mask/Face3DMaskFilter;

    .line 108
    .line 109
    if-eqz v4, :cond_0

    .line 110
    .line 111
    iget-object v4, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->face3DMaskFilters:Ljava/util/List;

    .line 112
    .line 113
    if-eqz v4, :cond_0

    .line 114
    .line 115
    invoke-interface {v4, v3}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    goto :goto_0

    .line 119
    :cond_5
    iget-object v2, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mMultiStickerMaskFilter:Lcom/momo/mcamera/mask/MultiStickerMaskFilter;

    .line 120
    .line 121
    if-eqz v2, :cond_6

    .line 122
    .line 123
    invoke-virtual {v2, p1}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->clearMaskWithModelType(I)V

    .line 124
    .line 125
    .line 126
    :cond_6
    iget-object v2, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mEffectGroupFilter:Lcom/momo/mcamera/mask/EffectGroupFilter;

    .line 127
    .line 128
    if-eqz v2, :cond_7

    .line 129
    .line 130
    invoke-virtual {v2, p1}, Lcom/momo/mcamera/mask/EffectGroupFilter;->clearWithModelType(I)V

    .line 131
    .line 132
    .line 133
    :cond_7
    iget-object p1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mDistorationMask:Lcom/momo/mcamera/mask/Mask;

    .line 134
    .line 135
    if-eqz p1, :cond_8

    .line 136
    .line 137
    iput-object v4, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mDistorationMask:Lcom/momo/mcamera/mask/Mask;

    .line 138
    .line 139
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mFaceBeauty:Z

    .line 140
    .line 141
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mFaceStateChange:Z

    .line 142
    .line 143
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mFaceBeautyHaveFinish:Z

    .line 144
    .line 145
    iput v5, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mFaceThinValue:F

    .line 146
    .line 147
    iput v5, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mBigEyeValue:F

    .line 148
    .line 149
    :cond_8
    iget-object p1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mBeautyFace:Lcom/momo/mcamera/mask/BeautyFace;

    .line 150
    .line 151
    if-eqz p1, :cond_9

    .line 152
    .line 153
    iput-object v4, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mBeautyFace:Lcom/momo/mcamera/mask/BeautyFace;

    .line 154
    .line 155
    :cond_9
    monitor-exit v0

    .line 156
    return-void

    .line 157
    :goto_3
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 158
    throw p0
.end method

.method public declared-synchronized destroy()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mStickerFilterMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 3
    .line 4
    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Lcom/momo/mcamera/mask/StickerBlendFilter;

    .line 23
    .line 24
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/StickerBlendFilter;->cancelDraw()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/StickerBlendFilter;->destroy()V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :catchall_0
    move-exception v0

    .line 32
    goto/16 :goto_2

    .line 33
    .line 34
    :cond_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mEffectGroupFilter:Lcom/momo/mcamera/mask/EffectGroupFilter;

    .line 35
    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/EffectGroupFilter;->destroy()V

    .line 39
    .line 40
    .line 41
    :cond_1
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mMultiStickerMaskFilter:Lcom/momo/mcamera/mask/MultiStickerMaskFilter;

    .line 42
    .line 43
    if-eqz v0, :cond_2

    .line 44
    .line 45
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->destroy()V

    .line 46
    .line 47
    .line 48
    :cond_2
    invoke-super {p0}, Ll/ogk;->destroy()V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mNormalFilter:Lcom/momo/mcamera/mask/NormalFilter;

    .line 52
    .line 53
    if-eqz v0, :cond_3

    .line 54
    .line 55
    invoke-virtual {v0}, Ll/gfj;->destroy()V

    .line 56
    .line 57
    .line 58
    :cond_3
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->gestureDetector:Lcom/momo/mcamera/mask/gesture/CVDetector;

    .line 59
    .line 60
    if-eqz v0, :cond_4

    .line 61
    .line 62
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/gesture/CVDetector;->cancel()V

    .line 63
    .line 64
    .line 65
    :cond_4
    const/4 v0, 0x0

    .line 66
    iput-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->gestureDetectorListener:Lcom/momo/mcamera/mask/gesture/CVDetector$GestureDetectorListener;

    .line 67
    .line 68
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->stopExpressDetect()V

    .line 69
    .line 70
    .line 71
    invoke-static {}, Lcom/core/glcore/util/FacerigHelper;->release()V

    .line 72
    .line 73
    .line 74
    invoke-static {}, Lcom/core/glcore/util/BodyLandHelper;->release()V

    .line 75
    .line 76
    .line 77
    invoke-static {}, Lcom/core/glcore/util/SegmentHelper;->release()V

    .line 78
    .line 79
    .line 80
    invoke-static {}, Lcom/core/glcore/util/HandSegmentHelper;->release()V

    .line 81
    .line 82
    .line 83
    invoke-static {}, Lcom/core/glcore/util/TietieHeartHelper;->getInstance()Lcom/core/glcore/util/TietieHeartHelper;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    invoke-virtual {v1}, Lcom/core/glcore/util/TietieHeartHelper;->release()V

    .line 88
    .line 89
    .line 90
    invoke-static {}, Lcom/core/glcore/util/FacerigHelper;->releseFaceRigInfo()V

    .line 91
    .line 92
    .line 93
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->releaseSoundPlayer()V

    .line 94
    .line 95
    .line 96
    iget-object v1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mFaceMaskFilter:Lcom/momo/mcamera/mask/FaceMaskFilter;

    .line 97
    .line 98
    if-eqz v1, :cond_5

    .line 99
    .line 100
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/FaceMaskFilter;->destroy()V

    .line 101
    .line 102
    .line 103
    :cond_5
    iget-object v1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mSwapFacialMaskSticker:Ljava/util/List;

    .line 104
    .line 105
    if-eqz v1, :cond_6

    .line 106
    .line 107
    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 108
    .line 109
    .line 110
    iput-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mSwapFacialMaskSticker:Ljava/util/List;

    .line 111
    .line 112
    :cond_6
    iget-object v1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mLookupFilter:Ll/hqf0;

    .line 113
    .line 114
    if-eqz v1, :cond_7

    .line 115
    .line 116
    invoke-virtual {v1}, Ll/ogk;->destroy()V

    .line 117
    .line 118
    .line 119
    iput-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mLookupFilter:Ll/hqf0;

    .line 120
    .line 121
    :cond_7
    iget-object v1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->videoMergeGroupFilter:Lcom/momo/mcamera/mask/videomix/VideoMergeGroupFilter;

    .line 122
    .line 123
    if-eqz v1, :cond_8

    .line 124
    .line 125
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/videomix/VideoMergeGroupFilter;->destroy()V

    .line 126
    .line 127
    .line 128
    iput-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->videoMergeGroupFilter:Lcom/momo/mcamera/mask/videomix/VideoMergeGroupFilter;

    .line 129
    .line 130
    :cond_8
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->filtersToDestroy:Ljava/util/List;

    .line 131
    .line 132
    if-eqz v0, :cond_9

    .line 133
    .line 134
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 135
    .line 136
    .line 137
    move-result v0

    .line 138
    if-lez v0, :cond_9

    .line 139
    .line 140
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->filtersToDestroy:Ljava/util/List;

    .line 141
    .line 142
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 147
    .line 148
    .line 149
    move-result v1

    .line 150
    if-eqz v1, :cond_9

    .line 151
    .line 152
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 153
    .line 154
    .line 155
    move-result-object v1

    .line 156
    check-cast v1, Ll/wej;

    .line 157
    .line 158
    invoke-virtual {v1}, Ll/wej;->destroy()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 159
    .line 160
    .line 161
    goto :goto_1

    .line 162
    :cond_9
    monitor-exit p0

    .line 163
    return-void

    .line 164
    :goto_2
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 165
    throw v0
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->face3DMaskFilters:Ljava/util/List;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 7
    .line 8
    .line 9
    :cond_0
    return p1
.end method

.method public getAdjustHeightScale()F
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    const/high16 v1, 0x44200000    # 640.0f

    .line 7
    .line 8
    cmpl-float v0, v0, v1

    .line 9
    .line 10
    const/high16 v2, 0x3f800000    # 1.0f

    .line 11
    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    return v2

    .line 15
    :cond_0
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    int-to-float p0, p0

    .line 20
    mul-float/2addr p0, v2

    .line 21
    div-float/2addr p0, v1

    .line 22
    return p0
.end method

.method public getAdjustWidthScale()F
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    const/high16 v1, 0x43f00000    # 480.0f

    .line 7
    .line 8
    cmpl-float v0, v0, v1

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    const/high16 p0, 0x3f800000    # 1.0f

    .line 13
    .line 14
    return p0

    .line 15
    :cond_0
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    int-to-float p0, p0

    .line 20
    div-float/2addr p0, v1

    .line 21
    return p0
.end method

.method public getBigEye()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mBigEye:F

    .line 2
    .line 3
    return p0
.end method

.method public getStickerStateChangeListener()Lcom/momo/mcamera/mask/StickerBlendFilter$StickerStateChangeListener;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->stickerStateChangeListener:Lcom/momo/mcamera/mask/StickerBlendFilter$StickerStateChangeListener;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTextOutID()I
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ogk;->getTerminalFilters()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Ll/jt2;

    .line 11
    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/gfj;->getTextOutID()I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0

    .line 19
    :cond_0
    return v0
.end method

.method public getThinFace()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mThinFace:F

    .line 2
    .line 3
    return p0
.end method

.method public getViewPortSize()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/erf0;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->face3DMaskFilters:Ljava/util/List;

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-lez v1, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->face3DMaskFilters:Ljava/util/List;

    .line 17
    .line 18
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-eqz v1, :cond_0

    .line 27
    .line 28
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    check-cast v1, Lcom/momo/mcamera/mask/Face3DMaskFilter;

    .line 33
    .line 34
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/Face3DMaskFilter;->getViewPortSize()Ll/erf0;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    return-object v0
.end method

.method public initFBO()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/gfj;->initFBO()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public initGameFixSticker(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;II)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->isBitmapValid(Landroid/graphics/Bitmap;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-direct {p0, p2}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->isBitmapValid(Landroid/graphics/Bitmap;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mMultiStickerMaskFilter:Lcom/momo/mcamera/mask/MultiStickerMaskFilter;

    .line 14
    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    instance-of v0, p0, Lcom/momo/mcamera/mask/MultiStickerGameMaskFilter;

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    check-cast p0, Lcom/momo/mcamera/mask/MultiStickerGameMaskFilter;

    .line 22
    .line 23
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/momo/mcamera/mask/MultiStickerGameMaskFilter;->initGameFixStickerItem(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;II)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public lockTexture()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mStickerFilterMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Lcom/momo/mcamera/mask/StickerBlendFilter;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/StickerBlendFilter;->lockTexture()V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    return-void
.end method

.method public newTextureReady(ILl/gfj;Z)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/gfj;->getLockObject()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    monitor-enter v0

    .line 6
    :try_start_0
    iget v1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->scaleWidth:I

    .line 7
    .line 8
    const/high16 v2, 0x3f800000    # 1.0f

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    iput v1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->scaleWidth:I

    .line 17
    .line 18
    iput v2, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->scaleWidthRatio:F

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :catchall_0
    move-exception p0

    .line 22
    goto/16 :goto_3

    .line 23
    .line 24
    :cond_0
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-lez v1, :cond_1

    .line 29
    .line 30
    iget v1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->scaleWidth:I

    .line 31
    .line 32
    int-to-float v1, v1

    .line 33
    mul-float/2addr v1, v2

    .line 34
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    int-to-float v3, v3

    .line 39
    div-float/2addr v1, v3

    .line 40
    iput v1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->scaleWidthRatio:F

    .line 41
    .line 42
    :cond_1
    :goto_0
    iget v1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->scaleHeight:I

    .line 43
    .line 44
    if-nez v1, :cond_2

    .line 45
    .line 46
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    iput v1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->scaleHeight:I

    .line 51
    .line 52
    iput v2, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->scaleHeightRatio:F

    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_2
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    if-lez v1, :cond_3

    .line 60
    .line 61
    iget v1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->scaleHeight:I

    .line 62
    .line 63
    int-to-float v1, v1

    .line 64
    mul-float/2addr v1, v2

    .line 65
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    int-to-float v2, v2

    .line 70
    div-float/2addr v1, v2

    .line 71
    iput v1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->scaleHeightRatio:F

    .line 72
    .line 73
    :cond_3
    :goto_1
    iget-object v1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mMultiStickerMaskFilter:Lcom/momo/mcamera/mask/MultiStickerMaskFilter;

    .line 74
    .line 75
    if-eqz v1, :cond_4

    .line 76
    .line 77
    iget v2, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->scaleWidthRatio:F

    .line 78
    .line 79
    invoke-virtual {v1, v2}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->setScaleWidthRatio(F)V

    .line 80
    .line 81
    .line 82
    iget-object v1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mMultiStickerMaskFilter:Lcom/momo/mcamera/mask/MultiStickerMaskFilter;

    .line 83
    .line 84
    iget v2, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->scaleHeightRatio:F

    .line 85
    .line 86
    invoke-virtual {v1, v2}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->setScaleHeightRatio(F)V

    .line 87
    .line 88
    .line 89
    :cond_4
    iget-boolean v1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->enableSelfRender:Z

    .line 90
    .line 91
    if-eqz v1, :cond_6

    .line 92
    .line 93
    iget-wide v1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->startTime:J

    .line 94
    .line 95
    const-wide/16 v3, 0x0

    .line 96
    .line 97
    cmp-long v1, v1, v3

    .line 98
    .line 99
    if-nez v1, :cond_5

    .line 100
    .line 101
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 102
    .line 103
    .line 104
    move-result-wide v1

    .line 105
    iput-wide v1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->startTime:J

    .line 106
    .line 107
    :cond_5
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 108
    .line 109
    .line 110
    move-result-wide v1

    .line 111
    iget-wide v3, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->startTime:J

    .line 112
    .line 113
    sub-long/2addr v1, v3

    .line 114
    invoke-virtual {p0, v1, v2}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->setTimeStamp(J)V

    .line 115
    .line 116
    .line 117
    :cond_6
    iget-object v1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->filtersToDestroy:Ljava/util/List;

    .line 118
    .line 119
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 124
    .line 125
    .line 126
    move-result v2

    .line 127
    if-eqz v2, :cond_7

    .line 128
    .line 129
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 130
    .line 131
    .line 132
    move-result-object v2

    .line 133
    check-cast v2, Ll/wej;

    .line 134
    .line 135
    invoke-virtual {v2}, Ll/wej;->destroy()V

    .line 136
    .line 137
    .line 138
    goto :goto_2

    .line 139
    :cond_7
    iget-object v1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->filtersToDestroy:Ljava/util/List;

    .line 140
    .line 141
    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 142
    .line 143
    .line 144
    invoke-super {p0, p1, p2, p3}, Ll/ogk;->newTextureReady(ILl/gfj;Z)V

    .line 145
    .line 146
    .line 147
    monitor-exit v0

    .line 148
    return-void

    .line 149
    :goto_3
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 150
    throw p0
.end method

.method public onExpressDetected(Lcom/momocv/express/ExpressInfo;)V
    .locals 0

    return-void
.end method

.method public onGestureDetected(Lcom/core/glcore/cv/MMCVBoxes;)V
    .locals 4

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/core/glcore/cv/MMCVBoxes;->getDetectResult()[Lcom/momocv/MMBox;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/core/glcore/cv/MMCVBoxes;->getDetectResult()[Lcom/momocv/MMBox;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    array-length v0, v0

    .line 14
    if-lez v0, :cond_1

    .line 15
    .line 16
    iput-object p1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mmcvBoxes:Lcom/core/glcore/cv/MMCVBoxes;

    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/core/glcore/cv/MMCVBoxes;->getDetectResult()[Lcom/momocv/MMBox;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    array-length v0, p1

    .line 23
    const/4 v1, 0x0

    .line 24
    :goto_0
    if-ge v1, v0, :cond_2

    .line 25
    .line 26
    aget-object v2, p1, v1

    .line 27
    .line 28
    iget-object v3, v2, Lcom/momocv/MMBox;->class_name_:Ljava/lang/String;

    .line 29
    .line 30
    iget v2, v2, Lcom/momocv/MMBox;->class_index_:I

    .line 31
    .line 32
    if-lez v2, :cond_0

    .line 33
    .line 34
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    if-nez v2, :cond_0

    .line 39
    .line 40
    invoke-direct {p0, v3}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->addGestureMaskModel(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    iget-object v2, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->gestureDetectedListener:Lcom/momo/mcamera/mask/StickerAdjustFilter$GestureDetectedListener;

    .line 44
    .line 45
    if-eqz v2, :cond_0

    .line 46
    .line 47
    invoke-interface {v2, v3}, Lcom/momo/mcamera/mask/StickerAdjustFilter$GestureDetectedListener;->gestureDetected(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_1
    const/4 p1, 0x0

    .line 54
    iput-object p1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mmcvBoxes:Lcom/core/glcore/cv/MMCVBoxes;

    .line 55
    .line 56
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mGestureTrackingFilter:Lcom/momo/mcamera/mask/StickerGestureTrackingFilter;

    .line 57
    .line 58
    if-eqz p0, :cond_2

    .line 59
    .line 60
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/StickerGestureTrackingFilter;->gestureMiss()V

    .line 61
    .line 62
    .line 63
    :cond_2
    return-void
.end method

.method public onObjectDetected(Lcom/core/glcore/cv/MMCVBoxes;)V
    .locals 4

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/core/glcore/cv/MMCVBoxes;->getDetectResult()[Lcom/momocv/MMBox;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/core/glcore/cv/MMCVBoxes;->getDetectResult()[Lcom/momocv/MMBox;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    array-length v0, v0

    .line 14
    if-lez v0, :cond_1

    .line 15
    .line 16
    iput-object p1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mmcvBoxes:Lcom/core/glcore/cv/MMCVBoxes;

    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/core/glcore/cv/MMCVBoxes;->getDetectResult()[Lcom/momocv/MMBox;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    array-length v0, p1

    .line 23
    const/4 v1, 0x0

    .line 24
    :goto_0
    if-ge v1, v0, :cond_2

    .line 25
    .line 26
    aget-object v2, p1, v1

    .line 27
    .line 28
    iget-object v3, v2, Lcom/momocv/MMBox;->class_name_:Ljava/lang/String;

    .line 29
    .line 30
    iget v2, v2, Lcom/momocv/MMBox;->class_index_:I

    .line 31
    .line 32
    if-lez v2, :cond_0

    .line 33
    .line 34
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    if-nez v2, :cond_0

    .line 39
    .line 40
    invoke-direct {p0, v3}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->addGestureMaskModel(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    iget-object v2, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->gestureDetectedListener:Lcom/momo/mcamera/mask/StickerAdjustFilter$GestureDetectedListener;

    .line 44
    .line 45
    if-eqz v2, :cond_0

    .line 46
    .line 47
    invoke-interface {v2, v3}, Lcom/momo/mcamera/mask/StickerAdjustFilter$GestureDetectedListener;->gestureDetected(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_1
    const/4 p1, 0x0

    .line 54
    iput-object p1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mmcvBoxes:Lcom/core/glcore/cv/MMCVBoxes;

    .line 55
    .line 56
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mGestureTrackingFilter:Lcom/momo/mcamera/mask/StickerGestureTrackingFilter;

    .line 57
    .line 58
    if-eqz p0, :cond_2

    .line 59
    .line 60
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/StickerGestureTrackingFilter;->gestureMiss()V

    .line 61
    .line 62
    .line 63
    :cond_2
    return-void
.end method

.method public pauseRender()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mStickerFilterMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Lcom/momo/mcamera/mask/StickerBlendFilter;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/StickerBlendFilter;->pauseBitmapCache()V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    return-void
.end method

.method public releaseFrameBuffer()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/ogk;->releaseFrameBuffer()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public releaseSoundPlayer()V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->clearAllSoundPoolInfo()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->soundPool:Landroid/media/SoundPool;

    .line 5
    .line 6
    if-eqz v0, :cond_2

    .line 7
    .line 8
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->soundIds:Ljava/util/ArrayList;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-lez v0, :cond_1

    .line 17
    .line 18
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->soundIds:Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-eqz v1, :cond_0

    .line 29
    .line 30
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    check-cast v1, Ljava/lang/Integer;

    .line 35
    .line 36
    iget-object v2, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->soundPool:Landroid/media/SoundPool;

    .line 37
    .line 38
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    invoke-virtual {v2, v1}, Landroid/media/SoundPool;->unload(I)Z

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->soundIds:Ljava/util/ArrayList;

    .line 47
    .line 48
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 49
    .line 50
    .line 51
    :cond_1
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->soundPool:Landroid/media/SoundPool;

    .line 52
    .line 53
    invoke-virtual {v0}, Landroid/media/SoundPool;->release()V

    .line 54
    .line 55
    .line 56
    :cond_2
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->soundPlayer:Landroid/media/MediaPlayer;

    .line 57
    .line 58
    if-eqz v0, :cond_3

    .line 59
    .line 60
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    .line 61
    .line 62
    .line 63
    const/4 v0, 0x0

    .line 64
    iput-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->soundPlayer:Landroid/media/MediaPlayer;

    .line 65
    .line 66
    :cond_3
    return-void
.end method

.method public removeGestureModel(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mGestureTriggerModels:Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    const-string p0, "FilterProcess"

    .line 7
    .line 8
    const-string p1, "StickerAdjustFilter removeGestureModel "

    .line 9
    .line 10
    invoke-static {p0, p1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public removeHaniSticker(I)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/gfj;->getLockObject()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    monitor-enter v0

    .line 6
    :try_start_0
    iget-object v1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mMultiStickerMaskFilter:Lcom/momo/mcamera/mask/MultiStickerMaskFilter;

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    invoke-virtual {v1, p1}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->removeHaniSticker(I)V

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :catchall_0
    move-exception p0

    .line 15
    goto :goto_1

    .line 16
    :cond_0
    :goto_0
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->clearMaskWithModelType(I)V

    .line 17
    .line 18
    .line 19
    monitor-exit v0

    .line 20
    return-void

    .line 21
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    throw p0
.end method

.method public removeSticker(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/gfj;->getLockObject()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    monitor-enter v0

    .line 6
    :try_start_0
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mMultiStickerMaskFilter:Lcom/momo/mcamera/mask/MultiStickerMaskFilter;

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->removeSticker(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :catchall_0
    move-exception p0

    .line 15
    goto :goto_1

    .line 16
    :cond_0
    :goto_0
    monitor-exit v0

    .line 17
    return-void

    .line 18
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    throw p0
.end method

.method public resumeRender()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mStickerFilterMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Lcom/momo/mcamera/mask/StickerBlendFilter;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/StickerBlendFilter;->resumeBitmapCache()V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    return-void
.end method

.method public setBigEye(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mBigEye:F

    .line 2
    .line 3
    return-void
.end method

.method public setCapture3DImageListener(Lcom/momo/mcamera/mask/Capture3DImageListener;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->face3DMaskFilters:Ljava/util/List;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-lez v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->face3DMaskFilters:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Lcom/momo/mcamera/mask/Face3DMaskFilter;

    .line 28
    .line 29
    invoke-virtual {v0, p1}, Lcom/momo/mcamera/mask/Face3DMaskFilter;->setCapture3DImageListener(Lcom/momo/mcamera/mask/Capture3DImageListener;)V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    return-void
.end method

.method public setCapture3DRenderImage(ZLandroid/graphics/Rect;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->face3DMaskFilters:Ljava/util/List;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-lez v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->face3DMaskFilters:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Lcom/momo/mcamera/mask/Face3DMaskFilter;

    .line 28
    .line 29
    invoke-virtual {v0, p1, p2}, Lcom/momo/mcamera/mask/Face3DMaskFilter;->setCapture(ZLandroid/graphics/Rect;)V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    return-void
.end method

.method public setDefaultCameraDirection(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->isCameraFront:Z

    .line 2
    .line 3
    return-void
.end method

.method public setEffectTimeInfoByHaniId(Ll/ore;I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mMultiStickerMaskFilter:Lcom/momo/mcamera/mask/MultiStickerMaskFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->setEffectTimeInfoByHaniId(Ll/ore;I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setEnableSound(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->enableSoundPool:Z

    .line 2
    .line 3
    return-void
.end method

.method public setFinishListener(Lcom/momo/mcamera/mask/StickerAdjustFilter$StickerMaskFinishListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->finishListener:Lcom/momo/mcamera/mask/StickerAdjustFilter$StickerMaskFinishListener;

    .line 2
    .line 3
    return-void
.end method

.method public setGameScoreListener(Lcom/momo/mcamera/mask/delegate/GameScoreListener;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mMultiStickerMaskFilter:Lcom/momo/mcamera/mask/MultiStickerMaskFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    instance-of v0, p0, Lcom/momo/mcamera/mask/MultiStickerGameMaskFilter;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    check-cast p0, Lcom/momo/mcamera/mask/MultiStickerGameMaskFilter;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/MultiStickerGameMaskFilter;->setGameScoreListener(Lcom/momo/mcamera/mask/delegate/GameScoreListener;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public setGameStickerDownVelocity(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mMultiStickerMaskFilter:Lcom/momo/mcamera/mask/MultiStickerMaskFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->setDownVelocity(F)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setGestureDetectInterval(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->gestureDetector:Lcom/momo/mcamera/mask/gesture/CVDetector;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/gesture/CVDetector;->setDetectInterval(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setGestureDetectedListener(Lcom/momo/mcamera/mask/StickerAdjustFilter$GestureDetectedListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->gestureDetectedListener:Lcom/momo/mcamera/mask/StickerAdjustFilter$GestureDetectedListener;

    .line 2
    .line 3
    return-void
.end method

.method public setIntensity(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mLookupFilter:Ll/hqf0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mLookupFilter:Ll/hqf0;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/hqf0;->setIntensity(F)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public setIsUseStickerOptimization(Z)V
    .locals 0

    return-void
.end method

.method public setMMCVInfo(Ll/omw;)V
    .locals 22

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    if-nez v1, :cond_0

    return-void

    .line 1
    :cond_0
    iput-object v1, v0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mCurCVInfo:Ll/omw;

    .line 2
    invoke-virtual {v0}, Ll/gfj;->getLockObject()Ljava/lang/Object;

    move-result-object v2

    monitor-enter v2

    .line 3
    :try_start_0
    iget-object v3, v0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mFaceMaskFilter:Lcom/momo/mcamera/mask/FaceMaskFilter;

    if-eqz v3, :cond_1

    .line 4
    invoke-virtual {v3, v1}, Lcom/momo/mcamera/mask/FaceMaskFilter;->setMMCVInfo(Ll/omw;)V

    goto :goto_0

    :catchall_0
    move-exception v0

    goto/16 :goto_d

    .line 5
    :cond_1
    :goto_0
    iget-object v3, v0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mStickerFilterMap:Ljava/util/concurrent/ConcurrentHashMap;

    if-eqz v3, :cond_3

    invoke-virtual {v3}, Ljava/util/concurrent/ConcurrentHashMap;->size()I

    move-result v3

    if-lez v3, :cond_3

    .line 6
    iget-object v3, v0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mStickerFilterMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v3}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_2
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/momo/mcamera/mask/StickerBlendFilter;

    .line 7
    iget-object v5, v4, Lcom/momo/mcamera/mask/StickerBlendFilter;->segmentFilter:Lcom/momo/mcamera/mask/segment/AbsSegmentFilter;

    if-eqz v5, :cond_2

    .line 8
    invoke-virtual {v4, v1}, Lcom/momo/mcamera/mask/StickerBlendFilter;->setMMCVInfo(Ll/omw;)V

    goto :goto_1

    .line 9
    :cond_3
    iget-object v3, v0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mEffectGroupFilter:Lcom/momo/mcamera/mask/EffectGroupFilter;

    if-eqz v3, :cond_4

    .line 10
    invoke-virtual {v3, v1}, Lcom/momo/mcamera/mask/EffectGroupFilter;->setMMCVInfo(Ll/omw;)V

    .line 11
    :cond_4
    iget-object v3, v0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->expressDetector:Lcom/momo/mcamera/mask/express/ExpressDetector;

    if-eqz v3, :cond_5

    .line 12
    invoke-virtual {v3, v1}, Lcom/momo/mcamera/mask/express/ExpressDetector;->setMMCVInfo(Ll/omw;)V

    .line 13
    :cond_5
    iget-object v3, v0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->gestureDetector:Lcom/momo/mcamera/mask/gesture/CVDetector;

    if-eqz v3, :cond_6

    .line 14
    invoke-virtual {v3, v1}, Lcom/momo/mcamera/mask/gesture/CVDetector;->setMMCVInfo(Ll/omw;)V

    .line 15
    :cond_6
    iget-object v3, v0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mGestureTrackingFilter:Lcom/momo/mcamera/mask/StickerGestureTrackingFilter;

    if-eqz v3, :cond_7

    .line 16
    invoke-virtual {v3, v1}, Lcom/momo/mcamera/mask/StickerGestureTrackingFilter;->setMMCVInfo(Ll/omw;)V

    .line 17
    :cond_7
    iget-object v3, v0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->videoMergeGroupFilter:Lcom/momo/mcamera/mask/videomix/VideoMergeGroupFilter;

    if-eqz v3, :cond_8

    .line 18
    invoke-virtual {v3, v1}, Lcom/momo/mcamera/mask/videomix/VideoMergeGroupFilter;->setMMCVInfo(Ll/omw;)V

    .line 19
    :cond_8
    invoke-direct {v0}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->processDistortionState()V

    .line 20
    invoke-virtual {v1}, Ll/omw;->n()I

    move-result v3

    const/16 v4, 0x44

    const/4 v5, 0x1

    const/4 v6, 0x0

    if-gtz v3, :cond_9

    .line 21
    iput v6, v0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->lastFacesCnt:I

    move v3, v6

    move v7, v3

    goto :goto_2

    .line 22
    :cond_9
    iget-boolean v3, v0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->multiSwitchEnable:Z

    if-eqz v3, :cond_a

    .line 23
    invoke-direct/range {p0 .. p1}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->calculateFaceIndex(Ll/omw;)I

    move-result v3

    .line 24
    invoke-virtual {v1, v3}, Ll/omw;->j(I)Ll/nuf;

    move-result-object v7

    invoke-virtual {v7}, Ll/nuf;->l()[F

    move-result-object v7

    .line 25
    iget-object v8, v0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->lastFacePosition:Landroid/graphics/PointF;

    aget v9, v7, v6

    aget v7, v7, v4

    invoke-virtual {v8, v9, v7}, Landroid/graphics/PointF;->set(FF)V

    .line 26
    invoke-virtual {v1}, Ll/omw;->n()I

    move-result v7

    iput v7, v0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->lastFacesCnt:I

    move v7, v5

    goto :goto_2

    :cond_a
    move v7, v5

    move v3, v6

    .line 27
    :goto_2
    iget-object v8, v0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->filterTriggerManager:Lcom/momo/mcamera/mask/FilterTriggerManager;

    invoke-virtual {v8, v3}, Lcom/momo/mcamera/mask/FilterTriggerManager;->setTriggerFaceIndex(I)V

    .line 28
    iget-object v8, v0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->filterTriggerManager:Lcom/momo/mcamera/mask/FilterTriggerManager;

    invoke-virtual {v8, v1}, Lcom/momo/mcamera/mask/FilterTriggerManager;->adjustStateBy(Ll/omw;)V

    .line 29
    iget-object v8, v0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mMultiStickerMaskFilter:Lcom/momo/mcamera/mask/MultiStickerMaskFilter;

    if-eqz v8, :cond_c

    .line 30
    iget-object v8, v0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->stickerStateChangeListener:Lcom/momo/mcamera/mask/StickerBlendFilter$StickerStateChangeListener;

    if-eqz v8, :cond_b

    .line 31
    invoke-interface {v8, v7}, Lcom/momo/mcamera/mask/StickerBlendFilter$StickerStateChangeListener;->faceDetected(Z)V

    .line 32
    :cond_b
    iget-object v7, v0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mMultiStickerMaskFilter:Lcom/momo/mcamera/mask/MultiStickerMaskFilter;

    invoke-virtual {v7, v3}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->setMainFaceIndex(I)V

    .line 33
    iget-object v3, v0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mMultiStickerMaskFilter:Lcom/momo/mcamera/mask/MultiStickerMaskFilter;

    iget-object v7, v0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->filterTriggerManager:Lcom/momo/mcamera/mask/FilterTriggerManager;

    invoke-virtual {v3, v7}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->setFilterTriggerManager(Lcom/momo/mcamera/mask/FilterTriggerManager;)V

    .line 34
    iget-object v3, v0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mMultiStickerMaskFilter:Lcom/momo/mcamera/mask/MultiStickerMaskFilter;

    iget-object v7, v0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mmcvBoxes:Lcom/core/glcore/cv/MMCVBoxes;

    invoke-virtual {v3, v7}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->setMmcvBoxes(Lcom/core/glcore/cv/MMCVBoxes;)V

    .line 35
    iget-object v3, v0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mMultiStickerMaskFilter:Lcom/momo/mcamera/mask/MultiStickerMaskFilter;

    invoke-virtual {v3, v1}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->setMMCVInfo(Ll/omw;)V

    .line 36
    :cond_c
    iget-object v3, v0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->face3DMaskFilters:Ljava/util/List;

    if-eqz v3, :cond_e

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-lez v3, :cond_e

    .line 37
    iget-object v3, v0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->face3DMaskFilters:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_d
    :goto_3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_e

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/momo/mcamera/mask/Face3DMaskFilter;

    .line 38
    invoke-virtual {v7}, Lcom/momo/mcamera/mask/Face3DMaskFilter;->needFaceDetect()Z

    move-result v8

    if-eqz v8, :cond_d

    .line 39
    invoke-virtual {v7, v1}, Lcom/momo/mcamera/mask/Face3DMaskFilter;->setMMCVInfo(Ll/omw;)V

    goto :goto_3

    .line 40
    :cond_e
    invoke-virtual {v1}, Ll/omw;->n()I

    move-result v3

    const/4 v7, 0x7

    const/4 v8, 0x6

    const/4 v9, 0x5

    const/16 v10, 0x63

    const/4 v11, 0x3

    const/4 v12, 0x2

    if-nez v3, :cond_19

    .line 41
    iget-object v1, v0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mStickerFilterMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_f
    :goto_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_18

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/momo/mcamera/mask/StickerBlendFilter;

    .line 42
    new-instance v4, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;

    invoke-direct {v4}, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;-><init>()V

    .line 43
    iget-object v13, v3, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    invoke-virtual {v13}, Lcom/momo/mcamera/mask/Sticker;->getLayerType()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v13

    if-nez v13, :cond_10

    iget-object v13, v3, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    invoke-virtual {v13}, Lcom/momo/mcamera/mask/Sticker;->getLayerType()Ljava/lang/String;

    move-result-object v13

    const-string v14, "object_follower"

    invoke-virtual {v13, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_10

    .line 44
    invoke-virtual {v3}, Lcom/momo/mcamera/mask/StickerBlendFilter;->clearPoints()V

    .line 45
    invoke-direct {v0, v3, v4}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->drawGestureFilter(Lcom/momo/mcamera/mask/StickerBlendFilter;Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V

    goto :goto_4

    .line 46
    :cond_10
    iget-object v13, v3, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    invoke-virtual {v13}, Lcom/momo/mcamera/mask/Sticker;->isAlwaysShow()Z

    move-result v13

    if-nez v13, :cond_11

    .line 47
    invoke-virtual {v3}, Lcom/momo/mcamera/mask/StickerBlendFilter;->clearPoints()V

    goto :goto_4

    .line 48
    :cond_11
    iget-object v13, v3, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    invoke-virtual {v13}, Lcom/momo/mcamera/mask/Sticker;->getType()I

    move-result v13

    if-ne v13, v5, :cond_12

    .line 49
    invoke-virtual {v3}, Lcom/momo/mcamera/mask/StickerBlendFilter;->clearPoints()V

    .line 50
    invoke-direct {v0, v3, v4}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->drawFixedSticker(Lcom/momo/mcamera/mask/StickerBlendFilter;Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V

    goto :goto_4

    .line 51
    :cond_12
    iget-object v13, v3, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    invoke-virtual {v13}, Lcom/momo/mcamera/mask/Sticker;->getType()I

    move-result v13

    if-ne v13, v12, :cond_13

    .line 52
    invoke-virtual {v3}, Lcom/momo/mcamera/mask/StickerBlendFilter;->clearPoints()V

    .line 53
    invoke-direct {v0, v3, v4}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->drawFullScreenFixed(Lcom/momo/mcamera/mask/StickerBlendFilter;Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V

    goto :goto_4

    .line 54
    :cond_13
    iget-object v13, v3, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    invoke-virtual {v13}, Lcom/momo/mcamera/mask/Sticker;->getType()I

    move-result v13

    if-ne v13, v11, :cond_14

    .line 55
    invoke-virtual {v3}, Lcom/momo/mcamera/mask/StickerBlendFilter;->clearPoints()V

    .line 56
    invoke-direct {v0, v3, v4}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->drawPositionSetFixed(Lcom/momo/mcamera/mask/StickerBlendFilter;Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V

    goto :goto_4

    .line 57
    :cond_14
    iget-object v13, v3, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    invoke-virtual {v13}, Lcom/momo/mcamera/mask/Sticker;->getType()I

    move-result v13

    if-ne v13, v10, :cond_15

    .line 58
    invoke-virtual {v3}, Lcom/momo/mcamera/mask/StickerBlendFilter;->clearPoints()V

    .line 59
    invoke-direct {v0, v3, v4}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->drawScaleCenterCrop(Lcom/momo/mcamera/mask/StickerBlendFilter;Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V

    goto :goto_4

    .line 60
    :cond_15
    iget-object v13, v3, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    invoke-virtual {v13}, Lcom/momo/mcamera/mask/Sticker;->getType()I

    move-result v13

    if-ne v13, v9, :cond_16

    .line 61
    invoke-virtual {v3}, Lcom/momo/mcamera/mask/StickerBlendFilter;->clearPoints()V

    .line 62
    invoke-direct {v0, v3, v4}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->drawAbsolutePostion(Lcom/momo/mcamera/mask/StickerBlendFilter;Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V

    goto/16 :goto_4

    .line 63
    :cond_16
    iget-object v13, v3, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    invoke-virtual {v13}, Lcom/momo/mcamera/mask/Sticker;->getType()I

    move-result v13

    if-ne v13, v8, :cond_17

    .line 64
    invoke-virtual {v3}, Lcom/momo/mcamera/mask/StickerBlendFilter;->clearPoints()V

    .line 65
    invoke-direct {v0, v3, v4}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->drawAbsolutePostionUseStcikerDim(Lcom/momo/mcamera/mask/StickerBlendFilter;Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V

    goto/16 :goto_4

    .line 66
    :cond_17
    iget-object v13, v3, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    invoke-virtual {v13}, Lcom/momo/mcamera/mask/Sticker;->getType()I

    move-result v13

    if-ne v13, v7, :cond_f

    .line 67
    invoke-virtual {v3}, Lcom/momo/mcamera/mask/StickerBlendFilter;->clearPoints()V

    .line 68
    invoke-direct {v0, v3, v4}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->drawAbsPostionAdjustResolution(Lcom/momo/mcamera/mask/StickerBlendFilter;Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V

    goto/16 :goto_4

    .line 69
    :cond_18
    iget-object v0, v0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->stickerStateChangeListener:Lcom/momo/mcamera/mask/StickerBlendFilter$StickerStateChangeListener;

    if-eqz v0, :cond_2c

    .line 70
    invoke-interface {v0, v6}, Lcom/momo/mcamera/mask/StickerBlendFilter$StickerStateChangeListener;->faceDetected(Z)V

    goto/16 :goto_c

    .line 71
    :cond_19
    iget-object v3, v0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->stickerStateChangeListener:Lcom/momo/mcamera/mask/StickerBlendFilter$StickerStateChangeListener;

    if-eqz v3, :cond_1a

    .line 72
    invoke-interface {v3, v5}, Lcom/momo/mcamera/mask/StickerBlendFilter$StickerStateChangeListener;->faceDetected(Z)V

    .line 73
    :cond_1a
    invoke-virtual {v1}, Ll/omw;->n()I

    move-result v3

    sub-int/2addr v3, v5

    :goto_5
    if-ltz v3, :cond_2c

    .line 74
    iget-object v13, v0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mStickerFilterMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v13}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    move-result-object v13

    invoke-interface {v13}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v13

    :goto_6
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_2b

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/momo/mcamera/mask/StickerBlendFilter;

    .line 75
    iget-object v15, v14, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    move/from16 v16, v4

    .line 76
    new-instance v4, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;

    invoke-direct {v4}, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;-><init>()V

    move/from16 v17, v6

    .line 77
    iget-object v6, v0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mmcvBoxes:Lcom/core/glcore/cv/MMCVBoxes;

    iput-object v6, v4, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->mmcvBoxes:Lcom/core/glcore/cv/MMCVBoxes;

    .line 78
    iget-object v6, v14, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    invoke-virtual {v6}, Lcom/momo/mcamera/mask/Sticker;->getLayerType()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_1c

    iget-object v6, v14, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    invoke-virtual {v6}, Lcom/momo/mcamera/mask/Sticker;->getLayerType()Ljava/lang/String;

    move-result-object v6

    const-string v7, "object_follower"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1c

    .line 79
    invoke-virtual {v14}, Lcom/momo/mcamera/mask/StickerBlendFilter;->clearPoints()V

    .line 80
    invoke-direct {v0, v14, v4}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->drawGestureFilter(Lcom/momo/mcamera/mask/StickerBlendFilter;Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V

    :cond_1b
    :goto_7
    move/from16 v18, v3

    move/from16 v21, v12

    move/from16 v3, v17

    goto/16 :goto_b

    .line 81
    :cond_1c
    invoke-virtual {v15}, Lcom/momo/mcamera/mask/Sticker;->getType()I

    move-result v6

    if-ne v6, v5, :cond_1d

    .line 82
    invoke-virtual {v14}, Lcom/momo/mcamera/mask/StickerBlendFilter;->clearPoints()V

    .line 83
    invoke-direct {v0, v14, v4}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->drawFixedSticker(Lcom/momo/mcamera/mask/StickerBlendFilter;Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V

    goto :goto_7

    .line 84
    :cond_1d
    invoke-virtual {v15}, Lcom/momo/mcamera/mask/Sticker;->getType()I

    move-result v6

    if-ne v6, v12, :cond_1e

    .line 85
    invoke-virtual {v14}, Lcom/momo/mcamera/mask/StickerBlendFilter;->clearPoints()V

    .line 86
    invoke-direct {v0, v14, v4}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->drawFullScreenFixed(Lcom/momo/mcamera/mask/StickerBlendFilter;Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V

    goto :goto_7

    .line 87
    :cond_1e
    invoke-virtual {v15}, Lcom/momo/mcamera/mask/Sticker;->getType()I

    move-result v6

    if-ne v6, v11, :cond_1f

    .line 88
    invoke-virtual {v14}, Lcom/momo/mcamera/mask/StickerBlendFilter;->clearPoints()V

    .line 89
    invoke-direct {v0, v14, v4}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->drawPositionSetFixed(Lcom/momo/mcamera/mask/StickerBlendFilter;Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V

    goto :goto_7

    .line 90
    :cond_1f
    iget-object v6, v14, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    invoke-virtual {v6}, Lcom/momo/mcamera/mask/Sticker;->getType()I

    move-result v6

    if-ne v6, v10, :cond_20

    .line 91
    invoke-virtual {v14}, Lcom/momo/mcamera/mask/StickerBlendFilter;->clearPoints()V

    .line 92
    invoke-direct {v0, v14, v4}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->drawScaleCenterCrop(Lcom/momo/mcamera/mask/StickerBlendFilter;Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V

    goto :goto_7

    .line 93
    :cond_20
    iget-object v6, v14, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    invoke-virtual {v6}, Lcom/momo/mcamera/mask/Sticker;->getType()I

    move-result v6

    if-ne v6, v9, :cond_21

    .line 94
    invoke-virtual {v14}, Lcom/momo/mcamera/mask/StickerBlendFilter;->clearPoints()V

    .line 95
    invoke-direct {v0, v14, v4}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->drawAbsolutePostion(Lcom/momo/mcamera/mask/StickerBlendFilter;Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V

    goto :goto_7

    .line 96
    :cond_21
    iget-object v6, v14, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    invoke-virtual {v6}, Lcom/momo/mcamera/mask/Sticker;->getType()I

    move-result v6

    if-ne v6, v8, :cond_22

    .line 97
    invoke-virtual {v14}, Lcom/momo/mcamera/mask/StickerBlendFilter;->clearPoints()V

    .line 98
    invoke-direct {v0, v14, v4}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->drawAbsolutePostionUseStcikerDim(Lcom/momo/mcamera/mask/StickerBlendFilter;Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V

    goto :goto_7

    .line 99
    :cond_22
    iget-object v6, v14, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    invoke-virtual {v6}, Lcom/momo/mcamera/mask/Sticker;->getType()I

    move-result v6

    const/4 v7, 0x7

    if-ne v6, v7, :cond_23

    .line 100
    invoke-virtual {v14}, Lcom/momo/mcamera/mask/StickerBlendFilter;->clearPoints()V

    .line 101
    invoke-direct {v0, v14, v4}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->drawAbsPostionAdjustResolution(Lcom/momo/mcamera/mask/StickerBlendFilter;Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V

    goto :goto_7

    .line 102
    :cond_23
    invoke-virtual {v15}, Lcom/momo/mcamera/mask/Sticker;->getType()I

    move-result v6

    if-nez v6, :cond_1b

    .line 103
    invoke-virtual {v14}, Lcom/momo/mcamera/mask/StickerBlendFilter;->clearPoints()V

    .line 104
    invoke-virtual {v1, v3}, Ll/omw;->j(I)Ll/nuf;

    move-result-object v6

    .line 105
    invoke-virtual {v6}, Ll/nuf;->l()[F

    move-result-object v18

    .line 106
    invoke-virtual {v15}, Lcom/momo/mcamera/mask/Sticker;->getFacePositionLeft()I

    move-result v19

    aget v7, v18, v19

    .line 107
    invoke-virtual {v15}, Lcom/momo/mcamera/mask/Sticker;->getFacePositionLeft()I

    move-result v19

    add-int/lit8 v19, v19, 0x44

    aget v8, v18, v19

    .line 108
    invoke-virtual {v15}, Lcom/momo/mcamera/mask/Sticker;->getFacePositionRight()I

    move-result v19

    aget v9, v18, v19

    .line 109
    invoke-virtual {v15}, Lcom/momo/mcamera/mask/Sticker;->getFacePositionRight()I

    move-result v19

    add-int/lit8 v19, v19, 0x44

    aget v10, v18, v19

    .line 110
    new-instance v11, Landroid/graphics/PointF;

    invoke-direct {v11, v7, v8}, Landroid/graphics/PointF;-><init>(FF)V

    .line 111
    new-instance v7, Landroid/graphics/PointF;

    invoke-direct {v7, v9, v10}, Landroid/graphics/PointF;-><init>(FF)V

    .line 112
    invoke-virtual {v6}, Ll/nuf;->f()F

    move-result v6

    .line 113
    new-instance v8, Landroid/graphics/PointF;

    invoke-virtual {v15}, Lcom/momo/mcamera/mask/Sticker;->getOffsetX()I

    move-result v9

    int-to-float v9, v9

    invoke-virtual {v0}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->getAdjustWidthScale()F

    move-result v10

    mul-float/2addr v9, v10

    .line 114
    invoke-virtual {v15}, Lcom/momo/mcamera/mask/Sticker;->getOffsetY()I

    move-result v10

    int-to-float v10, v10

    invoke-virtual {v0}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->getAdjustWidthScale()F

    move-result v20

    mul-float v10, v10, v20

    invoke-direct {v8, v9, v10}, Landroid/graphics/PointF;-><init>(FF)V

    .line 115
    invoke-virtual {v0, v8, v6}, Lcom/momo/mcamera/mask/StickerGroupFilter;->rotatePoint(Landroid/graphics/PointF;F)V

    .line 116
    invoke-virtual {v15}, Lcom/momo/mcamera/mask/Sticker;->hasCenterPoint()Z

    move-result v9

    if-eqz v9, :cond_24

    .line 117
    new-instance v9, Landroid/graphics/PointF;

    invoke-virtual {v15}, Lcom/momo/mcamera/mask/Sticker;->getCenterIndex()I

    move-result v10

    aget v10, v18, v10

    .line 118
    invoke-virtual {v15}, Lcom/momo/mcamera/mask/Sticker;->getCenterIndex()I

    move-result v20

    add-int/lit8 v20, v20, 0x44

    move/from16 v21, v12

    aget v12, v18, v20

    invoke-direct {v9, v10, v12}, Landroid/graphics/PointF;-><init>(FF)V

    move/from16 v18, v3

    goto :goto_8

    :cond_24
    move/from16 v21, v12

    .line 119
    invoke-virtual {v15}, Lcom/momo/mcamera/mask/Sticker;->getPointIndexes()[I

    move-result-object v9

    array-length v9, v9

    if-ne v9, v5, :cond_25

    .line 120
    invoke-virtual {v15}, Lcom/momo/mcamera/mask/Sticker;->getPointIndexes()[I

    move-result-object v9

    aget v9, v9, v17

    .line 121
    aget v10, v18, v9

    add-int/lit8 v9, v9, 0x44

    .line 122
    aget v9, v18, v9

    .line 123
    new-instance v12, Landroid/graphics/PointF;

    invoke-direct {v12, v10, v9}, Landroid/graphics/PointF;-><init>(FF)V

    move/from16 v18, v3

    move-object v9, v12

    goto :goto_8

    .line 124
    :cond_25
    invoke-virtual {v15}, Lcom/momo/mcamera/mask/Sticker;->getPointIndexes()[I

    move-result-object v9

    aget v9, v9, v17

    .line 125
    invoke-virtual {v15}, Lcom/momo/mcamera/mask/Sticker;->getPointIndexes()[I

    move-result-object v10

    aget v10, v10, v5

    .line 126
    aget v12, v18, v9

    add-int/lit8 v9, v9, 0x44

    .line 127
    aget v9, v18, v9

    .line 128
    aget v5, v18, v10

    add-int/lit8 v10, v10, 0x44

    .line 129
    aget v10, v18, v10

    move/from16 v18, v3

    .line 130
    new-instance v3, Landroid/graphics/PointF;

    invoke-direct {v3, v12, v9}, Landroid/graphics/PointF;-><init>(FF)V

    new-instance v9, Landroid/graphics/PointF;

    invoke-direct {v9, v5, v10}, Landroid/graphics/PointF;-><init>(FF)V

    invoke-virtual {v0, v3, v9}, Lcom/momo/mcamera/mask/StickerGroupFilter;->getCenterPoint(Landroid/graphics/PointF;Landroid/graphics/PointF;)Landroid/graphics/PointF;

    move-result-object v9

    .line 131
    :goto_8
    invoke-virtual {v0, v11, v7}, Lcom/momo/mcamera/mask/StickerGroupFilter;->getmDistancePoint(Landroid/graphics/PointF;Landroid/graphics/PointF;)D

    move-result-wide v10

    double-to-float v3, v10

    const/high16 v5, 0x43340000    # 180.0f

    div-float/2addr v3, v5

    .line 132
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->getAdjustWidthScale()F

    move-result v7

    div-float v7, v3, v7

    .line 133
    invoke-virtual {v0}, Ll/wej;->getWidth()I

    move-result v10

    div-int/lit8 v10, v10, 0x2

    int-to-float v10, v10

    .line 134
    invoke-virtual {v15}, Lcom/momo/mcamera/mask/Sticker;->getImageWidth()I

    move-result v11

    int-to-float v11, v11

    invoke-virtual {v0}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->getAdjustWidthScale()F

    move-result v12

    mul-float/2addr v11, v12

    div-float/2addr v11, v10

    mul-float/2addr v7, v11

    .line 135
    iget v10, v9, Landroid/graphics/PointF;->x:F

    iget v11, v8, Landroid/graphics/PointF;->x:F

    mul-float/2addr v11, v3

    .line 136
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->getAdjustWidthScale()F

    move-result v12

    div-float/2addr v11, v12

    add-float/2addr v10, v11

    iput v10, v9, Landroid/graphics/PointF;->x:F

    .line 137
    iget v10, v9, Landroid/graphics/PointF;->y:F

    iget v8, v8, Landroid/graphics/PointF;->y:F

    mul-float/2addr v8, v3

    .line 138
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->getAdjustWidthScale()F

    move-result v3

    div-float/2addr v8, v3

    add-float/2addr v10, v8

    iput v10, v9, Landroid/graphics/PointF;->y:F

    .line 139
    new-instance v3, Landroid/graphics/PointF;

    iget v8, v9, Landroid/graphics/PointF;->x:F

    invoke-virtual {v0}, Ll/wej;->getWidth()I

    move-result v10

    int-to-float v10, v10

    div-float/2addr v8, v10

    iget v9, v9, Landroid/graphics/PointF;->y:F

    .line 140
    invoke-virtual {v0}, Ll/wej;->getHeight()I

    move-result v10

    int-to-float v10, v10

    div-float/2addr v9, v10

    invoke-direct {v3, v8, v9}, Landroid/graphics/PointF;-><init>(FF)V

    .line 141
    iput v7, v4, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->scaleW:F

    .line 142
    iput v7, v4, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->scaleH:F

    .line 143
    invoke-virtual {v15}, Lcom/momo/mcamera/mask/Sticker;->isComic()Z

    move-result v7

    if-eqz v7, :cond_29

    .line 144
    iput-object v3, v4, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->centerPoint:Landroid/graphics/PointF;

    const/high16 v3, 0x42b40000    # 90.0f

    cmpg-float v3, v6, v3

    const/4 v7, 0x0

    if-gtz v3, :cond_26

    cmpl-float v3, v6, v7

    if-gez v3, :cond_27

    :cond_26
    const/high16 v3, 0x43870000    # 270.0f

    cmpl-float v3, v6, v3

    if-ltz v3, :cond_28

    const/high16 v3, 0x43b40000    # 360.0f

    cmpg-float v3, v6, v3

    if-gtz v3, :cond_28

    .line 145
    :cond_27
    iput v7, v4, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->angle:F

    :goto_9
    move/from16 v3, v17

    goto :goto_a

    .line 146
    :cond_28
    iput v5, v4, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->angle:F

    goto :goto_9

    .line 147
    :cond_29
    iput-object v3, v4, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->centerPoint:Landroid/graphics/PointF;

    .line 148
    iput v6, v4, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->angle:F

    goto :goto_9

    .line 149
    :goto_a
    invoke-virtual {v1, v3}, Ll/omw;->j(I)Ll/nuf;

    move-result-object v5

    invoke-virtual {v5}, Ll/nuf;->l()[F

    move-result-object v5

    iput-object v5, v4, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->points68:[F

    .line 150
    invoke-virtual {v1, v3}, Ll/omw;->j(I)Ll/nuf;

    move-result-object v5

    invoke-virtual {v5}, Ll/nuf;->m()[F

    move-result-object v5

    iput-object v5, v4, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->points96:[F

    .line 151
    invoke-virtual {v1, v3}, Ll/omw;->j(I)Ll/nuf;

    move-result-object v5

    invoke-virtual {v5}, Ll/nuf;->j()[F

    move-result-object v5

    iput-object v5, v4, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->points104:[F

    .line 152
    invoke-virtual {v1, v3}, Ll/omw;->j(I)Ll/nuf;

    move-result-object v5

    invoke-virtual {v5}, Ll/nuf;->z()[F

    move-result-object v3

    if-eqz v3, :cond_2a

    .line 153
    array-length v5, v3

    if-lez v5, :cond_2a

    .line 154
    iput-object v3, v4, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->warpedPoints104:[F

    .line 155
    :cond_2a
    iget-object v3, v0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->filterTriggerManager:Lcom/momo/mcamera/mask/FilterTriggerManager;

    iput-object v3, v4, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->filterTrigerManager:Lcom/momo/mcamera/mask/FilterTriggerManager;

    const/4 v3, 0x0

    .line 156
    invoke-virtual {v1, v3}, Ll/omw;->j(I)Ll/nuf;

    move-result-object v5

    invoke-virtual {v5}, Ll/nuf;->c()[F

    move-result-object v5

    iput-object v5, v4, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->euler_angles:[F

    .line 157
    invoke-virtual {v14, v4}, Lcom/momo/mcamera/mask/StickerBlendFilter;->setDetectParam(Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V

    :goto_b
    move v6, v3

    move/from16 v4, v16

    move/from16 v3, v18

    move/from16 v12, v21

    const/4 v5, 0x1

    const/4 v7, 0x7

    const/4 v8, 0x6

    const/4 v9, 0x5

    const/16 v10, 0x63

    const/4 v11, 0x3

    goto/16 :goto_6

    :cond_2b
    move/from16 v18, v3

    move/from16 v16, v4

    move v3, v6

    move/from16 v21, v12

    add-int/lit8 v4, v18, -0x1

    move v3, v4

    move/from16 v4, v16

    const/4 v5, 0x1

    const/4 v7, 0x7

    const/4 v8, 0x6

    const/4 v9, 0x5

    const/16 v10, 0x63

    const/4 v11, 0x3

    goto/16 :goto_5

    .line 158
    :cond_2c
    :goto_c
    monitor-exit v2

    return-void

    :goto_d
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public setScaleHeight(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->scaleHeight:I

    .line 2
    .line 3
    return-void
.end method

.method public setScaleWidth(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->scaleWidth:I

    .line 2
    .line 3
    return-void
.end method

.method public setStickerStateChangeListener(Lcom/momo/mcamera/mask/StickerBlendFilter$StickerStateChangeListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->stickerStateChangeListener:Lcom/momo/mcamera/mask/StickerBlendFilter$StickerStateChangeListener;

    .line 2
    .line 3
    return-void
.end method

.method public setThinFace(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mThinFace:F

    .line 2
    .line 3
    return-void
.end method

.method public setTimeStamp(J)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mStickerFilterMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Lcom/momo/mcamera/mask/StickerBlendFilter;

    .line 22
    .line 23
    invoke-virtual {v1, p1, p2}, Lcom/momo/mcamera/mask/StickerBlendFilter;->setTimeStamp(J)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mMultiStickerMaskFilter:Lcom/momo/mcamera/mask/MultiStickerMaskFilter;

    .line 28
    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    invoke-virtual {v0, p1, p2}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->setTimeStamp(J)V

    .line 32
    .line 33
    .line 34
    :cond_1
    iget-boolean v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->enableSelfRender:Z

    .line 35
    .line 36
    if-eqz v0, :cond_2

    .line 37
    .line 38
    new-instance v0, Ll/omw;

    .line 39
    .line 40
    invoke-direct {v0}, Ll/omw;-><init>()V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0, v0}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->setMMCVInfo(Ll/omw;)V

    .line 44
    .line 45
    .line 46
    :cond_2
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mEffectGroupFilter:Lcom/momo/mcamera/mask/EffectGroupFilter;

    .line 47
    .line 48
    if-eqz v0, :cond_4

    .line 49
    .line 50
    iget-wide v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mLastRenderTime:J

    .line 51
    .line 52
    const-wide/16 v2, 0x0

    .line 53
    .line 54
    cmp-long v0, v0, v2

    .line 55
    .line 56
    if-nez v0, :cond_3

    .line 57
    .line 58
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 59
    .line 60
    .line 61
    move-result-wide v0

    .line 62
    iput-wide v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mLastRenderTime:J

    .line 63
    .line 64
    :cond_3
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mEffectGroupFilter:Lcom/momo/mcamera/mask/EffectGroupFilter;

    .line 65
    .line 66
    iget-wide v1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mLastRenderTime:J

    .line 67
    .line 68
    sub-long/2addr p1, v1

    .line 69
    invoke-virtual {v0, p1, p2}, Lcom/momo/mcamera/mask/EffectGroupFilter;->setTimeStamp(J)V

    .line 70
    .line 71
    .line 72
    :cond_4
    return-void
.end method

.method public setVoiceBytes([B)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/gfj;->listLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mSoundInput:Lcom/momo/mcamera/mask/SoundInputFilter;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/SoundInputFilter;->setSoundBytes([B)V

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

.method public setplayStatusListener(Ll/aqw;)V
    .locals 0

    .line 1
    return-void
.end method

.method public startExpressDetect(Ljava/lang/String;)V
    .locals 2

    .line 1
    const-string v0, "FilterProcess"

    .line 2
    .line 3
    const-string v1, "StickerAdjustFilter startExpressDetect"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->expressDetector:Lcom/momo/mcamera/mask/express/ExpressDetector;

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    new-instance v0, Lcom/momo/mcamera/mask/express/ExpressDetector;

    .line 13
    .line 14
    invoke-direct {v0}, Lcom/momo/mcamera/mask/express/ExpressDetector;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->expressDetector:Lcom/momo/mcamera/mask/express/ExpressDetector;

    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->expressDetector:Lcom/momo/mcamera/mask/express/ExpressDetector;

    .line 20
    .line 21
    invoke-virtual {v0, p1}, Lcom/momo/mcamera/mask/express/ExpressDetector;->setModelPath(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->expressDetector:Lcom/momo/mcamera/mask/express/ExpressDetector;

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/express/ExpressDetector;->startDetect()V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public startGestureDetect()V
    .locals 1

    const/4 v0, 0x0

    .line 138
    invoke-virtual {p0, v0, v0}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->startGestureDetect(ZI)V

    return-void
.end method

.method public startGestureDetect(ZI)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "StickerAdjustFilter startGestureDetect useNewVersion "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, " handGestureType = "

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "FilterProcess"

    .line 24
    .line 25
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-static {}, Lcom/core/glcore/datadot/DataDotUtils;->getInstance()Lcom/core/glcore/datadot/DataDotUtils;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0}, Lcom/core/glcore/datadot/DataDotUtils;->getRecoderDataDotInfo()Lcom/core/glcore/datadot/RecoderDataDotInfo;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    const/4 v1, 0x1

    .line 37
    invoke-virtual {v0, v1}, Lcom/core/glcore/datadot/RecoderDataDotInfo;->setCameraUseHandGesture(Z)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->gestureDetectorListener:Lcom/momo/mcamera/mask/gesture/CVDetector$GestureDetectorListener;

    .line 41
    .line 42
    if-nez v0, :cond_0

    .line 43
    .line 44
    new-instance v0, Lcom/momo/mcamera/mask/StickerAdjustFilter$1;

    .line 45
    .line 46
    invoke-direct {v0, p0}, Lcom/momo/mcamera/mask/StickerAdjustFilter$1;-><init>(Lcom/momo/mcamera/mask/StickerAdjustFilter;)V

    .line 47
    .line 48
    .line 49
    iput-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->gestureDetectorListener:Lcom/momo/mcamera/mask/gesture/CVDetector$GestureDetectorListener;

    .line 50
    .line 51
    :cond_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->gestureDetector:Lcom/momo/mcamera/mask/gesture/CVDetector;

    .line 52
    .line 53
    if-nez v0, :cond_2

    .line 54
    .line 55
    if-nez p1, :cond_1

    .line 56
    .line 57
    new-instance p1, Lcom/momo/mcamera/mask/gesture/GestureDetector;

    .line 58
    .line 59
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->gestureDetectorListener:Lcom/momo/mcamera/mask/gesture/CVDetector$GestureDetectorListener;

    .line 60
    .line 61
    invoke-direct {p1, v0}, Lcom/momo/mcamera/mask/gesture/GestureDetector;-><init>(Lcom/momo/mcamera/mask/gesture/CVDetector$GestureDetectorListener;)V

    .line 62
    .line 63
    .line 64
    iput-object p1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->gestureDetector:Lcom/momo/mcamera/mask/gesture/CVDetector;

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_1
    new-instance p1, Lcom/momo/mcamera/mask/gesture/NewHandGestureDetector;

    .line 68
    .line 69
    invoke-direct {p1}, Lcom/momo/mcamera/mask/gesture/NewHandGestureDetector;-><init>()V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->gestureDetectorListener:Lcom/momo/mcamera/mask/gesture/CVDetector$GestureDetectorListener;

    .line 73
    .line 74
    invoke-virtual {p1, v0}, Lcom/momo/mcamera/mask/gesture/CVDetector;->setGestureDetectorListener(Lcom/momo/mcamera/mask/gesture/CVDetector$GestureDetectorListener;)V

    .line 75
    .line 76
    .line 77
    iput-object p1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->gestureDetector:Lcom/momo/mcamera/mask/gesture/CVDetector;

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_2
    instance-of v1, v0, Lcom/momo/mcamera/mask/gesture/GestureDetector;

    .line 81
    .line 82
    if-eqz v1, :cond_3

    .line 83
    .line 84
    if-eqz p1, :cond_3

    .line 85
    .line 86
    new-instance p1, Lcom/momo/mcamera/mask/gesture/NewHandGestureDetector;

    .line 87
    .line 88
    invoke-direct {p1}, Lcom/momo/mcamera/mask/gesture/NewHandGestureDetector;-><init>()V

    .line 89
    .line 90
    .line 91
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->gestureDetectorListener:Lcom/momo/mcamera/mask/gesture/CVDetector$GestureDetectorListener;

    .line 92
    .line 93
    invoke-virtual {p1, v0}, Lcom/momo/mcamera/mask/gesture/CVDetector;->setGestureDetectorListener(Lcom/momo/mcamera/mask/gesture/CVDetector$GestureDetectorListener;)V

    .line 94
    .line 95
    .line 96
    iput-object p1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->gestureDetector:Lcom/momo/mcamera/mask/gesture/CVDetector;

    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_3
    instance-of v0, v0, Lcom/momo/mcamera/mask/gesture/NewHandGestureDetector;

    .line 100
    .line 101
    if-eqz v0, :cond_4

    .line 102
    .line 103
    if-nez p1, :cond_4

    .line 104
    .line 105
    new-instance p1, Lcom/momo/mcamera/mask/gesture/GestureDetector;

    .line 106
    .line 107
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->gestureDetectorListener:Lcom/momo/mcamera/mask/gesture/CVDetector$GestureDetectorListener;

    .line 108
    .line 109
    invoke-direct {p1, v0}, Lcom/momo/mcamera/mask/gesture/GestureDetector;-><init>(Lcom/momo/mcamera/mask/gesture/CVDetector$GestureDetectorListener;)V

    .line 110
    .line 111
    .line 112
    iput-object p1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->gestureDetector:Lcom/momo/mcamera/mask/gesture/CVDetector;

    .line 113
    .line 114
    :cond_4
    :goto_0
    iget-object p1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->gestureDetector:Lcom/momo/mcamera/mask/gesture/CVDetector;

    .line 115
    .line 116
    instance-of v0, p1, Lcom/momo/mcamera/mask/gesture/NewHandGestureDetector;

    .line 117
    .line 118
    if-eqz v0, :cond_5

    .line 119
    .line 120
    check-cast p1, Lcom/momo/mcamera/mask/gesture/NewHandGestureDetector;

    .line 121
    .line 122
    invoke-virtual {p1, p2}, Lcom/momo/mcamera/mask/gesture/NewHandGestureDetector;->setHandGestureType(I)V

    .line 123
    .line 124
    .line 125
    :cond_5
    iget-object p1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->gestureDetector:Lcom/momo/mcamera/mask/gesture/CVDetector;

    .line 126
    .line 127
    iget-object p2, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->gestureDetectorListener:Lcom/momo/mcamera/mask/gesture/CVDetector$GestureDetectorListener;

    .line 128
    .line 129
    invoke-virtual {p1, p2}, Lcom/momo/mcamera/mask/gesture/CVDetector;->setGestureDetectorListener(Lcom/momo/mcamera/mask/gesture/CVDetector$GestureDetectorListener;)V

    .line 130
    .line 131
    .line 132
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->gestureDetector:Lcom/momo/mcamera/mask/gesture/CVDetector;

    .line 133
    .line 134
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/gesture/CVDetector;->startDetect()V

    .line 135
    .line 136
    .line 137
    return-void
.end method

.method public startPlayingTailMoving()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mMultiStickerMaskFilter:Lcom/momo/mcamera/mask/MultiStickerMaskFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    instance-of v0, p0, Lcom/momo/mcamera/mask/MultiStickerGameMaskFilter;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    check-cast p0, Lcom/momo/mcamera/mask/MultiStickerGameMaskFilter;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/MultiStickerGameMaskFilter;->playingTailMoving()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public stopExpressDetect()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->expressDetector:Lcom/momo/mcamera/mask/express/ExpressDetector;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const-string v0, "FilterProcess"

    .line 6
    .line 7
    const-string v1, "StickerAdjustFilter stopExpressDetect"

    .line 8
    .line 9
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->expressDetector:Lcom/momo/mcamera/mask/express/ExpressDetector;

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/express/ExpressDetector;->stopDetect()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public stopGestureDetect()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->gestureDetector:Lcom/momo/mcamera/mask/gesture/CVDetector;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const-string v0, "FilterProcess"

    .line 6
    .line 7
    const-string v1, "StickerAdjustFilter stopGestureDetect "

    .line 8
    .line 9
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mmcvBoxes:Lcom/core/glcore/cv/MMCVBoxes;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->gestureDetector:Lcom/momo/mcamera/mask/gesture/CVDetector;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/gesture/CVDetector;->stopDetect()V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public switchCamera(Z)V
    .locals 2

    .line 1
    const-string v0, "FilterProcess"

    .line 2
    .line 3
    const-string v1, "StickerAdjustFilter switchCamera "

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->isCameraFront:Z

    .line 9
    .line 10
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->face3DMaskFilters:Ljava/util/List;

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-lez v0, :cond_0

    .line 19
    .line 20
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->face3DMaskFilters:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    check-cast v0, Lcom/momo/mcamera/mask/Face3DMaskFilter;

    .line 37
    .line 38
    invoke-virtual {v0, p1}, Lcom/momo/mcamera/mask/Face3DMaskFilter;->setCamera(Z)V

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    return-void
.end method

.method public unlockTexture()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mStickerFilterMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Lcom/momo/mcamera/mask/StickerBlendFilter;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/StickerBlendFilter;->unlockTexture()V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    return-void
.end method

.method public updateGameFixStickerScore(Landroid/graphics/Bitmap;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->isBitmapValid(Landroid/graphics/Bitmap;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mMultiStickerMaskFilter:Lcom/momo/mcamera/mask/MultiStickerMaskFilter;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    instance-of v0, p0, Lcom/momo/mcamera/mask/MultiStickerGameMaskFilter;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    check-cast p0, Lcom/momo/mcamera/mask/MultiStickerGameMaskFilter;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/MultiStickerGameMaskFilter;->updateGameFixStickerScore(Landroid/graphics/Bitmap;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public updateRectForTrigger(Landroid/graphics/PointF;FFZI)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/gfj;->getLockObject()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p4

    .line 5
    monitor-enter p4

    .line 6
    :try_start_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mMultiStickerMaskFilter:Lcom/momo/mcamera/mask/MultiStickerMaskFilter;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    new-instance v0, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;

    .line 11
    .line 12
    invoke-direct {v0}, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;-><init>()V

    .line 13
    .line 14
    .line 15
    iput p2, v0, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->angle:F

    .line 16
    .line 17
    new-instance p2, Landroid/graphics/PointF;

    .line 18
    .line 19
    iget v1, p1, Landroid/graphics/PointF;->x:F

    .line 20
    .line 21
    iget p1, p1, Landroid/graphics/PointF;->y:F

    .line 22
    .line 23
    invoke-direct {p2, v1, p1}, Landroid/graphics/PointF;-><init>(FF)V

    .line 24
    .line 25
    .line 26
    iput-object p2, v0, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->centerPoint:Landroid/graphics/PointF;

    .line 27
    .line 28
    const-string p1, "tracking_rect"

    .line 29
    .line 30
    iput-object p1, v0, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->triggerType:Ljava/lang/String;

    .line 31
    .line 32
    const/high16 p1, 0x3f000000    # 0.5f

    .line 33
    .line 34
    mul-float/2addr p3, p1

    .line 35
    iput p3, v0, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->scaleH:F

    .line 36
    .line 37
    iput p3, v0, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->scaleW:F

    .line 38
    .line 39
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mMultiStickerMaskFilter:Lcom/momo/mcamera/mask/MultiStickerMaskFilter;

    .line 40
    .line 41
    invoke-virtual {p0, v0, p5}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->setHaniStickerParam(Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;I)V

    .line 42
    .line 43
    .line 44
    monitor-exit p4

    .line 45
    return-void

    .line 46
    :catchall_0
    move-exception p0

    .line 47
    goto :goto_0

    .line 48
    :cond_0
    monitor-exit p4

    .line 49
    return-void

    .line 50
    :goto_0
    monitor-exit p4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 51
    throw p0
.end method
