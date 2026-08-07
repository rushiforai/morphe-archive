.class public Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView;
.super Lv/VLinear;
.source "SourceFile"


# instance fields
.field public c:Lv/VLinear;

.field public d:Landroid/widget/TextView;

.field public e:Lv/VRecyclerView;

.field public f:Lcom/p1/mobile/putong/app/PutongFrag;

.field public g:Ll/jgk;

.field public h:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/Group;",
            ">;"
        }
    .end annotation
.end field

.field public i:Ll/h80;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lv/VLinear;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView$a;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView$a;-><init>(Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView;->i:Ll/h80;

    .line 10
    .line 11
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView;->Y(Landroid/content/Context;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 15
    invoke-direct {p0, p1, p2}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 16
    new-instance p2, Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView$a;

    invoke-direct {p2, p0}, Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView$a;-><init>(Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView;)V

    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView;->i:Ll/h80;

    .line 17
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView;->Y(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 18
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 19
    new-instance p2, Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView$a;

    invoke-direct {p2, p0}, Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView$a;-><init>(Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView;)V

    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView;->i:Ll/h80;

    .line 20
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView;->Y(Landroid/content/Context;)V

    return-void
.end method

.method public static synthetic P(Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView;->a0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic Q(Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView;Landroid/content/Context;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView;->b0(Landroid/content/Context;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic R(Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView;->Z(Ljava/util/List;)V

    return-void
.end method

.method public static bridge synthetic S(Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView;->getCircleSource()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic T(Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView;->getPageId()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private Y(Landroid/content/Context;)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    invoke-virtual {p0, v1, v0, v1, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {p0, v0, p0}, Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView;->V(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView;->c:Lv/VLinear;

    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView;->d:Landroid/widget/TextView;

    .line 23
    .line 24
    new-instance v1, Ll/j6h;

    .line 25
    .line 26
    invoke-direct {v1, p0, p1}, Ll/j6h;-><init>(Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView;Landroid/content/Context;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method private synthetic b0(Landroid/content/Context;Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView;->f:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView;->h:Ljava/util/List;

    .line 4
    .line 5
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView;->h:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    check-cast p0, Lcom/p1/mobile/putong/feed/data/Group;

    .line 19
    .line 20
    iget-boolean p0, p0, Lcom/p1/mobile/putong/feed/data/Group;->joined:Z

    .line 21
    .line 22
    if-eqz p0, :cond_0

    .line 23
    .line 24
    const/4 v1, 0x1

    .line 25
    :cond_0
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/feed/newui/group/allgroup/AllGroupAct;->X1(Landroid/content/Context;Z)Landroid/content/Intent;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p2, p0}, Landroidx/fragment/app/Fragment;->startActivity(Landroid/content/Intent;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method private getCircleSource()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Ll/cmg;->s()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const-string p0, "dating"

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-interface {p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    if-eqz p0, :cond_1

    .line 29
    .line 30
    const-string p0, "recommend"

    .line 31
    .line 32
    return-object p0

    .line 33
    :cond_1
    const-string p0, "nearby"

    .line 34
    .line 35
    return-object p0
.end method

.method private getPageId()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {}, Ll/cmg;->s()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const-string p0, "p_discover_dating"

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    const-string p0, "p_nearby"

    .line 11
    .line 12
    return-object p0
.end method

.method private r()V
    .locals 3

    .line 1
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;->setOrientation(I)V

    .line 12
    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView;->e:Lv/VRecyclerView;

    .line 15
    .line 16
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 17
    .line 18
    .line 19
    new-instance v0, Ll/jgk;

    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    check-cast v1, Lcom/p1/mobile/android/app/Act;

    .line 26
    .line 27
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView;->i:Ll/h80;

    .line 28
    .line 29
    invoke-direct {v0, v1, v2}, Ll/jgk;-><init>(Lcom/p1/mobile/android/app/Act;Ll/h80;)V

    .line 30
    .line 31
    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView;->g:Ll/jgk;

    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView;->e:Lv/VRecyclerView;

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method


# virtual methods
.method public V(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/k6h;->b(Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final W(Ljava/lang/Class;Landroid/view/View;)Landroid/view/View;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroid/view/View;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;",
            "Landroid/view/View;",
            ")TT;"
        }
    .end annotation

    .line 1
    invoke-virtual {p1, p2}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-object p2

    .line 8
    :cond_0
    instance-of v0, p2, Landroid/view/ViewGroup;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    if-eqz v0, :cond_4

    .line 12
    .line 13
    check-cast p2, Landroid/view/ViewGroup;

    .line 14
    .line 15
    invoke-virtual {p2}, Landroid/view/ViewGroup;->getChildCount()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    const/4 v2, 0x0

    .line 20
    :goto_0
    if-ge v2, v0, :cond_4

    .line 21
    .line 22
    invoke-virtual {p2, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    invoke-virtual {p1, v3}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v4

    .line 30
    if-eqz v4, :cond_1

    .line 31
    .line 32
    move-object v1, v3

    .line 33
    goto :goto_1

    .line 34
    :cond_1
    instance-of v4, v3, Landroid/view/ViewGroup;

    .line 35
    .line 36
    if-eqz v4, :cond_2

    .line 37
    .line 38
    invoke-virtual {p0, p1, v3}, Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView;->W(Ljava/lang/Class;Landroid/view/View;)Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    :cond_2
    :goto_1
    if-eqz v1, :cond_3

    .line 43
    .line 44
    return-object v1

    .line 45
    :cond_3
    add-int/lit8 v2, v2, 0x1

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_4
    return-object v1
.end method

.method public X(Lcom/p1/mobile/putong/app/PutongFrag;)V
    .locals 3

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView;->f:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 4
    .line 5
    const-string v1, "recommend"

    .line 6
    .line 7
    const/16 v2, 0x64

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2}, Ll/jka;->q7(Ljava/lang/String;I)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p1}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    new-instance v0, Ll/h6h;

    .line 22
    .line 23
    invoke-direct {v0, p0}, Ll/h6h;-><init>(Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView;)V

    .line 24
    .line 25
    .line 26
    new-instance v1, Ll/i6h;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Ll/i6h;-><init>(Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView;)V

    .line 29
    .line 30
    .line 31
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final synthetic Z(Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView;->c0(Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic a0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    new-instance p1, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView;->c0(Ljava/util/List;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public c0(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/Group;",
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
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView;->c:Lv/VLinear;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    invoke-static {v1, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const/4 v0, 0x1

    .line 15
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView;->h:Ljava/util/List;

    .line 19
    .line 20
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView;->r()V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView;->g:Ll/jgk;

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Ll/jgk;->N(Ljava/util/List;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method
