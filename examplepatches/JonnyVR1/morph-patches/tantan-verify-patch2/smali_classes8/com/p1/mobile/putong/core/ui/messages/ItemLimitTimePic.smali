.class public Lcom/p1/mobile/putong/core/ui/messages/ItemLimitTimePic;
.super Landroid/widget/LinearLayout;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/messages/a;
.implements Lcom/p1/mobile/putong/core/api/c0$c;


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/messages/ItemLimitTimePic;

.field public b:Lv/VDraweeView;

.field public c:Lv/VLinear;

.field public d:Landroid/widget/ImageView;

.field public e:Landroid/widget/TextView;

.field public f:Landroid/widget/TextView;

.field public g:Lv/VLinear;

.field public h:Landroid/widget/ImageView;

.field public i:Landroid/widget/TextView;

.field public j:Landroid/widget/TextView;

.field public k:Lcom/p1/mobile/putong/core/data/Message;

.field public l:Lcom/p1/mobile/putong/core/api/c0$a;

.field public m:Z

.field public n:J

.field public o:Ljava/lang/String;


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
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/messages/ItemLimitTimePic;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemLimitTimePic;->f(Landroid/view/View;)Z

    move-result p0

    return p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/messages/ItemLimitTimePic;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/messages/ItemLimitTimePic;->e(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Landroid/view/View;)V

    return-void
.end method

.method private synthetic f(Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->R(Landroid/view/View;)Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLimitTimePic;->b:Lv/VDraweeView;

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->onLongClick(Landroid/view/View;)Z

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    return p0
.end method


# virtual methods
.method public A(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 11

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    const-string v0, "e_time_photo_message"

    .line 11
    .line 12
    const-string v1, "p_chat_view"

    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 22
    .line 23
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLimitTimePic;->k:Lcom/p1/mobile/putong/core/data/Message;

    .line 24
    .line 25
    new-instance v1, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    const-string v2, "message_limit_time_pic_progress_"

    .line 28
    .line 29
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget-object v2, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLimitTimePic;->o:Ljava/lang/String;

    .line 42
    .line 43
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 44
    .line 45
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->t1:Lcom/p1/mobile/putong/core/api/c0;

    .line 46
    .line 47
    invoke-virtual {v1, p0}, Lcom/p1/mobile/putong/core/api/c0;->t(Lcom/p1/mobile/putong/core/api/c0$c;)V

    .line 48
    .line 49
    .line 50
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 51
    .line 52
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    const/4 v2, 0x0

    .line 57
    if-nez v1, :cond_1

    .line 58
    .line 59
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 60
    .line 61
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    check-cast v1, Lcom/p1/mobile/putong/data/Media;

    .line 66
    .line 67
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 68
    .line 69
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLimitTimePic;->b:Lv/VDraweeView;

    .line 70
    .line 71
    iget-object v4, p1, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 72
    .line 73
    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object v4

    .line 77
    check-cast v4, Lcom/p1/mobile/putong/data/Media;

    .line 78
    .line 79
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 80
    .line 81
    .line 82
    move-result-object v4

    .line 83
    invoke-static {p1, v4}, Ll/k900;->h(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/Picture;)Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v4

    .line 87
    invoke-virtual {v3, v4}, Lv/VDraweeView;->setZoomAnimationKey(Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_1
    const-string v1, ""

    .line 92
    .line 93
    :goto_0
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 94
    .line 95
    .line 96
    move-result v3

    .line 97
    const/4 v4, 0x1

    .line 98
    if-nez v3, :cond_8

    .line 99
    .line 100
    const/high16 v3, 0x41200000    # 10.0f

    .line 101
    .line 102
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 103
    .line 104
    .line 105
    move-result v5

    .line 106
    int-to-float v5, v5

    .line 107
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 108
    .line 109
    .line 110
    move-result v6

    .line 111
    int-to-float v6, v6

    .line 112
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 113
    .line 114
    .line 115
    move-result v7

    .line 116
    int-to-float v7, v7

    .line 117
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 118
    .line 119
    .line 120
    move-result v3

    .line 121
    int-to-float v3, v3

    .line 122
    invoke-static {v5, v6, v7, v3}, Lcom/facebook/drawee/generic/RoundingParams;->b(FFFF)Lcom/facebook/drawee/generic/RoundingParams;

    .line 123
    .line 124
    .line 125
    move-result-object v3

    .line 126
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLimitTimePic;->b:Lv/VDraweeView;

    .line 127
    .line 128
    invoke-virtual {v5}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 129
    .line 130
    .line 131
    move-result-object v5

    .line 132
    check-cast v5, Ll/wlj;

    .line 133
    .line 134
    invoke-virtual {v5, v3}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 135
    .line 136
    .line 137
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 138
    .line 139
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 140
    .line 141
    .line 142
    move-result v3

    .line 143
    if-eqz v3, :cond_3

    .line 144
    .line 145
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 146
    .line 147
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->limitTimePicture:Lcom/p1/mobile/putong/core/data/LimitTimePicture;

    .line 148
    .line 149
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 150
    .line 151
    .line 152
    move-result v3

    .line 153
    if-eqz v3, :cond_3

    .line 154
    .line 155
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 156
    .line 157
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->limitTimePicture:Lcom/p1/mobile/putong/core/data/LimitTimePicture;

    .line 158
    .line 159
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/LimitTimePicture;->status:Lcom/p1/mobile/putong/core/data/LimitTimePictureStatus;

    .line 160
    .line 161
    const-string v5, "read"

    .line 162
    .line 163
    invoke-static {v3, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 164
    .line 165
    .line 166
    move-result v3

    .line 167
    if-eqz v3, :cond_2

    .line 168
    .line 169
    iput-boolean v4, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLimitTimePic;->m:Z

    .line 170
    .line 171
    :cond_2
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 172
    .line 173
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->limitTimePicture:Lcom/p1/mobile/putong/core/data/LimitTimePicture;

    .line 174
    .line 175
    iget v3, v3, Lcom/p1/mobile/putong/core/data/LimitTimePicture;->duration:I

    .line 176
    .line 177
    goto :goto_1

    .line 178
    :cond_3
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLimitTimePic;->m:Z

    .line 179
    .line 180
    move v3, v2

    .line 181
    :goto_1
    iget-boolean v5, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLimitTimePic;->m:Z

    .line 182
    .line 183
    if-nez v5, :cond_4

    .line 184
    .line 185
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    .line 186
    .line 187
    .line 188
    move-result v5

    .line 189
    if-nez v5, :cond_4

    .line 190
    .line 191
    sget-object v5, Ll/uqb0;->G:Ll/fsb0;

    .line 192
    .line 193
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLimitTimePic;->b:Lv/VDraweeView;

    .line 194
    .line 195
    const/4 v7, 0x2

    .line 196
    const/16 v8, 0x64

    .line 197
    .line 198
    invoke-virtual {v5, v6, v1, v7, v8}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 199
    .line 200
    .line 201
    goto :goto_2

    .line 202
    :cond_4
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLimitTimePic;->c:Lv/VLinear;

    .line 203
    .line 204
    invoke-static {v5, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 205
    .line 206
    .line 207
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLimitTimePic;->g:Lv/VLinear;

    .line 208
    .line 209
    invoke-static {v5, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 210
    .line 211
    .line 212
    sget-object v5, Ll/uqb0;->G:Ll/fsb0;

    .line 213
    .line 214
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLimitTimePic;->b:Lv/VDraweeView;

    .line 215
    .line 216
    const/high16 v7, 0x430c0000    # 140.0f

    .line 217
    .line 218
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 219
    .line 220
    .line 221
    move-result v8

    .line 222
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 223
    .line 224
    .line 225
    move-result v7

    .line 226
    invoke-virtual {v5, v6, v1, v8, v7}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 227
    .line 228
    .line 229
    :goto_2
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 230
    .line 231
    int-to-long v7, v3

    .line 232
    const-wide/16 v9, 0x3e8

    .line 233
    .line 234
    mul-long/2addr v7, v9

    .line 235
    long-to-double v7, v7

    .line 236
    add-double/2addr v5, v7

    .line 237
    double-to-long v5, v5

    .line 238
    iput-wide v5, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLimitTimePic;->n:J

    .line 239
    .line 240
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLimitTimePic;->m:Z

    .line 241
    .line 242
    if-nez v1, :cond_5

    .line 243
    .line 244
    invoke-static {}, Ll/pzi0;->o()J

    .line 245
    .line 246
    .line 247
    move-result-wide v5

    .line 248
    iget-wide v7, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLimitTimePic;->n:J

    .line 249
    .line 250
    cmp-long v1, v5, v7

    .line 251
    .line 252
    if-ltz v1, :cond_5

    .line 253
    .line 254
    move v1, v4

    .line 255
    goto :goto_3

    .line 256
    :cond_5
    move v1, v2

    .line 257
    :goto_3
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLimitTimePic;->b:Lv/VDraweeView;

    .line 258
    .line 259
    const/16 v5, 0xff

    .line 260
    .line 261
    invoke-virtual {v3, v5}, Landroid/widget/ImageView;->setImageAlpha(I)V

    .line 262
    .line 263
    .line 264
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    .line 265
    .line 266
    .line 267
    move-result v3

    .line 268
    if-nez v3, :cond_7

    .line 269
    .line 270
    if-eqz v1, :cond_6

    .line 271
    .line 272
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLimitTimePic;->c:Lv/VLinear;

    .line 273
    .line 274
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 275
    .line 276
    .line 277
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLimitTimePic;->g:Lv/VLinear;

    .line 278
    .line 279
    invoke-static {v1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 280
    .line 281
    .line 282
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLimitTimePic;->h:Landroid/widget/ImageView;

    .line 283
    .line 284
    const/16 v3, 0xb3

    .line 285
    .line 286
    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setImageAlpha(I)V

    .line 287
    .line 288
    .line 289
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLimitTimePic;->b:Lv/VDraweeView;

    .line 290
    .line 291
    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setImageAlpha(I)V

    .line 292
    .line 293
    .line 294
    goto :goto_4

    .line 295
    :cond_6
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLimitTimePic;->m:Z

    .line 296
    .line 297
    if-nez v1, :cond_7

    .line 298
    .line 299
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLimitTimePic;->f:Landroid/widget/TextView;

    .line 300
    .line 301
    invoke-static {v4}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    .line 302
    .line 303
    .line 304
    move-result-object v3

    .line 305
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 306
    .line 307
    .line 308
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLimitTimePic;->c:Lv/VLinear;

    .line 309
    .line 310
    invoke-static {v1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 311
    .line 312
    .line 313
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLimitTimePic;->g:Lv/VLinear;

    .line 314
    .line 315
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 316
    .line 317
    .line 318
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemLimitTimePic;->g()V

    .line 319
    .line 320
    .line 321
    :cond_7
    :goto_4
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLimitTimePic;->b:Lv/VDraweeView;

    .line 322
    .line 323
    new-instance v3, Ll/g7q;

    .line 324
    .line 325
    invoke-direct {v3, p0, p1, v0}, Ll/g7q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemLimitTimePic;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;)V

    .line 326
    .line 327
    .line 328
    invoke-static {v1, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 329
    .line 330
    .line 331
    :cond_8
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    .line 332
    .line 333
    .line 334
    move-result p1

    .line 335
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLimitTimePic;->j:Landroid/widget/TextView;

    .line 336
    .line 337
    if-nez p1, :cond_9

    .line 338
    .line 339
    invoke-static {v0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 340
    .line 341
    .line 342
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLimitTimePic;->j:Landroid/widget/TextView;

    .line 343
    .line 344
    const-string v0, "\u9650\u65f6\u5feb\u62cd"

    .line 345
    .line 346
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 347
    .line 348
    .line 349
    goto :goto_5

    .line 350
    :cond_9
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 351
    .line 352
    .line 353
    :goto_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLimitTimePic;->b:Lv/VDraweeView;

    .line 354
    .line 355
    new-instance v0, Ll/h7q;

    .line 356
    .line 357
    invoke-direct {v0, p0}, Ll/h7q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemLimitTimePic;)V

    .line 358
    .line 359
    .line 360
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 361
    .line 362
    .line 363
    return-void
.end method

.method public J()Ljava/util/List;
    .locals 4
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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLimitTimePic;->k:Lcom/p1/mobile/putong/core/data/Message;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_2

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 7
    .line 8
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLimitTimePic;->k:Lcom/p1/mobile/putong/core/data/Message;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLimitTimePic;->m:Z

    .line 24
    .line 25
    if-nez v0, :cond_1

    .line 26
    .line 27
    return-object v1

    .line 28
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    check-cast v1, Lcom/p1/mobile/android/app/Act;

    .line 41
    .line 42
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLimitTimePic;->k:Lcom/p1/mobile/putong/core/data/Message;

    .line 43
    .line 44
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 45
    .line 46
    const/4 v3, 0x0

    .line 47
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    check-cast v2, Lcom/p1/mobile/putong/data/Media;

    .line 52
    .line 53
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLimitTimePic;->k:Lcom/p1/mobile/putong/core/data/Message;

    .line 54
    .line 55
    invoke-interface {v0, v1, v2, p0}, Ll/r97;->M5(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/core/data/Message;)Ljava/util/List;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    return-object p0

    .line 60
    :cond_2
    :goto_0
    return-object v1
.end method

.method public final c(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/i7q;->a(Lcom/p1/mobile/putong/core/ui/messages/ItemLimitTimePic;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final d(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Z)V
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p3, :cond_0

    .line 3
    .line 4
    invoke-static {}, Ll/pzi0;->o()J

    .line 5
    .line 6
    .line 7
    move-result-wide v1

    .line 8
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLimitTimePic;->n:J

    .line 9
    .line 10
    cmp-long p0, v1, v3

    .line 11
    .line 12
    if-ltz p0, :cond_0

    .line 13
    .line 14
    const/4 p0, 0x1

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    move p0, v0

    .line 17
    :goto_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-nez v1, :cond_1

    .line 22
    .line 23
    if-nez p0, :cond_5

    .line 24
    .line 25
    :cond_1
    const-string p0, "e_time_photo_message"

    .line 26
    .line 27
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->pageId()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-static {p0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    if-nez p0, :cond_4

    .line 39
    .line 40
    if-nez p3, :cond_4

    .line 41
    .line 42
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 43
    .line 44
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 45
    .line 46
    iget-object p3, p1, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 47
    .line 48
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/core/api/g;->zp(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    if-eqz p0, :cond_3

    .line 53
    .line 54
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 55
    .line 56
    const-string p3, "dismissed"

    .line 57
    .line 58
    invoke-static {p0, p3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    if-eqz p0, :cond_2

    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_2
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 66
    .line 67
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 68
    .line 69
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/g;->zo(Lcom/p1/mobile/putong/core/data/Message;)Lrx/c;

    .line 70
    .line 71
    .line 72
    goto :goto_2

    .line 73
    :cond_3
    :goto_1
    const-string p0, "\u5df2\u89e3\u9664\u914d\u5bf9\uff0c\u65e0\u6cd5\u67e5\u770b"

    .line 74
    .line 75
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :cond_4
    :goto_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 80
    .line 81
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 82
    .line 83
    .line 84
    move-result p0

    .line 85
    if-nez p0, :cond_5

    .line 86
    .line 87
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 88
    .line 89
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    check-cast p0, Lcom/p1/mobile/putong/data/Media;

    .line 94
    .line 95
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    move-result p3

    .line 99
    if-eqz p3, :cond_5

    .line 100
    .line 101
    iget-object p3, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 102
    .line 103
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 104
    .line 105
    .line 106
    move-result p3

    .line 107
    if-nez p3, :cond_5

    .line 108
    .line 109
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 110
    .line 111
    .line 112
    move-result-object p3

    .line 113
    invoke-virtual {p3}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 114
    .line 115
    .line 116
    move-result-object p3

    .line 117
    invoke-interface {p3, p2, p1, p0}, Ll/r97;->n1(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/Media;)V

    .line 118
    .line 119
    .line 120
    :cond_5
    return-void
.end method

.method public final synthetic e(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-boolean p3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLimitTimePic;->m:Z

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/messages/ItemLimitTimePic;->d(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final g()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLimitTimePic;->k:Lcom/p1/mobile/putong/core/data/Message;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->limitTimePicture:Lcom/p1/mobile/putong/core/data/LimitTimePicture;

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLimitTimePic;->f:Landroid/widget/TextView;

    .line 15
    .line 16
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLimitTimePic;->n:J

    .line 17
    .line 18
    invoke-static {}, Ll/pzi0;->o()J

    .line 19
    .line 20
    .line 21
    move-result-wide v3

    .line 22
    sub-long/2addr v1, v3

    .line 23
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/core/api/c0;->l(J)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 28
    .line 29
    .line 30
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 31
    .line 32
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->t1:Lcom/p1/mobile/putong/core/api/c0;

    .line 33
    .line 34
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/c0;->t(Lcom/p1/mobile/putong/core/api/c0$c;)V

    .line 35
    .line 36
    .line 37
    new-instance v0, Lcom/p1/mobile/putong/core/api/c0$a;

    .line 38
    .line 39
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/api/c0$a;-><init>()V

    .line 40
    .line 41
    .line 42
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLimitTimePic;->l:Lcom/p1/mobile/putong/core/api/c0$a;

    .line 43
    .line 44
    const/4 v1, 0x1

    .line 45
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/c0$a;->a(Z)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLimitTimePic;->o:Ljava/lang/String;

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/c0$a;->g(Ljava/lang/String;)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/c0$a;->d(Lcom/p1/mobile/putong/core/api/c0$c;)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLimitTimePic;->n:J

    .line 60
    .line 61
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/api/c0$a;->f(J)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 62
    .line 63
    .line 64
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 65
    .line 66
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->t1:Lcom/p1/mobile/putong/core/api/c0;

    .line 67
    .line 68
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLimitTimePic;->l:Lcom/p1/mobile/putong/core/api/c0$a;

    .line 69
    .line 70
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/c0;->r(Lcom/p1/mobile/putong/core/api/c0$a;)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    :cond_1
    :goto_0
    return-void
.end method

.method public m(IZLcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onAttachedToWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->t1:Lcom/p1/mobile/putong/core/api/c0;

    .line 7
    .line 8
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/c0;->t(Lcom/p1/mobile/putong/core/api/c0$c;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemLimitTimePic;->c(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLimitTimePic;->j:Landroid/widget/TextView;

    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    sget v2, Ll/g9c0;->i:I

    .line 28
    .line 29
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLimitTimePic;->i:Landroid/widget/TextView;

    .line 37
    .line 38
    const/4 v1, -0x1

    .line 39
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLimitTimePic;->d:Landroid/widget/ImageView;

    .line 43
    .line 44
    sget v1, Ll/ibc0;->j3:I

    .line 45
    .line 46
    invoke-static {v0, v1}, Ll/bnl0;->N(Landroid/widget/ImageView;I)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLimitTimePic;->h:Landroid/widget/ImageView;

    .line 50
    .line 51
    sget v1, Ll/ibc0;->h3:I

    .line 52
    .line 53
    invoke-static {v0, v1}, Ll/bnl0;->N(Landroid/widget/ImageView;I)V

    .line 54
    .line 55
    .line 56
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLimitTimePic;->f:Landroid/widget/TextView;

    .line 57
    .line 58
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 59
    .line 60
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    sget v1, Ll/ibc0;->g3:I

    .line 65
    .line 66
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    const/4 v1, 0x0

    .line 71
    invoke-virtual {p0, v0, v1, v1, v1}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 72
    .line 73
    .line 74
    :cond_0
    return-void
.end method

.method public u(Ljava/lang/String;JJJJ)V
    .locals 0

    .line 1
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLimitTimePic;->o:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p4, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLimitTimePic;->f:Landroid/widget/TextView;

    .line 11
    .line 12
    if-nez p1, :cond_1

    .line 13
    .line 14
    :goto_0
    return-void

    .line 15
    :cond_1
    cmp-long p4, p6, p2

    .line 16
    .line 17
    if-gez p4, :cond_2

    .line 18
    .line 19
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLimitTimePic;->k:Lcom/p1/mobile/putong/core/data/Message;

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemLimitTimePic;->A(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 22
    .line 23
    .line 24
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 25
    .line 26
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->t1:Lcom/p1/mobile/putong/core/api/c0;

    .line 27
    .line 28
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/api/c0;->t(Lcom/p1/mobile/putong/core/api/c0$c;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_2
    sub-long/2addr p6, p2

    .line 33
    invoke-static {p6, p7}, Lcom/p1/mobile/putong/core/api/c0;->l(J)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method
