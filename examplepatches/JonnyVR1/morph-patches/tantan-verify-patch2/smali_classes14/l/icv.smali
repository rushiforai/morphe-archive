.class public Ll/icv;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/acv;",
        ">;"
    }
.end annotation


# instance fields
.field public _container:Lv/VLinear;

.field public _empty_error_layout:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/fragmentnew2/LiveEmptyErrorView;

.field public _empty_error_layout_image:Lv/VImage;

.field public _empty_error_layout_tv_tip:Lv/VText;

.field public _root_view:Landroid/widget/FrameLayout;

.field public _search_bar:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/search/LiveSearchBar;

.field public _search_list:Lv/VRecyclerView;

.field private adapter:Ll/r0u;

.field private emptyModel:Ll/llt;

.field private footerModel:Ll/h2u;

.field private final frag:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/search/LiveVoiceSearchFrag;

.field private liveGuessClickModel:Ll/cus;

.field private presenter:Ll/acv;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/search/LiveVoiceSearchFrag;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/llt;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/llt;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/icv;->emptyModel:Ll/llt;

    .line 10
    .line 11
    iput-object p1, p0, Ll/icv;->frag:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/search/LiveVoiceSearchFrag;

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic a(Ll/icv;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/icv;->v(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/icv;Ll/uxr;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/icv;->q(Ll/uxr;)V

    return-void
.end method

.method public static synthetic c(Ll/icv;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/icv;->x(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Ll/icv;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/icv;->w(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Ll/icv;Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/icv;->u(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z

    move-result p0

    return p0
.end method

.method public static synthetic f(Ll/icv;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/icv;->s(Ljava/lang/Integer;)V

    return-void
.end method

.method public static bridge synthetic i(Ll/icv;)Ll/r0u;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/icv;->adapter:Ll/r0u;

    return-object p0
.end method

.method private n(Ljava/util/List;ZZ)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/d3q<",
            "*>;>;ZZ)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/icv;->adapter:Ll/r0u;

    .line 2
    .line 3
    iget-object v1, p0, Ll/icv;->footerModel:Ll/h2u;

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
    iput-object v0, p0, Ll/icv;->footerModel:Ll/h2u;

    .line 26
    .line 27
    iget-object p1, p0, Ll/icv;->frag:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/search/LiveVoiceSearchFrag;

    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    sget p2, Ll/m9c0;->z:I

    .line 38
    .line 39
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getColor(I)I

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    invoke-virtual {v0, p1}, Ll/h2u;->I(I)V

    .line 44
    .line 45
    .line 46
    iget-object p1, p0, Ll/icv;->footerModel:Ll/h2u;

    .line 47
    .line 48
    sget p2, Lcom/p1/mobile/putong/live/external/R$string;->q:I

    .line 49
    .line 50
    invoke-static {p2}, Ll/xau;->t(I)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p2

    .line 54
    invoke-virtual {p1, p2}, Ll/h2u;->J(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    iget-object p1, p0, Ll/icv;->adapter:Ll/r0u;

    .line 58
    .line 59
    iget-object p0, p0, Ll/icv;->footerModel:Ll/h2u;

    .line 60
    .line 61
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->E(Ll/d3q;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method private r()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/icv;->_search_bar:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/search/LiveSearchBar;

    .line 2
    .line 3
    invoke-virtual {v0}, Lv/VSearchBar;->getCancelText()Lv/VText;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/bcv;

    .line 8
    .line 9
    invoke-direct {v1, p0}, Ll/bcv;-><init>(Ll/icv;)V

    .line 10
    .line 11
    .line 12
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/icv;->_root_view:Landroid/widget/FrameLayout;

    .line 16
    .line 17
    new-instance v1, Ll/ccv;

    .line 18
    .line 19
    invoke-direct {v1, p0}, Ll/ccv;-><init>(Ll/icv;)V

    .line 20
    .line 21
    .line 22
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Ll/icv;->_search_bar:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/search/LiveSearchBar;

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/search/LiveSearchBar;->i()V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/icv;->_search_list:Lv/VRecyclerView;

    .line 31
    .line 32
    new-instance v1, Ll/icv$a;

    .line 33
    .line 34
    invoke-direct {v1, p0}, Ll/icv$a;-><init>(Ll/icv;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->addOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$t;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Ll/icv;->p()V

    .line 41
    .line 42
    .line 43
    new-instance v0, Ll/cus;

    .line 44
    .line 45
    new-instance v1, Ll/dcv;

    .line 46
    .line 47
    invoke-direct {v1, p0}, Ll/dcv;-><init>(Ll/icv;)V

    .line 48
    .line 49
    .line 50
    invoke-direct {v0, v1}, Ll/cus;-><init>(Landroid/view/View$OnClickListener;)V

    .line 51
    .line 52
    .line 53
    iput-object v0, p0, Ll/icv;->liveGuessClickModel:Ll/cus;

    .line 54
    .line 55
    iget-object v0, p0, Ll/icv;->frag:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/search/LiveVoiceSearchFrag;

    .line 56
    .line 57
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    iget-object p0, p0, Ll/icv;->frag:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/search/LiveVoiceSearchFrag;

    .line 62
    .line 63
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    sget v1, Ll/m9c0;->c:I

    .line 68
    .line 69
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    invoke-virtual {v0, p0}, Lcom/p1/mobile/android/app/Act;->setStatusBarColor(I)V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method private synthetic v(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/icv;->frag:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/search/LiveVoiceSearchFrag;

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

.method private synthetic w(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/icv;->frag:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/search/LiveVoiceSearchFrag;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object p0, p0, Ll/icv;->_search_bar:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/search/LiveSearchBar;

    .line 8
    .line 9
    invoke-virtual {p0}, Lv/VSearchBar;->getEditText()Lv/VEditText;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->hideInput(Landroid/view/View;)Z

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private synthetic x(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/icv;->presenter:Ll/acv;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/acv;->I2()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method


# virtual methods
.method public A()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/icv;->_empty_error_layout:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/fragmentnew2/LiveEmptyErrorView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/icv;->_search_list:Lv/VRecyclerView;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/icv;->_empty_error_layout:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/fragmentnew2/LiveEmptyErrorView;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/fragmentnew2/LiveEmptyErrorView;->c()V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Ll/icv;->_empty_error_layout:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/fragmentnew2/LiveEmptyErrorView;

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/fragmentnew2/LiveEmptyErrorView;->b()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public B(Ljava/util/List;ZZ)V
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
    iget-object v0, p0, Ll/icv;->adapter:Ll/r0u;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/icv;->m()Ll/r0u;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Ll/icv;->adapter:Ll/r0u;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Ll/icv;->_search_list:Lv/VRecyclerView;

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/icv;->_empty_error_layout:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/fragmentnew2/LiveEmptyErrorView;

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/icv;->adapter:Ll/r0u;

    .line 24
    .line 25
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Z(Ljava/util/List;)V

    .line 26
    .line 27
    .line 28
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    if-nez p1, :cond_1

    .line 33
    .line 34
    iget-object p1, p0, Ll/icv;->adapter:Ll/r0u;

    .line 35
    .line 36
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->J()Ljava/util/List;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-direct {p0, p1, p2, p3}, Ll/icv;->n(Ljava/util/List;ZZ)V

    .line 41
    .line 42
    .line 43
    :cond_1
    iget-object p0, p0, Ll/icv;->adapter:Ll/r0u;

    .line 44
    .line 45
    invoke-virtual {p0}, Ll/v6u;->k0()V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/icv;->frag:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/search/LiveVoiceSearchFrag;

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

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/acv;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/icv;->l(Ll/acv;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/icv;->j(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-direct {p0}, Ll/icv;->r()V

    .line 6
    .line 7
    .line 8
    return-object p1
.end method

.method public j(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/jcv;->b(Ll/icv;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public k(Ljava/util/List;ZZ)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/uxr<",
            "*>;>;ZZ)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/icv;->adapter:Ll/r0u;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance v0, Ll/hcv;

    .line 7
    .line 8
    invoke-direct {v0, p0}, Ll/hcv;-><init>(Ll/icv;)V

    .line 9
    .line 10
    .line 11
    invoke-static {p1, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Ll/icv;->adapter:Ll/r0u;

    .line 15
    .line 16
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->J()Ljava/util/List;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-direct {p0, p1, p2, p3}, Ll/icv;->n(Ljava/util/List;ZZ)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public l(Ll/acv;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/icv;->presenter:Ll/acv;

    .line 2
    .line 3
    return-void
.end method

.method public m()Ll/r0u;
    .locals 5

    .line 1
    invoke-static {}, Ll/r0u;->J0()Ll/r0u;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Ll/icv;->adapter:Ll/r0u;

    .line 6
    .line 7
    new-instance v0, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 8
    .line 9
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const/4 v2, 0x6

    .line 14
    const/4 v3, 0x1

    .line 15
    const/4 v4, 0x0

    .line 16
    invoke-direct {v0, v1, v2, v3, v4}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;IIZ)V

    .line 17
    .line 18
    .line 19
    new-instance v1, Ll/icv$c;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/icv$c;-><init>(Ll/icv;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/GridLayoutManager;->v(Landroidx/recyclerview/widget/GridLayoutManager$c;)V

    .line 25
    .line 26
    .line 27
    iget-object v1, p0, Ll/icv;->_search_list:Lv/VRecyclerView;

    .line 28
    .line 29
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/icv;->_search_list:Lv/VRecyclerView;

    .line 33
    .line 34
    iget-object v1, p0, Ll/icv;->adapter:Ll/r0u;

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Ll/icv;->_search_list:Lv/VRecyclerView;

    .line 40
    .line 41
    const/4 v1, 0x0

    .line 42
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setItemAnimator(Landroidx/recyclerview/widget/RecyclerView$l;)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Ll/icv;->adapter:Ll/r0u;

    .line 46
    .line 47
    iget-object v1, p0, Ll/icv;->frag:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/search/LiveVoiceSearchFrag;

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Ll/v6u;->l0(Ll/ner;)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Ll/icv;->adapter:Ll/r0u;

    .line 53
    .line 54
    invoke-virtual {v0, v4}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->X(Z)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Ll/icv;->adapter:Ll/r0u;

    .line 58
    .line 59
    new-instance v1, Ll/gcv;

    .line 60
    .line 61
    invoke-direct {v1, p0}, Ll/gcv;-><init>(Ll/icv;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->c0(Ll/y20;)V

    .line 65
    .line 66
    .line 67
    iget-object p0, p0, Ll/icv;->adapter:Ll/r0u;

    .line 68
    .line 69
    return-object p0
.end method

.method public final p()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/icv;->_search_bar:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/search/LiveSearchBar;

    .line 2
    .line 3
    invoke-virtual {v0}, Lv/VSearchBar;->getEditText()Lv/VEditText;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/ecv;

    .line 8
    .line 9
    invoke-direct {v1, p0}, Ll/ecv;-><init>(Ll/icv;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/icv;->_search_bar:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/search/LiveSearchBar;

    .line 16
    .line 17
    invoke-virtual {v0}, Lv/VSearchBar;->getEditText()Lv/VEditText;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget-object v1, p0, Ll/icv;->_search_bar:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/search/LiveSearchBar;

    .line 22
    .line 23
    invoke-virtual {v1}, Lv/VSearchBar;->getEditText()Lv/VEditText;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    new-instance v2, Ll/fcv;

    .line 31
    .line 32
    invoke-direct {v2, v1}, Ll/fcv;-><init>(Lv/VEditText;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v2}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Ll/icv;->_search_bar:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/search/LiveSearchBar;

    .line 39
    .line 40
    invoke-virtual {v0}, Lv/VSearchBar;->getEditText()Lv/VEditText;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    new-instance v1, Ll/icv$b;

    .line 45
    .line 46
    invoke-direct {v1, p0}, Ll/icv$b;-><init>(Ll/icv;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public final synthetic q(Ll/uxr;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/icv;->adapter:Ll/r0u;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->J()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->N(ILl/d3q;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic s(Ljava/lang/Integer;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object v0, p0, Ll/icv;->adapter:Ll/r0u;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->getItemCount()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    add-int/lit8 v0, v0, -0x2

    .line 12
    .line 13
    if-lt p1, v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ll/icv;->presenter:Ll/acv;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/acv;->F2()V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public final synthetic u(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 1
    const/4 p1, 0x3

    .line 2
    const/4 p3, 0x0

    .line 3
    if-ne p2, p1, :cond_2

    .line 4
    .line 5
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object p2, p0, Ll/icv;->_search_bar:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/search/LiveSearchBar;

    .line 10
    .line 11
    invoke-virtual {p2}, Lv/VSearchBar;->getEditText()Lv/VEditText;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Act;->hideInput(Landroid/view/View;)Z

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Ll/icv;->_search_bar:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/search/LiveSearchBar;

    .line 19
    .line 20
    invoke-virtual {p1}, Lv/VSearchBar;->getEditText()Lv/VEditText;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p1}, Landroid/view/View;->clearFocus()V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Ll/icv;->_search_bar:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/search/LiveSearchBar;

    .line 28
    .line 29
    invoke-virtual {p1}, Lv/VSearchBar;->getEditText()Lv/VEditText;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    if-eqz p1, :cond_1

    .line 38
    .line 39
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 44
    .line 45
    .line 46
    move-result p2

    .line 47
    if-eqz p2, :cond_0

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_0
    iget-object p0, p0, Ll/icv;->presenter:Ll/acv;

    .line 51
    .line 52
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-virtual {p0, p1}, Ll/acv;->y2(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    goto :goto_1

    .line 60
    :cond_1
    :goto_0
    const-string p0, "\u8bf7\u8f93\u5165\u6b63\u786e\u7684\u623f\u95f4\u540d\u79f0/\u623f\u95f4ID"

    .line 61
    .line 62
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    :cond_2
    :goto_1
    return p3
.end method

.method public y()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/icv;->adapter:Ll/r0u;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/icv;->m()Ll/r0u;

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Ll/icv;->adapter:Ll/r0u;

    .line 9
    .line 10
    iget-object p0, p0, Ll/icv;->emptyModel:Ll/llt;

    .line 11
    .line 12
    filled-new-array {p0}, [Ll/llt;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Z(Ljava/util/List;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public z(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/uxr<",
            "*>;>;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/icv;->_empty_error_layout:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/fragmentnew2/LiveEmptyErrorView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/icv;->_search_list:Lv/VRecyclerView;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Ll/icv;->y()V

    .line 14
    .line 15
    .line 16
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    iget-object v0, p0, Ll/icv;->adapter:Ll/r0u;

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->J()Ljava/util/List;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iget-object v1, p0, Ll/icv;->liveGuessClickModel:Ll/cus;

    .line 29
    .line 30
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/icv;->adapter:Ll/r0u;

    .line 34
    .line 35
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->J()Ljava/util/List;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Ll/icv;->adapter:Ll/r0u;

    .line 43
    .line 44
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 45
    .line 46
    .line 47
    iget-object p0, p0, Ll/icv;->adapter:Ll/r0u;

    .line 48
    .line 49
    invoke-virtual {p0}, Ll/v6u;->k0()V

    .line 50
    .line 51
    .line 52
    :cond_0
    return-void
.end method
