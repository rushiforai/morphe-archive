.class public Lcom/tencent/rtmp/ui/TXCloudVideoView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/rtmp/ui/TXCloudVideoView$a;
    }
.end annotation


# static fields
.field private static final FOCUS_AREA_SIZE_DP:I = 0x46

.field private static final TAG:Ljava/lang/String; = "TXCloudVideoView"


# instance fields
.field private mBottom:F

.field private mCapture:Lcom/tencent/liteav/k;

.field private mCaptureHeight:I

.field private mCaptureWidth:I

.field private mCurrentScale:I

.field protected mDashBoard:Lcom/tencent/rtmp/ui/TXDashBoard;

.field private mFocus:Z

.field private mFocusAreaSize:I

.field protected mFocusIndicatorView:Lcom/tencent/liteav/renderer/TXCFocusIndicatorView;

.field protected mGLSurfaceView:Lcom/tencent/liteav/renderer/TXCGLSurfaceView;

.field private mLeft:F

.field private mRight:F

.field private mScaleGestureDetector:Landroid/view/ScaleGestureDetector;

.field private mScaleGestureListener:Landroid/view/ScaleGestureDetector$OnScaleGestureListener;

.field protected mSurfaceView:Landroid/view/SurfaceView;

.field private mTop:F

.field private mTouchFocusRunnable:Lcom/tencent/rtmp/ui/TXCloudVideoView$a;

.field private mUserId:Ljava/lang/String;

.field protected mVideoView:Landroid/view/TextureView;

.field private mZoom:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 65
    invoke-direct {p0, p1, v0}, Lcom/tencent/rtmp/ui/TXCloudVideoView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    const/4 p2, 0x0

    .line 5
    iput p2, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mCaptureWidth:I

    .line 6
    .line 7
    iput p2, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mCaptureHeight:I

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput v0, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mLeft:F

    .line 11
    .line 12
    iput v0, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mRight:F

    .line 13
    .line 14
    iput v0, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mTop:F

    .line 15
    .line 16
    iput v0, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mBottom:F

    .line 17
    .line 18
    iput p2, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mFocusAreaSize:I

    .line 19
    .line 20
    const-string v0, ""

    .line 21
    .line 22
    iput-object v0, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mUserId:Ljava/lang/String;

    .line 23
    .line 24
    iput-boolean p2, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mFocus:Z

    .line 25
    .line 26
    iput-boolean p2, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mZoom:Z

    .line 27
    .line 28
    const/4 p2, 0x1

    .line 29
    iput p2, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mCurrentScale:I

    .line 30
    .line 31
    const/4 p2, 0x0

    .line 32
    iput-object p2, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mScaleGestureDetector:Landroid/view/ScaleGestureDetector;

    .line 33
    .line 34
    new-instance v0, Lcom/tencent/rtmp/ui/TXCloudVideoView$2;

    .line 35
    .line 36
    invoke-direct {v0, p0}, Lcom/tencent/rtmp/ui/TXCloudVideoView$2;-><init>(Lcom/tencent/rtmp/ui/TXCloudVideoView;)V

    .line 37
    .line 38
    .line 39
    iput-object v0, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mScaleGestureListener:Landroid/view/ScaleGestureDetector$OnScaleGestureListener;

    .line 40
    .line 41
    new-instance v0, Lcom/tencent/rtmp/ui/TXCloudVideoView$a;

    .line 42
    .line 43
    invoke-direct {v0, p0, p2}, Lcom/tencent/rtmp/ui/TXCloudVideoView$a;-><init>(Lcom/tencent/rtmp/ui/TXCloudVideoView;Lcom/tencent/rtmp/ui/TXCloudVideoView$1;)V

    .line 44
    .line 45
    .line 46
    iput-object v0, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mTouchFocusRunnable:Lcom/tencent/rtmp/ui/TXCloudVideoView$a;

    .line 47
    .line 48
    new-instance p2, Lcom/tencent/rtmp/ui/TXDashBoard;

    .line 49
    .line 50
    invoke-direct {p2, p1}, Lcom/tencent/rtmp/ui/TXDashBoard;-><init>(Landroid/content/Context;)V

    .line 51
    .line 52
    .line 53
    iput-object p2, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mDashBoard:Lcom/tencent/rtmp/ui/TXDashBoard;

    .line 54
    .line 55
    new-instance p2, Landroid/view/ScaleGestureDetector;

    .line 56
    .line 57
    iget-object v0, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mScaleGestureListener:Landroid/view/ScaleGestureDetector$OnScaleGestureListener;

    .line 58
    .line 59
    invoke-direct {p2, p1, v0}, Landroid/view/ScaleGestureDetector;-><init>(Landroid/content/Context;Landroid/view/ScaleGestureDetector$OnScaleGestureListener;)V

    .line 60
    .line 61
    .line 62
    iput-object p2, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mScaleGestureDetector:Landroid/view/ScaleGestureDetector;

    .line 63
    .line 64
    return-void
.end method

.method public constructor <init>(Landroid/view/SurfaceView;)V
    .locals 2

    .line 66
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/tencent/rtmp/ui/TXCloudVideoView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 67
    iput-object p1, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mSurfaceView:Landroid/view/SurfaceView;

    return-void
.end method

.method public static synthetic access$000(Lcom/tencent/rtmp/ui/TXCloudVideoView;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mLeft:F

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$002(Lcom/tencent/rtmp/ui/TXCloudVideoView;F)F
    .locals 0

    .line 1
    iput p1, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mLeft:F

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$100(Lcom/tencent/rtmp/ui/TXCloudVideoView;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mRight:F

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$102(Lcom/tencent/rtmp/ui/TXCloudVideoView;F)F
    .locals 0

    .line 1
    iput p1, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mRight:F

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$200(Lcom/tencent/rtmp/ui/TXCloudVideoView;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mTop:F

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$202(Lcom/tencent/rtmp/ui/TXCloudVideoView;F)F
    .locals 0

    .line 1
    iput p1, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mTop:F

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$300(Lcom/tencent/rtmp/ui/TXCloudVideoView;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mBottom:F

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$302(Lcom/tencent/rtmp/ui/TXCloudVideoView;F)F
    .locals 0

    .line 1
    iput p1, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mBottom:F

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$400(Lcom/tencent/rtmp/ui/TXCloudVideoView;)Lcom/tencent/liteav/k;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mCapture:Lcom/tencent/liteav/k;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$500(Lcom/tencent/rtmp/ui/TXCloudVideoView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mCurrentScale:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$502(Lcom/tencent/rtmp/ui/TXCloudVideoView;I)I
    .locals 0

    .line 1
    iput p1, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mCurrentScale:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$700(Lcom/tencent/rtmp/ui/TXCloudVideoView;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mFocus:Z

    .line 2
    .line 3
    return p0
.end method

.method private clamp(III)I
    .locals 0

    if-le p1, p3, :cond_0

    return p3

    :cond_0
    if-ge p1, p2, :cond_1

    return p2

    :cond_1
    return p1
.end method

.method private getTouchRect(IIIIF)Landroid/graphics/Rect;
    .locals 2

    .line 1
    iget v0, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mFocusAreaSize:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mGLSurfaceView:Lcom/tencent/liteav/renderer/TXCGLSurfaceView;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    .line 18
    .line 19
    const/high16 v1, 0x428c0000    # 70.0f

    .line 20
    .line 21
    mul-float/2addr v0, v1

    .line 22
    const/high16 v1, 0x3f000000    # 0.5f

    .line 23
    .line 24
    add-float/2addr v0, v1

    .line 25
    float-to-int v0, v0

    .line 26
    iput v0, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mFocusAreaSize:I

    .line 27
    .line 28
    :cond_0
    iget v0, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mFocusAreaSize:I

    .line 29
    .line 30
    int-to-float v0, v0

    .line 31
    mul-float/2addr v0, p5

    .line 32
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 33
    .line 34
    .line 35
    move-result-object p5

    .line 36
    invoke-virtual {p5}, Ljava/lang/Float;->intValue()I

    .line 37
    .line 38
    .line 39
    move-result p5

    .line 40
    div-int/lit8 v0, p5, 0x2

    .line 41
    .line 42
    sub-int/2addr p1, v0

    .line 43
    sub-int/2addr p3, p5

    .line 44
    const/4 v1, 0x0

    .line 45
    invoke-direct {p0, p1, v1, p3}, Lcom/tencent/rtmp/ui/TXCloudVideoView;->clamp(III)I

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    sub-int/2addr p2, v0

    .line 50
    sub-int/2addr p4, p5

    .line 51
    invoke-direct {p0, p2, v1, p4}, Lcom/tencent/rtmp/ui/TXCloudVideoView;->clamp(III)I

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    new-instance p2, Landroid/graphics/Rect;

    .line 56
    .line 57
    add-int p3, p1, p5

    .line 58
    .line 59
    add-int/2addr p5, p0

    .line 60
    invoke-direct {p2, p1, p0, p3, p5}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 61
    .line 62
    .line 63
    return-object p2
.end method

.method public static px2dip(Landroid/content/Context;F)I
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget p0, p0, Landroid/util/DisplayMetrics;->density:F

    .line 10
    .line 11
    div-float/2addr p1, p0

    .line 12
    const/high16 p0, 0x3f000000    # 0.5f

    .line 13
    .line 14
    add-float/2addr p1, p0

    .line 15
    float-to-int p0, p1

    .line 16
    return p0
.end method

.method private updateDbMargin()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mDashBoard:Lcom/tencent/rtmp/ui/TXDashBoard;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget v1, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mLeft:F

    .line 6
    .line 7
    float-to-int v1, v1

    .line 8
    iget v2, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mTop:F

    .line 9
    .line 10
    float-to-int v2, v2

    .line 11
    iget v3, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mRight:F

    .line 12
    .line 13
    float-to-int v3, v3

    .line 14
    iget p0, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mBottom:F

    .line 15
    .line 16
    float-to-int p0, p0

    .line 17
    invoke-virtual {v0, v1, v2, v3, p0}, Lcom/tencent/rtmp/ui/TXDashBoard;->a(IIII)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method


# virtual methods
.method public addVideoView(Landroid/view/TextureView;)V
    .locals 1

    .line 17
    iget-object v0, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mVideoView:Landroid/view/TextureView;

    if-eqz v0, :cond_0

    .line 18
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 19
    :cond_0
    iput-object p1, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mVideoView:Landroid/view/TextureView;

    .line 20
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 21
    invoke-virtual {p0}, Lcom/tencent/rtmp/ui/TXCloudVideoView;->resetLogView()V

    return-void
.end method

.method public addVideoView(Lcom/tencent/liteav/renderer/TXCGLSurfaceView;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mGLSurfaceView:Lcom/tencent/liteav/renderer/TXCGLSurfaceView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iput-object p1, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mGLSurfaceView:Lcom/tencent/liteav/renderer/TXCGLSurfaceView;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/tencent/rtmp/ui/TXCloudVideoView;->resetLogView()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public appendEventInfo(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mDashBoard:Lcom/tencent/rtmp/ui/TXDashBoard;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/tencent/rtmp/ui/TXDashBoard;->a(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public clearLastFrame(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const/16 p1, 0x8

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public clearLog()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mDashBoard:Lcom/tencent/rtmp/ui/TXDashBoard;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/tencent/rtmp/ui/TXDashBoard;->a()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public disableLog(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mDashBoard:Lcom/tencent/rtmp/ui/TXDashBoard;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/tencent/rtmp/ui/TXDashBoard;->a(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public getGLSurfaceView()Lcom/tencent/liteav/renderer/TXCGLSurfaceView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mGLSurfaceView:Lcom/tencent/liteav/renderer/TXCGLSurfaceView;

    .line 2
    .line 3
    return-object p0
.end method

.method public getHWVideoView()Landroid/view/TextureView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mVideoView:Landroid/view/TextureView;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSurfaceView()Landroid/view/SurfaceView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mSurfaceView:Landroid/view/SurfaceView;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUserId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mUserId:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getVideoView()Landroid/view/TextureView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mVideoView:Landroid/view/TextureView;

    .line 2
    .line 3
    return-object p0
.end method

.method public onDestroy()V
    .locals 0

    return-void
.end method

.method public onLayout(ZIIII)V
    .locals 0

    .line 1
    invoke-super/range {p0 .. p5}, Landroid/widget/FrameLayout;->onLayout(ZIIII)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/tencent/rtmp/ui/TXCloudVideoView;->updateDbMargin()V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mDashBoard:Lcom/tencent/rtmp/ui/TXDashBoard;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 16
    .line 17
    .line 18
    move-result p3

    .line 19
    int-to-float p3, p3

    .line 20
    invoke-static {p2, p3}, Lcom/tencent/rtmp/ui/TXCloudVideoView;->px2dip(Landroid/content/Context;F)I

    .line 21
    .line 22
    .line 23
    move-result p2

    .line 24
    int-to-double p2, p2

    .line 25
    const-wide/high16 p4, 0x403e000000000000L    # 30.0

    .line 26
    .line 27
    div-double/2addr p2, p4

    .line 28
    double-to-float p2, p2

    .line 29
    invoke-virtual {p1, p2}, Lcom/tencent/rtmp/ui/TXDashBoard;->setStatusTextSize(F)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mDashBoard:Lcom/tencent/rtmp/ui/TXDashBoard;

    .line 33
    .line 34
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 39
    .line 40
    .line 41
    move-result p3

    .line 42
    int-to-float p3, p3

    .line 43
    invoke-static {p2, p3}, Lcom/tencent/rtmp/ui/TXCloudVideoView;->px2dip(Landroid/content/Context;F)I

    .line 44
    .line 45
    .line 46
    move-result p2

    .line 47
    int-to-double p2, p2

    .line 48
    const-wide/high16 p4, 0x4039000000000000L    # 25.0

    .line 49
    .line 50
    div-double/2addr p2, p4

    .line 51
    double-to-float p2, p2

    .line 52
    invoke-virtual {p1, p2}, Lcom/tencent/rtmp/ui/TXDashBoard;->setEventTextSize(F)V

    .line 53
    .line 54
    .line 55
    :cond_0
    iget p1, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mCaptureWidth:I

    .line 56
    .line 57
    if-eqz p1, :cond_1

    .line 58
    .line 59
    iget p2, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mCaptureHeight:I

    .line 60
    .line 61
    if-eqz p2, :cond_1

    .line 62
    .line 63
    invoke-virtual {p0, p1, p2}, Lcom/tencent/rtmp/ui/TXCloudVideoView;->updateVideoViewSize(II)V

    .line 64
    .line 65
    .line 66
    :cond_1
    return-void
.end method

.method public onPause()V
    .locals 0

    return-void
.end method

.method public onResume()V
    .locals 0

    return-void
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getPointerCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mTouchFocusRunnable:Lcom/tencent/rtmp/ui/TXCloudVideoView$a;

    .line 15
    .line 16
    invoke-virtual {v0, p1}, Lcom/tencent/rtmp/ui/TXCloudVideoView$a;->a(Landroid/view/View;)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mTouchFocusRunnable:Lcom/tencent/rtmp/ui/TXCloudVideoView$a;

    .line 20
    .line 21
    invoke-virtual {p1, p2}, Lcom/tencent/rtmp/ui/TXCloudVideoView$a;->a(Landroid/view/MotionEvent;)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mTouchFocusRunnable:Lcom/tencent/rtmp/ui/TXCloudVideoView$a;

    .line 25
    .line 26
    const-wide/16 v0, 0x64

    .line 27
    .line 28
    invoke-virtual {p0, p1, v0, v1}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getPointerCount()I

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-le p1, v1, :cond_1

    .line 37
    .line 38
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    const/4 v0, 0x2

    .line 43
    if-ne p1, v0, :cond_1

    .line 44
    .line 45
    iget-object p1, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mTouchFocusRunnable:Lcom/tencent/rtmp/ui/TXCloudVideoView$a;

    .line 46
    .line 47
    invoke-virtual {p0, p1}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 48
    .line 49
    .line 50
    const/4 p1, -0x1

    .line 51
    invoke-virtual {p0, p1, p1}, Lcom/tencent/rtmp/ui/TXCloudVideoView;->onTouchFocus(II)V

    .line 52
    .line 53
    .line 54
    iget-object p1, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mScaleGestureDetector:Landroid/view/ScaleGestureDetector;

    .line 55
    .line 56
    if-eqz p1, :cond_1

    .line 57
    .line 58
    iget-boolean v0, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mZoom:Z

    .line 59
    .line 60
    if-eqz v0, :cond_1

    .line 61
    .line 62
    invoke-virtual {p1, p2}, Landroid/view/ScaleGestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 63
    .line 64
    .line 65
    :cond_1
    :goto_0
    iget-boolean p1, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mZoom:Z

    .line 66
    .line 67
    if-eqz p1, :cond_2

    .line 68
    .line 69
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    if-nez p1, :cond_2

    .line 74
    .line 75
    invoke-virtual {p0}, Landroid/view/View;->performClick()Z

    .line 76
    .line 77
    .line 78
    :cond_2
    iget-boolean p0, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mZoom:Z

    .line 79
    .line 80
    return p0
.end method

.method public onTouchFocus(II)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mGLSurfaceView:Lcom/tencent/liteav/renderer/TXCGLSurfaceView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_2

    .line 6
    :cond_0
    if-ltz p1, :cond_1

    .line 7
    .line 8
    if-gez p2, :cond_2

    .line 9
    .line 10
    :cond_1
    move-object v1, p0

    .line 11
    goto :goto_1

    .line 12
    :cond_2
    iget-object v0, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mFocusIndicatorView:Lcom/tencent/liteav/renderer/TXCFocusIndicatorView;

    .line 13
    .line 14
    if-nez v0, :cond_3

    .line 15
    .line 16
    new-instance v0, Lcom/tencent/liteav/renderer/TXCFocusIndicatorView;

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-direct {v0, v1}, Lcom/tencent/liteav/renderer/TXCFocusIndicatorView;-><init>(Landroid/content/Context;)V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mFocusIndicatorView:Lcom/tencent/liteav/renderer/TXCFocusIndicatorView;

    .line 26
    .line 27
    const/4 v1, 0x0

    .line 28
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mFocusIndicatorView:Lcom/tencent/liteav/renderer/TXCFocusIndicatorView;

    .line 32
    .line 33
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_3
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    add-int/lit8 v1, v1, -0x1

    .line 46
    .line 47
    if-eq v0, v1, :cond_4

    .line 48
    .line 49
    iget-object v0, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mFocusIndicatorView:Lcom/tencent/liteav/renderer/TXCFocusIndicatorView;

    .line 50
    .line 51
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mFocusIndicatorView:Lcom/tencent/liteav/renderer/TXCFocusIndicatorView;

    .line 55
    .line 56
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 57
    .line 58
    .line 59
    :cond_4
    :goto_0
    iget-object v0, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mGLSurfaceView:Lcom/tencent/liteav/renderer/TXCGLSurfaceView;

    .line 60
    .line 61
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 62
    .line 63
    .line 64
    move-result v4

    .line 65
    iget-object v0, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mGLSurfaceView:Lcom/tencent/liteav/renderer/TXCGLSurfaceView;

    .line 66
    .line 67
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 68
    .line 69
    .line 70
    move-result v5

    .line 71
    const/high16 v6, 0x3f800000    # 1.0f

    .line 72
    .line 73
    move-object v1, p0

    .line 74
    move v2, p1

    .line 75
    move v3, p2

    .line 76
    invoke-direct/range {v1 .. v6}, Lcom/tencent/rtmp/ui/TXCloudVideoView;->getTouchRect(IIIIF)Landroid/graphics/Rect;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    iget-object p1, v1, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mFocusIndicatorView:Lcom/tencent/liteav/renderer/TXCFocusIndicatorView;

    .line 81
    .line 82
    iget p2, p0, Landroid/graphics/Rect;->left:I

    .line 83
    .line 84
    iget v0, p0, Landroid/graphics/Rect;->top:I

    .line 85
    .line 86
    iget p0, p0, Landroid/graphics/Rect;->right:I

    .line 87
    .line 88
    sub-int/2addr p0, p2

    .line 89
    invoke-virtual {p1, p2, v0, p0}, Lcom/tencent/liteav/renderer/TXCFocusIndicatorView;->show(III)V

    .line 90
    .line 91
    .line 92
    return-void

    .line 93
    :goto_1
    iget-object p0, v1, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mFocusIndicatorView:Lcom/tencent/liteav/renderer/TXCFocusIndicatorView;

    .line 94
    .line 95
    if-eqz p0, :cond_5

    .line 96
    .line 97
    const/16 p1, 0x8

    .line 98
    .line 99
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 100
    .line 101
    .line 102
    :cond_5
    :goto_2
    return-void
.end method

.method public removeFocusIndicatorView()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mFocusIndicatorView:Lcom/tencent/liteav/renderer/TXCFocusIndicatorView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mFocusIndicatorView:Lcom/tencent/liteav/renderer/TXCFocusIndicatorView;

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public removeVideoView()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mVideoView:Landroid/view/TextureView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 7
    .line 8
    .line 9
    iput-object v1, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mVideoView:Landroid/view/TextureView;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mGLSurfaceView:Lcom/tencent/liteav/renderer/TXCGLSurfaceView;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 16
    .line 17
    .line 18
    iput-object v1, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mGLSurfaceView:Lcom/tencent/liteav/renderer/TXCGLSurfaceView;

    .line 19
    .line 20
    :cond_1
    iput-object v1, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mSurfaceView:Landroid/view/SurfaceView;

    .line 21
    .line 22
    return-void
.end method

.method public resetLogView()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mDashBoard:Lcom/tencent/rtmp/ui/TXDashBoard;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mDashBoard:Lcom/tencent/rtmp/ui/TXDashBoard;

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public setDashBoardStatusInfo(Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mDashBoard:Lcom/tencent/rtmp/ui/TXDashBoard;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/tencent/rtmp/ui/TXDashBoard;->a(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setLogMargin(FFFF)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mLeft:F

    .line 2
    .line 3
    iput p2, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mRight:F

    .line 4
    .line 5
    iput p3, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mTop:F

    .line 6
    .line 7
    iput p4, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mBottom:F

    .line 8
    .line 9
    iget-object p0, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mDashBoard:Lcom/tencent/rtmp/ui/TXDashBoard;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    float-to-int p1, p1

    .line 14
    float-to-int p3, p3

    .line 15
    float-to-int p2, p2

    .line 16
    float-to-int p4, p4

    .line 17
    invoke-virtual {p0, p1, p3, p2, p4}, Lcom/tencent/rtmp/ui/TXDashBoard;->a(IIII)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public setLogMarginRatio(FFFF)V
    .locals 6

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 5
    .line 6
    .line 7
    new-instance v0, Lcom/tencent/rtmp/ui/TXCloudVideoView$1;

    .line 8
    .line 9
    move-object v1, p0

    .line 10
    move v2, p1

    .line 11
    move v3, p2

    .line 12
    move v4, p3

    .line 13
    move v5, p4

    .line 14
    invoke-direct/range {v0 .. v5}, Lcom/tencent/rtmp/ui/TXCloudVideoView$1;-><init>(Lcom/tencent/rtmp/ui/TXCloudVideoView;FFFF)V

    .line 15
    .line 16
    .line 17
    const-wide/16 p0, 0x64

    .line 18
    .line 19
    invoke-virtual {v1, v0, p0, p1}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public setLogText(Landroid/os/Bundle;Landroid/os/Bundle;I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mDashBoard:Lcom/tencent/rtmp/ui/TXDashBoard;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3}, Lcom/tencent/rtmp/ui/TXDashBoard;->a(Landroid/os/Bundle;Landroid/os/Bundle;I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setMirror(Z)V
    .locals 0

    return-void
.end method

.method public setRenderMode(I)V
    .locals 0

    return-void
.end method

.method public setRenderRotation(I)V
    .locals 0

    return-void
.end method

.method public setUserId(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mUserId:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public showLog(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mDashBoard:Lcom/tencent/rtmp/ui/TXDashBoard;

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    const/4 p1, 0x2

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 p1, 0x0

    .line 10
    :goto_0
    invoke-virtual {p0, p1}, Lcom/tencent/rtmp/ui/TXDashBoard;->setShowLevel(I)V

    .line 11
    .line 12
    .line 13
    :cond_1
    return-void
.end method

.method public showVideoDebugLog(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mDashBoard:Lcom/tencent/rtmp/ui/TXDashBoard;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/tencent/rtmp/ui/TXDashBoard;->setShowLevel(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public start(ZZLcom/tencent/liteav/k;)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mFocus:Z

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mZoom:Z

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    if-eqz p2, :cond_1

    .line 8
    .line 9
    :cond_0
    invoke-virtual {p0, p0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 10
    .line 11
    .line 12
    iput-object p3, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mCapture:Lcom/tencent/liteav/k;

    .line 13
    .line 14
    :cond_1
    iget-object p0, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mGLSurfaceView:Lcom/tencent/liteav/renderer/TXCGLSurfaceView;

    .line 15
    .line 16
    if-eqz p0, :cond_2

    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 20
    .line 21
    .line 22
    :cond_2
    return-void
.end method

.method public stop(Z)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mFocus:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    iget-boolean v0, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mZoom:Z

    .line 7
    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    :cond_0
    invoke-virtual {p0, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 11
    .line 12
    .line 13
    :cond_1
    iput-object v1, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mCapture:Lcom/tencent/liteav/k;

    .line 14
    .line 15
    if-eqz p1, :cond_2

    .line 16
    .line 17
    iget-object p0, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mGLSurfaceView:Lcom/tencent/liteav/renderer/TXCGLSurfaceView;

    .line 18
    .line 19
    if-eqz p0, :cond_2

    .line 20
    .line 21
    const/16 p1, 0x8

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 24
    .line 25
    .line 26
    :cond_2
    return-void
.end method

.method public updateVideoViewSize(II)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mGLSurfaceView:Lcom/tencent/liteav/renderer/TXCGLSurfaceView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mVideoView:Landroid/view/TextureView;

    .line 7
    .line 8
    if-eqz v0, :cond_5

    .line 9
    .line 10
    :goto_0
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    if-eqz p2, :cond_5

    .line 19
    .line 20
    if-nez v2, :cond_1

    .line 21
    .line 22
    goto :goto_3

    .line 23
    :cond_1
    iput p1, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mCaptureWidth:I

    .line 24
    .line 25
    iput p2, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mCaptureHeight:I

    .line 26
    .line 27
    int-to-float p1, p1

    .line 28
    const/high16 v3, 0x3f800000    # 1.0f

    .line 29
    .line 30
    mul-float/2addr p1, v3

    .line 31
    int-to-float p2, p2

    .line 32
    div-float/2addr p1, p2

    .line 33
    int-to-float p2, v1

    .line 34
    mul-float/2addr v3, p2

    .line 35
    int-to-float v4, v2

    .line 36
    div-float/2addr v3, v4

    .line 37
    cmpl-float v3, p1, v3

    .line 38
    .line 39
    const/4 v5, 0x0

    .line 40
    if-lez v3, :cond_2

    .line 41
    .line 42
    div-float/2addr p2, p1

    .line 43
    float-to-int v2, p2

    .line 44
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    sub-int/2addr p0, v2

    .line 49
    div-int/lit8 p0, p0, 0x2

    .line 50
    .line 51
    goto :goto_1

    .line 52
    :cond_2
    mul-float/2addr v4, p1

    .line 53
    float-to-int v1, v4

    .line 54
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    sub-int/2addr p0, v1

    .line 59
    div-int/lit8 p0, p0, 0x2

    .line 60
    .line 61
    move v6, v5

    .line 62
    move v5, p0

    .line 63
    move p0, v6

    .line 64
    :goto_1
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    if-eqz p1, :cond_4

    .line 69
    .line 70
    check-cast p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 71
    .line 72
    iget p2, p1, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 73
    .line 74
    if-ne p2, v1, :cond_3

    .line 75
    .line 76
    iget p2, p1, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 77
    .line 78
    if-ne p2, v2, :cond_3

    .line 79
    .line 80
    goto :goto_3

    .line 81
    :cond_3
    iput v1, p1, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 82
    .line 83
    iput v2, p1, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 84
    .line 85
    goto :goto_2

    .line 86
    :cond_4
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 87
    .line 88
    invoke-direct {p1, v1, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 89
    .line 90
    .line 91
    :goto_2
    iput v5, p1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 92
    .line 93
    iput p0, p1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 94
    .line 95
    invoke-virtual {v0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 96
    .line 97
    .line 98
    :cond_5
    :goto_3
    return-void
.end method
