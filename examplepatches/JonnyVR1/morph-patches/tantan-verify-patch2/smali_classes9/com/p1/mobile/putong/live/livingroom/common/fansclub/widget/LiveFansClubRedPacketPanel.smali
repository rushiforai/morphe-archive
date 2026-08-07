.class public Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketPanel;
.super Landroid/widget/LinearLayout;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/LinearLayout;",
        "Ll/iam<",
        "Ll/ocg;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroid/view/View;

.field public b:Landroid/widget/RelativeLayout;

.field public c:Landroid/widget/FrameLayout;

.field public d:Lv/VImage;

.field public e:Lv/VRecyclerView;

.field public f:Lv/VText;

.field public g:Ll/ocg;

.field public h:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

.field public i:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/model/LiveFansClubRedPacketModel;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 5
    .line 6
    invoke-direct {p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketPanel;->h:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketPanel;Ll/zsc0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketPanel;->k(Ll/zsc0;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketPanel;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketPanel;->j(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/f80;Ljava/util/List;Ll/zsc0$a;)V
    .locals 1

    .line 1
    new-instance v0, Ll/mds;

    .line 2
    .line 3
    invoke-direct {v0, p2, p0}, Ll/mds;-><init>(Ll/zsc0$a;Ll/ner;)V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketPanel;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketPanel;->i(Landroid/view/View;)V

    return-void
.end method

.method private synthetic i(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketPanel;->g:Ll/ocg;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ocg;->X3()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private init()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketPanel;->e:Lv/VRecyclerView;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketPanel;->h:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketPanel;->e:Lv/VRecyclerView;

    .line 9
    .line 10
    new-instance v1, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-direct {v1, v2}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketPanel;->e:Lv/VRecyclerView;

    .line 23
    .line 24
    const/4 v1, 0x0

    .line 25
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setItemAnimator(Landroidx/recyclerview/widget/RecyclerView$l;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketPanel;->a:Landroid/view/View;

    .line 29
    .line 30
    new-instance v1, Ll/pds;

    .line 31
    .line 32
    invoke-direct {v1, p0}, Ll/pds;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketPanel;)V

    .line 33
    .line 34
    .line 35
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketPanel;->d:Lv/VImage;

    .line 39
    .line 40
    new-instance v1, Ll/qds;

    .line 41
    .line 42
    invoke-direct {v1, p0}, Ll/qds;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketPanel;)V

    .line 43
    .line 44
    .line 45
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method private synthetic j(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketPanel;->g:Ll/ocg;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ocg;->X3()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public final e(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/tds;->a(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketPanel;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public f(Ll/ocg;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketPanel;->g:Ll/ocg;

    .line 2
    .line 3
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/ocg;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketPanel;->f(Ll/ocg;)V

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

.method public final synthetic k(Ll/zsc0;Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p2, p1, Ll/zsc0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;

    .line 2
    .line 3
    iget-boolean v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->isAnchor:Z

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->anchorContent:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketPanel;->i:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/model/LiveFansClubRedPacketModel;

    .line 14
    .line 15
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/model/LiveFansClubRedPacketModel$RedPacketState;->GRABBING:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/model/LiveFansClubRedPacketModel$RedPacketState;

    .line 16
    .line 17
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/model/LiveFansClubRedPacketModel;->K(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/model/LiveFansClubRedPacketModel$RedPacketState;)V

    .line 18
    .line 19
    .line 20
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketPanel;->h:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketPanel;->i:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/model/LiveFansClubRedPacketModel;

    .line 23
    .line 24
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->O(Ll/d3q;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketPanel;->g:Ll/ocg;

    .line 28
    .line 29
    iget-object p1, p1, Ll/zsc0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;

    .line 30
    .line 31
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->token:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {p0, p1}, Ll/ocg;->V3(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public l(Ll/zsc0;Ll/ner;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketPanel;->e:Lv/VRecyclerView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketPanel;->f:Lv/VText;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    new-instance v0, Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 16
    .line 17
    .line 18
    new-instance v1, Ll/f80;

    .line 19
    .line 20
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketPanel;->h:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 21
    .line 22
    invoke-direct {v1, v2, p2}, Ll/f80;-><init>(Ll/pol;Ll/ner;)V

    .line 23
    .line 24
    .line 25
    new-instance p2, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/model/LiveFansClubRedPacketModel;

    .line 26
    .line 27
    iget-object v2, p1, Ll/zsc0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;

    .line 28
    .line 29
    invoke-direct {p2, v2, v1}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/model/LiveFansClubRedPacketModel;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;Ll/ner;)V

    .line 30
    .line 31
    .line 32
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketPanel;->i:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/model/LiveFansClubRedPacketModel;

    .line 33
    .line 34
    new-instance v2, Ll/rds;

    .line 35
    .line 36
    invoke-direct {v2, p0, p1}, Ll/rds;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketPanel;Ll/zsc0;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p2, v2}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/model/LiveFansClubRedPacketModel;->J(Landroid/view/View$OnClickListener;)V

    .line 40
    .line 41
    .line 42
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketPanel;->i:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/model/LiveFansClubRedPacketModel;

    .line 43
    .line 44
    invoke-interface {v0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    iget-object p1, p1, Ll/zsc0;->b:Ljava/util/List;

    .line 48
    .line 49
    new-instance p2, Ll/sds;

    .line 50
    .line 51
    invoke-direct {p2, v1, v0}, Ll/sds;-><init>(Ll/f80;Ljava/util/List;)V

    .line 52
    .line 53
    .line 54
    invoke-static {p1, p2}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 55
    .line 56
    .line 57
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketPanel;->h:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 58
    .line 59
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Z(Ljava/util/List;)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public m()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketPanel;->e:Lv/VRecyclerView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketPanel;->f:Lv/VText;

    .line 8
    .line 9
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public n()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketPanel;->i:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/model/LiveFansClubRedPacketModel;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/model/LiveFansClubRedPacketModel$RedPacketState;->EXPIRE:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/model/LiveFansClubRedPacketModel$RedPacketState;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/model/LiveFansClubRedPacketModel;->K(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/model/LiveFansClubRedPacketModel$RedPacketState;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketPanel;->h:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketPanel;->i:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/model/LiveFansClubRedPacketModel;

    .line 11
    .line 12
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->O(Ll/d3q;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketPanel;->e(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketPanel;->init()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public p()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketPanel;->e:Lv/VRecyclerView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketPanel;->f:Lv/VText;

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public q()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketPanel;->i:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/model/LiveFansClubRedPacketModel;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/model/LiveFansClubRedPacketModel$RedPacketState;->NOT_ENOUGH:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/model/LiveFansClubRedPacketModel$RedPacketState;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/model/LiveFansClubRedPacketModel;->K(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/model/LiveFansClubRedPacketModel$RedPacketState;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketPanel;->h:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketPanel;->i:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/model/LiveFansClubRedPacketModel;

    .line 11
    .line 12
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->O(Ll/d3q;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
