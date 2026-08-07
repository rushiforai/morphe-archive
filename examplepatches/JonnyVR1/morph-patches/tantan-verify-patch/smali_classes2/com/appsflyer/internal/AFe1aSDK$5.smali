.class public final Lcom/appsflyer/internal/AFe1aSDK$5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/appsflyer/internal/AFe1aSDK;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field private synthetic getMediationNetwork:Lcom/appsflyer/internal/AFe1aSDK;

.field private synthetic getMonetizationNetwork:Lcom/appsflyer/internal/AFf1wSDK;


# direct methods
.method public constructor <init>(Lcom/appsflyer/internal/AFe1aSDK;Lcom/appsflyer/internal/AFf1wSDK;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/appsflyer/internal/AFe1aSDK$5;->getMediationNetwork:Lcom/appsflyer/internal/AFe1aSDK;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/appsflyer/internal/AFe1aSDK$5;->getMonetizationNetwork:Lcom/appsflyer/internal/AFf1wSDK;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/appsflyer/internal/AFe1aSDK$5;->getMediationNetwork:Lcom/appsflyer/internal/AFe1aSDK;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/appsflyer/internal/AFe1aSDK;->component1:Ljava/util/NavigableSet;

    .line 4
    .line 5
    monitor-enter v0

    .line 6
    :try_start_0
    iget-object v1, p0, Lcom/appsflyer/internal/AFe1aSDK$5;->getMediationNetwork:Lcom/appsflyer/internal/AFe1aSDK;

    .line 7
    .line 8
    iget-object v1, v1, Lcom/appsflyer/internal/AFe1aSDK;->component3:Ljava/util/Set;

    .line 9
    .line 10
    iget-object v2, p0, Lcom/appsflyer/internal/AFe1aSDK$5;->getMonetizationNetwork:Lcom/appsflyer/internal/AFf1wSDK;

    .line 11
    .line 12
    invoke-interface {v1, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    sget-object v1, Lcom/appsflyer/AFLogger;->INSTANCE:Lcom/appsflyer/AFLogger;

    .line 19
    .line 20
    sget-object v2, Lcom/appsflyer/internal/AFg1cSDK;->component1:Lcom/appsflyer/internal/AFg1cSDK;

    .line 21
    .line 22
    new-instance v3, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    const-string v4, "tried to add already running task: "

    .line 25
    .line 26
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Lcom/appsflyer/internal/AFe1aSDK$5;->getMonetizationNetwork:Lcom/appsflyer/internal/AFf1wSDK;

    .line 30
    .line 31
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {v1, v2, p0}, Lcom/appsflyer/internal/AFh1ySDK;->d(Lcom/appsflyer/internal/AFg1cSDK;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    monitor-exit v0

    .line 42
    return-void

    .line 43
    :catchall_0
    move-exception p0

    .line 44
    goto/16 :goto_8

    .line 45
    .line 46
    :cond_0
    iget-object v1, p0, Lcom/appsflyer/internal/AFe1aSDK$5;->getMediationNetwork:Lcom/appsflyer/internal/AFe1aSDK;

    .line 47
    .line 48
    iget-object v1, v1, Lcom/appsflyer/internal/AFe1aSDK;->component1:Ljava/util/NavigableSet;

    .line 49
    .line 50
    iget-object v2, p0, Lcom/appsflyer/internal/AFe1aSDK$5;->getMonetizationNetwork:Lcom/appsflyer/internal/AFf1wSDK;

    .line 51
    .line 52
    invoke-interface {v1, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    if-nez v1, :cond_e

    .line 57
    .line 58
    iget-object v1, p0, Lcom/appsflyer/internal/AFe1aSDK$5;->getMediationNetwork:Lcom/appsflyer/internal/AFe1aSDK;

    .line 59
    .line 60
    iget-object v1, v1, Lcom/appsflyer/internal/AFe1aSDK;->component2:Ljava/util/NavigableSet;

    .line 61
    .line 62
    iget-object v2, p0, Lcom/appsflyer/internal/AFe1aSDK$5;->getMonetizationNetwork:Lcom/appsflyer/internal/AFf1wSDK;

    .line 63
    .line 64
    invoke-interface {v1, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    if-eqz v1, :cond_1

    .line 69
    .line 70
    goto/16 :goto_7

    .line 71
    .line 72
    :cond_1
    iget-object v1, p0, Lcom/appsflyer/internal/AFe1aSDK$5;->getMediationNetwork:Lcom/appsflyer/internal/AFe1aSDK;

    .line 73
    .line 74
    iget-object v2, p0, Lcom/appsflyer/internal/AFe1aSDK$5;->getMonetizationNetwork:Lcom/appsflyer/internal/AFf1wSDK;

    .line 75
    .line 76
    iget-object v3, v2, Lcom/appsflyer/internal/AFf1wSDK;->getMonetizationNetwork:Ljava/util/Set;

    .line 77
    .line 78
    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 79
    .line 80
    .line 81
    move-result-object v3

    .line 82
    :cond_2
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 83
    .line 84
    .line 85
    move-result v4

    .line 86
    if-eqz v4, :cond_3

    .line 87
    .line 88
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object v4

    .line 92
    check-cast v4, Lcom/appsflyer/internal/AFf1zSDK;

    .line 93
    .line 94
    iget-object v5, v1, Lcom/appsflyer/internal/AFe1aSDK;->areAllFieldsValid:Ljava/util/Set;

    .line 95
    .line 96
    invoke-interface {v5, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 97
    .line 98
    .line 99
    move-result v5

    .line 100
    if-eqz v5, :cond_2

    .line 101
    .line 102
    iget-object v5, v2, Lcom/appsflyer/internal/AFf1wSDK;->getCurrencyIso4217Code:Ljava/util/Set;

    .line 103
    .line 104
    invoke-interface {v5, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    goto :goto_0

    .line 108
    :cond_3
    iget-object v1, p0, Lcom/appsflyer/internal/AFe1aSDK$5;->getMediationNetwork:Lcom/appsflyer/internal/AFe1aSDK;

    .line 109
    .line 110
    iget-object v2, p0, Lcom/appsflyer/internal/AFe1aSDK$5;->getMonetizationNetwork:Lcom/appsflyer/internal/AFf1wSDK;

    .line 111
    .line 112
    invoke-static {v1, v2}, Lcom/appsflyer/internal/AFe1aSDK;->AFAdRevenueData(Lcom/appsflyer/internal/AFe1aSDK;Lcom/appsflyer/internal/AFf1wSDK;)Z

    .line 113
    .line 114
    .line 115
    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 116
    iget-object v2, p0, Lcom/appsflyer/internal/AFe1aSDK$5;->getMediationNetwork:Lcom/appsflyer/internal/AFe1aSDK;

    .line 117
    .line 118
    if-eqz v1, :cond_4

    .line 119
    .line 120
    :try_start_1
    iget-object v1, v2, Lcom/appsflyer/internal/AFe1aSDK;->component1:Ljava/util/NavigableSet;

    .line 121
    .line 122
    iget-object v2, p0, Lcom/appsflyer/internal/AFe1aSDK$5;->getMonetizationNetwork:Lcom/appsflyer/internal/AFf1wSDK;

    .line 123
    .line 124
    invoke-interface {v1, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 125
    .line 126
    .line 127
    move-result v1

    .line 128
    goto :goto_1

    .line 129
    :cond_4
    iget-object v1, v2, Lcom/appsflyer/internal/AFe1aSDK;->component2:Ljava/util/NavigableSet;

    .line 130
    .line 131
    iget-object v2, p0, Lcom/appsflyer/internal/AFe1aSDK$5;->getMonetizationNetwork:Lcom/appsflyer/internal/AFf1wSDK;

    .line 132
    .line 133
    invoke-interface {v1, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 134
    .line 135
    .line 136
    move-result v1

    .line 137
    if-eqz v1, :cond_5

    .line 138
    .line 139
    sget-object v2, Lcom/appsflyer/AFLogger;->INSTANCE:Lcom/appsflyer/AFLogger;

    .line 140
    .line 141
    sget-object v3, Lcom/appsflyer/internal/AFg1cSDK;->component1:Lcom/appsflyer/internal/AFg1cSDK;

    .line 142
    .line 143
    new-instance v4, Ljava/lang/StringBuilder;

    .line 144
    .line 145
    const-string v5, "new task was blocked: "

    .line 146
    .line 147
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 148
    .line 149
    .line 150
    iget-object v5, p0, Lcom/appsflyer/internal/AFe1aSDK$5;->getMonetizationNetwork:Lcom/appsflyer/internal/AFf1wSDK;

    .line 151
    .line 152
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 153
    .line 154
    .line 155
    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object v4

    .line 159
    invoke-virtual {v2, v3, v4}, Lcom/appsflyer/internal/AFh1ySDK;->d(Lcom/appsflyer/internal/AFg1cSDK;Ljava/lang/String;)V

    .line 160
    .line 161
    .line 162
    iget-object v2, p0, Lcom/appsflyer/internal/AFe1aSDK$5;->getMonetizationNetwork:Lcom/appsflyer/internal/AFf1wSDK;

    .line 163
    .line 164
    invoke-virtual {v2}, Lcom/appsflyer/internal/AFf1wSDK;->getMediationNetwork()V

    .line 165
    .line 166
    .line 167
    :cond_5
    :goto_1
    if-eqz v1, :cond_6

    .line 168
    .line 169
    iget-object v2, p0, Lcom/appsflyer/internal/AFe1aSDK$5;->getMediationNetwork:Lcom/appsflyer/internal/AFe1aSDK;

    .line 170
    .line 171
    iget-object v3, v2, Lcom/appsflyer/internal/AFe1aSDK;->component1:Ljava/util/NavigableSet;

    .line 172
    .line 173
    iget-object v2, v2, Lcom/appsflyer/internal/AFe1aSDK;->component4:Ljava/util/List;

    .line 174
    .line 175
    invoke-interface {v3, v2}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 176
    .line 177
    .line 178
    iget-object v2, p0, Lcom/appsflyer/internal/AFe1aSDK$5;->getMediationNetwork:Lcom/appsflyer/internal/AFe1aSDK;

    .line 179
    .line 180
    iget-object v2, v2, Lcom/appsflyer/internal/AFe1aSDK;->component4:Ljava/util/List;

    .line 181
    .line 182
    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 183
    .line 184
    .line 185
    goto :goto_2

    .line 186
    :cond_6
    sget-object v2, Lcom/appsflyer/AFLogger;->INSTANCE:Lcom/appsflyer/AFLogger;

    .line 187
    .line 188
    sget-object v3, Lcom/appsflyer/internal/AFg1cSDK;->component1:Lcom/appsflyer/internal/AFg1cSDK;

    .line 189
    .line 190
    new-instance v4, Ljava/lang/StringBuilder;

    .line 191
    .line 192
    const-string v5, "task not added, it\'s already in the queue: "

    .line 193
    .line 194
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 195
    .line 196
    .line 197
    iget-object v5, p0, Lcom/appsflyer/internal/AFe1aSDK$5;->getMonetizationNetwork:Lcom/appsflyer/internal/AFf1wSDK;

    .line 198
    .line 199
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 200
    .line 201
    .line 202
    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 203
    .line 204
    .line 205
    move-result-object v4

    .line 206
    invoke-virtual {v2, v3, v4}, Lcom/appsflyer/internal/AFh1ySDK;->d(Lcom/appsflyer/internal/AFg1cSDK;Ljava/lang/String;)V

    .line 207
    .line 208
    .line 209
    :goto_2
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 210
    if-eqz v1, :cond_d

    .line 211
    .line 212
    iget-object v0, p0, Lcom/appsflyer/internal/AFe1aSDK$5;->getMediationNetwork:Lcom/appsflyer/internal/AFe1aSDK;

    .line 213
    .line 214
    iget-object v0, v0, Lcom/appsflyer/internal/AFe1aSDK;->areAllFieldsValid:Ljava/util/Set;

    .line 215
    .line 216
    iget-object v1, p0, Lcom/appsflyer/internal/AFe1aSDK$5;->getMonetizationNetwork:Lcom/appsflyer/internal/AFf1wSDK;

    .line 217
    .line 218
    iget-object v1, v1, Lcom/appsflyer/internal/AFf1wSDK;->AFAdRevenueData:Lcom/appsflyer/internal/AFf1zSDK;

    .line 219
    .line 220
    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 221
    .line 222
    .line 223
    sget-object v0, Lcom/appsflyer/AFLogger;->INSTANCE:Lcom/appsflyer/AFLogger;

    .line 224
    .line 225
    sget-object v1, Lcom/appsflyer/internal/AFg1cSDK;->component1:Lcom/appsflyer/internal/AFg1cSDK;

    .line 226
    .line 227
    new-instance v2, Ljava/lang/StringBuilder;

    .line 228
    .line 229
    const-string v3, "new task added: "

    .line 230
    .line 231
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 232
    .line 233
    .line 234
    iget-object v3, p0, Lcom/appsflyer/internal/AFe1aSDK$5;->getMonetizationNetwork:Lcom/appsflyer/internal/AFf1wSDK;

    .line 235
    .line 236
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 237
    .line 238
    .line 239
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 240
    .line 241
    .line 242
    move-result-object v2

    .line 243
    invoke-virtual {v0, v1, v2}, Lcom/appsflyer/internal/AFh1ySDK;->d(Lcom/appsflyer/internal/AFg1cSDK;Ljava/lang/String;)V

    .line 244
    .line 245
    .line 246
    iget-object v0, p0, Lcom/appsflyer/internal/AFe1aSDK$5;->getMediationNetwork:Lcom/appsflyer/internal/AFe1aSDK;

    .line 247
    .line 248
    iget-object v0, v0, Lcom/appsflyer/internal/AFe1aSDK;->getCurrencyIso4217Code:Ljava/util/List;

    .line 249
    .line 250
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 251
    .line 252
    .line 253
    move-result-object v0

    .line 254
    :goto_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 255
    .line 256
    .line 257
    move-result v1

    .line 258
    if-eqz v1, :cond_7

    .line 259
    .line 260
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 261
    .line 262
    .line 263
    move-result-object v1

    .line 264
    check-cast v1, Lcom/appsflyer/internal/AFe1eSDK;

    .line 265
    .line 266
    goto :goto_3

    .line 267
    :cond_7
    iget-object v0, p0, Lcom/appsflyer/internal/AFe1aSDK$5;->getMediationNetwork:Lcom/appsflyer/internal/AFe1aSDK;

    .line 268
    .line 269
    iget-object v1, v0, Lcom/appsflyer/internal/AFe1aSDK;->getMonetizationNetwork:Ljava/util/concurrent/ExecutorService;

    .line 270
    .line 271
    new-instance v2, Lcom/appsflyer/internal/AFe1aSDK$2;

    .line 272
    .line 273
    invoke-direct {v2, v0}, Lcom/appsflyer/internal/AFe1aSDK$2;-><init>(Lcom/appsflyer/internal/AFe1aSDK;)V

    .line 274
    .line 275
    .line 276
    invoke-interface {v1, v2}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    .line 277
    .line 278
    .line 279
    iget-object p0, p0, Lcom/appsflyer/internal/AFe1aSDK$5;->getMediationNetwork:Lcom/appsflyer/internal/AFe1aSDK;

    .line 280
    .line 281
    iget-object v0, p0, Lcom/appsflyer/internal/AFe1aSDK;->component1:Ljava/util/NavigableSet;

    .line 282
    .line 283
    monitor-enter v0

    .line 284
    :try_start_2
    iget-object v1, p0, Lcom/appsflyer/internal/AFe1aSDK;->component1:Ljava/util/NavigableSet;

    .line 285
    .line 286
    invoke-interface {v1}, Ljava/util/Set;->size()I

    .line 287
    .line 288
    .line 289
    move-result v1

    .line 290
    iget-object v2, p0, Lcom/appsflyer/internal/AFe1aSDK;->component2:Ljava/util/NavigableSet;

    .line 291
    .line 292
    invoke-interface {v2}, Ljava/util/Set;->size()I

    .line 293
    .line 294
    .line 295
    move-result v2

    .line 296
    add-int/2addr v1, v2

    .line 297
    add-int/lit8 v1, v1, -0x28

    .line 298
    .line 299
    :goto_4
    if-lez v1, :cond_c

    .line 300
    .line 301
    iget-object v2, p0, Lcom/appsflyer/internal/AFe1aSDK;->component2:Ljava/util/NavigableSet;

    .line 302
    .line 303
    invoke-interface {v2}, Ljava/util/Set;->isEmpty()Z

    .line 304
    .line 305
    .line 306
    move-result v2

    .line 307
    iget-object v3, p0, Lcom/appsflyer/internal/AFe1aSDK;->component1:Ljava/util/NavigableSet;

    .line 308
    .line 309
    invoke-interface {v3}, Ljava/util/Set;->isEmpty()Z

    .line 310
    .line 311
    .line 312
    move-result v3

    .line 313
    if-nez v3, :cond_9

    .line 314
    .line 315
    if-nez v2, :cond_9

    .line 316
    .line 317
    iget-object v2, p0, Lcom/appsflyer/internal/AFe1aSDK;->component1:Ljava/util/NavigableSet;

    .line 318
    .line 319
    invoke-interface {v2}, Ljava/util/SortedSet;->first()Ljava/lang/Object;

    .line 320
    .line 321
    .line 322
    move-result-object v2

    .line 323
    check-cast v2, Lcom/appsflyer/internal/AFf1wSDK;

    .line 324
    .line 325
    iget-object v3, p0, Lcom/appsflyer/internal/AFe1aSDK;->component2:Ljava/util/NavigableSet;

    .line 326
    .line 327
    invoke-interface {v3}, Ljava/util/SortedSet;->first()Ljava/lang/Object;

    .line 328
    .line 329
    .line 330
    move-result-object v3

    .line 331
    check-cast v3, Lcom/appsflyer/internal/AFf1wSDK;

    .line 332
    .line 333
    invoke-virtual {v2, v3}, Lcom/appsflyer/internal/AFf1wSDK;->AFAdRevenueData(Lcom/appsflyer/internal/AFf1wSDK;)I

    .line 334
    .line 335
    .line 336
    move-result v2

    .line 337
    if-lez v2, :cond_8

    .line 338
    .line 339
    iget-object v2, p0, Lcom/appsflyer/internal/AFe1aSDK;->component1:Ljava/util/NavigableSet;

    .line 340
    .line 341
    invoke-virtual {p0, v2}, Lcom/appsflyer/internal/AFe1aSDK;->getMonetizationNetwork(Ljava/util/NavigableSet;)V

    .line 342
    .line 343
    .line 344
    goto :goto_5

    .line 345
    :catchall_1
    move-exception p0

    .line 346
    goto :goto_6

    .line 347
    :cond_8
    iget-object v2, p0, Lcom/appsflyer/internal/AFe1aSDK;->component2:Ljava/util/NavigableSet;

    .line 348
    .line 349
    invoke-virtual {p0, v2}, Lcom/appsflyer/internal/AFe1aSDK;->getMonetizationNetwork(Ljava/util/NavigableSet;)V

    .line 350
    .line 351
    .line 352
    goto :goto_5

    .line 353
    :cond_9
    if-nez v3, :cond_a

    .line 354
    .line 355
    iget-object v2, p0, Lcom/appsflyer/internal/AFe1aSDK;->component1:Ljava/util/NavigableSet;

    .line 356
    .line 357
    invoke-virtual {p0, v2}, Lcom/appsflyer/internal/AFe1aSDK;->getMonetizationNetwork(Ljava/util/NavigableSet;)V

    .line 358
    .line 359
    .line 360
    goto :goto_5

    .line 361
    :cond_a
    if-nez v2, :cond_b

    .line 362
    .line 363
    iget-object v2, p0, Lcom/appsflyer/internal/AFe1aSDK;->component2:Ljava/util/NavigableSet;

    .line 364
    .line 365
    invoke-virtual {p0, v2}, Lcom/appsflyer/internal/AFe1aSDK;->getMonetizationNetwork(Ljava/util/NavigableSet;)V

    .line 366
    .line 367
    .line 368
    :cond_b
    :goto_5
    add-int/lit8 v1, v1, -0x1

    .line 369
    .line 370
    goto :goto_4

    .line 371
    :cond_c
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 372
    return-void

    .line 373
    :goto_6
    monitor-exit v0

    .line 374
    throw p0

    .line 375
    :cond_d
    sget-object v0, Lcom/appsflyer/AFLogger;->INSTANCE:Lcom/appsflyer/AFLogger;

    .line 376
    .line 377
    sget-object v1, Lcom/appsflyer/internal/AFg1cSDK;->component1:Lcom/appsflyer/internal/AFg1cSDK;

    .line 378
    .line 379
    new-instance v2, Ljava/lang/StringBuilder;

    .line 380
    .line 381
    const-string v3, "QUEUE: tried to add already pending task: "

    .line 382
    .line 383
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 384
    .line 385
    .line 386
    iget-object p0, p0, Lcom/appsflyer/internal/AFe1aSDK$5;->getMonetizationNetwork:Lcom/appsflyer/internal/AFf1wSDK;

    .line 387
    .line 388
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 389
    .line 390
    .line 391
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 392
    .line 393
    .line 394
    move-result-object p0

    .line 395
    invoke-virtual {v0, v1, p0}, Lcom/appsflyer/internal/AFh1ySDK;->w(Lcom/appsflyer/internal/AFg1cSDK;Ljava/lang/String;)V

    .line 396
    .line 397
    .line 398
    return-void

    .line 399
    :cond_e
    :goto_7
    :try_start_3
    sget-object v1, Lcom/appsflyer/AFLogger;->INSTANCE:Lcom/appsflyer/AFLogger;

    .line 400
    .line 401
    sget-object v2, Lcom/appsflyer/internal/AFg1cSDK;->component1:Lcom/appsflyer/internal/AFg1cSDK;

    .line 402
    .line 403
    new-instance v3, Ljava/lang/StringBuilder;

    .line 404
    .line 405
    const-string v4, "tried to add already scheduled task: "

    .line 406
    .line 407
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 408
    .line 409
    .line 410
    iget-object p0, p0, Lcom/appsflyer/internal/AFe1aSDK$5;->getMonetizationNetwork:Lcom/appsflyer/internal/AFf1wSDK;

    .line 411
    .line 412
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 413
    .line 414
    .line 415
    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 416
    .line 417
    .line 418
    move-result-object p0

    .line 419
    invoke-virtual {v1, v2, p0}, Lcom/appsflyer/internal/AFh1ySDK;->d(Lcom/appsflyer/internal/AFg1cSDK;Ljava/lang/String;)V

    .line 420
    .line 421
    .line 422
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 423
    return-void

    .line 424
    :goto_8
    monitor-exit v0

    .line 425
    throw p0
.end method
