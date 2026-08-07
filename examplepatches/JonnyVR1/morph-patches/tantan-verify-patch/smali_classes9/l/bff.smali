.class public Ll/bff;
.super Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;
.source "SourceFile"


# instance fields
.field public u:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

.field public v:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

.field public w:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;


# direct methods
.method public constructor <init>(Ll/t3m;Ll/ner;)V
    .locals 0
    .param p1    # Ll/t3m;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;-><init>(Ll/t3m;Ll/ner;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic S(Ll/bff;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/bff;->X()V

    return-void
.end method

.method public static synthetic T(Ll/bff;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/bff;->W()V

    return-void
.end method

.method public static synthetic U(Ll/bff;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/bff;->V()V

    return-void
.end method

.method private synthetic V()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v0, v0, [Ll/sfj0$a;

    .line 3
    .line 4
    const-string v1, "e_edit_profile_income"

    .line 5
    .line 6
    const-string v2, "p_edit_profile_view"

    .line 7
    .line 8
    invoke-static {v1, v2, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->i()Lcom/p1/mobile/android/app/Frag;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputIncome;

    .line 16
    .line 17
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputIncome;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-static {p0, v0}, Ll/ljf;->c(Lcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method private synthetic W()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v0, v0, [Ll/sfj0$a;

    .line 3
    .line 4
    const-string v1, "e_edit_profile_car"

    .line 5
    .line 6
    const-string v2, "p_edit_profile_view"

    .line 7
    .line 8
    invoke-static {v1, v2, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->i()Lcom/p1/mobile/android/app/Frag;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputCar;

    .line 16
    .line 17
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputCar;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-static {p0, v0}, Ll/ljf;->c(Lcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method private synthetic X()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v0, v0, [Ll/sfj0$a;

    .line 3
    .line 4
    const-string v1, "e_edit_profile_house"

    .line 5
    .line 6
    const-string v2, "p_edit_profile_view"

    .line 7
    .line 8
    invoke-static {v1, v2, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->i()Lcom/p1/mobile/android/app/Frag;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputHouse;

    .line 16
    .line 17
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputHouse;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-static {p0, v0}, Ll/ljf;->c(Lcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method


# virtual methods
.method public m()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "\u6211\u7684\u8d44\u4ea7"

    .line 2
    .line 3
    return-object p0
.end method

.method public n()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "asset"

    .line 2
    .line 3
    return-object p0
.end method

.method public q(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->q(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/bff;->u:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 5
    .line 6
    new-instance v0, Ll/yef;

    .line 7
    .line 8
    invoke-direct {v0, p0}, Ll/yef;-><init>(Ll/bff;)V

    .line 9
    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    invoke-virtual {p0, p1, v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->v(Landroid/view/View;Ll/x20;Z)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Ll/bff;->w:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 16
    .line 17
    new-instance v0, Ll/zef;

    .line 18
    .line 19
    invoke-direct {v0, p0}, Ll/zef;-><init>(Ll/bff;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, p1, v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->v(Landroid/view/View;Ll/x20;Z)V

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Ll/bff;->v:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 26
    .line 27
    new-instance v0, Ll/aff;

    .line 28
    .line 29
    invoke-direct {v0, p0}, Ll/aff;-><init>(Ll/bff;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, p1, v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->v(Landroid/view/View;Ll/x20;Z)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public y(Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/bff;->u:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 11
    .line 12
    const-string v1, "\u5e74\u6536\u5165"

    .line 13
    .line 14
    sget v2, Ll/dbc0;->yt:I

    .line 15
    .line 16
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->d(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 20
    .line 21
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;-><init>(Landroid/content/Context;)V

    .line 26
    .line 27
    .line 28
    iput-object v0, p0, Ll/bff;->w:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 29
    .line 30
    const-string v1, "\u8f66\u4ea7"

    .line 31
    .line 32
    sget v2, Ll/dbc0;->wt:I

    .line 33
    .line 34
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->d(Ljava/lang/String;I)V

    .line 35
    .line 36
    .line 37
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 38
    .line 39
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;-><init>(Landroid/content/Context;)V

    .line 44
    .line 45
    .line 46
    iput-object v0, p0, Ll/bff;->v:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 47
    .line 48
    const-string v1, "\u623f\u4ea7"

    .line 49
    .line 50
    sget v2, Ll/dbc0;->xt:I

    .line 51
    .line 52
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->d(Ljava/lang/String;I)V

    .line 53
    .line 54
    .line 55
    new-instance v0, Landroid/widget/LinearLayout;

    .line 56
    .line 57
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-direct {v0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 62
    .line 63
    .line 64
    const/4 p1, 0x1

    .line 65
    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 66
    .line 67
    .line 68
    iget-object p1, p0, Ll/bff;->u:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 69
    .line 70
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 71
    .line 72
    .line 73
    iget-object p1, p0, Ll/bff;->u:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 74
    .line 75
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->getDividerView()Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditDividerView;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 80
    .line 81
    .line 82
    iget-object p1, p0, Ll/bff;->w:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 83
    .line 84
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 85
    .line 86
    .line 87
    iget-object p1, p0, Ll/bff;->w:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 88
    .line 89
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->getDividerView()Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditDividerView;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 94
    .line 95
    .line 96
    iget-object p0, p0, Ll/bff;->v:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 97
    .line 98
    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 99
    .line 100
    .line 101
    return-object v0
.end method

.method public z()V
    .locals 8

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->f()Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 8
    .line 9
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 10
    .line 11
    iget-object v2, v1, Lcom/p1/mobile/putong/data/UserWealth;->upperIncome:Ljava/util/List;

    .line 12
    .line 13
    iget-object v1, v1, Lcom/p1/mobile/putong/data/UserWealth;->lowIncome:Ljava/util/List;

    .line 14
    .line 15
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    const-string v4, ""

    .line 20
    .line 21
    if-eqz v3, :cond_0

    .line 22
    .line 23
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    if-nez v3, :cond_1

    .line 28
    .line 29
    :cond_0
    invoke-static {v2, v1}, Ll/baj;->M(Ljava/util/List;Ljava/util/List;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-static {v1}, Ll/tr90;->v(Ljava/lang/String;)Z

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    if-nez v2, :cond_1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    move-object v1, v4

    .line 41
    :goto_0
    iget-object v2, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 42
    .line 43
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 44
    .line 45
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 46
    .line 47
    iget-object v2, v2, Lcom/p1/mobile/putong/data/UserWealth;->car:Ljava/util/List;

    .line 48
    .line 49
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    const/4 v5, 0x0

    .line 54
    if-nez v3, :cond_2

    .line 55
    .line 56
    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    check-cast v2, Ljava/lang/String;

    .line 61
    .line 62
    invoke-static {v2}, Ll/baj;->n(Ljava/lang/String;)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    invoke-static {v2}, Ll/tr90;->v(Ljava/lang/String;)Z

    .line 67
    .line 68
    .line 69
    move-result v3

    .line 70
    if-nez v3, :cond_2

    .line 71
    .line 72
    goto :goto_1

    .line 73
    :cond_2
    move-object v2, v4

    .line 74
    :goto_1
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 75
    .line 76
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 77
    .line 78
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 79
    .line 80
    iget-object v3, v0, Lcom/p1/mobile/putong/data/UserWealth;->house:Ljava/util/List;

    .line 81
    .line 82
    iget-object v6, v0, Lcom/p1/mobile/putong/data/UserWealth;->houseRegion:Ljava/util/List;

    .line 83
    .line 84
    iget-object v0, v0, Lcom/p1/mobile/putong/data/UserWealth;->houseSubRegion:Ljava/util/List;

    .line 85
    .line 86
    invoke-static {v3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 87
    .line 88
    .line 89
    move-result v7

    .line 90
    if-nez v7, :cond_6

    .line 91
    .line 92
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 93
    .line 94
    .line 95
    move-result v7

    .line 96
    if-nez v7, :cond_4

    .line 97
    .line 98
    invoke-interface {v0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object v7

    .line 102
    check-cast v7, Ljava/lang/CharSequence;

    .line 103
    .line 104
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 105
    .line 106
    .line 107
    move-result v7

    .line 108
    if-eqz v7, :cond_3

    .line 109
    .line 110
    goto :goto_2

    .line 111
    :cond_3
    invoke-interface {v0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    check-cast v0, Ljava/lang/String;

    .line 116
    .line 117
    goto :goto_3

    .line 118
    :cond_4
    :goto_2
    invoke-static {v6}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 119
    .line 120
    .line 121
    move-result v0

    .line 122
    if-nez v0, :cond_5

    .line 123
    .line 124
    invoke-interface {v6, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    check-cast v0, Ljava/lang/CharSequence;

    .line 129
    .line 130
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 131
    .line 132
    .line 133
    move-result v0

    .line 134
    if-nez v0, :cond_5

    .line 135
    .line 136
    invoke-interface {v6, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    check-cast v0, Ljava/lang/String;

    .line 141
    .line 142
    goto :goto_3

    .line 143
    :cond_5
    move-object v0, v4

    .line 144
    :goto_3
    invoke-interface {v3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 145
    .line 146
    .line 147
    move-result-object v3

    .line 148
    check-cast v3, Ljava/lang/String;

    .line 149
    .line 150
    invoke-static {v3, v0}, Ll/baj;->K(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    invoke-static {v0}, Ll/tr90;->v(Ljava/lang/String;)Z

    .line 155
    .line 156
    .line 157
    move-result v3

    .line 158
    if-nez v3, :cond_6

    .line 159
    .line 160
    move-object v4, v0

    .line 161
    :cond_6
    iget-object v0, p0, Ll/bff;->u:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 162
    .line 163
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;->Q(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;Ljava/lang/String;)V

    .line 164
    .line 165
    .line 166
    iget-object v0, p0, Ll/bff;->w:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 167
    .line 168
    invoke-virtual {p0, v0, v2}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;->Q(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;Ljava/lang/String;)V

    .line 169
    .line 170
    .line 171
    iget-object v0, p0, Ll/bff;->v:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 172
    .line 173
    invoke-virtual {p0, v0, v4}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;->Q(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;Ljava/lang/String;)V

    .line 174
    .line 175
    .line 176
    return-void
.end method
