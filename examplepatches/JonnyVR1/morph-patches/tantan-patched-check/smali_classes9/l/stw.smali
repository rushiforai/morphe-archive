.class public Ll/stw;
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

.field public j:Z

.field public k:Lv/VRecyclerView;

.field public final l:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ll/vxd0;",
            ">;"
        }
    .end annotation
.end field

.field public final m:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;",
            ">;"
        }
    .end annotation
.end field

.field public n:Ll/itw;

.field public o:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

.field public p:I

.field public final q:Ll/vxd0;


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
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Ll/stw;->j:Z

    .line 6
    .line 7
    new-instance v0, Ljava/util/HashMap;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/stw;->l:Ljava/util/HashMap;

    .line 13
    .line 14
    new-instance v0, Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Ll/stw;->m:Ljava/util/List;

    .line 20
    .line 21
    new-instance v0, Ll/vxd0;

    .line 22
    .line 23
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 24
    .line 25
    invoke-virtual {v1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-static {v1}, Ll/uyr;->h(Ljava/lang/String;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-direct {v0, v1, p1}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 34
    .line 35
    .line 36
    iput-object v0, p0, Ll/stw;->q:Ll/vxd0;

    .line 37
    .line 38
    return-void
.end method

.method public static synthetic J3(Ll/stw;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/stw;->b4()V

    return-void
.end method

.method public static synthetic K3(Ll/stw;Ll/jsv;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/stw;->Y3(Ll/jsv;)V

    return-void
.end method

.method public static synthetic L3(ILcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;)Ljava/lang/Boolean;
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

.method public static synthetic M3(Ll/stw;Ll/ttw;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/stw;->a4(Ll/ttw;)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic N3(Ll/stw;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/stw;->Z3(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic O3(ILcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;)Ljava/lang/Boolean;
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

.method public static synthetic P3(ILcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;)Ljava/lang/Boolean;
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

.method public static synthetic R3(ILcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;)Ljava/lang/Boolean;
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

.method public static synthetic S3(Ll/stw;Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/stw;->d4(Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;)V

    return-void
.end method

.method private T3(I)I
    .locals 3

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
    invoke-static {p1, v0}, Ll/uyr;->g(ILjava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Ll/stw;->l:Ljava/util/HashMap;

    .line 12
    .line 13
    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Ll/vxd0;

    .line 18
    .line 19
    if-nez v1, :cond_1

    .line 20
    .line 21
    iget-object v1, p0, Ll/stw;->m:Ljava/util/List;

    .line 22
    .line 23
    new-instance v2, Ll/otw;

    .line 24
    .line 25
    invoke-direct {v2, p1}, Ll/otw;-><init>(I)V

    .line 26
    .line 27
    .line 28
    invoke-static {v1, v2}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

    .line 33
    .line 34
    new-instance v1, Ll/vxd0;

    .line 35
    .line 36
    if-nez p1, :cond_0

    .line 37
    .line 38
    const/16 p1, 0x32

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->defaultFilterValue:I

    .line 42
    .line 43
    :goto_0
    invoke-direct {v1, v0, p1}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Ll/stw;->l:Ljava/util/HashMap;

    .line 47
    .line 48
    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    :cond_1
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    check-cast p0, Ljava/lang/Integer;

    .line 56
    .line 57
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    return p0
.end method

.method private U3(I)I
    .locals 3

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
    invoke-static {p1, v0}, Ll/uyr;->i(ILjava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Ll/stw;->l:Ljava/util/HashMap;

    .line 12
    .line 13
    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Ll/vxd0;

    .line 18
    .line 19
    if-nez v1, :cond_1

    .line 20
    .line 21
    iget-object v1, p0, Ll/stw;->m:Ljava/util/List;

    .line 22
    .line 23
    new-instance v2, Ll/ptw;

    .line 24
    .line 25
    invoke-direct {v2, p1}, Ll/ptw;-><init>(I)V

    .line 26
    .line 27
    .line 28
    invoke-static {v1, v2}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

    .line 33
    .line 34
    new-instance v1, Ll/vxd0;

    .line 35
    .line 36
    if-nez p1, :cond_0

    .line 37
    .line 38
    const/16 p1, 0x32

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->defaultBeautyValue:I

    .line 42
    .line 43
    :goto_0
    invoke-direct {v1, v0, p1}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Ll/stw;->l:Ljava/util/HashMap;

    .line 47
    .line 48
    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    :cond_1
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    check-cast p0, Ljava/lang/Integer;

    .line 56
    .line 57
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    return p0
.end method

.method private synthetic Y3(Ll/jsv;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/stw;->i:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;

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
    iget-object p0, p0, Ll/stw;->i:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;

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

.method private synthetic Z3(Ll/vxj0;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-virtual {p0, p1}, Ll/stw;->j4(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private b4()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/stw;->j:Z

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

.method private d4(Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;)V
    .locals 4

    .line 1
    sget-object v0, Ll/zrv;->c:Ll/tyr;

    .line 2
    .line 3
    iget-object v0, v0, Ll/tyr;->h:Ll/jxd0;

    .line 4
    .line 5
    iget-object v1, p0, Ll/stw;->i:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;

    .line 6
    .line 7
    iget-boolean v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->settingTogether:Z

    .line 8
    .line 9
    xor-int/lit8 v2, v2, 0x1

    .line 10
    .line 11
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->l(Z)V

    .line 12
    .line 13
    .line 14
    iget-object v1, p0, Ll/stw;->i:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;

    .line 15
    .line 16
    iget-boolean v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->settingTogether:Z

    .line 17
    .line 18
    if-eqz v2, :cond_0

    .line 19
    .line 20
    sget-object v2, Ll/zrv;->e:Landroid/app/Application;

    .line 21
    .line 22
    sget v3, Lcom/p1/mobile/putong/live/livingroom/R$string;->E0:I

    .line 23
    .line 24
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    sget-object v2, Ll/zrv;->e:Landroid/app/Application;

    .line 30
    .line 31
    sget v3, Lcom/p1/mobile/putong/live/livingroom/R$string;->x4:I

    .line 32
    .line 33
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    :goto_0
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->h(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    new-instance v1, Ll/wmi;

    .line 41
    .line 42
    const/16 v2, 0x8fe

    .line 43
    .line 44
    invoke-direct {v1, v2}, Ll/wmi;-><init>(I)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0, v1}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    check-cast v1, Ljava/lang/String;

    .line 52
    .line 53
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    iget-object v2, v2, Lcom/tantan/live/eventbus/LiveEventBus;->BeautyEvent:Lcom/tantan/live/eventbus/LiveEventBus$BeautyEvent;

    .line 58
    .line 59
    invoke-virtual {v2}, Lcom/tantan/live/eventbus/LiveEventBus$BeautyEvent;->cleanFilter()Ll/v3f$c;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    invoke-virtual {v2}, Ll/v3f$c;->p()V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0, p1}, Ll/stw;->k4(Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    check-cast p0, Ljava/lang/Boolean;

    .line 74
    .line 75
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 76
    .line 77
    .line 78
    move-result p0

    .line 79
    if-eqz p0, :cond_1

    .line 80
    .line 81
    goto :goto_1

    .line 82
    :cond_1
    const-string p0, "0"

    .line 83
    .line 84
    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    move-result p0

    .line 88
    if-nez p0, :cond_2

    .line 89
    .line 90
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->D0:I

    .line 91
    .line 92
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 93
    .line 94
    .line 95
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 96
    .line 97
    invoke-virtual {v0, p0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    :cond_2
    :goto_1
    return-void
.end method

.method private f4(Ljava/util/List;)V
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
    iget-object v2, p0, Ll/stw;->q:Ll/vxd0;

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
    invoke-virtual {p0, v0}, Ll/stw;->j4(I)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method private h4(II)V
    .locals 3

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
    invoke-static {p1, v0}, Ll/uyr;->g(ILjava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Ll/stw;->l:Ljava/util/HashMap;

    .line 12
    .line 13
    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Ll/vxd0;

    .line 18
    .line 19
    if-nez v1, :cond_1

    .line 20
    .line 21
    iget-object v1, p0, Ll/stw;->m:Ljava/util/List;

    .line 22
    .line 23
    new-instance v2, Ll/mtw;

    .line 24
    .line 25
    invoke-direct {v2, p1}, Ll/mtw;-><init>(I)V

    .line 26
    .line 27
    .line 28
    invoke-static {v1, v2}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

    .line 33
    .line 34
    new-instance v1, Ll/vxd0;

    .line 35
    .line 36
    if-nez p1, :cond_0

    .line 37
    .line 38
    const/16 p1, 0x32

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->defaultFilterValue:I

    .line 42
    .line 43
    :goto_0
    invoke-direct {v1, v0, p1}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Ll/stw;->l:Ljava/util/HashMap;

    .line 47
    .line 48
    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    :cond_1
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {v1, p0}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method private i4(II)V
    .locals 3

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
    invoke-static {p1, v0}, Ll/uyr;->i(ILjava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Ll/stw;->l:Ljava/util/HashMap;

    .line 12
    .line 13
    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Ll/vxd0;

    .line 18
    .line 19
    if-nez v1, :cond_1

    .line 20
    .line 21
    iget-object v1, p0, Ll/stw;->m:Ljava/util/List;

    .line 22
    .line 23
    new-instance v2, Ll/ntw;

    .line 24
    .line 25
    invoke-direct {v2, p1}, Ll/ntw;-><init>(I)V

    .line 26
    .line 27
    .line 28
    invoke-static {v1, v2}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

    .line 33
    .line 34
    new-instance v1, Ll/vxd0;

    .line 35
    .line 36
    if-nez p1, :cond_0

    .line 37
    .line 38
    const/16 p1, 0x32

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->defaultBeautyValue:I

    .line 42
    .line 43
    :goto_0
    invoke-direct {v1, v0, p1}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Ll/stw;->l:Ljava/util/HashMap;

    .line 47
    .line 48
    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    :cond_1
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {v1, p0}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method private init()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/stw;->i:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->getMakeUpStyleView()Lv/VRecyclerView;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iput-object v0, p0, Ll/stw;->k:Lv/VRecyclerView;

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
    iget-object v1, p0, Ll/stw;->k:Lv/VRecyclerView;

    .line 23
    .line 24
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 25
    .line 26
    .line 27
    new-instance v0, Ll/itw;

    .line 28
    .line 29
    iget-object v1, p0, Ll/stw;->m:Ljava/util/List;

    .line 30
    .line 31
    new-instance v2, Ll/rtw;

    .line 32
    .line 33
    invoke-direct {v2, p0}, Ll/rtw;-><init>(Ll/stw;)V

    .line 34
    .line 35
    .line 36
    invoke-direct {v0, v1, v2}, Ll/itw;-><init>(Ljava/util/List;Ll/y20;)V

    .line 37
    .line 38
    .line 39
    iput-object v0, p0, Ll/stw;->n:Ll/itw;

    .line 40
    .line 41
    iget-object v1, p0, Ll/stw;->k:Lv/VRecyclerView;

    .line 42
    .line 43
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Ll/stw;->o:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

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
    iget v0, p0, Ll/stw;->p:I

    .line 55
    .line 56
    invoke-virtual {p0, v0}, Ll/stw;->j4(I)V

    .line 57
    .line 58
    .line 59
    :cond_0
    return-void
.end method

.method private l4(I)V
    .locals 2

    .line 1
    new-instance v0, Ll/k210;

    .line 2
    .line 3
    const/16 v1, 0x8fe

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
    iget-object v1, p0, Ll/stw;->m:Ljava/util/List;

    .line 15
    .line 16
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-nez v1, :cond_2

    .line 21
    .line 22
    if-gez p1, :cond_0

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    if-nez p1, :cond_1

    .line 26
    .line 27
    invoke-interface {v0}, Ll/uzl;->F()V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    iget-object v0, p0, Ll/stw;->m:Ljava/util/List;

    .line 32
    .line 33
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

    .line 38
    .line 39
    iget v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->id:I

    .line 40
    .line 41
    invoke-direct {p0, v0}, Ll/stw;->T3(I)I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    iget-object v1, p0, Ll/stw;->m:Ljava/util/List;

    .line 46
    .line 47
    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

    .line 52
    .line 53
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->id:I

    .line 54
    .line 55
    invoke-direct {p0, p1}, Ll/stw;->U3(I)I

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    invoke-direct {p0, v0, p1}, Ll/stw;->p4(II)V

    .line 60
    .line 61
    .line 62
    invoke-direct {p0, v0, p1}, Ll/stw;->o4(II)V

    .line 63
    .line 64
    .line 65
    :cond_2
    :goto_0
    return-void
.end method

.method private m4(Ljava/util/List;)V
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
    iget-object v0, p0, Ll/stw;->m:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/stw;->m:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Ll/stw;->n:Ll/itw;

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
    iget-object p0, p0, Ll/stw;->n:Ll/itw;

    .line 20
    .line 21
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method private n4(I)V
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
    const/16 v1, 0x8fe

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
    iget-object p0, p0, Ll/stw;->o:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

    .line 22
    .line 23
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->id:I

    .line 24
    .line 25
    sget-object v1, Lcom/p1/mobile/putong/live/base/mmsdk/beauty/ByteDanceHelper$MakeupStyleType;->FILTER:Lcom/p1/mobile/putong/live/base/mmsdk/beauty/ByteDanceHelper$MakeupStyleType;

    .line 26
    .line 27
    invoke-interface {v0, p0, v1, p1}, Ll/uzl;->s(ILcom/p1/mobile/putong/live/base/mmsdk/beauty/ByteDanceHelper$MakeupStyleType;F)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method private o4(II)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/stw;->i:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;

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
    iget-object v0, p0, Ll/stw;->i:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;

    .line 10
    .line 11
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;->MAKE_UP:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;

    .line 12
    .line 13
    invoke-virtual {v0, v1, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->i(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;I)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ll/stw;->i:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;

    .line 17
    .line 18
    invoke-virtual {p0, v1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->j(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;I)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method private p4(II)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/stw;->n4(I)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p2}, Ll/stw;->q4(I)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private q4(I)V
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
    const/16 v1, 0x8fe

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
    iget-object p0, p0, Ll/stw;->o:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

    .line 22
    .line 23
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->id:I

    .line 24
    .line 25
    sget-object v1, Lcom/p1/mobile/putong/live/base/mmsdk/beauty/ByteDanceHelper$MakeupStyleType;->MAKEUP:Lcom/p1/mobile/putong/live/base/mmsdk/beauty/ByteDanceHelper$MakeupStyleType;

    .line 26
    .line 27
    invoke-interface {v0, p0, v1, p1}, Ll/uzl;->s(ILcom/p1/mobile/putong/live/base/mmsdk/beauty/ByteDanceHelper$MakeupStyleType;F)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method private s4(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/stw;->k:Lv/VRecyclerView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    iget-object v0, p0, Ll/stw;->n:Ll/itw;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Ll/stw;->n:Ll/itw;

    .line 12
    .line 13
    iget v0, p0, Ll/stw;->p:I

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Ll/stw;->i:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;

    .line 19
    .line 20
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->getCurrentItem()I

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
    iget-object p1, p0, Ll/stw;->i:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;

    .line 33
    .line 34
    iget v0, p0, Ll/stw;->p:I

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
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->m(Z)V

    .line 44
    .line 45
    .line 46
    iget-object p1, p0, Ll/stw;->i:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;

    .line 47
    .line 48
    iget v0, p0, Ll/stw;->p:I

    .line 49
    .line 50
    if-eqz v0, :cond_2

    .line 51
    .line 52
    move v1, v2

    .line 53
    :cond_2
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->l(Z)V

    .line 54
    .line 55
    .line 56
    iget-object p1, p0, Ll/stw;->i:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;

    .line 57
    .line 58
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {v0}, Ll/vp20;->m()Ll/jsv;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {v0}, Ll/jsv;->f()Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    iget-object p0, p0, Ll/stw;->o:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

    .line 71
    .line 72
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->name:Ljava/lang/String;

    .line 73
    .line 74
    invoke-virtual {p1, v0, p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->n(ZLjava/lang/String;)V

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
    new-instance v1, Ll/jtw;

    .line 31
    .line 32
    invoke-direct {v1, p0}, Ll/jtw;-><init>(Ll/stw;)V

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
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$BeautyEvent;->clearMakeUpStyle()Ll/v3f$c;

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
    new-instance v1, Ll/ktw;

    .line 63
    .line 64
    invoke-direct {v1, p0}, Ll/ktw;-><init>(Ll/stw;)V

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
    new-instance v0, Ll/ltw;

    .line 75
    .line 76
    invoke-direct {v0, p0}, Ll/ltw;-><init>(Ll/stw;)V

    .line 77
    .line 78
    .line 79
    const-class v1, Ll/ttw;

    .line 80
    .line 81
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method public V3()Ljava/util/Map;
    .locals 4
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
    iget-object v1, p0, Ll/stw;->o:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

    .line 7
    .line 8
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eqz v1, :cond_2

    .line 13
    .line 14
    iget-object v1, p0, Ll/stw;->o:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

    .line 15
    .line 16
    iget v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->id:I

    .line 17
    .line 18
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    const-string v2, "makeup_style_id"

    .line 23
    .line 24
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    iget-object v1, p0, Ll/stw;->o:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

    .line 28
    .line 29
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->name:Ljava/lang/String;

    .line 30
    .line 31
    const-string v2, "makeup_style_name"

    .line 32
    .line 33
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    iget v1, p0, Ll/stw;->p:I

    .line 37
    .line 38
    const-string v2, "0"

    .line 39
    .line 40
    if-nez v1, :cond_0

    .line 41
    .line 42
    move-object v1, v2

    .line 43
    goto :goto_0

    .line 44
    :cond_0
    iget-object v1, p0, Ll/stw;->o:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

    .line 45
    .line 46
    iget v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->id:I

    .line 47
    .line 48
    invoke-direct {p0, v1}, Ll/stw;->T3(I)I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    :goto_0
    const-string v3, "makeup_style_filter_value"

    .line 57
    .line 58
    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    iget v1, p0, Ll/stw;->p:I

    .line 62
    .line 63
    if-nez v1, :cond_1

    .line 64
    .line 65
    goto :goto_1

    .line 66
    :cond_1
    iget-object v1, p0, Ll/stw;->o:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

    .line 67
    .line 68
    iget v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->id:I

    .line 69
    .line 70
    invoke-direct {p0, v1}, Ll/stw;->U3(I)I

    .line 71
    .line 72
    .line 73
    move-result p0

    .line 74
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    :goto_1
    const-string p0, "makeup_style_makeup_value"

    .line 79
    .line 80
    invoke-interface {v0, p0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    :cond_2
    return-object v0
.end method

.method public W3(Ljava/util/List;)V
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
    invoke-direct {p0, p1}, Ll/stw;->m4(Ljava/util/List;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0, p1}, Ll/stw;->f4(Ljava/util/List;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public X3()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/stw;->j:Z

    .line 3
    .line 4
    return-void
.end method

.method public final synthetic a4(Ll/ttw;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/stw;->q:Ll/vxd0;

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
    return-object p0
.end method

.method public c4(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/stw;->i:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/stw;->init()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public e4()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/stw;->i:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;

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
    iget v0, p0, Ll/stw;->p:I

    .line 15
    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    const/4 v0, 0x1

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 v0, 0x0

    .line 21
    :goto_0
    iget-object v1, p0, Ll/stw;->i:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;

    .line 22
    .line 23
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->l(Z)V

    .line 24
    .line 25
    .line 26
    iget-object v1, p0, Ll/stw;->i:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;

    .line 27
    .line 28
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->m(Z)V

    .line 29
    .line 30
    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    iget-object v0, p0, Ll/stw;->i:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;

    .line 34
    .line 35
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;->MAKE_UP:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;

    .line 36
    .line 37
    iget-object v2, p0, Ll/stw;->o:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

    .line 38
    .line 39
    iget v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->id:I

    .line 40
    .line 41
    invoke-direct {p0, v2}, Ll/stw;->T3(I)I

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->i(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;I)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Ll/stw;->i:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;

    .line 49
    .line 50
    iget-object v2, p0, Ll/stw;->o:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

    .line 51
    .line 52
    iget v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->id:I

    .line 53
    .line 54
    invoke-direct {p0, v2}, Ll/stw;->U3(I)I

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->j(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;I)V

    .line 59
    .line 60
    .line 61
    :cond_1
    iget-object v0, p0, Ll/stw;->m:Ljava/util/List;

    .line 62
    .line 63
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-nez v0, :cond_2

    .line 68
    .line 69
    iget-object v0, p0, Ll/stw;->i:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;

    .line 70
    .line 71
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    invoke-virtual {v1}, Ll/vp20;->m()Ll/jsv;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-virtual {v1}, Ll/jsv;->f()Z

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    iget-object v2, p0, Ll/stw;->o:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

    .line 84
    .line 85
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->name:Ljava/lang/String;

    .line 86
    .line 87
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->g(ZLjava/lang/String;)V

    .line 88
    .line 89
    .line 90
    iget-object v0, p0, Ll/stw;->k:Lv/VRecyclerView;

    .line 91
    .line 92
    iget p0, p0, Ll/stw;->p:I

    .line 93
    .line 94
    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V

    .line 95
    .line 96
    .line 97
    return-void

    .line 98
    :cond_2
    iget-boolean v0, p0, Ll/stw;->j:Z

    .line 99
    .line 100
    if-eqz v0, :cond_3

    .line 101
    .line 102
    iget-object v0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 103
    .line 104
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 109
    .line 110
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->j7:I

    .line 111
    .line 112
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->F(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 121
    .line 122
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->Sb:I

    .line 123
    .line 124
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object v1

    .line 128
    new-instance v2, Ll/qtw;

    .line 129
    .line 130
    invoke-direct {v2, p0}, Ll/qtw;-><init>(Ll/stw;)V

    .line 131
    .line 132
    .line 133
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->v0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 134
    .line 135
    .line 136
    move-result-object p0

    .line 137
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 138
    .line 139
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->a:I

    .line 140
    .line 141
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Dialog$e;->m0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 146
    .line 147
    .line 148
    move-result-object p0

    .line 149
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 150
    .line 151
    .line 152
    return-void

    .line 153
    :cond_3
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->O2:I

    .line 154
    .line 155
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 156
    .line 157
    .line 158
    return-void
.end method

.method public g4()V
    .locals 1

    .line 1
    iget v0, p0, Ll/stw;->p:I

    .line 2
    .line 3
    invoke-direct {p0, v0}, Ll/stw;->l4(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public j4(I)V
    .locals 1

    .line 1
    if-ltz p1, :cond_1

    .line 2
    .line 3
    iget-object v0, p0, Ll/stw;->m:Ljava/util/List;

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
    iget-object v0, p0, Ll/stw;->m:Ljava/util/List;

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
    invoke-virtual {p0, v0}, Ll/stw;->k4(Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/stw;->k:Lv/VRecyclerView;

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
    iget-object v0, p0, Ll/stw;->n:Ll/itw;

    .line 32
    .line 33
    invoke-virtual {v0, p1}, Ll/itw;->K(I)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Ll/stw;->k:Lv/VRecyclerView;

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

.method public k4(Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/stw;->o:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iput-object p1, p0, Ll/stw;->o:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

    .line 7
    .line 8
    iget v0, p0, Ll/stw;->p:I

    .line 9
    .line 10
    iget-object v1, p0, Ll/stw;->m:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {v1, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    iput v1, p0, Ll/stw;->p:I

    .line 17
    .line 18
    iget-object v1, p0, Ll/stw;->q:Ll/vxd0;

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
    invoke-direct {p0, v0}, Ll/stw;->s4(I)V

    .line 30
    .line 31
    .line 32
    iget p1, p0, Ll/stw;->p:I

    .line 33
    .line 34
    invoke-direct {p0, p1}, Ll/stw;->l4(I)V

    .line 35
    .line 36
    .line 37
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
    iget-object p1, p0, Ll/stw;->o:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

    .line 8
    .line 9
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->settingTogether:Z

    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    invoke-direct {p0, p2, p2}, Ll/stw;->p4(II)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-direct {p0, p2}, Ll/stw;->n4(I)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_1
    invoke-direct {p0, p2}, Ll/stw;->q4(I)V

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
    iget-object v1, p0, Ll/stw;->o:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

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
    invoke-direct {p0, v0, p1}, Ll/stw;->h4(II)V

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
    invoke-direct {p0, v0, p1}, Ll/stw;->i4(II)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public r4(Z)V
    .locals 1

    .line 1
    iget v0, p0, Ll/stw;->p:I

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
    iget-object p1, p0, Ll/stw;->m:Ljava/util/List;

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
    iget-object p1, p0, Ll/stw;->k:Lv/VRecyclerView;

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
    iget-object p1, p0, Ll/stw;->n:Ll/itw;

    .line 30
    .line 31
    invoke-virtual {p1, v0}, Ll/itw;->K(I)V

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Ll/stw;->k:Lv/VRecyclerView;

    .line 35
    .line 36
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V

    .line 37
    .line 38
    .line 39
    :cond_2
    iget-object p1, p0, Ll/stw;->m:Ljava/util/List;

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
    invoke-direct {p0, p1}, Ll/stw;->d4(Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;)V

    .line 48
    .line 49
    .line 50
    :cond_3
    :goto_1
    return-void
.end method

.method public reset()V
    .locals 2

    .line 1
    new-instance v0, Ll/k210;

    .line 2
    .line 3
    const/16 v1, 0x8fe

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
    move-result-object p0

    .line 12
    check-cast p0, Ll/uzl;

    .line 13
    .line 14
    invoke-interface {p0}, Ll/uzl;->t()Ljava/util/List;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    invoke-interface {p0}, Ll/uzl;->F()V

    .line 26
    .line 27
    .line 28
    return-void
.end method
