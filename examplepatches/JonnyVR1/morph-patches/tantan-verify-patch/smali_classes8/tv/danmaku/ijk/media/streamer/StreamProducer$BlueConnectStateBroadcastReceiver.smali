.class Ltv/danmaku/ijk/media/streamer/StreamProducer$BlueConnectStateBroadcastReceiver;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ltv/danmaku/ijk/media/streamer/StreamProducer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "BlueConnectStateBroadcastReceiver"
.end annotation


# instance fields
.field final synthetic a:Ltv/danmaku/ijk/media/streamer/StreamProducer;


# direct methods
.method public constructor <init>(Ltv/danmaku/ijk/media/streamer/StreamProducer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$BlueConnectStateBroadcastReceiver;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()V
    .locals 0

    .line 1
    :try_start_0
    invoke-super {p0}, Ljava/lang/Object;->finalize()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2
    .line 3
    .line 4
    :catchall_0
    return-void
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 4

    .line 1
    const-string p1, "android.bluetooth.adapter.extra.CONNECTION_STATE"

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p2, p1, v0}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    const-string p2, "BlueConnectStateBroadcastReceiver"

    .line 9
    .line 10
    const-string v1, "audio"

    .line 11
    .line 12
    const/4 v2, 0x1

    .line 13
    const/4 v3, 0x2

    .line 14
    if-eqz p1, :cond_3

    .line 15
    .line 16
    if-eq p1, v3, :cond_0

    .line 17
    .line 18
    goto/16 :goto_0

    .line 19
    .line 20
    :cond_0
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$BlueConnectStateBroadcastReceiver;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 21
    .line 22
    iget-object p1, p1, Ltv/danmaku/ijk/media/streamer/StreamProducer;->C:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 23
    .line 24
    if-eqz p1, :cond_1

    .line 25
    .line 26
    invoke-virtual {p1}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->getStreamerType()I

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-ne p1, v3, :cond_1

    .line 31
    .line 32
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$BlueConnectStateBroadcastReceiver;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 33
    .line 34
    iget-object p1, p1, Ltv/danmaku/ijk/media/streamer/StreamProducer;->B:Landroid/content/Context;

    .line 35
    .line 36
    if-eqz p1, :cond_1

    .line 37
    .line 38
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    check-cast p1, Landroid/media/AudioManager;

    .line 47
    .line 48
    invoke-virtual {p1, v0}, Landroid/media/AudioManager;->setSpeakerphoneOn(Z)V

    .line 49
    .line 50
    .line 51
    :cond_1
    const-string p1, "STATE_CONNECTED"

    .line 52
    .line 53
    invoke-static {p2, p1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 54
    .line 55
    .line 56
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$BlueConnectStateBroadcastReceiver;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 57
    .line 58
    invoke-static {p1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->F(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Lcom/immomo/mediacore/sink/SinkBase;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    if-eqz p1, :cond_2

    .line 63
    .line 64
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$BlueConnectStateBroadcastReceiver;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 65
    .line 66
    invoke-static {p1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->F(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Lcom/immomo/mediacore/sink/SinkBase;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-virtual {p1, v2}, Lcom/immomo/mediacore/sink/SinkBase;->setHeadsetStatus(Z)V

    .line 71
    .line 72
    .line 73
    :cond_2
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$BlueConnectStateBroadcastReceiver;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 74
    .line 75
    invoke-static {p1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->G(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Lcom/immomo/mediacore/sink/SinkBase;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    if-eqz p1, :cond_6

    .line 80
    .line 81
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$BlueConnectStateBroadcastReceiver;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 82
    .line 83
    invoke-static {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->G(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Lcom/immomo/mediacore/sink/SinkBase;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-virtual {p0, v2}, Lcom/immomo/mediacore/sink/SinkBase;->setHeadsetStatus(Z)V

    .line 88
    .line 89
    .line 90
    return-void

    .line 91
    :cond_3
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$BlueConnectStateBroadcastReceiver;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 92
    .line 93
    iget-object p1, p1, Ltv/danmaku/ijk/media/streamer/StreamProducer;->C:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 94
    .line 95
    if-eqz p1, :cond_4

    .line 96
    .line 97
    invoke-virtual {p1}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->getStreamerType()I

    .line 98
    .line 99
    .line 100
    move-result p1

    .line 101
    if-ne p1, v3, :cond_4

    .line 102
    .line 103
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$BlueConnectStateBroadcastReceiver;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 104
    .line 105
    iget-object p1, p1, Ltv/danmaku/ijk/media/streamer/StreamProducer;->B:Landroid/content/Context;

    .line 106
    .line 107
    if-eqz p1, :cond_4

    .line 108
    .line 109
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    check-cast p1, Landroid/media/AudioManager;

    .line 118
    .line 119
    invoke-virtual {p1, v2}, Landroid/media/AudioManager;->setSpeakerphoneOn(Z)V

    .line 120
    .line 121
    .line 122
    :cond_4
    const-string p1, "STATE_DISCONNECTED"

    .line 123
    .line 124
    invoke-static {p2, p1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 125
    .line 126
    .line 127
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$BlueConnectStateBroadcastReceiver;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 128
    .line 129
    invoke-static {p1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->F(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Lcom/immomo/mediacore/sink/SinkBase;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    if-eqz p1, :cond_5

    .line 134
    .line 135
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$BlueConnectStateBroadcastReceiver;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 136
    .line 137
    invoke-static {p1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->F(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Lcom/immomo/mediacore/sink/SinkBase;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    invoke-virtual {p1, v0}, Lcom/immomo/mediacore/sink/SinkBase;->setHeadsetStatus(Z)V

    .line 142
    .line 143
    .line 144
    :cond_5
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$BlueConnectStateBroadcastReceiver;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 145
    .line 146
    invoke-static {p1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->G(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Lcom/immomo/mediacore/sink/SinkBase;

    .line 147
    .line 148
    .line 149
    move-result-object p1

    .line 150
    if-eqz p1, :cond_6

    .line 151
    .line 152
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$BlueConnectStateBroadcastReceiver;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 153
    .line 154
    invoke-static {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->G(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Lcom/immomo/mediacore/sink/SinkBase;

    .line 155
    .line 156
    .line 157
    move-result-object p0

    .line 158
    invoke-virtual {p0, v0}, Lcom/immomo/mediacore/sink/SinkBase;->setHeadsetStatus(Z)V

    .line 159
    .line 160
    .line 161
    :cond_6
    :goto_0
    return-void
.end method
