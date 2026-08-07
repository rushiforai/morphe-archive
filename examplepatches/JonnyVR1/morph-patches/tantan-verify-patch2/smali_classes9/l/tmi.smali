.class public Ll/tmi;
.super Ll/qct;
.source "SourceFile"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/oo2;",
        ">",
        "Ll/qct<",
        "TD;>;",
        "Landroid/widget/SeekBar$OnSeekBarChangeListener;"
    }
.end annotation


# instance fields
.field public i:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;

.field public j:Lv/VRecyclerView;

.field public final k:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ll/vxd0;",
            ">;"
        }
    .end annotation
.end field

.field public l:Ll/mli;

.field public final m:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;",
            ">;"
        }
    .end annotation
.end field

.field public n:I

.field public o:Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;

.field public p:Z

.field public final q:Ll/wyd0;


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "TD;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

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
    iput-object p1, p0, Ll/tmi;->k:Ljava/util/HashMap;

    .line 10
    .line 11
    new-instance p1, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Ll/tmi;->m:Ljava/util/List;

    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    iput-boolean p1, p0, Ll/tmi;->p:Z

    .line 20
    .line 21
    new-instance p1, Ll/wyd0;

    .line 22
    .line 23
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 24
    .line 25
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-static {v0}, Ll/uyr;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const-string v1, "0"

    .line 34
    .line 35
    invoke-direct {p1, v0, v1}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    iput-object p1, p0, Ll/tmi;->q:Ll/wyd0;

    .line 39
    .line 40
    return-void
.end method

.method public static synthetic J3(Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;)Ljava/lang/Boolean;
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

.method public static synthetic K3(Ll/tmi;Ll/wmi;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tmi;->W3(Ll/wmi;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic L3(Ll/tmi;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/tmi;->V3(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic M3(Ll/tmi;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/tmi;->X3()V

    return-void
.end method

.method public static synthetic N3(Ll/tmi;Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/tmi;->Z3(Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;)V

    return-void
.end method

.method public static synthetic O3(Ll/tmi;Ll/jsv;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/tmi;->U3(Ll/jsv;)V

    return-void
.end method

.method private P3(Ljava/lang/String;)I
    .locals 2

    .line 1
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p1, v0}, Ll/uyr;->e(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iget-object v0, p0, Ll/tmi;->k:Ljava/util/HashMap;

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ll/vxd0;

    .line 18
    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    new-instance v0, Ll/vxd0;

    .line 22
    .line 23
    const/16 v1, 0x50

    .line 24
    .line 25
    invoke-direct {v0, p1, v1}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Ll/tmi;->k:Ljava/util/HashMap;

    .line 29
    .line 30
    invoke-virtual {p0, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    :cond_0
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    check-cast p0, Ljava/lang/Integer;

    .line 38
    .line 39
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    return p0
.end method

.method private synthetic U3(Ll/jsv;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/tmi;->i:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/tmi;->i:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    const-string v0, ""

    .line 13
    .line 14
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->g(ZLjava/lang/String;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method private synthetic V3(Ll/vxj0;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-virtual {p0, p1}, Ll/tmi;->e4(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private X3()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/tmi;->p:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->BeautyEvent:Lcom/tantan/live/eventbus/LiveEventBus$BeautyEvent;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$BeautyEvent;->loadBeautyConfig()Ll/v3f$c;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method private Z3(Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;)V
    .locals 3

    .line 1
    sget-object v0, Ll/zrv;->c:Ll/tyr;

    .line 2
    .line 3
    iget-object v0, v0, Ll/tyr;->h:Ll/jxd0;

    .line 4
    .line 5
    new-instance v1, Ll/ttw;

    .line 6
    .line 7
    const/16 v2, 0x8fd

    .line 8
    .line 9
    invoke-direct {v1, v2}, Ll/ttw;-><init>(I)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v1}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    check-cast v1, Ljava/lang/Integer;

    .line 17
    .line 18
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    iget-object v2, v2, Lcom/tantan/live/eventbus/LiveEventBus;->BeautyEvent:Lcom/tantan/live/eventbus/LiveEventBus$BeautyEvent;

    .line 27
    .line 28
    invoke-virtual {v2}, Lcom/tantan/live/eventbus/LiveEventBus$BeautyEvent;->clearMakeUpStyle()Ll/v3f$c;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    invoke-virtual {v2}, Ll/v3f$c;->p()V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0, p1}, Ll/tmi;->f4(Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    check-cast p0, Ljava/lang/Boolean;

    .line 43
    .line 44
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    if-eqz p0, :cond_0

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_0
    if-eqz v1, :cond_1

    .line 52
    .line 53
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->D0:I

    .line 54
    .line 55
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 56
    .line 57
    .line 58
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 59
    .line 60
    invoke-virtual {v0, p0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    :cond_1
    :goto_0
    return-void
.end method

.method private b4(Ljava/util/ArrayList;)V
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
    iget-object v3, p0, Ll/tmi;->q:Ll/wyd0;

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
    invoke-virtual {p0, v0}, Ll/tmi;->e4(I)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method private d4(Ljava/lang/String;I)V
    .locals 2

    .line 1
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p1, v0}, Ll/uyr;->e(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iget-object v0, p0, Ll/tmi;->k:Ljava/util/HashMap;

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ll/vxd0;

    .line 18
    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    new-instance v0, Ll/vxd0;

    .line 22
    .line 23
    const/16 v1, 0x50

    .line 24
    .line 25
    invoke-direct {v0, p1, v1}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Ll/tmi;->k:Ljava/util/HashMap;

    .line 29
    .line 30
    invoke-virtual {p0, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    :cond_0
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {v0, p0}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method private g4(I)V
    .locals 3

    .line 1
    new-instance v0, Ll/k210;

    .line 2
    .line 3
    const/16 v1, 0x8fd

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/k210;-><init>(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Ll/uzl;

    .line 13
    .line 14
    invoke-interface {v0}, Ll/uzl;->t()Ljava/util/List;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-nez v2, :cond_1

    .line 23
    .line 24
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    if-le v2, p1, :cond_1

    .line 29
    .line 30
    if-gez p1, :cond_0

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    check-cast p1, Lcom/momo/mcamera/filtermanager/MMPresetFilter;

    .line 38
    .line 39
    iget-object v1, p1, Lcom/momo/mcamera/filtermanager/MMPresetFilter;->mFilterId:Ljava/lang/String;

    .line 40
    .line 41
    invoke-direct {p0, v1}, Ll/tmi;->P3(Ljava/lang/String;)I

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    iget-object p1, p1, Lcom/momo/mcamera/filtermanager/MMPresetFilter;->lookupUrl:Ljava/lang/String;

    .line 46
    .line 47
    invoke-interface {v0, p1}, Ll/uzl;->m(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    invoke-direct {p0, v1}, Ll/tmi;->i4(I)V

    .line 51
    .line 52
    .line 53
    invoke-direct {p0, v1}, Ll/tmi;->j4(I)V

    .line 54
    .line 55
    .line 56
    :cond_1
    :goto_0
    return-void
.end method

.method private h4(Ljava/util/List;)V
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
    iget-object v0, p0, Ll/tmi;->m:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/tmi;->m:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Ll/tmi;->l:Ll/mli;

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
    iget-object p0, p0, Ll/tmi;->l:Ll/mli;

    .line 20
    .line 21
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method private i4(I)V
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
    new-instance v0, Ll/k210;

    .line 9
    .line 10
    const/16 v1, 0x8fd

    .line 11
    .line 12
    invoke-direct {v0, v1}, Ll/k210;-><init>(I)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Ll/uzl;

    .line 20
    .line 21
    invoke-interface {p0, p1}, Ll/uzl;->setIntensity(F)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method private init()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/tmi;->i:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->getFilterView()Lv/VRecyclerView;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iput-object v0, p0, Ll/tmi;->j:Lv/VRecyclerView;

    .line 8
    .line 9
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

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
    iget-object v1, p0, Ll/tmi;->j:Lv/VRecyclerView;

    .line 23
    .line 24
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 25
    .line 26
    .line 27
    new-instance v0, Ll/mli;

    .line 28
    .line 29
    iget-object v1, p0, Ll/tmi;->m:Ljava/util/List;

    .line 30
    .line 31
    new-instance v2, Ll/smi;

    .line 32
    .line 33
    invoke-direct {v2, p0}, Ll/smi;-><init>(Ll/tmi;)V

    .line 34
    .line 35
    .line 36
    invoke-direct {v0, v1, v2}, Ll/mli;-><init>(Ljava/util/List;Ll/y20;)V

    .line 37
    .line 38
    .line 39
    iput-object v0, p0, Ll/tmi;->l:Ll/mli;

    .line 40
    .line 41
    iget-object v1, p0, Ll/tmi;->j:Lv/VRecyclerView;

    .line 42
    .line 43
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Ll/tmi;->o:Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;

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
    iget v0, p0, Ll/tmi;->n:I

    .line 55
    .line 56
    invoke-virtual {p0, v0}, Ll/tmi;->e4(I)V

    .line 57
    .line 58
    .line 59
    :cond_0
    return-void
.end method

.method private j4(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/tmi;->i:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;

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
    iget-object p0, p0, Ll/tmi;->i:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;

    .line 10
    .line 11
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;->FILTER:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;

    .line 12
    .line 13
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->i(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;I)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method private l4(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/tmi;->j:Lv/VRecyclerView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    iget-object v0, p0, Ll/tmi;->l:Ll/mli;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Ll/tmi;->l:Ll/mli;

    .line 12
    .line 13
    iget v0, p0, Ll/tmi;->n:I

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Ll/tmi;->i:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;

    .line 19
    .line 20
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->getCurrentItem()I

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
    iget-object p1, p0, Ll/tmi;->i:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;

    .line 33
    .line 34
    iget v0, p0, Ll/tmi;->n:I

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
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->m(Z)V

    .line 42
    .line 43
    .line 44
    iget-object p1, p0, Ll/tmi;->i:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;

    .line 45
    .line 46
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {v0}, Ll/vp20;->m()Ll/jsv;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {v0}, Ll/jsv;->f()Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    iget-object p0, p0, Ll/tmi;->o:Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;

    .line 59
    .line 60
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;->name:Ljava/lang/String;

    .line 61
    .line 62
    invoke-virtual {p1, v0, p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->n(ZLjava/lang/String;)V

    .line 63
    .line 64
    .line 65
    :cond_2
    :goto_1
    return-void
.end method


# virtual methods
.method public R3()Ljava/util/Map;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/tmi;->o:Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;

    .line 7
    .line 8
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eqz v1, :cond_1

    .line 13
    .line 14
    iget-object v1, p0, Ll/tmi;->o:Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;

    .line 15
    .line 16
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;->id:Ljava/lang/String;

    .line 17
    .line 18
    const-string v2, "filter_id"

    .line 19
    .line 20
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    iget-object v1, p0, Ll/tmi;->o:Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;

    .line 24
    .line 25
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;->name:Ljava/lang/String;

    .line 26
    .line 27
    const-string v2, "filter_name"

    .line 28
    .line 29
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    iget v1, p0, Ll/tmi;->n:I

    .line 33
    .line 34
    if-nez v1, :cond_0

    .line 35
    .line 36
    const-string p0, "0"

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    iget-object v1, p0, Ll/tmi;->o:Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;

    .line 40
    .line 41
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;->id:Ljava/lang/String;

    .line 42
    .line 43
    invoke-direct {p0, v1}, Ll/tmi;->P3(Ljava/lang/String;)I

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    :goto_0
    const-string v1, "filter_value"

    .line 52
    .line 53
    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    :cond_1
    return-object v0
.end method

.method public S3(Ljava/util/List;)V
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
    new-instance v0, Ll/k210;

    .line 9
    .line 10
    const/16 v1, 0x8fd

    .line 11
    .line 12
    invoke-direct {v0, v1}, Ll/k210;-><init>(I)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Ll/uzl;

    .line 20
    .line 21
    invoke-static {p1}, Ll/coi;->n(Ljava/util/List;)Ljava/util/List;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-interface {v0, v1}, Ll/uzl;->x(Ljava/util/List;)V

    .line 26
    .line 27
    .line 28
    invoke-interface {v0}, Ll/uzl;->t()Ljava/util/List;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    :goto_0
    return-void

    .line 39
    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    .line 40
    .line 41
    new-instance v1, Ll/qmi;

    .line 42
    .line 43
    invoke-direct {v1}, Ll/qmi;-><init>()V

    .line 44
    .line 45
    .line 46
    invoke-static {p1, v1}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 51
    .line 52
    .line 53
    invoke-direct {p0, v0}, Ll/tmi;->h4(Ljava/util/List;)V

    .line 54
    .line 55
    .line 56
    invoke-direct {p0, v0}, Ll/tmi;->b4(Ljava/util/ArrayList;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ll/vp20;->l()Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v1, Ll/mbt;

    .line 17
    .line 18
    invoke-direct {v1}, Ll/mbt;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const/4 v1, 0x1

    .line 26
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    new-instance v1, Ll/nmi;

    .line 31
    .line 32
    invoke-direct {v1, p0}, Ll/nmi;-><init>(Ll/tmi;)V

    .line 33
    .line 34
    .line 35
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->BeautyEvent:Lcom/tantan/live/eventbus/LiveEventBus$BeautyEvent;

    .line 47
    .line 48
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$BeautyEvent;->cleanFilter()Ll/v3f$c;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    check-cast v0, Lrx/c;

    .line 57
    .line 58
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    new-instance v1, Ll/omi;

    .line 63
    .line 64
    invoke-direct {v1, p0}, Ll/omi;-><init>(Ll/tmi;)V

    .line 65
    .line 66
    .line 67
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 72
    .line 73
    .line 74
    new-instance v0, Ll/pmi;

    .line 75
    .line 76
    invoke-direct {v0, p0}, Ll/pmi;-><init>(Ll/tmi;)V

    .line 77
    .line 78
    .line 79
    const-class v1, Ll/wmi;

    .line 80
    .line 81
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method public T3()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/tmi;->p:Z

    .line 3
    .line 4
    return-void
.end method

.method public final synthetic W3(Ll/wmi;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tmi;->q:Ll/wyd0;

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

.method public Y3(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tmi;->i:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/tmi;->init()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public a4()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/tmi;->i:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;

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
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->h(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget v0, p0, Ll/tmi;->n:I

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
    iget-object v2, p0, Ll/tmi;->i:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;

    .line 23
    .line 24
    invoke-virtual {v2, v1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->l(Z)V

    .line 25
    .line 26
    .line 27
    iget-object v1, p0, Ll/tmi;->i:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;

    .line 28
    .line 29
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->m(Z)V

    .line 30
    .line 31
    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    iget-object v0, p0, Ll/tmi;->i:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;

    .line 35
    .line 36
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;->FILTER:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;

    .line 37
    .line 38
    iget-object v2, p0, Ll/tmi;->o:Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;

    .line 39
    .line 40
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;->id:Ljava/lang/String;

    .line 41
    .line 42
    invoke-direct {p0, v2}, Ll/tmi;->P3(Ljava/lang/String;)I

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->i(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;I)V

    .line 47
    .line 48
    .line 49
    :cond_1
    iget-object v0, p0, Ll/tmi;->m:Ljava/util/List;

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
    iget-object v0, p0, Ll/tmi;->i:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;

    .line 58
    .line 59
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-virtual {v1}, Ll/vp20;->m()Ll/jsv;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    invoke-virtual {v1}, Ll/jsv;->f()Z

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    iget-object v2, p0, Ll/tmi;->o:Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;

    .line 72
    .line 73
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;->name:Ljava/lang/String;

    .line 74
    .line 75
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->g(ZLjava/lang/String;)V

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Ll/tmi;->j:Lv/VRecyclerView;

    .line 79
    .line 80
    iget p0, p0, Ll/tmi;->n:I

    .line 81
    .line 82
    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V

    .line 83
    .line 84
    .line 85
    return-void

    .line 86
    :cond_2
    iget-boolean v0, p0, Ll/tmi;->p:Z

    .line 87
    .line 88
    if-eqz v0, :cond_3

    .line 89
    .line 90
    iget-object v0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 91
    .line 92
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 97
    .line 98
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->y4:I

    .line 99
    .line 100
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->F(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 109
    .line 110
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->Sb:I

    .line 111
    .line 112
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    new-instance v2, Ll/rmi;

    .line 117
    .line 118
    invoke-direct {v2, p0}, Ll/rmi;-><init>(Ll/tmi;)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->v0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 126
    .line 127
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->a:I

    .line 128
    .line 129
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Dialog$e;->m0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 134
    .line 135
    .line 136
    move-result-object p0

    .line 137
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 138
    .line 139
    .line 140
    return-void

    .line 141
    :cond_3
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->O2:I

    .line 142
    .line 143
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 144
    .line 145
    .line 146
    return-void
.end method

.method public c4()V
    .locals 1

    .line 1
    iget v0, p0, Ll/tmi;->n:I

    .line 2
    .line 3
    invoke-direct {p0, v0}, Ll/tmi;->g4(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public e4(I)V
    .locals 1

    .line 1
    if-ltz p1, :cond_1

    .line 2
    .line 3
    iget-object v0, p0, Ll/tmi;->m:Ljava/util/List;

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
    iget-object v0, p0, Ll/tmi;->m:Ljava/util/List;

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
    invoke-virtual {p0, v0}, Ll/tmi;->f4(Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/tmi;->j:Lv/VRecyclerView;

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
    iget-object v0, p0, Ll/tmi;->l:Ll/mli;

    .line 32
    .line 33
    invoke-virtual {v0, p1}, Ll/mli;->K(I)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Ll/tmi;->j:Lv/VRecyclerView;

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

.method public f4(Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/tmi;->o:Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iput-object p1, p0, Ll/tmi;->o:Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;

    .line 7
    .line 8
    iget v0, p0, Ll/tmi;->n:I

    .line 9
    .line 10
    iget-object v1, p0, Ll/tmi;->m:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {v1, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    iput v1, p0, Ll/tmi;->n:I

    .line 17
    .line 18
    iget-object v1, p0, Ll/tmi;->q:Ll/wyd0;

    .line 19
    .line 20
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;->id:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {v1, p1}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    iget p1, p0, Ll/tmi;->n:I

    .line 26
    .line 27
    invoke-direct {p0, p1}, Ll/tmi;->g4(I)V

    .line 28
    .line 29
    .line 30
    invoke-direct {p0, v0}, Ll/tmi;->l4(I)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public k4(Z)V
    .locals 1

    .line 1
    iget v0, p0, Ll/tmi;->n:I

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
    iget-object p1, p0, Ll/tmi;->m:Ljava/util/List;

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
    iget-object p1, p0, Ll/tmi;->j:Lv/VRecyclerView;

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
    iget-object p1, p0, Ll/tmi;->l:Ll/mli;

    .line 30
    .line 31
    invoke-virtual {p1, v0}, Ll/mli;->K(I)V

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Ll/tmi;->j:Lv/VRecyclerView;

    .line 35
    .line 36
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V

    .line 37
    .line 38
    .line 39
    :cond_2
    iget-object p1, p0, Ll/tmi;->m:Ljava/util/List;

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
    invoke-direct {p0, p1}, Ll/tmi;->Z3(Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;)V

    .line 48
    .line 49
    .line 50
    :cond_3
    :goto_1
    return-void
.end method

.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 0

    .line 1
    invoke-direct {p0, p2}, Ll/tmi;->i4(I)V

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
    iget-object v0, p0, Ll/tmi;->o:Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;

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
    invoke-direct {p0, v0, p1}, Ll/tmi;->d4(Ljava/lang/String;I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public reset()V
    .locals 2

    .line 1
    new-instance v0, Ll/k210;

    .line 2
    .line 3
    const/16 v1, 0x8fd

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/k210;-><init>(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Ll/uzl;

    .line 13
    .line 14
    invoke-interface {v0}, Ll/uzl;->t()Ljava/util/List;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    const-string v1, ""

    .line 26
    .line 27
    invoke-interface {v0, v1}, Ll/uzl;->m(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    const/4 v0, 0x0

    .line 31
    invoke-direct {p0, v0}, Ll/tmi;->i4(I)V

    .line 32
    .line 33
    .line 34
    return-void
.end method
