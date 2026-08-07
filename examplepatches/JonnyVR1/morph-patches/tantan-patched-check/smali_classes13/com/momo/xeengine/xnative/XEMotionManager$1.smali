.class Lcom/momo/xeengine/xnative/XEMotionManager$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/hardware/SensorEventListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/xeengine/xnative/XEMotionManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field private final rotationMatrix:[F

.field final synthetic this$0:Lcom/momo/xeengine/xnative/XEMotionManager;


# direct methods
.method public constructor <init>(Lcom/momo/xeengine/xnative/XEMotionManager;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/xnative/XEMotionManager$1;->this$0:Lcom/momo/xeengine/xnative/XEMotionManager;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/16 p1, 0x10

    .line 7
    .line 8
    new-array p1, p1, [F

    .line 9
    .line 10
    iput-object p1, p0, Lcom/momo/xeengine/xnative/XEMotionManager$1;->rotationMatrix:[F

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .locals 0

    return-void
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .locals 11

    .line 1
    invoke-static {}, Lcom/momo/xeengine/xnative/XEDevice;->getRotation()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-wide v1, p1, Landroid/hardware/SensorEvent;->timestamp:J

    .line 6
    .line 7
    iget-object v1, p1, Landroid/hardware/SensorEvent;->sensor:Landroid/hardware/Sensor;

    .line 8
    .line 9
    invoke-virtual {v1}, Landroid/hardware/Sensor;->getType()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/16 v2, 0xf

    .line 14
    .line 15
    if-ne v1, v2, :cond_4

    .line 16
    .line 17
    iget-object v1, p0, Lcom/momo/xeengine/xnative/XEMotionManager$1;->rotationMatrix:[F

    .line 18
    .line 19
    iget-object p1, p1, Landroid/hardware/SensorEvent;->values:[F

    .line 20
    .line 21
    invoke-static {v1, p1}, Landroid/hardware/SensorManager;->getRotationMatrixFromVector([F[F)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Lcom/momo/xeengine/xnative/XEMotionManager$1;->this$0:Lcom/momo/xeengine/xnative/XEMotionManager;

    .line 25
    .line 26
    invoke-static {p1}, Lcom/momo/xeengine/xnative/XEMotionManager;->access$000(Lcom/momo/xeengine/xnative/XEMotionManager;)[F

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    monitor-enter p1

    .line 31
    const/16 v1, 0xa

    .line 32
    .line 33
    const/4 v2, 0x6

    .line 34
    const/16 v3, 0x9

    .line 35
    .line 36
    const/4 v4, 0x5

    .line 37
    const/16 v5, 0x8

    .line 38
    .line 39
    const/4 v6, 0x4

    .line 40
    const/4 v7, 0x0

    .line 41
    const/4 v8, 0x2

    .line 42
    const/4 v9, 0x1

    .line 43
    if-nez v0, :cond_0

    .line 44
    .line 45
    :try_start_0
    iget-object v0, p0, Lcom/momo/xeengine/xnative/XEMotionManager$1;->this$0:Lcom/momo/xeengine/xnative/XEMotionManager;

    .line 46
    .line 47
    invoke-static {v0}, Lcom/momo/xeengine/xnative/XEMotionManager;->access$000(Lcom/momo/xeengine/xnative/XEMotionManager;)[F

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    iget-object v10, p0, Lcom/momo/xeengine/xnative/XEMotionManager$1;->rotationMatrix:[F

    .line 52
    .line 53
    aget v10, v10, v7

    .line 54
    .line 55
    aput v10, v0, v7

    .line 56
    .line 57
    iget-object v0, p0, Lcom/momo/xeengine/xnative/XEMotionManager$1;->this$0:Lcom/momo/xeengine/xnative/XEMotionManager;

    .line 58
    .line 59
    invoke-static {v0}, Lcom/momo/xeengine/xnative/XEMotionManager;->access$000(Lcom/momo/xeengine/xnative/XEMotionManager;)[F

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    iget-object v7, p0, Lcom/momo/xeengine/xnative/XEMotionManager$1;->rotationMatrix:[F

    .line 64
    .line 65
    aget v7, v7, v9

    .line 66
    .line 67
    aput v7, v0, v9

    .line 68
    .line 69
    iget-object v0, p0, Lcom/momo/xeengine/xnative/XEMotionManager$1;->this$0:Lcom/momo/xeengine/xnative/XEMotionManager;

    .line 70
    .line 71
    invoke-static {v0}, Lcom/momo/xeengine/xnative/XEMotionManager;->access$000(Lcom/momo/xeengine/xnative/XEMotionManager;)[F

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    iget-object v7, p0, Lcom/momo/xeengine/xnative/XEMotionManager$1;->rotationMatrix:[F

    .line 76
    .line 77
    aget v7, v7, v8

    .line 78
    .line 79
    neg-float v7, v7

    .line 80
    aput v7, v0, v8

    .line 81
    .line 82
    iget-object v0, p0, Lcom/momo/xeengine/xnative/XEMotionManager$1;->this$0:Lcom/momo/xeengine/xnative/XEMotionManager;

    .line 83
    .line 84
    invoke-static {v0}, Lcom/momo/xeengine/xnative/XEMotionManager;->access$000(Lcom/momo/xeengine/xnative/XEMotionManager;)[F

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    iget-object v7, p0, Lcom/momo/xeengine/xnative/XEMotionManager$1;->rotationMatrix:[F

    .line 89
    .line 90
    aget v7, v7, v5

    .line 91
    .line 92
    aput v7, v0, v6

    .line 93
    .line 94
    iget-object v0, p0, Lcom/momo/xeengine/xnative/XEMotionManager$1;->this$0:Lcom/momo/xeengine/xnative/XEMotionManager;

    .line 95
    .line 96
    invoke-static {v0}, Lcom/momo/xeengine/xnative/XEMotionManager;->access$000(Lcom/momo/xeengine/xnative/XEMotionManager;)[F

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    iget-object v7, p0, Lcom/momo/xeengine/xnative/XEMotionManager$1;->rotationMatrix:[F

    .line 101
    .line 102
    aget v7, v7, v3

    .line 103
    .line 104
    aput v7, v0, v4

    .line 105
    .line 106
    iget-object v0, p0, Lcom/momo/xeengine/xnative/XEMotionManager$1;->this$0:Lcom/momo/xeengine/xnative/XEMotionManager;

    .line 107
    .line 108
    invoke-static {v0}, Lcom/momo/xeengine/xnative/XEMotionManager;->access$000(Lcom/momo/xeengine/xnative/XEMotionManager;)[F

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    iget-object v7, p0, Lcom/momo/xeengine/xnative/XEMotionManager$1;->rotationMatrix:[F

    .line 113
    .line 114
    aget v7, v7, v1

    .line 115
    .line 116
    neg-float v7, v7

    .line 117
    aput v7, v0, v2

    .line 118
    .line 119
    iget-object v0, p0, Lcom/momo/xeengine/xnative/XEMotionManager$1;->this$0:Lcom/momo/xeengine/xnative/XEMotionManager;

    .line 120
    .line 121
    invoke-static {v0}, Lcom/momo/xeengine/xnative/XEMotionManager;->access$000(Lcom/momo/xeengine/xnative/XEMotionManager;)[F

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    iget-object v7, p0, Lcom/momo/xeengine/xnative/XEMotionManager$1;->rotationMatrix:[F

    .line 126
    .line 127
    aget v6, v7, v6

    .line 128
    .line 129
    aput v6, v0, v5

    .line 130
    .line 131
    iget-object v0, p0, Lcom/momo/xeengine/xnative/XEMotionManager$1;->this$0:Lcom/momo/xeengine/xnative/XEMotionManager;

    .line 132
    .line 133
    invoke-static {v0}, Lcom/momo/xeengine/xnative/XEMotionManager;->access$000(Lcom/momo/xeengine/xnative/XEMotionManager;)[F

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    iget-object v5, p0, Lcom/momo/xeengine/xnative/XEMotionManager$1;->rotationMatrix:[F

    .line 138
    .line 139
    aget v4, v5, v4

    .line 140
    .line 141
    aput v4, v0, v3

    .line 142
    .line 143
    iget-object v0, p0, Lcom/momo/xeengine/xnative/XEMotionManager$1;->this$0:Lcom/momo/xeengine/xnative/XEMotionManager;

    .line 144
    .line 145
    invoke-static {v0}, Lcom/momo/xeengine/xnative/XEMotionManager;->access$000(Lcom/momo/xeengine/xnative/XEMotionManager;)[F

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    iget-object p0, p0, Lcom/momo/xeengine/xnative/XEMotionManager$1;->rotationMatrix:[F

    .line 150
    .line 151
    aget p0, p0, v2

    .line 152
    .line 153
    neg-float p0, p0

    .line 154
    aput p0, v0, v1

    .line 155
    .line 156
    goto/16 :goto_0

    .line 157
    .line 158
    :catchall_0
    move-exception p0

    .line 159
    goto/16 :goto_1

    .line 160
    .line 161
    :cond_0
    if-ne v0, v9, :cond_1

    .line 162
    .line 163
    iget-object v0, p0, Lcom/momo/xeengine/xnative/XEMotionManager$1;->this$0:Lcom/momo/xeengine/xnative/XEMotionManager;

    .line 164
    .line 165
    invoke-static {v0}, Lcom/momo/xeengine/xnative/XEMotionManager;->access$000(Lcom/momo/xeengine/xnative/XEMotionManager;)[F

    .line 166
    .line 167
    .line 168
    move-result-object v0

    .line 169
    iget-object v10, p0, Lcom/momo/xeengine/xnative/XEMotionManager$1;->rotationMatrix:[F

    .line 170
    .line 171
    aget v10, v10, v9

    .line 172
    .line 173
    neg-float v10, v10

    .line 174
    aput v10, v0, v7

    .line 175
    .line 176
    iget-object v0, p0, Lcom/momo/xeengine/xnative/XEMotionManager$1;->this$0:Lcom/momo/xeengine/xnative/XEMotionManager;

    .line 177
    .line 178
    invoke-static {v0}, Lcom/momo/xeengine/xnative/XEMotionManager;->access$000(Lcom/momo/xeengine/xnative/XEMotionManager;)[F

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    iget-object v10, p0, Lcom/momo/xeengine/xnative/XEMotionManager$1;->rotationMatrix:[F

    .line 183
    .line 184
    aget v7, v10, v7

    .line 185
    .line 186
    aput v7, v0, v9

    .line 187
    .line 188
    iget-object v0, p0, Lcom/momo/xeengine/xnative/XEMotionManager$1;->this$0:Lcom/momo/xeengine/xnative/XEMotionManager;

    .line 189
    .line 190
    invoke-static {v0}, Lcom/momo/xeengine/xnative/XEMotionManager;->access$000(Lcom/momo/xeengine/xnative/XEMotionManager;)[F

    .line 191
    .line 192
    .line 193
    move-result-object v0

    .line 194
    iget-object v7, p0, Lcom/momo/xeengine/xnative/XEMotionManager$1;->rotationMatrix:[F

    .line 195
    .line 196
    aget v7, v7, v8

    .line 197
    .line 198
    neg-float v7, v7

    .line 199
    aput v7, v0, v8

    .line 200
    .line 201
    iget-object v0, p0, Lcom/momo/xeengine/xnative/XEMotionManager$1;->this$0:Lcom/momo/xeengine/xnative/XEMotionManager;

    .line 202
    .line 203
    invoke-static {v0}, Lcom/momo/xeengine/xnative/XEMotionManager;->access$000(Lcom/momo/xeengine/xnative/XEMotionManager;)[F

    .line 204
    .line 205
    .line 206
    move-result-object v0

    .line 207
    iget-object v7, p0, Lcom/momo/xeengine/xnative/XEMotionManager$1;->rotationMatrix:[F

    .line 208
    .line 209
    aget v7, v7, v3

    .line 210
    .line 211
    neg-float v7, v7

    .line 212
    aput v7, v0, v6

    .line 213
    .line 214
    iget-object v0, p0, Lcom/momo/xeengine/xnative/XEMotionManager$1;->this$0:Lcom/momo/xeengine/xnative/XEMotionManager;

    .line 215
    .line 216
    invoke-static {v0}, Lcom/momo/xeengine/xnative/XEMotionManager;->access$000(Lcom/momo/xeengine/xnative/XEMotionManager;)[F

    .line 217
    .line 218
    .line 219
    move-result-object v0

    .line 220
    iget-object v7, p0, Lcom/momo/xeengine/xnative/XEMotionManager$1;->rotationMatrix:[F

    .line 221
    .line 222
    aget v7, v7, v5

    .line 223
    .line 224
    aput v7, v0, v4

    .line 225
    .line 226
    iget-object v0, p0, Lcom/momo/xeengine/xnative/XEMotionManager$1;->this$0:Lcom/momo/xeengine/xnative/XEMotionManager;

    .line 227
    .line 228
    invoke-static {v0}, Lcom/momo/xeengine/xnative/XEMotionManager;->access$000(Lcom/momo/xeengine/xnative/XEMotionManager;)[F

    .line 229
    .line 230
    .line 231
    move-result-object v0

    .line 232
    iget-object v7, p0, Lcom/momo/xeengine/xnative/XEMotionManager$1;->rotationMatrix:[F

    .line 233
    .line 234
    aget v7, v7, v1

    .line 235
    .line 236
    neg-float v7, v7

    .line 237
    aput v7, v0, v2

    .line 238
    .line 239
    iget-object v0, p0, Lcom/momo/xeengine/xnative/XEMotionManager$1;->this$0:Lcom/momo/xeengine/xnative/XEMotionManager;

    .line 240
    .line 241
    invoke-static {v0}, Lcom/momo/xeengine/xnative/XEMotionManager;->access$000(Lcom/momo/xeengine/xnative/XEMotionManager;)[F

    .line 242
    .line 243
    .line 244
    move-result-object v0

    .line 245
    iget-object v7, p0, Lcom/momo/xeengine/xnative/XEMotionManager$1;->rotationMatrix:[F

    .line 246
    .line 247
    aget v4, v7, v4

    .line 248
    .line 249
    neg-float v4, v4

    .line 250
    aput v4, v0, v5

    .line 251
    .line 252
    iget-object v0, p0, Lcom/momo/xeengine/xnative/XEMotionManager$1;->this$0:Lcom/momo/xeengine/xnative/XEMotionManager;

    .line 253
    .line 254
    invoke-static {v0}, Lcom/momo/xeengine/xnative/XEMotionManager;->access$000(Lcom/momo/xeengine/xnative/XEMotionManager;)[F

    .line 255
    .line 256
    .line 257
    move-result-object v0

    .line 258
    iget-object v4, p0, Lcom/momo/xeengine/xnative/XEMotionManager$1;->rotationMatrix:[F

    .line 259
    .line 260
    aget v4, v4, v6

    .line 261
    .line 262
    aput v4, v0, v3

    .line 263
    .line 264
    iget-object v0, p0, Lcom/momo/xeengine/xnative/XEMotionManager$1;->this$0:Lcom/momo/xeengine/xnative/XEMotionManager;

    .line 265
    .line 266
    invoke-static {v0}, Lcom/momo/xeengine/xnative/XEMotionManager;->access$000(Lcom/momo/xeengine/xnative/XEMotionManager;)[F

    .line 267
    .line 268
    .line 269
    move-result-object v0

    .line 270
    iget-object p0, p0, Lcom/momo/xeengine/xnative/XEMotionManager$1;->rotationMatrix:[F

    .line 271
    .line 272
    aget p0, p0, v2

    .line 273
    .line 274
    neg-float p0, p0

    .line 275
    aput p0, v0, v1

    .line 276
    .line 277
    goto/16 :goto_0

    .line 278
    .line 279
    :cond_1
    if-ne v0, v8, :cond_2

    .line 280
    .line 281
    iget-object v0, p0, Lcom/momo/xeengine/xnative/XEMotionManager$1;->this$0:Lcom/momo/xeengine/xnative/XEMotionManager;

    .line 282
    .line 283
    invoke-static {v0}, Lcom/momo/xeengine/xnative/XEMotionManager;->access$000(Lcom/momo/xeengine/xnative/XEMotionManager;)[F

    .line 284
    .line 285
    .line 286
    move-result-object v0

    .line 287
    iget-object v10, p0, Lcom/momo/xeengine/xnative/XEMotionManager$1;->rotationMatrix:[F

    .line 288
    .line 289
    aget v10, v10, v7

    .line 290
    .line 291
    aput v10, v0, v7

    .line 292
    .line 293
    iget-object v0, p0, Lcom/momo/xeengine/xnative/XEMotionManager$1;->this$0:Lcom/momo/xeengine/xnative/XEMotionManager;

    .line 294
    .line 295
    invoke-static {v0}, Lcom/momo/xeengine/xnative/XEMotionManager;->access$000(Lcom/momo/xeengine/xnative/XEMotionManager;)[F

    .line 296
    .line 297
    .line 298
    move-result-object v0

    .line 299
    iget-object v7, p0, Lcom/momo/xeengine/xnative/XEMotionManager$1;->rotationMatrix:[F

    .line 300
    .line 301
    aget v7, v7, v9

    .line 302
    .line 303
    aput v7, v0, v9

    .line 304
    .line 305
    iget-object v0, p0, Lcom/momo/xeengine/xnative/XEMotionManager$1;->this$0:Lcom/momo/xeengine/xnative/XEMotionManager;

    .line 306
    .line 307
    invoke-static {v0}, Lcom/momo/xeengine/xnative/XEMotionManager;->access$000(Lcom/momo/xeengine/xnative/XEMotionManager;)[F

    .line 308
    .line 309
    .line 310
    move-result-object v0

    .line 311
    iget-object v7, p0, Lcom/momo/xeengine/xnative/XEMotionManager$1;->rotationMatrix:[F

    .line 312
    .line 313
    aget v7, v7, v8

    .line 314
    .line 315
    neg-float v7, v7

    .line 316
    aput v7, v0, v8

    .line 317
    .line 318
    iget-object v0, p0, Lcom/momo/xeengine/xnative/XEMotionManager$1;->this$0:Lcom/momo/xeengine/xnative/XEMotionManager;

    .line 319
    .line 320
    invoke-static {v0}, Lcom/momo/xeengine/xnative/XEMotionManager;->access$000(Lcom/momo/xeengine/xnative/XEMotionManager;)[F

    .line 321
    .line 322
    .line 323
    move-result-object v0

    .line 324
    iget-object v7, p0, Lcom/momo/xeengine/xnative/XEMotionManager$1;->rotationMatrix:[F

    .line 325
    .line 326
    aget v7, v7, v5

    .line 327
    .line 328
    aput v7, v0, v6

    .line 329
    .line 330
    iget-object v0, p0, Lcom/momo/xeengine/xnative/XEMotionManager$1;->this$0:Lcom/momo/xeengine/xnative/XEMotionManager;

    .line 331
    .line 332
    invoke-static {v0}, Lcom/momo/xeengine/xnative/XEMotionManager;->access$000(Lcom/momo/xeengine/xnative/XEMotionManager;)[F

    .line 333
    .line 334
    .line 335
    move-result-object v0

    .line 336
    iget-object v7, p0, Lcom/momo/xeengine/xnative/XEMotionManager$1;->rotationMatrix:[F

    .line 337
    .line 338
    aget v7, v7, v3

    .line 339
    .line 340
    aput v7, v0, v4

    .line 341
    .line 342
    iget-object v0, p0, Lcom/momo/xeengine/xnative/XEMotionManager$1;->this$0:Lcom/momo/xeengine/xnative/XEMotionManager;

    .line 343
    .line 344
    invoke-static {v0}, Lcom/momo/xeengine/xnative/XEMotionManager;->access$000(Lcom/momo/xeengine/xnative/XEMotionManager;)[F

    .line 345
    .line 346
    .line 347
    move-result-object v0

    .line 348
    iget-object v7, p0, Lcom/momo/xeengine/xnative/XEMotionManager$1;->rotationMatrix:[F

    .line 349
    .line 350
    aget v7, v7, v1

    .line 351
    .line 352
    neg-float v7, v7

    .line 353
    aput v7, v0, v2

    .line 354
    .line 355
    iget-object v0, p0, Lcom/momo/xeengine/xnative/XEMotionManager$1;->this$0:Lcom/momo/xeengine/xnative/XEMotionManager;

    .line 356
    .line 357
    invoke-static {v0}, Lcom/momo/xeengine/xnative/XEMotionManager;->access$000(Lcom/momo/xeengine/xnative/XEMotionManager;)[F

    .line 358
    .line 359
    .line 360
    move-result-object v0

    .line 361
    iget-object v7, p0, Lcom/momo/xeengine/xnative/XEMotionManager$1;->rotationMatrix:[F

    .line 362
    .line 363
    aget v6, v7, v6

    .line 364
    .line 365
    aput v6, v0, v5

    .line 366
    .line 367
    iget-object v0, p0, Lcom/momo/xeengine/xnative/XEMotionManager$1;->this$0:Lcom/momo/xeengine/xnative/XEMotionManager;

    .line 368
    .line 369
    invoke-static {v0}, Lcom/momo/xeengine/xnative/XEMotionManager;->access$000(Lcom/momo/xeengine/xnative/XEMotionManager;)[F

    .line 370
    .line 371
    .line 372
    move-result-object v0

    .line 373
    iget-object v5, p0, Lcom/momo/xeengine/xnative/XEMotionManager$1;->rotationMatrix:[F

    .line 374
    .line 375
    aget v4, v5, v4

    .line 376
    .line 377
    aput v4, v0, v3

    .line 378
    .line 379
    iget-object v0, p0, Lcom/momo/xeengine/xnative/XEMotionManager$1;->this$0:Lcom/momo/xeengine/xnative/XEMotionManager;

    .line 380
    .line 381
    invoke-static {v0}, Lcom/momo/xeengine/xnative/XEMotionManager;->access$000(Lcom/momo/xeengine/xnative/XEMotionManager;)[F

    .line 382
    .line 383
    .line 384
    move-result-object v0

    .line 385
    iget-object p0, p0, Lcom/momo/xeengine/xnative/XEMotionManager$1;->rotationMatrix:[F

    .line 386
    .line 387
    aget p0, p0, v2

    .line 388
    .line 389
    neg-float p0, p0

    .line 390
    aput p0, v0, v1

    .line 391
    .line 392
    goto :goto_0

    .line 393
    :cond_2
    const/4 v10, 0x3

    .line 394
    if-ne v0, v10, :cond_3

    .line 395
    .line 396
    iget-object v0, p0, Lcom/momo/xeengine/xnative/XEMotionManager$1;->this$0:Lcom/momo/xeengine/xnative/XEMotionManager;

    .line 397
    .line 398
    invoke-static {v0}, Lcom/momo/xeengine/xnative/XEMotionManager;->access$000(Lcom/momo/xeengine/xnative/XEMotionManager;)[F

    .line 399
    .line 400
    .line 401
    move-result-object v0

    .line 402
    iget-object v10, p0, Lcom/momo/xeengine/xnative/XEMotionManager$1;->rotationMatrix:[F

    .line 403
    .line 404
    aget v10, v10, v9

    .line 405
    .line 406
    aput v10, v0, v7

    .line 407
    .line 408
    iget-object v0, p0, Lcom/momo/xeengine/xnative/XEMotionManager$1;->this$0:Lcom/momo/xeengine/xnative/XEMotionManager;

    .line 409
    .line 410
    invoke-static {v0}, Lcom/momo/xeengine/xnative/XEMotionManager;->access$000(Lcom/momo/xeengine/xnative/XEMotionManager;)[F

    .line 411
    .line 412
    .line 413
    move-result-object v0

    .line 414
    iget-object v10, p0, Lcom/momo/xeengine/xnative/XEMotionManager$1;->rotationMatrix:[F

    .line 415
    .line 416
    aget v7, v10, v7

    .line 417
    .line 418
    neg-float v7, v7

    .line 419
    aput v7, v0, v9

    .line 420
    .line 421
    iget-object v0, p0, Lcom/momo/xeengine/xnative/XEMotionManager$1;->this$0:Lcom/momo/xeengine/xnative/XEMotionManager;

    .line 422
    .line 423
    invoke-static {v0}, Lcom/momo/xeengine/xnative/XEMotionManager;->access$000(Lcom/momo/xeengine/xnative/XEMotionManager;)[F

    .line 424
    .line 425
    .line 426
    move-result-object v0

    .line 427
    iget-object v7, p0, Lcom/momo/xeengine/xnative/XEMotionManager$1;->rotationMatrix:[F

    .line 428
    .line 429
    aget v7, v7, v8

    .line 430
    .line 431
    neg-float v7, v7

    .line 432
    aput v7, v0, v8

    .line 433
    .line 434
    iget-object v0, p0, Lcom/momo/xeengine/xnative/XEMotionManager$1;->this$0:Lcom/momo/xeengine/xnative/XEMotionManager;

    .line 435
    .line 436
    invoke-static {v0}, Lcom/momo/xeengine/xnative/XEMotionManager;->access$000(Lcom/momo/xeengine/xnative/XEMotionManager;)[F

    .line 437
    .line 438
    .line 439
    move-result-object v0

    .line 440
    iget-object v7, p0, Lcom/momo/xeengine/xnative/XEMotionManager$1;->rotationMatrix:[F

    .line 441
    .line 442
    aget v7, v7, v3

    .line 443
    .line 444
    aput v7, v0, v6

    .line 445
    .line 446
    iget-object v0, p0, Lcom/momo/xeengine/xnative/XEMotionManager$1;->this$0:Lcom/momo/xeengine/xnative/XEMotionManager;

    .line 447
    .line 448
    invoke-static {v0}, Lcom/momo/xeengine/xnative/XEMotionManager;->access$000(Lcom/momo/xeengine/xnative/XEMotionManager;)[F

    .line 449
    .line 450
    .line 451
    move-result-object v0

    .line 452
    iget-object v7, p0, Lcom/momo/xeengine/xnative/XEMotionManager$1;->rotationMatrix:[F

    .line 453
    .line 454
    aget v7, v7, v5

    .line 455
    .line 456
    neg-float v7, v7

    .line 457
    aput v7, v0, v4

    .line 458
    .line 459
    iget-object v0, p0, Lcom/momo/xeengine/xnative/XEMotionManager$1;->this$0:Lcom/momo/xeengine/xnative/XEMotionManager;

    .line 460
    .line 461
    invoke-static {v0}, Lcom/momo/xeengine/xnative/XEMotionManager;->access$000(Lcom/momo/xeengine/xnative/XEMotionManager;)[F

    .line 462
    .line 463
    .line 464
    move-result-object v0

    .line 465
    iget-object v7, p0, Lcom/momo/xeengine/xnative/XEMotionManager$1;->rotationMatrix:[F

    .line 466
    .line 467
    aget v7, v7, v1

    .line 468
    .line 469
    neg-float v7, v7

    .line 470
    aput v7, v0, v2

    .line 471
    .line 472
    iget-object v0, p0, Lcom/momo/xeengine/xnative/XEMotionManager$1;->this$0:Lcom/momo/xeengine/xnative/XEMotionManager;

    .line 473
    .line 474
    invoke-static {v0}, Lcom/momo/xeengine/xnative/XEMotionManager;->access$000(Lcom/momo/xeengine/xnative/XEMotionManager;)[F

    .line 475
    .line 476
    .line 477
    move-result-object v0

    .line 478
    iget-object v7, p0, Lcom/momo/xeengine/xnative/XEMotionManager$1;->rotationMatrix:[F

    .line 479
    .line 480
    aget v4, v7, v4

    .line 481
    .line 482
    aput v4, v0, v5

    .line 483
    .line 484
    iget-object v0, p0, Lcom/momo/xeengine/xnative/XEMotionManager$1;->this$0:Lcom/momo/xeengine/xnative/XEMotionManager;

    .line 485
    .line 486
    invoke-static {v0}, Lcom/momo/xeengine/xnative/XEMotionManager;->access$000(Lcom/momo/xeengine/xnative/XEMotionManager;)[F

    .line 487
    .line 488
    .line 489
    move-result-object v0

    .line 490
    iget-object v4, p0, Lcom/momo/xeengine/xnative/XEMotionManager$1;->rotationMatrix:[F

    .line 491
    .line 492
    aget v4, v4, v6

    .line 493
    .line 494
    neg-float v4, v4

    .line 495
    aput v4, v0, v3

    .line 496
    .line 497
    iget-object v0, p0, Lcom/momo/xeengine/xnative/XEMotionManager$1;->this$0:Lcom/momo/xeengine/xnative/XEMotionManager;

    .line 498
    .line 499
    invoke-static {v0}, Lcom/momo/xeengine/xnative/XEMotionManager;->access$000(Lcom/momo/xeengine/xnative/XEMotionManager;)[F

    .line 500
    .line 501
    .line 502
    move-result-object v0

    .line 503
    iget-object p0, p0, Lcom/momo/xeengine/xnative/XEMotionManager$1;->rotationMatrix:[F

    .line 504
    .line 505
    aget p0, p0, v2

    .line 506
    .line 507
    neg-float p0, p0

    .line 508
    aput p0, v0, v1

    .line 509
    .line 510
    :cond_3
    :goto_0
    monitor-exit p1

    .line 511
    return-void

    .line 512
    :goto_1
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 513
    throw p0

    .line 514
    :cond_4
    return-void
.end method
