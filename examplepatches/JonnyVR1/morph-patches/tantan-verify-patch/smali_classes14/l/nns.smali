.class public Ll/nns;
.super Ll/ahu;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ll/knu;",
        ">",
        "Ll/ahu<",
        "Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/tray/LiveVChatGiftTrays;",
        ">;"
    }
.end annotation


# static fields
.field public static final j:I


# instance fields
.field public final f:Ll/eks;

.field public g:Ll/wij0;

.field public h:Landroid/os/HandlerThread;

.field public i:Landroid/os/Handler;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/high16 v0, 0x42100000    # 36.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sput v0, Ll/nns;->j:I

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Ll/knu;Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/tray/LiveVChatGiftTrays;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/ahu;-><init>(Ll/knu;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Landroid/os/HandlerThread;

    .line 5
    .line 6
    const-string v0, "live_gift_list"

    .line 7
    .line 8
    invoke-direct {p1, v0}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Ll/nns;->h:Landroid/os/HandlerThread;

    .line 12
    .line 13
    new-instance p1, Ll/eks;

    .line 14
    .line 15
    invoke-direct {p1}, Ll/eks;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object p1, p0, Ll/nns;->f:Ll/eks;

    .line 19
    .line 20
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static synthetic R2(Ll/nns;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nns;->w3(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic S2(Ll/nns;Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nns;->s3(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;)V

    return-void
.end method

.method public static synthetic T2(Ll/nns;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nns;->x3(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V

    return-void
.end method

.method public static synthetic U2(Ll/nns;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)Ljava/util/List;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nns;->o3(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic V2(Ll/nns;Ll/bsj;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nns;->u3(Ll/bsj;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic W2(Ll/nns;Ll/vzj;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nns;->t3(Ll/vzj;)V

    return-void
.end method

.method public static synthetic X2(Ll/nns;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nns;->r3(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic Y2(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic Z2(Lcom/p1/mobile/putong/live/base/data/BLiveGiftGearEffectInfo;Lcom/p1/mobile/putong/live/base/data/BLiveGiftGearEffectInfo;)I
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftGearEffectInfo;->since:J

    .line 2
    .line 3
    iget-wide p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftGearEffectInfo;->since:J

    .line 4
    .line 5
    sub-long/2addr v0, p0

    .line 6
    long-to-int p0, v0

    .line 7
    return p0
.end method

.method public static synthetic a3(Ll/nns;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nns;->g3(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic b3(Ll/nns;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nns;->v3(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic c3(Ll/nns;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/nns;->e3(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    return-void
.end method

.method private e3(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/tray/LiveVChatGiftTrays;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/tray/LiveVChatGiftTrays;->c(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->w()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 18
    .line 19
    check-cast v0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/tray/LiveVChatGiftTrays;

    .line 20
    .line 21
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/tray/LiveVChatGiftTrays;->i(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)Z

    .line 22
    .line 23
    .line 24
    :cond_0
    iget-object v0, p0, Ll/nns;->f:Ll/eks;

    .line 25
    .line 26
    invoke-virtual {v0, p1}, Ll/eks;->d(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Ll/nns;->f:Ll/eks;

    .line 30
    .line 31
    monitor-enter p1

    .line 32
    :try_start_0
    iget-object p0, p0, Ll/nns;->f:Ll/eks;

    .line 33
    .line 34
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 35
    .line 36
    .line 37
    monitor-exit p1

    .line 38
    return-void

    .line 39
    :catchall_0
    move-exception p0

    .line 40
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 41
    throw p0

    .line 42
    :cond_1
    return-void
.end method


# virtual methods
.method public B3(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V
    .locals 4

    .line 1
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->Q:J

    .line 2
    .line 3
    const-wide/16 v2, 0x1

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->O:Ljava/lang/String;

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->y:Ljava/lang/String;

    .line 13
    .line 14
    :goto_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_2

    .line 19
    .line 20
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->r()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    goto :goto_1

    .line 27
    :cond_1
    return-void

    .line 28
    :cond_2
    :goto_1
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->P:J

    .line 29
    .line 30
    cmp-long v0, v0, v2

    .line 31
    .line 32
    const/16 v1, 0x5dc

    .line 33
    .line 34
    if-nez v0, :cond_3

    .line 35
    .line 36
    invoke-virtual {p0}, Ll/ahu;->K2()Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;->GiftTraysEventGroup:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$b;

    .line 41
    .line 42
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$b;->b()Ll/v3f$d;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    new-instance v0, Ll/vzj$a;

    .line 47
    .line 48
    invoke-direct {v0, v1}, Ll/vzj$a;-><init>(I)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0, p1}, Ll/vzj$a;->f(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)Ll/vzj$a;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-virtual {p1}, Ll/vzj$a;->e()Ll/vzj;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_3
    invoke-virtual {p0}, Ll/ahu;->K2()Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;->GiftTraysEventGroup:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$b;

    .line 68
    .line 69
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$b;->d()Ll/v3f$d;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    new-instance v0, Ll/vzj$a;

    .line 74
    .line 75
    invoke-direct {v0, v1}, Ll/vzj$a;-><init>(I)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v0, p1}, Ll/vzj$a;->f(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)Ll/vzj$a;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    invoke-virtual {p1}, Ll/vzj$a;->e()Ll/vzj;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method public final C3(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V
    .locals 4

    .line 1
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->pollFromNetwork:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance v0, Ll/uxj$a;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1}, Ll/xnu;->v()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-virtual {v2}, Ll/xnu;->o()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    const-string v3, "live"

    .line 25
    .line 26
    invoke-direct {v0, v1, v2, v3}, Ll/uxj$a;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    new-instance v1, Ll/sms;

    .line 30
    .line 31
    invoke-direct {v1, p0, p1}, Ll/sms;-><init>(Ll/nns;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v1}, Ll/uxj$a;->g(Ll/x20;)Ll/uxj$a;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p1}, Ll/uxj$a;->f()Ll/uxj;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    const/4 v0, 0x0

    .line 47
    invoke-virtual {p0, p1, v0}, Ll/xnu;->N(Ll/uxj;Ll/y20;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public D3()V
    .locals 2

    .line 1
    new-instance v0, Ll/wij0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/nns;->f:Ll/eks;

    .line 4
    .line 5
    invoke-direct {v0, v1, p0}, Ll/wij0;-><init>(Ll/eks;Ll/nns;)V

    .line 6
    .line 7
    .line 8
    iput-object v0, p0, Ll/nns;->g:Ll/wij0;

    .line 9
    .line 10
    sget-object p0, Ll/hdu;->b:Ll/hdu;

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Ll/hdu;->a(Ljava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public T()V
    .locals 4

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/tray/LiveVChatGiftTrays;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/tray/LiveVChatGiftTrays;->l(I)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/nns;->h:Landroid/os/HandlerThread;

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 15
    .line 16
    .line 17
    new-instance v0, Landroid/os/Handler;

    .line 18
    .line 19
    iget-object v2, p0, Ll/nns;->h:Landroid/os/HandlerThread;

    .line 20
    .line 21
    invoke-virtual {v2}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-direct {v0, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 26
    .line 27
    .line 28
    iput-object v0, p0, Ll/nns;->i:Landroid/os/Handler;

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iget-object v0, v0, Ll/xnu;->c:Ll/ecl0;

    .line 35
    .line 36
    invoke-virtual {v0}, Ll/ecl0;->l()Ll/aj1;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {v0}, Ll/aj1;->B()Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iget-object v2, p0, Ll/nns;->i:Landroid/os/Handler;

    .line 49
    .line 50
    invoke-static {v2}, Ll/qxk;->a(Landroid/os/Handler;)Ll/qxk;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-virtual {v0, v2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    new-instance v2, Ll/oms;

    .line 59
    .line 60
    invoke-direct {v2, p0}, Ll/oms;-><init>(Ll/nns;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    new-instance v2, Ll/wms;

    .line 68
    .line 69
    invoke-direct {v2, p0}, Ll/wms;-><init>(Ll/nns;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v0, v2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    invoke-virtual {v0, v2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    new-instance v2, Ll/yms;

    .line 85
    .line 86
    invoke-direct {v2, p0}, Ll/yms;-><init>(Ll/nns;)V

    .line 87
    .line 88
    .line 89
    invoke-static {v2}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 94
    .line 95
    .line 96
    invoke-virtual {p0}, Ll/ahu;->K2()Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;->GiftDialogEventGroup:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$a;

    .line 101
    .line 102
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$a;->a()Ll/v3f$d;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    check-cast v0, Lrx/c;

    .line 111
    .line 112
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    new-instance v2, Ll/ans;

    .line 117
    .line 118
    invoke-direct {v2, p0}, Ll/ans;-><init>(Ll/nns;)V

    .line 119
    .line 120
    .line 121
    invoke-static {v2}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 122
    .line 123
    .line 124
    move-result-object v2

    .line 125
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 126
    .line 127
    .line 128
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    iget-object v0, v0, Ll/xnu;->c:Ll/ecl0;

    .line 133
    .line 134
    invoke-virtual {v0}, Ll/ecl0;->l()Ll/aj1;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    invoke-virtual {v0}, Ll/aj1;->u()Lrx/c;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    new-instance v2, Ll/cns;

    .line 147
    .line 148
    invoke-direct {v2, p0}, Ll/cns;-><init>(Ll/nns;)V

    .line 149
    .line 150
    .line 151
    new-instance v3, Ll/ens;

    .line 152
    .line 153
    invoke-direct {v3}, Ll/ens;-><init>()V

    .line 154
    .line 155
    .line 156
    invoke-static {v2, v3}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 157
    .line 158
    .line 159
    move-result-object v2

    .line 160
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 161
    .line 162
    .line 163
    invoke-virtual {p0}, Ll/ahu;->K2()Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;

    .line 164
    .line 165
    .line 166
    move-result-object v0

    .line 167
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;->GiftTraysEventGroup:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$b;

    .line 168
    .line 169
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$b;->a()Ll/v3f$d;

    .line 170
    .line 171
    .line 172
    move-result-object v0

    .line 173
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 174
    .line 175
    .line 176
    move-result-object v0

    .line 177
    check-cast v0, Lrx/c;

    .line 178
    .line 179
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 180
    .line 181
    .line 182
    move-result-object v0

    .line 183
    new-instance v2, Ll/gns;

    .line 184
    .line 185
    invoke-direct {v2, p0}, Ll/gns;-><init>(Ll/nns;)V

    .line 186
    .line 187
    .line 188
    invoke-static {v2}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 189
    .line 190
    .line 191
    move-result-object v2

    .line 192
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 193
    .line 194
    .line 195
    new-instance v0, Ll/ins;

    .line 196
    .line 197
    invoke-direct {v0, p0}, Ll/ins;-><init>(Ll/nns;)V

    .line 198
    .line 199
    .line 200
    const-class v2, Ll/bsj;

    .line 201
    .line 202
    invoke-virtual {p0, v2, v0}, Ll/ahu;->F2(Ljava/lang/Class;Ll/qcj;)V

    .line 203
    .line 204
    .line 205
    invoke-virtual {p0}, Ll/ahu;->K2()Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;

    .line 206
    .line 207
    .line 208
    move-result-object v0

    .line 209
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;->TraysViewEventGroup:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$h;

    .line 210
    .line 211
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$h;->a()Ll/v3f$d;

    .line 212
    .line 213
    .line 214
    move-result-object v0

    .line 215
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 216
    .line 217
    .line 218
    move-result-object v0

    .line 219
    check-cast v0, Lrx/c;

    .line 220
    .line 221
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 222
    .line 223
    .line 224
    move-result-object v0

    .line 225
    new-instance v2, Ll/kns;

    .line 226
    .line 227
    invoke-direct {v2, p0}, Ll/kns;-><init>(Ll/nns;)V

    .line 228
    .line 229
    .line 230
    invoke-static {v2}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 231
    .line 232
    .line 233
    move-result-object v2

    .line 234
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 235
    .line 236
    .line 237
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 238
    .line 239
    .line 240
    move-result-object v0

    .line 241
    invoke-virtual {v0}, Ll/xnu;->z()Lrx/c;

    .line 242
    .line 243
    .line 244
    move-result-object v0

    .line 245
    invoke-virtual {p0, v0, v1}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    .line 246
    .line 247
    .line 248
    move-result-object v0

    .line 249
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 250
    .line 251
    .line 252
    move-result-object v0

    .line 253
    new-instance v1, Ll/mns;

    .line 254
    .line 255
    invoke-direct {v1, p0}, Ll/mns;-><init>(Ll/nns;)V

    .line 256
    .line 257
    .line 258
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 259
    .line 260
    .line 261
    move-result-object p0

    .line 262
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 263
    .line 264
    .line 265
    return-void
.end method

.method public final d3(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V
    .locals 4

    .line 1
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->Q:J

    .line 2
    .line 3
    const-wide/16 v2, 0x1

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->O:Ljava/lang/String;

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->y:Ljava/lang/String;

    .line 13
    .line 14
    :goto_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    invoke-direct {p0, p1}, Ll/nns;->e3(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_1
    invoke-static {}, Ll/ere;->i()Ll/ere;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v1, v0}, Ll/ere;->h(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveEffect;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    if-nez v1, :cond_2

    .line 33
    .line 34
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->v()Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    invoke-virtual {p0}, Ll/ahu;->N2()Z

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    invoke-static {p1, v1, v2}, Ll/e4d0;->b(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;ZZ)Ll/e4d0;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {v1}, Ll/e4d0;->a()Ll/pre;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    const/4 v3, 0x0

    .line 51
    invoke-virtual {v2, v3}, Ll/pre;->e(Z)V

    .line 52
    .line 53
    .line 54
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 55
    .line 56
    .line 57
    invoke-static {}, Ll/ere;->i()Ll/ere;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    new-instance v3, Ll/nns$a;

    .line 62
    .line 63
    invoke-direct {v3, p0}, Ll/nns$a;-><init>(Ll/nns;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v2, v0, v1, v3}, Ll/ere;->x(Ljava/lang/String;Ll/e4d0;Ll/w8e;)V

    .line 67
    .line 68
    .line 69
    invoke-direct {p0, p1}, Ll/nns;->e3(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :cond_2
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->z()Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-nez v0, :cond_4

    .line 78
    .line 79
    invoke-static {}, Ll/ere;->i()Ll/ere;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    iget-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->id:Ljava/lang/String;

    .line 84
    .line 85
    invoke-virtual {v0, v2}, Ll/ere;->j(Ljava/lang/String;)Z

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    if-eqz v0, :cond_3

    .line 90
    .line 91
    goto :goto_1

    .line 92
    :cond_3
    invoke-virtual {p0, p1, v1}, Ll/nns;->j3(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Lcom/p1/mobile/putong/live/base/data/BLiveEffect;)V

    .line 93
    .line 94
    .line 95
    return-void

    .line 96
    :cond_4
    :goto_1
    invoke-direct {p0, p1}, Ll/nns;->e3(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    .line 97
    .line 98
    .line 99
    return-void
.end method

.method public final f3(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_2

    .line 8
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_3

    .line 17
    .line 18
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 23
    .line 24
    const/4 v2, 0x0

    .line 25
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    if-eq v2, v1, :cond_2

    .line 30
    .line 31
    iget-boolean v2, v1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->m:Z

    .line 32
    .line 33
    if-eqz v2, :cond_1

    .line 34
    .line 35
    goto :goto_1

    .line 36
    :cond_1
    invoke-direct {p0, v1}, Ll/nns;->e3(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_2
    :goto_1
    invoke-virtual {p0, v1}, Ll/nns;->d3(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_3
    :goto_2
    return-void
.end method

.method public final g3(Ljava/util/List;)V
    .locals 1
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

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
    invoke-virtual {p0, p1}, Ll/nns;->f3(Ljava/util/List;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public h3(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public i3(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;)Z
    .locals 4

    .line 1
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->enterVersion:J

    .line 2
    .line 3
    const-wide/16 v2, 0x1

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->newResourceId:Ljava/lang/String;

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->effectId:Ljava/lang/String;

    .line 13
    .line 14
    :goto_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    const-string v0, "videoChat"

    .line 21
    .line 22
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->g(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p0, p1}, Ll/nns;->d3(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    .line 27
    .line 28
    .line 29
    const/4 p0, 0x1

    .line 30
    return p0

    .line 31
    :cond_1
    const/4 p0, 0x0

    .line 32
    return p0
.end method

.method public final j3(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Lcom/p1/mobile/putong/live/base/data/BLiveEffect;)V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0}, Ll/ahu;->N2()Z

    .line 3
    .line 4
    .line 5
    move-result v1

    .line 6
    invoke-static {p1, v0, v1}, Ll/e4d0;->b(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;ZZ)Ll/e4d0;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->type:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {v1}, Ll/wqe;->d(Ljava/lang/String;)Ll/l4;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->id:Ljava/lang/String;

    .line 17
    .line 18
    new-instance v2, Ll/nns$b;

    .line 19
    .line 20
    invoke-direct {v2, p0, p1}, Ll/nns$b;-><init>(Ll/nns;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    .line 21
    .line 22
    .line 23
    const/4 v3, 0x1

    .line 24
    invoke-virtual {v1, p2, v3, v2, v0}, Ll/l4;->f(Ljava/lang/String;ZLl/w8e;Ll/e4d0;)Z

    .line 25
    .line 26
    .line 27
    move-result p2

    .line 28
    if-eqz p2, :cond_0

    .line 29
    .line 30
    invoke-direct {p0, p1}, Ll/nns;->e3(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method public final k3(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;",
            ")",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;",
            ">;"
        }
    .end annotation

    .line 1
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->isGear:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->gear:Lcom/p1/mobile/putong/live/base/data/BLiveGiftGearInfo;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftGearInfo;->gearEffects:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->gear:Lcom/p1/mobile/putong/live/base/data/BLiveGiftGearInfo;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftGearInfo;->gearEffects:Ljava/util/List;

    .line 18
    .line 19
    new-instance v1, Ll/qms;

    .line 20
    .line 21
    invoke-direct {v1}, Ll/qms;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Ll/xnu;->s()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-static {p1, p2, p0}, Ll/uzj;->a(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ljava/lang/String;)Ljava/util/List;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0
.end method

.method public final m3(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p2, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->o(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Ll/oo2;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    iget v2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->id:I

    .line 11
    .line 12
    invoke-virtual {v1, v2}, Ll/xnu;->r(I)Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->url:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->x:Ljava/lang/String;

    .line 21
    .line 22
    iput-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->w:Ljava/lang/String;

    .line 23
    .line 24
    :cond_0
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0}, Ll/xnu;->s()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    iput-object p0, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->h:Ljava/lang/String;

    .line 33
    .line 34
    invoke-static {p2, v0, p1}, Ll/uzj;->c(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V

    .line 35
    .line 36
    .line 37
    return-object v0
.end method

.method public n()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/l6t;->n()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/nns;->reset()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public n3(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    check-cast p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/tray/LiveVChatGiftTrays;

    .line 10
    .line 11
    const/high16 p1, 0x42c80000    # 100.0f

    .line 12
    .line 13
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    neg-int p1, p1

    .line 18
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/tray/LiveVChatGiftTrays;->l(I)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    check-cast p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/tray/LiveVChatGiftTrays;

    .line 23
    .line 24
    const/4 p1, 0x0

    .line 25
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/tray/LiveVChatGiftTrays;->l(I)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final o3(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;",
            ")",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->isGiftBrief()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->isLianMaiBrief()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-nez v1, :cond_0

    .line 18
    .line 19
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->isAudienceBrief()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-nez v1, :cond_0

    .line 24
    .line 25
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->isMultiCall()Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-nez v1, :cond_0

    .line 30
    .line 31
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->isGuildCall()Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-nez v1, :cond_0

    .line 36
    .line 37
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->isAuctionBrief()Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-nez v1, :cond_0

    .line 42
    .line 43
    return-object v0

    .line 44
    :cond_0
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    iget v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->id:I

    .line 49
    .line 50
    invoke-virtual {v1, v2}, Ll/xnu;->r(I)Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    if-nez v1, :cond_1

    .line 55
    .line 56
    invoke-virtual {p0, p1}, Ll/nns;->C3(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V

    .line 57
    .line 58
    .line 59
    return-object v0

    .line 60
    :cond_1
    invoke-virtual {p0, p1}, Ll/nns;->q3(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)Z

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    if-eqz v2, :cond_2

    .line 65
    .line 66
    invoke-virtual {p0, p1, v1}, Ll/nns;->k3(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)Ljava/util/List;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    return-object p0

    .line 71
    :cond_2
    invoke-virtual {p0, p1, v1}, Ll/nns;->m3(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    return-object v0
.end method

.method public p3(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTraysPresenter$TrayType;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    check-cast p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/tray/LiveVChatGiftTrays;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/tray/LiveVChatGiftTrays;->j(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTraysPresenter$TrayType;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public final q3(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)Z
    .locals 1

    .line 1
    iget p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->num:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-le p0, v0, :cond_0

    .line 5
    .line 6
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->combos:I

    .line 7
    .line 8
    sub-int/2addr p1, p0

    .line 9
    if-ltz p1, :cond_0

    .line 10
    .line 11
    return v0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0
.end method

.method public final synthetic r3(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->videoChatId:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->videoChatId:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->id:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const/4 p0, 0x0

    .line 29
    goto :goto_1

    .line 30
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 31
    :goto_1
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0
.end method

.method public reset()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/nns;->h:Landroid/os/HandlerThread;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Landroid/os/HandlerThread;->quit()Z

    .line 7
    .line 8
    .line 9
    iput-object v1, p0, Ll/nns;->h:Landroid/os/HandlerThread;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Ll/nns;->i:Landroid/os/Handler;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    iput-object v1, p0, Ll/nns;->i:Landroid/os/Handler;

    .line 16
    .line 17
    :cond_1
    iget-object v0, p0, Ll/nns;->f:Ll/eks;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/eks;->i()V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Ll/nns;->g:Ll/wij0;

    .line 23
    .line 24
    if-eqz p0, :cond_2

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/wij0;->d()V

    .line 27
    .line 28
    .line 29
    :cond_2
    return-void
.end method

.method public final synthetic s3(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;)V
    .locals 1

    .line 1
    const-string v0, "videoChat"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->j(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Ll/nns;->d3(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic t3(Ll/vzj;)V
    .locals 0

    .line 1
    iget-object p1, p1, Ll/vzj;->f:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/nns;->d3(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic u3(Ll/bsj;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Ll/bsj;->c:Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/nns;->i3(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public final synthetic v3(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/tray/LiveVChatGiftTrays;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/tray/LiveVChatGiftTrays;->e(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic w3(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {p1}, Ll/yuk0;->a(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/nns;->D3()V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p1}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-static {p1}, Ll/yuk0;->e(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-eqz p1, :cond_1

    .line 32
    .line 33
    iget-object p1, p0, Ll/nns;->f:Ll/eks;

    .line 34
    .line 35
    invoke-virtual {p1}, Ll/eks;->i()V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Ll/nns;->g:Ll/wij0;

    .line 39
    .line 40
    if-eqz p0, :cond_1

    .line 41
    .line 42
    invoke-virtual {p0}, Ll/wij0;->d()V

    .line 43
    .line 44
    .line 45
    :cond_1
    return-void
.end method

.method public final synthetic x3(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->pollFromNetwork:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0, p1}, Ll/xnu;->P(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public y3(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/nns;->f:Ll/eks;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    :try_start_0
    iget-object v1, p0, Ll/nns;->f:Ll/eks;

    .line 7
    .line 8
    invoke-virtual {v1, p1}, Ll/eks;->g(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    .line 9
    .line 10
    .line 11
    goto :goto_0

    .line 12
    :catchall_0
    move-exception p0

    .line 13
    goto :goto_1

    .line 14
    :cond_0
    :goto_0
    iget-object p1, p0, Ll/nns;->f:Ll/eks;

    .line 15
    .line 16
    invoke-virtual {p1}, Ljava/lang/Object;->notifyAll()V

    .line 17
    .line 18
    .line 19
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20
    invoke-virtual {p0}, Ll/ahu;->K2()Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;->GiftTraysEventGroup:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$b;

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$b;->c()Ll/v3f$d;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 37
    throw p0
.end method

.method public z3(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTraysPresenter$TrayType;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/tray/LiveVChatGiftTrays;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/nns;->h3(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {v0, p2, p1, v1}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/tray/LiveVChatGiftTrays;->p(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTraysPresenter$TrayType;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Z)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Ll/ahu;->K2()Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;->GiftTraysEventGroup:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$b;

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$b;->c()Ll/v3f$d;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method
