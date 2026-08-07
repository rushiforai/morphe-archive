.class public Ll/qp1;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:I

.field public b:I

.field public c:I

.field public d:I

.field public e:I

.field public f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "[B>;"
        }
    .end annotation
.end field

.field public g:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "[B>;"
        }
    .end annotation
.end field

.field public h:Z

.field public i:I

.field public j:I

.field public k:I

.field public l:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "[B>;"
        }
    .end annotation
.end field

.field public m:I

.field public n:I

.field public o:I

.field public p:I

.field public q:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 262
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 263
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Ll/qp1;->f:Ljava/util/List;

    .line 264
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Ll/qp1;->g:Ljava/util/List;

    const/4 v0, 0x1

    .line 265
    iput-boolean v0, p0, Ll/qp1;->h:Z

    .line 266
    iput v0, p0, Ll/qp1;->i:I

    const/4 v0, 0x0

    .line 267
    iput v0, p0, Ll/qp1;->j:I

    .line 268
    iput v0, p0, Ll/qp1;->k:I

    .line 269
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Ll/qp1;->l:Ljava/util/List;

    const/16 v0, 0x3f

    .line 270
    iput v0, p0, Ll/qp1;->m:I

    const/4 v0, 0x7

    .line 271
    iput v0, p0, Ll/qp1;->n:I

    const/16 v0, 0x1f

    .line 272
    iput v0, p0, Ll/qp1;->o:I

    .line 273
    iput v0, p0, Ll/qp1;->p:I

    .line 274
    iput v0, p0, Ll/qp1;->q:I

    return-void
.end method

.method public constructor <init>(Ljava/nio/ByteBuffer;)V
    .locals 11

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
    iput-object v0, p0, Ll/qp1;->f:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/qp1;->g:Ljava/util/List;

    .line 17
    .line 18
    const/4 v0, 0x1

    .line 19
    iput-boolean v0, p0, Ll/qp1;->h:Z

    .line 20
    .line 21
    iput v0, p0, Ll/qp1;->i:I

    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    iput v0, p0, Ll/qp1;->j:I

    .line 25
    .line 26
    iput v0, p0, Ll/qp1;->k:I

    .line 27
    .line 28
    new-instance v1, Ljava/util/ArrayList;

    .line 29
    .line 30
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 31
    .line 32
    .line 33
    iput-object v1, p0, Ll/qp1;->l:Ljava/util/List;

    .line 34
    .line 35
    const/16 v1, 0x3f

    .line 36
    .line 37
    iput v1, p0, Ll/qp1;->m:I

    .line 38
    .line 39
    const/4 v1, 0x7

    .line 40
    iput v1, p0, Ll/qp1;->n:I

    .line 41
    .line 42
    const/16 v1, 0x1f

    .line 43
    .line 44
    iput v1, p0, Ll/qp1;->o:I

    .line 45
    .line 46
    iput v1, p0, Ll/qp1;->p:I

    .line 47
    .line 48
    iput v1, p0, Ll/qp1;->q:I

    .line 49
    .line 50
    invoke-static {p1}, Ll/y0q;->n(Ljava/nio/ByteBuffer;)I

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    iput v1, p0, Ll/qp1;->a:I

    .line 55
    .line 56
    invoke-static {p1}, Ll/y0q;->n(Ljava/nio/ByteBuffer;)I

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    iput v1, p0, Ll/qp1;->b:I

    .line 61
    .line 62
    invoke-static {p1}, Ll/y0q;->n(Ljava/nio/ByteBuffer;)I

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    iput v1, p0, Ll/qp1;->c:I

    .line 67
    .line 68
    invoke-static {p1}, Ll/y0q;->n(Ljava/nio/ByteBuffer;)I

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    iput v1, p0, Ll/qp1;->d:I

    .line 73
    .line 74
    new-instance v1, Ll/g13;

    .line 75
    .line 76
    invoke-direct {v1, p1}, Ll/g13;-><init>(Ljava/nio/ByteBuffer;)V

    .line 77
    .line 78
    .line 79
    const/4 v2, 0x6

    .line 80
    invoke-virtual {v1, v2}, Ll/g13;->a(I)I

    .line 81
    .line 82
    .line 83
    move-result v3

    .line 84
    iput v3, p0, Ll/qp1;->m:I

    .line 85
    .line 86
    const/4 v3, 0x2

    .line 87
    invoke-virtual {v1, v3}, Ll/g13;->a(I)I

    .line 88
    .line 89
    .line 90
    move-result v4

    .line 91
    iput v4, p0, Ll/qp1;->e:I

    .line 92
    .line 93
    const/4 v4, 0x3

    .line 94
    invoke-virtual {v1, v4}, Ll/g13;->a(I)I

    .line 95
    .line 96
    .line 97
    move-result v5

    .line 98
    iput v5, p0, Ll/qp1;->n:I

    .line 99
    .line 100
    const/4 v5, 0x5

    .line 101
    invoke-virtual {v1, v5}, Ll/g13;->a(I)I

    .line 102
    .line 103
    .line 104
    move-result v1

    .line 105
    move v6, v0

    .line 106
    :goto_0
    if-lt v6, v1, :cond_5

    .line 107
    .line 108
    invoke-static {p1}, Ll/y0q;->n(Ljava/nio/ByteBuffer;)I

    .line 109
    .line 110
    .line 111
    move-result v1

    .line 112
    int-to-long v7, v1

    .line 113
    move v1, v0

    .line 114
    :goto_1
    int-to-long v9, v1

    .line 115
    cmp-long v6, v9, v7

    .line 116
    .line 117
    if-ltz v6, :cond_4

    .line 118
    .line 119
    invoke-virtual {p1}, Ljava/nio/Buffer;->remaining()I

    .line 120
    .line 121
    .line 122
    move-result v1

    .line 123
    const/4 v6, 0x4

    .line 124
    if-ge v1, v6, :cond_0

    .line 125
    .line 126
    iput-boolean v0, p0, Ll/qp1;->h:Z

    .line 127
    .line 128
    :cond_0
    iget-boolean v1, p0, Ll/qp1;->h:Z

    .line 129
    .line 130
    if-eqz v1, :cond_3

    .line 131
    .line 132
    iget v1, p0, Ll/qp1;->b:I

    .line 133
    .line 134
    const/16 v6, 0x64

    .line 135
    .line 136
    if-eq v1, v6, :cond_1

    .line 137
    .line 138
    const/16 v6, 0x6e

    .line 139
    .line 140
    if-eq v1, v6, :cond_1

    .line 141
    .line 142
    const/16 v6, 0x7a

    .line 143
    .line 144
    if-eq v1, v6, :cond_1

    .line 145
    .line 146
    const/16 v6, 0x90

    .line 147
    .line 148
    if-ne v1, v6, :cond_3

    .line 149
    .line 150
    :cond_1
    new-instance v1, Ll/g13;

    .line 151
    .line 152
    invoke-direct {v1, p1}, Ll/g13;-><init>(Ljava/nio/ByteBuffer;)V

    .line 153
    .line 154
    .line 155
    invoke-virtual {v1, v2}, Ll/g13;->a(I)I

    .line 156
    .line 157
    .line 158
    move-result v2

    .line 159
    iput v2, p0, Ll/qp1;->o:I

    .line 160
    .line 161
    invoke-virtual {v1, v3}, Ll/g13;->a(I)I

    .line 162
    .line 163
    .line 164
    move-result v2

    .line 165
    iput v2, p0, Ll/qp1;->i:I

    .line 166
    .line 167
    invoke-virtual {v1, v5}, Ll/g13;->a(I)I

    .line 168
    .line 169
    .line 170
    move-result v2

    .line 171
    iput v2, p0, Ll/qp1;->p:I

    .line 172
    .line 173
    invoke-virtual {v1, v4}, Ll/g13;->a(I)I

    .line 174
    .line 175
    .line 176
    move-result v2

    .line 177
    iput v2, p0, Ll/qp1;->j:I

    .line 178
    .line 179
    invoke-virtual {v1, v5}, Ll/g13;->a(I)I

    .line 180
    .line 181
    .line 182
    move-result v2

    .line 183
    iput v2, p0, Ll/qp1;->q:I

    .line 184
    .line 185
    invoke-virtual {v1, v4}, Ll/g13;->a(I)I

    .line 186
    .line 187
    .line 188
    move-result v1

    .line 189
    iput v1, p0, Ll/qp1;->k:I

    .line 190
    .line 191
    invoke-static {p1}, Ll/y0q;->n(Ljava/nio/ByteBuffer;)I

    .line 192
    .line 193
    .line 194
    move-result v1

    .line 195
    int-to-long v1, v1

    .line 196
    :goto_2
    int-to-long v3, v0

    .line 197
    cmp-long v3, v3, v1

    .line 198
    .line 199
    if-ltz v3, :cond_2

    .line 200
    .line 201
    return-void

    .line 202
    :cond_2
    invoke-static {p1}, Ll/y0q;->i(Ljava/nio/ByteBuffer;)I

    .line 203
    .line 204
    .line 205
    move-result v3

    .line 206
    new-array v3, v3, [B

    .line 207
    .line 208
    invoke-virtual {p1, v3}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 209
    .line 210
    .line 211
    iget-object v4, p0, Ll/qp1;->l:Ljava/util/List;

    .line 212
    .line 213
    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 214
    .line 215
    .line 216
    add-int/lit8 v0, v0, 0x1

    .line 217
    .line 218
    goto :goto_2

    .line 219
    :cond_3
    const/4 p1, -0x1

    .line 220
    iput p1, p0, Ll/qp1;->i:I

    .line 221
    .line 222
    iput p1, p0, Ll/qp1;->j:I

    .line 223
    .line 224
    iput p1, p0, Ll/qp1;->k:I

    .line 225
    .line 226
    return-void

    .line 227
    :cond_4
    invoke-static {p1}, Ll/y0q;->i(Ljava/nio/ByteBuffer;)I

    .line 228
    .line 229
    .line 230
    move-result v6

    .line 231
    new-array v6, v6, [B

    .line 232
    .line 233
    invoke-virtual {p1, v6}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 234
    .line 235
    .line 236
    iget-object v9, p0, Ll/qp1;->g:Ljava/util/List;

    .line 237
    .line 238
    invoke-interface {v9, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 239
    .line 240
    .line 241
    add-int/lit8 v1, v1, 0x1

    .line 242
    .line 243
    goto/16 :goto_1

    .line 244
    .line 245
    :cond_5
    invoke-static {p1}, Ll/y0q;->i(Ljava/nio/ByteBuffer;)I

    .line 246
    .line 247
    .line 248
    move-result v7

    .line 249
    new-array v7, v7, [B

    .line 250
    .line 251
    invoke-virtual {p1, v7}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 252
    .line 253
    .line 254
    iget-object v8, p0, Ll/qp1;->f:Ljava/util/List;

    .line 255
    .line 256
    invoke-interface {v8, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 257
    .line 258
    .line 259
    add-int/lit8 v6, v6, 0x1

    .line 260
    .line 261
    goto/16 :goto_0
.end method


# virtual methods
.method public a(Ljava/nio/ByteBuffer;)V
    .locals 7

    .line 1
    iget v0, p0, Ll/qp1;->a:I

    .line 2
    .line 3
    invoke-static {p1, v0}, Ll/b1q;->j(Ljava/nio/ByteBuffer;I)V

    .line 4
    .line 5
    .line 6
    iget v0, p0, Ll/qp1;->b:I

    .line 7
    .line 8
    invoke-static {p1, v0}, Ll/b1q;->j(Ljava/nio/ByteBuffer;I)V

    .line 9
    .line 10
    .line 11
    iget v0, p0, Ll/qp1;->c:I

    .line 12
    .line 13
    invoke-static {p1, v0}, Ll/b1q;->j(Ljava/nio/ByteBuffer;I)V

    .line 14
    .line 15
    .line 16
    iget v0, p0, Ll/qp1;->d:I

    .line 17
    .line 18
    invoke-static {p1, v0}, Ll/b1q;->j(Ljava/nio/ByteBuffer;I)V

    .line 19
    .line 20
    .line 21
    new-instance v0, Ll/i13;

    .line 22
    .line 23
    invoke-direct {v0, p1}, Ll/i13;-><init>(Ljava/nio/ByteBuffer;)V

    .line 24
    .line 25
    .line 26
    iget v1, p0, Ll/qp1;->m:I

    .line 27
    .line 28
    const/4 v2, 0x6

    .line 29
    invoke-virtual {v0, v1, v2}, Ll/i13;->a(II)V

    .line 30
    .line 31
    .line 32
    iget v1, p0, Ll/qp1;->e:I

    .line 33
    .line 34
    const/4 v3, 0x2

    .line 35
    invoke-virtual {v0, v1, v3}, Ll/i13;->a(II)V

    .line 36
    .line 37
    .line 38
    iget v1, p0, Ll/qp1;->n:I

    .line 39
    .line 40
    const/4 v4, 0x3

    .line 41
    invoke-virtual {v0, v1, v4}, Ll/i13;->a(II)V

    .line 42
    .line 43
    .line 44
    iget-object v1, p0, Ll/qp1;->g:Ljava/util/List;

    .line 45
    .line 46
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    const/4 v5, 0x5

    .line 51
    invoke-virtual {v0, v1, v5}, Ll/i13;->a(II)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Ll/qp1;->f:Ljava/util/List;

    .line 55
    .line 56
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    if-nez v1, :cond_4

    .line 65
    .line 66
    iget-object v0, p0, Ll/qp1;->g:Ljava/util/List;

    .line 67
    .line 68
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    invoke-static {p1, v0}, Ll/b1q;->j(Ljava/nio/ByteBuffer;I)V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Ll/qp1;->g:Ljava/util/List;

    .line 76
    .line 77
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    if-nez v0, :cond_3

    .line 86
    .line 87
    iget-boolean v0, p0, Ll/qp1;->h:Z

    .line 88
    .line 89
    if-eqz v0, :cond_2

    .line 90
    .line 91
    iget v0, p0, Ll/qp1;->b:I

    .line 92
    .line 93
    const/16 v1, 0x64

    .line 94
    .line 95
    if-eq v0, v1, :cond_0

    .line 96
    .line 97
    const/16 v1, 0x6e

    .line 98
    .line 99
    if-eq v0, v1, :cond_0

    .line 100
    .line 101
    const/16 v1, 0x7a

    .line 102
    .line 103
    if-eq v0, v1, :cond_0

    .line 104
    .line 105
    const/16 v1, 0x90

    .line 106
    .line 107
    if-ne v0, v1, :cond_2

    .line 108
    .line 109
    :cond_0
    new-instance v0, Ll/i13;

    .line 110
    .line 111
    invoke-direct {v0, p1}, Ll/i13;-><init>(Ljava/nio/ByteBuffer;)V

    .line 112
    .line 113
    .line 114
    iget v1, p0, Ll/qp1;->o:I

    .line 115
    .line 116
    invoke-virtual {v0, v1, v2}, Ll/i13;->a(II)V

    .line 117
    .line 118
    .line 119
    iget v1, p0, Ll/qp1;->i:I

    .line 120
    .line 121
    invoke-virtual {v0, v1, v3}, Ll/i13;->a(II)V

    .line 122
    .line 123
    .line 124
    iget v1, p0, Ll/qp1;->p:I

    .line 125
    .line 126
    invoke-virtual {v0, v1, v5}, Ll/i13;->a(II)V

    .line 127
    .line 128
    .line 129
    iget v1, p0, Ll/qp1;->j:I

    .line 130
    .line 131
    invoke-virtual {v0, v1, v4}, Ll/i13;->a(II)V

    .line 132
    .line 133
    .line 134
    iget v1, p0, Ll/qp1;->q:I

    .line 135
    .line 136
    invoke-virtual {v0, v1, v5}, Ll/i13;->a(II)V

    .line 137
    .line 138
    .line 139
    iget v1, p0, Ll/qp1;->k:I

    .line 140
    .line 141
    invoke-virtual {v0, v1, v4}, Ll/i13;->a(II)V

    .line 142
    .line 143
    .line 144
    iget-object p0, p0, Ll/qp1;->l:Ljava/util/List;

    .line 145
    .line 146
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 147
    .line 148
    .line 149
    move-result-object p0

    .line 150
    :goto_2
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 151
    .line 152
    .line 153
    move-result v0

    .line 154
    if-nez v0, :cond_1

    .line 155
    .line 156
    goto :goto_3

    .line 157
    :cond_1
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    check-cast v0, [B

    .line 162
    .line 163
    array-length v1, v0

    .line 164
    invoke-static {p1, v1}, Ll/b1q;->e(Ljava/nio/ByteBuffer;I)V

    .line 165
    .line 166
    .line 167
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 168
    .line 169
    .line 170
    goto :goto_2

    .line 171
    :cond_2
    :goto_3
    return-void

    .line 172
    :cond_3
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 173
    .line 174
    .line 175
    move-result-object v0

    .line 176
    check-cast v0, [B

    .line 177
    .line 178
    array-length v6, v0

    .line 179
    invoke-static {p1, v6}, Ll/b1q;->e(Ljava/nio/ByteBuffer;I)V

    .line 180
    .line 181
    .line 182
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 183
    .line 184
    .line 185
    goto :goto_1

    .line 186
    :cond_4
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 187
    .line 188
    .line 189
    move-result-object v1

    .line 190
    check-cast v1, [B

    .line 191
    .line 192
    array-length v6, v1

    .line 193
    invoke-static {p1, v6}, Ll/b1q;->e(Ljava/nio/ByteBuffer;I)V

    .line 194
    .line 195
    .line 196
    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 197
    .line 198
    .line 199
    goto/16 :goto_0
.end method

.method public b()J
    .locals 8

    .line 1
    iget-object v0, p0, Ll/qp1;->f:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-wide/16 v1, 0x6

    .line 8
    .line 9
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result v3

    .line 13
    const-wide/16 v4, 0x2

    .line 14
    .line 15
    if-nez v3, :cond_4

    .line 16
    .line 17
    const-wide/16 v6, 0x1

    .line 18
    .line 19
    add-long/2addr v1, v6

    .line 20
    iget-object v0, p0, Ll/qp1;->g:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-nez v0, :cond_3

    .line 31
    .line 32
    iget-boolean v0, p0, Ll/qp1;->h:Z

    .line 33
    .line 34
    if-eqz v0, :cond_2

    .line 35
    .line 36
    iget v0, p0, Ll/qp1;->b:I

    .line 37
    .line 38
    const/16 v3, 0x64

    .line 39
    .line 40
    if-eq v0, v3, :cond_0

    .line 41
    .line 42
    const/16 v3, 0x6e

    .line 43
    .line 44
    if-eq v0, v3, :cond_0

    .line 45
    .line 46
    const/16 v3, 0x7a

    .line 47
    .line 48
    if-eq v0, v3, :cond_0

    .line 49
    .line 50
    const/16 v3, 0x90

    .line 51
    .line 52
    if-ne v0, v3, :cond_2

    .line 53
    .line 54
    :cond_0
    const-wide/16 v6, 0x4

    .line 55
    .line 56
    add-long/2addr v1, v6

    .line 57
    iget-object p0, p0, Ll/qp1;->l:Ljava/util/List;

    .line 58
    .line 59
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    :goto_2
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-nez v0, :cond_1

    .line 68
    .line 69
    return-wide v1

    .line 70
    :cond_1
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    check-cast v0, [B

    .line 75
    .line 76
    add-long/2addr v1, v4

    .line 77
    array-length v0, v0

    .line 78
    int-to-long v6, v0

    .line 79
    add-long/2addr v1, v6

    .line 80
    goto :goto_2

    .line 81
    :cond_2
    return-wide v1

    .line 82
    :cond_3
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    check-cast v0, [B

    .line 87
    .line 88
    add-long/2addr v1, v4

    .line 89
    array-length v0, v0

    .line 90
    int-to-long v6, v0

    .line 91
    add-long/2addr v1, v6

    .line 92
    goto :goto_1

    .line 93
    :cond_4
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object v3

    .line 97
    check-cast v3, [B

    .line 98
    .line 99
    add-long/2addr v1, v4

    .line 100
    array-length v3, v3

    .line 101
    int-to-long v3, v3

    .line 102
    add-long/2addr v1, v3

    .line 103
    goto :goto_0
.end method

.method public c()[Ljava/lang/String;
    .locals 5

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/qp1;->g:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-nez v1, :cond_0

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    new-array p0, p0, [Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    check-cast p0, [Ljava/lang/String;

    .line 29
    .line 30
    return-object p0

    .line 31
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    check-cast v1, [B

    .line 36
    .line 37
    :try_start_0
    new-instance v2, Ljava/io/ByteArrayInputStream;

    .line 38
    .line 39
    array-length v3, v1

    .line 40
    const/4 v4, 0x1

    .line 41
    sub-int/2addr v3, v4

    .line 42
    invoke-direct {v2, v1, v4, v3}, Ljava/io/ByteArrayInputStream;-><init>([BII)V

    .line 43
    .line 44
    .line 45
    invoke-static {v2}, Ll/rp70;->a(Ljava/io/InputStream;)Ll/rp70;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-virtual {v1}, Ll/rp70;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 53
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    goto :goto_0

    .line 57
    :catch_0
    move-exception p0

    .line 58
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 59
    .line 60
    .line 61
    const/4 p0, 0x0

    .line 62
    return-object p0
.end method

.method public d()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    iget-object v1, p0, Ll/qp1;->g:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/qp1;->g:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-nez v1, :cond_0

    .line 23
    .line 24
    return-object v0

    .line 25
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    check-cast v1, [B

    .line 30
    .line 31
    invoke-static {v1}, Ll/g2l;->a([B)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    goto :goto_0
.end method

.method public e()[Ljava/lang/String;
    .locals 6

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/qp1;->f:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-nez v1, :cond_0

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    new-array p0, p0, [Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    check-cast p0, [Ljava/lang/String;

    .line 29
    .line 30
    return-object p0

    .line 31
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    check-cast v1, [B

    .line 36
    .line 37
    :try_start_0
    new-instance v2, Ll/m85;

    .line 38
    .line 39
    new-instance v3, Ljava/io/ByteArrayInputStream;

    .line 40
    .line 41
    array-length v4, v1

    .line 42
    const/4 v5, 0x1

    .line 43
    sub-int/2addr v4, v5

    .line 44
    invoke-direct {v3, v1, v5, v4}, Ljava/io/ByteArrayInputStream;-><init>([BII)V

    .line 45
    .line 46
    .line 47
    invoke-direct {v2, v3}, Ll/m85;-><init>(Ljava/io/InputStream;)V

    .line 48
    .line 49
    .line 50
    invoke-static {v2}, Ll/dqe0;->b(Ljava/io/InputStream;)Ll/dqe0;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {v1}, Ll/dqe0;->toString()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 58
    goto :goto_1

    .line 59
    :catch_0
    const-string v1, "not parsable"

    .line 60
    .line 61
    :goto_1
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    goto :goto_0
.end method

.method public f()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    iget-object v1, p0, Ll/qp1;->l:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/qp1;->l:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-nez v1, :cond_0

    .line 23
    .line 24
    return-object v0

    .line 25
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    check-cast v1, [B

    .line 30
    .line 31
    invoke-static {v1}, Ll/g2l;->a([B)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    goto :goto_0
.end method

.method public g()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    iget-object v1, p0, Ll/qp1;->f:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/qp1;->f:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-nez v1, :cond_0

    .line 23
    .line 24
    return-object v0

    .line 25
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    check-cast v1, [B

    .line 30
    .line 31
    invoke-static {v1}, Ll/g2l;->a([B)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "AvcDecoderConfigurationRecord{configurationVersion="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Ll/qp1;->a:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ", avcProfileIndication="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget v1, p0, Ll/qp1;->b:I

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ", profileCompatibility="

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget v1, p0, Ll/qp1;->c:I

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, ", avcLevelIndication="

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget v1, p0, Ll/qp1;->d:I

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, ", lengthSizeMinusOne="

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget v1, p0, Ll/qp1;->e:I

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v1, ", hasExts="

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget-boolean v1, p0, Ll/qp1;->h:Z

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string v1, ", chromaFormat="

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    iget v1, p0, Ll/qp1;->i:I

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    const-string v1, ", bitDepthLumaMinus8="

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    iget v1, p0, Ll/qp1;->j:I

    .line 79
    .line 80
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    const-string v1, ", bitDepthChromaMinus8="

    .line 84
    .line 85
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    iget v1, p0, Ll/qp1;->k:I

    .line 89
    .line 90
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    const-string v1, ", lengthSizeMinusOnePaddingBits="

    .line 94
    .line 95
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    iget v1, p0, Ll/qp1;->m:I

    .line 99
    .line 100
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    const-string v1, ", numberOfSequenceParameterSetsPaddingBits="

    .line 104
    .line 105
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    iget v1, p0, Ll/qp1;->n:I

    .line 109
    .line 110
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    const-string v1, ", chromaFormatPaddingBits="

    .line 114
    .line 115
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    iget v1, p0, Ll/qp1;->o:I

    .line 119
    .line 120
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    const-string v1, ", bitDepthLumaMinus8PaddingBits="

    .line 124
    .line 125
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    iget v1, p0, Ll/qp1;->p:I

    .line 129
    .line 130
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    const-string v1, ", bitDepthChromaMinus8PaddingBits="

    .line 134
    .line 135
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    iget p0, p0, Ll/qp1;->q:I

    .line 139
    .line 140
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    const/16 p0, 0x7d

    .line 144
    .line 145
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object p0

    .line 152
    return-object p0
.end method
