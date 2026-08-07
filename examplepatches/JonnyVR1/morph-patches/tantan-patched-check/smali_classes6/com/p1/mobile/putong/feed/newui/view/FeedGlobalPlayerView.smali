.class public Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Ll/npg;


# static fields
.field public static B:Ljava/lang/String;

.field public static C:Ljava/lang/String;

.field public static D:Z


# instance fields
.field public A:Ll/kcg0;

.field public a:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public b:Landroid/widget/FrameLayout;

.field public c:Lv/VDraweeView;

.field public d:Landroid/widget/ProgressBar;

.field public e:Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressBar;

.field public f:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public g:Lv/VImage;

.field public h:Lv/VImage;

.field public i:Lv/VImage;

.field public j:Lcom/p1/mobile/putong/feed/data/Moment;

.field public k:Lcom/p1/mobile/putong/data/User;

.field public l:F

.field public m:Landroid/animation/ValueAnimator;

.field public n:Z

.field public o:Z

.field public p:Z

.field public q:Z

.field public r:F

.field public final s:I

.field public final t:I

.field public final u:I

.field public final v:I

.field public final w:I

.field public final x:I

.field public y:Landroid/app/Activity;

.field public z:Ll/kcg0;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    const/high16 p2, 0x3f800000    # 1.0f

    .line 5
    .line 6
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->l:F

    .line 7
    .line 8
    const/4 p2, 0x1

    .line 9
    iput-boolean p2, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->n:Z

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->o:Z

    .line 13
    .line 14
    const/high16 v1, 0x434b0000    # 203.0f

    .line 15
    .line 16
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->s:I

    .line 21
    .line 22
    const/high16 v1, 0x428c0000    # 70.0f

    .line 23
    .line 24
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->t:I

    .line 29
    .line 30
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->u:I

    .line 31
    .line 32
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->v:I

    .line 33
    .line 34
    const/16 p2, 0x12c

    .line 35
    .line 36
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->w:I

    .line 37
    .line 38
    const/16 p2, 0xc8

    .line 39
    .line 40
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->x:I

    .line 41
    .line 42
    const/4 p2, 0x0

    .line 43
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->r(Landroid/content/Context;Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    .line 58
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/high16 p2, 0x3f800000    # 1.0f

    .line 59
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->l:F

    const/4 p2, 0x1

    .line 60
    iput-boolean p2, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->n:Z

    const/4 p3, 0x0

    .line 61
    iput-boolean p3, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->o:Z

    const/high16 v0, 0x434b0000    # 203.0f

    .line 62
    invoke-static {v0}, Ll/qa00;->d(F)I

    move-result v0

    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->s:I

    const/high16 v0, 0x428c0000    # 70.0f

    .line 63
    invoke-static {v0}, Ll/qa00;->d(F)I

    move-result v0

    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->t:I

    .line 64
    iput p3, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->u:I

    .line 65
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->v:I

    const/16 p2, 0x12c

    .line 66
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->w:I

    const/16 p2, 0xc8

    .line 67
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->x:I

    const/4 p2, 0x0

    .line 68
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->r(Landroid/content/Context;Lcom/p1/mobile/putong/feed/data/Moment;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 3

    .line 47
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    const/high16 v0, 0x3f800000    # 1.0f

    .line 48
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->l:F

    const/4 v0, 0x1

    .line 49
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->n:Z

    const/4 v1, 0x0

    .line 50
    iput-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->o:Z

    const/high16 v2, 0x434b0000    # 203.0f

    .line 51
    invoke-static {v2}, Ll/qa00;->d(F)I

    move-result v2

    iput v2, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->s:I

    const/high16 v2, 0x428c0000    # 70.0f

    .line 52
    invoke-static {v2}, Ll/qa00;->d(F)I

    move-result v2

    iput v2, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->t:I

    .line 53
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->u:I

    .line 54
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->v:I

    const/16 v0, 0x12c

    .line 55
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->w:I

    const/16 v0, 0xc8

    .line 56
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->x:I

    .line 57
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->r(Landroid/content/Context;Lcom/p1/mobile/putong/feed/data/Moment;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->z(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;ZLjava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->C(ZLjava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->y(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;Ljava/util/Map;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->A(Ljava/util/Map;)V

    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;ILandroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->D(ILandroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->x(Landroid/view/View;)V

    return-void
.end method

.method private getProgressTimerAnim()Landroid/animation/ValueAnimator;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->m:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    const/high16 v1, 0x447a0000    # 1000.0f

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->e:Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressBar;

    .line 8
    .line 9
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->l:F

    .line 10
    .line 11
    mul-float/2addr v2, v1

    .line 12
    float-to-int v2, v2

    .line 13
    int-to-long v2, v2

    .line 14
    invoke-virtual {v0, v2, v3}, Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressBar;->b(J)Landroid/animation/ValueAnimator;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->m:Landroid/animation/ValueAnimator;

    .line 19
    .line 20
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->m:Landroid/animation/ValueAnimator;

    .line 21
    .line 22
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->l:F

    .line 23
    .line 24
    mul-float/2addr v2, v1

    .line 25
    float-to-int v1, v2

    .line 26
    int-to-long v1, v1

    .line 27
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->m:Landroid/animation/ValueAnimator;

    .line 31
    .line 32
    return-object p0
.end method

.method public static synthetic k(Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;ZLcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->B(ZLcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method

.method public static synthetic l(Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->w(Landroid/view/View;)V

    return-void
.end method

.method private setParentX(F)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Landroid/view/View;

    .line 6
    .line 7
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->r:F

    .line 8
    .line 9
    add-float/2addr p0, p1

    .line 10
    invoke-virtual {v0, p0}, Landroid/view/View;->setX(F)V

    .line 11
    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final synthetic A(Ljava/util/Map;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 10
    .line 11
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 18
    .line 19
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->likes:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 20
    .line 21
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/Moment;->likes:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 22
    .line 23
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->messages:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 24
    .line 25
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/Moment;->messages:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 26
    .line 27
    iget-boolean v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->haveLiked:Z

    .line 28
    .line 29
    iput-boolean v1, v0, Lcom/p1/mobile/putong/feed/data/Moment;->haveLiked:Z

    .line 30
    .line 31
    iget-boolean p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->haveLiked:Z

    .line 32
    .line 33
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->P(Z)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->N()V

    .line 37
    .line 38
    .line 39
    :cond_0
    return-void
.end method

.method public final synthetic B(ZLcom/p1/mobile/putong/data/Envelope;)V
    .locals 6

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    iget-boolean p2, p2, Lcom/p1/mobile/putong/feed/data/Moment;->haveLiked:Z

    .line 4
    .line 5
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->P(Z)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 13
    .line 14
    sget-object v2, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->C:Ljava/lang/String;

    .line 15
    .line 16
    sget-boolean v3, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->D:Z

    .line 17
    .line 18
    const/16 v4, 0xc9

    .line 19
    .line 20
    move v5, p1

    .line 21
    invoke-virtual/range {v0 .. v5}, Ll/er60;->f(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;ZIZ)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final synthetic C(ZLjava/lang/Throwable;)V
    .locals 6

    .line 1
    invoke-static {p2}, Ll/i4h;->g(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 9
    .line 10
    sget-object v2, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->C:Ljava/lang/String;

    .line 11
    .line 12
    sget-boolean v3, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->D:Z

    .line 13
    .line 14
    move v5, p1

    .line 15
    move-object v4, p2

    .line 16
    invoke-virtual/range {v0 .. v5}, Ll/er60;->h(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;ZLjava/lang/Throwable;Z)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic D(ILandroid/animation/ValueAnimator;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 8
    .line 9
    new-instance v1, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p2}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v2, ""

    .line 22
    .line 23
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-static {v1}, Ljava/lang/Float;->valueOf(Ljava/lang/String;)Ljava/lang/Float;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v1}, Ljava/lang/Float;->intValue()I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 39
    .line 40
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 41
    .line 42
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 43
    .line 44
    .line 45
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->o:Z

    .line 46
    .line 47
    if-eqz v0, :cond_0

    .line 48
    .line 49
    new-instance v0, Ljava/lang/StringBuilder;

    .line 50
    .line 51
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p2}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object p2

    .line 58
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p2

    .line 68
    invoke-static {p2}, Ljava/lang/Float;->valueOf(Ljava/lang/String;)Ljava/lang/Float;

    .line 69
    .line 70
    .line 71
    move-result-object p2

    .line 72
    invoke-virtual {p2}, Ljava/lang/Float;->intValue()I

    .line 73
    .line 74
    .line 75
    move-result p2

    .line 76
    sub-int/2addr p1, p2

    .line 77
    int-to-float p1, p1

    .line 78
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->setParentX(F)V

    .line 79
    .line 80
    .line 81
    :cond_0
    return-void
.end method

.method public final E()V
    .locals 1

    .line 1
    invoke-static {}, Ll/lpg;->v()Ll/lpg;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/lpg;->j0()V

    .line 6
    .line 7
    .line 8
    const/16 v0, 0x8

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final F()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->q:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->y:Landroid/app/Activity;

    .line 7
    .line 8
    instance-of v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    const-string v0, "from_moment_detail_album"

    .line 13
    .line 14
    sget-object v1, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->C:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    return-void

    .line 23
    :cond_1
    const/4 v0, 0x1

    .line 24
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->q:Z

    .line 25
    .line 26
    sget-object v1, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->B:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->o(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-static {v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->a(Landroid/content/Context;)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    const-string v2, ""

    .line 40
    .line 41
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->f(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 46
    .line 47
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->m(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 54
    .line 55
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 56
    .line 57
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->n(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->t(Z)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 66
    .line 67
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/Moment;->momentValue:Ljava/lang/String;

    .line 68
    .line 69
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->o(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->u(Z)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->b()Landroid/content/Intent;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    if-nez v0, :cond_2

    .line 82
    .line 83
    :goto_0
    return-void

    .line 84
    :cond_2
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 89
    .line 90
    .line 91
    return-void
.end method

.method public final G()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->n:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->J()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->n:Z

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->q()V

    .line 13
    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->n:Z

    .line 17
    .line 18
    return-void
.end method

.method public final H()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    iget-boolean v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->haveLiked:Z

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->n()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    sget-object v2, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 10
    .line 11
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 12
    .line 13
    iget-object v4, v3, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v5, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 16
    .line 17
    iget-boolean v6, v3, Lcom/p1/mobile/putong/feed/data/Moment;->haveLiked:Z

    .line 18
    .line 19
    xor-int/lit8 v6, v6, 0x1

    .line 20
    .line 21
    invoke-virtual {v3}, Lcom/p1/mobile/putong/feed/data/Moment;->getMomentShowFrom()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    invoke-virtual {v2, v4, v5, v6, v3}, Ll/jka;->Fb(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    new-instance v2, Ll/r5h;

    .line 34
    .line 35
    invoke-direct {v2, p0, v0}, Ll/r5h;-><init>(Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;Z)V

    .line 36
    .line 37
    .line 38
    new-instance v3, Ll/s5h;

    .line 39
    .line 40
    invoke-direct {v3, p0, v0}, Ll/s5h;-><init>(Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;Z)V

    .line 41
    .line 42
    .line 43
    invoke-static {v2, v3}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {v1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public final I()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->z:Ll/kcg0;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->z:Ll/kcg0;

    .line 10
    .line 11
    invoke-interface {v0}, Ll/kcg0;->unsubscribe()V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->A:Ll/kcg0;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->A:Ll/kcg0;

    .line 23
    .line 24
    invoke-interface {p0}, Ll/kcg0;->unsubscribe()V

    .line 25
    .line 26
    .line 27
    :cond_1
    return-void
.end method

.method public J()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->n:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->u()V

    .line 6
    .line 7
    .line 8
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->s:I

    .line 9
    .line 10
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->t:I

    .line 11
    .line 12
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->U(II)V

    .line 13
    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->T(II)V

    .line 18
    .line 19
    .line 20
    iput-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->n:Z

    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public K()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->n:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 12
    .line 13
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->t:I

    .line 14
    .line 15
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 16
    .line 17
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 20
    .line 21
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 22
    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->n:Z

    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public L(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->j:Lcom/p1/mobile/putong/feed/data/Moment;

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->S()V

    .line 10
    .line 11
    .line 12
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 13
    .line 14
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 15
    .line 16
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->k:Lcom/p1/mobile/putong/data/User;

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->R()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->n()Lcom/p1/mobile/android/app/Act;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->setCurrentShowAct(Landroid/app/Activity;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public final M()V
    .locals 2

    .line 1
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 4
    .line 5
    .line 6
    const/high16 v1, 0x41200000    # 10.0f

    .line 7
    .line 8
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    int-to-float v1, v1

    .line 13
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 14
    .line 15
    .line 16
    const/4 v1, -0x1

    .line 17
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 21
    .line 22
    invoke-virtual {v1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 26
    .line 27
    const/high16 v0, 0x40c00000    # 6.0f

    .line 28
    .line 29
    invoke-virtual {p0, v0}, Landroid/view/View;->setElevation(F)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final N()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->h:Lv/VImage;

    .line 2
    .line 3
    sget v0, Ll/lbc0;->Y0:I

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final O()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    .line 21
    .line 22
    instance-of v1, v0, Lcom/p1/mobile/putong/data/Audio;

    .line 23
    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    check-cast v0, Lcom/p1/mobile/putong/data/Audio;

    .line 27
    .line 28
    iget v0, v0, Lcom/p1/mobile/putong/data/Audio;->duration:F

    .line 29
    .line 30
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->l:F

    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public final P(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->g:Lv/VImage;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    sget p1, Ll/lbc0;->a1:I

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    sget p1, Ll/lbc0;->Z0:I

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final Q(F)V
    .locals 0

    .line 1
    return-void
.end method

.method public final R()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->c:Lv/VDraweeView;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->k:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    invoke-static {v0, v1, v2}, Ll/at0;->e(Lcom/p1/mobile/putong/feed/data/Moment;Lv/VDraweeView;Lcom/p1/mobile/putong/data/User;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->O()V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 14
    .line 15
    iget-boolean v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->haveLiked:Z

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->P(Z)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->N()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->M()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final S()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->Q(F)V

    .line 3
    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->e:Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressBar;

    .line 6
    .line 7
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressBar;->setProgress(F)V

    .line 8
    .line 9
    .line 10
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->getProgressTimerAnim()Landroid/animation/ValueAnimator;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final T(II)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->f:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    int-to-float v1, p1

    .line 4
    int-to-float p2, p2

    .line 5
    const/4 v2, 0x2

    .line 6
    new-array v2, v2, [F

    .line 7
    .line 8
    const/4 v3, 0x0

    .line 9
    aput v1, v2, v3

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    aput p2, v2, v1

    .line 13
    .line 14
    const-string p2, "alpha"

    .line 15
    .line 16
    invoke-static {v0, p2, v2}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    const-wide/16 v0, 0xc8

    .line 21
    .line 22
    invoke-virtual {p2, v0, v1}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    if-nez p1, :cond_0

    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->f:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 29
    .line 30
    const/4 p1, 0x0

    .line 31
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 32
    .line 33
    .line 34
    const-wide/16 p0, 0x64

    .line 35
    .line 36
    invoke-virtual {p2, p0, p1}, Landroid/animation/Animator;->setStartDelay(J)V

    .line 37
    .line 38
    .line 39
    :cond_0
    invoke-virtual {p2}, Landroid/animation/Animator;->start()V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public final U(II)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    int-to-float p1, p1

    .line 8
    int-to-float p2, p2

    .line 9
    const/4 v1, 0x2

    .line 10
    new-array v1, v1, [F

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    aput p1, v1, v2

    .line 14
    .line 15
    const/4 p1, 0x1

    .line 16
    aput p2, v1, p1

    .line 17
    .line 18
    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    const-wide/16 v1, 0x12c

    .line 23
    .line 24
    invoke-virtual {p1, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 25
    .line 26
    .line 27
    new-instance p2, Landroid/view/animation/LinearInterpolator;

    .line 28
    .line 29
    invoke-direct {p2}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 33
    .line 34
    .line 35
    new-instance p2, Ll/q5h;

    .line 36
    .line 37
    invoke-direct {p2, p0, v0}, Ll/q5h;-><init>(Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;I)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public a(Ljava/lang/Exception;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->p()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public h()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->d:Landroid/widget/ProgressBar;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public i(Z)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->p()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public j(F)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->Q(F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public m(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/t5h;->b(Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final n()Lcom/p1/mobile/android/app/Act;
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

.method public final o(Ljava/lang/String;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    new-instance v0, Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 12
    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 15
    .line 16
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->live:Lcom/p1/mobile/putong/data/Live;

    .line 17
    .line 18
    const-string v2, ""

    .line 19
    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Live;->anchor:Lcom/p1/mobile/putong/data/Owner;

    .line 23
    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    move-object v1, v2

    .line 30
    :goto_0
    const-string v3, "anchorId"

    .line 31
    .line 32
    invoke-static {v3, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 40
    .line 41
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->live:Lcom/p1/mobile/putong/data/Live;

    .line 42
    .line 43
    if-eqz v1, :cond_1

    .line 44
    .line 45
    iget-object v2, v1, Lcom/p1/mobile/putong/data/Live;->id:Ljava/lang/String;

    .line 46
    .line 47
    :cond_1
    const-string v1, "liveId"

    .line 48
    .line 49
    invoke-static {v1, v2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 57
    .line 58
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 59
    .line 60
    const-string v2, "moment_id"

    .line 61
    .line 62
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 70
    .line 71
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 72
    .line 73
    const-string v2, "owner_id"

    .line 74
    .line 75
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    sget-object v1, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->C:Ljava/lang/String;

    .line 83
    .line 84
    invoke-static {v1}, Ll/er60;->D(Ljava/lang/String;)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    const-string v2, "moment_showfrom"

    .line 89
    .line 90
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 102
    .line 103
    invoke-virtual {v1, p0}, Ll/er60;->y(Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    const-string v1, "moment_type"

    .line 108
    .line 109
    invoke-static {v1, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    const-string p0, "comment_detail"

    .line 117
    .line 118
    const-string v1, "comment"

    .line 119
    .line 120
    invoke-static {p0, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 125
    .line 126
    .line 127
    const/4 p0, 0x0

    .line 128
    new-array p0, p0, [Ll/pf60;

    .line 129
    .line 130
    invoke-interface {v0, p0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    check-cast p0, [Ll/pf60;

    .line 135
    .line 136
    const-string v0, "e_comment"

    .line 137
    .line 138
    invoke-static {v0, p1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 139
    .line 140
    .line 141
    :cond_2
    return-void
.end method

.method public onAttachedToWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->t()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onComplete()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->p()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->I()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onPause()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->p:Z

    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->getProgressTimerAnim()Landroid/animation/ValueAnimator;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->pause()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onResume()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->d:Landroid/widget/ProgressBar;

    .line 2
    .line 3
    const/16 v0, 0x8

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onStart()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->p:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->getProgressTimerAnim()Landroid/animation/ValueAnimator;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->resume()V

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->getProgressTimerAnim()Landroid/animation/ValueAnimator;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 18
    .line 19
    .line 20
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->d:Landroid/widget/ProgressBar;

    .line 21
    .line 22
    const/16 v1, 0x8

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 25
    .line 26
    .line 27
    const/4 v0, 0x0

    .line 28
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->p:Z

    .line 29
    .line 30
    return-void
.end method

.method public final p()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->getProgressTimerAnim()Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->d:Landroid/widget/ProgressBar;

    .line 9
    .line 10
    const/16 v0, 0x8

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public q()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->n:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->u()V

    .line 6
    .line 7
    .line 8
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->t:I

    .line 9
    .line 10
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->s:I

    .line 11
    .line 12
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->U(II)V

    .line 13
    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    const/4 v1, 0x1

    .line 17
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->T(II)V

    .line 18
    .line 19
    .line 20
    iput-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->n:Z

    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public final r(Landroid/content/Context;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 0

    .line 1
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1, p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->m(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->s()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->t()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->K()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->L(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final s()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->g:Lv/VImage;

    .line 2
    .line 3
    new-instance v1, Ll/m5h;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/m5h;-><init>(Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->h:Lv/VImage;

    .line 12
    .line 13
    new-instance v1, Ll/n5h;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/n5h;-><init>(Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->i:Lv/VImage;

    .line 22
    .line 23
    new-instance v1, Ll/o5h;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/o5h;-><init>(Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->c:Lv/VDraweeView;

    .line 32
    .line 33
    new-instance v1, Ll/p5h;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/p5h;-><init>(Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public setCurrentShowAct(Landroid/app/Activity;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->q:Z

    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->y:Landroid/app/Activity;

    .line 5
    .line 6
    return-void
.end method

.method public setFrom(Ljava/lang/String;)V
    .locals 0

    .line 1
    sput-object p1, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->C:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setMoment(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    return-void
.end method

.method public final t()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->I()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 5
    .line 6
    iget-object v0, v0, Ll/jka;->l0:Lrx/subjects/b;

    .line 7
    .line 8
    new-instance v1, Ll/l5h;

    .line 9
    .line 10
    invoke-direct {v1, p0}, Ll/l5h;-><init>(Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;)V

    .line 11
    .line 12
    .line 13
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->z:Ll/kcg0;

    .line 22
    .line 23
    return-void
.end method

.method public final u()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->v()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->o:Z

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getX()F

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->r:F

    .line 12
    .line 13
    return-void
.end method

.method public final v()Z
    .locals 3

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v0, v0, [I

    .line 3
    .line 4
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 5
    .line 6
    invoke-virtual {v1, v0}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 7
    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    aget v0, v0, v1

    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    add-int/2addr p0, v0

    .line 17
    invoke-static {}, Ll/bnl0;->y0()I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    sub-int/2addr p0, v2

    .line 22
    invoke-static {p0}, Ljava/lang/Math;->abs(I)I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    if-le v0, p0, :cond_0

    .line 27
    .line 28
    const/4 p0, 0x1

    .line 29
    return p0

    .line 30
    :cond_0
    return v1
.end method

.method public final synthetic w(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->H()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic x(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->F()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic y(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->E()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic z(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->G()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
