.class public Lcom/momo/mcamera/mask/StickerGestureTrackingFilter;
.super Lcom/momo/mcamera/mask/StickerMaskFilter;
.source "SourceFile"


# static fields
.field private static final DEFAULT_GESTURE_WIDTH:F = 180.0f

.field private static final DETECT_MISS_COUNT:I = 0x3


# instance fields
.field private currentCenter:Landroid/graphics/PointF;

.field private currentRect:Landroid/graphics/RectF;

.field private gestureMiss:I

.field private hasGestureRect:Z

.field private mTracker:Lcom/momocv/objecttracker/ObjectTracker;

.field private mmFrame:Ll/umw;

.field private mmcvInfo:Ll/omw;

.field private mmcvRect:Lcom/momocv/MMRect;

.field private volatile startTracking:Z

.field private trackerInfo:Lcom/momocv/objecttracker/ObjectTrackerInfo;

.field private trackerParams:Lcom/momocv/objecttracker/ObjectTrackerParams;

.field private volatile trackingInit:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/momo/mcamera/mask/Sticker;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, v0}, Lcom/momo/mcamera/mask/StickerMaskFilter;-><init>(Landroid/content/Context;Lcom/momo/mcamera/mask/Sticker;Lcom/momo/mcamera/mask/delegate/ImageDelegateProvider;)V

    .line 3
    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/StickerGestureTrackingFilter;->hasGestureRect:Z

    .line 7
    .line 8
    iput-object v0, p0, Lcom/momo/mcamera/mask/StickerGestureTrackingFilter;->currentRect:Landroid/graphics/RectF;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/momo/mcamera/mask/StickerGestureTrackingFilter;->currentCenter:Landroid/graphics/PointF;

    .line 11
    .line 12
    new-instance p1, Lcom/momocv/objecttracker/ObjectTracker;

    .line 13
    .line 14
    invoke-direct {p1}, Lcom/momocv/objecttracker/ObjectTracker;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object p1, p0, Lcom/momo/mcamera/mask/StickerGestureTrackingFilter;->mTracker:Lcom/momocv/objecttracker/ObjectTracker;

    .line 18
    .line 19
    new-instance p1, Ll/umw;

    .line 20
    .line 21
    invoke-direct {p1}, Ll/umw;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object p1, p0, Lcom/momo/mcamera/mask/StickerGestureTrackingFilter;->mmFrame:Ll/umw;

    .line 25
    .line 26
    new-instance p1, Lcom/momocv/objecttracker/ObjectTrackerParams;

    .line 27
    .line 28
    invoke-direct {p1}, Lcom/momocv/objecttracker/ObjectTrackerParams;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object p1, p0, Lcom/momo/mcamera/mask/StickerGestureTrackingFilter;->trackerParams:Lcom/momocv/objecttracker/ObjectTrackerParams;

    .line 32
    .line 33
    new-instance p1, Lcom/momocv/objecttracker/ObjectTrackerInfo;

    .line 34
    .line 35
    invoke-direct {p1}, Lcom/momocv/objecttracker/ObjectTrackerInfo;-><init>()V

    .line 36
    .line 37
    .line 38
    iput-object p1, p0, Lcom/momo/mcamera/mask/StickerGestureTrackingFilter;->trackerInfo:Lcom/momocv/objecttracker/ObjectTrackerInfo;

    .line 39
    .line 40
    return-void
.end method

.method private adjustRectF(Landroid/graphics/RectF;)V
    .locals 4

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerMaskFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/Sticker;->getTrackingRegion()Lcom/momo/mcamera/mask/bean/ObjectRegion;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget v1, p0, Lcom/momo/mcamera/mask/bean/ObjectRegion;->w:F

    .line 12
    .line 13
    div-float/2addr v0, v1

    .line 14
    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    iget v2, p0, Lcom/momo/mcamera/mask/bean/ObjectRegion;->h:F

    .line 19
    .line 20
    div-float/2addr v1, v2

    .line 21
    iget v2, p1, Landroid/graphics/RectF;->left:F

    .line 22
    .line 23
    iget v3, p0, Lcom/momo/mcamera/mask/bean/ObjectRegion;->x:F

    .line 24
    .line 25
    mul-float/2addr v3, v0

    .line 26
    sub-float/2addr v2, v3

    .line 27
    iput v2, p1, Landroid/graphics/RectF;->left:F

    .line 28
    .line 29
    iget v3, p1, Landroid/graphics/RectF;->top:F

    .line 30
    .line 31
    iget p0, p0, Lcom/momo/mcamera/mask/bean/ObjectRegion;->y:F

    .line 32
    .line 33
    mul-float/2addr p0, v1

    .line 34
    sub-float/2addr v3, p0

    .line 35
    iput v3, p1, Landroid/graphics/RectF;->top:F

    .line 36
    .line 37
    add-float/2addr v2, v0

    .line 38
    iput v2, p1, Landroid/graphics/RectF;->right:F

    .line 39
    .line 40
    add-float/2addr v3, v1

    .line 41
    iput v3, p1, Landroid/graphics/RectF;->bottom:F

    .line 42
    .line 43
    return-void
.end method

.method private log(Ljava/lang/String;Lcom/momocv/MMRect;)V
    .locals 0

    return-void
.end method

.method private trackingUpdate()V
    .locals 6

    .line 1
    iget-boolean v0, p0, Lcom/momo/mcamera/mask/StickerGestureTrackingFilter;->startTracking:Z

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerGestureTrackingFilter;->mmcvRect:Lcom/momocv/MMRect;

    .line 6
    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerGestureTrackingFilter;->mmcvInfo:Ll/omw;

    .line 10
    .line 11
    if-eqz v0, :cond_2

    .line 12
    .line 13
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerGestureTrackingFilter;->mmFrame:Ll/umw;

    .line 14
    .line 15
    const/16 v1, 0x11

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ll/umw;->h(I)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerGestureTrackingFilter;->mmFrame:Ll/umw;

    .line 21
    .line 22
    iget v1, p0, Ll/wej;->width:I

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ll/umw;->l(I)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerGestureTrackingFilter;->mmFrame:Ll/umw;

    .line 28
    .line 29
    iget v1, p0, Ll/wej;->width:I

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ll/umw;->m(I)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerGestureTrackingFilter;->mmFrame:Ll/umw;

    .line 35
    .line 36
    iget v1, p0, Ll/wej;->height:I

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Ll/umw;->j(I)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerGestureTrackingFilter;->trackerParams:Lcom/momocv/objecttracker/ObjectTrackerParams;

    .line 42
    .line 43
    iget-object v1, p0, Lcom/momo/mcamera/mask/StickerGestureTrackingFilter;->mmcvRect:Lcom/momocv/MMRect;

    .line 44
    .line 45
    iput-object v1, v0, Lcom/momocv/objecttracker/ObjectTrackerParams;->rect_:Lcom/momocv/MMRect;

    .line 46
    .line 47
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerGestureTrackingFilter;->trackerInfo:Lcom/momocv/objecttracker/ObjectTrackerInfo;

    .line 48
    .line 49
    iput-object v1, v0, Lcom/momocv/objecttracker/ObjectTrackerInfo;->rect_:Lcom/momocv/MMRect;

    .line 50
    .line 51
    iget-boolean v0, p0, Lcom/momo/mcamera/mask/StickerGestureTrackingFilter;->trackingInit:Z

    .line 52
    .line 53
    iget-object v1, p0, Lcom/momo/mcamera/mask/StickerGestureTrackingFilter;->mTracker:Lcom/momocv/objecttracker/ObjectTracker;

    .line 54
    .line 55
    if-nez v0, :cond_0

    .line 56
    .line 57
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerGestureTrackingFilter;->mmFrame:Ll/umw;

    .line 58
    .line 59
    invoke-virtual {v0}, Ll/umw;->b()Lcom/momocv/MMFrame;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    iget-object v2, p0, Lcom/momo/mcamera/mask/StickerGestureTrackingFilter;->trackerParams:Lcom/momocv/objecttracker/ObjectTrackerParams;

    .line 64
    .line 65
    invoke-virtual {v1, v0, v2}, Lcom/momocv/objecttracker/ObjectTracker;->ReInit(Lcom/momocv/MMFrame;Lcom/momocv/objecttracker/ObjectTrackerParams;)Z

    .line 66
    .line 67
    .line 68
    const/4 v0, 0x1

    .line 69
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/StickerGestureTrackingFilter;->trackingInit:Z

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerGestureTrackingFilter;->mmFrame:Ll/umw;

    .line 73
    .line 74
    invoke-virtual {v0}, Ll/umw;->b()Lcom/momocv/MMFrame;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    iget-object v2, p0, Lcom/momo/mcamera/mask/StickerGestureTrackingFilter;->trackerParams:Lcom/momocv/objecttracker/ObjectTrackerParams;

    .line 79
    .line 80
    iget-object v3, p0, Lcom/momo/mcamera/mask/StickerGestureTrackingFilter;->trackerInfo:Lcom/momocv/objecttracker/ObjectTrackerInfo;

    .line 81
    .line 82
    invoke-virtual {v1, v0, v2, v3}, Lcom/momocv/objecttracker/ObjectTracker;->Update(Lcom/momocv/MMFrame;Lcom/momocv/objecttracker/ObjectTrackerParams;Lcom/momocv/objecttracker/ObjectTrackerInfo;)Z

    .line 83
    .line 84
    .line 85
    :goto_0
    new-instance v0, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;

    .line 86
    .line 87
    invoke-direct {v0}, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;-><init>()V

    .line 88
    .line 89
    .line 90
    new-instance v1, Landroid/graphics/PointF;

    .line 91
    .line 92
    const/4 v2, 0x0

    .line 93
    invoke-direct {v1, v2, v2}, Landroid/graphics/PointF;-><init>(FF)V

    .line 94
    .line 95
    .line 96
    iput-object v1, v0, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->centerPoint:Landroid/graphics/PointF;

    .line 97
    .line 98
    new-instance v1, Landroid/graphics/RectF;

    .line 99
    .line 100
    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    .line 101
    .line 102
    .line 103
    iget-object v2, p0, Lcom/momo/mcamera/mask/StickerGestureTrackingFilter;->trackerInfo:Lcom/momocv/objecttracker/ObjectTrackerInfo;

    .line 104
    .line 105
    iget-object v2, v2, Lcom/momocv/objecttracker/ObjectTrackerInfo;->rect_:Lcom/momocv/MMRect;

    .line 106
    .line 107
    iget v3, v2, Lcom/momocv/MMRect;->x_:I

    .line 108
    .line 109
    int-to-float v4, v3

    .line 110
    iput v4, v1, Landroid/graphics/RectF;->left:F

    .line 111
    .line 112
    iget v4, v2, Lcom/momocv/MMRect;->y_:I

    .line 113
    .line 114
    int-to-float v5, v4

    .line 115
    iput v5, v1, Landroid/graphics/RectF;->top:F

    .line 116
    .line 117
    iget v5, v2, Lcom/momocv/MMRect;->width_:I

    .line 118
    .line 119
    add-int/2addr v3, v5

    .line 120
    int-to-float v3, v3

    .line 121
    iput v3, v1, Landroid/graphics/RectF;->right:F

    .line 122
    .line 123
    iget v2, v2, Lcom/momocv/MMRect;->height_:I

    .line 124
    .line 125
    add-int/2addr v4, v2

    .line 126
    int-to-float v2, v4

    .line 127
    iput v2, v1, Landroid/graphics/RectF;->bottom:F

    .line 128
    .line 129
    iget-object v2, p0, Lcom/momo/mcamera/mask/StickerMaskFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 130
    .line 131
    invoke-virtual {v2}, Lcom/momo/mcamera/mask/Sticker;->getTrackingRegion()Lcom/momo/mcamera/mask/bean/ObjectRegion;

    .line 132
    .line 133
    .line 134
    move-result-object v2

    .line 135
    if-eqz v2, :cond_1

    .line 136
    .line 137
    invoke-direct {p0, v1}, Lcom/momo/mcamera/mask/StickerGestureTrackingFilter;->adjustRectF(Landroid/graphics/RectF;)V

    .line 138
    .line 139
    .line 140
    :cond_1
    iput-object v1, v0, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->gestureRect:Landroid/graphics/RectF;

    .line 141
    .line 142
    invoke-virtual {p0, v0}, Lcom/momo/mcamera/mask/StickerGestureTrackingFilter;->setDetectParam(Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V

    .line 143
    .line 144
    .line 145
    return-void

    .line 146
    :cond_2
    const/4 v0, 0x0

    .line 147
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/StickerGestureTrackingFilter;->trackingInit:Z

    .line 148
    .line 149
    return-void
.end method


# virtual methods
.method public destroy()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/momo/mcamera/mask/StickerMaskFilter;->destroy()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerGestureTrackingFilter;->mTracker:Lcom/momocv/objecttracker/ObjectTracker;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/momocv/objecttracker/ObjectTracker;->Release()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public gestureMiss()V
    .locals 3

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
    iget v1, p0, Lcom/momo/mcamera/mask/StickerGestureTrackingFilter;->gestureMiss:I

    .line 7
    .line 8
    add-int/lit8 v1, v1, 0x1

    .line 9
    .line 10
    iput v1, p0, Lcom/momo/mcamera/mask/StickerGestureTrackingFilter;->gestureMiss:I

    .line 11
    .line 12
    const/4 v2, 0x3

    .line 13
    if-lt v1, v2, :cond_0

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    iput v1, p0, Lcom/momo/mcamera/mask/StickerGestureTrackingFilter;->gestureMiss:I

    .line 17
    .line 18
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/StickerGestureTrackingFilter;->startTracking:Z

    .line 19
    .line 20
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/StickerGestureTrackingFilter;->trackingInit:Z

    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    iput-object v1, p0, Lcom/momo/mcamera/mask/StickerGestureTrackingFilter;->mmcvRect:Lcom/momocv/MMRect;

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/StickerGestureTrackingFilter;->pauseBitmapCache()V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :catchall_0
    move-exception p0

    .line 30
    goto :goto_1

    .line 31
    :cond_0
    :goto_0
    monitor-exit v0

    .line 32
    return-void

    .line 33
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 34
    throw p0
.end method

.method public getAdjustWidthScale()F
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    int-to-float p0, p0

    .line 6
    const/high16 v0, 0x43f00000    # 480.0f

    .line 7
    .line 8
    cmpl-float p0, p0, v0

    .line 9
    .line 10
    if-nez p0, :cond_0

    .line 11
    .line 12
    const/high16 p0, 0x3f800000    # 1.0f

    .line 13
    .line 14
    return p0

    .line 15
    :cond_0
    const/high16 p0, 0x3fc00000    # 1.5f

    .line 16
    .line 17
    return p0
.end method

.method public getCenterPoint(Landroid/graphics/PointF;Landroid/graphics/PointF;)Landroid/graphics/PointF;
    .locals 2

    .line 1
    iget p0, p1, Landroid/graphics/PointF;->x:F

    .line 2
    .line 3
    iget v0, p2, Landroid/graphics/PointF;->x:F

    .line 4
    .line 5
    sub-float/2addr v0, p0

    .line 6
    const/high16 v1, 0x40000000    # 2.0f

    .line 7
    .line 8
    div-float/2addr v0, v1

    .line 9
    add-float/2addr p0, v0

    .line 10
    iget p1, p1, Landroid/graphics/PointF;->y:F

    .line 11
    .line 12
    iget p2, p2, Landroid/graphics/PointF;->y:F

    .line 13
    .line 14
    sub-float/2addr p2, p1

    .line 15
    div-float/2addr p2, v1

    .line 16
    add-float/2addr p1, p2

    .line 17
    new-instance p2, Landroid/graphics/PointF;

    .line 18
    .line 19
    invoke-direct {p2, p0, p1}, Landroid/graphics/PointF;-><init>(FF)V

    .line 20
    .line 21
    .line 22
    return-object p2
.end method

.method public isTrackingInit()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/mcamera/mask/StickerGestureTrackingFilter;->trackingInit:Z

    .line 2
    .line 3
    return p0
.end method

.method public newTextureReady(ILl/gfj;Z)V
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
    invoke-direct {p0}, Lcom/momo/mcamera/mask/StickerGestureTrackingFilter;->trackingUpdate()V

    .line 7
    .line 8
    .line 9
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    invoke-super {p0, p1, p2, p3}, Lcom/momo/mcamera/mask/StickerMaskFilter;->newTextureReady(ILl/gfj;Z)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :catchall_0
    move-exception p0

    .line 15
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 16
    throw p0
.end method

.method public pauseBitmapCache()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/momo/mcamera/mask/StickerMaskFilter;->pauseBitmapCache()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerMaskFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    iput v1, v0, Lcom/momo/mcamera/mask/Sticker;->curIndex:I

    .line 10
    .line 11
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/StickerGestureTrackingFilter;->hasGestureRect:Z

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    iput-object v0, p0, Lcom/momo/mcamera/mask/StickerGestureTrackingFilter;->currentRect:Landroid/graphics/RectF;

    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public setDetectParam(Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V
    .locals 12

    .line 1
    iget-object v0, p1, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->gestureRect:Landroid/graphics/RectF;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iput-object v0, p0, Lcom/momo/mcamera/mask/StickerGestureTrackingFilter;->currentRect:Landroid/graphics/RectF;

    .line 6
    .line 7
    :cond_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerGestureTrackingFilter;->currentRect:Landroid/graphics/RectF;

    .line 8
    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    return-void

    .line 12
    :cond_1
    iget-object v1, p0, Lcom/momo/mcamera/mask/StickerMaskFilter;->maskListLock:Ljava/lang/Object;

    .line 13
    .line 14
    monitor-enter v1

    .line 15
    :try_start_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerGestureTrackingFilter;->currentRect:Landroid/graphics/RectF;

    .line 16
    .line 17
    iget v2, v0, Landroid/graphics/RectF;->right:F

    .line 18
    .line 19
    iget v3, v0, Landroid/graphics/RectF;->left:F

    .line 20
    .line 21
    sub-float/2addr v2, v3

    .line 22
    iget v3, v0, Landroid/graphics/RectF;->bottom:F

    .line 23
    .line 24
    iget v0, v0, Landroid/graphics/RectF;->top:F

    .line 25
    .line 26
    sub-float/2addr v3, v0

    .line 27
    const/high16 v0, 0x43340000    # 180.0f

    .line 28
    .line 29
    div-float v0, v2, v0

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/StickerGestureTrackingFilter;->getAdjustWidthScale()F

    .line 32
    .line 33
    .line 34
    move-result v4

    .line 35
    div-float v4, v0, v4

    .line 36
    .line 37
    const/16 v5, 0x8

    .line 38
    .line 39
    new-array v5, v5, [F

    .line 40
    .line 41
    iput-object v5, p1, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->points8:[F

    .line 42
    .line 43
    iget-object v6, p0, Lcom/momo/mcamera/mask/StickerGestureTrackingFilter;->currentRect:Landroid/graphics/RectF;

    .line 44
    .line 45
    iget v7, v6, Landroid/graphics/RectF;->left:F

    .line 46
    .line 47
    const/4 v8, 0x0

    .line 48
    aput v7, v5, v8

    .line 49
    .line 50
    iget v9, v6, Landroid/graphics/RectF;->right:F

    .line 51
    .line 52
    const/4 v10, 0x1

    .line 53
    aput v9, v5, v10

    .line 54
    .line 55
    const/4 v11, 0x2

    .line 56
    aput v7, v5, v11

    .line 57
    .line 58
    const/4 v7, 0x3

    .line 59
    aput v9, v5, v7

    .line 60
    .line 61
    iget v7, v6, Landroid/graphics/RectF;->top:F

    .line 62
    .line 63
    const/4 v9, 0x4

    .line 64
    aput v7, v5, v9

    .line 65
    .line 66
    const/4 v11, 0x5

    .line 67
    aput v7, v5, v11

    .line 68
    .line 69
    iget v6, v6, Landroid/graphics/RectF;->bottom:F

    .line 70
    .line 71
    const/4 v7, 0x6

    .line 72
    aput v6, v5, v7

    .line 73
    .line 74
    const/4 v7, 0x7

    .line 75
    aput v6, v5, v7

    .line 76
    .line 77
    iget-object v5, p0, Lcom/momo/mcamera/mask/StickerMaskFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 78
    .line 79
    invoke-virtual {v5}, Lcom/momo/mcamera/mask/Sticker;->getPointIndexes()[I

    .line 80
    .line 81
    .line 82
    move-result-object v5

    .line 83
    const/high16 v6, 0x40000000    # 2.0f

    .line 84
    .line 85
    if-eqz v5, :cond_2

    .line 86
    .line 87
    iget-object v5, p0, Lcom/momo/mcamera/mask/StickerMaskFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 88
    .line 89
    invoke-virtual {v5}, Lcom/momo/mcamera/mask/Sticker;->getPointIndexes()[I

    .line 90
    .line 91
    .line 92
    move-result-object v5

    .line 93
    array-length v5, v5

    .line 94
    if-le v5, v10, :cond_2

    .line 95
    .line 96
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerMaskFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 97
    .line 98
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getPointIndexes()[I

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    aget v0, v0, v8

    .line 103
    .line 104
    iget-object v2, p0, Lcom/momo/mcamera/mask/StickerMaskFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 105
    .line 106
    invoke-virtual {v2}, Lcom/momo/mcamera/mask/Sticker;->getPointIndexes()[I

    .line 107
    .line 108
    .line 109
    move-result-object v2

    .line 110
    aget v2, v2, v10

    .line 111
    .line 112
    iget-object v3, p1, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->points8:[F

    .line 113
    .line 114
    aget v5, v3, v0

    .line 115
    .line 116
    add-int/2addr v0, v9

    .line 117
    aget v0, v3, v0

    .line 118
    .line 119
    aget v7, v3, v2

    .line 120
    .line 121
    add-int/2addr v2, v9

    .line 122
    aget v2, v3, v2

    .line 123
    .line 124
    new-instance v3, Landroid/graphics/PointF;

    .line 125
    .line 126
    invoke-direct {v3, v5, v0}, Landroid/graphics/PointF;-><init>(FF)V

    .line 127
    .line 128
    .line 129
    new-instance v0, Landroid/graphics/PointF;

    .line 130
    .line 131
    invoke-direct {v0, v7, v2}, Landroid/graphics/PointF;-><init>(FF)V

    .line 132
    .line 133
    .line 134
    invoke-virtual {p0, v3, v0}, Lcom/momo/mcamera/mask/StickerGestureTrackingFilter;->getCenterPoint(Landroid/graphics/PointF;Landroid/graphics/PointF;)Landroid/graphics/PointF;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    iget v2, v0, Landroid/graphics/PointF;->x:F

    .line 139
    .line 140
    iget-object v3, p0, Lcom/momo/mcamera/mask/StickerMaskFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 141
    .line 142
    invoke-virtual {v3}, Lcom/momo/mcamera/mask/Sticker;->getOffsetX()I

    .line 143
    .line 144
    .line 145
    move-result v3

    .line 146
    int-to-float v3, v3

    .line 147
    mul-float/2addr v3, v4

    .line 148
    div-float/2addr v3, v6

    .line 149
    add-float/2addr v2, v3

    .line 150
    iput v2, v0, Landroid/graphics/PointF;->x:F

    .line 151
    .line 152
    iget v2, v0, Landroid/graphics/PointF;->y:F

    .line 153
    .line 154
    iget-object v3, p0, Lcom/momo/mcamera/mask/StickerMaskFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 155
    .line 156
    invoke-virtual {v3}, Lcom/momo/mcamera/mask/Sticker;->getOffsetY()I

    .line 157
    .line 158
    .line 159
    move-result v3

    .line 160
    int-to-float v3, v3

    .line 161
    mul-float/2addr v3, v4

    .line 162
    div-float/2addr v3, v6

    .line 163
    add-float/2addr v2, v3

    .line 164
    iput v2, v0, Landroid/graphics/PointF;->y:F

    .line 165
    .line 166
    new-instance v2, Landroid/graphics/PointF;

    .line 167
    .line 168
    iget v3, v0, Landroid/graphics/PointF;->x:F

    .line 169
    .line 170
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 171
    .line 172
    .line 173
    move-result v5

    .line 174
    int-to-float v5, v5

    .line 175
    div-float/2addr v3, v5

    .line 176
    iget v0, v0, Landroid/graphics/PointF;->y:F

    .line 177
    .line 178
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 179
    .line 180
    .line 181
    move-result v5

    .line 182
    int-to-float v5, v5

    .line 183
    div-float/2addr v0, v5

    .line 184
    invoke-direct {v2, v3, v0}, Landroid/graphics/PointF;-><init>(FF)V

    .line 185
    .line 186
    .line 187
    move-object v8, v2

    .line 188
    :goto_0
    move v6, v4

    .line 189
    goto :goto_1

    .line 190
    :catchall_0
    move-exception v0

    .line 191
    move-object p0, v0

    .line 192
    goto :goto_2

    .line 193
    :cond_2
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/StickerGestureTrackingFilter;->getAdjustWidthScale()F

    .line 194
    .line 195
    .line 196
    move-result v4

    .line 197
    div-float v4, v0, v4

    .line 198
    .line 199
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerGestureTrackingFilter;->currentRect:Landroid/graphics/RectF;

    .line 200
    .line 201
    iget v0, v0, Landroid/graphics/RectF;->left:F

    .line 202
    .line 203
    div-float/2addr v2, v6

    .line 204
    add-float/2addr v0, v2

    .line 205
    iget-object v2, p0, Lcom/momo/mcamera/mask/StickerMaskFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 206
    .line 207
    invoke-virtual {v2}, Lcom/momo/mcamera/mask/Sticker;->getOffsetX()I

    .line 208
    .line 209
    .line 210
    move-result v2

    .line 211
    int-to-float v2, v2

    .line 212
    mul-float/2addr v2, v4

    .line 213
    add-float/2addr v0, v2

    .line 214
    iget-object v2, p0, Lcom/momo/mcamera/mask/StickerGestureTrackingFilter;->currentRect:Landroid/graphics/RectF;

    .line 215
    .line 216
    iget v2, v2, Landroid/graphics/RectF;->top:F

    .line 217
    .line 218
    div-float/2addr v3, v6

    .line 219
    add-float/2addr v2, v3

    .line 220
    iget-object v3, p0, Lcom/momo/mcamera/mask/StickerMaskFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 221
    .line 222
    invoke-virtual {v3}, Lcom/momo/mcamera/mask/Sticker;->getOffsetY()I

    .line 223
    .line 224
    .line 225
    move-result v3

    .line 226
    int-to-float v3, v3

    .line 227
    mul-float/2addr v3, v4

    .line 228
    add-float/2addr v2, v3

    .line 229
    new-instance v3, Landroid/graphics/PointF;

    .line 230
    .line 231
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 232
    .line 233
    .line 234
    move-result v5

    .line 235
    int-to-float v5, v5

    .line 236
    div-float/2addr v0, v5

    .line 237
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 238
    .line 239
    .line 240
    move-result v5

    .line 241
    int-to-float v5, v5

    .line 242
    div-float/2addr v2, v5

    .line 243
    invoke-direct {v3, v0, v2}, Landroid/graphics/PointF;-><init>(FF)V

    .line 244
    .line 245
    .line 246
    move-object v8, v3

    .line 247
    goto :goto_0

    .line 248
    :goto_1
    iget-object v10, p1, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->filterTrigerManager:Lcom/momo/mcamera/mask/FilterTriggerManager;

    .line 249
    .line 250
    const/4 v9, 0x0

    .line 251
    move v7, v6

    .line 252
    move-object v5, p0

    .line 253
    invoke-virtual/range {v5 .. v10}, Lcom/momo/mcamera/mask/StickerGestureTrackingFilter;->setParamForMatrix(FFLandroid/graphics/PointF;FLcom/momo/mcamera/mask/FilterTriggerManager;)V

    .line 254
    .line 255
    .line 256
    monitor-exit v1

    .line 257
    return-void

    .line 258
    :goto_2
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 259
    throw p0
.end method

.method public setMMCVInfo(Ll/omw;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/StickerGestureTrackingFilter;->mmcvInfo:Ll/omw;

    .line 2
    .line 3
    return-void
.end method

.method public setMMCVRect(Lcom/momocv/MMRect;)V
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
    iput-object p1, p0, Lcom/momo/mcamera/mask/StickerGestureTrackingFilter;->mmcvRect:Lcom/momocv/MMRect;

    .line 7
    .line 8
    monitor-exit v0

    .line 9
    return-void

    .line 10
    :catchall_0
    move-exception p0

    .line 11
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 12
    throw p0
.end method

.method public setParamForMatrix(FFLandroid/graphics/PointF;FLcom/momo/mcamera/mask/FilterTriggerManager;)V
    .locals 9

    .line 1
    iget p5, p3, Landroid/graphics/PointF;->x:F

    .line 2
    .line 3
    const/high16 v0, 0x40000000    # 2.0f

    .line 4
    .line 5
    mul-float/2addr p5, v0

    .line 6
    const/high16 v1, 0x3f800000    # 1.0f

    .line 7
    .line 8
    sub-float/2addr p5, v1

    .line 9
    neg-float p5, p5

    .line 10
    iget v2, p3, Landroid/graphics/PointF;->y:F

    .line 11
    .line 12
    neg-float v2, v2

    .line 13
    mul-float/2addr v2, v0

    .line 14
    add-float/2addr v2, v1

    .line 15
    iput p5, p3, Landroid/graphics/PointF;->x:F

    .line 16
    .line 17
    iput v2, p3, Landroid/graphics/PointF;->y:F

    .line 18
    .line 19
    const/16 p3, 0x10

    .line 20
    .line 21
    new-array v3, p3, [F

    .line 22
    .line 23
    new-array p3, p3, [F

    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    invoke-static {p3, v0}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    .line 27
    .line 28
    .line 29
    neg-float p5, p5

    .line 30
    const/4 v4, 0x0

    .line 31
    invoke-static {p3, v0, p5, v2, v4}, Landroid/opengl/Matrix;->translateM([FIFFF)V

    .line 32
    .line 33
    .line 34
    iget-object v5, p0, Lcom/momo/mcamera/mask/StickerMaskFilter;->mViewMatrix:[F

    .line 35
    .line 36
    iget-object v7, p0, Lcom/momo/mcamera/mask/StickerMaskFilter;->mProjectionMatrix:[F

    .line 37
    .line 38
    const/4 v8, 0x0

    .line 39
    const/4 v4, 0x0

    .line 40
    const/4 v6, 0x0

    .line 41
    invoke-static/range {v3 .. v8}, Landroid/opengl/Matrix;->multiplyMM([FI[FI[FI)V

    .line 42
    .line 43
    .line 44
    move-object v7, v3

    .line 45
    move-object v5, p3

    .line 46
    invoke-static/range {v3 .. v8}, Landroid/opengl/Matrix;->multiplyMM([FI[FI[FI)V

    .line 47
    .line 48
    .line 49
    const/4 v7, 0x0

    .line 50
    const/high16 v8, 0x3f800000    # 1.0f

    .line 51
    .line 52
    const/4 v6, 0x0

    .line 53
    move v5, p4

    .line 54
    invoke-static/range {v3 .. v8}, Landroid/opengl/Matrix;->rotateM([FIFFFF)V

    .line 55
    .line 56
    .line 57
    mul-float/2addr p1, v1

    .line 58
    mul-float/2addr p2, v1

    .line 59
    invoke-static {v3, v0, p1, p2, v1}, Landroid/opengl/Matrix;->scaleM([FIFFF)V

    .line 60
    .line 61
    .line 62
    iget-object v7, p0, Lcom/momo/mcamera/mask/StickerMaskFilter;->texData0:[F

    .line 63
    .line 64
    const/4 v8, 0x0

    .line 65
    const/4 v6, 0x0

    .line 66
    move-object v5, v3

    .line 67
    move-object v3, p3

    .line 68
    invoke-static/range {v3 .. v8}, Landroid/opengl/Matrix;->multiplyMM([FI[FI[FI)V

    .line 69
    .line 70
    .line 71
    aget p1, p3, v0

    .line 72
    .line 73
    const/4 p2, 0x1

    .line 74
    aget p4, p3, p2

    .line 75
    .line 76
    const/4 p5, 0x4

    .line 77
    aget v1, p3, p5

    .line 78
    .line 79
    const/4 v2, 0x5

    .line 80
    aget v3, p3, v2

    .line 81
    .line 82
    const/16 v4, 0x8

    .line 83
    .line 84
    aget v5, p3, v4

    .line 85
    .line 86
    const/16 v6, 0x9

    .line 87
    .line 88
    aget v6, p3, v6

    .line 89
    .line 90
    const/16 v7, 0xc

    .line 91
    .line 92
    aget v7, p3, v7

    .line 93
    .line 94
    const/16 v8, 0xd

    .line 95
    .line 96
    aget p3, p3, v8

    .line 97
    .line 98
    new-array v4, v4, [F

    .line 99
    .line 100
    aput p1, v4, v0

    .line 101
    .line 102
    aput p4, v4, p2

    .line 103
    .line 104
    const/4 p1, 0x2

    .line 105
    aput v1, v4, p1

    .line 106
    .line 107
    const/4 p1, 0x3

    .line 108
    aput v3, v4, p1

    .line 109
    .line 110
    aput v5, v4, p5

    .line 111
    .line 112
    aput v6, v4, v2

    .line 113
    .line 114
    const/4 p1, 0x6

    .line 115
    aput v7, v4, p1

    .line 116
    .line 117
    const/4 p1, 0x7

    .line 118
    aput p3, v4, p1

    .line 119
    .line 120
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerMaskFilter;->mvpLists:Ljava/util/List;

    .line 121
    .line 122
    invoke-interface {p0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    return-void
.end method

.method public startTracking()V
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
    const/4 v1, 0x1

    .line 7
    :try_start_0
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/StickerGestureTrackingFilter;->startTracking:Z

    .line 8
    .line 9
    monitor-exit v0

    .line 10
    return-void

    .line 11
    :catchall_0
    move-exception p0

    .line 12
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    throw p0
.end method
