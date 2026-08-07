.class Lio/agora/base/internal/video/HardwareVideoEncoder$5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/agora/base/internal/video/HardwareVideoEncoder;->releaseInternal()Lio/agora/base/internal/video/VideoCodecStatus;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable<",
        "Lio/agora/base/internal/video/VideoCodecStatus;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;


# direct methods
.method public constructor <init>(Lio/agora/base/internal/video/HardwareVideoEncoder;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$5;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public call()Lio/agora/base/internal/video/VideoCodecStatus;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    const-string v0, "HardwareVideoEncoder"

    .line 2
    .line 3
    iget-object v1, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$5;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 4
    .line 5
    invoke-static {v1}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$000(Lio/agora/base/internal/video/HardwareVideoEncoder;)Ljava/util/concurrent/locks/ReentrantLock;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 10
    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    const/4 v2, 0x0

    .line 14
    :try_start_0
    const-string v3, "stop media encoder..."

    .line 15
    .line 16
    invoke-static {v0, v3}, Lio/agora/base/internal/Logging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    iget-object v3, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$5;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 20
    .line 21
    invoke-static {v3}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$100(Lio/agora/base/internal/video/HardwareVideoEncoder;)Lio/agora/base/internal/video/MediaCodecWrapper;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    invoke-interface {v3}, Lio/agora/base/internal/video/MediaCodecWrapper;->stop()V

    .line 26
    .line 27
    .line 28
    const-string v3, "release media encoder..."

    .line 29
    .line 30
    invoke-static {v0, v3}, Lio/agora/base/internal/Logging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    iget-object v3, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$5;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 34
    .line 35
    invoke-static {v3}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$100(Lio/agora/base/internal/video/HardwareVideoEncoder;)Lio/agora/base/internal/video/MediaCodecWrapper;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    invoke-interface {v3}, Lio/agora/base/internal/video/MediaCodecWrapper;->release()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 40
    .line 41
    .line 42
    iget-object v3, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$5;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 43
    .line 44
    invoke-static {v3}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$800(Lio/agora/base/internal/video/HardwareVideoEncoder;)Lio/agora/base/internal/video/GlRectDrawer;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    invoke-virtual {v3}, Lio/agora/base/internal/video/GlGenericDrawer;->release()V

    .line 49
    .line 50
    .line 51
    iget-object v3, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$5;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 52
    .line 53
    invoke-static {v3}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$900(Lio/agora/base/internal/video/HardwareVideoEncoder;)Lio/agora/base/internal/video/VideoFrameDrawer;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    invoke-virtual {v3}, Lio/agora/base/internal/video/VideoFrameDrawer;->release()V

    .line 58
    .line 59
    .line 60
    iget-object v3, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$5;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 61
    .line 62
    invoke-static {v3}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$600(Lio/agora/base/internal/video/HardwareVideoEncoder;)Lio/agora/base/internal/video/EglBase;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    if-eqz v3, :cond_0

    .line 67
    .line 68
    iget-object v3, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$5;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 69
    .line 70
    invoke-static {v3}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$600(Lio/agora/base/internal/video/HardwareVideoEncoder;)Lio/agora/base/internal/video/EglBase;

    .line 71
    .line 72
    .line 73
    move-result-object v3

    .line 74
    invoke-interface {v3}, Lio/agora/base/internal/video/EglBase;->release()V

    .line 75
    .line 76
    .line 77
    iget-object v3, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$5;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 78
    .line 79
    invoke-static {v3, v2}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$602(Lio/agora/base/internal/video/HardwareVideoEncoder;Lio/agora/base/internal/video/EglBase;)Lio/agora/base/internal/video/EglBase;

    .line 80
    .line 81
    .line 82
    :cond_0
    iget-object v3, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$5;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 83
    .line 84
    invoke-static {v3}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$700(Lio/agora/base/internal/video/HardwareVideoEncoder;)Landroid/view/Surface;

    .line 85
    .line 86
    .line 87
    move-result-object v3

    .line 88
    if-eqz v3, :cond_1

    .line 89
    .line 90
    iget-object v3, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$5;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 91
    .line 92
    invoke-static {v3}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$700(Lio/agora/base/internal/video/HardwareVideoEncoder;)Landroid/view/Surface;

    .line 93
    .line 94
    .line 95
    move-result-object v3

    .line 96
    invoke-virtual {v3}, Landroid/view/Surface;->release()V

    .line 97
    .line 98
    .line 99
    iget-object v3, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$5;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 100
    .line 101
    invoke-static {v3, v2}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$702(Lio/agora/base/internal/video/HardwareVideoEncoder;Landroid/view/Surface;)Landroid/view/Surface;

    .line 102
    .line 103
    .line 104
    :cond_1
    iget-object v3, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$5;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 105
    .line 106
    invoke-static {v3, v2}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$102(Lio/agora/base/internal/video/HardwareVideoEncoder;Lio/agora/base/internal/video/MediaCodecWrapper;)Lio/agora/base/internal/video/MediaCodecWrapper;

    .line 107
    .line 108
    .line 109
    iget-object v3, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$5;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 110
    .line 111
    invoke-static {v3, v1}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$1002(Lio/agora/base/internal/video/HardwareVideoEncoder;I)I

    .line 112
    .line 113
    .line 114
    iget-object v1, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$5;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 115
    .line 116
    invoke-static {v1, v2}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$1102(Lio/agora/base/internal/video/HardwareVideoEncoder;Ljava/lang/Thread;)Ljava/lang/Thread;

    .line 117
    .line 118
    .line 119
    iget-object v1, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$5;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 120
    .line 121
    invoke-static {v1, v2}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$1202(Lio/agora/base/internal/video/HardwareVideoEncoder;Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 122
    .line 123
    .line 124
    iget-object v1, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$5;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 125
    .line 126
    invoke-static {v1}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$1300(Lio/agora/base/internal/video/HardwareVideoEncoder;)Ljava/util/concurrent/BlockingDeque;

    .line 127
    .line 128
    .line 129
    move-result-object v1

    .line 130
    invoke-interface {v1}, Ljava/util/Collection;->clear()V

    .line 131
    .line 132
    .line 133
    iget-object v1, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$5;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 134
    .line 135
    invoke-static {v1}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$1400(Lio/agora/base/internal/video/HardwareVideoEncoder;)Ljava/util/Queue;

    .line 136
    .line 137
    .line 138
    move-result-object v1

    .line 139
    invoke-interface {v1}, Ljava/util/Collection;->clear()V

    .line 140
    .line 141
    .line 142
    iget-object v1, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$5;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 143
    .line 144
    invoke-static {v1}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$1500(Lio/agora/base/internal/video/HardwareVideoEncoder;)Ljava/util/Map;

    .line 145
    .line 146
    .line 147
    move-result-object v1

    .line 148
    invoke-interface {v1}, Ljava/util/Map;->clear()V

    .line 149
    .line 150
    .line 151
    iget-object p0, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$5;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 152
    .line 153
    invoke-static {p0}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$000(Lio/agora/base/internal/video/HardwareVideoEncoder;)Ljava/util/concurrent/locks/ReentrantLock;

    .line 154
    .line 155
    .line 156
    move-result-object p0

    .line 157
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 158
    .line 159
    .line 160
    const-string p0, "release media encoder done"

    .line 161
    .line 162
    invoke-static {v0, p0}, Lio/agora/base/internal/Logging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 163
    .line 164
    .line 165
    sget-object p0, Lio/agora/base/internal/video/VideoCodecStatus;->OK:Lio/agora/base/internal/video/VideoCodecStatus;

    .line 166
    .line 167
    return-object p0

    .line 168
    :catchall_0
    move-exception v0

    .line 169
    goto/16 :goto_0

    .line 170
    .line 171
    :catch_0
    move-exception v3

    .line 172
    :try_start_1
    const-string v4, "Media encoder release failed"

    .line 173
    .line 174
    invoke-static {v0, v4, v3}, Lio/agora/base/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 175
    .line 176
    .line 177
    sget-object v0, Lio/agora/base/internal/video/VideoCodecStatus;->ERROR:Lio/agora/base/internal/video/VideoCodecStatus;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 178
    .line 179
    iget-object v3, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$5;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 180
    .line 181
    invoke-static {v3}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$800(Lio/agora/base/internal/video/HardwareVideoEncoder;)Lio/agora/base/internal/video/GlRectDrawer;

    .line 182
    .line 183
    .line 184
    move-result-object v3

    .line 185
    invoke-virtual {v3}, Lio/agora/base/internal/video/GlGenericDrawer;->release()V

    .line 186
    .line 187
    .line 188
    iget-object v3, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$5;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 189
    .line 190
    invoke-static {v3}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$900(Lio/agora/base/internal/video/HardwareVideoEncoder;)Lio/agora/base/internal/video/VideoFrameDrawer;

    .line 191
    .line 192
    .line 193
    move-result-object v3

    .line 194
    invoke-virtual {v3}, Lio/agora/base/internal/video/VideoFrameDrawer;->release()V

    .line 195
    .line 196
    .line 197
    iget-object v3, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$5;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 198
    .line 199
    invoke-static {v3}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$600(Lio/agora/base/internal/video/HardwareVideoEncoder;)Lio/agora/base/internal/video/EglBase;

    .line 200
    .line 201
    .line 202
    move-result-object v3

    .line 203
    if-eqz v3, :cond_2

    .line 204
    .line 205
    iget-object v3, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$5;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 206
    .line 207
    invoke-static {v3}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$600(Lio/agora/base/internal/video/HardwareVideoEncoder;)Lio/agora/base/internal/video/EglBase;

    .line 208
    .line 209
    .line 210
    move-result-object v3

    .line 211
    invoke-interface {v3}, Lio/agora/base/internal/video/EglBase;->release()V

    .line 212
    .line 213
    .line 214
    iget-object v3, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$5;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 215
    .line 216
    invoke-static {v3, v2}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$602(Lio/agora/base/internal/video/HardwareVideoEncoder;Lio/agora/base/internal/video/EglBase;)Lio/agora/base/internal/video/EglBase;

    .line 217
    .line 218
    .line 219
    :cond_2
    iget-object v3, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$5;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 220
    .line 221
    invoke-static {v3}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$700(Lio/agora/base/internal/video/HardwareVideoEncoder;)Landroid/view/Surface;

    .line 222
    .line 223
    .line 224
    move-result-object v3

    .line 225
    if-eqz v3, :cond_3

    .line 226
    .line 227
    iget-object v3, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$5;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 228
    .line 229
    invoke-static {v3}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$700(Lio/agora/base/internal/video/HardwareVideoEncoder;)Landroid/view/Surface;

    .line 230
    .line 231
    .line 232
    move-result-object v3

    .line 233
    invoke-virtual {v3}, Landroid/view/Surface;->release()V

    .line 234
    .line 235
    .line 236
    iget-object v3, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$5;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 237
    .line 238
    invoke-static {v3, v2}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$702(Lio/agora/base/internal/video/HardwareVideoEncoder;Landroid/view/Surface;)Landroid/view/Surface;

    .line 239
    .line 240
    .line 241
    :cond_3
    iget-object v3, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$5;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 242
    .line 243
    invoke-static {v3, v2}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$102(Lio/agora/base/internal/video/HardwareVideoEncoder;Lio/agora/base/internal/video/MediaCodecWrapper;)Lio/agora/base/internal/video/MediaCodecWrapper;

    .line 244
    .line 245
    .line 246
    iget-object v3, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$5;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 247
    .line 248
    invoke-static {v3, v1}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$1002(Lio/agora/base/internal/video/HardwareVideoEncoder;I)I

    .line 249
    .line 250
    .line 251
    iget-object v1, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$5;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 252
    .line 253
    invoke-static {v1, v2}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$1102(Lio/agora/base/internal/video/HardwareVideoEncoder;Ljava/lang/Thread;)Ljava/lang/Thread;

    .line 254
    .line 255
    .line 256
    iget-object v1, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$5;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 257
    .line 258
    invoke-static {v1, v2}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$1202(Lio/agora/base/internal/video/HardwareVideoEncoder;Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 259
    .line 260
    .line 261
    iget-object v1, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$5;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 262
    .line 263
    invoke-static {v1}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$1300(Lio/agora/base/internal/video/HardwareVideoEncoder;)Ljava/util/concurrent/BlockingDeque;

    .line 264
    .line 265
    .line 266
    move-result-object v1

    .line 267
    invoke-interface {v1}, Ljava/util/Collection;->clear()V

    .line 268
    .line 269
    .line 270
    iget-object v1, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$5;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 271
    .line 272
    invoke-static {v1}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$1400(Lio/agora/base/internal/video/HardwareVideoEncoder;)Ljava/util/Queue;

    .line 273
    .line 274
    .line 275
    move-result-object v1

    .line 276
    invoke-interface {v1}, Ljava/util/Collection;->clear()V

    .line 277
    .line 278
    .line 279
    iget-object v1, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$5;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 280
    .line 281
    invoke-static {v1}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$1500(Lio/agora/base/internal/video/HardwareVideoEncoder;)Ljava/util/Map;

    .line 282
    .line 283
    .line 284
    move-result-object v1

    .line 285
    invoke-interface {v1}, Ljava/util/Map;->clear()V

    .line 286
    .line 287
    .line 288
    iget-object p0, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$5;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 289
    .line 290
    invoke-static {p0}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$000(Lio/agora/base/internal/video/HardwareVideoEncoder;)Ljava/util/concurrent/locks/ReentrantLock;

    .line 291
    .line 292
    .line 293
    move-result-object p0

    .line 294
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 295
    .line 296
    .line 297
    return-object v0

    .line 298
    :goto_0
    iget-object v3, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$5;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 299
    .line 300
    invoke-static {v3}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$800(Lio/agora/base/internal/video/HardwareVideoEncoder;)Lio/agora/base/internal/video/GlRectDrawer;

    .line 301
    .line 302
    .line 303
    move-result-object v3

    .line 304
    invoke-virtual {v3}, Lio/agora/base/internal/video/GlGenericDrawer;->release()V

    .line 305
    .line 306
    .line 307
    iget-object v3, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$5;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 308
    .line 309
    invoke-static {v3}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$900(Lio/agora/base/internal/video/HardwareVideoEncoder;)Lio/agora/base/internal/video/VideoFrameDrawer;

    .line 310
    .line 311
    .line 312
    move-result-object v3

    .line 313
    invoke-virtual {v3}, Lio/agora/base/internal/video/VideoFrameDrawer;->release()V

    .line 314
    .line 315
    .line 316
    iget-object v3, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$5;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 317
    .line 318
    invoke-static {v3}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$600(Lio/agora/base/internal/video/HardwareVideoEncoder;)Lio/agora/base/internal/video/EglBase;

    .line 319
    .line 320
    .line 321
    move-result-object v3

    .line 322
    if-eqz v3, :cond_4

    .line 323
    .line 324
    iget-object v3, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$5;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 325
    .line 326
    invoke-static {v3}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$600(Lio/agora/base/internal/video/HardwareVideoEncoder;)Lio/agora/base/internal/video/EglBase;

    .line 327
    .line 328
    .line 329
    move-result-object v3

    .line 330
    invoke-interface {v3}, Lio/agora/base/internal/video/EglBase;->release()V

    .line 331
    .line 332
    .line 333
    iget-object v3, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$5;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 334
    .line 335
    invoke-static {v3, v2}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$602(Lio/agora/base/internal/video/HardwareVideoEncoder;Lio/agora/base/internal/video/EglBase;)Lio/agora/base/internal/video/EglBase;

    .line 336
    .line 337
    .line 338
    :cond_4
    iget-object v3, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$5;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 339
    .line 340
    invoke-static {v3}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$700(Lio/agora/base/internal/video/HardwareVideoEncoder;)Landroid/view/Surface;

    .line 341
    .line 342
    .line 343
    move-result-object v3

    .line 344
    if-eqz v3, :cond_5

    .line 345
    .line 346
    iget-object v3, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$5;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 347
    .line 348
    invoke-static {v3}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$700(Lio/agora/base/internal/video/HardwareVideoEncoder;)Landroid/view/Surface;

    .line 349
    .line 350
    .line 351
    move-result-object v3

    .line 352
    invoke-virtual {v3}, Landroid/view/Surface;->release()V

    .line 353
    .line 354
    .line 355
    iget-object v3, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$5;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 356
    .line 357
    invoke-static {v3, v2}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$702(Lio/agora/base/internal/video/HardwareVideoEncoder;Landroid/view/Surface;)Landroid/view/Surface;

    .line 358
    .line 359
    .line 360
    :cond_5
    iget-object v3, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$5;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 361
    .line 362
    invoke-static {v3, v2}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$102(Lio/agora/base/internal/video/HardwareVideoEncoder;Lio/agora/base/internal/video/MediaCodecWrapper;)Lio/agora/base/internal/video/MediaCodecWrapper;

    .line 363
    .line 364
    .line 365
    iget-object v3, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$5;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 366
    .line 367
    invoke-static {v3, v1}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$1002(Lio/agora/base/internal/video/HardwareVideoEncoder;I)I

    .line 368
    .line 369
    .line 370
    iget-object v1, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$5;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 371
    .line 372
    invoke-static {v1, v2}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$1102(Lio/agora/base/internal/video/HardwareVideoEncoder;Ljava/lang/Thread;)Ljava/lang/Thread;

    .line 373
    .line 374
    .line 375
    iget-object v1, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$5;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 376
    .line 377
    invoke-static {v1, v2}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$1202(Lio/agora/base/internal/video/HardwareVideoEncoder;Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 378
    .line 379
    .line 380
    iget-object v1, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$5;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 381
    .line 382
    invoke-static {v1}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$1300(Lio/agora/base/internal/video/HardwareVideoEncoder;)Ljava/util/concurrent/BlockingDeque;

    .line 383
    .line 384
    .line 385
    move-result-object v1

    .line 386
    invoke-interface {v1}, Ljava/util/Collection;->clear()V

    .line 387
    .line 388
    .line 389
    iget-object v1, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$5;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 390
    .line 391
    invoke-static {v1}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$1400(Lio/agora/base/internal/video/HardwareVideoEncoder;)Ljava/util/Queue;

    .line 392
    .line 393
    .line 394
    move-result-object v1

    .line 395
    invoke-interface {v1}, Ljava/util/Collection;->clear()V

    .line 396
    .line 397
    .line 398
    iget-object v1, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$5;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 399
    .line 400
    invoke-static {v1}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$1500(Lio/agora/base/internal/video/HardwareVideoEncoder;)Ljava/util/Map;

    .line 401
    .line 402
    .line 403
    move-result-object v1

    .line 404
    invoke-interface {v1}, Ljava/util/Map;->clear()V

    .line 405
    .line 406
    .line 407
    iget-object p0, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$5;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 408
    .line 409
    invoke-static {p0}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$000(Lio/agora/base/internal/video/HardwareVideoEncoder;)Ljava/util/concurrent/locks/ReentrantLock;

    .line 410
    .line 411
    .line 412
    move-result-object p0

    .line 413
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 414
    .line 415
    .line 416
    throw v0
.end method

.method public bridge synthetic call()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 417
    invoke-virtual {p0}, Lio/agora/base/internal/video/HardwareVideoEncoder$5;->call()Lio/agora/base/internal/video/VideoCodecStatus;

    move-result-object p0

    return-object p0
.end method
