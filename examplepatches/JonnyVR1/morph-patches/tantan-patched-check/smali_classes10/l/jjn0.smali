.class public Ll/jjn0;
.super Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder<",
        "Ll/yin0;",
        ">;"
    }
.end annotation


# instance fields
.field public k:Lv/VText;

.field public l:Lv/VDraweeView;

.field public m:Lv/VDraweeView;

.field public n:Landroidx/recyclerview/widget/RecyclerView;

.field public o:Lv/VText;

.field public p:Landroidx/recyclerview/widget/RecyclerView;

.field public q:Landroid/view/View;

.field public r:Landroid/view/View;

.field public s:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

.field public t:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

.field public u:Lcom/p1/mobile/putong/live/base/data/BLiveBossGiftRecord;


# direct methods
.method public constructor <init>(Ll/yin0;)V
    .locals 3

    .line 1
    sget v0, Ll/yec0;->I8:I

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const/4 v2, 0x1

    .line 8
    invoke-static {v2}, Ll/qag0;->e(Z)Ll/rq2;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-direct {p0, v0, v1, p1, v2}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;-><init>(ILcom/p1/mobile/android/app/Act;Ll/y8s;Ll/rq2;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static synthetic F(Ll/jjn0;Lcom/p1/mobile/putong/live/base/data/BLiveBossCallDetail;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/jjn0;->R(Lcom/p1/mobile/putong/live/base/data/BLiveBossCallDetail;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic G(Ll/jjn0;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jjn0;->O(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic H(Ll/jjn0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/jjn0;->P(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic I(Ll/jjn0;Ljava/util/ArrayList;Lcom/p1/mobile/putong/live/base/data/BLiveBossGift;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/jjn0;->S(Ljava/util/ArrayList;Lcom/p1/mobile/putong/live/base/data/BLiveBossGift;)V

    return-void
.end method

.method public static synthetic J(Ll/jjn0;Ljava/util/ArrayList;Lcom/p1/mobile/putong/live/base/data/BLiveBossGift;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/jjn0;->T(Ljava/util/ArrayList;Lcom/p1/mobile/putong/live/base/data/BLiveBossGift;)V

    return-void
.end method

.method public static synthetic K(Ll/jjn0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/jjn0;->Q(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic L(Lcom/p1/mobile/putong/live/base/data/BLiveBossCallDetail;Ll/d3q;)V
    .locals 1

    .line 1
    instance-of v0, p1, Ll/exj;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Ll/exj;

    .line 6
    .line 7
    iget-object v0, p1, Ll/exj;->a:Lcom/p1/mobile/putong/live/base/data/BLiveBossCallDetail;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBossCallDetail;->userId:Ljava/lang/String;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBossCallDetail;->userId:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    iput-boolean p0, p1, Ll/exj;->b:Z

    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method private M()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/jjn0;->p:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/jjn0;->n:Landroidx/recyclerview/widget/RecyclerView;

    .line 10
    .line 11
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/jjn0;->m:Lv/VDraweeView;

    .line 15
    .line 16
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Ll/jjn0;->o:Lv/VText;

    .line 20
    .line 21
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method private N(Landroid/view/View;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/jjn0;->l:Lv/VDraweeView;

    .line 2
    .line 3
    const-string v1, "https://fe-static.tancdn.com/v1/images/eyJpZCI6IkZYRVFXMzREMlZSM083MkJJR1FMWklBTEJGT1NCRTEyIiwidyI6OTYsImgiOjk2LCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6MzA5MTM1NTM3NDY5MjAwOTAwfQ.png"

    .line 4
    .line 5
    const-string v2, "context_single_room"

    .line 6
    .line 7
    invoke-static {v2, v0, v1}, Ll/izs;->o(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/jjn0;->m:Lv/VDraweeView;

    .line 11
    .line 12
    const-string v1, "https://fe-static.tancdn.com/v1/images/eyJpZCI6IlJFWEFMM1NCTEZMUktWTkxDS0xCT1lMMldSVjZZWTEzIiwidyI6OTYsImgiOjk2LCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6MjMwNjg3MDI1NDYzNTAwOH0.webp"

    .line 13
    .line 14
    invoke-static {v2, v0, v1}, Ll/izs;->o(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/jjn0;->n:Landroidx/recyclerview/widget/RecyclerView;

    .line 18
    .line 19
    new-instance v1, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 20
    .line 21
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    const/4 v3, 0x0

    .line 26
    invoke-direct {v1, v2, v3, v3}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 30
    .line 31
    .line 32
    new-instance v0, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 33
    .line 34
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;-><init>()V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Ll/jjn0;->s:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 38
    .line 39
    iget-object v1, p0, Ll/jjn0;->n:Landroidx/recyclerview/widget/RecyclerView;

    .line 40
    .line 41
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 42
    .line 43
    .line 44
    new-instance v0, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 45
    .line 46
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;-><init>()V

    .line 47
    .line 48
    .line 49
    iput-object v0, p0, Ll/jjn0;->t:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 50
    .line 51
    iget-object v0, p0, Ll/jjn0;->p:Landroidx/recyclerview/widget/RecyclerView;

    .line 52
    .line 53
    new-instance v1, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 54
    .line 55
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    const/4 v2, 0x1

    .line 60
    invoke-direct {v1, p1, v2, v3}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 64
    .line 65
    .line 66
    iget-object p1, p0, Ll/jjn0;->p:Landroidx/recyclerview/widget/RecyclerView;

    .line 67
    .line 68
    iget-object v0, p0, Ll/jjn0;->t:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 69
    .line 70
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 71
    .line 72
    .line 73
    iget-object p1, p0, Ll/jjn0;->t:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 74
    .line 75
    new-instance v0, Ll/zin0;

    .line 76
    .line 77
    invoke-direct {v0, p0}, Ll/zin0;-><init>(Ll/jjn0;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->c0(Ll/y20;)V

    .line 81
    .line 82
    .line 83
    iget-object p1, p0, Ll/jjn0;->m:Lv/VDraweeView;

    .line 84
    .line 85
    new-instance v0, Ll/ajn0;

    .line 86
    .line 87
    invoke-direct {v0, p0}, Ll/ajn0;-><init>(Ll/jjn0;)V

    .line 88
    .line 89
    .line 90
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 91
    .line 92
    .line 93
    iget-object p1, p0, Ll/jjn0;->l:Lv/VDraweeView;

    .line 94
    .line 95
    new-instance v0, Ll/bjn0;

    .line 96
    .line 97
    invoke-direct {v0, p0}, Ll/bjn0;-><init>(Ll/jjn0;)V

    .line 98
    .line 99
    .line 100
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 101
    .line 102
    .line 103
    return-void
.end method

.method private synthetic P(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast p0, Ll/yin0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/yin0;->X3()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic Q(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final synthetic O(Ljava/lang/Integer;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object v0, p0, Ll/jjn0;->t:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->getItemCount()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    add-int/lit8 v0, v0, -0x3

    .line 12
    .line 13
    if-lt p1, v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/jjn0;->U()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public final synthetic R(Lcom/p1/mobile/putong/live/base/data/BLiveBossCallDetail;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jjn0;->V(Lcom/p1/mobile/putong/live/base/data/BLiveBossCallDetail;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic S(Ljava/util/ArrayList;Lcom/p1/mobile/putong/live/base/data/BLiveBossGift;)V
    .locals 1

    .line 1
    new-instance v0, Ll/cxj;

    .line 2
    .line 3
    invoke-direct {v0, p2}, Ll/cxj;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveBossGift;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 7
    .line 8
    check-cast p0, Ll/yin0;

    .line 9
    .line 10
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    new-instance p2, Ll/gjn0;

    .line 14
    .line 15
    invoke-direct {p2, p0}, Ll/gjn0;-><init>(Ll/yin0;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p2}, Ll/cxj;->I(Ll/y20;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final synthetic T(Ljava/util/ArrayList;Lcom/p1/mobile/putong/live/base/data/BLiveBossGift;)V
    .locals 1

    .line 1
    new-instance v0, Ll/cxj;

    .line 2
    .line 3
    invoke-direct {v0, p2}, Ll/cxj;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveBossGift;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 7
    .line 8
    check-cast p0, Ll/yin0;

    .line 9
    .line 10
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    new-instance p2, Ll/gjn0;

    .line 14
    .line 15
    invoke-direct {p2, p0}, Ll/gjn0;-><init>(Ll/yin0;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p2}, Ll/cxj;->I(Ll/y20;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final U()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/jjn0;->u:Lcom/p1/mobile/putong/live/base/data/BLiveBossGiftRecord;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBossGiftRecord;->page:I

    .line 7
    .line 8
    iget v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBossGiftRecord;->totalPage:I

    .line 9
    .line 10
    if-ne v1, v2, :cond_1

    .line 11
    .line 12
    :goto_0
    return-void

    .line 13
    :cond_1
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 14
    .line 15
    check-cast v2, Ll/yin0;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBossGiftRecord;->otherUserId:Ljava/lang/String;

    .line 18
    .line 19
    add-int/lit8 v1, v1, 0x1

    .line 20
    .line 21
    new-instance v3, Ll/cjn0;

    .line 22
    .line 23
    invoke-direct {v3, p0}, Ll/cjn0;-><init>(Ll/jjn0;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v2, v0, v1, v3}, Ll/yin0;->Y3(Ljava/lang/String;ILl/y20;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final V(Lcom/p1/mobile/putong/live/base/data/BLiveBossCallDetail;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast v0, Ll/yin0;

    .line 4
    .line 5
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBossCallDetail;->userId:Ljava/lang/String;

    .line 6
    .line 7
    new-instance v2, Ll/ejn0;

    .line 8
    .line 9
    invoke-direct {v2, p0}, Ll/ejn0;-><init>(Ll/jjn0;)V

    .line 10
    .line 11
    .line 12
    const/4 v3, 0x1

    .line 13
    invoke-virtual {v0, v1, v3, v2}, Ll/yin0;->Y3(Ljava/lang/String;ILl/y20;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/jjn0;->s:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->J()Ljava/util/List;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/ijn0;

    .line 23
    .line 24
    invoke-direct {v1, p1}, Ll/ijn0;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveBossCallDetail;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Ll/jjn0;->s:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 31
    .line 32
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public W(Lcom/p1/mobile/putong/live/base/data/BLiveBossCall;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ll/jjn0;->M()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBossCall;->userCallType:Ljava/lang/String;

    .line 5
    .line 6
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x1

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object p1, p0, Ll/jjn0;->o:Lv/VText;

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Ll/jjn0;->n:Landroidx/recyclerview/widget/RecyclerView;

    .line 20
    .line 21
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Ll/jjn0;->m:Lv/VDraweeView;

    .line 25
    .line 26
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 30
    .line 31
    check-cast p1, Ll/yin0;

    .line 32
    .line 33
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 34
    .line 35
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    new-instance v2, Ll/ejn0;

    .line 40
    .line 41
    invoke-direct {v2, p0}, Ll/ejn0;-><init>(Ll/jjn0;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1, v0, v1, v2}, Ll/yin0;->Y3(Ljava/lang/String;ILl/y20;)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_0
    iget-object v0, p0, Ll/jjn0;->m:Lv/VDraweeView;

    .line 49
    .line 50
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0, p1}, Ll/jjn0;->X(Lcom/p1/mobile/putong/live/base/data/BLiveBossCall;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public X(Lcom/p1/mobile/putong/live/base/data/BLiveBossCall;)V
    .locals 8

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBossCall;->calls:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const/4 v2, 0x0

    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0, v2}, Ll/jjn0;->b0(Z)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const/4 v1, 0x1

    .line 15
    invoke-virtual {p0, v1}, Ll/jjn0;->b0(Z)V

    .line 16
    .line 17
    .line 18
    new-instance v3, Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 21
    .line 22
    .line 23
    move v4, v2

    .line 24
    :goto_0
    iget-object v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBossCall;->calls:Ljava/util/List;

    .line 25
    .line 26
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 27
    .line 28
    .line 29
    move-result v5

    .line 30
    if-ge v4, v5, :cond_2

    .line 31
    .line 32
    iget-object v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBossCall;->calls:Ljava/util/List;

    .line 33
    .line 34
    invoke-interface {v5, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v5

    .line 38
    check-cast v5, Lcom/p1/mobile/putong/live/base/data/BLiveBossCallDetail;

    .line 39
    .line 40
    new-instance v6, Ll/exj;

    .line 41
    .line 42
    invoke-direct {v6, v5}, Ll/exj;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveBossCallDetail;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    if-nez v4, :cond_1

    .line 49
    .line 50
    move v7, v1

    .line 51
    goto :goto_1

    .line 52
    :cond_1
    move v7, v2

    .line 53
    :goto_1
    iput-boolean v7, v6, Ll/exj;->b:Z

    .line 54
    .line 55
    new-instance v7, Ll/fjn0;

    .line 56
    .line 57
    invoke-direct {v7, p0, v5}, Ll/fjn0;-><init>(Ll/jjn0;Lcom/p1/mobile/putong/live/base/data/BLiveBossCallDetail;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v6, v7}, Ll/d3q;->A(Landroid/view/View$OnClickListener;)V

    .line 61
    .line 62
    .line 63
    add-int/lit8 v4, v4, 0x1

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_2
    iget-object p1, p0, Ll/jjn0;->s:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 67
    .line 68
    invoke-virtual {p1, v3}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Z(Ljava/util/List;)V

    .line 69
    .line 70
    .line 71
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 72
    .line 73
    check-cast p1, Ll/yin0;

    .line 74
    .line 75
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveBossCallDetail;

    .line 80
    .line 81
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBossCallDetail;->userId:Ljava/lang/String;

    .line 82
    .line 83
    new-instance v2, Ll/ejn0;

    .line 84
    .line 85
    invoke-direct {v2, p0}, Ll/ejn0;-><init>(Ll/jjn0;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p1, v0, v1, v2}, Ll/yin0;->Y3(Ljava/lang/String;ILl/y20;)V

    .line 89
    .line 90
    .line 91
    return-void
.end method

.method public Y()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->E()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Z(Lcom/p1/mobile/putong/live/base/data/BLiveBossGiftRecord;)V
    .locals 3

    .line 1
    iput-object p1, p0, Ll/jjn0;->u:Lcom/p1/mobile/putong/live/base/data/BLiveBossGiftRecord;

    .line 2
    .line 3
    new-instance v0, Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 6
    .line 7
    .line 8
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBossGiftRecord;->gifts:Ljava/util/List;

    .line 9
    .line 10
    new-instance v2, Ll/djn0;

    .line 11
    .line 12
    invoke-direct {v2, p0, v0}, Ll/djn0;-><init>(Ll/jjn0;Ljava/util/ArrayList;)V

    .line 13
    .line 14
    .line 15
    invoke-static {v1, v2}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 16
    .line 17
    .line 18
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBossGiftRecord;->totalPage:I

    .line 19
    .line 20
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBossGiftRecord;->page:I

    .line 21
    .line 22
    if-ne v1, p1, :cond_0

    .line 23
    .line 24
    new-instance p1, Ll/dxj;

    .line 25
    .line 26
    invoke-direct {p1}, Ll/dxj;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    :cond_0
    iget-object p1, p0, Ll/jjn0;->t:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 33
    .line 34
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->J()Ljava/util/List;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-interface {p1, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 39
    .line 40
    .line 41
    iget-object p0, p0, Ll/jjn0;->t:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 42
    .line 43
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public a0(Lcom/p1/mobile/putong/live/base/data/BLiveBossGiftRecord;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/jjn0;->o:Lv/VText;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->x7:I

    .line 9
    .line 10
    invoke-static {v2}, Ll/xau;->t(I)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    iget v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBossGiftRecord;->popularityValue:I

    .line 18
    .line 19
    int-to-long v2, v2

    .line 20
    invoke-static {v2, v3}, Ll/yau;->h(J)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBossGiftRecord;->gifts:Ljava/util/List;

    .line 35
    .line 36
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    iget-object v1, p0, Ll/jjn0;->r:Landroid/view/View;

    .line 41
    .line 42
    const/4 v2, 0x0

    .line 43
    const/4 v3, 0x1

    .line 44
    if-eqz v0, :cond_0

    .line 45
    .line 46
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 47
    .line 48
    .line 49
    iget-object p0, p0, Ll/jjn0;->p:Landroidx/recyclerview/widget/RecyclerView;

    .line 50
    .line 51
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_0
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Ll/jjn0;->p:Landroidx/recyclerview/widget/RecyclerView;

    .line 59
    .line 60
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Ll/jjn0;->t:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 64
    .line 65
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->J()Ljava/util/List;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 70
    .line 71
    .line 72
    new-instance v0, Ljava/util/ArrayList;

    .line 73
    .line 74
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 75
    .line 76
    .line 77
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBossGiftRecord;->gifts:Ljava/util/List;

    .line 78
    .line 79
    new-instance v2, Ll/hjn0;

    .line 80
    .line 81
    invoke-direct {v2, p0, v0}, Ll/hjn0;-><init>(Ll/jjn0;Ljava/util/ArrayList;)V

    .line 82
    .line 83
    .line 84
    invoke-static {v1, v2}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 85
    .line 86
    .line 87
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBossGiftRecord;->page:I

    .line 88
    .line 89
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBossGiftRecord;->totalPage:I

    .line 90
    .line 91
    if-ne v1, p1, :cond_1

    .line 92
    .line 93
    new-instance p1, Ll/dxj;

    .line 94
    .line 95
    invoke-direct {p1}, Ll/dxj;-><init>()V

    .line 96
    .line 97
    .line 98
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    :cond_1
    iget-object p0, p0, Ll/jjn0;->t:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 102
    .line 103
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Z(Ljava/util/List;)V

    .line 104
    .line 105
    .line 106
    return-void
.end method

.method public final b0(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jjn0;->o:Lv/VText;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/jjn0;->n:Landroidx/recyclerview/widget/RecyclerView;

    .line 7
    .line 8
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Ll/jjn0;->q:Landroid/view/View;

    .line 12
    .line 13
    xor-int/lit8 p1, p1, 0x1

    .line 14
    .line 15
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public m(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->m(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/mdc0;->N6:I

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lv/VText;

    .line 11
    .line 12
    iput-object v0, p0, Ll/jjn0;->k:Lv/VText;

    .line 13
    .line 14
    sget v0, Ll/mdc0;->A:I

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lv/VDraweeView;

    .line 21
    .line 22
    iput-object v0, p0, Ll/jjn0;->l:Lv/VDraweeView;

    .line 23
    .line 24
    sget v0, Ll/mdc0;->a5:I

    .line 25
    .line 26
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Lv/VDraweeView;

    .line 31
    .line 32
    iput-object v0, p0, Ll/jjn0;->m:Lv/VDraweeView;

    .line 33
    .line 34
    sget v0, Ll/mdc0;->R7:I

    .line 35
    .line 36
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;

    .line 41
    .line 42
    iput-object v0, p0, Ll/jjn0;->n:Landroidx/recyclerview/widget/RecyclerView;

    .line 43
    .line 44
    sget v0, Ll/mdc0;->P0:I

    .line 45
    .line 46
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Lv/VText;

    .line 51
    .line 52
    iput-object v0, p0, Ll/jjn0;->o:Lv/VText;

    .line 53
    .line 54
    sget v0, Ll/mdc0;->k2:I

    .line 55
    .line 56
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;

    .line 61
    .line 62
    iput-object v0, p0, Ll/jjn0;->p:Landroidx/recyclerview/widget/RecyclerView;

    .line 63
    .line 64
    sget v0, Ll/mdc0;->U1:I

    .line 65
    .line 66
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    iput-object v0, p0, Ll/jjn0;->q:Landroid/view/View;

    .line 71
    .line 72
    sget v0, Ll/mdc0;->c2:I

    .line 73
    .line 74
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    iput-object v0, p0, Ll/jjn0;->r:Landroid/view/View;

    .line 79
    .line 80
    invoke-direct {p0, p1}, Ll/jjn0;->N(Landroid/view/View;)V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public w()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->w()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/jjn0;->M()V

    .line 5
    .line 6
    .line 7
    return-void
.end method
