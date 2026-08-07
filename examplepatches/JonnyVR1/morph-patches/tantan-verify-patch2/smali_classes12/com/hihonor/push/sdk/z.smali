.class public Lcom/hihonor/push/sdk/z;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Handler$Callback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/hihonor/push/sdk/z$b;,
        Lcom/hihonor/push/sdk/z$a;
    }
.end annotation


# static fields
.field public static final c:Lcom/hihonor/push/sdk/z;


# instance fields
.field public final a:Landroid/os/Handler;

.field public final b:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/hihonor/push/sdk/w;",
            "Lcom/hihonor/push/sdk/z$a;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/hihonor/push/sdk/z;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/hihonor/push/sdk/z;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/hihonor/push/sdk/z;->c:Lcom/hihonor/push/sdk/z;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    .line 5
    .line 6
    const/high16 v1, 0x3f400000    # 0.75f

    .line 7
    .line 8
    const/4 v2, 0x1

    .line 9
    const/4 v3, 0x5

    .line 10
    invoke-direct {v0, v3, v1, v2}, Ljava/util/concurrent/ConcurrentHashMap;-><init>(IFI)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/hihonor/push/sdk/z;->b:Ljava/util/Map;

    .line 14
    .line 15
    new-instance v0, Landroid/os/HandlerThread;

    .line 16
    .line 17
    const-string v1, "HonorApiManager"

    .line 18
    .line 19
    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 23
    .line 24
    .line 25
    new-instance v1, Landroid/os/Handler;

    .line 26
    .line 27
    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-direct {v1, v0, p0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;)V

    .line 32
    .line 33
    .line 34
    iput-object v1, p0, Lcom/hihonor/push/sdk/z;->a:Landroid/os/Handler;

    .line 35
    .line 36
    return-void
.end method


# virtual methods
.method public a(Lcom/hihonor/push/sdk/f1;)Lcom/hihonor/push/sdk/a1;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TResult:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/hihonor/push/sdk/f1<",
            "TTResult;>;)",
            "Lcom/hihonor/push/sdk/a1;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/hihonor/push/sdk/n0;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/hihonor/push/sdk/n0;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p1, Lcom/hihonor/push/sdk/f1;->a:Lcom/hihonor/push/sdk/n0;

    .line 7
    .line 8
    iget-object p0, p0, Lcom/hihonor/push/sdk/z;->a:Landroid/os/Handler;

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    invoke-virtual {p0, v1, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 16
    .line 17
    .line 18
    iget-object p0, v0, Lcom/hihonor/push/sdk/n0;->a:Lcom/hihonor/push/sdk/a1;

    .line 19
    .line 20
    return-object p0
.end method

.method public handleMessage(Landroid/os/Message;)Z
    .locals 7

    .line 1
    iget v0, p1, Landroid/os/Message;->what:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, v1, :cond_b

    .line 5
    .line 6
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast p1, Lcom/hihonor/push/sdk/f1;

    .line 9
    .line 10
    iget-object v0, p1, Lcom/hihonor/push/sdk/f1;->d:Lcom/hihonor/push/sdk/w;

    .line 11
    .line 12
    iget-object v2, p0, Lcom/hihonor/push/sdk/z;->b:Ljava/util/Map;

    .line 13
    .line 14
    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    check-cast v2, Lcom/hihonor/push/sdk/z$a;

    .line 19
    .line 20
    if-nez v2, :cond_0

    .line 21
    .line 22
    new-instance v2, Lcom/hihonor/push/sdk/z$a;

    .line 23
    .line 24
    invoke-direct {v2, p0, v0}, Lcom/hihonor/push/sdk/z$a;-><init>(Lcom/hihonor/push/sdk/z;Lcom/hihonor/push/sdk/w;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/hihonor/push/sdk/z;->b:Ljava/util/Map;

    .line 28
    .line 29
    invoke-interface {p0, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    :cond_0
    monitor-enter v2

    .line 33
    :try_start_0
    iget-object p0, v2, Lcom/hihonor/push/sdk/z$a;->f:Lcom/hihonor/push/sdk/z;

    .line 34
    .line 35
    iget-object p0, p0, Lcom/hihonor/push/sdk/z;->a:Landroid/os/Handler;

    .line 36
    .line 37
    invoke-static {p0}, Lcom/hihonor/push/sdk/b;->a(Landroid/os/Handler;)V

    .line 38
    .line 39
    .line 40
    iget-object p0, v2, Lcom/hihonor/push/sdk/z$a;->c:Lcom/hihonor/push/sdk/b0;

    .line 41
    .line 42
    check-cast p0, Lcom/hihonor/push/sdk/d0;

    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/hihonor/push/sdk/d0;->a()Z

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    if-eqz p0, :cond_1

    .line 49
    .line 50
    invoke-virtual {v2, p1}, Lcom/hihonor/push/sdk/z$a;->a(Lcom/hihonor/push/sdk/f1;)V

    .line 51
    .line 52
    .line 53
    goto/16 :goto_5

    .line 54
    .line 55
    :catchall_0
    move-exception p0

    .line 56
    goto/16 :goto_7

    .line 57
    .line 58
    :cond_1
    iget-object p0, v2, Lcom/hihonor/push/sdk/z$a;->a:Ljava/util/Queue;

    .line 59
    .line 60
    invoke-interface {p0, p1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    iget-object p0, v2, Lcom/hihonor/push/sdk/z$a;->d:Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

    .line 64
    .line 65
    if-eqz p0, :cond_2

    .line 66
    .line 67
    invoke-virtual {p0}, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;->getErrorCode()I

    .line 68
    .line 69
    .line 70
    move-result p0

    .line 71
    if-eqz p0, :cond_2

    .line 72
    .line 73
    iget-object p0, v2, Lcom/hihonor/push/sdk/z$a;->d:Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

    .line 74
    .line 75
    invoke-virtual {v2, p0}, Lcom/hihonor/push/sdk/z$a;->a(Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;)V

    .line 76
    .line 77
    .line 78
    goto/16 :goto_5

    .line 79
    .line 80
    :cond_2
    monitor-enter v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 81
    :try_start_1
    iget-object p0, v2, Lcom/hihonor/push/sdk/z$a;->f:Lcom/hihonor/push/sdk/z;

    .line 82
    .line 83
    iget-object p0, p0, Lcom/hihonor/push/sdk/z;->a:Landroid/os/Handler;

    .line 84
    .line 85
    invoke-static {p0}, Lcom/hihonor/push/sdk/b;->a(Landroid/os/Handler;)V

    .line 86
    .line 87
    .line 88
    iget-object p0, v2, Lcom/hihonor/push/sdk/z$a;->c:Lcom/hihonor/push/sdk/b0;

    .line 89
    .line 90
    check-cast p0, Lcom/hihonor/push/sdk/d0;

    .line 91
    .line 92
    invoke-virtual {p0}, Lcom/hihonor/push/sdk/d0;->a()Z

    .line 93
    .line 94
    .line 95
    move-result p0

    .line 96
    if-eqz p0, :cond_3

    .line 97
    .line 98
    goto/16 :goto_4

    .line 99
    .line 100
    :cond_3
    iget-object p0, v2, Lcom/hihonor/push/sdk/z$a;->c:Lcom/hihonor/push/sdk/b0;

    .line 101
    .line 102
    check-cast p0, Lcom/hihonor/push/sdk/d0;

    .line 103
    .line 104
    iget-object p0, p0, Lcom/hihonor/push/sdk/d0;->a:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 105
    .line 106
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 107
    .line 108
    .line 109
    move-result p0

    .line 110
    const/4 p1, 0x5

    .line 111
    if-ne p0, p1, :cond_4

    .line 112
    .line 113
    goto/16 :goto_4

    .line 114
    .line 115
    :cond_4
    iget-object p0, v2, Lcom/hihonor/push/sdk/z$a;->c:Lcom/hihonor/push/sdk/b0;

    .line 116
    .line 117
    check-cast p0, Lcom/hihonor/push/sdk/d0;

    .line 118
    .line 119
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 120
    .line 121
    .line 122
    iget-object v0, p0, Lcom/hihonor/push/sdk/d0;->a:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 123
    .line 124
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 125
    .line 126
    .line 127
    move-result v0

    .line 128
    const/4 v3, 0x3

    .line 129
    if-eq v0, v3, :cond_a

    .line 130
    .line 131
    if-eq v0, p1, :cond_a

    .line 132
    .line 133
    const/4 v3, 0x4

    .line 134
    if-eq v0, v3, :cond_a

    .line 135
    .line 136
    sget-object v0, Lcom/hihonor/push/sdk/l;->e:Lcom/hihonor/push/sdk/l;

    .line 137
    .line 138
    invoke-virtual {v0}, Lcom/hihonor/push/sdk/l;->a()Landroid/content/Context;

    .line 139
    .line 140
    .line 141
    move-result-object v3

    .line 142
    invoke-static {v3}, Lcom/hihonor/push/sdk/b;->b(Landroid/content/Context;)I

    .line 143
    .line 144
    .line 145
    move-result v3

    .line 146
    sget-object v4, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;->SUCCESS:Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

    .line 147
    .line 148
    invoke-virtual {v4}, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;->getErrorCode()I

    .line 149
    .line 150
    .line 151
    move-result v4

    .line 152
    if-ne v3, v4, :cond_9

    .line 153
    .line 154
    iget-object v3, p0, Lcom/hihonor/push/sdk/d0;->a:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 155
    .line 156
    invoke-virtual {v3, p1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 157
    .line 158
    .line 159
    invoke-virtual {v0}, Lcom/hihonor/push/sdk/l;->a()Landroid/content/Context;

    .line 160
    .line 161
    .line 162
    move-result-object p1

    .line 163
    invoke-static {p1}, Lcom/hihonor/push/sdk/b;->a(Landroid/content/Context;)Lcom/hihonor/push/sdk/bean/RemoteServiceBean;

    .line 164
    .line 165
    .line 166
    move-result-object p1

    .line 167
    new-instance v3, Lcom/hihonor/push/sdk/f0;

    .line 168
    .line 169
    invoke-direct {v3, p1}, Lcom/hihonor/push/sdk/f0;-><init>(Lcom/hihonor/push/sdk/bean/RemoteServiceBean;)V

    .line 170
    .line 171
    .line 172
    iput-object v3, p0, Lcom/hihonor/push/sdk/d0;->d:Lcom/hihonor/push/sdk/f0;

    .line 173
    .line 174
    new-instance v4, Lcom/hihonor/push/sdk/c0;

    .line 175
    .line 176
    invoke-direct {v4, p0}, Lcom/hihonor/push/sdk/c0;-><init>(Lcom/hihonor/push/sdk/d0;)V

    .line 177
    .line 178
    .line 179
    iput-object v4, v3, Lcom/hihonor/push/sdk/f0;->b:Lcom/hihonor/push/sdk/f0$a;

    .line 180
    .line 181
    invoke-virtual {p1}, Lcom/hihonor/push/sdk/bean/RemoteServiceBean;->checkServiceInfo()Z

    .line 182
    .line 183
    .line 184
    move-result p0

    .line 185
    if-nez p0, :cond_5

    .line 186
    .line 187
    iget-object p0, v3, Lcom/hihonor/push/sdk/f0;->a:Lcom/hihonor/push/sdk/bean/RemoteServiceBean;

    .line 188
    .line 189
    invoke-static {p0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 190
    .line 191
    .line 192
    const p0, 0x7a19d4

    .line 193
    .line 194
    .line 195
    invoke-virtual {v3, p0}, Lcom/hihonor/push/sdk/f0;->a(I)V

    .line 196
    .line 197
    .line 198
    goto/16 :goto_4

    .line 199
    .line 200
    :catchall_1
    move-exception p0

    .line 201
    goto :goto_6

    .line 202
    :cond_5
    new-instance p0, Landroid/content/Intent;

    .line 203
    .line 204
    invoke-direct {p0}, Landroid/content/Intent;-><init>()V

    .line 205
    .line 206
    .line 207
    iget-object p1, v3, Lcom/hihonor/push/sdk/f0;->a:Lcom/hihonor/push/sdk/bean/RemoteServiceBean;

    .line 208
    .line 209
    invoke-virtual {p1}, Lcom/hihonor/push/sdk/bean/RemoteServiceBean;->getPackageName()Ljava/lang/String;

    .line 210
    .line 211
    .line 212
    move-result-object p1

    .line 213
    iget-object v4, v3, Lcom/hihonor/push/sdk/f0;->a:Lcom/hihonor/push/sdk/bean/RemoteServiceBean;

    .line 214
    .line 215
    invoke-virtual {v4}, Lcom/hihonor/push/sdk/bean/RemoteServiceBean;->getPackageAction()Ljava/lang/String;

    .line 216
    .line 217
    .line 218
    move-result-object v4

    .line 219
    iget-object v5, v3, Lcom/hihonor/push/sdk/f0;->a:Lcom/hihonor/push/sdk/bean/RemoteServiceBean;

    .line 220
    .line 221
    invoke-virtual {v5}, Lcom/hihonor/push/sdk/bean/RemoteServiceBean;->getPackageServiceName()Ljava/lang/String;

    .line 222
    .line 223
    .line 224
    move-result-object v5

    .line 225
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 226
    .line 227
    .line 228
    move-result v6

    .line 229
    if-nez v6, :cond_6

    .line 230
    .line 231
    new-instance v4, Landroid/content/ComponentName;

    .line 232
    .line 233
    invoke-direct {v4, p1, v5}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 234
    .line 235
    .line 236
    invoke-virtual {p0, v4}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 237
    .line 238
    .line 239
    goto :goto_0

    .line 240
    :cond_6
    invoke-virtual {p0, v4}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 241
    .line 242
    .line 243
    invoke-virtual {p0, p1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 244
    .line 245
    .line 246
    :goto_0
    sget-object p1, Lcom/hihonor/push/sdk/f0;->e:Ljava/lang/Object;

    .line 247
    .line 248
    monitor-enter p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 249
    :try_start_2
    invoke-virtual {v0}, Lcom/hihonor/push/sdk/l;->a()Landroid/content/Context;

    .line 250
    .line 251
    .line 252
    move-result-object v0

    .line 253
    invoke-virtual {v0, p0, v3, v1}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    .line 254
    .line 255
    .line 256
    move-result p0

    .line 257
    if-eqz p0, :cond_8

    .line 258
    .line 259
    iget-object p0, v3, Lcom/hihonor/push/sdk/f0;->c:Landroid/os/Handler;

    .line 260
    .line 261
    const/16 v0, 0x3e9

    .line 262
    .line 263
    if-eqz p0, :cond_7

    .line 264
    .line 265
    invoke-virtual {p0, v0}, Landroid/os/Handler;->removeMessages(I)V

    .line 266
    .line 267
    .line 268
    goto :goto_1

    .line 269
    :catchall_2
    move-exception p0

    .line 270
    goto :goto_3

    .line 271
    :cond_7
    new-instance p0, Landroid/os/Handler;

    .line 272
    .line 273
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 274
    .line 275
    .line 276
    move-result-object v4

    .line 277
    new-instance v5, Lcom/hihonor/push/sdk/e0;

    .line 278
    .line 279
    invoke-direct {v5, v3}, Lcom/hihonor/push/sdk/e0;-><init>(Lcom/hihonor/push/sdk/f0;)V

    .line 280
    .line 281
    .line 282
    invoke-direct {p0, v4, v5}, Landroid/os/Handler;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;)V

    .line 283
    .line 284
    .line 285
    iput-object p0, v3, Lcom/hihonor/push/sdk/f0;->c:Landroid/os/Handler;

    .line 286
    .line 287
    :goto_1
    iget-object p0, v3, Lcom/hihonor/push/sdk/f0;->c:Landroid/os/Handler;

    .line 288
    .line 289
    const-wide/16 v3, 0x2710

    .line 290
    .line 291
    invoke-virtual {p0, v0, v3, v4}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 292
    .line 293
    .line 294
    goto :goto_2

    .line 295
    :cond_8
    iput-boolean v1, v3, Lcom/hihonor/push/sdk/f0;->d:Z

    .line 296
    .line 297
    const p0, 0x7a19d1

    .line 298
    .line 299
    .line 300
    invoke-virtual {v3, p0}, Lcom/hihonor/push/sdk/f0;->a(I)V

    .line 301
    .line 302
    .line 303
    :goto_2
    monitor-exit p1

    .line 304
    goto :goto_4

    .line 305
    :goto_3
    monitor-exit p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 306
    :try_start_3
    throw p0

    .line 307
    :cond_9
    invoke-virtual {p0, v3}, Lcom/hihonor/push/sdk/d0;->a(I)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 308
    .line 309
    .line 310
    :cond_a
    :goto_4
    :try_start_4
    monitor-exit v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 311
    :goto_5
    monitor-exit v2

    .line 312
    return v1

    .line 313
    :goto_6
    :try_start_5
    monitor-exit v2

    .line 314
    throw p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 315
    :goto_7
    monitor-exit v2

    .line 316
    throw p0

    .line 317
    :cond_b
    const/4 v2, 0x2

    .line 318
    if-ne v0, v2, :cond_f

    .line 319
    .line 320
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 321
    .line 322
    check-cast p1, Lcom/hihonor/push/sdk/f1;

    .line 323
    .line 324
    iget-object v0, p1, Lcom/hihonor/push/sdk/f1;->d:Lcom/hihonor/push/sdk/w;

    .line 325
    .line 326
    if-eqz v0, :cond_e

    .line 327
    .line 328
    iget-object v2, p0, Lcom/hihonor/push/sdk/z;->b:Ljava/util/Map;

    .line 329
    .line 330
    invoke-interface {v2, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 331
    .line 332
    .line 333
    move-result v2

    .line 334
    if-eqz v2, :cond_e

    .line 335
    .line 336
    iget-object p0, p0, Lcom/hihonor/push/sdk/z;->b:Ljava/util/Map;

    .line 337
    .line 338
    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 339
    .line 340
    .line 341
    move-result-object p0

    .line 342
    check-cast p0, Lcom/hihonor/push/sdk/z$a;

    .line 343
    .line 344
    if-eqz p0, :cond_e

    .line 345
    .line 346
    monitor-enter p0

    .line 347
    :try_start_6
    iget-object v0, p0, Lcom/hihonor/push/sdk/z$a;->b:Ljava/util/Queue;

    .line 348
    .line 349
    invoke-interface {v0, p1}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    .line 350
    .line 351
    .line 352
    iget-object p1, p0, Lcom/hihonor/push/sdk/z$a;->a:Ljava/util/Queue;

    .line 353
    .line 354
    invoke-interface {p1}, Ljava/util/Queue;->peek()Ljava/lang/Object;

    .line 355
    .line 356
    .line 357
    move-result-object p1

    .line 358
    if-eqz p1, :cond_c

    .line 359
    .line 360
    iget-object p1, p0, Lcom/hihonor/push/sdk/z$a;->b:Ljava/util/Queue;

    .line 361
    .line 362
    invoke-interface {p1}, Ljava/util/Queue;->peek()Ljava/lang/Object;

    .line 363
    .line 364
    .line 365
    move-result-object p1

    .line 366
    if-nez p1, :cond_d

    .line 367
    .line 368
    goto :goto_8

    .line 369
    :catchall_3
    move-exception p1

    .line 370
    goto :goto_9

    .line 371
    :cond_c
    :goto_8
    invoke-virtual {p0}, Lcom/hihonor/push/sdk/z$a;->a()V

    .line 372
    .line 373
    .line 374
    iget-object p1, p0, Lcom/hihonor/push/sdk/z$a;->f:Lcom/hihonor/push/sdk/z;

    .line 375
    .line 376
    iget-object p1, p1, Lcom/hihonor/push/sdk/z;->b:Ljava/util/Map;

    .line 377
    .line 378
    iget-object v0, p0, Lcom/hihonor/push/sdk/z$a;->e:Lcom/hihonor/push/sdk/w;

    .line 379
    .line 380
    invoke-interface {p1, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    .line 381
    .line 382
    .line 383
    :cond_d
    monitor-exit p0

    .line 384
    goto :goto_a

    .line 385
    :goto_9
    monitor-exit p0

    .line 386
    throw p1

    .line 387
    :cond_e
    :goto_a
    return v1

    .line 388
    :cond_f
    const/4 p0, 0x0

    .line 389
    return p0
.end method
