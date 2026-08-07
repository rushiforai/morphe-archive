.class public Ll/wai;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/mai;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public b:Lcom/p1/mobile/putong/feed/newui/videoflow/util/FeedVideoFlowRecycleView;

.field public c:Landroid/widget/RelativeLayout;

.field public d:Lv/VText;

.field public e:Ll/mai;

.field public f:Ll/gai;

.field public g:Lcom/p1/mobile/putong/feed/newui/videoflow/util/FeedPagerSnapLinearLayoutManger;

.field public h:Z

.field public i:Z

.field public j:Z

.field public k:Ll/wyd0;


# direct methods
.method public constructor <init>(Ll/ner;ZZ)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/wyd0;

    .line 5
    .line 6
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v1, "FEED_VIDEO_FLOW_SHOW_COVER"

    .line 9
    .line 10
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const-string v1, ""

    .line 29
    .line 30
    invoke-direct {p1, v0, v1}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    iput-object p1, p0, Ll/wai;->k:Ll/wyd0;

    .line 34
    .line 35
    iput-boolean p2, p0, Ll/wai;->i:Z

    .line 36
    .line 37
    iput-boolean p3, p0, Ll/wai;->j:Z

    .line 38
    .line 39
    return-void
.end method

.method public static synthetic a(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public static synthetic b(Ll/wai;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/wai;->p()V

    return-void
.end method

.method public static synthetic c(Ll/wai;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wai;->s(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic d(Ll/wai;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wai;->q(Ljava/lang/Integer;)V

    return-void
.end method

.method private m()V
    .locals 9

    .line 1
    invoke-virtual {p0}, Ll/wai;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "isHideComment"

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 13
    .line 14
    .line 15
    move-result v6

    .line 16
    new-instance v3, Ll/gai;

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/wai;->act()Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    .line 21
    move-result-object v4

    .line 22
    iget-object v0, p0, Ll/wai;->e:Ll/mai;

    .line 23
    .line 24
    iget-object v5, v0, Ll/mai;->g:Ljava/lang/String;

    .line 25
    .line 26
    iget-boolean v7, p0, Ll/wai;->i:Z

    .line 27
    .line 28
    iget-boolean v8, p0, Ll/wai;->j:Z

    .line 29
    .line 30
    invoke-direct/range {v3 .. v8}, Ll/gai;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;ZZZ)V

    .line 31
    .line 32
    .line 33
    iput-object v3, p0, Ll/wai;->f:Ll/gai;

    .line 34
    .line 35
    new-instance v0, Ll/tai;

    .line 36
    .line 37
    invoke-direct {v0, p0}, Ll/tai;-><init>(Ll/wai;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v3, v0}, Ll/gai;->V(Ll/x20;)V

    .line 41
    .line 42
    .line 43
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/videoflow/util/FeedPagerSnapLinearLayoutManger;

    .line 44
    .line 45
    iget-object v1, p0, Ll/wai;->e:Ll/mai;

    .line 46
    .line 47
    iget-object v1, v1, Ll/mai;->a:Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct;

    .line 48
    .line 49
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/feed/newui/videoflow/util/FeedPagerSnapLinearLayoutManger;-><init>(Landroid/content/Context;)V

    .line 50
    .line 51
    .line 52
    iput-object v0, p0, Ll/wai;->g:Lcom/p1/mobile/putong/feed/newui/videoflow/util/FeedPagerSnapLinearLayoutManger;

    .line 53
    .line 54
    const/4 v1, 0x1

    .line 55
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;->setOrientation(I)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Ll/wai;->g:Lcom/p1/mobile/putong/feed/newui/videoflow/util/FeedPagerSnapLinearLayoutManger;

    .line 59
    .line 60
    new-instance v1, Ll/uai;

    .line 61
    .line 62
    invoke-direct {v1, p0}, Ll/uai;-><init>(Ll/wai;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/videoflow/util/FeedPagerSnapLinearLayoutManger;->h(Ll/y20;)V

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Ll/wai;->b:Lcom/p1/mobile/putong/feed/newui/videoflow/util/FeedVideoFlowRecycleView;

    .line 69
    .line 70
    iget-object v1, p0, Ll/wai;->g:Lcom/p1/mobile/putong/feed/newui/videoflow/util/FeedPagerSnapLinearLayoutManger;

    .line 71
    .line 72
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Ll/wai;->b:Lcom/p1/mobile/putong/feed/newui/videoflow/util/FeedVideoFlowRecycleView;

    .line 76
    .line 77
    iget-object p0, p0, Ll/wai;->f:Ll/gai;

    .line 78
    .line 79
    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method private x()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wai;->e:Ll/mai;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/mai;->p0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private y()V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/wai;->c:Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    new-array v2, v1, [F

    .line 5
    .line 6
    fill-array-data v2, :array_0

    .line 7
    .line 8
    .line 9
    const-string v3, "alpha"

    .line 10
    .line 11
    invoke-static {v0, v3, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-wide/16 v4, 0x3e8

    .line 16
    .line 17
    invoke-virtual {v0, v4, v5}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 18
    .line 19
    .line 20
    const/high16 v2, 0x435c0000    # 220.0f

    .line 21
    .line 22
    invoke-static {v2}, Ll/bnl0;->w(F)I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    const/4 v6, 0x0

    .line 27
    filled-new-array {v6, v2, v6}, [I

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-static {v2}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    new-instance v7, Ll/vai;

    .line 36
    .line 37
    invoke-direct {v7, p0}, Ll/vai;-><init>(Ll/wai;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v2, v7}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 41
    .line 42
    .line 43
    new-instance v7, Ll/wai$a;

    .line 44
    .line 45
    invoke-direct {v7, p0}, Ll/wai$a;-><init>(Ll/wai;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v2, v7}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v2, v4, v5}, Landroid/animation/ValueAnimator;->setStartDelay(J)V

    .line 52
    .line 53
    .line 54
    const-wide/16 v4, 0x7d0

    .line 55
    .line 56
    invoke-virtual {v2, v4, v5}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 57
    .line 58
    .line 59
    const/4 v4, 0x1

    .line 60
    invoke-virtual {v2, v4}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 61
    .line 62
    .line 63
    new-instance v5, Ll/xjg;

    .line 64
    .line 65
    invoke-direct {v5}, Ll/xjg;-><init>()V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v2, v5}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 69
    .line 70
    .line 71
    iget-object p0, p0, Ll/wai;->c:Landroid/widget/RelativeLayout;

    .line 72
    .line 73
    new-array v5, v1, [F

    .line 74
    .line 75
    fill-array-data v5, :array_1

    .line 76
    .line 77
    .line 78
    invoke-static {p0, v3, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    const-wide/16 v7, 0x12c

    .line 83
    .line 84
    invoke-virtual {p0, v7, v8}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 85
    .line 86
    .line 87
    const-wide/16 v7, 0x1388

    .line 88
    .line 89
    invoke-virtual {p0, v7, v8}, Landroid/animation/Animator;->setStartDelay(J)V

    .line 90
    .line 91
    .line 92
    new-instance v3, Landroid/animation/AnimatorSet;

    .line 93
    .line 94
    invoke-direct {v3}, Landroid/animation/AnimatorSet;-><init>()V

    .line 95
    .line 96
    .line 97
    const/4 v5, 0x3

    .line 98
    new-array v5, v5, [Landroid/animation/Animator;

    .line 99
    .line 100
    aput-object v0, v5, v6

    .line 101
    .line 102
    aput-object v2, v5, v4

    .line 103
    .line 104
    aput-object p0, v5, v1

    .line 105
    .line 106
    invoke-virtual {v3, v5}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 107
    .line 108
    .line 109
    invoke-virtual {v3}, Landroid/animation/AnimatorSet;->start()V

    .line 110
    .line 111
    .line 112
    return-void

    .line 113
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 114
    .line 115
    .line 116
    .line 117
    .line 118
    .line 119
    .line 120
    .line 121
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/wai;->e:Ll/mai;

    .line 2
    .line 3
    iget-object p0, p0, Ll/mai;->a:Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct;

    .line 4
    .line 5
    return-object p0
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/wai;->e:Ll/mai;

    .line 2
    .line 3
    iget-object p0, p0, Ll/mai;->a:Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct;

    .line 4
    .line 5
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/xai;->b(Ll/wai;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public f(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/wai;->l()Ll/gai;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p1}, Ll/gai;->G(Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/wai;->k()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public i(Ll/mai;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/wai;->e:Ll/mai;

    .line 2
    .line 3
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/mai;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/wai;->i(Ll/mai;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/wai;->e(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-direct {p0}, Ll/wai;->m()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/wai;->w()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/wai;->u()V

    .line 12
    .line 13
    .line 14
    iget-object p2, p0, Ll/wai;->f:Ll/gai;

    .line 15
    .line 16
    iget-object v0, p0, Ll/wai;->e:Ll/mai;

    .line 17
    .line 18
    iget-object v0, v0, Ll/mai;->e:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 19
    .line 20
    iput-object v0, p2, Ll/gai;->o:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/wai;->n()V

    .line 23
    .line 24
    .line 25
    iget-object p2, p0, Ll/wai;->b:Lcom/p1/mobile/putong/feed/newui/videoflow/util/FeedVideoFlowRecycleView;

    .line 26
    .line 27
    invoke-virtual {p0, p2}, Ll/wai;->j(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 28
    .line 29
    .line 30
    return-object p1
.end method

.method public final j(Landroidx/recyclerview/widget/RecyclerView;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getItemAnimator()Landroidx/recyclerview/widget/RecyclerView$l;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-wide/16 v0, 0x0

    .line 6
    .line 7
    invoke-virtual {p0, v0, v1}, Landroidx/recyclerview/widget/RecyclerView$l;->setAddDuration(J)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getItemAnimator()Landroidx/recyclerview/widget/RecyclerView$l;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0, v0, v1}, Landroidx/recyclerview/widget/RecyclerView$l;->setChangeDuration(J)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getItemAnimator()Landroidx/recyclerview/widget/RecyclerView$l;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0, v0, v1}, Landroidx/recyclerview/widget/RecyclerView$l;->setMoveDuration(J)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getItemAnimator()Landroidx/recyclerview/widget/RecyclerView$l;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0, v0, v1}, Landroidx/recyclerview/widget/RecyclerView$l;->setRemoveDuration(J)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getItemAnimator()Landroidx/recyclerview/widget/RecyclerView$l;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    check-cast p0, Landroidx/recyclerview/widget/v;

    .line 36
    .line 37
    const/4 p1, 0x0

    .line 38
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/v;->setSupportsChangeAnimations(Z)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public k()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/wai;->h:Z

    .line 3
    .line 4
    return-void
.end method

.method public l()Ll/gai;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wai;->f:Ll/gai;

    .line 2
    .line 3
    return-object p0
.end method

.method public final n()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wai;->k:Ll/wyd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/CharSequence;

    .line 8
    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ll/wai;->c:Landroid/widget/RelativeLayout;

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/wai;->c:Landroid/widget/RelativeLayout;

    .line 22
    .line 23
    new-instance v1, Ll/sai;

    .line 24
    .line 25
    invoke-direct {v1}, Ll/sai;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ll/wai;->k:Ll/wyd0;

    .line 32
    .line 33
    const-string v1, "show"

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    invoke-direct {p0}, Ll/wai;->y()V

    .line 39
    .line 40
    .line 41
    :cond_0
    return-void
.end method

.method public final synthetic p()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wai;->f:Ll/gai;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/gai;->C()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    add-int/lit8 v0, v0, -0x1

    .line 8
    .line 9
    iget-object v1, p0, Ll/wai;->f:Ll/gai;

    .line 10
    .line 11
    iget v1, v1, Ll/gai;->h:I

    .line 12
    .line 13
    if-le v0, v1, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ll/wai;->b:Lcom/p1/mobile/putong/feed/newui/videoflow/util/FeedVideoFlowRecycleView;

    .line 16
    .line 17
    add-int/lit8 v1, v1, 0x1

    .line 18
    .line 19
    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/RecyclerView;->smoothScrollToPosition(I)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public final synthetic q(Ljava/lang/Integer;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object v0, p0, Ll/wai;->e:Ll/mai;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/mai;->j0()Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    add-int/lit8 v0, v0, -0x4

    .line 16
    .line 17
    if-lt p1, v0, :cond_0

    .line 18
    .line 19
    iget-boolean p1, p0, Ll/wai;->h:Z

    .line 20
    .line 21
    if-nez p1, :cond_0

    .line 22
    .line 23
    const/4 p1, 0x1

    .line 24
    iput-boolean p1, p0, Ll/wai;->h:Z

    .line 25
    .line 26
    invoke-direct {p0}, Ll/wai;->x()V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public final synthetic s(Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/wai;->g:Lcom/p1/mobile/putong/feed/newui/videoflow/util/FeedPagerSnapLinearLayoutManger;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Ljava/lang/Integer;

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    neg-int p1, p1

    .line 14
    const/4 v0, 0x0

    .line 15
    invoke-virtual {p0, v0, p1}, Landroidx/recyclerview/widget/LinearLayoutManager;->scrollToPositionWithOffset(II)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final u()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wai;->f:Ll/gai;

    .line 2
    .line 3
    new-instance v1, Ll/rai;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/rai;-><init>(Ll/wai;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ll/gai;->W(Ll/y20;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public v(I)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/wai;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/wai;->f:Ll/gai;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ll/gai;->S(I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final w()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wai;->e:Ll/mai;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/wai;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-string v1, "VIDEO_FLOW_MOMENT_ID"

    .line 12
    .line 13
    invoke-virtual {p0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {v0, p0}, Ll/mai;->k0(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public z(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Live;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/wai;->f:Ll/gai;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/gai;->Y(Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
