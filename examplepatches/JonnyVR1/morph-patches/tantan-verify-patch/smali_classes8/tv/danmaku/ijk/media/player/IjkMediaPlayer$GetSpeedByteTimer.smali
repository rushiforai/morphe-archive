.class Ltv/danmaku/ijk/media/player/IjkMediaPlayer$GetSpeedByteTimer;
.super Landroid/os/Handler;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ltv/danmaku/ijk/media/player/IjkMediaPlayer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "GetSpeedByteTimer"
.end annotation


# instance fields
.field final synthetic this$0:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;


# direct methods
.method public constructor <init>(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;Landroid/os/Looper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer$GetSpeedByteTimer;->this$0:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 13

    .line 1
    iget p1, p1, Landroid/os/Message;->what:I

    .line 2
    .line 3
    const-wide/16 v0, 0x3e8

    .line 4
    .line 5
    const-wide/16 v2, 0x8

    .line 6
    .line 7
    const/16 v4, 0x3e8

    .line 8
    .line 9
    const/4 v5, 0x1

    .line 10
    if-eq p1, v5, :cond_3

    .line 11
    .line 12
    const/4 v5, 0x2

    .line 13
    if-eq p1, v5, :cond_0

    .line 14
    .line 15
    goto/16 :goto_0

    .line 16
    .line 17
    :cond_0
    :try_start_0
    iget-object p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer$GetSpeedByteTimer;->this$0:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 18
    .line 19
    invoke-static {p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->access$2400(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;)J

    .line 20
    .line 21
    .line 22
    move-result-wide v6

    .line 23
    iget-object p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer$GetSpeedByteTimer;->this$0:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 24
    .line 25
    invoke-static {p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->access$2700(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;)J

    .line 26
    .line 27
    .line 28
    move-result-wide v8

    .line 29
    sub-long v8, v6, v8

    .line 30
    .line 31
    iget-object p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer$GetSpeedByteTimer;->this$0:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 32
    .line 33
    invoke-static {p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->access$2800(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;)Ltv/danmaku/ijk/media/player/IjkMediaPlayer$LimitedQueue;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    if-nez p1, :cond_1

    .line 38
    .line 39
    iget-object p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer$GetSpeedByteTimer;->this$0:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 40
    .line 41
    new-instance v10, Ltv/danmaku/ijk/media/player/IjkMediaPlayer$LimitedQueue;

    .line 42
    .line 43
    iget-object v11, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer$GetSpeedByteTimer;->this$0:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 44
    .line 45
    invoke-static {v11}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->access$2900(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;)I

    .line 46
    .line 47
    .line 48
    move-result v12

    .line 49
    invoke-direct {v10, v11, v12}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer$LimitedQueue;-><init>(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;I)V

    .line 50
    .line 51
    .line 52
    invoke-static {p1, v10}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->access$2802(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;Ltv/danmaku/ijk/media/player/IjkMediaPlayer$LimitedQueue;)Ltv/danmaku/ijk/media/player/IjkMediaPlayer$LimitedQueue;

    .line 53
    .line 54
    .line 55
    :cond_1
    iget-object p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer$GetSpeedByteTimer;->this$0:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 56
    .line 57
    invoke-static {p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->access$2800(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;)Ltv/danmaku/ijk/media/player/IjkMediaPlayer$LimitedQueue;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    if-eqz p1, :cond_2

    .line 62
    .line 63
    iget-object p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer$GetSpeedByteTimer;->this$0:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 64
    .line 65
    invoke-static {p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->access$3000(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;)I

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    if-eqz p1, :cond_2

    .line 70
    .line 71
    iget-object p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer$GetSpeedByteTimer;->this$0:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 72
    .line 73
    invoke-static {p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->access$2800(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;)Ltv/danmaku/ijk/media/player/IjkMediaPlayer$LimitedQueue;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    invoke-virtual {p1}, Ljava/util/AbstractCollection;->size()I

    .line 78
    .line 79
    .line 80
    move-result p1

    .line 81
    iget-object v10, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer$GetSpeedByteTimer;->this$0:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 82
    .line 83
    invoke-static {v10}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->access$2900(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;)I

    .line 84
    .line 85
    .line 86
    move-result v10

    .line 87
    if-ge p1, v10, :cond_2

    .line 88
    .line 89
    iget-object p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer$GetSpeedByteTimer;->this$0:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 90
    .line 91
    invoke-static {p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->access$2800(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;)Ltv/danmaku/ijk/media/player/IjkMediaPlayer$LimitedQueue;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    iget-object v10, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer$GetSpeedByteTimer;->this$0:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 96
    .line 97
    invoke-static {v10}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->access$3000(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;)I

    .line 98
    .line 99
    .line 100
    move-result v10

    .line 101
    div-int/2addr v4, v10

    .line 102
    int-to-long v10, v4

    .line 103
    mul-long/2addr v8, v10

    .line 104
    mul-long/2addr v8, v2

    .line 105
    div-long/2addr v8, v0

    .line 106
    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    invoke-virtual {p1, v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer$LimitedQueue;->add(Ljava/lang/Object;)Z

    .line 111
    .line 112
    .line 113
    :cond_2
    iget-object p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer$GetSpeedByteTimer;->this$0:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 114
    .line 115
    invoke-static {p1, v6, v7}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->access$2702(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;J)J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 116
    .line 117
    .line 118
    :catch_0
    invoke-virtual {p0, v5}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer$GetSpeedByteTimer;->this$0:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 123
    .line 124
    invoke-static {v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->access$2600(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;)I

    .line 125
    .line 126
    .line 127
    move-result v0

    .line 128
    int-to-long v0, v0

    .line 129
    invoke-virtual {p0, p1, v0, v1}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 130
    .line 131
    .line 132
    goto :goto_0

    .line 133
    :cond_3
    :try_start_1
    iget-object p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer$GetSpeedByteTimer;->this$0:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 134
    .line 135
    invoke-static {p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->access$2200(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;)Ltv/danmaku/ijk/media/player/IjkMediaPlayer$LimitedQueue;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    if-nez p1, :cond_4

    .line 140
    .line 141
    iget-object p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer$GetSpeedByteTimer;->this$0:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 142
    .line 143
    new-instance v6, Ltv/danmaku/ijk/media/player/IjkMediaPlayer$LimitedQueue;

    .line 144
    .line 145
    iget-object v7, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer$GetSpeedByteTimer;->this$0:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 146
    .line 147
    invoke-static {v7}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->access$2300(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;)I

    .line 148
    .line 149
    .line 150
    move-result v8

    .line 151
    invoke-direct {v6, v7, v8}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer$LimitedQueue;-><init>(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;I)V

    .line 152
    .line 153
    .line 154
    invoke-static {p1, v6}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->access$2202(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;Ltv/danmaku/ijk/media/player/IjkMediaPlayer$LimitedQueue;)Ltv/danmaku/ijk/media/player/IjkMediaPlayer$LimitedQueue;

    .line 155
    .line 156
    .line 157
    :cond_4
    iget-object p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer$GetSpeedByteTimer;->this$0:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 158
    .line 159
    invoke-static {p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->access$2400(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;)J

    .line 160
    .line 161
    .line 162
    move-result-wide v6

    .line 163
    iget-object p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer$GetSpeedByteTimer;->this$0:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 164
    .line 165
    invoke-static {p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->access$2500(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;)J

    .line 166
    .line 167
    .line 168
    move-result-wide v8

    .line 169
    sub-long v8, v6, v8

    .line 170
    .line 171
    iget-object p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer$GetSpeedByteTimer;->this$0:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 172
    .line 173
    invoke-static {p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->access$2200(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;)Ltv/danmaku/ijk/media/player/IjkMediaPlayer$LimitedQueue;

    .line 174
    .line 175
    .line 176
    move-result-object p1

    .line 177
    if-eqz p1, :cond_5

    .line 178
    .line 179
    iget-object p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer$GetSpeedByteTimer;->this$0:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 180
    .line 181
    invoke-static {p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->access$2600(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;)I

    .line 182
    .line 183
    .line 184
    move-result p1

    .line 185
    if-eqz p1, :cond_5

    .line 186
    .line 187
    iget-object p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer$GetSpeedByteTimer;->this$0:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 188
    .line 189
    invoke-static {p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->access$2200(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;)Ltv/danmaku/ijk/media/player/IjkMediaPlayer$LimitedQueue;

    .line 190
    .line 191
    .line 192
    move-result-object p1

    .line 193
    iget-object v10, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer$GetSpeedByteTimer;->this$0:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 194
    .line 195
    invoke-static {v10}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->access$2600(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;)I

    .line 196
    .line 197
    .line 198
    move-result v10

    .line 199
    div-int/2addr v4, v10

    .line 200
    int-to-long v10, v4

    .line 201
    mul-long/2addr v8, v10

    .line 202
    mul-long/2addr v8, v2

    .line 203
    div-long/2addr v8, v0

    .line 204
    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 205
    .line 206
    .line 207
    move-result-object v0

    .line 208
    invoke-virtual {p1, v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer$LimitedQueue;->add(Ljava/lang/Object;)Z

    .line 209
    .line 210
    .line 211
    :cond_5
    iget-object p1, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer$GetSpeedByteTimer;->this$0:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 212
    .line 213
    invoke-static {p1, v6, v7}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->access$2502(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;J)J
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 214
    .line 215
    .line 216
    :catch_1
    invoke-virtual {p0, v5}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    .line 217
    .line 218
    .line 219
    move-result-object p1

    .line 220
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer$GetSpeedByteTimer;->this$0:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 221
    .line 222
    invoke-static {v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->access$2600(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;)I

    .line 223
    .line 224
    .line 225
    move-result v0

    .line 226
    int-to-long v0, v0

    .line 227
    invoke-virtual {p0, p1, v0, v1}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 228
    .line 229
    .line 230
    :goto_0
    return-void
.end method
