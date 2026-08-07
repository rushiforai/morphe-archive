.class public Ll/soe0;
.super Ll/xgu;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/xgu<",
        "Ll/soe0;",
        ">;"
    }
.end annotation


# instance fields
.field public f:J


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Ll/knu;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/xgu;-><init>(Ll/knu;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic S2(Ll/soe0;Ll/uoe0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/soe0;->n3(Ll/uoe0;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic T2(Ll/soe0;Ll/uoe0;Lcom/p1/mobile/putong/live/base/data/BLiveData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/soe0;->m3(Ll/uoe0;Lcom/p1/mobile/putong/live/base/data/BLiveData;)V

    return-void
.end method

.method public static synthetic U2(Ll/soe0;Ll/hne0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/soe0;->i3(Ll/hne0;)V

    return-void
.end method

.method public static synthetic V2(Ll/soe0;Ll/uoe0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/soe0;->o3(Ll/uoe0;)V

    return-void
.end method

.method public static synthetic W2(Ll/soe0;Ll/uoe0;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/soe0;->j3(Ll/uoe0;Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic X2(Ll/soe0;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/soe0;->h3(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic Y2(Ll/uoe0;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uoe0;->s:Ll/y20;

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic Z2()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic a3(Ll/soe0;Ll/uoe0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/soe0;->k3(Ll/uoe0;)V

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
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ll/xnu;->q()Lrx/c;

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
    new-instance v1, Ll/yne0;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Ll/yne0;-><init>(Ll/soe0;)V

    .line 19
    .line 20
    .line 21
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Ll/ahu;->K2()Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;->SendGiftEventGroup:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$g;

    .line 33
    .line 34
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$g;->a()Ll/v3f$d;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    check-cast v0, Lrx/c;

    .line 43
    .line 44
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    new-instance v1, Ll/boe0;

    .line 49
    .line 50
    invoke-direct {v1, p0}, Ll/boe0;-><init>(Ll/soe0;)V

    .line 51
    .line 52
    .line 53
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public final b3(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Ll/uoe0;Ll/voe0;)V
    .locals 3

    .line 1
    new-instance v0, Ll/ine0;

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
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-virtual {v2}, Ll/xnu;->v()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-direct {v0, v1, v2}, Ll/ine0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v1, p2, Ll/uoe0;->m:Ll/cqj;

    .line 21
    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    invoke-virtual {p3, p2}, Ll/voe0;->a(Ll/uoe0;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {v0, p0}, Ll/ine0;->e(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p3, p2}, Ll/voe0;->b(Ll/uoe0;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {v0, p0}, Ll/ine0;->f(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v1}, Ll/cqj;->b()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->briefType:Ljava/lang/String;

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {p0}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->getAnchor()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatUser;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    const-string v1, "extra_type_normal"

    .line 58
    .line 59
    iput-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->briefType:Ljava/lang/String;

    .line 60
    .line 61
    if-eqz p0, :cond_1

    .line 62
    .line 63
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatUser;->userId:Ljava/lang/String;

    .line 64
    .line 65
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    if-nez v1, :cond_1

    .line 70
    .line 71
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatUser;->userId:Ljava/lang/String;

    .line 72
    .line 73
    invoke-virtual {v0, v1}, Ll/ine0;->e(Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatUser;->userName:Ljava/lang/String;

    .line 77
    .line 78
    invoke-virtual {v0, p0}, Ll/ine0;->f(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    :cond_1
    :goto_0
    invoke-virtual {p3}, Ll/voe0;->d()Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->givenGiftBrief:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    .line 86
    .line 87
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->tray:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBriefTray;

    .line 88
    .line 89
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->tray:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBriefTray;

    .line 90
    .line 91
    iget-object p0, p2, Ll/uoe0;->w:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;

    .line 92
    .line 93
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->drawParam:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;

    .line 94
    .line 95
    iput-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->sendGiftExtraInfo:Ll/ine0;

    .line 96
    .line 97
    return-void
.end method

.method public final c3(Ll/uoe0;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/xnu;->v()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p1, Ll/uoe0;->b:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ll/xnu;->s()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p1, Ll/uoe0;->a:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Ll/xnu;->o()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    iput-object p0, p1, Ll/uoe0;->c:Ljava/lang/String;

    .line 30
    .line 31
    return-void
.end method

.method public final d3(Ll/uoe0;)V
    .locals 5

    .line 1
    sget-object v0, Ll/htd0;->f:Ll/htd0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/civ;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/civ;->b()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p1}, Ll/uoe0;->i()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p1, Ll/uoe0;->e:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 22
    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    iget v1, p1, Ll/uoe0;->f:I

    .line 26
    .line 27
    invoke-static {v0, v1}, Ll/f3e;->d(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;I)D

    .line 28
    .line 29
    .line 30
    move-result-wide v0

    .line 31
    double-to-long v0, v0

    .line 32
    invoke-virtual {p0}, Ll/ahu;->K2()Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    iget-object v2, v2, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;->GiftDialogEventGroup:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$a;

    .line 37
    .line 38
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$a;->i()Ll/v3f$d;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    new-instance v3, Ll/r7f0;

    .line 43
    .line 44
    invoke-direct {v3}, Ll/r7f0;-><init>()V

    .line 45
    .line 46
    .line 47
    new-instance v4, Ll/foe0;

    .line 48
    .line 49
    invoke-direct {v4, p0, p1}, Ll/foe0;-><init>(Ll/soe0;Ll/uoe0;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v3, v4}, Ll/r7f0;->e(Ll/y20;)Ll/r7f0;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    new-instance v3, Ll/hoe0;

    .line 57
    .line 58
    invoke-direct {v3, p1}, Ll/hoe0;-><init>(Ll/uoe0;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0, v3}, Ll/r7f0;->d(Ll/y20;)Ll/r7f0;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {p0, v0, v1}, Ll/r7f0;->f(J)Ll/r7f0;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-virtual {v2, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :cond_0
    invoke-virtual {p0, p1}, Ll/soe0;->r3(Ll/uoe0;)V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public final e3(Ll/uoe0;Ljava/lang/Throwable;)V
    .locals 4

    .line 1
    instance-of v0, p2, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    move-object v0, p2

    .line 6
    check-cast v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 7
    .line 8
    iget v1, v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->code:I

    .line 9
    .line 10
    const v2, 0xa1b8

    .line 11
    .line 12
    .line 13
    if-lt v1, v2, :cond_0

    .line 14
    .line 15
    const v2, 0xa21b

    .line 16
    .line 17
    .line 18
    if-gt v1, v2, :cond_0

    .line 19
    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->metaMessage:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {v0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Ll/ahu;->K2()Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;->GiftDialogEventGroup:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$a;

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$a;->h()Ll/v3f$d;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    iget-object v0, p1, Ll/uoe0;->d:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    goto/16 :goto_0

    .line 41
    .line 42
    :cond_0
    const/4 v2, 0x1

    .line 43
    packed-switch v1, :pswitch_data_0

    .line 44
    .line 45
    .line 46
    const/4 v3, 0x0

    .line 47
    packed-switch v1, :pswitch_data_1

    .line 48
    .line 49
    .line 50
    packed-switch v1, :pswitch_data_2

    .line 51
    .line 52
    .line 53
    packed-switch v1, :pswitch_data_3

    .line 54
    .line 55
    .line 56
    packed-switch v1, :pswitch_data_4

    .line 57
    .line 58
    .line 59
    goto :goto_0

    .line 60
    :pswitch_0
    invoke-virtual {p0}, Ll/ahu;->act()Lcom/p1/mobile/android/app/Act;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    iget-object v0, v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->metaMessage:Ljava/lang/String;

    .line 65
    .line 66
    invoke-static {p0, v0}, Ll/o1j0;->F(Landroid/app/Activity;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    goto :goto_0

    .line 70
    :pswitch_1
    iget-object p0, v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->metaMessage:Ljava/lang/String;

    .line 71
    .line 72
    invoke-static {p0, v3, v2}, Ll/o1j0;->B(Ljava/lang/String;ZZ)V

    .line 73
    .line 74
    .line 75
    goto :goto_0

    .line 76
    :pswitch_2
    iget-object p0, v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->metaMessage:Ljava/lang/String;

    .line 77
    .line 78
    invoke-static {p0}, Ll/dpj;->x(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LangModel;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    if-eqz p0, :cond_1

    .line 83
    .line 84
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/LangModel;->getLocalName()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-static {p0, v3, v2}, Ll/o1j0;->B(Ljava/lang/String;ZZ)V

    .line 89
    .line 90
    .line 91
    goto :goto_0

    .line 92
    :pswitch_3
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 93
    .line 94
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->f5:I

    .line 95
    .line 96
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    goto :goto_0

    .line 104
    :pswitch_4
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 105
    .line 106
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->g5:I

    .line 107
    .line 108
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    goto :goto_0

    .line 116
    :pswitch_5
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 117
    .line 118
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->ea:I

    .line 119
    .line 120
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    goto :goto_0

    .line 128
    :pswitch_6
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 129
    .line 130
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Cb:I

    .line 131
    .line 132
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object p0

    .line 136
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    goto :goto_0

    .line 140
    :pswitch_7
    invoke-virtual {p0}, Ll/ahu;->act()Lcom/p1/mobile/android/app/Act;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    if-eqz v0, :cond_1

    .line 145
    .line 146
    invoke-virtual {p0}, Ll/ahu;->act()Lcom/p1/mobile/android/app/Act;

    .line 147
    .line 148
    .line 149
    move-result-object p0

    .line 150
    invoke-static {p0, v2}, Lcom/p1/mobile/putong/live/external/internal/vchat/a;->m(Lcom/p1/mobile/android/app/Act;Z)V

    .line 151
    .line 152
    .line 153
    :cond_1
    :goto_0
    iget-object p0, p1, Ll/uoe0;->e:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 154
    .line 155
    invoke-static {p0, p2}, Ll/muj;->Z(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ljava/lang/Throwable;)V

    .line 156
    .line 157
    .line 158
    iget-object p0, p1, Ll/uoe0;->r:Ll/y20;

    .line 159
    .line 160
    invoke-interface {p0, p2}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 161
    .line 162
    .line 163
    return-void

    .line 164
    nop

    .line 165
    :pswitch_data_0
    .packed-switch 0xa03d
        :pswitch_7
        :pswitch_6
        :pswitch_5
    .end packed-switch

    .line 166
    .line 167
    .line 168
    .line 169
    .line 170
    .line 171
    .line 172
    .line 173
    .line 174
    .line 175
    :pswitch_data_1
    .packed-switch 0xa0f1
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    .line 176
    .line 177
    .line 178
    .line 179
    .line 180
    .line 181
    .line 182
    .line 183
    .line 184
    .line 185
    .line 186
    .line 187
    .line 188
    .line 189
    :pswitch_data_2
    .packed-switch 0xa154
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch

    .line 190
    .line 191
    .line 192
    .line 193
    .line 194
    .line 195
    .line 196
    .line 197
    .line 198
    .line 199
    .line 200
    .line 201
    .line 202
    .line 203
    .line 204
    .line 205
    :pswitch_data_3
    .packed-switch 0xa15b
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch

    .line 206
    .line 207
    .line 208
    .line 209
    .line 210
    .line 211
    .line 212
    .line 213
    .line 214
    .line 215
    :pswitch_data_4
    .packed-switch 0xa164
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public final f3(Ll/uoe0;Ll/voe0;)V
    .locals 4

    .line 1
    sget-object v0, Ll/htd0;->b:Ll/htd0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/jfv;

    .line 8
    .line 9
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 10
    .line 11
    invoke-virtual {v1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Ll/jfv;->i(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 22
    .line 23
    invoke-virtual {v0}, Ll/wrv;->V()Lcom/p1/mobile/putong/data/User;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    :cond_0
    invoke-virtual {p2}, Ll/voe0;->d()Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->givenGiftBrief:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 38
    .line 39
    iput-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->fpUrl:Ljava/lang/String;

    .line 40
    .line 41
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 42
    .line 43
    iput-object v0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->userName:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {p2}, Ll/voe0;->d()Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->givenGiftBrief:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    .line 50
    .line 51
    iget-boolean v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->isFirstGivenGift:Z

    .line 52
    .line 53
    iput-boolean v0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->isFirstGivenGift:Z

    .line 54
    .line 55
    invoke-virtual {p2}, Ll/voe0;->d()Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->mask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 60
    .line 61
    iput-object v0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->liveUserMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 62
    .line 63
    const/4 v0, 0x0

    .line 64
    iput-boolean v0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->hasVoiceMode:Z

    .line 65
    .line 66
    invoke-virtual {p2}, Ll/voe0;->d()Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->tradeNo:Ljava/lang/String;

    .line 71
    .line 72
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-nez v0, :cond_1

    .line 77
    .line 78
    invoke-virtual {p2}, Ll/voe0;->d()Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->tradeNo:Ljava/lang/String;

    .line 83
    .line 84
    iput-object v0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->tradeNo:Ljava/lang/String;

    .line 85
    .line 86
    :cond_1
    invoke-virtual {p2}, Ll/voe0;->d()Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->givenGiftBrief:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    .line 91
    .line 92
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    if-eqz v0, :cond_2

    .line 97
    .line 98
    invoke-virtual {p2}, Ll/voe0;->d()Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->givenGiftBrief:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    .line 103
    .line 104
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->avatarTag:Ljava/lang/String;

    .line 105
    .line 106
    iput-object v0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->avatarTag:Ljava/lang/String;

    .line 107
    .line 108
    :cond_2
    invoke-virtual {p2}, Ll/voe0;->d()Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->givenGiftBrief:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    .line 113
    .line 114
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 115
    .line 116
    .line 117
    move-result v0

    .line 118
    if-eqz v0, :cond_3

    .line 119
    .line 120
    invoke-virtual {p2}, Ll/voe0;->d()Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->givenGiftBrief:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    .line 125
    .line 126
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->giftBottomTag:Ljava/lang/String;

    .line 127
    .line 128
    iput-object v0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->giftBottomTag:Ljava/lang/String;

    .line 129
    .line 130
    :cond_3
    invoke-virtual {p0, v1, p1, p2}, Ll/soe0;->b3(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Ll/uoe0;Ll/voe0;)V

    .line 131
    .line 132
    .line 133
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    invoke-virtual {v0, v1}, Ll/xnu;->P(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V

    .line 138
    .line 139
    .line 140
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    invoke-virtual {p2}, Ll/voe0;->c()J

    .line 145
    .line 146
    .line 147
    move-result-wide v2

    .line 148
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 149
    .line 150
    .line 151
    move-result-object v2

    .line 152
    invoke-virtual {v0, v2}, Ll/xnu;->O(Ljava/lang/Long;)V

    .line 153
    .line 154
    .line 155
    iget-object v0, p1, Ll/uoe0;->q:Ll/y20;

    .line 156
    .line 157
    invoke-interface {v0, v1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 158
    .line 159
    .line 160
    iget-object v0, p1, Ll/uoe0;->e:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 161
    .line 162
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 163
    .line 164
    .line 165
    move-result v0

    .line 166
    if-eqz v0, :cond_4

    .line 167
    .line 168
    iget-object v0, p1, Ll/uoe0;->e:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 169
    .line 170
    invoke-virtual {p2}, Ll/voe0;->d()Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;

    .line 171
    .line 172
    .line 173
    move-result-object v1

    .line 174
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->givenGiftBrief:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    .line 175
    .line 176
    invoke-static {v0, v1}, Ll/muj;->i0(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V

    .line 177
    .line 178
    .line 179
    :cond_4
    invoke-virtual {p0, p1, p2}, Ll/soe0;->p3(Ll/uoe0;Ll/voe0;)V

    .line 180
    .line 181
    .line 182
    return-void
.end method

.method public final g3(Ll/uoe0;)Z
    .locals 4

    .line 1
    iget-object v0, p1, Ll/uoe0;->e:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    const-string p0, "\u8b66\u544a\u26a0\ufe0f\uff0c\u793c\u7269\u5bf9\u8c61\u4e3a\u7a7a\uff0c\u8bf7\u68c0\u67e5"

    .line 7
    .line 8
    invoke-static {p0}, Ll/o1j0;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return v1

    .line 12
    :cond_0
    iget p1, p1, Ll/uoe0;->f:I

    .line 13
    .line 14
    invoke-static {v0, p1}, Ll/f3e;->d(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;I)D

    .line 15
    .line 16
    .line 17
    move-result-wide v2

    .line 18
    double-to-long v2, v2

    .line 19
    iget-wide p0, p0, Ll/soe0;->f:J

    .line 20
    .line 21
    cmp-long p0, p0, v2

    .line 22
    .line 23
    if-gez p0, :cond_2

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->isPacketGift()Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    return v1

    .line 33
    :cond_2
    :goto_0
    const/4 p0, 0x1

    .line 34
    return p0
.end method

.method public final synthetic h3(Ljava/lang/Long;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iput-wide v0, p0, Ll/soe0;->f:J

    .line 6
    .line 7
    return-void
.end method

.method public final synthetic i3(Ll/hne0;)V
    .locals 0

    .line 1
    iget-object p1, p1, Ll/hne0;->a:Ll/uoe0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/soe0;->s3(Ll/uoe0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic j3(Ll/uoe0;Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    sget-object p2, Ll/htd0;->f:Ll/htd0;

    .line 8
    .line 9
    invoke-static {p2}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    check-cast p2, Ll/civ;

    .line 14
    .line 15
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 16
    .line 17
    invoke-virtual {p2, v0}, Ll/civ;->w(Ljava/lang/Boolean;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    invoke-virtual {p0, p1}, Ll/soe0;->r3(Ll/uoe0;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final synthetic k3(Ll/uoe0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/soe0;->u3(Ll/uoe0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic m3(Ll/uoe0;Lcom/p1/mobile/putong/live/base/data/BLiveData;)V
    .locals 1

    .line 1
    new-instance v0, Ll/voe0;

    .line 2
    .line 3
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveData;->givenGiftRes:Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;

    .line 4
    .line 5
    invoke-direct {v0, p2}, Ll/voe0;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1, v0}, Ll/soe0;->f3(Ll/uoe0;Ll/voe0;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic n3(Ll/uoe0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/soe0;->e3(Ll/uoe0;Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic o3(Ll/uoe0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/soe0;->s3(Ll/uoe0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final p3(Ll/uoe0;Ll/voe0;)V
    .locals 1

    .line 1
    iget-object v0, p1, Ll/uoe0;->e:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ahu;->K2()Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;->SendGiftEventGroup:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$g;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$g;->b()Ll/v3f$d;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    new-instance v0, Ll/woe0;

    .line 16
    .line 17
    invoke-direct {v0, p1, p2}, Ll/woe0;-><init>(Ll/uoe0;Ll/voe0;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public final q3(Ll/uoe0;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ahu;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/doe0;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1}, Ll/doe0;-><init>(Ll/soe0;Ll/uoe0;)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    invoke-static {v0, p0, v1}, Lcom/p1/mobile/putong/live/external/internal/vchat/a;->o(Lcom/p1/mobile/android/app/Act;ZLl/x20;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final r3(Ll/uoe0;)V
    .locals 1

    .line 1
    iget-object v0, p1, Ll/uoe0;->e:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-static {v0}, Ll/muj;->h0(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/soe0;->t3(Ll/uoe0;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public s3(Ll/uoe0;)V
    .locals 1

    .line 1
    iget-object v0, p1, Ll/uoe0;->e:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p1, Ll/uoe0;->d:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

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
    invoke-virtual {p0, p1}, Ll/soe0;->c3(Ll/uoe0;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, p1}, Ll/soe0;->g3(Ll/uoe0;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Ll/soe0;->q3(Ll/uoe0;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    invoke-virtual {p0, p1}, Ll/soe0;->d3(Ll/uoe0;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final t3(Ll/uoe0;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {p1, v0}, Ll/jwu;->T(Ll/uoe0;Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ll/noe0;

    .line 18
    .line 19
    invoke-direct {v1, p0, p1}, Ll/noe0;-><init>(Ll/soe0;Ll/uoe0;)V

    .line 20
    .line 21
    .line 22
    new-instance v2, Ll/poe0;

    .line 23
    .line 24
    invoke-direct {v2, p0, p1}, Ll/poe0;-><init>(Ll/soe0;Ll/uoe0;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public final u3(Ll/uoe0;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/ahu;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v1, p1, Ll/uoe0;->e:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 11
    .line 12
    if-nez v1, :cond_1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_1
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    sget-object v2, Ll/zrv;->e:Landroid/app/Application;

    .line 20
    .line 21
    sget v3, Lcom/p1/mobile/putong/live/livingroom/R$string;->n5:I

    .line 22
    .line 23
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/app/Dialog$e;->G0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    new-instance v2, Ljava/lang/StringBuilder;

    .line 32
    .line 33
    const-string v3, "\u5145\u503c\u6210\u529f\uff0c\n\u7ee7\u7eed\u8d60\u9001 "

    .line 34
    .line 35
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->localName:Lcom/p1/mobile/putong/data/LangModel;

    .line 39
    .line 40
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/LangModel;->getLocalName()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    const-string v1, " \u793c\u7269?"

    .line 48
    .line 49
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->F(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 61
    .line 62
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->m5:I

    .line 63
    .line 64
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    new-instance v2, Ll/joe0;

    .line 69
    .line 70
    invoke-direct {v2, p0, p1}, Ll/joe0;-><init>(Ll/soe0;Ll/uoe0;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->v0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    sget-object p1, Ll/zrv;->e:Landroid/app/Application;

    .line 78
    .line 79
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->e5:I

    .line 80
    .line 81
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    new-instance v0, Ll/loe0;

    .line 86
    .line 87
    invoke-direct {v0}, Ll/loe0;-><init>()V

    .line 88
    .line 89
    .line 90
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/android/app/Dialog$e;->n0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z()Lcom/p1/mobile/android/app/Dialog;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 99
    .line 100
    .line 101
    :cond_2
    :goto_0
    return-void
.end method
