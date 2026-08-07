.class public Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# direct methods
.method public static bridge synthetic a(Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a$b;->c(Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method public static b(Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;Landroid/view/View;)V
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
    check-cast v1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/OldInfoTransOpLayout;

    .line 9
    .line 10
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->j(Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/OldInfoTransOpLayout;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Landroid/view/ViewGroup;

    .line 18
    .line 19
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->p(Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;Landroid/view/View;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Landroid/view/ViewGroup;

    .line 31
    .line 32
    const/4 v2, 0x1

    .line 33
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    check-cast v1, Landroid/widget/FrameLayout;

    .line 38
    .line 39
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->x(Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;Landroid/widget/FrameLayout;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    check-cast v1, Landroid/view/ViewGroup;

    .line 47
    .line 48
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    check-cast v1, Landroid/view/ViewGroup;

    .line 53
    .line 54
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    check-cast v1, Lv/VImage;

    .line 59
    .line 60
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->w(Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;Lv/VImage;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    check-cast v1, Landroid/view/ViewGroup;

    .line 68
    .line 69
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    check-cast v1, Landroid/view/ViewGroup;

    .line 74
    .line 75
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    check-cast v1, Landroid/view/ViewGroup;

    .line 80
    .line 81
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    check-cast v1, Lcom/tantan/library/svga/SVGAnimationView;

    .line 86
    .line 87
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->u(Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    check-cast v1, Landroid/view/ViewGroup;

    .line 95
    .line 96
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    check-cast v1, Landroid/view/ViewGroup;

    .line 101
    .line 102
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    check-cast v1, Landroid/view/ViewGroup;

    .line 107
    .line 108
    const/4 v3, 0x4

    .line 109
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    check-cast v1, Lv/VDraweeView;

    .line 114
    .line 115
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->l(Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;Lv/VDraweeView;)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 119
    .line 120
    .line 121
    move-result-object v1

    .line 122
    check-cast v1, Landroid/view/ViewGroup;

    .line 123
    .line 124
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 125
    .line 126
    .line 127
    move-result-object v1

    .line 128
    check-cast v1, Landroid/view/ViewGroup;

    .line 129
    .line 130
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    check-cast v1, Landroid/view/ViewGroup;

    .line 135
    .line 136
    const/4 v4, 0x6

    .line 137
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 138
    .line 139
    .line 140
    move-result-object v1

    .line 141
    check-cast v1, Lcom/tantan/library/svga/SVGAnimationView;

    .line 142
    .line 143
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->s(Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 144
    .line 145
    .line 146
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 147
    .line 148
    .line 149
    move-result-object v1

    .line 150
    check-cast v1, Landroid/view/ViewGroup;

    .line 151
    .line 152
    const/4 v4, 0x2

    .line 153
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 154
    .line 155
    .line 156
    move-result-object v1

    .line 157
    check-cast v1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedLayout;

    .line 158
    .line 159
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->v(Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedLayout;)V

    .line 160
    .line 161
    .line 162
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 163
    .line 164
    .line 165
    move-result-object v1

    .line 166
    check-cast v1, Landroid/view/ViewGroup;

    .line 167
    .line 168
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 169
    .line 170
    .line 171
    move-result-object v1

    .line 172
    check-cast v1, Lv/VLinear;

    .line 173
    .line 174
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->i(Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;Lv/VLinear;)V

    .line 175
    .line 176
    .line 177
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 178
    .line 179
    .line 180
    move-result-object v1

    .line 181
    check-cast v1, Landroid/view/ViewGroup;

    .line 182
    .line 183
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 184
    .line 185
    .line 186
    move-result-object v1

    .line 187
    check-cast v1, Landroid/view/ViewGroup;

    .line 188
    .line 189
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 190
    .line 191
    .line 192
    move-result-object v1

    .line 193
    check-cast v1, Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 194
    .line 195
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->n(Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;Lcom/p1/mobile/putong/core/ui/VText_Bold;)V

    .line 196
    .line 197
    .line 198
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 199
    .line 200
    .line 201
    move-result-object v1

    .line 202
    check-cast v1, Landroid/view/ViewGroup;

    .line 203
    .line 204
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 205
    .line 206
    .line 207
    move-result-object v1

    .line 208
    check-cast v1, Landroid/view/ViewGroup;

    .line 209
    .line 210
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 211
    .line 212
    .line 213
    move-result-object v1

    .line 214
    check-cast v1, Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 215
    .line 216
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->q(Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;Lcom/p1/mobile/putong/core/ui/VText_Bold;)V

    .line 217
    .line 218
    .line 219
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 220
    .line 221
    .line 222
    move-result-object v1

    .line 223
    check-cast v1, Lv/VFrame;

    .line 224
    .line 225
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->f(Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;Lv/VFrame;)V

    .line 226
    .line 227
    .line 228
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 229
    .line 230
    .line 231
    move-result-object v1

    .line 232
    check-cast v1, Landroid/view/ViewGroup;

    .line 233
    .line 234
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 235
    .line 236
    .line 237
    move-result-object v0

    .line 238
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->e(Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;Landroid/view/View;)V

    .line 239
    .line 240
    .line 241
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 242
    .line 243
    .line 244
    move-result-object v0

    .line 245
    check-cast v0, Landroid/view/ViewGroup;

    .line 246
    .line 247
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 248
    .line 249
    .line 250
    move-result-object v0

    .line 251
    check-cast v0, Lv/VImage;

    .line 252
    .line 253
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->m(Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;Lv/VImage;)V

    .line 254
    .line 255
    .line 256
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 257
    .line 258
    .line 259
    move-result-object p1

    .line 260
    check-cast p1, Landroid/view/ViewGroup;

    .line 261
    .line 262
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 263
    .line 264
    .line 265
    move-result-object p1

    .line 266
    check-cast p1, Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 267
    .line 268
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->k(Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;Lcom/p1/mobile/putong/core/ui/VText_Bold;)V

    .line 269
    .line 270
    .line 271
    return-void
.end method

.method public static c(Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/kec0;->r8:I

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
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a$b;->b(Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    return-object p1
.end method
