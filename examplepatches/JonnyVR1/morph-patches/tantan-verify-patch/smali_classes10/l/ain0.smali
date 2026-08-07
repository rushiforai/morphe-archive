.class public Ll/ain0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static volatile c:Ll/ain0;


# instance fields
.field public a:I

.field public b:Landroid/os/Handler;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/ain0;->a:I

    .line 6
    .line 7
    new-instance v0, Landroid/os/Handler;

    .line 8
    .line 9
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/ain0;->b:Landroid/os/Handler;

    .line 17
    .line 18
    return-void
.end method

.method public static synthetic a(Ll/ain0;Lcom/tantan/live/eventbus/LiveEventBus;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ain0;->h(Lcom/tantan/live/eventbus/LiveEventBus;I)V

    return-void
.end method

.method public static bridge synthetic b(Ll/ain0;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ain0;->d(I)V

    return-void
.end method

.method public static f()Ll/ain0;
    .locals 2

    .line 1
    sget-object v0, Ll/ain0;->c:Ll/ain0;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/ain0;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/ain0;->c:Ll/ain0;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/ain0;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/ain0;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/ain0;->c:Ll/ain0;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v1

    .line 26
    :cond_1
    :goto_2
    sget-object v0, Ll/ain0;->c:Ll/ain0;

    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public c()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Ll/ain0;->a:I

    .line 3
    .line 4
    iget-object p0, p0, Ll/ain0;->b:Landroid/os/Handler;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-virtual {p0, v0}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final d(I)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-eq p1, v0, :cond_0

    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    if-eq p1, v0, :cond_0

    .line 6
    .line 7
    iput p1, p0, Ll/ain0;->a:I

    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public e(Lcom/p1/mobile/android/app/Act;)Ljava/lang/String;
    .locals 0

    .line 1
    iget p0, p0, Ll/ain0;->a:I

    .line 2
    .line 3
    packed-switch p0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    const-string p0, ""

    .line 7
    .line 8
    return-object p0

    .line 9
    :pswitch_0
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->D5:I

    .line 10
    .line 11
    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :pswitch_1
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->pj:I

    .line 17
    .line 18
    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0

    .line 23
    :pswitch_2
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Sc:I

    .line 24
    .line 25
    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0

    .line 30
    :pswitch_3
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->wi:I

    .line 31
    .line 32
    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0

    .line 37
    :pswitch_4
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->bh:I

    .line 38
    .line 39
    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0

    .line 44
    :pswitch_5
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->ch:I

    .line 45
    .line 46
    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    return-object p0

    .line 51
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public g()I
    .locals 0

    .line 1
    iget p0, p0, Ll/ain0;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public final synthetic h(Lcom/tantan/live/eventbus/LiveEventBus;I)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceGameChangeEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceGameChangeEvent;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceGameChangeEvent;->stopVoiceGame()Ll/v3f$d;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget v1, p0, Ll/ain0;->a:I

    .line 8
    .line 9
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/ain0;->b:Landroid/os/Handler;

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/ain0;->b:Landroid/os/Handler;

    .line 23
    .line 24
    new-instance v1, Ll/ain0$a;

    .line 25
    .line 26
    invoke-direct {v1, p0, p2, p1}, Ll/ain0$a;-><init>(Ll/ain0;ILcom/tantan/live/eventbus/LiveEventBus;)V

    .line 27
    .line 28
    .line 29
    const-wide/16 p0, 0x3e8

    .line 30
    .line 31
    invoke-virtual {v0, v1, p0, p1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public i(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/ain0;->a:I

    .line 2
    .line 3
    return-void
.end method

.method public j(Lcom/p1/mobile/android/app/Act;Lcom/tantan/live/eventbus/LiveEventBus;I)V
    .locals 3

    .line 1
    iget v0, p0, Ll/ain0;->a:I

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    if-ne v0, p3, :cond_0

    .line 6
    .line 7
    goto :goto_1

    .line 8
    :cond_0
    packed-switch v0, :pswitch_data_0

    .line 9
    .line 10
    .line 11
    const-string v0, ""

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :pswitch_0
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->D5:I

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    goto :goto_0

    .line 21
    :pswitch_1
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->pj:I

    .line 22
    .line 23
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    goto :goto_0

    .line 28
    :pswitch_2
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Sc:I

    .line 29
    .line 30
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    goto :goto_0

    .line 35
    :pswitch_3
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->wi:I

    .line 36
    .line 37
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    goto :goto_0

    .line 42
    :pswitch_4
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->bh:I

    .line 43
    .line 44
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    goto :goto_0

    .line 49
    :pswitch_5
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->ch:I

    .line 50
    .line 51
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    :goto_0
    iget v1, p0, Ll/ain0;->a:I

    .line 56
    .line 57
    if-eq v1, p3, :cond_1

    .line 58
    .line 59
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->Zf:I

    .line 64
    .line 65
    invoke-virtual {p1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-static {p1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    invoke-virtual {v1, p1}, Lcom/p1/mobile/android/app/Dialog$e;->F(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->N1:I

    .line 82
    .line 83
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Dialog$e;->k0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->ke:I

    .line 88
    .line 89
    new-instance v1, Ll/zhn0;

    .line 90
    .line 91
    invoke-direct {v1, p0, p2, p3}, Ll/zhn0;-><init>(Ll/ain0;Lcom/tantan/live/eventbus/LiveEventBus;I)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->t0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z()Lcom/p1/mobile/android/app/Dialog;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 103
    .line 104
    .line 105
    :cond_1
    return-void

    .line 106
    :cond_2
    :goto_1
    iget-object p1, p0, Ll/ain0;->b:Landroid/os/Handler;

    .line 107
    .line 108
    const/4 v0, 0x0

    .line 109
    invoke-virtual {p1, v0}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 110
    .line 111
    .line 112
    iget-object p1, p2, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceGameChangeEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceGameChangeEvent;

    .line 113
    .line 114
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceGameChangeEvent;->startVoiceGame()Ll/v3f$d;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 119
    .line 120
    .line 121
    move-result-object p2

    .line 122
    invoke-virtual {p1, p2}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {p0, p3}, Ll/ain0;->d(I)V

    .line 126
    .line 127
    .line 128
    return-void

    .line 129
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public k()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Ll/ain0;->a:I

    .line 3
    .line 4
    return-void
.end method
