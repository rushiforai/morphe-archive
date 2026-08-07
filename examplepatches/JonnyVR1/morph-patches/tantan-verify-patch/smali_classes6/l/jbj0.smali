.class public Ll/jbj0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/jbj0$a;
    }
.end annotation


# instance fields
.field public a:Lv/VLinear;

.field public b:Landroid/widget/ImageView;

.field public c:Landroid/view/View;

.field public d:Landroidx/recyclerview/widget/RecyclerView;

.field public e:Landroid/widget/RelativeLayout;

.field public f:Lv/VText;

.field public g:Landroid/widget/ImageView;

.field public h:Landroid/view/View;

.field public i:Lcom/p1/mobile/android/app/Act;

.field public j:Landroid/widget/FrameLayout;

.field public k:Ll/zaj0;

.field public l:Ll/jbj0$a;

.field public m:Ljava/lang/String;

.field public n:Lcom/p1/mobile/putong/feed/data/TopicMoment;

.field public o:Ll/tee0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/tee0<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;"
        }
    .end annotation
.end field

.field public p:Ll/l4g0;

.field public q:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ll/tee0<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;>;"
        }
    .end annotation
.end field

.field public r:Ll/x20;

.field public s:Ll/x20;

.field public t:Ll/x20;

.field public u:Ll/pcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pcj<",
            "Lrx/c<",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/data/Links;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;>;>;>;"
        }
    .end annotation
.end field

.field public v:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;"
        }
    .end annotation
.end field

.field public w:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public x:Ll/z20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/z20<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;>;"
        }
    .end annotation
.end field

.field public y:I


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Landroid/widget/FrameLayout;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/l4g0;

    .line 5
    .line 6
    const-class v1, Ll/jbj0;

    .line 7
    .line 8
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    const-string v2, "p_add_topic_pop"

    .line 13
    .line 14
    invoke-direct {v0, v2, v1}, Ll/l4g0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Ll/jbj0;->p:Ll/l4g0;

    .line 18
    .line 19
    new-instance v0, Ll/ebj0;

    .line 20
    .line 21
    invoke-direct {v0, p0}, Ll/ebj0;-><init>(Ll/jbj0;)V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Ll/jbj0;->q:Ll/y20;

    .line 25
    .line 26
    const/4 v0, 0x0

    .line 27
    iput v0, p0, Ll/jbj0;->y:I

    .line 28
    .line 29
    iput-object p1, p0, Ll/jbj0;->i:Lcom/p1/mobile/android/app/Act;

    .line 30
    .line 31
    iput-object p2, p0, Ll/jbj0;->j:Landroid/widget/FrameLayout;

    .line 32
    .line 33
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p0, p1, p2}, Ll/jbj0;->i(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {p2, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Ll/jbj0;->n()V

    .line 45
    .line 46
    .line 47
    iget-object p0, p0, Ll/jbj0;->p:Ll/l4g0;

    .line 48
    .line 49
    invoke-virtual {p0}, Ll/l4g0;->c()V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public static synthetic a(Ll/jbj0;Ll/tee0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jbj0;->r(Ll/tee0;)V

    return-void
.end method

.method public static synthetic b(Ll/jbj0;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jbj0;->s(Z)V

    return-void
.end method

.method public static synthetic c(Ll/jbj0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jbj0;->q(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Ll/jbj0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jbj0;->p(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Ll/jbj0;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jbj0;->t(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic f(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic g(Ll/jbj0;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jbj0;->u(I)V

    return-void
.end method

.method public static bridge synthetic h(Ll/jbj0;Lcom/p1/mobile/putong/feed/data/TopicMoment;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/jbj0;->v(Lcom/p1/mobile/putong/feed/data/TopicMoment;Z)V

    return-void
.end method


# virtual methods
.method public A(Ll/pcj;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pcj<",
            "Lrx/c<",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/data/Links;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;>;>;>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/jbj0;->u:Ll/pcj;

    .line 2
    .line 3
    iget-object p1, p0, Ll/jbj0;->k:Ll/zaj0;

    .line 4
    .line 5
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Ll/jbj0;->k:Ll/zaj0;

    .line 12
    .line 13
    iget-object p0, p0, Ll/jbj0;->u:Ll/pcj;

    .line 14
    .line 15
    invoke-virtual {p1, p0}, Ll/zaj0;->n(Ll/pcj;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public B(Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jbj0;->r:Ll/x20;

    .line 2
    .line 3
    return-void
.end method

.method public C(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/jbj0;->w:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public D(Ll/z20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/z20<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/jbj0;->x:Ll/z20;

    .line 2
    .line 3
    return-void
.end method

.method public E(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/jbj0;->v:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public F()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/jbj0;->j:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, p0, Ll/jbj0;->p:Ll/l4g0;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/l4g0;->r()V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/jbj0;->j:Landroid/widget/FrameLayout;

    .line 16
    .line 17
    const/4 v1, 0x1

    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    new-instance v0, Ll/zaj0;

    .line 22
    .line 23
    invoke-direct {v0}, Ll/zaj0;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Ll/jbj0;->k:Ll/zaj0;

    .line 27
    .line 28
    iget-object v1, p0, Ll/jbj0;->q:Ll/y20;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ll/zaj0;->o(Ll/y20;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/jbj0;->k:Ll/zaj0;

    .line 34
    .line 35
    iget-object v1, p0, Ll/jbj0;->u:Ll/pcj;

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ll/zaj0;->n(Ll/pcj;)V

    .line 38
    .line 39
    .line 40
    const-string v0, ""

    .line 41
    .line 42
    invoke-virtual {p0, v0}, Ll/jbj0;->x(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Ll/jbj0;->h:Landroid/view/View;

    .line 46
    .line 47
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-lez v0, :cond_1

    .line 52
    .line 53
    iget-object v0, p0, Ll/jbj0;->a:Lv/VLinear;

    .line 54
    .line 55
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    iget-object v1, p0, Ll/jbj0;->h:Landroid/view/View;

    .line 60
    .line 61
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    sub-int/2addr v0, v1

    .line 66
    const/16 v1, 0xc8

    .line 67
    .line 68
    const/4 v2, 0x0

    .line 69
    invoke-virtual {p0, v0, v2, v1, v2}, Ll/jbj0;->H(IIIZ)V

    .line 70
    .line 71
    .line 72
    :cond_1
    :goto_0
    return-void
.end method

.method public G(I)V
    .locals 2

    .line 1
    iget v0, p0, Ll/jbj0;->y:I

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iput p1, p0, Ll/jbj0;->y:I

    .line 7
    .line 8
    if-lez p1, :cond_1

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    const/16 v1, 0xc8

    .line 12
    .line 13
    invoke-virtual {p0, v0, p1, v1}, Ll/jbj0;->I(III)V

    .line 14
    .line 15
    .line 16
    :cond_1
    :goto_0
    return-void
.end method

.method public final H(IIIZ)V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/jbj0;->a:Lv/VLinear;

    .line 2
    .line 3
    int-to-long v4, p3

    .line 4
    new-instance v6, Landroid/view/animation/LinearInterpolator;

    .line 5
    .line 6
    invoke-direct {v6}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 7
    .line 8
    .line 9
    int-to-float p1, p1

    .line 10
    int-to-float p2, p2

    .line 11
    const/4 p3, 0x2

    .line 12
    new-array v7, p3, [F

    .line 13
    .line 14
    const/4 p3, 0x0

    .line 15
    aput p1, v7, p3

    .line 16
    .line 17
    const/4 p1, 0x1

    .line 18
    aput p2, v7, p1

    .line 19
    .line 20
    const-string v1, "translationY"

    .line 21
    .line 22
    const-wide/16 v2, 0x0

    .line 23
    .line 24
    invoke-static/range {v0 .. v7}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    new-instance p2, Ll/dbj0;

    .line 29
    .line 30
    invoke-direct {p2, p0, p4}, Ll/dbj0;-><init>(Ll/jbj0;Z)V

    .line 31
    .line 32
    .line 33
    invoke-static {p1, p2}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1}, Landroid/animation/Animator;->start()V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final I(III)V
    .locals 6

    .line 1
    filled-new-array {p1, p2}, [I

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Landroid/view/animation/LinearInterpolator;

    .line 10
    .line 11
    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 12
    .line 13
    .line 14
    const-wide/16 v2, 0x0

    .line 15
    .line 16
    int-to-long v4, p3

    .line 17
    invoke-static/range {v0 .. v5}, Ll/gt0;->k(Landroid/animation/Animator;Landroid/view/animation/Interpolator;JJ)Landroid/animation/Animator;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    move-object p3, p1

    .line 22
    check-cast p3, Landroid/animation/ValueAnimator;

    .line 23
    .line 24
    new-instance v0, Ll/bbj0;

    .line 25
    .line 26
    invoke-direct {v0, p0}, Ll/bbj0;-><init>(Ll/jbj0;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p3, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 30
    .line 31
    .line 32
    new-instance p3, Ll/cbj0;

    .line 33
    .line 34
    invoke-direct {p3, p0, p2}, Ll/cbj0;-><init>(Ll/jbj0;I)V

    .line 35
    .line 36
    .line 37
    invoke-static {p1, p3}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1}, Landroid/animation/Animator;->start()V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public i(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/kbj0;->b(Ll/jbj0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final j()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jbj0;->s:Ll/x20;

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
    iget-object p0, p0, Ll/jbj0;->s:Ll/x20;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/x20;->call()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final k()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jbj0;->t:Ll/x20;

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
    iget-object p0, p0, Ll/jbj0;->t:Ll/x20;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/x20;->call()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public l()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/jbj0;->j:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, p0, Ll/jbj0;->p:Ll/l4g0;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/l4g0;->g()V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/jbj0;->k:Ll/zaj0;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    iget-object v0, p0, Ll/jbj0;->k:Ll/zaj0;

    .line 24
    .line 25
    const/4 v1, 0x0

    .line 26
    invoke-virtual {v0, v1}, Ll/zaj0;->o(Ll/y20;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/jbj0;->k:Ll/zaj0;

    .line 30
    .line 31
    invoke-virtual {v0}, Ll/b6;->d()V

    .line 32
    .line 33
    .line 34
    :cond_1
    iget-object v0, p0, Ll/jbj0;->a:Lv/VLinear;

    .line 35
    .line 36
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    iget-object v1, p0, Ll/jbj0;->h:Landroid/view/View;

    .line 41
    .line 42
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    sub-int/2addr v0, v1

    .line 47
    const/16 v1, 0xc8

    .line 48
    .line 49
    const/4 v2, 0x1

    .line 50
    const/4 v3, 0x0

    .line 51
    invoke-virtual {p0, v3, v0, v1, v2}, Ll/jbj0;->H(IIIZ)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Ll/jbj0;->o:Ll/tee0;

    .line 55
    .line 56
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-eqz v0, :cond_2

    .line 61
    .line 62
    iget-object v0, p0, Ll/jbj0;->m:Ljava/lang/String;

    .line 63
    .line 64
    iget-object v1, p0, Ll/jbj0;->o:Ll/tee0;

    .line 65
    .line 66
    iget-object v1, v1, Ll/tee0;->c:Ljava/lang/String;

    .line 67
    .line 68
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-eqz v0, :cond_2

    .line 73
    .line 74
    iget-object v0, p0, Ll/jbj0;->o:Ll/tee0;

    .line 75
    .line 76
    iget-object v0, v0, Ll/tee0;->c:Ljava/lang/String;

    .line 77
    .line 78
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    if-nez v0, :cond_2

    .line 83
    .line 84
    iget-object v0, p0, Ll/jbj0;->x:Ll/z20;

    .line 85
    .line 86
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    if-eqz v0, :cond_2

    .line 91
    .line 92
    iget-object v0, p0, Ll/jbj0;->x:Ll/z20;

    .line 93
    .line 94
    iget-object p0, p0, Ll/jbj0;->o:Ll/tee0;

    .line 95
    .line 96
    iget-object v1, p0, Ll/tee0;->c:Ljava/lang/String;

    .line 97
    .line 98
    iget-object p0, p0, Ll/tee0;->b:Ll/pf60;

    .line 99
    .line 100
    iget-object p0, p0, Ll/pf60;->b:Ljava/lang/Object;

    .line 101
    .line 102
    check-cast p0, Ljava/util/List;

    .line 103
    .line 104
    invoke-interface {v0, v1, p0}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 105
    .line 106
    .line 107
    :cond_2
    :goto_0
    return-void
.end method

.method public m()V
    .locals 3

    .line 1
    iget v0, p0, Ll/jbj0;->y:I

    .line 2
    .line 3
    if-lez v0, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    iput v1, p0, Ll/jbj0;->y:I

    .line 7
    .line 8
    const/16 v2, 0x12c

    .line 9
    .line 10
    invoke-virtual {p0, v0, v1, v2}, Ll/jbj0;->I(III)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public final n()V
    .locals 3

    .line 1
    invoke-static {}, Ll/j4h;->h()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/jbj0;->b:Landroid/widget/ImageView;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    .line 14
    .line 15
    const/high16 v1, 0x41a00000    # 20.0f

    .line 16
    .line 17
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    iput v2, v0, Landroid/widget/RelativeLayout$LayoutParams;->width:I

    .line 22
    .line 23
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    .line 28
    .line 29
    const/high16 v1, 0x41000000    # 8.0f

    .line 30
    .line 31
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->rightMargin:I

    .line 36
    .line 37
    iget-object v0, p0, Ll/jbj0;->b:Landroid/widget/ImageView;

    .line 38
    .line 39
    sget v1, Ll/lbc0;->t5:I

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Ll/jbj0;->g:Landroid/widget/ImageView;

    .line 45
    .line 46
    sget v1, Ll/lbc0;->s5:I

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 49
    .line 50
    .line 51
    :cond_0
    iget-object v0, p0, Ll/jbj0;->j:Landroid/widget/FrameLayout;

    .line 52
    .line 53
    new-instance v1, Ll/fbj0;

    .line 54
    .line 55
    invoke-direct {v1}, Ll/fbj0;-><init>()V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Ll/jbj0;->c:Landroid/view/View;

    .line 62
    .line 63
    new-instance v1, Ll/gbj0;

    .line 64
    .line 65
    invoke-direct {v1, p0}, Ll/gbj0;-><init>(Ll/jbj0;)V

    .line 66
    .line 67
    .line 68
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Ll/jbj0;->e:Landroid/widget/RelativeLayout;

    .line 72
    .line 73
    new-instance v1, Ll/hbj0;

    .line 74
    .line 75
    invoke-direct {v1, p0}, Ll/hbj0;-><init>(Ll/jbj0;)V

    .line 76
    .line 77
    .line 78
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 79
    .line 80
    .line 81
    new-instance v0, Ll/jbj0$a;

    .line 82
    .line 83
    iget-object v1, p0, Ll/jbj0;->i:Lcom/p1/mobile/android/app/Act;

    .line 84
    .line 85
    invoke-direct {v0, p0, v1}, Ll/jbj0$a;-><init>(Ll/jbj0;Lcom/p1/mobile/android/app/Act;)V

    .line 86
    .line 87
    .line 88
    iput-object v0, p0, Ll/jbj0;->l:Ll/jbj0$a;

    .line 89
    .line 90
    iget-object v1, p0, Ll/jbj0;->d:Landroidx/recyclerview/widget/RecyclerView;

    .line 91
    .line 92
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 93
    .line 94
    .line 95
    iget-object p0, p0, Ll/jbj0;->d:Landroidx/recyclerview/widget/RecyclerView;

    .line 96
    .line 97
    invoke-virtual {p0}, Landroid/view/View;->clearAnimation()V

    .line 98
    .line 99
    .line 100
    return-void
.end method

.method public o()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jbj0;->j:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final synthetic p(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/jbj0;->l()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/jbj0;->k()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic q(Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p1, "e_pick_topic"

    .line 2
    .line 3
    const-string v0, "p_add_topic_pop"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/jbj0;->r:Ll/x20;

    .line 9
    .line 10
    if-nez p0, :cond_0

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-interface {p0}, Ll/x20;->call()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic r(Ll/tee0;)V
    .locals 2

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
    iget-object v0, p0, Ll/jbj0;->m:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v1, p1, Ll/tee0;->c:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Ll/jbj0;->w(Ll/tee0;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public final synthetic s(Z)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p1, p0, Ll/jbj0;->j:Landroid/widget/FrameLayout;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    :cond_0
    iget-object p0, p0, Ll/jbj0;->a:Lv/VLinear;

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationY(F)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic t(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Integer;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iget-object p0, p0, Ll/jbj0;->h:Landroid/view/View;

    .line 12
    .line 13
    invoke-static {p0, p1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic u(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jbj0;->h:Landroid/view/View;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final v(Lcom/p1/mobile/putong/feed/data/TopicMoment;Z)V
    .locals 0

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/jbj0;->l()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/jbj0;->j()V

    .line 7
    .line 8
    .line 9
    :cond_0
    iget-object p2, p0, Ll/jbj0;->v:Ll/y20;

    .line 10
    .line 11
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    if-eqz p2, :cond_1

    .line 16
    .line 17
    iget-object p0, p0, Ll/jbj0;->v:Ll/y20;

    .line 18
    .line 19
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    :cond_1
    return-void
.end method

.method public final w(Ll/tee0;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/tee0<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/jbj0;->o:Ll/tee0;

    .line 2
    .line 3
    new-instance v0, Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eqz v1, :cond_1

    .line 13
    .line 14
    invoke-virtual {p1}, Ll/tee0;->a()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    iget-object v1, p1, Ll/tee0;->b:Ll/pf60;

    .line 21
    .line 22
    iget-object v1, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 23
    .line 24
    check-cast v1, Ljava/util/Collection;

    .line 25
    .line 26
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-eqz v1, :cond_0

    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    iget-object v1, p1, Ll/tee0;->b:Ll/pf60;

    .line 34
    .line 35
    iget-object v1, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 36
    .line 37
    check-cast v1, Ljava/util/Collection;

    .line 38
    .line 39
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 40
    .line 41
    .line 42
    :cond_1
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    const/4 v2, 0x0

    .line 47
    const/4 v3, 0x0

    .line 48
    if-lez v1, :cond_2

    .line 49
    .line 50
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    check-cast v1, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_2
    move-object v1, v2

    .line 58
    :goto_0
    if-eqz v1, :cond_4

    .line 59
    .line 60
    iget-object v4, p0, Ll/jbj0;->m:Ljava/lang/String;

    .line 61
    .line 62
    iget-object v5, v1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->name:Ljava/lang/String;

    .line 63
    .line 64
    invoke-static {v4, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 65
    .line 66
    .line 67
    move-result v4

    .line 68
    if-nez v4, :cond_3

    .line 69
    .line 70
    goto :goto_1

    .line 71
    :cond_3
    move-object v2, v1

    .line 72
    :cond_4
    :goto_1
    iput-object v2, p0, Ll/jbj0;->n:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 73
    .line 74
    iget-object v1, p0, Ll/jbj0;->l:Ll/jbj0$a;

    .line 75
    .line 76
    iget-object p1, p1, Ll/tee0;->c:Ljava/lang/String;

    .line 77
    .line 78
    invoke-virtual {v1, p1, v0}, Ll/jbj0$a;->I(Ljava/lang/String;Ljava/util/List;)V

    .line 79
    .line 80
    .line 81
    iget-object p0, p0, Ll/jbj0;->d:Landroidx/recyclerview/widget/RecyclerView;

    .line 82
    .line 83
    invoke-virtual {p0, v3}, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method public x(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jbj0;->k:Ll/zaj0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iput-object p1, p0, Ll/jbj0;->m:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ll/b6;->i(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public y(Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jbj0;->s:Ll/x20;

    .line 2
    .line 3
    return-void
.end method

.method public z(Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jbj0;->t:Ll/x20;

    .line 2
    .line 3
    return-void
.end method
