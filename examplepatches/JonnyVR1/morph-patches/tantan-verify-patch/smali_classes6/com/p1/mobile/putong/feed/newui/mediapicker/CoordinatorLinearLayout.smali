.class public Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorLinearLayout;
.super Landroid/widget/LinearLayout;
.source "SourceFile"

# interfaces
.implements Ll/ju6;


# static fields
.field public static l:I = 0x1f4


# instance fields
.field public a:I

.field public b:I

.field public c:I

.field public d:I

.field public e:I

.field public f:I

.field public g:F

.field public h:Z

.field public i:Landroid/content/Context;

.field public j:Landroid/widget/OverScroller;

.field public k:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 14
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorLinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 13
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorLinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/4 p2, 0x0

    .line 5
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorLinearLayout;->a:I

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorLinearLayout;->i:Landroid/content/Context;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorLinearLayout;->d()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private getScrollRange()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorLinearLayout;->f:I

    .line 2
    .line 3
    return p0
.end method


# virtual methods
.method public a()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorLinearLayout;->h:Z

    .line 2
    .line 3
    return p0
.end method

.method public b(IIIIZ)Z
    .locals 1

    .line 1
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorLinearLayout;->c:I

    .line 2
    .line 3
    const/4 p3, 0x1

    .line 4
    if-ge p2, p1, :cond_0

    .line 5
    .line 6
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorLinearLayout;->a:I

    .line 7
    .line 8
    if-nez p1, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/view/View;->getScrollY()I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorLinearLayout;->getScrollRange()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-ge p1, v0, :cond_0

    .line 19
    .line 20
    iput-boolean p3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorLinearLayout;->h:Z

    .line 21
    .line 22
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorLinearLayout;->c:I

    .line 23
    .line 24
    sub-int/2addr p1, p2

    .line 25
    invoke-virtual {p0, p1}, Landroid/view/View;->setScrollY(I)V

    .line 26
    .line 27
    .line 28
    return p3

    .line 29
    :cond_0
    if-eqz p5, :cond_1

    .line 30
    .line 31
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorLinearLayout;->a:I

    .line 32
    .line 33
    if-ne p1, p3, :cond_1

    .line 34
    .line 35
    if-gez p4, :cond_1

    .line 36
    .line 37
    iput-boolean p3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorLinearLayout;->h:Z

    .line 38
    .line 39
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorLinearLayout;->f:I

    .line 40
    .line 41
    add-int/2addr p1, p4

    .line 42
    invoke-virtual {p0, p1}, Landroid/view/View;->setScrollY(I)V

    .line 43
    .line 44
    .line 45
    return p3

    .line 46
    :cond_1
    const/4 p0, 0x0

    .line 47
    return p0
.end method

.method public c()V
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorLinearLayout;->a:I

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getScrollY()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorLinearLayout;->d:I

    .line 10
    .line 11
    if-lt v0, v1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorLinearLayout;->f()V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorLinearLayout;->g()V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_1
    const/4 v1, 0x1

    .line 22
    if-ne v0, v1, :cond_3

    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/view/View;->getScrollY()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorLinearLayout;->e:I

    .line 29
    .line 30
    if-gt v0, v1, :cond_2

    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorLinearLayout;->g()V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorLinearLayout;->f()V

    .line 37
    .line 38
    .line 39
    :cond_3
    return-void
.end method

.method public computeScroll()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorLinearLayout;->j:Landroid/widget/OverScroller;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/OverScroller;->computeScrollOffset()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorLinearLayout;->j:Landroid/widget/OverScroller;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/widget/OverScroller;->getCurrY()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-virtual {p0, v0}, Landroid/view/View;->setScrollY(I)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public final d()V
    .locals 2

    .line 1
    new-instance v0, Landroid/widget/OverScroller;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorLinearLayout;->i:Landroid/content/Context;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Landroid/widget/OverScroller;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorLinearLayout;->j:Landroid/widget/OverScroller;

    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorLinearLayout;->i:Landroid/content/Context;

    .line 11
    .line 12
    invoke-static {v0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorLinearLayout;->k:I

    .line 21
    .line 22
    return-void
.end method

.method public e(II)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorLinearLayout;->c:I

    .line 2
    .line 3
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorLinearLayout;->b:I

    .line 4
    .line 5
    sub-int/2addr p1, p2

    .line 6
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorLinearLayout;->f:I

    .line 7
    .line 8
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorLinearLayout;->d:I

    .line 9
    .line 10
    sub-int/2addr p1, p2

    .line 11
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorLinearLayout;->e:I

    .line 12
    .line 13
    return-void
.end method

.method public f()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorLinearLayout;->j:Landroid/widget/OverScroller;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/OverScroller;->isFinished()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorLinearLayout;->j:Landroid/widget/OverScroller;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/widget/OverScroller;->abortAnimation()V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorLinearLayout;->j:Landroid/widget/OverScroller;

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/view/View;->getScrollY()I

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorLinearLayout;->getScrollRange()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    invoke-virtual {p0}, Landroid/view/View;->getScrollY()I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    sub-int v5, v0, v2

    .line 29
    .line 30
    sget v6, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorLinearLayout;->l:I

    .line 31
    .line 32
    const/4 v2, 0x0

    .line 33
    const/4 v4, 0x0

    .line 34
    invoke-virtual/range {v1 .. v6}, Landroid/widget/OverScroller;->startScroll(IIIII)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    .line 38
    .line 39
    .line 40
    const/4 v0, 0x1

    .line 41
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorLinearLayout;->a:I

    .line 42
    .line 43
    const/4 v0, 0x0

    .line 44
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorLinearLayout;->h:Z

    .line 45
    .line 46
    return-void
.end method

.method public g()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorLinearLayout;->j:Landroid/widget/OverScroller;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/OverScroller;->isFinished()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorLinearLayout;->j:Landroid/widget/OverScroller;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/widget/OverScroller;->abortAnimation()V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorLinearLayout;->j:Landroid/widget/OverScroller;

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/view/View;->getScrollY()I

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    invoke-virtual {p0}, Landroid/view/View;->getScrollY()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    neg-int v5, v0

    .line 25
    sget v6, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorLinearLayout;->l:I

    .line 26
    .line 27
    const/4 v2, 0x0

    .line 28
    const/4 v4, 0x0

    .line 29
    invoke-virtual/range {v1 .. v6}, Landroid/widget/OverScroller;->startScroll(IIIII)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    .line 33
    .line 34
    .line 35
    const/4 v0, 0x0

    .line 36
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorLinearLayout;->a:I

    .line 37
    .line 38
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorLinearLayout;->h:Z

    .line 39
    .line 40
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
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    float-to-int v0, v0

    .line 13
    int-to-float v1, v0

    .line 14
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorLinearLayout;->g:F

    .line 15
    .line 16
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorLinearLayout;->a:I

    .line 17
    .line 18
    const/4 v2, 0x1

    .line 19
    if-ne v1, v2, :cond_1

    .line 20
    .line 21
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorLinearLayout;->b:I

    .line 22
    .line 23
    if-ge v0, v1, :cond_1

    .line 24
    .line 25
    return v2

    .line 26
    :cond_1
    :goto_0
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    return p0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    float-to-int p1, p1

    .line 10
    const/4 v1, 0x1

    .line 11
    if-eqz v0, :cond_4

    .line 12
    .line 13
    if-eq v0, v1, :cond_2

    .line 14
    .line 15
    const/4 v2, 0x2

    .line 16
    if-eq v0, v2, :cond_0

    .line 17
    .line 18
    const/4 v2, 0x3

    .line 19
    if-eq v0, v2, :cond_2

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorLinearLayout;->g:F

    .line 23
    .line 24
    int-to-float p1, p1

    .line 25
    sub-float/2addr v0, p1

    .line 26
    float-to-int v0, v0

    .line 27
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorLinearLayout;->a:I

    .line 28
    .line 29
    if-ne v2, v1, :cond_1

    .line 30
    .line 31
    if-gez v0, :cond_1

    .line 32
    .line 33
    iput-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorLinearLayout;->h:Z

    .line 34
    .line 35
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorLinearLayout;->f:I

    .line 36
    .line 37
    add-int/2addr v2, v0

    .line 38
    invoke-virtual {p0, v2}, Landroid/view/View;->setScrollY(I)V

    .line 39
    .line 40
    .line 41
    :cond_1
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorLinearLayout;->g:F

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_2
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorLinearLayout;->g:F

    .line 45
    .line 46
    int-to-float p1, p1

    .line 47
    sub-float/2addr v0, p1

    .line 48
    float-to-int p1, v0

    .line 49
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorLinearLayout;->a:I

    .line 50
    .line 51
    if-ne v0, v1, :cond_3

    .line 52
    .line 53
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorLinearLayout;->k:I

    .line 58
    .line 59
    if-ge p1, v0, :cond_3

    .line 60
    .line 61
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorLinearLayout;->g()V

    .line 62
    .line 63
    .line 64
    :cond_3
    iget-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorLinearLayout;->h:Z

    .line 65
    .line 66
    if-eqz p1, :cond_5

    .line 67
    .line 68
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorLinearLayout;->c()V

    .line 69
    .line 70
    .line 71
    return v1

    .line 72
    :cond_4
    int-to-float p1, p1

    .line 73
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorLinearLayout;->g:F

    .line 74
    .line 75
    :cond_5
    :goto_0
    return v1
.end method
