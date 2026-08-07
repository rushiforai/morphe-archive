.class public Ll/mhy;
.super Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder<",
        "Ll/lly;",
        ">;"
    }
.end annotation


# instance fields
.field public k:Lv/VFrame;

.field public l:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainland/HourBoardDialogTopAnimView;

.field public m:Lcom/google/android/material/tabs/TabLayout;

.field public n:Landroid/widget/ImageView;

.field public o:Lv/VPager;

.field public p:Ll/dly;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/lly;)V
    .locals 2

    .line 1
    sget v0, Ll/yec0;->Q3:I

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

.method public static synthetic F(Ll/mhy;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/mhy;->K(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic G(Ll/mhy;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mhy;->M(Z)V

    return-void
.end method

.method public static synthetic I(Ll/mhy;)Ll/y8s;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    return-object p0
.end method

.method private synthetic K(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast p0, Ll/lly;

    .line 4
    .line 5
    sget-object p1, Ll/efv;->z:Ljava/lang/String;

    .line 6
    .line 7
    const v0, 0x43f88000    # 497.0f

    .line 8
    .line 9
    .line 10
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const/16 v1, 0x1004

    .line 15
    .line 16
    invoke-virtual {p0, p1, v0, v1}, Ll/i6t;->v3(Ljava/lang/String;II)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method private O(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/ely;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/mhy;->p:Ll/dly;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/dly;->q(Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/mhy;->p:Ll/dly;

    .line 7
    .line 8
    invoke-virtual {p1}, Ll/dly;->getCount()I

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
    iget-object p0, p0, Ll/mhy;->m:Lcom/google/android/material/tabs/TabLayout;

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
    iget-object p0, p0, Ll/mhy;->k:Lv/VFrame;

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

.method public final H(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/nhy;->a(Ll/mhy;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public J(Ll/lly;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final L()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mhy;->p:Ll/dly;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance v0, Ll/dly;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-direct {v0, v1}, Ll/dly;-><init>(Ljava/util/List;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/mhy;->p:Ll/dly;

    .line 13
    .line 14
    iget-object v1, p0, Ll/mhy;->o:Lv/VPager;

    .line 15
    .line 16
    invoke-virtual {v1, v0}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/mhy;->o:Lv/VPager;

    .line 20
    .line 21
    new-instance v1, Ll/mhy$a;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Ll/mhy$a;-><init>(Ll/mhy;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final M(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mhy;->l:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainland/HourBoardDialogTopAnimView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    const/4 p1, 0x1

    .line 7
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainland/HourBoardDialogTopAnimView;->F0(Z)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/mhy;->l:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainland/HourBoardDialogTopAnimView;

    .line 11
    .line 12
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainland/HourBoardDialogTopAnimView;->l0(Z)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainland/HourBoardDialogTopAnimView;->F0(Z)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public N(I)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->E()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/mhy;->o:Lv/VPager;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast p0, Ll/lly;

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

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/lly;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/mhy;->J(Ll/lly;)V

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
    check-cast v0, Ll/lly;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/lly;->b4()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-direct {p0, v0}, Ll/mhy;->O(Ljava/util/List;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public m(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, Ll/mhy;->H(Landroid/view/View;)V

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
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p1}, Ll/vwt;->b7()Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    iget-object v0, p0, Ll/mhy;->o:Lv/VPager;

    .line 23
    .line 24
    invoke-virtual {v0, p1}, Lv/VPager;->setScrollble(Z)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/mhy;->m:Lcom/google/android/material/tabs/TabLayout;

    .line 28
    .line 29
    iget-object v1, p0, Ll/mhy;->o:Lv/VPager;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Lcom/google/android/material/tabs/TabLayout;->setupWithViewPager(Landroidx/viewpager/widget/ViewPager;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Ll/mhy;->m:Lcom/google/android/material/tabs/TabLayout;

    .line 35
    .line 36
    xor-int/lit8 v1, p1, 0x1

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Lcom/google/android/material/tabs/TabLayout;->setTabIndicatorFullWidth(Z)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Ll/mhy;->k:Lv/VFrame;

    .line 42
    .line 43
    if-eqz p1, :cond_0

    .line 44
    .line 45
    const/high16 p1, 0x440d0000    # 564.0f

    .line 46
    .line 47
    :goto_0
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    goto :goto_1

    .line 52
    :cond_0
    const p1, 0x43f38000    # 487.0f

    .line 53
    .line 54
    .line 55
    goto :goto_0

    .line 56
    :goto_1
    invoke-static {v0, p1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 57
    .line 58
    .line 59
    iget-object p1, p0, Ll/mhy;->l:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainland/HourBoardDialogTopAnimView;

    .line 60
    .line 61
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainland/HourBoardDialogTopAnimView;->k0()V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0}, Ll/mhy;->L()V

    .line 65
    .line 66
    .line 67
    iget-object p1, p0, Ll/mhy;->n:Landroid/widget/ImageView;

    .line 68
    .line 69
    new-instance v0, Ll/lhy;

    .line 70
    .line 71
    invoke-direct {v0, p0}, Ll/lhy;-><init>(Ll/mhy;)V

    .line 72
    .line 73
    .line 74
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public bridge synthetic n(Ll/y8s;)V
    .locals 0

    .line 1
    check-cast p1, Ll/lly;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/mhy;->J(Ll/lly;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public w()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->w()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/mhy;->l:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainland/HourBoardDialogTopAnimView;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Ll/mhy;->l:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainland/HourBoardDialogTopAnimView;

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainland/HourBoardDialogTopAnimView;->j0()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method
