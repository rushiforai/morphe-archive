.class public Ll/gk3;
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

.method public static a(Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;Landroid/view/View;)V
    .locals 6

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
    check-cast v1, Lv/VDraweeView;

    .line 9
    .line 10
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->h:Lv/VDraweeView;

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
    check-cast v2, Landroid/widget/ImageView;

    .line 18
    .line 19
    iput-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->i:Landroid/widget/ImageView;

    .line 20
    .line 21
    const/4 v2, 0x2

    .line 22
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    check-cast v3, Landroid/widget/FrameLayout;

    .line 27
    .line 28
    iput-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->j:Landroid/widget/FrameLayout;

    .line 29
    .line 30
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    check-cast v3, Landroid/view/ViewGroup;

    .line 35
    .line 36
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    check-cast v3, Landroid/view/ViewStub;

    .line 41
    .line 42
    iput-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->k:Landroid/view/ViewStub;

    .line 43
    .line 44
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    check-cast v3, Landroid/view/ViewGroup;

    .line 49
    .line 50
    invoke-virtual {v3, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    check-cast v3, Landroid/view/ViewStub;

    .line 55
    .line 56
    iput-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->l:Landroid/view/ViewStub;

    .line 57
    .line 58
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    check-cast v3, Landroid/view/ViewGroup;

    .line 63
    .line 64
    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    check-cast v3, Lcom/tantan/library/svga/SVGAnimationView;

    .line 69
    .line 70
    iput-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->m:Lcom/tantan/library/svga/SVGAnimationView;

    .line 71
    .line 72
    const/4 v3, 0x3

    .line 73
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 74
    .line 75
    .line 76
    move-result-object v4

    .line 77
    check-cast v4, Lv/VFrame;

    .line 78
    .line 79
    iput-object v4, p0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->n:Lv/VFrame;

    .line 80
    .line 81
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 82
    .line 83
    .line 84
    move-result-object v4

    .line 85
    check-cast v4, Landroid/view/ViewGroup;

    .line 86
    .line 87
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 88
    .line 89
    .line 90
    move-result-object v4

    .line 91
    check-cast v4, Lv/VText_AutoFit;

    .line 92
    .line 93
    iput-object v4, p0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->o:Lv/VText_AutoFit;

    .line 94
    .line 95
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 96
    .line 97
    .line 98
    move-result-object v4

    .line 99
    check-cast v4, Landroid/view/ViewGroup;

    .line 100
    .line 101
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 102
    .line 103
    .line 104
    move-result-object v4

    .line 105
    check-cast v4, Landroid/widget/TextView;

    .line 106
    .line 107
    iput-object v4, p0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->p:Landroid/widget/TextView;

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
    iput-object v4, p0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->q:Landroid/view/View;

    .line 120
    .line 121
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 122
    .line 123
    .line 124
    move-result-object v4

    .line 125
    check-cast v4, Landroid/view/ViewGroup;

    .line 126
    .line 127
    invoke-virtual {v4, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 128
    .line 129
    .line 130
    move-result-object v4

    .line 131
    check-cast v4, Lcom/tantan/library/svga/SVGAnimationView;

    .line 132
    .line 133
    iput-object v4, p0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->r:Lcom/tantan/library/svga/SVGAnimationView;

    .line 134
    .line 135
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 136
    .line 137
    .line 138
    move-result-object v4

    .line 139
    check-cast v4, Landroid/view/ViewGroup;

    .line 140
    .line 141
    const/4 v5, 0x4

    .line 142
    invoke-virtual {v4, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 143
    .line 144
    .line 145
    move-result-object v4

    .line 146
    check-cast v4, Lv/VImage;

    .line 147
    .line 148
    iput-object v4, p0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->s:Lv/VImage;

    .line 149
    .line 150
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 151
    .line 152
    .line 153
    move-result-object v4

    .line 154
    check-cast v4, Landroid/view/ViewStub;

    .line 155
    .line 156
    iput-object v4, p0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->t:Landroid/view/ViewStub;

    .line 157
    .line 158
    const/4 v4, 0x5

    .line 159
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 160
    .line 161
    .line 162
    move-result-object v4

    .line 163
    check-cast v4, Lv/VImage;

    .line 164
    .line 165
    iput-object v4, p0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->u:Lv/VImage;

    .line 166
    .line 167
    const/4 v4, 0x6

    .line 168
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 169
    .line 170
    .line 171
    move-result-object v5

    .line 172
    check-cast v5, Landroid/view/ViewGroup;

    .line 173
    .line 174
    invoke-virtual {v5, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 175
    .line 176
    .line 177
    move-result-object v5

    .line 178
    check-cast v5, Lv/VText;

    .line 179
    .line 180
    iput-object v5, p0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->v:Lv/VText;

    .line 181
    .line 182
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 183
    .line 184
    .line 185
    move-result-object v5

    .line 186
    check-cast v5, Landroid/view/ViewGroup;

    .line 187
    .line 188
    invoke-virtual {v5, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 189
    .line 190
    .line 191
    move-result-object v5

    .line 192
    check-cast v5, Landroid/view/ViewGroup;

    .line 193
    .line 194
    invoke-virtual {v5, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 195
    .line 196
    .line 197
    move-result-object v5

    .line 198
    check-cast v5, Lv/VText;

    .line 199
    .line 200
    iput-object v5, p0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->w:Lv/VText;

    .line 201
    .line 202
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 203
    .line 204
    .line 205
    move-result-object v5

    .line 206
    check-cast v5, Landroid/view/ViewGroup;

    .line 207
    .line 208
    invoke-virtual {v5, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 209
    .line 210
    .line 211
    move-result-object v5

    .line 212
    check-cast v5, Landroid/view/ViewGroup;

    .line 213
    .line 214
    invoke-virtual {v5, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 215
    .line 216
    .line 217
    move-result-object v5

    .line 218
    iput-object v5, p0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->x:Landroid/view/View;

    .line 219
    .line 220
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 221
    .line 222
    .line 223
    move-result-object v5

    .line 224
    check-cast v5, Landroid/view/ViewGroup;

    .line 225
    .line 226
    invoke-virtual {v5, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 227
    .line 228
    .line 229
    move-result-object v5

    .line 230
    check-cast v5, Landroid/view/ViewGroup;

    .line 231
    .line 232
    invoke-virtual {v5, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 233
    .line 234
    .line 235
    move-result-object v2

    .line 236
    check-cast v2, Lv/VText;

    .line 237
    .line 238
    iput-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->y:Lv/VText;

    .line 239
    .line 240
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 241
    .line 242
    .line 243
    move-result-object v2

    .line 244
    check-cast v2, Landroid/view/ViewGroup;

    .line 245
    .line 246
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 247
    .line 248
    .line 249
    move-result-object v1

    .line 250
    check-cast v1, Landroid/view/ViewGroup;

    .line 251
    .line 252
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 253
    .line 254
    .line 255
    move-result-object v1

    .line 256
    check-cast v1, Landroid/view/ViewGroup;

    .line 257
    .line 258
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 259
    .line 260
    .line 261
    move-result-object v0

    .line 262
    check-cast v0, Lv/VText;

    .line 263
    .line 264
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->z:Lv/VText;

    .line 265
    .line 266
    const/4 v0, 0x7

    .line 267
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 268
    .line 269
    .line 270
    move-result-object p1

    .line 271
    check-cast p1, Lv/VText;

    .line 272
    .line 273
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->A:Lv/VText;

    .line 274
    .line 275
    return-void
.end method
