.class public Ll/jax$c;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/jax;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "c"
.end annotation


# direct methods
.method public static bridge synthetic a(Ll/jax;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/jax$c;->c(Ll/jax;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method public static b(Ll/jax;Landroid/view/View;)V
    .locals 5

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 3
    .line 4
    invoke-static {p0, v0}, Ll/jax;->O(Ll/jax;Landroidx/constraintlayout/widget/ConstraintLayout;)V

    .line 5
    .line 6
    .line 7
    check-cast p1, Landroid/view/ViewGroup;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    check-cast v1, Lcom/tantan/library/svga/SVGAnimationView;

    .line 15
    .line 16
    invoke-static {p0, v1}, Ll/jax;->R(Ll/jax;Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 17
    .line 18
    .line 19
    const/4 v1, 0x1

    .line 20
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    check-cast v2, Lv/VRelative;

    .line 25
    .line 26
    invoke-static {p0, v2}, Ll/jax;->F(Ll/jax;Lv/VRelative;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    check-cast v2, Landroid/view/ViewGroup;

    .line 34
    .line 35
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    check-cast v2, Lv/VDraweeView;

    .line 40
    .line 41
    invoke-static {p0, v2}, Ll/jax;->E(Ll/jax;Lv/VDraweeView;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    check-cast v2, Landroid/view/ViewGroup;

    .line 49
    .line 50
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    check-cast v2, Lv/VImage;

    .line 55
    .line 56
    invoke-static {p0, v2}, Ll/jax;->P(Ll/jax;Lv/VImage;)V

    .line 57
    .line 58
    .line 59
    const/4 v2, 0x2

    .line 60
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    check-cast v3, Landroidx/constraintlayout/widget/Guideline;

    .line 65
    .line 66
    invoke-static {p0, v3}, Ll/jax;->C(Ll/jax;Landroidx/constraintlayout/widget/Guideline;)V

    .line 67
    .line 68
    .line 69
    const/4 v3, 0x3

    .line 70
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 71
    .line 72
    .line 73
    move-result-object v4

    .line 74
    check-cast v4, Lv/VRelative;

    .line 75
    .line 76
    invoke-static {p0, v4}, Ll/jax;->H(Ll/jax;Lv/VRelative;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 80
    .line 81
    .line 82
    move-result-object v4

    .line 83
    check-cast v4, Landroid/view/ViewGroup;

    .line 84
    .line 85
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 86
    .line 87
    .line 88
    move-result-object v4

    .line 89
    check-cast v4, Lv/VDraweeView;

    .line 90
    .line 91
    invoke-static {p0, v4}, Ll/jax;->G(Ll/jax;Lv/VDraweeView;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 95
    .line 96
    .line 97
    move-result-object v4

    .line 98
    check-cast v4, Landroid/view/ViewGroup;

    .line 99
    .line 100
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 101
    .line 102
    .line 103
    move-result-object v4

    .line 104
    check-cast v4, Lv/VImage;

    .line 105
    .line 106
    invoke-static {p0, v4}, Ll/jax;->Q(Ll/jax;Lv/VImage;)V

    .line 107
    .line 108
    .line 109
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 110
    .line 111
    .line 112
    move-result-object v4

    .line 113
    check-cast v4, Landroid/view/ViewGroup;

    .line 114
    .line 115
    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 116
    .line 117
    .line 118
    move-result-object v4

    .line 119
    check-cast v4, Lv/VFrame;

    .line 120
    .line 121
    invoke-static {p0, v4}, Ll/jax;->K(Ll/jax;Lv/VFrame;)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 125
    .line 126
    .line 127
    move-result-object v4

    .line 128
    check-cast v4, Landroid/view/ViewGroup;

    .line 129
    .line 130
    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 131
    .line 132
    .line 133
    move-result-object v4

    .line 134
    check-cast v4, Landroid/view/ViewGroup;

    .line 135
    .line 136
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 137
    .line 138
    .line 139
    move-result-object v4

    .line 140
    check-cast v4, Lv/VIcon;

    .line 141
    .line 142
    invoke-static {p0, v4}, Ll/jax;->M(Ll/jax;Lv/VIcon;)V

    .line 143
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
    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 152
    .line 153
    .line 154
    move-result-object v2

    .line 155
    check-cast v2, Landroid/view/ViewGroup;

    .line 156
    .line 157
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 158
    .line 159
    .line 160
    move-result-object v2

    .line 161
    check-cast v2, Lv/VIcon;

    .line 162
    .line 163
    invoke-static {p0, v2}, Ll/jax;->L(Ll/jax;Lv/VIcon;)V

    .line 164
    .line 165
    .line 166
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 167
    .line 168
    .line 169
    move-result-object v2

    .line 170
    check-cast v2, Landroid/view/ViewGroup;

    .line 171
    .line 172
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 173
    .line 174
    .line 175
    move-result-object v2

    .line 176
    invoke-static {p0, v2}, Ll/jax;->J(Ll/jax;Landroid/view/View;)V

    .line 177
    .line 178
    .line 179
    const/4 v2, 0x4

    .line 180
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 181
    .line 182
    .line 183
    move-result-object v2

    .line 184
    check-cast v2, Landroid/widget/TextView;

    .line 185
    .line 186
    invoke-static {p0, v2}, Ll/jax;->S(Ll/jax;Landroid/widget/TextView;)V

    .line 187
    .line 188
    .line 189
    const/4 v2, 0x5

    .line 190
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 191
    .line 192
    .line 193
    move-result-object v3

    .line 194
    check-cast v3, Landroid/widget/LinearLayout;

    .line 195
    .line 196
    invoke-static {p0, v3}, Ll/jax;->I(Ll/jax;Landroid/widget/LinearLayout;)V

    .line 197
    .line 198
    .line 199
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 200
    .line 201
    .line 202
    move-result-object v3

    .line 203
    check-cast v3, Landroid/view/ViewGroup;

    .line 204
    .line 205
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 206
    .line 207
    .line 208
    move-result-object v3

    .line 209
    check-cast v3, Lv/VRecyclerView;

    .line 210
    .line 211
    invoke-static {p0, v3}, Ll/jax;->N(Ll/jax;Lv/VRecyclerView;)V

    .line 212
    .line 213
    .line 214
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 215
    .line 216
    .line 217
    move-result-object v3

    .line 218
    check-cast v3, Landroid/view/ViewGroup;

    .line 219
    .line 220
    invoke-virtual {v3, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 221
    .line 222
    .line 223
    move-result-object v3

    .line 224
    check-cast v3, Landroid/widget/LinearLayout;

    .line 225
    .line 226
    invoke-static {p0, v3}, Ll/jax;->z(Ll/jax;Landroid/widget/LinearLayout;)V

    .line 227
    .line 228
    .line 229
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 230
    .line 231
    .line 232
    move-result-object v3

    .line 233
    check-cast v3, Landroid/view/ViewGroup;

    .line 234
    .line 235
    invoke-virtual {v3, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 236
    .line 237
    .line 238
    move-result-object v3

    .line 239
    check-cast v3, Landroid/view/ViewGroup;

    .line 240
    .line 241
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 242
    .line 243
    .line 244
    move-result-object v3

    .line 245
    check-cast v3, Landroid/view/ViewGroup;

    .line 246
    .line 247
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 248
    .line 249
    .line 250
    move-result-object v3

    .line 251
    check-cast v3, Lv/VImage;

    .line 252
    .line 253
    invoke-static {p0, v3}, Ll/jax;->A(Ll/jax;Lv/VImage;)V

    .line 254
    .line 255
    .line 256
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 257
    .line 258
    .line 259
    move-result-object v2

    .line 260
    check-cast v2, Landroid/view/ViewGroup;

    .line 261
    .line 262
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 263
    .line 264
    .line 265
    move-result-object v2

    .line 266
    check-cast v2, Landroid/view/ViewGroup;

    .line 267
    .line 268
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 269
    .line 270
    .line 271
    move-result-object v2

    .line 272
    check-cast v2, Landroid/view/ViewGroup;

    .line 273
    .line 274
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 275
    .line 276
    .line 277
    move-result-object v2

    .line 278
    check-cast v2, Lv/VText;

    .line 279
    .line 280
    invoke-static {p0, v2}, Ll/jax;->B(Ll/jax;Lv/VText;)V

    .line 281
    .line 282
    .line 283
    const/4 v2, 0x6

    .line 284
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 285
    .line 286
    .line 287
    move-result-object v3

    .line 288
    check-cast v3, Landroid/widget/LinearLayout;

    .line 289
    .line 290
    invoke-static {p0, v3}, Ll/jax;->u(Ll/jax;Landroid/widget/LinearLayout;)V

    .line 291
    .line 292
    .line 293
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 294
    .line 295
    .line 296
    move-result-object v3

    .line 297
    check-cast v3, Landroid/view/ViewGroup;

    .line 298
    .line 299
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 300
    .line 301
    .line 302
    move-result-object v3

    .line 303
    check-cast v3, Landroid/widget/LinearLayout;

    .line 304
    .line 305
    invoke-static {p0, v3}, Ll/jax;->x(Ll/jax;Landroid/widget/LinearLayout;)V

    .line 306
    .line 307
    .line 308
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 309
    .line 310
    .line 311
    move-result-object v3

    .line 312
    check-cast v3, Landroid/view/ViewGroup;

    .line 313
    .line 314
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 315
    .line 316
    .line 317
    move-result-object v3

    .line 318
    check-cast v3, Landroid/view/ViewGroup;

    .line 319
    .line 320
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 321
    .line 322
    .line 323
    move-result-object v0

    .line 324
    check-cast v0, Lv/VText;

    .line 325
    .line 326
    invoke-static {p0, v0}, Ll/jax;->w(Ll/jax;Lv/VText;)V

    .line 327
    .line 328
    .line 329
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 330
    .line 331
    .line 332
    move-result-object v0

    .line 333
    check-cast v0, Landroid/view/ViewGroup;

    .line 334
    .line 335
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 336
    .line 337
    .line 338
    move-result-object v0

    .line 339
    check-cast v0, Lv/VRecyclerView;

    .line 340
    .line 341
    invoke-static {p0, v0}, Ll/jax;->y(Ll/jax;Lv/VRecyclerView;)V

    .line 342
    .line 343
    .line 344
    const/4 v0, 0x7

    .line 345
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 346
    .line 347
    .line 348
    move-result-object p1

    .line 349
    check-cast p1, Lv/VButton_FakeShadow;

    .line 350
    .line 351
    invoke-static {p0, p1}, Ll/jax;->v(Ll/jax;Lv/VButton_FakeShadow;)V

    .line 352
    .line 353
    .line 354
    return-void
.end method

.method public static c(Ll/jax;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/kec0;->g7:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-static {p0, p1}, Ll/jax$c;->b(Ll/jax;Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    return-object p1
.end method
