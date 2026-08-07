.class public Ll/hmt;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/ylt;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Lv/VRecyclerView;

.field public final b:Lv/VText;

.field public final c:Landroid/view/View;

.field public final d:Landroid/widget/LinearLayout;

.field public e:Ll/nlt;

.field public f:Ll/ylt;

.field public g:Z

.field public h:Landroid/animation/Animator;

.field public i:Landroid/animation/AnimatorSet;


# direct methods
.method public constructor <init>(Landroid/widget/LinearLayout;Lv/VRecyclerView;Lv/VText;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/hmt;->g:Z

    .line 6
    .line 7
    iput-object p1, p0, Ll/hmt;->d:Landroid/widget/LinearLayout;

    .line 8
    .line 9
    iput-object p2, p0, Ll/hmt;->a:Lv/VRecyclerView;

    .line 10
    .line 11
    iput-object p3, p0, Ll/hmt;->b:Lv/VText;

    .line 12
    .line 13
    iput-object p4, p0, Ll/hmt;->c:Landroid/view/View;

    .line 14
    .line 15
    new-instance p1, Ll/zlt;

    .line 16
    .line 17
    invoke-direct {p1, p0, p2, p3}, Ll/zlt;-><init>(Ll/hmt;Lv/VRecyclerView;Lv/VText;)V

    .line 18
    .line 19
    .line 20
    invoke-static {p3, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static synthetic a(Ll/hmt;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/hmt;->n()V

    return-void
.end method

.method public static synthetic b(Ll/hmt;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hmt;->s(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic c(Ll/hmt;Ll/olt;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hmt;->q(Ll/olt;)V

    return-void
.end method

.method public static synthetic d(Ll/hmt;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hmt;->m(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic e(Ll/hmt;Lv/VRecyclerView;Lv/VText;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/hmt;->p(Lv/VRecyclerView;Lv/VText;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f(Ll/hmt;Lv/VRecyclerView;Lv/VText;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/hmt;->u(Lv/VRecyclerView;Lv/VText;)V

    return-void
.end method

.method private k()V
    .locals 3

    .line 1
    invoke-static {}, Ll/gnt;->c()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/hmt;->f:Ll/ylt;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/klt;->act()Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    sget v1, Lcom/p1/mobile/putong/live/base/R$string;->e:I

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->D(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    sget v1, Lcom/p1/mobile/putong/live/base/R$string;->a:I

    .line 21
    .line 22
    new-instance v2, Ll/amt;

    .line 23
    .line 24
    invoke-direct {v2}, Ll/amt;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->l0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    sget v1, Lcom/p1/mobile/putong/live/base/R$string;->b:I

    .line 32
    .line 33
    new-instance v2, Ll/bmt;

    .line 34
    .line 35
    invoke-direct {v2, p0}, Ll/bmt;-><init>(Ll/hmt;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->t0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 43
    .line 44
    .line 45
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/hmt;->a:Lv/VRecyclerView;

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

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/hmt;->f:Ll/ylt;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/klt;->act()Lcom/p1/mobile/android/app/Act;

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
    iget-object v0, p0, Ll/hmt;->i:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->cancel()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Ll/hmt;->h:Landroid/animation/Animator;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/animation/Animator;->cancel()V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method public i(Ll/ylt;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/hmt;->f:Ll/ylt;

    .line 2
    .line 3
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/ylt;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/hmt;->i(Ll/ylt;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public j(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/olt;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/hmt;->d:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    sget-object v1, Ll/it0;->m:Landroid/util/Property;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    const/4 v3, 0x0

    .line 10
    filled-new-array {v2, v3}, [I

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-static {v0, v1, v2}, Ll/gt0;->o(Landroid/view/View;Landroid/util/Property;[I)Landroid/animation/Animator;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object v1, p0, Ll/hmt;->d:Landroid/widget/LinearLayout;

    .line 19
    .line 20
    const/4 v2, 0x2

    .line 21
    new-array v2, v2, [F

    .line 22
    .line 23
    fill-array-data v2, :array_0

    .line 24
    .line 25
    .line 26
    const-string v3, "alpha"

    .line 27
    .line 28
    invoke-static {v1, v3, v2}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    new-instance v2, Landroid/animation/AnimatorSet;

    .line 33
    .line 34
    invoke-direct {v2}, Landroid/animation/AnimatorSet;-><init>()V

    .line 35
    .line 36
    .line 37
    iput-object v2, p0, Ll/hmt;->i:Landroid/animation/AnimatorSet;

    .line 38
    .line 39
    invoke-virtual {v2, v0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Ll/hmt;->i:Landroid/animation/AnimatorSet;

    .line 47
    .line 48
    const-wide/16 v1, 0xfa

    .line 49
    .line 50
    invoke-virtual {v0, v1, v2}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 51
    .line 52
    .line 53
    new-instance v0, Ll/gmt;

    .line 54
    .line 55
    invoke-direct {v0, p0, p1}, Ll/gmt;-><init>(Ll/hmt;Ljava/util/List;)V

    .line 56
    .line 57
    .line 58
    iget-object p1, p0, Ll/hmt;->i:Landroid/animation/AnimatorSet;

    .line 59
    .line 60
    invoke-static {p1, v0, v0}, Ll/gt0;->g(Landroid/animation/Animator;Ljava/lang/Runnable;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 61
    .line 62
    .line 63
    iget-object p0, p0, Ll/hmt;->i:Landroid/animation/AnimatorSet;

    .line 64
    .line 65
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public l(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/olt;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/hmt;->g:Z

    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ll/hmt;->v(Ljava/util/List;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic m(Ljava/util/List;)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Ll/hmt;->v(Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/hmt;->d:Landroid/widget/LinearLayout;

    .line 5
    .line 6
    const/4 v0, -0x2

    .line 7
    invoke-static {p1, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Ll/hmt;->d:Landroid/widget/LinearLayout;

    .line 11
    .line 12
    const/high16 v0, 0x3f800000    # 1.0f

    .line 13
    .line 14
    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Ll/hmt;->a:Lv/VRecyclerView;

    .line 18
    .line 19
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->requestLayout()V

    .line 20
    .line 21
    .line 22
    const/4 p1, 0x0

    .line 23
    iput-object p1, p0, Ll/hmt;->i:Landroid/animation/AnimatorSet;

    .line 24
    .line 25
    return-void
.end method

.method public final synthetic n()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hmt;->f:Ll/ylt;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ylt;->Q2()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/gnt;->d()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic p(Lv/VRecyclerView;Lv/VText;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/hmt;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    invoke-virtual {p3}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 6
    .line 7
    .line 8
    iget-boolean p3, p0, Ll/hmt;->g:Z

    .line 9
    .line 10
    if-nez p3, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0, p1, p2}, Ll/hmt;->x(Lv/VRecyclerView;Lv/VText;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-direct {p0}, Ll/hmt;->k()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic q(Ll/olt;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hmt;->a:Lv/VRecyclerView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getItemAnimator()Landroidx/recyclerview/widget/RecyclerView$l;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$l;->isRunning()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-object p0, p0, Ll/hmt;->f:Ll/ylt;

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Ll/ylt;->U2(Ll/olt;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic s(Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hmt;->v(Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic u(Lv/VRecyclerView;Lv/VText;)V
    .locals 1

    .line 1
    const/4 v0, -0x2

    .line 2
    invoke-static {p1, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 3
    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    iput-object p1, p0, Ll/hmt;->h:Landroid/animation/Animator;

    .line 7
    .line 8
    sget p0, Lcom/p1/mobile/putong/live/base/R$string;->d:I

    .line 9
    .line 10
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setText(I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public v(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/olt;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, -0x1

    .line 2
    invoke-virtual {p0, p1, v0}, Ll/hmt;->w(Ljava/util/List;I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public w(Ljava/util/List;I)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/olt;",
            ">;I)V"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Ll/hmt;->a:Lv/VRecyclerView;

    .line 6
    .line 7
    xor-int/lit8 v2, v0, 0x1

    .line 8
    .line 9
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v1, p0, Ll/hmt;->c:Landroid/view/View;

    .line 13
    .line 14
    const/4 v2, 0x1

    .line 15
    xor-int/2addr v0, v2

    .line 16
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/hmt;->a:Lv/VRecyclerView;

    .line 20
    .line 21
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    const/4 v1, 0x2

    .line 29
    const/4 v3, 0x0

    .line 30
    if-le v0, v1, :cond_0

    .line 31
    .line 32
    move v0, v2

    .line 33
    goto :goto_0

    .line 34
    :cond_0
    move v0, v3

    .line 35
    :goto_0
    iget-object v1, p0, Ll/hmt;->b:Lv/VText;

    .line 36
    .line 37
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 38
    .line 39
    .line 40
    iget-object v1, p0, Ll/hmt;->c:Landroid/view/View;

    .line 41
    .line 42
    invoke-static {v1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-eqz v1, :cond_2

    .line 47
    .line 48
    iget-object v1, p0, Ll/hmt;->c:Landroid/view/View;

    .line 49
    .line 50
    if-eqz v0, :cond_1

    .line 51
    .line 52
    sget v4, Ll/qa00;->c:I

    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_1
    sget v4, Ll/qa00;->m:I

    .line 56
    .line 57
    :goto_1
    invoke-static {v1, v4}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 58
    .line 59
    .line 60
    :cond_2
    iget-object v1, p0, Ll/hmt;->b:Lv/VText;

    .line 61
    .line 62
    iget-boolean v4, p0, Ll/hmt;->g:Z

    .line 63
    .line 64
    if-eqz v4, :cond_3

    .line 65
    .line 66
    sget v4, Lcom/p1/mobile/putong/live/base/R$string;->d:I

    .line 67
    .line 68
    goto :goto_2

    .line 69
    :cond_3
    sget v4, Lcom/p1/mobile/putong/live/base/R$string;->c:I

    .line 70
    .line 71
    :goto_2
    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(I)V

    .line 72
    .line 73
    .line 74
    iget-boolean v1, p0, Ll/hmt;->g:Z

    .line 75
    .line 76
    if-nez v1, :cond_4

    .line 77
    .line 78
    if-eqz v0, :cond_4

    .line 79
    .line 80
    new-instance v0, Ljava/util/ArrayList;

    .line 81
    .line 82
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 83
    .line 84
    .line 85
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    check-cast v1, Ll/olt;

    .line 90
    .line 91
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    check-cast v1, Ll/olt;

    .line 99
    .line 100
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    goto :goto_3

    .line 104
    :cond_4
    move-object v0, p1

    .line 105
    :goto_3
    iget-object v1, p0, Ll/hmt;->e:Ll/nlt;

    .line 106
    .line 107
    if-nez v1, :cond_5

    .line 108
    .line 109
    new-instance p1, Ll/nlt;

    .line 110
    .line 111
    iget-object p2, p0, Ll/hmt;->f:Ll/ylt;

    .line 112
    .line 113
    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    new-instance v1, Ll/cmt;

    .line 117
    .line 118
    invoke-direct {v1, p2}, Ll/cmt;-><init>(Ll/ylt;)V

    .line 119
    .line 120
    .line 121
    iget-object p2, p0, Ll/hmt;->f:Ll/ylt;

    .line 122
    .line 123
    invoke-virtual {p2}, Ll/klt;->E2()Ll/imt;

    .line 124
    .line 125
    .line 126
    move-result-object p2

    .line 127
    iget-object p2, p2, Ll/imt;->b:Lcom/p1/mobile/putong/live/external/square/search/LiveSearchAct;

    .line 128
    .line 129
    invoke-direct {p1, v0, v1, p2}, Ll/nlt;-><init>(Ljava/util/List;Ll/y20;Lcom/p1/mobile/putong/live/external/square/search/LiveSearchAct;)V

    .line 130
    .line 131
    .line 132
    iput-object p1, p0, Ll/hmt;->e:Ll/nlt;

    .line 133
    .line 134
    new-instance p2, Ll/dmt;

    .line 135
    .line 136
    invoke-direct {p2, p0}, Ll/dmt;-><init>(Ll/hmt;)V

    .line 137
    .line 138
    .line 139
    invoke-virtual {p1, p2}, Ll/nlt;->K(Ll/y20;)V

    .line 140
    .line 141
    .line 142
    iget-object p1, p0, Ll/hmt;->a:Lv/VRecyclerView;

    .line 143
    .line 144
    iget-object p0, p0, Ll/hmt;->e:Ll/nlt;

    .line 145
    .line 146
    invoke-virtual {p1, p0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 147
    .line 148
    .line 149
    return-void

    .line 150
    :cond_5
    iget-boolean v1, p0, Ll/hmt;->g:Z

    .line 151
    .line 152
    if-eqz v1, :cond_6

    .line 153
    .line 154
    if-ltz p2, :cond_6

    .line 155
    .line 156
    iget-object v1, p0, Ll/hmt;->a:Lv/VRecyclerView;

    .line 157
    .line 158
    invoke-virtual {v1}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 159
    .line 160
    .line 161
    move-result-object v1

    .line 162
    invoke-virtual {v1}, Landroidx/recyclerview/widget/RecyclerView$o;->getChildCount()I

    .line 163
    .line 164
    .line 165
    move-result v1

    .line 166
    if-ge p2, v1, :cond_6

    .line 167
    .line 168
    iget-object v0, p0, Ll/hmt;->a:Lv/VRecyclerView;

    .line 169
    .line 170
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 171
    .line 172
    .line 173
    move-result-object v0

    .line 174
    invoke-virtual {v0, p2}, Landroidx/recyclerview/widget/RecyclerView$o;->getChildAt(I)Landroid/view/View;

    .line 175
    .line 176
    .line 177
    move-result-object p2

    .line 178
    check-cast p2, Lcom/p1/mobile/putong/live/external/square/search/history/LiveSearchHistoryItemView;

    .line 179
    .line 180
    new-instance v0, Ll/emt;

    .line 181
    .line 182
    invoke-direct {v0, p0, p1}, Ll/emt;-><init>(Ll/hmt;Ljava/util/List;)V

    .line 183
    .line 184
    .line 185
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/live/external/square/search/history/LiveSearchHistoryItemView;->d(Ll/x20;)V

    .line 186
    .line 187
    .line 188
    return-void

    .line 189
    :cond_6
    iget-object p0, p0, Ll/hmt;->e:Ll/nlt;

    .line 190
    .line 191
    invoke-virtual {p0, v0}, Ll/nlt;->L(Ljava/util/List;)V

    .line 192
    .line 193
    .line 194
    return-void
.end method

.method public final x(Lv/VRecyclerView;Lv/VText;)V
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/hmt;->g:Z

    .line 3
    .line 4
    iget-object v0, p0, Ll/hmt;->f:Ll/ylt;

    .line 5
    .line 6
    iget-object v0, v0, Ll/ylt;->g:Ljava/util/List;

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/hmt;->v(Ljava/util/List;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    const/4 v3, -0x1

    .line 20
    iput v3, v2, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 21
    .line 22
    iput v1, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 23
    .line 24
    invoke-virtual {p1, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 25
    .line 26
    .line 27
    div-int/lit8 v2, v1, 0x2

    .line 28
    .line 29
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    mul-int/2addr v2, v3

    .line 34
    sget-object v3, Ll/it0;->m:Landroid/util/Property;

    .line 35
    .line 36
    filled-new-array {v1, v2}, [I

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-static {p1, v3, v1}, Ll/gt0;->o(Landroid/view/View;Landroid/util/Property;[I)Landroid/animation/Animator;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    iput-object v1, p0, Ll/hmt;->h:Landroid/animation/Animator;

    .line 45
    .line 46
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    add-int/lit8 v0, v0, -0x2

    .line 51
    .line 52
    mul-int/lit8 v0, v0, 0x1e

    .line 53
    .line 54
    int-to-long v2, v0

    .line 55
    invoke-virtual {v1, v2, v3}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Ll/hmt;->h:Landroid/animation/Animator;

    .line 59
    .line 60
    new-instance v1, Ll/fmt;

    .line 61
    .line 62
    invoke-direct {v1, p0, p1, p2}, Ll/fmt;-><init>(Ll/hmt;Lv/VRecyclerView;Lv/VText;)V

    .line 63
    .line 64
    .line 65
    invoke-static {v0, v1}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 66
    .line 67
    .line 68
    iget-object p0, p0, Ll/hmt;->h:Landroid/animation/Animator;

    .line 69
    .line 70
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 71
    .line 72
    .line 73
    return-void
.end method
