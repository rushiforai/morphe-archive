.class public Lcom/p1/mobile/putong/core/ui/messages/ItemComment;
.super Landroid/widget/LinearLayout;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/messages/a;


# instance fields
.field public a:Lv/VText;

.field public b:Lv/VDraweeView;

.field public c:Landroid/view/View;

.field public d:Z

.field public e:Landroid/widget/ImageView;

.field public f:Landroid/view/View;


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

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/messages/ItemComment;Lcom/p1/mobile/putong/core/data/CoreMomentInfo;Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/messages/ItemComment;->d(Lcom/p1/mobile/putong/core/data/CoreMomentInfo;Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/messages/ItemComment;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemComment;->c()V

    return-void
.end method

.method private synthetic c()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemComment;->a:Lv/VText;

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


# virtual methods
.method public A(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemComment;->a:Lv/VText;

    .line 6
    .line 7
    new-instance v3, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 13
    .line 14
    sget v5, Lcom/p1/mobile/putong/core/message/R$string;->k4:I

    .line 15
    .line 16
    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v4

    .line 20
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    iget-object v4, v1, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 29
    .line 30
    sget v5, Lcom/p1/mobile/putong/core/message/R$string;->l4:I

    .line 31
    .line 32
    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v4

    .line 36
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 44
    .line 45
    .line 46
    sget-object v2, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->LOCAL_ID_INVALID:Ljava/lang/String;

    .line 47
    .line 48
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Message;->moment:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    const/4 v3, 0x0

    .line 55
    if-eqz v2, :cond_0

    .line 56
    .line 57
    move-object v2, v3

    .line 58
    goto :goto_0

    .line 59
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    iget-object v4, v1, Lcom/p1/mobile/putong/core/data/Message;->moment:Ljava/lang/String;

    .line 64
    .line 65
    sget-object v5, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 66
    .line 67
    invoke-interface {v2, v4, v5}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Mh(Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)Lcom/tantanapp/common/data/ValueObject;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    check-cast v2, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 72
    .line 73
    :goto_0
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    move-result v4

    .line 77
    const/16 v5, 0x1f

    .line 78
    .line 79
    const/4 v6, 0x2

    .line 80
    const/high16 v7, 0x41600000    # 14.0f

    .line 81
    .line 82
    const/high16 v8, 0x41e00000    # 28.0f

    .line 83
    .line 84
    const/16 v9, 0xfa

    .line 85
    .line 86
    const/4 v10, 0x0

    .line 87
    if-eqz v4, :cond_6

    .line 88
    .line 89
    new-instance v11, Ll/pri0;

    .line 90
    .line 91
    invoke-static {v8}, Ll/qa00;->d(F)I

    .line 92
    .line 93
    .line 94
    move-result v13

    .line 95
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 96
    .line 97
    .line 98
    move-result v14

    .line 99
    invoke-static {v6}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 100
    .line 101
    .line 102
    move-result-object v15

    .line 103
    sget v17, Ll/pri0;->j:I

    .line 104
    .line 105
    iget-boolean v4, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemComment;->d:Z

    .line 106
    .line 107
    if-eqz v4, :cond_1

    .line 108
    .line 109
    invoke-static {v5, v10, v10, v10}, Landroid/graphics/Color;->argb(IIII)I

    .line 110
    .line 111
    .line 112
    move-result v4

    .line 113
    :goto_1
    move/from16 v18, v4

    .line 114
    .line 115
    goto :goto_2

    .line 116
    :cond_1
    invoke-static {v9, v9, v9}, Landroid/graphics/Color;->rgb(III)I

    .line 117
    .line 118
    .line 119
    move-result v4

    .line 120
    goto :goto_1

    .line 121
    :goto_2
    const-string v12, " "

    .line 122
    .line 123
    const/16 v16, 0x0

    .line 124
    .line 125
    invoke-direct/range {v11 .. v18}, Ll/pri0;-><init>(Ljava/lang/String;IILandroid/graphics/Typeface;III)V

    .line 126
    .line 127
    .line 128
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemComment;->b:Lv/VDraweeView;

    .line 129
    .line 130
    invoke-virtual {v4}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 131
    .line 132
    .line 133
    move-result-object v4

    .line 134
    check-cast v4, Ll/wlj;

    .line 135
    .line 136
    invoke-virtual {v4, v11}, Ll/wlj;->E(Landroid/graphics/drawable/Drawable;)V

    .line 137
    .line 138
    .line 139
    iget-object v4, v2, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 140
    .line 141
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 142
    .line 143
    .line 144
    move-result v4

    .line 145
    iget-object v5, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemComment;->b:Lv/VDraweeView;

    .line 146
    .line 147
    const/16 v6, 0x8

    .line 148
    .line 149
    if-nez v4, :cond_2

    .line 150
    .line 151
    invoke-virtual {v5}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 152
    .line 153
    .line 154
    move-result-object v3

    .line 155
    check-cast v3, Ll/wlj;

    .line 156
    .line 157
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 158
    .line 159
    .line 160
    move-result-object v4

    .line 161
    sget v5, Ll/ibc0;->h5:I

    .line 162
    .line 163
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 164
    .line 165
    .line 166
    move-result-object v4

    .line 167
    invoke-virtual {v3, v4}, Ll/wlj;->c(Landroid/graphics/drawable/Drawable;)V

    .line 168
    .line 169
    .line 170
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemComment;->c:Landroid/view/View;

    .line 171
    .line 172
    invoke-virtual {v3, v6}, Landroid/view/View;->setVisibility(I)V

    .line 173
    .line 174
    .line 175
    sget-object v3, Ll/uqb0;->G:Ll/fsb0;

    .line 176
    .line 177
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemComment;->b:Lv/VDraweeView;

    .line 178
    .line 179
    invoke-virtual {v3, v4}, Ll/am2;->o(Lcom/facebook/drawee/view/DraweeView;)V

    .line 180
    .line 181
    .line 182
    goto :goto_4

    .line 183
    :cond_2
    invoke-virtual {v5}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 184
    .line 185
    .line 186
    move-result-object v4

    .line 187
    check-cast v4, Ll/wlj;

    .line 188
    .line 189
    invoke-virtual {v4, v3}, Ll/wlj;->c(Landroid/graphics/drawable/Drawable;)V

    .line 190
    .line 191
    .line 192
    iget-object v4, v2, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 193
    .line 194
    invoke-interface {v4, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 195
    .line 196
    .line 197
    move-result-object v4

    .line 198
    check-cast v4, Lcom/p1/mobile/putong/data/Media;

    .line 199
    .line 200
    instance-of v5, v4, Lcom/p1/mobile/putong/data/Video;

    .line 201
    .line 202
    iget-object v7, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemComment;->c:Landroid/view/View;

    .line 203
    .line 204
    if-eqz v5, :cond_3

    .line 205
    .line 206
    invoke-virtual {v7, v10}, Landroid/view/View;->setVisibility(I)V

    .line 207
    .line 208
    .line 209
    check-cast v4, Lcom/p1/mobile/putong/data/Video;

    .line 210
    .line 211
    iget-object v3, v4, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 212
    .line 213
    goto :goto_3

    .line 214
    :cond_3
    invoke-virtual {v7, v6}, Landroid/view/View;->setVisibility(I)V

    .line 215
    .line 216
    .line 217
    instance-of v5, v4, Lcom/p1/mobile/putong/data/Picture;

    .line 218
    .line 219
    if-eqz v5, :cond_4

    .line 220
    .line 221
    move-object v3, v4

    .line 222
    check-cast v3, Lcom/p1/mobile/putong/data/Picture;

    .line 223
    .line 224
    :cond_4
    :goto_3
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 225
    .line 226
    .line 227
    move-result v4

    .line 228
    if-eqz v4, :cond_5

    .line 229
    .line 230
    sget-object v4, Ll/uqb0;->G:Ll/fsb0;

    .line 231
    .line 232
    iget-object v5, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemComment;->b:Lv/VDraweeView;

    .line 233
    .line 234
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Picture;->momentPictureSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 235
    .line 236
    .line 237
    move-result-object v3

    .line 238
    invoke-virtual {v4, v5, v3}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 239
    .line 240
    .line 241
    goto :goto_4

    .line 242
    :cond_5
    sget-object v3, Ll/uqb0;->G:Ll/fsb0;

    .line 243
    .line 244
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemComment;->b:Lv/VDraweeView;

    .line 245
    .line 246
    invoke-virtual {v3, v4}, Ll/am2;->o(Lcom/facebook/drawee/view/DraweeView;)V

    .line 247
    .line 248
    .line 249
    :goto_4
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemComment;->b:Lv/VDraweeView;

    .line 250
    .line 251
    invoke-virtual {v3, v10}, Landroid/view/View;->setVisibility(I)V

    .line 252
    .line 253
    .line 254
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemComment;->b:Lv/VDraweeView;

    .line 255
    .line 256
    new-instance v4, Ll/g4q;

    .line 257
    .line 258
    invoke-direct {v4, v0, v2, v1}, Ll/g4q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemComment;Lcom/p1/mobile/putong/core/data/CoreMomentInfo;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 259
    .line 260
    .line 261
    invoke-virtual {v3, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 262
    .line 263
    .line 264
    return-void

    .line 265
    :cond_6
    new-instance v1, Ll/pri0;

    .line 266
    .line 267
    invoke-static {v8}, Ll/qa00;->d(F)I

    .line 268
    .line 269
    .line 270
    move-result v2

    .line 271
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 272
    .line 273
    .line 274
    move-result v8

    .line 275
    invoke-static {v6}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 276
    .line 277
    .line 278
    move-result-object v4

    .line 279
    sget v11, Ll/pri0;->j:I

    .line 280
    .line 281
    iget-boolean v6, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemComment;->d:Z

    .line 282
    .line 283
    if-eqz v6, :cond_7

    .line 284
    .line 285
    invoke-static {v5, v10, v10, v10}, Landroid/graphics/Color;->argb(IIII)I

    .line 286
    .line 287
    .line 288
    move-result v5

    .line 289
    :goto_5
    move v12, v5

    .line 290
    goto :goto_6

    .line 291
    :cond_7
    invoke-static {v9, v9, v9}, Landroid/graphics/Color;->rgb(III)I

    .line 292
    .line 293
    .line 294
    move-result v5

    .line 295
    goto :goto_5

    .line 296
    :goto_6
    const-string v6, " "

    .line 297
    .line 298
    const/4 v10, 0x0

    .line 299
    move-object v5, v1

    .line 300
    move v7, v2

    .line 301
    move-object v9, v4

    .line 302
    invoke-direct/range {v5 .. v12}, Ll/pri0;-><init>(Ljava/lang/String;IILandroid/graphics/Typeface;III)V

    .line 303
    .line 304
    .line 305
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemComment;->b:Lv/VDraweeView;

    .line 306
    .line 307
    invoke-virtual {v1}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 308
    .line 309
    .line 310
    move-result-object v1

    .line 311
    check-cast v1, Ll/wlj;

    .line 312
    .line 313
    invoke-virtual {v1, v5}, Ll/wlj;->E(Landroid/graphics/drawable/Drawable;)V

    .line 314
    .line 315
    .line 316
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemComment;->b:Lv/VDraweeView;

    .line 317
    .line 318
    invoke-virtual {v1}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 319
    .line 320
    .line 321
    move-result-object v1

    .line 322
    check-cast v1, Ll/wlj;

    .line 323
    .line 324
    invoke-virtual {v1, v3}, Ll/wlj;->c(Landroid/graphics/drawable/Drawable;)V

    .line 325
    .line 326
    .line 327
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemComment;->b:Lv/VDraweeView;

    .line 328
    .line 329
    invoke-virtual {v1, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 330
    .line 331
    .line 332
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 333
    .line 334
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemComment;->b:Lv/VDraweeView;

    .line 335
    .line 336
    invoke-virtual {v1, v2}, Ll/am2;->o(Lcom/facebook/drawee/view/DraweeView;)V

    .line 337
    .line 338
    .line 339
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemComment;->a:Lv/VText;

    .line 340
    .line 341
    sget v1, Lcom/p1/mobile/putong/core/message/R$string;->s4:I

    .line 342
    .line 343
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 344
    .line 345
    .line 346
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
    new-instance v1, Ll/f4q;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/f4q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemComment;)V

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

.method public final synthetic d(Lcom/p1/mobile/putong/core/data/CoreMomentInfo;Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V
    .locals 7

    .line 1
    iget-object p3, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p3

    .line 7
    if-nez p3, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 14
    .line 15
    .line 16
    move-result-object p3

    .line 17
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    iget-object v0, p1, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 22
    .line 23
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->owner:Ljava/lang/String;

    .line 24
    .line 25
    invoke-interface {p3, p0, v0, p1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->argsToMomentsSimpleTextAct(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p2, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 34
    .line 35
    .line 36
    move-result-object p3

    .line 37
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    iget-object v2, p1, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 46
    .line 47
    const-string v5, "ItemComment"

    .line 48
    .line 49
    iget-object v6, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 50
    .line 51
    const/4 v3, 0x0

    .line 52
    const/4 v4, 0x0

    .line 53
    invoke-interface/range {v0 .. v6}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->argsToMomentsFeedPreviewAct(Landroid/content/Context;Ljava/lang/String;IZLjava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {p3, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public m(IZLcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;)V
    .locals 0

    .line 1
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemComment;->d:Z

    .line 2
    .line 3
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/edc0;->o1:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lv/VDraweeView;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemComment;->b:Lv/VDraweeView;

    .line 13
    .line 14
    sget v0, Ll/edc0;->k3:I

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemComment;->c:Landroid/view/View;

    .line 21
    .line 22
    sget v0, Ll/edc0;->A4:I

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Lv/VText;

    .line 29
    .line 30
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemComment;->a:Lv/VText;

    .line 31
    .line 32
    const/4 v1, 0x0

    .line 33
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 34
    .line 35
    .line 36
    sget v0, Ll/edc0;->k1:I

    .line 37
    .line 38
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    check-cast v0, Landroid/widget/ImageView;

    .line 43
    .line 44
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemComment;->e:Landroid/widget/ImageView;

    .line 45
    .line 46
    sget v0, Ll/edc0;->Z:I

    .line 47
    .line 48
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemComment;->f:Landroid/view/View;

    .line 53
    .line 54
    return-void
.end method
