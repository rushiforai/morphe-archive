.class public Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/Runnable;

.field public b:Landroid/animation/AnimatorSet;

.field public c:Landroid/animation/Animator$AnimatorListener;

.field public d:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public e:Landroid/view/View;

.field public f:Landroid/view/View;

.field public g:Z

.field public h:I

.field public i:Z

.field public j:Ll/z20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/z20<",
            "Landroid/view/View;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


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
    new-instance p1, Ll/pj1;

    .line 5
    .line 6
    invoke-direct {p1, p0}, Ll/pj1;-><init>(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;->a:Ljava/lang/Runnable;

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;->i:Z

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;->k()V

    .line 15
    .line 16
    .line 17
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

    .line 18
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 19
    new-instance p1, Ll/pj1;

    invoke-direct {p1, p0}, Ll/pj1;-><init>(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;->a:Ljava/lang/Runnable;

    const/4 p1, 0x0

    .line 20
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;->i:Z

    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;->k()V

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

    .line 22
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 23
    new-instance p1, Ll/pj1;

    invoke-direct {p1, p0}, Ll/pj1;-><init>(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;->a:Ljava/lang/Runnable;

    const/4 p1, 0x0

    .line 24
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;->i:Z

    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;->k()V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;->n()V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;)Ljava/lang/Runnable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;->a:Ljava/lang/Runnable;

    return-object p0
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;->f:Landroid/view/View;

    return-object p0
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;->h:I

    return p0
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;->e:Landroid/view/View;

    return-object p0
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;->f:Landroid/view/View;

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;->h:I

    return-void
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;->e:Landroid/view/View;

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;->l()V

    return-void
.end method


# virtual methods
.method public j()Landroid/animation/AnimatorSet;
    .locals 11

    .line 1
    new-instance v0, Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;->e:Landroid/view/View;

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    neg-int v2, v2

    .line 13
    int-to-float v2, v2

    .line 14
    const/4 v3, 0x2

    .line 15
    new-array v4, v3, [F

    .line 16
    .line 17
    const/4 v5, 0x0

    .line 18
    const/4 v6, 0x0

    .line 19
    aput v6, v4, v5

    .line 20
    .line 21
    const/4 v7, 0x1

    .line 22
    aput v2, v4, v7

    .line 23
    .line 24
    const-string v2, "translationY"

    .line 25
    .line 26
    invoke-static {v1, v2, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    const-wide/16 v8, 0x190

    .line 31
    .line 32
    invoke-virtual {v1, v8, v9}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 33
    .line 34
    .line 35
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;->f:Landroid/view/View;

    .line 36
    .line 37
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    int-to-float p0, p0

    .line 42
    new-array v10, v3, [F

    .line 43
    .line 44
    aput p0, v10, v5

    .line 45
    .line 46
    aput v6, v10, v7

    .line 47
    .line 48
    invoke-static {v4, v2, v10}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {p0, v8, v9}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 53
    .line 54
    .line 55
    const-wide/16 v8, 0x12c

    .line 56
    .line 57
    invoke-virtual {p0, v8, v9}, Landroid/animation/Animator;->setStartDelay(J)V

    .line 58
    .line 59
    .line 60
    new-array v2, v3, [Landroid/animation/Animator;

    .line 61
    .line 62
    aput-object p0, v2, v5

    .line 63
    .line 64
    aput-object v1, v2, v7

    .line 65
    .line 66
    invoke-virtual {v0, v2}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 67
    .line 68
    .line 69
    return-object v0
.end method

.method public final k()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView$a;-><init>(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;->c:Landroid/animation/Animator$AnimatorListener;

    .line 7
    .line 8
    return-void
.end method

.method public final l()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;->d:Ll/y20;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;->h:I

    .line 6
    .line 7
    add-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {v0, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public m(Ll/z20;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/z20<",
            "Landroid/view/View;",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;->g:Z

    .line 3
    .line 4
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;->h:I

    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;->a:Ljava/lang/Runnable;

    .line 7
    .line 8
    invoke-static {v1}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;->j:Ll/z20;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    const/4 v2, 0x1

    .line 18
    if-le v1, v2, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;->e:Landroid/view/View;

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;->f:Landroid/view/View;

    .line 31
    .line 32
    invoke-static {v1, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;->e:Landroid/view/View;

    .line 36
    .line 37
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;->h:I

    .line 38
    .line 39
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-interface {p1, v0, v1}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;->f:Landroid/view/View;

    .line 47
    .line 48
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;->h:I

    .line 49
    .line 50
    add-int/2addr v1, v2

    .line 51
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-interface {p1, v0, v1}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;->a:Ljava/lang/Runnable;

    .line 63
    .line 64
    const-wide/16 v0, 0x190

    .line 65
    .line 66
    invoke-static {p1, p0, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 67
    .line 68
    .line 69
    :cond_0
    return-void
.end method

.method public final n()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;->a:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;->b:Landroid/animation/AnimatorSet;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;->b:Landroid/animation/AnimatorSet;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->isRunning()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    const/4 v1, 0x1

    .line 28
    if-gt v0, v1, :cond_1

    .line 29
    .line 30
    :goto_0
    return-void

    .line 31
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;->j:Ll/z20;

    .line 32
    .line 33
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;->e:Landroid/view/View;

    .line 34
    .line 35
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;->h:I

    .line 36
    .line 37
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    invoke-interface {v0, v2, v3}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;->j:Ll/z20;

    .line 45
    .line 46
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;->f:Landroid/view/View;

    .line 47
    .line 48
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;->h:I

    .line 49
    .line 50
    add-int/2addr v3, v1

    .line 51
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-interface {v0, v2, v1}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;->f:Landroid/view/View;

    .line 59
    .line 60
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    int-to-float v1, v1

    .line 65
    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;->f:Landroid/view/View;

    .line 69
    .line 70
    const/4 v1, 0x0

    .line 71
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;->j()Landroid/animation/AnimatorSet;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;->b:Landroid/animation/AnimatorSet;

    .line 79
    .line 80
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;->c:Landroid/animation/Animator$AnimatorListener;

    .line 81
    .line 82
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 83
    .line 84
    .line 85
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;->b:Landroid/animation/AnimatorSet;

    .line 86
    .line 87
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method public onAttachedToWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;->i:Z

    .line 6
    .line 7
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;->i:Z

    .line 6
    .line 7
    return-void
.end method
