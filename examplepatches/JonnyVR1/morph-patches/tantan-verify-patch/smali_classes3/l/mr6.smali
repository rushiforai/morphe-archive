.class public Ll/mr6;
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

.method public static a(Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;Landroid/view/View;)V
    .locals 8

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
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->m:Landroid/view/View;

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    check-cast v2, Lcom/p1/mobile/putong/core/newui/messages/promotion/PrivilegePromotionHeaderView;

    .line 16
    .line 17
    iput-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->n:Lcom/p1/mobile/putong/core/newui/messages/promotion/PrivilegePromotionHeaderView;

    .line 18
    .line 19
    const/4 v2, 0x2

    .line 20
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    check-cast v3, Lcom/p1/mobile/putong/core/newui/messages/ConversationRealEcrGuideLayout;

    .line 25
    .line 26
    iput-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->o:Lcom/p1/mobile/putong/core/newui/messages/ConversationRealEcrGuideLayout;

    .line 27
    .line 28
    const/4 v3, 0x3

    .line 29
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object v4

    .line 33
    check-cast v4, Landroid/view/ViewGroup;

    .line 34
    .line 35
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    check-cast v4, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;

    .line 40
    .line 41
    iput-object v4, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->p:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;

    .line 42
    .line 43
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 44
    .line 45
    .line 46
    move-result-object v4

    .line 47
    check-cast v4, Landroid/view/ViewGroup;

    .line 48
    .line 49
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 50
    .line 51
    .line 52
    move-result-object v4

    .line 53
    check-cast v4, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;

    .line 54
    .line 55
    iput-object v4, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->q:Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;

    .line 56
    .line 57
    const/4 v4, 0x4

    .line 58
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 59
    .line 60
    .line 61
    move-result-object v5

    .line 62
    check-cast v5, Landroid/widget/FrameLayout;

    .line 63
    .line 64
    iput-object v5, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->r:Landroid/widget/FrameLayout;

    .line 65
    .line 66
    const/4 v5, 0x5

    .line 67
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 68
    .line 69
    .line 70
    move-result-object v6

    .line 71
    iput-object v6, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->s:Landroid/view/View;

    .line 72
    .line 73
    const/4 v6, 0x6

    .line 74
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 75
    .line 76
    .line 77
    move-result-object v7

    .line 78
    check-cast v7, Landroid/widget/LinearLayout;

    .line 79
    .line 80
    iput-object v7, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->t:Landroid/widget/LinearLayout;

    .line 81
    .line 82
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 83
    .line 84
    .line 85
    move-result-object v7

    .line 86
    check-cast v7, Landroid/view/ViewGroup;

    .line 87
    .line 88
    invoke-virtual {v7, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 89
    .line 90
    .line 91
    move-result-object v7

    .line 92
    check-cast v7, Landroid/widget/RelativeLayout;

    .line 93
    .line 94
    iput-object v7, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->u:Landroid/widget/RelativeLayout;

    .line 95
    .line 96
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 97
    .line 98
    .line 99
    move-result-object v7

    .line 100
    check-cast v7, Landroid/view/ViewGroup;

    .line 101
    .line 102
    invoke-virtual {v7, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 103
    .line 104
    .line 105
    move-result-object v7

    .line 106
    check-cast v7, Landroid/view/ViewGroup;

    .line 107
    .line 108
    invoke-virtual {v7, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 109
    .line 110
    .line 111
    move-result-object v7

    .line 112
    check-cast v7, Lv/VText;

    .line 113
    .line 114
    iput-object v7, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->v:Lv/VText;

    .line 115
    .line 116
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 117
    .line 118
    .line 119
    move-result-object v7

    .line 120
    check-cast v7, Landroid/view/ViewGroup;

    .line 121
    .line 122
    invoke-virtual {v7, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 123
    .line 124
    .line 125
    move-result-object v7

    .line 126
    check-cast v7, Landroid/view/ViewGroup;

    .line 127
    .line 128
    invoke-virtual {v7, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 129
    .line 130
    .line 131
    move-result-object v7

    .line 132
    iput-object v7, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->w:Landroid/view/View;

    .line 133
    .line 134
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 135
    .line 136
    .line 137
    move-result-object v7

    .line 138
    check-cast v7, Landroid/view/ViewGroup;

    .line 139
    .line 140
    invoke-virtual {v7, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 141
    .line 142
    .line 143
    move-result-object v7

    .line 144
    check-cast v7, Landroid/view/ViewGroup;

    .line 145
    .line 146
    invoke-virtual {v7, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 147
    .line 148
    .line 149
    move-result-object v7

    .line 150
    check-cast v7, Lv/VImage;

    .line 151
    .line 152
    iput-object v7, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->x:Lv/VImage;

    .line 153
    .line 154
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 155
    .line 156
    .line 157
    move-result-object v7

    .line 158
    check-cast v7, Landroid/view/ViewGroup;

    .line 159
    .line 160
    invoke-virtual {v7, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 161
    .line 162
    .line 163
    move-result-object v7

    .line 164
    check-cast v7, Landroid/view/ViewGroup;

    .line 165
    .line 166
    invoke-virtual {v7, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 167
    .line 168
    .line 169
    move-result-object v7

    .line 170
    check-cast v7, Lv/VImage;

    .line 171
    .line 172
    iput-object v7, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->y:Lv/VImage;

    .line 173
    .line 174
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 175
    .line 176
    .line 177
    move-result-object v7

    .line 178
    check-cast v7, Landroid/view/ViewGroup;

    .line 179
    .line 180
    invoke-virtual {v7, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 181
    .line 182
    .line 183
    move-result-object v7

    .line 184
    check-cast v7, Landroid/view/ViewGroup;

    .line 185
    .line 186
    invoke-virtual {v7, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 187
    .line 188
    .line 189
    move-result-object v7

    .line 190
    check-cast v7, Lv/VImage;

    .line 191
    .line 192
    iput-object v7, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->z:Lv/VImage;

    .line 193
    .line 194
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 195
    .line 196
    .line 197
    move-result-object v7

    .line 198
    check-cast v7, Landroid/view/ViewGroup;

    .line 199
    .line 200
    invoke-virtual {v7, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 201
    .line 202
    .line 203
    move-result-object v7

    .line 204
    check-cast v7, Landroid/widget/RelativeLayout;

    .line 205
    .line 206
    iput-object v7, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->A:Landroid/widget/RelativeLayout;

    .line 207
    .line 208
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 209
    .line 210
    .line 211
    move-result-object v7

    .line 212
    check-cast v7, Landroid/view/ViewGroup;

    .line 213
    .line 214
    invoke-virtual {v7, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 215
    .line 216
    .line 217
    move-result-object v7

    .line 218
    check-cast v7, Landroid/view/ViewGroup;

    .line 219
    .line 220
    invoke-virtual {v7, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 221
    .line 222
    .line 223
    move-result-object v7

    .line 224
    check-cast v7, Landroid/widget/LinearLayout;

    .line 225
    .line 226
    iput-object v7, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->B:Landroid/widget/LinearLayout;

    .line 227
    .line 228
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 229
    .line 230
    .line 231
    move-result-object v7

    .line 232
    check-cast v7, Landroid/view/ViewGroup;

    .line 233
    .line 234
    invoke-virtual {v7, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 235
    .line 236
    .line 237
    move-result-object v7

    .line 238
    check-cast v7, Landroid/view/ViewGroup;

    .line 239
    .line 240
    invoke-virtual {v7, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 241
    .line 242
    .line 243
    move-result-object v7

    .line 244
    check-cast v7, Landroid/view/ViewGroup;

    .line 245
    .line 246
    invoke-virtual {v7, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 247
    .line 248
    .line 249
    move-result-object v7

    .line 250
    check-cast v7, Lv/VText;

    .line 251
    .line 252
    iput-object v7, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->C:Lv/VText;

    .line 253
    .line 254
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 255
    .line 256
    .line 257
    move-result-object v7

    .line 258
    check-cast v7, Landroid/view/ViewGroup;

    .line 259
    .line 260
    invoke-virtual {v7, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 261
    .line 262
    .line 263
    move-result-object v1

    .line 264
    check-cast v1, Landroid/view/ViewGroup;

    .line 265
    .line 266
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 267
    .line 268
    .line 269
    move-result-object v0

    .line 270
    check-cast v0, Landroid/view/ViewGroup;

    .line 271
    .line 272
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 273
    .line 274
    .line 275
    move-result-object v0

    .line 276
    check-cast v0, Lv/VImage;

    .line 277
    .line 278
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->D:Lv/VImage;

    .line 279
    .line 280
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 281
    .line 282
    .line 283
    move-result-object v0

    .line 284
    check-cast v0, Landroid/view/ViewGroup;

    .line 285
    .line 286
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 287
    .line 288
    .line 289
    move-result-object v0

    .line 290
    check-cast v0, Landroid/view/ViewStub;

    .line 291
    .line 292
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->E:Landroid/view/ViewStub;

    .line 293
    .line 294
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 295
    .line 296
    .line 297
    move-result-object v0

    .line 298
    check-cast v0, Landroid/view/ViewGroup;

    .line 299
    .line 300
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 301
    .line 302
    .line 303
    move-result-object v0

    .line 304
    check-cast v0, Landroid/view/ViewStub;

    .line 305
    .line 306
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->F:Landroid/view/ViewStub;

    .line 307
    .line 308
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 309
    .line 310
    .line 311
    move-result-object v0

    .line 312
    check-cast v0, Landroid/view/ViewGroup;

    .line 313
    .line 314
    invoke-virtual {v0, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 315
    .line 316
    .line 317
    move-result-object v0

    .line 318
    check-cast v0, Landroid/view/ViewStub;

    .line 319
    .line 320
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->G:Landroid/view/ViewStub;

    .line 321
    .line 322
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 323
    .line 324
    .line 325
    move-result-object v0

    .line 326
    check-cast v0, Landroid/view/ViewGroup;

    .line 327
    .line 328
    invoke-virtual {v0, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 329
    .line 330
    .line 331
    move-result-object v0

    .line 332
    check-cast v0, Landroid/view/ViewStub;

    .line 333
    .line 334
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->H:Landroid/view/ViewStub;

    .line 335
    .line 336
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 337
    .line 338
    .line 339
    move-result-object p1

    .line 340
    check-cast p1, Landroid/view/ViewGroup;

    .line 341
    .line 342
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 343
    .line 344
    .line 345
    move-result-object p1

    .line 346
    check-cast p1, Landroid/view/ViewStub;

    .line 347
    .line 348
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->I:Landroid/view/ViewStub;

    .line 349
    .line 350
    return-void
.end method
