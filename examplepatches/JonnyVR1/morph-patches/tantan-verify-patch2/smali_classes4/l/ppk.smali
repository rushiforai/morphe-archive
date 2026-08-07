.class public Ll/ppk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;
.implements Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$j;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/ppk$b;,
        Ll/ppk$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/hpk;",
        ">;",
        "Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$j;"
    }
.end annotation


# instance fields
.field public a:Landroid/widget/FrameLayout;

.field public b:Lcom/p1/mobile/putong/core/newui/group/SwipeRefreshList;

.field public c:Lv/VLinear;

.field public d:Lv/VRecyclerView;

.field public e:Landroid/widget/LinearLayout;

.field public f:Lv/VText;

.field public g:Lv/VRecyclerView;

.field public h:Lv/VRelative;

.field public i:Lv/VImage;

.field public j:Lv/VText;

.field public k:Ll/hpk;

.field public l:Ll/mok;

.field public m:Ll/upk;

.field public n:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ppk;->n:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/ppk;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ppk;->k(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/ChatGroup;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

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

.method public static synthetic c(Ll/ppk;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ppk;->j(Landroid/view/View;)V

    return-void
.end method

.method private synthetic j(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ppk;->k:Ll/hpk;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/hpk;->z0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic k(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/ppk;->n:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/group/GroupSearchAct;->Y1(Landroid/content/Context;)Landroid/content/Intent;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/ppk;->k:Ll/hpk;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/hpk;->pageId()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const/4 p1, 0x0

    .line 17
    new-array p1, p1, [Ll/sfj0$a;

    .line 18
    .line 19
    const-string v0, "e_group_search"

    .line 20
    .line 21
    invoke-static {v0, p0, p1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ppk;->n:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/qpk;->b(Ll/ppk;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e(Ll/hpk;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ppk;->k:Ll/hpk;

    .line 2
    .line 3
    return-void
.end method

.method public f()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ppk;->g:Lv/VRecyclerView;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public i()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ppk;->j:Lv/VText;

    .line 2
    .line 3
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/hpk;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ppk;->e(Ll/hpk;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ppk;->d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public l(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ppk;->l:Ll/mok;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/mok;->I(Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public m(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/GroupTab;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/ppk;->m:Ll/upk;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/upk;->G(Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/ppk;->d:Lv/VRecyclerView;

    .line 7
    .line 8
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    xor-int/lit8 p1, p1, 0x1

    .line 13
    .line 14
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public n(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ppk;->b:Lcom/p1/mobile/putong/core/newui/group/SwipeRefreshList;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setRefreshing(Z)V

    .line 4
    .line 5
    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    iget-object p0, p0, Ll/ppk;->g:Lv/VRecyclerView;

    .line 9
    .line 10
    const/4 p1, 0x1

    .line 11
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public p()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ppk;->k:Ll/hpk;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/hpk;->P0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public q()V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/ppk;->l:Ll/mok;

    .line 2
    .line 3
    iget-object v0, v0, Ll/mok;->d:Ljava/util/List;

    .line 4
    .line 5
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 8
    .line 9
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/e;->B6()Ljava/util/HashMap;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    if-eqz v3, :cond_1

    .line 26
    .line 27
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    check-cast v3, Ljava/lang/String;

    .line 32
    .line 33
    new-instance v4, Ll/opk;

    .line 34
    .line 35
    invoke-direct {v4, v3}, Ll/opk;-><init>(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v0, v4}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    check-cast v4, Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 43
    .line 44
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result v5

    .line 48
    if-eqz v5, :cond_0

    .line 49
    .line 50
    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    check-cast v3, Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 55
    .line 56
    iget-object v5, v4, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupApply:Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 57
    .line 58
    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/GroupApply;->status:Lcom/p1/mobile/putong/core/data/GroupApplyStatus;

    .line 59
    .line 60
    iget-object v6, v3, Lcom/p1/mobile/putong/core/data/GroupApply;->status:Lcom/p1/mobile/putong/core/data/GroupApplyStatus;

    .line 61
    .line 62
    invoke-static {v5, v6}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

    .line 63
    .line 64
    .line 65
    move-result v5

    .line 66
    if-nez v5, :cond_0

    .line 67
    .line 68
    iget-object v5, v4, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupApply:Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 69
    .line 70
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/GroupApply;->status:Lcom/p1/mobile/putong/core/data/GroupApplyStatus;

    .line 71
    .line 72
    iput-object v3, v5, Lcom/p1/mobile/putong/core/data/GroupApply;->status:Lcom/p1/mobile/putong/core/data/GroupApplyStatus;

    .line 73
    .line 74
    iget-object v3, p0, Ll/ppk;->l:Ll/mok;

    .line 75
    .line 76
    invoke-interface {v0, v4}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 77
    .line 78
    .line 79
    move-result v4

    .line 80
    invoke-virtual {v3, v4}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 81
    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_1
    return-void
.end method

.method public r()V
    .locals 6

    .line 1
    invoke-virtual {p0}, Ll/ppk;->u()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/upk;

    .line 5
    .line 6
    iget-object v1, p0, Ll/ppk;->n:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    iget-object v2, p0, Ll/ppk;->k:Ll/hpk;

    .line 9
    .line 10
    invoke-direct {v0, v1, v2}, Ll/upk;-><init>(Lcom/p1/mobile/android/app/Act;Ll/hpk;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Ll/ppk;->m:Ll/upk;

    .line 14
    .line 15
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 16
    .line 17
    iget-object v1, p0, Ll/ppk;->n:Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    invoke-direct {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 20
    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;->setOrientation(I)V

    .line 24
    .line 25
    .line 26
    iget-object v2, p0, Ll/ppk;->d:Lv/VRecyclerView;

    .line 27
    .line 28
    invoke-virtual {v2, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ll/ppk;->d:Lv/VRecyclerView;

    .line 32
    .line 33
    new-instance v2, Ll/ppk$b;

    .line 34
    .line 35
    invoke-direct {v2}, Ll/ppk$b;-><init>()V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Ll/ppk;->d:Lv/VRecyclerView;

    .line 42
    .line 43
    iget-object v2, p0, Ll/ppk;->m:Ll/upk;

    .line 44
    .line 45
    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 46
    .line 47
    .line 48
    new-instance v0, Ll/mok;

    .line 49
    .line 50
    iget-object v2, p0, Ll/ppk;->n:Lcom/p1/mobile/android/app/Act;

    .line 51
    .line 52
    iget-object v3, p0, Ll/ppk;->k:Ll/hpk;

    .line 53
    .line 54
    invoke-direct {v0, v2, v3}, Ll/mok;-><init>(Lcom/p1/mobile/android/app/Act;Ll/hpk;)V

    .line 55
    .line 56
    .line 57
    iput-object v0, p0, Ll/ppk;->l:Ll/mok;

    .line 58
    .line 59
    iget-object v0, p0, Ll/ppk;->g:Lv/VRecyclerView;

    .line 60
    .line 61
    new-instance v2, Ll/ppk$a;

    .line 62
    .line 63
    invoke-direct {v2}, Ll/ppk$a;-><init>()V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 67
    .line 68
    .line 69
    iget-object v0, p0, Ll/ppk;->g:Lv/VRecyclerView;

    .line 70
    .line 71
    iget-object v2, p0, Ll/ppk;->l:Ll/mok;

    .line 72
    .line 73
    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 74
    .line 75
    .line 76
    iget-object v0, p0, Ll/ppk;->b:Lcom/p1/mobile/putong/core/newui/group/SwipeRefreshList;

    .line 77
    .line 78
    invoke-virtual {v0, p0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setOnRefreshListener(Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$j;)V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Ll/ppk;->g:Lv/VRecyclerView;

    .line 82
    .line 83
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getItemAnimator()Landroidx/recyclerview/widget/RecyclerView$l;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    check-cast v0, Landroidx/recyclerview/widget/v;

    .line 88
    .line 89
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/v;->setSupportsChangeAnimations(Z)V

    .line 90
    .line 91
    .line 92
    iget-object v0, p0, Ll/ppk;->h:Lv/VRelative;

    .line 93
    .line 94
    new-instance v2, Ll/mpk;

    .line 95
    .line 96
    invoke-direct {v2, p0}, Ll/mpk;-><init>(Ll/ppk;)V

    .line 97
    .line 98
    .line 99
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 100
    .line 101
    .line 102
    iget-object v0, p0, Ll/ppk;->b:Lcom/p1/mobile/putong/core/newui/group/SwipeRefreshList;

    .line 103
    .line 104
    sget v2, Ll/g9c0;->U:I

    .line 105
    .line 106
    sget v3, Ll/g9c0;->R:I

    .line 107
    .line 108
    sget v4, Ll/g9c0;->S:I

    .line 109
    .line 110
    sget v5, Ll/g9c0;->T:I

    .line 111
    .line 112
    filled-new-array {v2, v3, v4, v5}, [I

    .line 113
    .line 114
    .line 115
    move-result-object v2

    .line 116
    invoke-virtual {v0, v2}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setColorSchemeResources([I)V

    .line 117
    .line 118
    .line 119
    iget-object v0, p0, Ll/ppk;->a:Landroid/widget/FrameLayout;

    .line 120
    .line 121
    const/4 v2, 0x1

    .line 122
    new-array v2, v2, [Landroid/view/View;

    .line 123
    .line 124
    aput-object v0, v2, v1

    .line 125
    .line 126
    invoke-static {v2}, Ll/bnl0;->g0([Landroid/view/View;)V

    .line 127
    .line 128
    .line 129
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    invoke-interface {v0}, Ll/r97;->E()Z

    .line 138
    .line 139
    .line 140
    move-result v0

    .line 141
    if-eqz v0, :cond_1

    .line 142
    .line 143
    invoke-static {}, Ll/pkb;->q0()Z

    .line 144
    .line 145
    .line 146
    move-result v0

    .line 147
    iget-object v2, p0, Ll/ppk;->f:Lv/VText;

    .line 148
    .line 149
    if-eqz v0, :cond_0

    .line 150
    .line 151
    const-string v0, "\u8f93\u5165\u5173\u952e\u8bcd/\u7fa4\u53f7\u8fdb\u884c\u641c\u7d22"

    .line 152
    .line 153
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 154
    .line 155
    .line 156
    goto :goto_0

    .line 157
    :cond_0
    iget-object v0, p0, Ll/ppk;->n:Lcom/p1/mobile/android/app/Act;

    .line 158
    .line 159
    sget v3, Lcom/p1/mobile/putong/core/message/R$string;->A0:I

    .line 160
    .line 161
    invoke-virtual {v0, v3}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 166
    .line 167
    .line 168
    :cond_1
    :goto_0
    iget-object v0, p0, Ll/ppk;->e:Landroid/widget/LinearLayout;

    .line 169
    .line 170
    new-instance v2, Ll/npk;

    .line 171
    .line 172
    invoke-direct {v2, p0}, Ll/npk;-><init>(Ll/ppk;)V

    .line 173
    .line 174
    .line 175
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 176
    .line 177
    .line 178
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 183
    .line 184
    .line 185
    move-result-object v0

    .line 186
    invoke-interface {v0}, Ll/r97;->x2()Z

    .line 187
    .line 188
    .line 189
    move-result v0

    .line 190
    if-eqz v0, :cond_2

    .line 191
    .line 192
    iget-object p0, p0, Ll/ppk;->a:Landroid/widget/FrameLayout;

    .line 193
    .line 194
    invoke-virtual {p0, v1, v1, v1, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 195
    .line 196
    .line 197
    :cond_2
    return-void
.end method

.method public s(Lcom/p1/mobile/putong/core/data/NotificationCounter;)V
    .locals 4

    .line 1
    iget v0, p1, Lcom/p1/mobile/putong/core/data/NotificationCounter;->unread:I

    .line 2
    .line 3
    iget-object v1, p0, Ll/ppk;->j:Lv/VText;

    .line 4
    .line 5
    if-lez v0, :cond_1

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Ll/ppk;->j:Lv/VText;

    .line 12
    .line 13
    iget v2, p1, Lcom/p1/mobile/putong/core/data/NotificationCounter;->unread:I

    .line 14
    .line 15
    const/16 v3, 0x63

    .line 16
    .line 17
    if-le v2, v3, :cond_0

    .line 18
    .line 19
    const-string p1, "99+"

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 25
    .line 26
    .line 27
    iget p1, p1, Lcom/p1/mobile/putong/core/data/NotificationCounter;->unread:I

    .line 28
    .line 29
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    const-string p1, ""

    .line 33
    .line 34
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    :goto_0
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 42
    .line 43
    .line 44
    iget-object p0, p0, Ll/ppk;->i:Lv/VImage;

    .line 45
    .line 46
    invoke-virtual {p0, v0}, Landroid/view/View;->setSelected(Z)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_1
    const/4 p1, 0x0

    .line 51
    invoke-static {v1, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 52
    .line 53
    .line 54
    iget-object p0, p0, Ll/ppk;->i:Lv/VImage;

    .line 55
    .line 56
    invoke-virtual {p0, p1}, Landroid/view/View;->setSelected(Z)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public final u()V
    .locals 1

    .line 1
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->getAppTheme()Ll/ux0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object p0, p0, Ll/ppk;->a:Landroid/widget/FrameLayout;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/ux0;->b()Landroid/graphics/drawable/Drawable;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    iget-object p0, p0, Ll/ppk;->a:Landroid/widget/FrameLayout;

    .line 26
    .line 27
    const-string v0, "#FFFFFF"

    .line 28
    .line 29
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 34
    .line 35
    .line 36
    return-void
.end method
