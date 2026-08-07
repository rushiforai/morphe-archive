.class public Ll/f920;
.super Ll/ag40;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ag40<",
        "Ll/u820;",
        ">;"
    }
.end annotation


# instance fields
.field public b:Lv/navigationbar/VNavigationBar;

.field public c:Landroid/widget/FrameLayout;

.field public d:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/StateScrollVIew;

.field public e:Landroid/widget/LinearLayout;

.field public f:Landroid/widget/LinearLayout;

.field public g:Landroid/widget/FrameLayout;

.field public h:Ll/u820;

.field public i:Landroid/widget/LinearLayout;

.field public j:Lv/VOnlineIndicator;

.field public k:Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView;

.field public l:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderView;

.field public m:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;

.field public n:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2;

.field public o:I


# direct methods
.method public static synthetic m(Ll/f920;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/f920;->L()V

    return-void
.end method

.method public static synthetic n(Ll/f920;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/f920;->N()V

    return-void
.end method

.method public static synthetic p(Ll/f920;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/f920;->J()V

    return-void
.end method

.method public static synthetic q(Ll/f920;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/f920;->P()V

    return-void
.end method

.method public static synthetic s(Ll/f920;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/f920;->K()V

    return-void
.end method

.method public static synthetic u(Ll/f920;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/f920;->M()V

    return-void
.end method

.method public static synthetic v(Ll/f920;Ll/iq40;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/f920;->R(Ll/iq40;)V

    return-void
.end method

.method public static synthetic w(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic x(Ll/f920;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/f920;->Q(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic y(Ll/f920;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/f920;->O()V

    return-void
.end method


# virtual methods
.method public A(Ll/u820;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/f920;->h:Ll/u820;

    .line 2
    .line 3
    return-void
.end method

.method public B()Ljava/util/Collection;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "+",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ll/x20;",
            ">;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/f920;->h:Ll/u820;

    .line 7
    .line 8
    invoke-virtual {v1}, Ll/u820;->i1()Ll/p520;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1}, Ll/p520;->e0()Ljava/util/Collection;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 17
    .line 18
    .line 19
    new-instance v1, Ll/y820;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/y820;-><init>(Ll/f920;)V

    .line 22
    .line 23
    .line 24
    const-string v2, "self look"

    .line 25
    .line 26
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    new-instance v1, Ll/z820;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/z820;-><init>(Ll/f920;)V

    .line 36
    .line 37
    .line 38
    const-string v2, "change style"

    .line 39
    .line 40
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    new-instance v1, Ll/a920;

    .line 48
    .line 49
    invoke-direct {v1, p0}, Ll/a920;-><init>(Ll/f920;)V

    .line 50
    .line 51
    .line 52
    const-string v2, "task tips"

    .line 53
    .line 54
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    new-instance v1, Ll/b920;

    .line 62
    .line 63
    invoke-direct {v1, p0}, Ll/b920;-><init>(Ll/f920;)V

    .line 64
    .line 65
    .line 66
    const-string v2, "task input loop : picture"

    .line 67
    .line 68
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    new-instance v1, Ll/c920;

    .line 76
    .line 77
    invoke-direct {v1, p0}, Ll/c920;-><init>(Ll/f920;)V

    .line 78
    .line 79
    .line 80
    const-string v2, "task input loop : signature"

    .line 81
    .line 82
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    new-instance v1, Ll/d920;

    .line 90
    .line 91
    invoke-direct {v1, p0}, Ll/d920;-><init>(Ll/f920;)V

    .line 92
    .line 93
    .line 94
    const-string p0, "task input loop : verification"

    .line 95
    .line 96
    invoke-static {p0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    return-object v0
.end method

.method public final C(Landroid/view/LayoutInflater;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/gra;->p2()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/f920;->h:Ll/u820;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/u820;->j1()Ll/v1b0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    instance-of v0, v0, Ll/w620;

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Ll/f920;->h:Ll/u820;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/u820;->j1()Ll/v1b0;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Ll/w620;

    .line 24
    .line 25
    iget-object v1, p0, Ll/f920;->i:Landroid/widget/LinearLayout;

    .line 26
    .line 27
    new-instance v2, Ll/v820;

    .line 28
    .line 29
    invoke-direct {v2, p0}, Ll/v820;-><init>(Ll/f920;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v1, v2}, Ll/w620;->b(Landroid/view/View;Ll/x20;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    iget-object v0, p0, Ll/f920;->h:Ll/u820;

    .line 36
    .line 37
    invoke-virtual {v0}, Ll/u820;->j1()Ll/v1b0;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iget-object v1, p0, Ll/f920;->g:Landroid/widget/FrameLayout;

    .line 42
    .line 43
    invoke-interface {v0, p1, v1}, Ll/iam;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    iget-object p0, p0, Ll/f920;->g:Landroid/widget/FrameLayout;

    .line 48
    .line 49
    if-eq p1, p0, :cond_1

    .line 50
    .line 51
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 52
    .line 53
    .line 54
    :cond_1
    return-void
.end method

.method public D1()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/f920;->h:Ll/u820;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/u820;->j1()Ll/v1b0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ll/v1b0;->D1()V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->fs()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->ko()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    :cond_0
    iget-object v0, p0, Ll/f920;->h:Ll/u820;

    .line 31
    .line 32
    invoke-virtual {v0}, Ll/u820;->k1()Ll/iq40;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    iget-object v0, p0, Ll/f920;->h:Ll/u820;

    .line 39
    .line 40
    invoke-virtual {v0}, Ll/u820;->k1()Ll/iq40;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v0}, Ll/iq40;->x0()V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0}, Ll/ag40;->act()Lcom/p1/mobile/android/app/Act;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    new-instance v2, Ll/w820;

    .line 52
    .line 53
    invoke-direct {v2, p0, v0}, Ll/w820;-><init>(Ll/f920;Ll/iq40;)V

    .line 54
    .line 55
    .line 56
    iget v0, p0, Ll/f920;->o:I

    .line 57
    .line 58
    int-to-long v3, v0

    .line 59
    invoke-static {v1, v2, v3, v4}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 60
    .line 61
    .line 62
    :cond_1
    iget-object v0, p0, Ll/f920;->h:Ll/u820;

    .line 63
    .line 64
    if-eqz v0, :cond_2

    .line 65
    .line 66
    invoke-virtual {v0}, Ll/u820;->k1()Ll/iq40;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    if-eqz v0, :cond_2

    .line 71
    .line 72
    invoke-virtual {v0}, Ll/iq40;->D1()V

    .line 73
    .line 74
    .line 75
    :cond_2
    iget-object v0, p0, Ll/f920;->k:Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView;

    .line 76
    .line 77
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-eqz v0, :cond_3

    .line 82
    .line 83
    iget-object p0, p0, Ll/f920;->k:Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView;

    .line 84
    .line 85
    const/4 v0, 0x0

    .line 86
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView;->d(Z)V

    .line 87
    .line 88
    .line 89
    :cond_3
    return-void
.end method

.method public final E(Landroid/view/LayoutInflater;)V
    .locals 6

    .line 1
    sget v0, Ll/kec0;->D7:I

    .line 2
    .line 3
    iget-object v1, p0, Ll/f920;->b:Lv/navigationbar/VNavigationBar;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-virtual {p1, v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;

    .line 11
    .line 12
    iput-object p1, p0, Ll/f920;->m:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;

    .line 13
    .line 14
    iget-object v0, p0, Ll/f920;->b:Lv/navigationbar/VNavigationBar;

    .line 15
    .line 16
    invoke-virtual {v0, p1}, Lv/navigationbar/VNavigationBar;->setLeftIconView(Landroid/view/View;)V

    .line 17
    .line 18
    .line 19
    invoke-static {}, Ll/gra;->z()Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-eqz p1, :cond_0

    .line 24
    .line 25
    iget-object p1, p0, Ll/f920;->m:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;

    .line 26
    .line 27
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;->k0()V

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Ll/f920;->b:Lv/navigationbar/VNavigationBar;

    .line 31
    .line 32
    invoke-virtual {p1, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 33
    .line 34
    .line 35
    :cond_0
    new-instance p1, Lv/VImage;

    .line 36
    .line 37
    invoke-virtual {p0}, Ll/ag40;->d()Lcom/p1/mobile/putong/core/newui/profile/ProfileFrag;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-direct {p1, v0}, Lv/VImage;-><init>(Landroid/content/Context;)V

    .line 46
    .line 47
    .line 48
    sget v0, Ll/dbc0;->fh:I

    .line 49
    .line 50
    const/high16 v1, 0x42000000    # 32.0f

    .line 51
    .line 52
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    invoke-static {}, Ll/gra;->L3()Z

    .line 57
    .line 58
    .line 59
    move-result v3

    .line 60
    if-eqz v3, :cond_2

    .line 61
    .line 62
    invoke-static {}, Ll/gra;->z()Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-eqz v0, :cond_1

    .line 67
    .line 68
    sget v0, Ll/dbc0;->hh:I

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_1
    sget v0, Ll/dbc0;->gh:I

    .line 72
    .line 73
    :goto_0
    const/high16 v1, 0x42100000    # 36.0f

    .line 74
    .line 75
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    :cond_2
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 80
    .line 81
    .line 82
    new-instance v0, Lv/VFrame;

    .line 83
    .line 84
    invoke-virtual {p0}, Ll/ag40;->d()Lcom/p1/mobile/putong/core/newui/profile/ProfileFrag;

    .line 85
    .line 86
    .line 87
    move-result-object v3

    .line 88
    invoke-virtual {v3}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 89
    .line 90
    .line 91
    move-result-object v3

    .line 92
    invoke-direct {v0, v3}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 93
    .line 94
    .line 95
    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    .line 96
    .line 97
    invoke-direct {v3, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {v0, p1, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 101
    .line 102
    .line 103
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 104
    .line 105
    sget v1, Ll/qa00;->j:I

    .line 106
    .line 107
    invoke-direct {p1, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 108
    .line 109
    .line 110
    const/16 v1, 0x35

    .line 111
    .line 112
    iput v1, p1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 113
    .line 114
    new-instance v1, Lv/VOnlineIndicator;

    .line 115
    .line 116
    invoke-virtual {p0}, Ll/ag40;->d()Lcom/p1/mobile/putong/core/newui/profile/ProfileFrag;

    .line 117
    .line 118
    .line 119
    move-result-object v3

    .line 120
    invoke-virtual {v3}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 121
    .line 122
    .line 123
    move-result-object v3

    .line 124
    invoke-direct {v1, v3}, Lv/VOnlineIndicator;-><init>(Landroid/content/Context;)V

    .line 125
    .line 126
    .line 127
    iput-object v1, p0, Ll/f920;->j:Lv/VOnlineIndicator;

    .line 128
    .line 129
    const/4 v3, 0x1

    .line 130
    invoke-virtual {v1, v3}, Lv/VOnlineIndicator;->setIndicatorStyle(I)V

    .line 131
    .line 132
    .line 133
    const/16 v1, 0x14

    .line 134
    .line 135
    const/16 v4, 0x8

    .line 136
    .line 137
    const/4 v5, 0x4

    .line 138
    invoke-virtual {v0, v1, v5, v4, v5}, Landroid/view/View;->setPadding(IIII)V

    .line 139
    .line 140
    .line 141
    iget-object v1, p0, Ll/f920;->j:Lv/VOnlineIndicator;

    .line 142
    .line 143
    invoke-virtual {v0, v1, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 144
    .line 145
    .line 146
    iget-object p1, p0, Ll/f920;->b:Lv/navigationbar/VNavigationBar;

    .line 147
    .line 148
    new-array v1, v3, [Landroid/view/View;

    .line 149
    .line 150
    aput-object v0, v1, v2

    .line 151
    .line 152
    invoke-virtual {p1, v1}, Lv/navigationbar/VNavigationBar;->setRightIconViews([Landroid/view/View;)V

    .line 153
    .line 154
    .line 155
    new-instance p1, Ll/e920;

    .line 156
    .line 157
    invoke-direct {p1, p0}, Ll/e920;-><init>(Ll/f920;)V

    .line 158
    .line 159
    .line 160
    invoke-static {v0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 161
    .line 162
    .line 163
    return-void
.end method

.method public final F(Landroid/view/LayoutInflater;)V
    .locals 3

    .line 1
    sget v0, Ll/kec0;->L7:I

    .line 2
    .line 3
    iget-object v1, p0, Ll/f920;->c:Landroid/widget/FrameLayout;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-virtual {p1, v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2;

    .line 11
    .line 12
    iput-object p1, p0, Ll/f920;->n:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2;

    .line 13
    .line 14
    iget-object v0, p0, Ll/f920;->c:Landroid/widget/FrameLayout;

    .line 15
    .line 16
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Ll/f920;->n:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2;

    .line 20
    .line 21
    iget-object v0, p0, Ll/f920;->h:Ll/u820;

    .line 22
    .line 23
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2;->d(Ll/u820;)V

    .line 24
    .line 25
    .line 26
    invoke-static {}, Ll/gra;->z()Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    iget-object p0, p0, Ll/f920;->c:Landroid/widget/FrameLayout;

    .line 31
    .line 32
    if-eqz p1, :cond_0

    .line 33
    .line 34
    sget p1, Ll/qa00;->e:I

    .line 35
    .line 36
    invoke-static {p0, p1}, Ll/bnl0;->c0(Landroid/view/View;I)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_0
    invoke-static {p0, v2}, Ll/bnl0;->c0(Landroid/view/View;I)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public final G(Landroid/view/LayoutInflater;)V
    .locals 3

    .line 1
    sget v0, Ll/kec0;->N7:I

    .line 2
    .line 3
    iget-object v1, p0, Ll/f920;->c:Landroid/widget/FrameLayout;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-virtual {p1, v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderView;

    .line 11
    .line 12
    iput-object p1, p0, Ll/f920;->l:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderView;

    .line 13
    .line 14
    iget-object v0, p0, Ll/f920;->c:Landroid/widget/FrameLayout;

    .line 15
    .line 16
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Ll/f920;->l:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderView;

    .line 20
    .line 21
    iget-object v0, p0, Ll/f920;->h:Ll/u820;

    .line 22
    .line 23
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderView;->h(Ll/u820;)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Ll/f920;->c:Landroid/widget/FrameLayout;

    .line 27
    .line 28
    sget p1, Ll/qa00;->e:I

    .line 29
    .line 30
    invoke-static {p0, p1}, Ll/bnl0;->c0(Landroid/view/View;I)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final H()V
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ag40;->C0()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/f920;->k:Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView;

    .line 11
    .line 12
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 13
    .line 14
    const/4 v1, -0x1

    .line 15
    const/4 v2, -0x2

    .line 16
    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 17
    .line 18
    .line 19
    sget v1, Ll/qa00;->h:I

    .line 20
    .line 21
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 22
    .line 23
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 24
    .line 25
    sget v1, Ll/qa00;->d:I

    .line 26
    .line 27
    neg-int v1, v1

    .line 28
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 29
    .line 30
    iget-object v1, p0, Ll/f920;->i:Landroid/widget/LinearLayout;

    .line 31
    .line 32
    iget-object v2, p0, Ll/f920;->k:Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView;

    .line 33
    .line 34
    invoke-virtual {v1, v2, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Ll/f920;->k:Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView;

    .line 38
    .line 39
    invoke-virtual {p0}, Ll/ag40;->act()Lcom/p1/mobile/android/app/Act;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView;->c(Lcom/p1/mobile/android/app/Act;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public final I(Landroid/view/LayoutInflater;)V
    .locals 4

    .line 1
    new-instance v0, Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ag40;->d()Lcom/p1/mobile/putong/core/newui/profile/ProfileFrag;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Ll/f920;->i:Landroid/widget/LinearLayout;

    .line 15
    .line 16
    const/4 v1, 0x1

    .line 17
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/f920;->i:Landroid/widget/LinearLayout;

    .line 21
    .line 22
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 23
    .line 24
    const/4 v2, -0x1

    .line 25
    const/4 v3, -0x2

    .line 26
    invoke-direct {v1, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/f920;->h:Ll/u820;

    .line 33
    .line 34
    invoke-virtual {v0}, Ll/u820;->k1()Ll/iq40;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iget-object v1, p0, Ll/f920;->i:Landroid/widget/LinearLayout;

    .line 39
    .line 40
    invoke-virtual {v0, p1, v1}, Ll/iq40;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    iget-object v0, p0, Ll/f920;->i:Landroid/widget/LinearLayout;

    .line 45
    .line 46
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 47
    .line 48
    .line 49
    iget-object p1, p0, Ll/f920;->f:Landroid/widget/LinearLayout;

    .line 50
    .line 51
    iget-object v0, p0, Ll/f920;->i:Landroid/widget/LinearLayout;

    .line 52
    .line 53
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 54
    .line 55
    .line 56
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-interface {p1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->fs()Z

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    if-eqz p1, :cond_0

    .line 65
    .line 66
    iget-object p0, p0, Ll/f920;->h:Ll/u820;

    .line 67
    .line 68
    invoke-virtual {p0}, Ll/u820;->k1()Ll/iq40;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-virtual {p0}, Ll/iq40;->q0()V

    .line 73
    .line 74
    .line 75
    :cond_0
    return-void
.end method

.method public final synthetic J()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f920;->h:Ll/u820;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/u820;->k1()Ll/iq40;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ll/iq40;->v0()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic K()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/f920;->h:Ll/u820;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/f920;->h:Ll/u820;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/u820;->k1()Ll/iq40;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Ll/iq40;->H()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic L()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/f920;->b:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    invoke-virtual {v0}, Lv/navigationbar/VNavigationBar;->getRightIconContainer()Lv/VLinear;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Ll/ag40;->l(Landroid/view/View;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic M()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/f920;->h:Ll/u820;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "tantan://user_mirror?entry=picture"

    .line 8
    .line 9
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {p0, v0}, Ll/nae0;->m(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic N()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/f920;->h:Ll/u820;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "tantan://user_mirror?entry=signature"

    .line 8
    .line 9
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {p0, v0}, Ll/nae0;->m(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic O()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/f920;->h:Ll/u820;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "tantan://user_mirror?entry=verification"

    .line 8
    .line 9
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {p0, v0}, Ll/nae0;->m(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic P()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/f920;->i:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ll/f920;->i:Landroid/widget/LinearLayout;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v1, p0, Ll/f920;->f:Landroid/widget/LinearLayout;

    .line 16
    .line 17
    if-eq v0, v1, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Ll/f920;->i:Landroid/widget/LinearLayout;

    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Landroid/view/ViewGroup;

    .line 26
    .line 27
    iget-object v1, p0, Ll/f920;->i:Landroid/widget/LinearLayout;

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/f920;->f:Landroid/widget/LinearLayout;

    .line 33
    .line 34
    iget-object p0, p0, Ll/f920;->i:Landroid/widget/LinearLayout;

    .line 35
    .line 36
    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 37
    .line 38
    .line 39
    :cond_0
    return-void

    .line 40
    :cond_1
    iget-object v0, p0, Ll/f920;->f:Landroid/widget/LinearLayout;

    .line 41
    .line 42
    iget-object p0, p0, Ll/f920;->i:Landroid/widget/LinearLayout;

    .line 43
    .line 44
    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public final synthetic Q(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f920;->h:Ll/u820;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/u820;->H1()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic R(Ll/iq40;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ag40;->a:Lcom/p1/mobile/putong/core/newui/profile/ProfileFrag;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->isHidden()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {p0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->ko()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p1}, Ll/iq40;->w0()V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    invoke-virtual {p1}, Ll/iq40;->t0()V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    const/4 p1, 0x0

    .line 28
    iput p1, p0, Ll/f920;->o:I

    .line 29
    .line 30
    return-void
.end method

.method public S()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f920;->l:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderView;->m()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public T(Lcom/p1/mobile/putong/core/data/FakeGuideData;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/f920;->n:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2;->f(Lcom/p1/mobile/putong/core/data/FakeGuideData;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object v0, p0, Ll/f920;->l:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderView;

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderView;->n(Lcom/p1/mobile/putong/core/data/FakeGuideData;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/f920;->l:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderView;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderView;->r()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public U()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f920;->l:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderView;->o()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public V()V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/f920;->b:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    new-array v0, v0, [Landroid/view/View;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    aput-object p0, v0, v1

    .line 8
    .line 9
    invoke-static {v0}, Ll/bnl0;->Z([Landroid/view/View;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public W(IZ)V
    .locals 1

    .line 1
    const/4 v0, 0x6

    .line 2
    if-eq p1, v0, :cond_0

    .line 3
    .line 4
    return-void

    .line 5
    :cond_0
    iget-object p0, p0, Ll/f920;->j:Lv/VOnlineIndicator;

    .line 6
    .line 7
    invoke-static {p0, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public X()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/f920;->b:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/f920;->b:Lv/navigationbar/VNavigationBar;

    .line 10
    .line 11
    invoke-virtual {v0}, Lv/navigationbar/VNavigationBar;->getRightIconContainer()Lv/VLinear;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Ll/f920;->b:Lv/navigationbar/VNavigationBar;

    .line 22
    .line 23
    invoke-virtual {v0}, Lv/navigationbar/VNavigationBar;->getRightIconContainer()Lv/VLinear;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {p0, v0}, Ll/ag40;->l(Landroid/view/View;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public Y(ZLjava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/f920;->n:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1, p2}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2;->g(ZLjava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object v0, p0, Ll/f920;->l:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderView;

    .line 10
    .line 11
    invoke-virtual {v0, p1, p2}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderView;->s(ZLjava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/f920;->l:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderView;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderView;->r()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public Z(Ll/pf60;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/core/data/AppealInfo;",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/f920;->n:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2;->h(Ll/pf60;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object v0, p0, Ll/f920;->l:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderView;

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderView;->u(Ll/pf60;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/f920;->l:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderView;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderView;->r()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public a0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f920;->k:Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView;->f()Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f920;->h:Ll/u820;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/u820;->j1()Ll/v1b0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ll/iam;->destroy()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public e()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f920;->j:Lv/VOnlineIndicator;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/u820;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/f920;->A(Ll/u820;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/f920;->z(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p0, p1}, Ll/f920;->E(Landroid/view/LayoutInflater;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ll/gra;->z()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Ll/f920;->F(Landroid/view/LayoutInflater;)V

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-virtual {p0, p1}, Ll/f920;->G(Landroid/view/LayoutInflater;)V

    .line 19
    .line 20
    .line 21
    :goto_0
    invoke-virtual {p0, p1}, Ll/f920;->I(Landroid/view/LayoutInflater;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Ll/f920;->H()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, p1}, Ll/f920;->C(Landroid/view/LayoutInflater;)V

    .line 28
    .line 29
    .line 30
    return-object p2
.end method

.method public o()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f920;->h:Ll/u820;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/u820;->j1()Ll/v1b0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ll/v1b0;->o()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public r()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/f920;->d:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/StateScrollVIew;

    .line 2
    .line 3
    new-instance v0, Ll/x820;

    .line 4
    .line 5
    invoke-direct {v0}, Ll/x820;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/StateScrollVIew;->setOnScrollStateListener(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/StateScrollVIew$a;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public x1()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/v1b0;->x1()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/f920;->h:Ll/u820;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/u820;->j1()Ll/v1b0;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-interface {v0}, Ll/v1b0;->x1()V

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-object v0, p0, Ll/f920;->k:Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    iget-object p0, p0, Ll/f920;->k:Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView;

    .line 24
    .line 25
    const/4 v0, 0x1

    .line 26
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView;->d(Z)V

    .line 27
    .line 28
    .line 29
    :cond_1
    return-void
.end method

.method public x2()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/f920;->k:Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/f920;->k:Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView;->d(Z)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public z(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/g920;->b(Ll/f920;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
