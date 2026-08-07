.class public Ll/grk0;
.super Ll/xgu;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/xgu<",
        "Ll/grk0;",
        ">;"
    }
.end annotation


# instance fields
.field public f:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

.field public final g:Ll/xuk0;

.field public final h:Ll/ivk0;

.field public final i:Ll/uvk0;

.field public j:Z

.field public k:Ll/vzl;


# direct methods
.method public constructor <init>(Ll/knu;Ll/vzl;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/xgu;-><init>(Ll/knu;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/grk0;->k:Ll/vzl;

    .line 5
    .line 6
    new-instance p2, Ll/xuk0;

    .line 7
    .line 8
    invoke-direct {p2, p1}, Ll/xuk0;-><init>(Ll/knu;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p2}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    check-cast p2, Ll/xuk0;

    .line 16
    .line 17
    iput-object p2, p0, Ll/grk0;->g:Ll/xuk0;

    .line 18
    .line 19
    new-instance p2, Ll/ivk0;

    .line 20
    .line 21
    invoke-direct {p2, p1, p0}, Ll/ivk0;-><init>(Ll/knu;Ll/grk0;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, p2}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    check-cast p2, Ll/ivk0;

    .line 29
    .line 30
    iput-object p2, p0, Ll/grk0;->h:Ll/ivk0;

    .line 31
    .line 32
    new-instance p2, Ll/uvk0;

    .line 33
    .line 34
    invoke-direct {p2, p1, p0}, Ll/uvk0;-><init>(Ll/knu;Ll/grk0;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0, p2}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    check-cast p1, Ll/uvk0;

    .line 42
    .line 43
    iput-object p1, p0, Ll/grk0;->i:Ll/uvk0;

    .line 44
    .line 45
    return-void
.end method

.method public static synthetic S2(Ll/grk0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/grk0;->b3(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic T2(Ll/grk0;Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/grk0;->Z2(Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;)V

    return-void
.end method

.method public static synthetic U2(Ll/grk0;Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/grk0;->a3(Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;)V

    return-void
.end method

.method public static synthetic V2(Ll/uxj0;)Lrx/c;
    .locals 0

    .line 1
    sget-object p0, Ll/zrv;->c:Ll/tyr;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/tyr;->S()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static synthetic W2(Ll/grk0;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/grk0;->Y2(Ll/vxj0;)V

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
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$e;->f()Ll/v3f$c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Ll/brk0;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/brk0;-><init>(Ll/grk0;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, v0, v1}, Ll/ahu;->I2(Ll/v3f$b;Ll/y20;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ll/grk0;->c3()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final X2()Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/ahu;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Ll/xec0;->L1:I

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-static {v0, v1, v2}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    check-cast v1, Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;

    .line 13
    .line 14
    iget-object v2, p0, Ll/grk0;->g:Ll/xuk0;

    .line 15
    .line 16
    invoke-virtual {v2, v1}, Ll/xuk0;->o3(Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;)V

    .line 17
    .line 18
    .line 19
    iget-object v2, p0, Ll/grk0;->h:Ll/ivk0;

    .line 20
    .line 21
    invoke-virtual {v2, v1}, Ll/ivk0;->e3(Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;)V

    .line 22
    .line 23
    .line 24
    iget-object v2, p0, Ll/grk0;->i:Ll/uvk0;

    .line 25
    .line 26
    invoke-virtual {v2, v1}, Ll/uvk0;->i3(Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;)V

    .line 27
    .line 28
    .line 29
    new-instance v2, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 30
    .line 31
    invoke-direct {v2, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;-><init>(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v2}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    new-instance v3, Landroid/graphics/drawable/ColorDrawable;

    .line 39
    .line 40
    const/4 v4, 0x0

    .line 41
    invoke-direct {v3, v4}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, v3}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v2, v1}, Ll/nu0;->setContentView(Landroid/view/View;)V

    .line 48
    .line 49
    .line 50
    new-instance v0, Ll/grk0$a;

    .line 51
    .line 52
    invoke-direct {v0, p0, v1, v2}, Ll/grk0$a;-><init>(Ll/grk0;Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;->setOnEmptyFlingListener(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/OnFlingFrameLayout$b;)V

    .line 56
    .line 57
    .line 58
    new-instance v0, Ll/grk0$b;

    .line 59
    .line 60
    invoke-direct {v0, p0}, Ll/grk0$b;-><init>(Ll/grk0;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;->setOnContrastListener(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/ContrastView$b;)V

    .line 64
    .line 65
    .line 66
    new-instance v0, Ll/frk0;

    .line 67
    .line 68
    invoke-direct {v0, p0, v1}, Ll/frk0;-><init>(Ll/grk0;Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;->setOnPageChangeAction(Ll/y20;)V

    .line 72
    .line 73
    .line 74
    iget-object p0, p0, Ll/grk0;->g:Ll/xuk0;

    .line 75
    .line 76
    invoke-virtual {v1, p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 77
    .line 78
    .line 79
    return-object v2
.end method

.method public final synthetic Y2(Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/grk0;->d3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic Z2(Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;->BEAUTY:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-ne p2, v0, :cond_0

    .line 5
    .line 6
    iget-object p2, p0, Ll/grk0;->g:Ll/xuk0;

    .line 7
    .line 8
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;->setOnSecondSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/grk0;->g:Ll/xuk0;

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/xuk0;->n3()V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;->MAKE_UP:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;

    .line 21
    .line 22
    if-ne p2, v0, :cond_1

    .line 23
    .line 24
    iget-object p2, p0, Ll/grk0;->i:Ll/uvk0;

    .line 25
    .line 26
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 27
    .line 28
    .line 29
    iget-object p2, p0, Ll/grk0;->i:Ll/uvk0;

    .line 30
    .line 31
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;->setOnSecondSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Ll/grk0;->i:Ll/uvk0;

    .line 35
    .line 36
    invoke-virtual {p0}, Ll/uvk0;->h3()V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_1
    iget-object p2, p0, Ll/grk0;->h:Ll/ivk0;

    .line 41
    .line 42
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;->setOnSecondSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Ll/grk0;->h:Ll/ivk0;

    .line 49
    .line 50
    invoke-virtual {p0}, Ll/ivk0;->d3()V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public final synthetic a3(Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/grk0;->j:Z

    .line 3
    .line 4
    iget-object v0, p0, Ll/grk0;->k:Ll/vzl;

    .line 5
    .line 6
    invoke-static {}, Ll/coi;->o()Lcom/immomo/momomediaext/MomoMediaConstants$BEAUTY_TYPE;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-static {}, Ll/coi;->q()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-interface {v0, v1, v2}, Ll/vzl;->z(Lcom/immomo/momomediaext/MomoMediaConstants$BEAUTY_TYPE;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/grk0;->g:Ll/xuk0;

    .line 18
    .line 19
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;->beautyConfig:Ljava/util/List;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ll/xuk0;->c3(Ljava/util/List;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/grk0;->h:Ll/ivk0;

    .line 25
    .line 26
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;->filterConfig:Ljava/util/List;

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ll/ivk0;->Y2(Ljava/util/List;)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Ll/grk0;->i:Ll/uvk0;

    .line 32
    .line 33
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;->makeUpConfig:Ljava/util/List;

    .line 34
    .line 35
    invoke-virtual {p0, p1}, Ll/uvk0;->c3(Ljava/util/List;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final synthetic b3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-boolean p1, p0, Ll/grk0;->j:Z

    .line 3
    .line 4
    iget-object p1, p0, Ll/grk0;->h:Ll/ivk0;

    .line 5
    .line 6
    invoke-virtual {p1}, Ll/ivk0;->Z2()V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/grk0;->i:Ll/uvk0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/uvk0;->d3()V

    .line 12
    .line 13
    .line 14
    const-string p0, "videoChat"

    .line 15
    .line 16
    const-string p1, "beauty filter failed"

    .line 17
    .line 18
    invoke-static {p0, p1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public c3()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/grk0;->j:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Ll/grk0;->j:Z

    .line 8
    .line 9
    iget-object v1, p0, Ll/grk0;->k:Ll/vzl;

    .line 10
    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    invoke-interface {v1}, Ll/vzl;->v()Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    if-eqz v1, :cond_1

    .line 18
    .line 19
    iget-object v1, p0, Ll/grk0;->k:Ll/vzl;

    .line 20
    .line 21
    invoke-interface {v1}, Ll/vzl;->v()Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v1, v0}, Lrx/c;->take(I)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    new-instance v1, Ll/crk0;

    .line 30
    .line 31
    invoke-direct {v1}, Ll/crk0;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    new-instance v1, Ll/drk0;

    .line 43
    .line 44
    invoke-direct {v1, p0}, Ll/drk0;-><init>(Ll/grk0;)V

    .line 45
    .line 46
    .line 47
    new-instance v2, Ll/erk0;

    .line 48
    .line 49
    invoke-direct {v2, p0}, Ll/erk0;-><init>(Ll/grk0;)V

    .line 50
    .line 51
    .line 52
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 57
    .line 58
    .line 59
    :cond_1
    :goto_0
    return-void
.end method

.method public d3()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/grk0;->f:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/grk0;->X2()Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Ll/grk0;->f:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Ll/grk0;->g:Ll/xuk0;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/xuk0;->p3()V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ll/grk0;->f:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->show()V

    .line 19
    .line 20
    .line 21
    return-void
.end method
