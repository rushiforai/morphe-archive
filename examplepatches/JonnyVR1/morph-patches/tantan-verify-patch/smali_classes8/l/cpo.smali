.class public Ll/cpo;
.super Ll/k4n;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/material/tabs/TabLayout$OnTabSelectedListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/cpo$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/k4n<",
        "Ll/apo;",
        ">;",
        "Lcom/google/android/material/tabs/TabLayout$OnTabSelectedListener;"
    }
.end annotation


# instance fields
.field public d:Lv/navigationbar/VNavigationBar;

.field public e:Lcom/google/android/material/tabs/TabLayout;

.field public f:Lcom/p1/mobile/putong/core/newui/greet/ui/ImDiscoveryPager;

.field public final g:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lv/VText;",
            ">;"
        }
    .end annotation
.end field

.field public final h:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public final i:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lv/VRecyclerView;",
            ">;"
        }
    .end annotation
.end field

.field public final j:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/qbn;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlDynamicGreetListAct;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/k4n;-><init>(Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlDynamicGreetListAct;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/cpo;->g:Ljava/util/List;

    .line 10
    .line 11
    new-instance p1, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Ll/cpo;->h:Ljava/util/List;

    .line 17
    .line 18
    new-instance p1, Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object p1, p0, Ll/cpo;->i:Ljava/util/List;

    .line 24
    .line 25
    new-instance p1, Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object p1, p0, Ll/cpo;->j:Ljava/util/List;

    .line 31
    .line 32
    return-void
.end method

.method public static synthetic f(Ll/cpo;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/cpo;->l(ILandroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic i(Ll/cpo;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cpo;->i:Ljava/util/List;

    return-object p0
.end method


# virtual methods
.method public b()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/fzq;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/cpo;->j:Ljava/util/List;

    .line 2
    .line 3
    iget-object p0, p0, Ll/k4n;->b:Ll/j4n;

    .line 4
    .line 5
    check-cast p0, Ll/apo;

    .line 6
    .line 7
    iget p0, p0, Ll/apo;->b:I

    .line 8
    .line 9
    invoke-interface {v0, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Ll/qbn;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/qbn;->T()Ljava/util/List;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public e()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cpo;->j:Ljava/util/List;

    .line 2
    .line 3
    iget-object p0, p0, Ll/k4n;->b:Ll/j4n;

    .line 4
    .line 5
    check-cast p0, Ll/apo;

    .line 6
    .line 7
    iget p0, p0, Ll/apo;->b:I

    .line 8
    .line 9
    invoke-interface {v0, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Ll/qbn;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/qbn;->Y()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/cpo;->j(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p2, p0, Ll/cpo;->d:Lv/navigationbar/VNavigationBar;

    .line 6
    .line 7
    invoke-virtual {p0, p2}, Ll/k4n;->c(Lv/navigationbar/VNavigationBar;)V

    .line 8
    .line 9
    .line 10
    return-object p1
.end method

.method public j(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/epo;->b(Ll/cpo;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final k(I)V
    .locals 6

    .line 1
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Ll/qec0;->P0:I

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sget v1, Ll/edc0;->s4:I

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Lv/VText;

    .line 23
    .line 24
    sget v2, Ll/edc0;->t4:I

    .line 25
    .line 26
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    sget v3, Ll/edc0;->k1:I

    .line 31
    .line 32
    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    iget-object v4, p0, Ll/k4n;->b:Ll/j4n;

    .line 37
    .line 38
    check-cast v4, Ll/apo;

    .line 39
    .line 40
    iget-object v4, v4, Ll/apo;->c:[Ljava/lang/String;

    .line 41
    .line 42
    aget-object v4, v4, p1

    .line 43
    .line 44
    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 45
    .line 46
    .line 47
    iget-object v4, p0, Ll/cpo;->g:Ljava/util/List;

    .line 48
    .line 49
    invoke-interface {v4, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    iget-object v1, p0, Ll/cpo;->h:Ljava/util/List;

    .line 53
    .line 54
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    iget-object v1, p0, Ll/cpo;->e:Lcom/google/android/material/tabs/TabLayout;

    .line 58
    .line 59
    invoke-virtual {v1}, Lcom/google/android/material/tabs/TabLayout;->newTab()Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    invoke-virtual {v2, v0}, Lcom/google/android/material/tabs/TabLayout$Tab;->setCustomView(Landroid/view/View;)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    iget-object v2, p0, Ll/k4n;->b:Ll/j4n;

    .line 68
    .line 69
    check-cast v2, Ll/apo;

    .line 70
    .line 71
    iget v2, v2, Ll/apo;->b:I

    .line 72
    .line 73
    const/4 v4, 0x0

    .line 74
    const/4 v5, 0x1

    .line 75
    if-ne p1, v2, :cond_0

    .line 76
    .line 77
    move v2, v5

    .line 78
    goto :goto_0

    .line 79
    :cond_0
    move v2, v4

    .line 80
    :goto_0
    invoke-virtual {v1, v0, p1, v2}, Lcom/google/android/material/tabs/TabLayout;->addTab(Lcom/google/android/material/tabs/TabLayout$Tab;IZ)V

    .line 81
    .line 82
    .line 83
    iget-object v0, p0, Ll/k4n;->b:Ll/j4n;

    .line 84
    .line 85
    check-cast v0, Ll/apo;

    .line 86
    .line 87
    iget v0, v0, Ll/apo;->b:I

    .line 88
    .line 89
    if-ne p1, v0, :cond_1

    .line 90
    .line 91
    move v4, v5

    .line 92
    :cond_1
    invoke-virtual {p0, v4, p1}, Ll/cpo;->q(ZI)V

    .line 93
    .line 94
    .line 95
    new-instance v0, Ll/bpo;

    .line 96
    .line 97
    invoke-direct {v0, p0, p1}, Ll/bpo;-><init>(Ll/cpo;I)V

    .line 98
    .line 99
    .line 100
    invoke-static {v3, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 101
    .line 102
    .line 103
    iget-object p0, p0, Ll/k4n;->b:Ll/j4n;

    .line 104
    .line 105
    check-cast p0, Ll/apo;

    .line 106
    .line 107
    iget-object p0, p0, Ll/apo;->e:[Z

    .line 108
    .line 109
    aget-boolean p0, p0, p1

    .line 110
    .line 111
    invoke-static {v3, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 112
    .line 113
    .line 114
    return-void
.end method

.method public final synthetic l(ILandroid/view/View;)V
    .locals 1

    .line 1
    iget-object p2, p0, Ll/k4n;->b:Ll/j4n;

    .line 2
    .line 3
    move-object v0, p2

    .line 4
    check-cast v0, Ll/apo;

    .line 5
    .line 6
    iget-object v0, v0, Ll/apo;->e:[Z

    .line 7
    .line 8
    aget-boolean p1, v0, p1

    .line 9
    .line 10
    if-nez p1, :cond_0

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    check-cast p2, Ll/apo;

    .line 14
    .line 15
    iget-object p1, p0, Ll/k4n;->a:Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlDynamicGreetListAct;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/cpo;->b()Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p2, p1, p0}, Ll/apo;->P0(Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlDynamicGreetListAct;Ljava/util/List;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public m()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/cpo;->f:Lcom/p1/mobile/putong/core/newui/greet/ui/ImDiscoveryPager;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Ll/k4n;->b:Ll/j4n;

    .line 8
    .line 9
    move-object v2, v1

    .line 10
    check-cast v2, Ll/apo;

    .line 11
    .line 12
    iget v2, v2, Ll/apo;->b:I

    .line 13
    .line 14
    if-eq v0, v2, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Ll/cpo;->f:Lcom/p1/mobile/putong/core/newui/greet/ui/ImDiscoveryPager;

    .line 17
    .line 18
    check-cast v1, Ll/apo;

    .line 19
    .line 20
    iget v1, v1, Ll/apo;->b:I

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 23
    .line 24
    .line 25
    :cond_0
    iget-object v0, p0, Ll/cpo;->i:Ljava/util/List;

    .line 26
    .line 27
    iget-object v1, p0, Ll/k4n;->b:Ll/j4n;

    .line 28
    .line 29
    check-cast v1, Ll/apo;

    .line 30
    .line 31
    iget v1, v1, Ll/apo;->b:I

    .line 32
    .line 33
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Lv/VRecyclerView;

    .line 38
    .line 39
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    if-nez v1, :cond_1

    .line 44
    .line 45
    iget-object v1, p0, Ll/cpo;->j:Ljava/util/List;

    .line 46
    .line 47
    iget-object v2, p0, Ll/k4n;->b:Ll/j4n;

    .line 48
    .line 49
    check-cast v2, Ll/apo;

    .line 50
    .line 51
    iget v2, v2, Ll/apo;->b:I

    .line 52
    .line 53
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    check-cast v1, Ll/qbn;

    .line 58
    .line 59
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 60
    .line 61
    .line 62
    :cond_1
    iget-object v0, p0, Ll/k4n;->b:Ll/j4n;

    .line 63
    .line 64
    check-cast v0, Ll/apo;

    .line 65
    .line 66
    iget v0, v0, Ll/apo;->b:I

    .line 67
    .line 68
    iget-object v1, p0, Ll/k4n;->a:Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlDynamicGreetListAct;

    .line 69
    .line 70
    const/4 v2, 0x1

    .line 71
    if-ne v0, v2, :cond_2

    .line 72
    .line 73
    const-string v0, "e_intl_click_hi_sent_user"

    .line 74
    .line 75
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlDynamicGreetListAct;->pageId()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_2
    const-string v0, "e_intl_click_hi_receive_user"

    .line 84
    .line 85
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlDynamicGreetListAct;->pageId()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    :goto_0
    iget-object v0, p0, Ll/k4n;->b:Ll/j4n;

    .line 93
    .line 94
    check-cast v0, Ll/apo;

    .line 95
    .line 96
    iget v0, v0, Ll/apo;->b:I

    .line 97
    .line 98
    invoke-virtual {p0, v2, v0}, Ll/cpo;->q(ZI)V

    .line 99
    .line 100
    .line 101
    return-void
.end method

.method public n(ILjava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Ll/fzq;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/cpo;->j:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/qbn;

    .line 8
    .line 9
    invoke-virtual {p0, p2}, Ll/qbn;->b0(Ljava/util/List;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public onTabReselected(Lcom/google/android/material/tabs/TabLayout$Tab;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onTabSelected(Lcom/google/android/material/tabs/TabLayout$Tab;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/k4n;->b:Ll/j4n;

    .line 2
    .line 3
    check-cast v0, Ll/apo;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout$Tab;->getPosition()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    iput p1, v0, Ll/apo;->b:I

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/cpo;->m()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public onTabUnselected(Lcom/google/android/material/tabs/TabLayout$Tab;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout$Tab;->getPosition()I

    .line 3
    .line 4
    .line 5
    move-result p1

    .line 6
    invoke-virtual {p0, v0, p1}, Ll/cpo;->q(ZI)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public p(Ljava/util/Set;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/cpo;->b()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    move v2, v1

    .line 7
    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v3

    .line 11
    if-ge v2, v3, :cond_1

    .line 12
    .line 13
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    check-cast v3, Ll/fzq;

    .line 18
    .line 19
    invoke-virtual {v3}, Ll/fzq;->p()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v4

    .line 23
    invoke-interface {p1, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v4

    .line 27
    if-eqz v4, :cond_0

    .line 28
    .line 29
    invoke-virtual {v3, v1}, Ll/fzq;->M(I)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Ll/cpo;->e()V

    .line 33
    .line 34
    .line 35
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    return-void
.end method

.method public q(ZI)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cpo;->h:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Landroid/view/View;

    .line 10
    .line 11
    sget v0, Ll/g9c0;->o:I

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Ll/cpo;->g:Ljava/util/List;

    .line 17
    .line 18
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    check-cast p1, Lv/VText;

    .line 23
    .line 24
    iget-object p0, p0, Ll/k4n;->a:Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlDynamicGreetListAct;

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    sget p2, Ll/g9c0;->o:I

    .line 31
    .line 32
    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getColor(I)I

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_0
    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    check-cast p1, Landroid/view/View;

    .line 45
    .line 46
    const-string p2, "#19979797"

    .line 47
    .line 48
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 49
    .line 50
    .line 51
    move-result p2

    .line 52
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 53
    .line 54
    .line 55
    iget-object p1, p0, Ll/cpo;->g:Ljava/util/List;

    .line 56
    .line 57
    const/4 p2, 0x0

    .line 58
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    check-cast p1, Lv/VText;

    .line 63
    .line 64
    iget-object p0, p0, Ll/k4n;->a:Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlDynamicGreetListAct;

    .line 65
    .line 66
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    sget p2, Ll/g9c0;->m:I

    .line 71
    .line 72
    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getColor(I)I

    .line 73
    .line 74
    .line 75
    move-result p0

    .line 76
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public r()V
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    iget-object v2, p0, Ll/k4n;->b:Ll/j4n;

    .line 4
    .line 5
    check-cast v2, Ll/apo;

    .line 6
    .line 7
    iget-object v2, v2, Ll/apo;->c:[Ljava/lang/String;

    .line 8
    .line 9
    array-length v2, v2

    .line 10
    if-ge v1, v2, :cond_0

    .line 11
    .line 12
    new-instance v2, Lv/VRecyclerView;

    .line 13
    .line 14
    iget-object v3, p0, Ll/k4n;->a:Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlDynamicGreetListAct;

    .line 15
    .line 16
    invoke-direct {v2, v3}, Lv/VRecyclerView;-><init>(Landroid/content/Context;)V

    .line 17
    .line 18
    .line 19
    new-instance v3, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 20
    .line 21
    iget-object v4, p0, Ll/k4n;->a:Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlDynamicGreetListAct;

    .line 22
    .line 23
    invoke-direct {v3, v4}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 24
    .line 25
    .line 26
    const/4 v4, 0x1

    .line 27
    invoke-virtual {v3, v4}, Landroidx/recyclerview/widget/LinearLayoutManager;->setOrientation(I)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v2, v3}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 31
    .line 32
    .line 33
    new-instance v3, Ll/qbn;

    .line 34
    .line 35
    iget-object v4, p0, Ll/k4n;->a:Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlDynamicGreetListAct;

    .line 36
    .line 37
    iget-object v5, p0, Ll/k4n;->b:Ll/j4n;

    .line 38
    .line 39
    check-cast v5, Ll/apo;

    .line 40
    .line 41
    iget-object v5, v5, Ll/apo;->d:[Z

    .line 42
    .line 43
    aget-boolean v5, v5, v1

    .line 44
    .line 45
    invoke-direct {v3, v4, v5}, Ll/qbn;-><init>(Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlDynamicGreetListAct;Z)V

    .line 46
    .line 47
    .line 48
    iget-object v4, p0, Ll/cpo;->j:Ljava/util/List;

    .line 49
    .line 50
    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    iget-object v3, p0, Ll/cpo;->i:Ljava/util/List;

    .line 54
    .line 55
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0, v1}, Ll/cpo;->k(I)V

    .line 59
    .line 60
    .line 61
    add-int/lit8 v1, v1, 0x1

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_0
    iget-object v1, p0, Ll/cpo;->e:Lcom/google/android/material/tabs/TabLayout;

    .line 65
    .line 66
    invoke-virtual {v1, p0}, Lcom/google/android/material/tabs/TabLayout;->addOnTabSelectedListener(Lcom/google/android/material/tabs/TabLayout$OnTabSelectedListener;)V

    .line 67
    .line 68
    .line 69
    new-instance v1, Ll/cpo$a;

    .line 70
    .line 71
    const/4 v2, 0x0

    .line 72
    invoke-direct {v1, p0, v2}, Ll/cpo$a;-><init>(Ll/cpo;Ll/dpo;)V

    .line 73
    .line 74
    .line 75
    iget-object v2, p0, Ll/cpo;->f:Lcom/p1/mobile/putong/core/newui/greet/ui/ImDiscoveryPager;

    .line 76
    .line 77
    invoke-virtual {v2, v1}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 78
    .line 79
    .line 80
    iget-object v1, p0, Ll/cpo;->f:Lcom/p1/mobile/putong/core/newui/greet/ui/ImDiscoveryPager;

    .line 81
    .line 82
    invoke-virtual {v1, v0}, Lv/VPager;->setScrollble(Z)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p0}, Ll/cpo;->m()V

    .line 86
    .line 87
    .line 88
    return-void
.end method
