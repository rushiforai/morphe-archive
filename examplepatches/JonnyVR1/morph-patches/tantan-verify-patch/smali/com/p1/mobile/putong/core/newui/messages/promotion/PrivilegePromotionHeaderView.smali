.class public Lcom/p1/mobile/putong/core/newui/messages/promotion/PrivilegePromotionHeaderView;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/widget/RelativeLayout;

.field public b:Lv/VDraweeView;

.field public c:Landroid/widget/ImageView;

.field public d:Lv/VText;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:Landroid/widget/ImageView;

.field public h:Ljava/text/DecimalFormat;

.field public i:Ljava/text/NumberFormat;

.field public j:Lcom/p1/mobile/putong/core/data/Merchandise;

.field public k:Lcom/p1/mobile/putong/core/data/Coupon;

.field public l:D

.field public m:D

.field public n:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 41
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/messages/promotion/PrivilegePromotionHeaderView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 40
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/newui/messages/promotion/PrivilegePromotionHeaderView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    new-instance p2, Ljava/text/DecimalFormat;

    .line 5
    .line 6
    const-string p3, "#.#"

    .line 7
    .line 8
    invoke-direct {p2, p3}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/promotion/PrivilegePromotionHeaderView;->h:Ljava/text/DecimalFormat;

    .line 12
    .line 13
    new-instance p2, Ljava/text/DecimalFormat;

    .line 14
    .line 15
    const-string p3, "00"

    .line 16
    .line 17
    invoke-direct {p2, p3}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/promotion/PrivilegePromotionHeaderView;->i:Ljava/text/NumberFormat;

    .line 21
    .line 22
    new-instance p2, Lcom/p1/mobile/putong/core/newui/messages/promotion/PrivilegePromotionHeaderView$a;

    .line 23
    .line 24
    invoke-direct {p2, p0}, Lcom/p1/mobile/putong/core/newui/messages/promotion/PrivilegePromotionHeaderView$a;-><init>(Lcom/p1/mobile/putong/core/newui/messages/promotion/PrivilegePromotionHeaderView;)V

    .line 25
    .line 26
    .line 27
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/promotion/PrivilegePromotionHeaderView;->n:Ljava/lang/Runnable;

    .line 28
    .line 29
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p0, p1, p0}, Lcom/p1/mobile/putong/core/newui/messages/promotion/PrivilegePromotionHeaderView;->b(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/promotion/PrivilegePromotionHeaderView;->d()V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/putong/core/newui/messages/promotion/PrivilegePromotionHeaderView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/promotion/PrivilegePromotionHeaderView;->e()V

    return-void
.end method

.method private getAct()Lcom/p1/mobile/android/app/Act;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-static {p0}, Ll/bnl0;->E(Landroid/view/View;)Landroid/app/Activity;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    instance-of v0, p0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return-object p0
.end method

.method private getPromotiontitle()Ljava/lang/CharSequence;
    .locals 15

    .line 1
    new-instance v0, Landroid/text/SpannableStringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/promotion/PrivilegePromotionHeaderView;->k:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 7
    .line 8
    const-string v2, "lowPriceCallback3SVIP"

    .line 9
    .line 10
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/data/Coupon;->isBelongPromotion(Ljava/lang/String;)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    const-string v2, "#FF7118"

    .line 15
    .line 16
    const-string v3, "\u5361\u7acb\u51cf"

    .line 17
    .line 18
    const-string v4, "\u5143"

    .line 19
    .line 20
    const/16 v5, 0x21

    .line 21
    .line 22
    const/4 v6, 0x0

    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    const-string v1, "SVIP"

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/messages/promotion/PrivilegePromotionHeaderView;->getUnitIntervalValue()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v0, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v3}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 38
    .line 39
    .line 40
    new-instance v1, Landroid/text/SpannableStringBuilder;

    .line 41
    .line 42
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/promotion/PrivilegePromotionHeaderView;->h:Ljava/text/DecimalFormat;

    .line 43
    .line 44
    iget-wide v7, p0, Lcom/p1/mobile/putong/core/newui/messages/promotion/PrivilegePromotionHeaderView;->m:D

    .line 45
    .line 46
    iget-wide v9, p0, Lcom/p1/mobile/putong/core/newui/messages/promotion/PrivilegePromotionHeaderView;->l:D

    .line 47
    .line 48
    sub-double/2addr v7, v9

    .line 49
    invoke-virtual {v3, v7, v8}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-direct {v1, p0}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 54
    .line 55
    .line 56
    new-instance p0, Landroid/text/style/ForegroundColorSpan;

    .line 57
    .line 58
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    invoke-direct {p0, v2}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v1}, Landroid/text/SpannableStringBuilder;->length()I

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    invoke-virtual {v1, p0, v6, v2, v5}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v0, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {v0, v4}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 76
    .line 77
    .line 78
    return-object v0

    .line 79
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/promotion/PrivilegePromotionHeaderView;->k:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 80
    .line 81
    const-string v7, "lowPriceCallback3VIP"

    .line 82
    .line 83
    invoke-virtual {v1, v7}, Lcom/p1/mobile/putong/core/data/Coupon;->isBelongPromotion(Ljava/lang/String;)Z

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    const-string v7, "#FF8D47"

    .line 88
    .line 89
    if-eqz v1, :cond_1

    .line 90
    .line 91
    const-string v1, "VIP"

    .line 92
    .line 93
    invoke-virtual {v0, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/messages/promotion/PrivilegePromotionHeaderView;->getUnitIntervalValue()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    invoke-virtual {v0, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 101
    .line 102
    .line 103
    invoke-virtual {v0, v3}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 104
    .line 105
    .line 106
    new-instance v1, Landroid/text/SpannableStringBuilder;

    .line 107
    .line 108
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/promotion/PrivilegePromotionHeaderView;->h:Ljava/text/DecimalFormat;

    .line 109
    .line 110
    iget-wide v8, p0, Lcom/p1/mobile/putong/core/newui/messages/promotion/PrivilegePromotionHeaderView;->m:D

    .line 111
    .line 112
    iget-wide v10, p0, Lcom/p1/mobile/putong/core/newui/messages/promotion/PrivilegePromotionHeaderView;->l:D

    .line 113
    .line 114
    sub-double/2addr v8, v10

    .line 115
    invoke-virtual {v2, v8, v9}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    invoke-direct {v1, p0}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 120
    .line 121
    .line 122
    new-instance p0, Landroid/text/style/ForegroundColorSpan;

    .line 123
    .line 124
    invoke-static {v7}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 125
    .line 126
    .line 127
    move-result v2

    .line 128
    invoke-direct {p0, v2}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 129
    .line 130
    .line 131
    invoke-virtual {v1}, Landroid/text/SpannableStringBuilder;->length()I

    .line 132
    .line 133
    .line 134
    move-result v2

    .line 135
    invoke-virtual {v1, p0, v6, v2, v5}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 136
    .line 137
    .line 138
    invoke-virtual {v0, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 139
    .line 140
    .line 141
    invoke-virtual {v0, v4}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 142
    .line 143
    .line 144
    return-object v0

    .line 145
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/promotion/PrivilegePromotionHeaderView;->k:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 146
    .line 147
    const-string v3, "lowPriceCustomerVIP"

    .line 148
    .line 149
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/core/data/Coupon;->isBelongPromotion(Ljava/lang/String;)Z

    .line 150
    .line 151
    .line 152
    move-result v1

    .line 153
    const-string v3, "%"

    .line 154
    .line 155
    const-string v8, "\u7acb\u7701"

    .line 156
    .line 157
    const-wide/high16 v9, 0x4059000000000000L    # 100.0

    .line 158
    .line 159
    if-eqz v1, :cond_2

    .line 160
    .line 161
    const-string v1, "VIP\u9996"

    .line 162
    .line 163
    invoke-virtual {v0, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 164
    .line 165
    .line 166
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/messages/promotion/PrivilegePromotionHeaderView;->getUnitIntervalValue()Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object v1

    .line 170
    invoke-virtual {v0, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 171
    .line 172
    .line 173
    invoke-virtual {v0, v8}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 174
    .line 175
    .line 176
    new-instance v1, Landroid/text/SpannableStringBuilder;

    .line 177
    .line 178
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/promotion/PrivilegePromotionHeaderView;->i:Ljava/text/NumberFormat;

    .line 179
    .line 180
    iget-wide v11, p0, Lcom/p1/mobile/putong/core/newui/messages/promotion/PrivilegePromotionHeaderView;->l:D

    .line 181
    .line 182
    iget-wide v13, p0, Lcom/p1/mobile/putong/core/newui/messages/promotion/PrivilegePromotionHeaderView;->m:D

    .line 183
    .line 184
    div-double/2addr v11, v13

    .line 185
    mul-double/2addr v11, v9

    .line 186
    sub-double/2addr v9, v11

    .line 187
    invoke-virtual {v2, v9, v10}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 188
    .line 189
    .line 190
    move-result-object p0

    .line 191
    invoke-direct {v1, p0}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 192
    .line 193
    .line 194
    new-instance p0, Landroid/text/style/ForegroundColorSpan;

    .line 195
    .line 196
    invoke-static {v7}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 197
    .line 198
    .line 199
    move-result v2

    .line 200
    invoke-direct {p0, v2}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 201
    .line 202
    .line 203
    invoke-virtual {v1}, Landroid/text/SpannableStringBuilder;->length()I

    .line 204
    .line 205
    .line 206
    move-result v2

    .line 207
    invoke-virtual {v1, p0, v6, v2, v5}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 208
    .line 209
    .line 210
    invoke-virtual {v0, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 211
    .line 212
    .line 213
    invoke-virtual {v0, v3}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 214
    .line 215
    .line 216
    return-object v0

    .line 217
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/promotion/PrivilegePromotionHeaderView;->k:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 218
    .line 219
    const-string v11, "lowPriceCustomerSVIP"

    .line 220
    .line 221
    invoke-virtual {v1, v11}, Lcom/p1/mobile/putong/core/data/Coupon;->isBelongPromotion(Ljava/lang/String;)Z

    .line 222
    .line 223
    .line 224
    move-result v1

    .line 225
    if-eqz v1, :cond_3

    .line 226
    .line 227
    const-string v1, "SVIP\u9996"

    .line 228
    .line 229
    invoke-virtual {v0, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 230
    .line 231
    .line 232
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/messages/promotion/PrivilegePromotionHeaderView;->getUnitIntervalValue()Ljava/lang/String;

    .line 233
    .line 234
    .line 235
    move-result-object v1

    .line 236
    invoke-virtual {v0, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 237
    .line 238
    .line 239
    invoke-virtual {v0, v8}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 240
    .line 241
    .line 242
    new-instance v1, Landroid/text/SpannableStringBuilder;

    .line 243
    .line 244
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/messages/promotion/PrivilegePromotionHeaderView;->i:Ljava/text/NumberFormat;

    .line 245
    .line 246
    iget-wide v7, p0, Lcom/p1/mobile/putong/core/newui/messages/promotion/PrivilegePromotionHeaderView;->l:D

    .line 247
    .line 248
    iget-wide v11, p0, Lcom/p1/mobile/putong/core/newui/messages/promotion/PrivilegePromotionHeaderView;->m:D

    .line 249
    .line 250
    div-double/2addr v7, v11

    .line 251
    mul-double/2addr v7, v9

    .line 252
    sub-double/2addr v9, v7

    .line 253
    invoke-virtual {v4, v9, v10}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 254
    .line 255
    .line 256
    move-result-object p0

    .line 257
    invoke-direct {v1, p0}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 258
    .line 259
    .line 260
    new-instance p0, Landroid/text/style/ForegroundColorSpan;

    .line 261
    .line 262
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 263
    .line 264
    .line 265
    move-result v2

    .line 266
    invoke-direct {p0, v2}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 267
    .line 268
    .line 269
    invoke-virtual {v1}, Landroid/text/SpannableStringBuilder;->length()I

    .line 270
    .line 271
    .line 272
    move-result v2

    .line 273
    invoke-virtual {v1, p0, v6, v2, v5}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 274
    .line 275
    .line 276
    invoke-virtual {v0, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 277
    .line 278
    .line 279
    invoke-virtual {v0, v3}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 280
    .line 281
    .line 282
    return-object v0

    .line 283
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/promotion/PrivilegePromotionHeaderView;->k:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 284
    .line 285
    const-string v2, "lowPrice3Month"

    .line 286
    .line 287
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/data/Coupon;->isBelongPromotion(Ljava/lang/String;)Z

    .line 288
    .line 289
    .line 290
    move-result v1

    .line 291
    if-eqz v1, :cond_4

    .line 292
    .line 293
    const-string v1, "VIP\u524d3\u4e2a\u6708\u6bcf\u6708"

    .line 294
    .line 295
    invoke-virtual {v0, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 296
    .line 297
    .line 298
    new-instance v1, Landroid/text/SpannableStringBuilder;

    .line 299
    .line 300
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/promotion/PrivilegePromotionHeaderView;->h:Ljava/text/DecimalFormat;

    .line 301
    .line 302
    iget-wide v8, p0, Lcom/p1/mobile/putong/core/newui/messages/promotion/PrivilegePromotionHeaderView;->l:D

    .line 303
    .line 304
    invoke-virtual {v2, v8, v9}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 305
    .line 306
    .line 307
    move-result-object p0

    .line 308
    invoke-direct {v1, p0}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 309
    .line 310
    .line 311
    new-instance p0, Landroid/text/style/ForegroundColorSpan;

    .line 312
    .line 313
    invoke-static {v7}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 314
    .line 315
    .line 316
    move-result v2

    .line 317
    invoke-direct {p0, v2}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 318
    .line 319
    .line 320
    invoke-virtual {v1}, Landroid/text/SpannableStringBuilder;->length()I

    .line 321
    .line 322
    .line 323
    move-result v2

    .line 324
    invoke-virtual {v1, p0, v6, v2, v5}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 325
    .line 326
    .line 327
    invoke-virtual {v0, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 328
    .line 329
    .line 330
    invoke-virtual {v0, v4}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 331
    .line 332
    .line 333
    :cond_4
    return-object v0
.end method

.method private getUnitIntervalValue()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/promotion/PrivilegePromotionHeaderView;->j:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, "\u6708"

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Merchandise;->quantityName()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method


# virtual methods
.method public b(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/se90;->b(Lcom/p1/mobile/putong/core/newui/messages/promotion/PrivilegePromotionHeaderView;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final c(Ljava/lang/String;)Ljava/lang/CharSequence;
    .locals 1

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "\u4f18\u60e0"

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string p1, "\u540e\u8fc7\u671f"

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    return-object p0
.end method

.method public final d()V
    .locals 2

    return-void

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/promotion/PrivilegePromotionHeaderView;->d:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/promotion/PrivilegePromotionHeaderView;->f:Lv/VText;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 18
    .line 19
    .line 20
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/promotion/PrivilegePromotionHeaderView;->b:Lv/VDraweeView;

    .line 23
    .line 24
    const-string v1, "https://auto.tancdn.com/v1/images/eyJpZCI6IjdTWU9MU0pMVElLTlhVTEMyWkFZQ0lOQTJNMjVFQjE0IiwidyI6MTA1MywiaCI6MjE2LCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6Njk5ODk4MDk4NzAwNDY1MzYwMH0.png"

    .line 25
    .line 26
    invoke-virtual {v0, p0, v1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final e()V
    .locals 4

    return-void

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/promotion/PrivilegePromotionHeaderView;->e:Lv/VText;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/promotion/PrivilegePromotionHeaderView;->k:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/messages/promotion/PrivilegePromotionHeaderView;->getAct()Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/promotion/PrivilegePromotionHeaderView;->k:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 21
    .line 22
    invoke-static {v1}, Ll/g2f;->c(Lcom/p1/mobile/putong/core/data/Coupon;)Ll/pf60;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/promotion/PrivilegePromotionHeaderView;->e:Lv/VText;

    .line 27
    .line 28
    iget-object v3, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 29
    .line 30
    check-cast v3, Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {p0, v3}, Lcom/p1/mobile/putong/core/newui/messages/promotion/PrivilegePromotionHeaderView;->c(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 37
    .line 38
    .line 39
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/promotion/PrivilegePromotionHeaderView;->n:Ljava/lang/Runnable;

    .line 40
    .line 41
    invoke-static {v2}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 42
    .line 43
    .line 44
    iget-object v1, v1, Ll/pf60;->a:Ljava/lang/Object;

    .line 45
    .line 46
    check-cast v1, Ljava/lang/Boolean;

    .line 47
    .line 48
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    if-eqz v1, :cond_2

    .line 53
    .line 54
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/promotion/PrivilegePromotionHeaderView;->n:Ljava/lang/Runnable;

    .line 55
    .line 56
    const-wide/16 v1, 0x3e8

    .line 57
    .line 58
    invoke-static {v0, p0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 59
    .line 60
    .line 61
    :cond_2
    :goto_0
    return-void
.end method

.method public f()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/promotion/PrivilegePromotionHeaderView;->n:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-static {p0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/promotion/PrivilegePromotionHeaderView;->f()V

    .line 5
    .line 6
    .line 7
    return-void
.end method
