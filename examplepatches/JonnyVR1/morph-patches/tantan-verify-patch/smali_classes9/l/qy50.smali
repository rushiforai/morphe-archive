.class public final Ll/qy50;
.super Ll/o2e0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/o2e0<",
        "Ll/zit;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000$\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0003\u0010\u0004J)\u0010\u000b\u001a\u00020\n2\u0006\u0010\u0005\u001a\u00020\u00022\u0006\u0010\u0007\u001a\u00020\u00062\u0008\u0010\t\u001a\u0004\u0018\u00010\u0008H\u0016\u00a2\u0006\u0004\u0008\u000b\u0010\u000c\u00a8\u0006\r"
    }
    d2 = {
        "Ll/qy50;",
        "Ll/o2e0;",
        "Ll/zit;",
        "<init>",
        "()V",
        "liveRoomScheme",
        "Ll/gae0;",
        "plug",
        "Ll/bae0$b;",
        "extraInfo",
        "",
        "d",
        "(Ll/zit;Ll/gae0;Ll/bae0$b;)V",
        "livingroom_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/o2e0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Ll/gae0;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/qy50;->f(Ll/gae0;)V

    return-void
.end method

.method public static synthetic c(Ll/gae0;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/qy50;->e(Ll/gae0;Lcom/p1/mobile/android/app/Act;)V

    return-void
.end method

.method public static final e(Ll/gae0;Lcom/p1/mobile/android/app/Act;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceGameChangeEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceGameChangeEvent;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceGameChangeEvent;->stopVoiceGame()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {}, Ll/ain0;->f()Ll/ain0;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v1}, Ll/ain0;->g()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    new-instance v0, Ll/py50;

    .line 27
    .line 28
    invoke-direct {v0, p0}, Ll/py50;-><init>(Ll/gae0;)V

    .line 29
    .line 30
    .line 31
    const-wide/16 v1, 0x3e8

    .line 32
    .line 33
    invoke-virtual {p1, v0, v1, v2}, Lcom/p1/mobile/android/app/Act;->postDelayed(Ljava/lang/Runnable;J)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public static final f(Ll/gae0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceGrabHatEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceGrabHatEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceGrabHatEvent;->openStartGameDialog()Ll/v3f$c;

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


# virtual methods
.method public bridge synthetic a(Ll/hyr;Ll/gae0;Ll/bae0$b;)V
    .locals 0

    .line 1
    check-cast p1, Ll/zit;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ll/qy50;->d(Ll/zit;Ll/gae0;Ll/bae0$b;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public d(Ll/zit;Ll/gae0;Ll/bae0$b;)V
    .locals 2
    .param p1    # Ll/zit;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ll/gae0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ll/bae0$b;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    new-instance p0, Ll/x8k;

    .line 8
    .line 9
    const/16 p3, 0xc8

    .line 10
    .line 11
    invoke-direct {p0, p3}, Ll/x8k;-><init>(I)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p2, p0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;

    .line 19
    .line 20
    const-string p3, "source"

    .line 21
    .line 22
    invoke-virtual {p1, p3}, Ll/zit;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    const-string p3, "chatAreaCampaign"

    .line 27
    .line 28
    invoke-static {p3, p1}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    if-eqz p1, :cond_0

    .line 33
    .line 34
    invoke-virtual {p2}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceGrabHatEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceGrabHatEvent;

    .line 39
    .line 40
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceGrabHatEvent;->openHatCpDialog()Ll/v3f$d;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 45
    .line 46
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_0
    invoke-static {p0}, Ll/fln0;->c(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;)Z

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    if-eqz p0, :cond_1

    .line 55
    .line 56
    invoke-virtual {p2}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceGrabHatEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceGrabHatEvent;

    .line 61
    .line 62
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceGrabHatEvent;->openHatCpDialog()Ll/v3f$d;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 67
    .line 68
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 69
    .line 70
    .line 71
    return-void

    .line 72
    :cond_1
    invoke-static {}, Ll/ain0;->f()Ll/ain0;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-virtual {p0}, Ll/ain0;->g()I

    .line 77
    .line 78
    .line 79
    move-result p0

    .line 80
    if-eqz p0, :cond_3

    .line 81
    .line 82
    invoke-virtual {p2}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    if-eqz p0, :cond_2

    .line 87
    .line 88
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    sget-object p3, Lkotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lkotlin/jvm/internal/StringCompanionObject;

    .line 93
    .line 94
    sget p3, Lcom/p1/mobile/putong/live/livingroom/R$string;->Zf:I

    .line 95
    .line 96
    invoke-virtual {p0, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object p3

    .line 100
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 101
    .line 102
    .line 103
    invoke-static {}, Ll/ain0;->f()Ll/ain0;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    invoke-virtual {v0, p0}, Ll/ain0;->e(Lcom/p1/mobile/android/app/Act;)Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    const/4 v1, 0x1

    .line 116
    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    invoke-static {p3, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object p3

    .line 124
    invoke-virtual {p1, p3}, Lcom/p1/mobile/android/app/Dialog$e;->F(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    sget p3, Lcom/p1/mobile/putong/live/livingroom/R$string;->N1:I

    .line 129
    .line 130
    invoke-virtual {p1, p3}, Lcom/p1/mobile/android/app/Dialog$e;->k0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    sget p3, Lcom/p1/mobile/putong/live/livingroom/R$string;->ke:I

    .line 135
    .line 136
    new-instance v0, Ll/oy50;

    .line 137
    .line 138
    invoke-direct {v0, p2, p0}, Ll/oy50;-><init>(Ll/gae0;Lcom/p1/mobile/android/app/Act;)V

    .line 139
    .line 140
    .line 141
    invoke-virtual {p1, p3, v0}, Lcom/p1/mobile/android/app/Dialog$e;->t0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 142
    .line 143
    .line 144
    move-result-object p0

    .line 145
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z()Lcom/p1/mobile/android/app/Dialog;

    .line 146
    .line 147
    .line 148
    move-result-object p0

    .line 149
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 150
    .line 151
    .line 152
    :cond_2
    return-void

    .line 153
    :cond_3
    invoke-virtual {p2}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 154
    .line 155
    .line 156
    move-result-object p0

    .line 157
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceGrabHatEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceGrabHatEvent;

    .line 158
    .line 159
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceGrabHatEvent;->openStartGameDialog()Ll/v3f$c;

    .line 160
    .line 161
    .line 162
    move-result-object p0

    .line 163
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 164
    .line 165
    .line 166
    return-void
.end method
