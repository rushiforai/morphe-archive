.class public Lcom/sina/weibo/sdk/web/view/LoadingBar;
.super Landroid/widget/TextView;
.source "SourceFile"


# static fields
.field private static final MAX_PROGRESS:I = 0x64


# instance fields
.field private mHander:Landroid/os/Handler;

.field private mPaint:Landroid/graphics/Paint;

.field private mProgress:I

.field private mProgressColor:I

.field private mRunnable:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/sina/weibo/sdk/web/view/LoadingBar$1;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Lcom/sina/weibo/sdk/web/view/LoadingBar$1;-><init>(Lcom/sina/weibo/sdk/web/view/LoadingBar;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/sina/weibo/sdk/web/view/LoadingBar;->mRunnable:Ljava/lang/Runnable;

    .line 10
    .line 11
    invoke-direct {p0, p1}, Lcom/sina/weibo/sdk/web/view/LoadingBar;->init(Landroid/content/Context;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 15
    invoke-direct {p0, p1, p2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 16
    new-instance p2, Lcom/sina/weibo/sdk/web/view/LoadingBar$1;

    invoke-direct {p2, p0}, Lcom/sina/weibo/sdk/web/view/LoadingBar$1;-><init>(Lcom/sina/weibo/sdk/web/view/LoadingBar;)V

    iput-object p2, p0, Lcom/sina/weibo/sdk/web/view/LoadingBar;->mRunnable:Ljava/lang/Runnable;

    .line 17
    invoke-direct {p0, p1}, Lcom/sina/weibo/sdk/web/view/LoadingBar;->init(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 18
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 19
    new-instance p2, Lcom/sina/weibo/sdk/web/view/LoadingBar$1;

    invoke-direct {p2, p0}, Lcom/sina/weibo/sdk/web/view/LoadingBar$1;-><init>(Lcom/sina/weibo/sdk/web/view/LoadingBar;)V

    iput-object p2, p0, Lcom/sina/weibo/sdk/web/view/LoadingBar;->mRunnable:Ljava/lang/Runnable;

    .line 20
    invoke-direct {p0, p1}, Lcom/sina/weibo/sdk/web/view/LoadingBar;->init(Landroid/content/Context;)V

    return-void
.end method

.method public static synthetic access$000(Lcom/sina/weibo/sdk/web/view/LoadingBar;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/sina/weibo/sdk/web/view/LoadingBar;->mProgress:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$008(Lcom/sina/weibo/sdk/web/view/LoadingBar;)I
    .locals 2

    .line 1
    iget v0, p0, Lcom/sina/weibo/sdk/web/view/LoadingBar;->mProgress:I

    .line 2
    .line 3
    add-int/lit8 v1, v0, 0x1

    .line 4
    .line 5
    iput v1, p0, Lcom/sina/weibo/sdk/web/view/LoadingBar;->mProgress:I

    .line 6
    .line 7
    return v0
.end method

.method private getRect()Landroid/graphics/Rect;
    .locals 5

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getLeft()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getTop()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getLeft()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    invoke-virtual {p0}, Landroid/view/View;->getRight()I

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    invoke-virtual {p0}, Landroid/view/View;->getLeft()I

    .line 18
    .line 19
    .line 20
    move-result v4

    .line 21
    sub-int/2addr v3, v4

    .line 22
    iget v4, p0, Lcom/sina/weibo/sdk/web/view/LoadingBar;->mProgress:I

    .line 23
    .line 24
    mul-int/2addr v3, v4

    .line 25
    div-int/lit8 v3, v3, 0x64

    .line 26
    .line 27
    add-int/2addr v2, v3

    .line 28
    invoke-virtual {p0}, Landroid/view/View;->getBottom()I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    new-instance v3, Landroid/graphics/Rect;

    .line 33
    .line 34
    sub-int/2addr v2, v0

    .line 35
    sub-int/2addr p0, v1

    .line 36
    const/4 v0, 0x0

    .line 37
    invoke-direct {v3, v0, v0, v2, p0}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 38
    .line 39
    .line 40
    return-object v3
.end method

.method private init(Landroid/content/Context;)V
    .locals 0

    .line 1
    new-instance p1, Landroid/os/Handler;

    .line 2
    .line 3
    invoke-direct {p1}, Landroid/os/Handler;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lcom/sina/weibo/sdk/web/view/LoadingBar;->mHander:Landroid/os/Handler;

    .line 7
    .line 8
    new-instance p1, Landroid/graphics/Paint;

    .line 9
    .line 10
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Lcom/sina/weibo/sdk/web/view/LoadingBar;->mPaint:Landroid/graphics/Paint;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/sina/weibo/sdk/web/view/LoadingBar;->initSkin()V

    .line 16
    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public drawProgress(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/sina/weibo/sdk/web/view/LoadingBar;->mHander:Landroid/os/Handler;

    .line 2
    .line 3
    const/4 v1, 0x7

    .line 4
    if-ge p1, v1, :cond_0

    .line 5
    .line 6
    iget-object p1, p0, Lcom/sina/weibo/sdk/web/view/LoadingBar;->mRunnable:Ljava/lang/Runnable;

    .line 7
    .line 8
    const-wide/16 v1, 0x46

    .line 9
    .line 10
    invoke-virtual {v0, p1, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object v1, p0, Lcom/sina/weibo/sdk/web/view/LoadingBar;->mRunnable:Ljava/lang/Runnable;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 17
    .line 18
    .line 19
    iput p1, p0, Lcom/sina/weibo/sdk/web/view/LoadingBar;->mProgress:I

    .line 20
    .line 21
    :goto_0
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public initSkin()V
    .locals 1

    .line 1
    const v0, -0xb26f02

    .line 2
    .line 3
    .line 4
    iput v0, p0, Lcom/sina/weibo/sdk/web/view/LoadingBar;->mProgressColor:I

    .line 5
    .line 6
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroid/widget/TextView;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/sina/weibo/sdk/web/view/LoadingBar;->mPaint:Landroid/graphics/Paint;

    .line 5
    .line 6
    iget v1, p0, Lcom/sina/weibo/sdk/web/view/LoadingBar;->mProgressColor:I

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Lcom/sina/weibo/sdk/web/view/LoadingBar;->getRect()Landroid/graphics/Rect;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object p0, p0, Lcom/sina/weibo/sdk/web/view/LoadingBar;->mPaint:Landroid/graphics/Paint;

    .line 16
    .line 17
    invoke-virtual {p1, v0, p0}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method
