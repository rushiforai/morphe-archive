.class public Ll/fur;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lv/VText;

.field public final b:Lv/VImage;


# direct methods
.method public constructor <init>(Lv/VText;Lv/VImage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/fur;->a:Lv/VText;

    .line 5
    .line 6
    iput-object p2, p0, Ll/fur;->b:Lv/VImage;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fur;->a:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Ll/fur;->b:Lv/VImage;

    .line 8
    .line 9
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public b()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fur;->a:Lv/VText;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/fur;->a:Lv/VText;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-nez p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public c()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fur;->b:Lv/VImage;

    .line 2
    .line 3
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public d(Ll/msr;Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;Z)V
    .locals 6

    .line 1
    if-eqz p2, :cond_f

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;->getLiveActivitySummary()Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto/16 :goto_3

    .line 10
    .line 11
    :cond_0
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;->getState()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iget-object v1, p0, Ll/fur;->a:Lv/VText;

    .line 16
    .line 17
    const/4 v2, 0x0

    .line 18
    const/4 v3, 0x5

    .line 19
    if-ne v0, v3, :cond_2

    .line 20
    .line 21
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    instance-of v1, v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 26
    .line 27
    const/16 v3, 0x35

    .line 28
    .line 29
    if-eqz v1, :cond_1

    .line 30
    .line 31
    move-object v1, v0

    .line 32
    check-cast v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 33
    .line 34
    iput v3, v1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 35
    .line 36
    sget v4, Ll/qa00;->m:I

    .line 37
    .line 38
    iput v4, v1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 39
    .line 40
    iget-object v1, p0, Ll/fur;->a:Lv/VText;

    .line 41
    .line 42
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 43
    .line 44
    .line 45
    :cond_1
    iget-object v0, p0, Ll/fur;->b:Lv/VImage;

    .line 46
    .line 47
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    instance-of v1, v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 52
    .line 53
    if-eqz v1, :cond_4

    .line 54
    .line 55
    move-object v1, v0

    .line 56
    check-cast v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 57
    .line 58
    iput v3, v1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 59
    .line 60
    sget v3, Ll/qa00;->m:I

    .line 61
    .line 62
    iput v3, v1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 63
    .line 64
    iget-object v1, p0, Ll/fur;->b:Lv/VImage;

    .line 65
    .line 66
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 67
    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_2
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    instance-of v1, v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 75
    .line 76
    const/16 v3, 0x33

    .line 77
    .line 78
    if-eqz v1, :cond_3

    .line 79
    .line 80
    move-object v1, v0

    .line 81
    check-cast v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 82
    .line 83
    iput v3, v1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 84
    .line 85
    iput v2, v1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 86
    .line 87
    iget-object v1, p0, Ll/fur;->a:Lv/VText;

    .line 88
    .line 89
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 90
    .line 91
    .line 92
    :cond_3
    iget-object v0, p0, Ll/fur;->b:Lv/VImage;

    .line 93
    .line 94
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    instance-of v1, v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 99
    .line 100
    if-eqz v1, :cond_4

    .line 101
    .line 102
    move-object v1, v0

    .line 103
    check-cast v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 104
    .line 105
    iput v3, v1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 106
    .line 107
    sget v3, Ll/qa00;->c:I

    .line 108
    .line 109
    iput v3, v1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 110
    .line 111
    iget-object v1, p0, Ll/fur;->b:Lv/VImage;

    .line 112
    .line 113
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 114
    .line 115
    .line 116
    :cond_4
    :goto_0
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;->needShowActivitiesRedDot()Z

    .line 117
    .line 118
    .line 119
    move-result v0

    .line 120
    const/4 v1, 0x1

    .line 121
    if-eqz v0, :cond_5

    .line 122
    .line 123
    invoke-virtual {p0, v2, p1, p3}, Ll/fur;->f(ZLl/msr;Z)V

    .line 124
    .line 125
    .line 126
    iget-object p1, p0, Ll/fur;->b:Lv/VImage;

    .line 127
    .line 128
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 129
    .line 130
    .line 131
    iget-object p0, p0, Ll/fur;->a:Lv/VText;

    .line 132
    .line 133
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 134
    .line 135
    .line 136
    return-void

    .line 137
    :cond_5
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;->getLiveActivitySummary()Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;

    .line 138
    .line 139
    .line 140
    move-result-object p2

    .line 141
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->description:Lcom/p1/mobile/putong/live/base/data/BLiveActivityDesc;

    .line 142
    .line 143
    iget p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveActivityDesc;->redDotNum:I

    .line 144
    .line 145
    if-nez p2, :cond_6

    .line 146
    .line 147
    iget-object p1, p0, Ll/fur;->a:Lv/VText;

    .line 148
    .line 149
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 150
    .line 151
    .line 152
    iget-object p0, p0, Ll/fur;->b:Lv/VImage;

    .line 153
    .line 154
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 155
    .line 156
    .line 157
    return-void

    .line 158
    :cond_6
    invoke-static {}, Ll/y6u;->e()Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    sget-object v3, Ll/tbs;->b:Ll/vwt;

    .line 163
    .line 164
    invoke-virtual {v3}, Ll/vwt;->s3()Lcom/p1/mobile/putong/live/base/data/BLiveUnreadTypeEnum;

    .line 165
    .line 166
    .line 167
    move-result-object v3

    .line 168
    if-eqz v0, :cond_f

    .line 169
    .line 170
    if-nez v3, :cond_7

    .line 171
    .line 172
    goto/16 :goto_3

    .line 173
    .line 174
    :cond_7
    if-lez p2, :cond_8

    .line 175
    .line 176
    move v0, v1

    .line 177
    goto :goto_1

    .line 178
    :cond_8
    move v0, v2

    .line 179
    :goto_1
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 180
    .line 181
    .line 182
    move-result-object v3

    .line 183
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 184
    .line 185
    .line 186
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 187
    .line 188
    .line 189
    move-result v4

    .line 190
    const/4 v5, -0x1

    .line 191
    sparse-switch v4, :sswitch_data_0

    .line 192
    .line 193
    .line 194
    goto :goto_2

    .line 195
    :sswitch_0
    const-string v4, "liveIcon"

    .line 196
    .line 197
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 198
    .line 199
    .line 200
    move-result v3

    .line 201
    if-nez v3, :cond_9

    .line 202
    .line 203
    goto :goto_2

    .line 204
    :cond_9
    const/4 v5, 0x2

    .line 205
    goto :goto_2

    .line 206
    :sswitch_1
    const-string v4, "redDot"

    .line 207
    .line 208
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 209
    .line 210
    .line 211
    move-result v3

    .line 212
    if-nez v3, :cond_a

    .line 213
    .line 214
    goto :goto_2

    .line 215
    :cond_a
    move v5, v1

    .line 216
    goto :goto_2

    .line 217
    :sswitch_2
    const-string v4, "number"

    .line 218
    .line 219
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 220
    .line 221
    .line 222
    move-result v3

    .line 223
    if-nez v3, :cond_b

    .line 224
    .line 225
    goto :goto_2

    .line 226
    :cond_b
    move v5, v2

    .line 227
    :goto_2
    packed-switch v5, :pswitch_data_0

    .line 228
    .line 229
    .line 230
    goto :goto_3

    .line 231
    :pswitch_0
    iget-object p1, p0, Ll/fur;->a:Lv/VText;

    .line 232
    .line 233
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 234
    .line 235
    .line 236
    if-eqz v0, :cond_c

    .line 237
    .line 238
    iget-object p1, p0, Ll/fur;->a:Lv/VText;

    .line 239
    .line 240
    const-string p2, "LIVE"

    .line 241
    .line 242
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 243
    .line 244
    .line 245
    :cond_c
    iget-object p0, p0, Ll/fur;->b:Lv/VImage;

    .line 246
    .line 247
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 248
    .line 249
    .line 250
    return-void

    .line 251
    :pswitch_1
    if-eqz v0, :cond_d

    .line 252
    .line 253
    invoke-virtual {p0, v2, p1, p3}, Ll/fur;->f(ZLl/msr;Z)V

    .line 254
    .line 255
    .line 256
    :cond_d
    iget-object p1, p0, Ll/fur;->b:Lv/VImage;

    .line 257
    .line 258
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 259
    .line 260
    .line 261
    iget-object p0, p0, Ll/fur;->a:Lv/VText;

    .line 262
    .line 263
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 264
    .line 265
    .line 266
    return-void

    .line 267
    :pswitch_2
    if-eqz v0, :cond_e

    .line 268
    .line 269
    invoke-virtual {p0, v1, p1, p3}, Ll/fur;->f(ZLl/msr;Z)V

    .line 270
    .line 271
    .line 272
    :cond_e
    iget-object p1, p0, Ll/fur;->a:Lv/VText;

    .line 273
    .line 274
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 275
    .line 276
    .line 277
    invoke-virtual {p0, p2}, Ll/fur;->e(I)V

    .line 278
    .line 279
    .line 280
    iget-object p0, p0, Ll/fur;->b:Lv/VImage;

    .line 281
    .line 282
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 283
    .line 284
    .line 285
    :cond_f
    :goto_3
    return-void

    .line 286
    nop

    .line 287
    :sswitch_data_0
    .sparse-switch
        -0x3da724b7 -> :sswitch_2
        -0x37b9c108 -> :sswitch_1
        0x547b0b85 -> :sswitch_0
    .end sparse-switch

    .line 288
    .line 289
    .line 290
    .line 291
    .line 292
    .line 293
    .line 294
    .line 295
    .line 296
    .line 297
    .line 298
    .line 299
    .line 300
    .line 301
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final e(I)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/fur;->a:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/graphics/drawable/GradientDrawable;

    .line 8
    .line 9
    const/16 v1, 0x63

    .line 10
    .line 11
    const/high16 v2, 0x41100000    # 9.0f

    .line 12
    .line 13
    if-ltz p1, :cond_4

    .line 14
    .line 15
    if-gt p1, v1, :cond_4

    .line 16
    .line 17
    const/16 v1, 0xa

    .line 18
    .line 19
    if-ge p1, v1, :cond_0

    .line 20
    .line 21
    const/4 v1, 0x1

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 v1, 0x0

    .line 24
    :goto_0
    if-eqz v1, :cond_1

    .line 25
    .line 26
    sget v3, Ll/qa00;->j:I

    .line 27
    .line 28
    :goto_1
    int-to-float v3, v3

    .line 29
    goto :goto_2

    .line 30
    :cond_1
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    goto :goto_1

    .line 35
    :goto_2
    invoke-virtual {v0, v3}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Ll/fur;->a:Lv/VText;

    .line 39
    .line 40
    if-eqz v1, :cond_2

    .line 41
    .line 42
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    goto :goto_3

    .line 47
    :cond_2
    sget v3, Ll/qa00;->h:I

    .line 48
    .line 49
    :goto_3
    iget-object v4, p0, Ll/fur;->a:Lv/VText;

    .line 50
    .line 51
    invoke-virtual {v4}, Landroid/view/View;->getPaddingTop()I

    .line 52
    .line 53
    .line 54
    move-result v4

    .line 55
    if-eqz v1, :cond_3

    .line 56
    .line 57
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    goto :goto_4

    .line 62
    :cond_3
    sget v1, Ll/qa00;->h:I

    .line 63
    .line 64
    :goto_4
    iget-object v2, p0, Ll/fur;->a:Lv/VText;

    .line 65
    .line 66
    invoke-virtual {v2}, Landroid/view/View;->getPaddingBottom()I

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    invoke-virtual {v0, v3, v4, v1, v2}, Landroid/view/View;->setPadding(IIII)V

    .line 71
    .line 72
    .line 73
    iget-object p0, p0, Ll/fur;->a:Lv/VText;

    .line 74
    .line 75
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 80
    .line 81
    .line 82
    return-void

    .line 83
    :cond_4
    if-le p1, v1, :cond_5

    .line 84
    .line 85
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    int-to-float p1, p1

    .line 90
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 91
    .line 92
    .line 93
    iget-object p1, p0, Ll/fur;->a:Lv/VText;

    .line 94
    .line 95
    sget v0, Ll/qa00;->h:I

    .line 96
    .line 97
    invoke-virtual {p1}, Landroid/view/View;->getPaddingTop()I

    .line 98
    .line 99
    .line 100
    move-result v1

    .line 101
    iget-object v2, p0, Ll/fur;->a:Lv/VText;

    .line 102
    .line 103
    invoke-virtual {v2}, Landroid/view/View;->getPaddingBottom()I

    .line 104
    .line 105
    .line 106
    move-result v2

    .line 107
    invoke-virtual {p1, v0, v1, v0, v2}, Landroid/view/View;->setPadding(IIII)V

    .line 108
    .line 109
    .line 110
    iget-object p0, p0, Ll/fur;->a:Lv/VText;

    .line 111
    .line 112
    const-string p1, "99+"

    .line 113
    .line 114
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 115
    .line 116
    .line 117
    return-void

    .line 118
    :cond_5
    iget-object p0, p0, Ll/fur;->a:Lv/VText;

    .line 119
    .line 120
    const/16 p1, 0x8

    .line 121
    .line 122
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 123
    .line 124
    .line 125
    return-void
.end method

.method public final f(ZLl/msr;Z)V
    .locals 3

    .line 1
    if-eqz p3, :cond_4

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/fur;->c()Z

    .line 4
    .line 5
    .line 6
    move-result p3

    .line 7
    invoke-virtual {p0}, Ll/fur;->b()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    const/4 v0, 0x0

    .line 12
    const/4 v1, 0x1

    .line 13
    if-nez p3, :cond_0

    .line 14
    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    move v2, v1

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    move v2, v0

    .line 20
    :goto_0
    if-eqz p1, :cond_1

    .line 21
    .line 22
    if-nez p0, :cond_1

    .line 23
    .line 24
    move p0, v1

    .line 25
    goto :goto_1

    .line 26
    :cond_1
    move p0, v0

    .line 27
    :goto_1
    if-nez p1, :cond_2

    .line 28
    .line 29
    if-nez p3, :cond_2

    .line 30
    .line 31
    move v0, v1

    .line 32
    :cond_2
    if-nez v2, :cond_3

    .line 33
    .line 34
    if-nez p0, :cond_3

    .line 35
    .line 36
    if-eqz v0, :cond_4

    .line 37
    .line 38
    :cond_3
    invoke-virtual {p2}, Ll/msr;->h3()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-static {p0, p1}, Ll/sft;->f(Ljava/lang/String;Z)V

    .line 43
    .line 44
    .line 45
    :cond_4
    return-void
.end method
