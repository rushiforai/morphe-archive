.class public Ll/mx2;
.super Ll/qx2;
.source "SourceFile"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qx2;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public bridge synthetic A0(Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;Z)Z
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Ll/qx2;->A0(Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;Z)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public B0(Landroid/view/View;Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;FZ)V
    .locals 10

    .line 1
    iget-object p3, p0, Ll/ox2;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {p3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result p3

    .line 7
    if-nez p3, :cond_1

    .line 8
    .line 9
    iget-object p3, p0, Ll/ox2;->a:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object p3

    .line 15
    :cond_0
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Ll/txl0;

    .line 26
    .line 27
    iget-object v1, v0, Ll/txl0;->a:Landroid/view/View;

    .line 28
    .line 29
    if-ne v1, p1, :cond_0

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    const/4 v0, 0x0

    .line 33
    :goto_0
    if-nez v0, :cond_2

    .line 34
    .line 35
    goto/16 :goto_3

    .line 36
    .line 37
    :cond_2
    iget-object p1, p0, Ll/ox2;->l:Ll/dn4;

    .line 38
    .line 39
    invoke-interface {p1, v0, p2, p4}, Ll/dn4;->a(Ll/txl0;Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;Z)Lcom/p1/mobile/putong/core/newui/home/opt/CardSwipeOutState;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    sget-object p2, Lcom/p1/mobile/putong/core/newui/home/opt/CardSwipeOutState;->PASS:Lcom/p1/mobile/putong/core/newui/home/opt/CardSwipeOutState;

    .line 44
    .line 45
    if-ne p1, p2, :cond_9

    .line 46
    .line 47
    iget-object p1, p0, Ll/ox2;->a:Ljava/util/List;

    .line 48
    .line 49
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 54
    .line 55
    .line 56
    move-result p2

    .line 57
    if-eqz p2, :cond_4

    .line 58
    .line 59
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object p2

    .line 63
    check-cast p2, Ll/txl0;

    .line 64
    .line 65
    if-ne p2, v0, :cond_3

    .line 66
    .line 67
    invoke-interface {p1}, Ljava/util/Iterator;->remove()V

    .line 68
    .line 69
    .line 70
    goto :goto_1

    .line 71
    :cond_3
    iget p3, p2, Ll/txl0;->e:I

    .line 72
    .line 73
    add-int/lit8 p3, p3, -0x1

    .line 74
    .line 75
    iput p3, p2, Ll/txl0;->e:I

    .line 76
    .line 77
    goto :goto_1

    .line 78
    :cond_4
    invoke-virtual {p0}, Ll/ox2;->B()Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    iget-object p2, v0, Ll/txl0;->a:Landroid/view/View;

    .line 83
    .line 84
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 85
    .line 86
    .line 87
    iget-object p1, p0, Ll/ox2;->k:Ll/xi80;

    .line 88
    .line 89
    invoke-virtual {p1, v0}, Ll/xi80;->b(Ll/txl0;)V

    .line 90
    .line 91
    .line 92
    iget-object p1, p0, Ll/ox2;->e:Ll/nx2;

    .line 93
    .line 94
    iget-object p2, v0, Ll/txl0;->a:Landroid/view/View;

    .line 95
    .line 96
    const/4 p3, 0x0

    .line 97
    invoke-virtual {p1, p2, p3}, Ll/nx2;->l(Landroid/view/View;Z)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {p0, v0}, Ll/ox2;->g0(Ll/txl0;)V

    .line 101
    .line 102
    .line 103
    iget-object p1, p0, Ll/ox2;->a:Ljava/util/List;

    .line 104
    .line 105
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 106
    .line 107
    .line 108
    move-result p1

    .line 109
    if-lez p1, :cond_5

    .line 110
    .line 111
    iget-object p1, p0, Ll/ox2;->a:Ljava/util/List;

    .line 112
    .line 113
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 114
    .line 115
    .line 116
    move-result p2

    .line 117
    add-int/lit8 p2, p2, -0x1

    .line 118
    .line 119
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    check-cast p1, Ll/txl0;

    .line 124
    .line 125
    iget p1, p1, Ll/txl0;->e:I

    .line 126
    .line 127
    add-int/lit8 p1, p1, 0x1

    .line 128
    .line 129
    goto :goto_2

    .line 130
    :cond_5
    const/4 p1, -0x1

    .line 131
    :goto_2
    iget-object p2, p0, Ll/ox2;->a:Ljava/util/List;

    .line 132
    .line 133
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 134
    .line 135
    .line 136
    move-result p2

    .line 137
    if-nez p2, :cond_7

    .line 138
    .line 139
    iget-object p2, p0, Ll/ox2;->a:Ljava/util/List;

    .line 140
    .line 141
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 142
    .line 143
    .line 144
    move-result-object p2

    .line 145
    :cond_6
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 146
    .line 147
    .line 148
    move-result p4

    .line 149
    if-eqz p4, :cond_7

    .line 150
    .line 151
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 152
    .line 153
    .line 154
    move-result-object p4

    .line 155
    check-cast p4, Ll/txl0;

    .line 156
    .line 157
    iget v0, p4, Ll/txl0;->e:I

    .line 158
    .line 159
    if-nez v0, :cond_6

    .line 160
    .line 161
    iget-object p2, p0, Ll/ox2;->e:Ll/nx2;

    .line 162
    .line 163
    iget-object p4, p4, Ll/txl0;->a:Landroid/view/View;

    .line 164
    .line 165
    invoke-virtual {p2, p4, p3}, Ll/nx2;->d(Landroid/view/View;I)V

    .line 166
    .line 167
    .line 168
    :cond_7
    if-ltz p1, :cond_9

    .line 169
    .line 170
    iget-object p2, p0, Ll/ox2;->e:Ll/nx2;

    .line 171
    .line 172
    invoke-virtual {p2}, Ll/nx2;->f()I

    .line 173
    .line 174
    .line 175
    move-result p2

    .line 176
    if-ge p1, p2, :cond_9

    .line 177
    .line 178
    invoke-virtual {p0}, Ll/ox2;->p()Ll/nx2;

    .line 179
    .line 180
    .line 181
    move-result-object p2

    .line 182
    invoke-virtual {p2, p1}, Ll/nx2;->h(I)I

    .line 183
    .line 184
    .line 185
    move-result p3

    .line 186
    invoke-virtual {p0}, Ll/ox2;->r()Landroid/content/Context;

    .line 187
    .line 188
    .line 189
    move-result-object p4

    .line 190
    invoke-static {p4}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 191
    .line 192
    .line 193
    move-result-object p4

    .line 194
    invoke-virtual {p0}, Ll/ox2;->x()Ll/xi80;

    .line 195
    .line 196
    .line 197
    move-result-object v0

    .line 198
    invoke-virtual {v0, p3}, Ll/xi80;->a(I)Landroid/view/View;

    .line 199
    .line 200
    .line 201
    move-result-object v0

    .line 202
    if-nez v0, :cond_8

    .line 203
    .line 204
    invoke-virtual {p0}, Ll/ox2;->p()Ll/nx2;

    .line 205
    .line 206
    .line 207
    move-result-object v0

    .line 208
    invoke-virtual {p0}, Ll/ox2;->r()Landroid/content/Context;

    .line 209
    .line 210
    .line 211
    move-result-object v1

    .line 212
    invoke-virtual {v0, p3, v1, p4}, Ll/nx2;->e(ILandroid/content/Context;Landroid/view/LayoutInflater;)Landroid/view/View;

    .line 213
    .line 214
    .line 215
    move-result-object v0

    .line 216
    :cond_8
    move-object v2, v0

    .line 217
    const/4 p3, 0x0

    .line 218
    invoke-virtual {v2, p3}, Landroid/view/View;->setTranslationY(F)V

    .line 219
    .line 220
    .line 221
    invoke-virtual {v2, p3}, Landroid/view/View;->setTranslationX(F)V

    .line 222
    .line 223
    .line 224
    invoke-virtual {v2, p3}, Landroid/view/View;->setRotation(F)V

    .line 225
    .line 226
    .line 227
    const/high16 p3, 0x3f800000    # 1.0f

    .line 228
    .line 229
    invoke-virtual {v2, p3}, Landroid/view/View;->setScaleX(F)V

    .line 230
    .line 231
    .line 232
    invoke-virtual {v2, p3}, Landroid/view/View;->setScaleY(F)V

    .line 233
    .line 234
    .line 235
    invoke-virtual {v2, p3}, Landroid/view/View;->setAlpha(F)V

    .line 236
    .line 237
    .line 238
    invoke-virtual {p2, v2, p1}, Ll/nx2;->d(Landroid/view/View;I)V

    .line 239
    .line 240
    .line 241
    new-instance p3, Ll/txl0;

    .line 242
    .line 243
    invoke-direct {p3}, Ll/txl0;-><init>()V

    .line 244
    .line 245
    .line 246
    iput p1, p3, Ll/txl0;->e:I

    .line 247
    .line 248
    iput-object v2, p3, Ll/txl0;->a:Landroid/view/View;

    .line 249
    .line 250
    invoke-virtual {p2, p1}, Ll/nx2;->h(I)I

    .line 251
    .line 252
    .line 253
    move-result p4

    .line 254
    iput p4, p3, Ll/txl0;->d:I

    .line 255
    .line 256
    sget-object p4, Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;->INIT:Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;

    .line 257
    .line 258
    iput-object p4, p3, Ll/txl0;->j:Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;

    .line 259
    .line 260
    invoke-virtual {p2, p1}, Ll/nx2;->i(I)Ljava/lang/String;

    .line 261
    .line 262
    .line 263
    move-result-object p4

    .line 264
    invoke-virtual {p2, p1}, Ll/nx2;->g(I)Ljava/lang/Object;

    .line 265
    .line 266
    .line 267
    move-result-object p1

    .line 268
    invoke-virtual {p3, p4, p1}, Ll/txl0;->c(Ljava/lang/String;Ljava/lang/Object;)V

    .line 269
    .line 270
    .line 271
    iput-object v2, p3, Ll/txl0;->a:Landroid/view/View;

    .line 272
    .line 273
    sget-object v7, Lcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;->ANIM:Lcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;

    .line 274
    .line 275
    const/4 v8, 0x0

    .line 276
    const-string v9, "other"

    .line 277
    .line 278
    const/4 v3, 0x0

    .line 279
    const/4 v4, 0x0

    .line 280
    const/4 v5, 0x0

    .line 281
    const/4 v6, 0x0

    .line 282
    move-object v1, p0

    .line 283
    invoke-virtual/range {v1 .. v9}, Ll/ox2;->O(Landroid/view/View;FFFFLcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;ZLjava/lang/String;)V

    .line 284
    .line 285
    .line 286
    iget-object p0, v1, Ll/ox2;->a:Ljava/util/List;

    .line 287
    .line 288
    invoke-interface {p0, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 289
    .line 290
    .line 291
    invoke-virtual {v1}, Ll/ox2;->B()Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;

    .line 292
    .line 293
    .line 294
    move-result-object p0

    .line 295
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 296
    .line 297
    .line 298
    invoke-virtual {v1}, Ll/ox2;->B()Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;

    .line 299
    .line 300
    .line 301
    move-result-object p0

    .line 302
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 303
    .line 304
    .line 305
    :cond_9
    :goto_3
    return-void
.end method

.method public final C0(Ll/nh4;)V
    .locals 14

    .line 1
    iget-object v0, p0, Ll/ox2;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Ll/txl0;

    .line 18
    .line 19
    iget v2, v1, Ll/txl0;->e:I

    .line 20
    .line 21
    iget v3, p1, Ll/nh4;->e:I

    .line 22
    .line 23
    add-int/2addr v2, v3

    .line 24
    iput v2, v1, Ll/txl0;->e:I

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    iget-object v0, p1, Ll/nh4;->p:Ll/txl0;

    .line 28
    .line 29
    invoke-virtual {p0, v0}, Ll/ox2;->g0(Ll/txl0;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/ox2;->a:Ljava/util/List;

    .line 33
    .line 34
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-lez v0, :cond_1

    .line 39
    .line 40
    iget-object v0, p0, Ll/ox2;->a:Ljava/util/List;

    .line 41
    .line 42
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    add-int/lit8 v1, v1, -0x1

    .line 47
    .line 48
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    check-cast v0, Ll/txl0;

    .line 53
    .line 54
    iget v0, v0, Ll/txl0;->e:I

    .line 55
    .line 56
    add-int/lit8 v0, v0, 0x1

    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_1
    const/4 v0, -0x1

    .line 60
    :goto_1
    iget-object v1, p0, Ll/ox2;->a:Ljava/util/List;

    .line 61
    .line 62
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    if-nez v1, :cond_3

    .line 67
    .line 68
    iget-object v1, p0, Ll/ox2;->a:Ljava/util/List;

    .line 69
    .line 70
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 75
    .line 76
    .line 77
    move-result v2

    .line 78
    if-eqz v2, :cond_3

    .line 79
    .line 80
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    check-cast v2, Ll/txl0;

    .line 85
    .line 86
    iget v3, v2, Ll/txl0;->e:I

    .line 87
    .line 88
    if-nez v3, :cond_2

    .line 89
    .line 90
    iget-object v1, p0, Ll/ox2;->e:Ll/nx2;

    .line 91
    .line 92
    iget-object v2, v2, Ll/txl0;->a:Landroid/view/View;

    .line 93
    .line 94
    const/4 v3, 0x0

    .line 95
    invoke-virtual {v1, v2, v3}, Ll/nx2;->d(Landroid/view/View;I)V

    .line 96
    .line 97
    .line 98
    :cond_3
    if-ltz v0, :cond_6

    .line 99
    .line 100
    iget-object v1, p0, Ll/ox2;->e:Ll/nx2;

    .line 101
    .line 102
    invoke-virtual {v1}, Ll/nx2;->f()I

    .line 103
    .line 104
    .line 105
    move-result v1

    .line 106
    if-ge v0, v1, :cond_6

    .line 107
    .line 108
    invoke-virtual {p0}, Ll/ox2;->p()Ll/nx2;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    invoke-virtual {v1, v0}, Ll/nx2;->h(I)I

    .line 113
    .line 114
    .line 115
    move-result v2

    .line 116
    invoke-virtual {p0}, Ll/ox2;->r()Landroid/content/Context;

    .line 117
    .line 118
    .line 119
    move-result-object v3

    .line 120
    invoke-static {v3}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 121
    .line 122
    .line 123
    move-result-object v3

    .line 124
    invoke-virtual {p0}, Ll/ox2;->x()Ll/xi80;

    .line 125
    .line 126
    .line 127
    move-result-object v4

    .line 128
    invoke-virtual {v4, v2}, Ll/xi80;->a(I)Landroid/view/View;

    .line 129
    .line 130
    .line 131
    move-result-object v4

    .line 132
    if-nez v4, :cond_4

    .line 133
    .line 134
    invoke-virtual {p0}, Ll/ox2;->p()Ll/nx2;

    .line 135
    .line 136
    .line 137
    move-result-object v4

    .line 138
    invoke-virtual {p0}, Ll/ox2;->r()Landroid/content/Context;

    .line 139
    .line 140
    .line 141
    move-result-object v5

    .line 142
    invoke-virtual {v4, v2, v5, v3}, Ll/nx2;->e(ILandroid/content/Context;Landroid/view/LayoutInflater;)Landroid/view/View;

    .line 143
    .line 144
    .line 145
    move-result-object v4

    .line 146
    :cond_4
    const/4 v2, 0x0

    .line 147
    invoke-virtual {v4, v2}, Landroid/view/View;->setTranslationY(F)V

    .line 148
    .line 149
    .line 150
    invoke-virtual {v4, v2}, Landroid/view/View;->setTranslationX(F)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {v4, v2}, Landroid/view/View;->setRotation(F)V

    .line 154
    .line 155
    .line 156
    const/high16 v2, 0x3f800000    # 1.0f

    .line 157
    .line 158
    invoke-virtual {v4, v2}, Landroid/view/View;->setScaleX(F)V

    .line 159
    .line 160
    .line 161
    invoke-virtual {v4, v2}, Landroid/view/View;->setScaleY(F)V

    .line 162
    .line 163
    .line 164
    invoke-virtual {v1, v4, v0}, Ll/nx2;->d(Landroid/view/View;I)V

    .line 165
    .line 166
    .line 167
    new-instance v3, Ll/txl0;

    .line 168
    .line 169
    invoke-direct {v3}, Ll/txl0;-><init>()V

    .line 170
    .line 171
    .line 172
    iput v0, v3, Ll/txl0;->e:I

    .line 173
    .line 174
    iput-object v4, v3, Ll/txl0;->a:Landroid/view/View;

    .line 175
    .line 176
    invoke-virtual {v1, v0}, Ll/nx2;->h(I)I

    .line 177
    .line 178
    .line 179
    move-result v5

    .line 180
    iput v5, v3, Ll/txl0;->d:I

    .line 181
    .line 182
    sget-object v5, Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;->INIT:Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;

    .line 183
    .line 184
    iput-object v5, v3, Ll/txl0;->j:Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;

    .line 185
    .line 186
    invoke-virtual {v1, v0}, Ll/nx2;->i(I)Ljava/lang/String;

    .line 187
    .line 188
    .line 189
    move-result-object v5

    .line 190
    invoke-virtual {v1, v0}, Ll/nx2;->g(I)Ljava/lang/Object;

    .line 191
    .line 192
    .line 193
    move-result-object v0

    .line 194
    invoke-virtual {v3, v5, v0}, Ll/txl0;->c(Ljava/lang/String;Ljava/lang/Object;)V

    .line 195
    .line 196
    .line 197
    iput-object v4, v3, Ll/txl0;->a:Landroid/view/View;

    .line 198
    .line 199
    iget-object v0, p0, Ll/ox2;->d:Ll/vr2;

    .line 200
    .line 201
    invoke-virtual {v0}, Ll/vr2;->h()Z

    .line 202
    .line 203
    .line 204
    move-result v0

    .line 205
    if-eqz v0, :cond_5

    .line 206
    .line 207
    iget-object v0, p0, Ll/ox2;->d:Ll/vr2;

    .line 208
    .line 209
    invoke-virtual {v0}, Ll/vr2;->a()F

    .line 210
    .line 211
    .line 212
    move-result v0

    .line 213
    cmpg-float v0, v0, v2

    .line 214
    .line 215
    if-gez v0, :cond_5

    .line 216
    .line 217
    iget-object v0, p0, Ll/ox2;->d:Ll/vr2;

    .line 218
    .line 219
    invoke-virtual {v0}, Ll/vr2;->a()F

    .line 220
    .line 221
    .line 222
    move-result v0

    .line 223
    invoke-virtual {v4, v0}, Landroid/view/View;->setAlpha(F)V

    .line 224
    .line 225
    .line 226
    :cond_5
    iget-object v6, v3, Ll/txl0;->a:Landroid/view/View;

    .line 227
    .line 228
    sget-object v11, Lcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;->ANIM_DONE:Lcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;

    .line 229
    .line 230
    iget-boolean v12, p1, Ll/nh4;->q:Z

    .line 231
    .line 232
    const-string v13, "outSuccess"

    .line 233
    .line 234
    const/4 v7, 0x0

    .line 235
    const/4 v8, 0x0

    .line 236
    const/4 v9, 0x0

    .line 237
    const/4 v10, 0x0

    .line 238
    move-object v5, p0

    .line 239
    invoke-virtual/range {v5 .. v13}, Ll/ox2;->O(Landroid/view/View;FFFFLcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;ZLjava/lang/String;)V

    .line 240
    .line 241
    .line 242
    iget-object p0, v5, Ll/ox2;->a:Ljava/util/List;

    .line 243
    .line 244
    invoke-interface {p0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 245
    .line 246
    .line 247
    invoke-virtual {v5}, Ll/ox2;->B()Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;

    .line 248
    .line 249
    .line 250
    move-result-object p0

    .line 251
    invoke-virtual {p0, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 252
    .line 253
    .line 254
    invoke-virtual {v5}, Ll/ox2;->B()Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;

    .line 255
    .line 256
    .line 257
    move-result-object p0

    .line 258
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 259
    .line 260
    .line 261
    :cond_6
    return-void
.end method

.method public J(Ll/nh4;J)V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget-wide v2, v1, Ll/nh4;->c:J

    .line 6
    .line 7
    sub-long v2, p2, v2

    .line 8
    .line 9
    long-to-float v2, v2

    .line 10
    iget-wide v3, v1, Ll/nh4;->d:J

    .line 11
    .line 12
    long-to-float v3, v3

    .line 13
    div-float/2addr v2, v3

    .line 14
    invoke-virtual {v1}, Ll/nh4;->f()Landroid/view/animation/Interpolator;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    invoke-interface {v3, v2}, Landroid/animation/TimeInterpolator;->getInterpolation(F)F

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    const/high16 v3, 0x3f800000    # 1.0f

    .line 23
    .line 24
    invoke-static {v3, v2}, Ljava/lang/Math;->min(FF)F

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    const/4 v4, 0x0

    .line 29
    invoke-static {v4, v2}, Ljava/lang/Math;->max(FF)F

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    iget-object v5, v1, Ll/nh4;->f:Ll/mo0;

    .line 34
    .line 35
    iget-object v6, v0, Ll/ox2;->a:Ljava/util/List;

    .line 36
    .line 37
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 38
    .line 39
    .line 40
    move-result-object v6

    .line 41
    const/4 v7, 0x0

    .line 42
    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    .line 43
    .line 44
    .line 45
    move-result v8

    .line 46
    if-eqz v8, :cond_6

    .line 47
    .line 48
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v8

    .line 52
    check-cast v8, Ll/txl0;

    .line 53
    .line 54
    invoke-virtual {v1, v8}, Ll/nh4;->l(Ll/txl0;)Z

    .line 55
    .line 56
    .line 57
    move-result v9

    .line 58
    const/4 v10, 0x1

    .line 59
    if-eqz v9, :cond_0

    .line 60
    .line 61
    invoke-virtual {v8, v2, v5}, Ll/txl0;->g(FLl/mo0;)V

    .line 62
    .line 63
    .line 64
    move/from16 p2, v3

    .line 65
    .line 66
    move v7, v10

    .line 67
    goto/16 :goto_4

    .line 68
    .line 69
    :cond_0
    if-eqz v7, :cond_5

    .line 70
    .line 71
    invoke-virtual {v0}, Ll/ox2;->A()Ll/qn2;

    .line 72
    .line 73
    .line 74
    move-result-object v9

    .line 75
    invoke-virtual {v9}, Ll/qn2;->d()I

    .line 76
    .line 77
    .line 78
    move-result v9

    .line 79
    invoke-virtual {v0}, Ll/ox2;->A()Ll/qn2;

    .line 80
    .line 81
    .line 82
    move-result-object v11

    .line 83
    invoke-virtual {v11}, Ll/qn2;->e()F

    .line 84
    .line 85
    .line 86
    move-result v11

    .line 87
    invoke-virtual {v0}, Ll/ox2;->A()Ll/qn2;

    .line 88
    .line 89
    .line 90
    move-result-object v12

    .line 91
    invoke-virtual {v12}, Ll/qn2;->i()Z

    .line 92
    .line 93
    .line 94
    move-result v12

    .line 95
    iget v13, v5, Ll/mo0;->a:F

    .line 96
    .line 97
    iget v14, v5, Ll/mo0;->b:F

    .line 98
    .line 99
    sub-float/2addr v14, v13

    .line 100
    mul-float/2addr v14, v2

    .line 101
    add-float/2addr v13, v14

    .line 102
    iget v14, v5, Ll/mo0;->c:F

    .line 103
    .line 104
    iget v15, v5, Ll/mo0;->d:F

    .line 105
    .line 106
    sub-float/2addr v15, v14

    .line 107
    mul-float/2addr v15, v2

    .line 108
    add-float/2addr v14, v15

    .line 109
    mul-float/2addr v14, v14

    .line 110
    mul-float/2addr v13, v13

    .line 111
    add-float/2addr v14, v13

    .line 112
    float-to-double v13, v14

    .line 113
    invoke-static {v13, v14}, Ljava/lang/Math;->sqrt(D)D

    .line 114
    .line 115
    .line 116
    move-result-wide v13

    .line 117
    double-to-float v13, v13

    .line 118
    iget v14, v0, Ll/ox2;->m:F

    .line 119
    .line 120
    div-float/2addr v13, v14

    .line 121
    invoke-static {v13, v4}, Ljava/lang/Math;->max(FF)F

    .line 122
    .line 123
    .line 124
    move-result v13

    .line 125
    invoke-static {v3, v13}, Ljava/lang/Math;->min(FF)F

    .line 126
    .line 127
    .line 128
    move-result v13

    .line 129
    iget-object v14, v0, Ll/ox2;->d:Ll/vr2;

    .line 130
    .line 131
    invoke-virtual {v14}, Ll/vr2;->h()Z

    .line 132
    .line 133
    .line 134
    move-result v14

    .line 135
    if-eqz v14, :cond_2

    .line 136
    .line 137
    iget-object v14, v0, Ll/ox2;->d:Ll/vr2;

    .line 138
    .line 139
    invoke-virtual {v14}, Ll/vr2;->a()F

    .line 140
    .line 141
    .line 142
    move-result v14

    .line 143
    cmpg-float v14, v14, v3

    .line 144
    .line 145
    if-gez v14, :cond_2

    .line 146
    .line 147
    iget v14, v8, Ll/txl0;->e:I

    .line 148
    .line 149
    if-ne v14, v10, :cond_1

    .line 150
    .line 151
    iget-object v10, v0, Ll/ox2;->d:Ll/vr2;

    .line 152
    .line 153
    invoke-virtual {v10}, Ll/vr2;->b()F

    .line 154
    .line 155
    .line 156
    move-result v10

    .line 157
    mul-float/2addr v10, v13

    .line 158
    iget-object v14, v0, Ll/ox2;->d:Ll/vr2;

    .line 159
    .line 160
    invoke-virtual {v14}, Ll/vr2;->a()F

    .line 161
    .line 162
    .line 163
    move-result v14

    .line 164
    add-float/2addr v10, v14

    .line 165
    iget-object v14, v0, Ll/ox2;->d:Ll/vr2;

    .line 166
    .line 167
    invoke-virtual {v14}, Ll/vr2;->a()F

    .line 168
    .line 169
    .line 170
    move-result v14

    .line 171
    invoke-static {v14, v10}, Ljava/lang/Math;->max(FF)F

    .line 172
    .line 173
    .line 174
    move-result v10

    .line 175
    invoke-static {v3, v10}, Ljava/lang/Math;->min(FF)F

    .line 176
    .line 177
    .line 178
    move-result v10

    .line 179
    iget-object v14, v8, Ll/txl0;->a:Landroid/view/View;

    .line 180
    .line 181
    invoke-virtual {v14, v10}, Landroid/view/View;->setAlpha(F)V

    .line 182
    .line 183
    .line 184
    goto :goto_1

    .line 185
    :cond_1
    iget-object v10, v8, Ll/txl0;->a:Landroid/view/View;

    .line 186
    .line 187
    invoke-virtual {v10, v4}, Landroid/view/View;->setAlpha(F)V

    .line 188
    .line 189
    .line 190
    :cond_2
    :goto_1
    iget v10, v8, Ll/txl0;->e:I

    .line 191
    .line 192
    int-to-float v10, v10

    .line 193
    sub-float/2addr v10, v13

    .line 194
    const/high16 v13, 0x40000000    # 2.0f

    .line 195
    .line 196
    invoke-static {v10, v13}, Ljava/lang/Math;->min(FF)F

    .line 197
    .line 198
    .line 199
    move-result v10

    .line 200
    mul-float/2addr v11, v10

    .line 201
    sub-float v11, v3, v11

    .line 202
    .line 203
    mul-float v14, v11, v11

    .line 204
    .line 205
    mul-float/2addr v14, v11

    .line 206
    float-to-double v10, v10

    .line 207
    invoke-static {v10, v11}, Ljava/lang/Math;->sqrt(D)D

    .line 208
    .line 209
    .line 210
    move-result-wide v10

    .line 211
    invoke-static {v10, v11}, Ljava/lang/Math;->sqrt(D)D

    .line 212
    .line 213
    .line 214
    move-result-wide v10

    .line 215
    double-to-float v10, v10

    .line 216
    mul-float v11, v10, v10

    .line 217
    .line 218
    mul-float/2addr v11, v10

    .line 219
    move/from16 p2, v3

    .line 220
    .line 221
    float-to-double v3, v11

    .line 222
    float-to-double v10, v10

    .line 223
    invoke-static {v10, v11}, Ljava/lang/Math;->sqrt(D)D

    .line 224
    .line 225
    .line 226
    move-result-wide v10

    .line 227
    mul-double/2addr v3, v10

    .line 228
    double-to-float v3, v3

    .line 229
    int-to-float v4, v9

    .line 230
    mul-float/2addr v3, v4

    .line 231
    if-eqz v12, :cond_3

    .line 232
    .line 233
    iget-object v4, v8, Ll/txl0;->a:Landroid/view/View;

    .line 234
    .line 235
    invoke-virtual {v4}, Landroid/view/View;->getHeight()I

    .line 236
    .line 237
    .line 238
    move-result v4

    .line 239
    int-to-float v4, v4

    .line 240
    sub-float v9, p2, v14

    .line 241
    .line 242
    mul-float/2addr v4, v9

    .line 243
    div-float/2addr v4, v13

    .line 244
    goto :goto_2

    .line 245
    :cond_3
    const/4 v4, 0x0

    .line 246
    :goto_2
    add-float/2addr v3, v4

    .line 247
    iget-object v4, v8, Ll/txl0;->a:Landroid/view/View;

    .line 248
    .line 249
    invoke-virtual {v4, v14}, Landroid/view/View;->setScaleY(F)V

    .line 250
    .line 251
    .line 252
    iget-object v4, v8, Ll/txl0;->a:Landroid/view/View;

    .line 253
    .line 254
    invoke-virtual {v4, v14}, Landroid/view/View;->setScaleX(F)V

    .line 255
    .line 256
    .line 257
    invoke-virtual {v0}, Ll/ox2;->A()Ll/qn2;

    .line 258
    .line 259
    .line 260
    move-result-object v4

    .line 261
    invoke-virtual {v4}, Ll/qn2;->q()Z

    .line 262
    .line 263
    .line 264
    move-result v4

    .line 265
    if-eqz v4, :cond_4

    .line 266
    .line 267
    const/high16 v4, -0x40800000    # -1.0f

    .line 268
    .line 269
    goto :goto_3

    .line 270
    :cond_4
    move/from16 v4, p2

    .line 271
    .line 272
    :goto_3
    iget-object v8, v8, Ll/txl0;->a:Landroid/view/View;

    .line 273
    .line 274
    mul-float/2addr v4, v3

    .line 275
    invoke-virtual {v8, v4}, Landroid/view/View;->setTranslationY(F)V

    .line 276
    .line 277
    .line 278
    goto :goto_4

    .line 279
    :cond_5
    move/from16 p2, v3

    .line 280
    .line 281
    :goto_4
    move/from16 v3, p2

    .line 282
    .line 283
    const/4 v4, 0x0

    .line 284
    goto/16 :goto_0

    .line 285
    .line 286
    :cond_6
    return-void
.end method

.method public L(Ll/nh4;J)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v9, p1

    .line 4
    .line 5
    iget-wide v1, v9, Ll/nh4;->c:J

    .line 6
    .line 7
    sub-long v1, p2, v1

    .line 8
    .line 9
    long-to-float v1, v1

    .line 10
    iget-wide v2, v9, Ll/nh4;->d:J

    .line 11
    .line 12
    long-to-float v2, v2

    .line 13
    div-float/2addr v1, v2

    .line 14
    invoke-virtual {v9}, Ll/nh4;->f()Landroid/view/animation/Interpolator;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-interface {v2, v1}, Landroid/animation/TimeInterpolator;->getInterpolation(F)F

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    iget-object v2, v0, Ll/ox2;->e:Ll/nx2;

    .line 23
    .line 24
    iget-object v3, v9, Ll/nh4;->p:Ll/txl0;

    .line 25
    .line 26
    iget-object v3, v3, Ll/txl0;->a:Landroid/view/View;

    .line 27
    .line 28
    invoke-virtual {v2, v3}, Ll/nx2;->k(Landroid/view/View;)V

    .line 29
    .line 30
    .line 31
    const/4 v10, 0x0

    .line 32
    invoke-static {v10, v1}, Ljava/lang/Math;->max(FF)F

    .line 33
    .line 34
    .line 35
    move-result v11

    .line 36
    iget-object v12, v9, Ll/nh4;->f:Ll/mo0;

    .line 37
    .line 38
    iget-object v1, v0, Ll/ox2;->a:Ljava/util/List;

    .line 39
    .line 40
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 41
    .line 42
    .line 43
    move-result-object v13

    .line 44
    :cond_0
    :goto_0
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    if-eqz v1, :cond_7

    .line 49
    .line 50
    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    check-cast v1, Ll/txl0;

    .line 55
    .line 56
    invoke-virtual {v9, v1}, Ll/nh4;->l(Ll/txl0;)Z

    .line 57
    .line 58
    .line 59
    move-result v2

    .line 60
    if-eqz v2, :cond_0

    .line 61
    .line 62
    iget v2, v1, Ll/txl0;->e:I

    .line 63
    .line 64
    if-nez v2, :cond_1

    .line 65
    .line 66
    invoke-virtual {v1, v11, v12}, Ll/txl0;->g(FLl/mo0;)V

    .line 67
    .line 68
    .line 69
    iget-object v2, v1, Ll/txl0;->a:Landroid/view/View;

    .line 70
    .line 71
    move-object v3, v2

    .line 72
    invoke-virtual {v3}, Landroid/view/View;->getTranslationX()F

    .line 73
    .line 74
    .line 75
    move-result v2

    .line 76
    iget-object v1, v1, Ll/txl0;->a:Landroid/view/View;

    .line 77
    .line 78
    invoke-virtual {v1}, Landroid/view/View;->getTranslationY()F

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    sget-object v6, Lcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;->BACK_ANIM:Lcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;

    .line 83
    .line 84
    iget-boolean v7, v9, Ll/nh4;->q:Z

    .line 85
    .line 86
    const-string v8, "animBack:"

    .line 87
    .line 88
    const/4 v4, 0x0

    .line 89
    const/4 v5, 0x0

    .line 90
    move-object/from16 v16, v3

    .line 91
    .line 92
    move v3, v1

    .line 93
    move-object/from16 v1, v16

    .line 94
    .line 95
    invoke-virtual/range {v0 .. v8}, Ll/ox2;->O(Landroid/view/View;FFFFLcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;ZLjava/lang/String;)V

    .line 96
    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_1
    invoke-virtual {v0}, Ll/ox2;->A()Ll/qn2;

    .line 100
    .line 101
    .line 102
    move-result-object v2

    .line 103
    invoke-virtual {v2}, Ll/qn2;->d()I

    .line 104
    .line 105
    .line 106
    move-result v2

    .line 107
    invoke-virtual {v0}, Ll/ox2;->A()Ll/qn2;

    .line 108
    .line 109
    .line 110
    move-result-object v3

    .line 111
    invoke-virtual {v3}, Ll/qn2;->e()F

    .line 112
    .line 113
    .line 114
    move-result v3

    .line 115
    invoke-virtual {v0}, Ll/ox2;->A()Ll/qn2;

    .line 116
    .line 117
    .line 118
    move-result-object v4

    .line 119
    invoke-virtual {v4}, Ll/qn2;->i()Z

    .line 120
    .line 121
    .line 122
    move-result v4

    .line 123
    iget v5, v12, Ll/mo0;->a:F

    .line 124
    .line 125
    iget v6, v12, Ll/mo0;->b:F

    .line 126
    .line 127
    sub-float/2addr v6, v5

    .line 128
    mul-float/2addr v6, v11

    .line 129
    add-float/2addr v5, v6

    .line 130
    iget v6, v12, Ll/mo0;->c:F

    .line 131
    .line 132
    iget v7, v12, Ll/mo0;->d:F

    .line 133
    .line 134
    sub-float/2addr v7, v6

    .line 135
    mul-float/2addr v7, v11

    .line 136
    add-float/2addr v6, v7

    .line 137
    mul-float/2addr v6, v6

    .line 138
    mul-float/2addr v5, v5

    .line 139
    add-float/2addr v6, v5

    .line 140
    float-to-double v5, v6

    .line 141
    invoke-static {v5, v6}, Ljava/lang/Math;->sqrt(D)D

    .line 142
    .line 143
    .line 144
    move-result-wide v5

    .line 145
    double-to-float v5, v5

    .line 146
    iget v6, v0, Ll/ox2;->m:F

    .line 147
    .line 148
    div-float/2addr v5, v6

    .line 149
    invoke-static {v5, v10}, Ljava/lang/Math;->max(FF)F

    .line 150
    .line 151
    .line 152
    move-result v5

    .line 153
    const/high16 v6, 0x3f800000    # 1.0f

    .line 154
    .line 155
    invoke-static {v6, v5}, Ljava/lang/Math;->min(FF)F

    .line 156
    .line 157
    .line 158
    move-result v5

    .line 159
    iget-object v7, v0, Ll/ox2;->d:Ll/vr2;

    .line 160
    .line 161
    invoke-virtual {v7}, Ll/vr2;->h()Z

    .line 162
    .line 163
    .line 164
    move-result v7

    .line 165
    if-eqz v7, :cond_4

    .line 166
    .line 167
    iget-object v7, v0, Ll/ox2;->d:Ll/vr2;

    .line 168
    .line 169
    invoke-virtual {v7}, Ll/vr2;->a()F

    .line 170
    .line 171
    .line 172
    move-result v7

    .line 173
    cmpg-float v7, v7, v6

    .line 174
    .line 175
    if-gez v7, :cond_4

    .line 176
    .line 177
    iget v7, v1, Ll/txl0;->e:I

    .line 178
    .line 179
    const/4 v8, 0x1

    .line 180
    if-ne v7, v8, :cond_2

    .line 181
    .line 182
    iget-object v7, v0, Ll/ox2;->d:Ll/vr2;

    .line 183
    .line 184
    invoke-virtual {v7}, Ll/vr2;->b()F

    .line 185
    .line 186
    .line 187
    move-result v7

    .line 188
    mul-float/2addr v7, v5

    .line 189
    iget-object v8, v0, Ll/ox2;->d:Ll/vr2;

    .line 190
    .line 191
    invoke-virtual {v8}, Ll/vr2;->a()F

    .line 192
    .line 193
    .line 194
    move-result v8

    .line 195
    add-float/2addr v7, v8

    .line 196
    iget-object v8, v0, Ll/ox2;->d:Ll/vr2;

    .line 197
    .line 198
    invoke-virtual {v8}, Ll/vr2;->a()F

    .line 199
    .line 200
    .line 201
    move-result v8

    .line 202
    invoke-static {v8, v7}, Ljava/lang/Math;->max(FF)F

    .line 203
    .line 204
    .line 205
    move-result v7

    .line 206
    invoke-static {v6, v7}, Ljava/lang/Math;->min(FF)F

    .line 207
    .line 208
    .line 209
    move-result v7

    .line 210
    iget-object v8, v1, Ll/txl0;->a:Landroid/view/View;

    .line 211
    .line 212
    invoke-virtual {v8, v7}, Landroid/view/View;->setAlpha(F)V

    .line 213
    .line 214
    .line 215
    goto :goto_1

    .line 216
    :cond_2
    const/4 v8, 0x2

    .line 217
    if-ne v7, v8, :cond_3

    .line 218
    .line 219
    iget-object v7, v0, Ll/ox2;->d:Ll/vr2;

    .line 220
    .line 221
    invoke-virtual {v7}, Ll/vr2;->a()F

    .line 222
    .line 223
    .line 224
    move-result v7

    .line 225
    mul-float/2addr v7, v5

    .line 226
    invoke-static {v10, v7}, Ljava/lang/Math;->max(FF)F

    .line 227
    .line 228
    .line 229
    move-result v7

    .line 230
    invoke-static {v6, v7}, Ljava/lang/Math;->min(FF)F

    .line 231
    .line 232
    .line 233
    move-result v7

    .line 234
    iget-object v8, v1, Ll/txl0;->a:Landroid/view/View;

    .line 235
    .line 236
    invoke-virtual {v8, v7}, Landroid/view/View;->setAlpha(F)V

    .line 237
    .line 238
    .line 239
    goto :goto_1

    .line 240
    :cond_3
    iget-object v7, v1, Ll/txl0;->a:Landroid/view/View;

    .line 241
    .line 242
    invoke-virtual {v7, v10}, Landroid/view/View;->setAlpha(F)V

    .line 243
    .line 244
    .line 245
    :cond_4
    :goto_1
    iget v7, v1, Ll/txl0;->e:I

    .line 246
    .line 247
    int-to-float v7, v7

    .line 248
    sub-float/2addr v7, v5

    .line 249
    const/high16 v5, 0x40000000    # 2.0f

    .line 250
    .line 251
    invoke-static {v7, v5}, Ljava/lang/Math;->min(FF)F

    .line 252
    .line 253
    .line 254
    move-result v7

    .line 255
    mul-float/2addr v3, v7

    .line 256
    sub-float v3, v6, v3

    .line 257
    .line 258
    mul-float v8, v3, v3

    .line 259
    .line 260
    mul-float/2addr v8, v3

    .line 261
    float-to-double v14, v7

    .line 262
    invoke-static {v14, v15}, Ljava/lang/Math;->sqrt(D)D

    .line 263
    .line 264
    .line 265
    move-result-wide v14

    .line 266
    invoke-static {v14, v15}, Ljava/lang/Math;->sqrt(D)D

    .line 267
    .line 268
    .line 269
    move-result-wide v14

    .line 270
    double-to-float v3, v14

    .line 271
    mul-float v7, v3, v3

    .line 272
    .line 273
    mul-float/2addr v7, v3

    .line 274
    float-to-double v14, v7

    .line 275
    move/from16 p3, v5

    .line 276
    .line 277
    move/from16 p2, v6

    .line 278
    .line 279
    float-to-double v5, v3

    .line 280
    invoke-static {v5, v6}, Ljava/lang/Math;->sqrt(D)D

    .line 281
    .line 282
    .line 283
    move-result-wide v5

    .line 284
    mul-double/2addr v14, v5

    .line 285
    double-to-float v3, v14

    .line 286
    int-to-float v2, v2

    .line 287
    mul-float/2addr v3, v2

    .line 288
    if-eqz v4, :cond_5

    .line 289
    .line 290
    iget-object v2, v1, Ll/txl0;->a:Landroid/view/View;

    .line 291
    .line 292
    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    .line 293
    .line 294
    .line 295
    move-result v2

    .line 296
    int-to-float v2, v2

    .line 297
    sub-float v6, p2, v8

    .line 298
    .line 299
    mul-float/2addr v2, v6

    .line 300
    div-float v2, v2, p3

    .line 301
    .line 302
    goto :goto_2

    .line 303
    :cond_5
    move v2, v10

    .line 304
    :goto_2
    add-float/2addr v3, v2

    .line 305
    iget-object v2, v1, Ll/txl0;->a:Landroid/view/View;

    .line 306
    .line 307
    invoke-virtual {v2, v8}, Landroid/view/View;->setScaleY(F)V

    .line 308
    .line 309
    .line 310
    iget-object v2, v1, Ll/txl0;->a:Landroid/view/View;

    .line 311
    .line 312
    invoke-virtual {v2, v8}, Landroid/view/View;->setScaleX(F)V

    .line 313
    .line 314
    .line 315
    invoke-virtual {v0}, Ll/ox2;->A()Ll/qn2;

    .line 316
    .line 317
    .line 318
    move-result-object v2

    .line 319
    invoke-virtual {v2}, Ll/qn2;->q()Z

    .line 320
    .line 321
    .line 322
    move-result v2

    .line 323
    if-eqz v2, :cond_6

    .line 324
    .line 325
    const/high16 v6, -0x40800000    # -1.0f

    .line 326
    .line 327
    goto :goto_3

    .line 328
    :cond_6
    move/from16 v6, p2

    .line 329
    .line 330
    :goto_3
    iget-object v1, v1, Ll/txl0;->a:Landroid/view/View;

    .line 331
    .line 332
    mul-float/2addr v6, v3

    .line 333
    invoke-virtual {v1, v6}, Landroid/view/View;->setTranslationY(F)V

    .line 334
    .line 335
    .line 336
    goto/16 :goto_0

    .line 337
    .line 338
    :cond_7
    return-void
.end method

.method public M(Ll/nh4;J)V
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v9, p1

    .line 4
    .line 5
    move-wide/from16 v1, p2

    .line 6
    .line 7
    iget-wide v3, v9, Ll/nh4;->c:J

    .line 8
    .line 9
    sub-long v3, v1, v3

    .line 10
    .line 11
    long-to-float v3, v3

    .line 12
    iget-wide v4, v9, Ll/nh4;->d:J

    .line 13
    .line 14
    long-to-float v4, v4

    .line 15
    div-float/2addr v3, v4

    .line 16
    invoke-virtual {v9}, Ll/nh4;->f()Landroid/view/animation/Interpolator;

    .line 17
    .line 18
    .line 19
    move-result-object v4

    .line 20
    invoke-interface {v4, v3}, Landroid/animation/TimeInterpolator;->getInterpolation(F)F

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    const/high16 v10, 0x3f800000    # 1.0f

    .line 25
    .line 26
    invoke-static {v10, v3}, Ljava/lang/Math;->min(FF)F

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    const/4 v11, 0x0

    .line 31
    invoke-static {v11, v3}, Ljava/lang/Math;->max(FF)F

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    iget-object v12, v9, Ll/nh4;->f:Ll/mo0;

    .line 36
    .line 37
    iget-object v4, v0, Ll/ox2;->d:Ll/vr2;

    .line 38
    .line 39
    invoke-virtual {v4}, Ll/vr2;->j()Z

    .line 40
    .line 41
    .line 42
    move-result v4

    .line 43
    if-eqz v4, :cond_2

    .line 44
    .line 45
    iget-object v4, v0, Ll/ox2;->d:Ll/vr2;

    .line 46
    .line 47
    invoke-virtual {v4}, Ll/vr2;->g()J

    .line 48
    .line 49
    .line 50
    move-result-wide v4

    .line 51
    iget-object v6, v0, Ll/ox2;->d:Ll/vr2;

    .line 52
    .line 53
    invoke-virtual {v6}, Ll/vr2;->i()Z

    .line 54
    .line 55
    .line 56
    move-result v6

    .line 57
    if-eqz v6, :cond_0

    .line 58
    .line 59
    iget-object v4, v0, Ll/ox2;->d:Ll/vr2;

    .line 60
    .line 61
    invoke-virtual {v4}, Ll/vr2;->g()J

    .line 62
    .line 63
    .line 64
    move-result-wide v4

    .line 65
    long-to-float v4, v4

    .line 66
    iget v5, v12, Ll/mo0;->l:F

    .line 67
    .line 68
    iget v6, v12, Ll/mo0;->k:F

    .line 69
    .line 70
    sub-float/2addr v5, v6

    .line 71
    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    .line 72
    .line 73
    .line 74
    move-result v5

    .line 75
    mul-float/2addr v4, v5

    .line 76
    float-to-long v4, v4

    .line 77
    :cond_0
    const-wide/16 v6, 0x0

    .line 78
    .line 79
    cmp-long v6, v4, v6

    .line 80
    .line 81
    if-gtz v6, :cond_1

    .line 82
    .line 83
    const-wide/16 v4, 0x1

    .line 84
    .line 85
    :cond_1
    iget-wide v6, v9, Ll/nh4;->c:J

    .line 86
    .line 87
    sub-long v6, v1, v6

    .line 88
    .line 89
    long-to-float v6, v6

    .line 90
    iget-wide v7, v9, Ll/nh4;->d:J

    .line 91
    .line 92
    invoke-static {v7, v8, v4, v5}, Ljava/lang/Math;->min(JJ)J

    .line 93
    .line 94
    .line 95
    move-result-wide v4

    .line 96
    long-to-float v4, v4

    .line 97
    div-float/2addr v6, v4

    .line 98
    invoke-static {v10, v6}, Ljava/lang/Math;->min(FF)F

    .line 99
    .line 100
    .line 101
    move-result v4

    .line 102
    invoke-static {v11, v4}, Ljava/lang/Math;->max(FF)F

    .line 103
    .line 104
    .line 105
    move-result v4

    .line 106
    iget-boolean v5, v9, Ll/nh4;->i:Z

    .line 107
    .line 108
    if-eqz v5, :cond_3

    .line 109
    .line 110
    iget-object v5, v9, Ll/nh4;->g:Lcom/p1/mobile/putong/core/newui/home/opt/CardSwipeOutState;

    .line 111
    .line 112
    sget-object v6, Lcom/p1/mobile/putong/core/newui/home/opt/CardSwipeOutState;->INVALID:Lcom/p1/mobile/putong/core/newui/home/opt/CardSwipeOutState;

    .line 113
    .line 114
    if-ne v5, v6, :cond_3

    .line 115
    .line 116
    iget-wide v3, v9, Ll/nh4;->c:J

    .line 117
    .line 118
    sub-long v5, v1, v3

    .line 119
    .line 120
    add-long/2addr v3, v5

    .line 121
    iput-wide v3, v9, Ll/nh4;->c:J

    .line 122
    .line 123
    move v3, v11

    .line 124
    move v4, v3

    .line 125
    goto :goto_0

    .line 126
    :cond_2
    move v4, v10

    .line 127
    :cond_3
    :goto_0
    invoke-virtual {v12, v3}, Ll/mo0;->a(F)F

    .line 128
    .line 129
    .line 130
    move-result v13

    .line 131
    iget-object v5, v9, Ll/nh4;->g:Lcom/p1/mobile/putong/core/newui/home/opt/CardSwipeOutState;

    .line 132
    .line 133
    sget-object v6, Lcom/p1/mobile/putong/core/newui/home/opt/CardSwipeOutState;->INVALID:Lcom/p1/mobile/putong/core/newui/home/opt/CardSwipeOutState;

    .line 134
    .line 135
    const/4 v14, 0x2

    .line 136
    const/4 v15, 0x1

    .line 137
    if-ne v5, v6, :cond_e

    .line 138
    .line 139
    iget v5, v0, Ll/ox2;->o:F

    .line 140
    .line 141
    cmpl-float v5, v13, v5

    .line 142
    .line 143
    if-gtz v5, :cond_4

    .line 144
    .line 145
    iget-boolean v5, v9, Ll/nh4;->i:Z

    .line 146
    .line 147
    if-eqz v5, :cond_e

    .line 148
    .line 149
    :cond_4
    iget-object v5, v0, Ll/ox2;->l:Ll/dn4;

    .line 150
    .line 151
    iget-object v6, v9, Ll/nh4;->p:Ll/txl0;

    .line 152
    .line 153
    invoke-virtual {v9}, Ll/nh4;->j()Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;

    .line 154
    .line 155
    .line 156
    move-result-object v7

    .line 157
    iget-boolean v8, v9, Ll/nh4;->i:Z

    .line 158
    .line 159
    invoke-interface {v5, v6, v7, v8}, Ll/dn4;->a(Ll/txl0;Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;Z)Lcom/p1/mobile/putong/core/newui/home/opt/CardSwipeOutState;

    .line 160
    .line 161
    .line 162
    move-result-object v5

    .line 163
    new-instance v6, Ljava/lang/StringBuilder;

    .line 164
    .line 165
    const-string v7, "swipe anim out: "

    .line 166
    .line 167
    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 168
    .line 169
    .line 170
    iget v7, v9, Ll/nh4;->o:I

    .line 171
    .line 172
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 173
    .line 174
    .line 175
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object v6

    .line 179
    invoke-virtual {v0, v6}, Ll/ox2;->Y(Ljava/lang/String;)V

    .line 180
    .line 181
    .line 182
    sget-boolean v6, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->d:Z

    .line 183
    .line 184
    if-eqz v6, :cond_5

    .line 185
    .line 186
    invoke-virtual {v5}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 187
    .line 188
    .line 189
    iget-object v6, v9, Ll/nh4;->p:Ll/txl0;

    .line 190
    .line 191
    const/4 v7, 0x0

    .line 192
    invoke-virtual {v6, v7}, Ll/txl0;->e(Z)Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    :cond_5
    sget-object v6, Ll/mx2$a;->a:[I

    .line 196
    .line 197
    invoke-virtual {v5}, Ljava/lang/Enum;->ordinal()I

    .line 198
    .line 199
    .line 200
    move-result v7

    .line 201
    aget v6, v6, v7

    .line 202
    .line 203
    if-eq v6, v15, :cond_c

    .line 204
    .line 205
    const/4 v7, 0x3

    .line 206
    if-eq v6, v14, :cond_7

    .line 207
    .line 208
    if-eq v6, v7, :cond_6

    .line 209
    .line 210
    goto :goto_1

    .line 211
    :cond_6
    sget-object v6, Lcom/p1/mobile/putong/core/newui/home/opt/CardAnimType;->ANIM_INVALID:Lcom/p1/mobile/putong/core/newui/home/opt/CardAnimType;

    .line 212
    .line 213
    iput-object v6, v9, Ll/nh4;->b:Lcom/p1/mobile/putong/core/newui/home/opt/CardAnimType;

    .line 214
    .line 215
    iget-object v6, v9, Ll/nh4;->p:Ll/txl0;

    .line 216
    .line 217
    sget-object v8, Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;->RENDING:Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;

    .line 218
    .line 219
    iput-object v8, v6, Ll/txl0;->j:Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;

    .line 220
    .line 221
    goto :goto_1

    .line 222
    :cond_7
    iput-object v5, v9, Ll/nh4;->g:Lcom/p1/mobile/putong/core/newui/home/opt/CardSwipeOutState;

    .line 223
    .line 224
    iget-object v6, v9, Ll/nh4;->p:Ll/txl0;

    .line 225
    .line 226
    sget-object v8, Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;->ANIM_OUT:Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;

    .line 227
    .line 228
    iput-object v8, v6, Ll/txl0;->j:Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;

    .line 229
    .line 230
    :goto_1
    new-instance v6, Ljava/lang/StringBuilder;

    .line 231
    .line 232
    const-string v8, "swipeCheckDone:"

    .line 233
    .line 234
    invoke-direct {v6, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 235
    .line 236
    .line 237
    invoke-virtual {v5}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 238
    .line 239
    .line 240
    move-result-object v8

    .line 241
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 242
    .line 243
    .line 244
    const-string v8, ", detail"

    .line 245
    .line 246
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 247
    .line 248
    .line 249
    iget-object v8, v9, Ll/nh4;->p:Ll/txl0;

    .line 250
    .line 251
    invoke-virtual {v8}, Ll/txl0;->d()Ljava/lang/String;

    .line 252
    .line 253
    .line 254
    move-result-object v8

    .line 255
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 256
    .line 257
    .line 258
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 259
    .line 260
    .line 261
    move-result-object v6

    .line 262
    invoke-virtual {v0, v6}, Ll/ox2;->X(Ljava/lang/String;)V

    .line 263
    .line 264
    .line 265
    iget-object v6, v9, Ll/nh4;->p:Ll/txl0;

    .line 266
    .line 267
    iget-object v6, v6, Ll/txl0;->a:Landroid/view/View;

    .line 268
    .line 269
    instance-of v6, v6, Ll/pn4;

    .line 270
    .line 271
    if-eqz v6, :cond_b

    .line 272
    .line 273
    sget-object v6, Lcom/p1/mobile/putong/core/data/SwipeDirection;->LEFT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 274
    .line 275
    sget-object v8, Ll/mx2$a;->b:[I

    .line 276
    .line 277
    invoke-virtual {v9}, Ll/nh4;->j()Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;

    .line 278
    .line 279
    .line 280
    move-result-object v16

    .line 281
    invoke-virtual/range {v16 .. v16}, Ljava/lang/Enum;->ordinal()I

    .line 282
    .line 283
    .line 284
    move-result v16

    .line 285
    aget v8, v8, v16

    .line 286
    .line 287
    if-eq v8, v15, :cond_9

    .line 288
    .line 289
    if-eq v8, v14, :cond_a

    .line 290
    .line 291
    if-eq v8, v7, :cond_8

    .line 292
    .line 293
    goto :goto_2

    .line 294
    :cond_8
    sget-object v6, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 295
    .line 296
    goto :goto_2

    .line 297
    :cond_9
    sget-object v6, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 298
    .line 299
    :cond_a
    :goto_2
    iget-object v7, v9, Ll/nh4;->p:Ll/txl0;

    .line 300
    .line 301
    iget-object v7, v7, Ll/txl0;->a:Landroid/view/View;

    .line 302
    .line 303
    check-cast v7, Ll/pn4;

    .line 304
    .line 305
    iget-boolean v8, v9, Ll/nh4;->i:Z

    .line 306
    .line 307
    invoke-interface {v7, v6, v5, v8}, Ll/pn4;->x(Lcom/p1/mobile/putong/core/data/SwipeDirection;Lcom/p1/mobile/putong/core/newui/home/opt/CardSwipeOutState;Z)V

    .line 308
    .line 309
    .line 310
    iget-object v5, v9, Ll/nh4;->p:Ll/txl0;

    .line 311
    .line 312
    iget-object v5, v5, Ll/txl0;->a:Landroid/view/View;

    .line 313
    .line 314
    move-object v6, v5

    .line 315
    check-cast v6, Ll/pn4;

    .line 316
    .line 317
    sget-object v7, Lcom/p1/mobile/putong/core/newui/home/opt/SwipeState;->START_FLING_OUT:Lcom/p1/mobile/putong/core/newui/home/opt/SwipeState;

    .line 318
    .line 319
    iget-boolean v8, v9, Ll/nh4;->i:Z

    .line 320
    .line 321
    invoke-interface {v6, v5, v7, v8}, Ll/pn4;->D0(Landroid/view/View;Lcom/p1/mobile/putong/core/newui/home/opt/SwipeState;Z)V

    .line 322
    .line 323
    .line 324
    :cond_b
    iget-object v5, v0, Ll/ox2;->d:Ll/vr2;

    .line 325
    .line 326
    invoke-virtual {v5}, Ll/vr2;->j()Z

    .line 327
    .line 328
    .line 329
    move-result v5

    .line 330
    if-eqz v5, :cond_e

    .line 331
    .line 332
    iget-boolean v5, v9, Ll/nh4;->i:Z

    .line 333
    .line 334
    if-eqz v5, :cond_e

    .line 335
    .line 336
    iget-wide v3, v9, Ll/nh4;->c:J

    .line 337
    .line 338
    sub-long/2addr v1, v3

    .line 339
    add-long/2addr v3, v1

    .line 340
    iput-wide v3, v9, Ll/nh4;->c:J

    .line 341
    .line 342
    move v1, v11

    .line 343
    move/from16 v16, v1

    .line 344
    .line 345
    goto :goto_3

    .line 346
    :cond_c
    iget-boolean v3, v9, Ll/nh4;->i:Z

    .line 347
    .line 348
    if-eqz v3, :cond_d

    .line 349
    .line 350
    iget-object v0, v0, Ll/ox2;->e:Ll/nx2;

    .line 351
    .line 352
    iget-object v3, v9, Ll/nh4;->p:Ll/txl0;

    .line 353
    .line 354
    iget-object v3, v3, Ll/txl0;->a:Landroid/view/View;

    .line 355
    .line 356
    invoke-virtual {v0, v3}, Ll/nx2;->k(Landroid/view/View;)V

    .line 357
    .line 358
    .line 359
    :cond_d
    iput-object v5, v9, Ll/nh4;->g:Lcom/p1/mobile/putong/core/newui/home/opt/CardSwipeOutState;

    .line 360
    .line 361
    iget-object v0, v9, Ll/nh4;->f:Ll/mo0;

    .line 362
    .line 363
    iget-object v3, v9, Ll/nh4;->p:Ll/txl0;

    .line 364
    .line 365
    iget-object v3, v3, Ll/txl0;->a:Landroid/view/View;

    .line 366
    .line 367
    invoke-virtual {v0, v3}, Ll/mo0;->e(Landroid/view/View;)V

    .line 368
    .line 369
    .line 370
    iget-object v0, v9, Ll/nh4;->f:Ll/mo0;

    .line 371
    .line 372
    iput v4, v0, Ll/mo0;->k:F

    .line 373
    .line 374
    invoke-virtual {v0}, Ll/mo0;->b()V

    .line 375
    .line 376
    .line 377
    iget-wide v3, v9, Ll/nh4;->c:J

    .line 378
    .line 379
    sub-long v3, v1, v3

    .line 380
    .line 381
    iput-wide v1, v9, Ll/nh4;->c:J

    .line 382
    .line 383
    const-wide/16 v0, 0xc8

    .line 384
    .line 385
    invoke-static {v0, v1, v3, v4}, Ljava/lang/Math;->max(JJ)J

    .line 386
    .line 387
    .line 388
    move-result-wide v0

    .line 389
    iput-wide v0, v9, Ll/nh4;->d:J

    .line 390
    .line 391
    invoke-virtual {v9}, Ll/nh4;->c()V

    .line 392
    .line 393
    .line 394
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/opt/CardAnimType;->ANIM_BACK:Lcom/p1/mobile/putong/core/newui/home/opt/CardAnimType;

    .line 395
    .line 396
    iput-object v0, v9, Ll/nh4;->b:Lcom/p1/mobile/putong/core/newui/home/opt/CardAnimType;

    .line 397
    .line 398
    sget-object v0, Ll/vo0;->O:Landroid/view/animation/Interpolator;

    .line 399
    .line 400
    iput-object v0, v9, Ll/nh4;->a:Landroid/view/animation/Interpolator;

    .line 401
    .line 402
    iget-object v0, v9, Ll/nh4;->p:Ll/txl0;

    .line 403
    .line 404
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;->RENDING:Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;

    .line 405
    .line 406
    iput-object v1, v0, Ll/txl0;->j:Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;

    .line 407
    .line 408
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->c:Ljava/lang/String;

    .line 409
    .line 410
    return-void

    .line 411
    :cond_e
    move v1, v3

    .line 412
    move/from16 v16, v4

    .line 413
    .line 414
    :goto_3
    iget-object v2, v0, Ll/ox2;->a:Ljava/util/List;

    .line 415
    .line 416
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 417
    .line 418
    .line 419
    move-result-object v17

    .line 420
    move v2, v15

    .line 421
    :goto_4
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->hasNext()Z

    .line 422
    .line 423
    .line 424
    move-result v3

    .line 425
    if-eqz v3, :cond_1e

    .line 426
    .line 427
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 428
    .line 429
    .line 430
    move-result-object v3

    .line 431
    check-cast v3, Ll/txl0;

    .line 432
    .line 433
    invoke-virtual {v9, v3}, Ll/nh4;->l(Ll/txl0;)Z

    .line 434
    .line 435
    .line 436
    move-result v4

    .line 437
    if-eqz v4, :cond_1d

    .line 438
    .line 439
    iget v4, v3, Ll/txl0;->k:I

    .line 440
    .line 441
    invoke-virtual {v9, v4}, Ll/nh4;->m(I)Z

    .line 442
    .line 443
    .line 444
    move-result v4

    .line 445
    if-eqz v4, :cond_12

    .line 446
    .line 447
    iget-object v4, v3, Ll/txl0;->a:Landroid/view/View;

    .line 448
    .line 449
    invoke-virtual {v4}, Ljava/lang/Object;->hashCode()I

    .line 450
    .line 451
    .line 452
    invoke-virtual {v3, v1, v12}, Ll/txl0;->g(FLl/mo0;)V

    .line 453
    .line 454
    .line 455
    iget-boolean v4, v9, Ll/nh4;->j:Z

    .line 456
    .line 457
    move v5, v1

    .line 458
    iget-object v1, v3, Ll/txl0;->a:Landroid/view/View;

    .line 459
    .line 460
    if-nez v4, :cond_10

    .line 461
    .line 462
    move v4, v2

    .line 463
    invoke-virtual {v1}, Landroid/view/View;->getTranslationX()F

    .line 464
    .line 465
    .line 466
    move-result v2

    .line 467
    iget-object v3, v3, Ll/txl0;->a:Landroid/view/View;

    .line 468
    .line 469
    invoke-virtual {v3}, Landroid/view/View;->getTranslationY()F

    .line 470
    .line 471
    .line 472
    move-result v3

    .line 473
    sget-object v6, Lcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;->ANIM:Lcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;

    .line 474
    .line 475
    iget-boolean v7, v9, Ll/nh4;->q:Z

    .line 476
    .line 477
    iget-boolean v8, v9, Ll/nh4;->i:Z

    .line 478
    .line 479
    if-eqz v8, :cond_f

    .line 480
    .line 481
    const-string v8, "auto out: auto"

    .line 482
    .line 483
    :goto_5
    move/from16 v18, v4

    .line 484
    .line 485
    goto :goto_6

    .line 486
    :cond_f
    const-string v8, "animOut: no auto"

    .line 487
    .line 488
    goto :goto_5

    .line 489
    :goto_6
    const/4 v4, 0x0

    .line 490
    move/from16 v19, v5

    .line 491
    .line 492
    const/4 v5, 0x0

    .line 493
    move/from16 v14, v18

    .line 494
    .line 495
    invoke-virtual/range {v0 .. v8}, Ll/ox2;->O(Landroid/view/View;FFFFLcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;ZLjava/lang/String;)V

    .line 496
    .line 497
    .line 498
    move-object/from16 v0, p0

    .line 499
    .line 500
    goto :goto_7

    .line 501
    :cond_10
    move v14, v2

    .line 502
    move/from16 v19, v5

    .line 503
    .line 504
    invoke-virtual {v1}, Landroid/view/View;->getTranslationX()F

    .line 505
    .line 506
    .line 507
    move-result v1

    .line 508
    iget-object v0, v3, Ll/txl0;->a:Landroid/view/View;

    .line 509
    .line 510
    invoke-virtual {v0}, Landroid/view/View;->getTranslationY()F

    .line 511
    .line 512
    .line 513
    move-result v2

    .line 514
    sget-object v5, Lcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;->ANIM:Lcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;

    .line 515
    .line 516
    iget-boolean v6, v9, Ll/nh4;->q:Z

    .line 517
    .line 518
    iget v7, v9, Ll/nh4;->e:I

    .line 519
    .line 520
    const-string v8, " by anim finish"

    .line 521
    .line 522
    move-object v0, v3

    .line 523
    const/4 v3, 0x0

    .line 524
    const/4 v4, 0x0

    .line 525
    move-object v15, v0

    .line 526
    move-object/from16 v0, p0

    .line 527
    .line 528
    invoke-virtual/range {v0 .. v8}, Ll/ox2;->k(FFFFLcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;ZILjava/lang/String;)V

    .line 529
    .line 530
    .line 531
    iget-object v1, v15, Ll/txl0;->a:Landroid/view/View;

    .line 532
    .line 533
    invoke-virtual {v1}, Landroid/view/View;->getTranslationX()F

    .line 534
    .line 535
    .line 536
    move-result v2

    .line 537
    iget-object v0, v15, Ll/txl0;->a:Landroid/view/View;

    .line 538
    .line 539
    invoke-virtual {v0}, Landroid/view/View;->getTranslationY()F

    .line 540
    .line 541
    .line 542
    move-result v3

    .line 543
    move-object v6, v5

    .line 544
    const/4 v5, 0x0

    .line 545
    iget-boolean v7, v9, Ll/nh4;->q:Z

    .line 546
    .line 547
    move-object/from16 v0, p0

    .line 548
    .line 549
    invoke-virtual/range {v0 .. v7}, Ll/ox2;->l(Landroid/view/View;FFFFLcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;Z)V

    .line 550
    .line 551
    .line 552
    :cond_11
    :goto_7
    move v6, v10

    .line 553
    move v2, v14

    .line 554
    goto/16 :goto_c

    .line 555
    .line 556
    :cond_12
    move/from16 v19, v1

    .line 557
    .line 558
    move v14, v2

    .line 559
    move-object v15, v3

    .line 560
    iget v1, v15, Ll/txl0;->e:I

    .line 561
    .line 562
    if-gez v1, :cond_13

    .line 563
    .line 564
    move v2, v14

    .line 565
    move/from16 v1, v19

    .line 566
    .line 567
    :goto_8
    const/4 v14, 0x2

    .line 568
    const/4 v15, 0x1

    .line 569
    goto/16 :goto_4

    .line 570
    .line 571
    :cond_13
    iget-boolean v1, v9, Ll/nh4;->k:Z

    .line 572
    .line 573
    if-nez v1, :cond_11

    .line 574
    .line 575
    invoke-virtual {v0}, Ll/ox2;->A()Ll/qn2;

    .line 576
    .line 577
    .line 578
    move-result-object v1

    .line 579
    invoke-virtual {v1}, Ll/qn2;->d()I

    .line 580
    .line 581
    .line 582
    move-result v1

    .line 583
    invoke-virtual {v0}, Ll/ox2;->A()Ll/qn2;

    .line 584
    .line 585
    .line 586
    move-result-object v2

    .line 587
    invoke-virtual {v2}, Ll/qn2;->e()F

    .line 588
    .line 589
    .line 590
    move-result v2

    .line 591
    invoke-virtual {v0}, Ll/ox2;->A()Ll/qn2;

    .line 592
    .line 593
    .line 594
    move-result-object v3

    .line 595
    invoke-virtual {v3}, Ll/qn2;->i()Z

    .line 596
    .line 597
    .line 598
    move-result v3

    .line 599
    iget v4, v12, Ll/mo0;->a:F

    .line 600
    .line 601
    iget v5, v12, Ll/mo0;->b:F

    .line 602
    .line 603
    sub-float/2addr v5, v4

    .line 604
    mul-float v5, v5, v19

    .line 605
    .line 606
    add-float/2addr v4, v5

    .line 607
    iget v5, v12, Ll/mo0;->c:F

    .line 608
    .line 609
    iget v6, v12, Ll/mo0;->d:F

    .line 610
    .line 611
    sub-float/2addr v6, v5

    .line 612
    mul-float v6, v6, v19

    .line 613
    .line 614
    add-float/2addr v5, v6

    .line 615
    mul-float/2addr v5, v5

    .line 616
    mul-float/2addr v4, v4

    .line 617
    add-float/2addr v5, v4

    .line 618
    float-to-double v4, v5

    .line 619
    invoke-static {v4, v5}, Ljava/lang/Math;->sqrt(D)D

    .line 620
    .line 621
    .line 622
    move-result-wide v4

    .line 623
    double-to-float v4, v4

    .line 624
    iget v5, v0, Ll/ox2;->m:F

    .line 625
    .line 626
    div-float/2addr v4, v5

    .line 627
    iget-object v5, v0, Ll/ox2;->d:Ll/vr2;

    .line 628
    .line 629
    invoke-virtual {v5}, Ll/vr2;->j()Z

    .line 630
    .line 631
    .line 632
    move-result v5

    .line 633
    if-eqz v5, :cond_14

    .line 634
    .line 635
    iget v4, v12, Ll/mo0;->k:F

    .line 636
    .line 637
    iget v5, v12, Ll/mo0;->l:F

    .line 638
    .line 639
    sub-float/2addr v5, v4

    .line 640
    mul-float v5, v5, v16

    .line 641
    .line 642
    add-float/2addr v4, v5

    .line 643
    :cond_14
    invoke-static {v4, v11}, Ljava/lang/Math;->max(FF)F

    .line 644
    .line 645
    .line 646
    move-result v4

    .line 647
    invoke-static {v10, v4}, Ljava/lang/Math;->min(FF)F

    .line 648
    .line 649
    .line 650
    move-result v4

    .line 651
    iget-object v5, v0, Ll/ox2;->d:Ll/vr2;

    .line 652
    .line 653
    invoke-virtual {v5}, Ll/vr2;->h()Z

    .line 654
    .line 655
    .line 656
    move-result v5

    .line 657
    if-eqz v5, :cond_15

    .line 658
    .line 659
    iget-object v5, v0, Ll/ox2;->d:Ll/vr2;

    .line 660
    .line 661
    invoke-virtual {v5}, Ll/vr2;->a()F

    .line 662
    .line 663
    .line 664
    move-result v5

    .line 665
    cmpg-float v5, v5, v10

    .line 666
    .line 667
    if-gez v5, :cond_15

    .line 668
    .line 669
    const/4 v5, 0x1

    .line 670
    if-ne v14, v5, :cond_16

    .line 671
    .line 672
    iget-object v5, v0, Ll/ox2;->d:Ll/vr2;

    .line 673
    .line 674
    invoke-virtual {v5}, Ll/vr2;->b()F

    .line 675
    .line 676
    .line 677
    move-result v5

    .line 678
    mul-float/2addr v5, v4

    .line 679
    iget-object v6, v0, Ll/ox2;->d:Ll/vr2;

    .line 680
    .line 681
    invoke-virtual {v6}, Ll/vr2;->a()F

    .line 682
    .line 683
    .line 684
    move-result v6

    .line 685
    add-float/2addr v5, v6

    .line 686
    invoke-static {v11, v5}, Ljava/lang/Math;->max(FF)F

    .line 687
    .line 688
    .line 689
    move-result v5

    .line 690
    invoke-static {v10, v5}, Ljava/lang/Math;->min(FF)F

    .line 691
    .line 692
    .line 693
    move-result v5

    .line 694
    iget-object v6, v15, Ll/txl0;->a:Landroid/view/View;

    .line 695
    .line 696
    invoke-virtual {v6, v5}, Landroid/view/View;->setAlpha(F)V

    .line 697
    .line 698
    .line 699
    :cond_15
    const/4 v5, 0x2

    .line 700
    goto :goto_9

    .line 701
    :cond_16
    const/4 v5, 0x2

    .line 702
    if-ne v14, v5, :cond_17

    .line 703
    .line 704
    iget-object v6, v0, Ll/ox2;->d:Ll/vr2;

    .line 705
    .line 706
    invoke-virtual {v6}, Ll/vr2;->a()F

    .line 707
    .line 708
    .line 709
    move-result v6

    .line 710
    mul-float/2addr v6, v4

    .line 711
    invoke-static {v11, v6}, Ljava/lang/Math;->max(FF)F

    .line 712
    .line 713
    .line 714
    move-result v6

    .line 715
    invoke-static {v10, v6}, Ljava/lang/Math;->min(FF)F

    .line 716
    .line 717
    .line 718
    move-result v6

    .line 719
    iget-object v7, v15, Ll/txl0;->a:Landroid/view/View;

    .line 720
    .line 721
    invoke-virtual {v7, v6}, Landroid/view/View;->setAlpha(F)V

    .line 722
    .line 723
    .line 724
    goto :goto_9

    .line 725
    :cond_17
    iget-object v6, v15, Ll/txl0;->a:Landroid/view/View;

    .line 726
    .line 727
    invoke-virtual {v6, v11}, Landroid/view/View;->setAlpha(F)V

    .line 728
    .line 729
    .line 730
    :goto_9
    int-to-float v6, v14

    .line 731
    sub-float/2addr v6, v4

    .line 732
    const/high16 v4, 0x40000000    # 2.0f

    .line 733
    .line 734
    invoke-static {v6, v4}, Ljava/lang/Math;->min(FF)F

    .line 735
    .line 736
    .line 737
    move-result v6

    .line 738
    add-int/lit8 v7, v14, 0x1

    .line 739
    .line 740
    mul-float/2addr v2, v6

    .line 741
    sub-float v2, v10, v2

    .line 742
    .line 743
    mul-float v8, v2, v2

    .line 744
    .line 745
    mul-float/2addr v8, v2

    .line 746
    move/from16 p2, v4

    .line 747
    .line 748
    float-to-double v4, v6

    .line 749
    invoke-static {v4, v5}, Ljava/lang/Math;->sqrt(D)D

    .line 750
    .line 751
    .line 752
    move-result-wide v4

    .line 753
    invoke-static {v4, v5}, Ljava/lang/Math;->sqrt(D)D

    .line 754
    .line 755
    .line 756
    move-result-wide v4

    .line 757
    double-to-float v2, v4

    .line 758
    mul-float v4, v2, v2

    .line 759
    .line 760
    mul-float/2addr v4, v2

    .line 761
    float-to-double v4, v4

    .line 762
    move v6, v10

    .line 763
    float-to-double v10, v2

    .line 764
    invoke-static {v10, v11}, Ljava/lang/Math;->sqrt(D)D

    .line 765
    .line 766
    .line 767
    move-result-wide v10

    .line 768
    mul-double/2addr v4, v10

    .line 769
    double-to-float v2, v4

    .line 770
    int-to-float v1, v1

    .line 771
    mul-float/2addr v2, v1

    .line 772
    if-eqz v3, :cond_18

    .line 773
    .line 774
    iget-object v1, v15, Ll/txl0;->a:Landroid/view/View;

    .line 775
    .line 776
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    .line 777
    .line 778
    .line 779
    move-result v1

    .line 780
    int-to-float v1, v1

    .line 781
    sub-float v10, v6, v8

    .line 782
    .line 783
    mul-float/2addr v1, v10

    .line 784
    div-float v1, v1, p2

    .line 785
    .line 786
    goto :goto_a

    .line 787
    :cond_18
    const/4 v1, 0x0

    .line 788
    :goto_a
    add-float/2addr v2, v1

    .line 789
    invoke-static {v8}, Ljava/lang/Float;->isNaN(F)Z

    .line 790
    .line 791
    .line 792
    move-result v1

    .line 793
    if-eqz v1, :cond_19

    .line 794
    .line 795
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->c:Ljava/lang/String;

    .line 796
    .line 797
    :cond_19
    iget-object v1, v15, Ll/txl0;->a:Landroid/view/View;

    .line 798
    .line 799
    invoke-virtual {v1, v8}, Landroid/view/View;->setScaleY(F)V

    .line 800
    .line 801
    .line 802
    iget-object v1, v15, Ll/txl0;->a:Landroid/view/View;

    .line 803
    .line 804
    invoke-virtual {v1, v8}, Landroid/view/View;->setScaleX(F)V

    .line 805
    .line 806
    .line 807
    sget-boolean v1, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->d:Z

    .line 808
    .line 809
    if-eqz v1, :cond_1a

    .line 810
    .line 811
    iget-object v1, v15, Ll/txl0;->a:Landroid/view/View;

    .line 812
    .line 813
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    .line 814
    .line 815
    .line 816
    :cond_1a
    invoke-virtual {v0}, Ll/ox2;->A()Ll/qn2;

    .line 817
    .line 818
    .line 819
    move-result-object v1

    .line 820
    invoke-virtual {v1}, Ll/qn2;->q()Z

    .line 821
    .line 822
    .line 823
    move-result v1

    .line 824
    if-eqz v1, :cond_1b

    .line 825
    .line 826
    const/high16 v1, -0x40800000    # -1.0f

    .line 827
    .line 828
    goto :goto_b

    .line 829
    :cond_1b
    move v1, v6

    .line 830
    :goto_b
    iget-object v3, v15, Ll/txl0;->a:Landroid/view/View;

    .line 831
    .line 832
    mul-float/2addr v1, v2

    .line 833
    invoke-virtual {v3, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 834
    .line 835
    .line 836
    cmpl-float v1, v8, v6

    .line 837
    .line 838
    if-lez v1, :cond_1c

    .line 839
    .line 840
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->c:Ljava/lang/String;

    .line 841
    .line 842
    :cond_1c
    move v2, v7

    .line 843
    goto :goto_c

    .line 844
    :cond_1d
    move/from16 v19, v1

    .line 845
    .line 846
    move v14, v2

    .line 847
    goto/16 :goto_7

    .line 848
    .line 849
    :goto_c
    move v10, v6

    .line 850
    move/from16 v1, v19

    .line 851
    .line 852
    const/4 v11, 0x0

    .line 853
    goto/16 :goto_8

    .line 854
    .line 855
    :cond_1e
    move v6, v10

    .line 856
    iget-object v1, v9, Ll/nh4;->g:Lcom/p1/mobile/putong/core/newui/home/opt/CardSwipeOutState;

    .line 857
    .line 858
    sget-object v2, Lcom/p1/mobile/putong/core/newui/home/opt/CardSwipeOutState;->PASS:Lcom/p1/mobile/putong/core/newui/home/opt/CardSwipeOutState;

    .line 859
    .line 860
    if-ne v1, v2, :cond_1f

    .line 861
    .line 862
    iget-boolean v1, v9, Ll/nh4;->j:Z

    .line 863
    .line 864
    if-nez v1, :cond_1f

    .line 865
    .line 866
    const/4 v5, 0x1

    .line 867
    iput-boolean v5, v9, Ll/nh4;->j:Z

    .line 868
    .line 869
    new-instance v1, Ljava/lang/StringBuilder;

    .line 870
    .line 871
    const-string v3, "anim success begin :"

    .line 872
    .line 873
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 874
    .line 875
    .line 876
    iget v3, v9, Ll/nh4;->o:I

    .line 877
    .line 878
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 879
    .line 880
    .line 881
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 882
    .line 883
    .line 884
    move-result-object v1

    .line 885
    invoke-virtual {v0, v1}, Ll/ox2;->Y(Ljava/lang/String;)V

    .line 886
    .line 887
    .line 888
    invoke-virtual/range {p0 .. p1}, Ll/mx2;->C0(Ll/nh4;)V

    .line 889
    .line 890
    .line 891
    new-instance v1, Ljava/lang/StringBuilder;

    .line 892
    .line 893
    const-string v3, "anim success end :"

    .line 894
    .line 895
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 896
    .line 897
    .line 898
    iget v3, v9, Ll/nh4;->o:I

    .line 899
    .line 900
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 901
    .line 902
    .line 903
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 904
    .line 905
    .line 906
    move-result-object v1

    .line 907
    invoke-virtual {v0, v1}, Ll/ox2;->Y(Ljava/lang/String;)V

    .line 908
    .line 909
    .line 910
    iget-object v1, v0, Ll/ox2;->q:Ll/pn4;

    .line 911
    .line 912
    if-eqz v1, :cond_1f

    .line 913
    .line 914
    sget-object v3, Lcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;->ANIM_DONE:Lcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;

    .line 915
    .line 916
    const/4 v4, 0x0

    .line 917
    invoke-interface {v1, v4, v4, v4, v3}, Ll/pn4;->d0(FFFLcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;)V

    .line 918
    .line 919
    .line 920
    iget-object v1, v0, Ll/ox2;->q:Ll/pn4;

    .line 921
    .line 922
    invoke-interface {v1, v4, v4, v3}, Ll/pn4;->v0(FFLcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;)V

    .line 923
    .line 924
    .line 925
    :cond_1f
    iget-object v1, v9, Ll/nh4;->g:Lcom/p1/mobile/putong/core/newui/home/opt/CardSwipeOutState;

    .line 926
    .line 927
    if-ne v1, v2, :cond_22

    .line 928
    .line 929
    iget-boolean v1, v9, Ll/nh4;->k:Z

    .line 930
    .line 931
    if-nez v1, :cond_22

    .line 932
    .line 933
    iget-object v1, v0, Ll/ox2;->d:Ll/vr2;

    .line 934
    .line 935
    invoke-virtual {v1}, Ll/vr2;->j()Z

    .line 936
    .line 937
    .line 938
    move-result v1

    .line 939
    if-nez v1, :cond_21

    .line 940
    .line 941
    iget v1, v0, Ll/ox2;->m:F

    .line 942
    .line 943
    cmpl-float v1, v13, v1

    .line 944
    .line 945
    if-gez v1, :cond_20

    .line 946
    .line 947
    goto :goto_e

    .line 948
    :cond_20
    :goto_d
    const/4 v5, 0x1

    .line 949
    goto :goto_f

    .line 950
    :cond_21
    :goto_e
    iget-object v0, v0, Ll/ox2;->d:Ll/vr2;

    .line 951
    .line 952
    invoke-virtual {v0}, Ll/vr2;->j()Z

    .line 953
    .line 954
    .line 955
    move-result v0

    .line 956
    if-eqz v0, :cond_22

    .line 957
    .line 958
    cmpl-float v0, v16, v6

    .line 959
    .line 960
    if-ltz v0, :cond_22

    .line 961
    .line 962
    goto :goto_d

    .line 963
    :goto_f
    iput-boolean v5, v9, Ll/nh4;->k:Z

    .line 964
    .line 965
    :cond_22
    return-void
.end method

.method public bridge synthetic a()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/qx2;->a()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic b()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-super {p0}, Ll/qx2;->b()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic u0()Lrx/c;
    .locals 0

    .line 1
    invoke-super {p0}, Ll/qx2;->u0()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic z0()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/qx2;->z0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
