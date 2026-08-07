.class public Ll/qnm0;
.super Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder<",
        "Ll/dom0;",
        ">;"
    }
.end annotation


# instance fields
.field public k:Lv/VLinear;

.field public l:Lcom/google/android/material/tabs/TabLayout;

.field public m:Landroid/widget/ImageView;

.field public n:Lv/VPagerNoPage;

.field public o:Ll/eom0;

.field public p:Ljava/lang/String;

.field public q:Ll/vxd0;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/dom0;)V
    .locals 2

    .line 1
    sget v0, Ll/yec0;->v7:I

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
    new-instance p1, Ll/vxd0;

    .line 12
    .line 13
    new-instance p2, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    const-string v0, "voice_rest_tips_count"

    .line 16
    .line 17
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 21
    .line 22
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    const/4 v0, 0x0

    .line 34
    invoke-direct {p1, p2, v0}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 35
    .line 36
    .line 37
    iput-object p1, p0, Ll/qnm0;->q:Ll/vxd0;

    .line 38
    .line 39
    return-void
.end method

.method public static synthetic F(Ll/qnm0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/qnm0;->Q(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic G(Ll/qnm0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qnm0;->P(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic H(Ll/qnm0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qnm0;->O(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic I(Ll/qnm0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qnm0;->N(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic K(Ll/qnm0;)Ll/y8s;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    return-object p0
.end method

.method private synthetic N(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/qnm0;->M()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic O(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast p0, Ll/dom0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/dom0;->q4()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic P(Landroid/view/View;)V
    .locals 2

    .line 1
    new-instance p1, Ll/th0$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/qnm0;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-direct {p1, v0}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    const-string v0, ""

    .line 11
    .line 12
    invoke-virtual {p1, v0}, Ll/th0$a;->s(Ljava/lang/String;)Ll/th0$a;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p0}, Ll/qnm0;->act()Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->ej:I

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {p1, v0}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {p0}, Ll/qnm0;->act()Lcom/p1/mobile/android/app/Act;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->o2:I

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {p1, v0}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    const/4 v0, 0x0

    .line 45
    invoke-virtual {p1, v0}, Ll/th0$a;->h(Z)Ll/th0$a;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    new-instance v0, Ll/pnm0;

    .line 50
    .line 51
    invoke-direct {v0, p0}, Ll/pnm0;-><init>(Ll/qnm0;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p1, v0}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-virtual {p0}, Ll/qnm0;->act()Lcom/p1/mobile/android/app/Act;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->N1:I

    .line 63
    .line 64
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-virtual {p1, p0}, Ll/th0$a;->f(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method private V(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/fom0;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/qnm0;->o:Ll/eom0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/eom0;->q(Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/qnm0;->o:Ll/eom0;

    .line 7
    .line 8
    invoke-virtual {p1}, Ll/eom0;->getCount()I

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
    iget-object p0, p0, Ll/qnm0;->l:Lcom/google/android/material/tabs/TabLayout;

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
    iget-object p0, p0, Ll/qnm0;->k:Lv/VLinear;

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

.method public final J(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/rnm0;->a(Ll/qnm0;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public L(Ll/dom0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final M()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast v0, Ll/dom0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dom0;->j4()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object v0, p0, Ll/qnm0;->q:Ll/vxd0;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Ljava/lang/Integer;

    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    const/4 v1, 0x2

    .line 25
    if-le v0, v1, :cond_1

    .line 26
    .line 27
    :goto_0
    return-void

    .line 28
    :cond_1
    invoke-static {}, Ll/fwk;->h()Ll/fwk;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iget-object v1, p0, Ll/qnm0;->p:Ljava/lang/String;

    .line 33
    .line 34
    if-eqz v1, :cond_2

    .line 35
    .line 36
    const/4 v2, 0x0

    .line 37
    invoke-virtual {v0, v1, v2}, Ll/fwk;->q(Ljava/lang/String;Z)V

    .line 38
    .line 39
    .line 40
    :cond_2
    new-instance v1, Ll/zvk;

    .line 41
    .line 42
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->e:Lcom/p1/mobile/android/app/Act;

    .line 43
    .line 44
    invoke-direct {v1, v2}, Ll/zvk;-><init>(Landroid/content/Context;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0}, Ll/qnm0;->act()Lcom/p1/mobile/android/app/Act;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    sget v3, Lcom/p1/mobile/putong/live/livingroom/R$string;->dj:I

    .line 52
    .line 53
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    invoke-virtual {v1, v2}, Ll/zvk;->u(Ljava/lang/String;)Ll/zvk;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-virtual {p0}, Ll/qnm0;->act()Lcom/p1/mobile/android/app/Act;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    invoke-virtual {v2}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    sget v3, Ll/n9c0;->p0:I

    .line 70
    .line 71
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 72
    .line 73
    .line 74
    move-result v2

    .line 75
    filled-new-array {v2}, [I

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    invoke-virtual {v1, v2}, Ll/zvk;->e([I)Ll/zvk;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    const/4 v2, 0x1

    .line 84
    invoke-virtual {v1, v2}, Ll/zvk;->k(Z)Ll/zvk;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    const/16 v3, 0xd

    .line 89
    .line 90
    invoke-virtual {v1, v3}, Ll/zvk;->t(I)Ll/zvk;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    sget v3, Ll/qa00;->i:I

    .line 95
    .line 96
    invoke-virtual {v1, v3}, Ll/zvk;->p(I)Ll/zvk;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    invoke-virtual {v1, v3, v3, v3, v3}, Ll/zvk;->s(IIII)Ll/zvk;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    invoke-virtual {v1, v2}, Ll/zvk;->v(Z)Ll/zvk;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    invoke-virtual {p0}, Ll/qnm0;->act()Lcom/p1/mobile/android/app/Act;

    .line 109
    .line 110
    .line 111
    move-result-object v3

    .line 112
    invoke-virtual {v3}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 113
    .line 114
    .line 115
    move-result-object v3

    .line 116
    sget v4, Ll/n9c0;->e1:I

    .line 117
    .line 118
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    .line 119
    .line 120
    .line 121
    move-result v3

    .line 122
    invoke-virtual {v1, v3}, Ll/zvk;->q(I)Ll/zvk;

    .line 123
    .line 124
    .line 125
    move-result-object v1

    .line 126
    const-wide/16 v3, 0x1388

    .line 127
    .line 128
    invoke-virtual {v1, v3, v4}, Ll/zvk;->a(J)Ll/zvk;

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    invoke-static {}, Ll/bnl0;->y0()I

    .line 133
    .line 134
    .line 135
    move-result v3

    .line 136
    div-int/lit8 v3, v3, 0x3

    .line 137
    .line 138
    invoke-virtual {v1, v3}, Ll/zvk;->m(I)Ll/zvk;

    .line 139
    .line 140
    .line 141
    move-result-object v1

    .line 142
    sget v3, Ll/zvk;->D:I

    .line 143
    .line 144
    invoke-virtual {v1, v3}, Ll/zvk;->i(I)Ll/zvk;

    .line 145
    .line 146
    .line 147
    move-result-object v1

    .line 148
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 149
    .line 150
    .line 151
    new-instance v3, Ll/u34;

    .line 152
    .line 153
    invoke-direct {v3, v0}, Ll/u34;-><init>(Ll/fwk;)V

    .line 154
    .line 155
    .line 156
    invoke-virtual {v1, v3}, Ll/zvk;->b(Ll/zvk$a;)Ll/zvk;

    .line 157
    .line 158
    .line 159
    move-result-object v1

    .line 160
    new-instance v3, Ll/onm0;

    .line 161
    .line 162
    invoke-direct {v3, p0}, Ll/onm0;-><init>(Ll/qnm0;)V

    .line 163
    .line 164
    .line 165
    invoke-virtual {v1, v3}, Ll/zvk;->d(Ll/zvk$b;)Ll/zvk;

    .line 166
    .line 167
    .line 168
    move-result-object v1

    .line 169
    iget-object v3, p0, Ll/qnm0;->m:Landroid/widget/ImageView;

    .line 170
    .line 171
    invoke-virtual {v0, v1, v3}, Ll/fwk;->t(Ll/zvk;Landroid/view/View;)Ljava/lang/String;

    .line 172
    .line 173
    .line 174
    move-result-object v0

    .line 175
    iput-object v0, p0, Ll/qnm0;->p:Ljava/lang/String;

    .line 176
    .line 177
    iget-object p0, p0, Ll/qnm0;->q:Ll/vxd0;

    .line 178
    .line 179
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 180
    .line 181
    .line 182
    move-result-object v0

    .line 183
    check-cast v0, Ljava/lang/Integer;

    .line 184
    .line 185
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 186
    .line 187
    .line 188
    move-result v0

    .line 189
    add-int/2addr v0, v2

    .line 190
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 191
    .line 192
    .line 193
    move-result-object v0

    .line 194
    invoke-virtual {p0, v0}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 195
    .line 196
    .line 197
    return-void
.end method

.method public final synthetic Q(Ljava/lang/String;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-object p1, p0, Ll/qnm0;->p:Ljava/lang/String;

    .line 3
    .line 4
    return-void
.end method

.method public final R()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/qnm0;->o:Ll/eom0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance v0, Ll/eom0;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-direct {v0, v1}, Ll/eom0;-><init>(Ljava/util/List;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/qnm0;->o:Ll/eom0;

    .line 13
    .line 14
    iget-object v1, p0, Ll/qnm0;->n:Lv/VPagerNoPage;

    .line 15
    .line 16
    invoke-virtual {v1, v0}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/qnm0;->n:Lv/VPagerNoPage;

    .line 20
    .line 21
    new-instance v1, Ll/qnm0$a;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Ll/qnm0$a;-><init>(Ll/qnm0;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public S(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qnm0;->m:Landroid/widget/ImageView;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public T(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/qnm0;->l:Lcom/google/android/material/tabs/TabLayout;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    sget v1, Ll/obc0;->D3:I

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    sget v1, Ll/obc0;->C3:I

    .line 9
    .line 10
    :goto_0
    invoke-virtual {v0, v1}, Lcom/google/android/material/tabs/TabLayout;->setSelectedTabIndicator(I)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Ll/qnm0;->l:Lcom/google/android/material/tabs/TabLayout;

    .line 14
    .line 15
    if-eqz p1, :cond_1

    .line 16
    .line 17
    const p1, -0x33000001    # -1.3421772E8f

    .line 18
    .line 19
    .line 20
    goto :goto_1

    .line 21
    :cond_1
    const/4 p1, -0x1

    .line 22
    :goto_1
    const v0, -0x7f000001

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, v0, p1}, Lcom/google/android/material/tabs/TabLayout;->setTabTextColors(II)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public U(I)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->E()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 5
    .line 6
    check-cast v0, Ll/dom0;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Ll/rwn0;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {v0}, Ll/y6s;->b(Ljava/lang/String;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    invoke-virtual {p0, v0}, Ll/qnm0;->T(Z)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Ll/qnm0;->n:Lv/VPagerNoPage;

    .line 28
    .line 29
    const/4 v0, 0x1

    .line 30
    if-ne p1, v0, :cond_0

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    const/4 v0, 0x0

    .line 34
    :goto_0
    invoke-virtual {p0, v0}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast p0, Ll/dom0;

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
    check-cast p1, Ll/dom0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/qnm0;->L(Ll/dom0;)V

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
    check-cast v0, Ll/dom0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dom0;->i4()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-direct {p0, v0}, Ll/qnm0;->V(Ljava/util/List;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public m(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Ll/qnm0;->J(Landroid/view/View;)V

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
    iget-object p1, p0, Ll/qnm0;->l:Lcom/google/android/material/tabs/TabLayout;

    .line 15
    .line 16
    iget-object v0, p0, Ll/qnm0;->n:Lv/VPagerNoPage;

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Lcom/google/android/material/tabs/TabLayout;->setupWithViewPager(Landroidx/viewpager/widget/ViewPager;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Ll/qnm0;->R()V

    .line 22
    .line 23
    .line 24
    new-instance p1, Ll/mnm0;

    .line 25
    .line 26
    invoke-direct {p1, p0}, Ll/mnm0;-><init>(Ll/qnm0;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->C(Ll/y20;)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Ll/qnm0;->m:Landroid/widget/ImageView;

    .line 33
    .line 34
    new-instance v0, Ll/nnm0;

    .line 35
    .line 36
    invoke-direct {v0, p0}, Ll/nnm0;-><init>(Ll/qnm0;)V

    .line 37
    .line 38
    .line 39
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public bridge synthetic n(Ll/y8s;)V
    .locals 0

    .line 1
    check-cast p1, Ll/dom0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/qnm0;->L(Ll/dom0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public x()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->x()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 5
    .line 6
    check-cast v0, Ll/dom0;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/dom0;->j4()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    invoke-virtual {p0, v0}, Ll/qnm0;->S(Z)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
