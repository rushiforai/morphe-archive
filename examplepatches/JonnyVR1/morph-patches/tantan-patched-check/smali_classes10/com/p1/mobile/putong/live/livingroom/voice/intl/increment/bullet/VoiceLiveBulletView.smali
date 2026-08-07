.class public Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/FrameLayout;",
        "Ll/iam<",
        "Ll/yun0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;

.field public b:Landroid/animation/AnimatorSet;

.field public c:Landroid/animation/ValueAnimator;

.field public d:Landroid/animation/ObjectAnimator;

.field public e:Landroid/animation/ObjectAnimator;

.field public f:Z

.field public g:Ll/iun0;

.field public h:Ll/evn0;

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
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;->f:Z

    .line 6
    .line 7
    new-instance p1, Ll/evn0;

    .line 8
    .line 9
    invoke-direct {p1}, Ll/evn0;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;->h:Ll/evn0;

    .line 13
    .line 14
    new-instance p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView$a;

    .line 15
    .line 16
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;)V

    .line 17
    .line 18
    .line 19
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;->j:Landroid/animation/Animator$AnimatorListener;

    .line 20
    .line 21
    new-instance p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView$b;

    .line 22
    .line 23
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView$b;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;)V

    .line 24
    .line 25
    .line 26
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;->k:Ljava/lang/Runnable;

    .line 27
    .line 28
    new-instance p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView$c;

    .line 29
    .line 30
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView$c;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;)V

    .line 31
    .line 32
    .line 33
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;->l:Ljava/lang/Runnable;

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
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;->f:Z

    .line 38
    new-instance p1, Ll/evn0;

    invoke-direct {p1}, Ll/evn0;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;->h:Ll/evn0;

    .line 39
    new-instance p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView$a;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;->j:Landroid/animation/Animator$AnimatorListener;

    .line 40
    new-instance p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView$b;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView$b;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;->k:Ljava/lang/Runnable;

    .line 41
    new-instance p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView$c;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView$c;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;->l:Ljava/lang/Runnable;

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
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;->f:Z

    .line 44
    new-instance p1, Ll/evn0;

    invoke-direct {p1}, Ll/evn0;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;->h:Ll/evn0;

    .line 45
    new-instance p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView$a;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;->j:Landroid/animation/Animator$AnimatorListener;

    .line 46
    new-instance p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView$b;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView$b;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;->k:Ljava/lang/Runnable;

    .line 47
    new-instance p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView$c;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView$c;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;->l:Ljava/lang/Runnable;

    return-void
.end method

.method public static synthetic a(Ll/iun0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/iun0;->j()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Ll/iun0;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/zun0;->b(Ll/iun0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Ll/iun0;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/zun0;->e(Ll/iun0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;)Ll/iun0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;->g:Ll/iun0;

    return-object p0
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;)Ljava/lang/Runnable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;->l:Ljava/lang/Runnable;

    return-object p0
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;)Ljava/lang/Runnable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;->k:Ljava/lang/Runnable;

    return-object p0
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;)Ll/x20;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;->i:Ll/x20;

    return-object p0
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;->f:Z

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;->u(Z)V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;->x(Z)V

    return-void
.end method

.method private p()Landroid/animation/AnimatorSet;
    .locals 6

    .line 1
    new-instance v0, Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;->d:Landroid/animation/ObjectAnimator;

    .line 7
    .line 8
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;->c:Landroid/animation/ValueAnimator;

    .line 9
    .line 10
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;->e:Landroid/animation/ObjectAnimator;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;->j:Landroid/animation/Animator$AnimatorListener;

    .line 28
    .line 29
    invoke-virtual {v0, p0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 30
    .line 31
    .line 32
    return-object v0
.end method

.method private u(Z)V
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

.method private w()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;->d:Landroid/animation/ObjectAnimator;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;->g:Ll/iun0;

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;->q(Ll/iun0;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;->b:Landroid/animation/AnimatorSet;

    .line 11
    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;->c:Landroid/animation/ValueAnimator;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->getDuration()J

    .line 17
    .line 18
    .line 19
    move-result-wide v0

    .line 20
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;->g:Ll/iun0;

    .line 21
    .line 22
    invoke-virtual {v2}, Ll/iun0;->h()J

    .line 23
    .line 24
    .line 25
    move-result-wide v2

    .line 26
    cmp-long v0, v0, v2

    .line 27
    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;->c:Landroid/animation/ValueAnimator;

    .line 31
    .line 32
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;->g:Ll/iun0;

    .line 33
    .line 34
    invoke-virtual {v1}, Ll/iun0;->h()J

    .line 35
    .line 36
    .line 37
    move-result-wide v1

    .line 38
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 39
    .line 40
    .line 41
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;->p()Landroid/animation/AnimatorSet;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;->b:Landroid/animation/AnimatorSet;

    .line 46
    .line 47
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;->b:Landroid/animation/AnimatorSet;

    .line 48
    .line 49
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method private x(Z)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;->a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;->c:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    invoke-static {v0}, Ll/it0;->A(Landroid/animation/Animator;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;->b:Landroid/animation/AnimatorSet;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->end()V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;->b:Landroid/animation/AnimatorSet;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/animation/Animator;->removeAllListeners()V

    .line 16
    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;->b:Landroid/animation/AnimatorSet;

    .line 20
    .line 21
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;->k:Ljava/lang/Runnable;

    .line 22
    .line 23
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;->l:Ljava/lang/Runnable;

    .line 27
    .line 28
    invoke-static {p0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/yun0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;->n(Ll/yun0;)V

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
    invoke-static {p0, p1}, Ll/fvn0;->a(Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public n(Ll/yun0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;->m(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final q(Ll/iun0;)V
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
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;->d:Landroid/animation/ObjectAnimator;

    .line 23
    .line 24
    const-wide/16 v6, 0x1f4

    .line 25
    .line 26
    invoke-virtual {v2, v6, v7}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 27
    .line 28
    .line 29
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;->d:Landroid/animation/ObjectAnimator;

    .line 30
    .line 31
    new-instance v8, Ll/cvn0;

    .line 32
    .line 33
    invoke-direct {v8, p1}, Ll/cvn0;-><init>(Ll/iun0;)V

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
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;->e:Landroid/animation/ObjectAnimator;

    .line 56
    .line 57
    invoke-virtual {v0, v6, v7}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;->e:Landroid/animation/ObjectAnimator;

    .line 61
    .line 62
    new-instance v1, Ll/dvn0;

    .line 63
    .line 64
    invoke-direct {v1, p1}, Ll/dvn0;-><init>(Ll/iun0;)V

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
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;->c:Landroid/animation/ValueAnimator;

    .line 79
    .line 80
    invoke-virtual {p1}, Ll/iun0;->h()J

    .line 81
    .line 82
    .line 83
    move-result-wide v1

    .line 84
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;->c:Landroid/animation/ValueAnimator;

    .line 88
    .line 89
    new-instance v1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView$d;

    .line 90
    .line 91
    invoke-direct {v1, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView$d;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;Ll/iun0;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 95
    .line 96
    .line 97
    return-void
.end method

.method public s()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;->f:Z

    .line 2
    .line 3
    return p0
.end method

.method public v(Ll/iun0;Ll/x20;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;->g:Ll/iun0;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;->i:Ll/x20;

    .line 4
    .line 5
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;->a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;->h:Ll/evn0;

    .line 8
    .line 9
    invoke-virtual {p1, p2, v0}, Ll/iun0;->k(Landroid/view/ViewGroup;Ll/evn0;)V

    .line 10
    .line 11
    .line 12
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;->a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;

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
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;->a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;

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
    new-instance v0, Ll/bvn0;

    .line 31
    .line 32
    invoke-direct {v0, p1}, Ll/bvn0;-><init>(Ll/iun0;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;->w()V

    .line 39
    .line 40
    .line 41
    invoke-static {p1}, Ll/zun0;->d(Ll/iun0;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method
