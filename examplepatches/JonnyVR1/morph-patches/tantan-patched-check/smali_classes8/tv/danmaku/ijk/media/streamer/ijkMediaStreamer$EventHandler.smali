.class Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$EventHandler;
.super Landroid/os/Handler;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "EventHandler"
.end annotation


# instance fields
.field private a:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

.field final synthetic b:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;


# direct methods
.method public constructor <init>(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;Landroid/os/Looper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$EventHandler;->b:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 2
    .line 3
    invoke-direct {p0, p3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$EventHandler;->a:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 5

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$EventHandler;->b:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 2
    .line 3
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->access$000(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;)Lcom/immomo/mediacore/sink/SinkBase;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "ijkMediaStreamer"

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    const-string p0, "ijkMediaStreamer went away with unhandled events"

    .line 12
    .line 13
    invoke-static {v1, p0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    const-string v2, "ijkMediaStreamer handleMessage what:"

    .line 20
    .line 21
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget v2, p1, Landroid/os/Message;->what:I

    .line 25
    .line 26
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string v2, ";msg.arg1:"

    .line 30
    .line 31
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    iget v2, p1, Landroid/os/Message;->arg1:I

    .line 35
    .line 36
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    const-string v2, ";;msg.arg2:"

    .line 40
    .line 41
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    iget v2, p1, Landroid/os/Message;->arg2:I

    .line 45
    .line 46
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    const-string v2, ";mPlayStatus:"

    .line 50
    .line 51
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$EventHandler;->b:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 55
    .line 56
    invoke-static {v2}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->access$100(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;)I

    .line 57
    .line 58
    .line 59
    move-result v2

    .line 60
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 68
    .line 69
    .line 70
    iget v0, p1, Landroid/os/Message;->what:I

    .line 71
    .line 72
    const/16 v2, 0xc8

    .line 73
    .line 74
    if-eq v0, v2, :cond_d

    .line 75
    .line 76
    const/16 v2, 0xc9

    .line 77
    .line 78
    const/4 v3, 0x0

    .line 79
    const/4 v4, 0x1

    .line 80
    if-eq v0, v2, :cond_b

    .line 81
    .line 82
    const/16 v2, 0x12c

    .line 83
    .line 84
    if-eq v0, v2, :cond_8

    .line 85
    .line 86
    packed-switch v0, :pswitch_data_0

    .line 87
    .line 88
    .line 89
    packed-switch v0, :pswitch_data_1

    .line 90
    .line 91
    .line 92
    new-instance p0, Ljava/lang/StringBuilder;

    .line 93
    .line 94
    const-string v0, "Unknown message type "

    .line 95
    .line 96
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    iget p1, p1, Landroid/os/Message;->what:I

    .line 100
    .line 101
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    invoke-static {v1, p0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 109
    .line 110
    .line 111
    return-void

    .line 112
    :pswitch_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$EventHandler;->b:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 113
    .line 114
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->access$500(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;)Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnRtcStatusListener;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    if-eqz v0, :cond_e

    .line 119
    .line 120
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$EventHandler;->b:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 121
    .line 122
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->access$500(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;)Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnRtcStatusListener;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$EventHandler;->a:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 127
    .line 128
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 129
    .line 130
    invoke-interface {v0, p0, p1}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnRtcStatusListener;->a(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;Ljava/lang/Object;)V

    .line 131
    .line 132
    .line 133
    return-void

    .line 134
    :pswitch_1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$EventHandler;->b:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 135
    .line 136
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->access$400(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;)Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnInfoListener;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    if-eqz v0, :cond_e

    .line 141
    .line 142
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$EventHandler;->b:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 143
    .line 144
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->access$400(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;)Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnInfoListener;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$EventHandler;->a:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 149
    .line 150
    iget v1, p1, Landroid/os/Message;->what:I

    .line 151
    .line 152
    iget p1, p1, Landroid/os/Message;->arg1:I

    .line 153
    .line 154
    invoke-interface {v0, p0, v1, p1}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnInfoListener;->a(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;II)V

    .line 155
    .line 156
    .line 157
    return-void

    .line 158
    :pswitch_2
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$EventHandler;->b:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 159
    .line 160
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->access$400(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;)Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnInfoListener;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    if-eqz v0, :cond_1

    .line 165
    .line 166
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$EventHandler;->b:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 167
    .line 168
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->access$400(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;)Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnInfoListener;

    .line 169
    .line 170
    .line 171
    move-result-object v0

    .line 172
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$EventHandler;->a:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 173
    .line 174
    iget v2, p1, Landroid/os/Message;->what:I

    .line 175
    .line 176
    iget v3, p1, Landroid/os/Message;->arg1:I

    .line 177
    .line 178
    invoke-interface {v0, v1, v2, v3}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnInfoListener;->a(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;II)V

    .line 179
    .line 180
    .line 181
    :cond_1
    iget v0, p1, Landroid/os/Message;->what:I

    .line 182
    .line 183
    const/16 v1, 0x67

    .line 184
    .line 185
    if-ne v0, v1, :cond_2

    .line 186
    .line 187
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$EventHandler;->b:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 188
    .line 189
    iget-object v0, v0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mLogHelper:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

    .line 190
    .line 191
    if-eqz v0, :cond_2

    .line 192
    .line 193
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->f()V

    .line 194
    .line 195
    .line 196
    :cond_2
    iget p1, p1, Landroid/os/Message;->what:I

    .line 197
    .line 198
    const/16 v0, 0x69

    .line 199
    .line 200
    if-ne p1, v0, :cond_3

    .line 201
    .line 202
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$EventHandler;->b:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 203
    .line 204
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mLogHelper:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

    .line 205
    .line 206
    if-eqz p0, :cond_3

    .line 207
    .line 208
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->g()V

    .line 209
    .line 210
    .line 211
    :cond_3
    return-void

    .line 212
    :pswitch_3
    const-string v0, "MEDIA_RECORDER_EVENT_PUBLISHING"

    .line 213
    .line 214
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 215
    .line 216
    .line 217
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$EventHandler;->b:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 218
    .line 219
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->access$400(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;)Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnInfoListener;

    .line 220
    .line 221
    .line 222
    move-result-object v0

    .line 223
    if-eqz v0, :cond_4

    .line 224
    .line 225
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$EventHandler;->b:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 226
    .line 227
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->access$400(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;)Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnInfoListener;

    .line 228
    .line 229
    .line 230
    move-result-object v0

    .line 231
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$EventHandler;->a:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 232
    .line 233
    iget v2, p1, Landroid/os/Message;->what:I

    .line 234
    .line 235
    iget p1, p1, Landroid/os/Message;->arg1:I

    .line 236
    .line 237
    invoke-interface {v0, v1, v2, p1}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnInfoListener;->a(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;II)V

    .line 238
    .line 239
    .line 240
    :cond_4
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$EventHandler;->b:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 241
    .line 242
    invoke-static {p1}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->access$600(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;)Landroid/os/Handler;

    .line 243
    .line 244
    .line 245
    move-result-object p1

    .line 246
    if-eqz p1, :cond_5

    .line 247
    .line 248
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$EventHandler;->b:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 249
    .line 250
    invoke-static {p1}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->access$600(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;)Landroid/os/Handler;

    .line 251
    .line 252
    .line 253
    move-result-object p1

    .line 254
    const/4 v0, 0x0

    .line 255
    invoke-virtual {p1, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 256
    .line 257
    .line 258
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$EventHandler;->b:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 259
    .line 260
    invoke-static {p1}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->access$600(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;)Landroid/os/Handler;

    .line 261
    .line 262
    .line 263
    move-result-object p1

    .line 264
    invoke-virtual {p1, v0}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 265
    .line 266
    .line 267
    :cond_5
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$EventHandler;->b:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 268
    .line 269
    iget-object v0, p1, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mLogHelper:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

    .line 270
    .line 271
    if-eqz v0, :cond_e

    .line 272
    .line 273
    iget-object p1, p1, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mOutpath:Ljava/lang/String;

    .line 274
    .line 275
    invoke-virtual {v0, p1}, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->h(Ljava/lang/String;)V

    .line 276
    .line 277
    .line 278
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$EventHandler;->b:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 279
    .line 280
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mLogHelper:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

    .line 281
    .line 282
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->k()V

    .line 283
    .line 284
    .line 285
    return-void

    .line 286
    :pswitch_4
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$EventHandler;->b:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 287
    .line 288
    invoke-static {p1}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->access$800(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;)Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnRecordStopedListener;

    .line 289
    .line 290
    .line 291
    move-result-object p1

    .line 292
    if-eqz p1, :cond_6

    .line 293
    .line 294
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$EventHandler;->b:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 295
    .line 296
    invoke-static {p1}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->access$100(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;)I

    .line 297
    .line 298
    .line 299
    move-result p1

    .line 300
    if-ne p1, v4, :cond_6

    .line 301
    .line 302
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$EventHandler;->b:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 303
    .line 304
    invoke-static {p1}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->access$800(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;)Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnRecordStopedListener;

    .line 305
    .line 306
    .line 307
    move-result-object p1

    .line 308
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$EventHandler;->a:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 309
    .line 310
    invoke-interface {p1, v0}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnRecordStopedListener;->a(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;)V

    .line 311
    .line 312
    .line 313
    :cond_6
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$EventHandler;->b:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 314
    .line 315
    invoke-static {p0, v3}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->access$102(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;I)I

    .line 316
    .line 317
    .line 318
    return-void

    .line 319
    :pswitch_5
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$EventHandler;->b:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 320
    .line 321
    invoke-static {p1}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->access$900(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;)Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnPreparedListener;

    .line 322
    .line 323
    .line 324
    move-result-object p1

    .line 325
    if-eqz p1, :cond_7

    .line 326
    .line 327
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$EventHandler;->b:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 328
    .line 329
    invoke-static {p1}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->access$100(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;)I

    .line 330
    .line 331
    .line 332
    move-result p1

    .line 333
    if-nez p1, :cond_7

    .line 334
    .line 335
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$EventHandler;->b:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 336
    .line 337
    invoke-static {p1}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->access$900(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;)Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnPreparedListener;

    .line 338
    .line 339
    .line 340
    move-result-object p1

    .line 341
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$EventHandler;->a:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 342
    .line 343
    invoke-interface {p1, v0}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnPreparedListener;->a(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;)V

    .line 344
    .line 345
    .line 346
    :cond_7
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$EventHandler;->b:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 347
    .line 348
    invoke-static {p0, v4}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->access$102(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;I)I

    .line 349
    .line 350
    .line 351
    return-void

    .line 352
    :cond_8
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 353
    .line 354
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$EventHandler;->b:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 355
    .line 356
    invoke-static {v1}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->access$200(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;)Lcom/immomo/mediacore/sink/SinkBase;

    .line 357
    .line 358
    .line 359
    move-result-object v1

    .line 360
    if-ne v0, v1, :cond_9

    .line 361
    .line 362
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$EventHandler;->b:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 363
    .line 364
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->access$200(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;)Lcom/immomo/mediacore/sink/SinkBase;

    .line 365
    .line 366
    .line 367
    move-result-object v0

    .line 368
    if-eqz v0, :cond_9

    .line 369
    .line 370
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$EventHandler;->b:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 371
    .line 372
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->deAttachStreamer()V

    .line 373
    .line 374
    .line 375
    return-void

    .line 376
    :cond_9
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$EventHandler;->b:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 377
    .line 378
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->access$300(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;)V

    .line 379
    .line 380
    .line 381
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$EventHandler;->b:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 382
    .line 383
    iget-object v0, v0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mOnErrorListener:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnErrorListener;

    .line 384
    .line 385
    if-eqz v0, :cond_a

    .line 386
    .line 387
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$EventHandler;->a:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 388
    .line 389
    iget v2, p1, Landroid/os/Message;->arg1:I

    .line 390
    .line 391
    iget v3, p1, Landroid/os/Message;->arg2:I

    .line 392
    .line 393
    invoke-interface {v0, v1, v2, v3}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnErrorListener;->a(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;II)V

    .line 394
    .line 395
    .line 396
    :cond_a
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$EventHandler;->b:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 397
    .line 398
    iget-object v0, v0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mLogHelper:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

    .line 399
    .line 400
    if-eqz v0, :cond_e

    .line 401
    .line 402
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->l()V

    .line 403
    .line 404
    .line 405
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$EventHandler;->b:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 406
    .line 407
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mLogHelper:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

    .line 408
    .line 409
    iget p1, p1, Landroid/os/Message;->arg2:I

    .line 410
    .line 411
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mOutpath:Ljava/lang/String;

    .line 412
    .line 413
    invoke-virtual {v0, p1, p0}, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->i(ILjava/lang/String;)V

    .line 414
    .line 415
    .line 416
    return-void

    .line 417
    :cond_b
    const-string v0, "MEDIA_RECORDER_FRAMERATE_INFO"

    .line 418
    .line 419
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 420
    .line 421
    .line 422
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$EventHandler;->b:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 423
    .line 424
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->access$700(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;)Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 425
    .line 426
    .line 427
    move-result-object v0

    .line 428
    if-eqz v0, :cond_e

    .line 429
    .line 430
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$EventHandler;->b:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 431
    .line 432
    invoke-static {p0}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->access$700(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;)Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 433
    .line 434
    .line 435
    move-result-object p0

    .line 436
    iget v0, p1, Landroid/os/Message;->arg1:I

    .line 437
    .line 438
    iget p1, p1, Landroid/os/Message;->arg2:I

    .line 439
    .line 440
    if-ne p1, v4, :cond_c

    .line 441
    .line 442
    move v3, v4

    .line 443
    :cond_c
    invoke-virtual {p0, v0, v3}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->d(IZ)V

    .line 444
    .line 445
    .line 446
    return-void

    .line 447
    :cond_d
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$EventHandler;->b:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 448
    .line 449
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->access$400(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;)Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnInfoListener;

    .line 450
    .line 451
    .line 452
    move-result-object v0

    .line 453
    if-eqz v0, :cond_e

    .line 454
    .line 455
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$EventHandler;->b:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 456
    .line 457
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->access$400(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;)Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnInfoListener;

    .line 458
    .line 459
    .line 460
    move-result-object v0

    .line 461
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$EventHandler;->a:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 462
    .line 463
    iget v1, p1, Landroid/os/Message;->arg1:I

    .line 464
    .line 465
    iget p1, p1, Landroid/os/Message;->arg2:I

    .line 466
    .line 467
    invoke-interface {v0, p0, v1, p1}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnInfoListener;->a(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;II)V

    .line 468
    .line 469
    .line 470
    :cond_e
    return-void

    .line 471
    :pswitch_data_0
    .packed-switch 0x64
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
    .end packed-switch

    .line 472
    .line 473
    .line 474
    .line 475
    .line 476
    .line 477
    .line 478
    .line 479
    .line 480
    .line 481
    .line 482
    .line 483
    :pswitch_data_1
    .packed-switch 0x69
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
