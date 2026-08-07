.class Lcom/tantanapp/ijk/media/player/IjkMediaPlayer$EventHandler;
.super Landroid/os/Handler;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "EventHandler"
.end annotation


# instance fields
.field private final mWeakPlayer:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;Landroid/os/Looper;)V
    .locals 0

    .line 1
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 2
    .line 3
    .line 4
    new-instance p2, Ljava/lang/ref/WeakReference;

    .line 5
    .line 6
    invoke-direct {p2, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    iput-object p2, p0, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer$EventHandler;->mWeakPlayer:Ljava/lang/ref/WeakReference;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 8

    .line 1
    iget-object p0, p0, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer$EventHandler;->mWeakPlayer:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;

    .line 8
    .line 9
    if-eqz p0, :cond_11

    .line 10
    .line 11
    invoke-static {p0}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->access$000(Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;)J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    const-wide/16 v2, 0x0

    .line 16
    .line 17
    cmp-long v0, v0, v2

    .line 18
    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    goto/16 :goto_2

    .line 22
    .line 23
    :cond_0
    iget v0, p1, Landroid/os/Message;->what:I

    .line 24
    .line 25
    if-eqz v0, :cond_10

    .line 26
    .line 27
    const/4 v1, 0x1

    .line 28
    if-eq v0, v1, :cond_f

    .line 29
    .line 30
    const/4 v4, 0x2

    .line 31
    const/4 v5, 0x0

    .line 32
    if-eq v0, v4, :cond_e

    .line 33
    .line 34
    const/4 v4, 0x3

    .line 35
    if-eq v0, v4, :cond_a

    .line 36
    .line 37
    const/4 v2, 0x4

    .line 38
    if-eq v0, v2, :cond_9

    .line 39
    .line 40
    const/4 v2, 0x5

    .line 41
    if-eq v0, v2, :cond_8

    .line 42
    .line 43
    const/16 v2, 0x63

    .line 44
    .line 45
    if-eq v0, v2, :cond_6

    .line 46
    .line 47
    const/16 v1, 0x64

    .line 48
    .line 49
    if-eq v0, v1, :cond_4

    .line 50
    .line 51
    const/16 v1, 0xc8

    .line 52
    .line 53
    if-eq v0, v1, :cond_2

    .line 54
    .line 55
    const/16 v1, 0x2711

    .line 56
    .line 57
    if-eq v0, v1, :cond_1

    .line 58
    .line 59
    invoke-static {}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->access$100()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    new-instance v0, Ljava/lang/StringBuilder;

    .line 64
    .line 65
    const-string v1, "Unknown message type "

    .line 66
    .line 67
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    iget p1, p1, Landroid/os/Message;->what:I

    .line 71
    .line 72
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    invoke-static {p0, p1}, Lcom/tantanapp/ijk/media/player/pragma/DebugLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    return-void

    .line 83
    :cond_1
    iget v0, p1, Landroid/os/Message;->arg1:I

    .line 84
    .line 85
    invoke-static {p0, v0}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->access$502(Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;I)I

    .line 86
    .line 87
    .line 88
    iget p1, p1, Landroid/os/Message;->arg2:I

    .line 89
    .line 90
    invoke-static {p0, p1}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->access$602(Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;I)I

    .line 91
    .line 92
    .line 93
    invoke-static {p0}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->access$300(Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;)I

    .line 94
    .line 95
    .line 96
    move-result p1

    .line 97
    invoke-static {p0}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->access$400(Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;)I

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    invoke-static {p0}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->access$500(Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;)I

    .line 102
    .line 103
    .line 104
    move-result v1

    .line 105
    invoke-static {p0}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->access$600(Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;)I

    .line 106
    .line 107
    .line 108
    move-result v2

    .line 109
    invoke-virtual {p0, p1, v0, v1, v2}, Lcom/tantanapp/ijk/media/player/AbstractMediaPlayer;->notifyOnVideoSizeChanged(IIII)V

    .line 110
    .line 111
    .line 112
    return-void

    .line 113
    :cond_2
    iget v0, p1, Landroid/os/Message;->arg1:I

    .line 114
    .line 115
    if-eq v0, v4, :cond_3

    .line 116
    .line 117
    goto :goto_0

    .line 118
    :cond_3
    invoke-static {}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->access$100()Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    const-string v1, "Info: MEDIA_INFO_VIDEO_RENDERING_START\n"

    .line 123
    .line 124
    invoke-static {v0, v1}, Lcom/tantanapp/ijk/media/player/pragma/DebugLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    :goto_0
    iget v0, p1, Landroid/os/Message;->arg1:I

    .line 128
    .line 129
    iget p1, p1, Landroid/os/Message;->arg2:I

    .line 130
    .line 131
    invoke-virtual {p0, v0, p1}, Lcom/tantanapp/ijk/media/player/AbstractMediaPlayer;->notifyOnInfo(II)Z

    .line 132
    .line 133
    .line 134
    return-void

    .line 135
    :cond_4
    invoke-static {}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->access$100()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    new-instance v1, Ljava/lang/StringBuilder;

    .line 140
    .line 141
    const-string v2, "Error ("

    .line 142
    .line 143
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 144
    .line 145
    .line 146
    iget v2, p1, Landroid/os/Message;->arg1:I

    .line 147
    .line 148
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 149
    .line 150
    .line 151
    const-string v2, ","

    .line 152
    .line 153
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    iget v2, p1, Landroid/os/Message;->arg2:I

    .line 157
    .line 158
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 159
    .line 160
    .line 161
    const-string v2, ")"

    .line 162
    .line 163
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 164
    .line 165
    .line 166
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object v1

    .line 170
    invoke-static {v0, v1}, Lcom/tantanapp/ijk/media/player/pragma/DebugLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 171
    .line 172
    .line 173
    iget v0, p1, Landroid/os/Message;->arg1:I

    .line 174
    .line 175
    iget p1, p1, Landroid/os/Message;->arg2:I

    .line 176
    .line 177
    invoke-virtual {p0, v0, p1}, Lcom/tantanapp/ijk/media/player/AbstractMediaPlayer;->notifyOnError(II)Z

    .line 178
    .line 179
    .line 180
    move-result p1

    .line 181
    if-nez p1, :cond_5

    .line 182
    .line 183
    invoke-virtual {p0}, Lcom/tantanapp/ijk/media/player/AbstractMediaPlayer;->notifyOnCompletion()V

    .line 184
    .line 185
    .line 186
    :cond_5
    invoke-static {p0, v5}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->access$200(Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;Z)V

    .line 187
    .line 188
    .line 189
    return-void

    .line 190
    :cond_6
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 191
    .line 192
    if-nez v0, :cond_7

    .line 193
    .line 194
    const/4 p1, 0x0

    .line 195
    invoke-virtual {p0, p1}, Lcom/tantanapp/ijk/media/player/AbstractMediaPlayer;->notifyOnTimedText(Lcom/tantanapp/ijk/media/player/IjkTimedText;)V

    .line 196
    .line 197
    .line 198
    return-void

    .line 199
    :cond_7
    new-instance v0, Lcom/tantanapp/ijk/media/player/IjkTimedText;

    .line 200
    .line 201
    new-instance v2, Landroid/graphics/Rect;

    .line 202
    .line 203
    invoke-direct {v2, v5, v5, v1, v1}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 204
    .line 205
    .line 206
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 207
    .line 208
    check-cast p1, Ljava/lang/String;

    .line 209
    .line 210
    invoke-direct {v0, v2, p1}, Lcom/tantanapp/ijk/media/player/IjkTimedText;-><init>(Landroid/graphics/Rect;Ljava/lang/String;)V

    .line 211
    .line 212
    .line 213
    invoke-virtual {p0, v0}, Lcom/tantanapp/ijk/media/player/AbstractMediaPlayer;->notifyOnTimedText(Lcom/tantanapp/ijk/media/player/IjkTimedText;)V

    .line 214
    .line 215
    .line 216
    return-void

    .line 217
    :cond_8
    iget v0, p1, Landroid/os/Message;->arg1:I

    .line 218
    .line 219
    invoke-static {p0, v0}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->access$302(Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;I)I

    .line 220
    .line 221
    .line 222
    iget p1, p1, Landroid/os/Message;->arg2:I

    .line 223
    .line 224
    invoke-static {p0, p1}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->access$402(Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;I)I

    .line 225
    .line 226
    .line 227
    invoke-static {p0}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->access$300(Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;)I

    .line 228
    .line 229
    .line 230
    move-result p1

    .line 231
    invoke-static {p0}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->access$400(Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;)I

    .line 232
    .line 233
    .line 234
    move-result v0

    .line 235
    invoke-static {p0}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->access$500(Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;)I

    .line 236
    .line 237
    .line 238
    move-result v1

    .line 239
    invoke-static {p0}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->access$600(Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;)I

    .line 240
    .line 241
    .line 242
    move-result v2

    .line 243
    invoke-virtual {p0, p1, v0, v1, v2}, Lcom/tantanapp/ijk/media/player/AbstractMediaPlayer;->notifyOnVideoSizeChanged(IIII)V

    .line 244
    .line 245
    .line 246
    return-void

    .line 247
    :cond_9
    invoke-virtual {p0}, Lcom/tantanapp/ijk/media/player/AbstractMediaPlayer;->notifyOnSeekComplete()V

    .line 248
    .line 249
    .line 250
    return-void

    .line 251
    :cond_a
    iget p1, p1, Landroid/os/Message;->arg1:I

    .line 252
    .line 253
    int-to-long v0, p1

    .line 254
    cmp-long p1, v0, v2

    .line 255
    .line 256
    if-gez p1, :cond_b

    .line 257
    .line 258
    move-wide v0, v2

    .line 259
    :cond_b
    invoke-virtual {p0}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->getDuration()J

    .line 260
    .line 261
    .line 262
    move-result-wide v4

    .line 263
    cmp-long p1, v4, v2

    .line 264
    .line 265
    const-wide/16 v6, 0x64

    .line 266
    .line 267
    if-lez p1, :cond_c

    .line 268
    .line 269
    mul-long/2addr v0, v6

    .line 270
    div-long v2, v0, v4

    .line 271
    .line 272
    :cond_c
    cmp-long p1, v2, v6

    .line 273
    .line 274
    if-ltz p1, :cond_d

    .line 275
    .line 276
    goto :goto_1

    .line 277
    :cond_d
    move-wide v6, v2

    .line 278
    :goto_1
    long-to-int p1, v6

    .line 279
    invoke-virtual {p0, p1}, Lcom/tantanapp/ijk/media/player/AbstractMediaPlayer;->notifyOnBufferingUpdate(I)V

    .line 280
    .line 281
    .line 282
    return-void

    .line 283
    :cond_e
    invoke-static {p0, v5}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->access$200(Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;Z)V

    .line 284
    .line 285
    .line 286
    invoke-virtual {p0}, Lcom/tantanapp/ijk/media/player/AbstractMediaPlayer;->notifyOnCompletion()V

    .line 287
    .line 288
    .line 289
    return-void

    .line 290
    :cond_f
    invoke-virtual {p0}, Lcom/tantanapp/ijk/media/player/AbstractMediaPlayer;->notifyOnPrepared()V

    .line 291
    .line 292
    .line 293
    :cond_10
    return-void

    .line 294
    :cond_11
    :goto_2
    invoke-static {}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->access$100()Ljava/lang/String;

    .line 295
    .line 296
    .line 297
    move-result-object p0

    .line 298
    const-string p1, "IjkMediaPlayer went away with unhandled events"

    .line 299
    .line 300
    invoke-static {p0, p1}, Lcom/tantanapp/ijk/media/player/pragma/DebugLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 301
    .line 302
    .line 303
    return-void
.end method
