.class public Ll/vn40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/qn40;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VRelative;

.field public b:Landroid/view/View;

.field public c:Lv/VLinear;

.field public d:Lv/VFrame;

.field public e:Lv/VIcon;

.field public f:Landroid/widget/TextView;

.field public g:Lv/VRecyclerView;

.field public h:Lv/VLinear;

.field public i:Lv/VLinear;

.field public j:Lv/VEditText;

.field public k:Lv/VText;

.field public l:Landroid/view/View;

.field public m:Lcom/p1/mobile/putong/core/newui/newuserbatchgreet/NewUserBatchGreetAct;

.field public n:Ll/zn40;

.field public o:Z

.field public p:I

.field public q:I

.field public r:Ll/qn40;

.field public s:Landroid/view/animation/Interpolator;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/newuserbatchgreet/NewUserBatchGreetAct;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/xjg;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/xjg;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/vn40;->s:Landroid/view/animation/Interpolator;

    .line 10
    .line 11
    iput-object p1, p0, Ll/vn40;->m:Lcom/p1/mobile/putong/core/newui/newuserbatchgreet/NewUserBatchGreetAct;

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic a(Ll/vn40;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/vn40;->k(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/vn40;Ljava/lang/Boolean;Ljava/lang/Integer;Ljava/lang/Boolean;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/vn40;->j(Ljava/lang/Boolean;Ljava/lang/Integer;Ljava/lang/Boolean;Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic c(Ll/vn40;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vn40;->m(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Ll/vn40;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/vn40;->l(Landroid/view/View;)V

    return-void
.end method

.method private synthetic k(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vn40;->m:Lcom/p1/mobile/putong/core/newui/newuserbatchgreet/NewUserBatchGreetAct;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newuserbatchgreet/NewUserBatchGreetAct;->finish()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic l(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vn40;->m:Lcom/p1/mobile/putong/core/newui/newuserbatchgreet/NewUserBatchGreetAct;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newuserbatchgreet/NewUserBatchGreetAct;->finish()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private s(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 23
    .line 24
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const-string p1, "to_uid"

    .line 29
    .line 30
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    filled-new-array {p0}, [Ll/pf60;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    const-string p1, "e_greeting_new"

    .line 43
    .line 44
    const-string v0, "p_kankan_stranger_message"

    .line 45
    .line 46
    invoke-static {p1, v0, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/vn40;->m:Lcom/p1/mobile/putong/core/newui/newuserbatchgreet/NewUserBatchGreetAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/vn40;->m:Lcom/p1/mobile/putong/core/newui/newuserbatchgreet/NewUserBatchGreetAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/wn40;->b(Ll/vn40;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public f(Ll/qn40;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/vn40;->r:Ll/qn40;

    .line 2
    .line 3
    return-void
.end method

.method public i()V
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/vn40;->o:Z

    .line 3
    .line 4
    iget-object v1, p0, Ll/vn40;->s:Landroid/view/animation/Interpolator;

    .line 5
    .line 6
    iget-object v2, p0, Ll/vn40;->h:Lv/VLinear;

    .line 7
    .line 8
    sget-object v3, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    .line 9
    .line 10
    const/4 v4, 0x1

    .line 11
    new-array v5, v4, [F

    .line 12
    .line 13
    const/4 v6, 0x0

    .line 14
    aput v6, v5, v0

    .line 15
    .line 16
    invoke-static {v2, v3, v5}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    iget-object p0, p0, Ll/vn40;->c:Lv/VLinear;

    .line 21
    .line 22
    new-array v5, v4, [F

    .line 23
    .line 24
    aput v6, v5, v0

    .line 25
    .line 26
    invoke-static {p0, v3, v5}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    filled-new-array {v2, p0}, [Landroid/animation/Animator;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    const-wide/16 v2, 0x186

    .line 35
    .line 36
    invoke-static {v4, v1, v2, v3, p0}, Ll/gt0;->u(ZLandroid/view/animation/Interpolator;J[Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/qn40;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/vn40;->f(Ll/qn40;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 4

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/vn40;->e(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0}, Ll/vn40;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    new-instance v0, Landroid/view/View;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/vn40;->act()Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-direct {v0, v1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 16
    .line 17
    .line 18
    new-instance v1, Ll/rn40;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/rn40;-><init>(Ll/vn40;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p2, p1, v0, v1}, Lcom/p1/mobile/android/app/Act;->setUpKeyboardDetectorLayout(Landroid/view/View;Landroid/view/View;Ll/b30;)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    new-instance p2, Ll/zn40;

    .line 28
    .line 29
    invoke-direct {p2}, Ll/zn40;-><init>()V

    .line 30
    .line 31
    .line 32
    iput-object p2, p0, Ll/vn40;->n:Ll/zn40;

    .line 33
    .line 34
    iget-object v0, p0, Ll/vn40;->g:Lv/VRecyclerView;

    .line 35
    .line 36
    invoke-virtual {v0, p2}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 37
    .line 38
    .line 39
    new-instance p2, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 40
    .line 41
    iget-object v0, p0, Ll/vn40;->m:Lcom/p1/mobile/putong/core/newui/newuserbatchgreet/NewUserBatchGreetAct;

    .line 42
    .line 43
    const/4 v1, 0x3

    .line 44
    invoke-direct {p2, v0, v1}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    .line 45
    .line 46
    .line 47
    new-instance v0, Ll/ao40;

    .line 48
    .line 49
    const/high16 v2, 0x41e80000    # 29.0f

    .line 50
    .line 51
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    const/high16 v3, 0x428c0000    # 70.0f

    .line 56
    .line 57
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 58
    .line 59
    .line 60
    move-result v3

    .line 61
    invoke-direct {v0, v1, v2, v3}, Ll/ao40;-><init>(III)V

    .line 62
    .line 63
    .line 64
    iget-object v1, p0, Ll/vn40;->g:Lv/VRecyclerView;

    .line 65
    .line 66
    invoke-virtual {v1, p2}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 67
    .line 68
    .line 69
    iget-object p2, p0, Ll/vn40;->g:Lv/VRecyclerView;

    .line 70
    .line 71
    invoke-virtual {p2, v0}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 72
    .line 73
    .line 74
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 75
    .line 76
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->V1:Ll/p4a;

    .line 77
    .line 78
    iget-object p2, p2, Ll/p4a;->T:Ljava/lang/String;

    .line 79
    .line 80
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 81
    .line 82
    .line 83
    move-result p2

    .line 84
    if-nez p2, :cond_0

    .line 85
    .line 86
    iget-object p2, p0, Ll/vn40;->j:Lv/VEditText;

    .line 87
    .line 88
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 89
    .line 90
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->V1:Ll/p4a;

    .line 91
    .line 92
    iget-object v0, v0, Ll/p4a;->T:Ljava/lang/String;

    .line 93
    .line 94
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 95
    .line 96
    .line 97
    :cond_0
    iget-object p2, p0, Ll/vn40;->k:Lv/VText;

    .line 98
    .line 99
    iget-object v0, p0, Ll/vn40;->j:Lv/VEditText;

    .line 100
    .line 101
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    xor-int/lit8 v0, v0, 0x1

    .line 110
    .line 111
    invoke-virtual {p2, v0}, Landroid/view/View;->setEnabled(Z)V

    .line 112
    .line 113
    .line 114
    iget-object p2, p0, Ll/vn40;->b:Landroid/view/View;

    .line 115
    .line 116
    new-instance v0, Ll/sn40;

    .line 117
    .line 118
    invoke-direct {v0, p0}, Ll/sn40;-><init>(Ll/vn40;)V

    .line 119
    .line 120
    .line 121
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 122
    .line 123
    .line 124
    iget-object p2, p0, Ll/vn40;->e:Lv/VIcon;

    .line 125
    .line 126
    new-instance v0, Ll/tn40;

    .line 127
    .line 128
    invoke-direct {v0, p0}, Ll/tn40;-><init>(Ll/vn40;)V

    .line 129
    .line 130
    .line 131
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 132
    .line 133
    .line 134
    iget-object p2, p0, Ll/vn40;->k:Lv/VText;

    .line 135
    .line 136
    new-instance v0, Ll/un40;

    .line 137
    .line 138
    invoke-direct {v0, p0}, Ll/un40;-><init>(Ll/vn40;)V

    .line 139
    .line 140
    .line 141
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 142
    .line 143
    .line 144
    iget-object p2, p0, Ll/vn40;->j:Lv/VEditText;

    .line 145
    .line 146
    new-instance v0, Ll/vn40$a;

    .line 147
    .line 148
    invoke-direct {v0, p0}, Ll/vn40$a;-><init>(Ll/vn40;)V

    .line 149
    .line 150
    .line 151
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 152
    .line 153
    .line 154
    return-object p1
.end method

.method public final synthetic j(Ljava/lang/Boolean;Ljava/lang/Integer;Ljava/lang/Boolean;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p1, 0x0

    .line 13
    :goto_0
    invoke-virtual {p0, p1}, Ll/vn40;->n(I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic m(Landroid/view/View;)V
    .locals 2

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isJailed()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_2

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isBannedNew()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_2

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isNameFake()Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-nez p1, :cond_2

    .line 26
    .line 27
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 28
    .line 29
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 30
    .line 31
    invoke-virtual {p1}, Ll/dkb;->c8()Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_0

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    iget-object p1, p0, Ll/vn40;->n:Ll/zn40;

    .line 39
    .line 40
    invoke-virtual {p1}, Ll/zn40;->C()Ljava/util/List;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {p0, p1}, Ll/vn40;->q(Ljava/util/List;)V

    .line 45
    .line 46
    .line 47
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_1

    .line 52
    .line 53
    const-string p0, "\u9700\u8981\u52fe\u9009\u81f3\u5c111\u4e2a\u7528\u6237\u624d\u80fd\u53d1\u9001"

    .line 54
    .line 55
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/data/GreetingBatchPostBody;->new_()Lcom/p1/mobile/putong/core/data/GreetingBatchPostBody;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    const-string v1, "greeting"

    .line 64
    .line 65
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/GreetingBatchPostBody;->action:Ljava/lang/String;

    .line 66
    .line 67
    iget-object v1, p0, Ll/vn40;->j:Lv/VEditText;

    .line 68
    .line 69
    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/GreetingBatchPostBody;->value:Ljava/lang/String;

    .line 78
    .line 79
    iput-object p1, v0, Lcom/p1/mobile/putong/core/data/GreetingBatchPostBody;->userIds:Ljava/util/List;

    .line 80
    .line 81
    iget-object p0, p0, Ll/vn40;->r:Ll/qn40;

    .line 82
    .line 83
    invoke-virtual {p0, v0}, Ll/qn40;->j0(Lcom/p1/mobile/putong/core/data/GreetingBatchPostBody;)V

    .line 84
    .line 85
    .line 86
    return-void

    .line 87
    :cond_2
    :goto_0
    const-string p0, "\u68c0\u6d4b\u5230\u60a8\u7684\u8d26\u53f7\u5f02\u5e38\uff0c\u8bf7\u7a0d\u540e\u518d\u8bd5"

    .line 88
    .line 89
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method public n(I)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget-boolean v0, p0, Ll/vn40;->o:Z

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/vn40;->i()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    if-lez p1, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ll/vn40;->u(I)V

    .line 14
    .line 15
    .line 16
    :cond_1
    return-void
.end method

.method public p(Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/vn40;->s(Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/vn40;->n:Ll/zn40;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/zn40;->I(Ljava/util/List;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final q(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string p0, "to_uid"

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p0, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    const-string v0, "pick_num"

    .line 20
    .line 21
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    filled-new-array {p0, p1}, [Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const-string p1, "e_greeting_new"

    .line 30
    .line 31
    const-string v0, "p_kankan_stranger_message"

    .line 32
    .line 33
    invoke-static {p1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public u(I)V
    .locals 6

    .line 1
    iput p1, p0, Ll/vn40;->p:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    iput-boolean v0, p0, Ll/vn40;->o:Z

    .line 5
    .line 6
    iget-object v1, p0, Ll/vn40;->c:Lv/VLinear;

    .line 7
    .line 8
    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    invoke-static {}, Ll/bnl0;->F0()I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    sub-int/2addr v1, v2

    .line 17
    iget-object v2, p0, Ll/vn40;->l:Landroid/view/View;

    .line 18
    .line 19
    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    sub-int v2, p1, v2

    .line 24
    .line 25
    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    iput v1, p0, Ll/vn40;->q:I

    .line 30
    .line 31
    const/4 v2, 0x0

    .line 32
    if-gez v1, :cond_0

    .line 33
    .line 34
    iput v2, p0, Ll/vn40;->q:I

    .line 35
    .line 36
    :cond_0
    iget-object v1, p0, Ll/vn40;->s:Landroid/view/animation/Interpolator;

    .line 37
    .line 38
    iget-object v3, p0, Ll/vn40;->h:Lv/VLinear;

    .line 39
    .line 40
    sget-object v4, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    .line 41
    .line 42
    iget v5, p0, Ll/vn40;->q:I

    .line 43
    .line 44
    sub-int/2addr v5, p1

    .line 45
    iget-object p1, p0, Ll/vn40;->l:Landroid/view/View;

    .line 46
    .line 47
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    add-int/2addr v5, p1

    .line 52
    invoke-static {v5, v2}, Ljava/lang/Math;->min(II)I

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    int-to-float p1, p1

    .line 57
    new-array v5, v0, [F

    .line 58
    .line 59
    aput p1, v5, v2

    .line 60
    .line 61
    invoke-static {v3, v4, v5}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    iget-object v3, p0, Ll/vn40;->c:Lv/VLinear;

    .line 66
    .line 67
    iget p0, p0, Ll/vn40;->q:I

    .line 68
    .line 69
    neg-int p0, p0

    .line 70
    int-to-float p0, p0

    .line 71
    new-array v5, v0, [F

    .line 72
    .line 73
    aput p0, v5, v2

    .line 74
    .line 75
    invoke-static {v3, v4, v5}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    filled-new-array {p1, p0}, [Landroid/animation/Animator;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    const-wide/16 v2, 0x186

    .line 84
    .line 85
    invoke-static {v0, v1, v2, v3, p0}, Ll/gt0;->u(ZLandroid/view/animation/Interpolator;J[Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 90
    .line 91
    .line 92
    return-void
.end method
