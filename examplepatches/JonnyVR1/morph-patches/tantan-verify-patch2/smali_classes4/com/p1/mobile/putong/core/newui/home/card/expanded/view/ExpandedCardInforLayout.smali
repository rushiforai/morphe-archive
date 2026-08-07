.class public Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VLinear;

.field public b:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public c:Landroid/widget/FrameLayout;

.field public d:Lv/VImage;

.field public e:Lcom/p1/mobile/putong/data/User;

.field public f:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

.field public g:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;

.field public h:I

.field public i:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public j:Z

.field public k:Landroid/animation/AnimatorSet;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 12
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 11
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

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

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/4 p3, 0x0

    .line 5
    iput p3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;->h:I

    .line 6
    .line 7
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;->j(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic a()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic b()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic c()V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public final d(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/zmf;->a(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public e(Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;->get_bottom_userinfo_container()Landroid/widget/FrameLayout;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->getShadowBottomAuxiliary()Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    new-instance v1, Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;->i:Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;->i:Ljava/util/ArrayList;

    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;->a:Lv/VLinear;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    if-eqz p1, :cond_0

    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;->i:Ljava/util/ArrayList;

    .line 29
    .line 30
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->o()Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->s()Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    if-eqz p1, :cond_1

    .line 42
    .line 43
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;->i:Ljava/util/ArrayList;

    .line 44
    .line 45
    new-instance v0, Ll/wmf;

    .line 46
    .line 47
    invoke-direct {v0}, Ll/wmf;-><init>()V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;->i(Ljava/util/List;Ljava/lang/Runnable;)V

    .line 51
    .line 52
    .line 53
    :cond_1
    return-void
.end method

.method public final f()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;->b:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/high16 v0, 0x42880000    # 68.0f

    .line 10
    .line 11
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-static {p0, v0}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    const/high16 v0, 0x42480000    # 50.0f

    .line 20
    .line 21
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    invoke-static {p0, v0}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public g(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;->i:Ljava/util/ArrayList;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    new-instance v1, Ll/xmf;

    .line 6
    .line 7
    invoke-direct {v1}, Ll/xmf;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;->i(Ljava/util/List;Ljava/lang/Runnable;)V

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    new-instance v1, Ll/ymf;

    .line 15
    .line 16
    invoke-direct {v1}, Ll/ymf;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;->p(Ljava/util/List;Ljava/lang/Runnable;)V

    .line 20
    .line 21
    .line 22
    :goto_0
    if-nez p1, :cond_1

    .line 23
    .line 24
    iget p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;->h:I

    .line 25
    .line 26
    const/4 v0, 0x0

    .line 27
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;->o(IZ)V

    .line 28
    .line 29
    .line 30
    :cond_1
    return-void
.end method

.method public get_bottom_userinfo_container()Landroid/widget/FrameLayout;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;->c:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public h(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;->b:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public i(Ljava/util/List;Ljava/lang/Runnable;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;",
            "Ljava/lang/Runnable;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-eqz v2, :cond_2

    .line 22
    .line 23
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    check-cast v2, Landroid/view/View;

    .line 28
    .line 29
    if-eqz v2, :cond_1

    .line 30
    .line 31
    const/4 v3, 0x2

    .line 32
    new-array v3, v3, [F

    .line 33
    .line 34
    fill-array-data v3, :array_0

    .line 35
    .line 36
    .line 37
    const-string v4, "alpha"

    .line 38
    .line 39
    invoke-static {v2, v4, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;->k:Landroid/animation/AnimatorSet;

    .line 48
    .line 49
    if-eqz v1, :cond_3

    .line 50
    .line 51
    invoke-virtual {v1}, Landroid/animation/AnimatorSet;->isRunning()Z

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    if-eqz v1, :cond_3

    .line 56
    .line 57
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;->k:Landroid/animation/AnimatorSet;

    .line 58
    .line 59
    invoke-virtual {v1}, Landroid/animation/AnimatorSet;->cancel()V

    .line 60
    .line 61
    .line 62
    :cond_3
    new-instance v1, Landroid/animation/AnimatorSet;

    .line 63
    .line 64
    invoke-direct {v1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 65
    .line 66
    .line 67
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;->k:Landroid/animation/AnimatorSet;

    .line 68
    .line 69
    invoke-virtual {v1, v0}, Landroid/animation/AnimatorSet;->playTogether(Ljava/util/Collection;)V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;->k:Landroid/animation/AnimatorSet;

    .line 73
    .line 74
    const-wide/16 v1, 0x82

    .line 75
    .line 76
    invoke-virtual {v0, v1, v2}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 77
    .line 78
    .line 79
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;->k:Landroid/animation/AnimatorSet;

    .line 80
    .line 81
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout$b;

    .line 82
    .line 83
    invoke-direct {v1, p0, p2, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout$b;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;Ljava/lang/Runnable;Ljava/util/List;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 87
    .line 88
    .line 89
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;->k:Landroid/animation/AnimatorSet;

    .line 90
    .line 91
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 92
    .line 93
    .line 94
    return-void

    .line 95
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public final j(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    sget p2, Ll/kec0;->W2:I

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    invoke-virtual {p1, p2, p0, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;->d(Landroid/view/View;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final k()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;->g:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->u()Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;->INTL_LIVE_CARD:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;

    .line 10
    .line 11
    if-ne p0, v0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public final l()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;->g:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->u()Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;->INTL_VOICE_CARD:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;

    .line 10
    .line 11
    if-ne p0, v0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public m(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;ILcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;Landroid/view/View;)V
    .locals 7

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;->e:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;->f:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;->g:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;

    .line 6
    .line 7
    const/4 v6, 0x0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    new-instance v0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;

    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;->c:Landroid/widget/FrameLayout;

    .line 17
    .line 18
    new-instance v5, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout$a;

    .line 19
    .line 20
    invoke-direct {v5, p0, p5}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout$a;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;Landroid/view/View;)V

    .line 21
    .line 22
    .line 23
    invoke-direct {v0, v6, v1, v4, v5}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;-><init>(ZLandroid/content/Context;Landroid/widget/FrameLayout;Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b$a;)V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;->g:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;

    .line 27
    .line 28
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;->g:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;

    .line 29
    .line 30
    if-nez p3, :cond_1

    .line 31
    .line 32
    const/4 v1, 0x1

    .line 33
    move v4, v1

    .line 34
    goto :goto_0

    .line 35
    :cond_1
    move v4, v6

    .line 36
    :goto_0
    iget-object v5, p2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->coreMomentInfo:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 37
    .line 38
    const/4 v1, 0x0

    .line 39
    move-object v2, p1

    .line 40
    move-object v3, p2

    .line 41
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->x(Ll/t7m;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;ZLcom/p1/mobile/putong/core/data/CoreMomentInfo;)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;->g:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;

    .line 45
    .line 46
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->w()Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    if-eqz v0, :cond_2

    .line 51
    .line 52
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;->g:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;

    .line 53
    .line 54
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->w()Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;->j:Z

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->n(Z)V

    .line 61
    .line 62
    .line 63
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;->f()V

    .line 64
    .line 65
    .line 66
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;->h:I

    .line 67
    .line 68
    invoke-virtual {p0, v0, v6}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;->o(IZ)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0, p4}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;->e(Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public n()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;->h:I

    .line 3
    .line 4
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;->i:Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-nez v1, :cond_1

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;->i:Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_1

    .line 23
    .line 24
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    check-cast v1, Landroid/view/View;

    .line 29
    .line 30
    if-eqz v1, :cond_0

    .line 31
    .line 32
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 33
    .line 34
    .line 35
    const/high16 v2, 0x3f800000    # 1.0f

    .line 36
    .line 37
    invoke-virtual {v1, v2}, Landroid/view/View;->setAlpha(F)V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    return-void
.end method

.method public o(IZ)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;->h:I

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;->g:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->a(IZ)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;->g:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;->g:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->b()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public p(Ljava/util/List;Ljava/lang/Runnable;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;",
            "Ljava/lang/Runnable;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-eqz v2, :cond_2

    .line 22
    .line 23
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    check-cast v2, Landroid/view/View;

    .line 28
    .line 29
    if-eqz v2, :cond_1

    .line 30
    .line 31
    const/4 v3, 0x0

    .line 32
    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 33
    .line 34
    .line 35
    const/4 v3, 0x2

    .line 36
    new-array v3, v3, [F

    .line 37
    .line 38
    fill-array-data v3, :array_0

    .line 39
    .line 40
    .line 41
    const-string v4, "alpha"

    .line 42
    .line 43
    invoke-static {v2, v4, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;->k:Landroid/animation/AnimatorSet;

    .line 52
    .line 53
    if-eqz v1, :cond_3

    .line 54
    .line 55
    invoke-virtual {v1}, Landroid/animation/AnimatorSet;->isRunning()Z

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    if-eqz v1, :cond_3

    .line 60
    .line 61
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;->k:Landroid/animation/AnimatorSet;

    .line 62
    .line 63
    invoke-virtual {v1}, Landroid/animation/AnimatorSet;->cancel()V

    .line 64
    .line 65
    .line 66
    :cond_3
    new-instance v1, Landroid/animation/AnimatorSet;

    .line 67
    .line 68
    invoke-direct {v1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 69
    .line 70
    .line 71
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;->k:Landroid/animation/AnimatorSet;

    .line 72
    .line 73
    invoke-virtual {v1, v0}, Landroid/animation/AnimatorSet;->playTogether(Ljava/util/Collection;)V

    .line 74
    .line 75
    .line 76
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;->k:Landroid/animation/AnimatorSet;

    .line 77
    .line 78
    const-wide/16 v1, 0x82

    .line 79
    .line 80
    invoke-virtual {v0, v1, v2}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 81
    .line 82
    .line 83
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;->k:Landroid/animation/AnimatorSet;

    .line 84
    .line 85
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout$c;

    .line 86
    .line 87
    invoke-direct {v1, p0, p2, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout$c;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;Ljava/lang/Runnable;Ljava/util/List;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 91
    .line 92
    .line 93
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;->k:Landroid/animation/AnimatorSet;

    .line 94
    .line 95
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 96
    .line 97
    .line 98
    return-void

    .line 99
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public q(Ll/qk4;Landroid/view/View;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_3

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/qk4;->b()Ll/em2;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;->l()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const/high16 v1, 0x430a0000    # 138.0f

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;->d:Lv/VImage;

    .line 19
    .line 20
    sget p1, Ll/qa00;->R:I

    .line 21
    .line 22
    invoke-static {p0, p1}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 23
    .line 24
    .line 25
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    invoke-static {p2, p0}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;->k()Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_2

    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;->d:Lv/VImage;

    .line 40
    .line 41
    const/high16 p1, 0x43050000    # 133.0f

    .line 42
    .line 43
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    invoke-static {p0, p1}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 48
    .line 49
    .line 50
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    invoke-static {p2, p0}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_2
    invoke-virtual {p1}, Ll/qk4;->b()Ll/em2;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;->d:Lv/VImage;

    .line 63
    .line 64
    invoke-virtual {p1}, Ll/em2;->h()I

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    invoke-static {p0, v0}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p1}, Ll/em2;->g()I

    .line 72
    .line 73
    .line 74
    move-result p0

    .line 75
    invoke-static {p2, p0}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :cond_3
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;->d:Lv/VImage;

    .line 80
    .line 81
    const/4 p1, 0x0

    .line 82
    invoke-static {p0, p1}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 83
    .line 84
    .line 85
    invoke-static {p2, p1}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public setHideCertIconForCardBtn(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;->j:Z

    .line 2
    .line 3
    return-void
.end method

.method public setIndex(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;->h:I

    .line 2
    .line 3
    return-void
.end method
