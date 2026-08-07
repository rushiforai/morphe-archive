.class public Ll/i1t;
.super Ll/qct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/qct<",
        "Ll/oo2;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic J3(Ll/i1t;Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/i1t;->L3(Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;)V

    return-void
.end method


# virtual methods
.method public final K3(Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;->getToLiveId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;->getSource()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;->getLiveType()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->getBuilder()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    const-string v3, "voice-live"

    .line 18
    .line 19
    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->Q(Z)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-virtual {v2, v0}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->E(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->O(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const/4 v1, 0x0

    .line 36
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->y(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->H(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->u()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-static {v0, p1}, Ll/z91;->a(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;)Landroid/content/Intent;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public final synthetic L3(Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->c7:I

    .line 8
    .line 9
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;->getToLiveId()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_6

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;->getToRoomId()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v0}, Ll/vp20;->o()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;->getToRoomId()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-eqz v0, :cond_2

    .line 51
    .line 52
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->b3:I

    .line 53
    .line 54
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_2
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {v0}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->isVoiceLive()Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    if-eqz v0, :cond_3

    .line 71
    .line 72
    const-string v0, "voice-live"

    .line 73
    .line 74
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;->getLiveType()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    if-nez v0, :cond_4

    .line 83
    .line 84
    :cond_3
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-virtual {v0}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->isNormalLive()Z

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    if-eqz v0, :cond_5

    .line 97
    .line 98
    const-string v0, "live"

    .line 99
    .line 100
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;->getLiveType()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    if-eqz v0, :cond_5

    .line 109
    .line 110
    :cond_4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->FragProxyEvent:Lcom/tantan/live/eventbus/LiveEventBus$FragProxyEvent;

    .line 115
    .line 116
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$FragProxyEvent;->jumpRoom()Ll/v3f$d;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 121
    .line 122
    .line 123
    return-void

    .line 124
    :cond_5
    invoke-virtual {p0, p1}, Ll/i1t;->K3(Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;)V

    .line 125
    .line 126
    .line 127
    return-void

    .line 128
    :cond_6
    :goto_0
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->T:I

    .line 129
    .line 130
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 131
    .line 132
    .line 133
    return-void
.end method

.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->JumpRoomEvent:Lcom/tantan/live/eventbus/LiveEventBus$JumpRoomEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$JumpRoomEvent;->jumpRoom()Ll/v3f$d;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lrx/c;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/h1t;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/h1t;-><init>(Ll/i1t;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    return-void
.end method
