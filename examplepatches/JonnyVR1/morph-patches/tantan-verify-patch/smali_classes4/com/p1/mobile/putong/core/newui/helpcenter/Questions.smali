.class public Lcom/p1/mobile/putong/core/newui/helpcenter/Questions;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$Question;,
        Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;,
        Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$TextContent;,
        Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$ImageContent;
    }
.end annotation


# static fields
.field public static a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$Question;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 12

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$Question;

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/core/R$string;->r7:I

    .line 4
    .line 5
    invoke-static {v1}, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;->title(I)Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    sget v3, Lcom/p1/mobile/putong/core/R$string;->s7:I

    .line 10
    .line 11
    invoke-static {v3}, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;->text(I)Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    const-string v4, "https://auto.tancdn.com/v1/images/eyJpZCI6IlFJQ0NKUVpXNEdRRFk2RFEzWlhSM0haU0MzN0NBTTA0IiwidyI6ODcyLCJoIjo2NzIsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo2NTY1NTE3Mzc4NTg2NDg2OTk3LCJhYiI6MH0.png?format=max_720xX"

    .line 16
    .line 17
    invoke-static {v4}, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;->image(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;

    .line 18
    .line 19
    .line 20
    move-result-object v4

    .line 21
    sget v5, Lcom/p1/mobile/putong/core/R$string;->t7:I

    .line 22
    .line 23
    invoke-static {v5}, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;->text(I)Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;

    .line 24
    .line 25
    .line 26
    move-result-object v5

    .line 27
    const-string v6, "https://auto.tancdn.com/v1/images/eyJpZCI6IkdEV0JNVDdZN0dRTFMyRzIySTdKQTNTTTVYMzQ0WTA0IiwidyI6ODcyLCJoIjo2NzIsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoyOTc0Mzc2MTY2NjEyOTk2OTUzLCJhYiI6MH0.png?format=max_720xX"

    .line 28
    .line 29
    invoke-static {v6}, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;->image(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;

    .line 30
    .line 31
    .line 32
    move-result-object v6

    .line 33
    sget v7, Lcom/p1/mobile/putong/core/R$string;->u7:I

    .line 34
    .line 35
    invoke-static {v7}, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;->text(I)Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;

    .line 36
    .line 37
    .line 38
    move-result-object v7

    .line 39
    const-string v8, "https://auto.tancdn.com/v1/images/eyJpZCI6IlYyVEE2N0tZVUlNM0ZaVFROMkNQWllGQTRNQVg3SDA0IiwidyI6ODcyLCJoIjo2NzIsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo4NzI1NDg4Mzc5NTMzNjc3NDA1LCJhYiI6MH0.png?format=max_720xX"

    .line 40
    .line 41
    invoke-static {v8}, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;->image(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;

    .line 42
    .line 43
    .line 44
    move-result-object v8

    .line 45
    sget v9, Lcom/p1/mobile/putong/core/R$string;->v7:I

    .line 46
    .line 47
    invoke-static {v9}, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;->text(I)Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;

    .line 48
    .line 49
    .line 50
    move-result-object v9

    .line 51
    filled-new-array/range {v2 .. v9}, [Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    invoke-static {v2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    const-string v3, "how_to_use_tantan"

    .line 60
    .line 61
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$Question;-><init>(Ljava/lang/String;ILjava/util/List;)V

    .line 62
    .line 63
    .line 64
    new-instance v1, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$Question;

    .line 65
    .line 66
    sget v2, Lcom/p1/mobile/putong/core/R$string;->h7:I

    .line 67
    .line 68
    invoke-static {v2}, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;->title(I)Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;

    .line 69
    .line 70
    .line 71
    move-result-object v3

    .line 72
    sget v4, Lcom/p1/mobile/putong/core/R$string;->i7:I

    .line 73
    .line 74
    invoke-static {v4}, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;->text(I)Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;

    .line 75
    .line 76
    .line 77
    move-result-object v4

    .line 78
    filled-new-array {v3, v4}, [Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;

    .line 79
    .line 80
    .line 81
    move-result-object v3

    .line 82
    invoke-static {v3}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 83
    .line 84
    .line 85
    move-result-object v3

    .line 86
    const-string v4, "edit_profile"

    .line 87
    .line 88
    invoke-direct {v1, v4, v2, v3}, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$Question;-><init>(Ljava/lang/String;ILjava/util/List;)V

    .line 89
    .line 90
    .line 91
    new-instance v2, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$Question;

    .line 92
    .line 93
    sget v3, Lcom/p1/mobile/putong/core/R$string;->y7:I

    .line 94
    .line 95
    invoke-static {v3}, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;->title(I)Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;

    .line 96
    .line 97
    .line 98
    move-result-object v4

    .line 99
    const-string v5, "https://auto.tancdn.com/v1/images/eyJpZCI6IjRWRkVQUlZWTDJPSjJOREpJS00yMjdSRkVXNUhRVzA0IiwidyI6ODcyLCJoIjo2NzIsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozOTE0MjEwOTEyNjI3Mjc4NjgzLCJhYiI6MH0.png?format=max_720xX"

    .line 100
    .line 101
    invoke-static {v5}, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;->image(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;

    .line 102
    .line 103
    .line 104
    move-result-object v5

    .line 105
    sget v6, Lcom/p1/mobile/putong/core/R$string;->z7:I

    .line 106
    .line 107
    invoke-static {v6}, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;->text(I)Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;

    .line 108
    .line 109
    .line 110
    move-result-object v6

    .line 111
    sget v7, Lcom/p1/mobile/putong/core/R$string;->A7:I

    .line 112
    .line 113
    invoke-static {v7}, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;->text(I)Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;

    .line 114
    .line 115
    .line 116
    move-result-object v7

    .line 117
    filled-new-array {v4, v5, v6, v7}, [Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;

    .line 118
    .line 119
    .line 120
    move-result-object v4

    .line 121
    invoke-static {v4}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 122
    .line 123
    .line 124
    move-result-object v4

    .line 125
    const-string v5, "not_enough_swipe"

    .line 126
    .line 127
    invoke-direct {v2, v5, v3, v4}, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$Question;-><init>(Ljava/lang/String;ILjava/util/List;)V

    .line 128
    .line 129
    .line 130
    new-instance v3, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$Question;

    .line 131
    .line 132
    sget v4, Lcom/p1/mobile/putong/core/R$string;->j7:I

    .line 133
    .line 134
    invoke-static {v4}, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;->title(I)Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;

    .line 135
    .line 136
    .line 137
    move-result-object v5

    .line 138
    sget v6, Lcom/p1/mobile/putong/core/R$string;->k7:I

    .line 139
    .line 140
    invoke-static {v6}, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;->text(I)Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;

    .line 141
    .line 142
    .line 143
    move-result-object v6

    .line 144
    sget v7, Lcom/p1/mobile/putong/core/R$string;->l7:I

    .line 145
    .line 146
    invoke-static {v7}, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;->text(I)Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;

    .line 147
    .line 148
    .line 149
    move-result-object v7

    .line 150
    filled-new-array {v5, v6, v7}, [Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;

    .line 151
    .line 152
    .line 153
    move-result-object v5

    .line 154
    invoke-static {v5}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 155
    .line 156
    .line 157
    move-result-object v5

    .line 158
    const-string v6, "get_more_likes"

    .line 159
    .line 160
    invoke-direct {v3, v6, v4, v5}, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$Question;-><init>(Ljava/lang/String;ILjava/util/List;)V

    .line 161
    .line 162
    .line 163
    new-instance v4, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$Question;

    .line 164
    .line 165
    sget v5, Lcom/p1/mobile/putong/core/R$string;->m7:I

    .line 166
    .line 167
    invoke-static {v5}, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;->title(I)Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;

    .line 168
    .line 169
    .line 170
    move-result-object v6

    .line 171
    sget v7, Lcom/p1/mobile/putong/core/R$string;->n7:I

    .line 172
    .line 173
    invoke-static {v7}, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;->text(I)Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;

    .line 174
    .line 175
    .line 176
    move-result-object v7

    .line 177
    const-string v8, "https://auto.tancdn.com/v1/images/eyJpZCI6IjdISUxLWjNCVjVZT0VSQllTNlJOUDdBSzVGT1ZVSTA0IiwidyI6ODcyLCJoIjo2NzIsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo5MDQ3ODIyMjI5MzMyMzQzNTQsImFiIjowfQ.png?format=max_720xX"

    .line 178
    .line 179
    invoke-static {v8}, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;->image(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;

    .line 180
    .line 181
    .line 182
    move-result-object v8

    .line 183
    sget v9, Lcom/p1/mobile/putong/core/R$string;->o7:I

    .line 184
    .line 185
    invoke-static {v9}, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;->text(I)Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;

    .line 186
    .line 187
    .line 188
    move-result-object v9

    .line 189
    sget v10, Lcom/p1/mobile/putong/core/R$string;->p7:I

    .line 190
    .line 191
    invoke-static {v10}, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;->text(I)Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;

    .line 192
    .line 193
    .line 194
    move-result-object v10

    .line 195
    sget v11, Lcom/p1/mobile/putong/core/R$string;->q7:I

    .line 196
    .line 197
    invoke-static {v11}, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;->text(I)Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;

    .line 198
    .line 199
    .line 200
    move-result-object v11

    .line 201
    filled-new-array/range {v6 .. v11}, [Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;

    .line 202
    .line 203
    .line 204
    move-result-object v6

    .line 205
    invoke-static {v6}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 206
    .line 207
    .line 208
    move-result-object v6

    .line 209
    const-string v7, "get_more_matches"

    .line 210
    .line 211
    invoke-direct {v4, v7, v5, v6}, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$Question;-><init>(Ljava/lang/String;ILjava/util/List;)V

    .line 212
    .line 213
    .line 214
    new-instance v5, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$Question;

    .line 215
    .line 216
    sget v6, Lcom/p1/mobile/putong/core/R$string;->e7:I

    .line 217
    .line 218
    invoke-static {v6}, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;->title(I)Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;

    .line 219
    .line 220
    .line 221
    move-result-object v7

    .line 222
    sget v8, Lcom/p1/mobile/putong/core/R$string;->f7:I

    .line 223
    .line 224
    invoke-static {v8}, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;->text(I)Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;

    .line 225
    .line 226
    .line 227
    move-result-object v8

    .line 228
    sget v9, Lcom/p1/mobile/putong/core/R$string;->g7:I

    .line 229
    .line 230
    invoke-static {v9}, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;->text(I)Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;

    .line 231
    .line 232
    .line 233
    move-result-object v9

    .line 234
    filled-new-array {v7, v8, v9}, [Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;

    .line 235
    .line 236
    .line 237
    move-result-object v7

    .line 238
    invoke-static {v7}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 239
    .line 240
    .line 241
    move-result-object v7

    .line 242
    const-string v8, "break_the_ice"

    .line 243
    .line 244
    invoke-direct {v5, v8, v6, v7}, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$Question;-><init>(Ljava/lang/String;ILjava/util/List;)V

    .line 245
    .line 246
    .line 247
    new-instance v6, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$Question;

    .line 248
    .line 249
    sget v7, Lcom/p1/mobile/putong/core/R$string;->b7:I

    .line 250
    .line 251
    invoke-static {v7}, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;->title(I)Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;

    .line 252
    .line 253
    .line 254
    move-result-object v8

    .line 255
    const-string v9, "https://auto.tancdn.com/v1/images/eyJpZCI6IkZOSjZaUU80NDNHVFNaWTY2TkdJR0lYWUFXRFlLWjA0IiwidyI6ODcyLCJoIjo2NzIsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozNDg1MDM4NTk1NTgyNDIxMDI4LCJhYiI6MH0.png?format=max_720xX"

    .line 256
    .line 257
    invoke-static {v9}, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;->image(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;

    .line 258
    .line 259
    .line 260
    move-result-object v9

    .line 261
    sget v10, Lcom/p1/mobile/putong/core/R$string;->c7:I

    .line 262
    .line 263
    invoke-static {v10}, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;->text(I)Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;

    .line 264
    .line 265
    .line 266
    move-result-object v10

    .line 267
    sget v11, Lcom/p1/mobile/putong/core/R$string;->d7:I

    .line 268
    .line 269
    invoke-static {v11}, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;->text(I)Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;

    .line 270
    .line 271
    .line 272
    move-result-object v11

    .line 273
    filled-new-array {v8, v9, v10, v11}, [Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;

    .line 274
    .line 275
    .line 276
    move-result-object v8

    .line 277
    invoke-static {v8}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 278
    .line 279
    .line 280
    move-result-object v8

    .line 281
    const-string v9, "harassment"

    .line 282
    .line 283
    invoke-direct {v6, v9, v7, v8}, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$Question;-><init>(Ljava/lang/String;ILjava/util/List;)V

    .line 284
    .line 285
    .line 286
    new-instance v7, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$Question;

    .line 287
    .line 288
    sget v8, Lcom/p1/mobile/putong/core/R$string;->w7:I

    .line 289
    .line 290
    invoke-static {v8}, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;->title(I)Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;

    .line 291
    .line 292
    .line 293
    move-result-object v9

    .line 294
    sget v10, Lcom/p1/mobile/putong/core/R$string;->x7:I

    .line 295
    .line 296
    invoke-static {v10}, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;->text(I)Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;

    .line 297
    .line 298
    .line 299
    move-result-object v10

    .line 300
    filled-new-array {v9, v10}, [Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;

    .line 301
    .line 302
    .line 303
    move-result-object v9

    .line 304
    invoke-static {v9}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 305
    .line 306
    .line 307
    move-result-object v9

    .line 308
    const-string v10, "missing_new_messages"

    .line 309
    .line 310
    invoke-direct {v7, v10, v8, v9}, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$Question;-><init>(Ljava/lang/String;ILjava/util/List;)V

    .line 311
    .line 312
    .line 313
    filled-new-array/range {v0 .. v7}, [Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$Question;

    .line 314
    .line 315
    .line 316
    move-result-object v0

    .line 317
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 318
    .line 319
    .line 320
    move-result-object v0

    .line 321
    sput-object v0, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions;->a:Ljava/util/List;

    .line 322
    .line 323
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$Question;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions;->a:Ljava/util/List;

    .line 2
    .line 3
    return-object v0
.end method

.method public static b(Ljava/lang/String;Lcom/p1/mobile/putong/data/Gender;)Ljava/lang/String;
    .locals 10

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return-object p0

    .line 5
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    const/4 v2, -0x1

    .line 11
    const/4 v3, 0x2

    .line 12
    const-string v4, "https://auto.tancdn.com/v1/images/eyJpZCI6IkdEV0JNVDdZN0dRTFMyRzIySTdKQTNTTTVYMzQ0WTA0IiwidyI6ODcyLCJoIjo2NzIsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoyOTc0Mzc2MTY2NjEyOTk2OTUzLCJhYiI6MH0.png?format=max_720xX"

    .line 13
    .line 14
    const/4 v5, 0x1

    .line 15
    const-string v6, "https://auto.tancdn.com/v1/images/eyJpZCI6IlFJQ0NKUVpXNEdRRFk2RFEzWlhSM0haU0MzN0NBTTA0IiwidyI6ODcyLCJoIjo2NzIsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo2NTY1NTE3Mzc4NTg2NDg2OTk3LCJhYiI6MH0.png?format=max_720xX"

    .line 16
    .line 17
    const-string v7, "https://auto.tancdn.com/v1/images/eyJpZCI6IlYyVEE2N0tZVUlNM0ZaVFROMkNQWllGQTRNQVg3SDA0IiwidyI6ODcyLCJoIjo2NzIsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo4NzI1NDg4Mzc5NTMzNjc3NDA1LCJhYiI6MH0.png?format=max_720xX"

    .line 18
    .line 19
    const-string v8, "female"

    .line 20
    .line 21
    if-eqz v0, :cond_6

    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    sparse-switch v0, :sswitch_data_0

    .line 28
    .line 29
    .line 30
    :goto_0
    move v1, v2

    .line 31
    goto :goto_1

    .line 32
    :sswitch_0
    invoke-virtual {p0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-nez v0, :cond_1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    move v1, v3

    .line 40
    goto :goto_1

    .line 41
    :sswitch_1
    invoke-virtual {p0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-nez v0, :cond_2

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_2
    move v1, v5

    .line 49
    goto :goto_1

    .line 50
    :sswitch_2
    invoke-virtual {p0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-nez v0, :cond_3

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_3
    :goto_1
    packed-switch v1, :pswitch_data_0

    .line 58
    .line 59
    .line 60
    goto/16 :goto_a

    .line 61
    .line 62
    :pswitch_0
    invoke-static {p1, v8}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    if-eqz p0, :cond_4

    .line 67
    .line 68
    const-string p0, "http://auto.tancdn.com/v1/images/eyJpZCI6IkVMUVhHN0YzNURVUVhLUERCSVpMT1RUUVI0TjJLSTA0IiwidyI6MTAwNSwiaCI6Nzc3LCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6MTI0MzQ3NzQxMDU0ODU4NDU1NDksImFiIjowfQ.png?format=max_720xX"

    .line 69
    .line 70
    return-object p0

    .line 71
    :cond_4
    const-string p0, "http://auto.tancdn.com/v1/images/eyJpZCI6IlVHSjJPNVdZV0ZVVklFR0lQWVdYRjZLSVBMWlJOMzA0IiwidyI6MTAwNSwiaCI6Nzc3LCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6ODMyNDA3MTgzNzE3NTAzMDgzMywiYWIiOjB9.png?format=max_720xX"

    .line 72
    .line 73
    return-object p0

    .line 74
    :pswitch_1
    invoke-static {p1, v8}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 75
    .line 76
    .line 77
    move-result p0

    .line 78
    if-eqz p0, :cond_5

    .line 79
    .line 80
    const-string p0, "http://auto.tancdn.com/v1/images/eyJpZCI6IlRTN040QkE2Q1NEVlhOQjRUTE8zNzI0SUhOTlpJTDA0IiwidyI6MTAwNSwiaCI6Nzc3LCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6MTIwMDY3Njc3NDI1Nzk5Mjc0OSwiYWIiOjB9.png?format=max_720xX"

    .line 81
    .line 82
    return-object p0

    .line 83
    :cond_5
    const-string p0, "http://auto.tancdn.com/v1/images/eyJpZCI6IlEzR05XVFpKUUtaMlBaN1FWQzVaUEdSWUlRR1RIVjA0IiwidyI6MTAwNSwiaCI6Nzc3LCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6MjU3MjU5Njg3ODg3NTQ2ODg0OSwiYWIiOjB9.png?format=max_720xX"

    .line 84
    .line 85
    return-object p0

    .line 86
    :pswitch_2
    const-string p0, "http://auto.tancdn.com/v1/images/eyJpZCI6IjZWVUZITVJFSUNNQ05FQU9NNktXVzJIM1dRMlU3ViIsInciOjY3MCwiaCI6MzAwLCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6OTM0MDM3NDcyMzM0MjQyODQwOSwiYWIiOjB9.jpg?format=max_720xX"

    .line 87
    .line 88
    return-object p0

    .line 89
    :cond_6
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->c()Lcom/p1/mobile/putong/ab/IntlCountryCodeController$ModelRegion;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    sget-object v9, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$a;->a:[I

    .line 94
    .line 95
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    aget v0, v9, v0

    .line 100
    .line 101
    if-eq v0, v5, :cond_7

    .line 102
    .line 103
    if-eq v0, v3, :cond_b

    .line 104
    .line 105
    const/4 v9, 0x3

    .line 106
    if-eq v0, v9, :cond_f

    .line 107
    .line 108
    const/4 v9, 0x4

    .line 109
    if-eq v0, v9, :cond_13

    .line 110
    .line 111
    goto/16 :goto_a

    .line 112
    .line 113
    :cond_7
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 114
    .line 115
    .line 116
    move-result v0

    .line 117
    sparse-switch v0, :sswitch_data_1

    .line 118
    .line 119
    .line 120
    :goto_2
    move v0, v2

    .line 121
    goto :goto_3

    .line 122
    :sswitch_3
    invoke-virtual {p0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    if-nez v0, :cond_8

    .line 127
    .line 128
    goto :goto_2

    .line 129
    :cond_8
    move v0, v3

    .line 130
    goto :goto_3

    .line 131
    :sswitch_4
    invoke-virtual {p0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 132
    .line 133
    .line 134
    move-result v0

    .line 135
    if-nez v0, :cond_9

    .line 136
    .line 137
    goto :goto_2

    .line 138
    :cond_9
    move v0, v5

    .line 139
    goto :goto_3

    .line 140
    :sswitch_5
    invoke-virtual {p0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 141
    .line 142
    .line 143
    move-result v0

    .line 144
    if-nez v0, :cond_a

    .line 145
    .line 146
    goto :goto_2

    .line 147
    :cond_a
    move v0, v1

    .line 148
    :goto_3
    packed-switch v0, :pswitch_data_1

    .line 149
    .line 150
    .line 151
    :cond_b
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 152
    .line 153
    .line 154
    move-result v0

    .line 155
    sparse-switch v0, :sswitch_data_2

    .line 156
    .line 157
    .line 158
    :goto_4
    move v0, v2

    .line 159
    goto :goto_5

    .line 160
    :sswitch_6
    invoke-virtual {p0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 161
    .line 162
    .line 163
    move-result v0

    .line 164
    if-nez v0, :cond_c

    .line 165
    .line 166
    goto :goto_4

    .line 167
    :cond_c
    move v0, v3

    .line 168
    goto :goto_5

    .line 169
    :sswitch_7
    invoke-virtual {p0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 170
    .line 171
    .line 172
    move-result v0

    .line 173
    if-nez v0, :cond_d

    .line 174
    .line 175
    goto :goto_4

    .line 176
    :cond_d
    move v0, v5

    .line 177
    goto :goto_5

    .line 178
    :sswitch_8
    invoke-virtual {p0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 179
    .line 180
    .line 181
    move-result v0

    .line 182
    if-nez v0, :cond_e

    .line 183
    .line 184
    goto :goto_4

    .line 185
    :cond_e
    move v0, v1

    .line 186
    :goto_5
    packed-switch v0, :pswitch_data_2

    .line 187
    .line 188
    .line 189
    :cond_f
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 190
    .line 191
    .line 192
    move-result v0

    .line 193
    sparse-switch v0, :sswitch_data_3

    .line 194
    .line 195
    .line 196
    :goto_6
    move v0, v2

    .line 197
    goto :goto_7

    .line 198
    :sswitch_9
    invoke-virtual {p0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 199
    .line 200
    .line 201
    move-result v0

    .line 202
    if-nez v0, :cond_10

    .line 203
    .line 204
    goto :goto_6

    .line 205
    :cond_10
    move v0, v3

    .line 206
    goto :goto_7

    .line 207
    :sswitch_a
    invoke-virtual {p0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 208
    .line 209
    .line 210
    move-result v0

    .line 211
    if-nez v0, :cond_11

    .line 212
    .line 213
    goto :goto_6

    .line 214
    :cond_11
    move v0, v5

    .line 215
    goto :goto_7

    .line 216
    :sswitch_b
    invoke-virtual {p0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 217
    .line 218
    .line 219
    move-result v0

    .line 220
    if-nez v0, :cond_12

    .line 221
    .line 222
    goto :goto_6

    .line 223
    :cond_12
    move v0, v1

    .line 224
    :goto_7
    packed-switch v0, :pswitch_data_3

    .line 225
    .line 226
    .line 227
    :cond_13
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 228
    .line 229
    .line 230
    move-result v0

    .line 231
    sparse-switch v0, :sswitch_data_4

    .line 232
    .line 233
    .line 234
    :goto_8
    move v1, v2

    .line 235
    goto :goto_9

    .line 236
    :sswitch_c
    invoke-virtual {p0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 237
    .line 238
    .line 239
    move-result v0

    .line 240
    if-nez v0, :cond_14

    .line 241
    .line 242
    goto :goto_8

    .line 243
    :cond_14
    move v1, v3

    .line 244
    goto :goto_9

    .line 245
    :sswitch_d
    invoke-virtual {p0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 246
    .line 247
    .line 248
    move-result v0

    .line 249
    if-nez v0, :cond_15

    .line 250
    .line 251
    goto :goto_8

    .line 252
    :cond_15
    move v1, v5

    .line 253
    goto :goto_9

    .line 254
    :sswitch_e
    invoke-virtual {p0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 255
    .line 256
    .line 257
    move-result v0

    .line 258
    if-nez v0, :cond_16

    .line 259
    .line 260
    goto :goto_8

    .line 261
    :cond_16
    :goto_9
    packed-switch v1, :pswitch_data_4

    .line 262
    .line 263
    .line 264
    :goto_a
    return-object p0

    .line 265
    :pswitch_3
    invoke-static {p1, v8}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 266
    .line 267
    .line 268
    move-result p0

    .line 269
    if-eqz p0, :cond_17

    .line 270
    .line 271
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IjZRS09BRTRISDZKT1pOVVZMVllZWFZNWlUzTjM2NzA0IiwidyI6ODcyLCJoIjo2NzIsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoyOTc0MzY3MTk3ODgyMDI4ODM5LCJhYiI6MH0.png?format=max_720xX"

    .line 272
    .line 273
    return-object p0

    .line 274
    :cond_17
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IktRNUIyTkxXMzU3QkVZVzJQQk5DNFcySkZBRTVHQjA0IiwidyI6ODcyLCJoIjo2NzIsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoyOTc0MzY3MzM1OTU4NjQ0MDgzLCJhYiI6MH0.png?format=max_720xX"

    .line 275
    .line 276
    return-object p0

    .line 277
    :pswitch_4
    invoke-static {p1, v8}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 278
    .line 279
    .line 280
    move-result p0

    .line 281
    if-eqz p0, :cond_18

    .line 282
    .line 283
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IlJITzVXSk1HSTVWRUJNVDJSVFYyQUpFUVpYTVNNWjA0IiwidyI6ODcyLCJoIjo2NzIsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxOTUzODQ5MTA2ODk0NTU3OTAxLCJhYiI6MH0.png?format=max_720xX"

    .line 284
    .line 285
    return-object p0

    .line 286
    :cond_18
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IldLT1ZXQVJGNTU1WE9QTjZMTVpMVEZPTlpSWTdLQTA0IiwidyI6ODcyLCJoIjo2NzIsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo2NTY1NDk5ODczMTA2MTM1MjQ1LCJhYiI6MH0.png?format=max_720xX"

    .line 287
    .line 288
    return-object p0

    .line 289
    :pswitch_5
    invoke-static {p1, v8}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 290
    .line 291
    .line 292
    move-result p0

    .line 293
    if-eqz p0, :cond_19

    .line 294
    .line 295
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6Ikc1WDNSVjJJSEc2U0RNN05DM01JWE5OUFFUNjVHSjA0IiwidyI6ODcyLCJoIjo2NzIsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo4NzI1NDk0OTU5ODkyMTU1MjI5LCJhYiI6MH0.png?format=max_720xX"

    .line 296
    .line 297
    return-object p0

    .line 298
    :cond_19
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IlJPTEQzN05HNVNGVlY2M0dQU1FETDMyNFNCQlVETjA0IiwidyI6ODcyLCJoIjo2NzIsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo4NzI1NDk3MDM4NjIzOTYwNDExLCJhYiI6MH0.png?format=max_720xX"

    .line 299
    .line 300
    return-object p0

    .line 301
    :pswitch_6
    invoke-static {p1, v8}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 302
    .line 303
    .line 304
    move-result p0

    .line 305
    if-eqz p0, :cond_1a

    .line 306
    .line 307
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6Ilg3Q1E3REQzT1FUUlNETEQ2WlhRQUVZWVM3S01LQjA0IiwidyI6ODcyLCJoIjo2NzIsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoyOTc0MzY5NjM4MzYzMjM3MjM3LCJhYiI6MH0.png?format=max_720xX"

    .line 308
    .line 309
    return-object p0

    .line 310
    :cond_1a
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IlpISFpLUlBMVjVEQ0xSQlhQTjVHUlZES08yR0VLNjA0IiwidyI6ODcyLCJoIjo2NzIsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoyOTc0MzcxNzQyNTk1NDkyNzIzLCJhYiI6MH0.png?format=max_720xX"

    .line 311
    .line 312
    return-object p0

    .line 313
    :pswitch_7
    invoke-static {p1, v8}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 314
    .line 315
    .line 316
    move-result p0

    .line 317
    if-eqz p0, :cond_1b

    .line 318
    .line 319
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6Ik5JT1lHVFZOU01LTlVYQkpHRkxUTzY1QVA3T0o0MjA0IiwidyI6ODcyLCJoIjo2NzIsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxOTUzNzc4NTE1NTQ5MDUwMDA5LCJhYiI6MH0.png?format=max_720xX"

    .line 320
    .line 321
    return-object p0

    .line 322
    :cond_1b
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IjZQUVc2T09SR1BRRU1aNVk3WkxSSVRCRVlTR0xMRjA0IiwidyI6ODcyLCJoIjo2NzIsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo2NTY1NTE3MjQxMDE0MjM2MzEzLCJhYiI6MH0.png?format=max_720xX"

    .line 323
    .line 324
    return-object p0

    .line 325
    :pswitch_8
    invoke-static {p1, v8}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 326
    .line 327
    .line 328
    move-result p0

    .line 329
    if-eqz p0, :cond_1c

    .line 330
    .line 331
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IkRKUENRQlVMWkVJNVkzTU1IWk1VM0Y3UUhOQk5USDA0IiwidyI6ODcyLCJoIjo2NzIsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo4NzI1NDU3MjY3MDg2NTUxOTAxLCJhYiI6MH0.png?format=max_720xX"

    .line 332
    .line 333
    return-object p0

    .line 334
    :cond_1c
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IlM2SU5XTjJGQkdZUTNXVEZLS1pYVFZNTFZWU0NZVzA0IiwidyI6ODcyLCJoIjo2NzIsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo4NzI1NDk0NjQxODk0NTc2OTkxLCJhYiI6MH0.png?format=max_720xX"

    .line 335
    .line 336
    return-object p0

    .line 337
    :pswitch_9
    invoke-static {p1, v8}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 338
    .line 339
    .line 340
    move-result p0

    .line 341
    if-eqz p0, :cond_1d

    .line 342
    .line 343
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6Ilo2UUs3NzdJT0RITDNPQTRQMlc3VzI3NkdQUERRNDA0IiwidyI6ODcyLCJoIjo2NzIsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozNTU1MDU0NDM4ODkxMDcyMjk1LCJhYiI6MH0.png?format=max_720xX"

    .line 344
    .line 345
    return-object p0

    .line 346
    :cond_1d
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IllRWE80WE1BTVBUVFFSRU5BTkEzT1g0RFVaNE42TzA0IiwidyI6ODcyLCJoIjo2NzIsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoyOTc0MzY3MTk3NjEyOTM5MDQ3LCJhYiI6MH0.png?format=max_720xX"

    .line 347
    .line 348
    return-object p0

    .line 349
    :pswitch_a
    invoke-static {p1, v8}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 350
    .line 351
    .line 352
    move-result p0

    .line 353
    if-eqz p0, :cond_1e

    .line 354
    .line 355
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IlBHNkpQRU9USVo3UDdJN0tJWFdXS1UyR1dKM1FOUDA0IiwidyI6ODcyLCJoIjo2NzIsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxOTUzNzc4NDQ2MzE1MTcwMzMzLCJhYiI6MH0.png?format=max_720xX"

    .line 356
    .line 357
    return-object p0

    .line 358
    :cond_1e
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IkNQRk9IUldXSVhBNlVCRENNWldNNzJZTVFDRTVNRDA0IiwidyI6ODcyLCJoIjo2NzIsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxOTUzNzc4NzMwMzE4NTgzMzczLCJhYiI6MH0.png?format=max_720xX"

    .line 359
    .line 360
    return-object p0

    .line 361
    :pswitch_b
    invoke-static {p1, v8}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 362
    .line 363
    .line 364
    move-result p0

    .line 365
    if-eqz p0, :cond_1f

    .line 366
    .line 367
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6Iko0RldQQ1REWjdJQ1VFM0U0RDY1QTVXMlRIN05CQTA0IiwidyI6ODcyLCJoIjo2NzIsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo4NzI1NDk1Mzk4MDc3NDUwODQ3LCJhYiI6MH0.png?format=max_720xX"

    .line 368
    .line 369
    return-object p0

    .line 370
    :cond_1f
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IktHSTVSQ0k3SE9ZT0ZHUlNUR0lDUk5QTklGQk5MQTA0IiwidyI6ODcyLCJoIjo2NzIsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxNzk0ODg4MjIzNTEyNDMxMTM5MSwiYWIiOjB9.png?format=max_720xX"

    .line 371
    .line 372
    return-object p0

    .line 373
    :pswitch_c
    invoke-static {p1, v8}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 374
    .line 375
    .line 376
    move-result p0

    .line 377
    if-eqz p0, :cond_20

    .line 378
    .line 379
    return-object v4

    .line 380
    :cond_20
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IkxVUVkyVElYNkM0SU1YRjMyQk1ORlc1NDdWWUVNMzA0IiwidyI6ODcyLCJoIjo2NzIsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoyOTc3NzQ5NDM0MjI4MzQ4MjQ3LCJhYiI6MH0.png?format=max_720xX"

    .line 381
    .line 382
    return-object p0

    .line 383
    :pswitch_d
    invoke-static {p1, v8}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 384
    .line 385
    .line 386
    move-result p0

    .line 387
    if-eqz p0, :cond_21

    .line 388
    .line 389
    return-object v6

    .line 390
    :cond_21
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IjJQR1FUWjZPNFVYTFFCSDZKUjVSQVlTNkVTUDVEVTA0IiwidyI6ODcyLCJoIjo2NzIsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxOTUzNzc4NDQ3MTY3MzQ0NzgxLCJhYiI6MH0.png?format=max_720xX"

    .line 391
    .line 392
    return-object p0

    .line 393
    :pswitch_e
    invoke-static {p1, v8}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 394
    .line 395
    .line 396
    move-result p0

    .line 397
    if-eqz p0, :cond_22

    .line 398
    .line 399
    return-object v7

    .line 400
    :cond_22
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IkY2UlRQSkdNUzJXRE5BS1FHNE4zSVBDTVlMUU9VTDA0IiwidyI6ODcyLCJoIjo2NzIsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo4NzI1NDU5NjYzODUxNDQ3MTMzLCJhYiI6MH0.png?format=max_720xX"

    .line 401
    .line 402
    return-object p0

    .line 403
    :sswitch_data_0
    .sparse-switch
        -0x610bacf4 -> :sswitch_2
        -0x155410e4 -> :sswitch_1
        0x3d7e3601 -> :sswitch_0
    .end sparse-switch

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
    .line 414
    .line 415
    .line 416
    .line 417
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    .line 418
    .line 419
    .line 420
    .line 421
    .line 422
    .line 423
    .line 424
    .line 425
    .line 426
    .line 427
    :sswitch_data_1
    .sparse-switch
        -0x610bacf4 -> :sswitch_5
        -0x155410e4 -> :sswitch_4
        0x3d7e3601 -> :sswitch_3
    .end sparse-switch

    .line 428
    .line 429
    .line 430
    .line 431
    .line 432
    .line 433
    .line 434
    .line 435
    .line 436
    .line 437
    .line 438
    .line 439
    .line 440
    .line 441
    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_e
        :pswitch_d
        :pswitch_c
    .end packed-switch

    .line 442
    .line 443
    .line 444
    .line 445
    .line 446
    .line 447
    .line 448
    .line 449
    .line 450
    .line 451
    :sswitch_data_2
    .sparse-switch
        -0x610bacf4 -> :sswitch_8
        -0x155410e4 -> :sswitch_7
        0x3d7e3601 -> :sswitch_6
    .end sparse-switch

    .line 452
    .line 453
    .line 454
    .line 455
    .line 456
    .line 457
    .line 458
    .line 459
    .line 460
    .line 461
    .line 462
    .line 463
    .line 464
    .line 465
    :pswitch_data_2
    .packed-switch 0x0
        :pswitch_b
        :pswitch_a
        :pswitch_9
    .end packed-switch

    .line 466
    .line 467
    .line 468
    .line 469
    .line 470
    .line 471
    .line 472
    .line 473
    .line 474
    .line 475
    :sswitch_data_3
    .sparse-switch
        -0x610bacf4 -> :sswitch_b
        -0x155410e4 -> :sswitch_a
        0x3d7e3601 -> :sswitch_9
    .end sparse-switch

    .line 476
    .line 477
    .line 478
    .line 479
    .line 480
    .line 481
    .line 482
    .line 483
    .line 484
    .line 485
    .line 486
    .line 487
    .line 488
    .line 489
    :pswitch_data_3
    .packed-switch 0x0
        :pswitch_8
        :pswitch_7
        :pswitch_6
    .end packed-switch

    .line 490
    .line 491
    .line 492
    .line 493
    .line 494
    .line 495
    .line 496
    .line 497
    .line 498
    .line 499
    :sswitch_data_4
    .sparse-switch
        -0x610bacf4 -> :sswitch_e
        -0x155410e4 -> :sswitch_d
        0x3d7e3601 -> :sswitch_c
    .end sparse-switch

    .line 500
    .line 501
    .line 502
    .line 503
    .line 504
    .line 505
    .line 506
    .line 507
    .line 508
    .line 509
    .line 510
    .line 511
    .line 512
    .line 513
    :pswitch_data_4
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_3
    .end packed-switch
.end method
