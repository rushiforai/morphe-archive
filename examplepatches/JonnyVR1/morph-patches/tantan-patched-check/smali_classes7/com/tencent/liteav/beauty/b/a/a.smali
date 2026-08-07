.class public Lcom/tencent/liteav/beauty/b/a/a;
.super Lcom/tencent/liteav/beauty/b/b;
.source "SourceFile"


# instance fields
.field private A:I

.field private B:F

.field private final C:F

.field private D:F

.field private E:F

.field private F:I

.field private G:I

.field private H:I

.field private I:I

.field private r:Lcom/tencent/liteav/beauty/b/a/c;

.field private s:Lcom/tencent/liteav/beauty/b/a/d;

.field private t:Lcom/tencent/liteav/beauty/b/a/e;

.field private u:Lcom/tencent/liteav/beauty/b/h;

.field private v:Lcom/tencent/liteav/beauty/b/r;

.field private w:Lcom/tencent/liteav/beauty/b/a/b;

.field private x:Ljava/lang/String;

.field private y:I

.field private z:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/tencent/liteav/beauty/b/b;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/tencent/liteav/beauty/b/a/a;->r:Lcom/tencent/liteav/beauty/b/a/c;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/tencent/liteav/beauty/b/a/a;->s:Lcom/tencent/liteav/beauty/b/a/d;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/tencent/liteav/beauty/b/a/a;->t:Lcom/tencent/liteav/beauty/b/a/e;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/tencent/liteav/beauty/b/a/a;->u:Lcom/tencent/liteav/beauty/b/h;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/tencent/liteav/beauty/b/a/a;->v:Lcom/tencent/liteav/beauty/b/r;

    .line 14
    .line 15
    iput-object v0, p0, Lcom/tencent/liteav/beauty/b/a/a;->w:Lcom/tencent/liteav/beauty/b/a/b;

    .line 16
    .line 17
    const-string v0, "TXCBeauty2Filter"

    .line 18
    .line 19
    iput-object v0, p0, Lcom/tencent/liteav/beauty/b/a/a;->x:Ljava/lang/String;

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    iput v0, p0, Lcom/tencent/liteav/beauty/b/a/a;->y:I

    .line 23
    .line 24
    iput v0, p0, Lcom/tencent/liteav/beauty/b/a/a;->z:I

    .line 25
    .line 26
    iput v0, p0, Lcom/tencent/liteav/beauty/b/a/a;->A:I

    .line 27
    .line 28
    const/high16 v1, 0x3f800000    # 1.0f

    .line 29
    .line 30
    iput v1, p0, Lcom/tencent/liteav/beauty/b/a/a;->B:F

    .line 31
    .line 32
    const v1, 0x3f333333    # 0.7f

    .line 33
    .line 34
    .line 35
    iput v1, p0, Lcom/tencent/liteav/beauty/b/a/a;->C:F

    .line 36
    .line 37
    const v1, 0x3f4ccccd    # 0.8f

    .line 38
    .line 39
    .line 40
    iput v1, p0, Lcom/tencent/liteav/beauty/b/a/a;->D:F

    .line 41
    .line 42
    const/high16 v1, 0x40000000    # 2.0f

    .line 43
    .line 44
    iput v1, p0, Lcom/tencent/liteav/beauty/b/a/a;->E:F

    .line 45
    .line 46
    iput v0, p0, Lcom/tencent/liteav/beauty/b/a/a;->F:I

    .line 47
    .line 48
    iput v0, p0, Lcom/tencent/liteav/beauty/b/a/a;->G:I

    .line 49
    .line 50
    iput v0, p0, Lcom/tencent/liteav/beauty/b/a/a;->H:I

    .line 51
    .line 52
    iput v0, p0, Lcom/tencent/liteav/beauty/b/a/a;->I:I

    .line 53
    .line 54
    return-void
.end method

.method private d(II)Z
    .locals 6

    .line 1
    iput p1, p0, Lcom/tencent/liteav/beauty/b/a/a;->F:I

    .line 2
    .line 3
    iput p2, p0, Lcom/tencent/liteav/beauty/b/a/a;->G:I

    .line 4
    .line 5
    iput p1, p0, Lcom/tencent/liteav/beauty/b/a/a;->H:I

    .line 6
    .line 7
    iput p2, p0, Lcom/tencent/liteav/beauty/b/a/a;->I:I

    .line 8
    .line 9
    iget v0, p0, Lcom/tencent/liteav/beauty/b/a/a;->E:F

    .line 10
    .line 11
    const/high16 v1, 0x3f800000    # 1.0f

    .line 12
    .line 13
    cmpl-float v2, v1, v0

    .line 14
    .line 15
    if-eqz v2, :cond_0

    .line 16
    .line 17
    int-to-float v2, p1

    .line 18
    div-float/2addr v2, v0

    .line 19
    float-to-int v2, v2

    .line 20
    iput v2, p0, Lcom/tencent/liteav/beauty/b/a/a;->H:I

    .line 21
    .line 22
    int-to-float v2, p2

    .line 23
    div-float/2addr v2, v0

    .line 24
    float-to-int v0, v2

    .line 25
    iput v0, p0, Lcom/tencent/liteav/beauty/b/a/a;->I:I

    .line 26
    .line 27
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/a/a;->x:Ljava/lang/String;

    .line 28
    .line 29
    new-instance v2, Ljava/lang/StringBuilder;

    .line 30
    .line 31
    const-string v3, "mResampleRatio "

    .line 32
    .line 33
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iget v3, p0, Lcom/tencent/liteav/beauty/b/a/a;->E:F

    .line 37
    .line 38
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    const-string v3, " mResampleWidth "

    .line 42
    .line 43
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    iget v3, p0, Lcom/tencent/liteav/beauty/b/a/a;->H:I

    .line 47
    .line 48
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    const-string v3, " mResampleHeight "

    .line 52
    .line 53
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    iget v3, p0, Lcom/tencent/liteav/beauty/b/a/a;->I:I

    .line 57
    .line 58
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    invoke-static {v0, v2}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/a/a;->w:Lcom/tencent/liteav/beauty/b/a/b;

    .line 69
    .line 70
    const/4 v2, 0x0

    .line 71
    const/4 v3, 0x1

    .line 72
    if-nez v0, :cond_1

    .line 73
    .line 74
    new-instance v0, Lcom/tencent/liteav/beauty/b/a/b;

    .line 75
    .line 76
    invoke-direct {v0}, Lcom/tencent/liteav/beauty/b/a/b;-><init>()V

    .line 77
    .line 78
    .line 79
    iput-object v0, p0, Lcom/tencent/liteav/beauty/b/a/a;->w:Lcom/tencent/liteav/beauty/b/a/b;

    .line 80
    .line 81
    invoke-virtual {v0, v3}, Lcom/tencent/liteav/basic/c/h;->a(Z)V

    .line 82
    .line 83
    .line 84
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/a/a;->w:Lcom/tencent/liteav/beauty/b/a/b;

    .line 85
    .line 86
    invoke-virtual {v0}, Lcom/tencent/liteav/beauty/b/a/b;->a()Z

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    if-nez v0, :cond_1

    .line 91
    .line 92
    iget-object p0, p0, Lcom/tencent/liteav/beauty/b/a/a;->x:Ljava/lang/String;

    .line 93
    .line 94
    const-string p1, "mBeautyBlendFilter init failed!!, break init"

    .line 95
    .line 96
    invoke-static {p0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    return v2

    .line 100
    :cond_1
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/a/a;->w:Lcom/tencent/liteav/beauty/b/a/b;

    .line 101
    .line 102
    invoke-virtual {v0, p1, p2}, Lcom/tencent/liteav/basic/c/h;->a(II)V

    .line 103
    .line 104
    .line 105
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/a/a;->s:Lcom/tencent/liteav/beauty/b/a/d;

    .line 106
    .line 107
    if-nez v0, :cond_2

    .line 108
    .line 109
    new-instance v0, Lcom/tencent/liteav/beauty/b/a/d;

    .line 110
    .line 111
    invoke-direct {v0}, Lcom/tencent/liteav/beauty/b/a/d;-><init>()V

    .line 112
    .line 113
    .line 114
    iput-object v0, p0, Lcom/tencent/liteav/beauty/b/a/a;->s:Lcom/tencent/liteav/beauty/b/a/d;

    .line 115
    .line 116
    invoke-virtual {v0, v3}, Lcom/tencent/liteav/basic/c/h;->a(Z)V

    .line 117
    .line 118
    .line 119
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/a/a;->s:Lcom/tencent/liteav/beauty/b/a/d;

    .line 120
    .line 121
    invoke-virtual {v0}, Lcom/tencent/liteav/beauty/b/a/d;->a()Z

    .line 122
    .line 123
    .line 124
    move-result v0

    .line 125
    if-nez v0, :cond_2

    .line 126
    .line 127
    iget-object p0, p0, Lcom/tencent/liteav/beauty/b/a/a;->x:Ljava/lang/String;

    .line 128
    .line 129
    const-string p1, "m_horizontalFilter init failed!!, break init"

    .line 130
    .line 131
    invoke-static {p0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    return v2

    .line 135
    :cond_2
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/a/a;->s:Lcom/tencent/liteav/beauty/b/a/d;

    .line 136
    .line 137
    iget v4, p0, Lcom/tencent/liteav/beauty/b/a/a;->H:I

    .line 138
    .line 139
    iget v5, p0, Lcom/tencent/liteav/beauty/b/a/a;->I:I

    .line 140
    .line 141
    invoke-virtual {v0, v4, v5}, Lcom/tencent/liteav/beauty/b/a/d;->a(II)V

    .line 142
    .line 143
    .line 144
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/a/a;->t:Lcom/tencent/liteav/beauty/b/a/e;

    .line 145
    .line 146
    if-nez v0, :cond_4

    .line 147
    .line 148
    new-instance v0, Lcom/tencent/liteav/beauty/b/a/e;

    .line 149
    .line 150
    invoke-direct {v0}, Lcom/tencent/liteav/beauty/b/a/e;-><init>()V

    .line 151
    .line 152
    .line 153
    iput-object v0, p0, Lcom/tencent/liteav/beauty/b/a/a;->t:Lcom/tencent/liteav/beauty/b/a/e;

    .line 154
    .line 155
    invoke-virtual {v0, v3}, Lcom/tencent/liteav/basic/c/h;->a(Z)V

    .line 156
    .line 157
    .line 158
    iget v0, p0, Lcom/tencent/liteav/beauty/b/a/a;->E:F

    .line 159
    .line 160
    cmpl-float v0, v1, v0

    .line 161
    .line 162
    if-nez v0, :cond_3

    .line 163
    .line 164
    move v0, v2

    .line 165
    goto :goto_0

    .line 166
    :cond_3
    move v0, v3

    .line 167
    :goto_0
    iget-object v4, p0, Lcom/tencent/liteav/beauty/b/a/a;->t:Lcom/tencent/liteav/beauty/b/a/e;

    .line 168
    .line 169
    invoke-virtual {v4, v0}, Lcom/tencent/liteav/basic/c/h;->b(Z)V

    .line 170
    .line 171
    .line 172
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/a/a;->t:Lcom/tencent/liteav/beauty/b/a/e;

    .line 173
    .line 174
    invoke-virtual {v0}, Lcom/tencent/liteav/beauty/b/a/e;->a()Z

    .line 175
    .line 176
    .line 177
    move-result v0

    .line 178
    if-nez v0, :cond_4

    .line 179
    .line 180
    iget-object p0, p0, Lcom/tencent/liteav/beauty/b/a/a;->x:Ljava/lang/String;

    .line 181
    .line 182
    const-string p1, "m_verticalFilter init failed!!, break init"

    .line 183
    .line 184
    invoke-static {p0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 185
    .line 186
    .line 187
    return v2

    .line 188
    :cond_4
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/a/a;->t:Lcom/tencent/liteav/beauty/b/a/e;

    .line 189
    .line 190
    iget v4, p0, Lcom/tencent/liteav/beauty/b/a/a;->H:I

    .line 191
    .line 192
    iget v5, p0, Lcom/tencent/liteav/beauty/b/a/a;->I:I

    .line 193
    .line 194
    invoke-virtual {v0, v4, v5}, Lcom/tencent/liteav/beauty/b/a/e;->a(II)V

    .line 195
    .line 196
    .line 197
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/a/a;->u:Lcom/tencent/liteav/beauty/b/h;

    .line 198
    .line 199
    if-nez v0, :cond_5

    .line 200
    .line 201
    new-instance v0, Lcom/tencent/liteav/beauty/b/h;

    .line 202
    .line 203
    invoke-direct {v0, v1}, Lcom/tencent/liteav/beauty/b/h;-><init>(F)V

    .line 204
    .line 205
    .line 206
    iput-object v0, p0, Lcom/tencent/liteav/beauty/b/a/a;->u:Lcom/tencent/liteav/beauty/b/h;

    .line 207
    .line 208
    invoke-virtual {v0, v3}, Lcom/tencent/liteav/basic/c/h;->a(Z)V

    .line 209
    .line 210
    .line 211
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/a/a;->u:Lcom/tencent/liteav/beauty/b/h;

    .line 212
    .line 213
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/h;->a()Z

    .line 214
    .line 215
    .line 216
    move-result v0

    .line 217
    if-nez v0, :cond_5

    .line 218
    .line 219
    iget-object p0, p0, Lcom/tencent/liteav/beauty/b/a/a;->x:Ljava/lang/String;

    .line 220
    .line 221
    const-string p1, "m_gammaFilter init failed!!, break init"

    .line 222
    .line 223
    invoke-static {p0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 224
    .line 225
    .line 226
    return v2

    .line 227
    :cond_5
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/a/a;->u:Lcom/tencent/liteav/beauty/b/h;

    .line 228
    .line 229
    iget v1, p0, Lcom/tencent/liteav/beauty/b/a/a;->H:I

    .line 230
    .line 231
    iget v4, p0, Lcom/tencent/liteav/beauty/b/a/a;->I:I

    .line 232
    .line 233
    invoke-virtual {v0, v1, v4}, Lcom/tencent/liteav/basic/c/h;->a(II)V

    .line 234
    .line 235
    .line 236
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/a/a;->v:Lcom/tencent/liteav/beauty/b/r;

    .line 237
    .line 238
    if-nez v0, :cond_6

    .line 239
    .line 240
    new-instance v0, Lcom/tencent/liteav/beauty/b/r;

    .line 241
    .line 242
    invoke-direct {v0}, Lcom/tencent/liteav/beauty/b/r;-><init>()V

    .line 243
    .line 244
    .line 245
    iput-object v0, p0, Lcom/tencent/liteav/beauty/b/a/a;->v:Lcom/tencent/liteav/beauty/b/r;

    .line 246
    .line 247
    invoke-virtual {v0, v3}, Lcom/tencent/liteav/basic/c/h;->a(Z)V

    .line 248
    .line 249
    .line 250
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/a/a;->v:Lcom/tencent/liteav/beauty/b/r;

    .line 251
    .line 252
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/h;->a()Z

    .line 253
    .line 254
    .line 255
    move-result v0

    .line 256
    if-nez v0, :cond_6

    .line 257
    .line 258
    iget-object p0, p0, Lcom/tencent/liteav/beauty/b/a/a;->x:Ljava/lang/String;

    .line 259
    .line 260
    const-string p1, "mSharpenFilter init failed!!, break init"

    .line 261
    .line 262
    invoke-static {p0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 263
    .line 264
    .line 265
    return v2

    .line 266
    :cond_6
    iget-object p0, p0, Lcom/tencent/liteav/beauty/b/a/a;->v:Lcom/tencent/liteav/beauty/b/r;

    .line 267
    .line 268
    invoke-virtual {p0, p1, p2}, Lcom/tencent/liteav/beauty/b/r;->a(II)V

    .line 269
    .line 270
    .line 271
    return v3
.end method

.method private g(I)V
    .locals 1

    .line 1
    int-to-float p1, p1

    .line 2
    const/high16 v0, 0x42480000    # 50.0f

    .line 3
    .line 4
    div-float/2addr p1, v0

    .line 5
    const/high16 v0, 0x3f800000    # 1.0f

    .line 6
    .line 7
    sub-float/2addr v0, p1

    .line 8
    iput v0, p0, Lcom/tencent/liteav/beauty/b/a/a;->B:F

    .line 9
    .line 10
    iget-object p0, p0, Lcom/tencent/liteav/beauty/b/a/a;->u:Lcom/tencent/liteav/beauty/b/h;

    .line 11
    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/beauty/b/h;->a(F)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method


# virtual methods
.method public a(II)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/tencent/liteav/basic/c/h;->e:I

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    iget v0, p0, Lcom/tencent/liteav/basic/c/h;->f:I

    .line 6
    .line 7
    if-ne v0, p2, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iput p1, p0, Lcom/tencent/liteav/basic/c/h;->e:I

    .line 11
    .line 12
    iput p2, p0, Lcom/tencent/liteav/basic/c/h;->f:I

    .line 13
    .line 14
    invoke-direct {p0, p1, p2}, Lcom/tencent/liteav/beauty/b/a/a;->d(II)Z

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public b(I)I
    .locals 4

    .line 1
    iget v0, p0, Lcom/tencent/liteav/beauty/b/a/a;->E:F

    .line 2
    .line 3
    const/high16 v1, 0x3f800000    # 1.0f

    .line 4
    .line 5
    cmpl-float v0, v1, v0

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget v0, p0, Lcom/tencent/liteav/beauty/b/a/a;->H:I

    .line 11
    .line 12
    iget v3, p0, Lcom/tencent/liteav/beauty/b/a/a;->I:I

    .line 13
    .line 14
    invoke-static {v2, v2, v0, v3}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/a/a;->s:Lcom/tencent/liteav/beauty/b/a/d;

    .line 18
    .line 19
    invoke-virtual {v0, p1}, Lcom/tencent/liteav/basic/c/h;->b(I)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    iget-object v3, p0, Lcom/tencent/liteav/beauty/b/a/a;->t:Lcom/tencent/liteav/beauty/b/a/e;

    .line 24
    .line 25
    invoke-virtual {v3, v0, p1}, Lcom/tencent/liteav/beauty/b/u;->c(II)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    iget v3, p0, Lcom/tencent/liteav/beauty/b/a/a;->E:F

    .line 30
    .line 31
    cmpl-float v1, v1, v3

    .line 32
    .line 33
    if-eqz v1, :cond_1

    .line 34
    .line 35
    iget v1, p0, Lcom/tencent/liteav/beauty/b/a/a;->F:I

    .line 36
    .line 37
    iget v3, p0, Lcom/tencent/liteav/beauty/b/a/a;->G:I

    .line 38
    .line 39
    invoke-static {v2, v2, v1, v3}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 40
    .line 41
    .line 42
    :cond_1
    iget v1, p0, Lcom/tencent/liteav/beauty/b/a/a;->D:F

    .line 43
    .line 44
    const v2, 0x3f333333    # 0.7f

    .line 45
    .line 46
    .line 47
    cmpl-float v1, v1, v2

    .line 48
    .line 49
    if-lez v1, :cond_2

    .line 50
    .line 51
    iget-object v1, p0, Lcom/tencent/liteav/beauty/b/a/a;->v:Lcom/tencent/liteav/beauty/b/r;

    .line 52
    .line 53
    invoke-virtual {v1, v0}, Lcom/tencent/liteav/basic/c/h;->b(I)I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    :cond_2
    iget-object p0, p0, Lcom/tencent/liteav/beauty/b/a/a;->w:Lcom/tencent/liteav/beauty/b/a/b;

    .line 58
    .line 59
    invoke-virtual {p0, v0, p1}, Lcom/tencent/liteav/beauty/b/u;->c(II)I

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    return p0
.end method

.method public c(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/a/a;->t:Lcom/tencent/liteav/beauty/b/a/e;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    int-to-float v1, p1

    .line 6
    const/high16 v2, 0x41200000    # 10.0f

    .line 7
    .line 8
    div-float/2addr v1, v2

    .line 9
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/beauty/b/a/e;->a(F)V

    .line 10
    .line 11
    .line 12
    :cond_0
    iput p1, p0, Lcom/tencent/liteav/beauty/b/a/a;->y:I

    .line 13
    .line 14
    invoke-direct {p0, p1}, Lcom/tencent/liteav/beauty/b/a/a;->g(I)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public c(II)Z
    .locals 0

    .line 18
    invoke-direct {p0, p1, p2}, Lcom/tencent/liteav/beauty/b/a/a;->d(II)Z

    move-result p0

    return p0
.end method

.method public d(I)V
    .locals 3

    .line 272
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/a/a;->w:Lcom/tencent/liteav/beauty/b/a/b;

    if-eqz v0, :cond_0

    int-to-float v1, p1

    const/high16 v2, 0x41200000    # 10.0f

    div-float/2addr v1, v2

    .line 273
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/beauty/b/a/b;->a(F)V

    .line 274
    :cond_0
    iput p1, p0, Lcom/tencent/liteav/beauty/b/a/a;->z:I

    return-void
.end method

.method public e()V
    .locals 0

    .line 15
    invoke-super {p0}, Lcom/tencent/liteav/basic/c/h;->e()V

    .line 16
    invoke-virtual {p0}, Lcom/tencent/liteav/beauty/b/a/a;->q()V

    return-void
.end method

.method public e(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/a/a;->w:Lcom/tencent/liteav/beauty/b/a/b;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    int-to-float v1, p1

    .line 6
    const/high16 v2, 0x41200000    # 10.0f

    .line 7
    .line 8
    div-float/2addr v1, v2

    .line 9
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/beauty/b/a/b;->b(F)V

    .line 10
    .line 11
    .line 12
    :cond_0
    iput p1, p0, Lcom/tencent/liteav/beauty/b/a/a;->A:I

    .line 13
    .line 14
    return-void
.end method

.method public f(I)V
    .locals 5

    .line 1
    int-to-float v0, p1

    .line 2
    const/high16 v1, 0x41400000    # 12.0f

    .line 3
    .line 4
    div-float/2addr v0, v1

    .line 5
    const v1, 0x3f333333    # 0.7f

    .line 6
    .line 7
    .line 8
    add-float/2addr v0, v1

    .line 9
    iget v1, p0, Lcom/tencent/liteav/beauty/b/a/a;->D:F

    .line 10
    .line 11
    sub-float/2addr v1, v0

    .line 12
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    float-to-double v1, v1

    .line 17
    const-wide v3, 0x3f50624dd2f1a9fcL    # 0.001

    .line 18
    .line 19
    .line 20
    .line 21
    .line 22
    cmpg-double v1, v1, v3

    .line 23
    .line 24
    if-gez v1, :cond_0

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    iput v0, p0, Lcom/tencent/liteav/beauty/b/a/a;->D:F

    .line 28
    .line 29
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/a/a;->x:Ljava/lang/String;

    .line 30
    .line 31
    new-instance v1, Ljava/lang/StringBuilder;

    .line 32
    .line 33
    const-string v2, "set mSharpenLevel "

    .line 34
    .line 35
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-static {v0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    iget-object p1, p0, Lcom/tencent/liteav/beauty/b/a/a;->v:Lcom/tencent/liteav/beauty/b/r;

    .line 49
    .line 50
    if-eqz p1, :cond_1

    .line 51
    .line 52
    iget p0, p0, Lcom/tencent/liteav/beauty/b/a/a;->D:F

    .line 53
    .line 54
    invoke-virtual {p1, p0}, Lcom/tencent/liteav/beauty/b/r;->a(F)V

    .line 55
    .line 56
    .line 57
    :cond_1
    :goto_0
    return-void
.end method

.method public q()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/a/a;->w:Lcom/tencent/liteav/beauty/b/a/b;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/h;->d()V

    .line 7
    .line 8
    .line 9
    iput-object v1, p0, Lcom/tencent/liteav/beauty/b/a/a;->w:Lcom/tencent/liteav/beauty/b/a/b;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/a/a;->s:Lcom/tencent/liteav/beauty/b/a/d;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/h;->d()V

    .line 16
    .line 17
    .line 18
    iput-object v1, p0, Lcom/tencent/liteav/beauty/b/a/a;->s:Lcom/tencent/liteav/beauty/b/a/d;

    .line 19
    .line 20
    :cond_1
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/a/a;->t:Lcom/tencent/liteav/beauty/b/a/e;

    .line 21
    .line 22
    if-eqz v0, :cond_2

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/h;->d()V

    .line 25
    .line 26
    .line 27
    iput-object v1, p0, Lcom/tencent/liteav/beauty/b/a/a;->t:Lcom/tencent/liteav/beauty/b/a/e;

    .line 28
    .line 29
    :cond_2
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/a/a;->u:Lcom/tencent/liteav/beauty/b/h;

    .line 30
    .line 31
    if-eqz v0, :cond_3

    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/h;->d()V

    .line 34
    .line 35
    .line 36
    iput-object v1, p0, Lcom/tencent/liteav/beauty/b/a/a;->u:Lcom/tencent/liteav/beauty/b/h;

    .line 37
    .line 38
    :cond_3
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/a/a;->v:Lcom/tencent/liteav/beauty/b/r;

    .line 39
    .line 40
    if-eqz v0, :cond_4

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/h;->d()V

    .line 43
    .line 44
    .line 45
    iput-object v1, p0, Lcom/tencent/liteav/beauty/b/a/a;->v:Lcom/tencent/liteav/beauty/b/r;

    .line 46
    .line 47
    :cond_4
    return-void
.end method
