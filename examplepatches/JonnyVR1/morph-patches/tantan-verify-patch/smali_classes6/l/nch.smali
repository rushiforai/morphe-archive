.class public Ll/nch;
.super Landroidx/recyclerview/widget/g$b;
.source "SourceFile"


# instance fields
.field public a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;",
            ">;"
        }
    .end annotation
.end field

.field public b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;",
            ">;"
        }
    .end annotation
.end field

.field public c:Ll/epr;


# direct methods
.method public constructor <init>(Landroidx/recyclerview/widget/RecyclerView$Adapter;I)V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/g$b;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/nch$a;

    .line 5
    .line 6
    invoke-direct {v0, p0, p1, p2}, Ll/nch$a;-><init>(Ll/nch;Landroidx/recyclerview/widget/RecyclerView$Adapter;I)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/nch;->c:Ll/epr;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public a(II)Z
    .locals 4

    .line 1
    iget-object v0, p0, Ll/nch;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;

    .line 8
    .line 9
    iget-object v0, p0, Ll/nch;->b:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    check-cast p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;

    .line 16
    .line 17
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 18
    .line 19
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    const/4 v1, 0x1

    .line 24
    const/4 v2, 0x0

    .line 25
    if-eqz v0, :cond_4

    .line 26
    .line 27
    iget-object v0, p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 28
    .line 29
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_4

    .line 34
    .line 35
    iget v0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->b:I

    .line 36
    .line 37
    if-ne v0, v1, :cond_4

    .line 38
    .line 39
    iget v0, p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->b:I

    .line 40
    .line 41
    if-ne v0, v1, :cond_4

    .line 42
    .line 43
    iget-object v0, p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 44
    .line 45
    invoke-virtual {p0, v0}, Ll/nch;->l(Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-nez v0, :cond_2

    .line 50
    .line 51
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 52
    .line 53
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->momentVoiceLiveInfos:Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;

    .line 54
    .line 55
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-eqz v0, :cond_0

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 63
    .line 64
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 65
    .line 66
    iget-object v3, p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 67
    .line 68
    iget-object v3, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 69
    .line 70
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    if-eqz v0, :cond_1

    .line 75
    .line 76
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 77
    .line 78
    iget-object v3, p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 79
    .line 80
    invoke-virtual {p0, v0, v3}, Ll/nch;->i(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    if-eqz v0, :cond_1

    .line 85
    .line 86
    invoke-virtual {p0, p1, p2}, Ll/nch;->k(Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;)Z

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    if-eqz v0, :cond_1

    .line 91
    .line 92
    invoke-virtual {p0, p1, p2}, Ll/nch;->f(Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;)Z

    .line 93
    .line 94
    .line 95
    move-result p0

    .line 96
    if-eqz p0, :cond_1

    .line 97
    .line 98
    return v1

    .line 99
    :cond_1
    return v2

    .line 100
    :cond_2
    :goto_0
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 101
    .line 102
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 103
    .line 104
    iget-object v3, p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 105
    .line 106
    iget-object v3, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 107
    .line 108
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    if-eqz v0, :cond_3

    .line 113
    .line 114
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 115
    .line 116
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 117
    .line 118
    invoke-virtual {p0, p1, p2}, Ll/nch;->j(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 119
    .line 120
    .line 121
    move-result p0

    .line 122
    if-eqz p0, :cond_3

    .line 123
    .line 124
    return v1

    .line 125
    :cond_3
    return v2

    .line 126
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 127
    .line 128
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 129
    .line 130
    .line 131
    move-result p0

    .line 132
    if-eqz p0, :cond_8

    .line 133
    .line 134
    iget-object p0, p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 135
    .line 136
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 137
    .line 138
    .line 139
    move-result p0

    .line 140
    if-eqz p0, :cond_8

    .line 141
    .line 142
    iget p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->b:I

    .line 143
    .line 144
    const/4 v0, 0x3

    .line 145
    if-ne p0, v0, :cond_8

    .line 146
    .line 147
    iget p0, p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->b:I

    .line 148
    .line 149
    if-ne p0, v0, :cond_8

    .line 150
    .line 151
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->y:Ll/pf60;

    .line 152
    .line 153
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 154
    .line 155
    .line 156
    move-result p0

    .line 157
    if-eqz p0, :cond_8

    .line 158
    .line 159
    iget-object p0, p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->y:Ll/pf60;

    .line 160
    .line 161
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 162
    .line 163
    .line 164
    move-result p0

    .line 165
    if-eqz p0, :cond_8

    .line 166
    .line 167
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->y:Ll/pf60;

    .line 168
    .line 169
    iget-object p0, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 170
    .line 171
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 172
    .line 173
    .line 174
    move-result p0

    .line 175
    if-eqz p0, :cond_8

    .line 176
    .line 177
    iget-object p0, p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->y:Ll/pf60;

    .line 178
    .line 179
    iget-object p0, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 180
    .line 181
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 182
    .line 183
    .line 184
    move-result p0

    .line 185
    if-eqz p0, :cond_8

    .line 186
    .line 187
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->y:Ll/pf60;

    .line 188
    .line 189
    iget-object p0, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 190
    .line 191
    check-cast p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;

    .line 192
    .line 193
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->recommendTopics:Ljava/util/List;

    .line 194
    .line 195
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 196
    .line 197
    .line 198
    move-result p0

    .line 199
    if-nez p0, :cond_8

    .line 200
    .line 201
    iget-object p0, p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->y:Ll/pf60;

    .line 202
    .line 203
    iget-object p0, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 204
    .line 205
    check-cast p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;

    .line 206
    .line 207
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->recommendTopics:Ljava/util/List;

    .line 208
    .line 209
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 210
    .line 211
    .line 212
    move-result p0

    .line 213
    if-nez p0, :cond_8

    .line 214
    .line 215
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->y:Ll/pf60;

    .line 216
    .line 217
    iget-object p0, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 218
    .line 219
    check-cast p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;

    .line 220
    .line 221
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->recommendTopics:Ljava/util/List;

    .line 222
    .line 223
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 224
    .line 225
    .line 226
    move-result p0

    .line 227
    iget-object v0, p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->y:Ll/pf60;

    .line 228
    .line 229
    iget-object v0, v0, Ll/pf60;->a:Ljava/lang/Object;

    .line 230
    .line 231
    check-cast v0, Lcom/p1/mobile/putong/feed/data/TopicOperations;

    .line 232
    .line 233
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->recommendTopics:Ljava/util/List;

    .line 234
    .line 235
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 236
    .line 237
    .line 238
    move-result v0

    .line 239
    if-eq p0, v0, :cond_5

    .line 240
    .line 241
    return v2

    .line 242
    :cond_5
    move p0, v2

    .line 243
    :goto_1
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->y:Ll/pf60;

    .line 244
    .line 245
    iget-object v0, v0, Ll/pf60;->a:Ljava/lang/Object;

    .line 246
    .line 247
    check-cast v0, Lcom/p1/mobile/putong/feed/data/TopicOperations;

    .line 248
    .line 249
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->recommendTopics:Ljava/util/List;

    .line 250
    .line 251
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 252
    .line 253
    .line 254
    move-result v0

    .line 255
    if-ge p0, v0, :cond_7

    .line 256
    .line 257
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->y:Ll/pf60;

    .line 258
    .line 259
    iget-object v0, v0, Ll/pf60;->a:Ljava/lang/Object;

    .line 260
    .line 261
    check-cast v0, Lcom/p1/mobile/putong/feed/data/TopicOperations;

    .line 262
    .line 263
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->recommendTopics:Ljava/util/List;

    .line 264
    .line 265
    invoke-interface {v0, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 266
    .line 267
    .line 268
    move-result-object v0

    .line 269
    check-cast v0, Ljava/lang/String;

    .line 270
    .line 271
    iget-object v3, p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->y:Ll/pf60;

    .line 272
    .line 273
    iget-object v3, v3, Ll/pf60;->a:Ljava/lang/Object;

    .line 274
    .line 275
    check-cast v3, Lcom/p1/mobile/putong/feed/data/TopicOperations;

    .line 276
    .line 277
    iget-object v3, v3, Lcom/p1/mobile/putong/feed/data/TopicOperations;->recommendTopics:Ljava/util/List;

    .line 278
    .line 279
    invoke-interface {v3, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 280
    .line 281
    .line 282
    move-result-object v3

    .line 283
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 284
    .line 285
    .line 286
    move-result v0

    .line 287
    if-nez v0, :cond_6

    .line 288
    .line 289
    return v2

    .line 290
    :cond_6
    add-int/lit8 p0, p0, 0x1

    .line 291
    .line 292
    goto :goto_1

    .line 293
    :cond_7
    return v1

    .line 294
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 295
    .line 296
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 297
    .line 298
    .line 299
    move-result p0

    .line 300
    if-eqz p0, :cond_c

    .line 301
    .line 302
    iget-object p0, p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 303
    .line 304
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 305
    .line 306
    .line 307
    move-result p0

    .line 308
    if-eqz p0, :cond_c

    .line 309
    .line 310
    iget p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->b:I

    .line 311
    .line 312
    const/4 v0, 0x4

    .line 313
    if-ne p0, v0, :cond_c

    .line 314
    .line 315
    iget p0, p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->b:I

    .line 316
    .line 317
    if-ne p0, v0, :cond_c

    .line 318
    .line 319
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->x:Ll/pf60;

    .line 320
    .line 321
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 322
    .line 323
    .line 324
    move-result p0

    .line 325
    if-eqz p0, :cond_c

    .line 326
    .line 327
    iget-object p0, p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->x:Ll/pf60;

    .line 328
    .line 329
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 330
    .line 331
    .line 332
    move-result p0

    .line 333
    if-eqz p0, :cond_c

    .line 334
    .line 335
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->x:Ll/pf60;

    .line 336
    .line 337
    iget-object p0, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 338
    .line 339
    check-cast p0, Ljava/util/Collection;

    .line 340
    .line 341
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 342
    .line 343
    .line 344
    move-result p0

    .line 345
    if-nez p0, :cond_c

    .line 346
    .line 347
    iget-object p0, p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->x:Ll/pf60;

    .line 348
    .line 349
    iget-object p0, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 350
    .line 351
    check-cast p0, Ljava/util/Collection;

    .line 352
    .line 353
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 354
    .line 355
    .line 356
    move-result p0

    .line 357
    if-nez p0, :cond_c

    .line 358
    .line 359
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->x:Ll/pf60;

    .line 360
    .line 361
    iget-object p0, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 362
    .line 363
    check-cast p0, Ljava/util/List;

    .line 364
    .line 365
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 366
    .line 367
    .line 368
    move-result p0

    .line 369
    iget-object v0, p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->x:Ll/pf60;

    .line 370
    .line 371
    iget-object v0, v0, Ll/pf60;->a:Ljava/lang/Object;

    .line 372
    .line 373
    check-cast v0, Ljava/util/List;

    .line 374
    .line 375
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 376
    .line 377
    .line 378
    move-result v0

    .line 379
    if-eq p0, v0, :cond_9

    .line 380
    .line 381
    return v2

    .line 382
    :cond_9
    move p0, v2

    .line 383
    :goto_2
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->x:Ll/pf60;

    .line 384
    .line 385
    iget-object v0, v0, Ll/pf60;->a:Ljava/lang/Object;

    .line 386
    .line 387
    check-cast v0, Ljava/util/List;

    .line 388
    .line 389
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 390
    .line 391
    .line 392
    move-result v0

    .line 393
    if-ge p0, v0, :cond_b

    .line 394
    .line 395
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->x:Ll/pf60;

    .line 396
    .line 397
    iget-object v0, v0, Ll/pf60;->a:Ljava/lang/Object;

    .line 398
    .line 399
    check-cast v0, Ljava/util/List;

    .line 400
    .line 401
    invoke-interface {v0, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 402
    .line 403
    .line 404
    move-result-object v0

    .line 405
    check-cast v0, Lcom/p1/mobile/putong/feed/data/RecommendUsers;

    .line 406
    .line 407
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/RecommendUsers;->userId:Ljava/lang/String;

    .line 408
    .line 409
    iget-object v3, p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->x:Ll/pf60;

    .line 410
    .line 411
    iget-object v3, v3, Ll/pf60;->a:Ljava/lang/Object;

    .line 412
    .line 413
    check-cast v3, Ljava/util/List;

    .line 414
    .line 415
    invoke-interface {v3, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 416
    .line 417
    .line 418
    move-result-object v3

    .line 419
    check-cast v3, Lcom/p1/mobile/putong/feed/data/RecommendUsers;

    .line 420
    .line 421
    iget-object v3, v3, Lcom/p1/mobile/putong/feed/data/RecommendUsers;->userId:Ljava/lang/String;

    .line 422
    .line 423
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 424
    .line 425
    .line 426
    move-result v0

    .line 427
    if-nez v0, :cond_a

    .line 428
    .line 429
    return v2

    .line 430
    :cond_a
    add-int/lit8 p0, p0, 0x1

    .line 431
    .line 432
    goto :goto_2

    .line 433
    :cond_b
    return v1

    .line 434
    :cond_c
    return v2
.end method

.method public b(II)Z
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eq p1, p2, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    iget-object v1, p0, Ll/nch;->a:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;

    .line 12
    .line 13
    iget-object p0, p0, Ll/nch;->b:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {p0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;

    .line 20
    .line 21
    if-eqz p1, :cond_2

    .line 22
    .line 23
    if-nez p0, :cond_1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    iget p1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->b:I

    .line 27
    .line 28
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->b:I

    .line 29
    .line 30
    if-ne p1, p0, :cond_2

    .line 31
    .line 32
    const/4 p0, 0x1

    .line 33
    return p0

    .line 34
    :cond_2
    :goto_0
    return v0
.end method

.method public c(II)Ljava/lang/Object;
    .locals 3
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/nch;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;

    .line 8
    .line 9
    iget-object v0, p0, Ll/nch;->b:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    check-cast p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;

    .line 16
    .line 17
    iget v0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->b:I

    .line 18
    .line 19
    if-nez v0, :cond_3

    .line 20
    .line 21
    iget v0, p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->b:I

    .line 22
    .line 23
    if-nez v0, :cond_3

    .line 24
    .line 25
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 26
    .line 27
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 28
    .line 29
    iget-object v1, p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 30
    .line 31
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_3

    .line 38
    .line 39
    new-instance v0, Ll/s6i;

    .line 40
    .line 41
    invoke-direct {v0}, Ll/s6i;-><init>()V

    .line 42
    .line 43
    .line 44
    iget v1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->m:I

    .line 45
    .line 46
    iget v2, p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->m:I

    .line 47
    .line 48
    if-ne v1, v2, :cond_0

    .line 49
    .line 50
    const/4 v1, 0x1

    .line 51
    invoke-virtual {v0, v1}, Ll/s6i;->a(I)V

    .line 52
    .line 53
    .line 54
    :cond_0
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 55
    .line 56
    iget-object v2, p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 57
    .line 58
    invoke-virtual {p0, v1, v2}, Ll/nch;->h(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    if-eqz p0, :cond_1

    .line 63
    .line 64
    const/4 p0, 0x2

    .line 65
    invoke-virtual {v0, p0}, Ll/s6i;->a(I)V

    .line 66
    .line 67
    .line 68
    :cond_1
    iget p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->n:I

    .line 69
    .line 70
    iget p1, p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->n:I

    .line 71
    .line 72
    if-ne p0, p1, :cond_2

    .line 73
    .line 74
    const/4 p0, 0x4

    .line 75
    invoke-virtual {v0, p0}, Ll/s6i;->a(I)V

    .line 76
    .line 77
    .line 78
    :cond_2
    return-object v0

    .line 79
    :cond_3
    const/4 p0, 0x0

    .line 80
    return-object p0
.end method

.method public d()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nch;->b:Ljava/util/List;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public e()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nch;->a:Ljava/util/List;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public final f(Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;)Z
    .locals 1

    .line 1
    iget-object p0, p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    invoke-static {p0}, Ll/ksg;->Z(Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/4 p1, 0x1

    .line 8
    if-nez p0, :cond_0

    .line 9
    .line 10
    return p1

    .line 11
    :cond_0
    iget-object p0, p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 12
    .line 13
    invoke-static {p0}, Ll/s1j;->a(Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    if-eqz p0, :cond_2

    .line 21
    .line 22
    iget p0, p2, Lcom/p1/mobile/putong/feed/data/Moment;->curForwardRenderState:I

    .line 23
    .line 24
    const/4 p2, 0x2

    .line 25
    if-ne p0, p2, :cond_1

    .line 26
    .line 27
    return p1

    .line 28
    :cond_1
    return v0

    .line 29
    :cond_2
    iget p0, p2, Lcom/p1/mobile/putong/feed/data/Moment;->curForwardRenderState:I

    .line 30
    .line 31
    if-ne p0, p1, :cond_3

    .line 32
    .line 33
    return p1

    .line 34
    :cond_3
    return v0
.end method

.method public final g(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/Moment;)Z
    .locals 2

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->multiCallInfo:Lcom/p1/mobile/putong/feed/data/LiveMultiCallInfo;

    .line 2
    .line 3
    iget-object p1, p2, Lcom/p1/mobile/putong/feed/data/Moment;->multiCallInfo:Lcom/p1/mobile/putong/feed/data/LiveMultiCallInfo;

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    if-nez p1, :cond_0

    .line 9
    .line 10
    move v1, v0

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 v1, 0x0

    .line 13
    :goto_0
    if-eqz p0, :cond_1

    .line 14
    .line 15
    if-eqz p1, :cond_1

    .line 16
    .line 17
    invoke-virtual {p2}, Lcom/p1/mobile/putong/feed/data/Moment;->isLiveDataChange()Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    xor-int/2addr p0, v0

    .line 22
    return p0

    .line 23
    :cond_1
    return v1
.end method

.method public final h(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/Moment;)Z
    .locals 4

    .line 1
    iget-boolean p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->hasHeadFrame:Z

    .line 2
    .line 3
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 4
    .line 5
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p1, p2}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    const/4 p2, 0x0

    .line 12
    if-nez p1, :cond_0

    .line 13
    .line 14
    return p2

    .line 15
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->headFrame:Lcom/p1/mobile/putong/data/HeadFrame;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/data/HeadFrame;->expiredTime:Ljava/util/List;

    .line 22
    .line 23
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-nez v1, :cond_1

    .line 28
    .line 29
    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    check-cast v0, Ljava/lang/Double;

    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    .line 36
    .line 37
    .line 38
    move-result-wide v0

    .line 39
    invoke-static {}, Ll/pzi0;->o()J

    .line 40
    .line 41
    .line 42
    move-result-wide v2

    .line 43
    long-to-double v2, v2

    .line 44
    cmpl-double v0, v0, v2

    .line 45
    .line 46
    if-lez v0, :cond_1

    .line 47
    .line 48
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 49
    .line 50
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 51
    .line 52
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->headFrame:Lcom/p1/mobile/putong/data/HeadFrame;

    .line 53
    .line 54
    iget-object p1, p1, Lcom/p1/mobile/putong/data/HeadFrame;->url:Ljava/util/List;

    .line 55
    .line 56
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    if-nez p1, :cond_1

    .line 61
    .line 62
    const/4 p1, 0x1

    .line 63
    goto :goto_0

    .line 64
    :cond_1
    move p1, p2

    .line 65
    :goto_0
    if-ne p0, p1, :cond_2

    .line 66
    .line 67
    return p1

    .line 68
    :cond_2
    return p2
.end method

.method public final i(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/Moment;)Z
    .locals 6

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->live:Lcom/p1/mobile/putong/data/Live;

    .line 2
    .line 3
    iget-object v1, p2, Lcom/p1/mobile/putong/feed/data/Moment;->live:Lcom/p1/mobile/putong/data/Live;

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    return v2

    .line 11
    :cond_0
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v3

    .line 15
    const/4 v4, 0x0

    .line 16
    if-eqz v3, :cond_1

    .line 17
    .line 18
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    if-eqz v3, :cond_1

    .line 23
    .line 24
    iget-object v3, v0, Lcom/p1/mobile/putong/data/Live;->id:Ljava/lang/String;

    .line 25
    .line 26
    iget-object v5, v1, Lcom/p1/mobile/putong/data/Live;->id:Ljava/lang/String;

    .line 27
    .line 28
    invoke-static {v3, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    if-eqz v3, :cond_1

    .line 33
    .line 34
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Live;->redPacketIds:Ljava/util/List;

    .line 35
    .line 36
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Live;->redPacketIds:Ljava/util/List;

    .line 41
    .line 42
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-ne v0, v1, :cond_1

    .line 47
    .line 48
    invoke-virtual {p0, p1, p2}, Ll/nch;->g(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    if-eqz p0, :cond_1

    .line 53
    .line 54
    return v2

    .line 55
    :cond_1
    return v4
.end method

.method public final j(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/Moment;)Z
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->momentVoiceLiveInfos:Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;

    .line 2
    .line 3
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 4
    .line 5
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/data/Moment;->thirdShareSource:Lcom/p1/mobile/putong/feed/data/ThirdShareSource;

    .line 6
    .line 7
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/data/ThirdShareSource;->sourceId:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p1, p2}, Ll/jka;->L7(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    if-eqz p2, :cond_0

    .line 18
    .line 19
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    if-eqz p2, :cond_0

    .line 24
    .line 25
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    return p0

    .line 30
    :cond_0
    const/4 p0, 0x0

    .line 31
    return p0
.end method

.method public final k(Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;)Z
    .locals 1

    .line 1
    invoke-static {}, Ll/cmg;->n0()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x1

    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    return v0

    .line 9
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/Moment;->isVoteTopicMoment()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_3

    .line 16
    .line 17
    iget-object p0, p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/Moment;->isVoteTopicMoment()Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-nez p0, :cond_3

    .line 24
    .line 25
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/Moment;->isQATopicMoment()Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-eqz p0, :cond_1

    .line 32
    .line 33
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 34
    .line 35
    iget-boolean p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->shareMyVote:Z

    .line 36
    .line 37
    if-nez p0, :cond_3

    .line 38
    .line 39
    :cond_1
    iget-object p0, p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/Moment;->isQATopicMoment()Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    if-eqz p0, :cond_2

    .line 46
    .line 47
    iget-object p0, p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 48
    .line 49
    iget-boolean p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->shareMyVote:Z

    .line 50
    .line 51
    if-nez p0, :cond_3

    .line 52
    .line 53
    :cond_2
    return v0

    .line 54
    :cond_3
    const/4 p0, 0x0

    .line 55
    return p0
.end method

.method public final l(Lcom/p1/mobile/putong/feed/data/Moment;)Z
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->thirdShareSource:Lcom/p1/mobile/putong/feed/data/ThirdShareSource;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->thirdShareSource:Lcom/p1/mobile/putong/feed/data/ThirdShareSource;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/ThirdShareSource;->sourceId:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->thirdShareSource:Lcom/p1/mobile/putong/feed/data/ThirdShareSource;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/ThirdShareSource;->sourceType:Ljava/lang/String;

    .line 22
    .line 23
    const-string p1, "voiceLive"

    .line 24
    .line 25
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_0

    .line 30
    .line 31
    const/4 p0, 0x1

    .line 32
    return p0

    .line 33
    :cond_0
    const/4 p0, 0x0

    .line 34
    return p0
.end method

.method public m(Ljava/util/List;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/nch;->a:Ljava/util/List;

    .line 2
    .line 3
    iput-object p2, p0, Ll/nch;->b:Ljava/util/List;

    .line 4
    .line 5
    return-void
.end method
