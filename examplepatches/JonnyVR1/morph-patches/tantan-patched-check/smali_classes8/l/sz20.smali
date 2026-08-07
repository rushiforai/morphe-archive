.class public Ll/sz20;
.super Ll/lb2;
.source "SourceFile"


# instance fields
.field public e:Ll/b030;

.field public f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/businessdata/NewGiftInfoPanelWrapper;",
            ">;"
        }
    .end annotation
.end field

.field public g:Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelPagerView;

.field public h:I


# direct methods
.method public constructor <init>(Ll/b030;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/lb2;-><init>()V

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
    iput-object v0, p0, Ll/sz20;->f:Ljava/util/List;

    .line 10
    .line 11
    iput-object p1, p0, Ll/sz20;->e:Ll/b030;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sz20;->f:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getItemPosition(Ljava/lang/Object;)I
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    const/4 p0, -0x2

    .line 2
    return p0
.end method

.method public getPageTitle(I)Ljava/lang/CharSequence;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/sz20;->f:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/businessdata/NewGiftInfoPanelWrapper;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/businessdata/NewGiftInfoPanelWrapper;->panel:Lcom/p1/mobile/putong/core/data/CoreGiftPanel;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreGiftPanel;->name:Ljava/lang/String;

    .line 12
    .line 13
    return-object p0
.end method

.method public isViewFromObject(Landroid/view/View;Ljava/lang/Object;)Z
    .locals 0
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    if-ne p1, p2, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    return p0

    .line 5
    :cond_0
    const/4 p0, 0x0

    .line 6
    return p0
.end method

.method public o(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p3, Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p1, p3}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public p(Landroid/view/ViewGroup;I)Ljava/lang/Object;
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Ll/qec0;->N:I

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelPagerView;

    .line 17
    .line 18
    iget-object v1, p0, Ll/sz20;->e:Ll/b030;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelPagerView;->R(Ll/b030;)V

    .line 21
    .line 22
    .line 23
    iget-object v1, p0, Ll/sz20;->f:Ljava/util/List;

    .line 24
    .line 25
    invoke-interface {v1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    check-cast v1, Lcom/p1/mobile/putong/core/businessdata/NewGiftInfoPanelWrapper;

    .line 30
    .line 31
    iget-object v2, p0, Ll/sz20;->e:Ll/b030;

    .line 32
    .line 33
    invoke-virtual {v2}, Ll/b030;->l()I

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelPagerView;->T(Lcom/p1/mobile/putong/core/businessdata/NewGiftInfoPanelWrapper;I)V

    .line 38
    .line 39
    .line 40
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 48
    .line 49
    .line 50
    instance-of v1, p1, Lv/VPager;

    .line 51
    .line 52
    if-eqz v1, :cond_0

    .line 53
    .line 54
    check-cast p1, Lv/VPager;

    .line 55
    .line 56
    invoke-virtual {p1}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    if-ne p1, p2, :cond_0

    .line 61
    .line 62
    iget-object p0, p0, Ll/sz20;->e:Ll/b030;

    .line 63
    .line 64
    invoke-virtual {p0}, Ll/b030;->v()Ll/pz20;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-virtual {p0}, Ll/pz20;->L()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    add-int/lit8 p2, p2, 0x1

    .line 73
    .line 74
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    const-string p2, "giftBarPageId"

    .line 79
    .line 80
    invoke-static {p2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    const-string p2, "gift_bar_tab"

    .line 85
    .line 86
    const-string v1, "default"

    .line 87
    .line 88
    invoke-static {p2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 89
    .line 90
    .line 91
    move-result-object p2

    .line 92
    filled-new-array {p1, p2}, [Ll/pf60;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    const-string p2, "e_gift_bar"

    .line 97
    .line 98
    invoke-static {p2, p0, p1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 99
    .line 100
    .line 101
    :cond_0
    return-object v0
.end method

.method public q(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/businessdata/NewGiftInfoPanelWrapper;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/sz20;->f:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/sz20;->f:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/cf60;->notifyDataSetChanged()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public setPrimaryItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .locals 2
    .param p1    # Landroid/view/ViewGroup;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    move-object v0, p3

    .line 2
    check-cast v0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelPagerView;

    .line 3
    .line 4
    iput-object v0, p0, Ll/sz20;->g:Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelPagerView;

    .line 5
    .line 6
    iget v1, p0, Ll/sz20;->h:I

    .line 7
    .line 8
    if-eq v1, p2, :cond_0

    .line 9
    .line 10
    iput p2, p0, Ll/sz20;->h:I

    .line 11
    .line 12
    iget-object v1, p0, Ll/sz20;->e:Ll/b030;

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelPagerView;->getAdapter()Ll/f030;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v1, v0}, Ll/b030;->y(Ll/f030;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/sz20;->g:Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelPagerView;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelPagerView;->c:Landroidx/recyclerview/widget/RecyclerView;

    .line 24
    .line 25
    const/4 v1, 0x0

    .line 26
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V

    .line 27
    .line 28
    .line 29
    :cond_0
    invoke-super {p0, p1, p2, p3}, Ll/cf60;->setPrimaryItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method
