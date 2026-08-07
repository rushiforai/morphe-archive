.class public Ll/bwb;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:I

.field public b:I

.field public c:I

.field public d:I

.field public e:I

.field public f:I

.field public g:I

.field public h:I

.field public i:I

.field public j:I

.field public k:Ll/q11;

.field public l:Z

.field public m:Z

.field public n:Z

.field public o:Z

.field public p:Z

.field public q:Z

.field public r:Z

.field public s:Z

.field public t:Ll/fwb;

.field public u:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/dw5;",
            ">;"
        }
    .end annotation
.end field

.field public v:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/dw5;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/bwb;->u:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/bwb;->v:Ljava/util/List;

    .line 17
    .line 18
    return-void
.end method

.method public static c(Landroid/content/Context;)Ll/bwb;
    .locals 3

    .line 1
    new-instance v0, Ll/m3d0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/m3d0;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    new-instance p0, Ll/bwb;

    .line 7
    .line 8
    invoke-direct {p0}, Ll/bwb;-><init>()V

    .line 9
    .line 10
    .line 11
    sget v1, Ll/z8c0;->y:I

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ll/m3d0;->a(I)I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    invoke-virtual {p0, v1}, Ll/bwb;->y(I)Ll/bwb;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    sget v1, Ll/z8c0;->z:I

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ll/m3d0;->a(I)I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    invoke-virtual {p0, v1}, Ll/bwb;->A(I)Ll/bwb;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    sget v1, Ll/z8c0;->A:I

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ll/m3d0;->a(I)I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    invoke-virtual {p0, v1}, Ll/bwb;->F(I)Ll/bwb;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    sget v1, Ll/z8c0;->B:I

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Ll/m3d0;->a(I)I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    invoke-virtual {p0, v1}, Ll/bwb;->M(I)Ll/bwb;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    sget v1, Ll/bac0;->g:I

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Ll/m3d0;->b(I)I

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    invoke-virtual {p0, v1}, Ll/bwb;->z(I)Ll/bwb;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    sget v1, Ll/bac0;->h:I

    .line 62
    .line 63
    invoke-virtual {v0, v1}, Ll/m3d0;->b(I)I

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    invoke-virtual {p0, v1}, Ll/bwb;->B(I)Ll/bwb;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    sget v1, Ll/bac0;->i:I

    .line 72
    .line 73
    invoke-virtual {v0, v1}, Ll/m3d0;->b(I)I

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    invoke-virtual {p0, v1}, Ll/bwb;->G(I)Ll/bwb;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    sget v1, Ll/bac0;->k:I

    .line 82
    .line 83
    invoke-virtual {v0, v1}, Ll/m3d0;->b(I)I

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    invoke-virtual {p0, v1}, Ll/bwb;->I(I)Ll/bwb;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    sget v1, Ll/bac0;->j:I

    .line 92
    .line 93
    invoke-virtual {v0, v1}, Ll/m3d0;->b(I)I

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    invoke-virtual {p0, v0}, Ll/bwb;->H(I)Ll/bwb;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    new-instance v0, Ll/q11;

    .line 102
    .line 103
    const/4 v1, 0x2

    .line 104
    const/4 v2, 0x1

    .line 105
    invoke-direct {v0, v1, v2}, Ll/q11;-><init>(II)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {p0, v0}, Ll/bwb;->x(Ll/q11;)Ll/bwb;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    invoke-virtual {p0, v2}, Ll/bwb;->O(Z)Ll/bwb;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    invoke-virtual {p0, v2}, Ll/bwb;->E(Z)Ll/bwb;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    new-instance v0, Lcom/p1/mobile/android/ui/cropiwa/shape/CropIwaRectShape;

    .line 121
    .line 122
    invoke-direct {v0, p0}, Lcom/p1/mobile/android/ui/cropiwa/shape/CropIwaRectShape;-><init>(Ll/bwb;)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {p0, v0}, Ll/bwb;->C(Ll/fwb;)Ll/bwb;

    .line 126
    .line 127
    .line 128
    return-object p0
.end method

.method public static d(Landroid/content/Context;Landroid/util/AttributeSet;)Ll/bwb;
    .locals 4

    .line 1
    invoke-static {p0}, Ll/bwb;->c(Landroid/content/Context;)Ll/bwb;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    return-object v0

    .line 8
    :cond_0
    sget-object v1, Ll/hhc0;->C:[I

    .line 9
    .line 10
    invoke-virtual {p0, p1, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    :try_start_0
    sget p1, Ll/hhc0;->V:I

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/bwb;->n()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    invoke-virtual {p0, p1, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    invoke-virtual {v0, p1}, Ll/bwb;->I(I)Ll/bwb;

    .line 25
    .line 26
    .line 27
    sget p1, Ll/hhc0;->U:I

    .line 28
    .line 29
    invoke-virtual {v0}, Ll/bwb;->m()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    invoke-virtual {p0, p1, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    invoke-virtual {v0, p1}, Ll/bwb;->H(I)Ll/bwb;

    .line 38
    .line 39
    .line 40
    new-instance p1, Ll/q11;

    .line 41
    .line 42
    sget v1, Ll/hhc0;->E:I

    .line 43
    .line 44
    const/4 v2, 0x1

    .line 45
    invoke-virtual {p0, v1, v2}, Landroid/content/res/TypedArray;->getInteger(II)I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    sget v3, Ll/hhc0;->D:I

    .line 50
    .line 51
    invoke-virtual {p0, v3, v2}, Landroid/content/res/TypedArray;->getInteger(II)I

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    invoke-direct {p1, v1, v2}, Ll/q11;-><init>(II)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0, p1}, Ll/bwb;->x(Ll/q11;)Ll/bwb;

    .line 59
    .line 60
    .line 61
    sget p1, Ll/hhc0;->F:I

    .line 62
    .line 63
    invoke-virtual {v0}, Ll/bwb;->f()I

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    invoke-virtual {p0, p1, v1}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    invoke-virtual {v0, p1}, Ll/bwb;->y(I)Ll/bwb;

    .line 72
    .line 73
    .line 74
    sget p1, Ll/hhc0;->G:I

    .line 75
    .line 76
    invoke-virtual {v0}, Ll/bwb;->g()I

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    invoke-virtual {p0, p1, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 81
    .line 82
    .line 83
    move-result p1

    .line 84
    invoke-virtual {v0, p1}, Ll/bwb;->z(I)Ll/bwb;

    .line 85
    .line 86
    .line 87
    sget p1, Ll/hhc0;->H:I

    .line 88
    .line 89
    invoke-virtual {v0}, Ll/bwb;->h()I

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    invoke-virtual {p0, p1, v1}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 94
    .line 95
    .line 96
    move-result p1

    .line 97
    invoke-virtual {v0, p1}, Ll/bwb;->A(I)Ll/bwb;

    .line 98
    .line 99
    .line 100
    sget p1, Ll/hhc0;->I:I

    .line 101
    .line 102
    invoke-virtual {v0}, Ll/bwb;->i()I

    .line 103
    .line 104
    .line 105
    move-result v1

    .line 106
    invoke-virtual {p0, p1, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 107
    .line 108
    .line 109
    move-result p1

    .line 110
    invoke-virtual {v0, p1}, Ll/bwb;->B(I)Ll/bwb;

    .line 111
    .line 112
    .line 113
    sget p1, Ll/hhc0;->Q:I

    .line 114
    .line 115
    invoke-virtual {v0}, Ll/bwb;->k()I

    .line 116
    .line 117
    .line 118
    move-result v1

    .line 119
    invoke-virtual {p0, p1, v1}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 120
    .line 121
    .line 122
    move-result p1

    .line 123
    invoke-virtual {v0, p1}, Ll/bwb;->F(I)Ll/bwb;

    .line 124
    .line 125
    .line 126
    sget p1, Ll/hhc0;->R:I

    .line 127
    .line 128
    invoke-virtual {v0}, Ll/bwb;->l()I

    .line 129
    .line 130
    .line 131
    move-result v1

    .line 132
    invoke-virtual {p0, p1, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 133
    .line 134
    .line 135
    move-result p1

    .line 136
    invoke-virtual {v0, p1}, Ll/bwb;->G(I)Ll/bwb;

    .line 137
    .line 138
    .line 139
    sget p1, Ll/hhc0;->L:I

    .line 140
    .line 141
    invoke-virtual {v0}, Ll/bwb;->Q()Z

    .line 142
    .line 143
    .line 144
    move-result v1

    .line 145
    invoke-virtual {p0, p1, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 146
    .line 147
    .line 148
    move-result p1

    .line 149
    invoke-virtual {v0, p1}, Ll/bwb;->O(Z)Ll/bwb;

    .line 150
    .line 151
    .line 152
    sget p1, Ll/hhc0;->W:I

    .line 153
    .line 154
    invoke-virtual {v0}, Ll/bwb;->o()I

    .line 155
    .line 156
    .line 157
    move-result v1

    .line 158
    invoke-virtual {p0, p1, v1}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 159
    .line 160
    .line 161
    move-result p1

    .line 162
    invoke-virtual {v0, p1}, Ll/bwb;->M(I)Ll/bwb;

    .line 163
    .line 164
    .line 165
    sget p1, Ll/hhc0;->M:I

    .line 166
    .line 167
    const/4 v1, 0x0

    .line 168
    invoke-virtual {p0, p1, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 169
    .line 170
    .line 171
    move-result p1

    .line 172
    invoke-virtual {v0, p1}, Ll/bwb;->J(Z)Ll/bwb;

    .line 173
    .line 174
    .line 175
    sget p1, Ll/hhc0;->O:I

    .line 176
    .line 177
    invoke-virtual {p0, p1, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 178
    .line 179
    .line 180
    move-result p1

    .line 181
    invoke-virtual {v0, p1}, Ll/bwb;->L(Z)Ll/bwb;

    .line 182
    .line 183
    .line 184
    sget p1, Ll/hhc0;->N:I

    .line 185
    .line 186
    invoke-virtual {p0, p1, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 187
    .line 188
    .line 189
    move-result p1

    .line 190
    invoke-virtual {v0, p1}, Ll/bwb;->K(Z)Ll/bwb;

    .line 191
    .line 192
    .line 193
    invoke-virtual {v0}, Ll/bwb;->s()Z

    .line 194
    .line 195
    .line 196
    move-result p1

    .line 197
    if-eqz p1, :cond_1

    .line 198
    .line 199
    new-instance p1, Ll/yvb;

    .line 200
    .line 201
    invoke-direct {p1, v0}, Ll/yvb;-><init>(Ll/bwb;)V

    .line 202
    .line 203
    .line 204
    invoke-virtual {v0, p1}, Ll/bwb;->C(Ll/fwb;)Ll/bwb;

    .line 205
    .line 206
    .line 207
    goto :goto_1

    .line 208
    :catchall_0
    move-exception p1

    .line 209
    goto :goto_2

    .line 210
    :cond_1
    invoke-virtual {v0}, Ll/bwb;->t()Z

    .line 211
    .line 212
    .line 213
    move-result p1

    .line 214
    if-eqz p1, :cond_3

    .line 215
    .line 216
    iget-boolean p1, v0, Ll/bwb;->r:Z

    .line 217
    .line 218
    if-eqz p1, :cond_2

    .line 219
    .line 220
    new-instance p1, Ll/zvb;

    .line 221
    .line 222
    invoke-direct {p1, v0}, Ll/zvb;-><init>(Ll/bwb;)V

    .line 223
    .line 224
    .line 225
    invoke-virtual {v0, p1}, Ll/bwb;->C(Ll/fwb;)Ll/bwb;

    .line 226
    .line 227
    .line 228
    goto :goto_1

    .line 229
    :cond_2
    new-instance p1, Ll/yvb;

    .line 230
    .line 231
    invoke-direct {p1, v0}, Ll/yvb;-><init>(Ll/bwb;)V

    .line 232
    .line 233
    .line 234
    invoke-virtual {v0, p1}, Ll/bwb;->C(Ll/fwb;)Ll/bwb;

    .line 235
    .line 236
    .line 237
    goto :goto_1

    .line 238
    :cond_3
    invoke-virtual {v0}, Ll/bwb;->u()Z

    .line 239
    .line 240
    .line 241
    move-result p1

    .line 242
    if-eqz p1, :cond_4

    .line 243
    .line 244
    new-instance p1, Ll/owb;

    .line 245
    .line 246
    invoke-direct {p1, v0}, Ll/owb;-><init>(Ll/bwb;)V

    .line 247
    .line 248
    .line 249
    invoke-virtual {v0, p1}, Ll/bwb;->C(Ll/fwb;)Ll/bwb;

    .line 250
    .line 251
    .line 252
    goto :goto_1

    .line 253
    :cond_4
    sget p1, Ll/hhc0;->J:I

    .line 254
    .line 255
    invoke-virtual {p0, p1, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 256
    .line 257
    .line 258
    move-result p1

    .line 259
    if-nez p1, :cond_5

    .line 260
    .line 261
    new-instance p1, Lcom/p1/mobile/android/ui/cropiwa/shape/CropIwaRectShape;

    .line 262
    .line 263
    invoke-direct {p1, v0}, Lcom/p1/mobile/android/ui/cropiwa/shape/CropIwaRectShape;-><init>(Ll/bwb;)V

    .line 264
    .line 265
    .line 266
    goto :goto_0

    .line 267
    :cond_5
    new-instance p1, Lcom/p1/mobile/android/ui/cropiwa/shape/CropIwaOvalShape;

    .line 268
    .line 269
    invoke-direct {p1, v0}, Lcom/p1/mobile/android/ui/cropiwa/shape/CropIwaOvalShape;-><init>(Ll/bwb;)V

    .line 270
    .line 271
    .line 272
    :goto_0
    invoke-virtual {v0, p1}, Ll/bwb;->C(Ll/fwb;)Ll/bwb;

    .line 273
    .line 274
    .line 275
    :goto_1
    sget p1, Ll/hhc0;->P:I

    .line 276
    .line 277
    invoke-virtual {v0}, Ll/bwb;->q()Z

    .line 278
    .line 279
    .line 280
    move-result v1

    .line 281
    invoke-virtual {p0, p1, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 282
    .line 283
    .line 284
    move-result p1

    .line 285
    invoke-virtual {v0, p1}, Ll/bwb;->E(Z)Ll/bwb;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 286
    .line 287
    .line 288
    invoke-virtual {p0}, Landroid/content/res/TypedArray;->recycle()V

    .line 289
    .line 290
    .line 291
    return-object v0

    .line 292
    :goto_2
    invoke-virtual {p0}, Landroid/content/res/TypedArray;->recycle()V

    .line 293
    .line 294
    .line 295
    throw p1
.end method


# virtual methods
.method public A(I)Ll/bwb;
    .locals 0

    .line 1
    iput p1, p0, Ll/bwb;->c:I

    .line 2
    .line 3
    return-object p0
.end method

.method public B(I)Ll/bwb;
    .locals 0

    .line 1
    iput p1, p0, Ll/bwb;->f:I

    .line 2
    .line 3
    return-object p0
.end method

.method public C(Ll/fwb;)Ll/bwb;
    .locals 1
    .param p1    # Ll/fwb;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/bwb;->t:Ll/fwb;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ll/bwb;->w(Ll/dw5;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iput-object p1, p0, Ll/bwb;->t:Ll/fwb;

    .line 9
    .line 10
    return-object p0
.end method

.method public D(Z)Ll/bwb;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/bwb;->r:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public E(Z)Ll/bwb;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/bwb;->l:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public F(I)Ll/bwb;
    .locals 0

    .line 1
    iput p1, p0, Ll/bwb;->d:I

    .line 2
    .line 3
    return-object p0
.end method

.method public G(I)Ll/bwb;
    .locals 0

    .line 1
    iput p1, p0, Ll/bwb;->g:I

    .line 2
    .line 3
    return-object p0
.end method

.method public H(I)Ll/bwb;
    .locals 0

    .line 1
    iput p1, p0, Ll/bwb;->h:I

    .line 2
    .line 3
    return-object p0
.end method

.method public I(I)Ll/bwb;
    .locals 0

    .line 1
    iput p1, p0, Ll/bwb;->i:I

    .line 2
    .line 3
    return-object p0
.end method

.method public J(Z)Ll/bwb;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/bwb;->m:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public K(Z)Ll/bwb;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/bwb;->o:Z

    .line 2
    .line 3
    if-eqz p1, :cond_1

    .line 4
    .line 5
    iget-boolean p1, p0, Ll/bwb;->r:Z

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    new-instance p1, Ll/zvb;

    .line 10
    .line 11
    invoke-direct {p1, p0}, Ll/zvb;-><init>(Ll/bwb;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p1}, Ll/bwb;->C(Ll/fwb;)Ll/bwb;

    .line 15
    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_0
    new-instance p1, Ll/yvb;

    .line 19
    .line 20
    invoke-direct {p1, p0}, Ll/yvb;-><init>(Ll/bwb;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, p1}, Ll/bwb;->C(Ll/fwb;)Ll/bwb;

    .line 24
    .line 25
    .line 26
    :cond_1
    return-object p0
.end method

.method public L(Z)Ll/bwb;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/bwb;->n:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public M(I)Ll/bwb;
    .locals 0

    .line 1
    iput p1, p0, Ll/bwb;->a:I

    .line 2
    .line 3
    return-object p0
.end method

.method public N(Z)Ll/bwb;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/bwb;->q:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public O(Z)Ll/bwb;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/bwb;->s:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public P(I)Ll/bwb;
    .locals 0

    .line 1
    iput p1, p0, Ll/bwb;->j:I

    .line 2
    .line 3
    return-object p0
.end method

.method public Q()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/bwb;->s:Z

    .line 2
    .line 3
    return p0
.end method

.method public a(Ll/dw5;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ll/bwb;->u:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public b()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/bwb;->v:Ljava/util/List;

    .line 2
    .line 3
    iget-object v1, p0, Ll/bwb;->u:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/bwb;->v:Ljava/util/List;

    .line 9
    .line 10
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Ll/dw5;

    .line 25
    .line 26
    invoke-interface {v1}, Ll/dw5;->a()V

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    iget-object p0, p0, Ll/bwb;->v:Ljava/util/List;

    .line 31
    .line 32
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public e()Ll/q11;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bwb;->k:Ll/q11;

    .line 2
    .line 3
    return-object p0
.end method

.method public f()I
    .locals 0

    .line 1
    iget p0, p0, Ll/bwb;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public g()I
    .locals 0

    .line 1
    iget p0, p0, Ll/bwb;->e:I

    .line 2
    .line 3
    return p0
.end method

.method public h()I
    .locals 0

    .line 1
    iget p0, p0, Ll/bwb;->c:I

    .line 2
    .line 3
    return p0
.end method

.method public i()I
    .locals 0

    .line 1
    iget p0, p0, Ll/bwb;->f:I

    .line 2
    .line 3
    return p0
.end method

.method public j()Ll/fwb;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bwb;->t:Ll/fwb;

    .line 2
    .line 3
    return-object p0
.end method

.method public k()I
    .locals 0

    .line 1
    iget p0, p0, Ll/bwb;->d:I

    .line 2
    .line 3
    return p0
.end method

.method public l()I
    .locals 0

    .line 1
    iget p0, p0, Ll/bwb;->g:I

    .line 2
    .line 3
    return p0
.end method

.method public m()I
    .locals 0

    .line 1
    iget p0, p0, Ll/bwb;->h:I

    .line 2
    .line 3
    return p0
.end method

.method public n()I
    .locals 0

    .line 1
    iget p0, p0, Ll/bwb;->i:I

    .line 2
    .line 3
    return p0
.end method

.method public o()I
    .locals 0

    .line 1
    iget p0, p0, Ll/bwb;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public p()I
    .locals 0

    .line 1
    iget p0, p0, Ll/bwb;->j:I

    .line 2
    .line 3
    return p0
.end method

.method public q()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/bwb;->l:Z

    .line 2
    .line 3
    return p0
.end method

.method public r()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/bwb;->p:Z

    .line 2
    .line 3
    return p0
.end method

.method public s()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/bwb;->m:Z

    .line 2
    .line 3
    return p0
.end method

.method public t()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/bwb;->o:Z

    .line 2
    .line 3
    return p0
.end method

.method public u()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/bwb;->n:Z

    .line 2
    .line 3
    return p0
.end method

.method public v()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/bwb;->q:Z

    .line 2
    .line 3
    return p0
.end method

.method public w(Ll/dw5;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bwb;->u:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public x(Ll/q11;)Ll/bwb;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/bwb;->k:Ll/q11;

    .line 2
    .line 3
    return-object p0
.end method

.method public y(I)Ll/bwb;
    .locals 0

    .line 1
    iput p1, p0, Ll/bwb;->b:I

    .line 2
    .line 3
    return-object p0
.end method

.method public z(I)Ll/bwb;
    .locals 0

    .line 1
    iput p1, p0, Ll/bwb;->e:I

    .line 2
    .line 3
    return-object p0
.end method
