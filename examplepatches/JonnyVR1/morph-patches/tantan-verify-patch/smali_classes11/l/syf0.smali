.class public Ll/syf0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/syf0$b;
    }
.end annotation


# static fields
.field public static o:I


# instance fields
.field public a:Ll/uyf0;

.field public b:Z

.field public final c:Ljava/lang/String;

.field public final d:Ll/syf0$b;

.field public final e:Ll/syf0$b;

.field public final f:Ll/syf0$b;

.field public g:D

.field public h:D

.field public i:Z

.field public j:D

.field public k:D

.field public l:Ljava/util/concurrent/CopyOnWriteArraySet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/CopyOnWriteArraySet<",
            "Ll/gzf0;",
            ">;"
        }
    .end annotation
.end field

.field public m:D

.field public final n:Ll/sr2;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Ll/sr2;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/syf0$b;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-direct {v0, v1}, Ll/syf0$b;-><init>(Ll/syf0$a;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/syf0;->d:Ll/syf0$b;

    .line 11
    .line 12
    new-instance v0, Ll/syf0$b;

    .line 13
    .line 14
    invoke-direct {v0, v1}, Ll/syf0$b;-><init>(Ll/syf0$a;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Ll/syf0;->e:Ll/syf0$b;

    .line 18
    .line 19
    new-instance v0, Ll/syf0$b;

    .line 20
    .line 21
    invoke-direct {v0, v1}, Ll/syf0$b;-><init>(Ll/syf0$a;)V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Ll/syf0;->f:Ll/syf0$b;

    .line 25
    .line 26
    const/4 v0, 0x1

    .line 27
    iput-boolean v0, p0, Ll/syf0;->i:Z

    .line 28
    .line 29
    const-wide v2, 0x3f747ae147ae147bL    # 0.005

    .line 30
    .line 31
    .line 32
    .line 33
    .line 34
    iput-wide v2, p0, Ll/syf0;->j:D

    .line 35
    .line 36
    iput-wide v2, p0, Ll/syf0;->k:D

    .line 37
    .line 38
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArraySet;

    .line 39
    .line 40
    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArraySet;-><init>()V

    .line 41
    .line 42
    .line 43
    iput-object v0, p0, Ll/syf0;->l:Ljava/util/concurrent/CopyOnWriteArraySet;

    .line 44
    .line 45
    const-wide/16 v2, 0x0

    .line 46
    .line 47
    iput-wide v2, p0, Ll/syf0;->m:D

    .line 48
    .line 49
    if-eqz p1, :cond_0

    .line 50
    .line 51
    iput-object p1, p0, Ll/syf0;->n:Ll/sr2;

    .line 52
    .line 53
    new-instance p1, Ljava/lang/StringBuilder;

    .line 54
    .line 55
    const-string v0, "spring:"

    .line 56
    .line 57
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    sget v0, Ll/syf0;->o:I

    .line 61
    .line 62
    add-int/lit8 v1, v0, 0x1

    .line 63
    .line 64
    sput v1, Ll/syf0;->o:I

    .line 65
    .line 66
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    iput-object p1, p0, Ll/syf0;->c:Ljava/lang/String;

    .line 74
    .line 75
    sget-object p1, Ll/uyf0;->c:Ll/uyf0;

    .line 76
    .line 77
    invoke-virtual {p0, p1}, Ll/syf0;->p(Ll/uyf0;)Ll/syf0;

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :cond_0
    const-string p0, "Spring cannot be created outside of a BaseSpringSystem"

    .line 82
    .line 83
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    throw v1
.end method


# virtual methods
.method public a(Ll/gzf0;)Ll/syf0;
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Ll/syf0;->l:Ljava/util/concurrent/CopyOnWriteArraySet;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArraySet;->add(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    return-object p0

    .line 9
    :cond_0
    const-string p0, "newListener is required"

    .line 10
    .line 11
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    return-object p0
.end method

.method public b(D)V
    .locals 30

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/syf0;->i()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    iget-boolean v2, v0, Ll/syf0;->i:Z

    .line 10
    .line 11
    if-eqz v2, :cond_0

    .line 12
    .line 13
    goto/16 :goto_8

    .line 14
    .line 15
    :cond_0
    const-wide v2, 0x3fb0624dd2f1a9fcL    # 0.064

    .line 16
    .line 17
    .line 18
    .line 19
    .line 20
    cmpl-double v4, p1, v2

    .line 21
    .line 22
    if-lez v4, :cond_1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    move-wide/from16 v2, p1

    .line 26
    .line 27
    :goto_0
    iget-wide v4, v0, Ll/syf0;->m:D

    .line 28
    .line 29
    add-double/2addr v4, v2

    .line 30
    iput-wide v4, v0, Ll/syf0;->m:D

    .line 31
    .line 32
    iget-object v2, v0, Ll/syf0;->a:Ll/uyf0;

    .line 33
    .line 34
    iget-wide v3, v2, Ll/uyf0;->b:D

    .line 35
    .line 36
    iget-wide v5, v2, Ll/uyf0;->a:D

    .line 37
    .line 38
    iget-object v2, v0, Ll/syf0;->d:Ll/syf0$b;

    .line 39
    .line 40
    iget-wide v7, v2, Ll/syf0$b;->a:D

    .line 41
    .line 42
    iget-wide v9, v2, Ll/syf0$b;->b:D

    .line 43
    .line 44
    iget-object v2, v0, Ll/syf0;->f:Ll/syf0$b;

    .line 45
    .line 46
    iget-wide v11, v2, Ll/syf0$b;->a:D

    .line 47
    .line 48
    iget-wide v13, v2, Ll/syf0$b;->b:D

    .line 49
    .line 50
    move v15, v1

    .line 51
    :goto_1
    iget-wide v1, v0, Ll/syf0;->m:D

    .line 52
    .line 53
    const-wide v16, 0x3f50624dd2f1a9fcL    # 0.001

    .line 54
    .line 55
    .line 56
    .line 57
    .line 58
    cmpl-double v18, v1, v16

    .line 59
    .line 60
    if-ltz v18, :cond_3

    .line 61
    .line 62
    sub-double v1, v1, v16

    .line 63
    .line 64
    iput-wide v1, v0, Ll/syf0;->m:D

    .line 65
    .line 66
    cmpg-double v1, v1, v16

    .line 67
    .line 68
    if-gez v1, :cond_2

    .line 69
    .line 70
    iget-object v1, v0, Ll/syf0;->e:Ll/syf0$b;

    .line 71
    .line 72
    iput-wide v7, v1, Ll/syf0$b;->a:D

    .line 73
    .line 74
    iput-wide v9, v1, Ll/syf0$b;->b:D

    .line 75
    .line 76
    :cond_2
    iget-wide v1, v0, Ll/syf0;->h:D

    .line 77
    .line 78
    sub-double v11, v1, v11

    .line 79
    .line 80
    mul-double/2addr v11, v3

    .line 81
    mul-double v13, v5, v9

    .line 82
    .line 83
    sub-double/2addr v11, v13

    .line 84
    mul-double v13, v9, v16

    .line 85
    .line 86
    const-wide/high16 v18, 0x3fe0000000000000L    # 0.5

    .line 87
    .line 88
    mul-double v13, v13, v18

    .line 89
    .line 90
    add-double/2addr v13, v7

    .line 91
    mul-double v20, v11, v16

    .line 92
    .line 93
    mul-double v20, v20, v18

    .line 94
    .line 95
    add-double v20, v9, v20

    .line 96
    .line 97
    sub-double v13, v1, v13

    .line 98
    .line 99
    mul-double/2addr v13, v3

    .line 100
    mul-double v22, v5, v20

    .line 101
    .line 102
    sub-double v13, v13, v22

    .line 103
    .line 104
    mul-double v22, v20, v16

    .line 105
    .line 106
    mul-double v22, v22, v18

    .line 107
    .line 108
    add-double v22, v7, v22

    .line 109
    .line 110
    mul-double v24, v13, v16

    .line 111
    .line 112
    mul-double v24, v24, v18

    .line 113
    .line 114
    add-double v24, v9, v24

    .line 115
    .line 116
    sub-double v18, v1, v22

    .line 117
    .line 118
    mul-double v18, v18, v3

    .line 119
    .line 120
    mul-double v22, v5, v24

    .line 121
    .line 122
    sub-double v18, v18, v22

    .line 123
    .line 124
    mul-double v22, v24, v16

    .line 125
    .line 126
    add-double v22, v7, v22

    .line 127
    .line 128
    mul-double v26, v18, v16

    .line 129
    .line 130
    add-double v26, v9, v26

    .line 131
    .line 132
    sub-double v1, v1, v22

    .line 133
    .line 134
    mul-double/2addr v1, v3

    .line 135
    mul-double v28, v5, v26

    .line 136
    .line 137
    sub-double v1, v1, v28

    .line 138
    .line 139
    add-double v20, v20, v24

    .line 140
    .line 141
    const-wide/high16 v24, 0x4000000000000000L    # 2.0

    .line 142
    .line 143
    mul-double v20, v20, v24

    .line 144
    .line 145
    add-double v20, v9, v20

    .line 146
    .line 147
    add-double v20, v20, v26

    .line 148
    .line 149
    const-wide v28, 0x3fc5555555555555L    # 0.16666666666666666

    .line 150
    .line 151
    .line 152
    .line 153
    .line 154
    mul-double v20, v20, v28

    .line 155
    .line 156
    add-double v13, v13, v18

    .line 157
    .line 158
    mul-double v13, v13, v24

    .line 159
    .line 160
    add-double/2addr v11, v13

    .line 161
    add-double/2addr v11, v1

    .line 162
    mul-double v11, v11, v28

    .line 163
    .line 164
    mul-double v20, v20, v16

    .line 165
    .line 166
    add-double v7, v7, v20

    .line 167
    .line 168
    mul-double v11, v11, v16

    .line 169
    .line 170
    add-double/2addr v9, v11

    .line 171
    move-wide/from16 v11, v22

    .line 172
    .line 173
    move-wide/from16 v13, v26

    .line 174
    .line 175
    goto :goto_1

    .line 176
    :cond_3
    iget-object v5, v0, Ll/syf0;->f:Ll/syf0$b;

    .line 177
    .line 178
    iput-wide v11, v5, Ll/syf0$b;->a:D

    .line 179
    .line 180
    iput-wide v13, v5, Ll/syf0$b;->b:D

    .line 181
    .line 182
    iget-object v5, v0, Ll/syf0;->d:Ll/syf0$b;

    .line 183
    .line 184
    iput-wide v7, v5, Ll/syf0$b;->a:D

    .line 185
    .line 186
    iput-wide v9, v5, Ll/syf0$b;->b:D

    .line 187
    .line 188
    const-wide/16 v5, 0x0

    .line 189
    .line 190
    cmpl-double v7, v1, v5

    .line 191
    .line 192
    if-lez v7, :cond_4

    .line 193
    .line 194
    div-double v1, v1, v16

    .line 195
    .line 196
    invoke-virtual {v0, v1, v2}, Ll/syf0;->h(D)V

    .line 197
    .line 198
    .line 199
    :cond_4
    invoke-virtual {v0}, Ll/syf0;->i()Z

    .line 200
    .line 201
    .line 202
    move-result v1

    .line 203
    const/4 v2, 0x1

    .line 204
    if-nez v1, :cond_6

    .line 205
    .line 206
    iget-boolean v1, v0, Ll/syf0;->b:Z

    .line 207
    .line 208
    if-eqz v1, :cond_5

    .line 209
    .line 210
    invoke-virtual {v0}, Ll/syf0;->j()Z

    .line 211
    .line 212
    .line 213
    move-result v1

    .line 214
    if-eqz v1, :cond_5

    .line 215
    .line 216
    goto :goto_2

    .line 217
    :cond_5
    move v1, v15

    .line 218
    goto :goto_4

    .line 219
    :cond_6
    :goto_2
    cmpl-double v1, v3, v5

    .line 220
    .line 221
    if-lez v1, :cond_7

    .line 222
    .line 223
    iget-wide v3, v0, Ll/syf0;->h:D

    .line 224
    .line 225
    iput-wide v3, v0, Ll/syf0;->g:D

    .line 226
    .line 227
    iget-object v1, v0, Ll/syf0;->d:Ll/syf0$b;

    .line 228
    .line 229
    iput-wide v3, v1, Ll/syf0$b;->a:D

    .line 230
    .line 231
    goto :goto_3

    .line 232
    :cond_7
    iget-object v1, v0, Ll/syf0;->d:Ll/syf0$b;

    .line 233
    .line 234
    iget-wide v3, v1, Ll/syf0$b;->a:D

    .line 235
    .line 236
    iput-wide v3, v0, Ll/syf0;->h:D

    .line 237
    .line 238
    iput-wide v3, v0, Ll/syf0;->g:D

    .line 239
    .line 240
    :goto_3
    invoke-virtual {v0, v5, v6}, Ll/syf0;->q(D)Ll/syf0;

    .line 241
    .line 242
    .line 243
    move v1, v2

    .line 244
    :goto_4
    iget-boolean v3, v0, Ll/syf0;->i:Z

    .line 245
    .line 246
    const/4 v4, 0x0

    .line 247
    if-eqz v3, :cond_8

    .line 248
    .line 249
    iput-boolean v4, v0, Ll/syf0;->i:Z

    .line 250
    .line 251
    move v3, v2

    .line 252
    goto :goto_5

    .line 253
    :cond_8
    move v3, v4

    .line 254
    :goto_5
    if-eqz v1, :cond_9

    .line 255
    .line 256
    iput-boolean v2, v0, Ll/syf0;->i:Z

    .line 257
    .line 258
    goto :goto_6

    .line 259
    :cond_9
    move v2, v4

    .line 260
    :goto_6
    iget-object v1, v0, Ll/syf0;->l:Ljava/util/concurrent/CopyOnWriteArraySet;

    .line 261
    .line 262
    invoke-virtual {v1}, Ljava/util/concurrent/CopyOnWriteArraySet;->iterator()Ljava/util/Iterator;

    .line 263
    .line 264
    .line 265
    move-result-object v1

    .line 266
    :cond_a
    :goto_7
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 267
    .line 268
    .line 269
    move-result v4

    .line 270
    if-eqz v4, :cond_c

    .line 271
    .line 272
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 273
    .line 274
    .line 275
    move-result-object v4

    .line 276
    check-cast v4, Ll/gzf0;

    .line 277
    .line 278
    if-eqz v3, :cond_b

    .line 279
    .line 280
    invoke-interface {v4, v0}, Ll/gzf0;->a(Ll/syf0;)V

    .line 281
    .line 282
    .line 283
    :cond_b
    invoke-interface {v4, v0}, Ll/gzf0;->c(Ll/syf0;)V

    .line 284
    .line 285
    .line 286
    if-eqz v2, :cond_a

    .line 287
    .line 288
    invoke-interface {v4, v0}, Ll/gzf0;->d(Ll/syf0;)V

    .line 289
    .line 290
    .line 291
    goto :goto_7

    .line 292
    :cond_c
    :goto_8
    return-void
.end method

.method public c()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/syf0;->l:Ljava/util/concurrent/CopyOnWriteArraySet;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArraySet;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/syf0;->n:Ll/sr2;

    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ll/sr2;->d(Ll/syf0;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public d()D
    .locals 2

    .line 1
    iget-object p0, p0, Ll/syf0;->d:Ll/syf0$b;

    .line 2
    .line 3
    iget-wide v0, p0, Ll/syf0$b;->a:D

    .line 4
    .line 5
    return-wide v0
.end method

.method public final e(Ll/syf0$b;)D
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/syf0;->h:D

    .line 2
    .line 3
    iget-wide p0, p1, Ll/syf0$b;->a:D

    .line 4
    .line 5
    sub-double/2addr v0, p0

    .line 6
    invoke-static {v0, v1}, Ljava/lang/Math;->abs(D)D

    .line 7
    .line 8
    .line 9
    move-result-wide p0

    .line 10
    return-wide p0
.end method

.method public f()D
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/syf0;->h:D

    .line 2
    .line 3
    return-wide v0
.end method

.method public g()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/syf0;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final h(D)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/syf0;->d:Ll/syf0$b;

    .line 2
    .line 3
    iget-wide v1, v0, Ll/syf0$b;->a:D

    .line 4
    .line 5
    mul-double/2addr v1, p1

    .line 6
    iget-object p0, p0, Ll/syf0;->e:Ll/syf0$b;

    .line 7
    .line 8
    iget-wide v3, p0, Ll/syf0$b;->a:D

    .line 9
    .line 10
    const-wide/high16 v5, 0x3ff0000000000000L    # 1.0

    .line 11
    .line 12
    sub-double/2addr v5, p1

    .line 13
    mul-double/2addr v3, v5

    .line 14
    add-double/2addr v1, v3

    .line 15
    iput-wide v1, v0, Ll/syf0$b;->a:D

    .line 16
    .line 17
    iget-wide v1, v0, Ll/syf0$b;->b:D

    .line 18
    .line 19
    mul-double/2addr v1, p1

    .line 20
    iget-wide p0, p0, Ll/syf0$b;->b:D

    .line 21
    .line 22
    mul-double/2addr p0, v5

    .line 23
    add-double/2addr v1, p0

    .line 24
    iput-wide v1, v0, Ll/syf0$b;->b:D

    .line 25
    .line 26
    return-void
.end method

.method public i()Z
    .locals 4

    .line 1
    iget-object v0, p0, Ll/syf0;->d:Ll/syf0$b;

    .line 2
    .line 3
    iget-wide v0, v0, Ll/syf0$b;->b:D

    .line 4
    .line 5
    invoke-static {v0, v1}, Ljava/lang/Math;->abs(D)D

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    iget-wide v2, p0, Ll/syf0;->j:D

    .line 10
    .line 11
    cmpg-double v0, v0, v2

    .line 12
    .line 13
    if-gtz v0, :cond_1

    .line 14
    .line 15
    iget-object v0, p0, Ll/syf0;->d:Ll/syf0$b;

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Ll/syf0;->e(Ll/syf0$b;)D

    .line 18
    .line 19
    .line 20
    move-result-wide v0

    .line 21
    iget-wide v2, p0, Ll/syf0;->k:D

    .line 22
    .line 23
    cmpg-double v0, v0, v2

    .line 24
    .line 25
    if-lez v0, :cond_0

    .line 26
    .line 27
    iget-object p0, p0, Ll/syf0;->a:Ll/uyf0;

    .line 28
    .line 29
    iget-wide v0, p0, Ll/uyf0;->b:D

    .line 30
    .line 31
    const-wide/16 v2, 0x0

    .line 32
    .line 33
    cmpl-double p0, v0, v2

    .line 34
    .line 35
    if-nez p0, :cond_1

    .line 36
    .line 37
    :cond_0
    const/4 p0, 0x1

    .line 38
    return p0

    .line 39
    :cond_1
    const/4 p0, 0x0

    .line 40
    return p0
.end method

.method public j()Z
    .locals 4

    .line 1
    iget-object v0, p0, Ll/syf0;->a:Ll/uyf0;

    .line 2
    .line 3
    iget-wide v0, v0, Ll/uyf0;->b:D

    .line 4
    .line 5
    const-wide/16 v2, 0x0

    .line 6
    .line 7
    cmpl-double v0, v0, v2

    .line 8
    .line 9
    if-lez v0, :cond_2

    .line 10
    .line 11
    iget-wide v0, p0, Ll/syf0;->g:D

    .line 12
    .line 13
    iget-wide v2, p0, Ll/syf0;->h:D

    .line 14
    .line 15
    cmpg-double v0, v0, v2

    .line 16
    .line 17
    if-gez v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/syf0;->d()D

    .line 20
    .line 21
    .line 22
    move-result-wide v0

    .line 23
    iget-wide v2, p0, Ll/syf0;->h:D

    .line 24
    .line 25
    cmpl-double v0, v0, v2

    .line 26
    .line 27
    if-gtz v0, :cond_1

    .line 28
    .line 29
    :cond_0
    iget-wide v0, p0, Ll/syf0;->g:D

    .line 30
    .line 31
    iget-wide v2, p0, Ll/syf0;->h:D

    .line 32
    .line 33
    cmpl-double v0, v0, v2

    .line 34
    .line 35
    if-lez v0, :cond_2

    .line 36
    .line 37
    invoke-virtual {p0}, Ll/syf0;->d()D

    .line 38
    .line 39
    .line 40
    move-result-wide v0

    .line 41
    iget-wide v2, p0, Ll/syf0;->h:D

    .line 42
    .line 43
    cmpg-double p0, v0, v2

    .line 44
    .line 45
    if-gez p0, :cond_2

    .line 46
    .line 47
    :cond_1
    const/4 p0, 0x1

    .line 48
    return p0

    .line 49
    :cond_2
    const/4 p0, 0x0

    .line 50
    return p0
.end method

.method public k()Ll/syf0;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/syf0;->l:Ljava/util/concurrent/CopyOnWriteArraySet;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArraySet;->clear()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public l()Ll/syf0;
    .locals 4

    .line 1
    iget-object v0, p0, Ll/syf0;->d:Ll/syf0$b;

    .line 2
    .line 3
    iget-wide v1, v0, Ll/syf0$b;->a:D

    .line 4
    .line 5
    iput-wide v1, p0, Ll/syf0;->h:D

    .line 6
    .line 7
    iget-object v3, p0, Ll/syf0;->f:Ll/syf0$b;

    .line 8
    .line 9
    iput-wide v1, v3, Ll/syf0$b;->a:D

    .line 10
    .line 11
    const-wide/16 v1, 0x0

    .line 12
    .line 13
    iput-wide v1, v0, Ll/syf0$b;->b:D

    .line 14
    .line 15
    return-object p0
.end method

.method public m(D)Ll/syf0;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Ll/syf0;->n(DZ)Ll/syf0;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public n(DZ)Ll/syf0;
    .locals 1

    .line 1
    iput-wide p1, p0, Ll/syf0;->g:D

    .line 2
    .line 3
    iget-object v0, p0, Ll/syf0;->d:Ll/syf0$b;

    .line 4
    .line 5
    iput-wide p1, v0, Ll/syf0$b;->a:D

    .line 6
    .line 7
    iget-object p1, p0, Ll/syf0;->n:Ll/sr2;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/syf0;->g()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    invoke-virtual {p1, p2}, Ll/sr2;->a(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Ll/syf0;->l:Ljava/util/concurrent/CopyOnWriteArraySet;

    .line 17
    .line 18
    invoke-virtual {p1}, Ljava/util/concurrent/CopyOnWriteArraySet;->iterator()Ljava/util/Iterator;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    if-eqz p2, :cond_0

    .line 27
    .line 28
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    check-cast p2, Ll/gzf0;

    .line 33
    .line 34
    invoke-interface {p2, p0}, Ll/gzf0;->c(Ll/syf0;)V

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    if-eqz p3, :cond_1

    .line 39
    .line 40
    invoke-virtual {p0}, Ll/syf0;->l()Ll/syf0;

    .line 41
    .line 42
    .line 43
    :cond_1
    return-object p0
.end method

.method public o(D)Ll/syf0;
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/syf0;->h:D

    .line 2
    .line 3
    cmpl-double v0, v0, p1

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/syf0;->i()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_1

    .line 14
    :cond_0
    invoke-virtual {p0}, Ll/syf0;->d()D

    .line 15
    .line 16
    .line 17
    move-result-wide v0

    .line 18
    iput-wide v0, p0, Ll/syf0;->g:D

    .line 19
    .line 20
    iput-wide p1, p0, Ll/syf0;->h:D

    .line 21
    .line 22
    iget-object p1, p0, Ll/syf0;->n:Ll/sr2;

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/syf0;->g()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    invoke-virtual {p1, p2}, Ll/sr2;->a(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Ll/syf0;->l:Ljava/util/concurrent/CopyOnWriteArraySet;

    .line 32
    .line 33
    invoke-virtual {p1}, Ljava/util/concurrent/CopyOnWriteArraySet;->iterator()Ljava/util/Iterator;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 38
    .line 39
    .line 40
    move-result p2

    .line 41
    if-eqz p2, :cond_1

    .line 42
    .line 43
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    check-cast p2, Ll/gzf0;

    .line 48
    .line 49
    invoke-interface {p2, p0}, Ll/gzf0;->b(Ll/syf0;)V

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_1
    :goto_1
    return-object p0
.end method

.method public p(Ll/uyf0;)Ll/syf0;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput-object p1, p0, Ll/syf0;->a:Ll/uyf0;

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "springConfig is required"

    .line 7
    .line 8
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public q(D)Ll/syf0;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/syf0;->d:Ll/syf0$b;

    .line 2
    .line 3
    iget-wide v1, v0, Ll/syf0$b;->b:D

    .line 4
    .line 5
    cmpl-double v1, p1, v1

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    iput-wide p1, v0, Ll/syf0$b;->b:D

    .line 11
    .line 12
    iget-object p1, p0, Ll/syf0;->n:Ll/sr2;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/syf0;->g()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    invoke-virtual {p1, p2}, Ll/sr2;->a(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-object p0
.end method

.method public r()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/syf0;->i()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/syf0;->s()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 17
    return p0
.end method

.method public s()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/syf0;->i:Z

    .line 2
    .line 3
    return p0
.end method
