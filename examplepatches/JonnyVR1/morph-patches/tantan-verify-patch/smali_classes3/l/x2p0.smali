.class public Ll/x2p0;
.super Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder<",
        "Ll/rzo0;",
        ">;"
    }
.end annotation


# instance fields
.field public k:Landroid/view/View;

.field public l:Lv/VImage;

.field public m:Lv/VLinear;

.field public n:Lv/VText;

.field public o:Lv/VText;

.field public p:Lv/VRecyclerView;

.field public q:Lv/VText;

.field public r:Ll/z2p0;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/rzo0;Ll/rq2;)V
    .locals 1

    .line 1
    sget v0, Ll/yec0;->Da:I

    .line 2
    .line 3
    invoke-direct {p0, v0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;-><init>(ILcom/p1/mobile/android/app/Act;Ll/y8s;Ll/rq2;)V

    .line 4
    .line 5
    .line 6
    new-instance p1, Ll/z2p0;

    .line 7
    .line 8
    invoke-direct {p1}, Ll/z2p0;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Ll/x2p0;->r:Ll/z2p0;

    .line 12
    .line 13
    const/4 p1, 0x1

    .line 14
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->B(Z)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static synthetic F(Ll/x2p0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/x2p0;->K(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic G(Ll/x2p0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/x2p0;->J(Landroid/view/View;)V

    return-void
.end method

.method private synthetic J(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic K(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 2
    .line 3
    .line 4
    return-void
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

.method public final H(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/y2p0;->a(Ll/x2p0;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public I(Ll/rzo0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final L(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->getOtherUserName()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->getOtherUserName()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    const/4 v2, 0x4

    .line 20
    if-le v1, v2, :cond_0

    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v1, "..."

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    :cond_0
    iget-object v1, p0, Ll/x2p0;->n:Lv/VText;

    .line 34
    .line 35
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->hg:I

    .line 36
    .line 37
    invoke-static {v2, v0}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 42
    .line 43
    .line 44
    :cond_1
    iget-object v0, p0, Ll/x2p0;->o:Lv/VText;

    .line 45
    .line 46
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->og:I

    .line 47
    .line 48
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->getHouseRank()I

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    invoke-static {v1, v2}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->getRewardListList()Ljava/util/List;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    if-eqz v0, :cond_2

    .line 68
    .line 69
    iget-object p0, p0, Ll/x2p0;->r:Ll/z2p0;

    .line 70
    .line 71
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->getRewardListList()Ljava/util/List;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-virtual {p0, p1}, Ll/z2p0;->f0(Ljava/util/List;)V

    .line 76
    .line 77
    .line 78
    :cond_2
    return-void
.end method

.method public M(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->E()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/x2p0;->L(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/rzo0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/x2p0;->I(Ll/rzo0;)V

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

.method public m(Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->m(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ll/x2p0;->H(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Ll/x2p0;->l:Lv/VImage;

    .line 8
    .line 9
    new-instance v0, Ll/v2p0;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ll/v2p0;-><init>(Ll/x2p0;)V

    .line 12
    .line 13
    .line 14
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Ll/x2p0;->q:Lv/VText;

    .line 18
    .line 19
    new-instance v0, Ll/w2p0;

    .line 20
    .line 21
    invoke-direct {v0, p0}, Ll/w2p0;-><init>(Ll/x2p0;)V

    .line 22
    .line 23
    .line 24
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Ll/x2p0;->p:Lv/VRecyclerView;

    .line 28
    .line 29
    new-instance v0, Ll/z2p0$a;

    .line 30
    .line 31
    invoke-direct {v0}, Ll/z2p0$a;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Ll/x2p0;->p:Lv/VRecyclerView;

    .line 38
    .line 39
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 40
    .line 41
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->e:Lcom/p1/mobile/android/app/Act;

    .line 42
    .line 43
    const/4 v2, 0x0

    .line 44
    invoke-direct {v0, v1, v2, v2}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Ll/x2p0;->p:Lv/VRecyclerView;

    .line 51
    .line 52
    iget-object p0, p0, Ll/x2p0;->r:Ll/z2p0;

    .line 53
    .line 54
    invoke-virtual {p1, p0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public bridge synthetic n(Ll/y8s;)V
    .locals 0

    .line 1
    check-cast p1, Ll/rzo0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/x2p0;->I(Ll/rzo0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
