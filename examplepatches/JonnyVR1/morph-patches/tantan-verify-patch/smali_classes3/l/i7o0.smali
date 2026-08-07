.class public Ll/i7o0;
.super Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder<",
        "Ll/b9o0;",
        ">;"
    }
.end annotation


# instance fields
.field public k:Lv/VLinear;

.field public l:Lcom/google/android/material/tabs/TabLayout;

.field public m:Lv/VPagerNoPage;

.field public n:Ll/t8o0;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/b9o0;)V
    .locals 2

    .line 1
    sget v0, Ll/yec0;->K9:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v1}, Ll/qag0;->e(Z)Ll/rq2;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    invoke-direct {p0, v0, p1, p2, v1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;-><init>(ILcom/p1/mobile/android/app/Act;Ll/y8s;Ll/rq2;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic G(Ll/i7o0;)Ll/y8s;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    return-object p0
.end method

.method private I()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/i7o0;->n:Ll/t8o0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance v0, Ll/t8o0;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-direct {v0, v1}, Ll/t8o0;-><init>(Ljava/util/List;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/i7o0;->n:Ll/t8o0;

    .line 13
    .line 14
    iget-object v1, p0, Ll/i7o0;->m:Lv/VPagerNoPage;

    .line 15
    .line 16
    invoke-virtual {v1, v0}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/i7o0;->m:Lv/VPagerNoPage;

    .line 20
    .line 21
    new-instance v1, Ll/i7o0$a;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Ll/i7o0$a;-><init>(Ll/i7o0;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method private K(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/u8o0;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/i7o0;->n:Ll/t8o0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/t8o0;->q(Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/i7o0;->n:Ll/t8o0;

    .line 7
    .line 8
    invoke-virtual {p1}, Ll/t8o0;->getCount()I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    const/4 v0, 0x1

    .line 13
    if-gt p1, v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ll/i7o0;->l:Lcom/google/android/material/tabs/TabLayout;

    .line 16
    .line 17
    const p1, 0xffffff

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, p1}, Lcom/google/android/material/tabs/TabLayout;->setSelectedTabIndicatorColor(I)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i7o0;->k:Lv/VLinear;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final F(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/j7o0;->a(Ll/i7o0;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public H(Ll/b9o0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public J(I)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->E()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/i7o0;->m:Lv/VPagerNoPage;

    .line 5
    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    const/4 p1, 0x1

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p1, 0x0

    .line 11
    :goto_0
    invoke-virtual {p0, p1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast p0, Ll/b9o0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->destroy()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/b9o0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/i7o0;->H(Ll/b9o0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public l()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast v0, Ll/b9o0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/b9o0;->b4()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-direct {p0, v0}, Ll/i7o0;->K(Ljava/util/List;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public m(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Ll/i7o0;->F(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    const/16 p1, 0x50

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->A(I)V

    .line 7
    .line 8
    .line 9
    sget-object p1, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;->MEMBER:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->z(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Ll/i7o0;->l:Lcom/google/android/material/tabs/TabLayout;

    .line 15
    .line 16
    iget-object v0, p0, Ll/i7o0;->m:Lv/VPagerNoPage;

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Lcom/google/android/material/tabs/TabLayout;->setupWithViewPager(Landroidx/viewpager/widget/ViewPager;)V

    .line 19
    .line 20
    .line 21
    invoke-direct {p0}, Ll/i7o0;->I()V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public bridge synthetic n(Ll/y8s;)V
    .locals 0

    .line 1
    check-cast p1, Ll/b9o0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/i7o0;->H(Ll/b9o0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
