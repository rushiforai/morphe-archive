.class public Ll/i3l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/a3l;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/navigationbar/VNavigationBar;

.field public b:Lv/VPager;

.field public c:Lv/VPagerCircleIndicator;

.field public d:Lv/VText;

.field public e:Ll/a3l;

.field public f:Ll/o2l;

.field public final g:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ll/q2l;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/i3l$a;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/i3l$a;-><init>(Ll/i3l;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/i3l;->g:Ll/y20;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic a(Ll/i3l;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/i3l;->e(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic b(Ll/i3l;)Ll/a3l;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i3l;->e:Ll/a3l;

    return-object p0
.end method

.method private synthetic e(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/i3l;->b:Lv/VPager;

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

.method public c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/j3l;->b(Ll/i3l;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public d(Ll/a3l;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/i3l;->e:Ll/a3l;

    .line 2
    .line 3
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public f(Ll/q2l;Z)V
    .locals 0

    .line 1
    if-eqz p2, :cond_1

    .line 2
    .line 3
    iget-object p2, p0, Ll/i3l;->f:Ll/o2l;

    .line 4
    .line 5
    invoke-virtual {p2}, Ll/o2l;->q()Ll/q2l;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    if-eqz p2, :cond_0

    .line 10
    .line 11
    invoke-virtual {p2}, Ll/q2l;->d()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p2}, Ll/i3l;->i(Ll/q2l;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    invoke-virtual {p1}, Ll/q2l;->c()V

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    invoke-virtual {p1}, Ll/q2l;->d()V

    .line 22
    .line 23
    .line 24
    :goto_0
    invoke-virtual {p0, p1}, Ll/i3l;->i(Ll/q2l;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final i(Ll/q2l;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/i3l;->b:Lv/VPager;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/q2l;->f()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-static {p0, v0}, Ll/i0k;->a(Landroidx/viewpager/widget/ViewPager;I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    instance-of v0, p0, Lcom/p1/mobile/putong/live/external/page/setting/hideavatar/view/HideAvatarItemView;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    check-cast p0, Lcom/p1/mobile/putong/live/external/page/setting/hideavatar/view/HideAvatarItemView;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/page/setting/hideavatar/view/HideAvatarItemView;->l0(Ll/q2l;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/a3l;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/i3l;->d(Ll/a3l;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/i3l;->c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public j(Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveHideAvatarEnterConfig;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/q2l;",
            ">;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveHideAvatarEnterConfig;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/i3l;->a:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    sget v2, Lcom/p1/mobile/putong/live/external/R$string;->U:I

    .line 8
    .line 9
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/i3l;->a:Lv/navigationbar/VNavigationBar;

    .line 17
    .line 18
    new-instance v1, Ll/g3l;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/g3l;-><init>(Ll/i3l;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconOnClick(Landroid/view/View$OnClickListener;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/i3l;->f:Ll/o2l;

    .line 27
    .line 28
    if-nez v0, :cond_0

    .line 29
    .line 30
    new-instance v0, Ll/o2l;

    .line 31
    .line 32
    iget-object v1, p0, Ll/i3l;->g:Ll/y20;

    .line 33
    .line 34
    invoke-direct {v0, v1}, Ll/o2l;-><init>(Ll/y20;)V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Ll/i3l;->f:Ll/o2l;

    .line 38
    .line 39
    iget-object v1, p0, Ll/i3l;->b:Lv/VPager;

    .line 40
    .line 41
    invoke-virtual {v1, v0}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Ll/i3l;->b:Lv/VPager;

    .line 45
    .line 46
    const/high16 v1, 0x41600000    # 14.0f

    .line 47
    .line 48
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setPageMargin(I)V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Ll/i3l;->c:Lv/VPagerCircleIndicator;

    .line 56
    .line 57
    iget-object v1, p0, Ll/i3l;->b:Lv/VPager;

    .line 58
    .line 59
    invoke-virtual {v0, v1}, Lv/VPagerCircleIndicator;->setViewPager(Landroidx/viewpager/widget/ViewPager;)V

    .line 60
    .line 61
    .line 62
    :cond_0
    iget-object v0, p0, Ll/i3l;->c:Lv/VPagerCircleIndicator;

    .line 63
    .line 64
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    const/4 v2, 0x2

    .line 69
    if-lt v1, v2, :cond_1

    .line 70
    .line 71
    const/4 v1, 0x1

    .line 72
    goto :goto_0

    .line 73
    :cond_1
    const/4 v1, 0x0

    .line 74
    :goto_0
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Ll/i3l;->b:Lv/VPager;

    .line 78
    .line 79
    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    iget-object v1, p0, Ll/i3l;->f:Ll/o2l;

    .line 84
    .line 85
    invoke-virtual {v1, p1}, Ll/o2l;->r(Ljava/util/List;)V

    .line 86
    .line 87
    .line 88
    iget-object v1, p0, Ll/i3l;->d:Lv/VText;

    .line 89
    .line 90
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveHideAvatarEnterConfig;->usage:Ljava/lang/String;

    .line 91
    .line 92
    invoke-virtual {v1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 93
    .line 94
    .line 95
    if-eqz v0, :cond_2

    .line 96
    .line 97
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 98
    .line 99
    .line 100
    move-result p2

    .line 101
    if-ge v0, p2, :cond_2

    .line 102
    .line 103
    iget-object p0, p0, Ll/i3l;->b:Lv/VPager;

    .line 104
    .line 105
    invoke-virtual {p0, v0}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 106
    .line 107
    .line 108
    return-void

    .line 109
    :cond_2
    new-instance p2, Ll/h3l;

    .line 110
    .line 111
    invoke-direct {p2}, Ll/h3l;-><init>()V

    .line 112
    .line 113
    .line 114
    invoke-static {p1, p2}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 115
    .line 116
    .line 117
    move-result p1

    .line 118
    if-ltz p1, :cond_3

    .line 119
    .line 120
    iget-object p0, p0, Ll/i3l;->b:Lv/VPager;

    .line 121
    .line 122
    invoke-virtual {p0, p1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 123
    .line 124
    .line 125
    :cond_3
    return-void
.end method
