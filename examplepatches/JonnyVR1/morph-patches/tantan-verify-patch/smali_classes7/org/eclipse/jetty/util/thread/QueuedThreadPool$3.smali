.class Lorg/eclipse/jetty/util/thread/QueuedThreadPool$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jetty/util/thread/QueuedThreadPool;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jetty/util/thread/QueuedThreadPool;


# direct methods
.method public constructor <init>(Lorg/eclipse/jetty/util/thread/QueuedThreadPool;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/util/thread/QueuedThreadPool$3;->this$0:Lorg/eclipse/jetty/util/thread/QueuedThreadPool;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 11

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    iget-object v1, p0, Lorg/eclipse/jetty/util/thread/QueuedThreadPool$3;->this$0:Lorg/eclipse/jetty/util/thread/QueuedThreadPool;

    .line 3
    .line 4
    invoke-static {v1}, Lorg/eclipse/jetty/util/thread/QueuedThreadPool;->access$000(Lorg/eclipse/jetty/util/thread/QueuedThreadPool;)Ljava/util/concurrent/BlockingQueue;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    invoke-interface {v1}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    check-cast v1, Ljava/lang/Runnable;
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_5
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_4
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    .line 13
    .line 14
    move v2, v0

    .line 15
    :goto_0
    :try_start_1
    iget-object v3, p0, Lorg/eclipse/jetty/util/thread/QueuedThreadPool$3;->this$0:Lorg/eclipse/jetty/util/thread/QueuedThreadPool;

    .line 16
    .line 17
    invoke-virtual {v3}, Lorg/eclipse/jetty/util/component/AbstractLifeCycle;->isRunning()Z

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    if-eqz v3, :cond_8

    .line 22
    .line 23
    :goto_1
    if-eqz v1, :cond_0

    .line 24
    .line 25
    iget-object v3, p0, Lorg/eclipse/jetty/util/thread/QueuedThreadPool$3;->this$0:Lorg/eclipse/jetty/util/thread/QueuedThreadPool;

    .line 26
    .line 27
    invoke-virtual {v3}, Lorg/eclipse/jetty/util/component/AbstractLifeCycle;->isRunning()Z

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    if-eqz v3, :cond_0

    .line 32
    .line 33
    iget-object v3, p0, Lorg/eclipse/jetty/util/thread/QueuedThreadPool$3;->this$0:Lorg/eclipse/jetty/util/thread/QueuedThreadPool;

    .line 34
    .line 35
    invoke-virtual {v3, v1}, Lorg/eclipse/jetty/util/thread/QueuedThreadPool;->runJob(Ljava/lang/Runnable;)V

    .line 36
    .line 37
    .line 38
    iget-object v1, p0, Lorg/eclipse/jetty/util/thread/QueuedThreadPool$3;->this$0:Lorg/eclipse/jetty/util/thread/QueuedThreadPool;

    .line 39
    .line 40
    invoke-static {v1}, Lorg/eclipse/jetty/util/thread/QueuedThreadPool;->access$000(Lorg/eclipse/jetty/util/thread/QueuedThreadPool;)Ljava/util/concurrent/BlockingQueue;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-interface {v1}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    check-cast v1, Ljava/lang/Runnable;
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 49
    .line 50
    goto :goto_1

    .line 51
    :catchall_0
    move-exception v0

    .line 52
    goto/16 :goto_a

    .line 53
    .line 54
    :catch_0
    move-exception v0

    .line 55
    goto/16 :goto_6

    .line 56
    .line 57
    :catch_1
    move-exception v0

    .line 58
    goto/16 :goto_8

    .line 59
    .line 60
    :cond_0
    :try_start_2
    iget-object v3, p0, Lorg/eclipse/jetty/util/thread/QueuedThreadPool$3;->this$0:Lorg/eclipse/jetty/util/thread/QueuedThreadPool;

    .line 61
    .line 62
    invoke-static {v3}, Lorg/eclipse/jetty/util/thread/QueuedThreadPool;->access$100(Lorg/eclipse/jetty/util/thread/QueuedThreadPool;)Ljava/util/concurrent/atomic/AtomicInteger;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 67
    .line 68
    .line 69
    :goto_2
    iget-object v3, p0, Lorg/eclipse/jetty/util/thread/QueuedThreadPool$3;->this$0:Lorg/eclipse/jetty/util/thread/QueuedThreadPool;

    .line 70
    .line 71
    invoke-virtual {v3}, Lorg/eclipse/jetty/util/component/AbstractLifeCycle;->isRunning()Z

    .line 72
    .line 73
    .line 74
    move-result v3

    .line 75
    if-eqz v3, :cond_7

    .line 76
    .line 77
    if-nez v1, :cond_7

    .line 78
    .line 79
    iget-object v1, p0, Lorg/eclipse/jetty/util/thread/QueuedThreadPool$3;->this$0:Lorg/eclipse/jetty/util/thread/QueuedThreadPool;

    .line 80
    .line 81
    invoke-static {v1}, Lorg/eclipse/jetty/util/thread/QueuedThreadPool;->access$200(Lorg/eclipse/jetty/util/thread/QueuedThreadPool;)I

    .line 82
    .line 83
    .line 84
    move-result v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 85
    iget-object v3, p0, Lorg/eclipse/jetty/util/thread/QueuedThreadPool$3;->this$0:Lorg/eclipse/jetty/util/thread/QueuedThreadPool;

    .line 86
    .line 87
    if-gtz v1, :cond_1

    .line 88
    .line 89
    :try_start_3
    invoke-static {v3}, Lorg/eclipse/jetty/util/thread/QueuedThreadPool;->access$000(Lorg/eclipse/jetty/util/thread/QueuedThreadPool;)Ljava/util/concurrent/BlockingQueue;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    invoke-interface {v1}, Ljava/util/concurrent/BlockingQueue;->take()Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    check-cast v1, Ljava/lang/Runnable;

    .line 98
    .line 99
    goto :goto_2

    .line 100
    :catchall_1
    move-exception v0

    .line 101
    goto/16 :goto_5

    .line 102
    .line 103
    :cond_1
    invoke-static {v3}, Lorg/eclipse/jetty/util/thread/QueuedThreadPool;->access$300(Lorg/eclipse/jetty/util/thread/QueuedThreadPool;)Ljava/util/concurrent/atomic/AtomicInteger;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    iget-object v3, p0, Lorg/eclipse/jetty/util/thread/QueuedThreadPool$3;->this$0:Lorg/eclipse/jetty/util/thread/QueuedThreadPool;

    .line 112
    .line 113
    invoke-static {v3}, Lorg/eclipse/jetty/util/thread/QueuedThreadPool;->access$400(Lorg/eclipse/jetty/util/thread/QueuedThreadPool;)I

    .line 114
    .line 115
    .line 116
    move-result v3

    .line 117
    if-le v1, v3, :cond_6

    .line 118
    .line 119
    iget-object v3, p0, Lorg/eclipse/jetty/util/thread/QueuedThreadPool$3;->this$0:Lorg/eclipse/jetty/util/thread/QueuedThreadPool;

    .line 120
    .line 121
    invoke-static {v3}, Lorg/eclipse/jetty/util/thread/QueuedThreadPool;->access$500(Lorg/eclipse/jetty/util/thread/QueuedThreadPool;)Ljava/util/concurrent/atomic/AtomicLong;

    .line 122
    .line 123
    .line 124
    move-result-object v3

    .line 125
    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 126
    .line 127
    .line 128
    move-result-wide v3

    .line 129
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 130
    .line 131
    .line 132
    move-result-wide v5

    .line 133
    const-wide/16 v7, 0x0

    .line 134
    .line 135
    cmp-long v7, v3, v7

    .line 136
    .line 137
    if-eqz v7, :cond_2

    .line 138
    .line 139
    sub-long v7, v5, v3

    .line 140
    .line 141
    iget-object v9, p0, Lorg/eclipse/jetty/util/thread/QueuedThreadPool$3;->this$0:Lorg/eclipse/jetty/util/thread/QueuedThreadPool;

    .line 142
    .line 143
    invoke-static {v9}, Lorg/eclipse/jetty/util/thread/QueuedThreadPool;->access$200(Lorg/eclipse/jetty/util/thread/QueuedThreadPool;)I

    .line 144
    .line 145
    .line 146
    move-result v9

    .line 147
    int-to-long v9, v9

    .line 148
    cmp-long v7, v7, v9

    .line 149
    .line 150
    if-lez v7, :cond_6

    .line 151
    .line 152
    :cond_2
    iget-object v7, p0, Lorg/eclipse/jetty/util/thread/QueuedThreadPool$3;->this$0:Lorg/eclipse/jetty/util/thread/QueuedThreadPool;

    .line 153
    .line 154
    invoke-static {v7}, Lorg/eclipse/jetty/util/thread/QueuedThreadPool;->access$500(Lorg/eclipse/jetty/util/thread/QueuedThreadPool;)Ljava/util/concurrent/atomic/AtomicLong;

    .line 155
    .line 156
    .line 157
    move-result-object v7

    .line 158
    invoke-virtual {v7, v3, v4, v5, v6}, Ljava/util/concurrent/atomic/AtomicLong;->compareAndSet(JJ)Z

    .line 159
    .line 160
    .line 161
    move-result v3

    .line 162
    if-eqz v3, :cond_3

    .line 163
    .line 164
    iget-object v3, p0, Lorg/eclipse/jetty/util/thread/QueuedThreadPool$3;->this$0:Lorg/eclipse/jetty/util/thread/QueuedThreadPool;

    .line 165
    .line 166
    invoke-static {v3}, Lorg/eclipse/jetty/util/thread/QueuedThreadPool;->access$300(Lorg/eclipse/jetty/util/thread/QueuedThreadPool;)Ljava/util/concurrent/atomic/AtomicInteger;

    .line 167
    .line 168
    .line 169
    move-result-object v3

    .line 170
    add-int/lit8 v4, v1, -0x1

    .line 171
    .line 172
    invoke-virtual {v3, v1, v4}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z

    .line 173
    .line 174
    .line 175
    move-result v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 176
    if-eqz v1, :cond_3

    .line 177
    .line 178
    const/4 v1, 0x1

    .line 179
    goto :goto_3

    .line 180
    :cond_3
    move v1, v0

    .line 181
    :goto_3
    if-eqz v1, :cond_5

    .line 182
    .line 183
    :try_start_4
    iget-object v0, p0, Lorg/eclipse/jetty/util/thread/QueuedThreadPool$3;->this$0:Lorg/eclipse/jetty/util/thread/QueuedThreadPool;

    .line 184
    .line 185
    invoke-static {v0}, Lorg/eclipse/jetty/util/thread/QueuedThreadPool;->access$100(Lorg/eclipse/jetty/util/thread/QueuedThreadPool;)Ljava/util/concurrent/atomic/AtomicInteger;

    .line 186
    .line 187
    .line 188
    move-result-object v0

    .line 189
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I
    :try_end_4
    .catch Ljava/lang/InterruptedException; {:try_start_4 .. :try_end_4} :catch_3
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 190
    .line 191
    .line 192
    if-nez v1, :cond_4

    .line 193
    .line 194
    :goto_4
    iget-object v0, p0, Lorg/eclipse/jetty/util/thread/QueuedThreadPool$3;->this$0:Lorg/eclipse/jetty/util/thread/QueuedThreadPool;

    .line 195
    .line 196
    invoke-static {v0}, Lorg/eclipse/jetty/util/thread/QueuedThreadPool;->access$300(Lorg/eclipse/jetty/util/thread/QueuedThreadPool;)Ljava/util/concurrent/atomic/AtomicInteger;

    .line 197
    .line 198
    .line 199
    move-result-object v0

    .line 200
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 201
    .line 202
    .line 203
    :cond_4
    iget-object p0, p0, Lorg/eclipse/jetty/util/thread/QueuedThreadPool$3;->this$0:Lorg/eclipse/jetty/util/thread/QueuedThreadPool;

    .line 204
    .line 205
    invoke-static {p0}, Lorg/eclipse/jetty/util/thread/QueuedThreadPool;->access$800(Lorg/eclipse/jetty/util/thread/QueuedThreadPool;)Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 206
    .line 207
    .line 208
    move-result-object p0

    .line 209
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 210
    .line 211
    .line 212
    move-result-object v0

    .line 213
    invoke-virtual {p0, v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->remove(Ljava/lang/Object;)Z

    .line 214
    .line 215
    .line 216
    return-void

    .line 217
    :catchall_2
    move-exception v0

    .line 218
    move v2, v1

    .line 219
    goto/16 :goto_a

    .line 220
    .line 221
    :catch_2
    move-exception v0

    .line 222
    move v2, v1

    .line 223
    goto :goto_6

    .line 224
    :catch_3
    move-exception v0

    .line 225
    move v2, v1

    .line 226
    goto :goto_8

    .line 227
    :cond_5
    move v2, v1

    .line 228
    :cond_6
    :try_start_5
    iget-object v1, p0, Lorg/eclipse/jetty/util/thread/QueuedThreadPool$3;->this$0:Lorg/eclipse/jetty/util/thread/QueuedThreadPool;

    .line 229
    .line 230
    invoke-static {v1}, Lorg/eclipse/jetty/util/thread/QueuedThreadPool;->access$600(Lorg/eclipse/jetty/util/thread/QueuedThreadPool;)Ljava/lang/Runnable;

    .line 231
    .line 232
    .line 233
    move-result-object v1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 234
    goto/16 :goto_2

    .line 235
    .line 236
    :cond_7
    :try_start_6
    iget-object v3, p0, Lorg/eclipse/jetty/util/thread/QueuedThreadPool$3;->this$0:Lorg/eclipse/jetty/util/thread/QueuedThreadPool;

    .line 237
    .line 238
    invoke-static {v3}, Lorg/eclipse/jetty/util/thread/QueuedThreadPool;->access$100(Lorg/eclipse/jetty/util/thread/QueuedThreadPool;)Ljava/util/concurrent/atomic/AtomicInteger;

    .line 239
    .line 240
    .line 241
    move-result-object v3

    .line 242
    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 243
    .line 244
    .line 245
    goto/16 :goto_0

    .line 246
    .line 247
    :goto_5
    iget-object v1, p0, Lorg/eclipse/jetty/util/thread/QueuedThreadPool$3;->this$0:Lorg/eclipse/jetty/util/thread/QueuedThreadPool;

    .line 248
    .line 249
    invoke-static {v1}, Lorg/eclipse/jetty/util/thread/QueuedThreadPool;->access$100(Lorg/eclipse/jetty/util/thread/QueuedThreadPool;)Ljava/util/concurrent/atomic/AtomicInteger;

    .line 250
    .line 251
    .line 252
    move-result-object v1

    .line 253
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 254
    .line 255
    .line 256
    throw v0
    :try_end_6
    .catch Ljava/lang/InterruptedException; {:try_start_6 .. :try_end_6} :catch_1
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 257
    :cond_8
    if-nez v2, :cond_4

    .line 258
    .line 259
    goto :goto_4

    .line 260
    :catchall_3
    move-exception v1

    .line 261
    move v2, v0

    .line 262
    move-object v0, v1

    .line 263
    goto :goto_a

    .line 264
    :catch_4
    move-exception v1

    .line 265
    move v2, v0

    .line 266
    move-object v0, v1

    .line 267
    goto :goto_6

    .line 268
    :catch_5
    move-exception v1

    .line 269
    move v2, v0

    .line 270
    move-object v0, v1

    .line 271
    goto :goto_8

    .line 272
    :goto_6
    :try_start_7
    invoke-static {}, Lorg/eclipse/jetty/util/thread/QueuedThreadPool;->access$700()Lorg/eclipse/jetty/util/log/Logger;

    .line 273
    .line 274
    .line 275
    move-result-object v1

    .line 276
    invoke-interface {v1, v0}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/Throwable;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 277
    .line 278
    .line 279
    if-nez v2, :cond_9

    .line 280
    .line 281
    :goto_7
    iget-object v0, p0, Lorg/eclipse/jetty/util/thread/QueuedThreadPool$3;->this$0:Lorg/eclipse/jetty/util/thread/QueuedThreadPool;

    .line 282
    .line 283
    invoke-static {v0}, Lorg/eclipse/jetty/util/thread/QueuedThreadPool;->access$300(Lorg/eclipse/jetty/util/thread/QueuedThreadPool;)Ljava/util/concurrent/atomic/AtomicInteger;

    .line 284
    .line 285
    .line 286
    move-result-object v0

    .line 287
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 288
    .line 289
    .line 290
    :cond_9
    iget-object p0, p0, Lorg/eclipse/jetty/util/thread/QueuedThreadPool$3;->this$0:Lorg/eclipse/jetty/util/thread/QueuedThreadPool;

    .line 291
    .line 292
    invoke-static {p0}, Lorg/eclipse/jetty/util/thread/QueuedThreadPool;->access$800(Lorg/eclipse/jetty/util/thread/QueuedThreadPool;)Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 293
    .line 294
    .line 295
    move-result-object p0

    .line 296
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 297
    .line 298
    .line 299
    move-result-object v0

    .line 300
    invoke-virtual {p0, v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->remove(Ljava/lang/Object;)Z

    .line 301
    .line 302
    .line 303
    goto :goto_9

    .line 304
    :goto_8
    :try_start_8
    invoke-static {}, Lorg/eclipse/jetty/util/thread/QueuedThreadPool;->access$700()Lorg/eclipse/jetty/util/log/Logger;

    .line 305
    .line 306
    .line 307
    move-result-object v1

    .line 308
    invoke-interface {v1, v0}, Lorg/eclipse/jetty/util/log/Logger;->ignore(Ljava/lang/Throwable;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 309
    .line 310
    .line 311
    if-nez v2, :cond_9

    .line 312
    .line 313
    goto :goto_7

    .line 314
    :goto_9
    return-void

    .line 315
    :goto_a
    if-nez v2, :cond_a

    .line 316
    .line 317
    iget-object v1, p0, Lorg/eclipse/jetty/util/thread/QueuedThreadPool$3;->this$0:Lorg/eclipse/jetty/util/thread/QueuedThreadPool;

    .line 318
    .line 319
    invoke-static {v1}, Lorg/eclipse/jetty/util/thread/QueuedThreadPool;->access$300(Lorg/eclipse/jetty/util/thread/QueuedThreadPool;)Ljava/util/concurrent/atomic/AtomicInteger;

    .line 320
    .line 321
    .line 322
    move-result-object v1

    .line 323
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 324
    .line 325
    .line 326
    :cond_a
    iget-object p0, p0, Lorg/eclipse/jetty/util/thread/QueuedThreadPool$3;->this$0:Lorg/eclipse/jetty/util/thread/QueuedThreadPool;

    .line 327
    .line 328
    invoke-static {p0}, Lorg/eclipse/jetty/util/thread/QueuedThreadPool;->access$800(Lorg/eclipse/jetty/util/thread/QueuedThreadPool;)Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 329
    .line 330
    .line 331
    move-result-object p0

    .line 332
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 333
    .line 334
    .line 335
    move-result-object v1

    .line 336
    invoke-virtual {p0, v1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->remove(Ljava/lang/Object;)Z

    .line 337
    .line 338
    .line 339
    throw v0
.end method
