.class public Ll/jxn0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Lv/VLinear;

.field public b:Lv/VImage;

.field public c:Lv/VText;

.field public d:Lv/VText;

.field public e:Lv/smart_refresh/SmartRefreshLayout;

.field public f:Landroidx/recyclerview/widget/RecyclerView;

.field public g:Landroid/widget/ImageView;

.field public h:Landroid/widget/TextView;

.field public i:Landroid/view/View;

.field public j:Ll/ayn0;

.field public k:I

.field public l:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;


# direct methods
.method public constructor <init>(Ll/ayn0;I)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/jxn0;->j:Ll/ayn0;

    .line 5
    .line 6
    iput p2, p0, Ll/jxn0;->k:I

    .line 7
    .line 8
    invoke-virtual {p1}, Ll/ayn0;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-virtual {p0, v0, v1}, Ll/jxn0;->i(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iput-object v0, p0, Ll/jxn0;->i:Landroid/view/View;

    .line 22
    .line 23
    iget-object v0, p0, Ll/jxn0;->e:Lv/smart_refresh/SmartRefreshLayout;

    .line 24
    .line 25
    new-instance v1, Ll/bxn0;

    .line 26
    .line 27
    invoke-direct {v1, p0, p1}, Ll/bxn0;-><init>(Ll/jxn0;Ll/ayn0;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v1}, Lv/smart_refresh/SmartRefreshLayout;->O(Ll/jn50;)Ll/mvc0;

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/jxn0;->e:Lv/smart_refresh/SmartRefreshLayout;

    .line 34
    .line 35
    new-instance v1, Ll/cxn0;

    .line 36
    .line 37
    invoke-direct {v1, p0, p1}, Ll/cxn0;-><init>(Ll/jxn0;Ll/ayn0;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0, v1}, Lv/smart_refresh/SmartRefreshLayout;->M(Ll/tm50;)Ll/mvc0;

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Ll/jxn0;->e:Lv/smart_refresh/SmartRefreshLayout;

    .line 44
    .line 45
    new-instance v1, Lv/smart_refresh/header/TTRefreshHeader;

    .line 46
    .line 47
    invoke-virtual {p1}, Ll/ayn0;->act()Lcom/p1/mobile/android/app/Act;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    invoke-direct {v1, v2}, Lv/smart_refresh/header/TTRefreshHeader;-><init>(Landroid/content/Context;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0, v1}, Lv/smart_refresh/SmartRefreshLayout;->S(Ll/kvc0;)Ll/mvc0;

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Ll/jxn0;->e:Lv/smart_refresh/SmartRefreshLayout;

    .line 58
    .line 59
    new-instance v1, Lv/smart_refresh/footer/TTRefreshFooter;

    .line 60
    .line 61
    invoke-virtual {p1}, Ll/ayn0;->act()Lcom/p1/mobile/android/app/Act;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    invoke-direct {v1, v2}, Lv/smart_refresh/footer/TTRefreshFooter;-><init>(Landroid/content/Context;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0, v1}, Lv/smart_refresh/SmartRefreshLayout;->Q(Ll/jvc0;)Ll/mvc0;

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Ll/jxn0;->e:Lv/smart_refresh/SmartRefreshLayout;

    .line 72
    .line 73
    iget v1, p0, Ll/jxn0;->k:I

    .line 74
    .line 75
    const/4 v2, 0x0

    .line 76
    const/4 v3, 0x1

    .line 77
    if-nez v1, :cond_0

    .line 78
    .line 79
    move v1, v3

    .line 80
    goto :goto_0

    .line 81
    :cond_0
    move v1, v2

    .line 82
    :goto_0
    invoke-virtual {v0, v1}, Lv/smart_refresh/SmartRefreshLayout;->I(Z)Ll/mvc0;

    .line 83
    .line 84
    .line 85
    iget-object v0, p0, Ll/jxn0;->e:Lv/smart_refresh/SmartRefreshLayout;

    .line 86
    .line 87
    iget v1, p0, Ll/jxn0;->k:I

    .line 88
    .line 89
    if-nez v1, :cond_1

    .line 90
    .line 91
    move v1, v3

    .line 92
    goto :goto_1

    .line 93
    :cond_1
    move v1, v2

    .line 94
    :goto_1
    invoke-virtual {v0, v1}, Lv/smart_refresh/SmartRefreshLayout;->G(Z)Ll/mvc0;

    .line 95
    .line 96
    .line 97
    iget-object v0, p0, Ll/jxn0;->f:Landroidx/recyclerview/widget/RecyclerView;

    .line 98
    .line 99
    new-instance v1, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 100
    .line 101
    invoke-virtual {p1}, Ll/ayn0;->act()Lcom/p1/mobile/android/app/Act;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    invoke-direct {v1, p1, v3, v2}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 109
    .line 110
    .line 111
    new-instance p1, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 112
    .line 113
    invoke-direct {p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;-><init>()V

    .line 114
    .line 115
    .line 116
    iput-object p1, p0, Ll/jxn0;->l:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 117
    .line 118
    iget-object p1, p0, Ll/jxn0;->a:Lv/VLinear;

    .line 119
    .line 120
    if-nez p2, :cond_2

    .line 121
    .line 122
    move v2, v3

    .line 123
    :cond_2
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 124
    .line 125
    .line 126
    iget-object p1, p0, Ll/jxn0;->f:Landroidx/recyclerview/widget/RecyclerView;

    .line 127
    .line 128
    iget-object p2, p0, Ll/jxn0;->l:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 129
    .line 130
    invoke-virtual {p1, p2}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 131
    .line 132
    .line 133
    iget-object p1, p0, Ll/jxn0;->c:Lv/VText;

    .line 134
    .line 135
    sget-object p2, Ll/htd0;->f:Ll/htd0;

    .line 136
    .line 137
    invoke-static {p2}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    check-cast v0, Ll/civ;

    .line 142
    .line 143
    invoke-virtual {v0}, Ll/civ;->n()Z

    .line 144
    .line 145
    .line 146
    move-result v0

    .line 147
    if-eqz v0, :cond_3

    .line 148
    .line 149
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->uj:I

    .line 150
    .line 151
    goto :goto_2

    .line 152
    :cond_3
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->tj:I

    .line 153
    .line 154
    :goto_2
    invoke-static {v0}, Ll/n3d0;->d(I)Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 159
    .line 160
    .line 161
    iget-object p0, p0, Ll/jxn0;->b:Lv/VImage;

    .line 162
    .line 163
    invoke-static {p2}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 164
    .line 165
    .line 166
    move-result-object p1

    .line 167
    check-cast p1, Ll/civ;

    .line 168
    .line 169
    invoke-virtual {p1}, Ll/civ;->n()Z

    .line 170
    .line 171
    .line 172
    move-result p1

    .line 173
    if-eqz p1, :cond_4

    .line 174
    .line 175
    sget p1, Ll/obc0;->p9:I

    .line 176
    .line 177
    goto :goto_3

    .line 178
    :cond_4
    sget p1, Ll/obc0;->o9:I

    .line 179
    .line 180
    :goto_3
    invoke-static {p1}, Ll/n3d0;->b(I)Landroid/graphics/drawable/Drawable;

    .line 181
    .line 182
    .line 183
    move-result-object p1

    .line 184
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 185
    .line 186
    .line 187
    return-void
.end method

.method public static synthetic a(Ll/nsv;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nsv;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    return-object p0
.end method

.method public static synthetic b(Ll/jxn0;Ll/ayn0;Ll/mvc0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/jxn0;->n(Ll/ayn0;Ll/mvc0;)V

    return-void
.end method

.method public static synthetic c(Ll/nsv;)Ll/nsv;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic d(Ll/jxn0;Ll/ayn0;Ll/mvc0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/jxn0;->o(Ll/ayn0;Ll/mvc0;)V

    return-void
.end method

.method public static synthetic e(Ll/jxn0;Ljava/util/HashMap;Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserRecord;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/jxn0;->p(Ljava/util/HashMap;Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserRecord;)V

    return-void
.end method

.method public static synthetic f(Ll/nsv;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nsv;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    return-object p0
.end method

.method public static synthetic g(Ljava/lang/String;Ljava/lang/String;Ll/nsv;)V
    .locals 3

    .line 1
    const-string v0, "anchorId"

    .line 2
    .line 3
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "liveId"

    .line 8
    .line 9
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const-string v0, "liveFollow_from"

    .line 14
    .line 15
    const-string v1, "#live_audio_end"

    .line 16
    .line 17
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "liveStatus"

    .line 22
    .line 23
    const-string v2, "endLive"

    .line 24
    .line 25
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    iget-object p2, p2, Ll/nsv;->a:Ljava/lang/Object;

    .line 30
    .line 31
    check-cast p2, Lcom/p1/mobile/putong/data/User;

    .line 32
    .line 33
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 34
    .line 35
    const-string v2, "receiver_user_id"

    .line 36
    .line 37
    invoke-static {v2, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    filled-new-array {p0, p1, v0, v1, p2}, [Ll/pf60;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    const-string p1, "e_follow"

    .line 46
    .line 47
    const-string p2, "p_anchor_live_end"

    .line 48
    .line 49
    invoke-static {p1, p2, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public static synthetic h(Ll/nsv;)Ll/nsv;
    .locals 0

    .line 1
    return-object p0
.end method


# virtual methods
.method public i(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/kxn0;->b(Ll/jxn0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public j()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jxn0;->e:Lv/smart_refresh/SmartRefreshLayout;

    .line 2
    .line 3
    invoke-virtual {p0}, Lv/smart_refresh/SmartRefreshLayout;->o()Ll/mvc0;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public k()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jxn0;->e:Lv/smart_refresh/SmartRefreshLayout;

    .line 2
    .line 3
    invoke-virtual {p0}, Lv/smart_refresh/SmartRefreshLayout;->t()Ll/mvc0;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public l()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jxn0;->i:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public m()I
    .locals 0

    .line 1
    iget p0, p0, Ll/jxn0;->k:I

    .line 2
    .line 3
    return p0
.end method

.method public final synthetic n(Ll/ayn0;Ll/mvc0;)V
    .locals 0

    .line 1
    const/4 p2, 0x0

    .line 2
    invoke-virtual {p1, p2, p0}, Ll/ayn0;->t0(ZLl/jxn0;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic o(Ll/ayn0;Ll/mvc0;)V
    .locals 0

    .line 1
    const/4 p2, 0x1

    .line 2
    invoke-virtual {p1, p2, p0}, Ll/ayn0;->t0(ZLl/jxn0;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic p(Ljava/util/HashMap;Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserRecord;)V
    .locals 1

    .line 1
    iget-object v0, p3, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserRecord;->userId:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Ll/nsv;

    .line 8
    .line 9
    new-instance v0, Ll/wwn0;

    .line 10
    .line 11
    iget-object p0, p0, Ll/jxn0;->j:Ll/ayn0;

    .line 12
    .line 13
    invoke-direct {v0, p0, p3, p1}, Ll/wwn0;-><init>(Ll/ayn0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserRecord;Ll/nsv;)V

    .line 14
    .line 15
    .line 16
    invoke-interface {p2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final q()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/jxn0;->l:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->J()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Ll/jxn0;->g:Landroid/widget/ImageView;

    .line 8
    .line 9
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Ll/jxn0;->h:Landroid/widget/TextView;

    .line 17
    .line 18
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    iget v1, p0, Ll/jxn0;->k:I

    .line 26
    .line 27
    const/4 v2, 0x1

    .line 28
    if-nez v1, :cond_0

    .line 29
    .line 30
    iget-object v1, p0, Ll/jxn0;->h:Landroid/widget/TextView;

    .line 31
    .line 32
    sget v3, Lcom/p1/mobile/putong/live/livingroom/R$string;->zg:I

    .line 33
    .line 34
    invoke-static {v3}, Ll/xau;->t(I)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 39
    .line 40
    .line 41
    iget-object p0, p0, Ll/jxn0;->a:Lv/VLinear;

    .line 42
    .line 43
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    xor-int/2addr v0, v2

    .line 48
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_0
    if-ne v2, v1, :cond_1

    .line 53
    .line 54
    iget-object p0, p0, Ll/jxn0;->h:Landroid/widget/TextView;

    .line 55
    .line 56
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->qj:I

    .line 57
    .line 58
    invoke-static {v0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 63
    .line 64
    .line 65
    :cond_1
    return-void
.end method

.method public r(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Lcom/p1/mobile/putong/live/base/bean/LivingUsers;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEndSparkRanking;",
            ">;",
            "Lcom/p1/mobile/putong/live/base/bean/LivingUsers<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_2

    .line 6
    .line 7
    new-instance v0, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    new-instance v2, Ll/dxn0;

    .line 17
    .line 18
    invoke-direct {v2}, Ll/dxn0;-><init>()V

    .line 19
    .line 20
    .line 21
    new-instance v3, Ll/exn0;

    .line 22
    .line 23
    invoke-direct {v3}, Ll/exn0;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-static {p4, v2, v3}, Ll/jyb;->d(Ljava/util/Collection;Ll/qcj;Ll/qcj;)Ljava/util/HashMap;

    .line 27
    .line 28
    .line 29
    move-result-object p4

    .line 30
    const/4 v2, 0x0

    .line 31
    :goto_0
    if-ge v2, v1, :cond_0

    .line 32
    .line 33
    invoke-interface {p3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    move-object v6, v3

    .line 38
    check-cast v6, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEndSparkRanking;

    .line 39
    .line 40
    iget-object v3, v6, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEndSparkRanking;->id:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {p4, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    move-object v7, v3

    .line 47
    check-cast v7, Ll/nsv;

    .line 48
    .line 49
    new-instance v4, Ll/jdn0;

    .line 50
    .line 51
    iget-object v5, p0, Ll/jxn0;->j:Ll/ayn0;

    .line 52
    .line 53
    move-object v9, p1

    .line 54
    move-object v8, p2

    .line 55
    invoke-direct/range {v4 .. v9}, Ll/jdn0;-><init>(Ll/ayn0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEndSparkRanking;Ll/nsv;Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    new-instance p1, Ll/fxn0;

    .line 62
    .line 63
    invoke-direct {p1, v8, v9, v7}, Ll/fxn0;-><init>(Ljava/lang/String;Ljava/lang/String;Ll/nsv;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v4, p1}, Ll/d3q;->z(Ljava/lang/Runnable;)V

    .line 67
    .line 68
    .line 69
    add-int/lit8 v2, v2, 0x1

    .line 70
    .line 71
    move-object p1, v9

    .line 72
    goto :goto_0

    .line 73
    :cond_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 74
    .line 75
    .line 76
    move-result p1

    .line 77
    const/16 p2, 0x1e

    .line 78
    .line 79
    if-lt p1, p2, :cond_1

    .line 80
    .line 81
    new-instance p1, Ll/sdn0;

    .line 82
    .line 83
    invoke-direct {p1}, Ll/sdn0;-><init>()V

    .line 84
    .line 85
    .line 86
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    :cond_1
    iget-object p1, p0, Ll/jxn0;->l:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 90
    .line 91
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Z(Ljava/util/List;)V

    .line 92
    .line 93
    .line 94
    iget-object p0, p0, Ll/jxn0;->l:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 95
    .line 96
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 97
    .line 98
    .line 99
    return-void

    .line 100
    :cond_2
    invoke-virtual {p0}, Ll/jxn0;->q()V

    .line 101
    .line 102
    .line 103
    return-void
.end method

.method public s(Ljava/util/List;Lcom/p1/mobile/putong/live/base/bean/LivingUsers;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserRecord;",
            ">;",
            "Lcom/p1/mobile/putong/live/base/bean/LivingUsers<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 10
    .line 11
    .line 12
    new-instance v1, Ll/gxn0;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/gxn0;-><init>()V

    .line 15
    .line 16
    .line 17
    new-instance v2, Ll/hxn0;

    .line 18
    .line 19
    invoke-direct {v2}, Ll/hxn0;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-static {p2, v1, v2}, Ll/jyb;->d(Ljava/util/Collection;Ll/qcj;Ll/qcj;)Ljava/util/HashMap;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    new-instance v1, Ll/ixn0;

    .line 27
    .line 28
    invoke-direct {v1, p0, p2, v0}, Ll/ixn0;-><init>(Ll/jxn0;Ljava/util/HashMap;Ljava/util/List;)V

    .line 29
    .line 30
    .line 31
    invoke-static {p1, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Ll/jxn0;->l:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 35
    .line 36
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Z(Ljava/util/List;)V

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Ll/jxn0;->l:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 40
    .line 41
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_0
    invoke-virtual {p0}, Ll/jxn0;->q()V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public t(Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/jxn0;->d:Lv/VText;

    .line 8
    .line 9
    invoke-static {p1}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    .line 10
    .line 11
    .line 12
    move-result-wide v1

    .line 13
    invoke-static {v1, v2}, Ll/yau;->c(D)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ll/jxn0;->d:Lv/VText;

    .line 21
    .line 22
    const/4 p1, 0x1

    .line 23
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    iget-object p0, p0, Ll/jxn0;->a:Lv/VLinear;

    .line 28
    .line 29
    const/4 p1, 0x0

    .line 30
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    return-void
.end method
