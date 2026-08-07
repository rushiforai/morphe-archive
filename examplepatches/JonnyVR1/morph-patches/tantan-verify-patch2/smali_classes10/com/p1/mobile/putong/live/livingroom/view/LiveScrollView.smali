.class public Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Ll/pol;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView$c;,
        Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView$b;
    }
.end annotation


# static fields
.field public static final t:I


# instance fields
.field public a:Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;

.field public b:Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;

.field public c:Landroid/view/View;

.field public d:F

.field public e:F

.field public f:F

.field public g:F

.field public final h:F

.field public i:J

.field public j:Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView$b;

.field public k:Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView$c;

.field public l:Landroid/view/View;

.field public m:Landroid/view/VelocityTracker;

.field public n:Landroid/animation/ValueAnimator;

.field public o:Z

.field public p:Landroid/animation/ValueAnimator;

.field public q:Z

.field public r:I

.field public s:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    sput v0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->t:I

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/bnl0;->w0()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    div-int/lit8 p1, p1, 0x5

    .line 9
    .line 10
    int-to-float p1, p1

    .line 11
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->h:F

    .line 12
    .line 13
    const-wide/16 v0, 0x0

    .line 14
    .line 15
    iput-wide v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->i:J

    .line 16
    .line 17
    const/4 p1, 0x0

    .line 18
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->r:I

    .line 19
    .line 20
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->s:Lrx/subjects/b;

    .line 25
    .line 26
    return-void
.end method

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

    .line 27
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 28
    invoke-static {}, Ll/bnl0;->w0()I

    move-result p1

    div-int/lit8 p1, p1, 0x5

    int-to-float p1, p1

    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->h:F

    const-wide/16 p1, 0x0

    .line 29
    iput-wide p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->i:J

    const/4 p1, 0x0

    .line 30
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->r:I

    .line 31
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->s:Lrx/subjects/b;

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

    .line 32
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 33
    invoke-static {}, Ll/bnl0;->w0()I

    move-result p1

    div-int/lit8 p1, p1, 0x5

    int-to-float p1, p1

    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->h:F

    const-wide/16 p1, 0x0

    .line 34
    iput-wide p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->i:J

    const/4 p1, 0x0

    .line 35
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->r:I

    .line 36
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->s:Lrx/subjects/b;

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->D(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->E(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->C()V

    return-void
.end method

.method public static synthetic j(Landroid/view/View;Landroid/view/View;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    if-ne p1, p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    const/4 p0, 0x0

    .line 6
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static synthetic m(Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->B(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic p(Lrx/c;)Lrx/c;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static bridge synthetic s(Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;ZZ)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->L(ZZ)V

    return-void
.end method

.method private setBackUpViewTransY(F)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    cmpl-float v0, p1, v0

    .line 3
    .line 4
    if-lez v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    int-to-float v0, v0

    .line 11
    sub-float/2addr p1, v0

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    int-to-float v0, v0

    .line 18
    add-float/2addr p1, v0

    .line 19
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->c:Landroid/view/View;

    .line 20
    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    invoke-virtual {v0, p1}, Landroid/view/View;->setTranslationY(F)V

    .line 24
    .line 25
    .line 26
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->getBackupView()Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationY(F)V

    .line 31
    .line 32
    .line 33
    return-void
.end method


# virtual methods
.method public A()V
    .locals 4

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const/4 v2, 0x1

    .line 8
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;-><init>(Landroid/content/Context;Z)V

    .line 9
    .line 10
    .line 11
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 12
    .line 13
    sget v3, Ll/bnl0;->e:I

    .line 14
    .line 15
    invoke-direct {v1, v3, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 16
    .line 17
    .line 18
    const/4 v3, 0x0

    .line 19
    invoke-virtual {p0, v0, v3, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->a:Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;

    .line 23
    .line 24
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->a:Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;

    .line 28
    .line 29
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->l:Landroid/view/View;

    .line 30
    .line 31
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;

    .line 32
    .line 33
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-direct {v0, v1, v3}, Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;-><init>(Landroid/content/Context;Z)V

    .line 38
    .line 39
    .line 40
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 41
    .line 42
    sget v3, Ll/bnl0;->e:I

    .line 43
    .line 44
    invoke-direct {v1, v3, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0, v0, v2, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 48
    .line 49
    .line 50
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->b:Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;

    .line 51
    .line 52
    const/16 p0, 0x8

    .line 53
    .line 54
    invoke-virtual {v0, p0}, Landroid/view/View;->setVisibility(I)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public final synthetic B(Landroid/animation/ValueAnimator;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->a:Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    check-cast v1, Ljava/lang/Float;

    .line 8
    .line 9
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    check-cast p1, Ljava/lang/Float;

    .line 21
    .line 22
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->setBackUpViewTransY(F)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final synthetic C()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->k:Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView$c;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView$c;->i()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final synthetic D(Landroid/animation/ValueAnimator;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->a:Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    check-cast v1, Ljava/lang/Float;

    .line 8
    .line 9
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    check-cast p1, Ljava/lang/Float;

    .line 21
    .line 22
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->setBackUpViewTransY(F)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final synthetic E(Landroid/animation/ValueAnimator;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->a:Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    check-cast v1, Ljava/lang/Float;

    .line 8
    .line 9
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    check-cast p1, Ljava/lang/Float;

    .line 21
    .line 22
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->setBackUpViewTransY(F)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final F(F)V
    .locals 3

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v0, v0, [F

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    aput p1, v0, v1

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    const/4 v2, 0x1

    .line 9
    aput v1, v0, v2

    .line 10
    .line 11
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->p:Landroid/animation/ValueAnimator;

    .line 16
    .line 17
    invoke-static {p1}, Ll/dkt;->b(F)J

    .line 18
    .line 19
    .line 20
    move-result-wide v1

    .line 21
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->p:Landroid/animation/ValueAnimator;

    .line 25
    .line 26
    new-instance v0, Landroid/view/animation/AccelerateDecelerateInterpolator;

    .line 27
    .line 28
    invoke-direct {v0}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->p:Landroid/animation/ValueAnimator;

    .line 35
    .line 36
    new-instance v0, Ll/fkt;

    .line 37
    .line 38
    invoke-direct {v0, p0}, Ll/fkt;-><init>(Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 42
    .line 43
    .line 44
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->p:Landroid/animation/ValueAnimator;

    .line 45
    .line 46
    new-instance v0, Ll/gkt;

    .line 47
    .line 48
    invoke-direct {v0, p0}, Ll/gkt;-><init>(Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;)V

    .line 49
    .line 50
    .line 51
    invoke-static {p1, v0}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 52
    .line 53
    .line 54
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->p:Landroid/animation/ValueAnimator;

    .line 55
    .line 56
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public final G(FZ)V
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    cmpg-float v0, p1, v0

    .line 3
    .line 4
    const/4 v1, 0x1

    .line 5
    const/4 v2, 0x0

    .line 6
    if-gez v0, :cond_0

    .line 7
    .line 8
    move v0, v1

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    move v0, v2

    .line 11
    :goto_0
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->j:Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView$b;

    .line 12
    .line 13
    if-eqz v3, :cond_1

    .line 14
    .line 15
    invoke-interface {v3, v0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView$b;->a(Z)V

    .line 16
    .line 17
    .line 18
    :cond_1
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->c:Landroid/view/View;

    .line 19
    .line 20
    invoke-static {v3, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    if-eqz v0, :cond_2

    .line 28
    .line 29
    neg-int v3, v3

    .line 30
    :cond_2
    int-to-float v3, v3

    .line 31
    const/4 v4, 0x2

    .line 32
    new-array v4, v4, [F

    .line 33
    .line 34
    aput p1, v4, v2

    .line 35
    .line 36
    aput v3, v4, v1

    .line 37
    .line 38
    invoke-static {v4}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    const-wide/16 v1, 0xc8

    .line 43
    .line 44
    invoke-virtual {p1, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 45
    .line 46
    .line 47
    new-instance v1, Landroid/view/animation/AccelerateDecelerateInterpolator;

    .line 48
    .line 49
    invoke-direct {v1}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p1, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 53
    .line 54
    .line 55
    new-instance v1, Ll/ekt;

    .line 56
    .line 57
    invoke-direct {v1, p0}, Ll/ekt;-><init>(Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p1, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 61
    .line 62
    .line 63
    new-instance v1, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView$a;

    .line 64
    .line 65
    invoke-direct {v1, p0, v0, p2}, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;ZZ)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p1, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public final H(Landroid/view/MotionEvent;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->k:Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView$c;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView$c;->b()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->o:Z

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->d:F

    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->f:F

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->m:Landroid/view/VelocityTracker;

    .line 22
    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->m:Landroid/view/VelocityTracker;

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    invoke-virtual {v0}, Landroid/view/VelocityTracker;->clear()V

    .line 33
    .line 34
    .line 35
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->m:Landroid/view/VelocityTracker;

    .line 36
    .line 37
    invoke-virtual {v0, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->p:Landroid/animation/ValueAnimator;

    .line 41
    .line 42
    if-eqz p1, :cond_1

    .line 43
    .line 44
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->end()V

    .line 45
    .line 46
    .line 47
    const/4 p1, 0x0

    .line 48
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->p:Landroid/animation/ValueAnimator;

    .line 49
    .line 50
    :cond_1
    return-void
.end method

.method public I(Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0, v0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->M(ZZLcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public J(F)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->j:Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView$b;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView$b;->a(Z)V

    .line 7
    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->c:Landroid/view/View;

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->y(F)F

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    const/4 v0, 0x3

    .line 20
    new-array v0, v0, [F

    .line 21
    .line 22
    const/4 v3, 0x0

    .line 23
    aput v3, v0, v2

    .line 24
    .line 25
    aput p1, v0, v1

    .line 26
    .line 27
    const/4 p1, 0x2

    .line 28
    aput v3, v0, p1

    .line 29
    .line 30
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->n:Landroid/animation/ValueAnimator;

    .line 35
    .line 36
    const-wide/16 v0, 0x514

    .line 37
    .line 38
    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->n:Landroid/animation/ValueAnimator;

    .line 42
    .line 43
    new-instance v0, Ll/jkt;

    .line 44
    .line 45
    invoke-direct {v0, p0}, Ll/jkt;-><init>(Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 49
    .line 50
    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->n:Landroid/animation/ValueAnimator;

    .line 52
    .line 53
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public K()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->n:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->end()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->j:Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView$b;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-interface {p0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView$b;->b()V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method public final L(ZZ)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->M(ZZLcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final M(ZZLcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->c:Landroid/view/View;

    .line 2
    .line 3
    const/16 v1, 0x8

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->a:Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->a:Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->c:Landroid/view/View;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->a:Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->getBackupView()Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->a:Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;

    .line 31
    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->b:Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;

    .line 33
    .line 34
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->l:Landroid/view/View;

    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->k:Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView$c;

    .line 37
    .line 38
    if-eqz v0, :cond_0

    .line 39
    .line 40
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->getBackupView()Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-interface {v0, v2, p2}, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView$c;->h(Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;Z)V

    .line 45
    .line 46
    .line 47
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->s:Lrx/subjects/b;

    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->getBackupView()Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    invoke-virtual {v0, v2}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->k:Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView$c;

    .line 57
    .line 58
    if-eqz v0, :cond_1

    .line 59
    .line 60
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->a:Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;

    .line 61
    .line 62
    invoke-interface {v0, p1, v2, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView$c;->a(ZLcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;ZLcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;)V

    .line 63
    .line 64
    .line 65
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 66
    .line 67
    .line 68
    move-result-wide p1

    .line 69
    iput-wide p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->i:J

    .line 70
    .line 71
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->j:Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView$b;

    .line 72
    .line 73
    if-eqz p1, :cond_2

    .line 74
    .line 75
    invoke-interface {p1}, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView$b;->b()V

    .line 76
    .line 77
    .line 78
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->a:Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;

    .line 79
    .line 80
    invoke-virtual {p1, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 81
    .line 82
    .line 83
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->a:Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;

    .line 84
    .line 85
    const/4 p2, 0x0

    .line 86
    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    .line 87
    .line 88
    .line 89
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->c:Landroid/view/View;

    .line 90
    .line 91
    invoke-virtual {p0, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method public c(Ll/ner;Lrx/c;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/ner;",
            "Lrx/c<",
            "TV;>;)",
            "Lrx/c<",
            "TV;>;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->g(Ll/ner;Lrx/c;Z)Lrx/c;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public g(Ll/ner;Lrx/c;Z)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/ner;",
            "Lrx/c<",
            "TV;>;Z)",
            "Lrx/c<",
            "TV;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->l:Landroid/view/View;

    .line 2
    .line 3
    invoke-interface {p1}, Ll/ner;->lifecycle()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {}, Ll/psd0;->E()Lrx/c$d;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {p1, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->s:Lrx/subjects/b;

    .line 16
    .line 17
    new-instance v1, Ll/hkt;

    .line 18
    .line 19
    invoke-direct {v1, v0}, Ll/hkt;-><init>(Landroid/view/View;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p1, p0}, Lrx/c;->takeUntil(Lrx/c;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    new-instance p1, Ll/ikt;

    .line 31
    .line 32
    invoke-direct {p1, p2}, Ll/ikt;-><init>(Lrx/c;)V

    .line 33
    .line 34
    .line 35
    invoke-static {p1, p0, p3}, Ll/psd0;->D(Ll/pcj;Lrx/c;Z)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0
.end method

.method public getBackupView()Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->b:Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;

    .line 2
    .line 3
    return-object p0
.end method

.method public getCurrentView()Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->a:Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;

    .line 2
    .line 3
    return-object p0
.end method

.method public getIndicatorView()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->c:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->k:Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView$c;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView$c;->f()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    const/4 v1, 0x2

    .line 19
    if-ne v0, v1, :cond_1

    .line 20
    .line 21
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->d:F

    .line 26
    .line 27
    sub-float/2addr v0, v1

    .line 28
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    sget v1, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->t:I

    .line 33
    .line 34
    int-to-float v1, v1

    .line 35
    cmpl-float v0, v0, v1

    .line 36
    .line 37
    if-lez v0, :cond_2

    .line 38
    .line 39
    const/4 p0, 0x1

    .line 40
    return p0

    .line 41
    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-nez v0, :cond_2

    .line 46
    .line 47
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->H(Landroid/view/MotionEvent;)V

    .line 48
    .line 49
    .line 50
    :cond_2
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    return p0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->a:Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;

    .line 2
    .line 3
    if-eqz v0, :cond_1e

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x1

    .line 10
    if-le v0, v1, :cond_0

    .line 11
    .line 12
    goto/16 :goto_d

    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->k:Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView$c;

    .line 15
    .line 16
    invoke-interface {v0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView$c;->f()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    return p0

    .line 27
    :cond_1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 28
    .line 29
    .line 30
    move-result-wide v2

    .line 31
    iget-wide v4, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->i:J

    .line 32
    .line 33
    sub-long/2addr v2, v4

    .line 34
    long-to-float v0, v2

    .line 35
    const/high16 v2, 0x43c80000    # 400.0f

    .line 36
    .line 37
    cmpg-float v0, v0, v2

    .line 38
    .line 39
    if-gez v0, :cond_2

    .line 40
    .line 41
    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    return p0

    .line 46
    :cond_2
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    const/4 v2, 0x2

    .line 51
    const/4 v3, 0x0

    .line 52
    if-eq v0, v2, :cond_3

    .line 53
    .line 54
    iput v3, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->r:I

    .line 55
    .line 56
    :cond_3
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-nez v0, :cond_4

    .line 61
    .line 62
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->H(Landroid/view/MotionEvent;)V

    .line 63
    .line 64
    .line 65
    return v1

    .line 66
    :cond_4
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    const/high16 v4, 0x42480000    # 50.0f

    .line 71
    .line 72
    const/4 v5, 0x0

    .line 73
    if-ne v0, v2, :cond_17

    .line 74
    .line 75
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    iget v6, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->d:F

    .line 80
    .line 81
    sub-float/2addr v0, v6

    .line 82
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->e:F

    .line 83
    .line 84
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    iget v6, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->f:F

    .line 89
    .line 90
    sub-float/2addr v0, v6

    .line 91
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->g:F

    .line 92
    .line 93
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->r:I

    .line 94
    .line 95
    if-nez v0, :cond_6

    .line 96
    .line 97
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->e:F

    .line 98
    .line 99
    cmpl-float v6, v0, v5

    .line 100
    .line 101
    if-lez v6, :cond_5

    .line 102
    .line 103
    iput v1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->r:I

    .line 104
    .line 105
    goto :goto_0

    .line 106
    :cond_5
    cmpg-float v0, v0, v5

    .line 107
    .line 108
    if-gez v0, :cond_6

    .line 109
    .line 110
    iput v2, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->r:I

    .line 111
    .line 112
    :cond_6
    :goto_0
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->r:I

    .line 113
    .line 114
    if-ne v0, v1, :cond_7

    .line 115
    .line 116
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->e:F

    .line 117
    .line 118
    invoke-static {v0, v5}, Ljava/lang/Math;->max(FF)F

    .line 119
    .line 120
    .line 121
    move-result v0

    .line 122
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->e:F

    .line 123
    .line 124
    goto :goto_1

    .line 125
    :cond_7
    if-ne v0, v2, :cond_8

    .line 126
    .line 127
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->e:F

    .line 128
    .line 129
    invoke-static {v0, v5}, Ljava/lang/Math;->min(FF)F

    .line 130
    .line 131
    .line 132
    move-result v0

    .line 133
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->e:F

    .line 134
    .line 135
    :cond_8
    :goto_1
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->e:F

    .line 136
    .line 137
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 138
    .line 139
    .line 140
    move-result v0

    .line 141
    iget v6, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->g:F

    .line 142
    .line 143
    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    .line 144
    .line 145
    .line 146
    move-result v6

    .line 147
    div-float/2addr v0, v6

    .line 148
    iget v6, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->g:F

    .line 149
    .line 150
    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    .line 151
    .line 152
    .line 153
    move-result v6

    .line 154
    iget v7, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->e:F

    .line 155
    .line 156
    invoke-static {v7}, Ljava/lang/Math;->abs(F)F

    .line 157
    .line 158
    .line 159
    move-result v7

    .line 160
    div-float/2addr v6, v7

    .line 161
    iget v7, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->e:F

    .line 162
    .line 163
    invoke-static {v7}, Ljava/lang/Math;->abs(F)F

    .line 164
    .line 165
    .line 166
    move-result v7

    .line 167
    sget v8, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->t:I

    .line 168
    .line 169
    int-to-float v9, v8

    .line 170
    cmpl-float v7, v7, v9

    .line 171
    .line 172
    if-ltz v7, :cond_9

    .line 173
    .line 174
    const/high16 v7, 0x40000000    # 2.0f

    .line 175
    .line 176
    cmpl-float v0, v0, v7

    .line 177
    .line 178
    if-lez v0, :cond_9

    .line 179
    .line 180
    move v0, v1

    .line 181
    goto :goto_2

    .line 182
    :cond_9
    move v0, v3

    .line 183
    :goto_2
    iget v7, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->g:F

    .line 184
    .line 185
    invoke-static {v7}, Ljava/lang/Math;->abs(F)F

    .line 186
    .line 187
    .line 188
    move-result v7

    .line 189
    int-to-float v8, v8

    .line 190
    cmpl-float v7, v7, v8

    .line 191
    .line 192
    if-ltz v7, :cond_a

    .line 193
    .line 194
    const/high16 v7, 0x40400000    # 3.0f

    .line 195
    .line 196
    cmpl-float v6, v6, v7

    .line 197
    .line 198
    if-lez v6, :cond_a

    .line 199
    .line 200
    move v6, v1

    .line 201
    goto :goto_3

    .line 202
    :cond_a
    move v6, v3

    .line 203
    :goto_3
    if-eqz v0, :cond_b

    .line 204
    .line 205
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->requestDisallowInterceptTouchEvent(Z)V

    .line 206
    .line 207
    .line 208
    goto :goto_4

    .line 209
    :cond_b
    if-eqz v6, :cond_16

    .line 210
    .line 211
    xor-int/lit8 v0, v6, 0x1

    .line 212
    .line 213
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->requestDisallowInterceptTouchEvent(Z)V

    .line 214
    .line 215
    .line 216
    :goto_4
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->e:F

    .line 217
    .line 218
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->y(F)F

    .line 219
    .line 220
    .line 221
    move-result v0

    .line 222
    iget v6, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->r:I

    .line 223
    .line 224
    if-nez v6, :cond_d

    .line 225
    .line 226
    cmpl-float v6, v0, v5

    .line 227
    .line 228
    if-lez v6, :cond_c

    .line 229
    .line 230
    iput v1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->r:I

    .line 231
    .line 232
    goto :goto_5

    .line 233
    :cond_c
    cmpg-float v6, v0, v5

    .line 234
    .line 235
    if-gez v6, :cond_d

    .line 236
    .line 237
    iput v2, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->r:I

    .line 238
    .line 239
    :cond_d
    :goto_5
    iget v6, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->r:I

    .line 240
    .line 241
    if-ne v6, v1, :cond_e

    .line 242
    .line 243
    invoke-static {v0, v5}, Ljava/lang/Math;->max(FF)F

    .line 244
    .line 245
    .line 246
    move-result v0

    .line 247
    goto :goto_6

    .line 248
    :cond_e
    if-ne v6, v2, :cond_f

    .line 249
    .line 250
    invoke-static {v0, v5}, Ljava/lang/Math;->min(FF)F

    .line 251
    .line 252
    .line 253
    move-result v0

    .line 254
    :cond_f
    :goto_6
    iget-boolean v2, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->o:Z

    .line 255
    .line 256
    if-nez v2, :cond_12

    .line 257
    .line 258
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 259
    .line 260
    .line 261
    move-result v2

    .line 262
    iget v3, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->f:F

    .line 263
    .line 264
    sub-float/2addr v2, v3

    .line 265
    cmpl-float v2, v2, v4

    .line 266
    .line 267
    if-lez v2, :cond_10

    .line 268
    .line 269
    iget-boolean v2, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->q:Z

    .line 270
    .line 271
    if-nez v2, :cond_10

    .line 272
    .line 273
    iput-boolean v1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->q:Z

    .line 274
    .line 275
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->k:Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView$c;

    .line 276
    .line 277
    invoke-interface {v0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView$c;->c()V

    .line 278
    .line 279
    .line 280
    goto :goto_7

    .line 281
    :cond_10
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 282
    .line 283
    .line 284
    move-result v0

    .line 285
    cmpl-float v0, v0, v4

    .line 286
    .line 287
    if-lez v0, :cond_11

    .line 288
    .line 289
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->q:Z

    .line 290
    .line 291
    if-nez v0, :cond_11

    .line 292
    .line 293
    iput-boolean v1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->q:Z

    .line 294
    .line 295
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->k:Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView$c;

    .line 296
    .line 297
    invoke-interface {v0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView$c;->g()V

    .line 298
    .line 299
    .line 300
    :cond_11
    :goto_7
    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 301
    .line 302
    .line 303
    move-result p0

    .line 304
    return p0

    .line 305
    :cond_12
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->m:Landroid/view/VelocityTracker;

    .line 306
    .line 307
    invoke-virtual {v2, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 308
    .line 309
    .line 310
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->a:Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;

    .line 311
    .line 312
    invoke-virtual {v2, v0}, Landroid/view/View;->setTranslationY(F)V

    .line 313
    .line 314
    .line 315
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->j:Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView$b;

    .line 316
    .line 317
    if-eqz v2, :cond_14

    .line 318
    .line 319
    cmpg-float v6, v0, v5

    .line 320
    .line 321
    if-gez v6, :cond_13

    .line 322
    .line 323
    move v6, v1

    .line 324
    goto :goto_8

    .line 325
    :cond_13
    move v6, v3

    .line 326
    :goto_8
    invoke-interface {v2, v6}, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView$b;->c(Z)Z

    .line 327
    .line 328
    .line 329
    move-result v2

    .line 330
    goto :goto_9

    .line 331
    :cond_14
    move v2, v1

    .line 332
    :goto_9
    iget-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->c:Landroid/view/View;

    .line 333
    .line 334
    invoke-virtual {v6, v3}, Landroid/view/View;->setVisibility(I)V

    .line 335
    .line 336
    .line 337
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->getBackupView()Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;

    .line 338
    .line 339
    .line 340
    move-result-object v6

    .line 341
    invoke-static {v6, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 342
    .line 343
    .line 344
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->setBackUpViewTransY(F)V

    .line 345
    .line 346
    .line 347
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->k:Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView$c;

    .line 348
    .line 349
    if-eqz v2, :cond_1d

    .line 350
    .line 351
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 352
    .line 353
    .line 354
    move-result v2

    .line 355
    cmpl-float v2, v2, v4

    .line 356
    .line 357
    if-lez v2, :cond_1d

    .line 358
    .line 359
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->k:Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView$c;

    .line 360
    .line 361
    cmpg-float v0, v0, v5

    .line 362
    .line 363
    if-gez v0, :cond_15

    .line 364
    .line 365
    goto :goto_a

    .line 366
    :cond_15
    move v1, v3

    .line 367
    :goto_a
    invoke-interface {v2, v1}, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView$c;->e(Z)V

    .line 368
    .line 369
    .line 370
    goto :goto_c

    .line 371
    :cond_16
    return v1

    .line 372
    :cond_17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->a:Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;

    .line 373
    .line 374
    invoke-virtual {v0}, Landroid/view/View;->getTranslationY()F

    .line 375
    .line 376
    .line 377
    move-result v0

    .line 378
    cmpl-float v0, v0, v5

    .line 379
    .line 380
    if-nez v0, :cond_19

    .line 381
    .line 382
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->w()V

    .line 383
    .line 384
    .line 385
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->k:Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView$c;

    .line 386
    .line 387
    if-eqz v0, :cond_18

    .line 388
    .line 389
    invoke-interface {v0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView$c;->i()V

    .line 390
    .line 391
    .line 392
    :cond_18
    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 393
    .line 394
    .line 395
    move-result p0

    .line 396
    return p0

    .line 397
    :cond_19
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->m:Landroid/view/VelocityTracker;

    .line 398
    .line 399
    const/16 v1, 0x3e8

    .line 400
    .line 401
    invoke-virtual {v0, v1}, Landroid/view/VelocityTracker;->computeCurrentVelocity(I)V

    .line 402
    .line 403
    .line 404
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->e:F

    .line 405
    .line 406
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->y(F)F

    .line 407
    .line 408
    .line 409
    move-result v0

    .line 410
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->o:Z

    .line 411
    .line 412
    if-eqz v1, :cond_1c

    .line 413
    .line 414
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 415
    .line 416
    .line 417
    move-result v1

    .line 418
    iget v2, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->h:F

    .line 419
    .line 420
    cmpl-float v1, v1, v2

    .line 421
    .line 422
    if-gtz v1, :cond_1a

    .line 423
    .line 424
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->m:Landroid/view/VelocityTracker;

    .line 425
    .line 426
    invoke-virtual {v1}, Landroid/view/VelocityTracker;->getYVelocity()F

    .line 427
    .line 428
    .line 429
    move-result v1

    .line 430
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    .line 431
    .line 432
    .line 433
    move-result v1

    .line 434
    const/high16 v2, 0x457a0000    # 4000.0f

    .line 435
    .line 436
    cmpl-float v1, v1, v2

    .line 437
    .line 438
    if-lez v1, :cond_1b

    .line 439
    .line 440
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 441
    .line 442
    .line 443
    move-result v1

    .line 444
    cmpl-float v1, v1, v4

    .line 445
    .line 446
    if-lez v1, :cond_1b

    .line 447
    .line 448
    :cond_1a
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->t(F)Z

    .line 449
    .line 450
    .line 451
    move-result v1

    .line 452
    if-eqz v1, :cond_1b

    .line 453
    .line 454
    invoke-virtual {p0, v0, v3}, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->G(FZ)V

    .line 455
    .line 456
    .line 457
    goto :goto_b

    .line 458
    :cond_1b
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->F(F)V

    .line 459
    .line 460
    .line 461
    :cond_1c
    :goto_b
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->w()V

    .line 462
    .line 463
    .line 464
    :cond_1d
    :goto_c
    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 465
    .line 466
    .line 467
    move-result p0

    .line 468
    return p0

    .line 469
    :cond_1e
    :goto_d
    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 470
    .line 471
    .line 472
    move-result p0

    .line 473
    return p0
.end method

.method public setIndicatorView(Landroid/view/View;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->c:Landroid/view/View;

    .line 2
    .line 3
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 4
    .line 5
    sget v1, Ll/bnl0;->e:I

    .line 6
    .line 7
    invoke-direct {v0, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->c:Landroid/view/View;

    .line 14
    .line 15
    const/16 p1, 0x8

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public setOnLiveScrollListener(Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->j:Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView$b;

    .line 2
    .line 3
    return-void
.end method

.method public setOnViewListener(Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView$c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->k:Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView$c;

    .line 2
    .line 3
    return-void
.end method

.method public final t(F)Z
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->k:Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView$c;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-nez p0, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    const/4 v1, 0x0

    .line 8
    cmpg-float p1, p1, v1

    .line 9
    .line 10
    if-gez p1, :cond_1

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_1
    const/4 v0, 0x0

    .line 14
    :goto_0
    invoke-interface {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView$c;->d(Z)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public final w()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->d:F

    .line 3
    .line 4
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->e:F

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->q:Z

    .line 8
    .line 9
    return-void
.end method

.method public final y(F)F
    .locals 6

    .line 1
    const/4 p0, 0x0

    .line 2
    cmpl-float p0, p1, p0

    .line 3
    .line 4
    if-lez p0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    :goto_0
    const-wide/high16 v0, 0x4099000000000000L    # 1600.0

    .line 10
    .line 11
    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    double-to-int v0, v0

    .line 16
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    int-to-float v0, v0

    .line 25
    div-float/2addr p1, v0

    .line 26
    float-to-double v2, p1

    .line 27
    const-wide v4, 0x3ffbd70a3f0a3d71L    # 1.7400000059604646

    .line 28
    .line 29
    .line 30
    .line 31
    .line 32
    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->pow(DD)D

    .line 33
    .line 34
    .line 35
    move-result-wide v2

    .line 36
    double-to-float p1, v2

    .line 37
    sub-float/2addr v1, p1

    .line 38
    float-to-int p1, v1

    .line 39
    int-to-float p1, p1

    .line 40
    if-eqz p0, :cond_1

    .line 41
    .line 42
    return p1

    .line 43
    :cond_1
    neg-float p0, p1

    .line 44
    return p0
.end method

.method public z(Ll/y20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->a:Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {p1, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->b:Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method
