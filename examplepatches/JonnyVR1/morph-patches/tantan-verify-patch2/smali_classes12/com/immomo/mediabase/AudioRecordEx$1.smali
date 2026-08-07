.class Lcom/immomo/mediabase/AudioRecordEx$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/mediabase/AudioRecordEx;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field private bufferReadResult:I

.field private i:I

.field private mAudioFrame:[B

.field final synthetic this$0:Lcom/immomo/mediabase/AudioRecordEx;


# direct methods
.method public constructor <init>(Lcom/immomo/mediabase/AudioRecordEx;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/immomo/mediabase/AudioRecordEx$1;->this$0:Lcom/immomo/mediabase/AudioRecordEx;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput p1, p0, Lcom/immomo/mediabase/AudioRecordEx$1;->i:I

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-object v0, p0, Lcom/immomo/mediabase/AudioRecordEx$1;->mAudioFrame:[B

    .line 11
    .line 12
    iput p1, p0, Lcom/immomo/mediabase/AudioRecordEx$1;->bufferReadResult:I

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public run()V
    .locals 11

    .line 1
    const/16 v0, -0x13

    .line 2
    .line 3
    invoke-static {v0}, Landroid/os/Process;->setThreadPriority(I)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/immomo/mediabase/AudioRecordEx$1;->this$0:Lcom/immomo/mediabase/AudioRecordEx;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/immomo/mediabase/AudioRecordEx;->access$000(Lcom/immomo/mediabase/AudioRecordEx;)Landroid/media/AudioRecord;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-eqz v0, :cond_7

    .line 13
    .line 14
    :catch_0
    :goto_0
    iget-object v0, p0, Lcom/immomo/mediabase/AudioRecordEx$1;->this$0:Lcom/immomo/mediabase/AudioRecordEx;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/immomo/mediabase/AudioRecordEx;->access$000(Lcom/immomo/mediabase/AudioRecordEx;)Landroid/media/AudioRecord;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Landroid/media/AudioRecord;->getState()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    const-wide/16 v1, 0x64

    .line 25
    .line 26
    const/4 v3, 0x1

    .line 27
    if-nez v0, :cond_0

    .line 28
    .line 29
    iget v0, p0, Lcom/immomo/mediabase/AudioRecordEx$1;->i:I

    .line 30
    .line 31
    const/4 v4, 0x5

    .line 32
    if-ge v0, v4, :cond_0

    .line 33
    .line 34
    :try_start_0
    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V

    .line 35
    .line 36
    .line 37
    iget v0, p0, Lcom/immomo/mediabase/AudioRecordEx$1;->i:I

    .line 38
    .line 39
    add-int/2addr v0, v3

    .line 40
    iput v0, p0, Lcom/immomo/mediabase/AudioRecordEx$1;->i:I

    .line 41
    .line 42
    const-string v0, "AudioRecordEx"

    .line 43
    .line 44
    new-instance v1, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 47
    .line 48
    .line 49
    const-string v2, "mAudioRecord.getState "

    .line 50
    .line 51
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    iget-object v2, p0, Lcom/immomo/mediabase/AudioRecordEx$1;->this$0:Lcom/immomo/mediabase/AudioRecordEx;

    .line 55
    .line 56
    invoke-static {v2}, Lcom/immomo/mediabase/AudioRecordEx;->access$000(Lcom/immomo/mediabase/AudioRecordEx;)Landroid/media/AudioRecord;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    invoke-virtual {v2}, Landroid/media/AudioRecord;->getState()I

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 72
    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/immomo/mediabase/AudioRecordEx$1;->this$0:Lcom/immomo/mediabase/AudioRecordEx;

    .line 76
    .line 77
    invoke-static {v0}, Lcom/immomo/mediabase/AudioRecordEx;->access$000(Lcom/immomo/mediabase/AudioRecordEx;)Landroid/media/AudioRecord;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-virtual {v0}, Landroid/media/AudioRecord;->startRecording()V

    .line 82
    .line 83
    .line 84
    const/4 v0, 0x0

    .line 85
    iput v0, p0, Lcom/immomo/mediabase/AudioRecordEx$1;->i:I

    .line 86
    .line 87
    :catch_1
    :goto_1
    iget-object v4, p0, Lcom/immomo/mediabase/AudioRecordEx$1;->this$0:Lcom/immomo/mediabase/AudioRecordEx;

    .line 88
    .line 89
    invoke-static {v4}, Lcom/immomo/mediabase/AudioRecordEx;->access$000(Lcom/immomo/mediabase/AudioRecordEx;)Landroid/media/AudioRecord;

    .line 90
    .line 91
    .line 92
    move-result-object v4

    .line 93
    invoke-virtual {v4}, Landroid/media/AudioRecord;->getRecordingState()I

    .line 94
    .line 95
    .line 96
    move-result v4

    .line 97
    const/4 v5, 0x3

    .line 98
    if-eq v4, v5, :cond_1

    .line 99
    .line 100
    iget v4, p0, Lcom/immomo/mediabase/AudioRecordEx$1;->i:I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    .line 101
    .line 102
    const/16 v6, 0xa

    .line 103
    .line 104
    if-ge v4, v6, :cond_1

    .line 105
    .line 106
    :try_start_2
    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V

    .line 107
    .line 108
    .line 109
    iget v4, p0, Lcom/immomo/mediabase/AudioRecordEx$1;->i:I

    .line 110
    .line 111
    add-int/2addr v4, v3

    .line 112
    iput v4, p0, Lcom/immomo/mediabase/AudioRecordEx$1;->i:I

    .line 113
    .line 114
    iget-object v4, p0, Lcom/immomo/mediabase/AudioRecordEx$1;->this$0:Lcom/immomo/mediabase/AudioRecordEx;

    .line 115
    .line 116
    invoke-static {v4}, Lcom/immomo/mediabase/AudioRecordEx;->access$000(Lcom/immomo/mediabase/AudioRecordEx;)Landroid/media/AudioRecord;

    .line 117
    .line 118
    .line 119
    move-result-object v4

    .line 120
    invoke-virtual {v4}, Landroid/media/AudioRecord;->startRecording()V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 121
    .line 122
    .line 123
    goto :goto_1

    .line 124
    :cond_1
    :try_start_3
    iget-object v1, p0, Lcom/immomo/mediabase/AudioRecordEx$1;->this$0:Lcom/immomo/mediabase/AudioRecordEx;

    .line 125
    .line 126
    invoke-static {v1}, Lcom/immomo/mediabase/AudioRecordEx;->access$000(Lcom/immomo/mediabase/AudioRecordEx;)Landroid/media/AudioRecord;

    .line 127
    .line 128
    .line 129
    move-result-object v1

    .line 130
    invoke-virtual {v1}, Landroid/media/AudioRecord;->getRecordingState()I

    .line 131
    .line 132
    .line 133
    move-result v1

    .line 134
    if-eq v1, v5, :cond_2

    .line 135
    .line 136
    const-string v0, "AudioRecordEx"

    .line 137
    .line 138
    new-instance v1, Ljava/lang/StringBuilder;

    .line 139
    .line 140
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 141
    .line 142
    .line 143
    const-string v2, "Error: mAudioRecord.getRecordingState : "

    .line 144
    .line 145
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    iget-object p0, p0, Lcom/immomo/mediabase/AudioRecordEx$1;->this$0:Lcom/immomo/mediabase/AudioRecordEx;

    .line 149
    .line 150
    invoke-static {p0}, Lcom/immomo/mediabase/AudioRecordEx;->access$000(Lcom/immomo/mediabase/AudioRecordEx;)Landroid/media/AudioRecord;

    .line 151
    .line 152
    .line 153
    move-result-object p0

    .line 154
    invoke-virtual {p0}, Landroid/media/AudioRecord;->getRecordingState()I

    .line 155
    .line 156
    .line 157
    move-result p0

    .line 158
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 159
    .line 160
    .line 161
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object p0

    .line 165
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    .line 166
    .line 167
    .line 168
    goto/16 :goto_5

    .line 169
    .line 170
    :cond_2
    :goto_2
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    .line 171
    .line 172
    .line 173
    move-result v1

    .line 174
    if-nez v1, :cond_6

    .line 175
    .line 176
    iget-object v1, p0, Lcom/immomo/mediabase/AudioRecordEx$1;->this$0:Lcom/immomo/mediabase/AudioRecordEx;

    .line 177
    .line 178
    invoke-static {v1}, Lcom/immomo/mediabase/AudioRecordEx;->access$100(Lcom/immomo/mediabase/AudioRecordEx;)Z

    .line 179
    .line 180
    .line 181
    move-result v1

    .line 182
    if-eqz v1, :cond_6

    .line 183
    .line 184
    iget-object v1, p0, Lcom/immomo/mediabase/AudioRecordEx$1;->mAudioFrame:[B

    .line 185
    .line 186
    if-nez v1, :cond_3

    .line 187
    .line 188
    iget-object v1, p0, Lcom/immomo/mediabase/AudioRecordEx$1;->this$0:Lcom/immomo/mediabase/AudioRecordEx;

    .line 189
    .line 190
    invoke-static {v1}, Lcom/immomo/mediabase/AudioRecordEx;->access$200(Lcom/immomo/mediabase/AudioRecordEx;)I

    .line 191
    .line 192
    .line 193
    move-result v1

    .line 194
    new-array v1, v1, [B

    .line 195
    .line 196
    iput-object v1, p0, Lcom/immomo/mediabase/AudioRecordEx$1;->mAudioFrame:[B

    .line 197
    .line 198
    :cond_3
    iget-object v1, p0, Lcom/immomo/mediabase/AudioRecordEx$1;->this$0:Lcom/immomo/mediabase/AudioRecordEx;

    .line 199
    .line 200
    invoke-static {v1}, Lcom/immomo/mediabase/AudioRecordEx;->access$000(Lcom/immomo/mediabase/AudioRecordEx;)Landroid/media/AudioRecord;

    .line 201
    .line 202
    .line 203
    move-result-object v1

    .line 204
    iget-object v2, p0, Lcom/immomo/mediabase/AudioRecordEx$1;->mAudioFrame:[B

    .line 205
    .line 206
    iget-object v4, p0, Lcom/immomo/mediabase/AudioRecordEx$1;->this$0:Lcom/immomo/mediabase/AudioRecordEx;

    .line 207
    .line 208
    invoke-static {v4}, Lcom/immomo/mediabase/AudioRecordEx;->access$200(Lcom/immomo/mediabase/AudioRecordEx;)I

    .line 209
    .line 210
    .line 211
    move-result v4

    .line 212
    invoke-virtual {v1, v2, v0, v4}, Landroid/media/AudioRecord;->read([BII)I

    .line 213
    .line 214
    .line 215
    move-result v1

    .line 216
    iput v1, p0, Lcom/immomo/mediabase/AudioRecordEx$1;->bufferReadResult:I

    .line 217
    .line 218
    iget-object v2, p0, Lcom/immomo/mediabase/AudioRecordEx$1;->this$0:Lcom/immomo/mediabase/AudioRecordEx;

    .line 219
    .line 220
    if-lez v1, :cond_5

    .line 221
    .line 222
    invoke-static {v2, v3}, Lcom/immomo/mediabase/AudioRecordEx;->access$302(Lcom/immomo/mediabase/AudioRecordEx;Z)Z

    .line 223
    .line 224
    .line 225
    iget-object v1, p0, Lcom/immomo/mediabase/AudioRecordEx$1;->this$0:Lcom/immomo/mediabase/AudioRecordEx;

    .line 226
    .line 227
    invoke-static {v1}, Lcom/immomo/mediabase/AudioRecordEx;->access$400(Lcom/immomo/mediabase/AudioRecordEx;)Ljava/lang/Object;

    .line 228
    .line 229
    .line 230
    move-result-object v1

    .line 231
    monitor-enter v1

    .line 232
    :try_start_4
    iget-object v2, p0, Lcom/immomo/mediabase/AudioRecordEx$1;->this$0:Lcom/immomo/mediabase/AudioRecordEx;

    .line 233
    .line 234
    invoke-static {v2}, Lcom/immomo/mediabase/AudioRecordEx;->access$500(Lcom/immomo/mediabase/AudioRecordEx;)Lcom/immomo/mediabase/AudioRecordEx$OnAudioFrameAvailabel;

    .line 235
    .line 236
    .line 237
    move-result-object v2

    .line 238
    if-eqz v2, :cond_4

    .line 239
    .line 240
    new-instance v4, Lcom/immomo/mediabase/PacketData;

    .line 241
    .line 242
    iget-object v2, p0, Lcom/immomo/mediabase/AudioRecordEx$1;->this$0:Lcom/immomo/mediabase/AudioRecordEx;

    .line 243
    .line 244
    invoke-static {v2}, Lcom/immomo/mediabase/AudioRecordEx;->access$200(Lcom/immomo/mediabase/AudioRecordEx;)I

    .line 245
    .line 246
    .line 247
    move-result v2

    .line 248
    invoke-direct {v4, v2}, Lcom/immomo/mediabase/PacketData;-><init>(I)V

    .line 249
    .line 250
    .line 251
    invoke-virtual {v4}, Lcom/immomo/mediabase/PacketData;->getFrameBuffer()Ljava/nio/ByteBuffer;

    .line 252
    .line 253
    .line 254
    move-result-object v2

    .line 255
    iget-object v5, p0, Lcom/immomo/mediabase/AudioRecordEx$1;->mAudioFrame:[B

    .line 256
    .line 257
    invoke-virtual {v2, v5}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 258
    .line 259
    .line 260
    invoke-virtual {v4}, Lcom/immomo/mediabase/PacketData;->getFrameBuffer()Ljava/nio/ByteBuffer;

    .line 261
    .line 262
    .line 263
    move-result-object v2

    .line 264
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 265
    .line 266
    .line 267
    iget-object v2, p0, Lcom/immomo/mediabase/AudioRecordEx$1;->this$0:Lcom/immomo/mediabase/AudioRecordEx;

    .line 268
    .line 269
    invoke-static {v2}, Lcom/immomo/mediabase/AudioRecordEx;->access$200(Lcom/immomo/mediabase/AudioRecordEx;)I

    .line 270
    .line 271
    .line 272
    move-result v5

    .line 273
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 274
    .line 275
    .line 276
    move-result-wide v6

    .line 277
    const-wide/16 v8, 0x3e8

    .line 278
    .line 279
    div-long v8, v6, v8

    .line 280
    .line 281
    const/4 v10, 0x0

    .line 282
    const/4 v6, 0x0

    .line 283
    const/4 v7, 0x0

    .line 284
    invoke-virtual/range {v4 .. v10}, Lcom/immomo/mediabase/PacketData;->setBuffInfo(IIIJI)V

    .line 285
    .line 286
    .line 287
    iget-object v2, p0, Lcom/immomo/mediabase/AudioRecordEx$1;->this$0:Lcom/immomo/mediabase/AudioRecordEx;

    .line 288
    .line 289
    invoke-static {v2}, Lcom/immomo/mediabase/AudioRecordEx;->access$500(Lcom/immomo/mediabase/AudioRecordEx;)Lcom/immomo/mediabase/AudioRecordEx$OnAudioFrameAvailabel;

    .line 290
    .line 291
    .line 292
    move-result-object v2

    .line 293
    invoke-interface {v2, v4}, Lcom/immomo/mediabase/AudioRecordEx$OnAudioFrameAvailabel;->onAudioFrameAvailable(Lcom/immomo/mediabase/PacketData;)V

    .line 294
    .line 295
    .line 296
    goto :goto_3

    .line 297
    :catchall_0
    move-exception v0

    .line 298
    move-object p0, v0

    .line 299
    goto :goto_4

    .line 300
    :cond_4
    :goto_3
    monitor-exit v1

    .line 301
    goto/16 :goto_2

    .line 302
    .line 303
    :goto_4
    monitor-exit v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 304
    throw p0

    .line 305
    :cond_5
    invoke-static {v2, v0}, Lcom/immomo/mediabase/AudioRecordEx;->access$302(Lcom/immomo/mediabase/AudioRecordEx;Z)Z

    .line 306
    .line 307
    .line 308
    :cond_6
    const-string p0, "AudioRecordEx"

    .line 309
    .line 310
    const-string v0, " mAudioRecord.stop() and release"

    .line 311
    .line 312
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 313
    .line 314
    .line 315
    return-void

    .line 316
    :catch_2
    move-exception v0

    .line 317
    move-object p0, v0

    .line 318
    const-string v0, "AudioRecordEx"

    .line 319
    .line 320
    new-instance v1, Ljava/lang/StringBuilder;

    .line 321
    .line 322
    const-string v2, "mAudioRecord.startRecording() Error : "

    .line 323
    .line 324
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 325
    .line 326
    .line 327
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 328
    .line 329
    .line 330
    move-result-object p0

    .line 331
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 332
    .line 333
    .line 334
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 335
    .line 336
    .line 337
    move-result-object p0

    .line 338
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 339
    .line 340
    .line 341
    :cond_7
    :goto_5
    return-void
.end method
