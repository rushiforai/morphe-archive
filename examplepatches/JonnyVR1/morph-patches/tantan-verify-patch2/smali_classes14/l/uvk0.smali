.class public Ll/uvk0;
.super Ll/xgu;
.source "SourceFile"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/xgu<",
        "Ll/uvk0;",
        ">;",
        "Landroid/widget/SeekBar$OnSeekBarChangeListener;"
    }
.end annotation


# instance fields
.field public final f:Ll/vzl;

.field public g:Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;

.field public h:Z

.field public i:Lv/VRecyclerView;

.field public final j:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ll/vxd0;",
            ">;"
        }
    .end annotation
.end field

.field public final k:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;",
            ">;"
        }
    .end annotation
.end field

.field public l:Ll/itw;

.field public m:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

.field public n:I

.field public final o:Ll/vxd0;

.field public p:Ll/grk0;


# direct methods
.method public constructor <init>(Ll/knu;Ll/grk0;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Ll/xgu;-><init>(Ll/knu;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Ll/uvk0;->h:Z

    .line 6
    .line 7
    new-instance v0, Ljava/util/HashMap;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/uvk0;->j:Ljava/util/HashMap;

    .line 13
    .line 14
    new-instance v0, Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Ll/uvk0;->k:Ljava/util/List;

    .line 20
    .line 21
    new-instance v0, Ll/vxd0;

    .line 22
    .line 23
    invoke-static {}, Ll/mbs;->o0()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-static {v1}, Ll/uyr;->r(Ljava/lang/String;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-direct {v0, v1, p1}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 32
    .line 33
    .line 34
    iput-object v0, p0, Ll/uvk0;->o:Ll/vxd0;

    .line 35
    .line 36
    iput-object p2, p0, Ll/uvk0;->p:Ll/grk0;

    .line 37
    .line 38
    iget-object p1, p2, Ll/grk0;->k:Ll/vzl;

    .line 39
    .line 40
    iput-object p1, p0, Ll/uvk0;->f:Ll/vzl;

    .line 41
    .line 42
    return-void
.end method

.method public static synthetic S2(ILcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->id:I

    .line 2
    .line 3
    if-ne p1, p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic T2(ILcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->id:I

    .line 2
    .line 3
    if-ne p1, p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic U2(ILcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->id:I

    .line 2
    .line 3
    if-ne p1, p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic V2(ILcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->id:I

    .line 2
    .line 3
    if-ne p1, p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic W2(Ll/uvk0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/uvk0;->f3()V

    return-void
.end method

.method public static synthetic X2(Ll/uvk0;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/uvk0;->e3(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic Y2(Ll/uvk0;Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/uvk0;->g3(Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;)V

    return-void
.end method

.method private synthetic e3(Ll/vxj0;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-virtual {p0, p1}, Ll/uvk0;->o3(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private f3()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/uvk0;->h:Z

    .line 3
    .line 4
    iget-object p0, p0, Ll/uvk0;->p:Ll/grk0;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/grk0;->c3()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private init()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/uvk0;->g:Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;->getMakeUpStyleView()Lv/VRecyclerView;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iput-object v0, p0, Ll/uvk0;->i:Lv/VRecyclerView;

    .line 8
    .line 9
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/ahu;->act()Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-direct {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 16
    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;->setOrientation(I)V

    .line 20
    .line 21
    .line 22
    iget-object v1, p0, Ll/uvk0;->i:Lv/VRecyclerView;

    .line 23
    .line 24
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 25
    .line 26
    .line 27
    new-instance v0, Ll/itw;

    .line 28
    .line 29
    iget-object v1, p0, Ll/uvk0;->k:Ljava/util/List;

    .line 30
    .line 31
    new-instance v2, Ll/svk0;

    .line 32
    .line 33
    invoke-direct {v2, p0}, Ll/svk0;-><init>(Ll/uvk0;)V

    .line 34
    .line 35
    .line 36
    invoke-direct {v0, v1, v2}, Ll/itw;-><init>(Ljava/util/List;Ll/y20;)V

    .line 37
    .line 38
    .line 39
    iput-object v0, p0, Ll/uvk0;->l:Ll/itw;

    .line 40
    .line 41
    iget-object v1, p0, Ll/uvk0;->i:Lv/VRecyclerView;

    .line 42
    .line 43
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Ll/uvk0;->m:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

    .line 47
    .line 48
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_0

    .line 53
    .line 54
    iget v0, p0, Ll/uvk0;->n:I

    .line 55
    .line 56
    invoke-virtual {p0, v0}, Ll/uvk0;->o3(I)V

    .line 57
    .line 58
    .line 59
    :cond_0
    return-void
.end method

.method private r3(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/uvk0;->k:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/uvk0;->k:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Ll/uvk0;->l:Ll/itw;

    .line 12
    .line 13
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Ll/uvk0;->l:Ll/itw;

    .line 20
    .line 21
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method private s3(I)V
    .locals 2

    .line 1
    int-to-float p1, p1

    .line 2
    const/high16 v0, 0x3f800000    # 1.0f

    .line 3
    .line 4
    mul-float/2addr p1, v0

    .line 5
    const/high16 v0, 0x42c80000    # 100.0f

    .line 6
    .line 7
    div-float/2addr p1, v0

    .line 8
    iget-object v0, p0, Ll/uvk0;->f:Ll/vzl;

    .line 9
    .line 10
    iget-object p0, p0, Ll/uvk0;->m:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

    .line 11
    .line 12
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->id:I

    .line 13
    .line 14
    sget-object v1, Lcom/p1/mobile/putong/live/base/mmsdk/beauty/ByteDanceHelper$MakeupStyleType;->FILTER:Lcom/p1/mobile/putong/live/base/mmsdk/beauty/ByteDanceHelper$MakeupStyleType;

    .line 15
    .line 16
    invoke-interface {v0, p0, v1, p1}, Ll/vzl;->s(ILcom/p1/mobile/putong/live/base/mmsdk/beauty/ByteDanceHelper$MakeupStyleType;F)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method private x3(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/uvk0;->i:Lv/VRecyclerView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    iget-object v0, p0, Ll/uvk0;->l:Ll/itw;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Ll/uvk0;->l:Ll/itw;

    .line 12
    .line 13
    iget v0, p0, Ll/uvk0;->n:I

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Ll/uvk0;->g:Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;

    .line 19
    .line 20
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;->getCurrentItem()I

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;->MAKE_UP:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;->getIndex()I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-ne p1, v0, :cond_3

    .line 31
    .line 32
    iget-object p1, p0, Ll/uvk0;->g:Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;

    .line 33
    .line 34
    iget v0, p0, Ll/uvk0;->n:I

    .line 35
    .line 36
    const/4 v1, 0x0

    .line 37
    const/4 v2, 0x1

    .line 38
    if-eqz v0, :cond_1

    .line 39
    .line 40
    move v0, v2

    .line 41
    goto :goto_0

    .line 42
    :cond_1
    move v0, v1

    .line 43
    :goto_0
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;->m(Z)V

    .line 44
    .line 45
    .line 46
    iget-object p1, p0, Ll/uvk0;->g:Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;

    .line 47
    .line 48
    iget v0, p0, Ll/uvk0;->n:I

    .line 49
    .line 50
    if-eqz v0, :cond_2

    .line 51
    .line 52
    move v1, v2

    .line 53
    :cond_2
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;->l(Z)V

    .line 54
    .line 55
    .line 56
    iget-object p1, p0, Ll/uvk0;->g:Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;

    .line 57
    .line 58
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {v0}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-static {v0}, Ll/yuk0;->e(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    iget-object p0, p0, Ll/uvk0;->m:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

    .line 71
    .line 72
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->name:Ljava/lang/String;

    .line 73
    .line 74
    invoke-virtual {p1, v0, p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;->n(ZLjava/lang/String;)V

    .line 75
    .line 76
    .line 77
    :cond_3
    :goto_1
    return-void
.end method


# virtual methods
.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/ahu;->K2()Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;->LiveVideoChatEvent:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$e;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$e;->d()Ll/v3f$c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lrx/c;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/nvk0;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/nvk0;-><init>(Ll/uvk0;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final Z2(I)I
    .locals 3

    .line 1
    invoke-static {}, Ll/mbs;->o0()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p1, v0}, Ll/uyr;->q(ILjava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Ll/uvk0;->j:Ljava/util/HashMap;

    .line 10
    .line 11
    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Ll/vxd0;

    .line 16
    .line 17
    if-nez v1, :cond_1

    .line 18
    .line 19
    iget-object v1, p0, Ll/uvk0;->k:Ljava/util/List;

    .line 20
    .line 21
    new-instance v2, Ll/qvk0;

    .line 22
    .line 23
    invoke-direct {v2, p1}, Ll/qvk0;-><init>(I)V

    .line 24
    .line 25
    .line 26
    invoke-static {v1, v2}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

    .line 31
    .line 32
    new-instance v1, Ll/vxd0;

    .line 33
    .line 34
    if-nez p1, :cond_0

    .line 35
    .line 36
    const/16 p1, 0x32

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->defaultFilterValue:I

    .line 40
    .line 41
    :goto_0
    invoke-direct {v1, v0, p1}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 42
    .line 43
    .line 44
    iget-object p0, p0, Ll/uvk0;->j:Ljava/util/HashMap;

    .line 45
    .line 46
    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    :cond_1
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    check-cast p0, Ljava/lang/Integer;

    .line 54
    .line 55
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    return p0
.end method

.method public final a3(I)I
    .locals 3

    .line 1
    invoke-static {}, Ll/mbs;->o0()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p1, v0}, Ll/uyr;->s(ILjava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Ll/uvk0;->j:Ljava/util/HashMap;

    .line 10
    .line 11
    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Ll/vxd0;

    .line 16
    .line 17
    if-nez v1, :cond_1

    .line 18
    .line 19
    iget-object v1, p0, Ll/uvk0;->k:Ljava/util/List;

    .line 20
    .line 21
    new-instance v2, Ll/rvk0;

    .line 22
    .line 23
    invoke-direct {v2, p1}, Ll/rvk0;-><init>(I)V

    .line 24
    .line 25
    .line 26
    invoke-static {v1, v2}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

    .line 31
    .line 32
    new-instance v1, Ll/vxd0;

    .line 33
    .line 34
    if-nez p1, :cond_0

    .line 35
    .line 36
    const/16 p1, 0x32

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->defaultBeautyValue:I

    .line 40
    .line 41
    :goto_0
    invoke-direct {v1, v0, p1}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 42
    .line 43
    .line 44
    iget-object p0, p0, Ll/uvk0;->j:Ljava/util/HashMap;

    .line 45
    .line 46
    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    :cond_1
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    check-cast p0, Ljava/lang/Integer;

    .line 54
    .line 55
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    return p0
.end method

.method public b3()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uvk0;->o:Ll/vxd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Integer;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public c3(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;",
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
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-direct {p0, p1}, Ll/uvk0;->r3(Ljava/util/List;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/uvk0;->j3(Ljava/util/List;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public d3()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/uvk0;->h:Z

    .line 3
    .line 4
    return-void
.end method

.method public final g3(Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;)V
    .locals 3

    .line 1
    new-instance v0, Ll/jxd0;

    .line 2
    .line 3
    invoke-static {}, Ll/mbs;->o0()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {v1}, Ll/uyr;->n(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-direct {v0, v1, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Ll/uvk0;->g:Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;

    .line 17
    .line 18
    iget-boolean v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->settingTogether:Z

    .line 19
    .line 20
    xor-int/lit8 v2, v2, 0x1

    .line 21
    .line 22
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;->l(Z)V

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Ll/uvk0;->g:Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;

    .line 26
    .line 27
    iget-boolean v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->settingTogether:Z

    .line 28
    .line 29
    if-eqz v2, :cond_0

    .line 30
    .line 31
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->E0:I

    .line 32
    .line 33
    invoke-static {v2}, Ll/xau;->t(I)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    goto :goto_0

    .line 38
    :cond_0
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->x4:I

    .line 39
    .line 40
    invoke-static {v2}, Ll/xau;->t(I)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    :goto_0
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;->h(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    iget-object v1, p0, Ll/uvk0;->p:Ll/grk0;

    .line 48
    .line 49
    iget-object v1, v1, Ll/grk0;->h:Ll/ivk0;

    .line 50
    .line 51
    invoke-virtual {v1}, Ll/ivk0;->X2()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-virtual {p0, p1}, Ll/uvk0;->p3(Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0}, Ll/ahu;->K2()Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;->LiveVideoChatEvent:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$e;

    .line 63
    .line 64
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$e;->c()Ll/v3f$c;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 69
    .line 70
    .line 71
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    check-cast p0, Ljava/lang/Boolean;

    .line 76
    .line 77
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 78
    .line 79
    .line 80
    move-result p0

    .line 81
    if-eqz p0, :cond_1

    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_1
    const-string p0, "0"

    .line 85
    .line 86
    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    move-result p0

    .line 90
    if-nez p0, :cond_2

    .line 91
    .line 92
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->D0:I

    .line 93
    .line 94
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 95
    .line 96
    .line 97
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 98
    .line 99
    invoke-virtual {v0, p0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    :cond_2
    :goto_1
    return-void
.end method

.method public h3()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/uvk0;->g:Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->x4:I

    .line 4
    .line 5
    invoke-static {v1}, Ll/xau;->t(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;->h(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget v0, p0, Ll/uvk0;->n:I

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    const/4 v0, 0x1

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 v0, 0x0

    .line 19
    :goto_0
    iget-object v1, p0, Ll/uvk0;->g:Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;

    .line 20
    .line 21
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;->l(Z)V

    .line 22
    .line 23
    .line 24
    iget-object v1, p0, Ll/uvk0;->g:Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;

    .line 25
    .line 26
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;->m(Z)V

    .line 27
    .line 28
    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    iget-object v0, p0, Ll/uvk0;->g:Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;

    .line 32
    .line 33
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;->MAKE_UP:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;

    .line 34
    .line 35
    iget-object v2, p0, Ll/uvk0;->m:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

    .line 36
    .line 37
    iget v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->id:I

    .line 38
    .line 39
    invoke-virtual {p0, v2}, Ll/uvk0;->Z2(I)I

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;->i(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;I)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Ll/uvk0;->g:Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;

    .line 47
    .line 48
    iget-object v2, p0, Ll/uvk0;->m:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

    .line 49
    .line 50
    iget v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->id:I

    .line 51
    .line 52
    invoke-virtual {p0, v2}, Ll/uvk0;->a3(I)I

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;->j(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;I)V

    .line 57
    .line 58
    .line 59
    :cond_1
    iget-object v0, p0, Ll/uvk0;->k:Ljava/util/List;

    .line 60
    .line 61
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-nez v0, :cond_2

    .line 66
    .line 67
    iget-object v0, p0, Ll/uvk0;->g:Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;

    .line 68
    .line 69
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    invoke-virtual {v1}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-static {v1}, Ll/yuk0;->e(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)Z

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    iget-object v2, p0, Ll/uvk0;->m:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

    .line 82
    .line 83
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->name:Ljava/lang/String;

    .line 84
    .line 85
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;->g(ZLjava/lang/String;)V

    .line 86
    .line 87
    .line 88
    iget-object v0, p0, Ll/uvk0;->i:Lv/VRecyclerView;

    .line 89
    .line 90
    iget p0, p0, Ll/uvk0;->n:I

    .line 91
    .line 92
    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V

    .line 93
    .line 94
    .line 95
    return-void

    .line 96
    :cond_2
    iget-boolean v0, p0, Ll/uvk0;->h:Z

    .line 97
    .line 98
    if-eqz v0, :cond_3

    .line 99
    .line 100
    invoke-virtual {p0}, Ll/ahu;->act()Lcom/p1/mobile/android/app/Act;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->j7:I

    .line 109
    .line 110
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->D(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Sb:I

    .line 115
    .line 116
    new-instance v2, Ll/tvk0;

    .line 117
    .line 118
    invoke-direct {v2, p0}, Ll/tvk0;-><init>(Ll/uvk0;)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->t0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->a:I

    .line 126
    .line 127
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Dialog$e;->k0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 132
    .line 133
    .line 134
    return-void

    .line 135
    :cond_3
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->O2:I

    .line 136
    .line 137
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 138
    .line 139
    .line 140
    return-void
.end method

.method public i3(Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/uvk0;->g:Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/uvk0;->init()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final j3(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v2

    .line 7
    if-ge v1, v2, :cond_1

    .line 8
    .line 9
    iget-object v2, p0, Ll/uvk0;->o:Ll/vxd0;

    .line 10
    .line 11
    invoke-virtual {v2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    check-cast v2, Ljava/lang/Integer;

    .line 16
    .line 17
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    check-cast v3, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

    .line 26
    .line 27
    iget v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->id:I

    .line 28
    .line 29
    if-ne v2, v3, :cond_0

    .line 30
    .line 31
    move v0, v1

    .line 32
    goto :goto_1

    .line 33
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    :goto_1
    invoke-virtual {p0, v0}, Ll/uvk0;->o3(I)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public k3()V
    .locals 1

    .line 1
    iget v0, p0, Ll/uvk0;->n:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/uvk0;->q3(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final m3(II)V
    .locals 3

    .line 1
    invoke-static {}, Ll/mbs;->o0()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p1, v0}, Ll/uyr;->q(ILjava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Ll/uvk0;->j:Ljava/util/HashMap;

    .line 10
    .line 11
    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Ll/vxd0;

    .line 16
    .line 17
    if-nez v1, :cond_1

    .line 18
    .line 19
    iget-object v1, p0, Ll/uvk0;->k:Ljava/util/List;

    .line 20
    .line 21
    new-instance v2, Ll/ovk0;

    .line 22
    .line 23
    invoke-direct {v2, p1}, Ll/ovk0;-><init>(I)V

    .line 24
    .line 25
    .line 26
    invoke-static {v1, v2}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

    .line 31
    .line 32
    new-instance v1, Ll/vxd0;

    .line 33
    .line 34
    if-nez p1, :cond_0

    .line 35
    .line 36
    const/16 p1, 0x32

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->defaultFilterValue:I

    .line 40
    .line 41
    :goto_0
    invoke-direct {v1, v0, p1}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 42
    .line 43
    .line 44
    iget-object p0, p0, Ll/uvk0;->j:Ljava/util/HashMap;

    .line 45
    .line 46
    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    :cond_1
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {v1, p0}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public final n3(II)V
    .locals 3

    .line 1
    invoke-static {}, Ll/mbs;->o0()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p1, v0}, Ll/uyr;->s(ILjava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Ll/uvk0;->j:Ljava/util/HashMap;

    .line 10
    .line 11
    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Ll/vxd0;

    .line 16
    .line 17
    if-nez v1, :cond_1

    .line 18
    .line 19
    iget-object v1, p0, Ll/uvk0;->k:Ljava/util/List;

    .line 20
    .line 21
    new-instance v2, Ll/pvk0;

    .line 22
    .line 23
    invoke-direct {v2, p1}, Ll/pvk0;-><init>(I)V

    .line 24
    .line 25
    .line 26
    invoke-static {v1, v2}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

    .line 31
    .line 32
    new-instance v1, Ll/vxd0;

    .line 33
    .line 34
    if-nez p1, :cond_0

    .line 35
    .line 36
    const/16 p1, 0x32

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->defaultBeautyValue:I

    .line 40
    .line 41
    :goto_0
    invoke-direct {v1, v0, p1}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 42
    .line 43
    .line 44
    iget-object p0, p0, Ll/uvk0;->j:Ljava/util/HashMap;

    .line 45
    .line 46
    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    :cond_1
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {v1, p0}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public o3(I)V
    .locals 1

    .line 1
    if-ltz p1, :cond_1

    .line 2
    .line 3
    iget-object v0, p0, Ll/uvk0;->k:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-gt v0, p1, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object v0, p0, Ll/uvk0;->k:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/uvk0;->p3(Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/uvk0;->i:Lv/VRecyclerView;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    iget-object v0, p0, Ll/uvk0;->l:Ll/itw;

    .line 32
    .line 33
    invoke-virtual {v0, p1}, Ll/itw;->K(I)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Ll/uvk0;->i:Lv/VRecyclerView;

    .line 37
    .line 38
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V

    .line 39
    .line 40
    .line 41
    :cond_1
    :goto_0
    return-void
.end method

.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-nez p1, :cond_1

    .line 6
    .line 7
    iget-object p1, p0, Ll/uvk0;->m:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

    .line 8
    .line 9
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->settingTogether:Z

    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0, p2, p2}, Ll/uvk0;->u3(II)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-direct {p0, p2}, Ll/uvk0;->s3(I)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_1
    invoke-virtual {p0, p2}, Ll/uvk0;->v3(I)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/uvk0;->m:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget v0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->id:I

    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/widget/ProgressBar;->getProgress()I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    invoke-virtual {p0, v0, p1}, Ll/uvk0;->m3(II)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    iget v0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->id:I

    .line 20
    .line 21
    invoke-virtual {p1}, Landroid/widget/ProgressBar;->getProgress()I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    invoke-virtual {p0, v0, p1}, Ll/uvk0;->n3(II)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public p3(Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/uvk0;->m:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iput-object p1, p0, Ll/uvk0;->m:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

    .line 7
    .line 8
    iget v0, p0, Ll/uvk0;->n:I

    .line 9
    .line 10
    iget-object v1, p0, Ll/uvk0;->k:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {v1, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    iput v1, p0, Ll/uvk0;->n:I

    .line 17
    .line 18
    iget-object v1, p0, Ll/uvk0;->o:Ll/vxd0;

    .line 19
    .line 20
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->id:I

    .line 21
    .line 22
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {v1, p1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    invoke-direct {p0, v0}, Ll/uvk0;->x3(I)V

    .line 30
    .line 31
    .line 32
    iget p1, p0, Ll/uvk0;->n:I

    .line 33
    .line 34
    invoke-virtual {p0, p1}, Ll/uvk0;->q3(I)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final q3(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/uvk0;->k:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_2

    .line 8
    .line 9
    if-gez p1, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    if-nez p1, :cond_1

    .line 13
    .line 14
    iget-object p0, p0, Ll/uvk0;->f:Ll/vzl;

    .line 15
    .line 16
    invoke-interface {p0}, Ll/vzl;->F()V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_1
    iget-object v0, p0, Ll/uvk0;->k:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

    .line 27
    .line 28
    iget v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->id:I

    .line 29
    .line 30
    invoke-virtual {p0, v0}, Ll/uvk0;->Z2(I)I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    iget-object v1, p0, Ll/uvk0;->k:Ljava/util/List;

    .line 35
    .line 36
    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

    .line 41
    .line 42
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->id:I

    .line 43
    .line 44
    invoke-virtual {p0, p1}, Ll/uvk0;->a3(I)I

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    invoke-virtual {p0, v0, p1}, Ll/uvk0;->u3(II)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0, v0, p1}, Ll/uvk0;->t3(II)V

    .line 52
    .line 53
    .line 54
    :cond_2
    :goto_0
    return-void
.end method

.method public reset()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/uvk0;->f:Ll/vzl;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/vzl;->t()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-object p0, p0, Ll/uvk0;->f:Ll/vzl;

    .line 15
    .line 16
    invoke-interface {p0}, Ll/vzl;->F()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final t3(II)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/uvk0;->g:Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/uvk0;->g:Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;

    .line 10
    .line 11
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;->MAKE_UP:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;

    .line 12
    .line 13
    invoke-virtual {v0, v1, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;->i(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;I)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ll/uvk0;->g:Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;

    .line 17
    .line 18
    invoke-virtual {p0, v1, p2}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;->j(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;I)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public final u3(II)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/uvk0;->s3(I)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p2}, Ll/uvk0;->v3(I)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final v3(I)V
    .locals 2

    .line 1
    int-to-float p1, p1

    .line 2
    const/high16 v0, 0x3f800000    # 1.0f

    .line 3
    .line 4
    mul-float/2addr p1, v0

    .line 5
    const/high16 v0, 0x42c80000    # 100.0f

    .line 6
    .line 7
    div-float/2addr p1, v0

    .line 8
    iget-object v0, p0, Ll/uvk0;->f:Ll/vzl;

    .line 9
    .line 10
    iget-object p0, p0, Ll/uvk0;->m:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

    .line 11
    .line 12
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->id:I

    .line 13
    .line 14
    sget-object v1, Lcom/p1/mobile/putong/live/base/mmsdk/beauty/ByteDanceHelper$MakeupStyleType;->MAKEUP:Lcom/p1/mobile/putong/live/base/mmsdk/beauty/ByteDanceHelper$MakeupStyleType;

    .line 15
    .line 16
    invoke-interface {v0, p0, v1, p1}, Ll/vzl;->s(ILcom/p1/mobile/putong/live/base/mmsdk/beauty/ByteDanceHelper$MakeupStyleType;F)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public w3(Z)V
    .locals 1

    .line 1
    iget v0, p0, Ll/uvk0;->n:I

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    add-int/lit8 v0, v0, 0x1

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    add-int/lit8 v0, v0, -0x1

    .line 9
    .line 10
    :goto_0
    if-ltz v0, :cond_3

    .line 11
    .line 12
    iget-object p1, p0, Ll/uvk0;->k:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-gt p1, v0, :cond_1

    .line 19
    .line 20
    goto :goto_1

    .line 21
    :cond_1
    iget-object p1, p0, Ll/uvk0;->i:Lv/VRecyclerView;

    .line 22
    .line 23
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-eqz p1, :cond_2

    .line 28
    .line 29
    iget-object p1, p0, Ll/uvk0;->l:Ll/itw;

    .line 30
    .line 31
    invoke-virtual {p1, v0}, Ll/itw;->K(I)V

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Ll/uvk0;->i:Lv/VRecyclerView;

    .line 35
    .line 36
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V

    .line 37
    .line 38
    .line 39
    :cond_2
    iget-object p1, p0, Ll/uvk0;->k:Ljava/util/List;

    .line 40
    .line 41
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

    .line 46
    .line 47
    invoke-virtual {p0, p1}, Ll/uvk0;->g3(Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;)V

    .line 48
    .line 49
    .line 50
    :cond_3
    :goto_1
    return-void
.end method
