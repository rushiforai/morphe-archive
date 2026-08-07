.class public Ll/ctn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/zsn;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VFrame;

.field public b:Lv/VImage;

.field public c:Lv/VLinear;

.field public d:Lv/navigationbar/VNavigationBar;

.field public e:Landroid/widget/FrameLayout;

.field public f:Lv/VFrame;

.field public g:Landroid/widget/LinearLayout;

.field public h:Lv/VImage;

.field public i:Lv/VText;

.field public j:Lv/VPullUpRecyclerView;

.field public k:Landroid/view/View;

.field public l:Lv/VText_NoTopPadding;

.field public final m:Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlLikedUsersAct;

.field public n:Ll/zsn;

.field public o:Ll/ssn;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlLikedUsersAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ctn;->m:Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlLikedUsersAct;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/ctn;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ctn;->i(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/ctn;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ctn;->j(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic c(Ll/ctn;)Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlLikedUsersAct;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ctn;->m:Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlLikedUsersAct;

    return-object p0
.end method

.method private l()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ctn;->o:Ll/ssn;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ssn;->k()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method private u()V
    .locals 2

    .line 1
    invoke-static {}, Ll/joa;->f4()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Ll/ctn;->l:Lv/VText_NoTopPadding;

    .line 6
    .line 7
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/ctn;->k:Landroid/view/View;

    .line 11
    .line 12
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ctn;->m:Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlLikedUsersAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/dtn;->b(Ll/ctn;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public destroy()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ctn;->o:Ll/ssn;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/ssn;->g()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Ll/ctn;->o:Ll/ssn;

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public e()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ctn;->o:Ll/ssn;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance v0, Ll/ssn;

    .line 7
    .line 8
    iget-object v1, p0, Ll/ctn;->m:Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlLikedUsersAct;

    .line 9
    .line 10
    iget-object v2, p0, Ll/ctn;->n:Ll/zsn;

    .line 11
    .line 12
    invoke-direct {v0, v1, v2}, Ll/ssn;-><init>(Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlLikedUsersAct;Ll/zsn;)V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Ll/ctn;->o:Ll/ssn;

    .line 16
    .line 17
    iget-object p0, p0, Ll/ctn;->e:Landroid/widget/FrameLayout;

    .line 18
    .line 19
    invoke-virtual {v0, p0}, Ll/ssn;->e(Landroid/widget/FrameLayout;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public f(Ll/zsn;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ctn;->n:Ll/zsn;

    .line 2
    .line 3
    return-void
.end method

.method public final synthetic i(Landroid/view/View;)V
    .locals 6

    .line 1
    iget-object p1, p0, Ll/ctn;->m:Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlLikedUsersAct;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlLikedUsersAct;->pageId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p1}, Ll/fwl;->g(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 11
    .line 12
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->p0:Ll/z99;

    .line 13
    .line 14
    invoke-virtual {p1}, Ll/z99;->k3()Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iget-object v1, p0, Ll/ctn;->m:Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlLikedUsersAct;

    .line 29
    .line 30
    sget-object v3, Lcom/p1/mobile/putong/core/data/Privilege;->immediately_match:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 31
    .line 32
    const/4 v4, 0x0

    .line 33
    const/4 v5, 0x0

    .line 34
    const-string v2, "p_intl_like_i_sent,e_intl_like_sent_premiun_button,click"

    .line 35
    .line 36
    invoke-interface/range {v0 .. v5}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->r6(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/y20;Ll/x20;)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    iget-object p0, p0, Ll/ctn;->m:Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlLikedUsersAct;

    .line 49
    .line 50
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->liked_user:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 51
    .line 52
    const/4 v1, 0x0

    .line 53
    const-string v2, "p_intl_like_i_sent,e_intl_like_sent_premiun_button,click"

    .line 54
    .line 55
    invoke-interface {p1, p0, v2, v0, v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->qm(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/y20;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/zsn;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ctn;->f(Ll/zsn;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ctn;->d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public init()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ctn;->p()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/ctn;->s()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/ctn;->q()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/ctn;->n()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Ll/ctn;->v()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Ll/ctn;->e()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic j(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ctn;->m:Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlLikedUsersAct;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public k()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ctn;->o:Ll/ssn;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ssn;->i()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public m(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/LikeUser;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    if-eqz p1, :cond_1

    .line 4
    .line 5
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    if-eqz v2, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object v2, p0, Ll/ctn;->m:Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlLikedUsersAct;

    .line 13
    .line 14
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlLikedUsersAct;->Z1()Ll/nsn;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v2, p1}, Ll/nsn;->S(Ljava/util/List;)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Ll/ctn;->g:Landroid/widget/LinearLayout;

    .line 22
    .line 23
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Ll/ctn;->j:Lv/VPullUpRecyclerView;

    .line 27
    .line 28
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 29
    .line 30
    .line 31
    goto :goto_1

    .line 32
    :cond_1
    :goto_0
    iget-object p1, p0, Ll/ctn;->g:Landroid/widget/LinearLayout;

    .line 33
    .line 34
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Ll/ctn;->j:Lv/VPullUpRecyclerView;

    .line 38
    .line 39
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 40
    .line 41
    .line 42
    :goto_1
    invoke-direct {p0}, Ll/ctn;->u()V

    .line 43
    .line 44
    .line 45
    invoke-direct {p0}, Ll/ctn;->l()V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public final n()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ctn;->l:Lv/VText_NoTopPadding;

    .line 2
    .line 3
    new-instance v1, Ll/atn;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/atn;-><init>(Ll/ctn;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final p()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ctn;->d:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    new-instance v1, Ll/btn;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/btn;-><init>(Ll/ctn;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconOnClick(Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Ll/ctn;->d:Lv/navigationbar/VNavigationBar;

    .line 12
    .line 13
    const-string v0, "#00ffffff"

    .line 14
    .line 15
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final q()V
    .locals 3

    .line 1
    new-instance v0, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 2
    .line 3
    iget-object v1, p0, Ll/ctn;->m:Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlLikedUsersAct;

    .line 4
    .line 5
    const/4 v2, 0x2

    .line 6
    invoke-direct {v0, v1, v2}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    .line 7
    .line 8
    .line 9
    new-instance v1, Ll/ctn$a;

    .line 10
    .line 11
    invoke-direct {v1, p0, v0}, Ll/ctn$a;-><init>(Ll/ctn;Landroidx/recyclerview/widget/GridLayoutManager;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/GridLayoutManager;->v(Landroidx/recyclerview/widget/GridLayoutManager$c;)V

    .line 15
    .line 16
    .line 17
    iget-object v1, p0, Ll/ctn;->j:Lv/VPullUpRecyclerView;

    .line 18
    .line 19
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/ctn;->j:Lv/VPullUpRecyclerView;

    .line 23
    .line 24
    iget-object v1, p0, Ll/ctn;->m:Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlLikedUsersAct;

    .line 25
    .line 26
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlLikedUsersAct;->Z1()Ll/nsn;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 31
    .line 32
    .line 33
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-nez v0, :cond_0

    .line 38
    .line 39
    new-instance v0, Landroidx/recyclerview/widget/k;

    .line 40
    .line 41
    new-instance v1, Ll/ihr;

    .line 42
    .line 43
    iget-object v2, p0, Ll/ctn;->n:Ll/zsn;

    .line 44
    .line 45
    invoke-direct {v1, v2}, Ll/ihr;-><init>(Ll/ihr$a;)V

    .line 46
    .line 47
    .line 48
    invoke-direct {v0, v1}, Landroidx/recyclerview/widget/k;-><init>(Landroidx/recyclerview/widget/k$e;)V

    .line 49
    .line 50
    .line 51
    iget-object p0, p0, Ll/ctn;->j:Lv/VPullUpRecyclerView;

    .line 52
    .line 53
    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/k;->g(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 54
    .line 55
    .line 56
    :cond_0
    return-void
.end method

.method public final s()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ctn;->m:Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlLikedUsersAct;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 4
    .line 5
    sget v2, Ll/f9c0;->k:I

    .line 6
    .line 7
    invoke-virtual {v1, v2}, Landroid/content/Context;->getColor(I)I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->setStatusBarColor(I)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/ctn;->m:Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlLikedUsersAct;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Landroid/view/View;->getSystemUiVisibility()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    and-int/lit16 v1, v0, -0x2001

    .line 29
    .line 30
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 31
    .line 32
    const/16 v3, 0x1a

    .line 33
    .line 34
    if-lt v2, v3, :cond_0

    .line 35
    .line 36
    and-int/lit16 v1, v0, -0x2011

    .line 37
    .line 38
    :cond_0
    iget-object v0, p0, Ll/ctn;->m:Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlLikedUsersAct;

    .line 39
    .line 40
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {v0, v1}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 49
    .line 50
    .line 51
    iget-object p0, p0, Ll/ctn;->d:Lv/navigationbar/VNavigationBar;

    .line 52
    .line 53
    invoke-static {p0}, Ll/vnb;->j1(Landroid/view/View;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public v()V
    .locals 3

    .line 1
    invoke-static {}, Ll/joa;->z4()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Ll/ctn;->b:Lv/VImage;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget v2, Ll/gbc0;->D:I

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    sget v2, Ll/gbc0;->B:I

    .line 13
    .line 14
    :goto_0
    invoke-virtual {v1, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 15
    .line 16
    .line 17
    iget-object v1, p0, Ll/ctn;->d:Lv/navigationbar/VNavigationBar;

    .line 18
    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    sget v2, Ll/gbc0;->A:I

    .line 22
    .line 23
    goto :goto_1

    .line 24
    :cond_1
    sget v2, Ll/gbc0;->z:I

    .line 25
    .line 26
    :goto_1
    invoke-virtual {v1, v2}, Lv/navigationbar/VNavigationBar;->setLeftIconResource(I)V

    .line 27
    .line 28
    .line 29
    iget-object v1, p0, Ll/ctn;->l:Lv/VText_NoTopPadding;

    .line 30
    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    sget v2, Ll/gbc0;->I:I

    .line 34
    .line 35
    goto :goto_2

    .line 36
    :cond_2
    sget v2, Ll/gbc0;->H:I

    .line 37
    .line 38
    :goto_2
    invoke-virtual {v1, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 39
    .line 40
    .line 41
    iget-object v1, p0, Ll/ctn;->h:Lv/VImage;

    .line 42
    .line 43
    if-eqz v0, :cond_3

    .line 44
    .line 45
    sget v2, Ll/gbc0;->F:I

    .line 46
    .line 47
    goto :goto_3

    .line 48
    :cond_3
    sget v2, Ll/gbc0;->E:I

    .line 49
    .line 50
    :goto_3
    invoke-virtual {v1, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 51
    .line 52
    .line 53
    iget-object v1, p0, Ll/ctn;->d:Lv/navigationbar/VNavigationBar;

    .line 54
    .line 55
    invoke-virtual {v1}, Lv/navigationbar/VNavigationBar;->getTitleContainer()Lv/VFrame;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    if-lez v1, :cond_5

    .line 64
    .line 65
    iget-object v1, p0, Ll/ctn;->d:Lv/navigationbar/VNavigationBar;

    .line 66
    .line 67
    invoke-virtual {v1}, Lv/navigationbar/VNavigationBar;->getTitleContainer()Lv/VFrame;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    const/4 v2, 0x0

    .line 72
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    instance-of v1, v1, Landroid/widget/TextView;

    .line 77
    .line 78
    if-eqz v1, :cond_5

    .line 79
    .line 80
    iget-object v1, p0, Ll/ctn;->d:Lv/navigationbar/VNavigationBar;

    .line 81
    .line 82
    invoke-virtual {v1}, Lv/navigationbar/VNavigationBar;->getTitleContainer()Lv/VFrame;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    check-cast v1, Landroid/widget/TextView;

    .line 91
    .line 92
    if-eqz v0, :cond_4

    .line 93
    .line 94
    const-string v0, "#F9E7FF"

    .line 95
    .line 96
    goto :goto_4

    .line 97
    :cond_4
    const-string v0, "#cce8ca8a"

    .line 98
    .line 99
    :goto_4
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 104
    .line 105
    .line 106
    :cond_5
    invoke-direct {p0}, Ll/ctn;->u()V

    .line 107
    .line 108
    .line 109
    invoke-direct {p0}, Ll/ctn;->l()V

    .line 110
    .line 111
    .line 112
    return-void
.end method
