.class public Ll/k0e0;
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

.method public static a(Lcom/p1/mobile/putong/core/ui/sayHi/view/SayHiDialogContainer;Landroid/view/View;)V
    .locals 5

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lcom/p1/mobile/putong/core/ui/sayHi/view/SayHiDialogContainer;

    .line 3
    .line 4
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/sayHi/view/SayHiDialogContainer;->a:Lcom/p1/mobile/putong/core/ui/sayHi/view/SayHiDialogContainer;

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
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/sayHi/view/SayHiDialogContainer;->b:Landroid/view/View;

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
    check-cast v2, Landroid/widget/RelativeLayout;

    .line 21
    .line 22
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/sayHi/view/SayHiDialogContainer;->c:Landroid/widget/RelativeLayout;

    .line 23
    .line 24
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    check-cast v2, Landroid/view/ViewGroup;

    .line 29
    .line 30
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    check-cast v2, Lcom/tantan/library/svga/SVGAnimationView;

    .line 35
    .line 36
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/sayHi/view/SayHiDialogContainer;->d:Lcom/tantan/library/svga/SVGAnimationView;

    .line 37
    .line 38
    const/4 v2, 0x2

    .line 39
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    check-cast v3, Landroid/widget/RelativeLayout;

    .line 44
    .line 45
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/sayHi/view/SayHiDialogContainer;->e:Landroid/widget/RelativeLayout;

    .line 46
    .line 47
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    check-cast v3, Landroid/view/ViewGroup;

    .line 52
    .line 53
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    check-cast v3, Lv/VImage;

    .line 58
    .line 59
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/sayHi/view/SayHiDialogContainer;->f:Lv/VImage;

    .line 60
    .line 61
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 62
    .line 63
    .line 64
    move-result-object v3

    .line 65
    check-cast v3, Landroid/view/ViewGroup;

    .line 66
    .line 67
    invoke-virtual {v3, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 68
    .line 69
    .line 70
    move-result-object v3

    .line 71
    check-cast v3, Lcom/tantan/library/svga/SVGAnimationView;

    .line 72
    .line 73
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/sayHi/view/SayHiDialogContainer;->g:Lcom/tantan/library/svga/SVGAnimationView;

    .line 74
    .line 75
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 76
    .line 77
    .line 78
    move-result-object v3

    .line 79
    check-cast v3, Landroid/view/ViewGroup;

    .line 80
    .line 81
    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 82
    .line 83
    .line 84
    move-result-object v3

    .line 85
    check-cast v3, Lv/VText;

    .line 86
    .line 87
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/sayHi/view/SayHiDialogContainer;->h:Lv/VText;

    .line 88
    .line 89
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 90
    .line 91
    .line 92
    move-result-object v3

    .line 93
    check-cast v3, Landroid/view/ViewGroup;

    .line 94
    .line 95
    const/4 v4, 0x3

    .line 96
    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 97
    .line 98
    .line 99
    move-result-object v3

    .line 100
    check-cast v3, Lv/VText;

    .line 101
    .line 102
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/sayHi/view/SayHiDialogContainer;->i:Lv/VText;

    .line 103
    .line 104
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 105
    .line 106
    .line 107
    move-result-object v3

    .line 108
    check-cast v3, Landroid/view/ViewGroup;

    .line 109
    .line 110
    const/4 v4, 0x4

    .line 111
    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 112
    .line 113
    .line 114
    move-result-object v3

    .line 115
    check-cast v3, Lv/VLinear;

    .line 116
    .line 117
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/sayHi/view/SayHiDialogContainer;->j:Lv/VLinear;

    .line 118
    .line 119
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 120
    .line 121
    .line 122
    move-result-object v3

    .line 123
    check-cast v3, Landroid/view/ViewGroup;

    .line 124
    .line 125
    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 126
    .line 127
    .line 128
    move-result-object v3

    .line 129
    check-cast v3, Landroid/view/ViewGroup;

    .line 130
    .line 131
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 132
    .line 133
    .line 134
    move-result-object v3

    .line 135
    check-cast v3, Lv/VImage;

    .line 136
    .line 137
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/sayHi/view/SayHiDialogContainer;->k:Lv/VImage;

    .line 138
    .line 139
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 140
    .line 141
    .line 142
    move-result-object v3

    .line 143
    check-cast v3, Landroid/view/ViewGroup;

    .line 144
    .line 145
    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 146
    .line 147
    .line 148
    move-result-object v3

    .line 149
    check-cast v3, Landroid/view/ViewGroup;

    .line 150
    .line 151
    invoke-virtual {v3, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 152
    .line 153
    .line 154
    move-result-object v3

    .line 155
    check-cast v3, Lv/VText;

    .line 156
    .line 157
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/sayHi/view/SayHiDialogContainer;->l:Lv/VText;

    .line 158
    .line 159
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 160
    .line 161
    .line 162
    move-result-object v3

    .line 163
    check-cast v3, Landroid/view/ViewGroup;

    .line 164
    .line 165
    const/4 v4, 0x5

    .line 166
    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 167
    .line 168
    .line 169
    move-result-object v3

    .line 170
    check-cast v3, Lv/VLinear;

    .line 171
    .line 172
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/sayHi/view/SayHiDialogContainer;->m:Lv/VLinear;

    .line 173
    .line 174
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 175
    .line 176
    .line 177
    move-result-object v3

    .line 178
    check-cast v3, Landroid/view/ViewGroup;

    .line 179
    .line 180
    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 181
    .line 182
    .line 183
    move-result-object v3

    .line 184
    check-cast v3, Landroid/view/ViewGroup;

    .line 185
    .line 186
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 187
    .line 188
    .line 189
    move-result-object v3

    .line 190
    check-cast v3, Lv/VImage;

    .line 191
    .line 192
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/sayHi/view/SayHiDialogContainer;->n:Lv/VImage;

    .line 193
    .line 194
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 195
    .line 196
    .line 197
    move-result-object v3

    .line 198
    check-cast v3, Landroid/view/ViewGroup;

    .line 199
    .line 200
    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 201
    .line 202
    .line 203
    move-result-object v3

    .line 204
    check-cast v3, Landroid/view/ViewGroup;

    .line 205
    .line 206
    invoke-virtual {v3, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 207
    .line 208
    .line 209
    move-result-object v3

    .line 210
    check-cast v3, Lv/VText;

    .line 211
    .line 212
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/sayHi/view/SayHiDialogContainer;->o:Lv/VText;

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
    const/4 v4, 0x6

    .line 221
    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 222
    .line 223
    .line 224
    move-result-object v3

    .line 225
    check-cast v3, Lv/VLinear;

    .line 226
    .line 227
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/sayHi/view/SayHiDialogContainer;->p:Lv/VLinear;

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
    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

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
    check-cast v3, Lv/VImage;

    .line 246
    .line 247
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/sayHi/view/SayHiDialogContainer;->q:Lv/VImage;

    .line 248
    .line 249
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 250
    .line 251
    .line 252
    move-result-object v3

    .line 253
    check-cast v3, Landroid/view/ViewGroup;

    .line 254
    .line 255
    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 256
    .line 257
    .line 258
    move-result-object v3

    .line 259
    check-cast v3, Landroid/view/ViewGroup;

    .line 260
    .line 261
    invoke-virtual {v3, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 262
    .line 263
    .line 264
    move-result-object v3

    .line 265
    check-cast v3, Lv/VText;

    .line 266
    .line 267
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/sayHi/view/SayHiDialogContainer;->r:Lv/VText;

    .line 268
    .line 269
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 270
    .line 271
    .line 272
    move-result-object v3

    .line 273
    check-cast v3, Landroid/view/ViewGroup;

    .line 274
    .line 275
    const/4 v4, 0x7

    .line 276
    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 277
    .line 278
    .line 279
    move-result-object v3

    .line 280
    check-cast v3, Landroid/widget/FrameLayout;

    .line 281
    .line 282
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/sayHi/view/SayHiDialogContainer;->s:Landroid/widget/FrameLayout;

    .line 283
    .line 284
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 285
    .line 286
    .line 287
    move-result-object v3

    .line 288
    check-cast v3, Landroid/view/ViewGroup;

    .line 289
    .line 290
    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 291
    .line 292
    .line 293
    move-result-object v3

    .line 294
    check-cast v3, Landroid/view/ViewGroup;

    .line 295
    .line 296
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 297
    .line 298
    .line 299
    move-result-object v0

    .line 300
    check-cast v0, Lv/VEditText;

    .line 301
    .line 302
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/sayHi/view/SayHiDialogContainer;->t:Lv/VEditText;

    .line 303
    .line 304
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 305
    .line 306
    .line 307
    move-result-object p1

    .line 308
    check-cast p1, Landroid/view/ViewGroup;

    .line 309
    .line 310
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 311
    .line 312
    .line 313
    move-result-object p1

    .line 314
    check-cast p1, Landroid/view/ViewGroup;

    .line 315
    .line 316
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 317
    .line 318
    .line 319
    move-result-object p1

    .line 320
    check-cast p1, Lv/VText;

    .line 321
    .line 322
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/sayHi/view/SayHiDialogContainer;->u:Lv/VText;

    .line 323
    .line 324
    return-void
.end method
