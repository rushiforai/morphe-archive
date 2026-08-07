.class public Ll/mgu;
.super Ll/dhu;
.source "SourceFile"


# instance fields
.field public final h:Ll/qgu;

.field public i:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Ll/knu;Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/dhu;-><init>(Ll/knu;Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;)V

    .line 2
    .line 3
    .line 4
    new-instance p2, Ll/lgu;

    .line 5
    .line 6
    invoke-direct {p2, p0}, Ll/lgu;-><init>(Ll/mgu;)V

    .line 7
    .line 8
    .line 9
    iput-object p2, p0, Ll/mgu;->i:Ljava/lang/Runnable;

    .line 10
    .line 11
    new-instance p2, Ll/qgu;

    .line 12
    .line 13
    invoke-direct {p2, p1, p3}, Ll/qgu;-><init>(Ll/knu;Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p2}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    check-cast p1, Ll/qgu;

    .line 21
    .line 22
    iput-object p1, p0, Ll/mgu;->h:Ll/qgu;

    .line 23
    .line 24
    return-void
.end method

.method public static synthetic X2(Ll/mgu;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/mgu;->a3()V

    return-void
.end method

.method public static synthetic Y2(Ll/mgu;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/mgu;->Z2(Ljava/lang/String;)V

    return-void
.end method

.method private Z2(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mgu;->h:Ll/qgu;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Ll/qgu;->e3(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Ll/mgu;->h:Ll/qgu;

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ll/qgu;->b3(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p1}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-static {p1}, Ll/yuk0;->f(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_1

    .line 36
    .line 37
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 38
    .line 39
    check-cast p1, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v0}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->v(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-virtual {p1}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->userId:Ljava/lang/String;

    .line 61
    .line 62
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {v0}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->anchorId:Ljava/lang/String;

    .line 71
    .line 72
    invoke-virtual {p0, p1, v0}, Ll/mgu;->d3(Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    iget-object p1, p0, Ll/dhu;->g:Ll/icl0;

    .line 76
    .line 77
    invoke-virtual {p1}, Ll/icl0;->d()V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p0}, Ll/mgu;->b3()V

    .line 81
    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_1
    iget-object p1, p0, Ll/dhu;->g:Ll/icl0;

    .line 85
    .line 86
    invoke-virtual {p1}, Ll/icl0;->f()V

    .line 87
    .line 88
    .line 89
    invoke-virtual {p0}, Ll/mgu;->c3()V

    .line 90
    .line 91
    .line 92
    :goto_0
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    invoke-virtual {p1}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    invoke-static {p1}, Ll/yuk0;->b(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)Z

    .line 101
    .line 102
    .line 103
    move-result p1

    .line 104
    if-eqz p1, :cond_2

    .line 105
    .line 106
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 107
    .line 108
    check-cast p1, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;

    .line 109
    .line 110
    const/4 v0, 0x0

    .line 111
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->u(Z)V

    .line 112
    .line 113
    .line 114
    :cond_2
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    invoke-virtual {p1}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    invoke-static {p1}, Ll/yuk0;->a(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)Z

    .line 123
    .line 124
    .line 125
    move-result p1

    .line 126
    if-nez p1, :cond_4

    .line 127
    .line 128
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 129
    .line 130
    .line 131
    move-result-object p1

    .line 132
    invoke-virtual {p1}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 133
    .line 134
    .line 135
    move-result-object p1

    .line 136
    invoke-static {p1}, Ll/yuk0;->g(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)Z

    .line 137
    .line 138
    .line 139
    move-result p1

    .line 140
    if-eqz p1, :cond_3

    .line 141
    .line 142
    goto :goto_1

    .line 143
    :cond_3
    return-void

    .line 144
    :cond_4
    :goto_1
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 145
    .line 146
    check-cast p1, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;

    .line 147
    .line 148
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 149
    .line 150
    .line 151
    move-result-object p0

    .line 152
    invoke-virtual {p0}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 153
    .line 154
    .line 155
    move-result-object p0

    .line 156
    invoke-static {p0}, Ll/yuk0;->g(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)Z

    .line 157
    .line 158
    .line 159
    move-result p0

    .line 160
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->j(Z)V

    .line 161
    .line 162
    .line 163
    return-void
.end method

.method private synthetic a3()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->isAppVisible()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget-object v0, Ll/yuk0;->m:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Ll/xnu;->S(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method


# virtual methods
.method public T()V
    .locals 2

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
    new-instance v1, Ll/kgu;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Ll/kgu;-><init>(Ll/mgu;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/y20;)Ll/kcg0;

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public T2()V
    .locals 1

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
    invoke-virtual {v0}, Ll/xnu;->p()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    invoke-static {}, Ll/btu;->b()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    sget-object v0, Ll/yuk0;->a:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {p0, v0}, Ll/xnu;->S(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public V2()V
    .locals 1

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
    invoke-static {v0}, Ll/yuk0;->f(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    sget-object v0, Ll/yuk0;->i:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {}, Ll/btu;->c()V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    sget-object v0, Ll/yuk0;->e:Ljava/lang/String;

    .line 27
    .line 28
    :goto_0
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p0, v0}, Ll/xnu;->S(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final b3()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/mgu;->c3()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Ll/xnu;->j:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 9
    .line 10
    new-instance v1, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    const-string v2, "prepareAutoAnswer:"

    .line 13
    .line 14
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;->toJson()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    const-string v2, "videoChat"

    .line 29
    .line 30
    invoke-static {v2, v1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    iget-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;->on:Z

    .line 34
    .line 35
    if-eqz v1, :cond_0

    .line 36
    .line 37
    iget v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;->autoAnswerSeconds:I

    .line 38
    .line 39
    if-lez v1, :cond_0

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/ahu;->act()Lcom/p1/mobile/android/app/Act;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    iget-object p0, p0, Ll/mgu;->i:Ljava/lang/Runnable;

    .line 46
    .line 47
    iget v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;->autoAnswerSeconds:I

    .line 48
    .line 49
    mul-int/lit16 v0, v0, 0x3e8

    .line 50
    .line 51
    int-to-long v2, v0

    .line 52
    invoke-static {v1, p0, v2, v3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 53
    .line 54
    .line 55
    :cond_0
    return-void
.end method

.method public final c3()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mgu;->i:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-static {p0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public d3(Ljava/lang/String;Ljava/lang/String;)V
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
    sget-object v1, Ll/btu;->g:Ljava/lang/String;

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
    filled-new-array {p1, p2}, [Ll/pf60;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {v0, p1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Ll/dhu;->f:Ll/l4g0;

    .line 37
    .line 38
    invoke-virtual {p1}, Ll/l4g0;->i()V

    .line 39
    .line 40
    .line 41
    iget-object p0, p0, Ll/dhu;->f:Ll/l4g0;

    .line 42
    .line 43
    invoke-virtual {p0}, Ll/l4g0;->l()V

    .line 44
    .line 45
    .line 46
    return-void
.end method
