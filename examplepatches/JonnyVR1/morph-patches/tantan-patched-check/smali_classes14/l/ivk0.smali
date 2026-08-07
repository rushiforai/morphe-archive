.class public Ll/ivk0;
.super Ll/xgu;
.source "SourceFile"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/xgu<",
        "Ll/ivk0;",
        ">;",
        "Landroid/widget/SeekBar$OnSeekBarChangeListener;"
    }
.end annotation


# instance fields
.field public final f:Ll/vzl;

.field public g:Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;

.field public h:Lv/VRecyclerView;

.field public final i:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ll/vxd0;",
            ">;"
        }
    .end annotation
.end field

.field public j:Ll/mli;

.field public final k:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;",
            ">;"
        }
    .end annotation
.end field

.field public l:I

.field public m:Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;

.field public n:Z

.field public final o:Ll/wyd0;

.field public p:Ll/grk0;


# direct methods
.method public constructor <init>(Ll/knu;Ll/grk0;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Ll/xgu;-><init>(Ll/knu;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/ivk0;->i:Ljava/util/HashMap;

    .line 10
    .line 11
    new-instance p1, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Ll/ivk0;->k:Ljava/util/List;

    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    iput-boolean p1, p0, Ll/ivk0;->n:Z

    .line 20
    .line 21
    new-instance p1, Ll/wyd0;

    .line 22
    .line 23
    invoke-static {}, Ll/mbs;->o0()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-static {v0}, Ll/uyr;->k(Ljava/lang/String;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-string v1, "0"

    .line 32
    .line 33
    invoke-direct {p1, v0, v1}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iput-object p1, p0, Ll/ivk0;->o:Ll/wyd0;

    .line 37
    .line 38
    iput-object p2, p0, Ll/ivk0;->p:Ll/grk0;

    .line 39
    .line 40
    iget-object p1, p2, Ll/grk0;->k:Ll/vzl;

    .line 41
    .line 42
    iput-object p1, p0, Ll/ivk0;->f:Ll/vzl;

    .line 43
    .line 44
    return-void
.end method

.method public static synthetic S2(Ll/ivk0;Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ivk0;->c3(Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;)V

    return-void
.end method

.method public static synthetic T2(Ll/ivk0;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ivk0;->a3(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic U2(Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;->isFilterFileExist:Z

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static synthetic V2(Ll/ivk0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ivk0;->b3()V

    return-void
.end method

.method private synthetic a3(Ll/vxj0;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-virtual {p0, p1}, Ll/ivk0;->i3(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private init()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ivk0;->g:Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;->getFilterView()Lv/VRecyclerView;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iput-object v0, p0, Ll/ivk0;->h:Lv/VRecyclerView;

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
    iget-object v1, p0, Ll/ivk0;->h:Lv/VRecyclerView;

    .line 23
    .line 24
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 25
    .line 26
    .line 27
    new-instance v0, Ll/mli;

    .line 28
    .line 29
    iget-object v1, p0, Ll/ivk0;->k:Ljava/util/List;

    .line 30
    .line 31
    new-instance v2, Ll/gvk0;

    .line 32
    .line 33
    invoke-direct {v2, p0}, Ll/gvk0;-><init>(Ll/ivk0;)V

    .line 34
    .line 35
    .line 36
    invoke-direct {v0, v1, v2}, Ll/mli;-><init>(Ljava/util/List;Ll/y20;)V

    .line 37
    .line 38
    .line 39
    iput-object v0, p0, Ll/ivk0;->j:Ll/mli;

    .line 40
    .line 41
    iget-object v1, p0, Ll/ivk0;->h:Lv/VRecyclerView;

    .line 42
    .line 43
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Ll/ivk0;->m:Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;

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
    iget v0, p0, Ll/ivk0;->l:I

    .line 55
    .line 56
    invoke-virtual {p0, v0}, Ll/ivk0;->i3(I)V

    .line 57
    .line 58
    .line 59
    :cond_0
    return-void
.end method

.method private m3(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/ivk0;->k:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/ivk0;->k:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Ll/ivk0;->j:Ll/mli;

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
    iget-object p0, p0, Ll/ivk0;->j:Ll/mli;

    .line 20
    .line 21
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 22
    .line 23
    .line 24
    :cond_0
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
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$e;->c()Ll/v3f$c;

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
    new-instance v1, Ll/evk0;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/evk0;-><init>(Ll/ivk0;)V

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

.method public final W2(Ljava/lang/String;)I
    .locals 2

    .line 1
    invoke-static {}, Ll/mbs;->o0()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p1, v0}, Ll/uyr;->o(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object v0, p0, Ll/ivk0;->i:Ljava/util/HashMap;

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ll/vxd0;

    .line 16
    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    new-instance v0, Ll/vxd0;

    .line 20
    .line 21
    const/16 v1, 0x50

    .line 22
    .line 23
    invoke-direct {v0, p1, v1}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Ll/ivk0;->i:Ljava/util/HashMap;

    .line 27
    .line 28
    invoke-virtual {p0, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    :cond_0
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    check-cast p0, Ljava/lang/Integer;

    .line 36
    .line 37
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    return p0
.end method

.method public X2()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ivk0;->o:Ll/wyd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/String;

    .line 8
    .line 9
    return-object p0
.end method

.method public Y2(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;",
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
    goto :goto_0

    .line 8
    :cond_0
    iget-object v0, p0, Ll/ivk0;->f:Ll/vzl;

    .line 9
    .line 10
    invoke-static {p1}, Ll/coi;->n(Ljava/util/List;)Ljava/util/List;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-interface {v0, v1}, Ll/vzl;->x(Ljava/util/List;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/ivk0;->f:Ll/vzl;

    .line 18
    .line 19
    invoke-interface {v0}, Ll/vzl;->t()Ljava/util/List;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    :goto_0
    return-void

    .line 30
    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    .line 31
    .line 32
    new-instance v1, Ll/hvk0;

    .line 33
    .line 34
    invoke-direct {v1}, Ll/hvk0;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-static {p1, v1}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 42
    .line 43
    .line 44
    invoke-direct {p0, v0}, Ll/ivk0;->m3(Ljava/util/List;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0, v0}, Ll/ivk0;->f3(Ljava/util/ArrayList;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public Z2()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/ivk0;->n:Z

    .line 3
    .line 4
    return-void
.end method

.method public final b3()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/ivk0;->n:Z

    .line 3
    .line 4
    iget-object p0, p0, Ll/ivk0;->p:Ll/grk0;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/grk0;->c3()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final c3(Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;)V
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
    iget-object v1, p0, Ll/ivk0;->p:Ll/grk0;

    .line 17
    .line 18
    iget-object v1, v1, Ll/grk0;->i:Ll/uvk0;

    .line 19
    .line 20
    invoke-virtual {v1}, Ll/uvk0;->b3()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    invoke-virtual {p0}, Ll/ahu;->K2()Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    iget-object v2, v2, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;->LiveVideoChatEvent:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$e;

    .line 29
    .line 30
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$e;->d()Ll/v3f$c;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-virtual {v2}, Ll/v3f$c;->p()V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0, p1}, Ll/ivk0;->j3(Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    check-cast p0, Ljava/lang/Boolean;

    .line 45
    .line 46
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    if-eqz p0, :cond_0

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_0
    if-eqz v1, :cond_1

    .line 54
    .line 55
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->D0:I

    .line 56
    .line 57
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 58
    .line 59
    .line 60
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 61
    .line 62
    invoke-virtual {v0, p0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    :cond_1
    :goto_0
    return-void
.end method

.method public d3()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ivk0;->g:Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;

    .line 2
    .line 3
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 4
    .line 5
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->x4:I

    .line 6
    .line 7
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;->h(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget v0, p0, Ll/ivk0;->l:I

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    const/4 v0, 0x1

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    move v0, v1

    .line 22
    :goto_0
    iget-object v2, p0, Ll/ivk0;->g:Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;

    .line 23
    .line 24
    invoke-virtual {v2, v1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;->l(Z)V

    .line 25
    .line 26
    .line 27
    iget-object v1, p0, Ll/ivk0;->g:Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;

    .line 28
    .line 29
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;->m(Z)V

    .line 30
    .line 31
    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    iget-object v0, p0, Ll/ivk0;->g:Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;

    .line 35
    .line 36
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;->FILTER:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;

    .line 37
    .line 38
    iget-object v2, p0, Ll/ivk0;->m:Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;

    .line 39
    .line 40
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;->id:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {p0, v2}, Ll/ivk0;->W2(Ljava/lang/String;)I

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;->i(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;I)V

    .line 47
    .line 48
    .line 49
    :cond_1
    iget-object v0, p0, Ll/ivk0;->k:Ljava/util/List;

    .line 50
    .line 51
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-nez v0, :cond_2

    .line 56
    .line 57
    iget-object v0, p0, Ll/ivk0;->g:Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;

    .line 58
    .line 59
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-virtual {v1}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    invoke-static {v1}, Ll/yuk0;->e(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)Z

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    iget-object v2, p0, Ll/ivk0;->m:Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;

    .line 72
    .line 73
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;->name:Ljava/lang/String;

    .line 74
    .line 75
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;->g(ZLjava/lang/String;)V

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Ll/ivk0;->h:Lv/VRecyclerView;

    .line 79
    .line 80
    iget p0, p0, Ll/ivk0;->l:I

    .line 81
    .line 82
    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V

    .line 83
    .line 84
    .line 85
    return-void

    .line 86
    :cond_2
    iget-boolean v0, p0, Ll/ivk0;->n:Z

    .line 87
    .line 88
    if-eqz v0, :cond_3

    .line 89
    .line 90
    invoke-virtual {p0}, Ll/ahu;->act()Lcom/p1/mobile/android/app/Act;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 99
    .line 100
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->y4:I

    .line 101
    .line 102
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->F(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 111
    .line 112
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->Sb:I

    .line 113
    .line 114
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    new-instance v2, Ll/fvk0;

    .line 119
    .line 120
    invoke-direct {v2, p0}, Ll/fvk0;-><init>(Ll/ivk0;)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->v0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 128
    .line 129
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->a:I

    .line 130
    .line 131
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Dialog$e;->m0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 136
    .line 137
    .line 138
    move-result-object p0

    .line 139
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 140
    .line 141
    .line 142
    return-void

    .line 143
    :cond_3
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->O2:I

    .line 144
    .line 145
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 146
    .line 147
    .line 148
    return-void
.end method

.method public e3(Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ivk0;->g:Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/ivk0;->init()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final f3(Ljava/util/ArrayList;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v2

    .line 7
    if-ge v1, v2, :cond_1

    .line 8
    .line 9
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    check-cast v2, Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;

    .line 14
    .line 15
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;->id:Ljava/lang/String;

    .line 16
    .line 17
    iget-object v3, p0, Ll/ivk0;->o:Ll/wyd0;

    .line 18
    .line 19
    invoke-virtual {v3}, Ll/azd0;->get()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    check-cast v3, Ljava/lang/CharSequence;

    .line 24
    .line 25
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-eqz v2, :cond_0

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
    invoke-virtual {p0, v0}, Ll/ivk0;->i3(I)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public g3()V
    .locals 1

    .line 1
    iget v0, p0, Ll/ivk0;->l:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/ivk0;->k3(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final h3(Ljava/lang/String;I)V
    .locals 2

    .line 1
    invoke-static {}, Ll/mbs;->o0()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p1, v0}, Ll/uyr;->o(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object v0, p0, Ll/ivk0;->i:Ljava/util/HashMap;

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ll/vxd0;

    .line 16
    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    new-instance v0, Ll/vxd0;

    .line 20
    .line 21
    const/16 v1, 0x50

    .line 22
    .line 23
    invoke-direct {v0, p1, v1}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Ll/ivk0;->i:Ljava/util/HashMap;

    .line 27
    .line 28
    invoke-virtual {p0, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    :cond_0
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {v0, p0}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public i3(I)V
    .locals 1

    .line 1
    if-ltz p1, :cond_1

    .line 2
    .line 3
    iget-object v0, p0, Ll/ivk0;->k:Ljava/util/List;

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
    iget-object v0, p0, Ll/ivk0;->k:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/ivk0;->j3(Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/ivk0;->h:Lv/VRecyclerView;

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
    iget-object v0, p0, Ll/ivk0;->j:Ll/mli;

    .line 32
    .line 33
    invoke-virtual {v0, p1}, Ll/mli;->K(I)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Ll/ivk0;->h:Lv/VRecyclerView;

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

.method public j3(Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ivk0;->m:Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iput-object p1, p0, Ll/ivk0;->m:Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;

    .line 7
    .line 8
    iget v0, p0, Ll/ivk0;->l:I

    .line 9
    .line 10
    iget-object v1, p0, Ll/ivk0;->k:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {v1, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    iput v1, p0, Ll/ivk0;->l:I

    .line 17
    .line 18
    iget-object v1, p0, Ll/ivk0;->o:Ll/wyd0;

    .line 19
    .line 20
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;->id:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {v1, p1}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    iget p1, p0, Ll/ivk0;->l:I

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Ll/ivk0;->k3(I)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, v0}, Ll/ivk0;->q3(I)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final k3(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ivk0;->f:Ll/vzl;

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
    move-result v1

    .line 11
    if-nez v1, :cond_1

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-le v1, p1, :cond_1

    .line 18
    .line 19
    if-gez p1, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    check-cast p1, Lcom/momo/mcamera/filtermanager/MMPresetFilter;

    .line 27
    .line 28
    iget-object v0, p1, Lcom/momo/mcamera/filtermanager/MMPresetFilter;->mFilterId:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {p0, v0}, Ll/ivk0;->W2(Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    iget-object v1, p0, Ll/ivk0;->f:Ll/vzl;

    .line 35
    .line 36
    iget-object p1, p1, Lcom/momo/mcamera/filtermanager/MMPresetFilter;->lookupUrl:Ljava/lang/String;

    .line 37
    .line 38
    invoke-interface {v1, p1}, Ll/vzl;->m(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0, v0}, Ll/ivk0;->n3(I)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0, v0}, Ll/ivk0;->o3(I)V

    .line 45
    .line 46
    .line 47
    :cond_1
    :goto_0
    return-void
.end method

.method public final n3(I)V
    .locals 1

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
    iget-object p0, p0, Ll/ivk0;->f:Ll/vzl;

    .line 9
    .line 10
    invoke-interface {p0, p1}, Ll/vzl;->setIntensity(F)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final o3(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ivk0;->g:Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;

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
    iget-object p0, p0, Ll/ivk0;->g:Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;

    .line 10
    .line 11
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;->FILTER:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;

    .line 12
    .line 13
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;->i(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;I)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 0

    .line 1
    invoke-virtual {p0, p2}, Ll/ivk0;->n3(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ivk0;->m:Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/widget/ProgressBar;->getProgress()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-virtual {p0, v0, p1}, Ll/ivk0;->h3(Ljava/lang/String;I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public p3(Z)V
    .locals 1

    .line 1
    iget v0, p0, Ll/ivk0;->l:I

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
    iget-object p1, p0, Ll/ivk0;->k:Ljava/util/List;

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
    iget-object p1, p0, Ll/ivk0;->h:Lv/VRecyclerView;

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
    iget-object p1, p0, Ll/ivk0;->j:Ll/mli;

    .line 30
    .line 31
    invoke-virtual {p1, v0}, Ll/mli;->K(I)V

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Ll/ivk0;->h:Lv/VRecyclerView;

    .line 35
    .line 36
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V

    .line 37
    .line 38
    .line 39
    :cond_2
    iget-object p1, p0, Ll/ivk0;->k:Ljava/util/List;

    .line 40
    .line 41
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;

    .line 46
    .line 47
    invoke-virtual {p0, p1}, Ll/ivk0;->c3(Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;)V

    .line 48
    .line 49
    .line 50
    :cond_3
    :goto_1
    return-void
.end method

.method public final q3(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ivk0;->h:Lv/VRecyclerView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    iget-object v0, p0, Ll/ivk0;->j:Ll/mli;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Ll/ivk0;->j:Ll/mli;

    .line 12
    .line 13
    iget v0, p0, Ll/ivk0;->l:I

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Ll/ivk0;->g:Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;

    .line 19
    .line 20
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;->getCurrentItem()I

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;->FILTER:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;->getIndex()I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-ne p1, v0, :cond_2

    .line 31
    .line 32
    iget-object p1, p0, Ll/ivk0;->g:Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;

    .line 33
    .line 34
    iget v0, p0, Ll/ivk0;->l:I

    .line 35
    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    const/4 v0, 0x1

    .line 39
    goto :goto_0

    .line 40
    :cond_1
    const/4 v0, 0x0

    .line 41
    :goto_0
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;->m(Z)V

    .line 42
    .line 43
    .line 44
    iget-object p1, p0, Ll/ivk0;->g:Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;

    .line 45
    .line 46
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {v0}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-static {v0}, Ll/yuk0;->e(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    iget-object p0, p0, Ll/ivk0;->m:Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;

    .line 59
    .line 60
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;->name:Ljava/lang/String;

    .line 61
    .line 62
    invoke-virtual {p1, v0, p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;->n(ZLjava/lang/String;)V

    .line 63
    .line 64
    .line 65
    :cond_2
    :goto_1
    return-void
.end method

.method public reset()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ivk0;->f:Ll/vzl;

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
    iget-object v0, p0, Ll/ivk0;->f:Ll/vzl;

    .line 15
    .line 16
    const-string v1, ""

    .line 17
    .line 18
    invoke-interface {v0, v1}, Ll/vzl;->m(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    invoke-virtual {p0, v0}, Ll/ivk0;->n3(I)V

    .line 23
    .line 24
    .line 25
    return-void
.end method
