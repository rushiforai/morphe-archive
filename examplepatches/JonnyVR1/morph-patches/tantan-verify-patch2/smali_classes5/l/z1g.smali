.class public Ll/z1g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/m1g;",
        ">;"
    }
.end annotation


# instance fields
.field public A:Z

.field public B:Ll/kcg0;

.field public C:Z

.field public D:Z

.field public a:Lv/VFrame;

.field public b:Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;

.field public c:Lv/VLinear;

.field public d:Lv/navigationbar/VNavigationBar;

.field public e:Landroid/widget/FrameLayout;

.field public f:Landroid/widget/LinearLayout;

.field public g:Lv/VImage;

.field public h:Lv/VText;

.field public i:Lv/VProgressBar;

.field public j:Lv/VRecyclerView;

.field public k:Lv/VButton_FakeShadow;

.field public l:Lv/VButton_FakeShadow;

.field public m:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public n:Landroidx/constraintlayout/widget/Guideline;

.field public o:Landroidx/constraintlayout/widget/Guideline;

.field public p:Landroidx/constraintlayout/widget/Guideline;

.field public q:Landroid/widget/ImageView;

.field public r:Landroid/widget/ImageView;

.field public s:Ll/m1g;

.field public t:Lcom/p1/mobile/putong/app/PutongAct;

.field public u:Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersFrag;

.field public v:Z

.field public w:Z

.field public x:I

.field public y:Z

.field public z:Landroidx/recyclerview/widget/k;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersFrag;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/z1g;->v:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Ll/z1g;->w:Z

    .line 8
    .line 9
    iput v0, p0, Ll/z1g;->x:I

    .line 10
    .line 11
    iput-boolean v0, p0, Ll/z1g;->A:Z

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    iput-object v1, p0, Ll/z1g;->B:Ll/kcg0;

    .line 15
    .line 16
    iput-boolean v0, p0, Ll/z1g;->C:Z

    .line 17
    .line 18
    iput-boolean v0, p0, Ll/z1g;->D:Z

    .line 19
    .line 20
    iput-object p1, p0, Ll/z1g;->u:Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersFrag;

    .line 21
    .line 22
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    check-cast p1, Lcom/p1/mobile/putong/app/PutongAct;

    .line 27
    .line 28
    iput-object p1, p0, Ll/z1g;->t:Lcom/p1/mobile/putong/app/PutongAct;

    .line 29
    .line 30
    return-void
.end method

.method public static bridge synthetic A(Ll/z1g;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/z1g;->C:Z

    return-void
.end method

.method public static bridge synthetic B(Ll/z1g;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/z1g;->w:Z

    return-void
.end method

.method public static bridge synthetic C(Ll/z1g;I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/z1g;->x:I

    return-void
.end method

.method private K()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/z1g;->t:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongAct;->pageId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->e2()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    xor-int/lit8 v1, v1, 0x1

    .line 20
    .line 21
    const-string v2, "is_privileged"

    .line 22
    .line 23
    invoke-static {v2, v1}, Ll/sfj0$a;->i(Ljava/lang/String;Z)Ll/sfj0$a;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    filled-new-array {v1}, [Ll/sfj0$a;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    const-string v2, "e_boost_button"

    .line 32
    .line 33
    invoke-static {v2, v0, v1}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ll/z1g;->t:Lcom/p1/mobile/putong/app/PutongAct;

    .line 37
    .line 38
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    iget-object v1, p0, Ll/z1g;->d:Lv/navigationbar/VNavigationBar;

    .line 43
    .line 44
    invoke-virtual {v1}, Lv/navigationbar/VNavigationBar;->getRightIconContainer()Lv/VLinear;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {p0, v0, v1}, Ll/z1g;->G(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {p0, v0}, Ll/z1g;->E(Landroid/view/View;)V

    .line 53
    .line 54
    .line 55
    iget-object v1, p0, Ll/z1g;->d:Lv/navigationbar/VNavigationBar;

    .line 56
    .line 57
    filled-new-array {v0}, [Landroid/view/View;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-virtual {v1, v0}, Lv/navigationbar/VNavigationBar;->z([Landroid/view/View;)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Ll/z1g;->b:Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;

    .line 65
    .line 66
    new-instance v1, Ll/u1g;

    .line 67
    .line 68
    invoke-direct {v1, p0}, Ll/u1g;-><init>(Ll/z1g;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;->a(Ll/na3;)V

    .line 72
    .line 73
    .line 74
    iget-object v0, p0, Ll/z1g;->b:Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;

    .line 75
    .line 76
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;->getBoostButton()Landroid/view/View;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    new-instance v1, Ll/v1g;

    .line 81
    .line 82
    invoke-direct {v1, p0}, Ll/v1g;-><init>(Ll/z1g;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method private synthetic S(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z1g;->s:Ll/m1g;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/m1g;->J0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic T(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z1g;->s:Ll/m1g;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/m1g;->J0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic U(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/z1g;->s:Ll/m1g;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/m1g;->P0()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    const-string p1, "e_intl_plm_button"

    .line 10
    .line 11
    const-string v0, "p_intl_plm"

    .line 12
    .line 13
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ll/z1g;->s:Ll/m1g;

    .line 17
    .line 18
    const-string p1, "p_intl_plm,e_intl_plm_button,click"

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Ll/m1g;->L0(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    iget-object p0, p0, Ll/z1g;->s:Ll/m1g;

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/m1g;->J0()V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public static synthetic a(Ll/z1g;Lcom/p1/mobile/putong/data/User;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/z1g;->Q(Lcom/p1/mobile/putong/data/User;I)V

    return-void
.end method

.method public static synthetic b(Ll/z1g;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/z1g;->U(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/z1g;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/z1g;->T(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Ll/z1g;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/z1g;->S(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Ll/z1g;Landroid/view/View;Lcom/p1/mobile/putong/data/User;IZI)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Ll/z1g;->R(Landroid/view/View;Lcom/p1/mobile/putong/data/User;IZI)V

    return-void
.end method

.method public static synthetic f(Ll/z1g;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/z1g;->N(I)V

    return-void
.end method

.method public static synthetic i(Ll/z1g;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/z1g;->V()V

    return-void
.end method

.method public static synthetic j(Ll/z1g;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/z1g;->O(Landroid/view/View;)Z

    move-result p0

    return p0
.end method

.method public static synthetic k(Ll/z1g;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/z1g;->M()V

    return-void
.end method

.method public static synthetic l(Ll/z1g;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/z1g;->P(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic m(Ll/z1g;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/z1g;->W(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic n(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static bridge synthetic p(Ll/z1g;)Lcom/p1/mobile/putong/app/PutongAct;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z1g;->t:Lcom/p1/mobile/putong/app/PutongAct;

    return-object p0
.end method

.method public static bridge synthetic q(Ll/z1g;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/z1g;->v:Z

    return p0
.end method

.method private r()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/z1g;->d:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    iget-object v1, p0, Ll/z1g;->t:Lcom/p1/mobile/putong/app/PutongAct;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconAsBack(Landroid/app/Activity;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/z1g;->d:Lv/navigationbar/VNavigationBar;

    .line 9
    .line 10
    sget v1, Ll/gbc0;->b:I

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconResource(I)V

    .line 13
    .line 14
    .line 15
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->p0:Ll/z99;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/z99;->e3()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    const/4 v1, 0x1

    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    iget-object v0, p0, Ll/z1g;->l:Lv/VButton_FakeShadow;

    .line 27
    .line 28
    sget v2, Ll/gbc0;->Q:I

    .line 29
    .line 30
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/z1g;->l:Lv/VButton_FakeShadow;

    .line 34
    .line 35
    const-string v2, "#000000"

    .line 36
    .line 37
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Ll/z1g;->l:Lv/VButton_FakeShadow;

    .line 45
    .line 46
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Ll/z1g;->l:Lv/VButton_FakeShadow;

    .line 50
    .line 51
    new-instance v1, Ll/n1g;

    .line 52
    .line 53
    invoke-direct {v1, p0}, Ll/n1g;-><init>(Ll/z1g;)V

    .line 54
    .line 55
    .line 56
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 57
    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_0
    iget-object v0, p0, Ll/z1g;->s:Ll/m1g;

    .line 61
    .line 62
    invoke-virtual {v0}, Ll/m1g;->P0()Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-nez v0, :cond_1

    .line 67
    .line 68
    iget-object v0, p0, Ll/z1g;->k:Lv/VButton_FakeShadow;

    .line 69
    .line 70
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Ll/z1g;->k:Lv/VButton_FakeShadow;

    .line 74
    .line 75
    new-instance v1, Ll/q1g;

    .line 76
    .line 77
    invoke-direct {v1, p0}, Ll/q1g;-><init>(Ll/z1g;)V

    .line 78
    .line 79
    .line 80
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 81
    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_1
    iget-object v0, p0, Ll/z1g;->l:Lv/VButton_FakeShadow;

    .line 85
    .line 86
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 87
    .line 88
    .line 89
    iget-object v0, p0, Ll/z1g;->s:Ll/m1g;

    .line 90
    .line 91
    invoke-virtual {v0}, Ll/m1g;->P0()Z

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    if-eqz v0, :cond_2

    .line 96
    .line 97
    iget-object v0, p0, Ll/z1g;->l:Lv/VButton_FakeShadow;

    .line 98
    .line 99
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    sget v2, Lcom/p1/mobile/putong/core/member/R$string;->K:I

    .line 108
    .line 109
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    invoke-static {v0, v1}, Ll/bnl0;->H0(Landroid/widget/TextView;Ljava/lang/String;)Z

    .line 114
    .line 115
    .line 116
    :cond_2
    iget-object v0, p0, Ll/z1g;->l:Lv/VButton_FakeShadow;

    .line 117
    .line 118
    new-instance v1, Ll/r1g;

    .line 119
    .line 120
    invoke-direct {v1, p0}, Ll/r1g;-><init>(Ll/z1g;)V

    .line 121
    .line 122
    .line 123
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 124
    .line 125
    .line 126
    :goto_0
    new-instance v0, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 127
    .line 128
    iget-object v1, p0, Ll/z1g;->t:Lcom/p1/mobile/putong/app/PutongAct;

    .line 129
    .line 130
    const/4 v2, 0x2

    .line 131
    invoke-direct {v0, v1, v2}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    .line 132
    .line 133
    .line 134
    new-instance v1, Ll/z1g$a;

    .line 135
    .line 136
    invoke-direct {v1, p0}, Ll/z1g$a;-><init>(Ll/z1g;)V

    .line 137
    .line 138
    .line 139
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/GridLayoutManager;->v(Landroidx/recyclerview/widget/GridLayoutManager$c;)V

    .line 140
    .line 141
    .line 142
    iget-object v1, p0, Ll/z1g;->j:Lv/VRecyclerView;

    .line 143
    .line 144
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 145
    .line 146
    .line 147
    iget-object v0, p0, Ll/z1g;->j:Lv/VRecyclerView;

    .line 148
    .line 149
    iget-object v1, p0, Ll/z1g;->u:Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersFrag;

    .line 150
    .line 151
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersFrag;->O4()Ll/h0g;

    .line 152
    .line 153
    .line 154
    move-result-object v1

    .line 155
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 156
    .line 157
    .line 158
    iget-object v0, p0, Ll/z1g;->j:Lv/VRecyclerView;

    .line 159
    .line 160
    new-instance v1, Ll/z1g$b;

    .line 161
    .line 162
    invoke-direct {v1, p0}, Ll/z1g$b;-><init>(Ll/z1g;)V

    .line 163
    .line 164
    .line 165
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$t;)V

    .line 166
    .line 167
    .line 168
    iget-object v0, p0, Ll/z1g;->u:Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersFrag;

    .line 169
    .line 170
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersFrag;->O4()Ll/h0g;

    .line 171
    .line 172
    .line 173
    move-result-object v0

    .line 174
    new-instance v1, Ll/s1g;

    .line 175
    .line 176
    invoke-direct {v1, p0}, Ll/s1g;-><init>(Ll/z1g;)V

    .line 177
    .line 178
    .line 179
    invoke-virtual {v0, v1}, Ll/h0g;->U(Ll/h0g$a;)V

    .line 180
    .line 181
    .line 182
    new-instance v0, Landroidx/recyclerview/widget/k;

    .line 183
    .line 184
    new-instance v1, Ll/b0g;

    .line 185
    .line 186
    new-instance v2, Ll/t1g;

    .line 187
    .line 188
    invoke-direct {v2, p0}, Ll/t1g;-><init>(Ll/z1g;)V

    .line 189
    .line 190
    .line 191
    invoke-direct {v1, v2}, Ll/b0g;-><init>(Ll/b0g$a;)V

    .line 192
    .line 193
    .line 194
    invoke-direct {v0, v1}, Landroidx/recyclerview/widget/k;-><init>(Landroidx/recyclerview/widget/k$e;)V

    .line 195
    .line 196
    .line 197
    iput-object v0, p0, Ll/z1g;->z:Landroidx/recyclerview/widget/k;

    .line 198
    .line 199
    iget-object v1, p0, Ll/z1g;->j:Lv/VRecyclerView;

    .line 200
    .line 201
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/k;->g(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 202
    .line 203
    .line 204
    invoke-static {}, Ll/rs9;->h()Z

    .line 205
    .line 206
    .line 207
    move-result v0

    .line 208
    if-eqz v0, :cond_3

    .line 209
    .line 210
    iget-object p0, p0, Ll/z1g;->m:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 211
    .line 212
    sget v0, Ll/qa00;->O:I

    .line 213
    .line 214
    invoke-static {p0, v0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 215
    .line 216
    .line 217
    :cond_3
    return-void
.end method

.method public static bridge synthetic s(Ll/z1g;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/z1g;->D:Z

    return p0
.end method

.method public static bridge synthetic u(Ll/z1g;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/z1g;->C:Z

    return p0
.end method

.method public static bridge synthetic v(Ll/z1g;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/z1g;->w:Z

    return p0
.end method

.method public static bridge synthetic w(Ll/z1g;)Ll/m1g;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z1g;->s:Ll/m1g;

    return-object p0
.end method

.method public static bridge synthetic x(Ll/z1g;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/z1g;->x:I

    return p0
.end method

.method public static bridge synthetic y(Ll/z1g;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/z1g;->v:Z

    return-void
.end method

.method public static bridge synthetic z(Ll/z1g;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/z1g;->D:Z

    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/z1g;->t:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public final E(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/g2g;->a(Ll/z1g;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public F(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/f2g;->b(Ll/z1g;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public G(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/g2g;->b(Ll/z1g;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public H(Ll/m1g;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/z1g;->s:Ll/m1g;

    .line 2
    .line 3
    return-void
.end method

.method public I(Z)V
    .locals 3

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Ll/z1g;->b:Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;

    .line 4
    .line 5
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/z1g;->t:Lcom/p1/mobile/putong/app/PutongAct;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongAct;->pageId()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const/4 v1, 0x0

    .line 18
    new-array v1, v1, [Ll/sfj0$a;

    .line 19
    .line 20
    const-string v2, "e_intl_plm_turbo_button"

    .line 21
    .line 22
    invoke-static {v2, v0, v1}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    iget-object v0, p0, Ll/z1g;->b:Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;

    .line 26
    .line 27
    invoke-static {v0, p1}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Ll/z1g;->b:Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;

    .line 31
    .line 32
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public J()Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksHeaderView;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/z1g;->j:Lv/VRecyclerView;

    .line 2
    .line 3
    sget v0, Ll/ddc0;->z:I

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksHeaderView;

    .line 10
    .line 11
    return-object p0
.end method

.method public final L()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/z1g;->t:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Ll/z1g;->d:Lv/navigationbar/VNavigationBar;

    .line 8
    .line 9
    invoke-virtual {v1}, Lv/navigationbar/VNavigationBar;->getRightIconContainer()Lv/VLinear;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {p0, v0, v1}, Ll/z1g;->G(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p0, v0}, Ll/z1g;->E(Landroid/view/View;)V

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Ll/z1g;->d:Lv/navigationbar/VNavigationBar;

    .line 21
    .line 22
    filled-new-array {v0}, [Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v1, v0}, Lv/navigationbar/VNavigationBar;->z([Landroid/view/View;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/z1g;->b:Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;

    .line 30
    .line 31
    const/4 v1, 0x0

    .line 32
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Ll/z1g;->b:Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;

    .line 36
    .line 37
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;->getBoostButton()Landroid/view/View;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    new-instance v1, Ll/w1g;

    .line 42
    .line 43
    invoke-direct {v1, p0}, Ll/w1g;-><init>(Ll/z1g;)V

    .line 44
    .line 45
    .line 46
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public final synthetic M()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/z1g;->b:Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;->g(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic N(I)V
    .locals 2

    .line 1
    const/4 v0, 0x2

    .line 2
    if-ne p1, v0, :cond_0

    .line 3
    .line 4
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iget-object v0, p0, Ll/z1g;->t:Lcom/p1/mobile/putong/app/PutongAct;

    .line 13
    .line 14
    new-instance v1, Ll/p1g;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/p1g;-><init>(Ll/z1g;)V

    .line 17
    .line 18
    .line 19
    const/4 p0, 0x0

    .line 20
    invoke-interface {p1, v0, v1, p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Hc(Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/pcj;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public final synthetic O(Landroid/view/View;)Z
    .locals 1

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->J0:Ll/m27;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/m27;->F3()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const-string v0, "boost_see_page_guide"

    .line 16
    .line 17
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/ui/bubble/d;->k(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ll/z1g;->b:Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;->f()V

    .line 23
    .line 24
    .line 25
    :cond_0
    const/4 p0, 0x1

    .line 26
    return p0
.end method

.method public final synthetic P(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p1, p0, Ll/z1g;->t:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/app/PutongAct;->pageId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const/4 v0, 0x0

    .line 8
    new-array v1, v0, [Ll/sfj0$a;

    .line 9
    .line 10
    const-string v2, "e_intl_plm_turbo_button"

    .line 11
    .line 12
    invoke-static {v2, p1, v1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 13
    .line 14
    .line 15
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    iget-object p0, p0, Ll/z1g;->t:Lcom/p1/mobile/putong/app/PutongAct;

    .line 24
    .line 25
    const-string v1, "p_intl_plm,e_intl_plm_turbo_button,click"

    .line 26
    .line 27
    const/4 v2, 0x0

    .line 28
    invoke-interface {p1, p0, v0, v1, v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Hb(Lcom/p1/mobile/android/app/Act;ZLjava/lang/String;Ll/x20;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final synthetic Q(Lcom/p1/mobile/putong/data/User;I)V
    .locals 0

    .line 1
    iget-object p2, p0, Ll/z1g;->s:Ll/m1g;

    .line 2
    .line 3
    invoke-virtual {p2}, Ll/m1g;->P0()Z

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    const-string p1, "e_intl_plm_card"

    .line 10
    .line 11
    const-string p2, "p_intl_plm"

    .line 12
    .line 13
    invoke-static {p1, p2}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ll/z1g;->s:Ll/m1g;

    .line 17
    .line 18
    const-string p1, "p_intl_plm,e_intl_plm_card,click"

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Ll/m1g;->L0(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    iget-object p0, p0, Ll/z1g;->s:Ll/m1g;

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Ll/m1g;->H0(Lcom/p1/mobile/putong/data/User;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final synthetic R(Landroid/view/View;Lcom/p1/mobile/putong/data/User;IZI)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/z1g;->u:Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersFrag;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersFrag;->O4()Ll/h0g;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/z1g;->s:Ll/m1g;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/m1g;->P0()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    instance-of p2, p1, Lcom/p1/mobile/putong/core/ui/seepage/likers/IntlFakeTurboItem;

    .line 19
    .line 20
    if-eqz p2, :cond_0

    .line 21
    .line 22
    check-cast p1, Lcom/p1/mobile/putong/core/ui/seepage/likers/IntlFakeTurboItem;

    .line 23
    .line 24
    iget-object p0, p0, Ll/z1g;->t:Lcom/p1/mobile/putong/app/PutongAct;

    .line 25
    .line 26
    invoke-virtual {p1, p5, p0}, Lcom/p1/mobile/putong/core/ui/seepage/likers/IntlFakeTurboItem;->n0(ILcom/p1/mobile/android/app/Act;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    const-string p1, "e_intl_plm_card"

    .line 31
    .line 32
    const-string p2, "p_intl_plm"

    .line 33
    .line 34
    invoke-static {p1, p2}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Ll/z1g;->s:Ll/m1g;

    .line 38
    .line 39
    const-string p1, "p_intl_plm,e_intl_plm_card,swipe"

    .line 40
    .line 41
    invoke-virtual {p0, p1}, Ll/m1g;->L0(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_1
    const/4 p1, 0x2

    .line 46
    if-eq p3, p1, :cond_2

    .line 47
    .line 48
    const/4 p1, 0x4

    .line 49
    if-eq p3, p1, :cond_2

    .line 50
    .line 51
    if-eqz p4, :cond_2

    .line 52
    .line 53
    iget-object p0, p0, Ll/z1g;->s:Ll/m1g;

    .line 54
    .line 55
    invoke-virtual {p0, p2}, Ll/m1g;->H0(Lcom/p1/mobile/putong/data/User;)V

    .line 56
    .line 57
    .line 58
    :cond_2
    return-void
.end method

.method public final synthetic V()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/z1g;->u:Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersFrag;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersFrag;->O4()Ll/h0g;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/4 v0, 0x1

    .line 8
    invoke-virtual {p0, v0}, Ll/h0g;->L(Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic W(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/z1g;->u:Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersFrag;

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
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/data/User;->new_()Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "intlSeeListAd"

    .line 20
    .line 21
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 22
    .line 23
    iput-object v1, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 24
    .line 25
    iget-object p0, p0, Ll/z1g;->u:Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersFrag;

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersFrag;->O4()Ll/h0g;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    const/4 v1, 0x3

    .line 32
    invoke-virtual {p0, v0, v1, p1}, Ll/h0g;->K(Lcom/p1/mobile/putong/data/User;ILandroid/view/View;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public final X(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/z1g;->B:Ll/kcg0;

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
    iget-object v0, p0, Ll/z1g;->u:Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersFrag;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersFrag;->O4()Ll/h0g;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v0, v0, Ll/h0g;->l:Lcom/p1/mobile/putong/data/User;

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
    iget-object p0, p0, Ll/z1g;->u:Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersFrag;

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersFrag;->O4()Ll/h0g;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    iget-object p0, p0, Ll/h0g;->l:Lcom/p1/mobile/putong/data/User;

    .line 30
    .line 31
    const/4 v0, 0x3

    .line 32
    invoke-interface {p1, v0, p0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 37
    .line 38
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    iget-object v0, p0, Ll/z1g;->t:Lcom/p1/mobile/putong/app/PutongAct;

    .line 43
    .line 44
    new-instance v1, Ll/x1g;

    .line 45
    .line 46
    invoke-direct {v1, p0}, Ll/x1g;-><init>(Ll/z1g;)V

    .line 47
    .line 48
    .line 49
    invoke-interface {p1, v0, v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Dc(Lcom/p1/mobile/android/app/Act;Ll/x20;)Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-eqz v0, :cond_1

    .line 58
    .line 59
    new-instance v0, Ll/y1g;

    .line 60
    .line 61
    invoke-direct {v0, p0}, Ll/y1g;-><init>(Ll/z1g;)V

    .line 62
    .line 63
    .line 64
    new-instance v1, Ll/o1g;

    .line 65
    .line 66
    invoke-direct {v1}, Ll/o1g;-><init>()V

    .line 67
    .line 68
    .line 69
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    iput-object p1, p0, Ll/z1g;->B:Ll/kcg0;

    .line 78
    .line 79
    :cond_1
    return-void
.end method

.method public Y(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x4

    .line 12
    if-lt v0, v1, :cond_0

    .line 13
    .line 14
    const/4 v0, 0x1

    .line 15
    invoke-virtual {p0, v0}, Ll/z1g;->I(Z)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, p1}, Ll/z1g;->X(Ljava/util/List;)V

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 v0, 0x0

    .line 23
    invoke-virtual {p0, v0}, Ll/z1g;->I(Z)V

    .line 24
    .line 25
    .line 26
    :goto_0
    iget-object v0, p0, Ll/z1g;->u:Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersFrag;

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersFrag;->O4()Ll/h0g;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0, p1}, Ll/h0g;->V(Ljava/util/List;)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Ll/z1g;->u:Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersFrag;

    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersFrag;->O4()Ll/h0g;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public Z(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z1g;->d:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lv/navigationbar/VNavigationBar;->setTitle(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public a0(Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z1g;->d:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lv/navigationbar/VNavigationBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b0()V
    .locals 4

    .line 1
    iget-boolean v0, p0, Ll/z1g;->y:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p0, Ll/z1g;->A:Z

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    iput-boolean v0, p0, Ll/z1g;->y:Z

    .line 11
    .line 12
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v1, p0, Ll/z1g;->q:Landroid/widget/ImageView;

    .line 17
    .line 18
    iget-object v2, p0, Ll/z1g;->r:Landroid/widget/ImageView;

    .line 19
    .line 20
    iget-object v3, p0, Ll/z1g;->m:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 21
    .line 22
    invoke-static {v0, v1, v2, v3}, Ll/vie0;->d(Lcom/p1/mobile/android/app/Act;Landroid/view/View;Landroid/view/View;Landroid/view/View;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 26
    .line 27
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->X6()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_2

    .line 36
    .line 37
    iget-object v0, p0, Ll/z1g;->b:Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;

    .line 38
    .line 39
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_2

    .line 44
    .line 45
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->s8()Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-nez v0, :cond_1

    .line 58
    .line 59
    iget-object v0, p0, Ll/z1g;->b:Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;

    .line 60
    .line 61
    iget-object v1, p0, Ll/z1g;->a:Lv/VFrame;

    .line 62
    .line 63
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;->d(Landroid/widget/FrameLayout;)V

    .line 64
    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 68
    .line 69
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->ri()Z

    .line 74
    .line 75
    .line 76
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/core/member/module/CoreMemberModule;->F()Ll/ss9;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-virtual {v0}, Ll/ss9;->b()Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    iget-object p0, p0, Ll/z1g;->b:Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;

    .line 89
    .line 90
    invoke-interface {v0, v1, p0}, Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;->Qe(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;)V

    .line 91
    .line 92
    .line 93
    :cond_2
    return-void
.end method

.method public destroy()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/z1g;->u:Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersFrag;

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
    iget-object v0, p0, Ll/z1g;->u:Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersFrag;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersFrag;->O4()Ll/h0g;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-virtual {v0, v1}, Ll/h0g;->L(Z)V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Ll/z1g;->B:Ll/kcg0;

    .line 20
    .line 21
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    iget-object p0, p0, Ll/z1g;->B:Ll/kcg0;

    .line 28
    .line 29
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 30
    .line 31
    .line 32
    :cond_1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/m1g;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/z1g;->H(Ll/m1g;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/z1g;->F(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-direct {p0}, Ll/z1g;->r()V

    .line 6
    .line 7
    .line 8
    iget-object p2, p0, Ll/z1g;->s:Ll/m1g;

    .line 9
    .line 10
    invoke-virtual {p2}, Ll/m1g;->P0()Z

    .line 11
    .line 12
    .line 13
    move-result p2

    .line 14
    if-nez p2, :cond_0

    .line 15
    .line 16
    invoke-direct {p0}, Ll/z1g;->K()V

    .line 17
    .line 18
    .line 19
    return-object p1

    .line 20
    :cond_0
    invoke-virtual {p0}, Ll/z1g;->L()V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Ll/z1g;->j:Lv/VRecyclerView;

    .line 24
    .line 25
    const/high16 p2, 0x42b40000    # 90.0f

    .line 26
    .line 27
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 28
    .line 29
    .line 30
    move-result p2

    .line 31
    invoke-static {p0, p2}, Ll/bnl0;->c0(Landroid/view/View;I)V

    .line 32
    .line 33
    .line 34
    return-object p1
.end method
