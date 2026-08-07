.class public Lcom/p1/mobile/putong/live/livingroom/virtual/chat/VirtualChatInputTipsView;
.super Lcom/p1/mobile/putong/live/base/view/LiveFadeRecyclerView;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/live/base/view/LiveFadeRecyclerView;",
        "Ll/iam<",
        "Ll/zxl0;",
        ">;"
    }
.end annotation


# static fields
.field public static k:Ljava/lang/String; = "fixed_bottom"

.field public static l:Ljava/lang/String; = "chat_input"


# instance fields
.field public f:Lcom/p1/mobile/putong/live/livingroom/virtual/chat/VirtualChatInputTipsView;

.field public g:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

.field public h:Landroidx/recyclerview/widget/LinearLayoutManager;

.field public i:Ll/zxl0;

.field public j:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/base/view/LiveFadeRecyclerView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/HashSet;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/chat/VirtualChatInputTipsView;->j:Ljava/util/HashSet;

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 12
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/view/LiveFadeRecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 13
    new-instance p1, Ljava/util/HashSet;

    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/chat/VirtualChatInputTipsView;->j:Ljava/util/HashSet;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 14
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/base/view/LiveFadeRecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 15
    new-instance p1, Ljava/util/HashSet;

    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/chat/VirtualChatInputTipsView;->j:Ljava/util/HashSet;

    return-void
.end method

.method public static synthetic I(Lcom/p1/mobile/putong/live/livingroom/virtual/chat/VirtualChatInputTipsView;Ll/y20;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/virtual/chat/VirtualChatInputTipsView;->P(Ll/y20;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic J(Lcom/p1/mobile/putong/live/livingroom/virtual/chat/VirtualChatInputTipsView;Ljava/lang/String;Ll/y20;Ljava/util/List;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/live/livingroom/virtual/chat/VirtualChatInputTipsView;->Q(Ljava/lang/String;Ll/y20;Ljava/util/List;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic K(Lcom/p1/mobile/putong/live/livingroom/virtual/chat/VirtualChatInputTipsView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/chat/VirtualChatInputTipsView;->U()V

    return-void
.end method

.method public static bridge synthetic L(Lcom/p1/mobile/putong/live/livingroom/virtual/chat/VirtualChatInputTipsView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/chat/VirtualChatInputTipsView;->U()V

    return-void
.end method

.method private U()V
    .locals 6

    .line 1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/chat/VirtualChatInputTipsView;->i:Ll/zxl0;

    .line 8
    .line 9
    if-eqz v0, :cond_2

    .line 10
    .line 11
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 16
    .line 17
    invoke-virtual {v0}, Landroidx/recyclerview/widget/LinearLayoutManager;->findFirstVisibleItemPosition()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    invoke-virtual {v0}, Landroidx/recyclerview/widget/LinearLayoutManager;->findLastVisibleItemPosition()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/chat/VirtualChatInputTipsView;->g:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 26
    .line 27
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->getItemCount()I

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-ltz v1, :cond_2

    .line 32
    .line 33
    if-lt v0, v2, :cond_0

    .line 34
    .line 35
    goto :goto_1

    .line 36
    :cond_0
    :goto_0
    if-gt v1, v0, :cond_2

    .line 37
    .line 38
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/chat/VirtualChatInputTipsView;->j:Ljava/util/HashSet;

    .line 39
    .line 40
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    invoke-virtual {v2, v3}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    if-nez v2, :cond_1

    .line 49
    .line 50
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/chat/VirtualChatInputTipsView;->g:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 51
    .line 52
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->J()Ljava/util/List;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    check-cast v2, Ll/eyl0;

    .line 61
    .line 62
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/chat/VirtualChatInputTipsView;->i:Ll/zxl0;

    .line 63
    .line 64
    invoke-virtual {v3}, Ll/xzs;->E2()Ll/oo2;

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    check-cast v3, Ll/jqm0;

    .line 69
    .line 70
    invoke-virtual {v3}, Ll/rwn0;->p()Z

    .line 71
    .line 72
    .line 73
    move-result v3

    .line 74
    invoke-static {v3}, Ll/jkp0;->f(Z)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v3

    .line 78
    const-string v4, "message_content"

    .line 79
    .line 80
    iget-object v2, v2, Ll/eyl0;->b:Ljava/lang/String;

    .line 81
    .line 82
    invoke-static {v4, v2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/chat/VirtualChatInputTipsView;->i:Ll/zxl0;

    .line 87
    .line 88
    invoke-static {v4}, Ll/i9o0;->l(Ll/i6t;)Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v4

    .line 92
    const-string v5, "user_type"

    .line 93
    .line 94
    invoke-static {v5, v4}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 95
    .line 96
    .line 97
    move-result-object v4

    .line 98
    filled-new-array {v2, v4}, [Ll/pf60;

    .line 99
    .line 100
    .line 101
    move-result-object v2

    .line 102
    const-string v4, "e_audio_shortcut_msg"

    .line 103
    .line 104
    invoke-static {v4, v3, v2}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 105
    .line 106
    .line 107
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/chat/VirtualChatInputTipsView;->j:Ljava/util/HashSet;

    .line 108
    .line 109
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 110
    .line 111
    .line 112
    move-result-object v3

    .line 113
    invoke-virtual {v2, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 117
    .line 118
    goto :goto_0

    .line 119
    :cond_2
    :goto_1
    return-void
.end method

.method private r()V
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/virtual/chat/VirtualChatInputTipsView$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/chat/VirtualChatInputTipsView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/virtual/chat/VirtualChatInputTipsView;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 7
    .line 8
    .line 9
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    const/4 v2, 0x0

    .line 16
    invoke-direct {v0, v1, v2, v2}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/chat/VirtualChatInputTipsView;->h:Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 22
    .line 23
    .line 24
    new-instance v0, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 25
    .line 26
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;-><init>()V

    .line 27
    .line 28
    .line 29
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/chat/VirtualChatInputTipsView;->g:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 30
    .line 31
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    return-object p0
.end method

.method public final M(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/dyl0;->a(Lcom/p1/mobile/putong/live/livingroom/virtual/chat/VirtualChatInputTipsView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public N(Ll/zxl0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/chat/VirtualChatInputTipsView;->i:Ll/zxl0;

    .line 2
    .line 3
    return-void
.end method

.method public O()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic P(Ll/y20;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/virtual/chat/VirtualChatInputTipsView;->R(Ll/y20;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic Q(Ljava/lang/String;Ll/y20;Ljava/util/List;Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Ll/eyl0;

    .line 2
    .line 3
    invoke-direct {v0, p4, p1}, Ll/eyl0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance p1, Ll/cyl0;

    .line 7
    .line 8
    invoke-direct {p1, p0, p2, p4}, Ll/cyl0;-><init>(Lcom/p1/mobile/putong/live/livingroom/virtual/chat/VirtualChatInputTipsView;Ll/y20;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ll/d3q;->A(Landroid/view/View$OnClickListener;)V

    .line 12
    .line 13
    .line 14
    invoke-interface {p3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final R(Ll/y20;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-interface {p1, p2}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/chat/VirtualChatInputTipsView;->f:Lcom/p1/mobile/putong/live/livingroom/virtual/chat/VirtualChatInputTipsView;

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final S()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->clearOnScrollListeners()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/virtual/chat/VirtualChatInputTipsView$b;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/chat/VirtualChatInputTipsView$b;-><init>(Lcom/p1/mobile/putong/live/livingroom/virtual/chat/VirtualChatInputTipsView;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->addOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$t;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public T(Ljava/util/List;Ljava/lang/String;Ll/y20;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Ljava/lang/String;",
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
    if-nez v0, :cond_1

    .line 6
    .line 7
    new-instance v0, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 10
    .line 11
    .line 12
    new-instance v1, Ll/ayl0;

    .line 13
    .line 14
    invoke-direct {v1, p0, p2, p3, v0}, Ll/ayl0;-><init>(Lcom/p1/mobile/putong/live/livingroom/virtual/chat/VirtualChatInputTipsView;Ljava/lang/String;Ll/y20;Ljava/util/List;)V

    .line 15
    .line 16
    .line 17
    invoke-static {p1, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/chat/VirtualChatInputTipsView;->g:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 21
    .line 22
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Z(Ljava/util/List;)V

    .line 23
    .line 24
    .line 25
    sget-object p1, Lcom/p1/mobile/putong/live/livingroom/virtual/chat/VirtualChatInputTipsView;->k:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-eqz p1, :cond_0

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/chat/VirtualChatInputTipsView;->S()V

    .line 34
    .line 35
    .line 36
    :cond_0
    new-instance p1, Ll/byl0;

    .line 37
    .line 38
    invoke-direct {p1, p0}, Ll/byl0;-><init>(Lcom/p1/mobile/putong/live/livingroom/virtual/chat/VirtualChatInputTipsView;)V

    .line 39
    .line 40
    .line 41
    invoke-static {p1}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 42
    .line 43
    .line 44
    const/4 p1, 0x1

    .line 45
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_1
    const/4 p1, 0x0

    .line 50
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/zxl0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/chat/VirtualChatInputTipsView;->N(Ll/zxl0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/chat/VirtualChatInputTipsView;->M(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/chat/VirtualChatInputTipsView;->r()V

    .line 8
    .line 9
    .line 10
    return-void
.end method
