.class public Ll/xuk0;
.super Ll/xgu;
.source "SourceFile"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/xgu<",
        "Ll/xuk0;",
        ">;",
        "Landroid/widget/SeekBar$OnSeekBarChangeListener;"
    }
.end annotation


# instance fields
.field public f:Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;

.field public g:Lv/VRecyclerView;

.field public h:Ll/xu2;

.field public final i:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;",
            ">;"
        }
    .end annotation
.end field

.field public j:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

.field public final k:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ll/nxd0;",
            ">;"
        }
    .end annotation
.end field

.field public l:Ll/vzl;


# direct methods
.method public constructor <init>(Ll/knu;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/xgu;-><init>(Ll/knu;)V

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
    iput-object p1, p0, Ll/xuk0;->i:Ljava/util/List;

    .line 10
    .line 11
    new-instance p1, Ljava/util/HashMap;

    .line 12
    .line 13
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Ll/xuk0;->k:Ljava/util/Map;

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p1}, Ll/xnu;->u()Ll/gcl0;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p1}, Ll/gcl0;->b()Ll/vzl;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    iput-object p1, p0, Ll/xuk0;->l:Ll/vzl;

    .line 31
    .line 32
    return-void
.end method

.method public static synthetic S2(Ll/xuk0;Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xuk0;->k3(Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;)V

    return-void
.end method

.method public static synthetic T2(Ll/xuk0;Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xuk0;->h3(Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;)V

    return-void
.end method

.method public static synthetic U2(Ll/xuk0;Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xuk0;->g3(Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;)V

    return-void
.end method

.method public static synthetic V2(Ll/xuk0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xuk0;->f3()V

    return-void
.end method

.method public static synthetic W2(Ll/xuk0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/xuk0;->d3()V

    return-void
.end method

.method public static synthetic X2(Ll/xuk0;Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xuk0;->i3(Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;)V

    return-void
.end method

.method public static synthetic Y2(Ll/xuk0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xuk0;->e3()V

    return-void
.end method

.method public static synthetic Z2(Ll/xuk0;Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xuk0;->j3(Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;)V

    return-void
.end method

.method public static synthetic a3(Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;)V
    .locals 3

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->id:I

    .line 2
    .line 3
    invoke-static {}, Ll/mbs;->o0()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {v0, v1}, Ll/uyr;->l(ILjava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/nxd0;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->getDefaultBeautyValue()F

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    invoke-direct {v1, v0, v2}, Ll/nxd0;-><init>(Ljava/lang/String;F)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Ljava/lang/Float;

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->setValue(Ljava/lang/Float;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method private synthetic d3()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/xuk0;->t3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private t3()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xuk0;->i:Ljava/util/List;

    .line 2
    .line 3
    new-instance v1, Ll/uuk0;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/uuk0;-><init>(Ll/xuk0;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final b3(F)I
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

.method public c3(Ljava/util/List;)V
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
    iget-object v0, p0, Ll/xuk0;->i:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/xuk0;->i:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Ll/xuk0;->i:Ljava/util/List;

    .line 12
    .line 13
    new-instance v0, Ll/ruk0;

    .line 14
    .line 15
    invoke-direct {v0}, Ll/ruk0;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-static {p1, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Ll/xuk0;->i:Ljava/util/List;

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
    iput-object p1, p0, Ll/xuk0;->j:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

    .line 31
    .line 32
    const/4 v0, 0x1

    .line 33
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->setSelected(Z)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Ll/xuk0;->f:Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;

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
    iget-object p1, p0, Ll/xuk0;->f:Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;

    .line 45
    .line 46
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;->BEAUTY:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;

    .line 47
    .line 48
    iget-object v1, p0, Ll/xuk0;->j:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

    .line 49
    .line 50
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->getValue()F

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    invoke-virtual {p0, v1}, Ll/xuk0;->b3(F)I

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;->i(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;I)V

    .line 59
    .line 60
    .line 61
    :cond_0
    new-instance p1, Ll/suk0;

    .line 62
    .line 63
    invoke-direct {p1, p0}, Ll/suk0;-><init>(Ll/xuk0;)V

    .line 64
    .line 65
    .line 66
    invoke-static {p1}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 67
    .line 68
    .line 69
    iget-object p1, p0, Ll/xuk0;->h:Ll/xu2;

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
    iget-object p0, p0, Ll/xuk0;->h:Ll/xu2;

    .line 78
    .line 79
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 80
    .line 81
    .line 82
    :cond_1
    return-void
.end method

.method public final synthetic e3()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/xuk0;->i:Ljava/util/List;

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
    invoke-virtual {p0}, Ll/xuk0;->q3()V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/xuk0;->j:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

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
    iget-object v0, p0, Ll/xuk0;->f:Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;

    .line 22
    .line 23
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;->BEAUTY:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;

    .line 24
    .line 25
    iget-object v2, p0, Ll/xuk0;->j:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

    .line 26
    .line 27
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->getValue()F

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    invoke-virtual {p0, v2}, Ll/xuk0;->b3(F)I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    invoke-virtual {v0, v1, p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;->i(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;I)V

    .line 36
    .line 37
    .line 38
    :cond_1
    :goto_0
    return-void
.end method

.method public final synthetic f3()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/ahu;->act()Lcom/p1/mobile/android/app/Act;

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
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->W9:I

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->E0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->F0:I

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->D(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->a:I

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->k0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 28
    .line 29
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->i:I

    .line 30
    .line 31
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    new-instance v2, Ll/tuk0;

    .line 36
    .line 37
    invoke-direct {v2, p0}, Ll/tuk0;-><init>(Ll/xuk0;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->v0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public final synthetic g3(Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/xuk0;->l:Ll/vzl;

    .line 2
    .line 3
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->id:I

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-interface {p0, p1, v0}, Ll/vzl;->L(IF)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic h3(Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->resetBeautyValue()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ll/xuk0;->s3(Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic i3(Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;)V
    .locals 3

    .line 1
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->id:I

    .line 2
    .line 3
    invoke-static {}, Ll/mbs;->o0()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {v0, v1}, Ll/uyr;->l(ILjava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/nxd0;

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->getDefaultBeautyValue()F

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    invoke-direct {v1, v0, v2}, Ll/nxd0;-><init>(Ljava/lang/String;F)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ll/xuk0;->l:Ll/vzl;

    .line 21
    .line 22
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->id:I

    .line 23
    .line 24
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Ljava/lang/Float;

    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    invoke-interface {p0, p1, v0}, Ll/vzl;->L(IF)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public init()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/xuk0;->f:Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;->getBeautyView()Lv/VRecyclerView;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iput-object v0, p0, Ll/xuk0;->g:Lv/VRecyclerView;

    .line 8
    .line 9
    new-instance v0, Ll/xu2;

    .line 10
    .line 11
    iget-object v1, p0, Ll/xuk0;->i:Ljava/util/List;

    .line 12
    .line 13
    new-instance v2, Ll/vuk0;

    .line 14
    .line 15
    invoke-direct {v2, p0}, Ll/vuk0;-><init>(Ll/xuk0;)V

    .line 16
    .line 17
    .line 18
    invoke-direct {v0, v1, v2}, Ll/xu2;-><init>(Ljava/util/List;Ll/y20;)V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Ll/xuk0;->h:Ll/xu2;

    .line 22
    .line 23
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/ahu;->act()Lcom/p1/mobile/android/app/Act;

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
    iget-object v1, p0, Ll/xuk0;->g:Lv/VRecyclerView;

    .line 46
    .line 47
    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 48
    .line 49
    .line 50
    iget-object v1, p0, Ll/xuk0;->g:Lv/VRecyclerView;

    .line 51
    .line 52
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Ll/xuk0;->g:Lv/VRecyclerView;

    .line 56
    .line 57
    iget-object p0, p0, Ll/xuk0;->h:Ll/xu2;

    .line 58
    .line 59
    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public final synthetic j3(Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/xuk0;->l:Ll/vzl;

    .line 2
    .line 3
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->id:I

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->getValue()F

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-interface {p0, v0, p1}, Ll/vzl;->L(IF)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final k3(Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;)V
    .locals 4

    .line 1
    iput-object p1, p0, Ll/xuk0;->j:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    :goto_0
    iget-object v1, p0, Ll/xuk0;->i:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-ge v0, v1, :cond_0

    .line 11
    .line 12
    iget-object v1, p0, Ll/xuk0;->i:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

    .line 19
    .line 20
    iget-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->name:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->name:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->setSelected(Z)V

    .line 29
    .line 30
    .line 31
    add-int/lit8 v0, v0, 0x1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->isSuggested:Z

    .line 35
    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    new-instance v0, Ll/jxd0;

    .line 39
    .line 40
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->id:I

    .line 41
    .line 42
    invoke-static {}, Ll/mbs;->o0()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    invoke-static {v1, v2}, Ll/uyr;->m(ILjava/lang/String;)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 51
    .line 52
    invoke-direct {v0, v1, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 53
    .line 54
    .line 55
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 56
    .line 57
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    :cond_1
    iget-object v0, p0, Ll/xuk0;->h:Ll/xu2;

    .line 61
    .line 62
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Ll/xuk0;->f:Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;

    .line 66
    .line 67
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->name:Ljava/lang/String;

    .line 68
    .line 69
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;->h(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Ll/xuk0;->f:Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;

    .line 73
    .line 74
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    invoke-virtual {v1}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    invoke-static {v1}, Ll/yuk0;->e(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)Z

    .line 83
    .line 84
    .line 85
    move-result v1

    .line 86
    const-string v2, ""

    .line 87
    .line 88
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;->g(ZLjava/lang/String;)V

    .line 89
    .line 90
    .line 91
    iget-object v0, p0, Ll/xuk0;->f:Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;

    .line 92
    .line 93
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;->BEAUTY:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;

    .line 94
    .line 95
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->getValue()F

    .line 96
    .line 97
    .line 98
    move-result p1

    .line 99
    invoke-virtual {p0, p1}, Ll/xuk0;->b3(F)I

    .line 100
    .line 101
    .line 102
    move-result p0

    .line 103
    invoke-virtual {v0, v1, p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;->i(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;I)V

    .line 104
    .line 105
    .line 106
    return-void
.end method

.method public final m3(FLcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;)V
    .locals 2

    .line 1
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->setValue(F)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/xuk0;->l:Ll/vzl;

    .line 5
    .line 6
    iget v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->id:I

    .line 7
    .line 8
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->getValue()F

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    invoke-interface {p1, v0, v1}, Ll/vzl;->L(IF)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Ll/xuk0;->h:Ll/xu2;

    .line 16
    .line 17
    iget-object p0, p0, Ll/xuk0;->i:Ljava/util/List;

    .line 18
    .line 19
    invoke-interface {p0, p2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    invoke-virtual {p1, p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public n3()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/xuk0;->i:Ljava/util/List;

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
    iget-object v0, p0, Ll/xuk0;->j:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    iget-object v1, p0, Ll/xuk0;->f:Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;

    .line 21
    .line 22
    const/4 v2, 0x0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    const/4 v0, 0x1

    .line 26
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;->m(Z)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/xuk0;->f:Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;

    .line 30
    .line 31
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;->BEAUTY:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;

    .line 32
    .line 33
    iget-object v3, p0, Ll/xuk0;->j:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

    .line 34
    .line 35
    invoke-virtual {v3}, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->getValue()F

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    invoke-virtual {p0, v3}, Ll/xuk0;->b3(F)I

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    invoke-virtual {v0, v1, v3}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;->i(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;I)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Ll/xuk0;->f:Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;

    .line 47
    .line 48
    iget-object v1, p0, Ll/xuk0;->j:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

    .line 49
    .line 50
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->name:Ljava/lang/String;

    .line 51
    .line 52
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;->h(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_1
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;->m(Z)V

    .line 57
    .line 58
    .line 59
    :goto_0
    iget-object v0, p0, Ll/xuk0;->f:Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;

    .line 60
    .line 61
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-virtual {v1}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    invoke-static {v1}, Ll/yuk0;->e(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)Z

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    const-string v3, ""

    .line 74
    .line 75
    invoke-virtual {v0, v1, v3}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;->g(ZLjava/lang/String;)V

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Ll/xuk0;->f:Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;

    .line 79
    .line 80
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    invoke-virtual {v1}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    invoke-static {v1}, Ll/yuk0;->e(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)Z

    .line 89
    .line 90
    .line 91
    move-result v1

    .line 92
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;->k(Z)V

    .line 93
    .line 94
    .line 95
    iget-object p0, p0, Ll/xuk0;->f:Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;

    .line 96
    .line 97
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;->l(Z)V

    .line 98
    .line 99
    .line 100
    return-void
.end method

.method public o3(Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;)V
    .locals 2

    .line 1
    iput-object p1, p0, Ll/xuk0;->f:Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xuk0;->init()V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/xuk0;->j:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

    .line 7
    .line 8
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Ll/xuk0;->f:Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;

    .line 15
    .line 16
    iget-object v1, p0, Ll/xuk0;->j:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

    .line 17
    .line 18
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->name:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;->h(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    iget-object v0, p0, Ll/xuk0;->f:Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;

    .line 24
    .line 25
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;->m(Z)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Ll/xuk0;->f:Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-static {v0}, Ll/yuk0;->e(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    const-string v1, ""

    .line 43
    .line 44
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;->g(ZLjava/lang/String;)V

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Ll/xuk0;->f:Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;

    .line 48
    .line 49
    new-instance v0, Ll/ouk0;

    .line 50
    .line 51
    invoke-direct {v0, p0}, Ll/ouk0;-><init>(Ll/xuk0;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;->setOnResetAction(Ll/x20;)V

    .line 55
    .line 56
    .line 57
    iget-object p1, p0, Ll/xuk0;->f:Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;

    .line 58
    .line 59
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {v0}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-static {v0}, Ll/yuk0;->e(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;->k(Z)V

    .line 72
    .line 73
    .line 74
    iget-object p1, p0, Ll/xuk0;->j:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

    .line 75
    .line 76
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    if-eqz p1, :cond_1

    .line 81
    .line 82
    iget-object p1, p0, Ll/xuk0;->f:Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;

    .line 83
    .line 84
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;->BEAUTY:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;

    .line 85
    .line 86
    iget-object v1, p0, Ll/xuk0;->j:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

    .line 87
    .line 88
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->getValue()F

    .line 89
    .line 90
    .line 91
    move-result v1

    .line 92
    invoke-virtual {p0, v1}, Ll/xuk0;->b3(F)I

    .line 93
    .line 94
    .line 95
    move-result p0

    .line 96
    invoke-virtual {p1, v0, p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;->i(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;I)V

    .line 97
    .line 98
    .line 99
    :cond_1
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
    iget-object p2, p0, Ll/xuk0;->j:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

    .line 9
    .line 10
    invoke-virtual {p0, p1, p2}, Ll/xuk0;->m3(FLcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;)V

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
    iget-object p1, p0, Ll/xuk0;->j:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/xuk0;->s3(Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public p3()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xuk0;->f:Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Ll/yuk0;->e(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;->k(Z)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final q3()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xuk0;->i:Ljava/util/List;

    .line 2
    .line 3
    new-instance v1, Ll/wuk0;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/wuk0;-><init>(Ll/xuk0;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Ll/xuk0;->t3()V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/xuk0;->h:Ll/xu2;

    .line 15
    .line 16
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public r3()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xuk0;->i:Ljava/util/List;

    .line 2
    .line 3
    new-instance v1, Ll/puk0;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/puk0;-><init>(Ll/xuk0;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public reset()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xuk0;->i:Ljava/util/List;

    .line 2
    .line 3
    new-instance v1, Ll/quk0;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/quk0;-><init>(Ll/xuk0;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final s3(Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;)V
    .locals 3

    .line 1
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->id:I

    .line 2
    .line 3
    invoke-static {}, Ll/mbs;->o0()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {v0, v1}, Ll/uyr;->l(ILjava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Ll/xuk0;->k:Ljava/util/Map;

    .line 12
    .line 13
    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Ll/nxd0;

    .line 18
    .line 19
    if-nez v1, :cond_0

    .line 20
    .line 21
    new-instance v1, Ll/nxd0;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->getDefaultBeautyValue()F

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    invoke-direct {v1, v0, v2}, Ll/nxd0;-><init>(Ljava/lang/String;F)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Ll/xuk0;->k:Ljava/util/Map;

    .line 31
    .line 32
    invoke-interface {p0, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->getValue()F

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {v1, p0}, Ll/nxd0;->put(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    return-void
.end method
