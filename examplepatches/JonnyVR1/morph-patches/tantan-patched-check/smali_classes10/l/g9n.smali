.class public Ll/g9n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/c9n;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

.field public final b:Landroid/view/View;

.field public c:Ll/c9n;


# direct methods
.method public constructor <init>(Lv/VFrame;Landroid/view/View;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-static {v0}, Ll/g9n;->e(Landroid/content/Context;)Lv/VRecyclerView;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    new-instance v2, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 13
    .line 14
    const/4 v3, 0x0

    .line 15
    invoke-direct {v2, v0, v3, v3}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 19
    .line 20
    .line 21
    new-instance v0, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 22
    .line 23
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Ll/g9n;->a:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 27
    .line 28
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 29
    .line 30
    .line 31
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 32
    .line 33
    sget v2, Ll/bnl0;->f:I

    .line 34
    .line 35
    invoke-direct {v0, v2, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 36
    .line 37
    .line 38
    const/high16 v2, 0x41700000    # 15.0f

    .line 39
    .line 40
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    iput v2, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 45
    .line 46
    const/16 v2, 0x30

    .line 47
    .line 48
    iput v2, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 49
    .line 50
    const/high16 v2, 0x41880000    # 17.0f

    .line 51
    .line 52
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    iput v2, v0, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 57
    .line 58
    invoke-virtual {p1, v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 59
    .line 60
    .line 61
    iput-object p2, p0, Ll/g9n;->b:Landroid/view/View;

    .line 62
    .line 63
    return-void
.end method

.method public static synthetic a(Ll/g9n;Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;Ljava/util/ArrayList;Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/g9n;->i(Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;Ljava/util/ArrayList;Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;)V

    return-void
.end method

.method public static synthetic b(Ll/y8n;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/y8n;->b:Z

    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Ll/g9n;Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;Ljava/util/ArrayList;Ll/y8n;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/g9n;->f(Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;Ljava/util/ArrayList;Ll/y8n;Landroid/view/View;)V

    return-void
.end method

.method public static e(Landroid/content/Context;)Lv/VRecyclerView;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    new-instance v0, Lv/VRecyclerView;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lv/VRecyclerView;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    new-instance p0, Ll/g9n$a;

    .line 7
    .line 8
    invoke-direct {p0}, Ll/g9n$a;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public d(Ll/c9n;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/g9n;->c:Ll/c9n;

    .line 2
    .line 3
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic f(Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;Ljava/util/ArrayList;Ll/y8n;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p4, p0, Ll/g9n;->c:Ll/c9n;

    .line 2
    .line 3
    invoke-virtual {p4, p1}, Ll/c9n;->W3(Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;->status:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItemStatus;

    .line 7
    .line 8
    const-string p4, "locked"

    .line 9
    .line 10
    invoke-static {p1, p4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-nez p1, :cond_0

    .line 15
    .line 16
    new-instance p1, Ll/f9n;

    .line 17
    .line 18
    invoke-direct {p1}, Ll/f9n;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-static {p2, p1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 22
    .line 23
    .line 24
    const/4 p1, 0x1

    .line 25
    iput-boolean p1, p3, Ll/y8n;->b:Z

    .line 26
    .line 27
    iget-object p0, p0, Ll/g9n;->a:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 28
    .line 29
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public final synthetic i(Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;Ljava/util/ArrayList;Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;)V
    .locals 2

    .line 1
    new-instance v0, Ll/y8n;

    .line 2
    .line 3
    invoke-direct {v0, p3}, Ll/y8n;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;)V

    .line 4
    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    iget-object v1, p3, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;->id:Ljava/lang/String;

    .line 9
    .line 10
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;->id:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {v1, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    const/4 p1, 0x1

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 p1, 0x0

    .line 21
    :goto_0
    iput-boolean p1, v0, Ll/y8n;->b:Z

    .line 22
    .line 23
    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    iget-boolean p1, v0, Ll/y8n;->b:Z

    .line 27
    .line 28
    if-eqz p1, :cond_1

    .line 29
    .line 30
    iget-object p1, p0, Ll/g9n;->c:Ll/c9n;

    .line 31
    .line 32
    iput-object p3, p1, Ll/c9n;->k:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;

    .line 33
    .line 34
    invoke-virtual {p1}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->ChatEvent:Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;

    .line 39
    .line 40
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;->onDanmakuSelectedItemChange()Ll/v3f$d;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {p1, p3}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 45
    .line 46
    .line 47
    :cond_1
    new-instance p1, Ll/e9n;

    .line 48
    .line 49
    invoke-direct {p1, p0, p3, p2, v0}, Ll/e9n;-><init>(Ll/g9n;Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;Ljava/util/ArrayList;Ll/y8n;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0, p1}, Ll/d3q;->A(Landroid/view/View$OnClickListener;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/c9n;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/g9n;->d(Ll/c9n;)V

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

.method public j(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;",
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
    iget-object v1, p0, Ll/g9n;->b:Landroid/view/View;

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
    new-instance v0, Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 21
    .line 22
    .line 23
    iget-object v1, p0, Ll/g9n;->c:Ll/c9n;

    .line 24
    .line 25
    iget-object v1, v1, Ll/c9n;->k:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;

    .line 26
    .line 27
    new-instance v2, Ll/d9n;

    .line 28
    .line 29
    invoke-direct {v2, p0, v1, v0}, Ll/d9n;-><init>(Ll/g9n;Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;Ljava/util/ArrayList;)V

    .line 30
    .line 31
    .line 32
    invoke-static {p1, v2}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Ll/g9n;->a:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 36
    .line 37
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Z(Ljava/util/List;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method
