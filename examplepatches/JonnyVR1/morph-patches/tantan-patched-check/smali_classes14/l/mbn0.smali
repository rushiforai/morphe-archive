.class public Ll/mbn0;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;",
        ">;"
    }
.end annotation


# instance fields
.field private info:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;

.field private lastRefreshTime:J

.field private timerRunnable:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Ll/mbn0;->lastRefreshTime:J

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic e0(Ll/mbn0;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/mbn0;->r0(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic f0(Ll/mbn0;Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/mbn0;->t0(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;)V

    return-void
.end method

.method public static synthetic g0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic h0(Ll/mbn0;Ljava/lang/Integer;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mbn0;->q0(Ljava/lang/Integer;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic i0(Ll/mbn0;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mbn0;->n0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic j0(Ll/mbn0;Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mbn0;->p0(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;)V

    return-void
.end method

.method public static synthetic k0(Ll/mbn0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/mbn0;->s0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic l0(Ll/mbn0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/mbn0;->u0()V

    return-void
.end method

.method public static synthetic m0()Lrx/c;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Msg:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 2
    .line 3
    invoke-static {v0}, Ll/mbs;->u(Lcom/p1/mobile/putong/newui/main/base/TabName;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    return-object v0
.end method

.method private synthetic r0(Ljava/lang/Integer;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mbn0;->info:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;->setUnreadShowNumber(I)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 11
    .line 12
    check-cast v0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;

    .line 13
    .line 14
    iget-object v1, p0, Ll/mbn0;->info:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->setRedDot(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    invoke-virtual {p0, p1}, Ll/mbn0;->x0(I)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method private synthetic s0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-virtual {p0, p1}, Ll/mbn0;->p0(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private u0()V
    .locals 6

    .line 1
    sget-object v0, Ll/tbs;->b:Ll/vwt;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/vwt;->ib()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    mul-int/lit16 v0, v0, 0x3e8

    .line 8
    .line 9
    int-to-long v0, v0

    .line 10
    const-wide/16 v2, 0x5

    .line 11
    .line 12
    mul-long/2addr v0, v2

    .line 13
    invoke-static {}, Ll/pzi0;->o()J

    .line 14
    .line 15
    .line 16
    move-result-wide v2

    .line 17
    iget-wide v4, p0, Ll/mbn0;->lastRefreshTime:J

    .line 18
    .line 19
    sub-long/2addr v2, v4

    .line 20
    cmp-long v2, v2, v0

    .line 21
    .line 22
    if-ltz v2, :cond_0

    .line 23
    .line 24
    iget-object v2, p0, Ll/mbn0;->timerRunnable:Ljava/lang/Runnable;

    .line 25
    .line 26
    invoke-static {v2}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 27
    .line 28
    .line 29
    new-instance v2, Ll/hbn0;

    .line 30
    .line 31
    invoke-direct {v2}, Ll/hbn0;-><init>()V

    .line 32
    .line 33
    .line 34
    const/4 v3, 0x0

    .line 35
    invoke-virtual {p0, v2, v3}, Ll/ar2;->duringCreated(Ll/pcj;Z)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    new-instance v3, Ll/ibn0;

    .line 40
    .line 41
    invoke-direct {v3, p0}, Ll/ibn0;-><init>(Ll/mbn0;)V

    .line 42
    .line 43
    .line 44
    new-instance v4, Ll/jbn0;

    .line 45
    .line 46
    invoke-direct {v4, p0}, Ll/jbn0;-><init>(Ll/mbn0;)V

    .line 47
    .line 48
    .line 49
    invoke-static {v3, v4}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    invoke-virtual {v2, v3}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 54
    .line 55
    .line 56
    invoke-static {}, Ll/pzi0;->o()J

    .line 57
    .line 58
    .line 59
    move-result-wide v2

    .line 60
    iput-wide v2, p0, Ll/mbn0;->lastRefreshTime:J

    .line 61
    .line 62
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    iget-object p0, p0, Ll/mbn0;->timerRunnable:Ljava/lang/Runnable;

    .line 67
    .line 68
    invoke-static {v2, p0, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 69
    .line 70
    .line 71
    :cond_0
    return-void
.end method


# virtual methods
.method public A0()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Ll/mbn0;->lastRefreshTime:J

    .line 4
    .line 5
    invoke-direct {p0}, Ll/mbn0;->u0()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public a0()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/bbn0;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/bbn0;-><init>()V

    .line 7
    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {p0, v0, v1}, Ll/ar2;->duringCreated(Ll/pcj;Z)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Ll/dbn0;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/dbn0;-><init>(Ll/mbn0;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    sget-object v0, Ll/itd0;->c:Ll/itd0;

    .line 27
    .line 28
    invoke-static {v0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Ll/gm3;

    .line 33
    .line 34
    invoke-virtual {v0}, Ll/gm3;->e()Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    new-instance v1, Ll/ebn0;

    .line 43
    .line 44
    invoke-direct {v1, p0}, Ll/ebn0;-><init>(Ll/mbn0;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    new-instance v1, Ll/fbn0;

    .line 52
    .line 53
    invoke-direct {v1, p0}, Ll/fbn0;-><init>(Ll/mbn0;)V

    .line 54
    .line 55
    .line 56
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 61
    .line 62
    .line 63
    new-instance v0, Ll/gbn0;

    .line 64
    .line 65
    invoke-direct {v0, p0}, Ll/gbn0;-><init>(Ll/mbn0;)V

    .line 66
    .line 67
    .line 68
    iput-object v0, p0, Ll/mbn0;->timerRunnable:Ljava/lang/Runnable;

    .line 69
    .line 70
    invoke-direct {p0}, Ll/mbn0;->u0()V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mbn0;->timerRunnable:Ljava/lang/Runnable;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-static {p0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final n0(Landroid/os/Bundle;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v1, Landroid/os/Bundle;

    .line 8
    .line 9
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 10
    .line 11
    .line 12
    const-string v2, "source"

    .line 13
    .line 14
    sget-object v3, Ll/y6s;->e:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {v1, v2, v3}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    const-string v2, "voice_internal_square_page"

    .line 20
    .line 21
    invoke-static {v0, v2, v1}, Lcom/p1/mobile/putong/live/external/page/setting/LiveIndependentSettingAct;->Z1(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 26
    .line 27
    .line 28
    invoke-static {}, Ll/mbs;->G()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-interface {v0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->M6()Ll/ftn0;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-interface {v0, p0, p1}, Ll/ftn0;->u(Lcom/p1/mobile/android/app/Act;Landroid/os/Bundle;)V

    .line 41
    .line 42
    .line 43
    :cond_0
    return-void
.end method

.method public o0(Landroid/content/Context;Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_5

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;->getHasRedSpot()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 13
    .line 14
    iget-object v0, v0, Ll/sre0;->c:Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 15
    .line 16
    invoke-interface {v0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->Lh()Ll/qam;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-interface {v0}, Ll/qam;->d()Lrx/subjects/a;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Ljava/lang/Integer;

    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-lez v0, :cond_2

    .line 35
    .line 36
    :cond_1
    invoke-virtual {p0, p2}, Ll/mbn0;->y0(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;)V

    .line 37
    .line 38
    .line 39
    :cond_2
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;->getGoAction()Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    if-eqz p0, :cond_4

    .line 44
    .line 45
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;->isJumpBackToMessage()Z

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    if-nez p0, :cond_3

    .line 50
    .line 51
    new-instance p0, Landroid/os/Bundle;

    .line 52
    .line 53
    invoke-direct {p0}, Landroid/os/Bundle;-><init>()V

    .line 54
    .line 55
    .line 56
    const-string v0, "source"

    .line 57
    .line 58
    sget-object v1, Ll/y6s;->e:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {p0, v0, v1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    const-string v0, "voice_internal_square_page"

    .line 64
    .line 65
    invoke-static {p1, v0, p0}, Lcom/p1/mobile/putong/live/external/page/setting/LiveIndependentSettingAct;->Z1(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 70
    .line 71
    .line 72
    :cond_3
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;->getGoAction()Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-static {p1, p0}, Ll/yrs;->a(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;->getTrackData()Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/apibean/LiveCardTracker;->trackMc(Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;)V

    .line 84
    .line 85
    .line 86
    return-void

    .line 87
    :cond_4
    const/4 p0, 0x0

    .line 88
    invoke-static {p1, p0}, Ll/h3g0;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    :cond_5
    :goto_0
    return-void
.end method

.method public final p0(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;)V
    .locals 3

    .line 1
    iput-object p1, p0, Ll/mbn0;->info:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz p1, :cond_2

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;->getTitle()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;->getSubTitle()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;->getHeadSculptureList()Ljava/util/ArrayList;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-nez v1, :cond_2

    .line 35
    .line 36
    :cond_0
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 37
    .line 38
    check-cast v1, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;

    .line 39
    .line 40
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->l(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;->getUnreadShowNumber()I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-lez v1, :cond_1

    .line 48
    .line 49
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;->getUnreadShowNumber()I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    goto :goto_0

    .line 54
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;->getHasRedSpot()Z

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    if-eqz p1, :cond_3

    .line 59
    .line 60
    const/4 v0, 0x1

    .line 61
    goto :goto_0

    .line 62
    :cond_2
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 63
    .line 64
    check-cast p1, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;

    .line 65
    .line 66
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->j()V

    .line 67
    .line 68
    .line 69
    invoke-static {}, Ll/pzi0;->o()J

    .line 70
    .line 71
    .line 72
    move-result-wide v1

    .line 73
    iput-wide v1, p0, Ll/mbn0;->lastRefreshTime:J

    .line 74
    .line 75
    :cond_3
    :goto_0
    invoke-virtual {p0, v0}, Ll/mbn0;->x0(I)V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method public final synthetic q0(Ljava/lang/Integer;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ll/mbn0;->info:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;->getUnreadShowNumber()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eq p0, p1, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public final synthetic t0(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;)V
    .locals 1

    .line 1
    const/4 p2, 0x0

    .line 2
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;->setHasRedSpot(Z)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;->setUnreadShowNumber(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast v0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->setRedDot(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, p2}, Ll/mbn0;->x0(I)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final x0(I)V
    .locals 0

    .line 1
    sget-object p0, Ll/uqb0;->b0:Ll/sre0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/sre0;->c:Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->Lh()Ll/qam;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Ll/qam;->d()Lrx/subjects/a;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public y0(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;)V
    .locals 2

    .line 1
    new-instance v0, Ll/kbn0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/kbn0;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-virtual {p0, v0, v1}, Ll/ar2;->duringCreated(Ll/pcj;Z)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/lbn0;

    .line 12
    .line 13
    invoke-direct {v1, p0, p1}, Ll/lbn0;-><init>(Ll/mbn0;Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;)V

    .line 14
    .line 15
    .line 16
    new-instance p0, Ll/cbn0;

    .line 17
    .line 18
    invoke-direct {p0}, Ll/cbn0;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public z0()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/mbn0;->u0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
