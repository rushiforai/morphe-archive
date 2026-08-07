.class public Lcom/p1/mobile/putong/core/ui/visitor/d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;
.implements Ll/jn50;
.implements Ll/mam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Lcom/p1/mobile/putong/core/ui/visitor/c;",
        ">;",
        "Ll/jn50;",
        "Ll/mam;"
    }
.end annotation


# instance fields
.field public a:Lv/navigationbar/VNavigationBar;

.field public b:Lv/VLinear;

.field public c:Lv/VPullDownRefreshLayout;

.field public d:Lv/VPullUpRecyclerView;

.field public e:Landroid/widget/FrameLayout;

.field public f:Landroid/widget/LinearLayout;

.field public g:Landroid/widget/TextView;

.field public h:Landroid/widget/TextView;

.field public i:Lv/VLinear;

.field public j:Lv/VDraweeView;

.field public k:Lv/VText;

.field public l:Lv/VRelative;

.field public m:Lv/VImage;

.field public n:Lv/VText;

.field public o:Lv/VText;

.field public p:Lv/VButton;

.field public q:Landroid/widget/FrameLayout;

.field public r:Landroid/view/View;

.field public s:Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;

.field public t:Lcom/p1/mobile/putong/core/ui/visitor/a;

.field public u:Lcom/p1/mobile/putong/core/ui/visitor/c;

.field public v:Lcom/p1/mobile/putong/core/ui/visitor/MomentVisitorsFrag;

.field public w:Ll/h80;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/visitor/MomentVisitorsFrag;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/p1/mobile/putong/core/ui/visitor/d$a;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/ui/visitor/d$a;-><init>(Lcom/p1/mobile/putong/core/ui/visitor/d;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->w:Ll/h80;

    .line 10
    .line 11
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->v:Lcom/p1/mobile/putong/core/ui/visitor/MomentVisitorsFrag;

    .line 12
    .line 13
    return-void
.end method

.method private synthetic A()V
    .locals 2

    .line 1
    invoke-static {}, Ll/joa;->G3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->d:Lv/VPullUpRecyclerView;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    instance-of v1, v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 14
    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    check-cast v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 18
    .line 19
    invoke-virtual {v0}, Landroidx/recyclerview/widget/LinearLayoutManager;->findFirstCompletelyVisibleItemPosition()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-lez v0, :cond_0

    .line 24
    .line 25
    const-string v0, "p_navigation_visit,button_pull"

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/visitor/d;->M(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method private synthetic B(Landroid/view/View;)V
    .locals 2

    .line 1
    const/4 p1, 0x0

    .line 2
    new-array p1, p1, [Ll/sfj0$a;

    .line 3
    .line 4
    const-string v0, "e_visitor_unlock"

    .line 5
    .line 6
    const-string v1, "p_my_visitor"

    .line 7
    .line 8
    invoke-static {v0, v1, p1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 9
    .line 10
    .line 11
    const-string p1, "p_navigation_visit,button_pull"

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/d;->M(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/ui/visitor/d;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/d;->G(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/ui/visitor/d;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/visitor/d;->A()V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/core/ui/visitor/d;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/d;->H(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/core/ui/visitor/d;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/d;->I(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/core/ui/visitor/d;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/visitor/d;->F()V

    return-void
.end method

.method public static synthetic l(Lcom/p1/mobile/putong/core/ui/visitor/d;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/d;->B(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic m(Lcom/p1/mobile/putong/core/ui/visitor/d;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/d;->C(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic n(Lcom/p1/mobile/putong/core/ui/visitor/d;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/d;->E(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/core/ui/visitor/d;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/d;->z(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic q(Lcom/p1/mobile/putong/core/ui/visitor/d;)Lcom/p1/mobile/putong/core/ui/visitor/a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->t:Lcom/p1/mobile/putong/core/ui/visitor/a;

    return-object p0
.end method


# virtual methods
.method public final synthetic C(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->u:Lcom/p1/mobile/putong/core/ui/visitor/c;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/c;->d1(Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->v:Lcom/p1/mobile/putong/core/ui/visitor/MomentVisitorsFrag;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final synthetic E(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->s:Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;->g()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic F()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->u:Lcom/p1/mobile/putong/core/ui/visitor/c;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/visitor/c;->getData()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic G(Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 3

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->v:Lcom/p1/mobile/putong/core/ui/visitor/MomentVisitorsFrag;

    .line 2
    .line 3
    new-instance v0, Ll/ru00;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Ll/ru00;-><init>(Lcom/p1/mobile/putong/core/ui/visitor/d;)V

    .line 6
    .line 7
    .line 8
    const-wide/16 v1, 0x3e8

    .line 9
    .line 10
    invoke-static {p1, v0, v1, v2}, Ll/l51;->I(Lcom/p1/mobile/android/app/Frag;Ljava/lang/Runnable;J)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic H(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Y9()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    const-string p1, "e_my_visitor_set"

    .line 16
    .line 17
    const-string v0, "p_my_visitor"

    .line 18
    .line 19
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const-string p1, "e_moment_visitor_set"

    .line 24
    .line 25
    const-string v0, "p_moment_visitor"

    .line 26
    .line 27
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/visitor/d;->K()V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final synthetic I(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Y9()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    const-string p1, "e_my_visitor_set"

    .line 16
    .line 17
    const-string v0, "p_my_visitor"

    .line 18
    .line 19
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const-string p1, "e_moment_visitor_set"

    .line 24
    .line 25
    const-string v0, "p_moment_visitor"

    .line 26
    .line 27
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/visitor/d;->K()V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public J()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->u:Lcom/p1/mobile/putong/core/ui/visitor/c;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/visitor/c;->c1()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public K()V
    .locals 4

    .line 1
    new-instance v0, Ll/kfm0;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->v:Lcom/p1/mobile/putong/core/ui/visitor/MomentVisitorsFrag;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    sget v2, Ll/bgc0;->e:I

    .line 10
    .line 11
    const/4 v3, 0x1

    .line 12
    invoke-direct {v0, v1, v2, v3}, Ll/kfm0;-><init>(Lcom/p1/mobile/android/app/Act;IZ)V

    .line 13
    .line 14
    .line 15
    new-instance v1, Ll/su00;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Ll/su00;-><init>(Lcom/p1/mobile/putong/core/ui/visitor/d;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ll/kfm0;->t(Ll/y20;)Ll/kfm0;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0}, Ll/kfm0;->show()V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public L(Ljava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/cfm0;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz p1, :cond_3

    .line 5
    .line 6
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 7
    .line 8
    .line 9
    move-result v2

    .line 10
    if-nez v2, :cond_0

    .line 11
    .line 12
    goto/16 :goto_1

    .line 13
    .line 14
    :cond_0
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->i:Lv/VLinear;

    .line 15
    .line 16
    invoke-virtual {v2, v0}, Landroid/view/View;->setVisibility(I)V

    .line 17
    .line 18
    .line 19
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->b:Lv/VLinear;

    .line 20
    .line 21
    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    .line 22
    .line 23
    .line 24
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-virtual {v2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    invoke-interface {v2}, Ll/r97;->f()Z

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    if-eqz v2, :cond_1

    .line 37
    .line 38
    invoke-static {}, Ll/joa;->G3()Z

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    if-nez v2, :cond_1

    .line 43
    .line 44
    const-string v0, "p_my_visitor"

    .line 45
    .line 46
    new-array v2, v1, [Ll/sfj0$a;

    .line 47
    .line 48
    const-string v3, "e_visitor_unlock"

    .line 49
    .line 50
    invoke-static {v3, v0, v2}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->e:Landroid/widget/FrameLayout;

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 56
    .line 57
    .line 58
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Y9()Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    if-eqz v0, :cond_2

    .line 71
    .line 72
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->d:Lv/VPullUpRecyclerView;

    .line 73
    .line 74
    invoke-virtual {v0}, Landroid/view/View;->getPaddingBottom()I

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    if-eqz v0, :cond_2

    .line 79
    .line 80
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->d:Lv/VPullUpRecyclerView;

    .line 81
    .line 82
    invoke-virtual {v0}, Landroid/view/View;->getPaddingLeft()I

    .line 83
    .line 84
    .line 85
    move-result v2

    .line 86
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->d:Lv/VPullUpRecyclerView;

    .line 87
    .line 88
    invoke-virtual {v3}, Landroid/view/View;->getPaddingTop()I

    .line 89
    .line 90
    .line 91
    move-result v3

    .line 92
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->d:Lv/VPullUpRecyclerView;

    .line 93
    .line 94
    invoke-virtual {v4}, Landroid/view/View;->getPaddingRight()I

    .line 95
    .line 96
    .line 97
    move-result v4

    .line 98
    invoke-virtual {v0, v2, v3, v4, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 99
    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->e:Landroid/widget/FrameLayout;

    .line 103
    .line 104
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 105
    .line 106
    .line 107
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Y9()Z

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    if-eqz v0, :cond_2

    .line 120
    .line 121
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->d:Lv/VPullUpRecyclerView;

    .line 122
    .line 123
    invoke-virtual {v0}, Landroid/view/View;->getPaddingBottom()I

    .line 124
    .line 125
    .line 126
    move-result v0

    .line 127
    sget v1, Ll/qa00;->m:I

    .line 128
    .line 129
    if-eq v0, v1, :cond_2

    .line 130
    .line 131
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->d:Lv/VPullUpRecyclerView;

    .line 132
    .line 133
    invoke-virtual {v0}, Landroid/view/View;->getPaddingLeft()I

    .line 134
    .line 135
    .line 136
    move-result v2

    .line 137
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->d:Lv/VPullUpRecyclerView;

    .line 138
    .line 139
    invoke-virtual {v3}, Landroid/view/View;->getPaddingTop()I

    .line 140
    .line 141
    .line 142
    move-result v3

    .line 143
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->d:Lv/VPullUpRecyclerView;

    .line 144
    .line 145
    invoke-virtual {v4}, Landroid/view/View;->getPaddingRight()I

    .line 146
    .line 147
    .line 148
    move-result v4

    .line 149
    invoke-virtual {v0, v2, v3, v4, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 150
    .line 151
    .line 152
    :cond_2
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->t:Lcom/p1/mobile/putong/core/ui/visitor/a;

    .line 153
    .line 154
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/a;->E(Ljava/util/List;)V

    .line 155
    .line 156
    .line 157
    return-void

    .line 158
    :cond_3
    :goto_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->i:Lv/VLinear;

    .line 159
    .line 160
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 161
    .line 162
    .line 163
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->b:Lv/VLinear;

    .line 164
    .line 165
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 166
    .line 167
    .line 168
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->e:Landroid/widget/FrameLayout;

    .line 169
    .line 170
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 171
    .line 172
    .line 173
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 174
    .line 175
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->j:Lv/VDraweeView;

    .line 176
    .line 177
    sget v1, Ll/gbc0;->N5:I

    .line 178
    .line 179
    invoke-virtual {p1, v0, v1}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 180
    .line 181
    .line 182
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->k:Lv/VText;

    .line 183
    .line 184
    const-string p1, "\u6ca1\u6709\u7b26\u5408\u6761\u4ef6\u7684\u8bbf\u5ba2"

    .line 185
    .line 186
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 187
    .line 188
    .line 189
    return-void
.end method

.method public M(Ljava/lang/String;)V
    .locals 8

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->v:Lcom/p1/mobile/putong/core/ui/visitor/MomentVisitorsFrag;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    new-instance v4, Ll/pu00;

    .line 16
    .line 17
    invoke-direct {v4, p0}, Ll/pu00;-><init>(Lcom/p1/mobile/putong/core/ui/visitor/d;)V

    .line 18
    .line 19
    .line 20
    const/4 v6, 0x0

    .line 21
    sget-object v7, Lcom/p1/mobile/putong/core/data/Privilege;->oDiamondVisitor:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 22
    .line 23
    const/4 v5, 0x0

    .line 24
    move-object v3, p1

    .line 25
    invoke-interface/range {v1 .. v7}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Og(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/y20;Ll/x20;Ll/x20;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public N()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->c:Lv/VPullDownRefreshLayout;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    invoke-virtual {p0, v0}, Lv/smart_refresh/SmartRefreshLayout;->w(Z)Ll/mvc0;

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public O(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->c:Lv/VPullDownRefreshLayout;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0, p1}, Lv/smart_refresh/SmartRefreshLayout;->w(Z)Ll/mvc0;

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public P()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->u:Lcom/p1/mobile/putong/core/ui/visitor/c;

    .line 2
    .line 3
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/ui/visitor/c;->b:Z

    .line 4
    .line 5
    if-eqz v0, :cond_3

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Ll/r97;->f()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    const/4 v1, 0x1

    .line 20
    const-string v2, "p_moment_visitor"

    .line 21
    .line 22
    const-string v3, "e_moment_visitor_set"

    .line 23
    .line 24
    const/4 v4, 0x0

    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    new-instance v0, Landroid/widget/ImageView;

    .line 28
    .line 29
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->v:Lcom/p1/mobile/putong/core/ui/visitor/MomentVisitorsFrag;

    .line 30
    .line 31
    invoke-virtual {v5}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 32
    .line 33
    .line 34
    move-result-object v5

    .line 35
    invoke-direct {v0, v5}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 36
    .line 37
    .line 38
    sget v5, Ll/gbc0;->P5:I

    .line 39
    .line 40
    invoke-virtual {v0, v5}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 41
    .line 42
    .line 43
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->a:Lv/navigationbar/VNavigationBar;

    .line 44
    .line 45
    new-array v1, v1, [Landroid/view/View;

    .line 46
    .line 47
    aput-object v0, v1, v4

    .line 48
    .line 49
    invoke-virtual {v5, v1}, Lv/navigationbar/VNavigationBar;->z([Landroid/view/View;)V

    .line 50
    .line 51
    .line 52
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Y9()Z

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    if-nez v1, :cond_0

    .line 65
    .line 66
    invoke-static {v3, v2}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    :cond_0
    new-instance v1, Ll/nu00;

    .line 70
    .line 71
    invoke-direct {v1, p0}, Ll/nu00;-><init>(Lcom/p1/mobile/putong/core/ui/visitor/d;)V

    .line 72
    .line 73
    .line 74
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    :cond_1
    new-instance v0, Landroid/widget/TextView;

    .line 79
    .line 80
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->v:Lcom/p1/mobile/putong/core/ui/visitor/MomentVisitorsFrag;

    .line 81
    .line 82
    invoke-virtual {v5}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 83
    .line 84
    .line 85
    move-result-object v5

    .line 86
    invoke-direct {v0, v5}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 87
    .line 88
    .line 89
    const-string v5, "\u8bbe\u7f6e"

    .line 90
    .line 91
    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 92
    .line 93
    .line 94
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->v:Lcom/p1/mobile/putong/core/ui/visitor/MomentVisitorsFrag;

    .line 95
    .line 96
    invoke-virtual {v5}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 97
    .line 98
    .line 99
    move-result-object v5

    .line 100
    sget v6, Ll/f9c0;->c:I

    .line 101
    .line 102
    invoke-virtual {v5, v6}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 103
    .line 104
    .line 105
    move-result v5

    .line 106
    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 107
    .line 108
    .line 109
    sget-object v5, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 110
    .line 111
    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 112
    .line 113
    .line 114
    const/high16 v5, 0x41800000    # 16.0f

    .line 115
    .line 116
    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setTextSize(F)V

    .line 117
    .line 118
    .line 119
    const/high16 v5, 0x41400000    # 12.0f

    .line 120
    .line 121
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 122
    .line 123
    .line 124
    move-result v5

    .line 125
    invoke-virtual {v0, v4, v4, v5, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 126
    .line 127
    .line 128
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->a:Lv/navigationbar/VNavigationBar;

    .line 129
    .line 130
    new-array v1, v1, [Landroid/view/View;

    .line 131
    .line 132
    aput-object v0, v1, v4

    .line 133
    .line 134
    invoke-virtual {v5, v1}, Lv/navigationbar/VNavigationBar;->z([Landroid/view/View;)V

    .line 135
    .line 136
    .line 137
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 138
    .line 139
    .line 140
    move-result-object v1

    .line 141
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 142
    .line 143
    .line 144
    move-result-object v1

    .line 145
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Y9()Z

    .line 146
    .line 147
    .line 148
    move-result v1

    .line 149
    if-nez v1, :cond_2

    .line 150
    .line 151
    invoke-static {v3, v2}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 152
    .line 153
    .line 154
    :cond_2
    new-instance v1, Ll/ou00;

    .line 155
    .line 156
    invoke-direct {v1, p0}, Ll/ou00;-><init>(Lcom/p1/mobile/putong/core/ui/visitor/d;)V

    .line 157
    .line 158
    .line 159
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 160
    .line 161
    .line 162
    return-void

    .line 163
    :cond_3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->a:Lv/navigationbar/VNavigationBar;

    .line 164
    .line 165
    invoke-virtual {p0}, Lv/navigationbar/VNavigationBar;->B()V

    .line 166
    .line 167
    .line 168
    return-void
.end method

.method public Q(ZZ)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ll/r97;->f()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-static {}, Ll/joa;->G3()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->e:Landroid/widget/FrameLayout;

    .line 22
    .line 23
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 24
    .line 25
    .line 26
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->b:Lv/VLinear;

    .line 27
    .line 28
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->l:Lv/VRelative;

    .line 32
    .line 33
    xor-int/lit8 v1, p1, 0x1

    .line 34
    .line 35
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/visitor/d;->v()V

    .line 39
    .line 40
    .line 41
    if-eqz p1, :cond_1

    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->u:Lcom/p1/mobile/putong/core/ui/visitor/c;

    .line 44
    .line 45
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/visitor/c;->getData()V

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->i:Lv/VLinear;

    .line 50
    .line 51
    const/16 v1, 0x8

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 54
    .line 55
    .line 56
    :goto_0
    if-eqz p2, :cond_3

    .line 57
    .line 58
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->v:Lcom/p1/mobile/putong/core/ui/visitor/MomentVisitorsFrag;

    .line 59
    .line 60
    if-eqz p1, :cond_2

    .line 61
    .line 62
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/visitor/MomentVisitorsFrag;->Q4()Ll/l4g0;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-virtual {p1}, Ll/l4g0;->g()V

    .line 67
    .line 68
    .line 69
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->v:Lcom/p1/mobile/putong/core/ui/visitor/MomentVisitorsFrag;

    .line 70
    .line 71
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/visitor/MomentVisitorsFrag;->P4()Ll/l4g0;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-virtual {p0}, Ll/l4g0;->r()V

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :cond_2
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/visitor/MomentVisitorsFrag;->P4()Ll/l4g0;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    invoke-virtual {p1}, Ll/l4g0;->g()V

    .line 84
    .line 85
    .line 86
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->v:Lcom/p1/mobile/putong/core/ui/visitor/MomentVisitorsFrag;

    .line 87
    .line 88
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/visitor/MomentVisitorsFrag;->Q4()Ll/l4g0;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-virtual {p0}, Ll/l4g0;->r()V

    .line 93
    .line 94
    .line 95
    :cond_3
    return-void
.end method

.method public R()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/visitor/d;->P()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->b:Lv/VLinear;

    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->u:Lcom/p1/mobile/putong/core/ui/visitor/c;

    .line 7
    .line 8
    iget-boolean v1, v1, Lcom/p1/mobile/putong/core/ui/visitor/c;->b:Z

    .line 9
    .line 10
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->l:Lv/VRelative;

    .line 14
    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->u:Lcom/p1/mobile/putong/core/ui/visitor/c;

    .line 16
    .line 17
    iget-boolean v1, v1, Lcom/p1/mobile/putong/core/ui/visitor/c;->b:Z

    .line 18
    .line 19
    xor-int/lit8 v1, v1, 0x1

    .line 20
    .line 21
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/visitor/d;->v()V

    .line 25
    .line 26
    .line 27
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-interface {v0}, Ll/r97;->f()Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_0

    .line 40
    .line 41
    invoke-static {}, Ll/joa;->G3()Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-nez v0, :cond_0

    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->e:Landroid/widget/FrameLayout;

    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->u:Lcom/p1/mobile/putong/core/ui/visitor/c;

    .line 50
    .line 51
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/visitor/c;->b:Z

    .line 52
    .line 53
    invoke-static {v0, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 54
    .line 55
    .line 56
    :cond_0
    return-void
.end method

.method public a()Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->u:Lcom/p1/mobile/putong/core/ui/visitor/c;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/visitor/c;->D0()Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->v:Lcom/p1/mobile/putong/core/ui/visitor/MomentVisitorsFrag;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public b(Z)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->r:Landroid/view/View;

    .line 4
    .line 5
    new-instance v0, Ll/tu00;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ll/tu00;-><init>(Lcom/p1/mobile/putong/core/ui/visitor/d;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->r:Landroid/view/View;

    .line 14
    .line 15
    const/4 p1, 0x1

    .line 16
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->u:Lcom/p1/mobile/putong/core/ui/visitor/c;

    .line 21
    .line 22
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/visitor/c;->C0()Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    const/4 v0, 0x0

    .line 27
    if-eqz p1, :cond_1

    .line 28
    .line 29
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->d:Lv/VPullUpRecyclerView;

    .line 30
    .line 31
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->u:Lcom/p1/mobile/putong/core/ui/visitor/c;

    .line 35
    .line 36
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/visitor/c;->f1()V

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->u:Lcom/p1/mobile/putong/core/ui/visitor/c;

    .line 40
    .line 41
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/visitor/c;->c1()V

    .line 42
    .line 43
    .line 44
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->r:Landroid/view/View;

    .line 45
    .line 46
    invoke-static {p0, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/ui/visitor/c;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/d;->u(Lcom/p1/mobile/putong/core/ui/visitor/c;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/visitor/d;->s(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->a:Lv/navigationbar/VNavigationBar;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/visitor/d;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p2, v0}, Lv/navigationbar/VNavigationBar;->setLeftIconAsBack(Landroid/app/Activity;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->v:Lcom/p1/mobile/putong/core/ui/visitor/MomentVisitorsFrag;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    sget p2, Ll/f9c0;->m:I

    .line 21
    .line 22
    invoke-virtual {p0, p2}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    invoke-virtual {p1, p0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 27
    .line 28
    .line 29
    return-object p1
.end method

.method public s(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/uu00;->b(Lcom/p1/mobile/putong/core/ui/visitor/d;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public u(Lcom/p1/mobile/putong/core/ui/visitor/c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->u:Lcom/p1/mobile/putong/core/ui/visitor/c;

    .line 2
    .line 3
    return-void
.end method

.method public v()V
    .locals 0

    .line 1
    return-void
.end method

.method public final w()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Y9()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->f:Landroid/widget/LinearLayout;

    .line 16
    .line 17
    sget v1, Ll/gbc0;->O5:I

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->g:Landroid/widget/TextView;

    .line 23
    .line 24
    const-string v1, "#E8CB8C"

    .line 25
    .line 26
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->h:Landroid/widget/TextView;

    .line 34
    .line 35
    const-string v0, "#CCE8CB8C"

    .line 36
    .line 37
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 42
    .line 43
    .line 44
    :cond_0
    return-void
.end method

.method public w2(Ll/mvc0;)V
    .locals 0
    .param p1    # Ll/mvc0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/visitor/d;->J()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final x()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->n:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    invoke-virtual {v0, v1, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->p:Lv/VButton;

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->n:Lv/VText;

    .line 14
    .line 15
    const-string v1, "\u5f00\u542f\u540e\u53ef\u67e5\u770b\u8c01\u770b\u8fc7\u6211"

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 18
    .line 19
    .line 20
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-interface {v0}, Ll/r97;->f()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->o:Lv/VText;

    .line 33
    .line 34
    if-eqz v0, :cond_0

    .line 35
    .line 36
    const-string v0, "\u00b7\u8bb0\u5f55\u4ec5\u5c55\u793a\u540c\u6837\u5df2\u5f00\u542f\u7684\u7528\u6237\n\u00b7\u4f60\u67e5\u770b\u4ed6\u4eba\u4e5f\u4f1a\u7559\u4e0b\u8bb0\u5f55"

    .line 37
    .line 38
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    const-string v0, "\u00b7\u8bb0\u5f55\u4ec5\u5c55\u793a\u540c\u6837\u5df2\u5f00\u542f\u7684\u7528\u6237\n\u00b7\u4f60\u67e5\u770b\u4ed6\u4eba\u52a8\u6001\u4e5f\u5c06\u7559\u4e0b\u8bb0\u5f55"

    .line 43
    .line 44
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 45
    .line 46
    .line 47
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->p:Lv/VButton;

    .line 48
    .line 49
    new-instance v1, Ll/qu00;

    .line 50
    .line 51
    invoke-direct {v1, p0}, Ll/qu00;-><init>(Lcom/p1/mobile/putong/core/ui/visitor/d;)V

    .line 52
    .line 53
    .line 54
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->v:Lcom/p1/mobile/putong/core/ui/visitor/MomentVisitorsFrag;

    .line 58
    .line 59
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    const-string v1, "fromDeeplink"

    .line 64
    .line 65
    const/4 v2, 0x0

    .line 66
    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    if-eqz v0, :cond_1

    .line 71
    .line 72
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->i:Lv/VLinear;

    .line 73
    .line 74
    const/16 v1, 0x8

    .line 75
    .line 76
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 77
    .line 78
    .line 79
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->j:Lv/VDraweeView;

    .line 80
    .line 81
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 82
    .line 83
    .line 84
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->k:Lv/VText;

    .line 85
    .line 86
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 87
    .line 88
    .line 89
    :cond_1
    return-void
.end method

.method public y(Z)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->a:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p1, 0x1

    .line 11
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->a:Lv/navigationbar/VNavigationBar;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/visitor/d;->act()Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p1, v0}, Lv/navigationbar/VNavigationBar;->setLeftIconAsBack(Landroid/app/Activity;)V

    .line 21
    .line 22
    .line 23
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-interface {p1}, Ll/r97;->f()Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->a:Lv/navigationbar/VNavigationBar;

    .line 36
    .line 37
    if-eqz p1, :cond_1

    .line 38
    .line 39
    const-string p1, "\u6211\u7684\u8bbf\u5ba2"

    .line 40
    .line 41
    invoke-virtual {v0, p1}, Lv/navigationbar/VNavigationBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    const-string p1, "\u52a8\u6001\u8bbf\u5ba2"

    .line 46
    .line 47
    invoke-virtual {v0, p1}, Lv/navigationbar/VNavigationBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 48
    .line 49
    .line 50
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/visitor/d;->x()V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/visitor/d;->w()V

    .line 54
    .line 55
    .line 56
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->c:Lv/VPullDownRefreshLayout;

    .line 57
    .line 58
    invoke-virtual {p1, p0}, Lv/VPullDownRefreshLayout;->O(Ll/jn50;)Ll/mvc0;

    .line 59
    .line 60
    .line 61
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Y9()Z

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->v:Lcom/p1/mobile/putong/core/ui/visitor/MomentVisitorsFrag;

    .line 74
    .line 75
    if-eqz p1, :cond_2

    .line 76
    .line 77
    new-instance p1, Lcom/p1/mobile/putong/core/ui/visitor/f;

    .line 78
    .line 79
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->u:Lcom/p1/mobile/putong/core/ui/visitor/c;

    .line 84
    .line 85
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->w:Ll/h80;

    .line 86
    .line 87
    invoke-direct {p1, v0, v2, v3}, Lcom/p1/mobile/putong/core/ui/visitor/f;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/visitor/a$a;Ll/h80;)V

    .line 88
    .line 89
    .line 90
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->t:Lcom/p1/mobile/putong/core/ui/visitor/a;

    .line 91
    .line 92
    new-instance p1, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 93
    .line 94
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/visitor/d;->act()Lcom/p1/mobile/android/app/Act;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    const/4 v2, 0x2

    .line 99
    invoke-direct {p1, v0, v2}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    .line 100
    .line 101
    .line 102
    new-instance v0, Lcom/p1/mobile/putong/core/ui/visitor/d$b;

    .line 103
    .line 104
    invoke-direct {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/d$b;-><init>(Lcom/p1/mobile/putong/core/ui/visitor/d;Landroidx/recyclerview/widget/GridLayoutManager;)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/GridLayoutManager;->v(Landroidx/recyclerview/widget/GridLayoutManager$c;)V

    .line 108
    .line 109
    .line 110
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->d:Lv/VPullUpRecyclerView;

    .line 111
    .line 112
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 113
    .line 114
    .line 115
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->d:Lv/VPullUpRecyclerView;

    .line 116
    .line 117
    sget v0, Ll/qa00;->e:I

    .line 118
    .line 119
    invoke-virtual {p1, v0, v0, v0, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 120
    .line 121
    .line 122
    goto :goto_1

    .line 123
    :cond_2
    new-instance p1, Lcom/p1/mobile/putong/core/ui/visitor/b;

    .line 124
    .line 125
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->u:Lcom/p1/mobile/putong/core/ui/visitor/c;

    .line 130
    .line 131
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->w:Ll/h80;

    .line 132
    .line 133
    invoke-direct {p1, v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/visitor/b;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/visitor/a$a;Ll/h80;)V

    .line 134
    .line 135
    .line 136
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->t:Lcom/p1/mobile/putong/core/ui/visitor/a;

    .line 137
    .line 138
    :goto_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->d:Lv/VPullUpRecyclerView;

    .line 139
    .line 140
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->t:Lcom/p1/mobile/putong/core/ui/visitor/a;

    .line 141
    .line 142
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 143
    .line 144
    .line 145
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/visitor/d;->R()V

    .line 146
    .line 147
    .line 148
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 153
    .line 154
    .line 155
    move-result-object p1

    .line 156
    invoke-interface {p1}, Ll/r97;->f()Z

    .line 157
    .line 158
    .line 159
    move-result p1

    .line 160
    if-eqz p1, :cond_3

    .line 161
    .line 162
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->d:Lv/VPullUpRecyclerView;

    .line 163
    .line 164
    new-instance v0, Ll/lu00;

    .line 165
    .line 166
    invoke-direct {v0, p0}, Ll/lu00;-><init>(Lcom/p1/mobile/putong/core/ui/visitor/d;)V

    .line 167
    .line 168
    .line 169
    invoke-virtual {p1, v0}, Lv/VPullUpRecyclerView;->setOnPullUpListener(Ll/x20;)V

    .line 170
    .line 171
    .line 172
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->f:Landroid/widget/LinearLayout;

    .line 173
    .line 174
    new-instance v0, Ll/mu00;

    .line 175
    .line 176
    invoke-direct {v0, p0}, Ll/mu00;-><init>(Lcom/p1/mobile/putong/core/ui/visitor/d;)V

    .line 177
    .line 178
    .line 179
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 180
    .line 181
    .line 182
    :cond_3
    return-void
.end method

.method public final synthetic z(Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p1, "e_moment_visitor_set_on"

    .line 2
    .line 3
    const-string v0, "p_moment_visitor_set"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/visitor/d;->u:Lcom/p1/mobile/putong/core/ui/visitor/c;

    .line 9
    .line 10
    const/4 p1, 0x1

    .line 11
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/c;->d1(Z)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
