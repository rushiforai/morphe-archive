.class public Ll/fir;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/cir;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VPullUpRecyclerView;

.field public b:Landroidx/core/widget/NestedScrollView;

.field public c:Landroid/widget/TextView;

.field public d:Lcom/p1/mobile/putong/core/newui/PlatformQualificationView;

.field public e:Landroid/widget/Button;

.field public f:Lcom/p1/mobile/putong/core/ui/likedusers/mytab/LikedUsersMyTabFrag;

.field public g:Ll/cir;

.field public h:Landroidx/recyclerview/widget/GridLayoutManager;

.field public i:Ljava/lang/Boolean;

.field public j:Z

.field public k:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/likedusers/mytab/LikedUsersMyTabFrag;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 5
    .line 6
    iput-object v0, p0, Ll/fir;->i:Ljava/lang/Boolean;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Ll/fir;->j:Z

    .line 10
    .line 11
    iput-boolean v0, p0, Ll/fir;->k:Z

    .line 12
    .line 13
    iput-object p1, p0, Ll/fir;->f:Lcom/p1/mobile/putong/core/ui/likedusers/mytab/LikedUsersMyTabFrag;

    .line 14
    .line 15
    return-void
.end method

.method public static synthetic a(Ll/fir;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/fir;->k(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/fir;Lcom/p1/mobile/putong/core/data/LikedUser;)Ll/fir$c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fir;->l(Lcom/p1/mobile/putong/core/data/LikedUser;)Ll/fir$c;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic c(Ll/fir;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/fir;->k:Z

    return p0
.end method

.method public static bridge synthetic d(Ll/fir;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/fir;->j:Z

    return p0
.end method

.method public static bridge synthetic e(Ll/fir;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/fir;->k:Z

    return-void
.end method

.method public static bridge synthetic f(Ll/fir;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/fir;->j:Z

    return-void
.end method

.method private synthetic k(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fir;->g:Ll/cir;

    .line 2
    .line 3
    const-string p1, "p_navigation,ilike_module"

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/cir;->L0(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/fir;->f:Lcom/p1/mobile/putong/core/ui/likedusers/mytab/LikedUsersMyTabFrag;

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

.method public i(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/hir;->b(Ll/fir;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

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
    check-cast p1, Ll/cir;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/fir;->j(Ll/cir;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/fir;->i(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 p1, -0x1

    .line 6
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 7
    .line 8
    .line 9
    return-object p0
.end method

.method public j(Ll/cir;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fir;->g:Ll/cir;

    .line 2
    .line 3
    return-void
.end method

.method public final synthetic l(Lcom/p1/mobile/putong/core/data/LikedUser;)Ll/fir$c;
    .locals 1

    .line 1
    new-instance v0, Ll/fir$c;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/fir$c;-><init>(Ll/fir;Lcom/p1/mobile/putong/core/data/LikedUser;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public m(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fir;->i:Ljava/lang/Boolean;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-virtual {p0, v0}, Ll/fir;->s(Z)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/fir;->f:Lcom/p1/mobile/putong/core/ui/likedusers/mytab/LikedUsersMyTabFrag;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/likedusers/mytab/LikedUsersMyTabFrag;->O4()Ll/ohr;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0, p1}, Ll/ohr;->R(Z)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public n()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fir;->e:Landroid/widget/Button;

    .line 2
    .line 3
    new-instance v1, Ll/dir;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/dir;-><init>(Ll/fir;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public p(Ljava/util/ArrayList;Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/data/LikedUser;",
            ">;Z)V"
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
    const/4 p1, 0x1

    .line 8
    invoke-virtual {p0, p1}, Ll/fir;->q(Z)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    const/4 v0, 0x0

    .line 13
    invoke-virtual {p0, v0}, Ll/fir;->q(Z)V

    .line 14
    .line 15
    .line 16
    new-instance v0, Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 19
    .line 20
    .line 21
    new-instance v1, Ll/eir;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Ll/eir;-><init>(Ll/fir;)V

    .line 24
    .line 25
    .line 26
    invoke-static {p1, v1}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 31
    .line 32
    .line 33
    new-instance p1, Ll/fir$d;

    .line 34
    .line 35
    invoke-direct {p1, p0}, Ll/fir$d;-><init>(Ll/fir;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    iget-object p0, p0, Ll/fir;->f:Lcom/p1/mobile/putong/core/ui/likedusers/mytab/LikedUsersMyTabFrag;

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/likedusers/mytab/LikedUsersMyTabFrag;->O4()Ll/ohr;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {p0, v0, p2}, Ll/ohr;->T(Ljava/util/ArrayList;Z)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public q(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fir;->b:Landroidx/core/widget/NestedScrollView;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/fir;->a:Lv/VPullUpRecyclerView;

    .line 7
    .line 8
    xor-int/lit8 p1, p1, 0x1

    .line 9
    .line 10
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public r()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/fir;->c:Landroid/widget/TextView;

    .line 2
    .line 3
    const-string v1, "\u53bb\u6ed1\u5361\u53d1\u73b0\u66f4\u591a\u559c\u6b22\u7684\u4eba"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/fir;->d:Lcom/p1/mobile/putong/core/newui/PlatformQualificationView;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    new-instance v0, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 15
    .line 16
    iget-object v1, p0, Ll/fir;->f:Lcom/p1/mobile/putong/core/ui/likedusers/mytab/LikedUsersMyTabFrag;

    .line 17
    .line 18
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    const/4 v2, 0x2

    .line 23
    invoke-direct {v0, v1, v2}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Ll/fir;->h:Landroidx/recyclerview/widget/GridLayoutManager;

    .line 27
    .line 28
    new-instance v1, Ll/fir$a;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Ll/fir$a;-><init>(Ll/fir;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/GridLayoutManager;->v(Landroidx/recyclerview/widget/GridLayoutManager$c;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ll/fir;->a:Lv/VPullUpRecyclerView;

    .line 37
    .line 38
    iget-object v1, p0, Ll/fir;->h:Landroidx/recyclerview/widget/GridLayoutManager;

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Ll/fir;->a:Lv/VPullUpRecyclerView;

    .line 44
    .line 45
    new-instance v1, Ll/fir$b;

    .line 46
    .line 47
    invoke-direct {v1, p0}, Ll/fir$b;-><init>(Ll/fir;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$t;)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Ll/fir;->a:Lv/VPullUpRecyclerView;

    .line 54
    .line 55
    iget-object v1, p0, Ll/fir;->f:Lcom/p1/mobile/putong/core/ui/likedusers/mytab/LikedUsersMyTabFrag;

    .line 56
    .line 57
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/likedusers/mytab/LikedUsersMyTabFrag;->O4()Ll/ohr;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 62
    .line 63
    .line 64
    new-instance v0, Landroidx/recyclerview/widget/k;

    .line 65
    .line 66
    iget-object v1, p0, Ll/fir;->g:Ll/cir;

    .line 67
    .line 68
    invoke-virtual {v1}, Ll/cir;->r0()Landroidx/recyclerview/widget/k$e;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    invoke-direct {v0, v1}, Landroidx/recyclerview/widget/k;-><init>(Landroidx/recyclerview/widget/k$e;)V

    .line 73
    .line 74
    .line 75
    iget-object v1, p0, Ll/fir;->a:Lv/VPullUpRecyclerView;

    .line 76
    .line 77
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/k;->g(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 78
    .line 79
    .line 80
    const/4 v0, 0x1

    .line 81
    invoke-virtual {p0, v0}, Ll/fir;->q(Z)V

    .line 82
    .line 83
    .line 84
    iget-object v0, p0, Ll/fir;->i:Ljava/lang/Boolean;

    .line 85
    .line 86
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    invoke-virtual {p0, v0}, Ll/fir;->s(Z)V

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method public s(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fir;->e:Landroid/widget/Button;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    invoke-static {}, Ll/joa;->M3()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    :cond_0
    iget-object p0, p0, Ll/fir;->e:Landroid/widget/Button;

    .line 17
    .line 18
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    :cond_1
    return-void
.end method
