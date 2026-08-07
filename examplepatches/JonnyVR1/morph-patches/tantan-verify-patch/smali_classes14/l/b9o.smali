.class public abstract Ll/b9o;
.super Ll/z0u;
.source "SourceFile"

# interfaces
.implements Ll/p4u;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Landroid/view/View;",
        ">",
        "Ll/z0u<",
        "TV;>;",
        "Ll/p4u;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;Lcom/p1/mobile/putong/live/base/data/BLiveSettings;II)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/live/base/data/BLiveSettings;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Ll/z0u;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;Lcom/p1/mobile/putong/live/base/data/BLiveSettings;II)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public K()Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;
    .locals 11

    .line 1
    iget-object v0, p0, Ll/z0u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;->location:Lcom/p1/mobile/putong/data/Location;

    .line 6
    .line 7
    invoke-static {v0}, Ll/xau;->x(Lcom/p1/mobile/putong/data/Location;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    return-object p0

    .line 15
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iput-object v0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;->distance:Ljava/lang/String;

    .line 20
    .line 21
    iget-object v0, p0, Ll/z0u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 22
    .line 23
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->room:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;

    .line 24
    .line 25
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;->title:Ljava/lang/String;

    .line 26
    .line 27
    iput-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;->room_name:Ljava/lang/String;

    .line 28
    .line 29
    iget v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->memberCount:I

    .line 30
    .line 31
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iput-object v0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;->viewer:Ljava/lang/String;

    .line 36
    .line 37
    iget-object v0, p0, Ll/z0u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 38
    .line 39
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->specialLabel:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;

    .line 40
    .line 41
    if-nez v2, :cond_1

    .line 42
    .line 43
    const-string v2, ""

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;->value:Ljava/lang/String;

    .line 47
    .line 48
    :goto_0
    iput-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;->label_name:Ljava/lang/String;

    .line 49
    .line 50
    const-string v2, "0"

    .line 51
    .line 52
    iput-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;->have_red_packet:Ljava/lang/String;

    .line 53
    .line 54
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabelsV2:Ljava/util/List;

    .line 55
    .line 56
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    const/4 v2, 0x2

    .line 61
    const-string v3, "C"

    .line 62
    .line 63
    const-string v4, "B"

    .line 64
    .line 65
    const-string v5, "A"

    .line 66
    .line 67
    const/4 v6, -0x1

    .line 68
    const/4 v7, 0x1

    .line 69
    const/4 v8, 0x0

    .line 70
    if-nez v0, :cond_6

    .line 71
    .line 72
    move v0, v8

    .line 73
    :goto_1
    iget-object v9, p0, Ll/z0u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 74
    .line 75
    iget-object v9, v9, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabelsV2:Ljava/util/List;

    .line 76
    .line 77
    invoke-interface {v9}, Ljava/util/List;->size()I

    .line 78
    .line 79
    .line 80
    move-result v9

    .line 81
    iget-object v10, p0, Ll/z0u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 82
    .line 83
    if-ge v0, v9, :cond_5

    .line 84
    .line 85
    iget-object v9, v10, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabelsV2:Ljava/util/List;

    .line 86
    .line 87
    invoke-interface {v9, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    move-result-object v9

    .line 91
    check-cast v9, Lcom/p1/mobile/putong/live/base/data/BLiveCoverLabel;

    .line 92
    .line 93
    iget-object v9, v9, Lcom/p1/mobile/putong/live/base/data/BLiveCoverLabel;->type:Ljava/lang/String;

    .line 94
    .line 95
    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 96
    .line 97
    .line 98
    invoke-virtual {v9}, Ljava/lang/String;->hashCode()I

    .line 99
    .line 100
    .line 101
    move-result v10

    .line 102
    packed-switch v10, :pswitch_data_0

    .line 103
    .line 104
    .line 105
    :goto_2
    move v9, v6

    .line 106
    goto :goto_3

    .line 107
    :pswitch_0
    invoke-virtual {v9, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    move-result v9

    .line 111
    if-nez v9, :cond_2

    .line 112
    .line 113
    goto :goto_2

    .line 114
    :cond_2
    move v9, v2

    .line 115
    goto :goto_3

    .line 116
    :pswitch_1
    invoke-virtual {v9, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 117
    .line 118
    .line 119
    move-result v9

    .line 120
    if-nez v9, :cond_3

    .line 121
    .line 122
    goto :goto_2

    .line 123
    :cond_3
    move v9, v7

    .line 124
    goto :goto_3

    .line 125
    :pswitch_2
    invoke-virtual {v9, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 126
    .line 127
    .line 128
    move-result v9

    .line 129
    if-nez v9, :cond_4

    .line 130
    .line 131
    goto :goto_2

    .line 132
    :cond_4
    move v9, v8

    .line 133
    :goto_3
    packed-switch v9, :pswitch_data_1

    .line 134
    .line 135
    .line 136
    goto :goto_4

    .line 137
    :pswitch_3
    iget-object v9, p0, Ll/z0u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 138
    .line 139
    iget-object v9, v9, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabelsV2:Ljava/util/List;

    .line 140
    .line 141
    invoke-interface {v9, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 142
    .line 143
    .line 144
    move-result-object v9

    .line 145
    check-cast v9, Lcom/p1/mobile/putong/live/base/data/BLiveCoverLabel;

    .line 146
    .line 147
    iget-object v9, v9, Lcom/p1/mobile/putong/live/base/data/BLiveCoverLabel;->name:Ljava/lang/String;

    .line 148
    .line 149
    iput-object v9, v1, Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;->label_name_fixed:Ljava/lang/String;

    .line 150
    .line 151
    goto :goto_4

    .line 152
    :pswitch_4
    iget-object v9, p0, Ll/z0u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 153
    .line 154
    iget-object v9, v9, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabelsV2:Ljava/util/List;

    .line 155
    .line 156
    invoke-interface {v9, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 157
    .line 158
    .line 159
    move-result-object v9

    .line 160
    check-cast v9, Lcom/p1/mobile/putong/live/base/data/BLiveCoverLabel;

    .line 161
    .line 162
    iget-object v9, v9, Lcom/p1/mobile/putong/live/base/data/BLiveCoverLabel;->name:Ljava/lang/String;

    .line 163
    .line 164
    iput-object v9, v1, Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;->label_name_custom:Ljava/lang/String;

    .line 165
    .line 166
    goto :goto_4

    .line 167
    :pswitch_5
    iget-object v9, p0, Ll/z0u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 168
    .line 169
    iget-object v9, v9, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabelsV2:Ljava/util/List;

    .line 170
    .line 171
    invoke-interface {v9, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 172
    .line 173
    .line 174
    move-result-object v9

    .line 175
    check-cast v9, Lcom/p1/mobile/putong/live/base/data/BLiveCoverLabel;

    .line 176
    .line 177
    iget-object v9, v9, Lcom/p1/mobile/putong/live/base/data/BLiveCoverLabel;->name:Ljava/lang/String;

    .line 178
    .line 179
    iput-object v9, v1, Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;->label_name:Ljava/lang/String;

    .line 180
    .line 181
    :goto_4
    add-int/lit8 v0, v0, 0x1

    .line 182
    .line 183
    goto :goto_1

    .line 184
    :cond_5
    iget-object p0, v10, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabelsV2:Ljava/util/List;

    .line 185
    .line 186
    invoke-static {p0}, Ll/dwn;->e(Ljava/util/List;)Ljava/lang/String;

    .line 187
    .line 188
    .line 189
    move-result-object p0

    .line 190
    iput-object p0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;->have_red_packet:Ljava/lang/String;

    .line 191
    .line 192
    return-object v1

    .line 193
    :cond_6
    iget-object v0, p0, Ll/z0u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 194
    .line 195
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabels:Ljava/util/List;

    .line 196
    .line 197
    if-eqz v0, :cond_d

    .line 198
    .line 199
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 200
    .line 201
    .line 202
    move-result v0

    .line 203
    if-lez v0, :cond_d

    .line 204
    .line 205
    move v0, v8

    .line 206
    :goto_5
    iget-object v9, p0, Ll/z0u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 207
    .line 208
    iget-object v9, v9, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabels:Ljava/util/List;

    .line 209
    .line 210
    invoke-interface {v9}, Ljava/util/List;->size()I

    .line 211
    .line 212
    .line 213
    move-result v9

    .line 214
    iget-object v10, p0, Ll/z0u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 215
    .line 216
    if-ge v0, v9, :cond_c

    .line 217
    .line 218
    iget-object v9, v10, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabels:Ljava/util/List;

    .line 219
    .line 220
    invoke-interface {v9, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 221
    .line 222
    .line 223
    move-result-object v9

    .line 224
    check-cast v9, Lcom/p1/mobile/putong/live/base/data/BLiveCoverLabel;

    .line 225
    .line 226
    iget-object v9, v9, Lcom/p1/mobile/putong/live/base/data/BLiveCoverLabel;->type:Ljava/lang/String;

    .line 227
    .line 228
    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 229
    .line 230
    .line 231
    invoke-virtual {v9}, Ljava/lang/String;->hashCode()I

    .line 232
    .line 233
    .line 234
    move-result v10

    .line 235
    packed-switch v10, :pswitch_data_2

    .line 236
    .line 237
    .line 238
    :goto_6
    move v9, v6

    .line 239
    goto :goto_7

    .line 240
    :pswitch_6
    const-string v10, "E"

    .line 241
    .line 242
    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 243
    .line 244
    .line 245
    move-result v9

    .line 246
    if-nez v9, :cond_7

    .line 247
    .line 248
    goto :goto_6

    .line 249
    :cond_7
    const/4 v9, 0x4

    .line 250
    goto :goto_7

    .line 251
    :pswitch_7
    const-string v10, "D"

    .line 252
    .line 253
    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 254
    .line 255
    .line 256
    move-result v9

    .line 257
    if-nez v9, :cond_8

    .line 258
    .line 259
    goto :goto_6

    .line 260
    :cond_8
    const/4 v9, 0x3

    .line 261
    goto :goto_7

    .line 262
    :pswitch_8
    invoke-virtual {v9, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 263
    .line 264
    .line 265
    move-result v9

    .line 266
    if-nez v9, :cond_9

    .line 267
    .line 268
    goto :goto_6

    .line 269
    :cond_9
    move v9, v2

    .line 270
    goto :goto_7

    .line 271
    :pswitch_9
    invoke-virtual {v9, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 272
    .line 273
    .line 274
    move-result v9

    .line 275
    if-nez v9, :cond_a

    .line 276
    .line 277
    goto :goto_6

    .line 278
    :cond_a
    move v9, v7

    .line 279
    goto :goto_7

    .line 280
    :pswitch_a
    invoke-virtual {v9, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 281
    .line 282
    .line 283
    move-result v9

    .line 284
    if-nez v9, :cond_b

    .line 285
    .line 286
    goto :goto_6

    .line 287
    :cond_b
    move v9, v8

    .line 288
    :goto_7
    packed-switch v9, :pswitch_data_3

    .line 289
    .line 290
    .line 291
    goto :goto_8

    .line 292
    :pswitch_b
    iget-object v9, p0, Ll/z0u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 293
    .line 294
    iget-object v9, v9, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabels:Ljava/util/List;

    .line 295
    .line 296
    invoke-interface {v9, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 297
    .line 298
    .line 299
    move-result-object v9

    .line 300
    check-cast v9, Lcom/p1/mobile/putong/live/base/data/BLiveCoverLabel;

    .line 301
    .line 302
    iget-object v9, v9, Lcom/p1/mobile/putong/live/base/data/BLiveCoverLabel;->name:Ljava/lang/String;

    .line 303
    .line 304
    iput-object v9, v1, Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;->state_label:Ljava/lang/String;

    .line 305
    .line 306
    goto :goto_8

    .line 307
    :pswitch_c
    iget-object v9, p0, Ll/z0u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 308
    .line 309
    iget-object v9, v9, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabels:Ljava/util/List;

    .line 310
    .line 311
    invoke-interface {v9, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 312
    .line 313
    .line 314
    move-result-object v9

    .line 315
    check-cast v9, Lcom/p1/mobile/putong/live/base/data/BLiveCoverLabel;

    .line 316
    .line 317
    iget-object v9, v9, Lcom/p1/mobile/putong/live/base/data/BLiveCoverLabel;->name:Ljava/lang/String;

    .line 318
    .line 319
    iput-object v9, v1, Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;->label_name_tool:Ljava/lang/String;

    .line 320
    .line 321
    goto :goto_8

    .line 322
    :pswitch_d
    iget-object v9, p0, Ll/z0u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 323
    .line 324
    iget-object v9, v9, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabels:Ljava/util/List;

    .line 325
    .line 326
    invoke-interface {v9, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 327
    .line 328
    .line 329
    move-result-object v9

    .line 330
    check-cast v9, Lcom/p1/mobile/putong/live/base/data/BLiveCoverLabel;

    .line 331
    .line 332
    iget-object v9, v9, Lcom/p1/mobile/putong/live/base/data/BLiveCoverLabel;->name:Ljava/lang/String;

    .line 333
    .line 334
    iput-object v9, v1, Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;->label_name_sp:Ljava/lang/String;

    .line 335
    .line 336
    goto :goto_8

    .line 337
    :pswitch_e
    iget-object v9, p0, Ll/z0u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 338
    .line 339
    iget-object v9, v9, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabels:Ljava/util/List;

    .line 340
    .line 341
    invoke-interface {v9, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 342
    .line 343
    .line 344
    move-result-object v9

    .line 345
    check-cast v9, Lcom/p1/mobile/putong/live/base/data/BLiveCoverLabel;

    .line 346
    .line 347
    iget-object v9, v9, Lcom/p1/mobile/putong/live/base/data/BLiveCoverLabel;->name:Ljava/lang/String;

    .line 348
    .line 349
    iput-object v9, v1, Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;->label_name_top:Ljava/lang/String;

    .line 350
    .line 351
    goto :goto_8

    .line 352
    :pswitch_f
    iget-object v9, p0, Ll/z0u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 353
    .line 354
    iget-object v9, v9, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabels:Ljava/util/List;

    .line 355
    .line 356
    invoke-interface {v9, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 357
    .line 358
    .line 359
    move-result-object v9

    .line 360
    check-cast v9, Lcom/p1/mobile/putong/live/base/data/BLiveCoverLabel;

    .line 361
    .line 362
    iget-object v9, v9, Lcom/p1/mobile/putong/live/base/data/BLiveCoverLabel;->name:Ljava/lang/String;

    .line 363
    .line 364
    iput-object v9, v1, Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;->label_name:Ljava/lang/String;

    .line 365
    .line 366
    :goto_8
    add-int/lit8 v0, v0, 0x1

    .line 367
    .line 368
    goto/16 :goto_5

    .line 369
    .line 370
    :cond_c
    iget-object p0, v10, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabels:Ljava/util/List;

    .line 371
    .line 372
    invoke-static {p0}, Ll/dwn;->e(Ljava/util/List;)Ljava/lang/String;

    .line 373
    .line 374
    .line 375
    move-result-object p0

    .line 376
    iput-object p0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;->have_red_packet:Ljava/lang/String;

    .line 377
    .line 378
    :cond_d
    return-object v1

    .line 379
    :pswitch_data_0
    .packed-switch 0x41
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    .line 380
    .line 381
    .line 382
    .line 383
    .line 384
    .line 385
    .line 386
    .line 387
    .line 388
    .line 389
    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_3
    .end packed-switch

    .line 390
    .line 391
    .line 392
    .line 393
    .line 394
    .line 395
    .line 396
    .line 397
    .line 398
    .line 399
    :pswitch_data_2
    .packed-switch 0x41
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
    .end packed-switch

    .line 400
    .line 401
    .line 402
    .line 403
    .line 404
    .line 405
    .line 406
    .line 407
    .line 408
    .line 409
    .line 410
    .line 411
    .line 412
    .line 413
    :pswitch_data_3
    .packed-switch 0x0
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
    .end packed-switch
.end method
