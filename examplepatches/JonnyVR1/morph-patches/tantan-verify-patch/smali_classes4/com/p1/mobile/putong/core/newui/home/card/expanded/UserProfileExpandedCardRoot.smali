.class public Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;
.super Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;
.source "SourceFile"

# interfaces
.implements Ll/u7m;
.implements Ll/pn4;
.implements Ll/zsl;


# instance fields
.field public C:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardClipBgView;

.field public D:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

.field public E:Lv/VText;

.field public E0:Landroid/animation/Animator;

.field public F:Lv/VFrame;

.field public F0:Ll/kcg0;

.field public G:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

.field public G0:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

.field public H:Lv/VFrame;

.field public H0:Lcom/p1/mobile/putong/data/User;

.field public I:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

.field public I0:Z

.field public J:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

.field public J0:I

.field public K:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

.field public L:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

.field public M:Landroid/view/View;

.field public N:Lcom/facebook/drawee/view/SimpleDraweeView;

.field public O:Landroid/view/ViewStub;

.field public P:Landroid/widget/FrameLayout;

.field public Q:Landroid/view/View;

.field public R:Landroid/view/ViewStub;

.field public S:Landroid/view/ViewStub;

.field public T:I

.field public U:Ljava/lang/String;

.field public V:Ll/atl;

.field public W:I

.field public k0:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedSuperlikeSendView;

.field public p0:Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideRightView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->k0:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedSuperlikeSendView;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->G0:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->I0:Z

    .line 11
    .line 12
    const/4 p1, -0x1

    .line 13
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->J0:I

    .line 14
    .line 15
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

    .line 16
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 17
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->k0:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedSuperlikeSendView;

    .line 18
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->G0:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    const/4 p1, 0x0

    .line 19
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->I0:Z

    const/4 p1, -0x1

    .line 20
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->J0:I

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

    .line 21
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 22
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->k0:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedSuperlikeSendView;

    .line 23
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->G0:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    const/4 p1, 0x0

    .line 24
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->I0:Z

    const/4 p1, -0x1

    .line 25
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->J0:I

    return-void
.end method

.method public static synthetic T0(Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;Ljava/lang/String;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->q1(Ljava/lang/String;Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic U0(Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->p1(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic V0(Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper$b;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper$b;->f()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic W0(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic X0(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    const-string v0, "intl_profile_guild"

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {v0, p0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic Y0(Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;Landroid/util/Pair;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->n1(Landroid/util/Pair;)V

    return-void
.end method

.method public static synthetic Z0(Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;ILjava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->o1(ILjava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic a1(Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper$b;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->s1(Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper$b;)V

    return-void
.end method

.method public static synthetic b1(Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->m1()V

    return-void
.end method

.method public static synthetic c1(Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;Landroid/util/Pair;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->t1(Landroid/util/Pair;)V

    return-void
.end method

.method public static synthetic d1(Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->r1(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e1(Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper$b;)Landroid/util/Pair;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper$b;->e()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper$b;->f()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-static {v0, p0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public static synthetic f1(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public A0(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/tql;->A0(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    const/high16 v0, 0x3f800000    # 1.0f

    .line 5
    .line 6
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->u:F

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->I0:Z

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->S0()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->D:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->A0(Landroid/view/View;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public B(IIILjava/lang/String;I)V
    .locals 6

    .line 1
    invoke-super/range {p0 .. p5}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->B(IIILjava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->W:I

    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->V:Ll/atl;

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
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->I0:Z

    .line 15
    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->V:Ll/atl;

    .line 19
    .line 20
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->D:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

    .line 21
    .line 22
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->getFixPaddingBottom()I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    add-int v2, p2, v1

    .line 27
    .line 28
    move v1, p1

    .line 29
    move v3, p3

    .line 30
    move-object v4, p4

    .line 31
    move v5, p5

    .line 32
    invoke-interface/range {v0 .. v5}, Ll/atl;->B(IIILjava/lang/String;I)V

    .line 33
    .line 34
    .line 35
    :cond_0
    iget-boolean p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->w:Z

    .line 36
    .line 37
    if-eqz p2, :cond_1

    .line 38
    .line 39
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->C:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardClipBgView;

    .line 40
    .line 41
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->o()Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;

    .line 42
    .line 43
    .line 44
    move-result-object p3

    .line 45
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->q()I

    .line 46
    .line 47
    .line 48
    move-result p3

    .line 49
    add-int/2addr p5, p3

    .line 50
    invoke-virtual {p2, p1, p5}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardClipBgView;->b(II)V

    .line 51
    .line 52
    .line 53
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-static {p0}, Ll/bnl0;->x0(Landroid/content/Context;)I

    .line 58
    .line 59
    .line 60
    invoke-static {}, Ll/bnl0;->F0()I

    .line 61
    .line 62
    .line 63
    const/high16 p0, 0x42c40000    # 98.0f

    .line 64
    .line 65
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 66
    .line 67
    .line 68
    sget-object p0, Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;->INSTANCE:Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;

    .line 69
    .line 70
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;->k()I

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public B0(Lcom/p1/mobile/putong/core/newui/home/b;Ll/q7m;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;I)Z
    .locals 1

    .line 1
    invoke-static {}, Ll/uih0;->m0()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p2, :cond_3

    .line 7
    .line 8
    iget-object p2, p3, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {p2}, Ll/uih0;->y0(Ljava/lang/String;)Z

    .line 11
    .line 12
    .line 13
    move-result p2

    .line 14
    if-eqz p2, :cond_0

    .line 15
    .line 16
    invoke-static {}, Ll/uih0;->s0()Ll/uih0;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    invoke-virtual {p2, p1, p0, p3, p4}, Ll/uih0;->j1(Lcom/p1/mobile/putong/core/newui/home/b;Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;I)V

    .line 21
    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_0
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->F0:Ll/kcg0;

    .line 26
    .line 27
    invoke-static {p2}, Ll/psd0;->z(Ll/kcg0;)V

    .line 28
    .line 29
    .line 30
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->E0:Landroid/animation/Animator;

    .line 31
    .line 32
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result p2

    .line 36
    if-eqz p2, :cond_1

    .line 37
    .line 38
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->E0:Landroid/animation/Animator;

    .line 39
    .line 40
    invoke-virtual {p2}, Landroid/animation/Animator;->isRunning()Z

    .line 41
    .line 42
    .line 43
    move-result p2

    .line 44
    if-eqz p2, :cond_1

    .line 45
    .line 46
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->E0:Landroid/animation/Animator;

    .line 47
    .line 48
    invoke-virtual {p2}, Landroid/animation/Animator;->end()V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->getRootView()Landroid/view/View;

    .line 52
    .line 53
    .line 54
    move-result-object p2

    .line 55
    const/4 p3, 0x0

    .line 56
    invoke-virtual {p2, p3}, Landroid/view/View;->setRotation(F)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->getRootView()Landroid/view/View;

    .line 60
    .line 61
    .line 62
    move-result-object p2

    .line 63
    invoke-virtual {p2, p3}, Landroid/view/View;->setTranslationX(F)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->getRootView()Landroid/view/View;

    .line 67
    .line 68
    .line 69
    move-result-object p2

    .line 70
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 71
    .line 72
    .line 73
    move-result p3

    .line 74
    div-int/lit8 p3, p3, 0x2

    .line 75
    .line 76
    int-to-float p3, p3

    .line 77
    invoke-virtual {p2, p3}, Landroid/view/View;->setPivotX(F)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->getRootView()Landroid/view/View;

    .line 81
    .line 82
    .line 83
    move-result-object p2

    .line 84
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 85
    .line 86
    .line 87
    move-result p3

    .line 88
    div-int/lit8 p3, p3, 0x2

    .line 89
    .line 90
    int-to-float p3, p3

    .line 91
    invoke-virtual {p2, p3}, Landroid/view/View;->setPivotY(F)V

    .line 92
    .line 93
    .line 94
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->p0:Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideRightView;

    .line 95
    .line 96
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 97
    .line 98
    .line 99
    move-result p2

    .line 100
    if-eqz p2, :cond_2

    .line 101
    .line 102
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 103
    .line 104
    .line 105
    move-result p2

    .line 106
    if-eqz p2, :cond_2

    .line 107
    .line 108
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 109
    .line 110
    .line 111
    :cond_2
    invoke-static {}, Ll/uih0;->s0()Ll/uih0;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    invoke-virtual {p0}, Ll/uih0;->f1()V

    .line 116
    .line 117
    .line 118
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/newui/home/b;->U5(Z)V

    .line 119
    .line 120
    .line 121
    :cond_3
    return v0
.end method

.method public C()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->D:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedBaseLayout;->C()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public D(Ljava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->D:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedBaseLayout;->D(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public D0(Landroid/view/View;Lcom/p1/mobile/putong/core/newui/home/opt/SwipeState;Z)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->w:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_7

    .line 5
    .line 6
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/opt/SwipeState;->START_TOUCH:Lcom/p1/mobile/putong/core/newui/home/opt/SwipeState;

    .line 7
    .line 8
    if-ne p2, v0, :cond_0

    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->A:F

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/opt/SwipeState;->START_MOVING:Lcom/p1/mobile/putong/core/newui/home/opt/SwipeState;

    .line 15
    .line 16
    if-ne p2, v0, :cond_2

    .line 17
    .line 18
    iget p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->J0:I

    .line 19
    .line 20
    if-nez p1, :cond_1

    .line 21
    .line 22
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->o()Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->s()Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-eqz p1, :cond_1

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->y:Ll/inf;

    .line 33
    .line 34
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;->SWIPE_CLIP_PROFILE:Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;

    .line 35
    .line 36
    invoke-virtual {p0, p1, v1}, Ll/inf;->i(Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;Z)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->y:Ll/inf;

    .line 41
    .line 42
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;->SWIPE_CLIP:Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;

    .line 43
    .line 44
    invoke-virtual {p0, p1, v1}, Ll/inf;->i(Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;Z)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/opt/SwipeState;->START_BACK:Lcom/p1/mobile/putong/core/newui/home/opt/SwipeState;

    .line 49
    .line 50
    if-ne p2, v0, :cond_4

    .line 51
    .line 52
    iget p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->J0:I

    .line 53
    .line 54
    if-nez p1, :cond_3

    .line 55
    .line 56
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->o()Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->s()Z

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    if-eqz p1, :cond_3

    .line 65
    .line 66
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->y:Ll/inf;

    .line 67
    .line 68
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;->EXPANDED_PROFILE:Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;

    .line 69
    .line 70
    invoke-virtual {p0, p1, v1}, Ll/inf;->i(Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;Z)V

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :cond_3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->y:Ll/inf;

    .line 75
    .line 76
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;->EXPANDED_CARD:Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;

    .line 77
    .line 78
    invoke-virtual {p0, p1, v1}, Ll/inf;->i(Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;Z)V

    .line 79
    .line 80
    .line 81
    return-void

    .line 82
    :cond_4
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/opt/SwipeState;->FINISH_OUT:Lcom/p1/mobile/putong/core/newui/home/opt/SwipeState;

    .line 83
    .line 84
    if-ne p2, v0, :cond_5

    .line 85
    .line 86
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->y1(Landroid/view/View;Lcom/p1/mobile/putong/core/newui/home/opt/SwipeState;Z)V

    .line 87
    .line 88
    .line 89
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->y:Ll/inf;

    .line 90
    .line 91
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;->EXPANDED_CARD:Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;

    .line 92
    .line 93
    invoke-virtual {p0, p1, v1}, Ll/inf;->i(Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;Z)V

    .line 94
    .line 95
    .line 96
    return-void

    .line 97
    :cond_5
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/opt/SwipeState;->FINISH_BACK:Lcom/p1/mobile/putong/core/newui/home/opt/SwipeState;

    .line 98
    .line 99
    if-ne p2, p1, :cond_9

    .line 100
    .line 101
    iget p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->J0:I

    .line 102
    .line 103
    if-nez p1, :cond_6

    .line 104
    .line 105
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->o()Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->s()Z

    .line 110
    .line 111
    .line 112
    move-result p1

    .line 113
    if-eqz p1, :cond_6

    .line 114
    .line 115
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->y:Ll/inf;

    .line 116
    .line 117
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;->EXPANDED_PROFILE:Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;

    .line 118
    .line 119
    invoke-virtual {p0, p1, v1}, Ll/inf;->i(Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;Z)V

    .line 120
    .line 121
    .line 122
    return-void

    .line 123
    :cond_6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->y:Ll/inf;

    .line 124
    .line 125
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;->EXPANDED_CARD:Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;

    .line 126
    .line 127
    invoke-virtual {p0, p1, v1}, Ll/inf;->i(Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;Z)V

    .line 128
    .line 129
    .line 130
    return-void

    .line 131
    :cond_7
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/opt/SwipeState;->START_MOVING:Lcom/p1/mobile/putong/core/newui/home/opt/SwipeState;

    .line 132
    .line 133
    if-ne p2, p1, :cond_8

    .line 134
    .line 135
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->J0(Z)V

    .line 136
    .line 137
    .line 138
    return-void

    .line 139
    :cond_8
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/opt/SwipeState;->START_BACK:Lcom/p1/mobile/putong/core/newui/home/opt/SwipeState;

    .line 140
    .line 141
    if-eq p2, p1, :cond_a

    .line 142
    .line 143
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/opt/SwipeState;->FINISH_OUT:Lcom/p1/mobile/putong/core/newui/home/opt/SwipeState;

    .line 144
    .line 145
    if-ne p2, p1, :cond_9

    .line 146
    .line 147
    goto :goto_0

    .line 148
    :cond_9
    return-void

    .line 149
    :cond_a
    :goto_0
    const/4 p1, 0x0

    .line 150
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->J0(Z)V

    .line 151
    .line 152
    .line 153
    return-void
.end method

.method public F()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->D:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedBaseLayout;->F()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public H()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->D:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->H()Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public K(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/tql;->K(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->I0:Z

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->u:F

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->S0()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public R()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->D:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedBaseLayout;->R()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public T(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;I)V
    .locals 3

    .line 1
    invoke-virtual {p0, p2, p3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->v1(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;I)V

    .line 2
    .line 3
    .line 4
    iput p3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->J0:I

    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->U:Ljava/lang/String;

    .line 7
    .line 8
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const/4 v1, 0x1

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->T:I

    .line 18
    .line 19
    add-int/2addr v0, v1

    .line 20
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->T:I

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    iput v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->T:I

    .line 24
    .line 25
    :goto_0
    invoke-virtual {p0, p3, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->R0(ILcom/p1/mobile/putong/data/User;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 29
    .line 30
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->U:Ljava/lang/String;

    .line 31
    .line 32
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->G0:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 33
    .line 34
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->H0:Lcom/p1/mobile/putong/data/User;

    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->D:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

    .line 37
    .line 38
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->i1(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;I)Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->s:Z

    .line 43
    .line 44
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->E:Lv/VText;

    .line 45
    .line 46
    new-instance v1, Ljava/lang/StringBuilder;

    .line 47
    .line 48
    const-string v2, "rc: "

    .line 49
    .line 50
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->T:I

    .line 54
    .line 55
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->D:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

    .line 66
    .line 67
    invoke-virtual {v0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->T(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;I)V

    .line 68
    .line 69
    .line 70
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->G0:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 71
    .line 72
    iget-object p2, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->renderFrom:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 73
    .line 74
    sget-object v0, Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;->CARD:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 75
    .line 76
    if-ne p2, v0, :cond_1

    .line 77
    .line 78
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 79
    .line 80
    invoke-virtual {p0, p3, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->w1(ILjava/lang/String;)V

    .line 81
    .line 82
    .line 83
    :cond_1
    return-void
.end method

.method public U()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->D:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedBaseLayout;->U()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public Y()Lcom/p1/mobile/putong/core/ui/PictureView;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->D:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->getGuidePictureView()Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->D:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->getGuidePictureView()Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return-object p0
.end method

.method public c()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->D:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->c()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public c0(IIIILandroid/view/View;)V
    .locals 1

    .line 1
    invoke-super/range {p0 .. p5}, Ll/atl;->c0(IIIILandroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->V:Ll/atl;

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
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->I0:Z

    .line 13
    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->V:Ll/atl;

    .line 17
    .line 18
    invoke-interface/range {p0 .. p5}, Ll/atl;->c0(IIIILandroid/view/View;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public d0(FFFLcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    cmpl-float v1, p1, v0

    .line 3
    .line 4
    if-nez v1, :cond_0

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    neg-float p2, p1

    .line 8
    :goto_0
    const/high16 p1, -0x40800000    # -1.0f

    .line 9
    .line 10
    invoke-static {p1, p2}, Ljava/lang/Math;->max(FF)F

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    const/high16 p2, 0x3f800000    # 1.0f

    .line 15
    .line 16
    invoke-static {p2, p1}, Ljava/lang/Math;->min(FF)F

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    cmpl-float p2, p3, v0

    .line 21
    .line 22
    if-nez p2, :cond_1

    .line 23
    .line 24
    const/4 v0, 0x1

    .line 25
    goto :goto_1

    .line 26
    :cond_1
    const/4 v0, 0x0

    .line 27
    :goto_1
    if-nez p2, :cond_2

    .line 28
    .line 29
    move p3, p1

    .line 30
    :cond_2
    invoke-virtual {p0, v0, p3, p4}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->k1(ZFLcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 0
    .param p1    # Landroid/graphics/Canvas;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public e0()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->D:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedBaseLayout;->e0()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public f0(IFFZLjava/lang/String;)V
    .locals 6

    .line 1
    const/high16 p3, 0x3f800000    # 1.0f

    .line 2
    .line 3
    const/4 p5, 0x1

    .line 4
    if-lt p1, p5, :cond_2

    .line 5
    .line 6
    if-nez p4, :cond_1

    .line 7
    .line 8
    if-le p1, p5, :cond_0

    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->setAlpha(F)V

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    sget p1, Ll/vo0;->H:F

    .line 16
    .line 17
    const p4, 0x3f99999a    # 1.2f

    .line 18
    .line 19
    .line 20
    mul-float/2addr p4, p2

    .line 21
    invoke-static {p1, p4}, Ljava/lang/Math;->max(FF)F

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    invoke-static {p3, p1}, Ljava/lang/Math;->min(FF)F

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->setAlpha(F)V

    .line 30
    .line 31
    .line 32
    :cond_1
    :goto_0
    iget p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->J0:I

    .line 33
    .line 34
    if-eqz p1, :cond_3

    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->y:Ll/inf;

    .line 37
    .line 38
    sget-object v2, Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;->EXPANDED_CARD:Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;

    .line 39
    .line 40
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;->SWIPE_CLIP:Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;

    .line 41
    .line 42
    invoke-virtual {v0, p0}, Ll/inf;->f(Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;)Ll/inf$a;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    const/high16 v4, 0x3f800000    # 1.0f

    .line 47
    .line 48
    const-string v5, "swipe other size"

    .line 49
    .line 50
    move v1, p2

    .line 51
    invoke-virtual/range {v0 .. v5}, Ll/inf;->b(FLcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;Ll/inf$a;FLjava/lang/String;)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_2
    if-nez p4, :cond_3

    .line 56
    .line 57
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->setAlpha(F)V

    .line 58
    .line 59
    .line 60
    :cond_3
    return-void
.end method

.method public final g1(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/mhk0;->a(Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public getCardData()Ll/ik4;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->D:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->getCardData()Ll/ik4;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getCardDataProxy()Ll/ik4;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->D:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->getCardDataProxy()Ll/ik4;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getCardView()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->D:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

    .line 2
    .line 3
    return-object p0
.end method

.method public getCardViewInner()Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->D:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

    .line 2
    .line 3
    return-object p0
.end method

.method public getCardViewProxy()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->D:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->getCardViewProxy()Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getClipAvatarView()Lcom/facebook/drawee/view/SimpleDraweeView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->N:Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 2
    .line 3
    return-object p0
.end method

.method public getExpandedCard()Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->D:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMomentInfoProxy()Lcom/p1/mobile/putong/core/data/CoreMomentInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->D:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->getMomentInfoProxy()Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getRootView()Landroid/view/View;
    .locals 0

    return-object p0
.end method

.method public getShowPictureIndexProxy()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->D:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedBaseLayout;->getShowPictureIndexProxy()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getUserInfoProxy()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->D:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->getUserInfoProxy()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getUserProxy()Lcom/p1/mobile/putong/data/User;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->D:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->getUserProxy()Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic getVirtualCard()Lcom/p1/mobile/putong/core/ui/home/VirtualCard;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-super {p0}, Ll/q7m;->getVirtualCard()Lcom/p1/mobile/putong/core/ui/home/VirtualCard;

    move-result-object p0

    return-object p0
.end method

.method public final h1()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->D:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->q1()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final i1(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;I)Z
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p3, :cond_1

    .line 3
    .line 4
    if-eqz p1, :cond_1

    .line 5
    .line 6
    if-eqz p2, :cond_1

    .line 7
    .line 8
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->renderFrom:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 9
    .line 10
    sget-object p3, Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;->CARD:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 11
    .line 12
    if-eq p2, p3, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->G0:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 16
    .line 17
    invoke-static {p1, p0}, Ll/wj90;->b(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_1

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_1
    :goto_0
    return v0
.end method

.method public j0(Lcom/p1/mobile/putong/core/data/SwipeDirection;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->D:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->j0(Lcom/p1/mobile/putong/core/data/SwipeDirection;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final j1()V
    .locals 2

    .line 1
    invoke-static {}, Ll/gra;->s2()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_4

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->G:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;->j()V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->G:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

    .line 19
    .line 20
    invoke-virtual {v1, v0}, Lcom/tantan/library/svga/SVGAnimationView;->setAnimListener(Lcom/tantan/library/svga/AnimListener;)V

    .line 21
    .line 22
    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->G:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

    .line 24
    .line 25
    invoke-virtual {v1, v0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 26
    .line 27
    .line 28
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->L:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

    .line 29
    .line 30
    if-eqz v1, :cond_1

    .line 31
    .line 32
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;->j()V

    .line 33
    .line 34
    .line 35
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->L:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

    .line 36
    .line 37
    invoke-virtual {v1, v0}, Lcom/tantan/library/svga/SVGAnimationView;->setAnimListener(Lcom/tantan/library/svga/AnimListener;)V

    .line 38
    .line 39
    .line 40
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->K:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

    .line 41
    .line 42
    if-eqz v1, :cond_2

    .line 43
    .line 44
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;->j()V

    .line 45
    .line 46
    .line 47
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->K:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

    .line 48
    .line 49
    invoke-virtual {v1, v0}, Lcom/tantan/library/svga/SVGAnimationView;->setAnimListener(Lcom/tantan/library/svga/AnimListener;)V

    .line 50
    .line 51
    .line 52
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->J:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

    .line 53
    .line 54
    if-eqz v1, :cond_3

    .line 55
    .line 56
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;->j()V

    .line 57
    .line 58
    .line 59
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->J:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

    .line 60
    .line 61
    invoke-virtual {v1, v0}, Lcom/tantan/library/svga/SVGAnimationView;->setAnimListener(Lcom/tantan/library/svga/AnimListener;)V

    .line 62
    .line 63
    .line 64
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->I:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

    .line 65
    .line 66
    if-eqz v1, :cond_4

    .line 67
    .line 68
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;->j()V

    .line 69
    .line 70
    .line 71
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->I:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

    .line 72
    .line 73
    invoke-virtual {p0, v0}, Lcom/tantan/library/svga/SVGAnimationView;->setAnimListener(Lcom/tantan/library/svga/AnimListener;)V

    .line 74
    .line 75
    .line 76
    :cond_4
    return-void
.end method

.method public k(Z)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->V:Ll/atl;

    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->D:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

    .line 5
    .line 6
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->k(Z)V

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->I0:Z

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->Q0()V

    .line 13
    .line 14
    .line 15
    if-nez p1, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->G0()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->j1()V

    .line 21
    .line 22
    .line 23
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->k0:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedSuperlikeSendView;

    .line 24
    .line 25
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_1

    .line 30
    .line 31
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->k0:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedSuperlikeSendView;

    .line 32
    .line 33
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->k0:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedSuperlikeSendView;

    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedSuperlikeSendView;->b()V

    .line 39
    .line 40
    .line 41
    :cond_1
    return-void
.end method

.method public k1(ZFLcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;)V
    .locals 4

    .line 1
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->G0:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 2
    .line 3
    if-eqz p3, :cond_6

    .line 4
    .line 5
    iget-boolean v0, p3, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isUndo:Z

    .line 6
    .line 7
    if-nez v0, :cond_6

    .line 8
    .line 9
    iget-object p3, p3, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {p3}, Ll/uih0;->y0(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result p3

    .line 15
    if-eqz p3, :cond_0

    .line 16
    .line 17
    goto/16 :goto_2

    .line 18
    .line 19
    :cond_0
    const/4 p3, 0x0

    .line 20
    const/4 v0, 0x1

    .line 21
    const/4 v1, 0x4

    .line 22
    const/4 v2, 0x0

    .line 23
    if-eqz p1, :cond_3

    .line 24
    .line 25
    cmpl-float p1, p2, p3

    .line 26
    .line 27
    const/high16 v3, 0x40000000    # 2.0f

    .line 28
    .line 29
    if-lez p1, :cond_1

    .line 30
    .line 31
    const/high16 p1, 0x3f800000    # 1.0f

    .line 32
    .line 33
    mul-float/2addr p2, v3

    .line 34
    invoke-static {p1, p2}, Ljava/lang/Math;->min(FF)F

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->L:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

    .line 38
    .line 39
    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->K:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

    .line 43
    .line 44
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->L:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

    .line 48
    .line 49
    invoke-virtual {p1, v0}, Landroid/view/View;->setPressed(Z)V

    .line 50
    .line 51
    .line 52
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->L:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

    .line 53
    .line 54
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;->i()V

    .line 55
    .line 56
    .line 57
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->K:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

    .line 58
    .line 59
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;->j()V

    .line 60
    .line 61
    .line 62
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->K:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

    .line 63
    .line 64
    invoke-virtual {p1, v2}, Landroid/view/View;->setPressed(Z)V

    .line 65
    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_1
    cmpg-float p1, p2, p3

    .line 69
    .line 70
    if-gez p1, :cond_2

    .line 71
    .line 72
    const/high16 p1, -0x40800000    # -1.0f

    .line 73
    .line 74
    mul-float/2addr p2, v3

    .line 75
    invoke-static {p1, p2}, Ljava/lang/Math;->max(FF)F

    .line 76
    .line 77
    .line 78
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->L:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

    .line 79
    .line 80
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 81
    .line 82
    .line 83
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->K:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

    .line 84
    .line 85
    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 86
    .line 87
    .line 88
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->L:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

    .line 89
    .line 90
    invoke-virtual {p1, v2}, Landroid/view/View;->setPressed(Z)V

    .line 91
    .line 92
    .line 93
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->K:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

    .line 94
    .line 95
    invoke-virtual {p1, v0}, Landroid/view/View;->setPressed(Z)V

    .line 96
    .line 97
    .line 98
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->K:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

    .line 99
    .line 100
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;->i()V

    .line 101
    .line 102
    .line 103
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->L:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

    .line 104
    .line 105
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;->j()V

    .line 106
    .line 107
    .line 108
    goto :goto_0

    .line 109
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->L:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

    .line 110
    .line 111
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 112
    .line 113
    .line 114
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->K:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

    .line 115
    .line 116
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 117
    .line 118
    .line 119
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->L:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

    .line 120
    .line 121
    invoke-virtual {p1, v2}, Landroid/view/View;->setPressed(Z)V

    .line 122
    .line 123
    .line 124
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->K:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

    .line 125
    .line 126
    invoke-virtual {p1, v2}, Landroid/view/View;->setPressed(Z)V

    .line 127
    .line 128
    .line 129
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->L:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

    .line 130
    .line 131
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;->j()V

    .line 132
    .line 133
    .line 134
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->K:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

    .line 135
    .line 136
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;->j()V

    .line 137
    .line 138
    .line 139
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->F:Lv/VFrame;

    .line 140
    .line 141
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 142
    .line 143
    .line 144
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->G:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

    .line 145
    .line 146
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;->j()V

    .line 147
    .line 148
    .line 149
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->G:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

    .line 150
    .line 151
    invoke-virtual {p1, v2}, Landroid/view/View;->setPressed(Z)V

    .line 152
    .line 153
    .line 154
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->I:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

    .line 155
    .line 156
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;->j()V

    .line 157
    .line 158
    .line 159
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->I:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

    .line 160
    .line 161
    invoke-virtual {p1, v2}, Landroid/view/View;->setPressed(Z)V

    .line 162
    .line 163
    .line 164
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->J:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

    .line 165
    .line 166
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;->j()V

    .line 167
    .line 168
    .line 169
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->J:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

    .line 170
    .line 171
    invoke-virtual {p0, v2}, Landroid/view/View;->setPressed(Z)V

    .line 172
    .line 173
    .line 174
    return-void

    .line 175
    :cond_3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->getUserProxy()Lcom/p1/mobile/putong/data/User;

    .line 176
    .line 177
    .line 178
    move-result-object p1

    .line 179
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 180
    .line 181
    .line 182
    move-result p1

    .line 183
    if-eqz p1, :cond_4

    .line 184
    .line 185
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->I:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

    .line 186
    .line 187
    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 188
    .line 189
    .line 190
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->I:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

    .line 191
    .line 192
    invoke-virtual {p1, v0}, Landroid/view/View;->setPressed(Z)V

    .line 193
    .line 194
    .line 195
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->I:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

    .line 196
    .line 197
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;->i()V

    .line 198
    .line 199
    .line 200
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->J:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

    .line 201
    .line 202
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 203
    .line 204
    .line 205
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->J:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

    .line 206
    .line 207
    invoke-virtual {p1, v2}, Landroid/view/View;->setPressed(Z)V

    .line 208
    .line 209
    .line 210
    goto :goto_1

    .line 211
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->J:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

    .line 212
    .line 213
    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 214
    .line 215
    .line 216
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->J:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

    .line 217
    .line 218
    invoke-virtual {p1, v0}, Landroid/view/View;->setPressed(Z)V

    .line 219
    .line 220
    .line 221
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->J:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

    .line 222
    .line 223
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;->i()V

    .line 224
    .line 225
    .line 226
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->I:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

    .line 227
    .line 228
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 229
    .line 230
    .line 231
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->I:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

    .line 232
    .line 233
    invoke-virtual {p1, v2}, Landroid/view/View;->setPressed(Z)V

    .line 234
    .line 235
    .line 236
    :goto_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->L:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

    .line 237
    .line 238
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 239
    .line 240
    .line 241
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->K:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

    .line 242
    .line 243
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 244
    .line 245
    .line 246
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->L:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

    .line 247
    .line 248
    invoke-virtual {p1, v2}, Landroid/view/View;->setPressed(Z)V

    .line 249
    .line 250
    .line 251
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->K:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

    .line 252
    .line 253
    invoke-virtual {p1, v2}, Landroid/view/View;->setPressed(Z)V

    .line 254
    .line 255
    .line 256
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->F:Lv/VFrame;

    .line 257
    .line 258
    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 259
    .line 260
    .line 261
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->G:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

    .line 262
    .line 263
    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 264
    .line 265
    .line 266
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->G:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

    .line 267
    .line 268
    invoke-virtual {p1, v0}, Landroid/view/View;->setPressed(Z)V

    .line 269
    .line 270
    .line 271
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->G:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

    .line 272
    .line 273
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;->f()Z

    .line 274
    .line 275
    .line 276
    move-result p1

    .line 277
    if-nez p1, :cond_5

    .line 278
    .line 279
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->H:Lv/VFrame;

    .line 280
    .line 281
    invoke-virtual {p1, p3}, Landroid/view/View;->setScaleX(F)V

    .line 282
    .line 283
    .line 284
    invoke-virtual {p1, p3}, Landroid/view/View;->setScaleY(F)V

    .line 285
    .line 286
    .line 287
    new-instance p2, Landroid/animation/AnimatorSet;

    .line 288
    .line 289
    invoke-direct {p2}, Landroid/animation/AnimatorSet;-><init>()V

    .line 290
    .line 291
    .line 292
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->G:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

    .line 293
    .line 294
    new-instance v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot$a;

    .line 295
    .line 296
    invoke-direct {v0, p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot$a;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;Landroid/view/View;Landroid/animation/AnimatorSet;)V

    .line 297
    .line 298
    .line 299
    invoke-virtual {p3, v0}, Lcom/tantan/library/svga/SVGAnimationView;->setAnimListener(Lcom/tantan/library/svga/AnimListener;)V

    .line 300
    .line 301
    .line 302
    :cond_5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->G:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

    .line 303
    .line 304
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;->i()V

    .line 305
    .line 306
    .line 307
    :cond_6
    :goto_2
    return-void
.end method

.method public l0(ILcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;ZFF)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->L0(ILcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;ZFF)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public l1()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public m(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->T(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic m1()V
    .locals 2

    .line 1
    invoke-static {p0}, Ll/bnl0;->E(Landroid/view/View;)Landroid/app/Activity;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-static {}, Ll/uih0;->s0()Ll/uih0;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v1, v0, p0}, Ll/uih0;->b1(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic n1(Landroid/util/Pair;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->z1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic o1(ILjava/lang/Boolean;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    const/high16 v1, 0x42480000    # 50.0f

    .line 3
    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-eqz p1, :cond_1

    .line 11
    .line 12
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->o()Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->r()F

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    const/high16 p2, 0x3f800000    # 1.0f

    .line 21
    .line 22
    sub-float/2addr p2, p1

    .line 23
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    int-to-float p1, p1

    .line 28
    mul-float/2addr p2, p1

    .line 29
    float-to-int v0, p2

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_1

    .line 36
    .line 37
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->D:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

    .line 42
    .line 43
    invoke-static {p1, v0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->C:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardClipBgView;

    .line 47
    .line 48
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardClipBgView;->setExtTop(I)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 0
    .param p1    # Landroid/graphics/Canvas;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onFinishInflate()V
    .locals 7

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->g1(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->Q:Landroid/view/View;

    .line 8
    .line 9
    new-instance v1, Ll/zgk0;

    .line 10
    .line 11
    invoke-direct {v1}, Ll/zgk0;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->Q:Landroid/view/View;

    .line 18
    .line 19
    const/high16 v1, 0x42680000    # 58.0f

    .line 20
    .line 21
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    invoke-static {v0, v1}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->D:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

    .line 29
    .line 30
    const/high16 v1, 0x41000000    # 8.0f

    .line 31
    .line 32
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    const/high16 v3, 0x41200000    # 10.0f

    .line 37
    .line 38
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 39
    .line 40
    .line 41
    move-result v4

    .line 42
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 43
    .line 44
    .line 45
    move-result v5

    .line 46
    const/high16 v6, 0x42c40000    # 98.0f

    .line 47
    .line 48
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 49
    .line 50
    .line 51
    move-result v6

    .line 52
    invoke-virtual {v0, v2, v4, v5, v6}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->b1(IIII)V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->D:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

    .line 56
    .line 57
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->X(Ll/atl;)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->D:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

    .line 61
    .line 62
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->o1(Ll/zsl;)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->D:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

    .line 66
    .line 67
    const/4 v2, 0x1

    .line 68
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->setBlockScroll(Z)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->P:Landroid/widget/FrameLayout;

    .line 72
    .line 73
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 74
    .line 75
    .line 76
    move-result v2

    .line 77
    invoke-static {v0, v2}, Ll/bnl0;->d0(Landroid/view/View;I)V

    .line 78
    .line 79
    .line 80
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->P:Landroid/widget/FrameLayout;

    .line 81
    .line 82
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 83
    .line 84
    .line 85
    move-result v1

    .line 86
    invoke-static {v0, v1}, Ll/bnl0;->e0(Landroid/view/View;I)V

    .line 87
    .line 88
    .line 89
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->P:Landroid/widget/FrameLayout;

    .line 90
    .line 91
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 92
    .line 93
    .line 94
    move-result v1

    .line 95
    invoke-static {v0, v1}, Ll/bnl0;->f0(Landroid/view/View;I)V

    .line 96
    .line 97
    .line 98
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->P:Landroid/widget/FrameLayout;

    .line 99
    .line 100
    const/high16 v1, 0x41f00000    # 30.0f

    .line 101
    .line 102
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 103
    .line 104
    .line 105
    move-result v1

    .line 106
    invoke-static {v0, v1}, Ll/bnl0;->c0(Landroid/view/View;I)V

    .line 107
    .line 108
    .line 109
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->L:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

    .line 110
    .line 111
    invoke-static {}, Ll/en4;->h()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v1

    .line 115
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;->g(Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->K:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

    .line 119
    .line 120
    invoke-static {}, Ll/en4;->g()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;->g(Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->G:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

    .line 128
    .line 129
    const-string v1, "https://auto.tancdn.com/v1/raw/95aca228-d59c-4db5-9287-99764d67ddaa14.pdf"

    .line 130
    .line 131
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;->g(Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->J:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

    .line 135
    .line 136
    const-string v1, "https://fe-static.tancdn.com/v1/raw/834a7aa4-a1b3-402f-b2f3-a78ab30f50c0.svga"

    .line 137
    .line 138
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;->g(Ljava/lang/String;)V

    .line 139
    .line 140
    .line 141
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->I:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

    .line 142
    .line 143
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;->g(Ljava/lang/String;)V

    .line 144
    .line 145
    .line 146
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->C:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardClipBgView;

    .line 147
    .line 148
    sget v0, Ll/dbc0;->h8:I

    .line 149
    .line 150
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 151
    .line 152
    .line 153
    return-void
.end method

.method public onSizeChanged(IIII)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    .line 2
    .line 3
    .line 4
    if-ne p1, p3, :cond_0

    .line 5
    .line 6
    if-ne p2, p4, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    if-lez p1, :cond_2

    .line 10
    .line 11
    if-gtz p2, :cond_1

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_1
    new-instance p1, Ll/dhk0;

    .line 15
    .line 16
    invoke-direct {p1, p0}, Ll/dhk0;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, p1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 20
    .line 21
    .line 22
    :cond_2
    :goto_0
    return-void
.end method

.method public final synthetic p1(Ljava/lang/Integer;)V
    .locals 1

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/opt/SwipeState;->START_MOVING:Lcom/p1/mobile/putong/core/newui/home/opt/SwipeState;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->D0(Landroid/view/View;Lcom/p1/mobile/putong/core/newui/home/opt/SwipeState;Z)V

    .line 5
    .line 6
    .line 7
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/opt/SwipeState;->START_BACK:Lcom/p1/mobile/putong/core/newui/home/opt/SwipeState;

    .line 8
    .line 9
    invoke-virtual {p0, p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->D0(Landroid/view/View;Lcom/p1/mobile/putong/core/newui/home/opt/SwipeState;Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public q0()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public final synthetic q1(Ljava/lang/String;Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->D:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

    .line 2
    .line 3
    new-instance v0, Ll/pf60;

    .line 4
    .line 5
    invoke-direct {v0, p1, p2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->B:Ll/pf60;

    .line 9
    .line 10
    return-void
.end method

.method public r()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->D:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->r()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->Q0()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic r1(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->o()Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->H0:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->G0:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 8
    .line 9
    invoke-virtual {p1, v0, p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->g(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic s1(Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper$b;)V
    .locals 4

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper$b;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper$ExpandedCardStyle;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper$ExpandedCardStyle;->EXPANDED_PROFILE_STYLE:Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper$ExpandedCardStyle;

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->I0()V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->D:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->setBlockScroll(Z)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->L:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

    .line 17
    .line 18
    const/high16 v1, 0x42700000    # 60.0f

    .line 19
    .line 20
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    invoke-static {p1, v2}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->K:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

    .line 28
    .line 29
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    invoke-static {p1, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->Q:Landroid/view/View;

    .line 37
    .line 38
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->H0()V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->D:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

    .line 46
    .line 47
    const/4 v1, 0x1

    .line 48
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->setBlockScroll(Z)V

    .line 49
    .line 50
    .line 51
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper$b;->g:Z

    .line 52
    .line 53
    if-eqz v0, :cond_2

    .line 54
    .line 55
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper$b;->d:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 56
    .line 57
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->D:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

    .line 58
    .line 59
    if-eqz p1, :cond_1

    .line 60
    .line 61
    sget-wide v2, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->h:J

    .line 62
    .line 63
    invoke-virtual {v0, v2, v3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->f0(J)V

    .line 64
    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_1
    sget-wide v2, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->h:J

    .line 68
    .line 69
    invoke-virtual {v0, v2, v3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->f0(J)V

    .line 70
    .line 71
    .line 72
    :cond_2
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->L:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

    .line 73
    .line 74
    const/high16 v0, 0x41200000    # 10.0f

    .line 75
    .line 76
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 77
    .line 78
    .line 79
    move-result v2

    .line 80
    invoke-static {p1, v2}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 81
    .line 82
    .line 83
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->K:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

    .line 84
    .line 85
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    invoke-static {p1, v0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 90
    .line 91
    .line 92
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->Q:Landroid/view/View;

    .line 93
    .line 94
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 95
    .line 96
    .line 97
    return-void
.end method

.method public setAlpha(F)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setCardViewBackgroundResource(I)V
    .locals 0
    .param p1    # I
        .annotation build Landroidx/annotation/DrawableRes;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->D:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setExpandedScrollListener(Ll/atl;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->I0:Z

    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->V:Ll/atl;

    .line 5
    .line 6
    return-void
.end method

.method public setPageHelper(Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard$d;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard$d;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    return-void
.end method

.method public setTwoFingerHelper(Ll/qmj0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->D:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->setTwoFingerHelper(Ll/qmj0;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public bridge synthetic setUndoClickAction(Ll/x20;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/q7m;->setUndoClickAction(Ll/x20;)V

    return-void
.end method

.method public setUsHomeCardAnimHelper(Ll/fqj0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public t()Landroid/view/ViewStub;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->S:Landroid/view/ViewStub;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic t1(Landroid/util/Pair;)V
    .locals 3

    .line 1
    sget v0, Ll/qa00;->B:I

    .line 2
    .line 3
    int-to-float v0, v0

    .line 4
    iget-object v1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 5
    .line 6
    check-cast v1, Ljava/lang/Float;

    .line 7
    .line 8
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    iget-object v2, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast v2, Ljava/lang/Float;

    .line 15
    .line 16
    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    sub-float/2addr v1, v2

    .line 21
    const/4 v2, 0x0

    .line 22
    invoke-static {v2, v1}, Ljava/lang/Math;->max(FF)F

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    mul-float/2addr v0, v1

    .line 27
    float-to-int v0, v0

    .line 28
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->D:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

    .line 29
    .line 30
    invoke-static {v1, v0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->D:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

    .line 34
    .line 35
    iget-object p1, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 36
    .line 37
    check-cast p1, Ljava/lang/Float;

    .line 38
    .line 39
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->r1(F)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public u1()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->getRootView()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-lez v0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->getRootView()Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-gtz v0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->getRootView()Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->getRootView()Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    invoke-static {v1}, Ll/dox;->b(I)I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->getRootView()Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    invoke-static {v2}, Ll/dox;->b(I)I

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    invoke-virtual {v0, v1, v2}, Landroid/view/View;->measure(II)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->getRootView()Landroid/view/View;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->getRootView()Landroid/view/View;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-virtual {v1}, Landroid/view/View;->getLeft()I

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->getRootView()Landroid/view/View;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    invoke-virtual {v2}, Landroid/view/View;->getTop()I

    .line 70
    .line 71
    .line 72
    move-result v2

    .line 73
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->getRootView()Landroid/view/View;

    .line 74
    .line 75
    .line 76
    move-result-object v3

    .line 77
    invoke-virtual {v3}, Landroid/view/View;->getLeft()I

    .line 78
    .line 79
    .line 80
    move-result v3

    .line 81
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->getRootView()Landroid/view/View;

    .line 82
    .line 83
    .line 84
    move-result-object v4

    .line 85
    invoke-virtual {v4}, Landroid/view/View;->getWidth()I

    .line 86
    .line 87
    .line 88
    move-result v4

    .line 89
    add-int/2addr v3, v4

    .line 90
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->getRootView()Landroid/view/View;

    .line 91
    .line 92
    .line 93
    move-result-object v4

    .line 94
    invoke-virtual {v4}, Landroid/view/View;->getTop()I

    .line 95
    .line 96
    .line 97
    move-result v4

    .line 98
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->getRootView()Landroid/view/View;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 103
    .line 104
    .line 105
    move-result p0

    .line 106
    add-int/2addr v4, p0

    .line 107
    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/view/View;->layout(IIII)V

    .line 108
    .line 109
    .line 110
    :cond_1
    :goto_0
    return-void
.end method

.method public final v1(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->K:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->L:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->F:Lv/VFrame;

    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->renderFrom:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 18
    .line 19
    sget-object v0, Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;->CARD:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 20
    .line 21
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->M:Landroid/view/View;

    .line 22
    .line 23
    if-ne p1, v0, :cond_1

    .line 24
    .line 25
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->M:Landroid/view/View;

    .line 29
    .line 30
    if-eqz p2, :cond_0

    .line 31
    .line 32
    const/high16 p1, 0x3f800000    # 1.0f

    .line 33
    .line 34
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_0
    const/4 p1, 0x0

    .line 39
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_1
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public final w1(ILjava/lang/String;)V
    .locals 3

    .line 1
    invoke-static {p0}, Ll/bnl0;->E(Landroid/view/View;)Landroid/app/Activity;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    sget-object v1, Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;->INSTANCE:Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;

    .line 8
    .line 9
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;->l()Lrx/subjects/a;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->M0(Ll/ner;Lrx/c;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ll/ehk0;

    .line 18
    .line 19
    invoke-direct {v1, p0}, Ll/ehk0;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;)V

    .line 20
    .line 21
    .line 22
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->D:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

    .line 30
    .line 31
    const/4 v1, 0x0

    .line 32
    iput-object v1, v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->B:Ll/pf60;

    .line 33
    .line 34
    invoke-static {p0}, Ll/bnl0;->E(Landroid/view/View;)Landroid/app/Activity;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 39
    .line 40
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-interface {v1, p2}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->ao(Ljava/lang/String;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->M0(Ll/ner;Lrx/c;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    new-instance v1, Ll/ghk0;

    .line 53
    .line 54
    invoke-direct {v1, p0, p2}, Ll/ghk0;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    new-instance v2, Ll/hhk0;

    .line 58
    .line 59
    invoke-direct {v2}, Ll/hhk0;-><init>()V

    .line 60
    .line 61
    .line 62
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 67
    .line 68
    .line 69
    if-nez p1, :cond_0

    .line 70
    .line 71
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->D:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

    .line 72
    .line 73
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->o()Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->s()Z

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    xor-int/lit8 v1, v1, 0x1

    .line 82
    .line 83
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->setBlockScroll(Z)V

    .line 84
    .line 85
    .line 86
    new-instance v0, Ll/ihk0;

    .line 87
    .line 88
    invoke-direct {v0, p0}, Ll/ihk0;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;)V

    .line 89
    .line 90
    .line 91
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 92
    .line 93
    .line 94
    invoke-static {p0}, Ll/bnl0;->E(Landroid/view/View;)Landroid/app/Activity;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 99
    .line 100
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->o()Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->y()Lrx/c;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->M0(Ll/ner;Lrx/c;)Lrx/c;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    new-instance v1, Ll/jhk0;

    .line 113
    .line 114
    invoke-direct {v1, p0}, Ll/jhk0;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;)V

    .line 115
    .line 116
    .line 117
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 122
    .line 123
    .line 124
    invoke-static {p0}, Ll/bnl0;->E(Landroid/view/View;)Landroid/app/Activity;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 129
    .line 130
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->o()Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    invoke-virtual {v1, p2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->v(Ljava/lang/String;)Lrx/c;

    .line 135
    .line 136
    .line 137
    move-result-object p2

    .line 138
    invoke-virtual {p0, v0, p2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->M0(Ll/ner;Lrx/c;)Lrx/c;

    .line 139
    .line 140
    .line 141
    move-result-object p2

    .line 142
    new-instance v0, Ll/khk0;

    .line 143
    .line 144
    invoke-direct {v0, p0}, Ll/khk0;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;)V

    .line 145
    .line 146
    .line 147
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    invoke-virtual {p2, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 152
    .line 153
    .line 154
    invoke-static {p0}, Ll/bnl0;->E(Landroid/view/View;)Landroid/app/Activity;

    .line 155
    .line 156
    .line 157
    move-result-object p2

    .line 158
    check-cast p2, Lcom/p1/mobile/android/app/Act;

    .line 159
    .line 160
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->o()Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->y()Lrx/c;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    new-instance v1, Ll/lhk0;

    .line 169
    .line 170
    invoke-direct {v1}, Ll/lhk0;-><init>()V

    .line 171
    .line 172
    .line 173
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 174
    .line 175
    .line 176
    move-result-object v0

    .line 177
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 178
    .line 179
    .line 180
    move-result-object v0

    .line 181
    invoke-virtual {p0, p2, v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->M0(Ll/ner;Lrx/c;)Lrx/c;

    .line 182
    .line 183
    .line 184
    move-result-object p2

    .line 185
    new-instance v0, Ll/ahk0;

    .line 186
    .line 187
    invoke-direct {v0, p0}, Ll/ahk0;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;)V

    .line 188
    .line 189
    .line 190
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 191
    .line 192
    .line 193
    move-result-object v0

    .line 194
    invoke-virtual {p2, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 195
    .line 196
    .line 197
    sget p2, Ll/qa00;->B:I

    .line 198
    .line 199
    int-to-float p2, p2

    .line 200
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->o()Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;

    .line 201
    .line 202
    .line 203
    move-result-object v0

    .line 204
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->p()F

    .line 205
    .line 206
    .line 207
    move-result v0

    .line 208
    mul-float/2addr p2, v0

    .line 209
    float-to-int p2, p2

    .line 210
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->D:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

    .line 211
    .line 212
    invoke-static {v0, p2}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 213
    .line 214
    .line 215
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->C:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardClipBgView;

    .line 216
    .line 217
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardClipBgView;->setExtTop(I)V

    .line 218
    .line 219
    .line 220
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->z1()V

    .line 221
    .line 222
    .line 223
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->D:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

    .line 224
    .line 225
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->getScrollH()I

    .line 226
    .line 227
    .line 228
    move-result p2

    .line 229
    if-lez p2, :cond_2

    .line 230
    .line 231
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->o()Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;

    .line 232
    .line 233
    .line 234
    move-result-object p2

    .line 235
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->s()Z

    .line 236
    .line 237
    .line 238
    move-result p2

    .line 239
    if-nez p2, :cond_2

    .line 240
    .line 241
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->D:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

    .line 242
    .line 243
    sget-wide v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->h:J

    .line 244
    .line 245
    invoke-virtual {p2, v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->f0(J)V

    .line 246
    .line 247
    .line 248
    goto :goto_1

    .line 249
    :cond_0
    new-instance p2, Ll/bhk0;

    .line 250
    .line 251
    invoke-direct {p2}, Ll/bhk0;-><init>()V

    .line 252
    .line 253
    .line 254
    invoke-static {p0, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 255
    .line 256
    .line 257
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->o()Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;

    .line 258
    .line 259
    .line 260
    move-result-object p2

    .line 261
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->t()Z

    .line 262
    .line 263
    .line 264
    move-result p2

    .line 265
    if-eqz p2, :cond_1

    .line 266
    .line 267
    const/high16 p2, 0x42480000    # 50.0f

    .line 268
    .line 269
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 270
    .line 271
    .line 272
    move-result p2

    .line 273
    goto :goto_0

    .line 274
    :cond_1
    const/4 p2, 0x0

    .line 275
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->D:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

    .line 276
    .line 277
    invoke-static {v0, p2}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 278
    .line 279
    .line 280
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->C:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardClipBgView;

    .line 281
    .line 282
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardClipBgView;->setExtTop(I)V

    .line 283
    .line 284
    .line 285
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->D:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

    .line 286
    .line 287
    const/4 v0, 0x0

    .line 288
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->r1(F)V

    .line 289
    .line 290
    .line 291
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->D:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

    .line 292
    .line 293
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->getScrollH()I

    .line 294
    .line 295
    .line 296
    move-result p2

    .line 297
    if-lez p2, :cond_2

    .line 298
    .line 299
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->D:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

    .line 300
    .line 301
    sget-wide v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->h:J

    .line 302
    .line 303
    invoke-virtual {p2, v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->f0(J)V

    .line 304
    .line 305
    .line 306
    :cond_2
    :goto_1
    invoke-static {p0}, Ll/bnl0;->E(Landroid/view/View;)Landroid/app/Activity;

    .line 307
    .line 308
    .line 309
    move-result-object p2

    .line 310
    check-cast p2, Lcom/p1/mobile/android/app/Act;

    .line 311
    .line 312
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->o()Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;

    .line 313
    .line 314
    .line 315
    move-result-object v0

    .line 316
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->y()Lrx/c;

    .line 317
    .line 318
    .line 319
    move-result-object v0

    .line 320
    new-instance v1, Ll/chk0;

    .line 321
    .line 322
    invoke-direct {v1}, Ll/chk0;-><init>()V

    .line 323
    .line 324
    .line 325
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 326
    .line 327
    .line 328
    move-result-object v0

    .line 329
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 330
    .line 331
    .line 332
    move-result-object v0

    .line 333
    invoke-virtual {p0, p2, v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->M0(Ll/ner;Lrx/c;)Lrx/c;

    .line 334
    .line 335
    .line 336
    move-result-object p2

    .line 337
    new-instance v0, Ll/fhk0;

    .line 338
    .line 339
    invoke-direct {v0, p0, p1}, Ll/fhk0;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;I)V

    .line 340
    .line 341
    .line 342
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 343
    .line 344
    .line 345
    move-result-object p0

    .line 346
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 347
    .line 348
    .line 349
    return-void
.end method

.method public x(Lcom/p1/mobile/putong/core/data/SwipeDirection;Lcom/p1/mobile/putong/core/newui/home/opt/CardSwipeOutState;Z)V
    .locals 0

    .line 1
    if-eqz p3, :cond_0

    .line 2
    .line 3
    sget-object p3, Lcom/p1/mobile/putong/core/newui/home/opt/CardSwipeOutState;->PASS:Lcom/p1/mobile/putong/core/newui/home/opt/CardSwipeOutState;

    .line 4
    .line 5
    if-ne p2, p3, :cond_0

    .line 6
    .line 7
    sget-object p3, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 8
    .line 9
    if-ne p1, p3, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->L:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

    .line 12
    .line 13
    const/4 p3, 0x4

    .line 14
    invoke-virtual {p1, p3}, Landroid/view/View;->setVisibility(I)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->K:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

    .line 18
    .line 19
    invoke-virtual {p1, p3}, Landroid/view/View;->setVisibility(I)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->F:Lv/VFrame;

    .line 23
    .line 24
    const/4 p3, 0x0

    .line 25
    invoke-virtual {p1, p3}, Landroid/view/View;->setVisibility(I)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->G:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

    .line 29
    .line 30
    invoke-virtual {p1, p3}, Landroid/view/View;->setVisibility(I)V

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->G:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

    .line 34
    .line 35
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;->i()V

    .line 36
    .line 37
    .line 38
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/opt/CardSwipeOutState;->PASS:Lcom/p1/mobile/putong/core/newui/home/opt/CardSwipeOutState;

    .line 39
    .line 40
    if-ne p2, p1, :cond_1

    .line 41
    .line 42
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->h1()V

    .line 43
    .line 44
    .line 45
    :cond_1
    return-void
.end method

.method public x1()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->w:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-static {}, Ll/gra;->N3()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_1
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->J0:I

    .line 14
    .line 15
    if-eqz v0, :cond_2

    .line 16
    .line 17
    :goto_0
    return-void

    .line 18
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/opt/SwipeState;->START_MOVING:Lcom/p1/mobile/putong/core/newui/home/opt/SwipeState;

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    invoke-virtual {p0, p0, v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->D0(Landroid/view/View;Lcom/p1/mobile/putong/core/newui/home/opt/SwipeState;Z)V

    .line 22
    .line 23
    .line 24
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/opt/SwipeState;->START_BACK:Lcom/p1/mobile/putong/core/newui/home/opt/SwipeState;

    .line 25
    .line 26
    invoke-virtual {p0, p0, v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->D0(Landroid/view/View;Lcom/p1/mobile/putong/core/newui/home/opt/SwipeState;Z)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public y()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->D:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->y()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final y1(Landroid/view/View;Lcom/p1/mobile/putong/core/newui/home/opt/SwipeState;Z)V
    .locals 10

    .line 1
    invoke-static {}, Ll/gra;->Z2()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->r3()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/opt/SwipeState;->FINISH_OUT:Lcom/p1/mobile/putong/core/newui/home/opt/SwipeState;

    .line 18
    .line 19
    if-ne p2, p1, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/view/View;->getTranslationX()F

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    const/4 p2, 0x0

    .line 26
    cmpl-float p1, p1, p2

    .line 27
    .line 28
    if-lez p1, :cond_0

    .line 29
    .line 30
    invoke-virtual {p0}, Landroid/view/View;->getRotation()F

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    const/high16 p2, 0x43340000    # 180.0f

    .line 35
    .line 36
    div-float/2addr p1, p2

    .line 37
    float-to-double p1, p1

    .line 38
    const-wide v0, 0x400921fb54442d18L    # Math.PI

    .line 39
    .line 40
    .line 41
    .line 42
    .line 43
    mul-double/2addr p1, v0

    .line 44
    double-to-float p1, p1

    .line 45
    const/high16 p2, 0x3f800000    # 1.0f

    .line 46
    .line 47
    mul-float/2addr p1, p2

    .line 48
    invoke-virtual {p0}, Landroid/view/View;->getPivotX()F

    .line 49
    .line 50
    .line 51
    move-result p2

    .line 52
    invoke-virtual {p0}, Landroid/view/View;->getPivotY()F

    .line 53
    .line 54
    .line 55
    move-result p3

    .line 56
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    div-int/lit8 v0, v0, 0x2

    .line 61
    .line 62
    int-to-float v0, v0

    .line 63
    sub-float/2addr v0, p2

    .line 64
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    div-int/lit8 v1, v1, 0x2

    .line 69
    .line 70
    int-to-float v1, v1

    .line 71
    sub-float/2addr v1, p3

    .line 72
    float-to-double v2, v0

    .line 73
    float-to-double v4, p1

    .line 74
    invoke-static {v4, v5}, Ljava/lang/Math;->cos(D)D

    .line 75
    .line 76
    .line 77
    move-result-wide v6

    .line 78
    mul-double/2addr v6, v2

    .line 79
    invoke-static {v4, v5}, Ljava/lang/Math;->sin(D)D

    .line 80
    .line 81
    .line 82
    move-result-wide v8

    .line 83
    float-to-double v0, v1

    .line 84
    mul-double/2addr v8, v0

    .line 85
    sub-double/2addr v6, v8

    .line 86
    invoke-static {v4, v5}, Ljava/lang/Math;->sin(D)D

    .line 87
    .line 88
    .line 89
    move-result-wide v8

    .line 90
    mul-double/2addr v2, v8

    .line 91
    invoke-static {v4, v5}, Ljava/lang/Math;->cos(D)D

    .line 92
    .line 93
    .line 94
    move-result-wide v4

    .line 95
    mul-double/2addr v4, v0

    .line 96
    add-double/2addr v2, v4

    .line 97
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 98
    .line 99
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 100
    .line 101
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->H0:Lcom/p1/mobile/putong/data/User;

    .line 102
    .line 103
    float-to-double v4, p2

    .line 104
    add-double/2addr v6, v4

    .line 105
    double-to-int p2, v6

    .line 106
    const/high16 v1, 0x41f00000    # 30.0f

    .line 107
    .line 108
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 109
    .line 110
    .line 111
    move-result v4

    .line 112
    sub-int/2addr p2, v4

    .line 113
    int-to-float p2, p2

    .line 114
    invoke-virtual {p0}, Landroid/view/View;->getTranslationX()F

    .line 115
    .line 116
    .line 117
    move-result v4

    .line 118
    add-float/2addr p2, v4

    .line 119
    float-to-double v4, p3

    .line 120
    add-double/2addr v2, v4

    .line 121
    double-to-int p3, v2

    .line 122
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 123
    .line 124
    .line 125
    move-result v1

    .line 126
    sub-int/2addr p3, v1

    .line 127
    int-to-float p3, p3

    .line 128
    invoke-virtual {p0}, Landroid/view/View;->getTranslationY()F

    .line 129
    .line 130
    .line 131
    move-result p0

    .line 132
    add-float/2addr p3, p0

    .line 133
    invoke-virtual {p1, v0, p2, p3}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->A3(Lcom/p1/mobile/putong/data/User;FF)V

    .line 134
    .line 135
    .line 136
    :cond_0
    return-void
.end method

.method public z()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->D:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedBaseLayout;->z()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final z1()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->o()Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->n()Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper$b;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper$b;->d()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->o()Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->n()Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper$b;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper$b;->c()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->L:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

    .line 26
    .line 27
    invoke-static {v2, v0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 28
    .line 29
    .line 30
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->K:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

    .line 31
    .line 32
    invoke-static {v2, v0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 33
    .line 34
    .line 35
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->F:Lv/VFrame;

    .line 36
    .line 37
    invoke-static {v2, v0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->F:Lv/VFrame;

    .line 41
    .line 42
    invoke-static {v0, v1}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->L:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

    .line 46
    .line 47
    invoke-static {v0, v1}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 48
    .line 49
    .line 50
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->K:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

    .line 51
    .line 52
    const/high16 v0, 0x42480000    # 50.0f

    .line 53
    .line 54
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    invoke-static {p0, v0}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 59
    .line 60
    .line 61
    return-void
.end method
