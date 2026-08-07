.class public Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Lv/a$b;


# instance fields
.field public a:Landroid/view/View;

.field public b:Ll/skl0;

.field public c:Ll/ukl0;

.field public d:Ll/z3h;

.field public e:Ljava/lang/String;

.field public f:Lv/a;

.field public g:Z

.field public h:Landroid/graphics/Point;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 17
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 18
    new-instance p1, Landroid/graphics/Point;

    invoke-direct {p1}, Landroid/graphics/Point;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;->h:Landroid/graphics/Point;

    .line 19
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;->b()V

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

    .line 20
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 21
    new-instance p1, Landroid/graphics/Point;

    invoke-direct {p1}, Landroid/graphics/Point;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;->h:Landroid/graphics/Point;

    .line 22
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;->b()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Z)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Landroid/graphics/Point;

    .line 5
    .line 6
    invoke-direct {p1}, Landroid/graphics/Point;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;->h:Landroid/graphics/Point;

    .line 10
    .line 11
    iput-boolean p2, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;->g:Z

    .line 12
    .line 13
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;->b()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private a()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    return-object p0
.end method

.method private b()V
    .locals 1

    .line 1
    new-instance v0, Lv/a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lv/a;-><init>(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;->f:Lv/a;

    .line 7
    .line 8
    return-void
.end method

.method private c()V
    .locals 4

    .line 1
    new-instance v0, Ll/skl0;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;->getFeedDragDismissListener()Ll/z3h;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, p0, v1}, Ll/skl0;-><init>(Landroid/view/View;Ll/z3h;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;->b:Ll/skl0;

    .line 11
    .line 12
    new-instance v0, Ll/ukl0;

    .line 13
    .line 14
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;->a()Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;->b:Ll/skl0;

    .line 19
    .line 20
    iget-boolean v3, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;->g:Z

    .line 21
    .line 22
    invoke-direct {v0, v1, v2, v3}, Ll/ukl0;-><init>(Landroid/content/Context;Ll/skl0;Z)V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;->c:Ll/ukl0;

    .line 26
    .line 27
    invoke-virtual {v0, p0}, Ll/ukl0;->c(Landroid/view/ViewParent;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method private d()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-lez v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;->a:Landroid/view/View;

    .line 13
    .line 14
    :cond_0
    return-void
.end method


# virtual methods
.method public dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;->f:Lv/a;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lv/a;->g(Landroid/graphics/Canvas;)V

    .line 4
    .line 5
    .line 6
    invoke-super {p0, p1}, Landroid/view/View;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public getFeedDragDismissListener()Ll/z3h;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;->d:Ll/z3h;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/a4h;

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;->a()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-direct {v0, v1}, Ll/a4h;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;->d:Ll/z3h;

    .line 15
    .line 16
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;->d:Ll/z3h;

    .line 17
    .line 18
    return-object p0
.end method

.method public getInnerContentView()Landroid/view/View;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroid/view/View;",
            ">()TT;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;->a:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public k()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;->e:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public l(Landroid/view/ViewGroup;)Landroid/animation/ValueAnimator;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;->f:Lv/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lv/a;->G(Landroid/view/ViewGroup;)Landroid/animation/ValueAnimator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public n(Landroid/view/ViewGroup;)Landroid/animation/ValueAnimator;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;->f:Lv/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lv/a;->H(Landroid/view/ViewGroup;)Landroid/animation/ValueAnimator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;->d()V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;->c()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_3

    .line 6
    .line 7
    const/4 v1, 0x2

    .line 8
    if-eq v0, v1, :cond_0

    .line 9
    .line 10
    goto :goto_1

    .line 11
    :cond_0
    invoke-static {}, Ll/bnl0;->y0()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-static {}, Ll/bnl0;->w0()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    div-int/lit8 v0, v0, 0x32

    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;->h:Landroid/graphics/Point;

    .line 26
    .line 27
    iget v1, v1, Landroid/graphics/Point;->x:I

    .line 28
    .line 29
    int-to-float v1, v1

    .line 30
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    sub-float/2addr v1, v2

    .line 35
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    int-to-float v0, v0

    .line 40
    cmpl-float v1, v1, v0

    .line 41
    .line 42
    if-gtz v1, :cond_2

    .line 43
    .line 44
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;->h:Landroid/graphics/Point;

    .line 45
    .line 46
    iget p0, p0, Landroid/graphics/Point;->y:I

    .line 47
    .line 48
    int-to-float p0, p0

    .line 49
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    sub-float/2addr p0, p1

    .line 54
    invoke-static {p0}, Ljava/lang/Math;->abs(F)F

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    cmpl-float p0, p0, v0

    .line 59
    .line 60
    if-lez p0, :cond_1

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_1
    const/4 p0, 0x0

    .line 64
    return p0

    .line 65
    :cond_2
    :goto_0
    const/4 p0, 0x1

    .line 66
    return p0

    .line 67
    :cond_3
    new-instance v0, Landroid/graphics/Point;

    .line 68
    .line 69
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    float-to-int v1, v1

    .line 74
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 75
    .line 76
    .line 77
    move-result v2

    .line 78
    float-to-int v2, v2

    .line 79
    invoke-direct {v0, v1, v2}, Landroid/graphics/Point;-><init>(II)V

    .line 80
    .line 81
    .line 82
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;->h:Landroid/graphics/Point;

    .line 83
    .line 84
    :goto_1
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onInterceptHoverEvent(Landroid/view/MotionEvent;)Z

    .line 85
    .line 86
    .line 87
    move-result p0

    .line 88
    return p0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;->c:Ll/ukl0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ukl0;->a(Landroid/view/MotionEvent;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public setFeedDragDismissBackListener(Ll/y3h;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;->b:Ll/skl0;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;->b:Ll/skl0;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/skl0;->o(Ll/y3h;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public setFeedDragDismissListener(Ll/z3h;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;->d:Ll/z3h;

    .line 2
    .line 3
    return-void
.end method

.method public setInnerContentView(Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;->a:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;->c()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setInnerDragDismissBehavior(Ll/skl0;)V
    .locals 3

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;->b:Ll/skl0;

    .line 8
    .line 9
    new-instance v0, Ll/ukl0;

    .line 10
    .line 11
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;->a()Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iget-boolean v2, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;->g:Z

    .line 16
    .line 17
    invoke-direct {v0, v1, p1, v2}, Ll/ukl0;-><init>(Landroid/content/Context;Ll/skl0;Z)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;->c:Ll/ukl0;

    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public setOriginalHeight(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;->f:Lv/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lv/a;->y(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setOriginalWidth(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;->f:Lv/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lv/a;->z(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setTranslationX(F)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->setTranslationX(F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setTranslationY(F)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->setTranslationY(F)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;->d:Ll/z3h;

    .line 5
    .line 6
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;->d:Ll/z3h;

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/view/View;->getTranslationX()F

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    invoke-virtual {p0}, Landroid/view/View;->getTranslationY()F

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    invoke-interface {p1, v0, p0}, Ll/z3h;->b(FF)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public setZoomAnimationKey(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedDragDismissContainerView;->e:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method
