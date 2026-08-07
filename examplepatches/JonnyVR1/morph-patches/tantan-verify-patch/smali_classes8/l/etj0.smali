.class public Ll/etj0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/ctj0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VFrame;

.field public b:Landroid/widget/LinearLayout;

.field public c:Lv/VImage;

.field public d:Lv/VText;

.field public e:Lv/VProgressBar;

.field public f:Lv/VPullUpRecyclerView;

.field public g:Lv/VText;

.field public h:Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserFrag;

.field public i:Ll/ctj0;

.field public j:Landroidx/recyclerview/widget/GridLayoutManager;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/etj0;->h:Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserFrag;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/etj0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/etj0;->f(Landroid/view/View;)V

    return-void
.end method

.method private synthetic f(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/etj0;->i:Ll/ctj0;

    .line 2
    .line 3
    const-string p1, "p_navigation_disliked,card_button_pull"

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/ctj0;->F0(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private l(Ll/x20;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/etj0;->f:Lv/VPullUpRecyclerView;

    .line 2
    .line 3
    new-instance v1, Ll/etj0$b;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Ll/etj0$b;-><init>(Ll/etj0;Ll/x20;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->addOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$t;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/etj0;->h:Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserFrag;

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

.method public b(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/ftj0;->b(Ll/etj0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public c(Ll/ctj0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/etj0;->i:Ll/ctj0;

    .line 2
    .line 3
    return-void
.end method

.method public d(ZZ)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x4

    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Ll/etj0;->a:Lv/VFrame;

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Ll/etj0;->b:Landroid/widget/LinearLayout;

    .line 11
    .line 12
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Ll/etj0;->e:Lv/VProgressBar;

    .line 16
    .line 17
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ll/etj0;->f:Lv/VPullUpRecyclerView;

    .line 21
    .line 22
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    iget-object p1, p0, Ll/etj0;->a:Lv/VFrame;

    .line 27
    .line 28
    if-eqz p2, :cond_1

    .line 29
    .line 30
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Ll/etj0;->b:Landroid/widget/LinearLayout;

    .line 34
    .line 35
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 36
    .line 37
    .line 38
    iget-object p1, p0, Ll/etj0;->e:Lv/VProgressBar;

    .line 39
    .line 40
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Ll/etj0;->f:Lv/VPullUpRecyclerView;

    .line 44
    .line 45
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Ll/etj0;->d:Lv/VText;

    .line 49
    .line 50
    const-string p1, "\u8fd8\u6ca1\u6709\u65e0\u611f\u7684\u4eba\uff0c\u5feb\u53bb\u6ed1\u5361\u5bfb\u627e\u65b0\u670b\u53cb\u5427\uff01"

    .line 51
    .line 52
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_1
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 57
    .line 58
    .line 59
    iget-object p1, p0, Ll/etj0;->b:Landroid/widget/LinearLayout;

    .line 60
    .line 61
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 62
    .line 63
    .line 64
    iget-object p1, p0, Ll/etj0;->e:Lv/VProgressBar;

    .line 65
    .line 66
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 67
    .line 68
    .line 69
    iget-object p0, p0, Ll/etj0;->f:Lv/VPullUpRecyclerView;

    .line 70
    .line 71
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e(Ll/x20;)V
    .locals 3

    .line 1
    new-instance v0, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 2
    .line 3
    iget-object v1, p0, Ll/etj0;->h:Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserFrag;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const/4 v2, 0x2

    .line 10
    invoke-direct {v0, v1, v2}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Ll/etj0;->j:Landroidx/recyclerview/widget/GridLayoutManager;

    .line 14
    .line 15
    new-instance v1, Ll/etj0$a;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Ll/etj0$a;-><init>(Ll/etj0;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/GridLayoutManager;->v(Landroidx/recyclerview/widget/GridLayoutManager$c;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/etj0;->f:Lv/VPullUpRecyclerView;

    .line 24
    .line 25
    iget-object v1, p0, Ll/etj0;->j:Landroidx/recyclerview/widget/GridLayoutManager;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/etj0;->f:Lv/VPullUpRecyclerView;

    .line 31
    .line 32
    iget-object v1, p0, Ll/etj0;->h:Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserFrag;

    .line 33
    .line 34
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserFrag;->O4()Ll/lsj0;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 39
    .line 40
    .line 41
    invoke-direct {p0, p1}, Ll/etj0;->l(Ll/x20;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public i(Z)V
    .locals 1

    .line 1
    xor-int/lit8 v0, p1, 0x1

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/etj0;->m(Z)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/etj0;->h:Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserFrag;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserFrag;->O4()Ll/lsj0;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0, p1}, Ll/lsj0;->M(Z)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/ctj0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/etj0;->c(Ll/ctj0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/etj0;->b(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public j()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/etj0;->g:Lv/VText;

    .line 2
    .line 3
    new-instance v1, Ll/dtj0;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/dtj0;-><init>(Ll/etj0;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public k(Ljava/util/List;Z)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/DislikedUsers;",
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
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    move v0, v1

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    :goto_0
    const/4 v2, 0x1

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0, v1, v2}, Ll/etj0;->d(ZZ)V

    .line 18
    .line 19
    .line 20
    xor-int/lit8 p1, p2, 0x1

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Ll/etj0;->m(Z)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_1
    invoke-virtual {p0, v1, v1}, Ll/etj0;->d(ZZ)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/etj0;->h:Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserFrag;

    .line 30
    .line 31
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserFrag;->O4()Ll/lsj0;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v0, p1, p2}, Ll/lsj0;->O(Ljava/util/List;Z)V

    .line 36
    .line 37
    .line 38
    xor-int/lit8 p1, p2, 0x1

    .line 39
    .line 40
    invoke-virtual {p0, p1}, Ll/etj0;->m(Z)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public m(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/etj0;->g:Lv/VText;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
