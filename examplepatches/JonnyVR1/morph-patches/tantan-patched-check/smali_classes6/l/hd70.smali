.class public Ll/hd70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;
.implements Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$j;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/ad70;",
        ">;",
        "Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$j;"
    }
.end annotation


# instance fields
.field public a:Lv/navigationbar/VNavigationBar;

.field public b:Lv/VText;

.field public c:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

.field public d:Lv/VList;

.field public e:Lv/VLinear;

.field public f:Lv/VDraweeView;

.field public g:Lv/VText;

.field public h:Ll/ad70;

.field public final i:Lcom/p1/mobile/putong/app/PutongAct;

.field public j:Landroid/view/View;

.field public k:Landroid/view/View;

.field public l:Ll/bc70;

.field public m:I


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/app/PutongAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/hd70;->i:Lcom/p1/mobile/putong/app/PutongAct;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/hd70;->i:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/id70;->b(Ll/hd70;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hd70;->i:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public b(Ll/ad70;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/hd70;->h:Ll/ad70;

    .line 2
    .line 3
    return-void
.end method

.method public c(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-gtz v0, :cond_2

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Ll/hd70;->c:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    .line 10
    .line 11
    const/16 v1, 0x8

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/hd70;->e:Lv/VLinear;

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 20
    .line 21
    .line 22
    iget v0, p0, Ll/hd70;->m:I

    .line 23
    .line 24
    if-nez v0, :cond_1

    .line 25
    .line 26
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 27
    .line 28
    iget-object v1, p0, Ll/hd70;->f:Lv/VDraweeView;

    .line 29
    .line 30
    sget v2, Ll/lbc0;->e1:I

    .line 31
    .line 32
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Ll/hd70;->g:Lv/VText;

    .line 36
    .line 37
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->L0:I

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 40
    .line 41
    .line 42
    :cond_1
    iget v0, p0, Ll/hd70;->m:I

    .line 43
    .line 44
    const/4 v1, 0x1

    .line 45
    if-ne v0, v1, :cond_2

    .line 46
    .line 47
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 48
    .line 49
    iget-object v1, p0, Ll/hd70;->f:Lv/VDraweeView;

    .line 50
    .line 51
    sget v2, Ll/lbc0;->T0:I

    .line 52
    .line 53
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Ll/hd70;->g:Lv/VText;

    .line 57
    .line 58
    const-string v1, "\u4f60\u8fd8\u6ca1\u6709\u7c89\u4e1d"

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 61
    .line 62
    .line 63
    :cond_2
    iget-object v0, p0, Ll/hd70;->l:Ll/bc70;

    .line 64
    .line 65
    invoke-virtual {v0, p1}, Ll/bc70;->t(Ljava/util/List;)V

    .line 66
    .line 67
    .line 68
    iget-object p0, p0, Ll/hd70;->l:Ll/bc70;

    .line 69
    .line 70
    invoke-virtual {p0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public d(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hd70;->c:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setRefreshing(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/ad70;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/hd70;->b(Ll/ad70;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 4

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/hd70;->a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p2, p0, Ll/hd70;->a:Lv/navigationbar/VNavigationBar;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/hd70;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p2, v0}, Lv/navigationbar/VNavigationBar;->setLeftIconAsBack(Landroid/app/Activity;)V

    .line 12
    .line 13
    .line 14
    iget-object p2, p0, Ll/hd70;->i:Lcom/p1/mobile/putong/app/PutongAct;

    .line 15
    .line 16
    invoke-virtual {p2}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    sget v0, Ll/k9c0;->p0:I

    .line 21
    .line 22
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Ll/hd70;->act()Lcom/p1/mobile/android/app/Act;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    sget v0, Ll/tec0;->u4:I

    .line 38
    .line 39
    const/4 v1, 0x0

    .line 40
    const/4 v2, 0x0

    .line 41
    invoke-virtual {p2, v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    iput-object p2, p0, Ll/hd70;->k:Landroid/view/View;

    .line 46
    .line 47
    iget-object v0, p0, Ll/hd70;->i:Lcom/p1/mobile/putong/app/PutongAct;

    .line 48
    .line 49
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    sget v3, Ll/k9c0;->T:I

    .line 54
    .line 55
    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    invoke-virtual {p2, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0}, Ll/hd70;->act()Lcom/p1/mobile/android/app/Act;

    .line 63
    .line 64
    .line 65
    move-result-object p2

    .line 66
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 67
    .line 68
    .line 69
    move-result-object p2

    .line 70
    sget v0, Ll/tec0;->z0:I

    .line 71
    .line 72
    invoke-virtual {p2, v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 73
    .line 74
    .line 75
    move-result-object p2

    .line 76
    iput-object p2, p0, Ll/hd70;->j:Landroid/view/View;

    .line 77
    .line 78
    iget-object p0, p0, Ll/hd70;->i:Lcom/p1/mobile/putong/app/PutongAct;

    .line 79
    .line 80
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    sget v0, Ll/k9c0;->T:I

    .line 85
    .line 86
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 87
    .line 88
    .line 89
    move-result p0

    .line 90
    invoke-virtual {p2, p0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 91
    .line 92
    .line 93
    return-object p1
.end method

.method public p()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hd70;->h:Ll/ad70;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ad70;->W0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public r()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/hd70;->a:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/hd70;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconAsBack(Landroid/app/Activity;)V

    .line 8
    .line 9
    .line 10
    new-instance v0, Ll/bc70;

    .line 11
    .line 12
    iget-object v1, p0, Ll/hd70;->i:Lcom/p1/mobile/putong/app/PutongAct;

    .line 13
    .line 14
    iget-object v2, p0, Ll/hd70;->h:Ll/ad70;

    .line 15
    .line 16
    iget-object v3, v2, Ll/ad70;->c:Ljava/lang/String;

    .line 17
    .line 18
    invoke-direct {v0, v1, v3, v2}, Ll/bc70;-><init>(Lcom/p1/mobile/putong/app/PutongAct;Ljava/lang/String;Ll/ad70;)V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Ll/hd70;->l:Ll/bc70;

    .line 22
    .line 23
    iget-object v1, p0, Ll/hd70;->d:Lv/VList;

    .line 24
    .line 25
    invoke-virtual {v1, v0}, Lv/VList;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/hd70;->c:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    .line 29
    .line 30
    const/4 v1, 0x1

    .line 31
    invoke-virtual {v0, v1}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setRefreshing(Z)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Ll/hd70;->c:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    .line 35
    .line 36
    invoke-virtual {v0, p0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setOnRefreshListener(Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$j;)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Ll/hd70;->c:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    .line 40
    .line 41
    sget v2, Ll/k9c0;->k0:I

    .line 42
    .line 43
    sget v3, Ll/k9c0;->h0:I

    .line 44
    .line 45
    sget v4, Ll/k9c0;->i0:I

    .line 46
    .line 47
    sget v5, Ll/k9c0;->j0:I

    .line 48
    .line 49
    filled-new-array {v2, v3, v4, v5}, [I

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    invoke-virtual {v0, v2}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setColorSchemeResources([I)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Ll/hd70;->h:Ll/ad70;

    .line 57
    .line 58
    iget-object v0, v0, Ll/ad70;->c:Ljava/lang/String;

    .line 59
    .line 60
    const-string v2, "fans"

    .line 61
    .line 62
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    const/4 v2, 0x3

    .line 67
    const-string v3, "activities_fans"

    .line 68
    .line 69
    const/16 v4, 0x8

    .line 70
    .line 71
    const/4 v5, 0x0

    .line 72
    if-nez v0, :cond_2

    .line 73
    .line 74
    iget-object v0, p0, Ll/hd70;->h:Ll/ad70;

    .line 75
    .line 76
    iget-object v0, v0, Ll/ad70;->c:Ljava/lang/String;

    .line 77
    .line 78
    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    if-eqz v0, :cond_0

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_0
    iput v5, p0, Ll/hd70;->m:I

    .line 86
    .line 87
    iget-object v0, p0, Ll/hd70;->a:Lv/navigationbar/VNavigationBar;

    .line 88
    .line 89
    sget v3, Lcom/p1/mobile/putong/feed/R$string;->h5:I

    .line 90
    .line 91
    invoke-virtual {v0, v3}, Lv/navigationbar/VNavigationBar;->setTitle(I)V

    .line 92
    .line 93
    .line 94
    iget-object v0, p0, Ll/hd70;->b:Lv/VText;

    .line 95
    .line 96
    sget v3, Lcom/p1/mobile/putong/feed/R$string;->J2:I

    .line 97
    .line 98
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(I)V

    .line 99
    .line 100
    .line 101
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 102
    .line 103
    iget-object v0, v0, Ll/jka;->d0:Ll/vxd0;

    .line 104
    .line 105
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object v3

    .line 109
    check-cast v3, Ljava/lang/Integer;

    .line 110
    .line 111
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 112
    .line 113
    .line 114
    move-result v3

    .line 115
    add-int/2addr v3, v1

    .line 116
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    invoke-virtual {v0, v1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 121
    .line 122
    .line 123
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 124
    .line 125
    iget-object v0, v0, Ll/jka;->d0:Ll/vxd0;

    .line 126
    .line 127
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    check-cast v0, Ljava/lang/Integer;

    .line 132
    .line 133
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 134
    .line 135
    .line 136
    move-result v0

    .line 137
    iget-object v1, p0, Ll/hd70;->b:Lv/VText;

    .line 138
    .line 139
    if-gt v0, v2, :cond_1

    .line 140
    .line 141
    invoke-virtual {v1, v5}, Landroid/view/View;->setVisibility(I)V

    .line 142
    .line 143
    .line 144
    goto :goto_3

    .line 145
    :cond_1
    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    .line 146
    .line 147
    .line 148
    goto :goto_3

    .line 149
    :cond_2
    :goto_0
    iget-object v0, p0, Ll/hd70;->h:Ll/ad70;

    .line 150
    .line 151
    iget-object v0, v0, Ll/ad70;->c:Ljava/lang/String;

    .line 152
    .line 153
    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 154
    .line 155
    .line 156
    move-result v0

    .line 157
    if-eqz v0, :cond_3

    .line 158
    .line 159
    iget-object v0, p0, Ll/hd70;->a:Lv/navigationbar/VNavigationBar;

    .line 160
    .line 161
    const-string v3, "\u5173\u6ce8\u6211\u7684\u4eba"

    .line 162
    .line 163
    invoke-virtual {v0, v3}, Lv/navigationbar/VNavigationBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 164
    .line 165
    .line 166
    iput v5, p0, Ll/hd70;->m:I

    .line 167
    .line 168
    goto :goto_1

    .line 169
    :cond_3
    iput v1, p0, Ll/hd70;->m:I

    .line 170
    .line 171
    iget-object v0, p0, Ll/hd70;->a:Lv/navigationbar/VNavigationBar;

    .line 172
    .line 173
    sget v3, Lcom/p1/mobile/putong/feed/R$string;->g5:I

    .line 174
    .line 175
    invoke-virtual {v0, v3}, Lv/navigationbar/VNavigationBar;->setTitle(I)V

    .line 176
    .line 177
    .line 178
    :goto_1
    iget-object v0, p0, Ll/hd70;->b:Lv/VText;

    .line 179
    .line 180
    sget v3, Lcom/p1/mobile/putong/feed/R$string;->M2:I

    .line 181
    .line 182
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(I)V

    .line 183
    .line 184
    .line 185
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 186
    .line 187
    iget-object v0, v0, Ll/jka;->c0:Ll/vxd0;

    .line 188
    .line 189
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 190
    .line 191
    .line 192
    move-result-object v3

    .line 193
    check-cast v3, Ljava/lang/Integer;

    .line 194
    .line 195
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 196
    .line 197
    .line 198
    move-result v3

    .line 199
    add-int/2addr v3, v1

    .line 200
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 201
    .line 202
    .line 203
    move-result-object v1

    .line 204
    invoke-virtual {v0, v1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 205
    .line 206
    .line 207
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 208
    .line 209
    iget-object v0, v0, Ll/jka;->c0:Ll/vxd0;

    .line 210
    .line 211
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 212
    .line 213
    .line 214
    move-result-object v0

    .line 215
    check-cast v0, Ljava/lang/Integer;

    .line 216
    .line 217
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 218
    .line 219
    .line 220
    move-result v0

    .line 221
    iget-object v1, p0, Ll/hd70;->b:Lv/VText;

    .line 222
    .line 223
    if-gt v0, v2, :cond_4

    .line 224
    .line 225
    invoke-virtual {v1, v5}, Landroid/view/View;->setVisibility(I)V

    .line 226
    .line 227
    .line 228
    goto :goto_2

    .line 229
    :cond_4
    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    .line 230
    .line 231
    .line 232
    :goto_2
    iget-object v0, p0, Ll/hd70;->h:Ll/ad70;

    .line 233
    .line 234
    invoke-virtual {v0}, Ll/ad70;->a1()V

    .line 235
    .line 236
    .line 237
    :goto_3
    invoke-static {}, Ll/cmg;->K()Z

    .line 238
    .line 239
    .line 240
    move-result v0

    .line 241
    if-eqz v0, :cond_5

    .line 242
    .line 243
    iget-object p0, p0, Ll/hd70;->b:Lv/VText;

    .line 244
    .line 245
    invoke-virtual {p0, v4}, Landroid/view/View;->setVisibility(I)V

    .line 246
    .line 247
    .line 248
    :cond_5
    return-void
.end method
