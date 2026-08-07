.class public Lcom/immomo/velib/player/VideoEffectView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Ll/dam;


# static fields
.field public static final ALIGN_BOTTOM:I = 0x1

.field public static final CENTER_CROP:I = 0x0

.field public static final FIXED_SIZE:I = 0x2

.field private static final STATE_ERROR:I = -0x1

.field private static final STATE_IDLE:I = 0x0

.field private static final STATE_PLAYBACK_COMPLETED:I = 0x5

.field private static final STATE_PLAYING:I = 0x3

.field private static final STATE_PREPARED:I = 0x2

.field private static final STATE_PREPARING:I = 0x1

.field public static final SURFACE_VIEW:I = 0x1

.field public static final TEXTURE_VIEW:I = 0x2

.field private static final sDefaultVideoHeight:I = 0x500

.field private static final sDefaultVideoWidth:I = 0x2d0


# instance fields
.field private isLayout:Z

.field private isStartFuncCalled:Z

.field private mCompletionListener:Lcom/immomo/velib/player/d$b;

.field private mConfig:Lcom/immomo/velib/player/a;

.field private mCurrentState:I

.field private mEffectView:Lcom/immomo/velib/player/e;

.field private mElementProxy:Lcom/immomo/velib/player/b;

.field private mErrorListener:Lcom/immomo/velib/player/d$c;

.field private mGiftLocation:Lcom/immomo/velib/anim/model/Location;

.field mPlayer:Lcom/immomo/velib/player/d;

.field private mPositionChangedListener:Lcom/immomo/velib/player/d$f;

.field private mPreparedListener:Lcom/immomo/velib/player/d$d;

.field private mRenderHeight:I

.field private mRenderMode:I

.field private mRenderWidth:I

.field private mScreenWidth:I

.field private mSurfaceLayoutMode:I

.field private mVideoHeight:I

.field private mVideoWidth:I

.field private mVisualHeight:I

.field private mVisualWidth:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 18
    invoke-direct {p0, p1, v0}, Lcom/immomo/velib/player/VideoEffectView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 17
    invoke-direct {p0, p1, p2, v0}, Lcom/immomo/velib/player/VideoEffectView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput p1, p0, Lcom/immomo/velib/player/VideoEffectView;->mCurrentState:I

    .line 6
    .line 7
    iput-boolean p1, p0, Lcom/immomo/velib/player/VideoEffectView;->isStartFuncCalled:Z

    .line 8
    .line 9
    iput-boolean p1, p0, Lcom/immomo/velib/player/VideoEffectView;->isLayout:Z

    .line 10
    .line 11
    iput p1, p0, Lcom/immomo/velib/player/VideoEffectView;->mSurfaceLayoutMode:I

    .line 12
    .line 13
    invoke-direct {p0}, Lcom/immomo/velib/player/VideoEffectView;->init()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x15
    .end annotation

    .line 19
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    const/4 p1, 0x0

    .line 20
    iput p1, p0, Lcom/immomo/velib/player/VideoEffectView;->mCurrentState:I

    .line 21
    iput-boolean p1, p0, Lcom/immomo/velib/player/VideoEffectView;->isStartFuncCalled:Z

    .line 22
    iput-boolean p1, p0, Lcom/immomo/velib/player/VideoEffectView;->isLayout:Z

    .line 23
    iput p1, p0, Lcom/immomo/velib/player/VideoEffectView;->mSurfaceLayoutMode:I

    .line 24
    invoke-direct {p0}, Lcom/immomo/velib/player/VideoEffectView;->init()V

    return-void
.end method

.method public static synthetic access$000(Lcom/immomo/velib/player/VideoEffectView;)Lcom/immomo/velib/player/e;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/velib/player/VideoEffectView;->mEffectView:Lcom/immomo/velib/player/e;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$100(Lcom/immomo/velib/player/VideoEffectView;)Lcom/immomo/velib/player/a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/velib/player/VideoEffectView;->mConfig:Lcom/immomo/velib/player/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$200(Lcom/immomo/velib/player/VideoEffectView;)Lcom/immomo/velib/player/b;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/velib/player/VideoEffectView;->mElementProxy:Lcom/immomo/velib/player/b;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$300(Lcom/immomo/velib/player/VideoEffectView;)Lcom/immomo/velib/player/d$b;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/velib/player/VideoEffectView;->mCompletionListener:Lcom/immomo/velib/player/d$b;

    .line 2
    .line 3
    return-object p0
.end method

.method private addStickerElement(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/dkl0;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ll/dkl0;

    .line 18
    .line 19
    iget-object v1, p0, Lcom/immomo/velib/player/VideoEffectView;->mPlayer:Lcom/immomo/velib/player/d;

    .line 20
    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    invoke-interface {v1, v0}, Lcom/immomo/velib/player/d;->i(Ll/dkl0;)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    return-void
.end method

.method private calculateRenderSize(Lcom/immomo/velib/player/a;)V
    .locals 3

    .line 1
    iget v0, p1, Lcom/immomo/velib/player/a;->c:I

    .line 2
    .line 3
    iput v0, p0, Lcom/immomo/velib/player/VideoEffectView;->mRenderWidth:I

    .line 4
    .line 5
    iget v1, p1, Lcom/immomo/velib/player/a;->d:I

    .line 6
    .line 7
    iput v1, p0, Lcom/immomo/velib/player/VideoEffectView;->mRenderHeight:I

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    return-void

    .line 15
    :cond_1
    :goto_0
    iget-object v0, p1, Lcom/immomo/velib/player/a;->e:Lcom/immomo/velib/anim/model/VideoEffectModel;

    .line 16
    .line 17
    if-eqz v0, :cond_3

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/immomo/velib/anim/model/VideoEffectModel;->getLocation()Lcom/immomo/velib/anim/model/Location;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    if-eqz v0, :cond_3

    .line 24
    .line 25
    iget-object p1, p1, Lcom/immomo/velib/player/a;->e:Lcom/immomo/velib/anim/model/VideoEffectModel;

    .line 26
    .line 27
    invoke-virtual {p1}, Lcom/immomo/velib/anim/model/VideoEffectModel;->getLocation()Lcom/immomo/velib/anim/model/Location;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    iget v0, p0, Lcom/immomo/velib/player/VideoEffectView;->mScreenWidth:I

    .line 32
    .line 33
    int-to-float v0, v0

    .line 34
    invoke-virtual {p1}, Lcom/immomo/velib/anim/model/Location;->getWidth()F

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    mul-float/2addr v0, v1

    .line 39
    float-to-int v0, v0

    .line 40
    iput v0, p0, Lcom/immomo/velib/player/VideoEffectView;->mRenderWidth:I

    .line 41
    .line 42
    iget v0, p0, Lcom/immomo/velib/player/VideoEffectView;->mVisualWidth:I

    .line 43
    .line 44
    int-to-float v0, v0

    .line 45
    invoke-virtual {p1}, Lcom/immomo/velib/anim/model/Location;->getWh()F

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    const/4 v2, 0x0

    .line 50
    cmpl-float v1, v1, v2

    .line 51
    .line 52
    if-nez v1, :cond_2

    .line 53
    .line 54
    const/high16 p1, 0x3f800000    # 1.0f

    .line 55
    .line 56
    goto :goto_1

    .line 57
    :cond_2
    invoke-virtual {p1}, Lcom/immomo/velib/anim/model/Location;->getWh()F

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    :goto_1
    div-float/2addr v0, p1

    .line 62
    float-to-int p1, v0

    .line 63
    iput p1, p0, Lcom/immomo/velib/player/VideoEffectView;->mRenderHeight:I

    .line 64
    .line 65
    return-void

    .line 66
    :cond_3
    iget-object p1, p1, Lcom/immomo/velib/player/a;->e:Lcom/immomo/velib/anim/model/VideoEffectModel;

    .line 67
    .line 68
    if-eqz p1, :cond_5

    .line 69
    .line 70
    invoke-virtual {p1}, Lcom/immomo/velib/anim/model/VideoEffectModel;->getWidth()I

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    if-nez v0, :cond_4

    .line 75
    .line 76
    goto :goto_2

    .line 77
    :cond_4
    invoke-virtual {p1}, Lcom/immomo/velib/anim/model/VideoEffectModel;->getWidth()I

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    goto :goto_3

    .line 82
    :cond_5
    :goto_2
    const/16 v0, 0x2d0

    .line 83
    .line 84
    :goto_3
    iput v0, p0, Lcom/immomo/velib/player/VideoEffectView;->mRenderWidth:I

    .line 85
    .line 86
    if-eqz p1, :cond_7

    .line 87
    .line 88
    invoke-virtual {p1}, Lcom/immomo/velib/anim/model/VideoEffectModel;->getHeight()I

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    if-nez v0, :cond_6

    .line 93
    .line 94
    goto :goto_4

    .line 95
    :cond_6
    invoke-virtual {p1}, Lcom/immomo/velib/anim/model/VideoEffectModel;->getHeight()I

    .line 96
    .line 97
    .line 98
    move-result p1

    .line 99
    goto :goto_5

    .line 100
    :cond_7
    :goto_4
    const/16 p1, 0x500

    .line 101
    .line 102
    :goto_5
    iput p1, p0, Lcom/immomo/velib/player/VideoEffectView;->mRenderHeight:I

    .line 103
    .line 104
    return-void
.end method

.method private getEffectView()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/velib/player/VideoEffectView;->mEffectView:Lcom/immomo/velib/player/e;

    .line 2
    .line 3
    check-cast p0, Landroid/view/View;

    .line 4
    .line 5
    return-object p0
.end method

.method private init()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Lcom/immomo/velib/player/VideoEffectView;->setRenderMode(I)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Ll/wnk0;->c(Landroid/content/Context;)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iput v0, p0, Lcom/immomo/velib/player/VideoEffectView;->mScreenWidth:I

    .line 14
    .line 15
    new-instance v0, Lcom/immomo/velib/player/b;

    .line 16
    .line 17
    invoke-direct {v0}, Lcom/immomo/velib/player/b;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Lcom/immomo/velib/player/VideoEffectView;->mElementProxy:Lcom/immomo/velib/player/b;

    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    iput v0, p0, Lcom/immomo/velib/player/VideoEffectView;->mCurrentState:I

    .line 24
    .line 25
    return-void
.end method

.method private layoutAlignBottom(IIII)V
    .locals 3

    .line 1
    iget v0, p0, Lcom/immomo/velib/player/VideoEffectView;->mVideoWidth:I

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget v0, p0, Lcom/immomo/velib/player/VideoEffectView;->mVideoHeight:I

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    :cond_0
    const/16 v0, 0x2d0

    .line 10
    .line 11
    iput v0, p0, Lcom/immomo/velib/player/VideoEffectView;->mVideoWidth:I

    .line 12
    .line 13
    const/16 v0, 0x500

    .line 14
    .line 15
    iput v0, p0, Lcom/immomo/velib/player/VideoEffectView;->mVideoHeight:I

    .line 16
    .line 17
    :cond_1
    sub-int/2addr p3, p1

    .line 18
    sub-int/2addr p4, p2

    .line 19
    int-to-float v0, p3

    .line 20
    iget v1, p0, Lcom/immomo/velib/player/VideoEffectView;->mVideoWidth:I

    .line 21
    .line 22
    int-to-float v1, v1

    .line 23
    div-float/2addr v0, v1

    .line 24
    iget v1, p0, Lcom/immomo/velib/player/VideoEffectView;->mVideoHeight:I

    .line 25
    .line 26
    int-to-float v2, v1

    .line 27
    mul-float/2addr v2, v0

    .line 28
    int-to-float v0, v1

    .line 29
    sub-float/2addr v2, v0

    .line 30
    const/high16 v0, 0x3f000000    # 0.5f

    .line 31
    .line 32
    mul-float/2addr v2, v0

    .line 33
    invoke-direct {p0}, Lcom/immomo/velib/player/VideoEffectView;->getEffectView()Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    int-to-float p2, p2

    .line 38
    add-float/2addr p2, v2

    .line 39
    float-to-int p2, p2

    .line 40
    invoke-virtual {p0, p1, p2, p3, p4}, Landroid/view/View;->layout(IIII)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method private layoutCenterCrop(IIII)V
    .locals 4

    .line 1
    iget v0, p0, Lcom/immomo/velib/player/VideoEffectView;->mVideoWidth:I

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget v0, p0, Lcom/immomo/velib/player/VideoEffectView;->mVideoHeight:I

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    :cond_0
    const/16 v0, 0x2d0

    .line 10
    .line 11
    iput v0, p0, Lcom/immomo/velib/player/VideoEffectView;->mVideoWidth:I

    .line 12
    .line 13
    const/16 v0, 0x500

    .line 14
    .line 15
    iput v0, p0, Lcom/immomo/velib/player/VideoEffectView;->mVideoHeight:I

    .line 16
    .line 17
    :cond_1
    sub-int/2addr p3, p1

    .line 18
    sub-int/2addr p4, p2

    .line 19
    iget p1, p0, Lcom/immomo/velib/player/VideoEffectView;->mVideoWidth:I

    .line 20
    .line 21
    mul-int p2, p1, p4

    .line 22
    .line 23
    iget v0, p0, Lcom/immomo/velib/player/VideoEffectView;->mVideoHeight:I

    .line 24
    .line 25
    mul-int v1, p3, v0

    .line 26
    .line 27
    const/high16 v2, 0x3f000000    # 0.5f

    .line 28
    .line 29
    const/4 v3, 0x0

    .line 30
    if-le p2, v1, :cond_2

    .line 31
    .line 32
    int-to-float p2, p4

    .line 33
    int-to-float v0, v0

    .line 34
    div-float/2addr p2, v0

    .line 35
    int-to-float v0, p3

    .line 36
    int-to-float p1, p1

    .line 37
    mul-float/2addr p1, p2

    .line 38
    sub-float/2addr v0, p1

    .line 39
    mul-float/2addr v0, v2

    .line 40
    move p1, v3

    .line 41
    move v3, v0

    .line 42
    goto :goto_0

    .line 43
    :cond_2
    int-to-float p2, p3

    .line 44
    int-to-float p1, p1

    .line 45
    div-float/2addr p2, p1

    .line 46
    int-to-float p1, p4

    .line 47
    int-to-float v0, v0

    .line 48
    mul-float/2addr v0, p2

    .line 49
    sub-float/2addr p1, v0

    .line 50
    mul-float/2addr p1, v2

    .line 51
    :goto_0
    invoke-direct {p0}, Lcom/immomo/velib/player/VideoEffectView;->getEffectView()Landroid/view/View;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    float-to-int p2, v3

    .line 56
    float-to-int v0, p1

    .line 57
    int-to-float p3, p3

    .line 58
    sub-float/2addr p3, v3

    .line 59
    float-to-int p3, p3

    .line 60
    int-to-float p4, p4

    .line 61
    sub-float/2addr p4, p1

    .line 62
    float-to-int p1, p4

    .line 63
    invoke-virtual {p0, p2, v0, p3, p1}, Landroid/view/View;->layout(IIII)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method private layoutFixedSize(IIII)V
    .locals 3

    .line 1
    iget v0, p0, Lcom/immomo/velib/player/VideoEffectView;->mVisualWidth:I

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget v0, p0, Lcom/immomo/velib/player/VideoEffectView;->mVisualHeight:I

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    :cond_0
    const/16 v0, 0x2d0

    .line 10
    .line 11
    iput v0, p0, Lcom/immomo/velib/player/VideoEffectView;->mVisualWidth:I

    .line 12
    .line 13
    const/16 v0, 0x500

    .line 14
    .line 15
    iput v0, p0, Lcom/immomo/velib/player/VideoEffectView;->mVisualHeight:I

    .line 16
    .line 17
    :cond_1
    sub-int/2addr p3, p1

    .line 18
    sub-int/2addr p4, p2

    .line 19
    iget-object v0, p0, Lcom/immomo/velib/player/VideoEffectView;->mGiftLocation:Lcom/immomo/velib/anim/model/Location;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/immomo/velib/anim/model/Location;->getX()F

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    int-to-float p3, p3

    .line 26
    mul-float/2addr v0, p3

    .line 27
    float-to-int p3, v0

    .line 28
    iget-object v0, p0, Lcom/immomo/velib/player/VideoEffectView;->mGiftLocation:Lcom/immomo/velib/anim/model/Location;

    .line 29
    .line 30
    invoke-virtual {v0}, Lcom/immomo/velib/anim/model/Location;->getY()F

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    int-to-float p4, p4

    .line 35
    mul-float/2addr v0, p4

    .line 36
    float-to-int p4, v0

    .line 37
    iget-object v0, p0, Lcom/immomo/velib/player/VideoEffectView;->mGiftLocation:Lcom/immomo/velib/anim/model/Location;

    .line 38
    .line 39
    invoke-virtual {v0}, Lcom/immomo/velib/anim/model/Location;->getAnchor()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    const v2, -0x514d33ab

    .line 48
    .line 49
    .line 50
    if-eq v1, v2, :cond_6

    .line 51
    .line 52
    const/16 v2, 0xd76

    .line 53
    .line 54
    if-eq v1, v2, :cond_5

    .line 55
    .line 56
    const/16 v2, 0xd88

    .line 57
    .line 58
    if-eq v1, v2, :cond_4

    .line 59
    .line 60
    const/16 v2, 0xe30

    .line 61
    .line 62
    if-eq v1, v2, :cond_3

    .line 63
    .line 64
    const/16 v2, 0xe42

    .line 65
    .line 66
    if-eq v1, v2, :cond_2

    .line 67
    .line 68
    goto :goto_1

    .line 69
    :cond_2
    const-string v1, "rt"

    .line 70
    .line 71
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-eqz v0, :cond_7

    .line 76
    .line 77
    add-int/2addr p1, p3

    .line 78
    iget p3, p0, Lcom/immomo/velib/player/VideoEffectView;->mVisualWidth:I

    .line 79
    .line 80
    sub-int p3, p1, p3

    .line 81
    .line 82
    add-int/2addr p2, p4

    .line 83
    iget p4, p0, Lcom/immomo/velib/player/VideoEffectView;->mVisualHeight:I

    .line 84
    .line 85
    :goto_0
    add-int/2addr p4, p2

    .line 86
    goto :goto_2

    .line 87
    :cond_3
    const-string v1, "rb"

    .line 88
    .line 89
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    if-eqz v0, :cond_7

    .line 94
    .line 95
    add-int/2addr p1, p3

    .line 96
    iget p3, p0, Lcom/immomo/velib/player/VideoEffectView;->mVisualWidth:I

    .line 97
    .line 98
    sub-int p3, p1, p3

    .line 99
    .line 100
    add-int/2addr p4, p2

    .line 101
    iget p2, p0, Lcom/immomo/velib/player/VideoEffectView;->mVisualHeight:I

    .line 102
    .line 103
    sub-int p2, p4, p2

    .line 104
    .line 105
    goto :goto_2

    .line 106
    :cond_4
    const-string v1, "lt"

    .line 107
    .line 108
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    if-eqz v0, :cond_7

    .line 113
    .line 114
    add-int/2addr p3, p1

    .line 115
    add-int/2addr p2, p4

    .line 116
    iget p1, p0, Lcom/immomo/velib/player/VideoEffectView;->mVisualWidth:I

    .line 117
    .line 118
    add-int/2addr p1, p3

    .line 119
    iget p4, p0, Lcom/immomo/velib/player/VideoEffectView;->mVisualHeight:I

    .line 120
    .line 121
    goto :goto_0

    .line 122
    :cond_5
    const-string v1, "lb"

    .line 123
    .line 124
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 125
    .line 126
    .line 127
    move-result v0

    .line 128
    if-eqz v0, :cond_7

    .line 129
    .line 130
    add-int/2addr p3, p1

    .line 131
    add-int/2addr p4, p2

    .line 132
    iget p1, p0, Lcom/immomo/velib/player/VideoEffectView;->mVisualHeight:I

    .line 133
    .line 134
    sub-int p2, p4, p1

    .line 135
    .line 136
    iget p1, p0, Lcom/immomo/velib/player/VideoEffectView;->mVisualWidth:I

    .line 137
    .line 138
    add-int/2addr p1, p3

    .line 139
    goto :goto_2

    .line 140
    :cond_6
    const-string v1, "center"

    .line 141
    .line 142
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 143
    .line 144
    .line 145
    move-result v0

    .line 146
    :cond_7
    :goto_1
    add-int/2addr p1, p3

    .line 147
    iget p3, p0, Lcom/immomo/velib/player/VideoEffectView;->mVisualWidth:I

    .line 148
    .line 149
    div-int/lit8 v0, p3, 0x2

    .line 150
    .line 151
    sub-int v0, p1, v0

    .line 152
    .line 153
    add-int/2addr p2, p4

    .line 154
    iget p4, p0, Lcom/immomo/velib/player/VideoEffectView;->mVisualHeight:I

    .line 155
    .line 156
    div-int/lit8 v1, p4, 0x2

    .line 157
    .line 158
    sub-int v1, p2, v1

    .line 159
    .line 160
    div-int/lit8 p3, p3, 0x2

    .line 161
    .line 162
    add-int/2addr p1, p3

    .line 163
    div-int/lit8 p4, p4, 0x2

    .line 164
    .line 165
    add-int/2addr p4, p2

    .line 166
    move p3, v0

    .line 167
    move p2, v1

    .line 168
    :goto_2
    invoke-direct {p0}, Lcom/immomo/velib/player/VideoEffectView;->getEffectView()Landroid/view/View;

    .line 169
    .line 170
    .line 171
    move-result-object p0

    .line 172
    invoke-virtual {p0, p3, p2, p1, p4}, Landroid/view/View;->layout(IIII)V

    .line 173
    .line 174
    .line 175
    return-void
.end method

.method private openVideo()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/immomo/velib/player/VideoEffectView;->mConfig:Lcom/immomo/velib/player/a;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, v0, Lcom/immomo/velib/player/a;->a:Landroid/net/Uri;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    new-instance v0, Lcom/immomo/velib/player/c;

    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-direct {v0, v1}, Lcom/immomo/velib/player/c;-><init>(Landroid/content/Context;)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Lcom/immomo/velib/player/VideoEffectView;->mPlayer:Lcom/immomo/velib/player/d;

    .line 20
    .line 21
    iget-object v1, p0, Lcom/immomo/velib/player/VideoEffectView;->mConfig:Lcom/immomo/velib/player/a;

    .line 22
    .line 23
    invoke-interface {v0, v1}, Lcom/immomo/velib/player/d;->m(Lcom/immomo/velib/player/a;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/immomo/velib/player/VideoEffectView;->mPlayer:Lcom/immomo/velib/player/d;

    .line 27
    .line 28
    iget-object v1, p0, Lcom/immomo/velib/player/VideoEffectView;->mConfig:Lcom/immomo/velib/player/a;

    .line 29
    .line 30
    iget-object v1, v1, Lcom/immomo/velib/player/a;->a:Landroid/net/Uri;

    .line 31
    .line 32
    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    iget-object v2, p0, Lcom/immomo/velib/player/VideoEffectView;->mConfig:Lcom/immomo/velib/player/a;

    .line 37
    .line 38
    iget v2, v2, Lcom/immomo/velib/player/a;->b:I

    .line 39
    .line 40
    invoke-interface {v0, v1, v2}, Lcom/immomo/velib/player/d;->k(Ljava/lang/String;I)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/immomo/velib/player/VideoEffectView;->mConfig:Lcom/immomo/velib/player/a;

    .line 44
    .line 45
    invoke-direct {p0, v0}, Lcom/immomo/velib/player/VideoEffectView;->calculateRenderSize(Lcom/immomo/velib/player/a;)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lcom/immomo/velib/player/VideoEffectView;->mPlayer:Lcom/immomo/velib/player/d;

    .line 49
    .line 50
    iget v1, p0, Lcom/immomo/velib/player/VideoEffectView;->mRenderWidth:I

    .line 51
    .line 52
    iget v2, p0, Lcom/immomo/velib/player/VideoEffectView;->mRenderHeight:I

    .line 53
    .line 54
    invoke-interface {v0, v1, v2}, Lcom/immomo/velib/player/d;->f(II)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lcom/immomo/velib/player/VideoEffectView;->mPlayer:Lcom/immomo/velib/player/d;

    .line 58
    .line 59
    new-instance v1, Lcom/immomo/velib/player/VideoEffectView$a;

    .line 60
    .line 61
    invoke-direct {v1, p0}, Lcom/immomo/velib/player/VideoEffectView$a;-><init>(Lcom/immomo/velib/player/VideoEffectView;)V

    .line 62
    .line 63
    .line 64
    invoke-interface {v0, v1}, Lcom/immomo/velib/player/d;->g(Lcom/immomo/velib/player/d$e;)V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Lcom/immomo/velib/player/VideoEffectView;->mPlayer:Lcom/immomo/velib/player/d;

    .line 68
    .line 69
    new-instance v1, Lcom/immomo/velib/player/VideoEffectView$b;

    .line 70
    .line 71
    invoke-direct {v1, p0}, Lcom/immomo/velib/player/VideoEffectView$b;-><init>(Lcom/immomo/velib/player/VideoEffectView;)V

    .line 72
    .line 73
    .line 74
    invoke-interface {v0, v1}, Lcom/immomo/velib/player/d;->j(Lcom/immomo/velib/player/d$b;)V

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Lcom/immomo/velib/player/VideoEffectView;->mPlayer:Lcom/immomo/velib/player/d;

    .line 78
    .line 79
    new-instance v1, Lcom/immomo/velib/player/VideoEffectView$c;

    .line 80
    .line 81
    invoke-direct {v1, p0}, Lcom/immomo/velib/player/VideoEffectView$c;-><init>(Lcom/immomo/velib/player/VideoEffectView;)V

    .line 82
    .line 83
    .line 84
    invoke-interface {v0, v1}, Lcom/immomo/velib/player/d;->l(Lcom/immomo/velib/player/d$c;)V

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Lcom/immomo/velib/player/VideoEffectView;->mPlayer:Lcom/immomo/velib/player/d;

    .line 88
    .line 89
    new-instance v1, Lcom/immomo/velib/player/VideoEffectView$d;

    .line 90
    .line 91
    invoke-direct {v1, p0}, Lcom/immomo/velib/player/VideoEffectView$d;-><init>(Lcom/immomo/velib/player/VideoEffectView;)V

    .line 92
    .line 93
    .line 94
    invoke-interface {v0, v1}, Lcom/immomo/velib/player/d;->n(Lcom/immomo/velib/player/d$f;)V

    .line 95
    .line 96
    .line 97
    :cond_1
    :goto_0
    return-void
.end method

.method private openVideoAsync()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/immomo/velib/player/VideoEffectView;->openVideo()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/immomo/velib/player/VideoEffectView;->mPlayer:Lcom/immomo/velib/player/d;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    new-instance v1, Lcom/immomo/velib/player/VideoEffectView$e;

    .line 9
    .line 10
    invoke-direct {v1, p0}, Lcom/immomo/velib/player/VideoEffectView$e;-><init>(Lcom/immomo/velib/player/VideoEffectView;)V

    .line 11
    .line 12
    .line 13
    invoke-interface {v0, v1}, Lcom/immomo/velib/player/d;->e(Lcom/immomo/velib/player/d$d;)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/immomo/velib/player/VideoEffectView;->mPlayer:Lcom/immomo/velib/player/d;

    .line 17
    .line 18
    invoke-interface {p0}, Lcom/immomo/velib/player/d;->prepareAsync()V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method private setEffectViewLayoutParams(Lcom/immomo/velib/anim/model/Location;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Lcom/immomo/velib/player/VideoEffectView;->getEffectView()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    const/16 p1, 0x2d0

    .line 12
    .line 13
    iput p1, p0, Lcom/immomo/velib/player/VideoEffectView;->mVideoWidth:I

    .line 14
    .line 15
    const/16 p1, 0x500

    .line 16
    .line 17
    iput p1, p0, Lcom/immomo/velib/player/VideoEffectView;->mVideoHeight:I

    .line 18
    .line 19
    const/4 p1, -0x1

    .line 20
    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 21
    .line 22
    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 23
    .line 24
    goto :goto_1

    .line 25
    :cond_0
    iget v1, p0, Lcom/immomo/velib/player/VideoEffectView;->mScreenWidth:I

    .line 26
    .line 27
    int-to-float v1, v1

    .line 28
    invoke-virtual {p1}, Lcom/immomo/velib/anim/model/Location;->getWidth()F

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    mul-float/2addr v1, v2

    .line 33
    float-to-int v1, v1

    .line 34
    iput v1, p0, Lcom/immomo/velib/player/VideoEffectView;->mVisualWidth:I

    .line 35
    .line 36
    int-to-float v1, v1

    .line 37
    invoke-virtual {p1}, Lcom/immomo/velib/anim/model/Location;->getWh()F

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    const/4 v3, 0x0

    .line 42
    cmpl-float v2, v2, v3

    .line 43
    .line 44
    if-nez v2, :cond_1

    .line 45
    .line 46
    const/high16 p1, 0x3f800000    # 1.0f

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    invoke-virtual {p1}, Lcom/immomo/velib/anim/model/Location;->getWh()F

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    :goto_0
    div-float/2addr v1, p1

    .line 54
    float-to-int p1, v1

    .line 55
    iput p1, p0, Lcom/immomo/velib/player/VideoEffectView;->mVisualHeight:I

    .line 56
    .line 57
    iget v1, p0, Lcom/immomo/velib/player/VideoEffectView;->mVisualWidth:I

    .line 58
    .line 59
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 60
    .line 61
    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 62
    .line 63
    :goto_1
    invoke-direct {p0}, Lcom/immomo/velib/player/VideoEffectView;->getEffectView()Landroid/view/View;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 68
    .line 69
    .line 70
    return-void
.end method


# virtual methods
.method public isPlaying()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/immomo/velib/player/VideoEffectView;->mCurrentState:I

    .line 2
    .line 3
    const/4 v0, 0x3

    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public onEffectElementComplete(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/dkl0;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/velib/player/VideoEffectView;->addStickerElement(Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x2

    .line 5
    iput p1, p0, Lcom/immomo/velib/player/VideoEffectView;->mCurrentState:I

    .line 6
    .line 7
    iget-boolean p1, p0, Lcom/immomo/velib/player/VideoEffectView;->isStartFuncCalled:Z

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/immomo/velib/player/VideoEffectView;->start()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object p0, p0, Lcom/immomo/velib/player/VideoEffectView;->mPreparedListener:Lcom/immomo/velib/player/d$d;

    .line 16
    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    invoke-interface {p0}, Lcom/immomo/velib/player/d$d;->a()V

    .line 20
    .line 21
    .line 22
    :cond_1
    return-void
.end method

.method public onLayout(ZIIII)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget-boolean p1, p0, Lcom/immomo/velib/player/VideoEffectView;->isLayout:Z

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget p1, p0, Lcom/immomo/velib/player/VideoEffectView;->mSurfaceLayoutMode:I

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    if-ne p1, v0, :cond_1

    .line 12
    .line 13
    invoke-direct {p0, p2, p3, p4, p5}, Lcom/immomo/velib/player/VideoEffectView;->layoutAlignBottom(IIII)V

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    const/4 v1, 0x2

    .line 18
    if-ne p1, v1, :cond_2

    .line 19
    .line 20
    iget-object p1, p0, Lcom/immomo/velib/player/VideoEffectView;->mGiftLocation:Lcom/immomo/velib/anim/model/Location;

    .line 21
    .line 22
    if-eqz p1, :cond_2

    .line 23
    .line 24
    invoke-direct {p0, p2, p3, p4, p5}, Lcom/immomo/velib/player/VideoEffectView;->layoutFixedSize(IIII)V

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_2
    invoke-direct {p0, p2, p3, p4, p5}, Lcom/immomo/velib/player/VideoEffectView;->layoutCenterCrop(IIII)V

    .line 29
    .line 30
    .line 31
    :goto_0
    iput-boolean v0, p0, Lcom/immomo/velib/player/VideoEffectView;->isLayout:Z

    .line 32
    .line 33
    return-void
.end method

.method public onPlayerCompletion()V
    .locals 1

    .line 1
    const/4 v0, 0x5

    .line 2
    iput v0, p0, Lcom/immomo/velib/player/VideoEffectView;->mCurrentState:I

    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/immomo/velib/player/VideoEffectView;->stop()V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/immomo/velib/player/VideoEffectView;->mCompletionListener:Lcom/immomo/velib/player/d$b;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-interface {p0}, Lcom/immomo/velib/player/d$b;->onCompletion()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public onPlayerError(Lcom/immomo/velib/player/d;ILjava/lang/String;)Z
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    iput v0, p0, Lcom/immomo/velib/player/VideoEffectView;->mCurrentState:I

    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/immomo/velib/player/VideoEffectView;->stop()V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/immomo/velib/player/VideoEffectView;->mErrorListener:Lcom/immomo/velib/player/d$c;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-interface {p0, p1, p2, p3}, Lcom/immomo/velib/player/d$c;->onError(Lcom/immomo/velib/player/d;ILjava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    :cond_0
    const/4 p0, 0x1

    .line 15
    return p0
.end method

.method public onPlayerRenderPositionChanged(J)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/velib/player/VideoEffectView;->mPositionChangedListener:Lcom/immomo/velib/player/d$f;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Lcom/immomo/velib/player/d$f;->renderPositionChanged(J)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public onPlayerVideoSizeChanged(II)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/immomo/velib/player/VideoEffectView;->mVideoWidth:I

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget v1, p0, Lcom/immomo/velib/player/VideoEffectView;->mVideoHeight:I

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    if-ne v1, p2, :cond_0

    .line 10
    .line 11
    if-eq v0, p1, :cond_1

    .line 12
    .line 13
    :cond_0
    iput p1, p0, Lcom/immomo/velib/player/VideoEffectView;->mVideoWidth:I

    .line 14
    .line 15
    iput p2, p0, Lcom/immomo/velib/player/VideoEffectView;->mVideoHeight:I

    .line 16
    .line 17
    const/4 p1, 0x0

    .line 18
    iput-boolean p1, p0, Lcom/immomo/velib/player/VideoEffectView;->isLayout:Z

    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 21
    .line 22
    .line 23
    :cond_1
    iget p1, p0, Lcom/immomo/velib/player/VideoEffectView;->mRenderWidth:I

    .line 24
    .line 25
    iget p2, p0, Lcom/immomo/velib/player/VideoEffectView;->mRenderHeight:I

    .line 26
    .line 27
    if-eqz p1, :cond_2

    .line 28
    .line 29
    if-nez p2, :cond_3

    .line 30
    .line 31
    :cond_2
    iget p1, p0, Lcom/immomo/velib/player/VideoEffectView;->mVideoWidth:I

    .line 32
    .line 33
    iget p2, p0, Lcom/immomo/velib/player/VideoEffectView;->mVideoHeight:I

    .line 34
    .line 35
    :cond_3
    if-lez p1, :cond_4

    .line 36
    .line 37
    if-lez p2, :cond_4

    .line 38
    .line 39
    iget-object p0, p0, Lcom/immomo/velib/player/VideoEffectView;->mEffectView:Lcom/immomo/velib/player/e;

    .line 40
    .line 41
    invoke-interface {p0, p1, p2}, Lcom/immomo/velib/player/e;->a(II)V

    .line 42
    .line 43
    .line 44
    :cond_4
    return-void
.end method

.method public declared-synchronized prepare()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-virtual {p0}, Lcom/immomo/velib/player/VideoEffectView;->prepareAsync()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    .line 5
    monitor-exit p0

    .line 6
    return-void

    .line 7
    :catchall_0
    move-exception v0

    .line 8
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 9
    throw v0
.end method

.method public declared-synchronized prepareAsync()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/immomo/velib/player/VideoEffectView;->mConfig:Lcom/immomo/velib/player/a;

    .line 3
    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    iget v0, p0, Lcom/immomo/velib/player/VideoEffectView;->mCurrentState:I

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 v0, 0x1

    .line 12
    iput v0, p0, Lcom/immomo/velib/player/VideoEffectView;->mCurrentState:I

    .line 13
    .line 14
    invoke-direct {p0}, Lcom/immomo/velib/player/VideoEffectView;->openVideoAsync()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    .line 16
    .line 17
    monitor-exit p0

    .line 18
    return-void

    .line 19
    :catchall_0
    move-exception v0

    .line 20
    goto :goto_1

    .line 21
    :cond_1
    :goto_0
    monitor-exit p0

    .line 22
    return-void

    .line 23
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 24
    throw v0
.end method

.method public setCompletionListener(Lcom/immomo/velib/player/d$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/velib/player/VideoEffectView;->mCompletionListener:Lcom/immomo/velib/player/d$b;

    .line 2
    .line 3
    return-void
.end method

.method public setEffectConfig(Lcom/immomo/velib/player/a;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/immomo/velib/player/a;->e:Lcom/immomo/velib/anim/model/VideoEffectModel;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/immomo/velib/anim/model/VideoEffectModel;->getLocation()Lcom/immomo/velib/anim/model/Location;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    const/4 v1, 0x2

    .line 12
    invoke-virtual {v0}, Lcom/immomo/velib/anim/model/VideoEffectModel;->getLocation()Lcom/immomo/velib/anim/model/Location;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0, v1, v0}, Lcom/immomo/velib/player/VideoEffectView;->setSurfaceLayoutMode(ILcom/immomo/velib/anim/model/Location;)V

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 v1, 0x0

    .line 21
    invoke-virtual {v0}, Lcom/immomo/velib/anim/model/VideoEffectModel;->getLocation()Lcom/immomo/velib/anim/model/Location;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {p0, v1, v0}, Lcom/immomo/velib/player/VideoEffectView;->setSurfaceLayoutMode(ILcom/immomo/velib/anim/model/Location;)V

    .line 26
    .line 27
    .line 28
    :cond_1
    :goto_0
    iput-object p1, p0, Lcom/immomo/velib/player/VideoEffectView;->mConfig:Lcom/immomo/velib/player/a;

    .line 29
    .line 30
    return-void
.end method

.method public setOnErrorListener(Lcom/immomo/velib/player/d$c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/velib/player/VideoEffectView;->mErrorListener:Lcom/immomo/velib/player/d$c;

    .line 2
    .line 3
    return-void
.end method

.method public setOnPreparedListener(Lcom/immomo/velib/player/d$d;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/velib/player/VideoEffectView;->mPreparedListener:Lcom/immomo/velib/player/d$d;

    .line 2
    .line 3
    return-void
.end method

.method public setPositionChangedListener(Lcom/immomo/velib/player/d$f;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/velib/player/VideoEffectView;->mPositionChangedListener:Lcom/immomo/velib/player/d$f;

    .line 2
    .line 3
    return-void
.end method

.method public setRenderMode(I)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/immomo/velib/player/VideoEffectView;->mRenderMode:I

    .line 2
    .line 3
    if-eq v0, p1, :cond_1

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x2

    .line 9
    if-ne p1, v0, :cond_0

    .line 10
    .line 11
    new-instance v0, Lcom/immomo/velib/player/EffectTextureView;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-direct {v0, v1}, Lcom/immomo/velib/player/EffectTextureView;-><init>(Landroid/content/Context;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Lcom/immomo/velib/player/VideoEffectView;->mEffectView:Lcom/immomo/velib/player/e;

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    new-instance v0, Lcom/immomo/velib/player/EffectSurfaceView;

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-direct {v0, v1}, Lcom/immomo/velib/player/EffectSurfaceView;-><init>(Landroid/content/Context;)V

    .line 30
    .line 31
    .line 32
    iput-object v0, p0, Lcom/immomo/velib/player/VideoEffectView;->mEffectView:Lcom/immomo/velib/player/e;

    .line 33
    .line 34
    :goto_0
    iget-object v0, p0, Lcom/immomo/velib/player/VideoEffectView;->mEffectView:Lcom/immomo/velib/player/e;

    .line 35
    .line 36
    new-instance v1, Lcom/immomo/velib/player/VideoEffectView$f;

    .line 37
    .line 38
    invoke-direct {v1, p0}, Lcom/immomo/velib/player/VideoEffectView$f;-><init>(Lcom/immomo/velib/player/VideoEffectView;)V

    .line 39
    .line 40
    .line 41
    invoke-interface {v0, v1}, Lcom/immomo/velib/player/e;->setOnBackgroundListener(Lcom/immomo/velib/player/d$a;)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Lcom/immomo/velib/player/VideoEffectView;->mEffectView:Lcom/immomo/velib/player/e;

    .line 45
    .line 46
    check-cast v0, Landroid/view/View;

    .line 47
    .line 48
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 49
    .line 50
    .line 51
    :cond_1
    iput p1, p0, Lcom/immomo/velib/player/VideoEffectView;->mRenderMode:I

    .line 52
    .line 53
    return-void
.end method

.method public setSurfaceLayoutMode(ILcom/immomo/velib/anim/model/Location;)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/immomo/velib/player/VideoEffectView;->mSurfaceLayoutMode:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eq v0, p1, :cond_0

    .line 5
    .line 6
    iput p1, p0, Lcom/immomo/velib/player/VideoEffectView;->mSurfaceLayoutMode:I

    .line 7
    .line 8
    iput-object p2, p0, Lcom/immomo/velib/player/VideoEffectView;->mGiftLocation:Lcom/immomo/velib/anim/model/Location;

    .line 9
    .line 10
    iput-boolean v1, p0, Lcom/immomo/velib/player/VideoEffectView;->isLayout:Z

    .line 11
    .line 12
    invoke-direct {p0, p2}, Lcom/immomo/velib/player/VideoEffectView;->setEffectViewLayoutParams(Lcom/immomo/velib/anim/model/Location;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    iget-object p1, p0, Lcom/immomo/velib/player/VideoEffectView;->mGiftLocation:Lcom/immomo/velib/anim/model/Location;

    .line 17
    .line 18
    if-eqz p1, :cond_1

    .line 19
    .line 20
    invoke-virtual {p1, p2}, Lcom/immomo/velib/anim/model/Location;->equals(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-nez p1, :cond_1

    .line 25
    .line 26
    iput-object p2, p0, Lcom/immomo/velib/player/VideoEffectView;->mGiftLocation:Lcom/immomo/velib/anim/model/Location;

    .line 27
    .line 28
    iput-boolean v1, p0, Lcom/immomo/velib/player/VideoEffectView;->isLayout:Z

    .line 29
    .line 30
    invoke-direct {p0, p2}, Lcom/immomo/velib/player/VideoEffectView;->setEffectViewLayoutParams(Lcom/immomo/velib/anim/model/Location;)V

    .line 31
    .line 32
    .line 33
    :cond_1
    return-void
.end method

.method public start()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/velib/player/VideoEffectView;->mPlayer:Lcom/immomo/velib/player/d;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget v0, p0, Lcom/immomo/velib/player/VideoEffectView;->mCurrentState:I

    .line 6
    .line 7
    const/4 v1, 0x2

    .line 8
    if-ne v0, v1, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Lcom/immomo/velib/player/VideoEffectView;->mEffectView:Lcom/immomo/velib/player/e;

    .line 11
    .line 12
    invoke-interface {v0}, Lcom/immomo/velib/player/e;->b()V

    .line 13
    .line 14
    .line 15
    const/4 v0, 0x3

    .line 16
    iput v0, p0, Lcom/immomo/velib/player/VideoEffectView;->mCurrentState:I

    .line 17
    .line 18
    :cond_0
    const/4 v0, 0x1

    .line 19
    iput-boolean v0, p0, Lcom/immomo/velib/player/VideoEffectView;->isStartFuncCalled:Z

    .line 20
    .line 21
    return-void
.end method

.method public declared-synchronized stop()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/immomo/velib/player/VideoEffectView;->mPlayer:Lcom/immomo/velib/player/d;

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {v0}, Lcom/immomo/velib/player/d;->c()V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/immomo/velib/player/VideoEffectView;->mPlayer:Lcom/immomo/velib/player/d;

    .line 11
    .line 12
    invoke-interface {v0, v1}, Lcom/immomo/velib/player/d;->l(Lcom/immomo/velib/player/d$c;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/immomo/velib/player/VideoEffectView;->mPlayer:Lcom/immomo/velib/player/d;

    .line 16
    .line 17
    invoke-interface {v0, v1}, Lcom/immomo/velib/player/d;->g(Lcom/immomo/velib/player/d$e;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/immomo/velib/player/VideoEffectView;->mPlayer:Lcom/immomo/velib/player/d;

    .line 21
    .line 22
    invoke-interface {v0, v1}, Lcom/immomo/velib/player/d;->j(Lcom/immomo/velib/player/d$b;)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/immomo/velib/player/VideoEffectView;->mPlayer:Lcom/immomo/velib/player/d;

    .line 26
    .line 27
    invoke-interface {v0, v1}, Lcom/immomo/velib/player/d;->n(Lcom/immomo/velib/player/d$f;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/immomo/velib/player/VideoEffectView;->mPlayer:Lcom/immomo/velib/player/d;

    .line 31
    .line 32
    invoke-interface {v0, v1}, Lcom/immomo/velib/player/d;->e(Lcom/immomo/velib/player/d$d;)V

    .line 33
    .line 34
    .line 35
    const/4 v0, 0x0

    .line 36
    iput v0, p0, Lcom/immomo/velib/player/VideoEffectView;->mCurrentState:I

    .line 37
    .line 38
    iput-boolean v0, p0, Lcom/immomo/velib/player/VideoEffectView;->isStartFuncCalled:Z

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :catchall_0
    move-exception v0

    .line 42
    goto :goto_1

    .line 43
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/immomo/velib/player/VideoEffectView;->mEffectView:Lcom/immomo/velib/player/e;

    .line 44
    .line 45
    invoke-interface {v0}, Lcom/immomo/velib/player/e;->c()V

    .line 46
    .line 47
    .line 48
    iput-object v1, p0, Lcom/immomo/velib/player/VideoEffectView;->mPlayer:Lcom/immomo/velib/player/d;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 49
    .line 50
    monitor-exit p0

    .line 51
    return-void

    .line 52
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 53
    throw v0
.end method
