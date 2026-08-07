.class public Ll/pio;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/uho;",
        ">;"
    }
.end annotation


# instance fields
.field public A:Ll/lli;

.field public final B:Ll/ft5;

.field public C:Ll/tgo;

.field public D:Landroid/animation/Animator;

.field public E:Z

.field public F:Z

.field public G:I

.field public H:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/vli;",
            ">;"
        }
    .end annotation
.end field

.field public I:Ll/mgo;

.field public a:Lv/VFrame;

.field public b:Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;

.field public c:Lv/navigationbar/VNavigationBar;

.field public d:Landroid/widget/FrameLayout;

.field public e:Landroidx/coordinatorlayout/widget/CoordinatorLayout;

.field public f:Lcom/google/android/material/appbar/AppBarLayout;

.field public g:Landroid/widget/FrameLayout;

.field public h:Landroidx/recyclerview/widget/RecyclerView;

.field public i:Landroidx/recyclerview/widget/RecyclerView;

.field public j:Landroid/widget/LinearLayout;

.field public k:Lv/VImage;

.field public l:Lv/VText;

.field public m:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public n:Landroidx/constraintlayout/widget/Guideline;

.field public o:Landroid/widget/FrameLayout;

.field public p:Lcom/p1/mobile/putong/core/newui/view/RadarRipple;

.field public q:Lv/VDraweeView;

.field public r:Lv/VText_NoTopPadding;

.field public s:Lv/VText_NoTopPadding;

.field public t:Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;

.field public u:Landroid/widget/FrameLayout;

.field public v:Lv/VText_NoTopPadding;

.field public w:Lcom/sunshine/engine/particle/SceneView;

.field public final x:Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlMeetLikersFrag;

.field public y:Ll/uho;

.field public z:Ll/hgo;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlMeetLikersFrag;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/ft5;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/ft5;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/pio;->B:Ll/ft5;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p0, Ll/pio;->E:Z

    .line 13
    .line 14
    iput-boolean v0, p0, Ll/pio;->F:Z

    .line 15
    .line 16
    iput v0, p0, Ll/pio;->G:I

    .line 17
    .line 18
    iput-object p1, p0, Ll/pio;->x:Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlMeetLikersFrag;

    .line 19
    .line 20
    return-void
.end method

.method public static I(Ljava/util/List;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/svl;",
            ">;)Z"
        }
    .end annotation

    .line 1
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    :cond_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_3

    .line 18
    .line 19
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Ll/svl;

    .line 24
    .line 25
    instance-of v2, v0, Ll/cio;

    .line 26
    .line 27
    if-nez v2, :cond_2

    .line 28
    .line 29
    instance-of v2, v0, Ll/oeo;

    .line 30
    .line 31
    if-nez v2, :cond_2

    .line 32
    .line 33
    instance-of v0, v0, Ll/aho;

    .line 34
    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    :cond_2
    const/4 p0, 0x1

    .line 38
    return p0

    .line 39
    :cond_3
    return v1
.end method

.method private U()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/pio;->J()Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlMeetLikersFrag;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlMeetLikersFrag;->R4()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object v0, p0, Ll/pio;->c:Lv/navigationbar/VNavigationBar;

    .line 13
    .line 14
    iget-object v1, p0, Ll/pio;->x:Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlMeetLikersFrag;

    .line 15
    .line 16
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconAsBack(Landroid/app/Activity;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/pio;->c:Lv/navigationbar/VNavigationBar;

    .line 24
    .line 25
    sget v1, Ll/gbc0;->b:I

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconResource(I)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/pio;->c:Lv/navigationbar/VNavigationBar;

    .line 31
    .line 32
    const/4 v1, 0x0

    .line 33
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setRightIconClip(Z)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ll/pio;->x:Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlMeetLikersFrag;

    .line 37
    .line 38
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    iget-object v2, p0, Ll/pio;->c:Lv/navigationbar/VNavigationBar;

    .line 47
    .line 48
    invoke-virtual {v2}, Lv/navigationbar/VNavigationBar;->getRightIconContainer()Lv/VLinear;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-virtual {p0, v0, v2}, Ll/pio;->B(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {p0, v0}, Ll/pio;->z(Landroid/view/View;)V

    .line 57
    .line 58
    .line 59
    iget-object v2, p0, Ll/pio;->c:Lv/navigationbar/VNavigationBar;

    .line 60
    .line 61
    filled-new-array {v0}, [Landroid/view/View;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {v2, v0}, Lv/navigationbar/VNavigationBar;->z([Landroid/view/View;)V

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Ll/pio;->b:Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;

    .line 69
    .line 70
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;->getBoostButton()Landroid/view/View;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    new-instance v2, Ll/dio;

    .line 75
    .line 76
    invoke-direct {v2, p0}, Ll/dio;-><init>(Ll/pio;)V

    .line 77
    .line 78
    .line 79
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Ll/pio;->c:Lv/navigationbar/VNavigationBar;

    .line 83
    .line 84
    const/4 v2, 0x1

    .line 85
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 86
    .line 87
    .line 88
    iget-object p0, p0, Ll/pio;->a:Lv/VFrame;

    .line 89
    .line 90
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method private X()V
    .locals 4

    .line 1
    new-instance v0, Ll/hgo;

    .line 2
    .line 3
    iget-object v1, p0, Ll/pio;->y:Ll/uho;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/hgo;-><init>(Ll/uho;)V

    .line 6
    .line 7
    .line 8
    iput-object v0, p0, Ll/pio;->z:Ll/hgo;

    .line 9
    .line 10
    iget-object v0, p0, Ll/pio;->i:Landroidx/recyclerview/widget/RecyclerView;

    .line 11
    .line 12
    new-instance v1, Ll/qdk;

    .line 13
    .line 14
    sget v2, Ll/qa00;->h:I

    .line 15
    .line 16
    const/4 v3, 0x2

    .line 17
    invoke-direct {v1, v2, v3}, Ll/qdk;-><init>(II)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/pio;->i:Landroidx/recyclerview/widget/RecyclerView;

    .line 24
    .line 25
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 30
    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    new-instance v1, Ll/pio$a;

    .line 34
    .line 35
    invoke-direct {v1, p0, v0}, Ll/pio$a;-><init>(Ll/pio;Landroidx/recyclerview/widget/GridLayoutManager;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/GridLayoutManager;->v(Landroidx/recyclerview/widget/GridLayoutManager$c;)V

    .line 39
    .line 40
    .line 41
    :cond_0
    iget-object v0, p0, Ll/pio;->i:Landroidx/recyclerview/widget/RecyclerView;

    .line 42
    .line 43
    iget-object p0, p0, Ll/pio;->z:Ll/hgo;

    .line 44
    .line 45
    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public static synthetic a(Ll/pio;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pio;->e0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/pio;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pio;->Z()V

    return-void
.end method

.method public static synthetic c(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic d(Ll/pio;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pio;->a0(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic e(Ll/pio;Ll/vli;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/pio;->c0(Ll/vli;I)V

    return-void
.end method

.method public static synthetic f(Ll/pio;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pio;->d0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic i(Ll/pio;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/pio;->h0(ILandroid/view/View;)V

    return-void
.end method

.method public static synthetic j(Ll/pio;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pio;->i0()V

    return-void
.end method

.method public static synthetic k(Ll/pio;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pio;->t0()V

    return-void
.end method

.method public static synthetic l(Ll/pio;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pio;->f0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic m(Ll/pio;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pio;->g0()V

    return-void
.end method

.method public static synthetic n(Ll/pio;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pio;->b0()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic p(Ll/pio;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/pio;->E:Z

    return p0
.end method

.method private p0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pio;->I:Ll/mgo;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/mgo;->o()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public static bridge synthetic q(Ll/pio;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/pio;->F:Z

    return p0
.end method

.method public static bridge synthetic s(Ll/pio;)Ll/hgo;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pio;->z:Ll/hgo;

    return-object p0
.end method

.method public static bridge synthetic u(Ll/pio;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/pio;->G:I

    return p0
.end method

.method public static bridge synthetic v(Ll/pio;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/pio;->E:Z

    return-void
.end method

.method public static bridge synthetic w(Ll/pio;I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/pio;->G:I

    return-void
.end method

.method public static bridge synthetic x(Ll/pio;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pio;->O()V

    return-void
.end method

.method public static bridge synthetic y(Ll/pio;Landroid/view/View;Lcom/p1/mobile/putong/data/User;ZZ)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/pio;->Q(Landroid/view/View;Lcom/p1/mobile/putong/data/User;ZZ)V

    return-void
.end method


# virtual methods
.method public A(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/qio;->b(Ll/pio;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public B(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/rio;->b(Ll/pio;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final C()V
    .locals 2

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Oq()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ll/pio;->i:Landroidx/recyclerview/widget/RecyclerView;

    .line 16
    .line 17
    sget v1, Ll/qa00;->j:I

    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/bnl0;->f0(Landroid/view/View;I)V

    .line 20
    .line 21
    .line 22
    :cond_0
    iget-object v0, p0, Ll/pio;->g:Landroid/widget/FrameLayout;

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/pio;->J()Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlMeetLikersFrag;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlMeetLikersFrag;->R4()Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    if-eqz p0, :cond_1

    .line 33
    .line 34
    sget p0, Ll/qa00;->j:I

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    sget p0, Ll/qa00;->g:I

    .line 38
    .line 39
    :goto_0
    invoke-static {v0, p0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pio;->x:Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlMeetLikersFrag;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public E()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pio;->I:Ll/mgo;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance v0, Ll/mgo;

    .line 7
    .line 8
    iget-object v1, p0, Ll/pio;->x:Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlMeetLikersFrag;

    .line 9
    .line 10
    invoke-direct {v0, v1}, Ll/mgo;-><init>(Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlMeetLikersFrag;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Ll/pio;->I:Ll/mgo;

    .line 14
    .line 15
    iget-object p0, p0, Ll/pio;->d:Landroid/widget/FrameLayout;

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Ll/mgo;->g(Landroid/widget/FrameLayout;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public F(Ll/uho;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pio;->y:Ll/uho;

    .line 2
    .line 3
    return-void
.end method

.method public G(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pio;->C:Ll/tgo;

    .line 2
    .line 3
    iget-object p0, p0, Ll/pio;->x:Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlMeetLikersFrag;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {v0, p1, p0}, Ll/tgo;->t(ZLjava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public H()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pio;->C:Ll/tgo;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/tgo;->h()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public J()Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlMeetLikersFrag;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pio;->x:Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlMeetLikersFrag;

    .line 2
    .line 3
    return-object p0
.end method

.method public K()Ll/hgo;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pio;->z:Ll/hgo;

    .line 2
    .line 3
    return-object p0
.end method

.method public final L(Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeTurboItem;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pio;->z:Ll/hgo;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/pio;->x:Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlMeetLikersFrag;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeTurboItem;->l0(Lcom/p1/mobile/android/app/Act;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final M(Lcom/p1/mobile/putong/data/User;Z)V
    .locals 3

    .line 1
    invoke-virtual {p0, p1}, Ll/pio;->v0(Lcom/p1/mobile/putong/data/User;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Oq()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    const/4 v1, 0x0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {v0}, Ll/yio;->a(Ljava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    const-string v0, "superlike_tag"

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    move-object v0, v1

    .line 31
    :goto_0
    invoke-static {p1}, Ll/yio;->c(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {p1, p2, v0, v2}, Ll/yho;->r(Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_1
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 42
    .line 43
    invoke-static {p1, p2, v1, v1}, Ll/yho;->r(Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    :goto_1
    iget-object p1, p0, Ll/pio;->z:Ll/hgo;

    .line 47
    .line 48
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 49
    .line 50
    .line 51
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 52
    .line 53
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->p0:Ll/z99;

    .line 54
    .line 55
    invoke-virtual {p1}, Ll/z99;->h3()Z

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    iget-object p0, p0, Ll/pio;->y:Ll/uho;

    .line 60
    .line 61
    const-string p2, "p_intl_meet_view,e_intl_meet_see_users,click"

    .line 62
    .line 63
    if-eqz p1, :cond_2

    .line 64
    .line 65
    invoke-virtual {p0, p2, v1}, Ll/uho;->S0(Ljava/lang/String;Ll/y20;)V

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :cond_2
    invoke-virtual {p0, p2}, Ll/uho;->U0(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public final N(Lcom/p1/mobile/putong/data/User;ZZ)V
    .locals 3

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Oq()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 17
    .line 18
    invoke-static {v0}, Ll/yio;->a(Ljava/lang/String;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    const-string v1, "superlike_tag"

    .line 25
    .line 26
    :cond_0
    invoke-static {p1}, Ll/yio;->c(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget-object v2, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 31
    .line 32
    invoke-static {v2, p2, v1, v0}, Ll/yho;->r(Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 37
    .line 38
    invoke-static {v0, p2, v1, v1}, Ll/yho;->r(Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    :goto_0
    iget-object p0, p0, Ll/pio;->y:Ll/uho;

    .line 42
    .line 43
    invoke-virtual {p0, p1, p2, p3}, Ll/uho;->E(Lcom/p1/mobile/putong/data/User;ZZ)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public final O()V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/pio;->F:Z

    .line 3
    .line 4
    iget-object v0, p0, Ll/pio;->x:Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlMeetLikersFrag;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    new-instance v1, Ll/nio;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Ll/nio;-><init>(Ll/pio;)V

    .line 13
    .line 14
    .line 15
    invoke-static {v0, v1}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 16
    .line 17
    .line 18
    invoke-static {}, Ll/yho;->o()V

    .line 19
    .line 20
    .line 21
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->p0:Ll/z99;

    .line 24
    .line 25
    invoke-virtual {v0}, Ll/z99;->h3()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    iget-object v1, p0, Ll/pio;->y:Ll/uho;

    .line 30
    .line 31
    const-string v2, "p_intl_meet_view,e_intl_meet_view_swipe_bottom,click"

    .line 32
    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    new-instance v0, Ll/oio;

    .line 36
    .line 37
    invoke-direct {v0, p0}, Ll/oio;-><init>(Ll/pio;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v1, v2, v0}, Ll/uho;->S0(Ljava/lang/String;Ll/y20;)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_0
    new-instance v0, Ll/eio;

    .line 45
    .line 46
    invoke-direct {v0, p0}, Ll/eio;-><init>(Ll/pio;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v1, v2, v0}, Ll/uho;->V0(Ljava/lang/String;Ll/x20;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public P()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/pio;->t:Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;

    .line 2
    .line 3
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->qt()Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    const/4 v0, 0x1

    .line 22
    xor-int/2addr p0, v0

    .line 23
    invoke-static {v0, p0}, Ll/yho;->d(ZZ)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public final Q(Landroid/view/View;Lcom/p1/mobile/putong/data/User;ZZ)V
    .locals 1

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersItemView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0, p2, p3, p4}, Ll/pio;->N(Lcom/p1/mobile/putong/data/User;ZZ)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    instance-of p4, p1, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeTurboItem;

    .line 16
    .line 17
    if-eqz p4, :cond_1

    .line 18
    .line 19
    check-cast p1, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeTurboItem;

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Ll/pio;->L(Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeTurboItem;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    instance-of p1, p1, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeLikersItem;

    .line 26
    .line 27
    if-eqz p1, :cond_2

    .line 28
    .line 29
    invoke-virtual {p0, p2, p3}, Ll/pio;->M(Lcom/p1/mobile/putong/data/User;Z)V

    .line 30
    .line 31
    .line 32
    :cond_2
    return-void
.end method

.method public final R()V
    .locals 11

    .line 1
    new-instance v0, Ll/tgo;

    .line 2
    .line 3
    iget-object v1, p0, Ll/pio;->x:Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlMeetLikersFrag;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    iget-object v3, p0, Ll/pio;->t:Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;

    .line 10
    .line 11
    iget-object v4, p0, Ll/pio;->b:Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;

    .line 12
    .line 13
    iget-object v5, p0, Ll/pio;->v:Lv/VText_NoTopPadding;

    .line 14
    .line 15
    iget-object v6, p0, Ll/pio;->u:Landroid/widget/FrameLayout;

    .line 16
    .line 17
    iget-object v7, p0, Ll/pio;->w:Lcom/sunshine/engine/particle/SceneView;

    .line 18
    .line 19
    iget-object v8, p0, Ll/pio;->e:Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    .line 20
    .line 21
    iget-object v1, p0, Ll/pio;->i:Landroidx/recyclerview/widget/RecyclerView;

    .line 22
    .line 23
    invoke-virtual {v1}, Landroid/view/View;->getRootView()Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    move-object v9, v1

    .line 28
    check-cast v9, Landroid/view/ViewGroup;

    .line 29
    .line 30
    iget-object v10, p0, Ll/pio;->a:Lv/VFrame;

    .line 31
    .line 32
    move-object v1, p0

    .line 33
    invoke-direct/range {v0 .. v10}, Ll/tgo;-><init>(Ll/pio;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;Lv/VText_NoTopPadding;Landroid/widget/FrameLayout;Lcom/sunshine/engine/particle/SceneView;Landroid/view/ViewGroup;Landroid/view/ViewGroup;Landroid/view/View;)V

    .line 34
    .line 35
    .line 36
    iput-object v0, v1, Ll/pio;->C:Ll/tgo;

    .line 37
    .line 38
    iget-object p0, v1, Ll/pio;->t:Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;

    .line 39
    .line 40
    new-instance v0, Ll/mio;

    .line 41
    .line 42
    invoke-direct {v0, v1}, Ll/mio;-><init>(Ll/pio;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;->setFromCallback(Ll/pcj;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public final S()V
    .locals 3

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Oq()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iget-object v1, p0, Ll/pio;->g:Landroid/widget/FrameLayout;

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x0

    .line 18
    invoke-static {v1, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    const/4 v0, 0x1

    .line 23
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 24
    .line 25
    .line 26
    iget-object v1, p0, Ll/pio;->H:Ljava/util/List;

    .line 27
    .line 28
    if-nez v1, :cond_1

    .line 29
    .line 30
    invoke-static {}, Ll/tli;->a()Ljava/util/List;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    iput-object v1, p0, Ll/pio;->H:Ljava/util/List;

    .line 35
    .line 36
    :cond_1
    new-instance v1, Ll/lli;

    .line 37
    .line 38
    invoke-direct {v1}, Ll/lli;-><init>()V

    .line 39
    .line 40
    .line 41
    iput-object v1, p0, Ll/pio;->A:Ll/lli;

    .line 42
    .line 43
    iget-object v2, p0, Ll/pio;->H:Ljava/util/List;

    .line 44
    .line 45
    invoke-virtual {v1, v2}, Ll/lli;->I(Ljava/util/List;)V

    .line 46
    .line 47
    .line 48
    iget-object v1, p0, Ll/pio;->A:Ll/lli;

    .line 49
    .line 50
    new-instance v2, Ll/gio;

    .line 51
    .line 52
    invoke-direct {v2, p0}, Ll/gio;-><init>(Ll/pio;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v1, v2}, Ll/lli;->J(Ll/lli$a;)V

    .line 56
    .line 57
    .line 58
    iget-object v1, p0, Ll/pio;->h:Landroidx/recyclerview/widget/RecyclerView;

    .line 59
    .line 60
    iget-object p0, p0, Ll/pio;->A:Ll/lli;

    .line 61
    .line 62
    invoke-virtual {v1, p0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 63
    .line 64
    .line 65
    const/4 p0, 0x0

    .line 66
    invoke-static {v0, p0}, Ll/yho;->e(ZLjava/lang/String;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public final T()V
    .locals 3

    .line 1
    new-instance v0, Landroidx/recyclerview/widget/k;

    .line 2
    .line 3
    new-instance v1, Ll/bio;

    .line 4
    .line 5
    new-instance v2, Ll/pio$b;

    .line 6
    .line 7
    invoke-direct {v2, p0}, Ll/pio$b;-><init>(Ll/pio;)V

    .line 8
    .line 9
    .line 10
    invoke-direct {v1, v2}, Ll/bio;-><init>(Ll/bio$a;)V

    .line 11
    .line 12
    .line 13
    invoke-direct {v0, v1}, Landroidx/recyclerview/widget/k;-><init>(Landroidx/recyclerview/widget/k$e;)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ll/pio;->i:Landroidx/recyclerview/widget/RecyclerView;

    .line 17
    .line 18
    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/k;->g(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final V()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/pio;->s:Lv/VText_NoTopPadding;

    .line 2
    .line 3
    iget-object v1, p0, Ll/pio;->x:Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlMeetLikersFrag;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    sget v2, Lcom/p1/mobile/putong/core/member/R$string;->g1:I

    .line 10
    .line 11
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 16
    .line 17
    .line 18
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->p0:Ll/z99;

    .line 21
    .line 22
    invoke-virtual {v0}, Ll/z99;->h3()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    iget-object v1, p0, Ll/pio;->s:Lv/VText_NoTopPadding;

    .line 27
    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    sget v0, Ll/gbc0;->Q:I

    .line 31
    .line 32
    invoke-virtual {v1, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Ll/pio;->s:Lv/VText_NoTopPadding;

    .line 36
    .line 37
    const-string v1, "#000000"

    .line 38
    .line 39
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Ll/pio;->s:Lv/VText_NoTopPadding;

    .line 47
    .line 48
    new-instance v1, Ll/hio;

    .line 49
    .line 50
    invoke-direct {v1, p0}, Ll/hio;-><init>(Ll/pio;)V

    .line 51
    .line 52
    .line 53
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_0
    sget v0, Ll/gbc0;->P:I

    .line 58
    .line 59
    invoke-virtual {v1, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Ll/pio;->s:Lv/VText_NoTopPadding;

    .line 63
    .line 64
    new-instance v1, Ll/iio;

    .line 65
    .line 66
    invoke-direct {v1, p0}, Ll/iio;-><init>(Ll/pio;)V

    .line 67
    .line 68
    .line 69
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public final W()V
    .locals 3

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/pio;->q:Lv/VDraweeView;

    .line 4
    .line 5
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 8
    .line 9
    invoke-virtual {v2}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/pio;->p:Lcom/p1/mobile/putong/core/newui/view/RadarRipple;

    .line 29
    .line 30
    sget-object v1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 31
    .line 32
    sget v2, Ll/f9c0;->d:I

    .line 33
    .line 34
    invoke-virtual {v1, v2}, Landroid/content/Context;->getColor(I)I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/view/RadarRipple;->setRadarColor(I)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Ll/pio;->p:Lcom/p1/mobile/putong/core/newui/view/RadarRipple;

    .line 42
    .line 43
    iget-object v1, p0, Ll/pio;->q:Lv/VDraweeView;

    .line 44
    .line 45
    invoke-static {v0, v1}, Ll/lny;->b(Lcom/p1/mobile/putong/core/newui/view/RadarRipple;Lv/VDraweeView;)Landroid/animation/Animator;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    iput-object v0, p0, Ll/pio;->D:Landroid/animation/Animator;

    .line 50
    .line 51
    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public final Y()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pio;->i:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    new-instance v1, Ll/pio$c;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/pio$c;-><init>(Ll/pio;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->addOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$t;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic Z()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pio;->i:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->stopScroll()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic a0(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pio;->t0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic b0()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/pio;->J()Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlMeetLikersFrag;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlMeetLikersFrag;->R4()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const-string p0, "p_intl_meet_view,e_boost_button,click"

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    const-string v0, "from"

    .line 39
    .line 40
    invoke-virtual {p0, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    goto :goto_0

    .line 45
    :cond_1
    const/4 p0, 0x0

    .line 46
    :goto_0
    const-string v0, "tabMessage"

    .line 47
    .line 48
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    if-eqz p0, :cond_2

    .line 53
    .line 54
    const-string p0, "p_intl_message_plm,e_boost_button,click"

    .line 55
    .line 56
    return-object p0

    .line 57
    :cond_2
    const-string p0, "p_intl_plm,e_boost_button,click"

    .line 58
    .line 59
    return-object p0
.end method

.method public final synthetic c0(Ll/vli;I)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iget-object v1, p1, Ll/vli;->a:Ljava/lang/String;

    .line 3
    .line 4
    invoke-static {v0, v1}, Ll/yho;->e(ZLjava/lang/String;)V

    .line 5
    .line 6
    .line 7
    if-eqz p2, :cond_3

    .line 8
    .line 9
    invoke-static {}, Ll/joa;->i4()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_3

    .line 14
    .line 15
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->p0:Ll/z99;

    .line 18
    .line 19
    invoke-virtual {p1}, Ll/z99;->h3()Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    iget-object p2, p0, Ll/pio;->y:Ll/uho;

    .line 24
    .line 25
    const-string v0, "p_intl_plm,e_intl_see_filter_click,click"

    .line 26
    .line 27
    const-string v1, "p_intl_meet_view,e_intl_see_filter_click,click"

    .line 28
    .line 29
    if-eqz p1, :cond_1

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/pio;->J()Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlMeetLikersFrag;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlMeetLikersFrag;->R4()Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    if-eqz p0, :cond_0

    .line 40
    .line 41
    move-object v0, v1

    .line 42
    :cond_0
    const/4 p0, 0x0

    .line 43
    invoke-virtual {p2, v0, p0}, Ll/uho;->S0(Ljava/lang/String;Ll/y20;)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_1
    invoke-virtual {p0}, Ll/pio;->J()Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlMeetLikersFrag;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlMeetLikersFrag;->R4()Z

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    if-eqz p0, :cond_2

    .line 56
    .line 57
    move-object v0, v1

    .line 58
    :cond_2
    invoke-virtual {p2, v0}, Ll/uho;->U0(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_3
    iget-object v0, p0, Ll/pio;->y:Ll/uho;

    .line 63
    .line 64
    invoke-virtual {v0}, Ll/uho;->x0()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    iget-object p1, p1, Ll/vli;->a:Ljava/lang/String;

    .line 69
    .line 70
    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 71
    .line 72
    .line 73
    move-result p1

    .line 74
    if-eqz p1, :cond_4

    .line 75
    .line 76
    return-void

    .line 77
    :cond_4
    invoke-virtual {p0, p2}, Ll/pio;->k0(I)V

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method public final synthetic d0(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p1, p0, Ll/pio;->x:Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlMeetLikersFrag;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-static {p1}, Ll/yho;->i(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iget-object p0, p0, Ll/pio;->x:Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlMeetLikersFrag;

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const-string v0, "p_intl_plm,e_intl_plm_turbo_button,click"

    .line 29
    .line 30
    const/4 v1, 0x0

    .line 31
    const/4 v2, 0x0

    .line 32
    invoke-interface {p1, p0, v2, v0, v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Hb(Lcom/p1/mobile/android/app/Act;ZLjava/lang/String;Ll/x20;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public destroy()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pio;->I:Ll/mgo;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/mgo;->i()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Ll/pio;->I:Ll/mgo;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Ll/pio;->B:Ll/ft5;

    .line 12
    .line 13
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Ll/pio;->y0()V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Ll/pio;->C:Ll/tgo;

    .line 20
    .line 21
    if-eqz p0, :cond_1

    .line 22
    .line 23
    iget-object p0, p0, Ll/tgo;->k:Ljava/lang/Runnable;

    .line 24
    .line 25
    if-eqz p0, :cond_1

    .line 26
    .line 27
    invoke-static {p0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 28
    .line 29
    .line 30
    :cond_1
    return-void
.end method

.method public final synthetic e0(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/yho;->q()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/pio;->y:Ll/uho;

    .line 5
    .line 6
    const-string p1, "p_intl_meet_view,e_intl_meet_see_unlock_btn,click"

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-virtual {p0, p1, v0}, Ll/uho;->S0(Ljava/lang/String;Ll/y20;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic f0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/yho;->q()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/pio;->y:Ll/uho;

    .line 5
    .line 6
    const-string p1, "p_intl_meet_view,e_intl_meet_see_unlock_btn,click"

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/uho;->U0(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic g0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pio;->z:Ll/hgo;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/hgo;->R()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic h0(ILandroid/view/View;)V
    .locals 2

    .line 1
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/data/User;->new_()Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "intlSeeListAd"

    .line 12
    .line 13
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 14
    .line 15
    iput-object v1, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 16
    .line 17
    iget-object p0, p0, Ll/pio;->z:Ll/hgo;

    .line 18
    .line 19
    new-instance v1, Ll/keo;

    .line 20
    .line 21
    invoke-direct {v1, v0}, Ll/keo;-><init>(Lcom/p1/mobile/putong/data/User;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, v1, p1, p2}, Ll/hgo;->J(Ll/keo;ILandroid/view/View;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public final synthetic i0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pio;->i:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->smoothScrollToPosition(I)V

    .line 5
    .line 6
    .line 7
    iput-boolean v1, p0, Ll/pio;->F:Z

    .line 8
    .line 9
    iput v1, p0, Ll/pio;->G:I

    .line 10
    .line 11
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/uho;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/pio;->F(Ll/uho;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/pio;->A(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public j0(Ljava/util/ArrayList;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ll/svl;",
            ">;)V"
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
    goto :goto_1

    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    instance-of v0, v0, Ll/aho;

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    const/4 v0, 0x5

    .line 18
    goto :goto_0

    .line 19
    :cond_1
    const/4 v0, 0x3

    .line 20
    :goto_0
    iget-object v1, p0, Ll/pio;->z:Ll/hgo;

    .line 21
    .line 22
    iget-object v1, v1, Ll/hgo;->f:Ll/keo;

    .line 23
    .line 24
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-eqz v1, :cond_2

    .line 29
    .line 30
    iget-object p0, p0, Ll/pio;->z:Ll/hgo;

    .line 31
    .line 32
    iget-object p0, p0, Ll/hgo;->f:Ll/keo;

    .line 33
    .line 34
    invoke-virtual {p1, v0, p0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_2
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 39
    .line 40
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    iget-object v1, p0, Ll/pio;->x:Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlMeetLikersFrag;

    .line 45
    .line 46
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    new-instance v2, Ll/jio;

    .line 51
    .line 52
    invoke-direct {v2, p0}, Ll/jio;-><init>(Ll/pio;)V

    .line 53
    .line 54
    .line 55
    invoke-interface {p1, v1, v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->x8(Lcom/p1/mobile/android/app/Act;Ll/x20;)Lrx/c;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    if-eqz v1, :cond_3

    .line 64
    .line 65
    new-instance v1, Ll/kio;

    .line 66
    .line 67
    invoke-direct {v1, p0, v0}, Ll/kio;-><init>(Ll/pio;I)V

    .line 68
    .line 69
    .line 70
    new-instance v0, Ll/lio;

    .line 71
    .line 72
    invoke-direct {v0}, Ll/lio;-><init>()V

    .line 73
    .line 74
    .line 75
    invoke-static {v1, v0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    iget-object p0, p0, Ll/pio;->B:Ll/ft5;

    .line 84
    .line 85
    invoke-virtual {p0, p1}, Ll/ft5;->a(Ll/kcg0;)V

    .line 86
    .line 87
    .line 88
    :cond_3
    :goto_1
    return-void
.end method

.method public k0(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pio;->A:Ll/lli;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/lli;->K(I)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/pio;->y:Ll/uho;

    .line 7
    .line 8
    iget-object p0, p0, Ll/pio;->H:Ljava/util/List;

    .line 9
    .line 10
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    check-cast p0, Ll/vli;

    .line 15
    .line 16
    iget-object p0, p0, Ll/vli;->a:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v0, p0}, Ll/uho;->Q0(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public l0(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    return-void
.end method

.method public m0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pio;->I:Ll/mgo;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/mgo;->m()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public n0(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/pio;->u0()V

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    invoke-virtual {p0}, Ll/pio;->o0()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final o0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pio;->D:Landroid/animation/Animator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/Animator;->isRunning()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/pio;->D:Landroid/animation/Animator;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/animation/Animator;->pause()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public q0(Ljava/util/List;Z)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/svl;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/pio;->y0()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/pio;->z:Ll/hgo;

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    const/4 v2, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {v0, p1, p2}, Ll/hgo;->T(Ljava/util/List;Z)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz p2, :cond_0

    .line 15
    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    iget-object p2, p0, Ll/pio;->i:Landroidx/recyclerview/widget/RecyclerView;

    .line 19
    .line 20
    invoke-virtual {p2, v2}, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V

    .line 21
    .line 22
    .line 23
    iget-object p2, p0, Ll/pio;->f:Lcom/google/android/material/appbar/AppBarLayout;

    .line 24
    .line 25
    invoke-virtual {p2, v1, v1}, Lcom/google/android/material/appbar/AppBarLayout;->setExpanded(ZZ)V

    .line 26
    .line 27
    .line 28
    :cond_0
    invoke-static {p1}, Ll/pio;->I(Ljava/util/List;)Z

    .line 29
    .line 30
    .line 31
    move-result p2

    .line 32
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-nez p1, :cond_2

    .line 37
    .line 38
    iget-object p1, p0, Ll/pio;->I:Ll/mgo;

    .line 39
    .line 40
    if-eqz p1, :cond_1

    .line 41
    .line 42
    invoke-virtual {p1, p2}, Ll/mgo;->p(Z)V

    .line 43
    .line 44
    .line 45
    :cond_1
    iget-object p1, p0, Ll/pio;->j:Landroid/widget/LinearLayout;

    .line 46
    .line 47
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Ll/pio;->m:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 51
    .line 52
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0, v1}, Ll/pio;->w0(Z)V

    .line 56
    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_2
    invoke-virtual {p0, v2}, Ll/pio;->w0(Z)V

    .line 60
    .line 61
    .line 62
    iget-object p1, p0, Ll/pio;->f:Lcom/google/android/material/appbar/AppBarLayout;

    .line 63
    .line 64
    if-eqz p1, :cond_3

    .line 65
    .line 66
    invoke-virtual {p1, v1, v1}, Lcom/google/android/material/appbar/AppBarLayout;->setExpanded(ZZ)V

    .line 67
    .line 68
    .line 69
    :cond_3
    iget-object p1, p0, Ll/pio;->I:Ll/mgo;

    .line 70
    .line 71
    if-eqz p1, :cond_4

    .line 72
    .line 73
    invoke-virtual {p1, v2}, Ll/mgo;->p(Z)V

    .line 74
    .line 75
    .line 76
    :cond_4
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Oq()Z

    .line 85
    .line 86
    .line 87
    move-result p1

    .line 88
    iget-object p2, p0, Ll/pio;->j:Landroid/widget/LinearLayout;

    .line 89
    .line 90
    if-eqz p1, :cond_5

    .line 91
    .line 92
    invoke-static {p2, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 93
    .line 94
    .line 95
    iget-object p1, p0, Ll/pio;->m:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 96
    .line 97
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {p0}, Ll/pio;->W()V

    .line 101
    .line 102
    .line 103
    goto :goto_0

    .line 104
    :cond_5
    invoke-static {p2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 105
    .line 106
    .line 107
    iget-object p1, p0, Ll/pio;->m:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 108
    .line 109
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 110
    .line 111
    .line 112
    :goto_0
    invoke-static {}, Ll/yho;->m()V

    .line 113
    .line 114
    .line 115
    :goto_1
    invoke-direct {p0}, Ll/pio;->p0()V

    .line 116
    .line 117
    .line 118
    return-void
.end method

.method public r()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/pio;->U()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/pio;->S()V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Ll/pio;->X()V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/pio;->T()V

    .line 17
    .line 18
    .line 19
    :cond_0
    invoke-virtual {p0}, Ll/pio;->Y()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ll/pio;->V()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Ll/pio;->R()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Ll/pio;->C()V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Ll/pio;->E()V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public r0(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pio;->s:Lv/VText_NoTopPadding;

    .line 2
    .line 3
    xor-int/lit8 v1, p1, 0x1

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/pio;->C:Ll/tgo;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/tgo;->k()V

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 v1, 0x0

    .line 19
    invoke-virtual {v0, v1}, Ll/tgo;->g(Z)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/pio;->C:Ll/tgo;

    .line 23
    .line 24
    invoke-virtual {v0}, Ll/tgo;->j()V

    .line 25
    .line 26
    .line 27
    :goto_0
    iget-object v0, p0, Ll/pio;->C:Ll/tgo;

    .line 28
    .line 29
    invoke-virtual {v0, p1}, Ll/tgo;->v(Z)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Ll/pio;->C:Ll/tgo;

    .line 33
    .line 34
    invoke-virtual {p0, p1}, Ll/tgo;->u(Z)V

    .line 35
    .line 36
    .line 37
    :cond_1
    return-void
.end method

.method public s0(I)V
    .locals 3

    .line 1
    if-gtz p1, :cond_0

    .line 2
    .line 3
    sget-object p1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 4
    .line 5
    sget v0, Lcom/p1/mobile/putong/core/member/R$string;->Y0:I

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    goto :goto_1

    .line 12
    :cond_0
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 13
    .line 14
    sget v1, Lcom/p1/mobile/putong/core/member/R$string;->X0:I

    .line 15
    .line 16
    const/16 v2, 0x63

    .line 17
    .line 18
    if-le p1, v2, :cond_1

    .line 19
    .line 20
    const-string p1, "99+"

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    :goto_0
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {v0, v1, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    :goto_1
    iget-object p0, p0, Ll/pio;->c:Lv/navigationbar/VNavigationBar;

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Lv/navigationbar/VNavigationBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final t0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pio;->x:Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlMeetLikersFrag;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/fio;

    .line 8
    .line 9
    invoke-direct {v1, p0}, Ll/fio;-><init>(Ll/pio;)V

    .line 10
    .line 11
    .line 12
    invoke-static {v0, v1}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final u0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pio;->D:Landroid/animation/Animator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/Animator;->isPaused()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/pio;->m:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Ll/pio;->D:Landroid/animation/Animator;

    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/animation/Animator;->resume()V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public final v0(Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Oq()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    const/4 v0, 0x0

    .line 14
    if-eqz p0, :cond_1

    .line 15
    .line 16
    iget-object p0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 17
    .line 18
    invoke-static {p0}, Ll/yio;->a(Ljava/lang/String;)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-eqz p0, :cond_0

    .line 23
    .line 24
    const-string v0, "superlike_tag"

    .line 25
    .line 26
    :cond_0
    invoke-static {p1}, Ll/yio;->c(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-static {v0, p0}, Ll/yho;->l(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_1
    invoke-static {v0, v0}, Ll/yho;->l(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final w0(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pio;->g:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lcom/google/android/material/appbar/AppBarLayout$LayoutParams;

    .line 11
    .line 12
    if-eqz p1, :cond_1

    .line 13
    .line 14
    const/16 p1, 0x11

    .line 15
    .line 16
    invoke-virtual {v0, p1}, Lcom/google/android/material/appbar/AppBarLayout$LayoutParams;->setScrollFlags(I)V

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_1
    const/4 p1, 0x0

    .line 21
    invoke-virtual {v0, p1}, Lcom/google/android/material/appbar/AppBarLayout$LayoutParams;->setScrollFlags(I)V

    .line 22
    .line 23
    .line 24
    :goto_0
    iget-object p0, p0, Ll/pio;->g:Landroid/widget/FrameLayout;

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public x0(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pio;->C:Ll/tgo;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/tgo;->s(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final y0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pio;->D:Landroid/animation/Animator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Ll/pio;->D:Landroid/animation/Animator;

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public final z(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/rio;->a(Ll/pio;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
