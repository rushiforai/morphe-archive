.class public Ll/xg60;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ll/drf0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/drf0<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public b:Landroid/graphics/Rect;

.field public c:Ll/kk90;

.field public d:Ll/lk90;

.field public e:Ll/fz0;

.field public f:Ll/fz0;

.field public g:[Ljava/lang/String;

.field public h:Ll/li80;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/li80<",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field public i:Ll/lk90;

.field public j:Ll/lk90;

.field public k:Ljava/lang/String;

.field public l:Ll/lk90;

.field public m:Ll/lk90;

.field public n:Ljava/lang/String;

.field public o:Ll/kk90;

.field public p:Ll/kk90;

.field public q:Ljava/lang/String;

.field public r:Ljava/lang/String;

.field public s:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 6

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/drf0;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-direct {v0, v2, v2}, Ll/drf0;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Ll/xg60;->a:Ll/drf0;

    .line 15
    .line 16
    new-instance v0, Landroid/graphics/Rect;

    .line 17
    .line 18
    invoke-direct {v0, v1, v1, v1, v1}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Ll/xg60;->b:Landroid/graphics/Rect;

    .line 22
    .line 23
    new-instance v0, Ll/kk90;

    .line 24
    .line 25
    const/4 v1, 0x0

    .line 26
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    const/high16 v3, 0x3f800000    # 1.0f

    .line 31
    .line 32
    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    invoke-direct {v0, v1, v3}, Ll/kk90;-><init>(Ljava/lang/Float;Ljava/lang/Float;)V

    .line 37
    .line 38
    .line 39
    iput-object v0, p0, Ll/xg60;->c:Ll/kk90;

    .line 40
    .line 41
    new-instance v0, Ll/lk90;

    .line 42
    .line 43
    const/16 v4, 0x5dc

    .line 44
    .line 45
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 46
    .line 47
    .line 48
    move-result-object v4

    .line 49
    const/16 v5, 0x7d0

    .line 50
    .line 51
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 52
    .line 53
    .line 54
    move-result-object v5

    .line 55
    invoke-direct {v0, v4, v5}, Ll/lk90;-><init>(Ljava/lang/Integer;Ljava/lang/Integer;)V

    .line 56
    .line 57
    .line 58
    iput-object v0, p0, Ll/xg60;->d:Ll/lk90;

    .line 59
    .line 60
    new-instance v0, Ll/fz0;

    .line 61
    .line 62
    invoke-direct {v0}, Ll/fz0;-><init>()V

    .line 63
    .line 64
    .line 65
    iput-object v0, p0, Ll/xg60;->e:Ll/fz0;

    .line 66
    .line 67
    new-instance v0, Ll/fz0;

    .line 68
    .line 69
    invoke-direct {v0}, Ll/fz0;-><init>()V

    .line 70
    .line 71
    .line 72
    iput-object v0, p0, Ll/xg60;->f:Ll/fz0;

    .line 73
    .line 74
    sget-object v0, Lcom/sunshine/engine/base/InterpolatorType;->linear:Lcom/sunshine/engine/base/InterpolatorType;

    .line 75
    .line 76
    invoke-virtual {v0}, Lcom/sunshine/engine/base/InterpolatorType;->toString()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v4

    .line 80
    invoke-virtual {v0}, Lcom/sunshine/engine/base/InterpolatorType;->toString()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v5

    .line 84
    filled-new-array {v4, v5}, [Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v4

    .line 88
    iput-object v4, p0, Ll/xg60;->g:[Ljava/lang/String;

    .line 89
    .line 90
    new-instance v4, Ll/li80;

    .line 91
    .line 92
    invoke-direct {v4, v1, v1}, Ll/li80;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 93
    .line 94
    .line 95
    iput-object v4, p0, Ll/xg60;->h:Ll/li80;

    .line 96
    .line 97
    new-instance v1, Ll/lk90;

    .line 98
    .line 99
    invoke-direct {v1, v2, v2}, Ll/lk90;-><init>(Ljava/lang/Integer;Ljava/lang/Integer;)V

    .line 100
    .line 101
    .line 102
    iput-object v1, p0, Ll/xg60;->i:Ll/lk90;

    .line 103
    .line 104
    new-instance v1, Ll/lk90;

    .line 105
    .line 106
    invoke-direct {v1, v2, v2}, Ll/lk90;-><init>(Ljava/lang/Integer;Ljava/lang/Integer;)V

    .line 107
    .line 108
    .line 109
    iput-object v1, p0, Ll/xg60;->j:Ll/lk90;

    .line 110
    .line 111
    invoke-virtual {v0}, Lcom/sunshine/engine/base/InterpolatorType;->toString()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v1

    .line 115
    iput-object v1, p0, Ll/xg60;->k:Ljava/lang/String;

    .line 116
    .line 117
    new-instance v1, Ll/lk90;

    .line 118
    .line 119
    invoke-direct {v1, v2, v2}, Ll/lk90;-><init>(Ljava/lang/Integer;Ljava/lang/Integer;)V

    .line 120
    .line 121
    .line 122
    iput-object v1, p0, Ll/xg60;->l:Ll/lk90;

    .line 123
    .line 124
    new-instance v1, Ll/lk90;

    .line 125
    .line 126
    const/16 v2, 0xff

    .line 127
    .line 128
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 129
    .line 130
    .line 131
    move-result-object v2

    .line 132
    invoke-direct {v1, v2, v2}, Ll/lk90;-><init>(Ljava/lang/Integer;Ljava/lang/Integer;)V

    .line 133
    .line 134
    .line 135
    iput-object v1, p0, Ll/xg60;->m:Ll/lk90;

    .line 136
    .line 137
    sget-object v1, Lcom/sunshine/engine/base/InterpolatorType;->spring:Lcom/sunshine/engine/base/InterpolatorType;

    .line 138
    .line 139
    invoke-virtual {v1}, Lcom/sunshine/engine/base/InterpolatorType;->toString()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v1

    .line 143
    iput-object v1, p0, Ll/xg60;->n:Ljava/lang/String;

    .line 144
    .line 145
    new-instance v1, Ll/kk90;

    .line 146
    .line 147
    const v2, 0x3f99999a    # 1.2f

    .line 148
    .line 149
    .line 150
    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 151
    .line 152
    .line 153
    move-result-object v2

    .line 154
    invoke-direct {v1, v3, v2}, Ll/kk90;-><init>(Ljava/lang/Float;Ljava/lang/Float;)V

    .line 155
    .line 156
    .line 157
    iput-object v1, p0, Ll/xg60;->o:Ll/kk90;

    .line 158
    .line 159
    new-instance v1, Ll/kk90;

    .line 160
    .line 161
    invoke-direct {v1, v3, v3}, Ll/kk90;-><init>(Ljava/lang/Float;Ljava/lang/Float;)V

    .line 162
    .line 163
    .line 164
    iput-object v1, p0, Ll/xg60;->p:Ll/kk90;

    .line 165
    .line 166
    const/4 v1, 0x0

    .line 167
    iput-object v1, p0, Ll/xg60;->q:Ljava/lang/String;

    .line 168
    .line 169
    iput-object v1, p0, Ll/xg60;->r:Ljava/lang/String;

    .line 170
    .line 171
    invoke-virtual {v0}, Lcom/sunshine/engine/base/InterpolatorType;->toString()Ljava/lang/String;

    .line 172
    .line 173
    .line 174
    move-result-object v0

    .line 175
    iput-object v0, p0, Ll/xg60;->s:Ljava/lang/String;

    .line 176
    .line 177
    return-void
.end method


# virtual methods
.method public a(Ll/v1e0;Ll/wg60;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/xg60;->d:Ll/lk90;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ok90;->h()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Integer;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iput v0, p2, Ll/wg60;->e:I

    .line 14
    .line 15
    const-wide/16 v0, -0x1

    .line 16
    .line 17
    iput-wide v0, p2, Ll/wg60;->f:J

    .line 18
    .line 19
    iget-object v0, p0, Ll/xg60;->b:Landroid/graphics/Rect;

    .line 20
    .line 21
    invoke-virtual {p2, v0}, Ll/wg60;->c(Landroid/graphics/Rect;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/xg60;->l:Ll/lk90;

    .line 25
    .line 26
    invoke-virtual {v0}, Ll/ok90;->h()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Ljava/lang/Integer;

    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    iget-object v2, p2, Ll/wg60;->h:Ll/io0;

    .line 37
    .line 38
    iget-object v2, v2, Ll/io0;->g:Ll/lk90;

    .line 39
    .line 40
    iget-object v3, p0, Ll/xg60;->m:Ll/lk90;

    .line 41
    .line 42
    if-nez v3, :cond_0

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    invoke-virtual {v3}, Ll/ok90;->h()Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    check-cast v1, Ljava/lang/Integer;

    .line 50
    .line 51
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    :goto_0
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-virtual {v2, v0, v1}, Ll/lk90;->m(Ljava/lang/Integer;Ljava/lang/Integer;)Ll/lk90;

    .line 60
    .line 61
    .line 62
    iget-object v0, p2, Ll/wg60;->h:Ll/io0;

    .line 63
    .line 64
    iget-object v0, v0, Ll/io0;->g:Ll/lk90;

    .line 65
    .line 66
    iget-object v1, p0, Ll/xg60;->n:Ljava/lang/String;

    .line 67
    .line 68
    invoke-virtual {v0, v1}, Ll/ok90;->k(Ljava/lang/String;)Ll/ok90;

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Ll/xg60;->e:Ll/fz0;

    .line 72
    .line 73
    invoke-virtual {v0, p1}, Ll/fz0;->a(Ll/v1e0;)Ll/li80;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    iget-object v1, p0, Ll/xg60;->f:Ll/fz0;

    .line 78
    .line 79
    iget-object v2, v0, Ll/li80;->a:Ljava/lang/Object;

    .line 80
    .line 81
    check-cast v2, Ljava/lang/Integer;

    .line 82
    .line 83
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 84
    .line 85
    .line 86
    move-result v2

    .line 87
    iget-object v3, v0, Ll/li80;->b:Ljava/lang/Object;

    .line 88
    .line 89
    check-cast v3, Ljava/lang/Integer;

    .line 90
    .line 91
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 92
    .line 93
    .line 94
    move-result v3

    .line 95
    invoke-virtual {v1, p1, v2, v3}, Ll/fz0;->b(Ll/v1e0;II)Ll/li80;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    iget-object v1, p2, Ll/wg60;->h:Ll/io0;

    .line 100
    .line 101
    iget-object v1, v1, Ll/io0;->a:Ll/kk90;

    .line 102
    .line 103
    iget-object v2, v0, Ll/li80;->a:Ljava/lang/Object;

    .line 104
    .line 105
    check-cast v2, Ljava/lang/Integer;

    .line 106
    .line 107
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 108
    .line 109
    .line 110
    move-result v2

    .line 111
    int-to-float v2, v2

    .line 112
    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 113
    .line 114
    .line 115
    move-result-object v2

    .line 116
    iget-object v3, p1, Ll/li80;->a:Ljava/lang/Object;

    .line 117
    .line 118
    check-cast v3, Ljava/lang/Integer;

    .line 119
    .line 120
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 121
    .line 122
    .line 123
    move-result v3

    .line 124
    int-to-float v3, v3

    .line 125
    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 126
    .line 127
    .line 128
    move-result-object v3

    .line 129
    invoke-virtual {v1, v2, v3}, Ll/kk90;->m(Ljava/lang/Float;Ljava/lang/Float;)Ll/kk90;

    .line 130
    .line 131
    .line 132
    iget-object v1, p2, Ll/wg60;->h:Ll/io0;

    .line 133
    .line 134
    iget-object v1, v1, Ll/io0;->b:Ll/kk90;

    .line 135
    .line 136
    iget-object v0, v0, Ll/li80;->b:Ljava/lang/Object;

    .line 137
    .line 138
    check-cast v0, Ljava/lang/Integer;

    .line 139
    .line 140
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 141
    .line 142
    .line 143
    move-result v0

    .line 144
    int-to-float v0, v0

    .line 145
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    iget-object p1, p1, Ll/li80;->b:Ljava/lang/Object;

    .line 150
    .line 151
    check-cast p1, Ljava/lang/Integer;

    .line 152
    .line 153
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 154
    .line 155
    .line 156
    move-result p1

    .line 157
    int-to-float p1, p1

    .line 158
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 159
    .line 160
    .line 161
    move-result-object p1

    .line 162
    invoke-virtual {v1, v0, p1}, Ll/kk90;->m(Ljava/lang/Float;Ljava/lang/Float;)Ll/kk90;

    .line 163
    .line 164
    .line 165
    iget-object p1, p2, Ll/wg60;->h:Ll/io0;

    .line 166
    .line 167
    iget-object p1, p1, Ll/io0;->a:Ll/kk90;

    .line 168
    .line 169
    iget-object v0, p0, Ll/xg60;->g:[Ljava/lang/String;

    .line 170
    .line 171
    const/4 v1, 0x0

    .line 172
    aget-object v0, v0, v1

    .line 173
    .line 174
    invoke-virtual {p1, v0}, Ll/ok90;->k(Ljava/lang/String;)Ll/ok90;

    .line 175
    .line 176
    .line 177
    iget-object p1, p2, Ll/wg60;->h:Ll/io0;

    .line 178
    .line 179
    iget-object p1, p1, Ll/io0;->b:Ll/kk90;

    .line 180
    .line 181
    iget-object v0, p0, Ll/xg60;->g:[Ljava/lang/String;

    .line 182
    .line 183
    const/4 v1, 0x1

    .line 184
    aget-object v0, v0, v1

    .line 185
    .line 186
    invoke-virtual {p1, v0}, Ll/ok90;->k(Ljava/lang/String;)Ll/ok90;

    .line 187
    .line 188
    .line 189
    iget-object p1, p2, Ll/wg60;->h:Ll/io0;

    .line 190
    .line 191
    iget-object p1, p1, Ll/io0;->c:Ll/drf0;

    .line 192
    .line 193
    iget-object v0, p0, Ll/xg60;->a:Ll/drf0;

    .line 194
    .line 195
    iget-object v0, v0, Ll/drf0;->a:Ljava/lang/Object;

    .line 196
    .line 197
    check-cast v0, Ljava/lang/Integer;

    .line 198
    .line 199
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 200
    .line 201
    .line 202
    move-result v0

    .line 203
    int-to-float v0, v0

    .line 204
    const/high16 v1, 0x40000000    # 2.0f

    .line 205
    .line 206
    div-float/2addr v0, v1

    .line 207
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 208
    .line 209
    .line 210
    move-result-object v0

    .line 211
    iput-object v0, p1, Ll/drf0;->a:Ljava/lang/Object;

    .line 212
    .line 213
    iget-object p1, p2, Ll/wg60;->h:Ll/io0;

    .line 214
    .line 215
    iget-object p1, p1, Ll/io0;->c:Ll/drf0;

    .line 216
    .line 217
    iget-object v0, p0, Ll/xg60;->a:Ll/drf0;

    .line 218
    .line 219
    iget-object v0, v0, Ll/drf0;->b:Ljava/lang/Object;

    .line 220
    .line 221
    check-cast v0, Ljava/lang/Integer;

    .line 222
    .line 223
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 224
    .line 225
    .line 226
    move-result v0

    .line 227
    int-to-float v0, v0

    .line 228
    div-float/2addr v0, v1

    .line 229
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 230
    .line 231
    .line 232
    move-result-object v0

    .line 233
    iput-object v0, p1, Ll/drf0;->b:Ljava/lang/Object;

    .line 234
    .line 235
    iget-object p1, p0, Ll/xg60;->o:Ll/kk90;

    .line 236
    .line 237
    invoke-virtual {p1}, Ll/ok90;->h()Ljava/lang/Object;

    .line 238
    .line 239
    .line 240
    move-result-object p1

    .line 241
    check-cast p1, Ljava/lang/Float;

    .line 242
    .line 243
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 244
    .line 245
    .line 246
    move-result v0

    .line 247
    iget-object v1, p0, Ll/xg60;->p:Ll/kk90;

    .line 248
    .line 249
    if-nez v1, :cond_1

    .line 250
    .line 251
    goto :goto_1

    .line 252
    :cond_1
    invoke-virtual {v1}, Ll/ok90;->h()Ljava/lang/Object;

    .line 253
    .line 254
    .line 255
    move-result-object v0

    .line 256
    check-cast v0, Ljava/lang/Float;

    .line 257
    .line 258
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    .line 259
    .line 260
    .line 261
    move-result v0

    .line 262
    :goto_1
    iget-object v1, p2, Ll/wg60;->h:Ll/io0;

    .line 263
    .line 264
    iget-object v1, v1, Ll/io0;->f:Ll/kk90;

    .line 265
    .line 266
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 267
    .line 268
    .line 269
    move-result-object v0

    .line 270
    invoke-virtual {v1, p1, v0}, Ll/kk90;->m(Ljava/lang/Float;Ljava/lang/Float;)Ll/kk90;

    .line 271
    .line 272
    .line 273
    iget-object p1, p2, Ll/wg60;->h:Ll/io0;

    .line 274
    .line 275
    iget-object p1, p1, Ll/io0;->f:Ll/kk90;

    .line 276
    .line 277
    iget-object v0, p0, Ll/xg60;->s:Ljava/lang/String;

    .line 278
    .line 279
    invoke-virtual {p1, v0}, Ll/ok90;->k(Ljava/lang/String;)Ll/ok90;

    .line 280
    .line 281
    .line 282
    iget-object p1, p0, Ll/xg60;->i:Ll/lk90;

    .line 283
    .line 284
    invoke-virtual {p1}, Ll/ok90;->h()Ljava/lang/Object;

    .line 285
    .line 286
    .line 287
    move-result-object p1

    .line 288
    check-cast p1, Ljava/lang/Integer;

    .line 289
    .line 290
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 291
    .line 292
    .line 293
    move-result p1

    .line 294
    iget-object v0, p0, Ll/xg60;->j:Ll/lk90;

    .line 295
    .line 296
    if-nez v0, :cond_2

    .line 297
    .line 298
    move v0, p1

    .line 299
    goto :goto_2

    .line 300
    :cond_2
    invoke-virtual {v0}, Ll/ok90;->h()Ljava/lang/Object;

    .line 301
    .line 302
    .line 303
    move-result-object v0

    .line 304
    check-cast v0, Ljava/lang/Integer;

    .line 305
    .line 306
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 307
    .line 308
    .line 309
    move-result v0

    .line 310
    :goto_2
    iget-object v1, p0, Ll/xg60;->f:Ll/fz0;

    .line 311
    .line 312
    iget-boolean v1, v1, Ll/fz0;->a:Z

    .line 313
    .line 314
    if-eqz v1, :cond_6

    .line 315
    .line 316
    iget-object v1, p2, Ll/wg60;->h:Ll/io0;

    .line 317
    .line 318
    iget-object v1, v1, Ll/io0;->b:Ll/kk90;

    .line 319
    .line 320
    invoke-virtual {v1}, Ll/ok90;->b()Ljava/lang/Object;

    .line 321
    .line 322
    .line 323
    move-result-object v1

    .line 324
    check-cast v1, Ljava/lang/Float;

    .line 325
    .line 326
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    .line 327
    .line 328
    .line 329
    move-result v1

    .line 330
    invoke-static {v1}, Ll/a2j0;->e(F)Z

    .line 331
    .line 332
    .line 333
    move-result v1

    .line 334
    iget-object v2, p2, Ll/wg60;->h:Ll/io0;

    .line 335
    .line 336
    const/4 v3, 0x0

    .line 337
    if-eqz v1, :cond_4

    .line 338
    .line 339
    iget-object v1, v2, Ll/io0;->a:Ll/kk90;

    .line 340
    .line 341
    invoke-virtual {v1}, Ll/ok90;->b()Ljava/lang/Object;

    .line 342
    .line 343
    .line 344
    move-result-object v1

    .line 345
    check-cast v1, Ljava/lang/Float;

    .line 346
    .line 347
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    .line 348
    .line 349
    .line 350
    move-result v1

    .line 351
    cmpl-float v1, v1, v3

    .line 352
    .line 353
    if-lez v1, :cond_3

    .line 354
    .line 355
    const/16 v1, 0x5a

    .line 356
    .line 357
    goto :goto_3

    .line 358
    :cond_3
    const/16 v1, 0x10e

    .line 359
    .line 360
    goto :goto_3

    .line 361
    :cond_4
    iget-object v1, v2, Ll/io0;->a:Ll/kk90;

    .line 362
    .line 363
    invoke-virtual {v1}, Ll/ok90;->b()Ljava/lang/Object;

    .line 364
    .line 365
    .line 366
    move-result-object v1

    .line 367
    check-cast v1, Ljava/lang/Float;

    .line 368
    .line 369
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    .line 370
    .line 371
    .line 372
    move-result v1

    .line 373
    neg-float v1, v1

    .line 374
    iget-object v2, p2, Ll/wg60;->h:Ll/io0;

    .line 375
    .line 376
    iget-object v2, v2, Ll/io0;->b:Ll/kk90;

    .line 377
    .line 378
    invoke-virtual {v2}, Ll/ok90;->b()Ljava/lang/Object;

    .line 379
    .line 380
    .line 381
    move-result-object v2

    .line 382
    check-cast v2, Ljava/lang/Float;

    .line 383
    .line 384
    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    .line 385
    .line 386
    .line 387
    move-result v2

    .line 388
    div-float/2addr v1, v2

    .line 389
    float-to-double v1, v1

    .line 390
    invoke-static {v1, v2}, Ljava/lang/Math;->atan(D)D

    .line 391
    .line 392
    .line 393
    move-result-wide v1

    .line 394
    const-wide v4, 0x400921fb54442d18L    # Math.PI

    .line 395
    .line 396
    .line 397
    .line 398
    .line 399
    div-double/2addr v1, v4

    .line 400
    const-wide v4, 0x4066800000000000L    # 180.0

    .line 401
    .line 402
    .line 403
    .line 404
    .line 405
    mul-double/2addr v1, v4

    .line 406
    double-to-int v1, v1

    .line 407
    iget-object v2, p2, Ll/wg60;->h:Ll/io0;

    .line 408
    .line 409
    iget-object v2, v2, Ll/io0;->b:Ll/kk90;

    .line 410
    .line 411
    invoke-virtual {v2}, Ll/ok90;->b()Ljava/lang/Object;

    .line 412
    .line 413
    .line 414
    move-result-object v2

    .line 415
    check-cast v2, Ljava/lang/Float;

    .line 416
    .line 417
    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    .line 418
    .line 419
    .line 420
    move-result v2

    .line 421
    cmpl-float v2, v2, v3

    .line 422
    .line 423
    if-lez v2, :cond_5

    .line 424
    .line 425
    add-int/lit16 v1, v1, 0xb4

    .line 426
    .line 427
    :cond_5
    :goto_3
    add-int/2addr p1, v1

    .line 428
    add-int/2addr v0, v1

    .line 429
    :cond_6
    iget-object v1, p2, Ll/wg60;->h:Ll/io0;

    .line 430
    .line 431
    iget-object v1, v1, Ll/io0;->e:Ll/lk90;

    .line 432
    .line 433
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 434
    .line 435
    .line 436
    move-result-object p1

    .line 437
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 438
    .line 439
    .line 440
    move-result-object v0

    .line 441
    invoke-virtual {v1, p1, v0}, Ll/lk90;->m(Ljava/lang/Integer;Ljava/lang/Integer;)Ll/lk90;

    .line 442
    .line 443
    .line 444
    iget-object p1, p2, Ll/wg60;->h:Ll/io0;

    .line 445
    .line 446
    iget-object p1, p1, Ll/io0;->e:Ll/lk90;

    .line 447
    .line 448
    iget-object v0, p0, Ll/xg60;->k:Ljava/lang/String;

    .line 449
    .line 450
    invoke-virtual {p1, v0}, Ll/ok90;->k(Ljava/lang/String;)Ll/ok90;

    .line 451
    .line 452
    .line 453
    iget-object p1, p2, Ll/wg60;->h:Ll/io0;

    .line 454
    .line 455
    iget-object p1, p1, Ll/io0;->d:Ll/li80;

    .line 456
    .line 457
    iget-object v0, p0, Ll/xg60;->h:Ll/li80;

    .line 458
    .line 459
    iget-object v1, v0, Ll/li80;->a:Ljava/lang/Object;

    .line 460
    .line 461
    check-cast v1, Ljava/lang/Float;

    .line 462
    .line 463
    iget-object v0, v0, Ll/li80;->b:Ljava/lang/Object;

    .line 464
    .line 465
    check-cast v0, Ljava/lang/Float;

    .line 466
    .line 467
    invoke-virtual {p1, v1, v0}, Ll/li80;->a(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 468
    .line 469
    .line 470
    iget-object p1, p0, Ll/xg60;->q:Ljava/lang/String;

    .line 471
    .line 472
    iput-object p1, p2, Ll/mrf0;->d:Ljava/lang/String;

    .line 473
    .line 474
    iget-object p0, p0, Ll/xg60;->r:Ljava/lang/String;

    .line 475
    .line 476
    iput-object p0, p2, Ll/wg60;->i:Ljava/lang/String;

    .line 477
    .line 478
    return-void
.end method
