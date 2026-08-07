.class public Lcom/p1/mobile/putong/core/ui/messages/ItemMomentComment;
.super Landroid/widget/LinearLayout;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/messages/a;


# instance fields
.field public a:Landroid/widget/LinearLayout;

.field public b:Landroid/widget/RelativeLayout;

.field public c:Lv/VDraweeView;

.field public d:Landroid/view/View;

.field public e:Landroid/view/View;

.field public f:Landroid/view/View;

.field public g:Landroid/widget/TextView;

.field public h:Lcom/p1/mobile/putong/core/ui/messages/ItemText;

.field public i:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/messages/ItemMomentComment;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentComment;->d()V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/messages/ItemMomentComment;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentComment;->f(Landroid/view/View;)Z

    move-result p0

    return p0
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/ui/messages/ItemMomentComment;Lcom/p1/mobile/putong/core/data/CoreMomentInfo;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentComment;->e(Lcom/p1/mobile/putong/core/data/CoreMomentInfo;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method private synthetic f(Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->R(Landroid/view/View;)Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->onLongClick(Landroid/view/View;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method


# virtual methods
.method public A(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentComment;->h:Lcom/p1/mobile/putong/core/ui/messages/ItemText;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemText;->A(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentComment;->h:Lcom/p1/mobile/putong/core/ui/messages/ItemText;

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    sget v2, Ll/ibc0;->P7:I

    .line 17
    .line 18
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 23
    .line 24
    .line 25
    sget-object v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->LOCAL_ID_INVALID:Ljava/lang/String;

    .line 26
    .line 27
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->moment:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    const/4 v1, 0x0

    .line 34
    if-eqz v0, :cond_0

    .line 35
    .line 36
    move-object p1, v1

    .line 37
    goto :goto_0

    .line 38
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->moment:Ljava/lang/String;

    .line 43
    .line 44
    sget-object v2, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 45
    .line 46
    invoke-interface {v0, p1, v2}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Mh(Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)Lcom/tantanapp/common/data/ValueObject;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 51
    .line 52
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentComment;->c:Lv/VDraweeView;

    .line 53
    .line 54
    const/4 v2, 0x0

    .line 55
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentComment;->f:Landroid/view/View;

    .line 59
    .line 60
    const/16 v3, 0x8

    .line 61
    .line 62
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentComment;->d:Landroid/view/View;

    .line 66
    .line 67
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentComment;->f:Landroid/view/View;

    .line 71
    .line 72
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 73
    .line 74
    .line 75
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    const/4 v4, 0x1

    .line 80
    if-eqz v0, :cond_8

    .line 81
    .line 82
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    iget-object v5, p1, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 87
    .line 88
    invoke-interface {v0, v5}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Ur(Ljava/lang/String;)Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 93
    .line 94
    .line 95
    move-result v5

    .line 96
    if-eqz v5, :cond_1

    .line 97
    .line 98
    const-string v0, "word"

    .line 99
    .line 100
    :cond_1
    const-string v5, "moment_id"

    .line 101
    .line 102
    iget-object v6, p1, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 103
    .line 104
    invoke-static {v5, v6}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 105
    .line 106
    .line 107
    move-result-object v5

    .line 108
    const-string v6, "moment_type"

    .line 109
    .line 110
    invoke-static {v6, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 111
    .line 112
    .line 113
    move-result-object v6

    .line 114
    filled-new-array {v5, v6}, [Ll/pf60;

    .line 115
    .line 116
    .line 117
    move-result-object v5

    .line 118
    const-string v6, "e_moment_message"

    .line 119
    .line 120
    const-string v7, "p_chat_view"

    .line 121
    .line 122
    invoke-static {v6, v7, v5}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 123
    .line 124
    .line 125
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentComment;->b:Landroid/widget/RelativeLayout;

    .line 126
    .line 127
    invoke-static {v5, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 128
    .line 129
    .line 130
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentComment;->g:Landroid/widget/TextView;

    .line 131
    .line 132
    iget-object v5, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->value:Ljava/lang/String;

    .line 133
    .line 134
    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 135
    .line 136
    .line 137
    iget-object v4, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 138
    .line 139
    invoke-static {v4}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 140
    .line 141
    .line 142
    move-result v4

    .line 143
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentComment;->c:Lv/VDraweeView;

    .line 144
    .line 145
    if-eqz v4, :cond_2

    .line 146
    .line 147
    invoke-virtual {v5, v3}, Landroid/view/View;->setVisibility(I)V

    .line 148
    .line 149
    .line 150
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentComment;->d:Landroid/view/View;

    .line 151
    .line 152
    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 153
    .line 154
    .line 155
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 156
    .line 157
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentComment;->c:Lv/VDraweeView;

    .line 158
    .line 159
    invoke-virtual {v1, v2}, Ll/am2;->o(Lcom/facebook/drawee/view/DraweeView;)V

    .line 160
    .line 161
    .line 162
    goto/16 :goto_2

    .line 163
    .line 164
    :cond_2
    invoke-virtual {v5}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 165
    .line 166
    .line 167
    move-result-object v4

    .line 168
    check-cast v4, Ll/wlj;

    .line 169
    .line 170
    invoke-virtual {v4, v1}, Ll/wlj;->c(Landroid/graphics/drawable/Drawable;)V

    .line 171
    .line 172
    .line 173
    iget-object v4, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 174
    .line 175
    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 176
    .line 177
    .line 178
    move-result-object v4

    .line 179
    check-cast v4, Lcom/p1/mobile/putong/data/Media;

    .line 180
    .line 181
    instance-of v5, v4, Lcom/p1/mobile/putong/data/Video;

    .line 182
    .line 183
    if-eqz v5, :cond_3

    .line 184
    .line 185
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentComment;->d:Landroid/view/View;

    .line 186
    .line 187
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 188
    .line 189
    .line 190
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentComment;->d:Landroid/view/View;

    .line 191
    .line 192
    sget v2, Ll/ibc0;->G3:I

    .line 193
    .line 194
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 195
    .line 196
    .line 197
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentComment;->d:Landroid/view/View;

    .line 198
    .line 199
    const/high16 v2, 0x41f00000    # 30.0f

    .line 200
    .line 201
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 202
    .line 203
    .line 204
    move-result v5

    .line 205
    invoke-static {v1, v5}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 206
    .line 207
    .line 208
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 209
    .line 210
    .line 211
    move-result v1

    .line 212
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentComment;->d:Landroid/view/View;

    .line 213
    .line 214
    filled-new-array {v2}, [Landroid/view/View;

    .line 215
    .line 216
    .line 217
    move-result-object v2

    .line 218
    invoke-static {v1, v2}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 219
    .line 220
    .line 221
    move-object v1, v4

    .line 222
    check-cast v1, Lcom/p1/mobile/putong/data/Video;

    .line 223
    .line 224
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 225
    .line 226
    goto :goto_1

    .line 227
    :cond_3
    instance-of v5, v4, Lcom/p1/mobile/putong/data/Audio;

    .line 228
    .line 229
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentComment;->d:Landroid/view/View;

    .line 230
    .line 231
    if-eqz v5, :cond_4

    .line 232
    .line 233
    invoke-virtual {v6, v2}, Landroid/view/View;->setVisibility(I)V

    .line 234
    .line 235
    .line 236
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentComment;->d:Landroid/view/View;

    .line 237
    .line 238
    sget v6, Ll/ibc0;->A3:I

    .line 239
    .line 240
    invoke-virtual {v5, v6}, Landroid/view/View;->setBackgroundResource(I)V

    .line 241
    .line 242
    .line 243
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentComment;->d:Landroid/view/View;

    .line 244
    .line 245
    const/high16 v6, 0x41800000    # 16.0f

    .line 246
    .line 247
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 248
    .line 249
    .line 250
    move-result v7

    .line 251
    invoke-static {v5, v7}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 252
    .line 253
    .line 254
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 255
    .line 256
    .line 257
    move-result v5

    .line 258
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentComment;->d:Landroid/view/View;

    .line 259
    .line 260
    filled-new-array {v6}, [Landroid/view/View;

    .line 261
    .line 262
    .line 263
    move-result-object v6

    .line 264
    invoke-static {v5, v6}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 265
    .line 266
    .line 267
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentComment;->f:Landroid/view/View;

    .line 268
    .line 269
    invoke-virtual {v5, v2}, Landroid/view/View;->setVisibility(I)V

    .line 270
    .line 271
    .line 272
    goto :goto_1

    .line 273
    :cond_4
    invoke-virtual {v6, v3}, Landroid/view/View;->setVisibility(I)V

    .line 274
    .line 275
    .line 276
    instance-of v2, v4, Lcom/p1/mobile/putong/data/Picture;

    .line 277
    .line 278
    if-eqz v2, :cond_5

    .line 279
    .line 280
    move-object v1, v4

    .line 281
    check-cast v1, Lcom/p1/mobile/putong/data/Picture;

    .line 282
    .line 283
    :cond_5
    :goto_1
    instance-of v2, v4, Lcom/p1/mobile/putong/data/Audio;

    .line 284
    .line 285
    if-eqz v2, :cond_6

    .line 286
    .line 287
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentComment;->c:Lv/VDraweeView;

    .line 288
    .line 289
    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 290
    .line 291
    .line 292
    goto :goto_2

    .line 293
    :cond_6
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 294
    .line 295
    .line 296
    move-result v2

    .line 297
    if-eqz v2, :cond_7

    .line 298
    .line 299
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    .line 300
    .line 301
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentComment;->c:Lv/VDraweeView;

    .line 302
    .line 303
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Picture;->momentPictureSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 304
    .line 305
    .line 306
    move-result-object v1

    .line 307
    invoke-virtual {v2, v3, v1}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 308
    .line 309
    .line 310
    goto :goto_2

    .line 311
    :cond_7
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 312
    .line 313
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentComment;->c:Lv/VDraweeView;

    .line 314
    .line 315
    invoke-virtual {v1, v2}, Ll/am2;->o(Lcom/facebook/drawee/view/DraweeView;)V

    .line 316
    .line 317
    .line 318
    :goto_2
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentComment;->a:Landroid/widget/LinearLayout;

    .line 319
    .line 320
    new-instance v2, Ll/ccq;

    .line 321
    .line 322
    invoke-direct {v2, p0, p1, v0}, Ll/ccq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMomentComment;Lcom/p1/mobile/putong/core/data/CoreMomentInfo;Ljava/lang/String;)V

    .line 323
    .line 324
    .line 325
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 326
    .line 327
    .line 328
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentComment;->a:Landroid/widget/LinearLayout;

    .line 329
    .line 330
    new-instance v0, Ll/dcq;

    .line 331
    .line 332
    invoke-direct {v0, p0}, Ll/dcq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMomentComment;)V

    .line 333
    .line 334
    .line 335
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 336
    .line 337
    .line 338
    return-void

    .line 339
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentComment;->a:Landroid/widget/LinearLayout;

    .line 340
    .line 341
    invoke-virtual {p1, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 342
    .line 343
    .line 344
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentComment;->a:Landroid/widget/LinearLayout;

    .line 345
    .line 346
    invoke-virtual {p1, v1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 347
    .line 348
    .line 349
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentComment;->b:Landroid/widget/RelativeLayout;

    .line 350
    .line 351
    invoke-static {p1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 352
    .line 353
    .line 354
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentComment;->c:Lv/VDraweeView;

    .line 355
    .line 356
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 357
    .line 358
    .line 359
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentComment;->g:Landroid/widget/TextView;

    .line 360
    .line 361
    const-string p1, "\u52a8\u6001\u5df2\u5220\u9664"

    .line 362
    .line 363
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 364
    .line 365
    .line 366
    return-void
.end method

.method public J()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/ovb0<",
            "Ljava/lang/String;",
            "Ljava/lang/Runnable;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Void;",
            ">;>;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Lcom/p1/mobile/putong/core/message/R$string;->c:I

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/bcq;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/bcq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMomentComment;)V

    .line 14
    .line 15
    .line 16
    sget p0, Ll/ibc0;->x1:I

    .line 17
    .line 18
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const/4 v2, 0x0

    .line 23
    invoke-static {v0, v1, p0, v2}, Ll/jyb;->Z(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/ovb0;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    filled-new-array {p0}, [Ll/ovb0;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0
.end method

.method public final synthetic d()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentComment;->h:Lcom/p1/mobile/putong/core/ui/messages/ItemText;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Ll/l51;->q(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic e(Lcom/p1/mobile/putong/core/data/CoreMomentInfo;Ljava/lang/String;Landroid/view/View;)V
    .locals 2

    .line 1
    const-string p3, "moment_id"

    .line 2
    .line 3
    iget-object v0, p1, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p3, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p3

    .line 9
    const-string v0, "moment_type"

    .line 10
    .line 11
    invoke-static {v0, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    filled-new-array {p3, p2}, [Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    const-string p3, "e_moment_message"

    .line 20
    .line 21
    const-string v0, "p_chat_view"

    .line 22
    .line 23
    invoke-static {p3, v0, p2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 24
    .line 25
    .line 26
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 31
    .line 32
    .line 33
    move-result-object p3

    .line 34
    iget-object v0, p1, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 35
    .line 36
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->owner:Ljava/lang/String;

    .line 37
    .line 38
    const-string v1, "chat"

    .line 39
    .line 40
    invoke-interface {p2, p3, v1, v0, p1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->argsToMomentDetailAct(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    if-nez p1, :cond_0

    .line 45
    .line 46
    return-void

    .line 47
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public m(IZLcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;)V
    .locals 0

    .line 1
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentComment;->i:Z

    .line 2
    .line 3
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_1

    .line 16
    .line 17
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentComment;->h:Lcom/p1/mobile/putong/core/ui/messages/ItemText;

    .line 18
    .line 19
    if-eqz p2, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    sget p3, Ll/g9c0;->j:I

    .line 26
    .line 27
    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getColor(I)I

    .line 28
    .line 29
    .line 30
    move-result p2

    .line 31
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setLinkTextColor(I)V

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    const-string p2, "#1565C0"

    .line 36
    .line 37
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    move-result p2

    .line 41
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setLinkTextColor(I)V

    .line 42
    .line 43
    .line 44
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentComment;->h:Lcom/p1/mobile/putong/core/ui/messages/ItemText;

    .line 45
    .line 46
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    sget p3, Ll/g9c0;->g:I

    .line 51
    .line 52
    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getColor(I)I

    .line 53
    .line 54
    .line 55
    move-result p2

    .line 56
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 57
    .line 58
    .line 59
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentComment;->e:Landroid/view/View;

    .line 60
    .line 61
    sget p1, Ll/ibc0;->j5:I

    .line 62
    .line 63
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 64
    .line 65
    .line 66
    :cond_1
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/edc0;->Z:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Landroid/widget/LinearLayout;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentComment;->a:Landroid/widget/LinearLayout;

    .line 13
    .line 14
    sget v0, Ll/edc0;->y2:I

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Landroid/widget/RelativeLayout;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentComment;->b:Landroid/widget/RelativeLayout;

    .line 23
    .line 24
    sget v0, Ll/edc0;->r2:I

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Lv/VDraweeView;

    .line 31
    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentComment;->c:Lv/VDraweeView;

    .line 33
    .line 34
    sget v0, Ll/edc0;->x2:I

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentComment;->d:Landroid/view/View;

    .line 41
    .line 42
    sget v0, Ll/edc0;->k:I

    .line 43
    .line 44
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentComment;->f:Landroid/view/View;

    .line 49
    .line 50
    sget v0, Ll/edc0;->q2:I

    .line 51
    .line 52
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    check-cast v0, Landroid/widget/TextView;

    .line 57
    .line 58
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentComment;->g:Landroid/widget/TextView;

    .line 59
    .line 60
    sget v0, Ll/edc0;->A4:I

    .line 61
    .line 62
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/ItemText;

    .line 67
    .line 68
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentComment;->h:Lcom/p1/mobile/putong/core/ui/messages/ItemText;

    .line 69
    .line 70
    sget v0, Ll/edc0;->v5:I

    .line 71
    .line 72
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentComment;->e:Landroid/view/View;

    .line 77
    .line 78
    return-void
.end method
