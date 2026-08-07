.class public Lcom/p1/mobile/android/app/swipback/SwipeBackLayout$a;
.super Ll/ykl0$c;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field public a:Z

.field public b:Z

.field public final synthetic c:Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout$a;->c:Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/ykl0$c;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x1

    .line 7
    iput-boolean p1, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout$a;->b:Z

    .line 8
    .line 9
    return-void
.end method

.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;Ll/tfh0;)V
    .locals 0

    .line 10
    invoke-direct {p0, p1}, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout$a;-><init>(Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;)V

    return-void
.end method


# virtual methods
.method public clampViewPositionHorizontal(Landroid/view/View;II)I
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-static {p2, p1}, Ljava/lang/Math;->max(II)I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    invoke-static {p0, p1}, Ljava/lang/Math;->min(II)I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0
.end method

.method public getViewHorizontalDragRange(Landroid/view/View;)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout$a;->c:Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->k(Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getViewVerticalDragRange(Landroid/view/View;)I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public onViewCaptured(Landroid/view/View;I)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Ll/ykl0$c;->onViewCaptured(Landroid/view/View;I)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout$a;->c:Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Landroid/app/Activity;

    .line 11
    .line 12
    invoke-static {p1}, Ll/ynk0;->b(Landroid/app/Activity;)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout$a;->c:Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 16
    .line 17
    invoke-static {p1}, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->h(Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;)Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    iget-object p1, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout$a;->c:Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 24
    .line 25
    invoke-static {p1}, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->h(Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;)Ljava/util/List;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-nez p1, :cond_0

    .line 34
    .line 35
    iget-object p1, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout$a;->c:Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 36
    .line 37
    invoke-static {p1}, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->h(Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;)Ljava/util/List;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 46
    .line 47
    .line 48
    move-result p2

    .line 49
    if-eqz p2, :cond_0

    .line 50
    .line 51
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object p2

    .line 55
    check-cast p2, Ll/ujh0;

    .line 56
    .line 57
    invoke-interface {p2}, Ll/ujh0;->a0()V

    .line 58
    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_0
    const/4 p1, 0x1

    .line 62
    iput-boolean p1, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout$a;->a:Z

    .line 63
    .line 64
    const/4 p1, 0x0

    .line 65
    iput-boolean p1, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout$a;->b:Z

    .line 66
    .line 67
    return-void
.end method

.method public onViewPositionChanged(Landroid/view/View;IIII)V
    .locals 3

    .line 1
    invoke-super/range {p0 .. p5}, Ll/ykl0$c;->onViewPositionChanged(Landroid/view/View;IIII)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout$a;->c:Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 5
    .line 6
    invoke-static {p1}, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->n(Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;)Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iget-object p3, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout$a;->c:Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 11
    .line 12
    invoke-virtual {p3}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 13
    .line 14
    .line 15
    move-result-object p3

    .line 16
    check-cast p3, Landroid/app/Activity;

    .line 17
    .line 18
    invoke-virtual {p3}, Landroid/app/Activity;->isFinishing()Z

    .line 19
    .line 20
    .line 21
    move-result p3

    .line 22
    const/4 p4, 0x0

    .line 23
    if-eqz p3, :cond_0

    .line 24
    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    invoke-virtual {p1, p4}, Landroid/view/View;->setX(F)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    iget-object p3, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout$a;->c:Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 32
    .line 33
    int-to-float p5, p2

    .line 34
    invoke-static {p3}, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->f(Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    int-to-float v0, v0

    .line 43
    div-float/2addr p5, v0

    .line 44
    invoke-static {p5}, Ljava/lang/Math;->abs(F)F

    .line 45
    .line 46
    .line 47
    move-result p5

    .line 48
    invoke-static {p3, p5}, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->m(Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;F)V

    .line 49
    .line 50
    .line 51
    iget-object p3, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout$a;->c:Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 52
    .line 53
    invoke-static {p3, p2}, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->l(Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;I)V

    .line 54
    .line 55
    .line 56
    iget-object p2, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout$a;->c:Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 57
    .line 58
    invoke-static {p2}, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->e(Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;)I

    .line 59
    .line 60
    .line 61
    move-result p3

    .line 62
    invoke-static {p2, p3}, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->p(Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;I)V

    .line 63
    .line 64
    .line 65
    iget-object p2, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout$a;->c:Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 66
    .line 67
    invoke-virtual {p2}, Landroid/view/View;->invalidate()V

    .line 68
    .line 69
    .line 70
    iget-object p2, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout$a;->c:Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 71
    .line 72
    invoke-static {p2}, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->i(Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;)F

    .line 73
    .line 74
    .line 75
    move-result p2

    .line 76
    iget-object p3, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout$a;->c:Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 77
    .line 78
    invoke-static {p3}, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->j(Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;)F

    .line 79
    .line 80
    .line 81
    move-result p3

    .line 82
    cmpg-float p2, p2, p3

    .line 83
    .line 84
    if-gez p2, :cond_1

    .line 85
    .line 86
    iget-boolean p2, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout$a;->a:Z

    .line 87
    .line 88
    if-nez p2, :cond_1

    .line 89
    .line 90
    const/4 p2, 0x1

    .line 91
    iput-boolean p2, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout$a;->a:Z

    .line 92
    .line 93
    :cond_1
    iget-boolean p2, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout$a;->b:Z

    .line 94
    .line 95
    if-eqz p2, :cond_2

    .line 96
    .line 97
    iget-object p2, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout$a;->c:Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 98
    .line 99
    invoke-static {p2}, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->i(Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;)F

    .line 100
    .line 101
    .line 102
    move-result p2

    .line 103
    cmpl-float p2, p2, p4

    .line 104
    .line 105
    if-nez p2, :cond_2

    .line 106
    .line 107
    iget-object p2, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout$a;->c:Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 108
    .line 109
    invoke-static {p2}, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->a(Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;)Z

    .line 110
    .line 111
    .line 112
    move-result p2

    .line 113
    if-eqz p2, :cond_2

    .line 114
    .line 115
    iget-object p2, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout$a;->c:Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 116
    .line 117
    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 118
    .line 119
    .line 120
    move-result-object p2

    .line 121
    check-cast p2, Landroid/app/Activity;

    .line 122
    .line 123
    invoke-static {p2}, Ll/ynk0;->a(Landroid/app/Activity;)V

    .line 124
    .line 125
    .line 126
    :cond_2
    const/high16 p2, 0x3f800000    # 1.0f

    .line 127
    .line 128
    if-eqz p1, :cond_3

    .line 129
    .line 130
    iget-object p3, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout$a;->c:Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 131
    .line 132
    iget p5, p3, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->o:I

    .line 133
    .line 134
    neg-int p5, p5

    .line 135
    int-to-float p5, p5

    .line 136
    invoke-static {p3}, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->i(Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;)F

    .line 137
    .line 138
    .line 139
    move-result p3

    .line 140
    sub-float p3, p2, p3

    .line 141
    .line 142
    invoke-static {p3, p4}, Ljava/lang/Math;->max(FF)F

    .line 143
    .line 144
    .line 145
    move-result p3

    .line 146
    mul-float/2addr p5, p3

    .line 147
    invoke-virtual {p1, p5}, Landroid/view/View;->setX(F)V

    .line 148
    .line 149
    .line 150
    iget-object p3, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout$a;->c:Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 151
    .line 152
    invoke-static {p3}, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->i(Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;)F

    .line 153
    .line 154
    .line 155
    move-result p3

    .line 156
    cmpl-float p3, p3, p4

    .line 157
    .line 158
    if-nez p3, :cond_3

    .line 159
    .line 160
    invoke-virtual {p1, p4}, Landroid/view/View;->setX(F)V

    .line 161
    .line 162
    .line 163
    :cond_3
    iget-object p3, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout$a;->c:Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 164
    .line 165
    invoke-static {p3}, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->h(Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;)Ljava/util/List;

    .line 166
    .line 167
    .line 168
    move-result-object p3

    .line 169
    if-eqz p3, :cond_4

    .line 170
    .line 171
    iget-object p3, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout$a;->c:Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 172
    .line 173
    invoke-static {p3}, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->h(Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;)Ljava/util/List;

    .line 174
    .line 175
    .line 176
    move-result-object p3

    .line 177
    invoke-interface {p3}, Ljava/util/List;->isEmpty()Z

    .line 178
    .line 179
    .line 180
    move-result p3

    .line 181
    if-nez p3, :cond_4

    .line 182
    .line 183
    iget-object p3, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout$a;->c:Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 184
    .line 185
    invoke-static {p3}, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->h(Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;)Ljava/util/List;

    .line 186
    .line 187
    .line 188
    move-result-object p3

    .line 189
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 190
    .line 191
    .line 192
    move-result-object p3

    .line 193
    :goto_0
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    .line 194
    .line 195
    .line 196
    move-result p5

    .line 197
    if-eqz p5, :cond_4

    .line 198
    .line 199
    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 200
    .line 201
    .line 202
    move-result-object p5

    .line 203
    check-cast p5, Ll/ujh0;

    .line 204
    .line 205
    iget-boolean v0, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout$a;->b:Z

    .line 206
    .line 207
    iget-object v1, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout$a;->c:Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 208
    .line 209
    invoke-static {v1}, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->i(Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;)F

    .line 210
    .line 211
    .line 212
    move-result v1

    .line 213
    iget-object v2, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout$a;->c:Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 214
    .line 215
    invoke-static {v2}, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->e(Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;)I

    .line 216
    .line 217
    .line 218
    move-result v2

    .line 219
    invoke-interface {p5, v0, v1, v2}, Ll/ujh0;->E0(ZFI)V

    .line 220
    .line 221
    .line 222
    goto :goto_0

    .line 223
    :cond_4
    iget-object p3, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout$a;->c:Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 224
    .line 225
    invoke-static {p3}, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->i(Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;)F

    .line 226
    .line 227
    .line 228
    move-result p3

    .line 229
    cmpl-float p2, p3, p2

    .line 230
    .line 231
    if-ltz p2, :cond_6

    .line 232
    .line 233
    iget-object p2, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout$a;->c:Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 234
    .line 235
    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 236
    .line 237
    .line 238
    move-result-object p2

    .line 239
    check-cast p2, Landroid/app/Activity;

    .line 240
    .line 241
    invoke-virtual {p2}, Landroid/app/Activity;->isFinishing()Z

    .line 242
    .line 243
    .line 244
    move-result p3

    .line 245
    if-nez p3, :cond_6

    .line 246
    .line 247
    if-eqz p1, :cond_5

    .line 248
    .line 249
    invoke-virtual {p1, p4}, Landroid/view/View;->setX(F)V

    .line 250
    .line 251
    .line 252
    iget-object p1, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout$a;->c:Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 253
    .line 254
    invoke-static {p1}, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->h(Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;)Ljava/util/List;

    .line 255
    .line 256
    .line 257
    move-result-object p1

    .line 258
    if-eqz p1, :cond_5

    .line 259
    .line 260
    iget-object p1, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout$a;->c:Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 261
    .line 262
    invoke-static {p1}, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->h(Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;)Ljava/util/List;

    .line 263
    .line 264
    .line 265
    move-result-object p1

    .line 266
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 267
    .line 268
    .line 269
    move-result p1

    .line 270
    if-nez p1, :cond_5

    .line 271
    .line 272
    iget-object p1, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout$a;->c:Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 273
    .line 274
    invoke-static {p1}, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->i(Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;)F

    .line 275
    .line 276
    .line 277
    move-result p1

    .line 278
    iget-object p3, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout$a;->c:Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 279
    .line 280
    invoke-static {p3}, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->j(Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;)F

    .line 281
    .line 282
    .line 283
    move-result p3

    .line 284
    cmpl-float p1, p1, p3

    .line 285
    .line 286
    if-ltz p1, :cond_5

    .line 287
    .line 288
    iget-boolean p1, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout$a;->a:Z

    .line 289
    .line 290
    if-eqz p1, :cond_5

    .line 291
    .line 292
    const/4 p1, 0x0

    .line 293
    iput-boolean p1, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout$a;->a:Z

    .line 294
    .line 295
    iget-object p0, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout$a;->c:Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 296
    .line 297
    invoke-static {p0}, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->h(Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;)Ljava/util/List;

    .line 298
    .line 299
    .line 300
    move-result-object p0

    .line 301
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 302
    .line 303
    .line 304
    move-result-object p0

    .line 305
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 306
    .line 307
    .line 308
    move-result p1

    .line 309
    if-eqz p1, :cond_5

    .line 310
    .line 311
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 312
    .line 313
    .line 314
    move-result-object p1

    .line 315
    check-cast p1, Ll/ujh0;

    .line 316
    .line 317
    invoke-interface {p1}, Ll/ujh0;->P()V

    .line 318
    .line 319
    .line 320
    goto :goto_1

    .line 321
    :cond_5
    invoke-virtual {p2}, Landroid/app/Activity;->finish()V

    .line 322
    .line 323
    .line 324
    :cond_6
    return-void
.end method

.method public onViewReleased(Landroid/view/View;FF)V
    .locals 5

    .line 1
    const/4 p3, 0x1

    .line 2
    iput-boolean p3, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout$a;->b:Z

    .line 3
    .line 4
    iget-object p3, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout$a;->c:Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 5
    .line 6
    invoke-static {p3}, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->i(Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;)F

    .line 7
    .line 8
    .line 9
    move-result p3

    .line 10
    const/4 v0, 0x0

    .line 11
    cmpl-float p3, p3, v0

    .line 12
    .line 13
    if-nez p3, :cond_0

    .line 14
    .line 15
    iget-object p3, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout$a;->c:Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 16
    .line 17
    invoke-static {p3}, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->h(Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;)Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object p3

    .line 21
    if-eqz p3, :cond_0

    .line 22
    .line 23
    iget-object p3, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout$a;->c:Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 24
    .line 25
    invoke-static {p3}, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->h(Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;)Ljava/util/List;

    .line 26
    .line 27
    .line 28
    move-result-object p3

    .line 29
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 30
    .line 31
    .line 32
    move-result-object p3

    .line 33
    :goto_0
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_0

    .line 38
    .line 39
    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    check-cast v1, Ll/ujh0;

    .line 44
    .line 45
    iget-boolean v2, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout$a;->b:Z

    .line 46
    .line 47
    iget-object v3, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout$a;->c:Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 48
    .line 49
    invoke-static {v3}, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->i(Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;)F

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    iget-object v4, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout$a;->c:Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 54
    .line 55
    invoke-static {v4}, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->e(Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;)I

    .line 56
    .line 57
    .line 58
    move-result v4

    .line 59
    invoke-interface {v1, v2, v3, v4}, Ll/ujh0;->E0(ZFI)V

    .line 60
    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_0
    iget-object p3, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout$a;->c:Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 64
    .line 65
    invoke-virtual {p3}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 66
    .line 67
    .line 68
    move-result-object p3

    .line 69
    check-cast p3, Landroid/app/Activity;

    .line 70
    .line 71
    invoke-virtual {p3}, Landroid/app/Activity;->isFinishing()Z

    .line 72
    .line 73
    .line 74
    move-result p3

    .line 75
    if-eqz p3, :cond_2

    .line 76
    .line 77
    iget-object p0, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout$a;->c:Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 78
    .line 79
    invoke-static {p0}, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->o(Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;)Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    if-eqz p0, :cond_1

    .line 84
    .line 85
    invoke-virtual {p0, v0}, Landroid/view/View;->setX(F)V

    .line 86
    .line 87
    .line 88
    :cond_1
    return-void

    .line 89
    :cond_2
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 90
    .line 91
    .line 92
    move-result p1

    .line 93
    cmpl-float p2, p2, v0

    .line 94
    .line 95
    const/4 p3, 0x0

    .line 96
    if-gtz p2, :cond_4

    .line 97
    .line 98
    if-nez p2, :cond_3

    .line 99
    .line 100
    iget-object p2, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout$a;->c:Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 101
    .line 102
    invoke-static {p2}, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->i(Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;)F

    .line 103
    .line 104
    .line 105
    move-result p2

    .line 106
    iget-object v0, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout$a;->c:Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 107
    .line 108
    invoke-static {v0}, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->j(Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;)F

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    cmpl-float p2, p2, v0

    .line 113
    .line 114
    if-lez p2, :cond_3

    .line 115
    .line 116
    goto :goto_1

    .line 117
    :cond_3
    move p1, p3

    .line 118
    goto :goto_2

    .line 119
    :cond_4
    :goto_1
    iget-object p2, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout$a;->c:Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 120
    .line 121
    iget-object p2, p2, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->h:Landroid/graphics/drawable/Drawable;

    .line 122
    .line 123
    invoke-virtual {p2}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    .line 124
    .line 125
    .line 126
    move-result p2

    .line 127
    add-int/2addr p1, p2

    .line 128
    add-int/lit8 p1, p1, 0xa

    .line 129
    .line 130
    :goto_2
    iget-object p2, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout$a;->c:Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 131
    .line 132
    invoke-static {p2}, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->g(Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;)Ll/ykl0;

    .line 133
    .line 134
    .line 135
    move-result-object p2

    .line 136
    invoke-virtual {p2, p1, p3}, Ll/ykl0;->O(II)Z

    .line 137
    .line 138
    .line 139
    iget-object p0, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout$a;->c:Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 140
    .line 141
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 142
    .line 143
    .line 144
    return-void
.end method

.method public tryCaptureView(Landroid/view/View;I)Z
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout$a;->c:Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->b(Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iget-object v0, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout$a;->c:Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    if-nez p1, :cond_0

    .line 11
    .line 12
    invoke-static {v0}, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->g(Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;)Ll/ykl0;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p1, v1, p2}, Ll/ykl0;->C(II)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    invoke-static {v0}, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->g(Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;)Ll/ykl0;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p1, p2}, Ll/ykl0;->D(I)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_1

    .line 30
    .line 31
    iget-object p1, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout$a;->c:Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 32
    .line 33
    invoke-static {p1}, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->c(Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;)F

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    iget-object p2, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout$a;->c:Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 38
    .line 39
    invoke-static {p2}, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->d(Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;)F

    .line 40
    .line 41
    .line 42
    move-result p2

    .line 43
    sub-float/2addr p1, p2

    .line 44
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    sget p2, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->C:I

    .line 49
    .line 50
    int-to-float p2, p2

    .line 51
    cmpg-float p1, p1, p2

    .line 52
    .line 53
    if-gez p1, :cond_1

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_1
    const/4 v1, 0x0

    .line 57
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout$a;->c:Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 58
    .line 59
    invoke-static {p1}, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->g(Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;)Ll/ykl0;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-virtual {p1}, Ll/ykl0;->A()I

    .line 64
    .line 65
    .line 66
    if-eqz v1, :cond_2

    .line 67
    .line 68
    iget-object p1, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout$a;->c:Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 69
    .line 70
    invoke-static {p1}, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->h(Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;)Ljava/util/List;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    if-eqz p1, :cond_2

    .line 75
    .line 76
    iget-object p1, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout$a;->c:Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 77
    .line 78
    invoke-static {p1}, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->h(Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;)Ljava/util/List;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 83
    .line 84
    .line 85
    move-result p1

    .line 86
    if-nez p1, :cond_2

    .line 87
    .line 88
    iget-object p0, p0, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout$a;->c:Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 89
    .line 90
    invoke-static {p0}, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->h(Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;)Ljava/util/List;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 99
    .line 100
    .line 101
    move-result p1

    .line 102
    if-eqz p1, :cond_2

    .line 103
    .line 104
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    check-cast p1, Ll/ujh0;

    .line 109
    .line 110
    invoke-interface {p1}, Ll/ujh0;->G0()V

    .line 111
    .line 112
    .line 113
    goto :goto_1

    .line 114
    :cond_2
    return v1
.end method
