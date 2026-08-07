.class public Ll/gm10;
.super Ll/k7t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/k7t<",
        "Ll/dc10;",
        ">;"
    }
.end annotation


# instance fields
.field public n:Landroidx/recyclerview/widget/RecyclerView$n;

.field public o:Ll/em10;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/k7t;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic v(Ll/gm10;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/gm10;->w(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public init()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->init()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public k()I
    .locals 0

    .line 1
    sget p0, Ll/obc0;->v:I

    .line 2
    .line 3
    return p0
.end method

.method public final synthetic w(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->b:Ll/hj2;

    .line 2
    .line 3
    check-cast p0, Ll/dc10;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/dc10;->W3(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public x(Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkLeaderboard;Ll/cm0;Ll/em10;)V
    .locals 8

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkLeaderboard;->anchorName:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    const/4 v2, 0x6

    .line 9
    if-lt v0, v2, :cond_0

    .line 10
    .line 11
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkLeaderboard;->anchorName:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v2, "..."

    .line 18
    .line 19
    invoke-virtual {v0, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iput-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkLeaderboard;->anchorName:Ljava/lang/String;

    .line 24
    .line 25
    :cond_0
    iget-object v0, p0, Ll/k7t;->f:Lv/VText;

    .line 26
    .line 27
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkLeaderboard;->anchorName:Ljava/lang/String;

    .line 28
    .line 29
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    const-string v3, "%s\u7684\u672c\u573aPK\u8d21\u732e\u699c"

    .line 34
    .line 35
    invoke-static {v3, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 40
    .line 41
    .line 42
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkLeaderboard;->rank:I

    .line 43
    .line 44
    const-string v2, "%s%s"

    .line 45
    .line 46
    const-string v3, "\u00b7\u8ddd\u7b2c1\u540d\u5dee"

    .line 47
    .line 48
    const-string v4, "\u4eba\u52a9\u529b"

    .line 49
    .line 50
    const/4 v5, 0x1

    .line 51
    const-string v6, "PK\u503c"

    .line 52
    .line 53
    const-string v7, "\u6682\u65e0\u4eba\u52a9\u529b"

    .line 54
    .line 55
    if-gez v0, :cond_3

    .line 56
    .line 57
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkLeaderboard;->gap:I

    .line 58
    .line 59
    if-gtz v0, :cond_1

    .line 60
    .line 61
    iget-object v0, p0, Ll/k7t;->g:Lv/VText;

    .line 62
    .line 63
    invoke-virtual {v0, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 64
    .line 65
    .line 66
    goto/16 :goto_1

    .line 67
    .line 68
    :cond_1
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkLeaderboard;->contributorNum:I

    .line 69
    .line 70
    if-lez v0, :cond_2

    .line 71
    .line 72
    new-instance v0, Ljava/lang/StringBuilder;

    .line 73
    .line 74
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 75
    .line 76
    .line 77
    iget v7, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkLeaderboard;->contributorNum:I

    .line 78
    .line 79
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v7

    .line 89
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 90
    .line 91
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkLeaderboard;->gap:I

    .line 95
    .line 96
    int-to-double v3, v3

    .line 97
    invoke-static {v3, v4}, Ll/yau;->c(D)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v3

    .line 101
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    iget-object v3, p0, Ll/k7t;->g:Lv/VText;

    .line 112
    .line 113
    filled-new-array {v7, v0}, [Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    invoke-static {v2, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 122
    .line 123
    .line 124
    goto :goto_1

    .line 125
    :cond_3
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkLeaderboard;->contributorNum:I

    .line 126
    .line 127
    if-lez v0, :cond_4

    .line 128
    .line 129
    new-instance v0, Ljava/lang/StringBuilder;

    .line 130
    .line 131
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 132
    .line 133
    .line 134
    iget v7, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkLeaderboard;->contributorNum:I

    .line 135
    .line 136
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 140
    .line 141
    .line 142
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object v7

    .line 146
    :cond_4
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkLeaderboard;->rank:I

    .line 147
    .line 148
    iget v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkLeaderboard;->gap:I

    .line 149
    .line 150
    if-ne v0, v5, :cond_5

    .line 151
    .line 152
    new-instance v0, Ljava/lang/StringBuilder;

    .line 153
    .line 154
    const-string v3, "\u00b7\u9886\u5148\u7b2c2\u540d"

    .line 155
    .line 156
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 157
    .line 158
    .line 159
    int-to-double v3, v4

    .line 160
    invoke-static {v3, v4}, Ll/yau;->c(D)Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object v3

    .line 164
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 165
    .line 166
    .line 167
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 168
    .line 169
    .line 170
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object v0

    .line 174
    goto :goto_0

    .line 175
    :cond_5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 176
    .line 177
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 178
    .line 179
    .line 180
    int-to-double v3, v4

    .line 181
    invoke-static {v3, v4}, Ll/yau;->c(D)Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object v3

    .line 185
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 186
    .line 187
    .line 188
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 189
    .line 190
    .line 191
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 192
    .line 193
    .line 194
    move-result-object v0

    .line 195
    :goto_0
    iget-object v3, p0, Ll/k7t;->g:Lv/VText;

    .line 196
    .line 197
    filled-new-array {v7, v0}, [Ljava/lang/Object;

    .line 198
    .line 199
    .line 200
    move-result-object v0

    .line 201
    invoke-static {v2, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object v0

    .line 205
    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 206
    .line 207
    .line 208
    :goto_1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkLeaderboard;->allLeaderboards:Ljava/util/List;

    .line 209
    .line 210
    const/16 v2, 0x8

    .line 211
    .line 212
    if-eqz v0, :cond_8

    .line 213
    .line 214
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 215
    .line 216
    .line 217
    move-result v0

    .line 218
    if-nez v0, :cond_6

    .line 219
    .line 220
    goto :goto_2

    .line 221
    :cond_6
    iput-object p3, p0, Ll/gm10;->o:Ll/em10;

    .line 222
    .line 223
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkLeaderboard;->allLeaderboards:Ljava/util/List;

    .line 224
    .line 225
    invoke-virtual {p3, v0, p2, v5}, Ll/em10;->I(Ljava/util/List;Ll/cm0;Z)V

    .line 226
    .line 227
    .line 228
    iget-object v0, p0, Ll/k7t;->i:Lv/VRecyclerView;

    .line 229
    .line 230
    new-instance v3, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 231
    .line 232
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 233
    .line 234
    .line 235
    move-result-object v4

    .line 236
    invoke-direct {v3, v4}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 237
    .line 238
    .line 239
    invoke-virtual {v0, v3}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 240
    .line 241
    .line 242
    iget-object v0, p0, Ll/k7t;->i:Lv/VRecyclerView;

    .line 243
    .line 244
    invoke-virtual {v0, p3}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 245
    .line 246
    .line 247
    iget-object p3, p0, Ll/gm10;->n:Landroidx/recyclerview/widget/RecyclerView$n;

    .line 248
    .line 249
    if-nez p3, :cond_7

    .line 250
    .line 251
    new-instance p3, Ll/te60;

    .line 252
    .line 253
    sget v0, Ll/qa00;->i:I

    .line 254
    .line 255
    sget v3, Ll/qa00;->U:I

    .line 256
    .line 257
    invoke-direct {p3, v5, v0, v3}, Ll/te60;-><init>(III)V

    .line 258
    .line 259
    .line 260
    iput-object p3, p0, Ll/gm10;->n:Landroidx/recyclerview/widget/RecyclerView$n;

    .line 261
    .line 262
    iget-object v0, p0, Ll/k7t;->i:Lv/VRecyclerView;

    .line 263
    .line 264
    invoke-virtual {v0, p3}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 265
    .line 266
    .line 267
    :cond_7
    iget-object p3, p0, Ll/k7t;->j:Lv/VLinear;

    .line 268
    .line 269
    invoke-virtual {p3, v2}, Landroid/view/View;->setVisibility(I)V

    .line 270
    .line 271
    .line 272
    goto :goto_3

    .line 273
    :cond_8
    :goto_2
    iget-object p3, p0, Ll/k7t;->j:Lv/VLinear;

    .line 274
    .line 275
    invoke-virtual {p3, v1}, Landroid/view/View;->setVisibility(I)V

    .line 276
    .line 277
    .line 278
    iget-object p3, p0, Ll/gm10;->o:Ll/em10;

    .line 279
    .line 280
    if-eqz p3, :cond_9

    .line 281
    .line 282
    invoke-virtual {p3}, Ll/em10;->F()V

    .line 283
    .line 284
    .line 285
    :cond_9
    :goto_3
    iget-object p3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkLeaderboard;->currentLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkBoardUser;

    .line 286
    .line 287
    iget-object v0, p0, Ll/k7t;->m:Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/dialog/view/MultiCallPkBoardItemView;

    .line 288
    .line 289
    if-eqz p3, :cond_a

    .line 290
    .line 291
    new-instance p3, Ll/fm10;

    .line 292
    .line 293
    invoke-direct {p3, p0}, Ll/fm10;-><init>(Ll/gm10;)V

    .line 294
    .line 295
    .line 296
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkLeaderboard;->currentLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkBoardUser;

    .line 297
    .line 298
    invoke-virtual {v0, p3, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/dialog/view/MultiCallPkBoardItemView;->l0(Ll/y20;Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkBoardUser;Ll/cm0;)V

    .line 299
    .line 300
    .line 301
    iget-object p1, p0, Ll/k7t;->m:Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/dialog/view/MultiCallPkBoardItemView;

    .line 302
    .line 303
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 304
    .line 305
    .line 306
    iget-object p1, p0, Ll/k7t;->k:Landroid/view/View;

    .line 307
    .line 308
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 309
    .line 310
    .line 311
    iget-object p0, p0, Ll/k7t;->l:Landroid/view/View;

    .line 312
    .line 313
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 314
    .line 315
    .line 316
    return-void

    .line 317
    :cond_a
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 318
    .line 319
    .line 320
    iget-object p1, p0, Ll/k7t;->k:Landroid/view/View;

    .line 321
    .line 322
    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 323
    .line 324
    .line 325
    iget-object p0, p0, Ll/k7t;->l:Landroid/view/View;

    .line 326
    .line 327
    invoke-virtual {p0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 328
    .line 329
    .line 330
    return-void
.end method

.method public y()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/gm10;->o:Ll/em10;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/em10;->F()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Ll/k7t;->m:Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/dialog/view/MultiCallPkBoardItemView;

    .line 9
    .line 10
    const/16 v1, 0x8

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/k7t;->k:Landroid/view/View;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/k7t;->l:Landroid/view/View;

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Ll/k7t;->j:Lv/VLinear;

    .line 26
    .line 27
    const/4 v0, 0x0

    .line 28
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 29
    .line 30
    .line 31
    return-void
.end method
