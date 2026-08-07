.class public Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/FrameLayout;",
        "Ll/iam<",
        "Ll/ki3;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;

.field public b:Landroid/animation/AnimatorSet;

.field public c:Landroid/animation/ValueAnimator;

.field public d:Landroid/animation/ObjectAnimator;

.field public e:Landroid/animation/ObjectAnimator;

.field public f:Z

.field public g:Ll/pf2;

.field public h:Ll/si3;

.field public i:Ll/x20;

.field public j:Landroid/animation/Animator$AnimatorListener;

.field public k:Ljava/lang/Runnable;

.field public l:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
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
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->f:Z

    .line 6
    .line 7
    new-instance p1, Ll/si3;

    .line 8
    .line 9
    invoke-direct {p1}, Ll/si3;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->h:Ll/si3;

    .line 13
    .line 14
    new-instance p1, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView$a;

    .line 15
    .line 16
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;)V

    .line 17
    .line 18
    .line 19
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->j:Landroid/animation/Animator$AnimatorListener;

    .line 20
    .line 21
    new-instance p1, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView$b;

    .line 22
    .line 23
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView$b;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;)V

    .line 24
    .line 25
    .line 26
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->k:Ljava/lang/Runnable;

    .line 27
    .line 28
    new-instance p1, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView$c;

    .line 29
    .line 30
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView$c;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;)V

    .line 31
    .line 32
    .line 33
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->l:Ljava/lang/Runnable;

    .line 34
    .line 35
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

    .line 36
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 37
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->f:Z

    .line 38
    new-instance p1, Ll/si3;

    invoke-direct {p1}, Ll/si3;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->h:Ll/si3;

    .line 39
    new-instance p1, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView$a;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->j:Landroid/animation/Animator$AnimatorListener;

    .line 40
    new-instance p1, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView$b;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView$b;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->k:Ljava/lang/Runnable;

    .line 41
    new-instance p1, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView$c;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView$c;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->l:Ljava/lang/Runnable;

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

    .line 42
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 43
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->f:Z

    .line 44
    new-instance p1, Ll/si3;

    invoke-direct {p1}, Ll/si3;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->h:Ll/si3;

    .line 45
    new-instance p1, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView$a;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->j:Landroid/animation/Animator$AnimatorListener;

    .line 46
    new-instance p1, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView$b;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView$b;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->k:Ljava/lang/Runnable;

    .line 47
    new-instance p1, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView$c;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView$c;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->l:Ljava/lang/Runnable;

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->v()V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->u()V

    return-void
.end method

.method public static synthetic c(Ll/pf2;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pf2;->o()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;)Ll/pf2;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->g:Ll/pf2;

    return-object p0
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;)Ljava/lang/Runnable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->l:Ljava/lang/Runnable;

    return-object p0
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;)Ljava/lang/Runnable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->k:Ljava/lang/Runnable;

    return-object p0
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;)Ll/x20;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->i:Ll/x20;

    return-object p0
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->f:Z

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->w(Z)V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->z(Z)V

    return-void
.end method

.method private q()V
    .locals 9

    .line 1
    invoke-static {}, Ll/bnl0;->y0()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    const/4 v1, 0x2

    .line 7
    new-array v2, v1, [F

    .line 8
    .line 9
    const/4 v3, 0x0

    .line 10
    aput v0, v2, v3

    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    const/4 v4, 0x0

    .line 14
    aput v4, v2, v0

    .line 15
    .line 16
    sget-object v5, Landroid/view/View;->TRANSLATION_X:Landroid/util/Property;

    .line 17
    .line 18
    invoke-static {p0, v5, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->d:Landroid/animation/ObjectAnimator;

    .line 23
    .line 24
    const-wide/16 v6, 0x1f4

    .line 25
    .line 26
    invoke-virtual {v2, v6, v7}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 27
    .line 28
    .line 29
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->d:Landroid/animation/ObjectAnimator;

    .line 30
    .line 31
    new-instance v8, Ll/qi3;

    .line 32
    .line 33
    invoke-direct {v8, p0}, Ll/qi3;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;)V

    .line 34
    .line 35
    .line 36
    invoke-static {v2, v8}, Ll/gt0;->v(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 37
    .line 38
    .line 39
    invoke-static {}, Ll/bnl0;->y0()I

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    neg-int v2, v2

    .line 44
    int-to-float v2, v2

    .line 45
    new-array v1, v1, [F

    .line 46
    .line 47
    aput v4, v1, v3

    .line 48
    .line 49
    aput v2, v1, v0

    .line 50
    .line 51
    invoke-static {p0, v5, v1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->e:Landroid/animation/ObjectAnimator;

    .line 56
    .line 57
    invoke-virtual {v0, v6, v7}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->e:Landroid/animation/ObjectAnimator;

    .line 61
    .line 62
    new-instance v1, Ll/ri3;

    .line 63
    .line 64
    invoke-direct {v1, p0}, Ll/ri3;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;)V

    .line 65
    .line 66
    .line 67
    invoke-static {v0, v1}, Ll/gt0;->v(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 68
    .line 69
    .line 70
    filled-new-array {v3, v3}, [I

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->c:Landroid/animation/ValueAnimator;

    .line 79
    .line 80
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->g:Ll/pf2;

    .line 81
    .line 82
    invoke-virtual {v1}, Ll/pf2;->m()J

    .line 83
    .line 84
    .line 85
    move-result-wide v1

    .line 86
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 87
    .line 88
    .line 89
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->c:Landroid/animation/ValueAnimator;

    .line 90
    .line 91
    new-instance v1, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView$d;

    .line 92
    .line 93
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView$d;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 97
    .line 98
    .line 99
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->a:Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public destroy()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->c:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    invoke-static {v0}, Ll/it0;->A(Landroid/animation/Animator;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->b:Landroid/animation/AnimatorSet;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->end()V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->b:Landroid/animation/AnimatorSet;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/animation/Animator;->removeAllListeners()V

    .line 16
    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->b:Landroid/animation/AnimatorSet;

    .line 20
    .line 21
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->k:Ljava/lang/Runnable;

    .line 22
    .line 23
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->l:Ljava/lang/Runnable;

    .line 27
    .line 28
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->g:Ll/pf2;

    .line 32
    .line 33
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->g:Ll/pf2;

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/pf2;->p()V

    .line 42
    .line 43
    .line 44
    :cond_1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/ki3;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->n(Ll/ki3;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public final m(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ti3;->a(Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public n(Ll/ki3;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->m(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    const/high16 v0, 0x3f800000    # 1.0f

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Landroid/view/View;->setTranslationZ(F)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final p()Landroid/animation/AnimatorSet;
    .locals 6

    .line 1
    new-instance v0, Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->d:Landroid/animation/ObjectAnimator;

    .line 7
    .line 8
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->c:Landroid/animation/ValueAnimator;

    .line 9
    .line 10
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->e:Landroid/animation/ObjectAnimator;

    .line 11
    .line 12
    const/4 v4, 0x3

    .line 13
    new-array v4, v4, [Landroid/animation/Animator;

    .line 14
    .line 15
    const/4 v5, 0x0

    .line 16
    aput-object v1, v4, v5

    .line 17
    .line 18
    const/4 v1, 0x1

    .line 19
    aput-object v2, v4, v1

    .line 20
    .line 21
    const/4 v1, 0x2

    .line 22
    aput-object v3, v4, v1

    .line 23
    .line 24
    invoke-virtual {v0, v4}, Landroid/animation/AnimatorSet;->playSequentially([Landroid/animation/Animator;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->j:Landroid/animation/Animator$AnimatorListener;

    .line 28
    .line 29
    invoke-virtual {v0, p0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 30
    .line 31
    .line 32
    return-object v0
.end method

.method public s()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->f:Z

    .line 2
    .line 3
    return p0
.end method

.method public final synthetic u()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->g:Ll/pf2;

    .line 2
    .line 3
    invoke-static {p0}, Ll/li3;->f(Ll/pf2;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic v()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->g:Ll/pf2;

    .line 2
    .line 3
    invoke-static {p0}, Ll/li3;->b(Ll/pf2;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final w(Z)V
    .locals 1

    .line 1
    sget v0, Ll/mdc0;->x5:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget v0, Ll/mdc0;->x5:I

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0, p1}, Landroid/view/View;->setClickable(Z)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public x(Ll/pf2;Ll/x20;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->g:Ll/pf2;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->i:Ll/x20;

    .line 4
    .line 5
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->a:Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->h:Ll/si3;

    .line 8
    .line 9
    invoke-virtual {p1, p2, v0}, Ll/pf2;->r(Landroid/view/ViewGroup;Ll/si3;)V

    .line 10
    .line 11
    .line 12
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->a:Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;

    .line 13
    .line 14
    sget v0, Ll/mdc0;->x5:I

    .line 15
    .line 16
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    if-eqz p2, :cond_0

    .line 21
    .line 22
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->a:Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;

    .line 23
    .line 24
    sget v0, Ll/mdc0;->x5:I

    .line 25
    .line 26
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    new-instance v0, Ll/pi3;

    .line 31
    .line 32
    invoke-direct {v0, p1}, Ll/pi3;-><init>(Ll/pf2;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->y()V

    .line 39
    .line 40
    .line 41
    invoke-static {p1}, Ll/li3;->e(Ll/pf2;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public final y()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->d:Landroid/animation/ObjectAnimator;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->q()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->b:Landroid/animation/AnimatorSet;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->c:Landroid/animation/ValueAnimator;

    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->getDuration()J

    .line 15
    .line 16
    .line 17
    move-result-wide v0

    .line 18
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->g:Ll/pf2;

    .line 19
    .line 20
    invoke-virtual {v2}, Ll/pf2;->m()J

    .line 21
    .line 22
    .line 23
    move-result-wide v2

    .line 24
    cmp-long v0, v0, v2

    .line 25
    .line 26
    if-eqz v0, :cond_2

    .line 27
    .line 28
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->c:Landroid/animation/ValueAnimator;

    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->g:Ll/pf2;

    .line 31
    .line 32
    invoke-virtual {v1}, Ll/pf2;->m()J

    .line 33
    .line 34
    .line 35
    move-result-wide v1

    .line 36
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->p()Landroid/animation/AnimatorSet;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->b:Landroid/animation/AnimatorSet;

    .line 44
    .line 45
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->b:Landroid/animation/AnimatorSet;

    .line 46
    .line 47
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public final z(Z)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
