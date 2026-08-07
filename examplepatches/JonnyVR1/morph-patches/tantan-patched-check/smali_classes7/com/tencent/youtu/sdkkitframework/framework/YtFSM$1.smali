.class public Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->start(Ljava/lang/String;Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKKitFrameworkWorkMode;IJII)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

.field public final synthetic val$orientation:I

.field public final synthetic val$rearCameraTAG:I

.field public final synthetic val$threadPriority:I

.field public final synthetic val$updateTimeoutMs:J


# direct methods
.method public constructor <init>(Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;IIIJ)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$1;->this$0:Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 2
    .line 3
    iput p2, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$1;->val$threadPriority:I

    .line 4
    .line 5
    iput p3, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$1;->val$orientation:I

    .line 6
    .line 7
    iput p4, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$1;->val$rearCameraTAG:I

    .line 8
    .line 9
    iput-wide p5, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$1;->val$updateTimeoutMs:J

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .line 1
    iget v0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$1;->val$threadPriority:I

    .line 2
    .line 3
    invoke-static {v0}, Landroid/os/Process;->setThreadPriority(I)V

    .line 4
    .line 5
    .line 6
    :cond_0
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$1;->this$0:Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->access$000(Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_f

    .line 13
    .line 14
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$1;->this$0:Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->access$100(Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_d

    .line 21
    .line 22
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$1;->this$0:Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 23
    .line 24
    invoke-static {v0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->access$200(Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;)Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->isEmpty()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iget-object v1, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$1;->this$0:Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 33
    .line 34
    const/4 v2, 0x1

    .line 35
    const/4 v3, 0x0

    .line 36
    if-nez v0, :cond_5

    .line 37
    .line 38
    invoke-static {v1}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->access$200(Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;)Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->poll()Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    instance-of v1, v0, Ljava/lang/String;

    .line 47
    .line 48
    if-eqz v1, :cond_4

    .line 49
    .line 50
    check-cast v0, Ljava/lang/String;

    .line 51
    .line 52
    const-string v1, "reset"

    .line 53
    .line 54
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-eqz v0, :cond_1

    .line 59
    .line 60
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$1;->this$0:Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 61
    .line 62
    invoke-static {v0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->access$300(Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;)Ljava/util/Map;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    if-eqz v1, :cond_2

    .line 79
    .line 80
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    check-cast v1, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;

    .line 85
    .line 86
    invoke-virtual {v1}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->reset()V

    .line 87
    .line 88
    .line 89
    goto :goto_1

    .line 90
    :cond_2
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$1;->this$0:Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 91
    .line 92
    invoke-static {v0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->access$300(Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;)Ljava/util/Map;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    iget-object v1, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$1;->this$0:Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 97
    .line 98
    invoke-static {v1}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->access$400(Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;)Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    if-eqz v0, :cond_3

    .line 107
    .line 108
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->access$500()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    new-instance v1, Ljava/lang/StringBuilder;

    .line 113
    .line 114
    const-string v3, "reset set current state:"

    .line 115
    .line 116
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    iget-object v3, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$1;->this$0:Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 120
    .line 121
    invoke-static {v3}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->access$400(Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;)Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v3

    .line 125
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    invoke-static {v0, v1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 133
    .line 134
    .line 135
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$1;->this$0:Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 136
    .line 137
    invoke-static {v0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->access$300(Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;)Ljava/util/Map;

    .line 138
    .line 139
    .line 140
    move-result-object v1

    .line 141
    iget-object v3, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$1;->this$0:Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 142
    .line 143
    invoke-static {v3}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->access$400(Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;)Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object v3

    .line 147
    invoke-interface {v1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 148
    .line 149
    .line 150
    move-result-object v1

    .line 151
    check-cast v1, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;

    .line 152
    .line 153
    invoke-static {v0, v1}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->access$602(Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;)Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;

    .line 154
    .line 155
    .line 156
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$1;->this$0:Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 157
    .line 158
    invoke-static {v0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->access$600(Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;)Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    invoke-virtual {v0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->enter()V

    .line 163
    .line 164
    .line 165
    goto :goto_2

    .line 166
    :cond_3
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->access$500()Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object v0

    .line 170
    new-instance v1, Ljava/lang/StringBuilder;

    .line 171
    .line 172
    const-string v4, "reset failed: "

    .line 173
    .line 174
    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 175
    .line 176
    .line 177
    iget-object v4, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$1;->this$0:Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 178
    .line 179
    invoke-static {v4}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->access$400(Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;)Ljava/lang/String;

    .line 180
    .line 181
    .line 182
    move-result-object v4

    .line 183
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 184
    .line 185
    .line 186
    const-string v4, " state is not found"

    .line 187
    .line 188
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 189
    .line 190
    .line 191
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 192
    .line 193
    .line 194
    move-result-object v1

    .line 195
    invoke-static {v0, v1, v3}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 196
    .line 197
    .line 198
    :goto_2
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$1;->this$0:Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 199
    .line 200
    invoke-static {v0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->access$700(Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;)Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 201
    .line 202
    .line 203
    move-result-object v0

    .line 204
    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->clear()V

    .line 205
    .line 206
    .line 207
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$1;->this$0:Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 208
    .line 209
    invoke-static {v0, v2}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->access$802(Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;Z)Z

    .line 210
    .line 211
    .line 212
    goto/16 :goto_0

    .line 213
    .line 214
    :cond_4
    instance-of v1, v0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$YtFSMFireEventData;

    .line 215
    .line 216
    if-eqz v1, :cond_1

    .line 217
    .line 218
    check-cast v0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$YtFSMFireEventData;

    .line 219
    .line 220
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->access$500()Ljava/lang/String;

    .line 221
    .line 222
    .line 223
    move-result-object v1

    .line 224
    new-instance v2, Ljava/lang/StringBuilder;

    .line 225
    .line 226
    const-string v3, "handleevent "

    .line 227
    .line 228
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 229
    .line 230
    .line 231
    iget-object v3, v0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$YtFSMFireEventData;->eventType:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtFrameworkFireEventType;

    .line 232
    .line 233
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 234
    .line 235
    .line 236
    const-string v3, " for all states"

    .line 237
    .line 238
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 239
    .line 240
    .line 241
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 242
    .line 243
    .line 244
    move-result-object v2

    .line 245
    invoke-static {v1, v2}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 246
    .line 247
    .line 248
    iget-object v1, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$1;->this$0:Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 249
    .line 250
    invoke-static {v1}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->access$300(Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;)Ljava/util/Map;

    .line 251
    .line 252
    .line 253
    move-result-object v1

    .line 254
    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 255
    .line 256
    .line 257
    move-result-object v1

    .line 258
    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 259
    .line 260
    .line 261
    move-result-object v1

    .line 262
    :goto_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 263
    .line 264
    .line 265
    move-result v2

    .line 266
    if-eqz v2, :cond_1

    .line 267
    .line 268
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 269
    .line 270
    .line 271
    move-result-object v2

    .line 272
    check-cast v2, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;

    .line 273
    .line 274
    iget-object v3, v0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$YtFSMFireEventData;->eventType:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtFrameworkFireEventType;

    .line 275
    .line 276
    iget-object v4, v0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$YtFSMFireEventData;->extraData:Ljava/lang/Object;

    .line 277
    .line 278
    invoke-virtual {v2, v3, v4}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->handleEvent(Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtFrameworkFireEventType;Ljava/lang/Object;)V

    .line 279
    .line 280
    .line 281
    goto :goto_3

    .line 282
    :cond_5
    :try_start_0
    invoke-static {v1}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->access$900(Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;)Ljava/util/concurrent/locks/Lock;

    .line 283
    .line 284
    .line 285
    move-result-object v0

    .line 286
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 287
    .line 288
    .line 289
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$1;->this$0:Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 290
    .line 291
    invoke-static {v0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->access$1000(Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;)Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$YtFSMUpdateStrategy;

    .line 292
    .line 293
    .line 294
    move-result-object v0

    .line 295
    sget-object v1, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$YtFSMUpdateStrategy;->CacheStrategy:Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$YtFSMUpdateStrategy;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 296
    .line 297
    iget-object v4, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$1;->this$0:Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 298
    .line 299
    if-ne v0, v1, :cond_6

    .line 300
    .line 301
    :try_start_1
    invoke-static {v4}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->access$700(Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;)Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 302
    .line 303
    .line 304
    move-result-object v0

    .line 305
    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->poll()Ljava/lang/Object;

    .line 306
    .line 307
    .line 308
    move-result-object v0

    .line 309
    move-object v3, v0

    .line 310
    check-cast v3, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$YtFSMUpdateData;

    .line 311
    .line 312
    goto :goto_5

    .line 313
    :catchall_0
    move-exception v0

    .line 314
    goto/16 :goto_8

    .line 315
    .line 316
    :cond_6
    invoke-static {v4}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->access$1000(Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;)Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$YtFSMUpdateStrategy;

    .line 317
    .line 318
    .line 319
    move-result-object v0

    .line 320
    sget-object v1, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$YtFSMUpdateStrategy;->NoCacheStrategy:Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$YtFSMUpdateStrategy;

    .line 321
    .line 322
    if-ne v0, v1, :cond_7

    .line 323
    .line 324
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->access$500()Ljava/lang/String;

    .line 325
    .line 326
    .line 327
    move-result-object v0

    .line 328
    new-instance v1, Ljava/lang/StringBuilder;

    .line 329
    .line 330
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 331
    .line 332
    .line 333
    const-string v4, "no cache str size:"

    .line 334
    .line 335
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 336
    .line 337
    .line 338
    iget-object v4, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$1;->this$0:Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 339
    .line 340
    invoke-static {v4}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->access$700(Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;)Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 341
    .line 342
    .line 343
    move-result-object v4

    .line 344
    invoke-virtual {v4}, Ljava/util/concurrent/ConcurrentLinkedQueue;->size()I

    .line 345
    .line 346
    .line 347
    move-result v4

    .line 348
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 349
    .line 350
    .line 351
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 352
    .line 353
    .line 354
    move-result-object v1

    .line 355
    invoke-static {v0, v1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 356
    .line 357
    .line 358
    :goto_4
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$1;->this$0:Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 359
    .line 360
    invoke-static {v0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->access$700(Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;)Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 361
    .line 362
    .line 363
    move-result-object v0

    .line 364
    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->size()I

    .line 365
    .line 366
    .line 367
    move-result v0

    .line 368
    if-lez v0, :cond_8

    .line 369
    .line 370
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$1;->this$0:Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 371
    .line 372
    invoke-static {v0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->access$700(Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;)Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 373
    .line 374
    .line 375
    move-result-object v0

    .line 376
    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->poll()Ljava/lang/Object;

    .line 377
    .line 378
    .line 379
    move-result-object v0

    .line 380
    move-object v3, v0

    .line 381
    check-cast v3, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$YtFSMUpdateData;

    .line 382
    .line 383
    goto :goto_4

    .line 384
    :cond_7
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->access$500()Ljava/lang/String;

    .line 385
    .line 386
    .line 387
    move-result-object v0

    .line 388
    new-instance v1, Ljava/lang/StringBuilder;

    .line 389
    .line 390
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 391
    .line 392
    .line 393
    const-string v4, "unknown strategy "

    .line 394
    .line 395
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 396
    .line 397
    .line 398
    iget-object v4, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$1;->this$0:Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 399
    .line 400
    invoke-static {v4}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->access$1000(Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;)Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$YtFSMUpdateStrategy;

    .line 401
    .line 402
    .line 403
    move-result-object v4

    .line 404
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 405
    .line 406
    .line 407
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 408
    .line 409
    .line 410
    move-result-object v1

    .line 411
    invoke-static {v0, v1, v3}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 412
    .line 413
    .line 414
    :cond_8
    :goto_5
    if-eqz v3, :cond_c

    .line 415
    .line 416
    iget v0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$1;->val$orientation:I

    .line 417
    .line 418
    if-ne v0, v2, :cond_9

    .line 419
    .line 420
    invoke-virtual {v3}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$YtFSMUpdateData;->mirror()V

    .line 421
    .line 422
    .line 423
    :cond_9
    iget v0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$1;->val$orientation:I

    .line 424
    .line 425
    if-nez v0, :cond_a

    .line 426
    .line 427
    iget v1, v3, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$YtFSMUpdateData;->imageWidth:I

    .line 428
    .line 429
    goto :goto_6

    .line 430
    :cond_a
    iget v1, v3, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$YtFSMUpdateData;->imageHeight:I

    .line 431
    .line 432
    :goto_6
    if-nez v0, :cond_b

    .line 433
    .line 434
    iget v0, v3, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$YtFSMUpdateData;->imageHeight:I

    .line 435
    .line 436
    goto :goto_7

    .line 437
    :cond_b
    iget v0, v3, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$YtFSMUpdateData;->imageWidth:I

    .line 438
    .line 439
    :goto_7
    iget-object v2, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$1;->this$0:Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 440
    .line 441
    iget-object v4, v3, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$YtFSMUpdateData;->imageData:[B

    .line 442
    .line 443
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 444
    .line 445
    .line 446
    move-result-object v5

    .line 447
    invoke-virtual {v5}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getContext()Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKPlatformContext;

    .line 448
    .line 449
    .line 450
    move-result-object v5

    .line 451
    iget v5, v5, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKPlatformContext;->currentRotateState:I

    .line 452
    .line 453
    iget v6, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$1;->val$rearCameraTAG:I

    .line 454
    .line 455
    invoke-static {v4, v1, v0, v5, v6}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool;->yuvRotateAnd2bgrImge([BIIII)Lcom/tencent/youtu/sdkkitframework/common/YTImageData;

    .line 456
    .line 457
    .line 458
    move-result-object v0

    .line 459
    invoke-static {v2, v0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->access$1102(Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;Lcom/tencent/youtu/sdkkitframework/common/YTImageData;)Lcom/tencent/youtu/sdkkitframework/common/YTImageData;

    .line 460
    .line 461
    .line 462
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$1;->this$0:Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 463
    .line 464
    invoke-static {v0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->access$1100(Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;)Lcom/tencent/youtu/sdkkitframework/common/YTImageData;

    .line 465
    .line 466
    .line 467
    move-result-object v0

    .line 468
    iget-wide v1, v3, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$YtFSMUpdateData;->timeStamp:J

    .line 469
    .line 470
    iput-wide v1, v0, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;->timeStamp:J

    .line 471
    .line 472
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$1;->this$0:Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 473
    .line 474
    invoke-static {v0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->access$600(Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;)Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;

    .line 475
    .line 476
    .line 477
    move-result-object v0

    .line 478
    if-eqz v0, :cond_c

    .line 479
    .line 480
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$1;->this$0:Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 481
    .line 482
    invoke-static {v0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->access$600(Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;)Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;

    .line 483
    .line 484
    .line 485
    move-result-object v0

    .line 486
    iget-object v1, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$1;->this$0:Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 487
    .line 488
    invoke-static {v1}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->access$1100(Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;)Lcom/tencent/youtu/sdkkitframework/common/YTImageData;

    .line 489
    .line 490
    .line 491
    move-result-object v1

    .line 492
    iget-object v2, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$1;->this$0:Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 493
    .line 494
    invoke-static {v2}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->access$1100(Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;)Lcom/tencent/youtu/sdkkitframework/common/YTImageData;

    .line 495
    .line 496
    .line 497
    move-result-object v2

    .line 498
    iget-wide v2, v2, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;->timeStamp:J

    .line 499
    .line 500
    invoke-virtual {v0, v1, v2, v3}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->update(Lcom/tencent/youtu/sdkkitframework/common/YTImageData;J)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 501
    .line 502
    .line 503
    :cond_c
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$1;->this$0:Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 504
    .line 505
    invoke-static {v0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->access$900(Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;)Ljava/util/concurrent/locks/Lock;

    .line 506
    .line 507
    .line 508
    move-result-object v0

    .line 509
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 510
    .line 511
    .line 512
    goto :goto_9

    .line 513
    :goto_8
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$1;->this$0:Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 514
    .line 515
    invoke-static {p0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->access$900(Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;)Ljava/util/concurrent/locks/Lock;

    .line 516
    .line 517
    .line 518
    move-result-object p0

    .line 519
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 520
    .line 521
    .line 522
    throw v0

    .line 523
    :cond_d
    :goto_9
    const-wide/16 v0, 0x2

    .line 524
    .line 525
    :try_start_2
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0

    .line 526
    .line 527
    .line 528
    goto :goto_a

    .line 529
    :catch_0
    move-exception v0

    .line 530
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->access$500()Ljava/lang/String;

    .line 531
    .line 532
    .line 533
    move-result-object v1

    .line 534
    const-string v2, "sleep failed"

    .line 535
    .line 536
    invoke-static {v1, v2, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 537
    .line 538
    .line 539
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/common/OperateInfoManager;->getInstance()Lcom/tencent/youtu/sdkkitframework/common/OperateInfoManager;

    .line 540
    .line 541
    .line 542
    move-result-object v1

    .line 543
    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 544
    .line 545
    .line 546
    move-result-object v0

    .line 547
    invoke-virtual {v1, v0}, Lcom/tencent/youtu/sdkkitframework/common/OperateInfoManager;->setCatchErrorData(Ljava/lang/String;)V

    .line 548
    .line 549
    .line 550
    :goto_a
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$1;->this$0:Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 551
    .line 552
    invoke-static {v0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->access$600(Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;)Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;

    .line 553
    .line 554
    .line 555
    move-result-object v0

    .line 556
    if-eqz v0, :cond_e

    .line 557
    .line 558
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$1;->this$0:Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 559
    .line 560
    invoke-static {v0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->access$600(Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;)Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;

    .line 561
    .line 562
    .line 563
    move-result-object v0

    .line 564
    invoke-virtual {v0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->getStateSimpleName()Ljava/lang/String;

    .line 565
    .line 566
    .line 567
    move-result-object v0

    .line 568
    const-string v1, "ReqResult"

    .line 569
    .line 570
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 571
    .line 572
    .line 573
    move-result v0

    .line 574
    if-eqz v0, :cond_e

    .line 575
    .line 576
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$1;->this$0:Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 577
    .line 578
    const/4 v1, 0x0

    .line 579
    invoke-static {v0, v1}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->access$802(Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;Z)Z

    .line 580
    .line 581
    .line 582
    :cond_e
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$1;->this$0:Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 583
    .line 584
    invoke-static {v0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->access$800(Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;)Z

    .line 585
    .line 586
    .line 587
    move-result v0

    .line 588
    if-eqz v0, :cond_0

    .line 589
    .line 590
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$1;->this$0:Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 591
    .line 592
    invoke-static {v0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->access$1200(Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;)J

    .line 593
    .line 594
    .line 595
    move-result-wide v0

    .line 596
    const-wide/16 v2, 0x0

    .line 597
    .line 598
    cmp-long v0, v0, v2

    .line 599
    .line 600
    if-lez v0, :cond_0

    .line 601
    .line 602
    iget-wide v0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$1;->val$updateTimeoutMs:J

    .line 603
    .line 604
    cmp-long v0, v0, v2

    .line 605
    .line 606
    if-lez v0, :cond_0

    .line 607
    .line 608
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 609
    .line 610
    .line 611
    move-result-wide v0

    .line 612
    iget-object v2, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$1;->this$0:Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 613
    .line 614
    invoke-static {v2}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->access$1200(Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;)J

    .line 615
    .line 616
    .line 617
    move-result-wide v2

    .line 618
    iget-wide v4, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$1;->val$updateTimeoutMs:J

    .line 619
    .line 620
    add-long/2addr v2, v4

    .line 621
    cmp-long v0, v0, v2

    .line 622
    .line 623
    if-lez v0, :cond_0

    .line 624
    .line 625
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 626
    .line 627
    .line 628
    move-result-object v0

    .line 629
    new-instance v1, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$1$1;

    .line 630
    .line 631
    invoke-direct {v1, p0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$1$1;-><init>(Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$1;)V

    .line 632
    .line 633
    .line 634
    invoke-virtual {v0, v1}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->sendFSMEvent(Ljava/util/HashMap;)V

    .line 635
    .line 636
    .line 637
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 638
    .line 639
    .line 640
    move-result-object p0

    .line 641
    sget-object v0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;->IDLE_STATE:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;

    .line 642
    .line 643
    invoke-static {v0}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper;->classNameOfState(Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;)Ljava/lang/String;

    .line 644
    .line 645
    .line 646
    move-result-object v0

    .line 647
    invoke-virtual {p0, v0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->transitNow(Ljava/lang/String;)I

    .line 648
    .line 649
    .line 650
    :cond_f
    return-void
.end method
