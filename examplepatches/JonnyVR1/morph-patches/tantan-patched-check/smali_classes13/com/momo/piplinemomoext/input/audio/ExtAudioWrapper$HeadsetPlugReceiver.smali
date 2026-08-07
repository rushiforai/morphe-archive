.class Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$HeadsetPlugReceiver;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "HeadsetPlugReceiver"
.end annotation


# instance fields
.field final synthetic a:Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;


# direct methods
.method private constructor <init>(Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$HeadsetPlugReceiver;->a:Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$a;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$HeadsetPlugReceiver;-><init>(Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;)V

    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$HeadsetPlugReceiver;->a:Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->o0()V

    .line 4
    .line 5
    .line 6
    invoke-super {p0}, Ljava/lang/Object;->finalize()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7
    .line 8
    .line 9
    :catchall_0
    return-void
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 4

    .line 1
    const-string p1, "state"

    .line 2
    .line 3
    invoke-virtual {p2, p1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_3

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p2, p1, v0}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    const-string v2, "HeadsetPlugReceiver ;mIsWiredHeadsetOn"

    .line 15
    .line 16
    const-string v3, "ExtAudioWrapper"

    .line 17
    .line 18
    if-nez v1, :cond_1

    .line 19
    .line 20
    iget-object p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$HeadsetPlugReceiver;->a:Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;

    .line 21
    .line 22
    iget-object p2, p1, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->m:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 23
    .line 24
    if-eqz p2, :cond_0

    .line 25
    .line 26
    invoke-static {p1}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->v2(Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;)Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$i;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-interface {p1}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$i;->getStreamerType()I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    const/4 p2, 0x2

    .line 35
    if-eq p1, p2, :cond_0

    .line 36
    .line 37
    iget-object p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$HeadsetPlugReceiver;->a:Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;

    .line 38
    .line 39
    iget-object p1, p1, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->m:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 40
    .line 41
    const/4 p2, 0x0

    .line 42
    invoke-virtual {p1, p2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setMediaDataCallback(Ltv/danmaku/ijk/media/player/IjkMediaPlayer$MediaDateCallback;)V

    .line 43
    .line 44
    .line 45
    :cond_0
    iget-object p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$HeadsetPlugReceiver;->a:Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;

    .line 46
    .line 47
    invoke-static {p1, v0}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->x2(Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;Z)Z

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$HeadsetPlugReceiver;->a:Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;

    .line 51
    .line 52
    invoke-static {p1}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->y2(Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;)Ll/hb1;

    .line 53
    .line 54
    .line 55
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    new-instance p2, Ljava/lang/StringBuilder;

    .line 60
    .line 61
    invoke-direct {p2, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$HeadsetPlugReceiver;->a:Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;

    .line 65
    .line 66
    invoke-static {v0}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->w2(Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;)Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p2

    .line 77
    invoke-virtual {p1, v3, p2}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    iget-object p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$HeadsetPlugReceiver;->a:Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;

    .line 81
    .line 82
    invoke-static {p1}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->u2(Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;)V

    .line 83
    .line 84
    .line 85
    iget-object p0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$HeadsetPlugReceiver;->a:Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;

    .line 86
    .line 87
    invoke-virtual {p0}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->N2()V

    .line 88
    .line 89
    .line 90
    return-void

    .line 91
    :cond_1
    invoke-virtual {p2, p1, v0}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 92
    .line 93
    .line 94
    move-result p1

    .line 95
    const/4 p2, 0x1

    .line 96
    if-ne p1, p2, :cond_3

    .line 97
    .line 98
    iget-object p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$HeadsetPlugReceiver;->a:Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;

    .line 99
    .line 100
    iget-object v0, p1, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->m:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 101
    .line 102
    if-eqz v0, :cond_2

    .line 103
    .line 104
    invoke-static {p1}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->z2(Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;)Ltv/danmaku/ijk/media/player/IjkMediaPlayer$MediaDateCallback;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    invoke-virtual {v0, p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setMediaDataCallback(Ltv/danmaku/ijk/media/player/IjkMediaPlayer$MediaDateCallback;)V

    .line 109
    .line 110
    .line 111
    :cond_2
    iget-object p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$HeadsetPlugReceiver;->a:Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;

    .line 112
    .line 113
    invoke-static {p1, p2}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->x2(Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;Z)Z

    .line 114
    .line 115
    .line 116
    iget-object p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$HeadsetPlugReceiver;->a:Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;

    .line 117
    .line 118
    invoke-static {p1}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->y2(Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;)Ll/hb1;

    .line 119
    .line 120
    .line 121
    iget-object p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$HeadsetPlugReceiver;->a:Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;

    .line 122
    .line 123
    invoke-static {p1}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->u2(Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;)V

    .line 124
    .line 125
    .line 126
    iget-object p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$HeadsetPlugReceiver;->a:Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;

    .line 127
    .line 128
    invoke-virtual {p1}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->N2()V

    .line 129
    .line 130
    .line 131
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 132
    .line 133
    .line 134
    move-result-object p1

    .line 135
    new-instance p2, Ljava/lang/StringBuilder;

    .line 136
    .line 137
    invoke-direct {p2, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    iget-object p0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$HeadsetPlugReceiver;->a:Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;

    .line 141
    .line 142
    invoke-static {p0}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->w2(Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;)Z

    .line 143
    .line 144
    .line 145
    move-result p0

    .line 146
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object p0

    .line 153
    invoke-virtual {p1, v3, p0}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 154
    .line 155
    .line 156
    :cond_3
    return-void
.end method
