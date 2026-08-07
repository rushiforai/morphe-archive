.class public synthetic Ll/j690$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/j690;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1009
    name = null
.end annotation


# static fields
.field public static final synthetic a:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Privilege;->values()[Lcom/p1/mobile/putong/core/data/Privilege;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    array-length v0, v0

    .line 6
    new-array v0, v0, [I

    .line 7
    .line 8
    sput-object v0, Ll/j690$a;->a:[I

    .line 9
    .line 10
    :try_start_0
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->superlike_pkg:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 11
    .line 12
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    const/4 v2, 0x1

    .line 17
    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    .line 18
    .line 19
    :catch_0
    :try_start_1
    sget-object v0, Ll/j690$a;->a:[I

    .line 20
    .line 21
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->likeNoLimit_pkg:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 22
    .line 23
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    const/4 v2, 0x2

    .line 28
    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    .line 29
    .line 30
    :catch_1
    :try_start_2
    sget-object v0, Ll/j690$a;->a:[I

    .line 31
    .line 32
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->roaming_pkg:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 33
    .line 34
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    const/4 v2, 0x3

    .line 39
    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_2

    .line 40
    .line 41
    :catch_2
    :try_start_3
    sget-object v0, Ll/j690$a;->a:[I

    .line 42
    .line 43
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->undo_pkg:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 44
    .line 45
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    const/4 v2, 0x4

    .line 50
    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_3

    .line 51
    .line 52
    :catch_3
    :try_start_4
    sget-object v0, Ll/j690$a;->a:[I

    .line 53
    .line 54
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->intl_no_ad:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 55
    .line 56
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    const/4 v2, 0x5

    .line 61
    aput v2, v0, v1
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_4

    .line 62
    .line 63
    :catch_4
    :try_start_5
    sget-object v0, Ll/j690$a;->a:[I

    .line 64
    .line 65
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->vip_super_like:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 66
    .line 67
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    const/4 v2, 0x6

    .line 72
    aput v2, v0, v1
    :try_end_5
    .catch Ljava/lang/NoSuchFieldError; {:try_start_5 .. :try_end_5} :catch_5

    .line 73
    .line 74
    :catch_5
    :try_start_6
    sget-object v0, Ll/j690$a;->a:[I

    .line 75
    .line 76
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->vip_undo:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 77
    .line 78
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    const/4 v2, 0x7

    .line 83
    aput v2, v0, v1
    :try_end_6
    .catch Ljava/lang/NoSuchFieldError; {:try_start_6 .. :try_end_6} :catch_6

    .line 84
    .line 85
    :catch_6
    :try_start_7
    sget-object v0, Ll/j690$a;->a:[I

    .line 86
    .line 87
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->vip_unlimited_likes:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 88
    .line 89
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    const/16 v2, 0x8

    .line 94
    .line 95
    aput v2, v0, v1
    :try_end_7
    .catch Ljava/lang/NoSuchFieldError; {:try_start_7 .. :try_end_7} :catch_7

    .line 96
    .line 97
    :catch_7
    :try_start_8
    sget-object v0, Ll/j690$a;->a:[I

    .line 98
    .line 99
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->vip_location:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 100
    .line 101
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 102
    .line 103
    .line 104
    move-result v1

    .line 105
    const/16 v2, 0x9

    .line 106
    .line 107
    aput v2, v0, v1
    :try_end_8
    .catch Ljava/lang/NoSuchFieldError; {:try_start_8 .. :try_end_8} :catch_8

    .line 108
    .line 109
    :catch_8
    :try_start_9
    sget-object v0, Ll/j690$a;->a:[I

    .line 110
    .line 111
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->vip_badge:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 112
    .line 113
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 114
    .line 115
    .line 116
    move-result v1

    .line 117
    const/16 v2, 0xa

    .line 118
    .line 119
    aput v2, v0, v1
    :try_end_9
    .catch Ljava/lang/NoSuchFieldError; {:try_start_9 .. :try_end_9} :catch_9

    .line 120
    .line 121
    :catch_9
    :try_start_a
    sget-object v0, Ll/j690$a;->a:[I

    .line 122
    .line 123
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->vip_independent_super_like:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 124
    .line 125
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 126
    .line 127
    .line 128
    move-result v1

    .line 129
    const/16 v2, 0xb

    .line 130
    .line 131
    aput v2, v0, v1
    :try_end_a
    .catch Ljava/lang/NoSuchFieldError; {:try_start_a .. :try_end_a} :catch_a

    .line 132
    .line 133
    :catch_a
    :try_start_b
    sget-object v0, Ll/j690$a;->a:[I

    .line 134
    .line 135
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->boost:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 136
    .line 137
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 138
    .line 139
    .line 140
    move-result v1

    .line 141
    const/16 v2, 0xc

    .line 142
    .line 143
    aput v2, v0, v1
    :try_end_b
    .catch Ljava/lang/NoSuchFieldError; {:try_start_b .. :try_end_b} :catch_b

    .line 144
    .line 145
    :catch_b
    :try_start_c
    sget-object v0, Ll/j690$a;->a:[I

    .line 146
    .line 147
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->see_not_match_guide:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 148
    .line 149
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 150
    .line 151
    .line 152
    move-result v1

    .line 153
    const/16 v2, 0xd

    .line 154
    .line 155
    aput v2, v0, v1
    :try_end_c
    .catch Ljava/lang/NoSuchFieldError; {:try_start_c .. :try_end_c} :catch_c

    .line 156
    .line 157
    :catch_c
    :try_start_d
    sget-object v0, Ll/j690$a;->a:[I

    .line 158
    .line 159
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->see_who_likes_me:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 160
    .line 161
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 162
    .line 163
    .line 164
    move-result v1

    .line 165
    const/16 v2, 0xe

    .line 166
    .line 167
    aput v2, v0, v1
    :try_end_d
    .catch Ljava/lang/NoSuchFieldError; {:try_start_d .. :try_end_d} :catch_d

    .line 168
    .line 169
    :catch_d
    :try_start_e
    sget-object v0, Ll/j690$a;->a:[I

    .line 170
    .line 171
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->online_match_tickets:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 172
    .line 173
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 174
    .line 175
    .line 176
    move-result v1

    .line 177
    const/16 v2, 0xf

    .line 178
    .line 179
    aput v2, v0, v1
    :try_end_e
    .catch Ljava/lang/NoSuchFieldError; {:try_start_e .. :try_end_e} :catch_e

    .line 180
    .line 181
    :catch_e
    :try_start_f
    sget-object v0, Ll/j690$a;->a:[I

    .line 182
    .line 183
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->voice_quick_chat:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 184
    .line 185
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 186
    .line 187
    .line 188
    move-result v1

    .line 189
    const/16 v2, 0x10

    .line 190
    .line 191
    aput v2, v0, v1
    :try_end_f
    .catch Ljava/lang/NoSuchFieldError; {:try_start_f .. :try_end_f} :catch_f

    .line 192
    .line 193
    :catch_f
    :try_start_10
    sget-object v0, Ll/j690$a;->a:[I

    .line 194
    .line 195
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->privacy_membership:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 196
    .line 197
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 198
    .line 199
    .line 200
    move-result v1

    .line 201
    const/16 v2, 0x11

    .line 202
    .line 203
    aput v2, v0, v1
    :try_end_10
    .catch Ljava/lang/NoSuchFieldError; {:try_start_10 .. :try_end_10} :catch_10

    .line 204
    .line 205
    :catch_10
    :try_start_11
    sget-object v0, Ll/j690$a;->a:[I

    .line 206
    .line 207
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->message_read_state:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 208
    .line 209
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 210
    .line 211
    .line 212
    move-result v1

    .line 213
    const/16 v2, 0x12

    .line 214
    .line 215
    aput v2, v0, v1
    :try_end_11
    .catch Ljava/lang/NoSuchFieldError; {:try_start_11 .. :try_end_11} :catch_11

    .line 216
    .line 217
    :catch_11
    :try_start_12
    sget-object v0, Ll/j690$a;->a:[I

    .line 218
    .line 219
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->recover_unmatches:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 220
    .line 221
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 222
    .line 223
    .line 224
    move-result v1

    .line 225
    const/16 v2, 0x13

    .line 226
    .line 227
    aput v2, v0, v1
    :try_end_12
    .catch Ljava/lang/NoSuchFieldError; {:try_start_12 .. :try_end_12} :catch_12

    .line 228
    .line 229
    :catch_12
    :try_start_13
    sget-object v0, Ll/j690$a;->a:[I

    .line 230
    .line 231
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->svip_badge:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 232
    .line 233
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 234
    .line 235
    .line 236
    move-result v1

    .line 237
    const/16 v2, 0x14

    .line 238
    .line 239
    aput v2, v0, v1
    :try_end_13
    .catch Ljava/lang/NoSuchFieldError; {:try_start_13 .. :try_end_13} :catch_13

    .line 240
    .line 241
    :catch_13
    :try_start_14
    sget-object v0, Ll/j690$a;->a:[I

    .line 242
    .line 243
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->letter:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 244
    .line 245
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 246
    .line 247
    .line 248
    move-result v1

    .line 249
    const/16 v2, 0x15

    .line 250
    .line 251
    aput v2, v0, v1
    :try_end_14
    .catch Ljava/lang/NoSuchFieldError; {:try_start_14 .. :try_end_14} :catch_14

    .line 252
    .line 253
    :catch_14
    :try_start_15
    sget-object v0, Ll/j690$a;->a:[I

    .line 254
    .line 255
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->greet:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 256
    .line 257
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 258
    .line 259
    .line 260
    move-result v1

    .line 261
    const/16 v2, 0x16

    .line 262
    .line 263
    aput v2, v0, v1
    :try_end_15
    .catch Ljava/lang/NoSuchFieldError; {:try_start_15 .. :try_end_15} :catch_15

    .line 264
    .line 265
    :catch_15
    :try_start_16
    sget-object v0, Ll/j690$a;->a:[I

    .line 266
    .line 267
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->top_like:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 268
    .line 269
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 270
    .line 271
    .line 272
    move-result v1

    .line 273
    const/16 v2, 0x17

    .line 274
    .line 275
    aput v2, v0, v1
    :try_end_16
    .catch Ljava/lang/NoSuchFieldError; {:try_start_16 .. :try_end_16} :catch_16

    .line 276
    .line 277
    :catch_16
    :try_start_17
    sget-object v0, Ll/j690$a;->a:[I

    .line 278
    .line 279
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->top_chat:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 280
    .line 281
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 282
    .line 283
    .line 284
    move-result v1

    .line 285
    const/16 v2, 0x18

    .line 286
    .line 287
    aput v2, v0, v1
    :try_end_17
    .catch Ljava/lang/NoSuchFieldError; {:try_start_17 .. :try_end_17} :catch_17

    .line 288
    .line 289
    :catch_17
    :try_start_18
    sget-object v0, Ll/j690$a;->a:[I

    .line 290
    .line 291
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->vip_greet:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 292
    .line 293
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 294
    .line 295
    .line 296
    move-result v1

    .line 297
    const/16 v2, 0x19

    .line 298
    .line 299
    aput v2, v0, v1
    :try_end_18
    .catch Ljava/lang/NoSuchFieldError; {:try_start_18 .. :try_end_18} :catch_18

    .line 300
    .line 301
    :catch_18
    :try_start_19
    sget-object v0, Ll/j690$a;->a:[I

    .line 302
    .line 303
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->svip_greet:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 304
    .line 305
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 306
    .line 307
    .line 308
    move-result v1

    .line 309
    const/16 v2, 0x1a

    .line 310
    .line 311
    aput v2, v0, v1
    :try_end_19
    .catch Ljava/lang/NoSuchFieldError; {:try_start_19 .. :try_end_19} :catch_19

    .line 312
    .line 313
    :catch_19
    :try_start_1a
    sget-object v0, Ll/j690$a;->a:[I

    .line 314
    .line 315
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->leave_message:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 316
    .line 317
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 318
    .line 319
    .line 320
    move-result v1

    .line 321
    const/16 v2, 0x1b

    .line 322
    .line 323
    aput v2, v0, v1
    :try_end_1a
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1a .. :try_end_1a} :catch_1a

    .line 324
    .line 325
    :catch_1a
    :try_start_1b
    sget-object v0, Ll/j690$a;->a:[I

    .line 326
    .line 327
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->vip_letter_gp:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 328
    .line 329
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 330
    .line 331
    .line 332
    move-result v1

    .line 333
    const/16 v2, 0x1c

    .line 334
    .line 335
    aput v2, v0, v1
    :try_end_1b
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1b .. :try_end_1b} :catch_1b

    .line 336
    .line 337
    :catch_1b
    :try_start_1c
    sget-object v0, Ll/j690$a;->a:[I

    .line 338
    .line 339
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->advanced_filter:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 340
    .line 341
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 342
    .line 343
    .line 344
    move-result v1

    .line 345
    const/16 v2, 0x1d

    .line 346
    .line 347
    aput v2, v0, v1
    :try_end_1c
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1c .. :try_end_1c} :catch_1c

    .line 348
    .line 349
    :catch_1c
    :try_start_1d
    sget-object v0, Ll/j690$a;->a:[I

    .line 350
    .line 351
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->vip_membership_active_time_gp:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 352
    .line 353
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 354
    .line 355
    .line 356
    move-result v1

    .line 357
    const/16 v2, 0x1e

    .line 358
    .line 359
    aput v2, v0, v1
    :try_end_1d
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1d .. :try_end_1d} :catch_1d

    .line 360
    .line 361
    :catch_1d
    :try_start_1e
    sget-object v0, Ll/j690$a;->a:[I

    .line 362
    .line 363
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->vip_membership_read_gp:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 364
    .line 365
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 366
    .line 367
    .line 368
    move-result v1

    .line 369
    const/16 v2, 0x1f

    .line 370
    .line 371
    aput v2, v0, v1
    :try_end_1e
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1e .. :try_end_1e} :catch_1e

    .line 372
    .line 373
    :catch_1e
    :try_start_1f
    sget-object v0, Ll/j690$a;->a:[I

    .line 374
    .line 375
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->vip_membership_remark_gp:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 376
    .line 377
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 378
    .line 379
    .line 380
    move-result v1

    .line 381
    const/16 v2, 0x20

    .line 382
    .line 383
    aput v2, v0, v1
    :try_end_1f
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1f .. :try_end_1f} :catch_1f

    .line 384
    .line 385
    :catch_1f
    :try_start_20
    sget-object v0, Ll/j690$a;->a:[I

    .line 386
    .line 387
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->vip_membership_search_gp:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 388
    .line 389
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 390
    .line 391
    .line 392
    move-result v1

    .line 393
    const/16 v2, 0x21

    .line 394
    .line 395
    aput v2, v0, v1
    :try_end_20
    .catch Ljava/lang/NoSuchFieldError; {:try_start_20 .. :try_end_20} :catch_20

    .line 396
    .line 397
    :catch_20
    :try_start_21
    sget-object v0, Ll/j690$a;->a:[I

    .line 398
    .line 399
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->liked_user:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 400
    .line 401
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 402
    .line 403
    .line 404
    move-result v1

    .line 405
    const/16 v2, 0x22

    .line 406
    .line 407
    aput v2, v0, v1
    :try_end_21
    .catch Ljava/lang/NoSuchFieldError; {:try_start_21 .. :try_end_21} :catch_21

    .line 408
    .line 409
    :catch_21
    :try_start_22
    sget-object v0, Ll/j690$a;->a:[I

    .line 410
    .line 411
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->vip_message_block_gp:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 412
    .line 413
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 414
    .line 415
    .line 416
    move-result v1

    .line 417
    const/16 v2, 0x23

    .line 418
    .line 419
    aput v2, v0, v1
    :try_end_22
    .catch Ljava/lang/NoSuchFieldError; {:try_start_22 .. :try_end_22} :catch_22

    .line 420
    .line 421
    :catch_22
    :try_start_23
    sget-object v0, Ll/j690$a;->a:[I

    .line 422
    .line 423
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->see_theme_unlock_more:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 424
    .line 425
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 426
    .line 427
    .line 428
    move-result v1

    .line 429
    const/16 v2, 0x24

    .line 430
    .line 431
    aput v2, v0, v1
    :try_end_23
    .catch Ljava/lang/NoSuchFieldError; {:try_start_23 .. :try_end_23} :catch_23

    .line 432
    .line 433
    :catch_23
    :try_start_24
    sget-object v0, Ll/j690$a;->a:[I

    .line 434
    .line 435
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->see_theme_unlock_pop:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 436
    .line 437
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 438
    .line 439
    .line 440
    move-result v1

    .line 441
    const/16 v2, 0x25

    .line 442
    .line 443
    aput v2, v0, v1
    :try_end_24
    .catch Ljava/lang/NoSuchFieldError; {:try_start_24 .. :try_end_24} :catch_24

    .line 444
    .line 445
    :catch_24
    :try_start_25
    sget-object v0, Ll/j690$a;->a:[I

    .line 446
    .line 447
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->see_theme_unlock_online:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 448
    .line 449
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 450
    .line 451
    .line 452
    move-result v1

    .line 453
    const/16 v2, 0x26

    .line 454
    .line 455
    aput v2, v0, v1
    :try_end_25
    .catch Ljava/lang/NoSuchFieldError; {:try_start_25 .. :try_end_25} :catch_25

    .line 456
    .line 457
    :catch_25
    :try_start_26
    sget-object v0, Ll/j690$a;->a:[I

    .line 458
    .line 459
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->see_letter_gp:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 460
    .line 461
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 462
    .line 463
    .line 464
    move-result v1

    .line 465
    const/16 v2, 0x27

    .line 466
    .line 467
    aput v2, v0, v1
    :try_end_26
    .catch Ljava/lang/NoSuchFieldError; {:try_start_26 .. :try_end_26} :catch_26

    .line 468
    .line 469
    :catch_26
    :try_start_27
    sget-object v0, Ll/j690$a;->a:[I

    .line 470
    .line 471
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->svipPicksMembership:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 472
    .line 473
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 474
    .line 475
    .line 476
    move-result v1

    .line 477
    const/16 v2, 0x28

    .line 478
    .line 479
    aput v2, v0, v1
    :try_end_27
    .catch Ljava/lang/NoSuchFieldError; {:try_start_27 .. :try_end_27} :catch_27

    .line 480
    .line 481
    :catch_27
    :try_start_28
    sget-object v0, Ll/j690$a;->a:[I

    .line 482
    .line 483
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->picksMembership:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 484
    .line 485
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 486
    .line 487
    .line 488
    move-result v1

    .line 489
    const/16 v2, 0x29

    .line 490
    .line 491
    aput v2, v0, v1
    :try_end_28
    .catch Ljava/lang/NoSuchFieldError; {:try_start_28 .. :try_end_28} :catch_28

    .line 492
    .line 493
    :catch_28
    :try_start_29
    sget-object v0, Ll/j690$a;->a:[I

    .line 494
    .line 495
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->oDiamondSvipExtra:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 496
    .line 497
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 498
    .line 499
    .line 500
    move-result v1

    .line 501
    const/16 v2, 0x2a

    .line 502
    .line 503
    aput v2, v0, v1
    :try_end_29
    .catch Ljava/lang/NoSuchFieldError; {:try_start_29 .. :try_end_29} :catch_29

    .line 504
    .line 505
    :catch_29
    :try_start_2a
    sget-object v0, Ll/j690$a;->a:[I

    .line 506
    .line 507
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->oDiamondSvipSkin:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 508
    .line 509
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 510
    .line 511
    .line 512
    move-result v1

    .line 513
    const/16 v2, 0x2b

    .line 514
    .line 515
    aput v2, v0, v1
    :try_end_2a
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2a .. :try_end_2a} :catch_2a

    .line 516
    .line 517
    :catch_2a
    :try_start_2b
    sget-object v0, Ll/j690$a;->a:[I

    .line 518
    .line 519
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->oDiamondGreetings:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 520
    .line 521
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 522
    .line 523
    .line 524
    move-result v1

    .line 525
    const/16 v2, 0x2c

    .line 526
    .line 527
    aput v2, v0, v1
    :try_end_2b
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2b .. :try_end_2b} :catch_2b

    .line 528
    .line 529
    :catch_2b
    :try_start_2c
    sget-object v0, Ll/j690$a;->a:[I

    .line 530
    .line 531
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->oDiamondVisitor:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 532
    .line 533
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 534
    .line 535
    .line 536
    move-result v1

    .line 537
    const/16 v2, 0x2d

    .line 538
    .line 539
    aput v2, v0, v1
    :try_end_2c
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2c .. :try_end_2c} :catch_2c

    .line 540
    .line 541
    :catch_2c
    :try_start_2d
    sget-object v0, Ll/j690$a;->a:[I

    .line 542
    .line 543
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->loveBuzz:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 544
    .line 545
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 546
    .line 547
    .line 548
    move-result v1

    .line 549
    const/16 v2, 0x2e

    .line 550
    .line 551
    aput v2, v0, v1
    :try_end_2d
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2d .. :try_end_2d} :catch_2d

    .line 552
    .line 553
    :catch_2d
    :try_start_2e
    sget-object v0, Ll/j690$a;->a:[I

    .line 554
    .line 555
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->intl_advanced_filter:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 556
    .line 557
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 558
    .line 559
    .line 560
    move-result v1

    .line 561
    const/16 v2, 0x2f

    .line 562
    .line 563
    aput v2, v0, v1
    :try_end_2e
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2e .. :try_end_2e} :catch_2e

    .line 564
    .line 565
    :catch_2e
    :try_start_2f
    sget-object v0, Ll/j690$a;->a:[I

    .line 566
    .line 567
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->intl_visitor:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 568
    .line 569
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 570
    .line 571
    .line 572
    move-result v1

    .line 573
    const/16 v2, 0x30

    .line 574
    .line 575
    aput v2, v0, v1
    :try_end_2f
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2f .. :try_end_2f} :catch_2f

    .line 576
    .line 577
    :catch_2f
    :try_start_30
    sget-object v0, Ll/j690$a;->a:[I

    .line 578
    .line 579
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->premium_compliment:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 580
    .line 581
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 582
    .line 583
    .line 584
    move-result v1

    .line 585
    const/16 v2, 0x31

    .line 586
    .line 587
    aput v2, v0, v1
    :try_end_30
    .catch Ljava/lang/NoSuchFieldError; {:try_start_30 .. :try_end_30} :catch_30

    .line 588
    .line 589
    :catch_30
    :try_start_31
    sget-object v0, Ll/j690$a;->a:[I

    .line 590
    .line 591
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->immediately_match:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 592
    .line 593
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 594
    .line 595
    .line 596
    move-result v1

    .line 597
    const/16 v2, 0x32

    .line 598
    .line 599
    aput v2, v0, v1
    :try_end_31
    .catch Ljava/lang/NoSuchFieldError; {:try_start_31 .. :try_end_31} :catch_31

    .line 600
    .line 601
    :catch_31
    :try_start_32
    sget-object v0, Ll/j690$a;->a:[I

    .line 602
    .line 603
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->live_entry_animation:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 604
    .line 605
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 606
    .line 607
    .line 608
    move-result v1

    .line 609
    const/16 v2, 0x33

    .line 610
    .line 611
    aput v2, v0, v1
    :try_end_32
    .catch Ljava/lang/NoSuchFieldError; {:try_start_32 .. :try_end_32} :catch_32

    .line 612
    .line 613
    :catch_32
    :try_start_33
    sget-object v0, Ll/j690$a;->a:[I

    .line 614
    .line 615
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->customer_service:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 616
    .line 617
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 618
    .line 619
    .line 620
    move-result v1

    .line 621
    const/16 v2, 0x34

    .line 622
    .line 623
    aput v2, v0, v1
    :try_end_33
    .catch Ljava/lang/NoSuchFieldError; {:try_start_33 .. :try_end_33} :catch_33

    .line 624
    .line 625
    :catch_33
    :try_start_34
    sget-object v0, Ll/j690$a;->a:[I

    .line 626
    .line 627
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->say_hi_pkg:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 628
    .line 629
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 630
    .line 631
    .line 632
    move-result v1

    .line 633
    const/16 v2, 0x35

    .line 634
    .line 635
    aput v2, v0, v1
    :try_end_34
    .catch Ljava/lang/NoSuchFieldError; {:try_start_34 .. :try_end_34} :catch_34

    .line 636
    .line 637
    :catch_34
    :try_start_35
    sget-object v0, Ll/j690$a;->a:[I

    .line 638
    .line 639
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->moment_boost:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 640
    .line 641
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 642
    .line 643
    .line 644
    move-result v1

    .line 645
    const/16 v2, 0x36

    .line 646
    .line 647
    aput v2, v0, v1
    :try_end_35
    .catch Ljava/lang/NoSuchFieldError; {:try_start_35 .. :try_end_35} :catch_35

    .line 648
    .line 649
    :catch_35
    :try_start_36
    sget-object v0, Ll/j690$a;->a:[I

    .line 650
    .line 651
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->accelerate_pairing:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 652
    .line 653
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 654
    .line 655
    .line 656
    move-result v1

    .line 657
    const/16 v2, 0x37

    .line 658
    .line 659
    aput v2, v0, v1
    :try_end_36
    .catch Ljava/lang/NoSuchFieldError; {:try_start_36 .. :try_end_36} :catch_36

    .line 660
    .line 661
    :catch_36
    :try_start_37
    sget-object v0, Ll/j690$a;->a:[I

    .line 662
    .line 663
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->city_topping:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 664
    .line 665
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 666
    .line 667
    .line 668
    move-result v1

    .line 669
    const/16 v2, 0x38

    .line 670
    .line 671
    aput v2, v0, v1
    :try_end_37
    .catch Ljava/lang/NoSuchFieldError; {:try_start_37 .. :try_end_37} :catch_37

    .line 672
    .line 673
    :catch_37
    :try_start_38
    sget-object v0, Ll/j690$a;->a:[I

    .line 674
    .line 675
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->personal_customization:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 676
    .line 677
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 678
    .line 679
    .line 680
    move-result v1

    .line 681
    const/16 v2, 0x39

    .line 682
    .line 683
    aput v2, v0, v1
    :try_end_38
    .catch Ljava/lang/NoSuchFieldError; {:try_start_38 .. :try_end_38} :catch_38

    .line 684
    .line 685
    :catch_38
    :try_start_39
    sget-object v0, Ll/j690$a;->a:[I

    .line 686
    .line 687
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->mysterious_mode:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 688
    .line 689
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 690
    .line 691
    .line 692
    move-result v1

    .line 693
    const/16 v2, 0x3a

    .line 694
    .line 695
    aput v2, v0, v1
    :try_end_39
    .catch Ljava/lang/NoSuchFieldError; {:try_start_39 .. :try_end_39} :catch_39

    .line 696
    .line 697
    :catch_39
    :try_start_3a
    sget-object v0, Ll/j690$a;->a:[I

    .line 698
    .line 699
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->nearby_people:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 700
    .line 701
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 702
    .line 703
    .line 704
    move-result v1

    .line 705
    const/16 v2, 0x3b

    .line 706
    .line 707
    aput v2, v0, v1
    :try_end_3a
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3a .. :try_end_3a} :catch_3a

    .line 708
    .line 709
    :catch_3a
    :try_start_3b
    sget-object v0, Ll/j690$a;->a:[I

    .line 710
    .line 711
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->exclusive_dressing_up:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 712
    .line 713
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 714
    .line 715
    .line 716
    move-result v1

    .line 717
    const/16 v2, 0x3c

    .line 718
    .line 719
    aput v2, v0, v1
    :try_end_3b
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3b .. :try_end_3b} :catch_3b

    .line 720
    .line 721
    :catch_3b
    :try_start_3c
    sget-object v0, Ll/j690$a;->a:[I

    .line 722
    .line 723
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->visitor_hide_footprint:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 724
    .line 725
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 726
    .line 727
    .line 728
    move-result v1

    .line 729
    const/16 v2, 0x3d

    .line 730
    .line 731
    aput v2, v0, v1
    :try_end_3c
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3c .. :try_end_3c} :catch_3c

    .line 732
    .line 733
    :catch_3c
    :try_start_3d
    sget-object v0, Ll/j690$a;->a:[I

    .line 734
    .line 735
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->confession_first:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 736
    .line 737
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 738
    .line 739
    .line 740
    move-result v1

    .line 741
    const/16 v2, 0x3e

    .line 742
    .line 743
    aput v2, v0, v1
    :try_end_3d
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3d .. :try_end_3d} :catch_3d

    .line 744
    .line 745
    :catch_3d
    :try_start_3e
    sget-object v0, Ll/j690$a;->a:[I

    .line 746
    .line 747
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->pick_tantan_credits_users:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 748
    .line 749
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 750
    .line 751
    .line 752
    move-result v1

    .line 753
    const/16 v2, 0x3f

    .line 754
    .line 755
    aput v2, v0, v1
    :try_end_3e
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3e .. :try_end_3e} :catch_3e

    .line 756
    .line 757
    :catch_3e
    :try_start_3f
    sget-object v0, Ll/j690$a;->a:[I

    .line 758
    .line 759
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->unlock_learn_about_him_module:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 760
    .line 761
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 762
    .line 763
    .line 764
    move-result v1

    .line 765
    const/16 v2, 0x40

    .line 766
    .line 767
    aput v2, v0, v1
    :try_end_3f
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3f .. :try_end_3f} :catch_3f

    .line 768
    .line 769
    :catch_3f
    :try_start_40
    sget-object v0, Ll/j690$a;->a:[I

    .line 770
    .line 771
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->ads_not_disturb:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 772
    .line 773
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 774
    .line 775
    .line 776
    move-result v1

    .line 777
    const/16 v2, 0x41

    .line 778
    .line 779
    aput v2, v0, v1
    :try_end_40
    .catch Ljava/lang/NoSuchFieldError; {:try_start_40 .. :try_end_40} :catch_40

    .line 780
    .line 781
    :catch_40
    :try_start_41
    sget-object v0, Ll/j690$a;->a:[I

    .line 782
    .line 783
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->block_harassing_words:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 784
    .line 785
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 786
    .line 787
    .line 788
    move-result v1

    .line 789
    const/16 v2, 0x42

    .line 790
    .line 791
    aput v2, v0, v1
    :try_end_41
    .catch Ljava/lang/NoSuchFieldError; {:try_start_41 .. :try_end_41} :catch_41

    .line 792
    .line 793
    :catch_41
    :try_start_42
    sget-object v0, Ll/j690$a;->a:[I

    .line 794
    .line 795
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->youth_roaming:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 796
    .line 797
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 798
    .line 799
    .line 800
    move-result v1

    .line 801
    const/16 v2, 0x43

    .line 802
    .line 803
    aput v2, v0, v1
    :try_end_42
    .catch Ljava/lang/NoSuchFieldError; {:try_start_42 .. :try_end_42} :catch_42

    .line 804
    .line 805
    :catch_42
    :try_start_43
    sget-object v0, Ll/j690$a;->a:[I

    .line 806
    .line 807
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->youth_find_partner:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 808
    .line 809
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 810
    .line 811
    .line 812
    move-result v1

    .line 813
    const/16 v2, 0x44

    .line 814
    .line 815
    aput v2, v0, v1
    :try_end_43
    .catch Ljava/lang/NoSuchFieldError; {:try_start_43 .. :try_end_43} :catch_43

    .line 816
    .line 817
    :catch_43
    :try_start_44
    sget-object v0, Ll/j690$a;->a:[I

    .line 818
    .line 819
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->youth_blind_box:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 820
    .line 821
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 822
    .line 823
    .line 824
    move-result v1

    .line 825
    const/16 v2, 0x45

    .line 826
    .line 827
    aput v2, v0, v1
    :try_end_44
    .catch Ljava/lang/NoSuchFieldError; {:try_start_44 .. :try_end_44} :catch_44

    .line 828
    .line 829
    :catch_44
    :try_start_45
    sget-object v0, Ll/j690$a;->a:[I

    .line 830
    .line 831
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->youth_superlike:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 832
    .line 833
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 834
    .line 835
    .line 836
    move-result v1

    .line 837
    const/16 v2, 0x46

    .line 838
    .line 839
    aput v2, v0, v1
    :try_end_45
    .catch Ljava/lang/NoSuchFieldError; {:try_start_45 .. :try_end_45} :catch_45

    .line 840
    .line 841
    :catch_45
    :try_start_46
    sget-object v0, Ll/j690$a;->a:[I

    .line 842
    .line 843
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->youth_message_read:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 844
    .line 845
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 846
    .line 847
    .line 848
    move-result v1

    .line 849
    const/16 v2, 0x47

    .line 850
    .line 851
    aput v2, v0, v1
    :try_end_46
    .catch Ljava/lang/NoSuchFieldError; {:try_start_46 .. :try_end_46} :catch_46

    .line 852
    .line 853
    :catch_46
    :try_start_47
    sget-object v0, Ll/j690$a;->a:[I

    .line 854
    .line 855
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->private_custom:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 856
    .line 857
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 858
    .line 859
    .line 860
    move-result v1

    .line 861
    const/16 v2, 0x48

    .line 862
    .line 863
    aput v2, v0, v1
    :try_end_47
    .catch Ljava/lang/NoSuchFieldError; {:try_start_47 .. :try_end_47} :catch_47

    .line 864
    .line 865
    :catch_47
    :try_start_48
    sget-object v0, Ll/j690$a;->a:[I

    .line 866
    .line 867
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->hide_me_from_nearby:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 868
    .line 869
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 870
    .line 871
    .line 872
    move-result v1

    .line 873
    const/16 v2, 0x49

    .line 874
    .line 875
    aput v2, v0, v1
    :try_end_48
    .catch Ljava/lang/NoSuchFieldError; {:try_start_48 .. :try_end_48} :catch_48

    .line 876
    .line 877
    :catch_48
    :try_start_49
    sget-object v0, Ll/j690$a;->a:[I

    .line 878
    .line 879
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->tribe:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 880
    .line 881
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 882
    .line 883
    .line 884
    move-result v1

    .line 885
    const/16 v2, 0x4a

    .line 886
    .line 887
    aput v2, v0, v1
    :try_end_49
    .catch Ljava/lang/NoSuchFieldError; {:try_start_49 .. :try_end_49} :catch_49

    .line 888
    .line 889
    :catch_49
    return-void
.end method
