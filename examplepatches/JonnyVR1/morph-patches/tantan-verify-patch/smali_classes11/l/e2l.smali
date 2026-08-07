.class public final Ll/e2l;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "[B>;"
        }
    .end annotation
.end field

.field public final b:I

.field public final c:I

.field public final d:I

.field public final e:I

.field public final f:I

.field public final g:I

.field public final h:F

.field public final i:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;IIIIIIFLjava/lang/String;)V
    .locals 0
    .param p9    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "[B>;IIIIIIF",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/e2l;->a:Ljava/util/List;

    .line 5
    .line 6
    iput p2, p0, Ll/e2l;->b:I

    .line 7
    .line 8
    iput p3, p0, Ll/e2l;->c:I

    .line 9
    .line 10
    iput p4, p0, Ll/e2l;->d:I

    .line 11
    .line 12
    iput p5, p0, Ll/e2l;->e:I

    .line 13
    .line 14
    iput p6, p0, Ll/e2l;->f:I

    .line 15
    .line 16
    iput p7, p0, Ll/e2l;->g:I

    .line 17
    .line 18
    iput p8, p0, Ll/e2l;->h:F

    .line 19
    .line 20
    iput-object p9, p0, Ll/e2l;->i:Ljava/lang/String;

    .line 21
    .line 22
    return-void
.end method

.method public static a(Ll/ig60;)Ll/e2l;
    .locals 29
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ParserException;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const/16 v1, 0x15

    .line 4
    .line 5
    :try_start_0
    invoke-virtual {v0, v1}, Ll/ig60;->V(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0}, Ll/ig60;->H()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    and-int/lit8 v1, v1, 0x3

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/ig60;->H()I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    invoke-virtual {v0}, Ll/ig60;->f()I

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    const/4 v4, 0x0

    .line 23
    move v5, v4

    .line 24
    move v6, v5

    .line 25
    :goto_0
    const/4 v7, 0x1

    .line 26
    if-ge v5, v2, :cond_1

    .line 27
    .line 28
    invoke-virtual {v0, v7}, Ll/ig60;->V(I)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Ll/ig60;->N()I

    .line 32
    .line 33
    .line 34
    move-result v7

    .line 35
    move v8, v4

    .line 36
    :goto_1
    if-ge v8, v7, :cond_0

    .line 37
    .line 38
    invoke-virtual {v0}, Ll/ig60;->N()I

    .line 39
    .line 40
    .line 41
    move-result v9

    .line 42
    add-int/lit8 v10, v9, 0x4

    .line 43
    .line 44
    add-int/2addr v6, v10

    .line 45
    invoke-virtual {v0, v9}, Ll/ig60;->V(I)V

    .line 46
    .line 47
    .line 48
    add-int/lit8 v8, v8, 0x1

    .line 49
    .line 50
    goto :goto_1

    .line 51
    :cond_0
    add-int/lit8 v5, v5, 0x1

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_1
    invoke-virtual {v0, v3}, Ll/ig60;->U(I)V

    .line 55
    .line 56
    .line 57
    new-array v3, v6, [B

    .line 58
    .line 59
    const/4 v5, -0x1

    .line 60
    const/high16 v8, 0x3f800000    # 1.0f

    .line 61
    .line 62
    const/4 v9, 0x0

    .line 63
    move v13, v5

    .line 64
    move v14, v13

    .line 65
    move v15, v14

    .line 66
    move/from16 v16, v15

    .line 67
    .line 68
    move/from16 v17, v16

    .line 69
    .line 70
    move/from16 v18, v8

    .line 71
    .line 72
    move-object/from16 v19, v9

    .line 73
    .line 74
    move v5, v4

    .line 75
    move v8, v5

    .line 76
    :goto_2
    if-ge v5, v2, :cond_4

    .line 77
    .line 78
    invoke-virtual {v0}, Ll/ig60;->H()I

    .line 79
    .line 80
    .line 81
    move-result v9

    .line 82
    and-int/lit8 v9, v9, 0x3f

    .line 83
    .line 84
    invoke-virtual {v0}, Ll/ig60;->N()I

    .line 85
    .line 86
    .line 87
    move-result v10

    .line 88
    move v11, v4

    .line 89
    :goto_3
    if-ge v11, v10, :cond_3

    .line 90
    .line 91
    invoke-virtual {v0}, Ll/ig60;->N()I

    .line 92
    .line 93
    .line 94
    move-result v12

    .line 95
    move/from16 v20, v7

    .line 96
    .line 97
    sget-object v7, Ll/jb20;->a:[B

    .line 98
    .line 99
    move/from16 v21, v1

    .line 100
    .line 101
    array-length v1, v7

    .line 102
    invoke-static {v7, v4, v3, v8, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 103
    .line 104
    .line 105
    array-length v1, v7

    .line 106
    add-int/2addr v8, v1

    .line 107
    invoke-virtual {v0}, Ll/ig60;->e()[B

    .line 108
    .line 109
    .line 110
    move-result-object v1

    .line 111
    invoke-virtual {v0}, Ll/ig60;->f()I

    .line 112
    .line 113
    .line 114
    move-result v7

    .line 115
    invoke-static {v1, v7, v3, v8, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 116
    .line 117
    .line 118
    const/16 v1, 0x21

    .line 119
    .line 120
    if-ne v9, v1, :cond_2

    .line 121
    .line 122
    if-nez v11, :cond_2

    .line 123
    .line 124
    add-int v1, v8, v12

    .line 125
    .line 126
    invoke-static {v3, v8, v1}, Ll/jb20;->h([BII)Ll/jb20$a;

    .line 127
    .line 128
    .line 129
    move-result-object v1

    .line 130
    iget v13, v1, Ll/jb20$a;->k:I

    .line 131
    .line 132
    iget v14, v1, Ll/jb20$a;->l:I

    .line 133
    .line 134
    iget v15, v1, Ll/jb20$a;->n:I

    .line 135
    .line 136
    iget v7, v1, Ll/jb20$a;->o:I

    .line 137
    .line 138
    iget v4, v1, Ll/jb20$a;->p:I

    .line 139
    .line 140
    move/from16 v22, v2

    .line 141
    .line 142
    iget v2, v1, Ll/jb20$a;->m:F

    .line 143
    .line 144
    move/from16 v16, v2

    .line 145
    .line 146
    iget v2, v1, Ll/jb20$a;->a:I

    .line 147
    .line 148
    move/from16 v23, v2

    .line 149
    .line 150
    iget-boolean v2, v1, Ll/jb20$a;->b:Z

    .line 151
    .line 152
    move/from16 v24, v2

    .line 153
    .line 154
    iget v2, v1, Ll/jb20$a;->c:I

    .line 155
    .line 156
    move/from16 v25, v2

    .line 157
    .line 158
    iget v2, v1, Ll/jb20$a;->d:I

    .line 159
    .line 160
    move/from16 v26, v2

    .line 161
    .line 162
    iget-object v2, v1, Ll/jb20$a;->h:[I

    .line 163
    .line 164
    iget v1, v1, Ll/jb20$a;->i:I

    .line 165
    .line 166
    move/from16 v28, v1

    .line 167
    .line 168
    move-object/from16 v27, v2

    .line 169
    .line 170
    invoke-static/range {v23 .. v28}, Ll/lc5;->c(IZII[II)Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object v19

    .line 174
    move/from16 v17, v4

    .line 175
    .line 176
    move/from16 v18, v16

    .line 177
    .line 178
    move/from16 v16, v7

    .line 179
    .line 180
    goto :goto_4

    .line 181
    :cond_2
    move/from16 v22, v2

    .line 182
    .line 183
    :goto_4
    add-int/2addr v8, v12

    .line 184
    invoke-virtual {v0, v12}, Ll/ig60;->V(I)V

    .line 185
    .line 186
    .line 187
    add-int/lit8 v11, v11, 0x1

    .line 188
    .line 189
    move/from16 v7, v20

    .line 190
    .line 191
    move/from16 v1, v21

    .line 192
    .line 193
    move/from16 v2, v22

    .line 194
    .line 195
    const/4 v4, 0x0

    .line 196
    goto :goto_3

    .line 197
    :cond_3
    move/from16 v21, v1

    .line 198
    .line 199
    move/from16 v22, v2

    .line 200
    .line 201
    move/from16 v20, v7

    .line 202
    .line 203
    add-int/lit8 v5, v5, 0x1

    .line 204
    .line 205
    const/4 v4, 0x0

    .line 206
    goto/16 :goto_2

    .line 207
    .line 208
    :cond_4
    move/from16 v21, v1

    .line 209
    .line 210
    move/from16 v20, v7

    .line 211
    .line 212
    if-nez v6, :cond_5

    .line 213
    .line 214
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 215
    .line 216
    :goto_5
    move-object v11, v0

    .line 217
    goto :goto_6

    .line 218
    :cond_5
    invoke-static {v3}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 219
    .line 220
    .line 221
    move-result-object v0

    .line 222
    goto :goto_5

    .line 223
    :goto_6
    new-instance v10, Ll/e2l;

    .line 224
    .line 225
    add-int/lit8 v12, v21, 0x1

    .line 226
    .line 227
    invoke-direct/range {v10 .. v19}, Ll/e2l;-><init>(Ljava/util/List;IIIIIIFLjava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    .line 228
    .line 229
    .line 230
    return-object v10

    .line 231
    :catch_0
    move-exception v0

    .line 232
    const-string v1, "Error parsing HEVC config"

    .line 233
    .line 234
    invoke-static {v1, v0}, Lcom/google/android/exoplayer2/ParserException;->createForMalformedContainer(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/exoplayer2/ParserException;

    .line 235
    .line 236
    .line 237
    move-result-object v0

    .line 238
    throw v0
.end method
