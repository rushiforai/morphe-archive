.class public Ll/uyo0;
.super Ll/c0s;
.source "SourceFile"


# instance fields
.field public A:Lv/VRecyclerView;

.field public B:Landroid/widget/TextView;

.field public C:Landroid/widget/ImageView;

.field public D:Ll/z2p0;

.field public x:Landroid/widget/LinearLayout;

.field public y:Landroid/widget/TextView;

.field public z:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Ll/xzs;Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    sget v0, Ll/yec0;->Fa:I

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {p2, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    invoke-direct {p0, p1, p2}, Ll/c0s;-><init>(Ll/xzs;Landroid/view/View;)V

    .line 13
    .line 14
    .line 15
    new-instance p1, Ll/z2p0;

    .line 16
    .line 17
    invoke-direct {p1}, Ll/z2p0;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object p1, p0, Ll/uyo0;->D:Ll/z2p0;

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->R()Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p0, p1}, Ll/uyo0;->o0(Landroid/view/View;)V

    .line 27
    .line 28
    .line 29
    const/4 p1, 0x0

    .line 30
    invoke-virtual {p0, p1}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    .line 31
    .line 32
    .line 33
    iget-object p2, p0, Ll/uyo0;->A:Lv/VRecyclerView;

    .line 34
    .line 35
    if-eqz p2, :cond_0

    .line 36
    .line 37
    new-instance v0, Ll/z2p0$a;

    .line 38
    .line 39
    invoke-direct {v0}, Ll/z2p0$a;-><init>()V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p2, v0}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 43
    .line 44
    .line 45
    iget-object p2, p0, Ll/uyo0;->A:Lv/VRecyclerView;

    .line 46
    .line 47
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 48
    .line 49
    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-direct {v0, v1, p1, p1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p2, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 57
    .line 58
    .line 59
    iget-object p1, p0, Ll/uyo0;->A:Lv/VRecyclerView;

    .line 60
    .line 61
    iget-object p0, p0, Ll/uyo0;->D:Ll/z2p0;

    .line 62
    .line 63
    invoke-virtual {p1, p0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 64
    .line 65
    .line 66
    :cond_0
    return-void
.end method

.method public static synthetic m0(Ll/uyo0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/uyo0;->s0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic n0(Ll/uyo0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/uyo0;->r0(Landroid/view/View;)V

    return-void
.end method

.method private synthetic r0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic s0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final o0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/vyo0;->a(Ll/uyo0;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final p0(Ljava/util/List;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoicehouseReward;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseReward;",
            ">;"
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
    if-nez p1, :cond_0

    .line 7
    .line 8
    goto :goto_1

    .line 9
    :cond_0
    const/4 v0, 0x0

    .line 10
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-ge v0, v1, :cond_1

    .line 15
    .line 16
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseReward;->newBuilder()Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseReward$Builder;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    check-cast v2, Lcom/p1/mobile/putong/live/base/data/BLiveVoicehouseReward;

    .line 25
    .line 26
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveVoicehouseReward;->image:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {v1, v2}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseReward$Builder;->setImage(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseReward$Builder;

    .line 29
    .line 30
    .line 31
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    check-cast v2, Lcom/p1/mobile/putong/live/base/data/BLiveVoicehouseReward;

    .line 36
    .line 37
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveVoicehouseReward;->title:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {v1, v2}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseReward$Builder;->setTitle(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseReward$Builder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    check-cast v1, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseReward;

    .line 47
    .line 48
    invoke-interface {p0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    add-int/lit8 v0, v0, 0x1

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_1
    :goto_1
    return-object p0
.end method

.method public final q0(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1
    :try_start_0
    invoke-static {p1}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    sget-object p0, Ll/mxo0;->Companion:Ll/mxo0$a;

    .line 6
    .line 7
    invoke-virtual {p0, v0, v1}, Ll/mxo0$a;->a(D)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 11
    return-object p0

    .line 12
    :catch_0
    move-exception p0

    .line 13
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 14
    .line 15
    .line 16
    return-object p1
.end method

.method public t0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseRankAwardInfo;Ljava/lang/String;)V
    .locals 4

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->show()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/uyo0;->D:Ll/z2p0;

    .line 5
    .line 6
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseRankAwardInfo;->houseRewardList:Ljava/util/List;

    .line 7
    .line 8
    invoke-virtual {p0, v1}, Ll/uyo0;->p0(Ljava/util/List;)Ljava/util/List;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Ll/z2p0;->f0(Ljava/util/List;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseRankAwardInfo;->houseRewardList:Ljava/util/List;

    .line 16
    .line 17
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    const/4 v1, 0x0

    .line 22
    if-nez v0, :cond_0

    .line 23
    .line 24
    iget-object v0, p0, Ll/uyo0;->A:Lv/VRecyclerView;

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->smoothScrollToPosition(I)V

    .line 27
    .line 28
    .line 29
    :cond_0
    iget-object v0, p0, Ll/uyo0;->y:Landroid/widget/TextView;

    .line 30
    .line 31
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->ig:I

    .line 32
    .line 33
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseRankAwardInfo;->houseRank:I

    .line 34
    .line 35
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    invoke-static {v2, v3}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 44
    .line 45
    .line 46
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 47
    .line 48
    .line 49
    move-result p2

    .line 50
    if-nez p2, :cond_2

    .line 51
    .line 52
    iget-boolean p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseRankAwardInfo;->isUnLock:Z

    .line 53
    .line 54
    if-eqz p2, :cond_1

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_1
    iget-object p2, p0, Ll/uyo0;->z:Landroid/widget/TextView;

    .line 58
    .line 59
    const/4 v0, 0x1

    .line 60
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 61
    .line 62
    .line 63
    iget-object p2, p0, Ll/uyo0;->z:Landroid/widget/TextView;

    .line 64
    .line 65
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->cg:I

    .line 66
    .line 67
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseRankAwardInfo;->upgradeGap:Ljava/lang/String;

    .line 68
    .line 69
    invoke-virtual {p0, p1}, Ll/uyo0;->q0(Ljava/lang/String;)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    invoke-static {v0, p1}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 78
    .line 79
    .line 80
    goto :goto_1

    .line 81
    :cond_2
    :goto_0
    iget-object p1, p0, Ll/uyo0;->z:Landroid/widget/TextView;

    .line 82
    .line 83
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 84
    .line 85
    .line 86
    :goto_1
    iget-object p1, p0, Ll/uyo0;->C:Landroid/widget/ImageView;

    .line 87
    .line 88
    new-instance p2, Ll/syo0;

    .line 89
    .line 90
    invoke-direct {p2, p0}, Ll/syo0;-><init>(Ll/uyo0;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 94
    .line 95
    .line 96
    iget-object p1, p0, Ll/uyo0;->B:Landroid/widget/TextView;

    .line 97
    .line 98
    new-instance p2, Ll/tyo0;

    .line 99
    .line 100
    invoke-direct {p2, p0}, Ll/tyo0;-><init>(Ll/uyo0;)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 104
    .line 105
    .line 106
    return-void
.end method
