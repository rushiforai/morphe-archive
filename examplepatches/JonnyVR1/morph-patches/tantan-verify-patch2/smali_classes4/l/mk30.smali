.class public Ll/mk30;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/mk30$e;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/dk30;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VRecyclerView;

.field public b:Lv/VPullUpRecyclerView;

.field public c:Lv/VFrame;

.field public d:Landroid/view/View;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public final g:Lcom/p1/mobile/android/app/Frag;

.field public final h:Lcom/p1/mobile/android/app/Act;

.field public i:Ll/mk30$e;

.field public j:Ll/w76;

.field public k:Ll/dk30;

.field public l:Z

.field public final m:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public final n:Landroid/os/CountDownTimer;

.field public o:Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;

.field public p:I

.field public q:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Frag;)V
    .locals 7

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/mk30;->l:Z

    .line 6
    .line 7
    new-instance v0, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/mk30;->m:Ljava/util/List;

    .line 13
    .line 14
    new-instance v1, Ll/mk30$a;

    .line 15
    .line 16
    const-wide/16 v3, 0x3e8

    .line 17
    .line 18
    const-wide/16 v5, 0x64

    .line 19
    .line 20
    move-object v2, p0

    .line 21
    invoke-direct/range {v1 .. v6}, Ll/mk30$a;-><init>(Ll/mk30;JJ)V

    .line 22
    .line 23
    .line 24
    iput-object v1, v2, Ll/mk30;->n:Landroid/os/CountDownTimer;

    .line 25
    .line 26
    const/4 p0, -0x1

    .line 27
    iput p0, v2, Ll/mk30;->p:I

    .line 28
    .line 29
    const/4 p0, 0x1

    .line 30
    iput-boolean p0, v2, Ll/mk30;->q:Z

    .line 31
    .line 32
    iput-object p1, v2, Ll/mk30;->g:Lcom/p1/mobile/android/app/Frag;

    .line 33
    .line 34
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    iput-object p0, v2, Ll/mk30;->h:Lcom/p1/mobile/android/app/Act;

    .line 39
    .line 40
    return-void
.end method

.method private synthetic C()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/mk30;->b:Lv/VPullUpRecyclerView;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private N()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mk30;->b:Lv/VPullUpRecyclerView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v1, Ll/jk30;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/jk30;-><init>(Ll/mk30;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method private O()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mk30;->o:Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->m()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Ll/mk30;->o:Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public static synthetic a(Ll/mk30;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/mk30;->C()V

    return-void
.end method

.method public static synthetic b()Lcom/p1/mobile/putong/data/DbLinks;
    .locals 2

    .line 1
    sget-object v0, Ll/uqb0;->k0:Ll/vj5;

    .line 2
    .line 3
    iget-object v0, v0, Ll/vj5;->c:Ll/wzh0;

    .line 4
    .line 5
    const-string v1, "conversations"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/wzh0;->query(Ljava/lang/String;)Lcom/tantanapp/common/data/DbObject;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/p1/mobile/putong/data/DbLinks;

    .line 12
    .line 13
    return-object v0
.end method

.method public static synthetic c(Ll/mk30;Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mk30;->F(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic d(Ll/mk30;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/mk30;->J()V

    return-void
.end method

.method public static synthetic e(Ll/mk30;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mk30;->E(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic f(Ll/mk30;Lcom/p1/mobile/putong/data/DbLinks;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mk30;->G(Lcom/p1/mobile/putong/data/DbLinks;)V

    return-void
.end method

.method public static synthetic i(Ll/mk30;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mk30;->I(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic j(Ll/mk30;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mk30;->H(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic k(Ll/mk30;)Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mk30;->h:Lcom/p1/mobile/android/app/Act;

    return-object p0
.end method

.method public static bridge synthetic l(Ll/mk30;)Ll/mk30$e;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mk30;->i:Ll/mk30$e;

    return-object p0
.end method

.method public static bridge synthetic m(Ll/mk30;)Landroid/os/CountDownTimer;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mk30;->n:Landroid/os/CountDownTimer;

    return-object p0
.end method

.method public static bridge synthetic n(Ll/mk30;)Lcom/p1/mobile/android/app/Frag;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mk30;->g:Lcom/p1/mobile/android/app/Frag;

    return-object p0
.end method

.method public static bridge synthetic p(Ll/mk30;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/mk30;->l:Z

    return p0
.end method

.method public static bridge synthetic q(Ll/mk30;)Ll/dk30;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mk30;->k:Ll/dk30;

    return-object p0
.end method

.method public static bridge synthetic s(Ll/mk30;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mk30;->m:Ljava/util/List;

    return-object p0
.end method

.method public static bridge synthetic u(Ll/mk30;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/mk30;->l:Z

    return-void
.end method

.method public static bridge synthetic v(Ll/mk30;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/mk30;->M()V

    return-void
.end method

.method public static bridge synthetic w(Ll/mk30;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/mk30;->N()V

    return-void
.end method


# virtual methods
.method public final A()I
    .locals 2

    .line 1
    iget-object p0, p0, Ll/mk30;->b:Lv/VPullUpRecyclerView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    const/4 p0, -0x1

    .line 12
    return p0

    .line 13
    :cond_0
    invoke-virtual {p0}, Landroidx/recyclerview/widget/LinearLayoutManager;->findFirstVisibleItemPosition()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    invoke-virtual {p0}, Landroidx/recyclerview/widget/LinearLayoutManager;->findLastVisibleItemPosition()I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    add-int/lit8 v1, v0, 0x2

    .line 22
    .line 23
    if-le v1, p0, :cond_1

    .line 24
    .line 25
    return v0

    .line 26
    :cond_1
    return v1
.end method

.method public B(I)Z
    .locals 2

    .line 1
    iget-object p0, p0, Ll/mk30;->b:Lv/VPullUpRecyclerView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    if-nez p0, :cond_0

    .line 11
    .line 12
    return v0

    .line 13
    :cond_0
    invoke-virtual {p0}, Landroidx/recyclerview/widget/LinearLayoutManager;->findFirstVisibleItemPosition()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    invoke-virtual {p0}, Landroidx/recyclerview/widget/LinearLayoutManager;->findLastVisibleItemPosition()I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-lt p1, v1, :cond_1

    .line 22
    .line 23
    if-gt p1, p0, :cond_1

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_1
    return v0
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/mk30;->h:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic E(Ljava/lang/String;)V
    .locals 5

    .line 1
    const-string v0, "filtrate_tag"

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iget-object v2, p0, Ll/mk30;->k:Ll/dk30;

    .line 8
    .line 9
    iget-object v2, v2, Ll/dk30;->a:Ljava/util/Set;

    .line 10
    .line 11
    invoke-interface {v2, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    xor-int/lit8 v2, v2, 0x1

    .line 16
    .line 17
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    const-string v3, "tag_state"

    .line 22
    .line 23
    invoke-static {v3, v2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    filled-new-array {v1, v2}, [Ll/pf60;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    const-string v2, "e_fast_filtrate"

    .line 32
    .line 33
    const-string v3, "p_new_match"

    .line 34
    .line 35
    invoke-static {v2, v3, v1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 36
    .line 37
    .line 38
    iget-object v1, p0, Ll/mk30;->k:Ll/dk30;

    .line 39
    .line 40
    iget-object v1, v1, Ll/dk30;->a:Ljava/util/Set;

    .line 41
    .line 42
    invoke-interface {v1, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    iget-object v4, p0, Ll/mk30;->k:Ll/dk30;

    .line 47
    .line 48
    if-eqz v1, :cond_0

    .line 49
    .line 50
    iget-object v1, v4, Ll/dk30;->a:Ljava/util/Set;

    .line 51
    .line 52
    invoke-interface {v1, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_0
    iget-object v1, v4, Ll/dk30;->a:Ljava/util/Set;

    .line 57
    .line 58
    invoke-interface {v1, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    :goto_0
    iget-object p1, p0, Ll/mk30;->k:Ll/dk30;

    .line 62
    .line 63
    invoke-virtual {p1}, Ll/dk30;->m0()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    invoke-static {v0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    filled-new-array {p1}, [Ll/pf60;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-static {v2, v3, p1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 76
    .line 77
    .line 78
    iget-object p1, p0, Ll/mk30;->j:Ll/w76;

    .line 79
    .line 80
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 81
    .line 82
    .line 83
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    new-instance v0, Ll/ik30;

    .line 88
    .line 89
    invoke-direct {v0, p0}, Ll/ik30;-><init>(Ll/mk30;)V

    .line 90
    .line 91
    .line 92
    invoke-static {p1, v0}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 93
    .line 94
    .line 95
    iget-object p0, p0, Ll/mk30;->k:Ll/dk30;

    .line 96
    .line 97
    const/4 p1, 0x0

    .line 98
    invoke-virtual {p0, p1}, Ll/dk30;->r0(Z)V

    .line 99
    .line 100
    .line 101
    return-void
.end method

.method public final synthetic F(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mk30;->k:Ll/dk30;

    .line 2
    .line 3
    iget-object p0, p0, Ll/dk30;->a:Ljava/util/Set;

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final synthetic G(Lcom/p1/mobile/putong/data/DbLinks;)V
    .locals 1

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
    iget-object p1, p1, Lcom/p1/mobile/putong/data/DbLinks;->links:Lcom/p1/mobile/putong/data/Links;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-nez p1, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    const/4 p1, 0x0

    .line 19
    iput-boolean p1, p0, Ll/mk30;->q:Z

    .line 20
    .line 21
    invoke-direct {p0}, Ll/mk30;->O()V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Ll/mk30;->n:Landroid/os/CountDownTimer;

    .line 25
    .line 26
    invoke-virtual {p1}, Landroid/os/CountDownTimer;->cancel()V

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Ll/mk30;->n:Landroid/os/CountDownTimer;

    .line 30
    .line 31
    invoke-virtual {p0}, Landroid/os/CountDownTimer;->start()Landroid/os/CountDownTimer;

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public final synthetic H(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/mk30;->h:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 4
    .line 5
    sget-object p1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->v3(Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V

    .line 9
    .line 10
    .line 11
    const-string p0, "e_go_to_swipe"

    .line 12
    .line 13
    const-string p1, "p_new_match"

    .line 14
    .line 15
    invoke-static {p0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final synthetic I(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/mk30;->z()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/mk30;->K()V

    .line 5
    .line 6
    .line 7
    const-string p0, "e_reset_filtrate"

    .line 8
    .line 9
    const-string p1, "p_new_match"

    .line 10
    .line 11
    invoke-static {p0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic J()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/mk30;->A()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-ltz v0, :cond_2

    .line 6
    .line 7
    iget v1, p0, Ll/mk30;->p:I

    .line 8
    .line 9
    if-eq v1, v0, :cond_2

    .line 10
    .line 11
    iget-object v1, p0, Ll/mk30;->b:Lv/VPullUpRecyclerView;

    .line 12
    .line 13
    invoke-virtual {v1}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 18
    .line 19
    if-nez v1, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/LinearLayoutManager;->findViewByPosition(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;

    .line 27
    .line 28
    if-nez v1, :cond_1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    iput v0, p0, Ll/mk30;->p:I

    .line 32
    .line 33
    iput-object v1, p0, Ll/mk30;->o:Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;

    .line 34
    .line 35
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->l()V

    .line 36
    .line 37
    .line 38
    :cond_2
    :goto_0
    return-void
.end method

.method public K()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/mk30;->q:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/kk30;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/kk30;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-static {v0}, Lrx/c;->fromCallable(Ljava/util/concurrent/Callable;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const/4 v1, 0x1

    .line 15
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v1, Ll/lk30;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Ll/lk30;-><init>(Ll/mk30;)V

    .line 30
    .line 31
    .line 32
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_0
    invoke-direct {p0}, Ll/mk30;->O()V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Ll/mk30;->n:Landroid/os/CountDownTimer;

    .line 44
    .line 45
    invoke-virtual {v0}, Landroid/os/CountDownTimer;->cancel()V

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Ll/mk30;->n:Landroid/os/CountDownTimer;

    .line 49
    .line 50
    invoke-virtual {p0}, Landroid/os/CountDownTimer;->start()Landroid/os/CountDownTimer;

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public L(Ljava/util/List;Z)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/mk30;->i:Ll/mk30$e;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    new-instance v0, Ll/mk30$e;

    .line 7
    .line 8
    invoke-direct {v0, p0}, Ll/mk30$e;-><init>(Ll/mk30;)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Ll/mk30;->i:Ll/mk30$e;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->setHasStableIds(Z)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/mk30;->b:Lv/VPullUpRecyclerView;

    .line 17
    .line 18
    iget-object v2, p0, Ll/mk30;->i:Ll/mk30$e;

    .line 19
    .line 20
    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    iget-object v0, p0, Ll/mk30;->i:Ll/mk30$e;

    .line 24
    .line 25
    invoke-virtual {v0, p1, p2}, Ll/mk30$e;->O(Ljava/util/List;Z)V

    .line 26
    .line 27
    .line 28
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    const/4 v0, 0x0

    .line 33
    if-eqz p1, :cond_4

    .line 34
    .line 35
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 36
    .line 37
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 38
    .line 39
    iget-object p1, p1, Ll/dkb;->k3:Ll/vxd0;

    .line 40
    .line 41
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    check-cast p1, Ljava/lang/Integer;

    .line 46
    .line 47
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    if-eqz p1, :cond_2

    .line 52
    .line 53
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 54
    .line 55
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 56
    .line 57
    iget-object p1, p1, Ll/dkb;->l3:Ll/vxd0;

    .line 58
    .line 59
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    check-cast p1, Ljava/lang/Integer;

    .line 64
    .line 65
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    if-nez p1, :cond_1

    .line 70
    .line 71
    goto :goto_1

    .line 72
    :cond_1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 73
    .line 74
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 75
    .line 76
    iget-object p1, p1, Ll/dkb;->k3:Ll/vxd0;

    .line 77
    .line 78
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    check-cast p1, Ljava/lang/Integer;

    .line 83
    .line 84
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 85
    .line 86
    .line 87
    move-result p1

    .line 88
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 89
    .line 90
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 91
    .line 92
    iget-object v2, v2, Ll/dkb;->l3:Ll/vxd0;

    .line 93
    .line 94
    invoke-virtual {v2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    check-cast v2, Ljava/lang/Integer;

    .line 99
    .line 100
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 101
    .line 102
    .line 103
    move-result v2

    .line 104
    sub-int/2addr p1, v2

    .line 105
    const/high16 v2, 0x42300000    # 44.0f

    .line 106
    .line 107
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 108
    .line 109
    .line 110
    move-result v2

    .line 111
    :goto_0
    sub-int/2addr p1, v2

    .line 112
    goto :goto_2

    .line 113
    :cond_2
    :goto_1
    invoke-static {}, Ll/qa00;->c()Landroid/util/DisplayMetrics;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    iget p1, p1, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 118
    .line 119
    const/high16 v2, 0x43aa0000    # 340.0f

    .line 120
    .line 121
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 122
    .line 123
    .line 124
    move-result v2

    .line 125
    goto :goto_0

    .line 126
    :goto_2
    iget-object v2, p0, Ll/mk30;->c:Lv/VFrame;

    .line 127
    .line 128
    invoke-static {v2, p1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 129
    .line 130
    .line 131
    iget-object p1, p0, Ll/mk30;->c:Lv/VFrame;

    .line 132
    .line 133
    const/high16 v2, 0x42380000    # 46.0f

    .line 134
    .line 135
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 136
    .line 137
    .line 138
    move-result v2

    .line 139
    invoke-static {p1, v2}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 140
    .line 141
    .line 142
    iget-object p1, p0, Ll/mk30;->c:Lv/VFrame;

    .line 143
    .line 144
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 145
    .line 146
    .line 147
    iget-object p1, p0, Ll/mk30;->b:Lv/VPullUpRecyclerView;

    .line 148
    .line 149
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 150
    .line 151
    .line 152
    sget p1, Ll/dbc0;->T7:I

    .line 153
    .line 154
    new-instance v0, Ll/gk30;

    .line 155
    .line 156
    invoke-direct {v0, p0}, Ll/gk30;-><init>(Ll/mk30;)V

    .line 157
    .line 158
    .line 159
    const-string v2, "p_new_match"

    .line 160
    .line 161
    if-eqz p2, :cond_3

    .line 162
    .line 163
    sget p1, Ll/dbc0;->Gf:I

    .line 164
    .line 165
    new-instance v0, Ll/hk30;

    .line 166
    .line 167
    invoke-direct {v0, p0}, Ll/hk30;-><init>(Ll/mk30;)V

    .line 168
    .line 169
    .line 170
    const-string p2, "e_reset_filtrate"

    .line 171
    .line 172
    invoke-static {p2, v2}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 173
    .line 174
    .line 175
    const-string p2, "\u6ca1\u6709\u627e\u5230\u7b26\u5408\u6761\u4ef6\u7684\u914d\u5bf9\u597d\u53cb\n\u4f60\u53ef\u4ee5\u51cf\u5c11\u7b5b\u9009\u9879\u8bd5\u8bd5\u3002"

    .line 176
    .line 177
    const-string v2, "\u91cd\u7f6e\u7b5b\u9009"

    .line 178
    .line 179
    goto :goto_3

    .line 180
    :cond_3
    const-string p2, "e_go_to_swipe"

    .line 181
    .line 182
    invoke-static {p2, v2}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 183
    .line 184
    .line 185
    const-string p2, "\u6682\u65e0\u65b0\u914d\u5bf9\n\u53bb\u5212\u5361\u8ba4\u8bc6\u65b0\u670b\u53cb\u5427"

    .line 186
    .line 187
    const-string v2, "\u53bb\u5212\u5361"

    .line 188
    .line 189
    :goto_3
    iget-object v3, p0, Ll/mk30;->d:Landroid/view/View;

    .line 190
    .line 191
    invoke-virtual {v3, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 192
    .line 193
    .line 194
    iget-object p1, p0, Ll/mk30;->e:Lv/VText;

    .line 195
    .line 196
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 197
    .line 198
    .line 199
    iget-object p1, p0, Ll/mk30;->f:Lv/VText;

    .line 200
    .line 201
    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 202
    .line 203
    .line 204
    iget-object p1, p0, Ll/mk30;->f:Lv/VText;

    .line 205
    .line 206
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 207
    .line 208
    .line 209
    iget-object p1, p0, Ll/mk30;->f:Lv/VText;

    .line 210
    .line 211
    invoke-virtual {p1}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 212
    .line 213
    .line 214
    move-result-object p1

    .line 215
    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 216
    .line 217
    .line 218
    goto :goto_4

    .line 219
    :cond_4
    iget-object p1, p0, Ll/mk30;->c:Lv/VFrame;

    .line 220
    .line 221
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 222
    .line 223
    .line 224
    iget-object p1, p0, Ll/mk30;->b:Lv/VPullUpRecyclerView;

    .line 225
    .line 226
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 227
    .line 228
    .line 229
    :goto_4
    iget-object p1, p0, Ll/mk30;->j:Ll/w76;

    .line 230
    .line 231
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 232
    .line 233
    .line 234
    iget p1, p0, Ll/mk30;->p:I

    .line 235
    .line 236
    if-ltz p1, :cond_6

    .line 237
    .line 238
    iget-object p2, p0, Ll/mk30;->o:Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;

    .line 239
    .line 240
    if-eqz p2, :cond_6

    .line 241
    .line 242
    iget-object p2, p0, Ll/mk30;->i:Ll/mk30$e;

    .line 243
    .line 244
    invoke-virtual {p2, p1}, Ll/mk30$e;->J(I)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 245
    .line 246
    .line 247
    move-result-object p1

    .line 248
    if-eqz p1, :cond_5

    .line 249
    .line 250
    iget-object p2, p0, Ll/mk30;->o:Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;

    .line 251
    .line 252
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->n()Lcom/p1/mobile/putong/data/User;

    .line 253
    .line 254
    .line 255
    move-result-object p2

    .line 256
    if-eqz p2, :cond_5

    .line 257
    .line 258
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 259
    .line 260
    iget-object p2, p0, Ll/mk30;->o:Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;

    .line 261
    .line 262
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->n()Lcom/p1/mobile/putong/data/User;

    .line 263
    .line 264
    .line 265
    move-result-object p2

    .line 266
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 267
    .line 268
    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 269
    .line 270
    .line 271
    move-result p1

    .line 272
    if-nez p1, :cond_6

    .line 273
    .line 274
    :cond_5
    const/4 p1, -0x1

    .line 275
    iput p1, p0, Ll/mk30;->p:I

    .line 276
    .line 277
    const/4 p1, 0x0

    .line 278
    iput-object p1, p0, Ll/mk30;->o:Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;

    .line 279
    .line 280
    :cond_6
    invoke-virtual {p0}, Ll/mk30;->K()V

    .line 281
    .line 282
    .line 283
    return-void
.end method

.method public final M()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mk30;->o:Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->k()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Ll/mk30;->o:Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;

    .line 10
    .line 11
    :cond_0
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
    check-cast p1, Ll/dk30;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/mk30;->y(Ll/dk30;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/mk30;->x(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0}, Ll/mk30;->r()V

    .line 6
    .line 7
    .line 8
    return-object p1
.end method

.method public r()V
    .locals 6

    .line 1
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 2
    .line 3
    iget-object v1, p0, Ll/mk30;->h:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;->setOrientation(I)V

    .line 10
    .line 11
    .line 12
    iget-object v2, p0, Ll/mk30;->a:Lv/VRecyclerView;

    .line 13
    .line 14
    invoke-virtual {v2, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/mk30;->a:Lv/VRecyclerView;

    .line 18
    .line 19
    new-instance v2, Ll/mk30$b;

    .line 20
    .line 21
    invoke-direct {v2, p0}, Ll/mk30$b;-><init>(Ll/mk30;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 25
    .line 26
    .line 27
    new-instance v0, Ll/w76;

    .line 28
    .line 29
    new-instance v2, Ll/ek30;

    .line 30
    .line 31
    invoke-direct {v2, p0}, Ll/ek30;-><init>(Ll/mk30;)V

    .line 32
    .line 33
    .line 34
    new-instance v3, Ll/fk30;

    .line 35
    .line 36
    invoke-direct {v3, p0}, Ll/fk30;-><init>(Ll/mk30;)V

    .line 37
    .line 38
    .line 39
    invoke-direct {v0, v2, v3}, Ll/w76;-><init>(Ll/y20;Ll/qcj;)V

    .line 40
    .line 41
    .line 42
    iput-object v0, p0, Ll/mk30;->j:Ll/w76;

    .line 43
    .line 44
    const-string v0, "active"

    .line 45
    .line 46
    const-string v2, "picture"

    .line 47
    .line 48
    const-string v3, "nearby"

    .line 49
    .line 50
    filled-new-array {v3, v0, v2}, [Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    const-string v2, "\u6700\u8fd1\u6d3b\u8dc3"

    .line 55
    .line 56
    const-string v3, "\u5934\u50cf\u8ba4\u8bc1"

    .line 57
    .line 58
    const-string v4, "\u9644\u8fd1"

    .line 59
    .line 60
    filled-new-array {v4, v2, v3}, [Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    new-instance v3, Ljava/util/ArrayList;

    .line 65
    .line 66
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 67
    .line 68
    .line 69
    :goto_0
    const/4 v4, 0x3

    .line 70
    if-ge v1, v4, :cond_0

    .line 71
    .line 72
    invoke-static {}, Lcom/p1/mobile/putong/core/data/LabelParams;->new_()Lcom/p1/mobile/putong/core/data/LabelParams;

    .line 73
    .line 74
    .line 75
    move-result-object v4

    .line 76
    aget-object v5, v0, v1

    .line 77
    .line 78
    iput-object v5, v4, Lcom/p1/mobile/putong/core/data/LabelParams;->key:Ljava/lang/String;

    .line 79
    .line 80
    aget-object v5, v2, v1

    .line 81
    .line 82
    iput-object v5, v4, Lcom/p1/mobile/putong/core/data/LabelParams;->value:Ljava/lang/String;

    .line 83
    .line 84
    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    add-int/lit8 v1, v1, 0x1

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_0
    iget-object v0, p0, Ll/mk30;->j:Ll/w76;

    .line 91
    .line 92
    invoke-virtual {v0, v3}, Ll/w76;->J(Ljava/util/List;)V

    .line 93
    .line 94
    .line 95
    iget-object v0, p0, Ll/mk30;->a:Lv/VRecyclerView;

    .line 96
    .line 97
    iget-object v1, p0, Ll/mk30;->j:Ll/w76;

    .line 98
    .line 99
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 100
    .line 101
    .line 102
    new-instance v0, Ll/mk30$c;

    .line 103
    .line 104
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    const/4 v2, 0x2

    .line 109
    invoke-direct {v0, p0, v1, v2}, Ll/mk30$c;-><init>(Ll/mk30;Landroid/content/Context;I)V

    .line 110
    .line 111
    .line 112
    iget-object v1, p0, Ll/mk30;->b:Lv/VPullUpRecyclerView;

    .line 113
    .line 114
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 115
    .line 116
    .line 117
    iget-object v0, p0, Ll/mk30;->b:Lv/VPullUpRecyclerView;

    .line 118
    .line 119
    new-instance v1, Ll/mk30$d;

    .line 120
    .line 121
    invoke-direct {v1, p0}, Ll/mk30$d;-><init>(Ll/mk30;)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->addOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$t;)V

    .line 125
    .line 126
    .line 127
    return-void
.end method

.method public x(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/sk30;->b(Ll/mk30;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public y(Ll/dk30;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/mk30;->k:Ll/dk30;

    .line 2
    .line 3
    return-void
.end method

.method public z()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/mk30;->k:Ll/dk30;

    .line 2
    .line 3
    iget-object v0, v0, Ll/dk30;->a:Ljava/util/Set;

    .line 4
    .line 5
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget-object v1, p0, Ll/mk30;->k:Ll/dk30;

    .line 10
    .line 11
    invoke-virtual {v1}, Ll/dk30;->k0()V

    .line 12
    .line 13
    .line 14
    iget-object v1, p0, Ll/mk30;->j:Ll/w76;

    .line 15
    .line 16
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    iget-object v1, p0, Ll/mk30;->j:Ll/w76;

    .line 23
    .line 24
    invoke-virtual {v1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 25
    .line 26
    .line 27
    :cond_0
    iget-object v1, p0, Ll/mk30;->k:Ll/dk30;

    .line 28
    .line 29
    iget-object v1, v1, Ll/dk30;->e:Lrx/subjects/a;

    .line 30
    .line 31
    sget-object v2, Ll/uxj0;->a:Ll/uxj0;

    .line 32
    .line 33
    invoke-virtual {v1, v2}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    if-nez v0, :cond_1

    .line 37
    .line 38
    iget-object p0, p0, Ll/mk30;->b:Lv/VPullUpRecyclerView;

    .line 39
    .line 40
    const/4 v0, 0x0

    .line 41
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V

    .line 42
    .line 43
    .line 44
    :cond_1
    return-void
.end method
