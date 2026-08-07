.class public Ll/gx70;
.super Ll/qct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/qct<",
        "Ll/oo2;",
        ">;"
    }
.end annotation


# instance fields
.field public A:Ll/kcg0;

.field public B:Ll/kcg0;

.field public C:Ll/ja80;

.field public D:Z

.field public i:Landroid/view/View;

.field public j:Landroid/widget/LinearLayout;

.field public k:Lv/VImage;

.field public l:Landroid/widget/TextView;

.field public m:Landroid/widget/TextView;

.field public n:Landroid/widget/TextView;

.field public o:Lcom/google/android/material/tabs/TabLayout;

.field public p:Landroidx/viewpager/widget/ViewPager;

.field public q:Landroid/widget/LinearLayout;

.field public r:Landroid/widget/LinearLayout;

.field public s:Landroid/widget/EditText;

.field public t:Landroid/widget/ImageView;

.field public u:Landroid/widget/TextView;

.field public v:Lv/VRecyclerView;

.field public w:Lcom/p1/mobile/putong/live/base/view/LiveEmptyView;

.field public x:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

.field public y:Ll/ra80;

.field public z:Z


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private C4()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    iget-object v1, p0, Ll/gx70;->s:Landroid/widget/EditText;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->hideInput(Landroid/view/View;)Z

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/gx70;->q:Landroid/widget/LinearLayout;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/gx70;->j:Landroid/widget/LinearLayout;

    .line 15
    .line 16
    const/4 v1, 0x1

    .line 17
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ll/gx70;->s:Landroid/widget/EditText;

    .line 21
    .line 22
    const-string v0, ""

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method private D4()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/gx70;->q:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/gx70;->j:Landroid/widget/LinearLayout;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/gx70;->B:Ll/kcg0;

    .line 14
    .line 15
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget-object v1, p0, Ll/gx70;->s:Landroid/widget/EditText;

    .line 23
    .line 24
    invoke-static {v1}, Ll/ynp0;->H(Landroid/widget/EditText;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const-wide/16 v1, 0x1f4

    .line 33
    .line 34
    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 35
    .line 36
    invoke-virtual {v0, v1, v2, v3}, Lrx/c;->throttleLast(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    new-instance v1, Ll/ow70;

    .line 49
    .line 50
    invoke-direct {v1, p0}, Ll/ow70;-><init>(Ll/gx70;)V

    .line 51
    .line 52
    .line 53
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    iput-object v0, p0, Ll/gx70;->B:Ll/kcg0;

    .line 62
    .line 63
    iget-object v0, p0, Ll/gx70;->s:Landroid/widget/EditText;

    .line 64
    .line 65
    new-instance v1, Ll/pw70;

    .line 66
    .line 67
    invoke-direct {v1, p0}, Ll/pw70;-><init>(Ll/gx70;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Ll/gx70;->C:Ll/ja80;

    .line 74
    .line 75
    if-eqz v0, :cond_0

    .line 76
    .line 77
    return-void

    .line 78
    :cond_0
    iget-object v0, p0, Ll/gx70;->v:Lv/VRecyclerView;

    .line 79
    .line 80
    new-instance v1, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 81
    .line 82
    iget-object v2, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 83
    .line 84
    invoke-direct {v1, v2}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 88
    .line 89
    .line 90
    new-instance v0, Ll/ja80;

    .line 91
    .line 92
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 93
    .line 94
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchors;->new_()Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchors;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    new-instance v3, Ll/qw70;

    .line 99
    .line 100
    invoke-direct {v3, p0}, Ll/qw70;-><init>(Ll/gx70;)V

    .line 101
    .line 102
    .line 103
    invoke-direct {v0, v1, v2, v3}, Ll/ja80;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchors;Ll/z20;)V

    .line 104
    .line 105
    .line 106
    iput-object v0, p0, Ll/gx70;->C:Ll/ja80;

    .line 107
    .line 108
    iget-object v1, p0, Ll/gx70;->v:Lv/VRecyclerView;

    .line 109
    .line 110
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 111
    .line 112
    .line 113
    iget-object v0, p0, Ll/gx70;->w:Lcom/p1/mobile/putong/live/base/view/LiveEmptyView;

    .line 114
    .line 115
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->da:I

    .line 116
    .line 117
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/view/LiveEmptyView;->d(I)Lcom/p1/mobile/putong/live/base/view/LiveEmptyView;

    .line 118
    .line 119
    .line 120
    iget-object v0, p0, Ll/gx70;->w:Lcom/p1/mobile/putong/live/base/view/LiveEmptyView;

    .line 121
    .line 122
    sget v1, Ll/n9c0;->j1:I

    .line 123
    .line 124
    invoke-static {v1}, Ll/n3d0;->a(I)I

    .line 125
    .line 126
    .line 127
    move-result v1

    .line 128
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/view/LiveEmptyView;->c(I)Lcom/p1/mobile/putong/live/base/view/LiveEmptyView;

    .line 129
    .line 130
    .line 131
    iget-object v0, p0, Ll/gx70;->w:Lcom/p1/mobile/putong/live/base/view/LiveEmptyView;

    .line 132
    .line 133
    sget v1, Ll/obc0;->k4:I

    .line 134
    .line 135
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/view/LiveEmptyView;->b(I)Lcom/p1/mobile/putong/live/base/view/LiveEmptyView;

    .line 136
    .line 137
    .line 138
    iget-object v0, p0, Ll/gx70;->C:Ll/ja80;

    .line 139
    .line 140
    iget-object v1, p0, Ll/gx70;->v:Lv/VRecyclerView;

    .line 141
    .line 142
    iget-object v2, p0, Ll/gx70;->w:Lcom/p1/mobile/putong/live/base/view/LiveEmptyView;

    .line 143
    .line 144
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Y(Landroidx/recyclerview/widget/RecyclerView;Landroid/view/View;)V

    .line 145
    .line 146
    .line 147
    iget-object v0, p0, Ll/gx70;->C:Ll/ja80;

    .line 148
    .line 149
    invoke-virtual {v0}, Ll/ja80;->g0()V

    .line 150
    .line 151
    .line 152
    iget-object v0, p0, Ll/gx70;->t:Landroid/widget/ImageView;

    .line 153
    .line 154
    new-instance v1, Ll/rw70;

    .line 155
    .line 156
    invoke-direct {v1, p0}, Ll/rw70;-><init>(Ll/gx70;)V

    .line 157
    .line 158
    .line 159
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 160
    .line 161
    .line 162
    iget-object v0, p0, Ll/gx70;->s:Landroid/widget/EditText;

    .line 163
    .line 164
    new-instance v1, Ll/sw70;

    .line 165
    .line 166
    invoke-direct {v1, p0}, Ll/sw70;-><init>(Ll/gx70;)V

    .line 167
    .line 168
    .line 169
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 170
    .line 171
    .line 172
    return-void
.end method

.method private E4()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->J5()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/dx70;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/dx70;-><init>(Ll/gx70;)V

    .line 12
    .line 13
    .line 14
    new-instance p0, Ll/ga80;

    .line 15
    .line 16
    invoke-direct {p0}, Ll/ga80;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public static synthetic J3(Ll/gx70;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/gx70;->r4(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic K3(Ll/gx70;Lcom/p1/mobile/putong/live/base/data/BLivePkInvite;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/gx70;->l4(Lcom/p1/mobile/putong/live/base/data/BLivePkInvite;)V

    return-void
.end method

.method public static synthetic L3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic M3(Ll/gx70;Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchor;Lcom/p1/mobile/putong/live/base/data/BLivePkInviteSource;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/gx70;->q4(Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchor;Lcom/p1/mobile/putong/live/base/data/BLivePkInviteSource;)V

    return-void
.end method

.method public static synthetic N3(Ll/gx70;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/gx70;->w4(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic O3(Ll/gx70;Ll/hct;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/gx70;->B4(Ll/hct;)V

    return-void
.end method

.method public static synthetic P3(Ll/gx70;Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchors;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/gx70;->u4(Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchors;)V

    return-void
.end method

.method public static synthetic R3(Ll/gx70;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/gx70;->z4(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic S3(Ll/gx70;Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/gx70;->o4(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z

    move-result p0

    return p0
.end method

.method public static synthetic T3(Ll/hct;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget p0, p0, Ll/hct;->a:I

    .line 2
    .line 3
    const/4 v0, 0x3

    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic U3(Ll/ja80;Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchors;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchors;->type:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ja80;->j0(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic V3(Ll/gx70;Ll/ja80;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/gx70;->t4(Ll/ja80;Ljava/util/List;)V

    return-void
.end method

.method public static synthetic W3(Ll/gx70;Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchor;Lcom/p1/mobile/putong/live/base/data/BLivePkInviteSource;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/gx70;->n4(Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchor;Lcom/p1/mobile/putong/live/base/data/BLivePkInviteSource;)V

    return-void
.end method

.method public static synthetic X3(Ll/gx70;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/gx70;->A4(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic Y3(Ll/gx70;Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/gx70;->m4(Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;)V

    return-void
.end method

.method public static synthetic Z3(Ll/gx70;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/gx70;->p4()V

    return-void
.end method

.method public static synthetic a4(Ll/gx70;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/gx70;->x4(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b4(Ll/gx70;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/gx70;->s4(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic c4(Ll/gx70;Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/gx70;->v4(Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;)V

    return-void
.end method

.method public static synthetic d4(Ll/gx70;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/gx70;->y4(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e4(Ll/gx70;Ll/ja80;Lcom/p1/mobile/putong/data/Pagination;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/gx70;->F4(Ll/ja80;Lcom/p1/mobile/putong/data/Pagination;)V

    return-void
.end method

.method public static j4(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchors;)Landroid/view/View;
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget v0, Ll/yec0;->V4:I

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
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchors;->type:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    sget v0, Ll/mdc0;->N6:I

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Landroid/widget/TextView;

    .line 24
    .line 25
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchors;->name:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 28
    .line 29
    .line 30
    return-object p0
.end method

.method private k4()V
    .locals 4

    .line 1
    new-instance v0, Ll/ra80;

    .line 2
    .line 3
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 4
    .line 5
    new-instance v2, Ll/ex70;

    .line 6
    .line 7
    invoke-direct {v2, p0}, Ll/ex70;-><init>(Ll/gx70;)V

    .line 8
    .line 9
    .line 10
    new-instance v3, Ll/fx70;

    .line 11
    .line 12
    invoke-direct {v3, p0}, Ll/fx70;-><init>(Ll/gx70;)V

    .line 13
    .line 14
    .line 15
    invoke-direct {v0, v1, v2, v3}, Ll/ra80;-><init>(Ll/dum;Ll/z20;Ll/z20;)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Ll/gx70;->y:Ll/ra80;

    .line 19
    .line 20
    iget-object v0, p0, Ll/gx70;->o:Lcom/google/android/material/tabs/TabLayout;

    .line 21
    .line 22
    iget-object v1, p0, Ll/gx70;->p:Landroidx/viewpager/widget/ViewPager;

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Lcom/google/android/material/tabs/TabLayout;->setupWithViewPager(Landroidx/viewpager/widget/ViewPager;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/gx70;->p:Landroidx/viewpager/widget/ViewPager;

    .line 28
    .line 29
    const/4 v1, 0x1

    .line 30
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setOffscreenPageLimit(I)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/gx70;->p:Landroidx/viewpager/widget/ViewPager;

    .line 34
    .line 35
    iget-object p0, p0, Ll/gx70;->y:Ll/ra80;

    .line 36
    .line 37
    invoke-virtual {v0, p0}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method


# virtual methods
.method public final synthetic A4(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-boolean p1, p0, Ll/gx70;->z:Z

    .line 2
    .line 3
    xor-int/lit8 p1, p1, 0x1

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/gx70;->H4(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic B4(Ll/hct;)V
    .locals 0

    .line 1
    iget-boolean p1, p1, Ll/hct;->b:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/gx70;->I4()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-virtual {p0}, Ll/gx70;->h4()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final F4(Ll/ja80;Lcom/p1/mobile/putong/data/Pagination;)V
    .locals 1

    .line 1
    if-eqz p2, :cond_2

    .line 2
    .line 3
    iget-object v0, p2, Lcom/p1/mobile/putong/data/Pagination;->links:Lcom/p1/mobile/putong/data/Links;

    .line 4
    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iget-boolean v0, p0, Ll/gx70;->D:Z

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    const/4 v0, 0x1

    .line 22
    iput-boolean v0, p0, Ll/gx70;->D:Z

    .line 23
    .line 24
    invoke-static {p2}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->K5(Lcom/p1/mobile/putong/data/Pagination;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    invoke-virtual {p0, p2}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    new-instance v0, Ll/uw70;

    .line 33
    .line 34
    invoke-direct {v0, p0, p1}, Ll/uw70;-><init>(Ll/gx70;Ll/ja80;)V

    .line 35
    .line 36
    .line 37
    invoke-static {v0}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 42
    .line 43
    .line 44
    :cond_2
    :goto_0
    return-void
.end method

.method public G4(Ljava/lang/CharSequence;)V
    .locals 1

    .line 1
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object v0, p0, Ll/gx70;->A:Ll/kcg0;

    .line 10
    .line 11
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 12
    .line 13
    .line 14
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    iget-object p0, p0, Ll/gx70;->C:Ll/ja80;

    .line 21
    .line 22
    if-eqz p0, :cond_0

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/ja80;->g0()V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void

    .line 28
    :cond_1
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->U5(Ljava/lang/String;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    new-instance v0, Ll/tw70;

    .line 37
    .line 38
    invoke-direct {v0, p0}, Ll/tw70;-><init>(Ll/gx70;)V

    .line 39
    .line 40
    .line 41
    invoke-static {v0}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    iput-object p1, p0, Ll/gx70;->A:Ll/kcg0;

    .line 50
    .line 51
    return-void
.end method

.method public H4(Z)V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setPkAcceptSetting unaccept:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Ll/n180;->j(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->I7(Z)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Ll/nw70;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Ll/nw70;-><init>(Ll/gx70;)V

    .line 29
    .line 30
    .line 31
    new-instance v2, Ll/ga80;

    .line 32
    .line 33
    invoke-direct {v2}, Ll/ga80;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Ll/xzs;->e:Ll/dum;

    .line 44
    .line 45
    iget-object v0, v0, Ll/dum;->h:Ll/oo2;

    .line 46
    .line 47
    invoke-virtual {v0}, Ll/oo2;->j0()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    const-string v1, "anchorId"

    .line 52
    .line 53
    invoke-static {v1, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    iget-object p0, p0, Ll/xzs;->e:Ll/dum;

    .line 58
    .line 59
    iget-object p0, p0, Ll/dum;->h:Ll/oo2;

    .line 60
    .line 61
    invoke-virtual {p0}, Ll/vp20;->k()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    const-string v1, "liveId"

    .line 66
    .line 67
    invoke-static {v1, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    if-eqz p1, :cond_0

    .line 72
    .line 73
    const-string p1, "open"

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_0
    const-string p1, "close"

    .line 77
    .line 78
    :goto_0
    const-string v1, "switch_type"

    .line 79
    .line 80
    invoke-static {v1, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    filled-new-array {v0, p0, p1}, [Ll/pf60;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    const-string p1, "e_pk_refuse_invite_button"

    .line 89
    .line 90
    const-string v0, "p_anchor_live_room"

    .line 91
    .line 92
    invoke-static {p1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method public I4()V
    .locals 3

    .line 1
    const-string v0, "e_pk_start_specifiedpk"

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/gx70;->x:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 11
    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    new-instance v0, Ll/c0s;

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    const/4 v2, 0x0

    .line 25
    invoke-virtual {p0, v1, v2}, Ll/gx70;->f4(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-direct {v0, p0, v1}, Ll/c0s;-><init>(Ll/xzs;Landroid/view/View;)V

    .line 30
    .line 31
    .line 32
    iput-object v0, p0, Ll/gx70;->x:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 33
    .line 34
    iget-object v0, p0, Ll/gx70;->k:Lv/VImage;

    .line 35
    .line 36
    new-instance v1, Ll/yw70;

    .line 37
    .line 38
    invoke-direct {v1, p0}, Ll/yw70;-><init>(Ll/gx70;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Ll/gx70;->i:Landroid/view/View;

    .line 45
    .line 46
    new-instance v1, Ll/zw70;

    .line 47
    .line 48
    invoke-direct {v1, p0}, Ll/zw70;-><init>(Ll/gx70;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Ll/gx70;->n:Landroid/widget/TextView;

    .line 55
    .line 56
    new-instance v1, Ll/ax70;

    .line 57
    .line 58
    invoke-direct {v1, p0}, Ll/ax70;-><init>(Ll/gx70;)V

    .line 59
    .line 60
    .line 61
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Ll/gx70;->u:Landroid/widget/TextView;

    .line 65
    .line 66
    new-instance v1, Ll/bx70;

    .line 67
    .line 68
    invoke-direct {v1, p0}, Ll/bx70;-><init>(Ll/gx70;)V

    .line 69
    .line 70
    .line 71
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 72
    .line 73
    .line 74
    iget-object v0, p0, Ll/gx70;->m:Landroid/widget/TextView;

    .line 75
    .line 76
    new-instance v1, Ll/cx70;

    .line 77
    .line 78
    invoke-direct {v1, p0}, Ll/cx70;-><init>(Ll/gx70;)V

    .line 79
    .line 80
    .line 81
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 82
    .line 83
    .line 84
    :cond_0
    invoke-direct {p0}, Ll/gx70;->k4()V

    .line 85
    .line 86
    .line 87
    invoke-direct {p0}, Ll/gx70;->C4()V

    .line 88
    .line 89
    .line 90
    invoke-virtual {p0}, Ll/gx70;->i4()V

    .line 91
    .line 92
    .line 93
    invoke-direct {p0}, Ll/gx70;->E4()V

    .line 94
    .line 95
    .line 96
    iget-object p0, p0, Ll/gx70;->x:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 97
    .line 98
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->show()V

    .line 99
    .line 100
    .line 101
    return-void
.end method

.method public final J4(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/gx70;->x:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    new-instance v0, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v1, "getPkAcceptSetting unaccept:"

    .line 12
    .line 13
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {v0}, Ll/n180;->j(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iput-boolean p1, p0, Ll/gx70;->z:Z

    .line 27
    .line 28
    iget-object v0, p0, Ll/gx70;->m:Landroid/widget/TextView;

    .line 29
    .line 30
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setSelected(Z)V

    .line 31
    .line 32
    .line 33
    if-eqz p1, :cond_0

    .line 34
    .line 35
    sget p1, Ll/obc0;->a:I

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    sget p1, Ll/obc0;->I1:I

    .line 39
    .line 40
    :goto_0
    iget-object p0, p0, Ll/gx70;->m:Landroid/widget/TextView;

    .line 41
    .line 42
    const/4 v0, 0x0

    .line 43
    invoke-virtual {p0, p1, v0, v0, v0}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 44
    .line 45
    .line 46
    :cond_1
    return-void
.end method

.method public f4(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/hx70;->b(Ll/gx70;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public g4(Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchor;Lcom/p1/mobile/putong/live/base/data/BLivePkInviteSource;Z)V
    .locals 10

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/oo2;->j0()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "anchorId"

    .line 10
    .line 11
    invoke-static {v1, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v1}, Ll/vp20;->k()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    const-string v2, "liveId"

    .line 24
    .line 25
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    const-string v2, "other_user_id"

    .line 30
    .line 31
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchor;->userId:Ljava/lang/String;

    .line 32
    .line 33
    invoke-static {v2, v3}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchor;->source:Lcom/p1/mobile/putong/live/base/data/BLivePkInviteSource;

    .line 38
    .line 39
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    const-string v4, "page_tab_type"

    .line 44
    .line 45
    invoke-static {v4, v3}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    filled-new-array {v0, v1, v2, v3}, [Ll/pf60;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    const-string v1, "e_pk_invite_button"

    .line 54
    .line 55
    const-string v2, "p_anchor_live_room"

    .line 56
    .line 57
    invoke-static {v1, v2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 58
    .line 59
    .line 60
    new-instance v9, Ll/ww70;

    .line 61
    .line 62
    invoke-direct {v9, p0}, Ll/ww70;-><init>(Ll/gx70;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->LivePkEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;

    .line 70
    .line 71
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;->createInvite()Ll/v3f$d;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    new-instance v3, Ll/ict;

    .line 76
    .line 77
    iget-object v4, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchor;->userId:Ljava/lang/String;

    .line 78
    .line 79
    iget-object v5, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchor;->userName:Ljava/lang/String;

    .line 80
    .line 81
    iget-object v6, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchor;->avatar:Ljava/lang/String;

    .line 82
    .line 83
    move-object v7, p2

    .line 84
    move v8, p3

    .line 85
    invoke-direct/range {v3 .. v9}, Ll/ict;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLivePkInviteSource;ZLl/y20;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p0, v3}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 89
    .line 90
    .line 91
    return-void
.end method

.method public h4()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Ll/gx70;->s:Landroid/widget/EditText;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->hideInput(Landroid/view/View;)Z

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Ll/gx70;->A:Ll/kcg0;

    .line 13
    .line 14
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/gx70;->B:Ll/kcg0;

    .line 18
    .line 19
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/gx70;->x:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 23
    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    iget-object p0, p0, Ll/gx70;->x:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 35
    .line 36
    .line 37
    :cond_1
    return-void
.end method

.method public i4()V
    .locals 2

    .line 1
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->u4(Ljava/lang/String;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ll/lw70;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Ll/lw70;-><init>(Ll/gx70;)V

    .line 18
    .line 19
    .line 20
    new-instance p0, Ll/mw70;

    .line 21
    .line 22
    invoke-direct {p0}, Ll/mw70;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final synthetic l4(Lcom/p1/mobile/putong/live/base/data/BLivePkInvite;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/gx70;->h4()V

    .line 2
    .line 3
    .line 4
    iget-boolean p1, p0, Ll/gx70;->z:Z

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    invoke-virtual {p0, p1}, Ll/gx70;->H4(Z)V

    .line 10
    .line 11
    .line 12
    sget p0, Ll/fct;->h:I

    .line 13
    .line 14
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final synthetic m4(Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->liveSetting:Lcom/p1/mobile/putong/live/base/data/BLiveAnchorSetting;

    .line 2
    .line 3
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAnchorSetting;->unacceptPk:Z

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/gx70;->J4(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic n4(Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchor;Lcom/p1/mobile/putong/live/base/data/BLivePkInviteSource;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Ll/gx70;->g4(Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchor;Lcom/p1/mobile/putong/live/base/data/BLivePkInviteSource;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic o4(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 1
    const/4 p1, 0x3

    .line 2
    if-ne p2, p1, :cond_0

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iget-object p0, p0, Ll/gx70;->s:Landroid/widget/EditText;

    .line 9
    .line 10
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->hideInput(Landroid/view/View;)Z

    .line 11
    .line 12
    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public final synthetic p4()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/gx70;->s:Landroid/widget/EditText;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    iget-object p0, p0, Ll/gx70;->s:Landroid/widget/EditText;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/android/app/Act;->showInput(Landroid/view/View;I)Z

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic q4(Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchor;Lcom/p1/mobile/putong/live/base/data/BLivePkInviteSource;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Ll/gx70;->g4(Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchor;Lcom/p1/mobile/putong/live/base/data/BLivePkInviteSource;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic r4(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gx70;->s:Landroid/widget/EditText;

    .line 2
    .line 3
    const-string p1, ""

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic s4(Ljava/util/List;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/gx70;->y:Ll/ra80;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/ra80;->u(Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-ge v0, v1, :cond_1

    .line 12
    .line 13
    iget-object v1, p0, Ll/gx70;->o:Lcom/google/android/material/tabs/TabLayout;

    .line 14
    .line 15
    invoke-virtual {v1, v0}, Lcom/google/android/material/tabs/TabLayout;->getTabAt(I)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    check-cast v3, Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchors;

    .line 28
    .line 29
    invoke-static {v2, v3}, Ll/gx70;->j4(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchors;)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    if-eqz v1, :cond_0

    .line 34
    .line 35
    invoke-virtual {v1, v2}, Lcom/google/android/material/tabs/TabLayout$Tab;->setCustomView(Landroid/view/View;)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 36
    .line 37
    .line 38
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->LivePkEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;->showPkDialog()Ll/v3f$d;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lrx/c;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/kw70;

    .line 25
    .line 26
    invoke-direct {v1}, Ll/kw70;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v1, Ll/vw70;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/vw70;-><init>(Ll/gx70;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public final synthetic t4(Ll/ja80;Ljava/util/List;)V
    .locals 1

    .line 1
    new-instance v0, Ll/xw70;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/xw70;-><init>(Ll/ja80;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p2, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    check-cast p2, Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchors;

    .line 11
    .line 12
    if-eqz p2, :cond_0

    .line 13
    .line 14
    invoke-virtual {p1, p2}, Ll/ja80;->f0(Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchors;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    const/4 p1, 0x0

    .line 18
    iput-boolean p1, p0, Ll/gx70;->D:Z

    .line 19
    .line 20
    return-void
.end method

.method public final synthetic u4(Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchors;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gx70;->C:Ll/ja80;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/ja80;->l0(Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchors;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final synthetic v4(Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->liveSetting:Lcom/p1/mobile/putong/live/base/data/BLiveAnchorSetting;

    .line 2
    .line 3
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAnchorSetting;->unacceptPk:Z

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/gx70;->J4(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic w4(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/gx70;->h4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic x4(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/gx70;->h4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic y4(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/gx70;->D4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic z4(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/gx70;->C4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
