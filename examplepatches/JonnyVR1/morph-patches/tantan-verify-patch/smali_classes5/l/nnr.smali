.class public Ll/nnr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;
.implements Ll/ewl;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Lcom/p1/mobile/putong/core/ui/vip/likers/c;",
        ">;",
        "Ll/ewl;"
    }
.end annotation


# instance fields
.field public A:Landroid/widget/TextView;

.field public B:Lcom/sunshine/engine/particle/SceneView;

.field public C:Landroid/widget/LinearLayout;

.field public D:Landroid/view/ViewStub;

.field public E:Landroid/widget/Button;

.field public F:Ljava/lang/Runnable;

.field public G:Ljava/lang/Runnable;

.field public H:Lcom/p1/mobile/putong/app/PutongAct;

.field public I:Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;

.field public J:Ljava/lang/Runnable;

.field public K:Lcom/p1/mobile/putong/core/ui/vip/likers/c;

.field public L:Lv/SimpleCoverGuideView;

.field public M:Lcom/p1/mobile/putong/core/ui/vip/likers/LikersAnimationMaskView;

.field public N:Z

.field public a:Lv/VFrame;

.field public b:Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;

.field public c:Lv/VFrame;

.field public d:Landroid/widget/RelativeLayout;

.field public e:Landroid/widget/RelativeLayout;

.field public f:Lv/VText_AutoFit;

.field public g:Lv/VImage;

.field public h:Landroid/widget/ImageView;

.field public i:Lv/navigationbar/VNavigationBar;

.field public j:Landroid/widget/FrameLayout;

.field public k:Landroid/widget/FrameLayout;

.field public l:Landroid/widget/LinearLayout;

.field public m:Lv/VImage;

.field public n:Lv/VText;

.field public o:Landroid/widget/LinearLayout;

.field public p:Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksHeaderView;

.field public q:Landroid/widget/LinearLayout;

.field public r:Lv/VProgressBar;

.field public s:Lv/VPullUpRecyclerView;

.field public t:Lv/VDraweeView;

.field public u:Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;

.field public v:Landroid/widget/FrameLayout;

.field public w:Landroid/widget/FrameLayout;

.field public x:Landroid/widget/TextView;

.field public y:Landroid/widget/LinearLayout;

.field public z:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/nnr;->N:Z

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/p1/mobile/putong/app/PutongAct;

    .line 12
    .line 13
    iput-object v0, p0, Ll/nnr;->H:Lcom/p1/mobile/putong/app/PutongAct;

    .line 14
    .line 15
    iput-object p1, p0, Ll/nnr;->I:Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;

    .line 16
    .line 17
    return-void
.end method

.method private synthetic K(Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p1, "e_see_list_feedback_button"

    .line 2
    .line 3
    const-string v0, "p_see_who_likes_me_view"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/nnr;->B()Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private Q()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/nnr;->H:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    const v1, 0x1020002

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, v1}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    new-instance v1, Ll/enr;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Ll/enr;-><init>(Ll/nnr;)V

    .line 13
    .line 14
    .line 15
    invoke-static {v0, v1}, Ll/bnl0;->b0(Landroid/view/View;Ll/pcj;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static synthetic b(Ll/nnr;Landroid/graphics/drawable/Drawable;Ljava/lang/CharSequence;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Boolean;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p6}, Ll/nnr;->M(Landroid/graphics/drawable/Drawable;Ljava/lang/CharSequence;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Boolean;)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic c(Ll/nnr;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nnr;->L(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Ll/nnr;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nnr;->O(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Ll/nnr;Landroid/view/View;Landroid/widget/TextView;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/nnr;->I(Landroid/view/View;Landroid/widget/TextView;)V

    return-void
.end method

.method public static synthetic f(Ll/nnr;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/nnr;->K(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic i()V
    .locals 8

    .line 1
    const-string v0, "tooltips_trigger_mode"

    .line 2
    .line 3
    const-string v1, "passive"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    const-string v0, "tooltips_type"

    .line 10
    .line 11
    const-string v1, "bubble"

    .line 12
    .line 13
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    const-string v0, "tooltips_type_ui"

    .line 18
    .line 19
    const-string v1, "bubble_basic_double_edge"

    .line 20
    .line 21
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object v4

    .line 25
    const-string v0, "tooltips_trigger_module"

    .line 26
    .line 27
    const-string v1, "boost_button"

    .line 28
    .line 29
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 30
    .line 31
    .line 32
    move-result-object v5

    .line 33
    const-string v0, "tooltips_trigger_page"

    .line 34
    .line 35
    const-string v1, "see_page"

    .line 36
    .line 37
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 38
    .line 39
    .line 40
    move-result-object v6

    .line 41
    const-string v0, "tooltips_trigger_reason"

    .line 42
    .line 43
    const-string v1, "guide"

    .line 44
    .line 45
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 46
    .line 47
    .line 48
    move-result-object v7

    .line 49
    filled-new-array/range {v2 .. v7}, [Ll/pf60;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    const-string v1, "e_bubble_boost_see_page_guide"

    .line 54
    .line 55
    const-string v2, "p_see_who_likes_me_view"

    .line 56
    .line 57
    invoke-static {v1, v2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public static synthetic j(Landroid/view/View;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    instance-of p0, p0, Landroidx/appcompat/view/menu/ActionMenuItemView;

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static synthetic k(Ll/nnr;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/nnr;->N()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic l(Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic m(Ll/nnr;Landroid/view/View;Landroid/widget/TextView;[I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/nnr;->J(Landroid/view/View;Landroid/widget/TextView;[I)V

    return-void
.end method

.method public static bridge synthetic n(Ll/nnr;)Lcom/p1/mobile/putong/app/PutongAct;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nnr;->H:Lcom/p1/mobile/putong/app/PutongAct;

    return-object p0
.end method


# virtual methods
.method public A(Landroid/view/Menu;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/nnr;->H:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getMenuInflater()Landroid/view/MenuInflater;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget v1, Ll/mfc0;->a:I

    .line 8
    .line 9
    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 10
    .line 11
    .line 12
    sget v0, Ll/ddc0;->r:I

    .line 13
    .line 14
    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-interface {p1}, Landroid/view/MenuItem;->getActionView()Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {p0, v0}, Ll/nnr;->q(Landroid/view/View;)V

    .line 23
    .line 24
    .line 25
    invoke-static {}, Lcom/p1/mobile/putong/core/member/module/CoreMemberModule;->F()Ll/ss9;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Ll/ss9;->b()Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-interface {v0, p0}, Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;->n9(Ll/nnr;)V

    .line 34
    .line 35
    .line 36
    const/4 v0, 0x2

    .line 37
    invoke-interface {p1, v0}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 38
    .line 39
    .line 40
    invoke-interface {p1}, Landroid/view/MenuItem;->getActionView()Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    new-instance v0, Ll/nnr$b;

    .line 45
    .line 46
    invoke-direct {v0, p0}, Ll/nnr$b;-><init>(Ll/nnr;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 50
    .line 51
    .line 52
    invoke-direct {p0}, Ll/nnr;->Q()V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public B()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/member/module/CoreMemberModule;->F()Ll/ss9;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/ss9;->b()Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object p0, p0, Ll/nnr;->H:Lcom/p1/mobile/putong/app/PutongAct;

    .line 10
    .line 11
    invoke-interface {v0, p0}, Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;->yk(Lcom/p1/mobile/android/app/Act;)V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x1

    .line 15
    return p0
.end method

.method public C()Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksHeaderView;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nnr;->s:Lv/VPullUpRecyclerView;

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
    iget-object p0, p0, Ll/nnr;->s:Lv/VPullUpRecyclerView;

    .line 10
    .line 11
    sget v0, Ll/ddc0;->z:I

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksHeaderView;

    .line 18
    .line 19
    return-object p0

    .line 20
    :cond_0
    iget-object p0, p0, Ll/nnr;->p:Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksHeaderView;

    .line 21
    .line 22
    return-object p0
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/nnr;->H:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public E()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/nnr;->x:Landroid/widget/TextView;

    .line 2
    .line 3
    const/16 v0, 0x8

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public F()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nnr;->h:Landroid/widget/ImageView;

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
    iget-object v0, p0, Ll/nnr;->h:Landroid/widget/ImageView;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Ll/nnr;->h:Landroid/widget/ImageView;

    .line 18
    .line 19
    const/16 v0, 0x8

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 22
    .line 23
    .line 24
    const/4 p0, 0x1

    .line 25
    return p0

    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    return p0
.end method

.method public G()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/nnr;->u:Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;

    .line 2
    .line 3
    new-instance v1, Ll/jnr;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/jnr;-><init>(Ll/nnr;)V

    .line 6
    .line 7
    .line 8
    new-instance v2, Ll/knr;

    .line 9
    .line 10
    invoke-direct {v2, p0}, Ll/knr;-><init>(Ll/nnr;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;->b(Ll/y20;Ll/vcj;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/nnr;->u:Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;

    .line 17
    .line 18
    iget-object p0, p0, Ll/nnr;->B:Lcom/sunshine/engine/particle/SceneView;

    .line 19
    .line 20
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;->setSceneView(Lcom/sunshine/engine/particle/SceneView;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public H(Ll/x20;)V
    .locals 3

    .line 1
    new-instance v0, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 2
    .line 3
    iget-object v1, p0, Ll/nnr;->H:Lcom/p1/mobile/putong/app/PutongAct;

    .line 4
    .line 5
    const/4 v2, 0x2

    .line 6
    invoke-direct {v0, v1, v2}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    .line 7
    .line 8
    .line 9
    new-instance v1, Ll/nnr$a;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/nnr$a;-><init>(Ll/nnr;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/GridLayoutManager;->v(Landroidx/recyclerview/widget/GridLayoutManager$c;)V

    .line 15
    .line 16
    .line 17
    iget-object v1, p0, Ll/nnr;->s:Lv/VPullUpRecyclerView;

    .line 18
    .line 19
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/nnr;->s:Lv/VPullUpRecyclerView;

    .line 23
    .line 24
    invoke-virtual {v0, p1}, Lv/VPullUpRecyclerView;->setOnPullUpListener(Ll/x20;)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Ll/nnr;->s:Lv/VPullUpRecyclerView;

    .line 28
    .line 29
    const-wide/16 v0, 0x12c

    .line 30
    .line 31
    invoke-virtual {p1, v0, v1}, Lv/VPullUpRecyclerView;->setPullUpInterval(J)V

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Ll/nnr;->s:Lv/VPullUpRecyclerView;

    .line 35
    .line 36
    iget-object v0, p0, Ll/nnr;->I:Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;

    .line 37
    .line 38
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;->P4()Lcom/p1/mobile/putong/core/ui/vip/likers/a;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 43
    .line 44
    .line 45
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    if-nez p1, :cond_0

    .line 50
    .line 51
    new-instance p1, Landroidx/recyclerview/widget/k;

    .line 52
    .line 53
    iget-object v0, p0, Ll/nnr;->I:Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;

    .line 54
    .line 55
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;->Q4()Landroidx/recyclerview/widget/k$e;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-direct {p1, v0}, Landroidx/recyclerview/widget/k;-><init>(Landroidx/recyclerview/widget/k$e;)V

    .line 60
    .line 61
    .line 62
    iget-object p0, p0, Ll/nnr;->s:Lv/VPullUpRecyclerView;

    .line 63
    .line 64
    invoke-virtual {p1, p0}, Landroidx/recyclerview/widget/k;->g(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 65
    .line 66
    .line 67
    :cond_0
    return-void
.end method

.method public final synthetic I(Landroid/view/View;Landroid/widget/TextView;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nnr;->j:Landroid/widget/FrameLayout;

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
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ll/nnr;->j:Landroid/widget/FrameLayout;

    .line 16
    .line 17
    invoke-virtual {p0, p2}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public final synthetic J(Landroid/view/View;Landroid/widget/TextView;[I)V
    .locals 2

    .line 1
    iget-object p3, p0, Ll/nnr;->j:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    invoke-static {p1, p3}, Ll/bnl0;->j0(Landroid/view/View;Landroid/view/View;)Ll/bnl0$g;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object p0, p0, Ll/nnr;->j:Landroid/widget/FrameLayout;

    .line 8
    .line 9
    invoke-static {p2, p0}, Ll/bnl0;->j0(Landroid/view/View;Landroid/view/View;)Ll/bnl0$g;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    iget p3, p1, Ll/bnl0$g;->a:I

    .line 14
    .line 15
    iget v0, p0, Ll/bnl0$g;->a:I

    .line 16
    .line 17
    sub-int/2addr p3, v0

    .line 18
    iget v0, p1, Ll/bnl0$g;->c:I

    .line 19
    .line 20
    iget v1, p0, Ll/bnl0$g;->c:I

    .line 21
    .line 22
    sub-int/2addr v0, v1

    .line 23
    div-int/lit8 v0, v0, 0x2

    .line 24
    .line 25
    add-int/2addr p3, v0

    .line 26
    int-to-float p3, p3

    .line 27
    iget p1, p1, Ll/bnl0$g;->b:I

    .line 28
    .line 29
    iget v0, p0, Ll/bnl0$g;->b:I

    .line 30
    .line 31
    sub-int/2addr p1, v0

    .line 32
    iget p0, p0, Ll/bnl0$g;->d:I

    .line 33
    .line 34
    sub-int/2addr p1, p0

    .line 35
    int-to-float p0, p1

    .line 36
    invoke-virtual {p2, p3}, Landroid/view/View;->setTranslationX(F)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p2, p0}, Landroid/view/View;->setTranslationY(F)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public final synthetic L(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nnr;->j:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic M(Landroid/graphics/drawable/Drawable;Ljava/lang/CharSequence;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Boolean;)Landroid/view/View;
    .locals 9

    .line 1
    iget-object v1, p0, Ll/nnr;->u:Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;

    .line 2
    .line 3
    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    .line 4
    .line 5
    .line 6
    move-result v4

    .line 7
    invoke-virtual {p4}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result v5

    .line 11
    invoke-virtual {p5}, Ljava/lang/Integer;->intValue()I

    .line 12
    .line 13
    .line 14
    move-result v6

    .line 15
    invoke-virtual {p6}, Ljava/lang/Boolean;->booleanValue()Z

    .line 16
    .line 17
    .line 18
    move-result v7

    .line 19
    const/4 v8, 0x1

    .line 20
    move-object v0, p0

    .line 21
    move-object v2, p1

    .line 22
    move-object v3, p2

    .line 23
    invoke-virtual/range {v0 .. v8}, Ll/nnr;->w(Landroid/view/View;Landroid/graphics/drawable/Drawable;Ljava/lang/CharSequence;IIIZZ)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public final synthetic N()Ljava/lang/Boolean;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/nnr;->H:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->toolbar()Landroidx/appcompat/widget/Toolbar;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_0
    iget-object p0, p0, Ll/nnr;->H:Lcom/p1/mobile/putong/app/PutongAct;

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->toolbar()Landroidx/appcompat/widget/Toolbar;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-static {p0}, Ll/bnl0;->s(Landroid/view/ViewGroup;)Ljava/util/List;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    new-instance v0, Ll/inr;

    .line 27
    .line 28
    invoke-direct {v0}, Ll/inr;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-static {p0, v0}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    :cond_1
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_2

    .line 44
    .line 45
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    check-cast v0, Landroid/view/View;

    .line 50
    .line 51
    check-cast v0, Landroid/widget/TextView;

    .line 52
    .line 53
    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    if-nez v1, :cond_1

    .line 62
    .line 63
    const/4 v1, 0x3

    .line 64
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 69
    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_2
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 73
    .line 74
    return-object p0
.end method

.method public final synthetic O(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nnr;->K:Lcom/p1/mobile/putong/core/ui/vip/likers/c;

    .line 2
    .line 3
    const-string p1, "seepageSeePurchaseClick"

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->N1(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public P()V
    .locals 0

    .line 1
    return-void
.end method

.method public R()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nnr;->M:Lcom/p1/mobile/putong/core/ui/vip/likers/LikersAnimationMaskView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/nnr;->D:Landroid/view/ViewStub;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersAnimationMaskView;

    .line 12
    .line 13
    iput-object v0, p0, Ll/nnr;->M:Lcom/p1/mobile/putong/core/ui/vip/likers/LikersAnimationMaskView;

    .line 14
    .line 15
    :cond_0
    iget-object p0, p0, Ll/nnr;->M:Lcom/p1/mobile/putong/core/ui/vip/likers/LikersAnimationMaskView;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersAnimationMaskView;->d()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public S(Ll/vg60;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    move v1, v0

    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {p1}, Ll/vg60;->d()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    :goto_0
    iget-object v2, p0, Ll/nnr;->K:Lcom/p1/mobile/putong/core/ui/vip/likers/c;

    .line 11
    .line 12
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->X0()Z

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    if-nez v2, :cond_1

    .line 17
    .line 18
    iget-object v2, p0, Ll/nnr;->K:Lcom/p1/mobile/putong/core/ui/vip/likers/c;

    .line 19
    .line 20
    invoke-virtual {v2, v1}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->P(I)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-virtual {p0, v2}, Ll/nnr;->setTitle(Ljava/lang/CharSequence;)V

    .line 25
    .line 26
    .line 27
    :cond_1
    const/4 v2, 0x1

    .line 28
    if-nez p1, :cond_2

    .line 29
    .line 30
    invoke-virtual {p0, v2, v0}, Ll/nnr;->a(ZZ)V

    .line 31
    .line 32
    .line 33
    goto :goto_2

    .line 34
    :cond_2
    iget-object v3, p0, Ll/nnr;->I:Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;

    .line 35
    .line 36
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;->P4()Lcom/p1/mobile/putong/core/ui/vip/likers/a;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    iget-object p1, p1, Ll/vg60;->a:Ljava/util/List;

    .line 41
    .line 42
    invoke-virtual {v3, p1}, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->T(Ljava/util/List;)V

    .line 43
    .line 44
    .line 45
    if-nez v1, :cond_3

    .line 46
    .line 47
    move p1, v2

    .line 48
    goto :goto_1

    .line 49
    :cond_3
    move p1, v0

    .line 50
    :goto_1
    invoke-virtual {p0, v0, p1}, Ll/nnr;->a(ZZ)V

    .line 51
    .line 52
    .line 53
    :goto_2
    iget-object p1, p0, Ll/nnr;->E:Landroid/widget/Button;

    .line 54
    .line 55
    invoke-static {p1, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0, v2}, Ll/nnr;->Y(Z)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public T(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nnr;->h:Landroid/widget/ImageView;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const/16 p1, 0x8

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 8
    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 p1, 0x0

    .line 12
    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Ll/nnr;->h:Landroid/widget/ImageView;

    .line 16
    .line 17
    sget v0, Ll/gbc0;->h6:I

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 20
    .line 21
    .line 22
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/core/member/module/CoreMemberModule;->F()Ll/ss9;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p1}, Ll/ss9;->b()Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-interface {p1, p0}, Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;->Ss(Ll/nnr;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public U(I)V
    .locals 0
    .param p1    # I
        .annotation build Landroidx/annotation/DrawableRes;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Ll/nnr;->i:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0, p1}, Lv/navigationbar/VNavigationBar;->setLeftIconResource(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public V()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/nnr;->K:Lcom/p1/mobile/putong/core/ui/vip/likers/c;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->L1()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Ll/nnr;->E:Landroid/widget/Button;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const-string v0, "\u67e5\u770b\u8c01\u559c\u6b22\u6211"

    .line 12
    .line 13
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/nnr;->E:Landroid/widget/Button;

    .line 17
    .line 18
    const/high16 v1, 0x41900000    # 18.0f

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/nnr;->E:Landroid/widget/Button;

    .line 24
    .line 25
    const v1, 0x3de147ae    # 0.11f

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setLetterSpacing(F)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ll/nnr;->E:Landroid/widget/Button;

    .line 32
    .line 33
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Ll/nnr;->E:Landroid/widget/Button;

    .line 39
    .line 40
    iget-object v1, p0, Ll/nnr;->H:Lcom/p1/mobile/putong/app/PutongAct;

    .line 41
    .line 42
    sget v2, Ll/gbc0;->o6:I

    .line 43
    .line 44
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_0
    const-string v0, "\u83b7\u53d6\u7279\u6743"

    .line 53
    .line 54
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Ll/nnr;->E:Landroid/widget/Button;

    .line 58
    .line 59
    const/high16 v1, 0x41800000    # 16.0f

    .line 60
    .line 61
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Ll/nnr;->E:Landroid/widget/Button;

    .line 65
    .line 66
    const/4 v1, 0x0

    .line 67
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setLetterSpacing(F)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Ll/nnr;->E:Landroid/widget/Button;

    .line 71
    .line 72
    const/4 v1, 0x2

    .line 73
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 78
    .line 79
    .line 80
    iget-object v0, p0, Ll/nnr;->E:Landroid/widget/Button;

    .line 81
    .line 82
    iget-object v1, p0, Ll/nnr;->H:Lcom/p1/mobile/putong/app/PutongAct;

    .line 83
    .line 84
    sget v2, Ll/gbc0;->l6:I

    .line 85
    .line 86
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 91
    .line 92
    .line 93
    :goto_0
    iget-object v0, p0, Ll/nnr;->E:Landroid/widget/Button;

    .line 94
    .line 95
    new-instance v1, Ll/lnr;

    .line 96
    .line 97
    invoke-direct {v1, p0}, Ll/lnr;-><init>(Ll/nnr;)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 101
    .line 102
    .line 103
    return-void
.end method

.method public W(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/nnr;->N:Z

    .line 2
    .line 3
    iget-object p0, p0, Ll/nnr;->I:Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;->P4()Lcom/p1/mobile/putong/core/ui/vip/likers/a;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->U(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public X(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nnr;->i:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lv/navigationbar/VNavigationBar;->setTitle(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public Y(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nnr;->u:Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public Z(I)V
    .locals 8

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isBanned()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    const-string v0, "tooltips_trigger_mode"

    .line 17
    .line 18
    const-string v1, "passive"

    .line 19
    .line 20
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    const-string v0, "tooltips_type"

    .line 25
    .line 26
    const-string v1, "bubble"

    .line 27
    .line 28
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    const-string v0, "tooltips_type_ui"

    .line 33
    .line 34
    const-string v1, "bubble_basic_double_edge"

    .line 35
    .line 36
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 37
    .line 38
    .line 39
    move-result-object v4

    .line 40
    const-string v0, "tooltips_trigger_module"

    .line 41
    .line 42
    const-string v1, "boost_button"

    .line 43
    .line 44
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 45
    .line 46
    .line 47
    move-result-object v5

    .line 48
    const-string v0, "tooltips_trigger_page"

    .line 49
    .line 50
    const-string v1, "see_page"

    .line 51
    .line 52
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 53
    .line 54
    .line 55
    move-result-object v6

    .line 56
    const-string v0, "tooltips_trigger_reason"

    .line 57
    .line 58
    const-string v1, "guide"

    .line 59
    .line 60
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 61
    .line 62
    .line 63
    move-result-object v7

    .line 64
    filled-new-array/range {v2 .. v7}, [Ll/pf60;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    const-string v1, "e_bubble_boost_see_page_guide"

    .line 69
    .line 70
    const-string v2, "p_see_who_likes_me_view"

    .line 71
    .line 72
    invoke-static {v1, v2, v0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 73
    .line 74
    .line 75
    new-instance v0, Ll/fnr;

    .line 76
    .line 77
    invoke-direct {v0}, Ll/fnr;-><init>()V

    .line 78
    .line 79
    .line 80
    iget-object v1, p0, Ll/nnr;->x:Landroid/widget/TextView;

    .line 81
    .line 82
    const/4 v2, 0x0

    .line 83
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 84
    .line 85
    .line 86
    iget-object v1, p0, Ll/nnr;->x:Landroid/widget/TextView;

    .line 87
    .line 88
    new-instance v2, Ll/gnr;

    .line 89
    .line 90
    invoke-direct {v2, v0}, Ll/gnr;-><init>(Ll/x20;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 94
    .line 95
    .line 96
    new-instance v0, Ll/hnr;

    .line 97
    .line 98
    invoke-direct {v0, p0}, Ll/hnr;-><init>(Ll/nnr;)V

    .line 99
    .line 100
    .line 101
    iput-object v0, p0, Ll/nnr;->J:Ljava/lang/Runnable;

    .line 102
    .line 103
    iget-object p0, p0, Ll/nnr;->H:Lcom/p1/mobile/putong/app/PutongAct;

    .line 104
    .line 105
    int-to-long v1, p1

    .line 106
    invoke-static {p0, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 107
    .line 108
    .line 109
    invoke-static {}, Lcom/p1/mobile/putong/core/member/module/CoreMemberModule;->F()Ll/ss9;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    invoke-virtual {p0}, Ll/ss9;->b()Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;->O6()V

    .line 118
    .line 119
    .line 120
    return-void
.end method

.method public a(ZZ)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x4

    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Ll/nnr;->k:Landroid/widget/FrameLayout;

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Ll/nnr;->o:Landroid/widget/LinearLayout;

    .line 11
    .line 12
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Ll/nnr;->l:Landroid/widget/LinearLayout;

    .line 16
    .line 17
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Ll/nnr;->r:Lv/VProgressBar;

    .line 21
    .line 22
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Ll/nnr;->s:Lv/VPullUpRecyclerView;

    .line 26
    .line 27
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    if-eqz p2, :cond_3

    .line 32
    .line 33
    iget-boolean p1, p0, Ll/nnr;->N:Z

    .line 34
    .line 35
    if-nez p1, :cond_3

    .line 36
    .line 37
    iget-object p1, p0, Ll/nnr;->k:Landroid/widget/FrameLayout;

    .line 38
    .line 39
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 40
    .line 41
    .line 42
    invoke-static {}, Lcom/p1/mobile/putong/core/member/module/CoreMemberModule;->F()Ll/ss9;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-virtual {p1}, Ll/ss9;->b()Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;->k()Z

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    if-eqz p1, :cond_2

    .line 55
    .line 56
    iget-object p1, p0, Ll/nnr;->K:Lcom/p1/mobile/putong/core/ui/vip/likers/c;

    .line 57
    .line 58
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->h:Lcom/p1/mobile/putong/core/newui/messages/business/BusinessEntranceStyle;

    .line 59
    .line 60
    sget-object p2, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessEntranceStyle;->PICKS:Lcom/p1/mobile/putong/core/newui/messages/business/BusinessEntranceStyle;

    .line 61
    .line 62
    if-ne p1, p2, :cond_1

    .line 63
    .line 64
    sget-object p1, Lcom/p1/mobile/putong/core/ui/vip/picks/PicksHelper;->Companion:Lcom/p1/mobile/putong/core/ui/vip/picks/PicksHelper$a;

    .line 65
    .line 66
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/vip/picks/PicksHelper$a;->b()Lcom/p1/mobile/putong/core/ui/vip/picks/PicksHelper;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/vip/picks/PicksHelper;->n()Z

    .line 71
    .line 72
    .line 73
    move-result p1

    .line 74
    if-eqz p1, :cond_1

    .line 75
    .line 76
    iget-object p1, p0, Ll/nnr;->o:Landroid/widget/LinearLayout;

    .line 77
    .line 78
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 79
    .line 80
    .line 81
    iget-object p1, p0, Ll/nnr;->p:Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksHeaderView;

    .line 82
    .line 83
    sget-object p2, Lcom/p1/mobile/putong/core/ui/vip/picks/PicksHelper$HeaderType;->EXPAND:Lcom/p1/mobile/putong/core/ui/vip/picks/PicksHelper$HeaderType;

    .line 84
    .line 85
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksHeaderView;->b(Lcom/p1/mobile/putong/core/ui/vip/picks/PicksHelper$HeaderType;)V

    .line 86
    .line 87
    .line 88
    iget-object p1, p0, Ll/nnr;->l:Landroid/widget/LinearLayout;

    .line 89
    .line 90
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 91
    .line 92
    .line 93
    iget-object p1, p0, Ll/nnr;->q:Landroid/widget/LinearLayout;

    .line 94
    .line 95
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 96
    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_1
    iget-object p1, p0, Ll/nnr;->o:Landroid/widget/LinearLayout;

    .line 100
    .line 101
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 102
    .line 103
    .line 104
    iget-object p1, p0, Ll/nnr;->p:Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksHeaderView;

    .line 105
    .line 106
    sget-object p2, Lcom/p1/mobile/putong/core/ui/vip/picks/PicksHelper$HeaderType;->HIDE:Lcom/p1/mobile/putong/core/ui/vip/picks/PicksHelper$HeaderType;

    .line 107
    .line 108
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksHeaderView;->b(Lcom/p1/mobile/putong/core/ui/vip/picks/PicksHelper$HeaderType;)V

    .line 109
    .line 110
    .line 111
    iget-object p1, p0, Ll/nnr;->q:Landroid/widget/LinearLayout;

    .line 112
    .line 113
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 114
    .line 115
    .line 116
    iget-object p1, p0, Ll/nnr;->l:Landroid/widget/LinearLayout;

    .line 117
    .line 118
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 119
    .line 120
    .line 121
    goto :goto_0

    .line 122
    :cond_2
    iget-object p1, p0, Ll/nnr;->l:Landroid/widget/LinearLayout;

    .line 123
    .line 124
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 125
    .line 126
    .line 127
    :goto_0
    iget-object p1, p0, Ll/nnr;->r:Lv/VProgressBar;

    .line 128
    .line 129
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 130
    .line 131
    .line 132
    iget-object p0, p0, Ll/nnr;->s:Lv/VPullUpRecyclerView;

    .line 133
    .line 134
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 135
    .line 136
    .line 137
    return-void

    .line 138
    :cond_3
    iget-object p1, p0, Ll/nnr;->k:Landroid/widget/FrameLayout;

    .line 139
    .line 140
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 141
    .line 142
    .line 143
    iget-object p1, p0, Ll/nnr;->l:Landroid/widget/LinearLayout;

    .line 144
    .line 145
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 146
    .line 147
    .line 148
    iget-object p1, p0, Ll/nnr;->r:Lv/VProgressBar;

    .line 149
    .line 150
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 151
    .line 152
    .line 153
    iget-object p0, p0, Ll/nnr;->s:Lv/VPullUpRecyclerView;

    .line 154
    .line 155
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 156
    .line 157
    .line 158
    return-void
.end method

.method public a0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nnr;->b:Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;

    .line 2
    .line 3
    iget-object p0, p0, Ll/nnr;->a:Lv/VFrame;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;->d(Landroid/widget/FrameLayout;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public bridge synthetic act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/nnr;->v()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public b0(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nnr;->E:Landroid/widget/Button;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public c0(Ll/x20;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nnr;->M:Lcom/p1/mobile/putong/core/ui/vip/likers/LikersAnimationMaskView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersAnimationMaskView;->e(Ll/x20;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public destroy()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nnr;->G:Ljava/lang/Runnable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Ll/nnr;->F:Ljava/lang/Runnable;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-static {p0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/ui/vip/likers/c;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/nnr;->x(Lcom/p1/mobile/putong/core/ui/vip/likers/c;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/nnr;->u(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p2, p0, Ll/nnr;->j:Landroid/widget/FrameLayout;

    .line 6
    .line 7
    iget-object v0, p0, Ll/nnr;->H:Lcom/p1/mobile/putong/app/PutongAct;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sget v1, Ll/f9c0;->m:I

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    invoke-virtual {p2, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 20
    .line 21
    .line 22
    iget-object p2, p0, Ll/nnr;->m:Lv/VImage;

    .line 23
    .line 24
    sget v0, Ll/gbc0;->g6:I

    .line 25
    .line 26
    invoke-virtual {p2, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 27
    .line 28
    .line 29
    iget-object p2, p0, Ll/nnr;->n:Lv/VText;

    .line 30
    .line 31
    const/high16 v0, 0x41600000    # 14.0f

    .line 32
    .line 33
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 34
    .line 35
    .line 36
    iget-object p2, p0, Ll/nnr;->n:Lv/VText;

    .line 37
    .line 38
    const-string v0, "#42000000"

    .line 39
    .line 40
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 45
    .line 46
    .line 47
    iget-object p2, p0, Ll/nnr;->n:Lv/VText;

    .line 48
    .line 49
    iget-object v0, p0, Ll/nnr;->H:Lcom/p1/mobile/putong/app/PutongAct;

    .line 50
    .line 51
    sget v1, Lcom/p1/mobile/putong/core/member/R$string;->e1:I

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 58
    .line 59
    .line 60
    invoke-static {}, Lcom/p1/mobile/putong/core/member/module/CoreMemberModule;->F()Ll/ss9;

    .line 61
    .line 62
    .line 63
    move-result-object p2

    .line 64
    invoke-virtual {p2}, Ll/ss9;->b()Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;

    .line 65
    .line 66
    .line 67
    move-result-object p2

    .line 68
    invoke-interface {p2, p0}, Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;->m6(Ll/nnr;)V

    .line 69
    .line 70
    .line 71
    iget-object p2, p0, Ll/nnr;->i:Lv/navigationbar/VNavigationBar;

    .line 72
    .line 73
    iget-object v0, p0, Ll/nnr;->H:Lcom/p1/mobile/putong/app/PutongAct;

    .line 74
    .line 75
    invoke-virtual {p2, v0}, Lv/navigationbar/VNavigationBar;->setLeftIconAsBack(Landroid/app/Activity;)V

    .line 76
    .line 77
    .line 78
    iget-object p2, p0, Ll/nnr;->i:Lv/navigationbar/VNavigationBar;

    .line 79
    .line 80
    sget v0, Ll/gbc0;->b:I

    .line 81
    .line 82
    invoke-virtual {p2, v0}, Lv/navigationbar/VNavigationBar;->setLeftIconResource(I)V

    .line 83
    .line 84
    .line 85
    iget-object p2, p0, Ll/nnr;->i:Lv/navigationbar/VNavigationBar;

    .line 86
    .line 87
    const/4 v0, 0x0

    .line 88
    invoke-virtual {p2, v0}, Lv/navigationbar/VNavigationBar;->setRightIconClip(Z)V

    .line 89
    .line 90
    .line 91
    iget-object p2, p0, Ll/nnr;->H:Lcom/p1/mobile/putong/app/PutongAct;

    .line 92
    .line 93
    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 94
    .line 95
    .line 96
    move-result-object p2

    .line 97
    iget-object v0, p0, Ll/nnr;->i:Lv/navigationbar/VNavigationBar;

    .line 98
    .line 99
    invoke-virtual {v0}, Lv/navigationbar/VNavigationBar;->getRightIconContainer()Lv/VLinear;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-virtual {p0, p2, v0}, Ll/nnr;->s(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 104
    .line 105
    .line 106
    move-result-object p2

    .line 107
    invoke-virtual {p0, p2}, Ll/nnr;->p(Landroid/view/View;)V

    .line 108
    .line 109
    .line 110
    iget-object v0, p0, Ll/nnr;->i:Lv/navigationbar/VNavigationBar;

    .line 111
    .line 112
    filled-new-array {p2}, [Landroid/view/View;

    .line 113
    .line 114
    .line 115
    move-result-object p2

    .line 116
    invoke-virtual {v0, p2}, Lv/navigationbar/VNavigationBar;->z([Landroid/view/View;)V

    .line 117
    .line 118
    .line 119
    iget-object p2, p0, Ll/nnr;->c:Lv/VFrame;

    .line 120
    .line 121
    new-instance v0, Ll/cnr;

    .line 122
    .line 123
    invoke-direct {v0, p0}, Ll/cnr;-><init>(Ll/nnr;)V

    .line 124
    .line 125
    .line 126
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 127
    .line 128
    .line 129
    const/4 p2, 0x1

    .line 130
    invoke-virtual {p0, p2}, Ll/nnr;->Y(Z)V

    .line 131
    .line 132
    .line 133
    return-object p1
.end method

.method public final p(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/onr;->a(Ll/nnr;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final q(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/qnr;->a(Ll/nnr;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public s(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/onr;->b(Ll/nnr;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public setTitle(Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nnr;->i:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lv/navigationbar/VNavigationBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public u(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/pnr;->b(Ll/nnr;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public v()Lcom/p1/mobile/putong/app/PutongAct;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/nnr;->H:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public w(Landroid/view/View;Landroid/graphics/drawable/Drawable;Ljava/lang/CharSequence;IIIZZ)Landroid/view/View;
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "boost_see_page_guide"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/d;->k(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    if-eqz p8, :cond_0

    .line 11
    .line 12
    iget-object p8, p0, Ll/nnr;->x:Landroid/widget/TextView;

    .line 13
    .line 14
    invoke-virtual {p8}, Landroid/view/View;->getVisibility()I

    .line 15
    .line 16
    .line 17
    move-result p8

    .line 18
    if-nez p8, :cond_0

    .line 19
    .line 20
    iget-object p8, p0, Ll/nnr;->x:Landroid/widget/TextView;

    .line 21
    .line 22
    const/16 v0, 0x8

    .line 23
    .line 24
    invoke-virtual {p8, v0}, Landroid/view/View;->setVisibility(I)V

    .line 25
    .line 26
    .line 27
    :cond_0
    iget-object p8, p0, Ll/nnr;->j:Landroid/widget/FrameLayout;

    .line 28
    .line 29
    const-string v0, "likeBoostBubble"

    .line 30
    .line 31
    invoke-virtual {p8, v0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object p8

    .line 35
    iget-object v1, p0, Ll/nnr;->j:Landroid/widget/FrameLayout;

    .line 36
    .line 37
    invoke-virtual {v1, p8}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 38
    .line 39
    .line 40
    iget-object p8, p0, Ll/nnr;->j:Landroid/widget/FrameLayout;

    .line 41
    .line 42
    invoke-virtual {p8}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 43
    .line 44
    .line 45
    move-result-object p8

    .line 46
    new-instance v1, Landroid/widget/TextView;

    .line 47
    .line 48
    invoke-direct {v1, p8}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v1, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v1, p4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 55
    .line 56
    .line 57
    int-to-float p4, p5

    .line 58
    invoke-virtual {v1, p4}, Landroid/widget/TextView;->setTextSize(F)V

    .line 59
    .line 60
    .line 61
    const/16 p4, 0x11

    .line 62
    .line 63
    invoke-virtual {v1, p4}, Landroid/widget/TextView;->setGravity(I)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v1, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v1, p2}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 70
    .line 71
    .line 72
    if-nez p7, :cond_1

    .line 73
    .line 74
    const/high16 p2, 0x41900000    # 18.0f

    .line 75
    .line 76
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 77
    .line 78
    .line 79
    move-result p3

    .line 80
    const/high16 p4, 0x41880000    # 17.0f

    .line 81
    .line 82
    invoke-static {p4}, Ll/qa00;->d(F)I

    .line 83
    .line 84
    .line 85
    move-result p4

    .line 86
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 87
    .line 88
    .line 89
    move-result p2

    .line 90
    const/high16 p5, 0x41a80000    # 21.0f

    .line 91
    .line 92
    invoke-static {p5}, Ll/qa00;->d(F)I

    .line 93
    .line 94
    .line 95
    move-result p5

    .line 96
    invoke-virtual {v1, p3, p4, p2, p5}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 97
    .line 98
    .line 99
    :cond_1
    new-instance p2, Landroid/widget/FrameLayout$LayoutParams;

    .line 100
    .line 101
    const/4 p3, -0x2

    .line 102
    invoke-direct {p2, p3, p3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 103
    .line 104
    .line 105
    iget-object p3, p0, Ll/nnr;->j:Landroid/widget/FrameLayout;

    .line 106
    .line 107
    invoke-virtual {p3, v1, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 108
    .line 109
    .line 110
    new-instance p2, Ll/mnr;

    .line 111
    .line 112
    invoke-direct {p2, p0, p1, v1}, Ll/mnr;-><init>(Ll/nnr;Landroid/view/View;Landroid/widget/TextView;)V

    .line 113
    .line 114
    .line 115
    invoke-static {v1, p2}, Ll/bnl0;->Q0(Landroid/view/View;Ll/y20;)V

    .line 116
    .line 117
    .line 118
    const/4 p2, -0x1

    .line 119
    if-eq p6, p2, :cond_2

    .line 120
    .line 121
    iget-object p2, p0, Ll/nnr;->H:Lcom/p1/mobile/putong/app/PutongAct;

    .line 122
    .line 123
    new-instance p3, Ll/dnr;

    .line 124
    .line 125
    invoke-direct {p3, p0, p1, v1}, Ll/dnr;-><init>(Ll/nnr;Landroid/view/View;Landroid/widget/TextView;)V

    .line 126
    .line 127
    .line 128
    int-to-long p0, p6

    .line 129
    invoke-static {p2, p3, p0, p1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 130
    .line 131
    .line 132
    :cond_2
    return-object v1
.end method

.method public x(Lcom/p1/mobile/putong/core/ui/vip/likers/c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/nnr;->K:Lcom/p1/mobile/putong/core/ui/vip/likers/c;

    .line 2
    .line 3
    return-void
.end method

.method public y()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/member/module/CoreMemberModule;->F()Ll/ss9;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/ss9;->b()Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Ll/nnr;->v()Lcom/p1/mobile/putong/app/PutongAct;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget-object p0, p0, Ll/nnr;->u:Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;

    .line 14
    .line 15
    invoke-interface {v0, v1, p0}, Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;->Qe(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public z()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nnr;->L:Lv/SimpleCoverGuideView;

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
    iget-object v0, p0, Ll/nnr;->L:Lv/SimpleCoverGuideView;

    .line 10
    .line 11
    invoke-virtual {v0}, Lv/SimpleCoverGuideView;->f()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Ll/nnr;->L:Lv/SimpleCoverGuideView;

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/view/View;->performClick()Z

    .line 20
    .line 21
    .line 22
    const/4 p0, 0x1

    .line 23
    return p0

    .line 24
    :cond_0
    const/4 p0, 0x0

    .line 25
    return p0
.end method
