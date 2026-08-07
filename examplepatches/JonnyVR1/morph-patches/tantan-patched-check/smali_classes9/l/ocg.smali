.class public Ll/ocg;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/oo2;",
        "Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketPanel;",
        ">;"
    }
.end annotation


# instance fields
.field public i:Ll/c0s;

.field public j:Ll/ner;

.field public k:Ljava/lang/String;

.field public l:Ll/kcg0;


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p1, Ll/dum;->g:Ll/ner;

    .line 5
    .line 6
    iput-object p1, p0, Ll/ocg;->j:Ll/ner;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic J3(Ll/ocg;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ocg;->a4(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic K3(Ll/ocg;Ll/zsc0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ocg;->c4(Ll/zsc0;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic L3(Ll/ocg;Ll/zsc0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ocg;->d4(Ll/zsc0;)V

    return-void
.end method

.method public static synthetic M3(Ll/ocg;Ll/zsc0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ocg;->Y3(Ll/zsc0;)V

    return-void
.end method

.method public static synthetic N3(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;)Ll/zsc0;
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fanbaseMedals:Ljava/util/List;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->grabRedPacketInfo:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;

    .line 6
    .line 7
    new-instance v1, Ll/zsc0;

    .line 8
    .line 9
    invoke-direct {v1, p0, v0, p1}, Ll/zsc0;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;)V

    .line 10
    .line 11
    .line 12
    return-object v1
.end method

.method public static synthetic O3(Ll/ocg;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ocg;->Z3(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic P3(Ll/cm0;)Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cm0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic R3(Ll/ocg;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ocg;->b4(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic S3(Ll/ocg;Ll/bcg;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ocg;->e4(Ll/bcg;)V

    return-void
.end method

.method public static synthetic T3(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;)Ll/zsc0;
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fanbaseMedals:Ljava/util/List;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->redPacketGrabResult:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    iput-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->hasGrabbed:Z

    .line 9
    .line 10
    new-instance v1, Ll/zsc0;

    .line 11
    .line 12
    invoke-direct {v1, p0, v0, p1}, Ll/zsc0;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;)V

    .line 13
    .line 14
    .line 15
    return-object v1
.end method

.method public static synthetic U3(Ll/cm0;)Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cm0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 2
    .line 3
    return-object p0
.end method

.method private synthetic b4(Landroid/content/DialogInterface;)V
    .locals 1

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-object p1, p0, Ll/ocg;->i:Ll/c0s;

    .line 3
    .line 4
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketPanel;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketPanel;->destroy()V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 14
    .line 15
    :cond_0
    iput-object p1, p0, Ll/ocg;->k:Ljava/lang/String;

    .line 16
    .line 17
    return-void
.end method

.method private f4(Ljava/lang/String;)V
    .locals 3

    .line 1
    iput-object p1, p0, Ll/ocg;->k:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v0, p0, Ll/ocg;->i:Ll/c0s;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sget v1, Ll/yec0;->Q0:I

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketPanel;

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Ll/ocg;->W3(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketPanel;)V

    .line 23
    .line 24
    .line 25
    new-instance v1, Ll/c0s;

    .line 26
    .line 27
    invoke-direct {v1, p0, v0}, Ll/c0s;-><init>(Ll/xzs;Landroid/view/View;)V

    .line 28
    .line 29
    .line 30
    iput-object v1, p0, Ll/ocg;->i:Ll/c0s;

    .line 31
    .line 32
    new-instance v0, Ll/fcg;

    .line 33
    .line 34
    invoke-direct {v0, p0}, Ll/fcg;-><init>(Ll/ocg;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 38
    .line 39
    .line 40
    :cond_0
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 41
    .line 42
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketPanel;

    .line 43
    .line 44
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketPanel;->m()V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Ll/ocg;->i:Ll/c0s;

    .line 48
    .line 49
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->show()V

    .line 50
    .line 51
    .line 52
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 53
    .line 54
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    iget-object v1, v1, Ll/oo2;->B:Ll/x7g;

    .line 63
    .line 64
    iget-object v1, v1, Ll/x7g;->b:Lcom/p1/mobile/putong/live/base/data/BLiveFanBase;

    .line 65
    .line 66
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBase;->id:Ljava/lang/String;

    .line 67
    .line 68
    invoke-static {v0, p1, v1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->O5(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    iget-object v0, v0, Ll/oo2;->B:Ll/x7g;

    .line 77
    .line 78
    invoke-virtual {v0}, Ll/x7g;->z()Lrx/c;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    new-instance v1, Ll/gcg;

    .line 83
    .line 84
    invoke-direct {v1}, Ll/gcg;-><init>()V

    .line 85
    .line 86
    .line 87
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    new-instance v1, Ll/hcg;

    .line 92
    .line 93
    invoke-direct {v1}, Ll/hcg;-><init>()V

    .line 94
    .line 95
    .line 96
    invoke-static {p1, v0, v1}, Lrx/c;->zip(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    new-instance v0, Ll/icg;

    .line 101
    .line 102
    invoke-direct {v0, p0}, Ll/icg;-><init>(Ll/ocg;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {p1, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    new-instance v0, Ll/jcg;

    .line 114
    .line 115
    invoke-direct {v0, p0}, Ll/jcg;-><init>(Ll/ocg;)V

    .line 116
    .line 117
    .line 118
    new-instance v1, Ll/kcg;

    .line 119
    .line 120
    invoke-direct {v1, p0}, Ll/kcg;-><init>(Ll/ocg;)V

    .line 121
    .line 122
    .line 123
    invoke-static {v0, v1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    iput-object p1, p0, Ll/ocg;->l:Ll/kcg0;

    .line 132
    .line 133
    return-void
.end method


# virtual methods
.method public bridge synthetic C(Ll/iam;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketPanel;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ocg;->W3(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketPanel;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public V3(Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ocg;->k:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v1, p0, Ll/ocg;->k:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    iget-object v2, v2, Ll/oo2;->B:Ll/x7g;

    .line 23
    .line 24
    iget-object v2, v2, Ll/x7g;->b:Lcom/p1/mobile/putong/live/base/data/BLiveFanBase;

    .line 25
    .line 26
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveFanBase;->id:Ljava/lang/String;

    .line 27
    .line 28
    invoke-static {v0, v1, v2, p1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->d6(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iget-object v0, v0, Ll/oo2;->B:Ll/x7g;

    .line 37
    .line 38
    invoke-virtual {v0}, Ll/x7g;->z()Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    new-instance v1, Ll/lcg;

    .line 43
    .line 44
    invoke-direct {v1}, Ll/lcg;-><init>()V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    new-instance v1, Ll/mcg;

    .line 52
    .line 53
    invoke-direct {v1}, Ll/mcg;-><init>()V

    .line 54
    .line 55
    .line 56
    invoke-static {p1, v0, v1}, Lrx/c;->zip(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    new-instance v0, Ll/ncg;

    .line 65
    .line 66
    invoke-direct {v0, p0}, Ll/ncg;-><init>(Ll/ocg;)V

    .line 67
    .line 68
    .line 69
    new-instance v1, Ll/ecg;

    .line 70
    .line 71
    invoke-direct {v1, p0}, Ll/ecg;-><init>(Ll/ocg;)V

    .line 72
    .line 73
    .line 74
    invoke-static {v0, v1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-static {p0}, Ll/dhw;->g(Ll/bb50;)Ll/t9t;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public W3(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketPanel;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketPanel;->f(Ll/ocg;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public X3()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ocg;->i:Ll/c0s;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Ll/ocg;->l:Ll/kcg0;

    .line 9
    .line 10
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic Y3(Ll/zsc0;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketPanel;

    .line 4
    .line 5
    iget-object p0, p0, Ll/ocg;->j:Ll/ner;

    .line 6
    .line 7
    invoke-virtual {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketPanel;->l(Ll/zsc0;Ll/ner;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic Z3(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 6
    .line 7
    iget p1, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->code:I

    .line 8
    .line 9
    packed-switch p1, :pswitch_data_0

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :pswitch_0
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 14
    .line 15
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketPanel;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketPanel;->n()V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :pswitch_1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 22
    .line 23
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketPanel;

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketPanel;->q()V

    .line 26
    .line 27
    .line 28
    :cond_0
    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0xa287
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final synthetic a4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketPanel;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketPanel;->p()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic c4(Ll/zsc0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    if-eqz p0, :cond_0

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

.method public final synthetic d4(Ll/zsc0;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketPanel;

    .line 4
    .line 5
    iget-object p0, p0, Ll/ocg;->j:Ll/ner;

    .line 6
    .line 7
    invoke-virtual {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketPanel;->l(Ll/zsc0;Ll/ner;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic e4(Ll/bcg;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/fk2;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eq v0, v1, :cond_1

    .line 7
    .line 8
    const/4 p1, 0x2

    .line 9
    if-eq v0, p1, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-virtual {p0}, Ll/ocg;->X3()V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_1
    iget-object p1, p1, Ll/bcg;->c:Ljava/lang/String;

    .line 17
    .line 18
    invoke-direct {p0, p1}, Ll/ocg;->f4(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public n()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/ocg;->k:Ljava/lang/String;

    .line 6
    .line 7
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    new-array v0, v0, [I

    .line 6
    .line 7
    const-class v1, Ll/bcg;

    .line 8
    .line 9
    invoke-virtual {p0, v1, v0}, Ll/i6t;->i3(Ljava/lang/Class;[I)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/dcg;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/dcg;-><init>(Ll/ocg;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 23
    .line 24
    .line 25
    return-void
.end method
