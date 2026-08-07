.class public Ll/ywu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/rwu;",
        ">;"
    }
.end annotation


# instance fields
.field public _empty_error_layout:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/fragmentnew2/LiveEmptyErrorView;

.field public _empty_error_layout_image:Lv/VImage;

.field public _empty_error_layout_tv_tip:Lv/VText;

.field public _page_title_bar:Lv/navigationbar/VNavigationBar;

.field public _random_entry:Lv/VLinear;

.field public _recycler_view:Lv/VRecyclerView;

.field public _start_video_chat:Landroid/widget/TextView;

.field public _swipe_refresh:Lv/VPullDownRefreshLayout;

.field private adapter:Ll/r0u;

.field private footerModel:Ll/h2u;

.field private final frag:Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/LiveVideoChatFrag;

.field private gridLayoutManager:Landroidx/recyclerview/widget/GridLayoutManager;

.field private presenter:Ll/rwu;

.field private rootView:Landroid/view/View;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/LiveVideoChatFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ywu;->frag:Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/LiveVideoChatFrag;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/ywu;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ywu;->s(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/ywu;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ywu;->q(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/ywu;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ywu;->u(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Ll/ywu;Ll/mvc0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ywu;->p(Ll/mvc0;)V

    return-void
.end method

.method public static synthetic e(Ll/ywu;Ll/r0u;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ywu;->n(Ll/r0u;Ljava/lang/Integer;)V

    return-void
.end method

.method public static bridge synthetic f(Ll/ywu;)Ll/rwu;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ywu;->presenter:Ll/rwu;

    return-object p0
.end method

.method private synthetic p(Ll/mvc0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ywu;->presenter:Ll/rwu;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/rwu;->D2()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic q(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ywu;->presenter:Ll/rwu;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/rwu;->I2()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method private synthetic s(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ywu;->presenter:Ll/rwu;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/rwu;->F2()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method


# virtual methods
.method public A()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ywu;->adapter:Ll/r0u;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->getItemCount()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-lez v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/ywu;->_recycler_view:Lv/VRecyclerView;

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public B(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ywu;->_page_title_bar:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/ywu;->_page_title_bar:Lv/navigationbar/VNavigationBar;

    .line 9
    .line 10
    const-string v0, "\u89c6\u9891\u95ea\u804a"

    .line 11
    .line 12
    invoke-virtual {p1, v0}, Lv/navigationbar/VNavigationBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Ll/ywu;->_page_title_bar:Lv/navigationbar/VNavigationBar;

    .line 16
    .line 17
    new-instance v0, Ll/swu;

    .line 18
    .line 19
    invoke-direct {v0, p0}, Ll/swu;-><init>(Ll/ywu;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1, v0}, Lv/navigationbar/VNavigationBar;->setLeftIconOnClick(Landroid/view/View$OnClickListener;)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Ll/ywu;->_page_title_bar:Lv/navigationbar/VNavigationBar;

    .line 26
    .line 27
    sget p1, Ll/nbc0;->e:I

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Lv/navigationbar/VNavigationBar;->setLeftIconResource(I)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    const/4 p0, 0x0

    .line 34
    invoke-static {v0, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public i(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/zwu;->b(Ll/ywu;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/rwu;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ywu;->j(Ll/rwu;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ywu;->i(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Ll/ywu;->rootView:Landroid/view/View;

    .line 6
    .line 7
    return-object p1
.end method

.method public j(Ll/rwu;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ywu;->presenter:Ll/rwu;

    .line 2
    .line 3
    return-void
.end method

.method public k()Ll/r0u;
    .locals 6

    .line 1
    invoke-static {}, Ll/r0u;->J0()Ll/r0u;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 6
    .line 7
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    const/4 v3, 0x6

    .line 12
    const/4 v4, 0x1

    .line 13
    const/4 v5, 0x0

    .line 14
    invoke-direct {v1, v2, v3, v4, v5}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;IIZ)V

    .line 15
    .line 16
    .line 17
    iput-object v1, p0, Ll/ywu;->gridLayoutManager:Landroidx/recyclerview/widget/GridLayoutManager;

    .line 18
    .line 19
    new-instance v2, Ll/ywu$a;

    .line 20
    .line 21
    invoke-direct {v2, p0, v0}, Ll/ywu$a;-><init>(Ll/ywu;Ll/r0u;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/GridLayoutManager;->v(Landroidx/recyclerview/widget/GridLayoutManager$c;)V

    .line 25
    .line 26
    .line 27
    iget-object v1, p0, Ll/ywu;->_recycler_view:Lv/VRecyclerView;

    .line 28
    .line 29
    iget-object v2, p0, Ll/ywu;->gridLayoutManager:Landroidx/recyclerview/widget/GridLayoutManager;

    .line 30
    .line 31
    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 32
    .line 33
    .line 34
    iget-object v1, p0, Ll/ywu;->_recycler_view:Lv/VRecyclerView;

    .line 35
    .line 36
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 37
    .line 38
    .line 39
    iget-object v1, p0, Ll/ywu;->_recycler_view:Lv/VRecyclerView;

    .line 40
    .line 41
    const/4 v2, 0x0

    .line 42
    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->setItemAnimator(Landroidx/recyclerview/widget/RecyclerView$l;)V

    .line 43
    .line 44
    .line 45
    iget-object v1, p0, Ll/ywu;->_recycler_view:Lv/VRecyclerView;

    .line 46
    .line 47
    new-instance v2, Ll/ywu$b;

    .line 48
    .line 49
    invoke-direct {v2, p0}, Ll/ywu$b;-><init>(Ll/ywu;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->addOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$t;)V

    .line 53
    .line 54
    .line 55
    iget-object v1, p0, Ll/ywu;->frag:Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/LiveVideoChatFrag;

    .line 56
    .line 57
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    new-instance v2, Ll/wwu;

    .line 61
    .line 62
    invoke-direct {v2, v1}, Ll/wwu;-><init>(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/LiveVideoChatFrag;)V

    .line 63
    .line 64
    .line 65
    sget-object v3, Lcom/p1/mobile/putong/live/external/page/teenmode/LiveTeenDialogAct;->g:Lrx/subjects/b;

    .line 66
    .line 67
    invoke-virtual {v0, v1, v2, v3}, Ll/v6u;->o0(Lcom/p1/mobile/android/app/Frag;Ll/pcj;Lrx/subjects/b;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v0, v5}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->X(Z)V

    .line 71
    .line 72
    .line 73
    new-instance v1, Ll/xwu;

    .line 74
    .line 75
    invoke-direct {v1, p0, v0}, Ll/xwu;-><init>(Ll/ywu;Ll/r0u;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->c0(Ll/y20;)V

    .line 79
    .line 80
    .line 81
    return-object v0
.end method

.method public l()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ywu;->_swipe_refresh:Lv/VPullDownRefreshLayout;

    .line 2
    .line 3
    invoke-virtual {p0}, Lv/smart_refresh/SmartRefreshLayout;->t()Ll/mvc0;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final m(Ljava/util/List;ZZ)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Ll/d3q<",
            "*>;>;ZZ)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/ywu;->adapter:Ll/r0u;

    .line 2
    .line 3
    iget-object v1, p0, Ll/ywu;->footerModel:Ll/h2u;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->W(Ll/d3q;)V

    .line 6
    .line 7
    .line 8
    new-instance v0, Ll/h2u;

    .line 9
    .line 10
    if-nez p3, :cond_0

    .line 11
    .line 12
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    const/4 p1, 0x1

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 p1, 0x0

    .line 21
    :goto_0
    const/4 p3, 0x6

    .line 22
    invoke-direct {v0, p3, p2, p1}, Ll/h2u;-><init>(IZZ)V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Ll/ywu;->footerModel:Ll/h2u;

    .line 26
    .line 27
    iget-object p1, p0, Ll/ywu;->frag:Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/LiveVideoChatFrag;

    .line 28
    .line 29
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    sget p2, Ll/m9c0;->z:I

    .line 34
    .line 35
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getColor(I)I

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    invoke-virtual {v0, p1}, Ll/h2u;->I(I)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Ll/ywu;->footerModel:Ll/h2u;

    .line 43
    .line 44
    sget p2, Lcom/p1/mobile/putong/live/external/R$string;->q:I

    .line 45
    .line 46
    invoke-static {p2}, Ll/xau;->t(I)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    invoke-virtual {p1, p2}, Ll/h2u;->J(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    iget-object p1, p0, Ll/ywu;->adapter:Ll/r0u;

    .line 54
    .line 55
    iget-object p0, p0, Ll/ywu;->footerModel:Ll/h2u;

    .line 56
    .line 57
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->E(Ll/d3q;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public final synthetic n(Ll/r0u;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->getItemCount()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    add-int/lit8 p1, p1, -0x2

    .line 10
    .line 11
    if-lt p2, p1, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Ll/ywu;->presenter:Ll/rwu;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/rwu;->B2()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public r()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ywu;->_empty_error_layout:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/fragmentnew2/LiveEmptyErrorView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/fragmentnew2/LiveEmptyErrorView;->c()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/ywu;->_swipe_refresh:Lv/VPullDownRefreshLayout;

    .line 7
    .line 8
    new-instance v1, Ll/twu;

    .line 9
    .line 10
    invoke-direct {v1, p0}, Ll/twu;-><init>(Ll/ywu;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lv/VPullDownRefreshLayout;->O(Ll/jn50;)Ll/mvc0;

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/ywu;->_empty_error_layout:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/fragmentnew2/LiveEmptyErrorView;

    .line 17
    .line 18
    sget v1, Lcom/p1/mobile/putong/live/external/R$string;->C0:I

    .line 19
    .line 20
    invoke-static {v1}, Ll/xau;->t(I)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/fragmentnew2/LiveEmptyErrorView;->setEmptyText(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/ywu;->_start_video_chat:Landroid/widget/TextView;

    .line 28
    .line 29
    new-instance v1, Ll/uwu;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/uwu;-><init>(Ll/ywu;)V

    .line 32
    .line 33
    .line 34
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Ll/ywu;->_random_entry:Lv/VLinear;

    .line 38
    .line 39
    new-instance v1, Ll/vwu;

    .line 40
    .line 41
    invoke-direct {v1, p0}, Ll/vwu;-><init>(Ll/ywu;)V

    .line 42
    .line 43
    .line 44
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public final synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ywu;->frag:Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/LiveVideoChatFrag;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public v()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ywu;->adapter:Ll/r0u;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-nez p0, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->J()Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_1

    .line 16
    .line 17
    return v0

    .line 18
    :cond_1
    const/4 p0, 0x0

    .line 19
    return p0
.end method

.method public w(ZIJ)V
    .locals 0

    .line 1
    return-void
.end method

.method public x(Ljava/util/List;ZZ)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/uxr<",
            "*>;>;ZZ)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/ywu;->adapter:Ll/r0u;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ywu;->k()Ll/r0u;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Ll/ywu;->adapter:Ll/r0u;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Ll/ywu;->adapter:Ll/r0u;

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Z(Ljava/util/List;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/ywu;->_empty_error_layout:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/fragmentnew2/LiveEmptyErrorView;

    .line 17
    .line 18
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/fragmentnew2/LiveEmptyErrorView;->a(I)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, p1, p2, p3}, Ll/ywu;->m(Ljava/util/List;ZZ)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Ll/ywu;->adapter:Ll/r0u;

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/v6u;->k0()V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public y()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ywu;->adapter:Ll/r0u;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v1, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Z(Ljava/util/List;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-object p0, p0, Ll/ywu;->_empty_error_layout:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/fragmentnew2/LiveEmptyErrorView;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/fragmentnew2/LiveEmptyErrorView;->b()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public z(ZZ)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ywu;->_start_video_chat:Landroid/widget/TextView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/ywu;->_random_entry:Lv/VLinear;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    const-string v0, "p_live_video_quickchat"

    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Ll/ywu;->_start_video_chat:Landroid/widget/TextView;

    .line 18
    .line 19
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    const-string p0, "e_live_video_quickchat_start"

    .line 23
    .line 24
    invoke-static {p0, v0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    if-eqz p2, :cond_1

    .line 29
    .line 30
    iget-object p0, p0, Ll/ywu;->_random_entry:Lv/VLinear;

    .line 31
    .line 32
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 33
    .line 34
    .line 35
    const-string p0, "e_live_video_quickchat_random_button"

    .line 36
    .line 37
    invoke-static {p0, v0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    :cond_1
    return-void
.end method
