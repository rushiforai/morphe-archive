.class Lcom/tencent/liteav/qos/TXCQoS$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/liteav/qos/TXCQoS;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/tencent/liteav/qos/TXCQoS;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/qos/TXCQoS;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/qos/TXCQoS$1;->a:Lcom/tencent/liteav/qos/TXCQoS;

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
    iget-object v0, p0, Lcom/tencent/liteav/qos/TXCQoS$1;->a:Lcom/tencent/liteav/qos/TXCQoS;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tencent/liteav/qos/TXCQoS;->access$000(Lcom/tencent/liteav/qos/TXCQoS;)Lcom/tencent/liteav/qos/a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_5

    .line 8
    .line 9
    iget-object v0, p0, Lcom/tencent/liteav/qos/TXCQoS$1;->a:Lcom/tencent/liteav/qos/TXCQoS;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/tencent/liteav/qos/TXCQoS;->access$000(Lcom/tencent/liteav/qos/TXCQoS;)Lcom/tencent/liteav/qos/a;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Lcom/tencent/liteav/qos/a;->a()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iget-object v1, p0, Lcom/tencent/liteav/qos/TXCQoS$1;->a:Lcom/tencent/liteav/qos/TXCQoS;

    .line 20
    .line 21
    invoke-static {v1}, Lcom/tencent/liteav/qos/TXCQoS;->access$000(Lcom/tencent/liteav/qos/TXCQoS;)Lcom/tencent/liteav/qos/a;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-interface {v1}, Lcom/tencent/liteav/qos/a;->b()I

    .line 26
    .line 27
    .line 28
    move-result v9

    .line 29
    iget-object v1, p0, Lcom/tencent/liteav/qos/TXCQoS$1;->a:Lcom/tencent/liteav/qos/TXCQoS;

    .line 30
    .line 31
    invoke-static {v1}, Lcom/tencent/liteav/qos/TXCQoS;->access$000(Lcom/tencent/liteav/qos/TXCQoS;)Lcom/tencent/liteav/qos/a;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-interface {v1}, Lcom/tencent/liteav/qos/a;->c()I

    .line 36
    .line 37
    .line 38
    move-result v8

    .line 39
    iget-object v1, p0, Lcom/tencent/liteav/qos/TXCQoS$1;->a:Lcom/tencent/liteav/qos/TXCQoS;

    .line 40
    .line 41
    invoke-static {v1}, Lcom/tencent/liteav/qos/TXCQoS;->access$000(Lcom/tencent/liteav/qos/TXCQoS;)Lcom/tencent/liteav/qos/a;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-interface {v1}, Lcom/tencent/liteav/qos/a;->d()I

    .line 46
    .line 47
    .line 48
    move-result v5

    .line 49
    iget-object v1, p0, Lcom/tencent/liteav/qos/TXCQoS$1;->a:Lcom/tencent/liteav/qos/TXCQoS;

    .line 50
    .line 51
    invoke-static {v1}, Lcom/tencent/liteav/qos/TXCQoS;->access$000(Lcom/tencent/liteav/qos/TXCQoS;)Lcom/tencent/liteav/qos/a;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-interface {v1}, Lcom/tencent/liteav/qos/a;->e()I

    .line 56
    .line 57
    .line 58
    move-result v6

    .line 59
    iget-object v1, p0, Lcom/tencent/liteav/qos/TXCQoS$1;->a:Lcom/tencent/liteav/qos/TXCQoS;

    .line 60
    .line 61
    invoke-static {v1}, Lcom/tencent/liteav/qos/TXCQoS;->access$000(Lcom/tencent/liteav/qos/TXCQoS;)Lcom/tencent/liteav/qos/a;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-interface {v1}, Lcom/tencent/liteav/qos/a;->f()I

    .line 66
    .line 67
    .line 68
    move-result v7

    .line 69
    iget-object v1, p0, Lcom/tencent/liteav/qos/TXCQoS$1;->a:Lcom/tencent/liteav/qos/TXCQoS;

    .line 70
    .line 71
    invoke-static {v1}, Lcom/tencent/liteav/qos/TXCQoS;->access$000(Lcom/tencent/liteav/qos/TXCQoS;)Lcom/tencent/liteav/qos/a;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    invoke-interface {v1}, Lcom/tencent/liteav/qos/a;->g()I

    .line 76
    .line 77
    .line 78
    move-result v10

    .line 79
    iget-object v1, p0, Lcom/tencent/liteav/qos/TXCQoS$1;->a:Lcom/tencent/liteav/qos/TXCQoS;

    .line 80
    .line 81
    invoke-static {v1}, Lcom/tencent/liteav/qos/TXCQoS;->access$100(Lcom/tencent/liteav/qos/TXCQoS;)J

    .line 82
    .line 83
    .line 84
    move-result-wide v2

    .line 85
    invoke-static {v1, v2, v3, v0}, Lcom/tencent/liteav/qos/TXCQoS;->access$200(Lcom/tencent/liteav/qos/TXCQoS;JI)V

    .line 86
    .line 87
    .line 88
    iget-object v2, p0, Lcom/tencent/liteav/qos/TXCQoS$1;->a:Lcom/tencent/liteav/qos/TXCQoS;

    .line 89
    .line 90
    invoke-static {v2}, Lcom/tencent/liteav/qos/TXCQoS;->access$100(Lcom/tencent/liteav/qos/TXCQoS;)J

    .line 91
    .line 92
    .line 93
    move-result-wide v3

    .line 94
    invoke-static/range {v2 .. v10}, Lcom/tencent/liteav/qos/TXCQoS;->access$300(Lcom/tencent/liteav/qos/TXCQoS;JIIIIII)V

    .line 95
    .line 96
    .line 97
    iget-object v0, p0, Lcom/tencent/liteav/qos/TXCQoS$1;->a:Lcom/tencent/liteav/qos/TXCQoS;

    .line 98
    .line 99
    invoke-static {v0}, Lcom/tencent/liteav/qos/TXCQoS;->access$100(Lcom/tencent/liteav/qos/TXCQoS;)J

    .line 100
    .line 101
    .line 102
    move-result-wide v1

    .line 103
    invoke-static {v0, v1, v2}, Lcom/tencent/liteav/qos/TXCQoS;->access$400(Lcom/tencent/liteav/qos/TXCQoS;J)Z

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    iget-object v1, p0, Lcom/tencent/liteav/qos/TXCQoS$1;->a:Lcom/tencent/liteav/qos/TXCQoS;

    .line 108
    .line 109
    invoke-static {v1}, Lcom/tencent/liteav/qos/TXCQoS;->access$500(Lcom/tencent/liteav/qos/TXCQoS;)Z

    .line 110
    .line 111
    .line 112
    move-result v1

    .line 113
    if-eq v1, v0, :cond_0

    .line 114
    .line 115
    iget-object v1, p0, Lcom/tencent/liteav/qos/TXCQoS$1;->a:Lcom/tencent/liteav/qos/TXCQoS;

    .line 116
    .line 117
    invoke-static {v1, v0}, Lcom/tencent/liteav/qos/TXCQoS;->access$502(Lcom/tencent/liteav/qos/TXCQoS;Z)Z

    .line 118
    .line 119
    .line 120
    iget-object v1, p0, Lcom/tencent/liteav/qos/TXCQoS$1;->a:Lcom/tencent/liteav/qos/TXCQoS;

    .line 121
    .line 122
    invoke-static {v1}, Lcom/tencent/liteav/qos/TXCQoS;->access$000(Lcom/tencent/liteav/qos/TXCQoS;)Lcom/tencent/liteav/qos/a;

    .line 123
    .line 124
    .line 125
    move-result-object v1

    .line 126
    invoke-interface {v1, v0}, Lcom/tencent/liteav/qos/a;->a(Z)V

    .line 127
    .line 128
    .line 129
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/qos/TXCQoS$1;->a:Lcom/tencent/liteav/qos/TXCQoS;

    .line 130
    .line 131
    invoke-static {v0}, Lcom/tencent/liteav/qos/TXCQoS;->access$100(Lcom/tencent/liteav/qos/TXCQoS;)J

    .line 132
    .line 133
    .line 134
    move-result-wide v1

    .line 135
    invoke-static {v0, v1, v2}, Lcom/tencent/liteav/qos/TXCQoS;->access$600(Lcom/tencent/liteav/qos/TXCQoS;J)I

    .line 136
    .line 137
    .line 138
    move-result v0

    .line 139
    iget-object v1, p0, Lcom/tencent/liteav/qos/TXCQoS$1;->a:Lcom/tencent/liteav/qos/TXCQoS;

    .line 140
    .line 141
    invoke-static {v1}, Lcom/tencent/liteav/qos/TXCQoS;->access$100(Lcom/tencent/liteav/qos/TXCQoS;)J

    .line 142
    .line 143
    .line 144
    move-result-wide v2

    .line 145
    invoke-static {v1, v2, v3}, Lcom/tencent/liteav/qos/TXCQoS;->access$700(Lcom/tencent/liteav/qos/TXCQoS;J)I

    .line 146
    .line 147
    .line 148
    move-result v1

    .line 149
    iget-object v2, p0, Lcom/tencent/liteav/qos/TXCQoS$1;->a:Lcom/tencent/liteav/qos/TXCQoS;

    .line 150
    .line 151
    invoke-static {v2}, Lcom/tencent/liteav/qos/TXCQoS;->access$100(Lcom/tencent/liteav/qos/TXCQoS;)J

    .line 152
    .line 153
    .line 154
    move-result-wide v3

    .line 155
    invoke-static {v2, v3, v4}, Lcom/tencent/liteav/qos/TXCQoS;->access$800(Lcom/tencent/liteav/qos/TXCQoS;J)I

    .line 156
    .line 157
    .line 158
    move-result v2

    .line 159
    iget-object v3, p0, Lcom/tencent/liteav/qos/TXCQoS$1;->a:Lcom/tencent/liteav/qos/TXCQoS;

    .line 160
    .line 161
    invoke-static {v3}, Lcom/tencent/liteav/qos/TXCQoS;->access$900(Lcom/tencent/liteav/qos/TXCQoS;)I

    .line 162
    .line 163
    .line 164
    move-result v3

    .line 165
    const-string v4, "EVT_TIME"

    .line 166
    .line 167
    const-string v5, "EVT_MSG"

    .line 168
    .line 169
    if-ne v1, v3, :cond_2

    .line 170
    .line 171
    iget-object v3, p0, Lcom/tencent/liteav/qos/TXCQoS$1;->a:Lcom/tencent/liteav/qos/TXCQoS;

    .line 172
    .line 173
    invoke-static {v3}, Lcom/tencent/liteav/qos/TXCQoS;->access$1000(Lcom/tencent/liteav/qos/TXCQoS;)I

    .line 174
    .line 175
    .line 176
    move-result v3

    .line 177
    if-eq v2, v3, :cond_1

    .line 178
    .line 179
    goto :goto_0

    .line 180
    :cond_1
    iget-object v3, p0, Lcom/tencent/liteav/qos/TXCQoS$1;->a:Lcom/tencent/liteav/qos/TXCQoS;

    .line 181
    .line 182
    invoke-static {v3}, Lcom/tencent/liteav/qos/TXCQoS;->access$1300(Lcom/tencent/liteav/qos/TXCQoS;)I

    .line 183
    .line 184
    .line 185
    move-result v3

    .line 186
    if-eq v0, v3, :cond_4

    .line 187
    .line 188
    iget-object v3, p0, Lcom/tencent/liteav/qos/TXCQoS$1;->a:Lcom/tencent/liteav/qos/TXCQoS;

    .line 189
    .line 190
    invoke-static {v3}, Lcom/tencent/liteav/qos/TXCQoS;->access$000(Lcom/tencent/liteav/qos/TXCQoS;)Lcom/tencent/liteav/qos/a;

    .line 191
    .line 192
    .line 193
    move-result-object v3

    .line 194
    const/4 v6, 0x0

    .line 195
    invoke-interface {v3, v0, v6, v6}, Lcom/tencent/liteav/qos/a;->a(III)V

    .line 196
    .line 197
    .line 198
    iget-object v3, p0, Lcom/tencent/liteav/qos/TXCQoS$1;->a:Lcom/tencent/liteav/qos/TXCQoS;

    .line 199
    .line 200
    invoke-static {v3}, Lcom/tencent/liteav/qos/TXCQoS;->access$1200(Lcom/tencent/liteav/qos/TXCQoS;)Lcom/tencent/liteav/basic/b/b;

    .line 201
    .line 202
    .line 203
    move-result-object v3

    .line 204
    if-eqz v3, :cond_4

    .line 205
    .line 206
    new-instance v3, Landroid/os/Bundle;

    .line 207
    .line 208
    invoke-direct {v3}, Landroid/os/Bundle;-><init>()V

    .line 209
    .line 210
    .line 211
    new-instance v6, Ljava/lang/StringBuilder;

    .line 212
    .line 213
    const-string v7, "Adjust encoding bitrate:new bitrate:"

    .line 214
    .line 215
    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 216
    .line 217
    .line 218
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 219
    .line 220
    .line 221
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 222
    .line 223
    .line 224
    move-result-object v6

    .line 225
    invoke-virtual {v3, v5, v6}, Landroid/os/Bundle;->putCharSequence(Ljava/lang/String;Ljava/lang/CharSequence;)V

    .line 226
    .line 227
    .line 228
    invoke-static {}, Lcom/tencent/liteav/basic/util/TXCTimeUtil;->getTimeTick()J

    .line 229
    .line 230
    .line 231
    move-result-wide v5

    .line 232
    invoke-virtual {v3, v4, v5, v6}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    .line 233
    .line 234
    .line 235
    iget-object v4, p0, Lcom/tencent/liteav/qos/TXCQoS$1;->a:Lcom/tencent/liteav/qos/TXCQoS;

    .line 236
    .line 237
    invoke-static {v4}, Lcom/tencent/liteav/qos/TXCQoS;->access$1400(Lcom/tencent/liteav/qos/TXCQoS;)Ljava/lang/String;

    .line 238
    .line 239
    .line 240
    move-result-object v4

    .line 241
    const-string v5, "EVT_USERID"

    .line 242
    .line 243
    invoke-virtual {v3, v5, v4}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 244
    .line 245
    .line 246
    iget-object v4, p0, Lcom/tencent/liteav/qos/TXCQoS$1;->a:Lcom/tencent/liteav/qos/TXCQoS;

    .line 247
    .line 248
    invoke-static {v4}, Lcom/tencent/liteav/qos/TXCQoS;->access$1200(Lcom/tencent/liteav/qos/TXCQoS;)Lcom/tencent/liteav/basic/b/b;

    .line 249
    .line 250
    .line 251
    move-result-object v4

    .line 252
    const/16 v5, 0x3ee

    .line 253
    .line 254
    invoke-interface {v4, v5, v3}, Lcom/tencent/liteav/basic/b/b;->onNotifyEvent(ILandroid/os/Bundle;)V

    .line 255
    .line 256
    .line 257
    goto :goto_1

    .line 258
    :cond_2
    :goto_0
    iget-object v3, p0, Lcom/tencent/liteav/qos/TXCQoS$1;->a:Lcom/tencent/liteav/qos/TXCQoS;

    .line 259
    .line 260
    invoke-static {v3}, Lcom/tencent/liteav/qos/TXCQoS;->access$1100(Lcom/tencent/liteav/qos/TXCQoS;)I

    .line 261
    .line 262
    .line 263
    move-result v3

    .line 264
    const/4 v6, 0x1

    .line 265
    if-eq v3, v6, :cond_3

    .line 266
    .line 267
    iget-object v3, p0, Lcom/tencent/liteav/qos/TXCQoS$1;->a:Lcom/tencent/liteav/qos/TXCQoS;

    .line 268
    .line 269
    invoke-static {v3}, Lcom/tencent/liteav/qos/TXCQoS;->access$1100(Lcom/tencent/liteav/qos/TXCQoS;)I

    .line 270
    .line 271
    .line 272
    move-result v3

    .line 273
    const/4 v6, 0x5

    .line 274
    if-ne v3, v6, :cond_4

    .line 275
    .line 276
    :cond_3
    iget-object v3, p0, Lcom/tencent/liteav/qos/TXCQoS$1;->a:Lcom/tencent/liteav/qos/TXCQoS;

    .line 277
    .line 278
    invoke-static {v3}, Lcom/tencent/liteav/qos/TXCQoS;->access$000(Lcom/tencent/liteav/qos/TXCQoS;)Lcom/tencent/liteav/qos/a;

    .line 279
    .line 280
    .line 281
    move-result-object v3

    .line 282
    invoke-interface {v3, v0, v1, v2}, Lcom/tencent/liteav/qos/a;->a(III)V

    .line 283
    .line 284
    .line 285
    iget-object v3, p0, Lcom/tencent/liteav/qos/TXCQoS$1;->a:Lcom/tencent/liteav/qos/TXCQoS;

    .line 286
    .line 287
    invoke-static {v3}, Lcom/tencent/liteav/qos/TXCQoS;->access$1200(Lcom/tencent/liteav/qos/TXCQoS;)Lcom/tencent/liteav/basic/b/b;

    .line 288
    .line 289
    .line 290
    move-result-object v3

    .line 291
    if-eqz v3, :cond_4

    .line 292
    .line 293
    new-instance v3, Landroid/os/Bundle;

    .line 294
    .line 295
    invoke-direct {v3}, Landroid/os/Bundle;-><init>()V

    .line 296
    .line 297
    .line 298
    new-instance v6, Ljava/lang/StringBuilder;

    .line 299
    .line 300
    const-string v7, "Adjust resolution:new bitrate:"

    .line 301
    .line 302
    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 303
    .line 304
    .line 305
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 306
    .line 307
    .line 308
    const-string v7, " new resolution:"

    .line 309
    .line 310
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 311
    .line 312
    .line 313
    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 314
    .line 315
    .line 316
    const-string v7, "*"

    .line 317
    .line 318
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 319
    .line 320
    .line 321
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 322
    .line 323
    .line 324
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 325
    .line 326
    .line 327
    move-result-object v6

    .line 328
    invoke-virtual {v3, v5, v6}, Landroid/os/Bundle;->putCharSequence(Ljava/lang/String;Ljava/lang/CharSequence;)V

    .line 329
    .line 330
    .line 331
    invoke-static {}, Lcom/tencent/liteav/basic/util/TXCTimeUtil;->getTimeTick()J

    .line 332
    .line 333
    .line 334
    move-result-wide v5

    .line 335
    invoke-virtual {v3, v4, v5, v6}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    .line 336
    .line 337
    .line 338
    iget-object v4, p0, Lcom/tencent/liteav/qos/TXCQoS$1;->a:Lcom/tencent/liteav/qos/TXCQoS;

    .line 339
    .line 340
    invoke-static {v4}, Lcom/tencent/liteav/qos/TXCQoS;->access$1200(Lcom/tencent/liteav/qos/TXCQoS;)Lcom/tencent/liteav/basic/b/b;

    .line 341
    .line 342
    .line 343
    move-result-object v4

    .line 344
    const/16 v5, 0x3ed

    .line 345
    .line 346
    invoke-interface {v4, v5, v3}, Lcom/tencent/liteav/basic/b/b;->onNotifyEvent(ILandroid/os/Bundle;)V

    .line 347
    .line 348
    .line 349
    :cond_4
    :goto_1
    iget-object v3, p0, Lcom/tencent/liteav/qos/TXCQoS$1;->a:Lcom/tencent/liteav/qos/TXCQoS;

    .line 350
    .line 351
    invoke-static {v3, v0}, Lcom/tencent/liteav/qos/TXCQoS;->access$1302(Lcom/tencent/liteav/qos/TXCQoS;I)I

    .line 352
    .line 353
    .line 354
    iget-object v0, p0, Lcom/tencent/liteav/qos/TXCQoS$1;->a:Lcom/tencent/liteav/qos/TXCQoS;

    .line 355
    .line 356
    invoke-static {v0, v1}, Lcom/tencent/liteav/qos/TXCQoS;->access$902(Lcom/tencent/liteav/qos/TXCQoS;I)I

    .line 357
    .line 358
    .line 359
    iget-object v0, p0, Lcom/tencent/liteav/qos/TXCQoS$1;->a:Lcom/tencent/liteav/qos/TXCQoS;

    .line 360
    .line 361
    invoke-static {v0, v2}, Lcom/tencent/liteav/qos/TXCQoS;->access$1002(Lcom/tencent/liteav/qos/TXCQoS;I)I

    .line 362
    .line 363
    .line 364
    :cond_5
    iget-object v0, p0, Lcom/tencent/liteav/qos/TXCQoS$1;->a:Lcom/tencent/liteav/qos/TXCQoS;

    .line 365
    .line 366
    invoke-static {v0}, Lcom/tencent/liteav/qos/TXCQoS;->access$1600(Lcom/tencent/liteav/qos/TXCQoS;)Landroid/os/Handler;

    .line 367
    .line 368
    .line 369
    move-result-object v0

    .line 370
    iget-object v1, p0, Lcom/tencent/liteav/qos/TXCQoS$1;->a:Lcom/tencent/liteav/qos/TXCQoS;

    .line 371
    .line 372
    invoke-static {v1}, Lcom/tencent/liteav/qos/TXCQoS;->access$1500(Lcom/tencent/liteav/qos/TXCQoS;)J

    .line 373
    .line 374
    .line 375
    move-result-wide v1

    .line 376
    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 377
    .line 378
    .line 379
    return-void
.end method
