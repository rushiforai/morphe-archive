.class Lcom/cosmos/photon/push/channel/inner/ClientWorker$1;
.super Ljava/lang/Thread;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cosmos/photon/push/channel/inner/ClientWorker;->sendMessage(Ljava/lang/String;Ljava/lang/String;ILjava/lang/StringBuilder;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic val$address:Ljava/lang/String;

.field final synthetic val$builder:Ljava/lang/StringBuilder;

.field final synthetic val$condition:Ljava/util/concurrent/locks/Condition;

.field final synthetic val$isSuccess:Ljava/util/concurrent/atomic/AtomicBoolean;

.field final synthetic val$lock:Ljava/util/concurrent/locks/Lock;

.field final synthetic val$message:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/StringBuilder;Ljava/util/concurrent/atomic/AtomicBoolean;Ljava/util/concurrent/locks/Lock;Ljava/util/concurrent/locks/Condition;)V
    .locals 0

    .line 1
    iput-object p2, p0, Lcom/cosmos/photon/push/channel/inner/ClientWorker$1;->val$address:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p3, p0, Lcom/cosmos/photon/push/channel/inner/ClientWorker$1;->val$message:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p4, p0, Lcom/cosmos/photon/push/channel/inner/ClientWorker$1;->val$builder:Ljava/lang/StringBuilder;

    .line 6
    .line 7
    iput-object p5, p0, Lcom/cosmos/photon/push/channel/inner/ClientWorker$1;->val$isSuccess:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 8
    .line 9
    iput-object p6, p0, Lcom/cosmos/photon/push/channel/inner/ClientWorker$1;->val$lock:Ljava/util/concurrent/locks/Lock;

    .line 10
    .line 11
    iput-object p7, p0, Lcom/cosmos/photon/push/channel/inner/ClientWorker$1;->val$condition:Ljava/util/concurrent/locks/Condition;

    .line 12
    .line 13
    invoke-direct {p0, p1}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    .line 1
    const-string v0, "MoPush-Channel"

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    :try_start_0
    new-instance v3, Landroid/net/LocalSocket;

    .line 6
    .line 7
    invoke-direct {v3}, Landroid/net/LocalSocket;-><init>()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_4
    .catchall {:try_start_0 .. :try_end_0} :catchall_5

    .line 8
    .line 9
    .line 10
    :try_start_1
    new-instance v4, Landroid/net/LocalSocketAddress;

    .line 11
    .line 12
    iget-object v5, p0, Lcom/cosmos/photon/push/channel/inner/ClientWorker$1;->val$address:Ljava/lang/String;

    .line 13
    .line 14
    invoke-direct {v4, v5}, Landroid/net/LocalSocketAddress;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v3, v4}, Landroid/net/LocalSocket;->connect(Landroid/net/LocalSocketAddress;)V

    .line 18
    .line 19
    .line 20
    const/16 v4, 0x3e8

    .line 21
    .line 22
    invoke-virtual {v3, v4}, Landroid/net/LocalSocket;->setSoTimeout(I)V

    .line 23
    .line 24
    .line 25
    const-string v4, "send:-------->\n %s"

    .line 26
    .line 27
    iget-object v5, p0, Lcom/cosmos/photon/push/channel/inner/ClientWorker$1;->val$message:Ljava/lang/String;

    .line 28
    .line 29
    filled-new-array {v5}, [Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v5

    .line 33
    invoke-static {v0, v4, v5}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    new-instance v4, Ljava/io/PrintWriter;

    .line 37
    .line 38
    invoke-virtual {v3}, Landroid/net/LocalSocket;->getOutputStream()Ljava/io/OutputStream;

    .line 39
    .line 40
    .line 41
    move-result-object v5

    .line 42
    invoke-direct {v4, v5}, Ljava/io/PrintWriter;-><init>(Ljava/io/OutputStream;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_3
    .catchall {:try_start_1 .. :try_end_1} :catchall_4

    .line 43
    .line 44
    .line 45
    :try_start_2
    iget-object v5, p0, Lcom/cosmos/photon/push/channel/inner/ClientWorker$1;->val$message:Ljava/lang/String;

    .line 46
    .line 47
    invoke-virtual {v4, v5}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v4}, Ljava/io/PrintWriter;->flush()V

    .line 51
    .line 52
    .line 53
    new-instance v5, Ljava/io/BufferedReader;

    .line 54
    .line 55
    new-instance v6, Ljava/io/InputStreamReader;

    .line 56
    .line 57
    invoke-virtual {v3}, Landroid/net/LocalSocket;->getInputStream()Ljava/io/InputStream;

    .line 58
    .line 59
    .line 60
    move-result-object v7

    .line 61
    invoke-direct {v6, v7}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 62
    .line 63
    .line 64
    invoke-direct {v5, v6}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_3

    .line 65
    .line 66
    .line 67
    :try_start_3
    invoke-virtual {v5}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 72
    .line 73
    .line 74
    move-result v6

    .line 75
    if-nez v6, :cond_0

    .line 76
    .line 77
    iget-object v6, p0, Lcom/cosmos/photon/push/channel/inner/ClientWorker$1;->val$builder:Ljava/lang/StringBuilder;

    .line 78
    .line 79
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    goto :goto_1

    .line 83
    :catchall_0
    move-exception v1

    .line 84
    :goto_0
    move-object v2, v3

    .line 85
    goto/16 :goto_b

    .line 86
    .line 87
    :catch_0
    move-exception v2

    .line 88
    goto :goto_5

    .line 89
    :cond_0
    :goto_1
    iget-object v2, p0, Lcom/cosmos/photon/push/channel/inner/ClientWorker$1;->val$isSuccess:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 90
    .line 91
    invoke-virtual {v2, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 92
    .line 93
    .line 94
    iget-object v1, p0, Lcom/cosmos/photon/push/channel/inner/ClientWorker$1;->val$lock:Ljava/util/concurrent/locks/Lock;

    .line 95
    .line 96
    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 97
    .line 98
    .line 99
    :try_start_4
    iget-object v1, p0, Lcom/cosmos/photon/push/channel/inner/ClientWorker$1;->val$condition:Ljava/util/concurrent/locks/Condition;

    .line 100
    .line 101
    invoke-interface {v1}, Ljava/util/concurrent/locks/Condition;->signalAll()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 102
    .line 103
    .line 104
    :goto_2
    iget-object p0, p0, Lcom/cosmos/photon/push/channel/inner/ClientWorker$1;->val$lock:Ljava/util/concurrent/locks/Lock;

    .line 105
    .line 106
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 107
    .line 108
    .line 109
    goto :goto_3

    .line 110
    :catchall_1
    move-exception v1

    .line 111
    :try_start_5
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 112
    .line 113
    .line 114
    goto :goto_2

    .line 115
    :goto_3
    :try_start_6
    invoke-virtual {v3}, Landroid/net/LocalSocket;->close()V

    .line 116
    .line 117
    .line 118
    invoke-virtual {v4}, Ljava/io/PrintWriter;->close()V

    .line 119
    .line 120
    .line 121
    :goto_4
    invoke-virtual {v5}, Ljava/io/BufferedReader;->close()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1

    .line 122
    .line 123
    .line 124
    goto/16 :goto_a

    .line 125
    .line 126
    :catch_1
    move-exception p0

    .line 127
    invoke-static {v0, p0}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 128
    .line 129
    .line 130
    goto/16 :goto_a

    .line 131
    .line 132
    :catchall_2
    move-exception v0

    .line 133
    iget-object p0, p0, Lcom/cosmos/photon/push/channel/inner/ClientWorker$1;->val$lock:Ljava/util/concurrent/locks/Lock;

    .line 134
    .line 135
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 136
    .line 137
    .line 138
    throw v0

    .line 139
    :catchall_3
    move-exception v1

    .line 140
    move-object v5, v2

    .line 141
    goto :goto_0

    .line 142
    :catch_2
    move-exception v5

    .line 143
    move-object v8, v5

    .line 144
    move-object v5, v2

    .line 145
    move-object v2, v8

    .line 146
    goto :goto_5

    .line 147
    :catchall_4
    move-exception v1

    .line 148
    move-object v4, v2

    .line 149
    move-object v5, v4

    .line 150
    goto :goto_0

    .line 151
    :catch_3
    move-exception v4

    .line 152
    move-object v5, v2

    .line 153
    move-object v2, v4

    .line 154
    move-object v4, v5

    .line 155
    goto :goto_5

    .line 156
    :catchall_5
    move-exception v1

    .line 157
    move-object v4, v2

    .line 158
    move-object v5, v4

    .line 159
    goto/16 :goto_b

    .line 160
    .line 161
    :catch_4
    move-exception v3

    .line 162
    move-object v4, v2

    .line 163
    move-object v5, v4

    .line 164
    move-object v2, v3

    .line 165
    move-object v3, v5

    .line 166
    :goto_5
    :try_start_7
    const-string v6, "Permission denied"

    .line 167
    .line 168
    invoke-virtual {v2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object v7

    .line 172
    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 173
    .line 174
    .line 175
    move-result v6

    .line 176
    if-nez v6, :cond_2

    .line 177
    .line 178
    const-string v6, "already connected"

    .line 179
    .line 180
    invoke-virtual {v2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object v7

    .line 184
    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 185
    .line 186
    .line 187
    move-result v6

    .line 188
    if-eqz v6, :cond_1

    .line 189
    .line 190
    goto :goto_6

    .line 191
    :cond_1
    const-string v6, "Connection refused"

    .line 192
    .line 193
    invoke-virtual {v2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object v7

    .line 197
    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 198
    .line 199
    .line 200
    move-result v6

    .line 201
    if-eqz v6, :cond_3

    .line 202
    .line 203
    iget-object v6, p0, Lcom/cosmos/photon/push/channel/inner/ClientWorker$1;->val$isSuccess:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 204
    .line 205
    invoke-virtual {v6, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 206
    .line 207
    .line 208
    goto :goto_7

    .line 209
    :cond_2
    :goto_6
    iget-object v1, p0, Lcom/cosmos/photon/push/channel/inner/ClientWorker$1;->val$isSuccess:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 210
    .line 211
    const/4 v6, 0x0

    .line 212
    invoke-virtual {v1, v6}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 213
    .line 214
    .line 215
    :cond_3
    :goto_7
    invoke-virtual {v2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 216
    .line 217
    .line 218
    move-result-object v1

    .line 219
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 220
    .line 221
    .line 222
    iget-object v1, p0, Lcom/cosmos/photon/push/channel/inner/ClientWorker$1;->val$lock:Ljava/util/concurrent/locks/Lock;

    .line 223
    .line 224
    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 225
    .line 226
    .line 227
    :try_start_8
    iget-object v1, p0, Lcom/cosmos/photon/push/channel/inner/ClientWorker$1;->val$condition:Ljava/util/concurrent/locks/Condition;

    .line 228
    .line 229
    invoke-interface {v1}, Ljava/util/concurrent/locks/Condition;->signalAll()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_6

    .line 230
    .line 231
    .line 232
    :goto_8
    iget-object p0, p0, Lcom/cosmos/photon/push/channel/inner/ClientWorker$1;->val$lock:Ljava/util/concurrent/locks/Lock;

    .line 233
    .line 234
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 235
    .line 236
    .line 237
    goto :goto_9

    .line 238
    :catchall_6
    move-exception v1

    .line 239
    :try_start_9
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_7

    .line 240
    .line 241
    .line 242
    goto :goto_8

    .line 243
    :goto_9
    if-eqz v3, :cond_4

    .line 244
    .line 245
    :try_start_a
    invoke-virtual {v3}, Landroid/net/LocalSocket;->close()V

    .line 246
    .line 247
    .line 248
    :cond_4
    if-eqz v4, :cond_5

    .line 249
    .line 250
    invoke-virtual {v4}, Ljava/io/PrintWriter;->close()V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_1

    .line 251
    .line 252
    .line 253
    :cond_5
    if-eqz v5, :cond_6

    .line 254
    .line 255
    goto/16 :goto_4

    .line 256
    .line 257
    :cond_6
    :goto_a
    return-void

    .line 258
    :catchall_7
    move-exception v0

    .line 259
    iget-object p0, p0, Lcom/cosmos/photon/push/channel/inner/ClientWorker$1;->val$lock:Ljava/util/concurrent/locks/Lock;

    .line 260
    .line 261
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 262
    .line 263
    .line 264
    throw v0

    .line 265
    :goto_b
    iget-object v3, p0, Lcom/cosmos/photon/push/channel/inner/ClientWorker$1;->val$lock:Ljava/util/concurrent/locks/Lock;

    .line 266
    .line 267
    invoke-interface {v3}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 268
    .line 269
    .line 270
    :try_start_b
    iget-object v3, p0, Lcom/cosmos/photon/push/channel/inner/ClientWorker$1;->val$condition:Ljava/util/concurrent/locks/Condition;

    .line 271
    .line 272
    invoke-interface {v3}, Ljava/util/concurrent/locks/Condition;->signalAll()V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_8

    .line 273
    .line 274
    .line 275
    :goto_c
    iget-object p0, p0, Lcom/cosmos/photon/push/channel/inner/ClientWorker$1;->val$lock:Ljava/util/concurrent/locks/Lock;

    .line 276
    .line 277
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 278
    .line 279
    .line 280
    goto :goto_d

    .line 281
    :catchall_8
    move-exception v3

    .line 282
    :try_start_c
    invoke-static {v0, v3}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_9

    .line 283
    .line 284
    .line 285
    goto :goto_c

    .line 286
    :goto_d
    if-eqz v2, :cond_7

    .line 287
    .line 288
    :try_start_d
    invoke-virtual {v2}, Landroid/net/LocalSocket;->close()V

    .line 289
    .line 290
    .line 291
    goto :goto_e

    .line 292
    :catch_5
    move-exception p0

    .line 293
    goto :goto_f

    .line 294
    :cond_7
    :goto_e
    if-eqz v4, :cond_8

    .line 295
    .line 296
    invoke-virtual {v4}, Ljava/io/PrintWriter;->close()V

    .line 297
    .line 298
    .line 299
    :cond_8
    if-eqz v5, :cond_9

    .line 300
    .line 301
    invoke-virtual {v5}, Ljava/io/BufferedReader;->close()V
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_5

    .line 302
    .line 303
    .line 304
    goto :goto_10

    .line 305
    :goto_f
    invoke-static {v0, p0}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 306
    .line 307
    .line 308
    :cond_9
    :goto_10
    throw v1

    .line 309
    :catchall_9
    move-exception v0

    .line 310
    iget-object p0, p0, Lcom/cosmos/photon/push/channel/inner/ClientWorker$1;->val$lock:Ljava/util/concurrent/locks/Lock;

    .line 311
    .line 312
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 313
    .line 314
    .line 315
    throw v0
.end method
