.class public Ll/sxs;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/dxs;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/skin/ToolBarSkinView;

.field public b:Ll/dxs;

.field public c:Landroidx/viewpager/widget/ViewPager;

.field public d:Lcom/google/android/material/tabs/TabLayout;

.field public e:Lv/VDraweeView;

.field public f:Lv/VDraweeView;

.field public g:Ll/n2u;

.field public h:Z

.field public i:Z

.field public j:I

.field public final k:Lcom/google/android/material/tabs/TabLayout$OnTabSelectedListener;

.field public l:Ll/x20;

.field public m:Ll/x20;

.field public n:Ll/x20;

.field public o:I


# direct methods
.method public constructor <init>(Landroidx/viewpager/widget/ViewPager;Lcom/google/android/material/tabs/TabLayout;Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/skin/ToolBarSkinView;Lv/VDraweeView;Lv/VDraweeView;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/sxs;->h:Z

    .line 6
    .line 7
    new-instance v0, Ll/sxs$a;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/sxs$a;-><init>(Ll/sxs;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/sxs;->k:Lcom/google/android/material/tabs/TabLayout$OnTabSelectedListener;

    .line 13
    .line 14
    iput-object p1, p0, Ll/sxs;->c:Landroidx/viewpager/widget/ViewPager;

    .line 15
    .line 16
    iput-object p2, p0, Ll/sxs;->d:Lcom/google/android/material/tabs/TabLayout;

    .line 17
    .line 18
    iput-object p3, p0, Ll/sxs;->a:Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/skin/ToolBarSkinView;

    .line 19
    .line 20
    iput-object p4, p0, Ll/sxs;->e:Lv/VDraweeView;

    .line 21
    .line 22
    iput-object p5, p0, Ll/sxs;->f:Lv/VDraweeView;

    .line 23
    .line 24
    return-void
.end method

.method public static synthetic a(Ll/sxs;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/sxs;->z(ILandroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->getRequestName()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/y6u;->l(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic c(Ll/sxs;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/sxs;->x(I)V

    return-void
.end method

.method public static synthetic d(Ll/sxs;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/sxs;->y(Z)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->getTabId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "2"

    .line 6
    .line 7
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static synthetic f(Ljava/lang/String;Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->getTabId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static bridge synthetic i(Ll/sxs;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/sxs;->i:Z

    return p0
.end method

.method public static bridge synthetic j(Ll/sxs;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/sxs;->j:I

    return p0
.end method

.method public static bridge synthetic k(Ll/sxs;)Ll/dxs;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sxs;->b:Ll/dxs;

    return-object p0
.end method

.method public static bridge synthetic l(Ll/sxs;)Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/skin/ToolBarSkinView;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sxs;->a:Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/skin/ToolBarSkinView;

    return-object p0
.end method

.method public static bridge synthetic m(Ll/sxs;I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/sxs;->j:I

    return-void
.end method

.method public static bridge synthetic n(Ll/sxs;Lcom/google/android/material/tabs/TabLayout$Tab;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/sxs;->O(Lcom/google/android/material/tabs/TabLayout$Tab;Ljava/lang/String;)V

    return-void
.end method

.method public static w(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;)Landroid/view/View;
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget v0, Ll/xec0;->s:I

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {p0, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->getPageId()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    sget v0, Ll/ldc0;->k2:I

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Lv/VText;

    .line 26
    .line 27
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->getName()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 32
    .line 33
    .line 34
    const/4 p1, 0x0

    .line 35
    invoke-virtual {v0, p1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 36
    .line 37
    .line 38
    return-object p0
.end method


# virtual methods
.method public A(Ljava/lang/String;Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/sxs;->d:Lcom/google/android/material/tabs/TabLayout;

    .line 2
    .line 3
    const-string v1, "square-suggested"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    sget v1, Ll/ldc0;->n1:I

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Landroid/widget/TextView;

    .line 18
    .line 19
    sget v2, Ll/ldc0;->m1:I

    .line 20
    .line 21
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    invoke-static {v1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-eqz v1, :cond_0

    .line 32
    .line 33
    const-string v0, "red_dot_figure"

    .line 34
    .line 35
    invoke-virtual {p0, p2, v0, p1}, Ll/sxs;->N(ZLjava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_0
    if-eqz v0, :cond_1

    .line 40
    .line 41
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_1

    .line 46
    .line 47
    const-string v0, "red_dot_normal"

    .line 48
    .line 49
    invoke-virtual {p0, p2, v0, p1}, Ll/sxs;->N(ZLjava/lang/String;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    :cond_1
    return-void
.end method

.method public final B(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p2}, Ll/sft;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string p2, "tooltips_type_ui"

    .line 6
    .line 7
    invoke-static {p2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    filled-new-array {p1}, [Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const-string p2, "e_red_dot_live_icon"

    .line 16
    .line 17
    invoke-static {p2, p0, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final C(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p2}, Ll/sft;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string p2, "tooltips_type_ui"

    .line 6
    .line 7
    invoke-static {p2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    filled-new-array {p1}, [Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const-string p2, "e_red_dot_live_icon"

    .line 16
    .line 17
    invoke-static {p2, p0, p1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public E(Ljava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/sxs;->c:Landroidx/viewpager/widget/ViewPager;

    .line 2
    .line 3
    if-eqz v0, :cond_7

    .line 4
    .line 5
    iget-object v0, p0, Ll/sxs;->d:Lcom/google/android/material/tabs/TabLayout;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto/16 :goto_1

    .line 10
    .line 11
    :cond_0
    new-instance v0, Ll/pxs;

    .line 12
    .line 13
    invoke-direct {v0}, Ll/pxs;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-static {p1, v0}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    sget-object v1, Ll/itd0;->d:Ll/itd0;

    .line 21
    .line 22
    invoke-static {v1}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, Ll/bk3;

    .line 27
    .line 28
    invoke-virtual {v1, p1}, Ll/bk3;->c(Ljava/util/List;)Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-eqz v1, :cond_1

    .line 33
    .line 34
    sget-object v0, Ll/itd0;->c:Ll/itd0;

    .line 35
    .line 36
    invoke-static {v0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Ll/gm3;

    .line 41
    .line 42
    iget-object v0, v0, Ll/gm3;->i:Lrx/subjects/a;

    .line 43
    .line 44
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 47
    .line 48
    .line 49
    new-instance v0, Ll/qxs;

    .line 50
    .line 51
    invoke-direct {v0}, Ll/qxs;-><init>()V

    .line 52
    .line 53
    .line 54
    invoke-static {p1, v0}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    goto :goto_0

    .line 59
    :cond_1
    sget-object v1, Ll/itd0;->c:Ll/itd0;

    .line 60
    .line 61
    invoke-static {v1}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    check-cast v1, Ll/gm3;

    .line 66
    .line 67
    iget-object v1, v1, Ll/gm3;->i:Lrx/subjects/a;

    .line 68
    .line 69
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 70
    .line 71
    invoke-virtual {v1, v2}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 72
    .line 73
    .line 74
    :goto_0
    iget-object v1, p0, Ll/sxs;->b:Ll/dxs;

    .line 75
    .line 76
    invoke-virtual {v1}, Ll/mus;->H2()Ll/nus;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    iget-object v1, v1, Ll/nus;->b:Lcom/p1/mobile/putong/live/external/module/arch/LiveBaseFrag;

    .line 81
    .line 82
    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->isAdded()Z

    .line 83
    .line 84
    .line 85
    move-result v1

    .line 86
    if-eqz v1, :cond_5

    .line 87
    .line 88
    iget-object v1, p0, Ll/sxs;->g:Ll/n2u;

    .line 89
    .line 90
    if-nez v1, :cond_2

    .line 91
    .line 92
    iget-object v1, p0, Ll/sxs;->b:Ll/dxs;

    .line 93
    .line 94
    invoke-virtual {v1}, Ll/mus;->H2()Ll/nus;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    iget-object v1, v1, Ll/nus;->b:Lcom/p1/mobile/putong/live/external/module/arch/LiveBaseFrag;

    .line 99
    .line 100
    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->getChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    invoke-static {v1}, Ll/y6u;->c(Landroidx/fragment/app/FragmentManager;)V

    .line 105
    .line 106
    .line 107
    new-instance v2, Ll/n2u;

    .line 108
    .line 109
    iget-object v3, p0, Ll/sxs;->c:Landroidx/viewpager/widget/ViewPager;

    .line 110
    .line 111
    invoke-virtual {v3}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 112
    .line 113
    .line 114
    move-result v3

    .line 115
    iget-object v4, p0, Ll/sxs;->b:Ll/dxs;

    .line 116
    .line 117
    invoke-virtual {v4}, Ll/mus;->F2()Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 118
    .line 119
    .line 120
    move-result-object v4

    .line 121
    invoke-direct {v2, v1, v0, v3, v4}, Ll/n2u;-><init>(Landroidx/fragment/app/FragmentManager;IILcom/tantan/live/home/eventbus/LiveHomeEventBus;)V

    .line 122
    .line 123
    .line 124
    iput-object v2, p0, Ll/sxs;->g:Ll/n2u;

    .line 125
    .line 126
    :cond_2
    iget-object v1, p0, Ll/sxs;->g:Ll/n2u;

    .line 127
    .line 128
    invoke-virtual {v1, p1}, Ll/n2u;->m(Ljava/util/List;)V

    .line 129
    .line 130
    .line 131
    iget-object v1, p0, Ll/sxs;->c:Landroidx/viewpager/widget/ViewPager;

    .line 132
    .line 133
    iget-object v2, p0, Ll/sxs;->g:Ll/n2u;

    .line 134
    .line 135
    invoke-virtual {v1, v2}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 136
    .line 137
    .line 138
    iget-object v1, p0, Ll/sxs;->l:Ll/x20;

    .line 139
    .line 140
    if-eqz v1, :cond_3

    .line 141
    .line 142
    invoke-interface {v1}, Ll/x20;->call()V

    .line 143
    .line 144
    .line 145
    :cond_3
    iget-object v1, p0, Ll/sxs;->m:Ll/x20;

    .line 146
    .line 147
    if-eqz v1, :cond_4

    .line 148
    .line 149
    invoke-interface {v1}, Ll/x20;->call()V

    .line 150
    .line 151
    .line 152
    :cond_4
    iput v0, p0, Ll/sxs;->o:I

    .line 153
    .line 154
    :cond_5
    iget-object v0, p0, Ll/sxs;->d:Lcom/google/android/material/tabs/TabLayout;

    .line 155
    .line 156
    iget-object v1, p0, Ll/sxs;->c:Landroidx/viewpager/widget/ViewPager;

    .line 157
    .line 158
    invoke-virtual {v0, v1}, Lcom/google/android/material/tabs/TabLayout;->setupWithViewPager(Landroidx/viewpager/widget/ViewPager;)V

    .line 159
    .line 160
    .line 161
    iget v0, p0, Ll/sxs;->o:I

    .line 162
    .line 163
    invoke-virtual {p0, p1, v0}, Ll/sxs;->K(Ljava/util/List;I)V

    .line 164
    .line 165
    .line 166
    iget-object v0, p0, Ll/sxs;->c:Landroidx/viewpager/widget/ViewPager;

    .line 167
    .line 168
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 169
    .line 170
    .line 171
    move-result p1

    .line 172
    invoke-virtual {v0, p1}, Landroidx/viewpager/widget/ViewPager;->setOffscreenPageLimit(I)V

    .line 173
    .line 174
    .line 175
    iget p1, p0, Ll/sxs;->o:I

    .line 176
    .line 177
    iget-object v0, p0, Ll/sxs;->c:Landroidx/viewpager/widget/ViewPager;

    .line 178
    .line 179
    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 180
    .line 181
    .line 182
    move-result v0

    .line 183
    if-eq p1, v0, :cond_6

    .line 184
    .line 185
    iget-object p1, p0, Ll/sxs;->c:Landroidx/viewpager/widget/ViewPager;

    .line 186
    .line 187
    iget v0, p0, Ll/sxs;->o:I

    .line 188
    .line 189
    invoke-virtual {p1, v0}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 190
    .line 191
    .line 192
    :cond_6
    invoke-virtual {p0}, Ll/sxs;->p()V

    .line 193
    .line 194
    .line 195
    const/4 p1, 0x1

    .line 196
    iput-boolean p1, p0, Ll/sxs;->h:Z

    .line 197
    .line 198
    iget-object p0, p0, Ll/sxs;->n:Ll/x20;

    .line 199
    .line 200
    if-eqz p0, :cond_7

    .line 201
    .line 202
    invoke-interface {p0}, Ll/x20;->call()V

    .line 203
    .line 204
    .line 205
    :cond_7
    :goto_1
    return-void
.end method

.method public F(Ljava/lang/Boolean;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/sxs;->b:Ll/dxs;

    .line 2
    .line 3
    new-instance v1, Ll/evs;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/evs;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ll/mus;->N2(Ll/hk2;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Ljava/lang/String;

    .line 13
    .line 14
    const-string v1, "p_live_featured"

    .line 15
    .line 16
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    invoke-static {}, Ll/mbs;->g()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->I4()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-nez v0, :cond_0

    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    iget-object p0, p0, Ll/sxs;->a:Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/skin/ToolBarSkinView;

    .line 38
    .line 39
    if-eqz p1, :cond_1

    .line 40
    .line 41
    sget p1, Ll/nbc0;->E1:I

    .line 42
    .line 43
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_1
    sget p1, Ll/nbc0;->D1:I

    .line 48
    .line 49
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public G(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/sxs;->d:Lcom/google/android/material/tabs/TabLayout;

    .line 2
    .line 3
    const-string v1, "square-suggested"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    new-instance v0, Ll/lxs;

    .line 12
    .line 13
    invoke-direct {v0, p0, p1}, Ll/lxs;-><init>(Ll/sxs;I)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/sxs;->l:Ll/x20;

    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    const/4 v1, 0x0

    .line 20
    iput-object v1, p0, Ll/sxs;->l:Ll/x20;

    .line 21
    .line 22
    sget p0, Ll/ldc0;->n1:I

    .line 23
    .line 24
    invoke-virtual {v0, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    check-cast p0, Landroid/widget/TextView;

    .line 29
    .line 30
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 35
    .line 36
    .line 37
    if-lez p1, :cond_1

    .line 38
    .line 39
    const/4 p1, 0x1

    .line 40
    goto :goto_0

    .line 41
    :cond_1
    const/4 p1, 0x0

    .line 42
    :goto_0
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public H(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/sxs;->d:Lcom/google/android/material/tabs/TabLayout;

    .line 2
    .line 3
    const-string v1, "p_live_curated_recommend"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    new-instance v0, Ll/oxs;

    .line 12
    .line 13
    invoke-direct {v0, p0, p1}, Ll/oxs;-><init>(Ll/sxs;Z)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/sxs;->n:Ll/x20;

    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    const/4 v1, 0x0

    .line 20
    iput-object v1, p0, Ll/sxs;->n:Ll/x20;

    .line 21
    .line 22
    sget p0, Ll/ldc0;->m1:I

    .line 23
    .line 24
    invoke-virtual {v0, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public I(Ljava/lang/Boolean;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iput-boolean v0, p0, Ll/sxs;->i:Z

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    :goto_0
    iget-object v1, p0, Ll/sxs;->d:Lcom/google/android/material/tabs/TabLayout;

    .line 9
    .line 10
    invoke-virtual {v1}, Lcom/google/android/material/tabs/TabLayout;->getTabCount()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-ge v0, v1, :cond_3

    .line 15
    .line 16
    iget-object v1, p0, Ll/sxs;->d:Lcom/google/android/material/tabs/TabLayout;

    .line 17
    .line 18
    invoke-virtual {v1, v0}, Lcom/google/android/material/tabs/TabLayout;->getTabAt(I)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    if-eqz v1, :cond_2

    .line 23
    .line 24
    iget-object v1, v1, Lcom/google/android/material/tabs/TabLayout$Tab;->view:Lcom/google/android/material/tabs/TabLayout$TabView;

    .line 25
    .line 26
    sget v2, Ll/ldc0;->k2:I

    .line 27
    .line 28
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    check-cast v1, Landroid/widget/TextView;

    .line 33
    .line 34
    iget-object v2, p0, Ll/sxs;->d:Lcom/google/android/material/tabs/TabLayout;

    .line 35
    .line 36
    invoke-virtual {v2}, Lcom/google/android/material/tabs/TabLayout;->getSelectedTabPosition()I

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    if-ne v0, v2, :cond_0

    .line 41
    .line 42
    sget v2, Ll/ggc0;->g:I

    .line 43
    .line 44
    invoke-static {v1, v2}, Ll/msi0;->o(Landroid/widget/TextView;I)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    if-eqz v2, :cond_1

    .line 52
    .line 53
    const-string v2, "#FFFFFF"

    .line 54
    .line 55
    invoke-static {v2}, Ll/ynp0;->B(Ljava/lang/String;)I

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 60
    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_0
    sget v2, Ll/ggc0;->i:I

    .line 64
    .line 65
    invoke-static {v1, v2}, Ll/msi0;->o(Landroid/widget/TextView;I)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 69
    .line 70
    .line 71
    move-result v2

    .line 72
    if-eqz v2, :cond_1

    .line 73
    .line 74
    const-string v2, "#66FFFFFF"

    .line 75
    .line 76
    invoke-static {v2}, Ll/ynp0;->B(Ljava/lang/String;)I

    .line 77
    .line 78
    .line 79
    move-result v2

    .line 80
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 81
    .line 82
    .line 83
    :cond_1
    :goto_1
    invoke-static {}, Ll/mbs;->g()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    invoke-interface {v2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->I4()Z

    .line 88
    .line 89
    .line 90
    move-result v2

    .line 91
    if-eqz v2, :cond_2

    .line 92
    .line 93
    const/high16 v2, 0x41a00000    # 20.0f

    .line 94
    .line 95
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 96
    .line 97
    .line 98
    :cond_2
    add-int/lit8 v0, v0, 0x1

    .line 99
    .line 100
    goto :goto_0

    .line 101
    :cond_3
    return-void
.end method

.method public final J(Landroid/widget/TextView;I)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-static {p1, p2}, Ll/msi0;->o(Landroid/widget/TextView;I)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public final K(Ljava/util/List;I)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;",
            ">;I)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Ll/sxs;->d:Lcom/google/android/material/tabs/TabLayout;

    .line 3
    .line 4
    invoke-virtual {v1}, Lcom/google/android/material/tabs/TabLayout;->getTabCount()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-ge v0, v1, :cond_3

    .line 9
    .line 10
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    check-cast v1, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;

    .line 15
    .line 16
    iget-object v2, p0, Ll/sxs;->d:Lcom/google/android/material/tabs/TabLayout;

    .line 17
    .line 18
    invoke-virtual {v2, v0}, Lcom/google/android/material/tabs/TabLayout;->getTabAt(I)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-virtual {p0}, Ll/sxs;->act()Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    invoke-static {v3, v1}, Ll/sxs;->w(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    new-instance v3, Ll/rxs;

    .line 31
    .line 32
    invoke-direct {v3, p0, v0}, Ll/rxs;-><init>(Ll/sxs;I)V

    .line 33
    .line 34
    .line 35
    invoke-static {v1, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 36
    .line 37
    .line 38
    if-eqz v2, :cond_0

    .line 39
    .line 40
    invoke-virtual {v2, v1}, Lcom/google/android/material/tabs/TabLayout$Tab;->setCustomView(Landroid/view/View;)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 41
    .line 42
    .line 43
    :cond_0
    sget v2, Ll/ldc0;->k2:I

    .line 44
    .line 45
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    check-cast v1, Lv/VText;

    .line 50
    .line 51
    if-ne v0, p2, :cond_1

    .line 52
    .line 53
    sget v2, Ll/hgc0;->h:I

    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_1
    sget v2, Ll/hgc0;->j:I

    .line 57
    .line 58
    :goto_1
    invoke-virtual {p0, v1, v2}, Ll/sxs;->J(Landroid/widget/TextView;I)V

    .line 59
    .line 60
    .line 61
    invoke-static {}, Ll/mbs;->g()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    invoke-interface {v2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->I4()Z

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    if-eqz v2, :cond_2

    .line 70
    .line 71
    const/high16 v2, 0x41a00000    # 20.0f

    .line 72
    .line 73
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 74
    .line 75
    .line 76
    :cond_2
    add-int/lit8 v0, v0, 0x1

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_3
    return-void
.end method

.method public L(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object p0, p0, Ll/sxs;->a:Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/skin/ToolBarSkinView;

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-static {}, Ll/bnl0;->y0()I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    int-to-float p1, p1

    .line 14
    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationX(F)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    const/4 p1, 0x0

    .line 19
    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationX(F)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public M(Ljava/util/List;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/sxs;->c:Landroidx/viewpager/widget/ViewPager;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    iget-object v0, p0, Ll/sxs;->d:Lcom/google/android/material/tabs/TabLayout;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    new-instance v0, Ll/mxs;

    .line 11
    .line 12
    invoke-direct {v0, p2}, Ll/mxs;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-static {p1, v0}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    if-ltz p2, :cond_1

    .line 20
    .line 21
    iget-object p0, p0, Ll/sxs;->c:Landroidx/viewpager/widget/ViewPager;

    .line 22
    .line 23
    invoke-virtual {p0, p2}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    new-instance p2, Ll/nxs;

    .line 28
    .line 29
    invoke-direct {p2}, Ll/nxs;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-static {p1, p2}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-ltz p1, :cond_2

    .line 37
    .line 38
    iget-object p0, p0, Ll/sxs;->c:Landroidx/viewpager/widget/ViewPager;

    .line 39
    .line 40
    invoke-virtual {p0, p1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 41
    .line 42
    .line 43
    :cond_2
    :goto_0
    return-void
.end method

.method public final N(ZLjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0, p2, p3}, Ll/sxs;->C(Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    invoke-virtual {p0, p2, p3}, Ll/sxs;->C(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p2, p3}, Ll/sxs;->B(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final O(Lcom/google/android/material/tabs/TabLayout$Tab;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout$Tab;->getCustomView()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout$Tab;->getCustomView()Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const-string v0, "square-suggested"

    .line 16
    .line 17
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    const-string v1, "p_audio_explore_recommend"

    .line 22
    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    const-string p1, "e_live_top_tab"

    .line 26
    .line 27
    invoke-static {p1, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    const/4 p1, 0x0

    .line 31
    invoke-virtual {p0, p2, p1}, Ll/sxs;->A(Ljava/lang/String;Z)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    const-string p0, "square-multi-call"

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-eqz p0, :cond_1

    .line 42
    .line 43
    const-string p0, "e_video_room_top_tab"

    .line 44
    .line 45
    invoke-static {p0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    :cond_1
    return-void
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/sxs;->b:Ll/dxs;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/mus;->act()Lcom/p1/mobile/android/app/Act;

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
    check-cast p1, Ll/dxs;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/sxs;->q(Ll/dxs;)V

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

.method public p()V
    .locals 0

    .line 1
    return-void
.end method

.method public q(Ll/dxs;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sxs;->b:Ll/dxs;

    .line 2
    .line 3
    return-void
.end method

.method public r()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/sxs;->d:Lcom/google/android/material/tabs/TabLayout;

    .line 2
    .line 3
    iget-object v1, p0, Ll/sxs;->k:Lcom/google/android/material/tabs/TabLayout$OnTabSelectedListener;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/google/android/material/tabs/TabLayout;->addOnTabSelectedListener(Lcom/google/android/material/tabs/TabLayout$OnTabSelectedListener;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/sxs;->d:Lcom/google/android/material/tabs/TabLayout;

    .line 9
    .line 10
    sget v1, Ll/l9c0;->n:I

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lcom/google/android/material/tabs/TabLayout;->setTabRippleColorResource(I)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/sxs;->d:Lcom/google/android/material/tabs/TabLayout;

    .line 16
    .line 17
    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    invoke-direct {v1, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lcom/google/android/material/tabs/TabLayout;->setSelectedTabIndicator(Landroid/graphics/drawable/Drawable;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/sxs;->c:Landroidx/viewpager/widget/ViewPager;

    .line 27
    .line 28
    new-instance v1, Ll/sxs$b;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Ll/sxs$b;-><init>(Ll/sxs;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public s()Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/sxs;->g:Ll/n2u;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    iget-object v2, p0, Ll/sxs;->c:Landroidx/viewpager/widget/ViewPager;

    .line 7
    .line 8
    if-eqz v2, :cond_1

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/n2u;->getCount()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const/4 v2, 0x1

    .line 15
    if-ge v0, v2, :cond_0

    .line 16
    .line 17
    return-object v1

    .line 18
    :cond_0
    iget-object v0, p0, Ll/sxs;->g:Ll/n2u;

    .line 19
    .line 20
    iget-object p0, p0, Ll/sxs;->c:Landroidx/viewpager/widget/ViewPager;

    .line 21
    .line 22
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    invoke-virtual {v0, p0}, Ll/bvu;->getItem(I)Landroidx/fragment/app/Fragment;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    instance-of v0, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;

    .line 31
    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    check-cast p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;

    .line 35
    .line 36
    return-object p0

    .line 37
    :cond_1
    return-object v1
.end method

.method public u(I)Lcom/p1/mobile/android/app/Frag;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/sxs;->g:Ll/n2u;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    iget-object v2, p0, Ll/sxs;->c:Landroidx/viewpager/widget/ViewPager;

    .line 7
    .line 8
    if-eqz v2, :cond_1

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/n2u;->getCount()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-lt p1, v0, :cond_0

    .line 15
    .line 16
    return-object v1

    .line 17
    :cond_0
    iget-object p0, p0, Ll/sxs;->g:Ll/n2u;

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ll/bvu;->getItem(I)Landroidx/fragment/app/Fragment;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    instance-of p1, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;

    .line 24
    .line 25
    if-eqz p1, :cond_1

    .line 26
    .line 27
    check-cast p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;

    .line 28
    .line 29
    return-object p0

    .line 30
    :cond_1
    return-object v1
.end method

.method public v(I)Ljava/lang/String;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/sxs;->g:Ll/n2u;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/n2u;->l()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-ltz p1, :cond_0

    .line 8
    .line 9
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-ge p1, v0, :cond_0

    .line 14
    .line 15
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->getRequestName()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0

    .line 26
    :cond_0
    const-string p0, "NA"

    .line 27
    .line 28
    return-object p0
.end method

.method public final synthetic x(I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/sxs;->G(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic y(Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/sxs;->H(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic z(ILandroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sxs;->c:Landroidx/viewpager/widget/ViewPager;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
