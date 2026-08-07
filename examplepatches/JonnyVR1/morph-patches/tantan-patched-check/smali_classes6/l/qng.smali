.class public Ll/qng;
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

.method public static a(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/newui/FeedAlbumPersionTitleView;Landroid/view/View;)V
    .locals 6

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/newui/FeedAlbumPersionTitleView;

    .line 3
    .line 4
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/newui/FeedAlbumPersionTitleView;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/newui/FeedAlbumPersionTitleView;

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
    check-cast v1, Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 14
    .line 15
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/newui/FeedAlbumPersionTitleView;->e:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 16
    .line 17
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Landroid/view/ViewGroup;

    .line 22
    .line 23
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    check-cast v1, Lv/VDraweeView;

    .line 28
    .line 29
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/newui/FeedAlbumPersionTitleView;->f:Lv/VDraweeView;

    .line 30
    .line 31
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    check-cast v1, Landroid/view/ViewGroup;

    .line 36
    .line 37
    const/4 v2, 0x1

    .line 38
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    check-cast v1, Lv/VLinear_FillerMeasure;

    .line 43
    .line 44
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/newui/FeedAlbumPersionTitleView;->g:Lv/VLinear_FillerMeasure;

    .line 45
    .line 46
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    check-cast v1, Landroid/view/ViewGroup;

    .line 51
    .line 52
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    check-cast v1, Landroid/view/ViewGroup;

    .line 57
    .line 58
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    check-cast v1, Lv/VText;

    .line 63
    .line 64
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/newui/FeedAlbumPersionTitleView;->h:Lv/VText;

    .line 65
    .line 66
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    check-cast v1, Landroid/view/ViewGroup;

    .line 71
    .line 72
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    check-cast v1, Landroid/view/ViewGroup;

    .line 77
    .line 78
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    check-cast v1, Landroid/view/ViewGroup;

    .line 83
    .line 84
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    check-cast v1, Lv/VImage;

    .line 89
    .line 90
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/newui/FeedAlbumPersionTitleView;->i:Lv/VImage;

    .line 91
    .line 92
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    check-cast v1, Landroid/view/ViewGroup;

    .line 97
    .line 98
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    check-cast v1, Landroid/view/ViewGroup;

    .line 103
    .line 104
    const/4 v3, 0x2

    .line 105
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    check-cast v1, Lcom/p1/mobile/putong/feed/newui/view/FeedUserSexAndAgeView;

    .line 110
    .line 111
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/newui/FeedAlbumPersionTitleView;->j:Lcom/p1/mobile/putong/feed/newui/view/FeedUserSexAndAgeView;

    .line 112
    .line 113
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    check-cast v1, Landroid/view/ViewGroup;

    .line 118
    .line 119
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    check-cast v1, Landroid/view/ViewGroup;

    .line 124
    .line 125
    const/4 v4, 0x3

    .line 126
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 127
    .line 128
    .line 129
    move-result-object v1

    .line 130
    check-cast v1, Landroid/view/ViewGroup;

    .line 131
    .line 132
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 133
    .line 134
    .line 135
    move-result-object v1

    .line 136
    check-cast v1, Lv/VImage;

    .line 137
    .line 138
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/newui/FeedAlbumPersionTitleView;->k:Lv/VImage;

    .line 139
    .line 140
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 141
    .line 142
    .line 143
    move-result-object v1

    .line 144
    check-cast v1, Landroid/view/ViewGroup;

    .line 145
    .line 146
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 147
    .line 148
    .line 149
    move-result-object v1

    .line 150
    check-cast v1, Landroid/view/ViewGroup;

    .line 151
    .line 152
    const/4 v5, 0x4

    .line 153
    invoke-virtual {v1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 154
    .line 155
    .line 156
    move-result-object v1

    .line 157
    check-cast v1, Landroid/widget/FrameLayout;

    .line 158
    .line 159
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/newui/FeedAlbumPersionTitleView;->l:Landroid/widget/FrameLayout;

    .line 160
    .line 161
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 162
    .line 163
    .line 164
    move-result-object v1

    .line 165
    check-cast v1, Landroid/view/ViewGroup;

    .line 166
    .line 167
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 168
    .line 169
    .line 170
    move-result-object v1

    .line 171
    check-cast v1, Landroid/view/ViewGroup;

    .line 172
    .line 173
    invoke-virtual {v1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 174
    .line 175
    .line 176
    move-result-object v1

    .line 177
    check-cast v1, Landroid/view/ViewGroup;

    .line 178
    .line 179
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 180
    .line 181
    .line 182
    move-result-object v1

    .line 183
    check-cast v1, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;

    .line 184
    .line 185
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/newui/FeedAlbumPersionTitleView;->m:Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;

    .line 186
    .line 187
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 188
    .line 189
    .line 190
    move-result-object v1

    .line 191
    check-cast v1, Landroid/view/ViewGroup;

    .line 192
    .line 193
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 194
    .line 195
    .line 196
    move-result-object v1

    .line 197
    check-cast v1, Lv/VText;

    .line 198
    .line 199
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/newui/FeedAlbumPersionTitleView;->n:Lv/VText;

    .line 200
    .line 201
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 202
    .line 203
    .line 204
    move-result-object v1

    .line 205
    check-cast v1, Landroid/view/ViewGroup;

    .line 206
    .line 207
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 208
    .line 209
    .line 210
    move-result-object v1

    .line 211
    check-cast v1, Lv/VText;

    .line 212
    .line 213
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/newui/FeedAlbumPersionTitleView;->o:Lv/VText;

    .line 214
    .line 215
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 216
    .line 217
    .line 218
    move-result-object v1

    .line 219
    check-cast v1, Landroid/view/ViewGroup;

    .line 220
    .line 221
    invoke-virtual {v1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 222
    .line 223
    .line 224
    move-result-object v1

    .line 225
    check-cast v1, Lv/VLinear;

    .line 226
    .line 227
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/newui/FeedAlbumPersionTitleView;->p:Lv/VLinear;

    .line 228
    .line 229
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 230
    .line 231
    .line 232
    move-result-object v1

    .line 233
    check-cast v1, Landroid/view/ViewGroup;

    .line 234
    .line 235
    invoke-virtual {v1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 236
    .line 237
    .line 238
    move-result-object v1

    .line 239
    check-cast v1, Landroid/view/ViewGroup;

    .line 240
    .line 241
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 242
    .line 243
    .line 244
    move-result-object v1

    .line 245
    check-cast v1, Lv/VDraweeView;

    .line 246
    .line 247
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/newui/FeedAlbumPersionTitleView;->q:Lv/VDraweeView;

    .line 248
    .line 249
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 250
    .line 251
    .line 252
    move-result-object v0

    .line 253
    check-cast v0, Landroid/view/ViewGroup;

    .line 254
    .line 255
    invoke-virtual {v0, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 256
    .line 257
    .line 258
    move-result-object v0

    .line 259
    check-cast v0, Landroid/view/ViewGroup;

    .line 260
    .line 261
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 262
    .line 263
    .line 264
    move-result-object v0

    .line 265
    check-cast v0, Lv/VText;

    .line 266
    .line 267
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/newui/FeedAlbumPersionTitleView;->r:Lv/VText;

    .line 268
    .line 269
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 270
    .line 271
    .line 272
    move-result-object p1

    .line 273
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/FeedWriterLevelInProfileView;

    .line 274
    .line 275
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/newui/FeedAlbumPersionTitleView;->s:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/FeedWriterLevelInProfileView;

    .line 276
    .line 277
    return-void
.end method
