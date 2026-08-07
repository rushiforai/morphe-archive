.class public Ll/gru;
.super Ll/ahu;
.source "SourceFile"

# interfaces
.implements Ll/aam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ahu<",
        "Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;",
        ">;",
        "Ll/aam;"
    }
.end annotation


# instance fields
.field public f:Ll/gcl0;


# direct methods
.method public constructor <init>(Ll/knu;Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/ahu;-><init>(Ll/knu;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    invoke-virtual {p2}, Ll/xnu;->u()Ll/gcl0;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    iput-object p2, p0, Ll/gru;->f:Ll/gcl0;

    .line 16
    .line 17
    new-instance v0, Ll/grk0;

    .line 18
    .line 19
    invoke-virtual {p2}, Ll/gcl0;->b()Ll/vzl;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    invoke-direct {v0, p1, p2}, Ll/grk0;-><init>(Ll/knu;Ll/vzl;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public static synthetic R2(Ll/gru;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/gru;->d3(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic S2(Ll/gru;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/gru;->e3(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic T2(Ll/gru;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/gru;->h3(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic U2(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "tokenError:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const-string v0, "videoChat"

    .line 20
    .line 21
    invoke-static {v0, p0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public static synthetic V2(Ll/gru;Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/gru;->g3(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;)V

    return-void
.end method

.method public static synthetic W2(Ll/gru;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/gru;->k3(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic X2(Ll/gru;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/gru;->j3(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic Y2(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-eq p0, v0, :cond_1

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/android/app/c;->k:Lcom/p1/mobile/android/app/c;

    .line 6
    .line 7
    if-ne p0, v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    goto :goto_1

    .line 12
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 13
    :goto_1
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public static synthetic Z2(Ll/gru;Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/gru;->m3(Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;)V

    return-void
.end method

.method public static synthetic a3(Ll/gru;Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/gru;->f3(Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method private synthetic d3(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/gru;->c3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic e3(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/gru;->f:Ll/gcl0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/gcl0;->g()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    sget-object v0, Lcom/p1/mobile/android/app/c;->k:Lcom/p1/mobile/android/app/c;

    .line 12
    .line 13
    if-ne p1, v0, :cond_1

    .line 14
    .line 15
    iget-object p0, p0, Ll/gru;->f:Ll/gcl0;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/gcl0;->f()V

    .line 18
    .line 19
    .line 20
    :cond_1
    return-void
.end method

.method private m3(Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "updateRtcToken:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "videoChat"

    .line 16
    .line 17
    invoke-static {v1, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ll/gru;->f:Ll/gcl0;

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/gcl0;->d()Ll/yzl;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;->channelKey:Ljava/lang/String;

    .line 27
    .line 28
    invoke-interface {p0, p1}, Ll/yzl;->o(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method


# virtual methods
.method public H(JI)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "onMemberLeaveChannel:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, ",reason:"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p3

    .line 23
    const-string v0, "videoChat"

    .line 24
    .line 25
    invoke-static {v0, p3}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 29
    .line 30
    .line 31
    move-result-object p3

    .line 32
    invoke-virtual {p3}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 33
    .line 34
    .line 35
    move-result-object p3

    .line 36
    if-nez p3, :cond_0

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    invoke-virtual {p0}, Ll/ahu;->N2()Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_1

    .line 44
    .line 45
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    iget-object v1, p3, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->userId:Ljava/lang/String;

    .line 50
    .line 51
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-eqz v0, :cond_1

    .line 56
    .line 57
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    sget-object v1, Ll/yuk0;->f:Ljava/lang/String;

    .line 62
    .line 63
    invoke-virtual {v0, v1}, Ll/xnu;->S(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    :cond_1
    invoke-virtual {p0}, Ll/ahu;->N2()Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    if-nez v0, :cond_2

    .line 71
    .line 72
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    iget-object p2, p3, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->anchorId:Ljava/lang/String;

    .line 77
    .line 78
    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 79
    .line 80
    .line 81
    move-result p1

    .line 82
    if-eqz p1, :cond_2

    .line 83
    .line 84
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    sget-object p1, Ll/yuk0;->f:Ljava/lang/String;

    .line 89
    .line 90
    invoke-virtual {p0, p1}, Ll/xnu;->S(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    :cond_2
    :goto_0
    return-void
.end method

.method public I(JZ)V
    .locals 1

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v0, "onMemberAudioMuted:"

    .line 4
    .line 5
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string p1, ",muted:"

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const-string p1, "videoChat"

    .line 24
    .line 25
    invoke-static {p1, p0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public Q1(I)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Ll/yuk0;->c:Ljava/lang/String;

    .line 6
    .line 7
    new-instance v1, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v2, "engineError "

    .line 10
    .line 11
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p0, v0, p1}, Ll/xnu;->T(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public S1(Ljava/lang/String;J)V
    .locals 1

    .line 1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v0, "onLocalJoinChannel:"

    .line 4
    .line 5
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v0, ",uid:"

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    const-string p2, "videoChat"

    .line 24
    .line 25
    invoke-static {p2, p1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    sget-object p1, Ll/yuk0;->b:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {p0, p1}, Ll/xnu;->S(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

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
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$e;->k()Ll/v3f$d;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Ll/wqu;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/wqu;-><init>(Ll/gru;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, v0, v1}, Ll/ahu;->I2(Ll/v3f$b;Ll/y20;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ll/ahu;->K2()Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;->LiveVideoChatEvent:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$e;

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$e;->a()Ll/v3f$d;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    new-instance v1, Ll/xqu;

    .line 33
    .line 34
    invoke-direct {v1, p0}, Ll/xqu;-><init>(Ll/gru;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0, v0, v1}, Ll/ahu;->I2(Ll/v3f$b;Ll/y20;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v0}, Ll/xnu;->z()Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    const/4 v1, 0x0

    .line 49
    invoke-virtual {p0, v0, v1}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    new-instance v1, Ll/yqu;

    .line 58
    .line 59
    invoke-direct {v1, p0}, Ll/yqu;-><init>(Ll/gru;)V

    .line 60
    .line 61
    .line 62
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0}, Ll/ahu;->act()Lcom/p1/mobile/android/app/Act;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    new-instance v1, Ll/zqu;

    .line 78
    .line 79
    invoke-direct {v1}, Ll/zqu;-><init>()V

    .line 80
    .line 81
    .line 82
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    const/4 v1, 0x1

    .line 87
    invoke-virtual {v0, v1}, Lrx/c;->skip(I)Lrx/c;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    new-instance v1, Ll/aru;

    .line 92
    .line 93
    invoke-direct {v1, p0}, Ll/aru;-><init>(Ll/gru;)V

    .line 94
    .line 95
    .line 96
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

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

.method public U(Ljava/lang/String;I)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "onLocalLeaveChannel:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string p1, ",reason:"

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    const-string p2, "videoChat"

    .line 24
    .line 25
    invoke-static {p2, p1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p1}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    if-nez p1, :cond_0

    .line 37
    .line 38
    return-void

    .line 39
    :cond_0
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    sget-object p1, Ll/yuk0;->e:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {p0, p1}, Ll/xnu;->S(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public a1(J)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "onVideoChannelAdded:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const-string p2, "videoChat"

    .line 16
    .line 17
    invoke-static {p2, p1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Ll/ahu;->N2()Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-eqz p1, :cond_0

    .line 25
    .line 26
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 27
    .line 28
    check-cast p1, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    invoke-virtual {p2}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    const/4 v0, 0x0

    .line 39
    invoke-virtual {p1, v0, p2}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->u(ZLcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)V

    .line 40
    .line 41
    .line 42
    :cond_0
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 43
    .line 44
    check-cast p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;

    .line 45
    .line 46
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->q()V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public b(JI)V
    .locals 1

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v0, "onVideoChannelRemove:"

    .line 4
    .line 5
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string p1, ",reason:"

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const-string p1, "videoChat"

    .line 24
    .line 25
    invoke-static {p1, p0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public b3(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;)V
    .locals 14

    .line 1
    move-object/from16 v0, p3

    .line 2
    .line 3
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 4
    .line 5
    check-cast v1, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->s(Z)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/ahu;->M2()Ll/knu;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iget-boolean v10, v1, Ll/knu;->f:Z

    .line 16
    .line 17
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 18
    .line 19
    check-cast v1, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->l(Z)V

    .line 22
    .line 23
    .line 24
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 25
    .line 26
    if-eqz v10, :cond_0

    .line 27
    .line 28
    move-object v3, v1

    .line 29
    check-cast v3, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;

    .line 30
    .line 31
    iget-object v3, v3, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->f:Lv/VFrame;

    .line 32
    .line 33
    check-cast v1, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;

    .line 34
    .line 35
    iget-object v1, v1, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->a:Lv/VFrame;

    .line 36
    .line 37
    :goto_0
    move-object v9, v1

    .line 38
    move-object v8, v3

    .line 39
    goto :goto_1

    .line 40
    :cond_0
    move-object v3, v1

    .line 41
    check-cast v3, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;

    .line 42
    .line 43
    iget-object v3, v3, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->a:Lv/VFrame;

    .line 44
    .line 45
    check-cast v1, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;

    .line 46
    .line 47
    iget-object v1, v1, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->f:Lv/VFrame;

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :goto_1
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 51
    .line 52
    check-cast v1, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;

    .line 53
    .line 54
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    invoke-virtual {v3}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    invoke-virtual {v1, v2, v3}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->u(ZLcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)V

    .line 63
    .line 64
    .line 65
    iget-object v1, p0, Ll/gru;->f:Ll/gcl0;

    .line 66
    .line 67
    invoke-virtual {v1}, Ll/gcl0;->c()Ll/i0m;

    .line 68
    .line 69
    .line 70
    move-result-object v13

    .line 71
    new-instance v1, Ll/fcl0;

    .line 72
    .line 73
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;->appId:Ljava/lang/String;

    .line 74
    .line 75
    iget-object v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;->channelKey:Ljava/lang/String;

    .line 76
    .line 77
    iget-object v4, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;->channel:Ljava/lang/String;

    .line 78
    .line 79
    iget-object v5, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;->rtcProvider:Ljava/lang/String;

    .line 80
    .line 81
    iget-object v6, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;->userSig:Ljava/lang/String;

    .line 82
    .line 83
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-virtual {v0}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    iget-object v7, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->media:Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;

    .line 92
    .line 93
    move-object v12, p0

    .line 94
    move-object/from16 v11, p2

    .line 95
    .line 96
    move-object v0, v1

    .line 97
    move-object v1, p1

    .line 98
    invoke-direct/range {v0 .. v12}, Ll/fcl0;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;Landroid/widget/FrameLayout;Landroid/widget/FrameLayout;ZLjava/lang/String;Ll/aam;)V

    .line 99
    .line 100
    .line 101
    invoke-interface {v13, v0}, Ll/i0m;->c(Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/MotionParams;)I

    .line 102
    .line 103
    .line 104
    return-void
.end method

.method public final c3()V
    .locals 6

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
    const/4 v1, 0x1

    .line 10
    const/4 v2, 0x0

    .line 11
    if-eqz v0, :cond_4

    .line 12
    .line 13
    invoke-static {v0}, Ll/yuk0;->g(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)Z

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    if-eqz v3, :cond_0

    .line 18
    .line 19
    goto/16 :goto_1

    .line 20
    .line 21
    :cond_0
    invoke-static {v0}, Ll/yuk0;->b(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)Z

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    if-eqz v3, :cond_2

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/ahu;->N2()Z

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    if-eqz v3, :cond_1

    .line 32
    .line 33
    const-string v3, "anchor"

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    const-string v3, "attendee"

    .line 37
    .line 38
    :goto_0
    iget-object v4, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->roomId:Ljava/lang/String;

    .line 39
    .line 40
    iget-object v5, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->media:Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;

    .line 41
    .line 42
    iget-object v5, v5, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;->rtcProvider:Ljava/lang/String;

    .line 43
    .line 44
    invoke-static {v4, v5, v3}, Ll/jwu;->Q(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    invoke-virtual {p0, v3, v2}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    new-instance v4, Ll/bru;

    .line 53
    .line 54
    invoke-direct {v4, p0}, Ll/bru;-><init>(Ll/gru;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v3, v4}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    new-instance v4, Ll/cru;

    .line 62
    .line 63
    invoke-direct {v4, p0, v0}, Ll/cru;-><init>(Ll/gru;Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)V

    .line 64
    .line 65
    .line 66
    new-instance v0, Ll/dru;

    .line 67
    .line 68
    invoke-direct {v0, p0}, Ll/dru;-><init>(Ll/gru;)V

    .line 69
    .line 70
    .line 71
    invoke-static {v4, v0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {v3, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 76
    .line 77
    .line 78
    invoke-virtual {p0}, Ll/ahu;->act()Lcom/p1/mobile/android/app/Act;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    const-string v3, "audio"

    .line 83
    .line 84
    invoke-virtual {v0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    check-cast v0, Landroid/media/AudioManager;

    .line 89
    .line 90
    const/4 v3, 0x3

    .line 91
    invoke-virtual {v0, v3}, Landroid/media/AudioManager;->getStreamVolume(I)I

    .line 92
    .line 93
    .line 94
    move-result v4

    .line 95
    invoke-virtual {v0, v3}, Landroid/media/AudioManager;->getStreamMaxVolume(I)I

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    int-to-float v3, v4

    .line 100
    int-to-float v0, v0

    .line 101
    const v4, 0x3e4ccccd    # 0.2f

    .line 102
    .line 103
    .line 104
    mul-float/2addr v0, v4

    .line 105
    cmpg-float v0, v3, v0

    .line 106
    .line 107
    if-gez v0, :cond_2

    .line 108
    .line 109
    const-string v0, "\u5f53\u524d\u97f3\u91cf\u8f83\u4f4e\uff0c\u8bf7\u8fdb\u884c\u8c03\u8282"

    .line 110
    .line 111
    invoke-static {v0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    :cond_2
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    invoke-virtual {v0}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    invoke-static {v0}, Ll/yuk0;->a(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)Z

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    if-eqz v0, :cond_3

    .line 127
    .line 128
    invoke-virtual {p0}, Ll/ahu;->N2()Z

    .line 129
    .line 130
    .line 131
    move-result v0

    .line 132
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 133
    .line 134
    .line 135
    move-result-object v2

    .line 136
    invoke-virtual {v2}, Ll/xnu;->o()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v2

    .line 140
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 141
    .line 142
    .line 143
    move-result-object v3

    .line 144
    invoke-virtual {v3}, Ll/xnu;->p()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object v3

    .line 148
    invoke-static {v0, v2, v3}, Ll/btu;->p(ZLjava/lang/String;Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 152
    .line 153
    check-cast v0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;

    .line 154
    .line 155
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->s(Z)V

    .line 156
    .line 157
    .line 158
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 159
    .line 160
    check-cast p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;

    .line 161
    .line 162
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->p()V

    .line 163
    .line 164
    .line 165
    return-void

    .line 166
    :cond_3
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 167
    .line 168
    check-cast p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;

    .line 169
    .line 170
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->s(Z)V

    .line 171
    .line 172
    .line 173
    return-void

    .line 174
    :cond_4
    :goto_1
    iget-object v0, p0, Ll/gru;->f:Ll/gcl0;

    .line 175
    .line 176
    invoke-virtual {v0}, Ll/gcl0;->c()Ll/i0m;

    .line 177
    .line 178
    .line 179
    move-result-object v0

    .line 180
    invoke-interface {v0}, Ll/i0m;->b()V

    .line 181
    .line 182
    .line 183
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 184
    .line 185
    check-cast v0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;

    .line 186
    .line 187
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->s(Z)V

    .line 188
    .line 189
    .line 190
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 191
    .line 192
    check-cast p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;

    .line 193
    .line 194
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->l(Z)V

    .line 195
    .line 196
    .line 197
    return-void
.end method

.method public e(JZ)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "onMemberVideoMuted:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, ",muted:"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "videoChat"

    .line 24
    .line 25
    invoke-static {v1, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Ll/ahu;->N2()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_0

    .line 33
    .line 34
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-static {}, Ll/mbs;->o0()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    if-nez p1, :cond_0

    .line 47
    .line 48
    if-eqz p3, :cond_0

    .line 49
    .line 50
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 51
    .line 52
    check-cast p1, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;

    .line 53
    .line 54
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {p0}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    const/4 p2, 0x1

    .line 63
    invoke-virtual {p1, p2, p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->u(ZLcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)V

    .line 64
    .line 65
    .line 66
    :cond_0
    return-void
.end method

.method public final synthetic f3(Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Ll/yuk0;->e(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    xor-int/lit8 p0, p0, 0x1

    .line 14
    .line 15
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public final synthetic g3(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;)V
    .locals 1

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->roomId:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->userId:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, v0, p1, p2}, Ll/gru;->b3(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic h3(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object p1, Ll/yuk0;->c:Ljava/lang/String;

    .line 6
    .line 7
    const-string v0, "rtcToken error"

    .line 8
    .line 9
    invoke-virtual {p0, p1, v0}, Ll/xnu;->T(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public i3()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ahu;->K2()Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;->LiveVideoChatEvent:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$e;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$e;->b()Ll/v3f$c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final j3(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ahu;->N2()Z

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
    iget-object p0, p0, Ll/gru;->f:Ll/gcl0;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/gcl0;->d()Ll/yzl;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    invoke-interface {p0, p1}, Ll/yzl;->n(Z)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final k3(Ljava/lang/Boolean;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/ahu;->N2()Z

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
    new-instance v0, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    const-string v1, "set video mute:"

    .line 11
    .line 12
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "videoChat"

    .line 23
    .line 24
    invoke-static {v1, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/gru;->f:Ll/gcl0;

    .line 28
    .line 29
    invoke-virtual {v0}, Ll/gcl0;->c()Ll/i0m;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-interface {v0}, Ll/i0m;->a()Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    instance-of v1, v0, Ll/pbl0;

    .line 38
    .line 39
    if-eqz v1, :cond_1

    .line 40
    .line 41
    check-cast v0, Ll/pbl0;

    .line 42
    .line 43
    invoke-virtual {v0, p1}, Ll/pbl0;->o1(Ljava/lang/Boolean;)V

    .line 44
    .line 45
    .line 46
    :cond_1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 47
    .line 48
    check-cast v0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;

    .line 49
    .line 50
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    invoke-virtual {v2}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->u(ZLcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    if-eqz p1, :cond_2

    .line 70
    .line 71
    sget-object p1, Ll/yuk0;->k:Ljava/lang/String;

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_2
    sget-object p1, Ll/yuk0;->l:Ljava/lang/String;

    .line 75
    .line 76
    :goto_0
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-virtual {p0}, Ll/xnu;->p()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    const-string v0, ""

    .line 85
    .line 86
    invoke-static {p0, p1, v0}, Ll/jwu;->Z(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-static {}, Ll/dhw;->c()Ll/t9t;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 95
    .line 96
    .line 97
    return-void
.end method

.method public n()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/l6t;->n()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/gru;->f:Ll/gcl0;

    .line 6
    .line 7
    return-void
.end method

.method public onTokenPrivilegeWillExpire(Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "onTokenPrivilegeWillExpire:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "videoChat"

    .line 16
    .line 17
    invoke-static {v1, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    if-nez v0, :cond_0

    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    invoke-virtual {p0}, Ll/ahu;->N2()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    const-string v0, "anchor"

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    const-string v0, "attendee"

    .line 41
    .line 42
    :goto_0
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {v1}, Ll/xnu;->v()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-static {v1, p1, v0}, Ll/jwu;->Q(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    const/4 v0, 0x0

    .line 55
    invoke-virtual {p0, p1, v0}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    new-instance v0, Ll/eru;

    .line 60
    .line 61
    invoke-direct {v0, p0}, Ll/eru;-><init>(Ll/gru;)V

    .line 62
    .line 63
    .line 64
    new-instance p0, Ll/fru;

    .line 65
    .line 66
    invoke-direct {p0}, Ll/fru;-><init>()V

    .line 67
    .line 68
    .line 69
    invoke-static {v0, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 74
    .line 75
    .line 76
    return-void
.end method
