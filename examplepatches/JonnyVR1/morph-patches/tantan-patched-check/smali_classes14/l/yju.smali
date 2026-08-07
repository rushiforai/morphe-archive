.class public Ll/yju;
.super Ll/dhu;
.source "SourceFile"


# direct methods
.method public constructor <init>(Ll/knu;Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/dhu;-><init>(Ll/knu;Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic X2(Ll/yju;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/yju;->c3()V

    return-void
.end method

.method public static synthetic Y2(Ll/yju;Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAttendeeCallInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yju;->d3(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAttendeeCallInfo;)V

    return-void
.end method

.method public static synthetic Z2(Ll/yju;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/yju;->b3()V

    return-void
.end method


# virtual methods
.method public T()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/dhu;->T()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ll/xnu;->z()Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-virtual {p0, v0, v1}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v2, Ll/uju;

    .line 22
    .line 23
    invoke-direct {v2, p0}, Ll/uju;-><init>(Ll/yju;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/y20;)Ll/kcg0;

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0}, Ll/xnu;->w()Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;->live:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;

    .line 38
    .line 39
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;->id:Ljava/lang/String;

    .line 40
    .line 41
    invoke-static {v0}, Ll/jwu;->H(Ljava/lang/String;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {p0, v0, v1}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    new-instance v1, Ll/vju;

    .line 50
    .line 51
    invoke-direct {v1, p0}, Ll/vju;-><init>(Ll/yju;)V

    .line 52
    .line 53
    .line 54
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {v0}, Ll/xnu;->w()Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;->live:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;

    .line 70
    .line 71
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;->roomId:Ljava/lang/String;

    .line 76
    .line 77
    invoke-virtual {v1, v2}, Ll/xnu;->X(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;->anchorId:Ljava/lang/String;

    .line 81
    .line 82
    invoke-static {}, Ll/mbs;->o0()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    invoke-virtual {p0, v0, v1}, Ll/yju;->e3(Ljava/lang/String;Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    iget-object p0, p0, Ll/dhu;->g:Ll/icl0;

    .line 90
    .line 91
    invoke-virtual {p0}, Ll/icl0;->d()V

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method public T2()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/dhu;->g:Ll/icl0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/icl0;->f()V

    .line 4
    .line 5
    .line 6
    const-string v0, "fakeAccept"

    .line 7
    .line 8
    const-string v1, "fakeCall"

    .line 9
    .line 10
    invoke-static {v1, v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartAct;->u2(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    new-instance v0, Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 16
    .line 17
    .line 18
    new-instance v2, Ll/rr60;

    .line 19
    .line 20
    invoke-direct {v2}, Ll/rr60;-><init>()V

    .line 21
    .line 22
    .line 23
    new-instance v3, Ll/wju;

    .line 24
    .line 25
    invoke-direct {v3, p0}, Ll/wju;-><init>(Ll/yju;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v2, v3}, Ll/lbl0;->h(Ll/x20;)Ll/lbl0;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    invoke-virtual {v2, v1}, Ll/lbl0;->j(Ljava/lang/String;)Ll/lbl0;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    new-instance v1, Ll/hbl0;

    .line 40
    .line 41
    new-instance v2, Ll/xju;

    .line 42
    .line 43
    invoke-direct {v2, p0}, Ll/xju;-><init>(Ll/yju;)V

    .line 44
    .line 45
    .line 46
    invoke-direct {v1, v2}, Ll/hbl0;-><init>(Ll/x20;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0}, Ll/ahu;->act()Lcom/p1/mobile/android/app/Act;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartAct;->q2(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;)V

    .line 57
    .line 58
    .line 59
    invoke-static {}, Ll/btu;->e()V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public V2()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/dhu;->g:Ll/icl0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/icl0;->f()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Ll/xnu;->w()Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;->recallId:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-nez v0, :cond_0

    .line 31
    .line 32
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0}, Ll/xnu;->w()Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;->recallId:Ljava/lang/String;

    .line 41
    .line 42
    const-string v1, "reject"

    .line 43
    .line 44
    invoke-static {v0, v1}, Ll/jwu;->O(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 45
    .line 46
    .line 47
    :cond_0
    invoke-static {}, Ll/btu;->f()V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0}, Ll/dhu;->W2()V

    .line 51
    .line 52
    .line 53
    const/4 v0, 0x1

    .line 54
    invoke-virtual {p0, v0}, Ll/ahu;->L2(Z)V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_1
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {v0}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-static {v0}, Ll/yuk0;->f(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    if-eqz v0, :cond_2

    .line 71
    .line 72
    sget-object v0, Ll/yuk0;->h:Ljava/lang/String;

    .line 73
    .line 74
    invoke-static {}, Ll/btu;->f()V

    .line 75
    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_2
    sget-object v0, Ll/yuk0;->e:Ljava/lang/String;

    .line 79
    .line 80
    :goto_0
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    invoke-virtual {p0, v0}, Ll/xnu;->S(Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    return-void
.end method

.method public a3(Ljava/lang/String;)V
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
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 16
    .line 17
    check-cast p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;

    .line 18
    .line 19
    const/4 p1, 0x0

    .line 20
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->j(Z)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public final synthetic b3()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Ll/ahu;->L2(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic c3()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Ll/xnu;->n(Ll/ahu;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;

    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->u(Z)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic d3(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAttendeeCallInfo;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->w(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAttendeeCallInfo;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public e3(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/dhu;->f:Ll/l4g0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance v0, Ll/l4g0;

    .line 7
    .line 8
    sget-object v1, Ll/btu;->j:Ljava/lang/String;

    .line 9
    .line 10
    const-string v2, "LiveVChatDialingModule"

    .line 11
    .line 12
    invoke-direct {v0, v1, v2}, Ll/l4g0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Ll/dhu;->f:Ll/l4g0;

    .line 16
    .line 17
    const-string v1, "sender_id"

    .line 18
    .line 19
    invoke-static {v1, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    const-string v1, "receiver_id"

    .line 24
    .line 25
    invoke-static {v1, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v1}, Ll/xnu;->w()Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    iget-object v1, v1, Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;->source:Ljava/lang/String;

    .line 38
    .line 39
    const-string v2, "source"

    .line 40
    .line 41
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    filled-new-array {p1, p2, v1}, [Ll/pf60;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-virtual {v0, p1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 50
    .line 51
    .line 52
    iget-object p1, p0, Ll/dhu;->f:Ll/l4g0;

    .line 53
    .line 54
    invoke-virtual {p1}, Ll/l4g0;->i()V

    .line 55
    .line 56
    .line 57
    iget-object p0, p0, Ll/dhu;->f:Ll/l4g0;

    .line 58
    .line 59
    invoke-virtual {p0}, Ll/l4g0;->l()V

    .line 60
    .line 61
    .line 62
    return-void
.end method
