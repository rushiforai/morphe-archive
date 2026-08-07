.class Lcom/google/android/exoplayer2/ui/PlayerNotificationManager$NotificationBroadcastReceiver;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer2/ui/PlayerNotificationManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "NotificationBroadcastReceiver"
.end annotation


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-static {p0}, Lcom/google/android/exoplayer2/ui/PlayerNotificationManager;->a(Lcom/google/android/exoplayer2/ui/PlayerNotificationManager;)Lcom/google/android/exoplayer2/t;

    .line 3
    .line 4
    .line 5
    move-result-object p1

    .line 6
    if-eqz p1, :cond_a

    .line 7
    .line 8
    invoke-static {p0}, Lcom/google/android/exoplayer2/ui/PlayerNotificationManager;->b(Lcom/google/android/exoplayer2/ui/PlayerNotificationManager;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_a

    .line 13
    .line 14
    const-string v0, "INSTANCE_ID"

    .line 15
    .line 16
    invoke-static {p0}, Lcom/google/android/exoplayer2/ui/PlayerNotificationManager;->c(Lcom/google/android/exoplayer2/ui/PlayerNotificationManager;)I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    invoke-virtual {p2, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    invoke-static {p0}, Lcom/google/android/exoplayer2/ui/PlayerNotificationManager;->c(Lcom/google/android/exoplayer2/ui/PlayerNotificationManager;)I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-eq v0, v1, :cond_0

    .line 29
    .line 30
    goto/16 :goto_0

    .line 31
    .line 32
    :cond_0
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    const-string v0, "com.google.android.exoplayer.play"

    .line 37
    .line 38
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_1

    .line 43
    .line 44
    invoke-static {p1}, Ll/bmk0;->t0(Lcom/google/android/exoplayer2/t;)Z

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_1
    const-string v0, "com.google.android.exoplayer.pause"

    .line 49
    .line 50
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-eqz v0, :cond_2

    .line 55
    .line 56
    invoke-static {p1}, Ll/bmk0;->s0(Lcom/google/android/exoplayer2/t;)Z

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_2
    const-string v0, "com.google.android.exoplayer.prev"

    .line 61
    .line 62
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-eqz v0, :cond_3

    .line 67
    .line 68
    const/4 p0, 0x7

    .line 69
    invoke-interface {p1, p0}, Lcom/google/android/exoplayer2/t;->isCommandAvailable(I)Z

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    if-eqz p0, :cond_a

    .line 74
    .line 75
    invoke-interface {p1}, Lcom/google/android/exoplayer2/t;->seekToPrevious()V

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :cond_3
    const-string v0, "com.google.android.exoplayer.rewind"

    .line 80
    .line 81
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    if-eqz v0, :cond_4

    .line 86
    .line 87
    const/16 p0, 0xb

    .line 88
    .line 89
    invoke-interface {p1, p0}, Lcom/google/android/exoplayer2/t;->isCommandAvailable(I)Z

    .line 90
    .line 91
    .line 92
    move-result p0

    .line 93
    if-eqz p0, :cond_a

    .line 94
    .line 95
    invoke-interface {p1}, Lcom/google/android/exoplayer2/t;->seekBack()V

    .line 96
    .line 97
    .line 98
    return-void

    .line 99
    :cond_4
    const-string v0, "com.google.android.exoplayer.ffwd"

    .line 100
    .line 101
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    if-eqz v0, :cond_5

    .line 106
    .line 107
    const/16 p0, 0xc

    .line 108
    .line 109
    invoke-interface {p1, p0}, Lcom/google/android/exoplayer2/t;->isCommandAvailable(I)Z

    .line 110
    .line 111
    .line 112
    move-result p0

    .line 113
    if-eqz p0, :cond_a

    .line 114
    .line 115
    invoke-interface {p1}, Lcom/google/android/exoplayer2/t;->seekForward()V

    .line 116
    .line 117
    .line 118
    return-void

    .line 119
    :cond_5
    const-string v0, "com.google.android.exoplayer.next"

    .line 120
    .line 121
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 122
    .line 123
    .line 124
    move-result v0

    .line 125
    if-eqz v0, :cond_6

    .line 126
    .line 127
    const/16 p0, 0x9

    .line 128
    .line 129
    invoke-interface {p1, p0}, Lcom/google/android/exoplayer2/t;->isCommandAvailable(I)Z

    .line 130
    .line 131
    .line 132
    move-result p0

    .line 133
    if-eqz p0, :cond_a

    .line 134
    .line 135
    invoke-interface {p1}, Lcom/google/android/exoplayer2/t;->seekToNext()V

    .line 136
    .line 137
    .line 138
    return-void

    .line 139
    :cond_6
    const-string v0, "com.google.android.exoplayer.stop"

    .line 140
    .line 141
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 142
    .line 143
    .line 144
    move-result v0

    .line 145
    if-eqz v0, :cond_8

    .line 146
    .line 147
    const/4 p0, 0x3

    .line 148
    invoke-interface {p1, p0}, Lcom/google/android/exoplayer2/t;->isCommandAvailable(I)Z

    .line 149
    .line 150
    .line 151
    move-result p0

    .line 152
    if-eqz p0, :cond_7

    .line 153
    .line 154
    invoke-interface {p1}, Lcom/google/android/exoplayer2/t;->stop()V

    .line 155
    .line 156
    .line 157
    :cond_7
    const/16 p0, 0x14

    .line 158
    .line 159
    invoke-interface {p1, p0}, Lcom/google/android/exoplayer2/t;->isCommandAvailable(I)Z

    .line 160
    .line 161
    .line 162
    move-result p0

    .line 163
    if-eqz p0, :cond_a

    .line 164
    .line 165
    invoke-interface {p1}, Lcom/google/android/exoplayer2/t;->clearMediaItems()V

    .line 166
    .line 167
    .line 168
    return-void

    .line 169
    :cond_8
    const-string p1, "com.google.android.exoplayer.dismiss"

    .line 170
    .line 171
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 172
    .line 173
    .line 174
    move-result p1

    .line 175
    if-eqz p1, :cond_9

    .line 176
    .line 177
    const/4 p1, 0x1

    .line 178
    invoke-static {p0, p1}, Lcom/google/android/exoplayer2/ui/PlayerNotificationManager;->d(Lcom/google/android/exoplayer2/ui/PlayerNotificationManager;Z)V

    .line 179
    .line 180
    .line 181
    return-void

    .line 182
    :cond_9
    if-eqz p2, :cond_a

    .line 183
    .line 184
    invoke-static {p0}, Lcom/google/android/exoplayer2/ui/PlayerNotificationManager;->e(Lcom/google/android/exoplayer2/ui/PlayerNotificationManager;)Lcom/google/android/exoplayer2/ui/PlayerNotificationManager$a;

    .line 185
    .line 186
    .line 187
    :cond_a
    :goto_0
    return-void
.end method
