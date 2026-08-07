.class public Ll/e6o;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/d6o;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroid/widget/FrameLayout;

.field public b:Lv/VFrame;

.field public c:Landroid/view/View;

.field public d:Lcom/google/android/material/tabs/TabLayout;

.field public e:Landroid/widget/LinearLayout;

.field public f:Lv/VDraweeView;

.field public g:Lv/VDraweeView;

.field public h:Lv/VDraweeView;

.field public i:Lv/VDraweeView;

.field public j:Lv/VText;

.field public k:Landroid/view/View;

.field public l:Lv/VFrame;

.field public m:Lcom/p1/mobile/putong/live/external/view/widgets/NoSaveStateViewPager;

.field public n:Landroid/view/View;


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


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/e6o;->l:Lv/VFrame;

    .line 2
    .line 3
    invoke-static {p0}, Ll/bnl0;->E(Landroid/view/View;)Landroid/app/Activity;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/f6o;->b(Ll/e6o;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public b(Ll/d6o;)V
    .locals 0

    .line 1
    return-void
.end method

.method public c(Lcom/p1/mobile/android/app/Act;)V
    .locals 8

    .line 1
    iget-object p1, p0, Ll/e6o;->g:Lv/VDraweeView;

    .line 2
    .line 3
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 4
    .line 5
    const/high16 v1, 0x42180000    # 38.0f

    .line 6
    .line 7
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v3

    .line 15
    invoke-direct {v0, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Ll/e6o;->i:Lv/VDraweeView;

    .line 22
    .line 23
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 24
    .line 25
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    invoke-direct {v0, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, Ll/e6o;->f:Lv/VDraweeView;

    .line 40
    .line 41
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 42
    .line 43
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    invoke-direct {v0, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 55
    .line 56
    .line 57
    iget-object p1, p0, Ll/e6o;->g:Lv/VDraweeView;

    .line 58
    .line 59
    const/4 v0, 0x0

    .line 60
    invoke-static {p1, v0}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 61
    .line 62
    .line 63
    iget-object p1, p0, Ll/e6o;->i:Lv/VDraweeView;

    .line 64
    .line 65
    invoke-static {p1, v0}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 66
    .line 67
    .line 68
    iget-object p1, p0, Ll/e6o;->g:Lv/VDraweeView;

    .line 69
    .line 70
    invoke-static {p1, v0}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 71
    .line 72
    .line 73
    iget-object p1, p0, Ll/e6o;->i:Lv/VDraweeView;

    .line 74
    .line 75
    invoke-static {p1, v0}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 76
    .line 77
    .line 78
    iget-object p1, p0, Ll/e6o;->f:Lv/VDraweeView;

    .line 79
    .line 80
    invoke-static {p1, v0}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 81
    .line 82
    .line 83
    iget-object p1, p0, Ll/e6o;->f:Lv/VDraweeView;

    .line 84
    .line 85
    const/high16 v2, 0x40c00000    # 6.0f

    .line 86
    .line 87
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 88
    .line 89
    .line 90
    move-result v3

    .line 91
    const/high16 v4, 0x40a00000    # 5.0f

    .line 92
    .line 93
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 94
    .line 95
    .line 96
    move-result v5

    .line 97
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 98
    .line 99
    .line 100
    move-result v6

    .line 101
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 102
    .line 103
    .line 104
    move-result v7

    .line 105
    invoke-virtual {p1, v3, v5, v6, v7}, Landroid/view/View;->setPadding(IIII)V

    .line 106
    .line 107
    .line 108
    iget-object p1, p0, Ll/e6o;->g:Lv/VDraweeView;

    .line 109
    .line 110
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 111
    .line 112
    .line 113
    move-result v3

    .line 114
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 115
    .line 116
    .line 117
    move-result v5

    .line 118
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 119
    .line 120
    .line 121
    move-result v6

    .line 122
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 123
    .line 124
    .line 125
    move-result v7

    .line 126
    invoke-virtual {p1, v3, v5, v6, v7}, Landroid/view/View;->setPadding(IIII)V

    .line 127
    .line 128
    .line 129
    iget-object p1, p0, Ll/e6o;->i:Lv/VDraweeView;

    .line 130
    .line 131
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 132
    .line 133
    .line 134
    move-result v3

    .line 135
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 136
    .line 137
    .line 138
    move-result v5

    .line 139
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 140
    .line 141
    .line 142
    move-result v6

    .line 143
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 144
    .line 145
    .line 146
    move-result v7

    .line 147
    invoke-virtual {p1, v3, v5, v6, v7}, Landroid/view/View;->setPadding(IIII)V

    .line 148
    .line 149
    .line 150
    iget-object p1, p0, Ll/e6o;->g:Lv/VDraweeView;

    .line 151
    .line 152
    sget v3, Ll/nbc0;->a:I

    .line 153
    .line 154
    invoke-virtual {p1, v3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 155
    .line 156
    .line 157
    iget-object p1, p0, Ll/e6o;->i:Lv/VDraweeView;

    .line 158
    .line 159
    sget v3, Ll/nbc0;->a:I

    .line 160
    .line 161
    invoke-virtual {p1, v3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 162
    .line 163
    .line 164
    iget-object p1, p0, Ll/e6o;->h:Lv/VDraweeView;

    .line 165
    .line 166
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    .line 167
    .line 168
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 169
    .line 170
    .line 171
    move-result v5

    .line 172
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 173
    .line 174
    .line 175
    move-result v1

    .line 176
    invoke-direct {v3, v5, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 177
    .line 178
    .line 179
    invoke-virtual {p1, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 180
    .line 181
    .line 182
    iget-object p1, p0, Ll/e6o;->h:Lv/VDraweeView;

    .line 183
    .line 184
    invoke-static {p1, v0}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 185
    .line 186
    .line 187
    iget-object p1, p0, Ll/e6o;->h:Lv/VDraweeView;

    .line 188
    .line 189
    invoke-static {p1, v0}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 190
    .line 191
    .line 192
    iget-object p1, p0, Ll/e6o;->h:Lv/VDraweeView;

    .line 193
    .line 194
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 195
    .line 196
    .line 197
    move-result v1

    .line 198
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 199
    .line 200
    .line 201
    move-result v3

    .line 202
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 203
    .line 204
    .line 205
    move-result v5

    .line 206
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 207
    .line 208
    .line 209
    move-result v4

    .line 210
    invoke-virtual {p1, v1, v3, v5, v4}, Landroid/view/View;->setPadding(IIII)V

    .line 211
    .line 212
    .line 213
    iget-object p1, p0, Ll/e6o;->h:Lv/VDraweeView;

    .line 214
    .line 215
    sget v1, Ll/nbc0;->a:I

    .line 216
    .line 217
    invoke-virtual {p1, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 218
    .line 219
    .line 220
    iget-object p1, p0, Ll/e6o;->l:Lv/VFrame;

    .line 221
    .line 222
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 223
    .line 224
    .line 225
    move-result-object p1

    .line 226
    instance-of v1, p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 227
    .line 228
    if-eqz v1, :cond_0

    .line 229
    .line 230
    move-object v1, p1

    .line 231
    check-cast v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 232
    .line 233
    const/high16 v3, 0x42300000    # 44.0f

    .line 234
    .line 235
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 236
    .line 237
    .line 238
    move-result v3

    .line 239
    iput v3, v1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 240
    .line 241
    iget-object v1, p0, Ll/e6o;->l:Lv/VFrame;

    .line 242
    .line 243
    invoke-virtual {v1, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 244
    .line 245
    .line 246
    :cond_0
    iget-object p1, p0, Ll/e6o;->b:Lv/VFrame;

    .line 247
    .line 248
    iget-object v1, p0, Ll/e6o;->l:Lv/VFrame;

    .line 249
    .line 250
    const/4 v3, 0x2

    .line 251
    new-array v3, v3, [Landroid/view/View;

    .line 252
    .line 253
    aput-object p1, v3, v0

    .line 254
    .line 255
    const/4 p1, 0x1

    .line 256
    aput-object v1, v3, p1

    .line 257
    .line 258
    invoke-static {v3}, Ll/bnl0;->Z([Landroid/view/View;)V

    .line 259
    .line 260
    .line 261
    iget-object p1, p0, Ll/e6o;->c:Landroid/view/View;

    .line 262
    .line 263
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 264
    .line 265
    .line 266
    iget-object p1, p0, Ll/e6o;->l:Lv/VFrame;

    .line 267
    .line 268
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 269
    .line 270
    .line 271
    move-result-object p1

    .line 272
    check-cast p1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 273
    .line 274
    iget-object p0, p0, Ll/e6o;->l:Lv/VFrame;

    .line 275
    .line 276
    iget p1, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 277
    .line 278
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 279
    .line 280
    .line 281
    move-result v0

    .line 282
    add-int/2addr p1, v0

    .line 283
    invoke-static {p0, p1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 284
    .line 285
    .line 286
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/d6o;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/e6o;->b(Ll/d6o;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/e6o;->a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
