.class public Lcom/p1/mobile/putong/core/ui/messages/ItemLike;
.super Landroid/widget/LinearLayout;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/messages/a;


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Landroid/view/View;

.field public c:Landroid/widget/TextView;

.field public d:Lv/VImage;

.field public e:Z

.field public f:Ll/kcg0;


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

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/messages/ItemLike;Lcom/p1/mobile/putong/core/data/CoreMomentInfo;Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/messages/ItemLike;->b(Lcom/p1/mobile/putong/core/data/CoreMomentInfo;Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V

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
    sget-object v2, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->LOCAL_ID_INVALID:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Message;->likeOfMoment:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    const/4 v3, 0x0

    .line 14
    if-eqz v2, :cond_0

    .line 15
    .line 16
    move-object v2, v3

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    iget-object v4, v1, Lcom/p1/mobile/putong/core/data/Message;->likeOfMoment:Ljava/lang/String;

    .line 23
    .line 24
    sget-object v5, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 25
    .line 26
    invoke-interface {v2, v4, v5}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Mh(Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)Lcom/tantanapp/common/data/ValueObject;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    check-cast v2, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 31
    .line 32
    :goto_0
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v4

    .line 36
    const/16 v5, 0x1f

    .line 37
    .line 38
    const/4 v6, 0x2

    .line 39
    const/high16 v7, 0x41600000    # 14.0f

    .line 40
    .line 41
    const/high16 v8, 0x41e00000    # 28.0f

    .line 42
    .line 43
    const/16 v9, 0xfa

    .line 44
    .line 45
    const/4 v10, 0x0

    .line 46
    if-eqz v4, :cond_7

    .line 47
    .line 48
    new-instance v11, Ll/pri0;

    .line 49
    .line 50
    invoke-static {v8}, Ll/qa00;->d(F)I

    .line 51
    .line 52
    .line 53
    move-result v13

    .line 54
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 55
    .line 56
    .line 57
    move-result v14

    .line 58
    invoke-static {v6}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 59
    .line 60
    .line 61
    move-result-object v15

    .line 62
    sget v17, Ll/pri0;->j:I

    .line 63
    .line 64
    iget-boolean v4, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemLike;->e:Z

    .line 65
    .line 66
    if-eqz v4, :cond_1

    .line 67
    .line 68
    invoke-static {v5, v10, v10, v10}, Landroid/graphics/Color;->argb(IIII)I

    .line 69
    .line 70
    .line 71
    move-result v4

    .line 72
    :goto_1
    move/from16 v18, v4

    .line 73
    .line 74
    goto :goto_2

    .line 75
    :cond_1
    invoke-static {v9, v9, v9}, Landroid/graphics/Color;->rgb(III)I

    .line 76
    .line 77
    .line 78
    move-result v4

    .line 79
    goto :goto_1

    .line 80
    :goto_2
    const-string v12, " "

    .line 81
    .line 82
    const/16 v16, 0x0

    .line 83
    .line 84
    invoke-direct/range {v11 .. v18}, Ll/pri0;-><init>(Ljava/lang/String;IILandroid/graphics/Typeface;III)V

    .line 85
    .line 86
    .line 87
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemLike;->a:Lv/VDraweeView;

    .line 88
    .line 89
    invoke-virtual {v4}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 90
    .line 91
    .line 92
    move-result-object v4

    .line 93
    check-cast v4, Ll/wlj;

    .line 94
    .line 95
    invoke-virtual {v4, v11}, Ll/wlj;->E(Landroid/graphics/drawable/Drawable;)V

    .line 96
    .line 97
    .line 98
    iget-object v4, v2, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 99
    .line 100
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 101
    .line 102
    .line 103
    move-result v4

    .line 104
    iget-object v5, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemLike;->a:Lv/VDraweeView;

    .line 105
    .line 106
    if-nez v4, :cond_2

    .line 107
    .line 108
    invoke-virtual {v5}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 109
    .line 110
    .line 111
    move-result-object v3

    .line 112
    check-cast v3, Ll/wlj;

    .line 113
    .line 114
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 115
    .line 116
    .line 117
    move-result-object v4

    .line 118
    sget v5, Ll/ibc0;->h5:I

    .line 119
    .line 120
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 121
    .line 122
    .line 123
    move-result-object v4

    .line 124
    invoke-virtual {v3, v4}, Ll/wlj;->c(Landroid/graphics/drawable/Drawable;)V

    .line 125
    .line 126
    .line 127
    sget-object v3, Ll/uqb0;->G:Ll/fsb0;

    .line 128
    .line 129
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemLike;->a:Lv/VDraweeView;

    .line 130
    .line 131
    invoke-virtual {v3, v4}, Ll/am2;->o(Lcom/facebook/drawee/view/DraweeView;)V

    .line 132
    .line 133
    .line 134
    goto :goto_4

    .line 135
    :cond_2
    invoke-virtual {v5}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 136
    .line 137
    .line 138
    move-result-object v4

    .line 139
    check-cast v4, Ll/wlj;

    .line 140
    .line 141
    invoke-virtual {v4, v3}, Ll/wlj;->c(Landroid/graphics/drawable/Drawable;)V

    .line 142
    .line 143
    .line 144
    iget-object v4, v2, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 145
    .line 146
    invoke-interface {v4, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 147
    .line 148
    .line 149
    move-result-object v4

    .line 150
    check-cast v4, Lcom/p1/mobile/putong/data/Media;

    .line 151
    .line 152
    instance-of v5, v4, Lcom/p1/mobile/putong/data/Video;

    .line 153
    .line 154
    iget-object v6, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemLike;->b:Landroid/view/View;

    .line 155
    .line 156
    if-eqz v5, :cond_3

    .line 157
    .line 158
    invoke-virtual {v6, v10}, Landroid/view/View;->setVisibility(I)V

    .line 159
    .line 160
    .line 161
    check-cast v4, Lcom/p1/mobile/putong/data/Video;

    .line 162
    .line 163
    iget-object v3, v4, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 164
    .line 165
    goto :goto_3

    .line 166
    :cond_3
    const/16 v5, 0x8

    .line 167
    .line 168
    invoke-virtual {v6, v5}, Landroid/view/View;->setVisibility(I)V

    .line 169
    .line 170
    .line 171
    instance-of v5, v4, Lcom/p1/mobile/putong/data/Picture;

    .line 172
    .line 173
    if-eqz v5, :cond_4

    .line 174
    .line 175
    move-object v3, v4

    .line 176
    check-cast v3, Lcom/p1/mobile/putong/data/Picture;

    .line 177
    .line 178
    :cond_4
    :goto_3
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 179
    .line 180
    .line 181
    move-result v4

    .line 182
    if-eqz v4, :cond_5

    .line 183
    .line 184
    sget-object v4, Ll/uqb0;->G:Ll/fsb0;

    .line 185
    .line 186
    iget-object v5, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemLike;->a:Lv/VDraweeView;

    .line 187
    .line 188
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Picture;->momentPictureSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 189
    .line 190
    .line 191
    move-result-object v3

    .line 192
    invoke-virtual {v4, v5, v3}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 193
    .line 194
    .line 195
    goto :goto_4

    .line 196
    :cond_5
    sget-object v3, Ll/uqb0;->G:Ll/fsb0;

    .line 197
    .line 198
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemLike;->a:Lv/VDraweeView;

    .line 199
    .line 200
    invoke-virtual {v3, v4}, Ll/am2;->o(Lcom/facebook/drawee/view/DraweeView;)V

    .line 201
    .line 202
    .line 203
    :goto_4
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemLike;->a:Lv/VDraweeView;

    .line 204
    .line 205
    invoke-virtual {v3, v10}, Landroid/view/View;->setVisibility(I)V

    .line 206
    .line 207
    .line 208
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemLike;->a:Lv/VDraweeView;

    .line 209
    .line 210
    invoke-virtual {v0, v2, v1}, Lcom/p1/mobile/putong/core/ui/messages/ItemLike;->c(Lcom/p1/mobile/putong/core/data/CoreMomentInfo;Lcom/p1/mobile/putong/core/data/Message;)Landroid/view/View$OnClickListener;

    .line 211
    .line 212
    .line 213
    move-result-object v1

    .line 214
    invoke-virtual {v3, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 215
    .line 216
    .line 217
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemLike;->c:Landroid/widget/TextView;

    .line 218
    .line 219
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemLike;->e:Z

    .line 220
    .line 221
    if-eqz v0, :cond_6

    .line 222
    .line 223
    sget v0, Lcom/p1/mobile/putong/core/message/R$string;->L4:I

    .line 224
    .line 225
    goto :goto_5

    .line 226
    :cond_6
    sget v0, Lcom/p1/mobile/putong/core/message/R$string;->M4:I

    .line 227
    .line 228
    :goto_5
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 229
    .line 230
    .line 231
    return-void

    .line 232
    :cond_7
    new-instance v4, Ll/pri0;

    .line 233
    .line 234
    invoke-static {v8}, Ll/qa00;->d(F)I

    .line 235
    .line 236
    .line 237
    move-result v1

    .line 238
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 239
    .line 240
    .line 241
    move-result v7

    .line 242
    invoke-static {v6}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 243
    .line 244
    .line 245
    move-result-object v8

    .line 246
    sget v2, Ll/pri0;->j:I

    .line 247
    .line 248
    iget-boolean v6, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemLike;->e:Z

    .line 249
    .line 250
    if-eqz v6, :cond_8

    .line 251
    .line 252
    invoke-static {v5, v10, v10, v10}, Landroid/graphics/Color;->argb(IIII)I

    .line 253
    .line 254
    .line 255
    move-result v5

    .line 256
    :goto_6
    move v11, v5

    .line 257
    goto :goto_7

    .line 258
    :cond_8
    invoke-static {v9, v9, v9}, Landroid/graphics/Color;->rgb(III)I

    .line 259
    .line 260
    .line 261
    move-result v5

    .line 262
    goto :goto_6

    .line 263
    :goto_7
    const-string v5, " "

    .line 264
    .line 265
    const/4 v9, 0x0

    .line 266
    move v6, v1

    .line 267
    move v10, v2

    .line 268
    invoke-direct/range {v4 .. v11}, Ll/pri0;-><init>(Ljava/lang/String;IILandroid/graphics/Typeface;III)V

    .line 269
    .line 270
    .line 271
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemLike;->a:Lv/VDraweeView;

    .line 272
    .line 273
    invoke-virtual {v1}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 274
    .line 275
    .line 276
    move-result-object v1

    .line 277
    check-cast v1, Ll/wlj;

    .line 278
    .line 279
    invoke-virtual {v1, v4}, Ll/wlj;->E(Landroid/graphics/drawable/Drawable;)V

    .line 280
    .line 281
    .line 282
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemLike;->a:Lv/VDraweeView;

    .line 283
    .line 284
    invoke-virtual {v1}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 285
    .line 286
    .line 287
    move-result-object v1

    .line 288
    check-cast v1, Ll/wlj;

    .line 289
    .line 290
    invoke-virtual {v1, v3}, Ll/wlj;->c(Landroid/graphics/drawable/Drawable;)V

    .line 291
    .line 292
    .line 293
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 294
    .line 295
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemLike;->a:Lv/VDraweeView;

    .line 296
    .line 297
    invoke-virtual {v1, v2}, Ll/am2;->o(Lcom/facebook/drawee/view/DraweeView;)V

    .line 298
    .line 299
    .line 300
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemLike;->a:Lv/VDraweeView;

    .line 301
    .line 302
    invoke-virtual {v1, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 303
    .line 304
    .line 305
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemLike;->c:Landroid/widget/TextView;

    .line 306
    .line 307
    sget v1, Lcom/p1/mobile/putong/core/message/R$string;->s4:I

    .line 308
    .line 309
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 310
    .line 311
    .line 312
    return-void
.end method

.method public J()Ljava/util/List;
    .locals 0
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
    const/4 p0, 0x0

    return-object p0
.end method

.method public final synthetic b(Lcom/p1/mobile/putong/core/data/CoreMomentInfo;Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V
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
    const-string v5, "ItemLike"

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

.method public c(Lcom/p1/mobile/putong/core/data/CoreMomentInfo;Lcom/p1/mobile/putong/core/data/Message;)Landroid/view/View$OnClickListener;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance v0, Ll/f7q;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/f7q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemLike;Lcom/p1/mobile/putong/core/data/CoreMomentInfo;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public m(IZLcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;)V
    .locals 0

    .line 1
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLike;->e:Z

    .line 2
    .line 3
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLike;->f:Ll/kcg0;

    .line 5
    .line 6
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

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
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLike;->a:Lv/VDraweeView;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLike;->b:Landroid/view/View;

    .line 21
    .line 22
    sget v0, Ll/edc0;->h1:I

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Lv/VImage;

    .line 29
    .line 30
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLike;->d:Lv/VImage;

    .line 31
    .line 32
    sget v0, Ll/edc0;->A4:I

    .line 33
    .line 34
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    check-cast v0, Landroid/widget/TextView;

    .line 39
    .line 40
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLike;->c:Landroid/widget/TextView;

    .line 41
    .line 42
    return-void
.end method
