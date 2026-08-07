.class public Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob$IMotionFilterJobListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$OnCropRegionChangedListener;
    }
.end annotation


# static fields
.field public static final MotionFilterTAG:Ljava/lang/String; = "MotionFilter"


# instance fields
.field private START_MOVE_WHAT:I

.field private canMove:Z

.field private canMoveTimer:Ljava/util/Timer;

.field private currentJob:Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob;

.field private currentMoveCount:I

.field private currentScale:F

.field private handler:Landroid/os/Handler;

.field private hasFace:Z

.field private height:I

.field private jobQueue:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob;",
            ">;"
        }
    .end annotation
.end field

.field private lastCropCenterPoint:Landroid/graphics/PointF;

.field private listener:Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$OnCropRegionChangedListener;

.field private mmcvInfo:Ll/omw;

.field private moCamPullDuration:F

.field private moCamPushDuration:F

.field private moCamScale:F

.field private moCam_CD:I

.field private moCam_Cnt:I

.field private moCam_T:I

.field private moCam_moveT:I

.field private moCam_t0:I

.field private motionMoveJob:Lcom/momo/mcamera/mask/motioncamera/MotionMoveJob;

.field private moveLoopInterval:I

.field private scaleMMCVInfo:Ll/omw;

.field private whileLoopTimer:Ljava/util/Timer;

.field private width:I


# direct methods
.method public constructor <init>(Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$OnCropRegionChangedListener;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x1100

    .line 5
    .line 6
    iput v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->START_MOVE_WHAT:I

    .line 7
    .line 8
    new-instance v0, Ljava/util/LinkedList;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->jobQueue:Ljava/util/LinkedList;

    .line 14
    .line 15
    new-instance v0, Landroid/graphics/PointF;

    .line 16
    .line 17
    const/high16 v1, 0x3f000000    # 0.5f

    .line 18
    .line 19
    invoke-direct {v0, v1, v1}, Landroid/graphics/PointF;-><init>(FF)V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->lastCropCenterPoint:Landroid/graphics/PointF;

    .line 23
    .line 24
    const/high16 v0, 0x3f800000    # 1.0f

    .line 25
    .line 26
    iput v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->currentScale:F

    .line 27
    .line 28
    const/4 v1, 0x0

    .line 29
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->hasFace:Z

    .line 30
    .line 31
    iput v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->moCamPushDuration:F

    .line 32
    .line 33
    iput v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->moCamPullDuration:F

    .line 34
    .line 35
    const v0, 0x3f666666    # 0.9f

    .line 36
    .line 37
    .line 38
    iput v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->moCamScale:F

    .line 39
    .line 40
    const/4 v0, 0x2

    .line 41
    iput v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->moCam_T:I

    .line 42
    .line 43
    iput v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->moCam_t0:I

    .line 44
    .line 45
    iput v1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->moCam_CD:I

    .line 46
    .line 47
    const/16 v0, 0x8

    .line 48
    .line 49
    iput v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->moCam_Cnt:I

    .line 50
    .line 51
    iput v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->moCam_moveT:I

    .line 52
    .line 53
    iput v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->moveLoopInterval:I

    .line 54
    .line 55
    const/4 v0, 0x1

    .line 56
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->canMove:Z

    .line 57
    .line 58
    iput v1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->currentMoveCount:I

    .line 59
    .line 60
    new-instance v0, Lcom/momo/mcamera/mask/motioncamera/MotionMoveJob;

    .line 61
    .line 62
    invoke-direct {v0}, Lcom/momo/mcamera/mask/motioncamera/MotionMoveJob;-><init>()V

    .line 63
    .line 64
    .line 65
    iput-object v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->motionMoveJob:Lcom/momo/mcamera/mask/motioncamera/MotionMoveJob;

    .line 66
    .line 67
    new-instance v0, Ljava/util/Timer;

    .line 68
    .line 69
    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    .line 70
    .line 71
    .line 72
    iput-object v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->canMoveTimer:Ljava/util/Timer;

    .line 73
    .line 74
    new-instance v0, Ljava/util/Timer;

    .line 75
    .line 76
    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    .line 77
    .line 78
    .line 79
    iput-object v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->whileLoopTimer:Ljava/util/Timer;

    .line 80
    .line 81
    new-instance v0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$1;

    .line 82
    .line 83
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    invoke-direct {v0, p0, v1}, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$1;-><init>(Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;Landroid/os/Looper;)V

    .line 88
    .line 89
    .line 90
    iput-object v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->handler:Landroid/os/Handler;

    .line 91
    .line 92
    iput-object p1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->listener:Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$OnCropRegionChangedListener;

    .line 93
    .line 94
    return-void
.end method

.method public static synthetic access$000(Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->START_MOVE_WHAT:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$100(Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;)Z
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->isJobMoveRunning()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic access$1000(Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;)Ljava/util/LinkedList;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->jobQueue:Ljava/util/LinkedList;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1100(Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;)Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->currentJob:Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1200(Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->currentScale:F

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$1302(Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;Ll/omw;)Ll/omw;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->scaleMMCVInfo:Ll/omw;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$1400(Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->moCamPullDuration:F

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$1500(Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->moCamScale:F

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$1602(Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->hasFace:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$200(Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;)Ll/omw;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->mmcvInfo:Ll/omw;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$300(Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->currentMoveCount:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$302(Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;I)I
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->currentMoveCount:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$400(Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->moCam_Cnt:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$500(Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;Ll/omw;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->move(Ll/omw;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$600(Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->moveLoopInterval:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$700(Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->moCam_moveT:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$802(Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->canMove:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$900(Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;)Ljava/util/Timer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->canMoveTimer:Ljava/util/Timer;

    .line 2
    .line 3
    return-object p0
.end method

.method private calculateCropRegion(FFFF)Landroid/graphics/RectF;
    .locals 4

    .line 1
    const/high16 v0, 0x3f000000    # 0.5f

    .line 2
    .line 3
    mul-float/2addr p3, v0

    .line 4
    sub-float v1, p1, p3

    .line 5
    .line 6
    add-float/2addr p1, p3

    .line 7
    mul-float/2addr p4, v0

    .line 8
    sub-float p3, p2, p4

    .line 9
    .line 10
    add-float/2addr p2, p4

    .line 11
    const/4 p4, 0x0

    .line 12
    cmpg-float v0, v1, p4

    .line 13
    .line 14
    if-gez v0, :cond_0

    .line 15
    .line 16
    sub-float v0, p4, v1

    .line 17
    .line 18
    add-float/2addr p1, v0

    .line 19
    move v1, p4

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    iget v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->width:I

    .line 22
    .line 23
    int-to-float v2, v0

    .line 24
    cmpl-float v2, p1, v2

    .line 25
    .line 26
    if-lez v2, :cond_1

    .line 27
    .line 28
    int-to-float v2, v0

    .line 29
    sub-float/2addr p1, v2

    .line 30
    sub-float/2addr v1, p1

    .line 31
    int-to-float p1, v0

    .line 32
    :cond_1
    :goto_0
    cmpg-float v0, p3, p4

    .line 33
    .line 34
    if-gez v0, :cond_2

    .line 35
    .line 36
    sub-float p3, p4, p3

    .line 37
    .line 38
    add-float/2addr p2, p3

    .line 39
    move p3, p4

    .line 40
    goto :goto_1

    .line 41
    :cond_2
    iget v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->height:I

    .line 42
    .line 43
    int-to-float v2, v0

    .line 44
    cmpl-float v2, p2, v2

    .line 45
    .line 46
    if-lez v2, :cond_3

    .line 47
    .line 48
    int-to-float v2, v0

    .line 49
    sub-float/2addr p2, v2

    .line 50
    sub-float/2addr p3, p2

    .line 51
    int-to-float p2, v0

    .line 52
    :cond_3
    :goto_1
    new-instance v0, Landroid/graphics/RectF;

    .line 53
    .line 54
    iget v2, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->width:I

    .line 55
    .line 56
    int-to-float v3, v2

    .line 57
    div-float/2addr v1, v3

    .line 58
    iget p0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->height:I

    .line 59
    .line 60
    int-to-float v3, p0

    .line 61
    div-float/2addr p3, v3

    .line 62
    int-to-float v2, v2

    .line 63
    div-float/2addr p1, v2

    .line 64
    int-to-float p0, p0

    .line 65
    div-float/2addr p2, p0

    .line 66
    invoke-direct {v0, v1, p3, p1, p2}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 67
    .line 68
    .line 69
    iget p0, v0, Landroid/graphics/RectF;->left:F

    .line 70
    .line 71
    const p1, 0x3a83126f    # 0.001f

    .line 72
    .line 73
    .line 74
    cmpg-float p0, p0, p1

    .line 75
    .line 76
    if-gez p0, :cond_4

    .line 77
    .line 78
    iput p4, v0, Landroid/graphics/RectF;->left:F

    .line 79
    .line 80
    :cond_4
    iget p0, v0, Landroid/graphics/RectF;->top:F

    .line 81
    .line 82
    cmpg-float p0, p0, p1

    .line 83
    .line 84
    if-gez p0, :cond_5

    .line 85
    .line 86
    iput p4, v0, Landroid/graphics/RectF;->top:F

    .line 87
    .line 88
    :cond_5
    iget p0, v0, Landroid/graphics/RectF;->right:F

    .line 89
    .line 90
    cmpg-float p0, p0, p1

    .line 91
    .line 92
    if-gez p0, :cond_6

    .line 93
    .line 94
    iput p4, v0, Landroid/graphics/RectF;->right:F

    .line 95
    .line 96
    :cond_6
    iget p0, v0, Landroid/graphics/RectF;->bottom:F

    .line 97
    .line 98
    cmpg-float p0, p0, p1

    .line 99
    .line 100
    if-gez p0, :cond_7

    .line 101
    .line 102
    iput p4, v0, Landroid/graphics/RectF;->bottom:F

    .line 103
    .line 104
    :cond_7
    return-object v0
.end method

.method private cancelJobs()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->jobQueue:Ljava/util/LinkedList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/LinkedList;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->motionMoveJob:Lcom/momo/mcamera/mask/motioncamera/MotionMoveJob;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/motioncamera/MotionMoveJob;->cancel()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->currentJob:Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob;->isRunning()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->currentJob:Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob;

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob;->cancel()V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method private cancelTimer()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->canMoveTimer:Ljava/util/Timer;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/Timer;->purge()I

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->canMoveTimer:Ljava/util/Timer;

    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->whileLoopTimer:Ljava/util/Timer;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/util/Timer;->purge()I

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->whileLoopTimer:Ljava/util/Timer;

    .line 17
    .line 18
    invoke-virtual {p0}, Ljava/util/Timer;->cancel()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method private isJobMoveRunning()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->currentJob:Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob;->isRunning()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    :cond_0
    iget-object p0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->motionMoveJob:Lcom/momo/mcamera/mask/motioncamera/MotionMoveJob;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/motioncamera/MotionMoveJob;->isRunning()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_2

    .line 18
    .line 19
    :cond_1
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_2
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method private move(Ll/omw;)V
    .locals 6

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "move,   currentScale="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->currentScale:F

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "MotionFilter"

    .line 18
    .line 19
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    invoke-virtual {p1, v0}, Ll/omw;->j(I)Ll/nuf;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p1}, Ll/nuf;->e()[F

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    const/4 v1, 0x2

    .line 32
    aget v1, p1, v1

    .line 33
    .line 34
    aget v0, p1, v0

    .line 35
    .line 36
    add-float/2addr v1, v0

    .line 37
    const/high16 v0, 0x3f000000    # 0.5f

    .line 38
    .line 39
    mul-float/2addr v1, v0

    .line 40
    const/4 v2, 0x3

    .line 41
    aget v2, p1, v2

    .line 42
    .line 43
    const/4 v3, 0x1

    .line 44
    aget p1, p1, v3

    .line 45
    .line 46
    add-float/2addr v2, p1

    .line 47
    mul-float/2addr v2, v0

    .line 48
    iget p1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->width:I

    .line 49
    .line 50
    int-to-float p1, p1

    .line 51
    iget v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->currentScale:F

    .line 52
    .line 53
    mul-float/2addr p1, v0

    .line 54
    iget v4, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->height:I

    .line 55
    .line 56
    int-to-float v4, v4

    .line 57
    mul-float/2addr v4, v0

    .line 58
    iget-object v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->lastCropCenterPoint:Landroid/graphics/PointF;

    .line 59
    .line 60
    iget v5, v0, Landroid/graphics/PointF;->x:F

    .line 61
    .line 62
    iget v0, v0, Landroid/graphics/PointF;->y:F

    .line 63
    .line 64
    invoke-direct {p0, v5, v0, p1, v4}, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->calculateCropRegion(FFFF)Landroid/graphics/RectF;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    iget-object v5, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->lastCropCenterPoint:Landroid/graphics/PointF;

    .line 69
    .line 70
    iput v1, v5, Landroid/graphics/PointF;->x:F

    .line 71
    .line 72
    iput v2, v5, Landroid/graphics/PointF;->y:F

    .line 73
    .line 74
    invoke-direct {p0, v1, v2, p1, v4}, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->calculateCropRegion(FFFF)Landroid/graphics/RectF;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    iget-object v1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->motionMoveJob:Lcom/momo/mcamera/mask/motioncamera/MotionMoveJob;

    .line 79
    .line 80
    iget-object v2, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->listener:Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$OnCropRegionChangedListener;

    .line 81
    .line 82
    invoke-virtual {v1, v2}, Lcom/momo/mcamera/mask/motioncamera/MotionMoveJob;->setCropRegionChangedListener(Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$OnCropRegionChangedListener;)V

    .line 83
    .line 84
    .line 85
    iget-object v1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->motionMoveJob:Lcom/momo/mcamera/mask/motioncamera/MotionMoveJob;

    .line 86
    .line 87
    iget v2, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->moCam_t0:I

    .line 88
    .line 89
    int-to-float v2, v2

    .line 90
    invoke-virtual {v1, v2, v0, p1}, Lcom/momo/mcamera/mask/motioncamera/MotionMoveJob;->start(FLandroid/graphics/RectF;Landroid/graphics/RectF;)V

    .line 91
    .line 92
    .line 93
    iget p1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->currentMoveCount:I

    .line 94
    .line 95
    add-int/2addr p1, v3

    .line 96
    iput p1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->currentMoveCount:I

    .line 97
    .line 98
    return-void
.end method

.method private releaseCallbacks()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->listener:Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$OnCropRegionChangedListener;

    .line 3
    .line 4
    iget-object p0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->handler:Landroid/os/Handler;

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public addJob(Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->currentJob:Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob;->isRunning()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return p0

    .line 13
    :cond_0
    iget-object p0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->jobQueue:Ljava/util/LinkedList;

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    const/4 p0, 0x1

    .line 19
    return p0
.end method

.method public onJobEnd()V
    .locals 0

    return-void
.end method

.method public onScaleChanged(F)V
    .locals 5

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "onScaleChanged , \u955c\u5934\u6536\u7f29\u5f00\u59cb\u7684\u65f6\u5019\u56de\u8c03\uff0c scale="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, ", width="

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    iget v1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->width:I

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v1, ", height="

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    iget v1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->height:I

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const-string v1, "MotionFilter"

    .line 36
    .line 37
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    iput p1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->currentScale:F

    .line 41
    .line 42
    iget v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->width:I

    .line 43
    .line 44
    if-eqz v0, :cond_3

    .line 45
    .line 46
    iget v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->height:I

    .line 47
    .line 48
    if-nez v0, :cond_0

    .line 49
    .line 50
    goto :goto_2

    .line 51
    :cond_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->scaleMMCVInfo:Ll/omw;

    .line 52
    .line 53
    if-eqz v0, :cond_2

    .line 54
    .line 55
    invoke-virtual {v0}, Ll/omw;->n()I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-gtz v0, :cond_1

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_1
    iget-object v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->scaleMMCVInfo:Ll/omw;

    .line 63
    .line 64
    const/4 v1, 0x0

    .line 65
    invoke-virtual {v0, v1}, Ll/omw;->j(I)Ll/nuf;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-virtual {v0}, Ll/nuf;->e()[F

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    const/4 v2, 0x2

    .line 74
    aget v2, v0, v2

    .line 75
    .line 76
    aget v1, v0, v1

    .line 77
    .line 78
    add-float/2addr v2, v1

    .line 79
    const/high16 v1, 0x3f000000    # 0.5f

    .line 80
    .line 81
    mul-float/2addr v2, v1

    .line 82
    const/4 v3, 0x3

    .line 83
    aget v3, v0, v3

    .line 84
    .line 85
    const/4 v4, 0x1

    .line 86
    aget v0, v0, v4

    .line 87
    .line 88
    add-float/2addr v3, v0

    .line 89
    mul-float/2addr v3, v1

    .line 90
    iget-object v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->lastCropCenterPoint:Landroid/graphics/PointF;

    .line 91
    .line 92
    iput v2, v0, Landroid/graphics/PointF;->x:F

    .line 93
    .line 94
    iput v3, v0, Landroid/graphics/PointF;->y:F

    .line 95
    .line 96
    goto :goto_1

    .line 97
    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->lastCropCenterPoint:Landroid/graphics/PointF;

    .line 98
    .line 99
    iget v2, v0, Landroid/graphics/PointF;->x:F

    .line 100
    .line 101
    iget v3, v0, Landroid/graphics/PointF;->y:F

    .line 102
    .line 103
    :goto_1
    iget v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->width:I

    .line 104
    .line 105
    int-to-float v0, v0

    .line 106
    mul-float/2addr v0, p1

    .line 107
    iget v1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->height:I

    .line 108
    .line 109
    int-to-float v1, v1

    .line 110
    mul-float/2addr v1, p1

    .line 111
    invoke-direct {p0, v2, v3, v0, v1}, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->calculateCropRegion(FFFF)Landroid/graphics/RectF;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    iget-object p0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->listener:Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$OnCropRegionChangedListener;

    .line 116
    .line 117
    if-eqz p0, :cond_3

    .line 118
    .line 119
    iget v0, p1, Landroid/graphics/RectF;->left:F

    .line 120
    .line 121
    iget v1, p1, Landroid/graphics/RectF;->top:F

    .line 122
    .line 123
    iget v2, p1, Landroid/graphics/RectF;->right:F

    .line 124
    .line 125
    iget p1, p1, Landroid/graphics/RectF;->bottom:F

    .line 126
    .line 127
    invoke-interface {p0, v0, v1, v2, p1}, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$OnCropRegionChangedListener;->onCropRegionChanged(FFFF)V

    .line 128
    .line 129
    .line 130
    :cond_3
    :goto_2
    return-void
.end method

.method public release()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->cancelTimer()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->cancelJobs()V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->releaseCallbacks()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public setFilterOptions(Lproject/android/imageprocessing/model/FilterOptions;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lproject/android/imageprocessing/model/FilterOptions;->getMoCamPushDuration()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    iput v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->moCamPushDuration:F

    .line 7
    .line 8
    invoke-virtual {p1}, Lproject/android/imageprocessing/model/FilterOptions;->getMoCamPullDuration()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    int-to-float v0, v0

    .line 13
    iput v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->moCamPullDuration:F

    .line 14
    .line 15
    invoke-virtual {p1}, Lproject/android/imageprocessing/model/FilterOptions;->getMoCamScale()F

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iput v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->moCamScale:F

    .line 20
    .line 21
    invoke-virtual {p1}, Lproject/android/imageprocessing/model/FilterOptions;->getMoCam_T()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    iput v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->moCam_T:I

    .line 26
    .line 27
    invoke-virtual {p1}, Lproject/android/imageprocessing/model/FilterOptions;->getMoCam_t0()I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    iput v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->moCam_t0:I

    .line 32
    .line 33
    invoke-virtual {p1}, Lproject/android/imageprocessing/model/FilterOptions;->getMoCam_CD()I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    iput v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->moCam_CD:I

    .line 38
    .line 39
    invoke-virtual {p1}, Lproject/android/imageprocessing/model/FilterOptions;->getMoCam_Cnt()I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    iput v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->moCam_Cnt:I

    .line 44
    .line 45
    invoke-virtual {p1}, Lproject/android/imageprocessing/model/FilterOptions;->getMoCam_moveT()I

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    iput p1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->moCam_moveT:I

    .line 50
    .line 51
    iget v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->moCam_CD:I

    .line 52
    .line 53
    sub-int/2addr p1, v0

    .line 54
    iput p1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->moveLoopInterval:I

    .line 55
    .line 56
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->startTimer()V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public startTimer()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->whileLoopTimer:Ljava/util/Timer;

    .line 2
    .line 3
    new-instance v1, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$2;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$2;-><init>(Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;)V

    .line 6
    .line 7
    .line 8
    iget p0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->moCam_moveT:I

    .line 9
    .line 10
    mul-int/lit16 v2, p0, 0x3e8

    .line 11
    .line 12
    int-to-long v2, v2

    .line 13
    mul-int/lit16 p0, p0, 0x3e8

    .line 14
    .line 15
    int-to-long v4, p0

    .line 16
    invoke-virtual/range {v0 .. v5}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;JJ)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public updateMMCVInfo(Ll/omw;II)V
    .locals 3

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->mmcvInfo:Ll/omw;

    .line 2
    .line 3
    iput p2, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->width:I

    .line 4
    .line 5
    iput p3, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->height:I

    .line 6
    .line 7
    iget-boolean p2, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->canMove:Z

    .line 8
    .line 9
    const-string p3, "MotionFilter"

    .line 10
    .line 11
    if-nez p2, :cond_0

    .line 12
    .line 13
    const-string p0, "\u88ab\u7981\u6b62\u8fd0\u52a8\u4e86.return."

    .line 14
    .line 15
    invoke-static {p3, p0}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    invoke-virtual {p1}, Ll/omw;->n()I

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    iget-boolean v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->hasFace:Z

    .line 24
    .line 25
    const/high16 v1, 0x3f800000    # 1.0f

    .line 26
    .line 27
    if-lez p2, :cond_1

    .line 28
    .line 29
    if-nez v0, :cond_2

    .line 30
    .line 31
    iget-object p2, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->jobQueue:Ljava/util/LinkedList;

    .line 32
    .line 33
    invoke-virtual {p2}, Ljava/util/AbstractCollection;->isEmpty()Z

    .line 34
    .line 35
    .line 36
    move-result p2

    .line 37
    if-eqz p2, :cond_2

    .line 38
    .line 39
    const-string p2, "addJob ,\u6709\u4eba\u8138\uff0c\u4e14\u4e4b\u524d\u4e5f\u6ca1\u4eba\u8138\uff08\u4eba\u8138\u51fa\u73b0\u65f6\uff09"

    .line 40
    .line 41
    invoke-static {p3, p2}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    new-instance p2, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob;

    .line 45
    .line 46
    iget v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->moCamPushDuration:F

    .line 47
    .line 48
    iget v2, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->moCamScale:F

    .line 49
    .line 50
    invoke-direct {p2, v0, v1, v2}, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob;-><init>(FFF)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0, p2}, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->addJob(Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob;)Z

    .line 54
    .line 55
    .line 56
    move-result p2

    .line 57
    iput-boolean p2, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->hasFace:Z

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_1
    if-eqz v0, :cond_2

    .line 61
    .line 62
    iget-object p2, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->jobQueue:Ljava/util/LinkedList;

    .line 63
    .line 64
    invoke-virtual {p2}, Ljava/util/AbstractCollection;->isEmpty()Z

    .line 65
    .line 66
    .line 67
    move-result p2

    .line 68
    if-eqz p2, :cond_2

    .line 69
    .line 70
    const-string p2, "addJob ,\u6ca1\u4eba\u8138\uff0c\u4e14\u4e4b\u524d\u6709\u4eba\u8138\uff08\u4eba\u8138\u6d88\u5931\u65f6\uff09"

    .line 71
    .line 72
    invoke-static {p3, p2}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    new-instance p2, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob;

    .line 76
    .line 77
    iget v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->moCamPullDuration:F

    .line 78
    .line 79
    iget v2, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->moCamScale:F

    .line 80
    .line 81
    invoke-direct {p2, v0, v2, v1}, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob;-><init>(FFF)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p0, p2}, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->addJob(Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob;)Z

    .line 85
    .line 86
    .line 87
    move-result p2

    .line 88
    xor-int/lit8 p2, p2, 0x1

    .line 89
    .line 90
    iput-boolean p2, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->hasFace:Z

    .line 91
    .line 92
    :cond_2
    :goto_0
    new-instance p2, Ljava/lang/StringBuilder;

    .line 93
    .line 94
    const-string v0, "\u5141\u8bb8\u8fd0\u52a8, jobQueue.isEmpty()="

    .line 95
    .line 96
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    iget-object v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->jobQueue:Ljava/util/LinkedList;

    .line 100
    .line 101
    invoke-virtual {v0}, Ljava/util/AbstractCollection;->isEmpty()Z

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    const-string v0, ", isJobMoveRunning()="

    .line 109
    .line 110
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    invoke-direct {p0}, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->isJobMoveRunning()Z

    .line 114
    .line 115
    .line 116
    move-result v0

    .line 117
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    const-string v0, ", hasMessages="

    .line 121
    .line 122
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    iget-object v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->handler:Landroid/os/Handler;

    .line 126
    .line 127
    iget v1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->START_MOVE_WHAT:I

    .line 128
    .line 129
    invoke-virtual {v0, v1}, Landroid/os/Handler;->hasMessages(I)Z

    .line 130
    .line 131
    .line 132
    move-result v0

    .line 133
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object p2

    .line 140
    invoke-static {p3, p2}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 141
    .line 142
    .line 143
    iget-object p2, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->jobQueue:Ljava/util/LinkedList;

    .line 144
    .line 145
    invoke-virtual {p2}, Ljava/util/AbstractCollection;->isEmpty()Z

    .line 146
    .line 147
    .line 148
    move-result p2

    .line 149
    if-nez p2, :cond_3

    .line 150
    .line 151
    invoke-direct {p0}, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->isJobMoveRunning()Z

    .line 152
    .line 153
    .line 154
    move-result p2

    .line 155
    if-nez p2, :cond_3

    .line 156
    .line 157
    iget p2, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->currentMoveCount:I

    .line 158
    .line 159
    iget v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->moCam_Cnt:I

    .line 160
    .line 161
    if-gt p2, v0, :cond_3

    .line 162
    .line 163
    iput-object p1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->scaleMMCVInfo:Ll/omw;

    .line 164
    .line 165
    iget-object p1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->jobQueue:Ljava/util/LinkedList;

    .line 166
    .line 167
    invoke-virtual {p1}, Ljava/util/LinkedList;->pop()Ljava/lang/Object;

    .line 168
    .line 169
    .line 170
    move-result-object p1

    .line 171
    check-cast p1, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob;

    .line 172
    .line 173
    iput-object p1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->currentJob:Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob;

    .line 174
    .line 175
    invoke-virtual {p1, p0}, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob;->setMotionFilterJobListener(Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob$IMotionFilterJobListener;)V

    .line 176
    .line 177
    .line 178
    iget-object p1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->currentJob:Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob;

    .line 179
    .line 180
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob;->start()V

    .line 181
    .line 182
    .line 183
    new-instance p1, Ljava/lang/StringBuilder;

    .line 184
    .line 185
    const-string p2, "\u6267\u884c\u4f38\u7f29\u955c\u5934Job , currentMoveCount="

    .line 186
    .line 187
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 188
    .line 189
    .line 190
    iget p2, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->currentMoveCount:I

    .line 191
    .line 192
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 193
    .line 194
    .line 195
    const-string p2, ", limitMoveCount="

    .line 196
    .line 197
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 198
    .line 199
    .line 200
    iget p2, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->moCam_Cnt:I

    .line 201
    .line 202
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 203
    .line 204
    .line 205
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 206
    .line 207
    .line 208
    move-result-object p1

    .line 209
    invoke-static {p3, p1}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 210
    .line 211
    .line 212
    iget p1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->currentMoveCount:I

    .line 213
    .line 214
    add-int/lit8 p1, p1, 0x1

    .line 215
    .line 216
    iput p1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->currentMoveCount:I

    .line 217
    .line 218
    :cond_3
    iget-object p1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->handler:Landroid/os/Handler;

    .line 219
    .line 220
    iget p2, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->START_MOVE_WHAT:I

    .line 221
    .line 222
    invoke-virtual {p1, p2}, Landroid/os/Handler;->hasMessages(I)Z

    .line 223
    .line 224
    .line 225
    move-result p1

    .line 226
    if-nez p1, :cond_4

    .line 227
    .line 228
    iget-object p1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->handler:Landroid/os/Handler;

    .line 229
    .line 230
    iget p2, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->START_MOVE_WHAT:I

    .line 231
    .line 232
    iget p0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->moCam_T:I

    .line 233
    .line 234
    mul-int/lit16 p0, p0, 0x3e8

    .line 235
    .line 236
    int-to-long v0, p0

    .line 237
    invoke-virtual {p1, p2, v0, v1}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 238
    .line 239
    .line 240
    :cond_4
    return-void
.end method
