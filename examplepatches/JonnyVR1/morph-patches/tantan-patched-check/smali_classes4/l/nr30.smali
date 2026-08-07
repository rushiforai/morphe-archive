.class public Ll/nr30;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/navigationbar/VNavigationBar;

.field public b:Lv/VPullDownRefreshLayout;

.field public c:Landroidx/recyclerview/widget/RecyclerView;

.field public d:Landroid/widget/LinearLayout;

.field public e:Lv/VProgressBar;

.field public f:Lv/VImage;

.field public final g:Lcom/p1/mobile/android/app/Act;

.field public h:Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/nr30;->g:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/nr30;Ll/mvc0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nr30;->m(Ll/mvc0;)V

    return-void
.end method

.method public static synthetic b(Ll/nr30;Ll/mvc0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nr30;->n(Ll/mvc0;)V

    return-void
.end method

.method public static synthetic c(Ll/nr30;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/nr30;->p(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic d(Ll/nr30;)Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nr30;->h:Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;

    return-object p0
.end method

.method private j()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/nr30;->c:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    new-instance v1, Ll/ur30;

    .line 4
    .line 5
    iget-object v2, p0, Ll/nr30;->h:Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ll/ur30;-><init>(Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/nr30;->c:Landroidx/recyclerview/widget/RecyclerView;

    .line 14
    .line 15
    new-instance v1, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/nr30;->C0()Landroid/content/Context;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    const/4 v3, 0x1

    .line 22
    const/4 v4, 0x0

    .line 23
    invoke-direct {v1, v2, v3, v4}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 27
    .line 28
    .line 29
    new-instance v0, Landroid/graphics/drawable/ShapeDrawable;

    .line 30
    .line 31
    new-instance v1, Landroid/graphics/drawable/shapes/RectShape;

    .line 32
    .line 33
    invoke-direct {v1}, Landroid/graphics/drawable/shapes/RectShape;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-direct {v0, v1}, Landroid/graphics/drawable/ShapeDrawable;-><init>(Landroid/graphics/drawable/shapes/Shape;)V

    .line 37
    .line 38
    .line 39
    sget v1, Ll/qa00;->d:I

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/ShapeDrawable;->setIntrinsicHeight(I)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    const-string v2, "#f9f9f9"

    .line 49
    .line 50
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 55
    .line 56
    .line 57
    iget-object v1, p0, Ll/nr30;->c:Landroidx/recyclerview/widget/RecyclerView;

    .line 58
    .line 59
    new-instance v2, Ll/eby;

    .line 60
    .line 61
    invoke-direct {v2, v0}, Ll/eby;-><init>(Landroid/graphics/drawable/Drawable;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Ll/nr30;->c:Landroidx/recyclerview/widget/RecyclerView;

    .line 68
    .line 69
    new-instance v1, Ll/nr30$a;

    .line 70
    .line 71
    invoke-direct {v1, p0}, Ll/nr30$a;-><init>(Ll/nr30;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->addOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$t;)V

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Ll/nr30;->b:Lv/VPullDownRefreshLayout;

    .line 78
    .line 79
    new-instance v1, Ll/lr30;

    .line 80
    .line 81
    invoke-direct {v1, p0}, Ll/lr30;-><init>(Ll/nr30;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {v0, v1}, Lv/VPullDownRefreshLayout;->O(Ll/jn50;)Ll/mvc0;

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Ll/nr30;->b:Lv/VPullDownRefreshLayout;

    .line 88
    .line 89
    new-instance v1, Ll/mr30;

    .line 90
    .line 91
    invoke-direct {v1, p0}, Ll/mr30;-><init>(Ll/nr30;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {v0, v1}, Lv/VPullDownRefreshLayout;->M(Ll/tm50;)Ll/mvc0;

    .line 95
    .line 96
    .line 97
    iget-object p0, p0, Ll/nr30;->b:Lv/VPullDownRefreshLayout;

    .line 98
    .line 99
    invoke-virtual {p0, v4}, Lv/smart_refresh/SmartRefreshLayout;->H(Z)Ll/mvc0;

    .line 100
    .line 101
    .line 102
    return-void
.end method

.method private synthetic p(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nr30;->c:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/nr30;->g:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/nr30;->g:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
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
    invoke-static {p0, p1, p2}, Ll/or30;->b(Ll/nr30;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public f(Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/nr30;->h:Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;

    .line 2
    .line 3
    return-void
.end method

.method public i()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nr30;->b:Lv/VPullDownRefreshLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Lv/smart_refresh/SmartRefreshLayout;->t()Ll/mvc0;

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/nr30;->b:Lv/VPullDownRefreshLayout;

    .line 7
    .line 8
    invoke-virtual {p0}, Lv/smart_refresh/SmartRefreshLayout;->o()Ll/mvc0;

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/nr30;->f(Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/nr30;->e(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public k()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/nr30;->a:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public l(Landroidx/recyclerview/widget/RecyclerView;)Z
    .locals 2

    .line 1
    const/4 p0, 0x0

    .line 2
    if-eqz p1, :cond_1

    .line 3
    .line 4
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->computeVerticalScrollRange()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    invoke-static {}, Ll/bnl0;->w0()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-gt v0, v1, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->computeVerticalScrollExtent()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->computeVerticalScrollOffset()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    add-int/2addr v0, v1

    .line 24
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->computeVerticalScrollRange()I

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-lt v0, p1, :cond_1

    .line 29
    .line 30
    const/4 p0, 0x1

    .line 31
    :cond_1
    :goto_0
    return p0
.end method

.method public final synthetic m(Ll/mvc0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nr30;->h:Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->m1()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic n(Ll/mvc0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nr30;->h:Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->p1()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public q(Ljava/util/List;Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetListData;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/nr30;->c:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/nr30;->d:Landroid/widget/LinearLayout;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/nr30;->e:Lv/VProgressBar;

    .line 14
    .line 15
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Ll/nr30;->c:Landroidx/recyclerview/widget/RecyclerView;

    .line 19
    .line 20
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    check-cast p0, Ll/ur30;

    .line 25
    .line 26
    invoke-virtual {p0, p2, p1}, Ll/ur30;->P(Ljava/util/List;Ljava/util/List;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public r()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/nr30;->d:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    const/16 v1, 0x71

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/nr30;->e:Lv/VProgressBar;

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ll/nr30;->k()V

    .line 15
    .line 16
    .line 17
    invoke-direct {p0}, Ll/nr30;->j()V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/nr30;->f:Lv/VImage;

    .line 21
    .line 22
    new-instance v1, Ll/kr30;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/kr30;-><init>(Ll/nr30;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public s()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/nr30;->c:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/nr30;->d:Landroid/widget/LinearLayout;

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    invoke-static {v0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Ll/nr30;->e:Lv/VProgressBar;

    .line 14
    .line 15
    invoke-static {p0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public u(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nr30;->b:Lv/VPullDownRefreshLayout;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    invoke-virtual {p0, p1}, Lv/smart_refresh/SmartRefreshLayout;->G(Z)Ll/mvc0;

    .line 8
    .line 9
    .line 10
    return-void
.end method
