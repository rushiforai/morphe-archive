.class public Ll/px20;
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

.method public static a(Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterBaseSetting;Landroid/view/View;)V
    .locals 5

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
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterBaseSetting;->c:Lv/VListCell;

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
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterBaseSetting;->d:Lv/VFrame;

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
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterBaseSetting;->e:Landroid/widget/ImageView;

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
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterBaseSetting;->f:Lv/VFrame;

    .line 43
    .line 44
    const/4 v3, 0x3

    .line 45
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    check-cast v3, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;

    .line 50
    .line 51
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterBaseSetting;->g:Lcom/p1/mobile/putong/core/view/CommonLabelShowView;

    .line 52
    .line 53
    const/4 v3, 0x4

    .line 54
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    check-cast v3, Landroid/view/ViewGroup;

    .line 59
    .line 60
    invoke-virtual {v3, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    check-cast v3, Landroid/widget/TextView;

    .line 65
    .line 66
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterBaseSetting;->h:Landroid/widget/TextView;

    .line 67
    .line 68
    const/4 v3, 0x5

    .line 69
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    check-cast v3, Lv/VRangeSlider;

    .line 74
    .line 75
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterBaseSetting;->i:Lv/VRangeSlider;

    .line 76
    .line 77
    const/4 v3, 0x6

    .line 78
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 79
    .line 80
    .line 81
    move-result-object v4

    .line 82
    check-cast v4, Landroid/view/ViewGroup;

    .line 83
    .line 84
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 85
    .line 86
    .line 87
    move-result-object v4

    .line 88
    check-cast v4, Lv/VText;

    .line 89
    .line 90
    iput-object v4, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterBaseSetting;->j:Lv/VText;

    .line 91
    .line 92
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 93
    .line 94
    .line 95
    move-result-object v3

    .line 96
    check-cast v3, Landroid/view/ViewGroup;

    .line 97
    .line 98
    invoke-virtual {v3, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 99
    .line 100
    .line 101
    move-result-object v3

    .line 102
    check-cast v3, Landroid/widget/TextView;

    .line 103
    .line 104
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterBaseSetting;->k:Landroid/widget/TextView;

    .line 105
    .line 106
    const/4 v3, 0x7

    .line 107
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 108
    .line 109
    .line 110
    move-result-object v3

    .line 111
    check-cast v3, Lv/VSlider;

    .line 112
    .line 113
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterBaseSetting;->l:Lv/VSlider;

    .line 114
    .line 115
    const/16 v3, 0x8

    .line 116
    .line 117
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 118
    .line 119
    .line 120
    move-result-object v3

    .line 121
    check-cast v3, Lv/VListCell;

    .line 122
    .line 123
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterBaseSetting;->m:Lv/VListCell;

    .line 124
    .line 125
    const/16 v3, 0x9

    .line 126
    .line 127
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 128
    .line 129
    .line 130
    move-result-object v3

    .line 131
    check-cast v3, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/FilterSwitchCell;

    .line 132
    .line 133
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterBaseSetting;->n:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/FilterSwitchCell;

    .line 134
    .line 135
    const/16 v3, 0xa

    .line 136
    .line 137
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 138
    .line 139
    .line 140
    move-result-object v4

    .line 141
    check-cast v4, Landroid/widget/FrameLayout;

    .line 142
    .line 143
    iput-object v4, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterBaseSetting;->o:Landroid/widget/FrameLayout;

    .line 144
    .line 145
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 146
    .line 147
    .line 148
    move-result-object v4

    .line 149
    check-cast v4, Landroid/view/ViewGroup;

    .line 150
    .line 151
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 152
    .line 153
    .line 154
    move-result-object v4

    .line 155
    check-cast v4, Landroid/widget/TextView;

    .line 156
    .line 157
    iput-object v4, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterBaseSetting;->p:Landroid/widget/TextView;

    .line 158
    .line 159
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 160
    .line 161
    .line 162
    move-result-object v3

    .line 163
    check-cast v3, Landroid/view/ViewGroup;

    .line 164
    .line 165
    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 166
    .line 167
    .line 168
    move-result-object v2

    .line 169
    check-cast v2, Lv/VSlider;

    .line 170
    .line 171
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterBaseSetting;->q:Lv/VSlider;

    .line 172
    .line 173
    const/16 v2, 0xb

    .line 174
    .line 175
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 176
    .line 177
    .line 178
    move-result-object v3

    .line 179
    check-cast v3, Lv/VLinear;

    .line 180
    .line 181
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterBaseSetting;->r:Lv/VLinear;

    .line 182
    .line 183
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 184
    .line 185
    .line 186
    move-result-object v2

    .line 187
    check-cast v2, Landroid/view/ViewGroup;

    .line 188
    .line 189
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 190
    .line 191
    .line 192
    move-result-object v2

    .line 193
    check-cast v2, Lv/VListCell;

    .line 194
    .line 195
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterBaseSetting;->s:Lv/VListCell;

    .line 196
    .line 197
    const/16 v2, 0xc

    .line 198
    .line 199
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 200
    .line 201
    .line 202
    move-result-object v3

    .line 203
    check-cast v3, Lv/VLinear;

    .line 204
    .line 205
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterBaseSetting;->t:Lv/VLinear;

    .line 206
    .line 207
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 208
    .line 209
    .line 210
    move-result-object v3

    .line 211
    check-cast v3, Landroid/view/ViewGroup;

    .line 212
    .line 213
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 214
    .line 215
    .line 216
    move-result-object v0

    .line 217
    check-cast v0, Lv/VText;

    .line 218
    .line 219
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterBaseSetting;->u:Lv/VText;

    .line 220
    .line 221
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 222
    .line 223
    .line 224
    move-result-object v0

    .line 225
    check-cast v0, Landroid/view/ViewGroup;

    .line 226
    .line 227
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 228
    .line 229
    .line 230
    move-result-object v0

    .line 231
    check-cast v0, Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;

    .line 232
    .line 233
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterBaseSetting;->v:Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;

    .line 234
    .line 235
    const/16 v0, 0xe

    .line 236
    .line 237
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 238
    .line 239
    .line 240
    move-result-object v0

    .line 241
    check-cast v0, Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;

    .line 242
    .line 243
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterBaseSetting;->w:Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;

    .line 244
    .line 245
    const/16 v0, 0xf

    .line 246
    .line 247
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 248
    .line 249
    .line 250
    move-result-object v0

    .line 251
    check-cast v0, Lv/VText;

    .line 252
    .line 253
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterBaseSetting;->x:Lv/VText;

    .line 254
    .line 255
    const/16 v0, 0x10

    .line 256
    .line 257
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 258
    .line 259
    .line 260
    move-result-object v0

    .line 261
    check-cast v0, Lv/VListCell;

    .line 262
    .line 263
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterBaseSetting;->y:Lv/VListCell;

    .line 264
    .line 265
    const/16 v0, 0x11

    .line 266
    .line 267
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 268
    .line 269
    .line 270
    move-result-object v0

    .line 271
    check-cast v0, Lv/VListCell;

    .line 272
    .line 273
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterBaseSetting;->z:Lv/VListCell;

    .line 274
    .line 275
    const/16 v0, 0x12

    .line 276
    .line 277
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 278
    .line 279
    .line 280
    move-result-object v0

    .line 281
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterBaseSetting;->A:Landroid/view/View;

    .line 282
    .line 283
    const/16 v0, 0x13

    .line 284
    .line 285
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 286
    .line 287
    .line 288
    move-result-object v0

    .line 289
    check-cast v0, Lv/VText;

    .line 290
    .line 291
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterBaseSetting;->B:Lv/VText;

    .line 292
    .line 293
    const/16 v0, 0x14

    .line 294
    .line 295
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 296
    .line 297
    .line 298
    move-result-object p1

    .line 299
    check-cast p1, Lv/VListCell;

    .line 300
    .line 301
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterBaseSetting;->C:Lv/VListCell;

    .line 302
    .line 303
    return-void
.end method
