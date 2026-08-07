.class public Ll/ybn0;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationsEntry;",
        ">;"
    }
.end annotation


# instance fields
.field public a:I

.field public b:I


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    iput p1, p0, Ll/ybn0;->b:I

    .line 6
    .line 7
    return-void
.end method

.method public static synthetic e0(Ll/ybn0;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ybn0;->s0(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic f0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic g0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic h0(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/external/internal/api/LiveVoiceApi;->notifyRefreshVoiceActivitiesNum()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic i0()Lrx/c;
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

.method public static synthetic j0(Ll/ybn0;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ybn0;->p0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic k0(Lcom/p1/mobile/putong/live/base/data/BLiveCounter;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCounter;->activity:Lcom/p1/mobile/putong/live/base/data/BLiveActivityCounter;

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveActivityCounter;->voiceActivityUnread:I

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic l0(Ll/ybn0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ybn0;->r0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic m0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic n0(Ll/ybn0;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ybn0;->t0(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic o0(Ll/ybn0;Ll/udn0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ybn0;->q0(Ll/udn0;)V

    return-void
.end method

.method private p0(Landroid/os/Bundle;)V
    .locals 3

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
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {}, Ll/mbs;->G()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-interface {v1}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->M6()Ll/ftn0;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-interface {v1, v2}, Ll/ftn0;->d(Landroid/content/Context;)Landroid/content/Intent;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 28
    .line 29
    .line 30
    invoke-static {}, Ll/mbs;->G()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-interface {v0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->M6()Ll/ftn0;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-interface {v0, p0, p1}, Ll/ftn0;->u(Lcom/p1/mobile/android/app/Act;Landroid/os/Bundle;)V

    .line 43
    .line 44
    .line 45
    :cond_0
    return-void
.end method

.method private u0()V
    .locals 4

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/external/internal/api/LiveVoiceApi;->getVoiceFeedEntryConfig()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/sbn0;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/sbn0;-><init>(Ll/ybn0;)V

    .line 12
    .line 13
    .line 14
    new-instance v2, Ll/tbn0;

    .line 15
    .line 16
    invoke-direct {v2, p0}, Ll/tbn0;-><init>(Ll/ybn0;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

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
    move-result-object v1

    .line 32
    check-cast v1, Ll/gm3;

    .line 33
    .line 34
    invoke-virtual {v1}, Ll/gm3;->h()Lrx/subjects/a;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {p0, v1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    new-instance v2, Ll/ubn0;

    .line 43
    .line 44
    invoke-direct {v2}, Ll/ubn0;-><init>()V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v1, v2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {v1}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    new-instance v2, Ll/vbn0;

    .line 56
    .line 57
    invoke-direct {v2, p0}, Ll/vbn0;-><init>(Ll/ybn0;)V

    .line 58
    .line 59
    .line 60
    new-instance v3, Ll/wbn0;

    .line 61
    .line 62
    invoke-direct {v3}, Ll/wbn0;-><init>()V

    .line 63
    .line 64
    .line 65
    invoke-static {v2, v3}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    invoke-virtual {v1, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 70
    .line 71
    .line 72
    invoke-static {v0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    check-cast v0, Ll/gm3;

    .line 77
    .line 78
    invoke-virtual {v0}, Ll/gm3;->g()Lrx/c;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    new-instance v1, Ll/xbn0;

    .line 87
    .line 88
    invoke-direct {v1, p0}, Ll/xbn0;-><init>(Ll/ybn0;)V

    .line 89
    .line 90
    .line 91
    new-instance p0, Ll/obn0;

    .line 92
    .line 93
    invoke-direct {p0}, Ll/obn0;-><init>()V

    .line 94
    .line 95
    .line 96
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 101
    .line 102
    .line 103
    return-void
.end method


# virtual methods
.method public a0()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/tbs;->b:Ll/vwt;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/vwt;->j6()Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const/4 v1, 0x1

    .line 11
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/nbn0;

    .line 20
    .line 21
    invoke-direct {v1}, Ll/nbn0;-><init>()V

    .line 22
    .line 23
    .line 24
    new-instance v2, Ll/pbn0;

    .line 25
    .line 26
    invoke-direct {v2}, Ll/pbn0;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    new-instance v0, Ll/qbn0;

    .line 37
    .line 38
    invoke-direct {v0}, Ll/qbn0;-><init>()V

    .line 39
    .line 40
    .line 41
    const/4 v1, 0x0

    .line 42
    invoke-virtual {p0, v0, v1}, Ll/ar2;->duringCreated(Ll/pcj;Z)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    new-instance v1, Ll/rbn0;

    .line 47
    .line 48
    invoke-direct {v1, p0}, Ll/rbn0;-><init>(Ll/ybn0;)V

    .line 49
    .line 50
    .line 51
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 56
    .line 57
    .line 58
    invoke-direct {p0}, Ll/ybn0;->u0()V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic q0(Ll/udn0;)V
    .locals 2

    .line 1
    iget-object v0, p1, Ll/udn0;->a:Ljava/util/List;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-lez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p1, Ll/udn0;->a:Ljava/util/List;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveFeedSummary;

    .line 19
    .line 20
    iget-boolean v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveFeedSummary;->display:Z

    .line 21
    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 25
    .line 26
    iget-object v0, v0, Ll/sre0;->c:Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 27
    .line 28
    invoke-interface {v0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->Kb()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_0

    .line 33
    .line 34
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 35
    .line 36
    check-cast p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationsEntry;

    .line 37
    .line 38
    iget-object v0, p1, Ll/udn0;->b:Ljava/util/List;

    .line 39
    .line 40
    iget-object p1, p1, Ll/udn0;->a:Ljava/util/List;

    .line 41
    .line 42
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveFeedSummary;

    .line 47
    .line 48
    const/4 v1, 0x1

    .line 49
    invoke-virtual {p0, v0, p1, v1}, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationsEntry;->i(Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveFeedSummary;Z)V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_0
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 54
    .line 55
    check-cast p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationsEntry;

    .line 56
    .line 57
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationsEntry;->d()V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public final synthetic r0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationsEntry;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationsEntry;->d()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic s0(Ljava/lang/Integer;)V
    .locals 2

    .line 1
    iget v0, p0, Ll/ybn0;->a:I

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eq v0, v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iput v0, p0, Ll/ybn0;->a:I

    .line 14
    .line 15
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 16
    .line 17
    check-cast p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationsEntry;

    .line 18
    .line 19
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationsEntry;->setRedDot(I)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public final synthetic t0(Ll/uxj0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationsEntry;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationsEntry;->e()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public x0()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ybn0;->u0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
