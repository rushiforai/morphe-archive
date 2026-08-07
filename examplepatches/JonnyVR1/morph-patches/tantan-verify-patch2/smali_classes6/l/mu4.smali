.class public Ll/mu4;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/mu4$b;
    }
.end annotation


# instance fields
.field public a:Lv/VLinear;

.field public b:Landroid/widget/ImageView;

.field public c:Landroid/widget/TextView;

.field public d:Landroidx/recyclerview/widget/RecyclerView;

.field public e:Landroid/view/View;

.field public f:Lcom/p1/mobile/android/app/Act;

.field public g:Landroid/widget/FrameLayout;

.field public h:Ll/mu4$b;

.field public i:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public j:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public k:Ll/h80;

.field public l:I


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Landroid/widget/FrameLayout;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/mu4;->j:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ll/mu4$a;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/mu4$a;-><init>(Ll/mu4;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/mu4;->k:Ll/h80;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput v0, p0, Ll/mu4;->l:I

    .line 20
    .line 21
    iput-object p1, p0, Ll/mu4;->f:Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    iput-object p2, p0, Ll/mu4;->g:Landroid/widget/FrameLayout;

    .line 24
    .line 25
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p0, p1, p2}, Ll/mu4;->f(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p2, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 34
    .line 35
    .line 36
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 37
    .line 38
    const-string p2, "-10015"

    .line 39
    .line 40
    invoke-virtual {p1, p2}, Ll/jka;->R7(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/data/NotifyUsers;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result p2

    .line 48
    if-eqz p2, :cond_1

    .line 49
    .line 50
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/NotifyUsers;->guides:Ljava/util/List;

    .line 51
    .line 52
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 57
    .line 58
    .line 59
    move-result p2

    .line 60
    if-eqz p2, :cond_1

    .line 61
    .line 62
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object p2

    .line 66
    check-cast p2, Lcom/p1/mobile/putong/feed/data/AtChatGuides;

    .line 67
    .line 68
    iget-object v0, p2, Lcom/p1/mobile/putong/feed/data/AtChatGuides;->title:Ljava/lang/String;

    .line 69
    .line 70
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    if-nez v0, :cond_0

    .line 75
    .line 76
    iget-object v0, p0, Ll/mu4;->j:Ljava/util/List;

    .line 77
    .line 78
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/data/AtChatGuides;->title:Ljava/lang/String;

    .line 79
    .line 80
    invoke-interface {v0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_1
    invoke-virtual {p0}, Ll/mu4;->i()V

    .line 85
    .line 86
    .line 87
    return-void
.end method

.method public static synthetic a(Ll/mu4;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mu4;->m(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic b(Ll/mu4;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mu4;->l(Z)V

    return-void
.end method

.method public static synthetic c(Ll/mu4;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/mu4;->k()V

    return-void
.end method

.method public static synthetic d(Ll/mu4;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mu4;->n(I)V

    return-void
.end method

.method public static bridge synthetic e(Ll/mu4;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mu4;->o(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public f(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/ou4;->b(Ll/mu4;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public g()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/mu4;->g:Landroid/widget/FrameLayout;

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
    iget-object v0, p0, Ll/mu4;->g:Landroid/widget/FrameLayout;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/mu4;->h:Ll/mu4$b;

    .line 17
    .line 18
    new-instance v2, Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v2}, Ll/mu4$b;->I(Ljava/util/List;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/mu4;->e:Landroid/view/View;

    .line 27
    .line 28
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-lez v0, :cond_1

    .line 33
    .line 34
    iget-object v0, p0, Ll/mu4;->e:Landroid/view/View;

    .line 35
    .line 36
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    neg-int v0, v0

    .line 41
    const/16 v2, 0xc8

    .line 42
    .line 43
    const/4 v3, 0x1

    .line 44
    invoke-virtual {p0, v0, v1, v2, v3}, Ll/mu4;->s(IIIZ)V

    .line 45
    .line 46
    .line 47
    :cond_1
    :goto_0
    return-void
.end method

.method public h()V
    .locals 3

    .line 1
    iget v0, p0, Ll/mu4;->l:I

    .line 2
    .line 3
    if-lez v0, :cond_0

    .line 4
    .line 5
    const/high16 v1, 0x43390000    # 185.0f

    .line 6
    .line 7
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    add-int/2addr v0, v2

    .line 12
    const/4 v2, 0x0

    .line 13
    iput v2, p0, Ll/mu4;->l:I

    .line 14
    .line 15
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    const/16 v2, 0x12c

    .line 20
    .line 21
    invoke-virtual {p0, v0, v1, v2}, Ll/mu4;->t(III)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public final i()V
    .locals 4

    .line 1
    new-instance v0, Ll/mu4$b;

    .line 2
    .line 3
    iget-object v1, p0, Ll/mu4;->f:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    iget-object v2, p0, Ll/mu4;->k:Ll/h80;

    .line 6
    .line 7
    invoke-direct {v0, p0, v1, v2}, Ll/mu4$b;-><init>(Ll/mu4;Lcom/p1/mobile/android/app/Act;Ll/h80;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/mu4;->h:Ll/mu4$b;

    .line 11
    .line 12
    iget-object v1, p0, Ll/mu4;->j:Ljava/util/List;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ll/mu4$b;->I(Ljava/util/List;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/mu4;->d:Landroidx/recyclerview/widget/RecyclerView;

    .line 18
    .line 19
    iget-object v1, p0, Ll/mu4;->h:Ll/mu4$b;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/mu4;->d:Landroidx/recyclerview/widget/RecyclerView;

    .line 25
    .line 26
    new-instance v1, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 27
    .line 28
    iget-object v2, p0, Ll/mu4;->f:Lcom/p1/mobile/android/app/Act;

    .line 29
    .line 30
    const/4 v3, 0x0

    .line 31
    invoke-direct {v1, v2, v3, v3}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Ll/mu4;->d:Landroidx/recyclerview/widget/RecyclerView;

    .line 38
    .line 39
    invoke-virtual {p0}, Landroid/view/View;->clearAnimation()V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public j()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mu4;->g:Landroid/widget/FrameLayout;

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

.method public final synthetic k()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mu4;->k:Ll/h80;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/h80;->o()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic l(Z)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p1, p0, Ll/mu4;->g:Landroid/widget/FrameLayout;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    :cond_0
    iget-object p1, p0, Ll/mu4;->a:Lv/VLinear;

    .line 10
    .line 11
    new-instance v0, Ll/lu4;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/lu4;-><init>(Ll/mu4;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Ll/mu4;->a:Lv/VLinear;

    .line 20
    .line 21
    const/4 p1, 0x0

    .line 22
    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationY(F)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final synthetic m(Landroid/animation/ValueAnimator;)V
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
    iget-object p0, p0, Ll/mu4;->e:Landroid/view/View;

    .line 12
    .line 13
    invoke-static {p0, p1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic n(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mu4;->e:Landroid/view/View;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final o(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mu4;->i:Ll/y20;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public p(Ll/y20;)V
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
    iput-object p1, p0, Ll/mu4;->i:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public q()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/mu4;->g:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ll/mu4;->j:Ljava/util/List;

    .line 10
    .line 11
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-object v0, p0, Ll/mu4;->h:Ll/mu4$b;

    .line 19
    .line 20
    iget-object v1, p0, Ll/mu4;->j:Ljava/util/List;

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ll/mu4$b;->I(Ljava/util/List;)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Ll/mu4;->g:Landroid/widget/FrameLayout;

    .line 26
    .line 27
    const/4 v1, 0x1

    .line 28
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ll/mu4;->e:Landroid/view/View;

    .line 32
    .line 33
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-lez v0, :cond_1

    .line 38
    .line 39
    iget-object v0, p0, Ll/mu4;->e:Landroid/view/View;

    .line 40
    .line 41
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    const/16 v1, 0xc8

    .line 46
    .line 47
    const/4 v2, 0x0

    .line 48
    invoke-virtual {p0, v0, v2, v1, v2}, Ll/mu4;->s(IIIZ)V

    .line 49
    .line 50
    .line 51
    :cond_1
    :goto_0
    return-void
.end method

.method public r(I)V
    .locals 2

    .line 1
    iget v0, p0, Ll/mu4;->l:I

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iput p1, p0, Ll/mu4;->l:I

    .line 7
    .line 8
    const/high16 v0, 0x43390000    # 185.0f

    .line 9
    .line 10
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    add-int/2addr v1, p1

    .line 15
    if-lez p1, :cond_1

    .line 16
    .line 17
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    const/16 v0, 0xc8

    .line 22
    .line 23
    invoke-virtual {p0, p1, v1, v0}, Ll/mu4;->t(III)V

    .line 24
    .line 25
    .line 26
    :cond_1
    :goto_0
    return-void
.end method

.method public final s(IIIZ)V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/mu4;->a:Lv/VLinear;

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
    new-instance p2, Ll/iu4;

    .line 29
    .line 30
    invoke-direct {p2, p0, p4}, Ll/iu4;-><init>(Ll/mu4;Z)V

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

.method public final t(III)V
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
    new-instance v0, Ll/ju4;

    .line 25
    .line 26
    invoke-direct {v0, p0}, Ll/ju4;-><init>(Ll/mu4;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p3, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 30
    .line 31
    .line 32
    new-instance p3, Ll/ku4;

    .line 33
    .line 34
    invoke-direct {p3, p0, p2}, Ll/ku4;-><init>(Ll/mu4;I)V

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
