.class public Ll/ik40;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting;Landroid/view/View;)V
    .locals 7

    .line 1
    check-cast p1, Landroid/view/ViewGroup;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    check-cast v1, Lv/VListCell;

    .line 9
    .line 10
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting;->c:Lv/VListCell;

    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    check-cast v2, Lv/VFrame;

    .line 18
    .line 19
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting;->d:Lv/VFrame;

    .line 20
    .line 21
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    check-cast v2, Landroid/view/ViewGroup;

    .line 26
    .line 27
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    check-cast v2, Landroid/widget/ImageView;

    .line 32
    .line 33
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting;->e:Landroid/widget/ImageView;

    .line 34
    .line 35
    const/4 v2, 0x2

    .line 36
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    check-cast v3, Lv/VFrame;

    .line 41
    .line 42
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting;->f:Lv/VFrame;

    .line 43
    .line 44
    const/4 v3, 0x3

    .line 45
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 46
    .line 47
    .line 48
    move-result-object v4

    .line 49
    check-cast v4, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;

    .line 50
    .line 51
    iput-object v4, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting;->g:Lcom/p1/mobile/putong/core/view/CommonLabelShowView;

    .line 52
    .line 53
    const/4 v4, 0x4

    .line 54
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 55
    .line 56
    .line 57
    move-result-object v5

    .line 58
    check-cast v5, Landroid/view/ViewGroup;

    .line 59
    .line 60
    invoke-virtual {v5, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 61
    .line 62
    .line 63
    move-result-object v5

    .line 64
    check-cast v5, Landroid/widget/TextView;

    .line 65
    .line 66
    iput-object v5, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting;->h:Landroid/widget/TextView;

    .line 67
    .line 68
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 69
    .line 70
    .line 71
    move-result-object v5

    .line 72
    check-cast v5, Landroid/view/ViewGroup;

    .line 73
    .line 74
    invoke-virtual {v5, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 75
    .line 76
    .line 77
    move-result-object v5

    .line 78
    check-cast v5, Lv/VRangeSlider;

    .line 79
    .line 80
    iput-object v5, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting;->i:Lv/VRangeSlider;

    .line 81
    .line 82
    const/4 v5, 0x5

    .line 83
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 84
    .line 85
    .line 86
    move-result-object v6

    .line 87
    check-cast v6, Landroid/view/ViewGroup;

    .line 88
    .line 89
    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 90
    .line 91
    .line 92
    move-result-object v6

    .line 93
    check-cast v6, Landroid/view/ViewGroup;

    .line 94
    .line 95
    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 96
    .line 97
    .line 98
    move-result-object v6

    .line 99
    check-cast v6, Lv/VText;

    .line 100
    .line 101
    iput-object v6, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting;->j:Lv/VText;

    .line 102
    .line 103
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 104
    .line 105
    .line 106
    move-result-object v6

    .line 107
    check-cast v6, Landroid/view/ViewGroup;

    .line 108
    .line 109
    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 110
    .line 111
    .line 112
    move-result-object v6

    .line 113
    check-cast v6, Landroid/view/ViewGroup;

    .line 114
    .line 115
    invoke-virtual {v6, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 116
    .line 117
    .line 118
    move-result-object v6

    .line 119
    check-cast v6, Landroid/widget/TextView;

    .line 120
    .line 121
    iput-object v6, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting;->k:Landroid/widget/TextView;

    .line 122
    .line 123
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 124
    .line 125
    .line 126
    move-result-object v6

    .line 127
    check-cast v6, Landroid/view/ViewGroup;

    .line 128
    .line 129
    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 130
    .line 131
    .line 132
    move-result-object v6

    .line 133
    check-cast v6, Landroid/view/ViewGroup;

    .line 134
    .line 135
    invoke-virtual {v6, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 136
    .line 137
    .line 138
    move-result-object v6

    .line 139
    check-cast v6, Lv/VSlider;

    .line 140
    .line 141
    iput-object v6, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting;->l:Lv/VSlider;

    .line 142
    .line 143
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 144
    .line 145
    .line 146
    move-result-object v6

    .line 147
    check-cast v6, Landroid/view/ViewGroup;

    .line 148
    .line 149
    invoke-virtual {v6, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 150
    .line 151
    .line 152
    move-result-object v6

    .line 153
    check-cast v6, Lv/VListCell;

    .line 154
    .line 155
    iput-object v6, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting;->m:Lv/VListCell;

    .line 156
    .line 157
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 158
    .line 159
    .line 160
    move-result-object v6

    .line 161
    check-cast v6, Landroid/view/ViewGroup;

    .line 162
    .line 163
    invoke-virtual {v6, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 164
    .line 165
    .line 166
    move-result-object v3

    .line 167
    check-cast v3, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/FilterSwitchCell;

    .line 168
    .line 169
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting;->n:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/FilterSwitchCell;

    .line 170
    .line 171
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 172
    .line 173
    .line 174
    move-result-object v3

    .line 175
    check-cast v3, Landroid/view/ViewGroup;

    .line 176
    .line 177
    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 178
    .line 179
    .line 180
    move-result-object v3

    .line 181
    check-cast v3, Lv/VFrame;

    .line 182
    .line 183
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting;->o:Lv/VFrame;

    .line 184
    .line 185
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 186
    .line 187
    .line 188
    move-result-object v3

    .line 189
    check-cast v3, Landroid/view/ViewGroup;

    .line 190
    .line 191
    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 192
    .line 193
    .line 194
    move-result-object v3

    .line 195
    check-cast v3, Landroid/view/ViewGroup;

    .line 196
    .line 197
    invoke-virtual {v3, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 198
    .line 199
    .line 200
    move-result-object v3

    .line 201
    check-cast v3, Landroid/widget/TextView;

    .line 202
    .line 203
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting;->p:Landroid/widget/TextView;

    .line 204
    .line 205
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 206
    .line 207
    .line 208
    move-result-object v3

    .line 209
    check-cast v3, Landroid/view/ViewGroup;

    .line 210
    .line 211
    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 212
    .line 213
    .line 214
    move-result-object v3

    .line 215
    check-cast v3, Landroid/view/ViewGroup;

    .line 216
    .line 217
    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 218
    .line 219
    .line 220
    move-result-object v3

    .line 221
    check-cast v3, Lv/VSlider;

    .line 222
    .line 223
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting;->q:Lv/VSlider;

    .line 224
    .line 225
    const/4 v3, 0x6

    .line 226
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 227
    .line 228
    .line 229
    move-result-object v4

    .line 230
    check-cast v4, Lv/VLinear;

    .line 231
    .line 232
    iput-object v4, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting;->r:Lv/VLinear;

    .line 233
    .line 234
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 235
    .line 236
    .line 237
    move-result-object v3

    .line 238
    check-cast v3, Landroid/view/ViewGroup;

    .line 239
    .line 240
    invoke-virtual {v3, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 241
    .line 242
    .line 243
    move-result-object v3

    .line 244
    check-cast v3, Lv/VListCell;

    .line 245
    .line 246
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting;->s:Lv/VListCell;

    .line 247
    .line 248
    const/4 v3, 0x7

    .line 249
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 250
    .line 251
    .line 252
    move-result-object v3

    .line 253
    check-cast v3, Landroid/view/ViewGroup;

    .line 254
    .line 255
    invoke-virtual {v3, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 256
    .line 257
    .line 258
    move-result-object v3

    .line 259
    check-cast v3, Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;

    .line 260
    .line 261
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting;->t:Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;

    .line 262
    .line 263
    const/16 v3, 0x8

    .line 264
    .line 265
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 266
    .line 267
    .line 268
    move-result-object v4

    .line 269
    check-cast v4, Landroid/view/ViewGroup;

    .line 270
    .line 271
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 272
    .line 273
    .line 274
    move-result-object v0

    .line 275
    check-cast v0, Lv/VText;

    .line 276
    .line 277
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting;->u:Lv/VText;

    .line 278
    .line 279
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 280
    .line 281
    .line 282
    move-result-object v0

    .line 283
    check-cast v0, Landroid/view/ViewGroup;

    .line 284
    .line 285
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 286
    .line 287
    .line 288
    move-result-object v0

    .line 289
    check-cast v0, Lv/VListCell;

    .line 290
    .line 291
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting;->v:Lv/VListCell;

    .line 292
    .line 293
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 294
    .line 295
    .line 296
    move-result-object v0

    .line 297
    check-cast v0, Landroid/view/ViewGroup;

    .line 298
    .line 299
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 300
    .line 301
    .line 302
    move-result-object v0

    .line 303
    check-cast v0, Lv/VLinear;

    .line 304
    .line 305
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting;->w:Lv/VLinear;

    .line 306
    .line 307
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 308
    .line 309
    .line 310
    move-result-object p1

    .line 311
    check-cast p1, Landroid/view/ViewGroup;

    .line 312
    .line 313
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 314
    .line 315
    .line 316
    move-result-object p1

    .line 317
    check-cast p1, Landroid/view/ViewGroup;

    .line 318
    .line 319
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 320
    .line 321
    .line 322
    move-result-object p1

    .line 323
    check-cast p1, Lv/VListCell;

    .line 324
    .line 325
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting;->x:Lv/VListCell;

    .line 326
    .line 327
    return-void
.end method
