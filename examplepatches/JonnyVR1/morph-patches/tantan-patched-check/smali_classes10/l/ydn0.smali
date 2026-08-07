.class public Ll/ydn0;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Ljava/util/List;Ll/lx50;)Ll/lx50;
    .locals 0

    .line 1
    invoke-virtual {p1, p0}, Ll/lx50;->g(Ljava/util/List;)Ll/lx50;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic b(Ll/coj;Ll/l6o0;)V
    .locals 1

    .line 1
    iget-object v0, p1, Ll/l6o0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 2
    .line 3
    iput-object v0, p0, Ll/coj;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 4
    .line 5
    iget-boolean p1, p1, Ll/l6o0;->c:Z

    .line 6
    .line 7
    iput-boolean p1, p0, Ll/coj;->a:Z

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic c(Ll/coj;Ll/l6o0;)V
    .locals 1

    .line 1
    iget-object v0, p1, Ll/l6o0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 2
    .line 3
    iput-object v0, p0, Ll/coj;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 4
    .line 5
    iget-boolean p1, p1, Ll/l6o0;->c:Z

    .line 6
    .line 7
    iput-boolean p1, p0, Ll/coj;->a:Z

    .line 8
    .line 9
    return-void
.end method

.method public static d(Ll/i6t;Ll/nsv;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/i6t<",
            "**>;",
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, v0, v0}, Ll/ydn0;->e(Ll/i6t;Ll/nsv;Ll/qcj;Ll/qcj;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static e(Ll/i6t;Ll/nsv;Ll/qcj;Ll/qcj;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/i6t<",
            "**>;",
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;",
            "Ll/qcj<",
            "Ll/cqj$a;",
            "Ll/cqj$a;",
            ">;",
            "Ll/qcj<",
            "Ll/lx50;",
            "Ll/lx50;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p1, Ll/nsv;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    check-cast v1, Lcom/p1/mobile/putong/data/Media;

    .line 13
    .line 14
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-virtual {v2}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->isVoiceLive()Z

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    if-eqz v2, :cond_0

    .line 29
    .line 30
    const/4 v2, 0x3

    .line 31
    invoke-static {v2}, Ll/wft;->b(I)Z

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    if-eqz v2, :cond_0

    .line 36
    .line 37
    invoke-static {p1}, Ll/l6o0;->c(Ll/nsv;)Ll/l6o0;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    iget-object v1, v1, Ll/l6o0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 42
    .line 43
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatar:Ljava/lang/String;

    .line 44
    .line 45
    :cond_0
    new-instance v2, Ll/h64;

    .line 46
    .line 47
    iget-object v3, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 48
    .line 49
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 50
    .line 51
    invoke-direct {v2, v3, v0, v1}, Ll/h64;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    invoke-static {}, Ll/p54;->a()Ll/p54;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-static {v2, v0}, Ll/coj;->b(Ll/h64;Ll/p54;)Ll/coj;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    const-string v1, "voiceLiveAudience"

    .line 63
    .line 64
    iput-object v1, v0, Ll/coj;->g:Ljava/lang/String;

    .line 65
    .line 66
    invoke-static {p1}, Ll/l6o0;->c(Ll/nsv;)Ll/l6o0;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    new-instance v2, Ll/vdn0;

    .line 71
    .line 72
    invoke-direct {v2, v0}, Ll/vdn0;-><init>(Ll/coj;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p1, v2}, Ll/l6o0;->a(Ll/y20;)V

    .line 76
    .line 77
    .line 78
    new-instance p1, Ll/cqj$a;

    .line 79
    .line 80
    invoke-direct {p1}, Ll/cqj$a;-><init>()V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p1, v0}, Ll/cqj$a;->g(Ll/coj;)Ll/cqj$a;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    if-eqz p2, :cond_1

    .line 88
    .line 89
    invoke-interface {p2, p1}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    check-cast p1, Ll/cqj$a;

    .line 94
    .line 95
    :cond_1
    invoke-virtual {p1}, Ll/cqj$a;->d()Ll/cqj;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    new-instance p2, Ll/lx50;

    .line 100
    .line 101
    invoke-direct {p2}, Ll/lx50;-><init>()V

    .line 102
    .line 103
    .line 104
    const/16 v0, 0x2328

    .line 105
    .line 106
    invoke-virtual {p2, v0}, Ll/lx50;->i(I)Ll/lx50;

    .line 107
    .line 108
    .line 109
    move-result-object p2

    .line 110
    invoke-virtual {p2, p1}, Ll/lx50;->h(Ll/cqj;)Ll/lx50;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    invoke-virtual {p1, v1}, Ll/lx50;->j(Ljava/lang/String;)Ll/lx50;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 119
    .line 120
    .line 121
    move-result p2

    .line 122
    if-eqz p2, :cond_2

    .line 123
    .line 124
    invoke-interface {p3, p1}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    check-cast p1, Ll/lx50;

    .line 129
    .line 130
    :cond_2
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->GiftDialogEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;

    .line 135
    .line 136
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->openGiftDialogEvent()Ll/v3f$d;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 141
    .line 142
    .line 143
    return-void
.end method

.method public static f(Ll/i6t;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/i6t<",
            "**>;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;",
            ")V"
        }
    .end annotation

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    invoke-static {p0, p1, v0}, Ll/ydn0;->g(Ll/i6t;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static g(Ll/i6t;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/i6t<",
            "**>;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/bzm0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/bzm0;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ll/bzm0;->b(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Ll/bzm0;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const/4 v1, 0x3

    .line 15
    invoke-static {v1}, Ll/wft;->b(I)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-nez v1, :cond_0

    .line 20
    .line 21
    instance-of v1, v0, Ll/rwn0;

    .line 22
    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    check-cast v0, Ll/rwn0;

    .line 26
    .line 27
    invoke-virtual {v0}, Ll/rwn0;->e3()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-nez v0, :cond_1

    .line 39
    .line 40
    invoke-virtual {p1, p2}, Ll/bzm0;->h(Ljava/lang/String;)Ll/bzm0;

    .line 41
    .line 42
    .line 43
    :cond_1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;

    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;->leaveVoiceEvent()Ll/v3f$d;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public static h(Ll/i6t;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ll/nsv;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/i6t<",
            "**>;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;",
            "Ll/nsv<",
            "Ll/h64;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, p2, v0, v0}, Ll/ydn0;->i(Ll/i6t;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ll/nsv;Ll/qcj;Ll/qcj;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static i(Ll/i6t;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ll/nsv;Ll/qcj;Ll/qcj;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/i6t<",
            "**>;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;",
            "Ll/nsv<",
            "Ll/h64;",
            ">;",
            "Ll/qcj<",
            "Ll/cqj$a;",
            "Ll/cqj$a;",
            ">;",
            "Ll/qcj<",
            "Ll/lx50;",
            "Ll/lx50;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    const-string v0, "voiceLiveMain"

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const-string v0, "voiceLiveVice"

    .line 23
    .line 24
    :goto_0
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 25
    .line 26
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->anchor:Ljava/lang/String;

    .line 27
    .line 28
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-eqz v1, :cond_1

    .line 33
    .line 34
    const-string v1, "gift-audience-none-voiceLiveMain"

    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_1
    const-string v1, "gift-audience-none-voiceLiveVice"

    .line 38
    .line 39
    :goto_1
    iget-object v2, p2, Ll/nsv;->a:Ljava/lang/Object;

    .line 40
    .line 41
    check-cast v2, Ll/h64;

    .line 42
    .line 43
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->id:Ljava/lang/String;

    .line 44
    .line 45
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->position:I

    .line 46
    .line 47
    invoke-static {v3, v1, p1}, Ll/p54;->b(Ljava/lang/String;Ljava/lang/String;I)Ll/p54;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-static {v2, p1}, Ll/coj;->c(Ll/h64;Ll/p54;)Ll/coj;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-static {p2}, Ll/l6o0;->c(Ll/nsv;)Ll/l6o0;

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    new-instance v1, Ll/wdn0;

    .line 60
    .line 61
    invoke-direct {v1, p1}, Ll/wdn0;-><init>(Ll/coj;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p2, v1}, Ll/l6o0;->a(Ll/y20;)V

    .line 65
    .line 66
    .line 67
    iput-object v0, p1, Ll/coj;->g:Ljava/lang/String;

    .line 68
    .line 69
    new-instance p2, Ll/cqj$a;

    .line 70
    .line 71
    invoke-direct {p2}, Ll/cqj$a;-><init>()V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p2, p1}, Ll/cqj$a;->g(Ll/coj;)Ll/cqj$a;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    if-eqz p3, :cond_2

    .line 79
    .line 80
    invoke-interface {p3, p1}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    check-cast p1, Ll/cqj$a;

    .line 85
    .line 86
    :cond_2
    invoke-virtual {p1}, Ll/cqj$a;->d()Ll/cqj;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    new-instance p2, Ll/lx50;

    .line 91
    .line 92
    invoke-direct {p2}, Ll/lx50;-><init>()V

    .line 93
    .line 94
    .line 95
    const/16 p3, 0x2328

    .line 96
    .line 97
    invoke-virtual {p2, p3}, Ll/lx50;->i(I)Ll/lx50;

    .line 98
    .line 99
    .line 100
    move-result-object p2

    .line 101
    invoke-virtual {p2, p1}, Ll/lx50;->h(Ll/cqj;)Ll/lx50;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    invoke-virtual {p1, v0}, Ll/lx50;->j(Ljava/lang/String;)Ll/lx50;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    move-result p2

    .line 113
    if-eqz p2, :cond_3

    .line 114
    .line 115
    invoke-interface {p4, p1}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    check-cast p1, Ll/lx50;

    .line 120
    .line 121
    :cond_3
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->GiftDialogEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;

    .line 126
    .line 127
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->openGiftDialogEvent()Ll/v3f$d;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 132
    .line 133
    .line 134
    return-void
.end method

.method public static j(Ll/i6t;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/i6t<",
            "**>;",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/rwn0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1, p2}, Ll/hrk0;->l(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0, p2}, Ll/hrk0;->m(Ljava/lang/String;)Ll/nsv;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    if-nez v1, :cond_0

    .line 24
    .line 25
    invoke-static {}, Lcom/p1/mobile/putong/data/User;->new_()Lcom/p1/mobile/putong/data/User;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iput-object p2, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 30
    .line 31
    new-instance v1, Ljava/util/ArrayList;

    .line 32
    .line 33
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 34
    .line 35
    .line 36
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 37
    .line 38
    invoke-static {}, Lcom/p1/mobile/putong/data/Picture;->new_()Lcom/p1/mobile/putong/data/Picture;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    iput-object p4, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 43
    .line 44
    iget-object v2, v0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 45
    .line 46
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    iput-object p3, v0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 50
    .line 51
    new-instance v1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 52
    .line 53
    invoke-direct {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;-><init>()V

    .line 54
    .line 55
    .line 56
    iput-object p4, v1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatar:Ljava/lang/String;

    .line 57
    .line 58
    iput-object p2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->userId:Ljava/lang/String;

    .line 59
    .line 60
    iput-object p3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->name:Ljava/lang/String;

    .line 61
    .line 62
    new-instance p2, Ll/l6o0;

    .line 63
    .line 64
    invoke-direct {p2}, Ll/l6o0;-><init>()V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p2, v1}, Ll/l6o0;->f(Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)Ll/l6o0;

    .line 68
    .line 69
    .line 70
    move-result-object p2

    .line 71
    invoke-static {v0}, Ll/nsv;->f(Ljava/lang/Object;)Ll/nsv;

    .line 72
    .line 73
    .line 74
    move-result-object p3

    .line 75
    invoke-virtual {p3, p2}, Ll/nsv;->d(Ll/pyl;)Ll/nsv;

    .line 76
    .line 77
    .line 78
    move-result-object p2

    .line 79
    new-instance p3, Ll/xdn0;

    .line 80
    .line 81
    invoke-direct {p3, p1}, Ll/xdn0;-><init>(Ljava/util/List;)V

    .line 82
    .line 83
    .line 84
    const/4 p1, 0x0

    .line 85
    invoke-static {p0, p2, p1, p3}, Ll/ydn0;->e(Ll/i6t;Ll/nsv;Ll/qcj;Ll/qcj;)V

    .line 86
    .line 87
    .line 88
    return-void

    .line 89
    :cond_0
    invoke-static {p0, v1, v0}, Ll/ydn0;->h(Ll/i6t;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ll/nsv;)V

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method public static k(Ll/i6t;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, p2, v0}, Ll/ydn0;->l(Ll/i6t;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static l(Ll/i6t;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 2

    .line 1
    const/16 v0, 0x2328

    .line 2
    .line 3
    invoke-static {p0, p1, p2, v0}, Ll/csq;->b(Ll/i6t;Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {p0, p1, p2, v0}, Ll/csq;->e(Ll/i6t;Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->builder(I)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->userId(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    invoke-virtual {p2, v1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->setFromIdentity(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->setTo(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    const-string p2, "live"

    .line 28
    .line 29
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->setSource(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    const-string p2, "voiceLive"

    .line 34
    .line 35
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->setScene(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    const-string p2, "liveRoom"

    .line 40
    .line 41
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->trackFrom(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    if-eqz p3, :cond_0

    .line 46
    .line 47
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->showShadow()Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 48
    .line 49
    .line 50
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->OpenUserCardDialogEvent:Lcom/tantan/live/eventbus/LiveEventBus$OpenUserCardDialogEvent;

    .line 55
    .line 56
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$OpenUserCardDialogEvent;->show()Ll/v3f$d;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->build()Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public static m(Ll/i6t;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/i6t<",
            "**>;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;->updateDeputyEvent()Ll/v3f$c;

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

.method public static n(Ll/i6t;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/i6t<",
            "**>;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;->callApplyEvent()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance v0, Ll/bzm0;

    .line 12
    .line 13
    invoke-direct {v0}, Ll/bzm0;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static o(Ll/i6t;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/i6t<",
            "**>;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;->nineMicApplyCallChooseEvent()Ll/v3f$c;

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

.method public static p(Ll/i6t;Ljava/lang/String;ZLjava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/i6t<",
            "**>;",
            "Ljava/lang/String;",
            "Z",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;->callMuteEvent()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance v0, Ll/bzm0;

    .line 12
    .line 13
    invoke-direct {v0}, Ll/bzm0;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p1}, Ll/bzm0;->c(Ljava/lang/String;)Ll/bzm0;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p1, p2}, Ll/bzm0;->i(Z)Ll/bzm0;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p1, p3}, Ll/bzm0;->h(Ljava/lang/String;)Ll/bzm0;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public static q(Ll/i6t;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/i6t<",
            "**>;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;->updateSelfCallEvent()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
