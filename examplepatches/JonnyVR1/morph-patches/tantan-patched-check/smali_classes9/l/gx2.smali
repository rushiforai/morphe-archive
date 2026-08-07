.class public Ll/gx2;
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

.field public k:Ll/xu2;

.field public final l:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;",
            ">;"
        }
    .end annotation
.end field

.field public m:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

.field public final n:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ll/nxd0;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0
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
    new-instance p1, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/gx2;->l:Ljava/util/List;

    .line 10
    .line 11
    new-instance p1, Ljava/util/HashMap;

    .line 12
    .line 13
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Ll/gx2;->n:Ljava/util/Map;

    .line 17
    .line 18
    return-void
.end method

.method public static synthetic J3(Ll/gx2;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/gx2;->a4()V

    return-void
.end method

.method public static synthetic K3(Ll/gx2;Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/gx2;->e4(Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;)V

    return-void
.end method

.method public static synthetic L3(Ll/gx2;Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/gx2;->h4(Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;)V

    return-void
.end method

.method public static synthetic M3(Ll/gx2;Ll/jsv;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/gx2;->Y3(Ll/jsv;)V

    return-void
.end method

.method public static synthetic N3(Ll/gx2;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/gx2;->b4()V

    return-void
.end method

.method public static synthetic O3(Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;Ljava/util/Map;)V
    .locals 2

    .line 1
    const-string v0, "beauty_name"

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->name:Ljava/lang/String;

    .line 4
    .line 5
    invoke-interface {p1, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->getValue()F

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const-string v0, "beauty_value"

    .line 17
    .line 18
    invoke-interface {p1, v0, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static synthetic P3(Ll/gx2;Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/gx2;->d4(Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;)V

    return-void
.end method

.method public static synthetic R3(Ll/gx2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/gx2;->Z3()V

    return-void
.end method

.method public static synthetic S3(Ll/gx2;ZLcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/gx2;->f4(ZLcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;)V

    return-void
.end method

.method public static synthetic T3(Ll/gx2;Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/gx2;->c4(Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;)V

    return-void
.end method

.method public static synthetic U3(Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;)V
    .locals 3

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->id:I

    .line 2
    .line 3
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 4
    .line 5
    invoke-virtual {v1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-static {v0, v1}, Ll/uyr;->b(ILjava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/nxd0;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->getDefaultBeautyValue()F

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    invoke-direct {v1, v0, v2}, Ll/nxd0;-><init>(Ljava/lang/String;F)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Ljava/lang/Float;

    .line 27
    .line 28
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->setValue(Ljava/lang/Float;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method private V3(F)I
    .locals 0

    .line 1
    const/high16 p0, 0x42c80000    # 100.0f

    .line 2
    .line 3
    mul-float/2addr p1, p0

    .line 4
    float-to-int p0, p1

    .line 5
    return p0
.end method

.method private synthetic Z3()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Ll/gx2;->o4(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private h4(Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;)V
    .locals 5

    .line 1
    iput-object p1, p0, Ll/gx2;->m:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    move v1, v0

    .line 5
    :goto_0
    iget-object v2, p0, Ll/gx2;->l:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    if-ge v1, v2, :cond_0

    .line 12
    .line 13
    iget-object v2, p0, Ll/gx2;->l:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    check-cast v2, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

    .line 20
    .line 21
    iget-object v3, v2, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->name:Ljava/lang/String;

    .line 22
    .line 23
    iget-object v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->name:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {v3, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->setSelected(Z)V

    .line 30
    .line 31
    .line 32
    add-int/lit8 v1, v1, 0x1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->isSuggested:Z

    .line 36
    .line 37
    if-eqz v1, :cond_1

    .line 38
    .line 39
    new-instance v1, Ll/jxd0;

    .line 40
    .line 41
    iget v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->id:I

    .line 42
    .line 43
    sget-object v3, Ll/zrv;->a:Ll/wrv;

    .line 44
    .line 45
    invoke-virtual {v3}, Ll/wrv;->D0()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    invoke-static {v2, v3}, Ll/uyr;->c(ILjava/lang/String;)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 54
    .line 55
    invoke-direct {v1, v2, v3}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 56
    .line 57
    .line 58
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 59
    .line 60
    invoke-virtual {v1, v2}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    :cond_1
    iget-object v1, p0, Ll/gx2;->k:Ll/xu2;

    .line 64
    .line 65
    invoke-virtual {v1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 66
    .line 67
    .line 68
    iget-object v1, p0, Ll/gx2;->i:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;

    .line 69
    .line 70
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->name:Ljava/lang/String;

    .line 71
    .line 72
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->h(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    iget-object v1, p0, Ll/gx2;->i:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;

    .line 76
    .line 77
    const-string v2, ""

    .line 78
    .line 79
    invoke-virtual {v1, v0, v2}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->g(ZLjava/lang/String;)V

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Ll/gx2;->i:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;

    .line 83
    .line 84
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;->BEAUTY:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;

    .line 85
    .line 86
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->getValue()F

    .line 87
    .line 88
    .line 89
    move-result p1

    .line 90
    invoke-direct {p0, p1}, Ll/gx2;->V3(F)I

    .line 91
    .line 92
    .line 93
    move-result p0

    .line 94
    invoke-virtual {v0, v1, p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->i(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;I)V

    .line 95
    .line 96
    .line 97
    return-void
.end method

.method private i4(FLcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;)V
    .locals 2

    .line 1
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->setValue(F)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/k210;

    .line 5
    .line 6
    const/16 v0, 0x8fc

    .line 7
    .line 8
    invoke-direct {p1, v0}, Ll/k210;-><init>(I)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    check-cast p1, Ll/uzl;

    .line 16
    .line 17
    iget v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->id:I

    .line 18
    .line 19
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->getValue()F

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    invoke-interface {p1, v0, v1}, Ll/uzl;->L(IF)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Ll/gx2;->k:Ll/xu2;

    .line 27
    .line 28
    iget-object p0, p0, Ll/gx2;->l:Ljava/util/List;

    .line 29
    .line 30
    invoke-interface {p0, p2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    invoke-virtual {p1, p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method private l4()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/gx2;->l:Ljava/util/List;

    .line 2
    .line 3
    new-instance v1, Ll/ww2;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/ww2;-><init>(Ll/gx2;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p0, v0}, Ll/gx2;->o4(Z)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Ll/gx2;->k:Ll/xu2;

    .line 16
    .line 17
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method private n4(Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;)V
    .locals 3

    .line 1
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->id:I

    .line 2
    .line 3
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 4
    .line 5
    invoke-virtual {v1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-static {v0, v1}, Ll/uyr;->b(ILjava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, Ll/gx2;->n:Ljava/util/Map;

    .line 14
    .line 15
    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Ll/nxd0;

    .line 20
    .line 21
    if-nez v1, :cond_0

    .line 22
    .line 23
    new-instance v1, Ll/nxd0;

    .line 24
    .line 25
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->getDefaultBeautyValue()F

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    invoke-direct {v1, v0, v2}, Ll/nxd0;-><init>(Ljava/lang/String;F)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Ll/gx2;->n:Ljava/util/Map;

    .line 33
    .line 34
    invoke-interface {p0, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->getValue()F

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->getValue()F

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {v1, p0}, Ll/nxd0;->put(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
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
    new-instance v1, Ll/vw2;

    .line 31
    .line 32
    invoke-direct {v1, p0}, Ll/vw2;-><init>(Ll/gx2;)V

    .line 33
    .line 34
    .line 35
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public W3()Ljava/util/Map;
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
    iget-object v1, p0, Ll/gx2;->l:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    if-eqz v2, :cond_0

    .line 17
    .line 18
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    check-cast v2, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

    .line 23
    .line 24
    iget-object v3, v2, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->key:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->getValue()F

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    invoke-direct {p0, v2}, Ll/gx2;->V3(F)I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    return-object v0
.end method

.method public X3(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/gx2;->l:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/gx2;->l:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Ll/gx2;->l:Ljava/util/List;

    .line 12
    .line 13
    new-instance v0, Ll/xw2;

    .line 14
    .line 15
    invoke-direct {v0}, Ll/xw2;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-static {p1, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Ll/gx2;->l:Ljava/util/List;

    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

    .line 29
    .line 30
    iput-object p1, p0, Ll/gx2;->m:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

    .line 31
    .line 32
    const/4 v0, 0x1

    .line 33
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->setSelected(Z)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Ll/gx2;->i:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;

    .line 37
    .line 38
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    if-eqz p1, :cond_0

    .line 43
    .line 44
    iget-object p1, p0, Ll/gx2;->i:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;

    .line 45
    .line 46
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;->BEAUTY:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;

    .line 47
    .line 48
    iget-object v1, p0, Ll/gx2;->m:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

    .line 49
    .line 50
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->getValue()F

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    invoke-direct {p0, v1}, Ll/gx2;->V3(F)I

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->i(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;I)V

    .line 59
    .line 60
    .line 61
    :cond_0
    new-instance p1, Ll/yw2;

    .line 62
    .line 63
    invoke-direct {p1, p0}, Ll/yw2;-><init>(Ll/gx2;)V

    .line 64
    .line 65
    .line 66
    invoke-static {p1}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 67
    .line 68
    .line 69
    iget-object p1, p0, Ll/gx2;->k:Ll/xu2;

    .line 70
    .line 71
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    if-eqz p1, :cond_1

    .line 76
    .line 77
    iget-object p1, p0, Ll/gx2;->k:Ll/xu2;

    .line 78
    .line 79
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 80
    .line 81
    .line 82
    :cond_1
    invoke-virtual {p0}, Ll/gx2;->k4()V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public final synthetic Y3(Ll/jsv;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/gx2;->i:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;

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
    iget-object p0, p0, Ll/gx2;->i:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->k(Z)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public final synthetic a4()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/gx2;->l:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-direct {p0}, Ll/gx2;->l4()V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/gx2;->m:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    iget-object v0, p0, Ll/gx2;->i:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;

    .line 22
    .line 23
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;->BEAUTY:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;

    .line 24
    .line 25
    iget-object v2, p0, Ll/gx2;->m:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

    .line 26
    .line 27
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->getValue()F

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    invoke-direct {p0, v2}, Ll/gx2;->V3(F)I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    invoke-virtual {v0, v1, p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->i(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;I)V

    .line 36
    .line 37
    .line 38
    :cond_1
    :goto_0
    return-void
.end method

.method public final synthetic b4()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 10
    .line 11
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->W9:I

    .line 12
    .line 13
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->G0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->F0:I

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->D(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 28
    .line 29
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->a:I

    .line 30
    .line 31
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->m0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 40
    .line 41
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->i:I

    .line 42
    .line 43
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    new-instance v2, Ll/bx2;

    .line 48
    .line 49
    invoke-direct {v2, p0}, Ll/bx2;-><init>(Ll/gx2;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->v0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public final synthetic c4(Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;)V
    .locals 2

    .line 1
    new-instance v0, Ll/k210;

    .line 2
    .line 3
    const/16 v1, 0x8fc

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
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->id:I

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    invoke-interface {p0, p1, v0}, Ll/uzl;->L(IF)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final synthetic d4(Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->resetBeautyValue()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Ll/gx2;->n4(Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic e4(Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;)V
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
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->id:I

    .line 8
    .line 9
    invoke-static {v1, v0}, Ll/uyr;->b(ILjava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/nxd0;

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->getDefaultBeautyValue()F

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    invoke-direct {v1, v0, v2}, Ll/nxd0;-><init>(Ljava/lang/String;F)V

    .line 20
    .line 21
    .line 22
    new-instance v0, Ll/k210;

    .line 23
    .line 24
    const/16 v2, 0x8fc

    .line 25
    .line 26
    invoke-direct {v0, v2}, Ll/k210;-><init>(I)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    check-cast p0, Ll/uzl;

    .line 34
    .line 35
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->id:I

    .line 36
    .line 37
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    check-cast v0, Ljava/lang/Float;

    .line 42
    .line 43
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    invoke-interface {p0, p1, v0}, Ll/uzl;->L(IF)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public final synthetic f4(ZLcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    new-instance p1, Ll/dx2;

    .line 4
    .line 5
    invoke-direct {p1, p2}, Ll/dx2;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;)V

    .line 6
    .line 7
    .line 8
    const-string v0, "anchor_set_beauty"

    .line 9
    .line 10
    invoke-static {p0, v0, p1}, Ll/fgt;->b(Ll/i6t;Ljava/lang/String;Ll/y20;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    new-instance p1, Ll/k210;

    .line 14
    .line 15
    const/16 v0, 0x8fc

    .line 16
    .line 17
    invoke-direct {p1, v0}, Ll/k210;-><init>(I)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, p1}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    check-cast p0, Ll/uzl;

    .line 25
    .line 26
    iget p1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->id:I

    .line 27
    .line 28
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->getValue()F

    .line 29
    .line 30
    .line 31
    move-result p2

    .line 32
    invoke-interface {p0, p1, p2}, Ll/uzl;->L(IF)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public g4(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;)V
    .locals 2

    .line 1
    iput-object p1, p0, Ll/gx2;->i:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/gx2;->init()V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/gx2;->i:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    const-string v1, ""

    .line 10
    .line 11
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->g(ZLjava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Ll/gx2;->i:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;

    .line 15
    .line 16
    new-instance v0, Ll/ax2;

    .line 17
    .line 18
    invoke-direct {v0, p0}, Ll/ax2;-><init>(Ll/gx2;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->setOnResetAction(Ll/x20;)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Ll/gx2;->i:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0}, Ll/vp20;->m()Ll/jsv;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0}, Ll/jsv;->f()Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->k(Z)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Ll/gx2;->k4()V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public init()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/gx2;->i:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->getBeautyView()Lv/VRecyclerView;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iput-object v0, p0, Ll/gx2;->j:Lv/VRecyclerView;

    .line 8
    .line 9
    new-instance v0, Ll/xu2;

    .line 10
    .line 11
    iget-object v1, p0, Ll/gx2;->l:Ljava/util/List;

    .line 12
    .line 13
    new-instance v2, Ll/fx2;

    .line 14
    .line 15
    invoke-direct {v2, p0}, Ll/fx2;-><init>(Ll/gx2;)V

    .line 16
    .line 17
    .line 18
    invoke-direct {v0, v1, v2}, Ll/xu2;-><init>(Ljava/util/List;Ll/y20;)V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Ll/gx2;->k:Ll/xu2;

    .line 22
    .line 23
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-direct {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 30
    .line 31
    .line 32
    const/4 v1, 0x0

    .line 33
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;->setOrientation(I)V

    .line 34
    .line 35
    .line 36
    new-instance v2, Ll/huf0;

    .line 37
    .line 38
    sget v3, Ll/qa00;->g:I

    .line 39
    .line 40
    sget v4, Ll/qa00;->o:I

    .line 41
    .line 42
    invoke-direct {v2, v3, v4, v4, v1}, Ll/huf0;-><init>(IIII)V

    .line 43
    .line 44
    .line 45
    iget-object v1, p0, Ll/gx2;->j:Lv/VRecyclerView;

    .line 46
    .line 47
    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 48
    .line 49
    .line 50
    iget-object v1, p0, Ll/gx2;->j:Lv/VRecyclerView;

    .line 51
    .line 52
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Ll/gx2;->j:Lv/VRecyclerView;

    .line 56
    .line 57
    iget-object p0, p0, Ll/gx2;->k:Ll/xu2;

    .line 58
    .line 59
    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public j4()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/gx2;->l:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->O2:I

    .line 10
    .line 11
    invoke-static {v0}, Ll/o1j0;->w(I)V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Ll/gx2;->m:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    iget-object v1, p0, Ll/gx2;->i:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;

    .line 21
    .line 22
    const/4 v2, 0x0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    const/4 v0, 0x1

    .line 26
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->m(Z)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/gx2;->i:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;

    .line 30
    .line 31
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;->BEAUTY:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;

    .line 32
    .line 33
    iget-object v3, p0, Ll/gx2;->m:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

    .line 34
    .line 35
    invoke-virtual {v3}, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->getValue()F

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    invoke-direct {p0, v3}, Ll/gx2;->V3(F)I

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    invoke-virtual {v0, v1, v3}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->i(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;I)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Ll/gx2;->i:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;

    .line 47
    .line 48
    iget-object v1, p0, Ll/gx2;->m:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

    .line 49
    .line 50
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->name:Ljava/lang/String;

    .line 51
    .line 52
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->h(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_1
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->m(Z)V

    .line 57
    .line 58
    .line 59
    :goto_0
    iget-object v0, p0, Ll/gx2;->i:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;

    .line 60
    .line 61
    const-string v1, ""

    .line 62
    .line 63
    invoke-virtual {v0, v2, v1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->g(ZLjava/lang/String;)V

    .line 64
    .line 65
    .line 66
    iget-object p0, p0, Ll/gx2;->i:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;

    .line 67
    .line 68
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->l(Z)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public final k4()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/gx2;->m:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

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
    iget-object v1, p0, Ll/gx2;->i:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    iget-object v2, p0, Ll/gx2;->m:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

    .line 14
    .line 15
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->name:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->h(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Ll/gx2;->i:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;

    .line 21
    .line 22
    sget-object v2, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;->BEAUTY:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;

    .line 23
    .line 24
    iget-object v3, p0, Ll/gx2;->m:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

    .line 25
    .line 26
    invoke-virtual {v3}, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->getValue()F

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    invoke-direct {p0, v3}, Ll/gx2;->V3(F)I

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    invoke-virtual {v1, v2, v3}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->i(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;I)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Ll/gx2;->i:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;

    .line 38
    .line 39
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->m(Z)V

    .line 40
    .line 41
    .line 42
    :cond_0
    return-void
.end method

.method public m4()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/gx2;->l:Ljava/util/List;

    .line 2
    .line 3
    new-instance v1, Ll/ex2;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/ex2;-><init>(Ll/gx2;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final o4(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/gx2;->l:Ljava/util/List;

    .line 2
    .line 3
    new-instance v1, Ll/zw2;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Ll/zw2;-><init>(Ll/gx2;Z)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 0

    .line 1
    int-to-float p1, p2

    .line 2
    const/high16 p2, 0x3f800000    # 1.0f

    .line 3
    .line 4
    mul-float/2addr p1, p2

    .line 5
    const/high16 p2, 0x42c80000    # 100.0f

    .line 6
    .line 7
    div-float/2addr p1, p2

    .line 8
    iget-object p2, p0, Ll/gx2;->m:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

    .line 9
    .line 10
    invoke-direct {p0, p1, p2}, Ll/gx2;->i4(FLcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/gx2;->m:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Ll/gx2;->n4(Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public reset()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/gx2;->l:Ljava/util/List;

    .line 2
    .line 3
    new-instance v1, Ll/cx2;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/cx2;-><init>(Ll/gx2;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
