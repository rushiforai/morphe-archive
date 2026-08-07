.class public Ll/ijr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/fjr;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/navigationbar/VNavigationBar;

.field public b:Landroidx/recyclerview/widget/RecyclerView;

.field public c:Lv/VFrame;

.field public d:Lv/VFrame;

.field public e:Landroid/widget/LinearLayout;

.field public f:Lv/VImage;

.field public g:Lv/VText;

.field public h:Lv/VProgressBar;

.field public i:Lv/VPullUpRecyclerView;

.field public j:Landroid/view/View;

.field public k:Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserFilterBar;

.field public l:Landroid/widget/Button;

.field public m:Landroid/widget/RelativeLayout;

.field public n:Lv/VText;

.field public o:Lv/VText;

.field public p:Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserFrag;

.field public q:Ll/fjr;

.field public r:Landroidx/recyclerview/widget/GridLayoutManager;

.field public s:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/animation/Animator;",
            ">;"
        }
    .end annotation
.end field

.field public t:Ll/om0;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserFrag;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/ijr;->s:Ljava/util/ArrayList;

    .line 10
    .line 11
    iput-object p1, p0, Ll/ijr;->p:Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserFrag;

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic a(Ll/ijr;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ijr;->l(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/ijr;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ijr;->m(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ijr;->p:Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserFrag;

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

.method public c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/jjr;->b(Ll/ijr;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public d(Ll/fjr;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ijr;->q:Ll/fjr;

    .line 2
    .line 3
    return-void
.end method

.method public destroy()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ijr;->s:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ll/ijr;->s:Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    check-cast v1, Landroid/animation/Animator;

    .line 26
    .line 27
    invoke-virtual {v1}, Landroid/animation/Animator;->cancel()V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    iget-object p0, p0, Ll/ijr;->s:Ljava/util/ArrayList;

    .line 32
    .line 33
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    .line 34
    .line 35
    .line 36
    :cond_1
    return-void
.end method

.method public e()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ijr;->a:Lv/navigationbar/VNavigationBar;

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

.method public f()V
    .locals 2

    .line 1
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 2
    .line 3
    iget-object v1, p0, Ll/ijr;->p:Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserFrag;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-direct {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;->setOrientation(I)V

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Ll/ijr;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 17
    .line 18
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 19
    .line 20
    .line 21
    new-instance v0, Ll/om0;

    .line 22
    .line 23
    iget-object v1, p0, Ll/ijr;->p:Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserFrag;

    .line 24
    .line 25
    invoke-direct {v0, v1}, Ll/om0;-><init>(Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserFrag;)V

    .line 26
    .line 27
    .line 28
    iput-object v0, p0, Ll/ijr;->t:Ll/om0;

    .line 29
    .line 30
    iget-object p0, p0, Ll/ijr;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 31
    .line 32
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public i()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ijr;->k:Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserFilterBar;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Ll/ijr;->i:Lv/VPullUpRecyclerView;

    .line 8
    .line 9
    const/4 v0, -0x1

    .line 10
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/fjr;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ijr;->d(Ll/fjr;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ijr;->c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public j(ZZ)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x4

    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Ll/ijr;->d:Lv/VFrame;

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Ll/ijr;->e:Landroid/widget/LinearLayout;

    .line 11
    .line 12
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Ll/ijr;->h:Lv/VProgressBar;

    .line 16
    .line 17
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ll/ijr;->i:Lv/VPullUpRecyclerView;

    .line 21
    .line 22
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    iget-object p1, p0, Ll/ijr;->d:Lv/VFrame;

    .line 27
    .line 28
    if-eqz p2, :cond_1

    .line 29
    .line 30
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Ll/ijr;->e:Landroid/widget/LinearLayout;

    .line 34
    .line 35
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 36
    .line 37
    .line 38
    iget-object p1, p0, Ll/ijr;->h:Lv/VProgressBar;

    .line 39
    .line 40
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Ll/ijr;->i:Lv/VPullUpRecyclerView;

    .line 44
    .line 45
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Ll/ijr;->g:Lv/VText;

    .line 49
    .line 50
    sget p1, Lcom/p1/mobile/putong/core/member/R$string;->v:I

    .line 51
    .line 52
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

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
    iget-object p1, p0, Ll/ijr;->e:Landroid/widget/LinearLayout;

    .line 60
    .line 61
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 62
    .line 63
    .line 64
    iget-object p1, p0, Ll/ijr;->h:Lv/VProgressBar;

    .line 65
    .line 66
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 67
    .line 68
    .line 69
    iget-object p0, p0, Ll/ijr;->i:Lv/VPullUpRecyclerView;

    .line 70
    .line 71
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public k(Ll/x20;)V
    .locals 3

    .line 1
    new-instance v0, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 2
    .line 3
    iget-object v1, p0, Ll/ijr;->p:Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserFrag;

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
    iput-object v0, p0, Ll/ijr;->r:Landroidx/recyclerview/widget/GridLayoutManager;

    .line 14
    .line 15
    new-instance v1, Ll/ijr$a;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Ll/ijr$a;-><init>(Ll/ijr;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/GridLayoutManager;->v(Landroidx/recyclerview/widget/GridLayoutManager$c;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/ijr;->i:Lv/VPullUpRecyclerView;

    .line 24
    .line 25
    iget-object v1, p0, Ll/ijr;->r:Landroidx/recyclerview/widget/GridLayoutManager;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/ijr;->i:Lv/VPullUpRecyclerView;

    .line 31
    .line 32
    iget-object v1, p0, Ll/ijr;->p:Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserFrag;

    .line 33
    .line 34
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserFrag;->Q4()Ll/ahr;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0, p1}, Ll/ijr;->v(Ll/x20;)V

    .line 42
    .line 43
    .line 44
    iget-object p1, p0, Ll/ijr;->a:Lv/navigationbar/VNavigationBar;

    .line 45
    .line 46
    iget-object v0, p0, Ll/ijr;->p:Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserFrag;

    .line 47
    .line 48
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {p1, v0}, Lv/navigationbar/VNavigationBar;->setLeftIconAsBack(Landroid/app/Activity;)V

    .line 53
    .line 54
    .line 55
    iget-object p0, p0, Ll/ijr;->a:Lv/navigationbar/VNavigationBar;

    .line 56
    .line 57
    sget p1, Ll/gbc0;->b:I

    .line 58
    .line 59
    invoke-virtual {p0, p1}, Lv/navigationbar/VNavigationBar;->setLeftIconResource(I)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public final synthetic l(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ijr;->q:Ll/fjr;

    .line 2
    .line 3
    const-string p1, "p_navigation_ilike,card_button_pull"

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/fjr;->f1(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic m(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ijr;->q:Ll/fjr;

    .line 2
    .line 3
    const-string p1, "p_navigation_ilike,card_button_pull"

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/fjr;->f1(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public n(Z)V
    .locals 1

    .line 1
    xor-int/lit8 v0, p1, 0x1

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/ijr;->w(Z)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/ijr;->p:Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserFrag;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserFrag;->Q4()Ll/ahr;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0, p1}, Ll/ahr;->R(Z)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public p(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/pm0;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/ijr;->t:Ll/om0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Ll/ijr;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 7
    .line 8
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    iget-object v0, p0, Ll/ijr;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 15
    .line 16
    const/4 v1, 0x1

    .line 17
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    :cond_1
    iget-object p0, p0, Ll/ijr;->t:Ll/om0;

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Ll/om0;->G(Ljava/util/List;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public q()V
    .locals 2

    .line 1
    invoke-static {}, Ll/rs9;->d()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/ijr;->m:Landroid/widget/RelativeLayout;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/ijr;->l:Landroid/widget/Button;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/ijr;->m:Landroid/widget/RelativeLayout;

    .line 20
    .line 21
    new-instance v1, Ll/gjr;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Ll/gjr;-><init>(Ll/ijr;)V

    .line 24
    .line 25
    .line 26
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    iget-object v0, p0, Ll/ijr;->l:Landroid/widget/Button;

    .line 31
    .line 32
    new-instance v1, Ll/hjr;

    .line 33
    .line 34
    invoke-direct {v1, p0}, Ll/hjr;-><init>(Ll/ijr;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public s(Ll/vg60;Z)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/core/data/LikedUser;",
            ">;Z)V"
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
    iget-object v2, p0, Ll/ijr;->p:Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserFrag;

    .line 11
    .line 12
    invoke-virtual {v2}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    sget v3, Lcom/p1/mobile/putong/core/member/R$string;->w:I

    .line 17
    .line 18
    const/16 v4, 0x63

    .line 19
    .line 20
    if-le v1, v4, :cond_1

    .line 21
    .line 22
    const-string v4, "99+"

    .line 23
    .line 24
    goto :goto_1

    .line 25
    :cond_1
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v4

    .line 29
    :goto_1
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v4

    .line 33
    invoke-virtual {v2, v3, v4}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-virtual {p0, v2}, Ll/ijr;->u(Ljava/lang/CharSequence;)V

    .line 38
    .line 39
    .line 40
    const/4 v2, 0x1

    .line 41
    if-nez v1, :cond_3

    .line 42
    .line 43
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Vf()Z

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    if-eqz p1, :cond_2

    .line 56
    .line 57
    xor-int/lit8 p1, p2, 0x1

    .line 58
    .line 59
    invoke-virtual {p0, p1}, Ll/ijr;->w(Z)V

    .line 60
    .line 61
    .line 62
    goto :goto_2

    .line 63
    :cond_2
    invoke-virtual {p0, v0}, Ll/ijr;->w(Z)V

    .line 64
    .line 65
    .line 66
    :goto_2
    invoke-virtual {p0, v0, v2}, Ll/ijr;->j(ZZ)V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :cond_3
    iget-object v1, p0, Ll/ijr;->p:Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserFrag;

    .line 71
    .line 72
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserFrag;->Q4()Ll/ahr;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    iget-object p1, p1, Ll/vg60;->a:Ljava/util/List;

    .line 77
    .line 78
    invoke-virtual {v1, p1, p2}, Ll/ahr;->T(Ljava/util/List;Z)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {p0, v0, v0}, Ll/ijr;->j(ZZ)V

    .line 82
    .line 83
    .line 84
    xor-int/lit8 p1, p2, 0x1

    .line 85
    .line 86
    invoke-virtual {p0, p1}, Ll/ijr;->w(Z)V

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method public u(Ljava/lang/CharSequence;)V
    .locals 1

    .line 1
    new-instance v0, Landroid/text/SpannableStringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 7
    .line 8
    .line 9
    const-string p1, " "

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/ijr;->a:Lv/navigationbar/VNavigationBar;

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Lv/navigationbar/VNavigationBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final v(Ll/x20;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ijr;->i:Lv/VPullUpRecyclerView;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lv/VPullUpRecyclerView;->setOnPullUpListener(Ll/x20;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/ijr;->i:Lv/VPullUpRecyclerView;

    .line 7
    .line 8
    const-wide/16 v0, 0x12c

    .line 9
    .line 10
    invoke-virtual {p0, v0, v1}, Lv/VPullUpRecyclerView;->setPullUpInterval(J)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public w(Z)V
    .locals 1

    .line 1
    invoke-static {}, Ll/rs9;->d()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/ijr;->m:Landroid/widget/RelativeLayout;

    .line 8
    .line 9
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-object p0, p0, Ll/ijr;->l:Landroid/widget/Button;

    .line 14
    .line 15
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
