.class public Ll/ddg;
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

.method public static a(Ll/cdg;Landroid/view/View;)V
    .locals 5

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 3
    .line 4
    iput-object v0, p0, Ll/cdg;->k:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 5
    .line 6
    check-cast p1, Landroid/view/ViewGroup;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iput-object v1, p0, Ll/cdg;->l:Landroid/view/View;

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    iput-object v2, p0, Ll/cdg;->m:Landroid/view/View;

    .line 21
    .line 22
    const/4 v2, 0x2

    .line 23
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    check-cast v3, Landroid/widget/Space;

    .line 28
    .line 29
    iput-object v3, p0, Ll/cdg;->n:Landroid/widget/Space;

    .line 30
    .line 31
    const/4 v3, 0x3

    .line 32
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    check-cast v3, Lv/VDraweeView;

    .line 37
    .line 38
    iput-object v3, p0, Ll/cdg;->o:Lv/VDraweeView;

    .line 39
    .line 40
    const/4 v3, 0x4

    .line 41
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    check-cast v3, Lv/VDraweeView;

    .line 46
    .line 47
    iput-object v3, p0, Ll/cdg;->p:Lv/VDraweeView;

    .line 48
    .line 49
    const/4 v3, 0x5

    .line 50
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    check-cast v3, Landroid/view/ViewGroup;

    .line 55
    .line 56
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    check-cast v3, Lv/VImage;

    .line 61
    .line 62
    iput-object v3, p0, Ll/cdg;->q:Lv/VImage;

    .line 63
    .line 64
    const/4 v3, 0x6

    .line 65
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 66
    .line 67
    .line 68
    move-result-object v3

    .line 69
    check-cast v3, Lv/VImage;

    .line 70
    .line 71
    iput-object v3, p0, Ll/cdg;->r:Lv/VImage;

    .line 72
    .line 73
    const/4 v3, 0x7

    .line 74
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 75
    .line 76
    .line 77
    move-result-object v3

    .line 78
    check-cast v3, Lv/VImage;

    .line 79
    .line 80
    iput-object v3, p0, Ll/cdg;->s:Lv/VImage;

    .line 81
    .line 82
    const/16 v3, 0x8

    .line 83
    .line 84
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 85
    .line 86
    .line 87
    move-result-object v3

    .line 88
    check-cast v3, Landroid/widget/Space;

    .line 89
    .line 90
    iput-object v3, p0, Ll/cdg;->t:Landroid/widget/Space;

    .line 91
    .line 92
    const/16 v3, 0x9

    .line 93
    .line 94
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 95
    .line 96
    .line 97
    move-result-object v3

    .line 98
    check-cast v3, Landroid/widget/Space;

    .line 99
    .line 100
    iput-object v3, p0, Ll/cdg;->u:Landroid/widget/Space;

    .line 101
    .line 102
    const/16 v3, 0xa

    .line 103
    .line 104
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 105
    .line 106
    .line 107
    move-result-object v3

    .line 108
    iput-object v3, p0, Ll/cdg;->v:Landroid/view/View;

    .line 109
    .line 110
    const/16 v3, 0xb

    .line 111
    .line 112
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 113
    .line 114
    .line 115
    move-result-object v3

    .line 116
    check-cast v3, Lv/VDraweeView;

    .line 117
    .line 118
    iput-object v3, p0, Ll/cdg;->w:Lv/VDraweeView;

    .line 119
    .line 120
    const/16 v3, 0xc

    .line 121
    .line 122
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 123
    .line 124
    .line 125
    move-result-object v3

    .line 126
    iput-object v3, p0, Ll/cdg;->x:Landroid/view/View;

    .line 127
    .line 128
    const/16 v3, 0xd

    .line 129
    .line 130
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 131
    .line 132
    .line 133
    move-result-object v3

    .line 134
    check-cast v3, Lv/VDraweeView;

    .line 135
    .line 136
    iput-object v3, p0, Ll/cdg;->y:Lv/VDraweeView;

    .line 137
    .line 138
    const/16 v3, 0xe

    .line 139
    .line 140
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 141
    .line 142
    .line 143
    move-result-object v3

    .line 144
    check-cast v3, Landroid/view/ViewGroup;

    .line 145
    .line 146
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 147
    .line 148
    .line 149
    move-result-object v3

    .line 150
    check-cast v3, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 151
    .line 152
    iput-object v3, p0, Ll/cdg;->z:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 153
    .line 154
    const/16 v3, 0xf

    .line 155
    .line 156
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 157
    .line 158
    .line 159
    move-result-object v3

    .line 160
    check-cast v3, Lv/VImage;

    .line 161
    .line 162
    iput-object v3, p0, Ll/cdg;->A:Lv/VImage;

    .line 163
    .line 164
    const/16 v3, 0x10

    .line 165
    .line 166
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 167
    .line 168
    .line 169
    move-result-object v3

    .line 170
    check-cast v3, Lv/VImage;

    .line 171
    .line 172
    iput-object v3, p0, Ll/cdg;->B:Lv/VImage;

    .line 173
    .line 174
    const/16 v3, 0x11

    .line 175
    .line 176
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 177
    .line 178
    .line 179
    move-result-object v3

    .line 180
    check-cast v3, Lv/VImage;

    .line 181
    .line 182
    iput-object v3, p0, Ll/cdg;->C:Lv/VImage;

    .line 183
    .line 184
    const/16 v3, 0x12

    .line 185
    .line 186
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 187
    .line 188
    .line 189
    move-result-object v3

    .line 190
    check-cast v3, Landroid/widget/Space;

    .line 191
    .line 192
    iput-object v3, p0, Ll/cdg;->D:Landroid/widget/Space;

    .line 193
    .line 194
    const/16 v3, 0x13

    .line 195
    .line 196
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 197
    .line 198
    .line 199
    move-result-object v3

    .line 200
    check-cast v3, Landroid/widget/TextView;

    .line 201
    .line 202
    iput-object v3, p0, Ll/cdg;->E:Landroid/widget/TextView;

    .line 203
    .line 204
    const/16 v3, 0x14

    .line 205
    .line 206
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 207
    .line 208
    .line 209
    move-result-object v4

    .line 210
    check-cast v4, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyViewGroup;

    .line 211
    .line 212
    iput-object v4, p0, Ll/cdg;->F:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyViewGroup;

    .line 213
    .line 214
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 215
    .line 216
    .line 217
    move-result-object v4

    .line 218
    check-cast v4, Landroid/view/ViewGroup;

    .line 219
    .line 220
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 221
    .line 222
    .line 223
    move-result-object v0

    .line 224
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;

    .line 225
    .line 226
    iput-object v0, p0, Ll/cdg;->G:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;

    .line 227
    .line 228
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 229
    .line 230
    .line 231
    move-result-object v0

    .line 232
    check-cast v0, Landroid/view/ViewGroup;

    .line 233
    .line 234
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 235
    .line 236
    .line 237
    move-result-object v0

    .line 238
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;

    .line 239
    .line 240
    iput-object v0, p0, Ll/cdg;->H:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;

    .line 241
    .line 242
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 243
    .line 244
    .line 245
    move-result-object v0

    .line 246
    check-cast v0, Landroid/view/ViewGroup;

    .line 247
    .line 248
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 249
    .line 250
    .line 251
    move-result-object v0

    .line 252
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;

    .line 253
    .line 254
    iput-object v0, p0, Ll/cdg;->I:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;

    .line 255
    .line 256
    const/16 v0, 0x15

    .line 257
    .line 258
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 259
    .line 260
    .line 261
    move-result-object v0

    .line 262
    check-cast v0, Lcom/p1/mobile/putong/live/base/view/ClipRoundImageView;

    .line 263
    .line 264
    iput-object v0, p0, Ll/cdg;->J:Lcom/p1/mobile/putong/live/base/view/ClipRoundImageView;

    .line 265
    .line 266
    const/16 v0, 0x16

    .line 267
    .line 268
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 269
    .line 270
    .line 271
    move-result-object v0

    .line 272
    check-cast v0, Landroid/widget/TextView;

    .line 273
    .line 274
    iput-object v0, p0, Ll/cdg;->K:Landroid/widget/TextView;

    .line 275
    .line 276
    const/16 v0, 0x17

    .line 277
    .line 278
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 279
    .line 280
    .line 281
    move-result-object v0

    .line 282
    check-cast v0, Landroid/widget/Space;

    .line 283
    .line 284
    iput-object v0, p0, Ll/cdg;->L:Landroid/widget/Space;

    .line 285
    .line 286
    const/16 v0, 0x19

    .line 287
    .line 288
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 289
    .line 290
    .line 291
    move-result-object p1

    .line 292
    check-cast p1, Landroid/widget/TextView;

    .line 293
    .line 294
    iput-object p1, p0, Ll/cdg;->M:Landroid/widget/TextView;

    .line 295
    .line 296
    return-void
.end method
