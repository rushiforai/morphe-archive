.class public Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressBar;
.super Landroid/view/View;
.source "SourceFile"


# instance fields
.field public a:F

.field public b:Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressViewType;

.field public c:Ll/pxh;

.field public d:[Landroid/graphics/Paint;

.field public e:I

.field public f:I

.field public g:I

.field public h:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 13
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 14
    sget-object v0, Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressViewType;->LINE:Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressViewType;

    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressBar;->b:Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressViewType;

    const/4 v0, 0x0

    .line 15
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressBar;->c(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 16
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 17
    sget-object v0, Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressViewType;->LINE:Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressViewType;

    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressBar;->b:Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressViewType;

    .line 18
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressBar;->c(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 19
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 20
    sget-object p3, Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressViewType;->LINE:Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressViewType;

    iput-object p3, p0, Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressBar;->b:Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressViewType;

    .line 21
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressBar;->c(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 22
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 23
    sget-object p3, Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressViewType;->LINE:Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressViewType;

    iput-object p3, p0, Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressBar;->b:Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressViewType;

    .line 24
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressBar;->c(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressViewType;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressViewType;->CIRCLE:Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressViewType;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressBar;->b:Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressViewType;

    .line 7
    .line 8
    const/4 p2, 0x0

    .line 9
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressBar;->c(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressBar;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressBar;->g(Landroid/animation/ValueAnimator;)V

    return-void
.end method


# virtual methods
.method public b(J)Landroid/animation/ValueAnimator;
    .locals 2

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v0, v0, [F

    .line 3
    .line 4
    fill-array-data v0, :array_0

    .line 5
    .line 6
    .line 7
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/oxh;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/oxh;-><init>(Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressBar;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, p1, p2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 20
    .line 21
    .line 22
    new-instance p0, Landroid/view/animation/LinearInterpolator;

    .line 23
    .line 24
    invoke-direct {p0}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, p0}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 28
    .line 29
    .line 30
    return-object v0

    .line 31
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final c(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressBar;->e(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressBar;->d()V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressBar;->c:Ll/pxh;

    .line 8
    .line 9
    invoke-interface {v0, p1, p2}, Ll/pxh;->b(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressBar;->c:Ll/pxh;

    .line 13
    .line 14
    invoke-interface {p1, p0}, Ll/pxh;->d(Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressBar;)[Landroid/graphics/Paint;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressBar;->d:[Landroid/graphics/Paint;

    .line 19
    .line 20
    return-void
.end method

.method public final d()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressBar$a;->a:[I

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressBar;->b:Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressViewType;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    aget v0, v0, v1

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    if-eq v0, v1, :cond_0

    .line 13
    .line 14
    new-instance v0, Ll/hch;

    .line 15
    .line 16
    invoke-direct {v0}, Ll/hch;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressBar;->c:Ll/pxh;

    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    new-instance v0, Ll/zvg;

    .line 23
    .line 24
    invoke-direct {v0}, Ll/zvg;-><init>()V

    .line 25
    .line 26
    .line 27
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressBar;->c:Ll/pxh;

    .line 28
    .line 29
    return-void
.end method

.method public final e(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    .line 1
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Ll/shc0;->A:[I

    .line 8
    .line 9
    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    sget p2, Ll/shc0;->E:I

    .line 14
    .line 15
    const/high16 v0, 0x40000000    # 2.0f

    .line 16
    .line 17
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 22
    .line 23
    .line 24
    move-result p2

    .line 25
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressBar;->e:I

    .line 26
    .line 27
    sget p2, Ll/shc0;->H:I

    .line 28
    .line 29
    const/4 v0, 0x0

    .line 30
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 31
    .line 32
    .line 33
    move-result p2

    .line 34
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressBar;->f:I

    .line 35
    .line 36
    sget p2, Ll/shc0;->G:I

    .line 37
    .line 38
    const/high16 v1, -0x1000000

    .line 39
    .line 40
    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 41
    .line 42
    .line 43
    move-result p2

    .line 44
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressBar;->g:I

    .line 45
    .line 46
    sget p2, Ll/shc0;->F:I

    .line 47
    .line 48
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 49
    .line 50
    .line 51
    move-result p2

    .line 52
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressBar;->h:I

    .line 53
    .line 54
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 55
    .line 56
    .line 57
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressBar;->f()V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public final f()V
    .locals 1

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressBar;->h:I

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressViewType;->LINE:Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressViewType;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressBar;->b:Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressViewType;

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressViewType;->CIRCLE:Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressViewType;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressBar;->b:Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressViewType;

    .line 13
    .line 14
    return-void
.end method

.method public final synthetic g(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressBar;->setProgress(F)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public getBackGroundColor()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressBar;->f:I

    .line 2
    .line 3
    return p0
.end method

.method public getDrawLineWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressBar;->e:I

    .line 2
    .line 3
    return p0
.end method

.method public getProgress()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressBar;->a:F

    .line 2
    .line 3
    return p0
.end method

.method public getProgressColor()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressBar;->g:I

    .line 2
    .line 3
    return p0
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressBar;->c:Ll/pxh;

    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressBar;->d:[Landroid/graphics/Paint;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressBar;->getProgress()F

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    invoke-interface {v0, p1, p0, v1, v2}, Ll/pxh;->a(Landroid/graphics/Canvas;Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressBar;[Landroid/graphics/Paint;F)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public onMeasure(II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressBar;->c:Ll/pxh;

    .line 5
    .line 6
    invoke-interface {p1, p0}, Ll/pxh;->c(Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressBar;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setFeedProgressViewType(Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressViewType;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressBar;->b:Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressViewType;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressBar;->d()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setProgress(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressBar;->a:F

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
