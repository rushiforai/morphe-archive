.class public final Ll/g31;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/g31$i;,
        Ll/g31$c;,
        Ll/g31$h;,
        Ll/g31$e;,
        Ll/g31$f;,
        Ll/g31$g;,
        Ll/g31$d;,
        Ll/g31$a;,
        Ll/g31$b;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field public static final a:[B


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, "OpusHead"

    .line 2
    .line 3
    invoke-static {v0}, Ll/bmk0;->r0(Ljava/lang/String;)[B

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Ll/g31;->a:[B

    .line 8
    .line 9
    return-void
.end method

.method public static A(Ll/f31$a;Ll/f31$b;JLcom/google/android/exoplayer2/drm/DrmInitData;ZZ)Ll/yej0;
    .locals 22
    .param p4    # Lcom/google/android/exoplayer2/drm/DrmInitData;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ParserException;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const v1, 0x6d646961

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, v1}, Ll/f31$a;->f(I)Ll/f31$a;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-static {v1}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    check-cast v1, Ll/f31$a;

    .line 15
    .line 16
    const v2, 0x68646c72    # 4.3148E24f

    .line 17
    .line 18
    .line 19
    invoke-virtual {v1, v2}, Ll/f31$a;->g(I)Ll/f31$b;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-static {v2}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    check-cast v2, Ll/f31$b;

    .line 28
    .line 29
    iget-object v2, v2, Ll/f31$b;->b:Ll/ig60;

    .line 30
    .line 31
    invoke-static {v2}, Ll/g31;->l(Ll/ig60;)I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    invoke-static {v2}, Ll/g31;->e(I)I

    .line 36
    .line 37
    .line 38
    move-result v5

    .line 39
    const/4 v2, -0x1

    .line 40
    const/4 v3, 0x0

    .line 41
    if-ne v5, v2, :cond_0

    .line 42
    .line 43
    return-object v3

    .line 44
    :cond_0
    const v2, 0x746b6864

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, v2}, Ll/f31$a;->g(I)Ll/f31$b;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    invoke-static {v2}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    check-cast v2, Ll/f31$b;

    .line 56
    .line 57
    iget-object v2, v2, Ll/f31$b;->b:Ll/ig60;

    .line 58
    .line 59
    invoke-static {v2}, Ll/g31;->z(Ll/ig60;)Ll/g31$h;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    const-wide v6, -0x7fffffffffffffffL    # -4.9E-324

    .line 64
    .line 65
    .line 66
    .line 67
    .line 68
    cmp-long v4, p2, v6

    .line 69
    .line 70
    if-nez v4, :cond_1

    .line 71
    .line 72
    invoke-static {v2}, Ll/g31$h;->a(Ll/g31$h;)J

    .line 73
    .line 74
    .line 75
    move-result-wide v8

    .line 76
    move-wide v10, v8

    .line 77
    :goto_0
    move-object/from16 v4, p1

    .line 78
    .line 79
    goto :goto_1

    .line 80
    :cond_1
    move-wide/from16 v10, p2

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :goto_1
    iget-object v4, v4, Ll/f31$b;->b:Ll/ig60;

    .line 84
    .line 85
    invoke-static {v4}, Ll/g31;->q(Ll/ig60;)Ll/g31$c;

    .line 86
    .line 87
    .line 88
    move-result-object v4

    .line 89
    iget-wide v14, v4, Ll/g31$c;->b:J

    .line 90
    .line 91
    cmp-long v4, v10, v6

    .line 92
    .line 93
    if-nez v4, :cond_2

    .line 94
    .line 95
    :goto_2
    move-wide v10, v6

    .line 96
    goto :goto_3

    .line 97
    :cond_2
    const-wide/32 v12, 0xf4240

    .line 98
    .line 99
    .line 100
    invoke-static/range {v10 .. v15}, Ll/bmk0;->W0(JJJ)J

    .line 101
    .line 102
    .line 103
    move-result-wide v6

    .line 104
    goto :goto_2

    .line 105
    :goto_3
    const v4, 0x6d696e66

    .line 106
    .line 107
    .line 108
    invoke-virtual {v1, v4}, Ll/f31$a;->f(I)Ll/f31$a;

    .line 109
    .line 110
    .line 111
    move-result-object v4

    .line 112
    invoke-static {v4}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object v4

    .line 116
    check-cast v4, Ll/f31$a;

    .line 117
    .line 118
    const v6, 0x7374626c

    .line 119
    .line 120
    .line 121
    invoke-virtual {v4, v6}, Ll/f31$a;->f(I)Ll/f31$a;

    .line 122
    .line 123
    .line 124
    move-result-object v4

    .line 125
    invoke-static {v4}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    move-result-object v4

    .line 129
    check-cast v4, Ll/f31$a;

    .line 130
    .line 131
    const v6, 0x6d646864

    .line 132
    .line 133
    .line 134
    invoke-virtual {v1, v6}, Ll/f31$a;->g(I)Ll/f31$b;

    .line 135
    .line 136
    .line 137
    move-result-object v1

    .line 138
    invoke-static {v1}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 139
    .line 140
    .line 141
    move-result-object v1

    .line 142
    check-cast v1, Ll/f31$b;

    .line 143
    .line 144
    iget-object v1, v1, Ll/f31$b;->b:Ll/ig60;

    .line 145
    .line 146
    invoke-static {v1}, Ll/g31;->n(Ll/ig60;)Landroid/util/Pair;

    .line 147
    .line 148
    .line 149
    move-result-object v1

    .line 150
    const v6, 0x73747364

    .line 151
    .line 152
    .line 153
    invoke-virtual {v4, v6}, Ll/f31$a;->g(I)Ll/f31$b;

    .line 154
    .line 155
    .line 156
    move-result-object v4

    .line 157
    if-eqz v4, :cond_5

    .line 158
    .line 159
    iget-object v4, v4, Ll/f31$b;->b:Ll/ig60;

    .line 160
    .line 161
    invoke-static {v2}, Ll/g31$h;->b(Ll/g31$h;)I

    .line 162
    .line 163
    .line 164
    move-result v17

    .line 165
    invoke-static {v2}, Ll/g31$h;->c(Ll/g31$h;)I

    .line 166
    .line 167
    .line 168
    move-result v18

    .line 169
    iget-object v6, v1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 170
    .line 171
    move-object/from16 v19, v6

    .line 172
    .line 173
    check-cast v19, Ljava/lang/String;

    .line 174
    .line 175
    move-object/from16 v20, p4

    .line 176
    .line 177
    move/from16 v21, p6

    .line 178
    .line 179
    move-object/from16 v16, v4

    .line 180
    .line 181
    invoke-static/range {v16 .. v21}, Ll/g31;->x(Ll/ig60;IILjava/lang/String;Lcom/google/android/exoplayer2/drm/DrmInitData;Z)Ll/g31$e;

    .line 182
    .line 183
    .line 184
    move-result-object v4

    .line 185
    if-nez p5, :cond_3

    .line 186
    .line 187
    const v6, 0x65647473

    .line 188
    .line 189
    .line 190
    invoke-virtual {v0, v6}, Ll/f31$a;->f(I)Ll/f31$a;

    .line 191
    .line 192
    .line 193
    move-result-object v0

    .line 194
    if-eqz v0, :cond_3

    .line 195
    .line 196
    invoke-static {v0}, Ll/g31;->i(Ll/f31$a;)Landroid/util/Pair;

    .line 197
    .line 198
    .line 199
    move-result-object v0

    .line 200
    if-eqz v0, :cond_3

    .line 201
    .line 202
    iget-object v6, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 203
    .line 204
    check-cast v6, [J

    .line 205
    .line 206
    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 207
    .line 208
    check-cast v0, [J

    .line 209
    .line 210
    move-object/from16 v17, v0

    .line 211
    .line 212
    move-object/from16 v16, v6

    .line 213
    .line 214
    goto :goto_4

    .line 215
    :cond_3
    move-object/from16 v16, v3

    .line 216
    .line 217
    move-object/from16 v17, v16

    .line 218
    .line 219
    :goto_4
    iget-object v0, v4, Ll/g31$e;->b:Lcom/google/android/exoplayer2/k;

    .line 220
    .line 221
    if-nez v0, :cond_4

    .line 222
    .line 223
    return-object v3

    .line 224
    :cond_4
    new-instance v3, Ll/yej0;

    .line 225
    .line 226
    invoke-static {v2}, Ll/g31$h;->b(Ll/g31$h;)I

    .line 227
    .line 228
    .line 229
    move-result v0

    .line 230
    iget-object v1, v1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 231
    .line 232
    check-cast v1, Ljava/lang/Long;

    .line 233
    .line 234
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    .line 235
    .line 236
    .line 237
    move-result-wide v6

    .line 238
    iget-object v12, v4, Ll/g31$e;->b:Lcom/google/android/exoplayer2/k;

    .line 239
    .line 240
    iget v13, v4, Ll/g31$e;->d:I

    .line 241
    .line 242
    move-wide v8, v14

    .line 243
    iget-object v14, v4, Ll/g31$e;->a:[Ll/zej0;

    .line 244
    .line 245
    iget v15, v4, Ll/g31$e;->c:I

    .line 246
    .line 247
    move v4, v0

    .line 248
    invoke-direct/range {v3 .. v17}, Ll/yej0;-><init>(IIJJJLcom/google/android/exoplayer2/k;I[Ll/zej0;I[J[J)V

    .line 249
    .line 250
    .line 251
    return-object v3

    .line 252
    :cond_5
    const-string v0, "Malformed sample table (stbl) missing sample description (stsd)"

    .line 253
    .line 254
    invoke-static {v0, v3}, Lcom/google/android/exoplayer2/ParserException;->createForMalformedContainer(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/exoplayer2/ParserException;

    .line 255
    .line 256
    .line 257
    move-result-object v0

    .line 258
    throw v0
.end method

.method public static B(Ll/f31$a;Ll/ilj;JLcom/google/android/exoplayer2/drm/DrmInitData;ZZLl/adj;)Ljava/util/List;
    .locals 10
    .param p4    # Lcom/google/android/exoplayer2/drm/DrmInitData;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/f31$a;",
            "Ll/ilj;",
            "J",
            "Lcom/google/android/exoplayer2/drm/DrmInitData;",
            "ZZ",
            "Ll/adj<",
            "Ll/yej0;",
            "Ll/yej0;",
            ">;)",
            "Ljava/util/List<",
            "Ll/ufj0;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ParserException;
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    :goto_0
    iget-object v2, p0, Ll/f31$a;->d:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    if-ge v1, v2, :cond_2

    .line 14
    .line 15
    iget-object v2, p0, Ll/f31$a;->d:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    move-object v3, v2

    .line 22
    check-cast v3, Ll/f31$a;

    .line 23
    .line 24
    iget v2, v3, Ll/f31;->a:I

    .line 25
    .line 26
    const v4, 0x7472616b

    .line 27
    .line 28
    .line 29
    if-eq v2, v4, :cond_0

    .line 30
    .line 31
    move-object/from16 v3, p7

    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_0
    const v2, 0x6d766864

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0, v2}, Ll/f31$a;->g(I)Ll/f31$b;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-static {v2}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    move-object v4, v2

    .line 46
    check-cast v4, Ll/f31$b;

    .line 47
    .line 48
    move-wide v5, p2

    .line 49
    move-object v7, p4

    .line 50
    move v8, p5

    .line 51
    move/from16 v9, p6

    .line 52
    .line 53
    invoke-static/range {v3 .. v9}, Ll/g31;->A(Ll/f31$a;Ll/f31$b;JLcom/google/android/exoplayer2/drm/DrmInitData;ZZ)Ll/yej0;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    move-object v4, v3

    .line 58
    move-object/from16 v3, p7

    .line 59
    .line 60
    invoke-interface {v3, v2}, Ll/adj;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    check-cast v2, Ll/yej0;

    .line 65
    .line 66
    if-nez v2, :cond_1

    .line 67
    .line 68
    goto :goto_1

    .line 69
    :cond_1
    const v5, 0x6d646961

    .line 70
    .line 71
    .line 72
    invoke-virtual {v4, v5}, Ll/f31$a;->f(I)Ll/f31$a;

    .line 73
    .line 74
    .line 75
    move-result-object v4

    .line 76
    invoke-static {v4}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v4

    .line 80
    check-cast v4, Ll/f31$a;

    .line 81
    .line 82
    const v5, 0x6d696e66

    .line 83
    .line 84
    .line 85
    invoke-virtual {v4, v5}, Ll/f31$a;->f(I)Ll/f31$a;

    .line 86
    .line 87
    .line 88
    move-result-object v4

    .line 89
    invoke-static {v4}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object v4

    .line 93
    check-cast v4, Ll/f31$a;

    .line 94
    .line 95
    const v5, 0x7374626c

    .line 96
    .line 97
    .line 98
    invoke-virtual {v4, v5}, Ll/f31$a;->f(I)Ll/f31$a;

    .line 99
    .line 100
    .line 101
    move-result-object v4

    .line 102
    invoke-static {v4}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object v4

    .line 106
    check-cast v4, Ll/f31$a;

    .line 107
    .line 108
    invoke-static {v2, v4, p1}, Ll/g31;->w(Ll/yej0;Ll/f31$a;Ll/ilj;)Ll/ufj0;

    .line 109
    .line 110
    .line 111
    move-result-object v2

    .line 112
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 113
    .line 114
    .line 115
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 116
    .line 117
    goto :goto_0

    .line 118
    :cond_2
    return-object v0
.end method

.method public static C(Ll/f31$b;)Ll/g31$i;
    .locals 8

    .line 1
    iget-object p0, p0, Ll/f31$b;->b:Ll/ig60;

    .line 2
    .line 3
    const/16 v0, 0x8

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ll/ig60;->U(I)V

    .line 6
    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    move-object v2, v1

    .line 10
    move-object v3, v2

    .line 11
    :goto_0
    invoke-virtual {p0}, Ll/ig60;->a()I

    .line 12
    .line 13
    .line 14
    move-result v4

    .line 15
    if-lt v4, v0, :cond_3

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/ig60;->f()I

    .line 18
    .line 19
    .line 20
    move-result v4

    .line 21
    invoke-virtual {p0}, Ll/ig60;->q()I

    .line 22
    .line 23
    .line 24
    move-result v5

    .line 25
    invoke-virtual {p0}, Ll/ig60;->q()I

    .line 26
    .line 27
    .line 28
    move-result v6

    .line 29
    const v7, 0x6d657461

    .line 30
    .line 31
    .line 32
    if-ne v6, v7, :cond_0

    .line 33
    .line 34
    invoke-virtual {p0, v4}, Ll/ig60;->U(I)V

    .line 35
    .line 36
    .line 37
    add-int v1, v4, v5

    .line 38
    .line 39
    invoke-static {p0, v1}, Ll/g31;->D(Ll/ig60;I)Lcom/google/android/exoplayer2/metadata/Metadata;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    goto :goto_1

    .line 44
    :cond_0
    const v7, 0x736d7461

    .line 45
    .line 46
    .line 47
    if-ne v6, v7, :cond_1

    .line 48
    .line 49
    invoke-virtual {p0, v4}, Ll/ig60;->U(I)V

    .line 50
    .line 51
    .line 52
    add-int v2, v4, v5

    .line 53
    .line 54
    invoke-static {p0, v2}, Ll/g31;->v(Ll/ig60;I)Lcom/google/android/exoplayer2/metadata/Metadata;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    goto :goto_1

    .line 59
    :cond_1
    const v7, -0x56878686

    .line 60
    .line 61
    .line 62
    if-ne v6, v7, :cond_2

    .line 63
    .line 64
    invoke-static {p0}, Ll/g31;->F(Ll/ig60;)Lcom/google/android/exoplayer2/metadata/Metadata;

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    :cond_2
    :goto_1
    add-int/2addr v4, v5

    .line 69
    invoke-virtual {p0, v4}, Ll/ig60;->U(I)V

    .line 70
    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_3
    new-instance p0, Ll/g31$i;

    .line 74
    .line 75
    invoke-direct {p0, v1, v2, v3}, Ll/g31$i;-><init>(Lcom/google/android/exoplayer2/metadata/Metadata;Lcom/google/android/exoplayer2/metadata/Metadata;Lcom/google/android/exoplayer2/metadata/Metadata;)V

    .line 76
    .line 77
    .line 78
    return-object p0
.end method

.method public static D(Ll/ig60;I)Lcom/google/android/exoplayer2/metadata/Metadata;
    .locals 4
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/ig60;->V(I)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0}, Ll/g31;->f(Ll/ig60;)V

    .line 7
    .line 8
    .line 9
    :goto_0
    invoke-virtual {p0}, Ll/ig60;->f()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-ge v0, p1, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/ig60;->f()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    invoke-virtual {p0}, Ll/ig60;->q()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    invoke-virtual {p0}, Ll/ig60;->q()I

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    const v3, 0x696c7374

    .line 28
    .line 29
    .line 30
    if-ne v2, v3, :cond_0

    .line 31
    .line 32
    invoke-virtual {p0, v0}, Ll/ig60;->U(I)V

    .line 33
    .line 34
    .line 35
    add-int/2addr v0, v1

    .line 36
    invoke-static {p0, v0}, Ll/g31;->m(Ll/ig60;I)Lcom/google/android/exoplayer2/metadata/Metadata;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    return-object p0

    .line 41
    :cond_0
    add-int/2addr v0, v1

    .line 42
    invoke-virtual {p0, v0}, Ll/ig60;->U(I)V

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    const/4 p0, 0x0

    .line 47
    return-object p0
.end method

.method public static E(Ll/ig60;IIIIILcom/google/android/exoplayer2/drm/DrmInitData;Ll/g31$e;I)V
    .locals 34
    .param p6    # Lcom/google/android/exoplayer2/drm/DrmInitData;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ParserException;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p2

    .line 4
    .line 5
    move/from16 v2, p3

    .line 6
    .line 7
    move-object/from16 v3, p6

    .line 8
    .line 9
    move-object/from16 v4, p7

    .line 10
    .line 11
    add-int/lit8 v5, v1, 0x10

    .line 12
    .line 13
    invoke-virtual {v0, v5}, Ll/ig60;->U(I)V

    .line 14
    .line 15
    .line 16
    const/16 v5, 0x10

    .line 17
    .line 18
    invoke-virtual {v0, v5}, Ll/ig60;->V(I)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ll/ig60;->N()I

    .line 22
    .line 23
    .line 24
    move-result v5

    .line 25
    invoke-virtual {v0}, Ll/ig60;->N()I

    .line 26
    .line 27
    .line 28
    move-result v6

    .line 29
    const/16 v7, 0x32

    .line 30
    .line 31
    invoke-virtual {v0, v7}, Ll/ig60;->V(I)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Ll/ig60;->f()I

    .line 35
    .line 36
    .line 37
    move-result v7

    .line 38
    const v8, 0x656e6376

    .line 39
    .line 40
    .line 41
    move/from16 v10, p1

    .line 42
    .line 43
    if-ne v10, v8, :cond_2

    .line 44
    .line 45
    invoke-static {v0, v1, v2}, Ll/g31;->t(Ll/ig60;II)Landroid/util/Pair;

    .line 46
    .line 47
    .line 48
    move-result-object v8

    .line 49
    if-eqz v8, :cond_1

    .line 50
    .line 51
    iget-object v10, v8, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 52
    .line 53
    check-cast v10, Ljava/lang/Integer;

    .line 54
    .line 55
    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    .line 56
    .line 57
    .line 58
    move-result v10

    .line 59
    if-nez v3, :cond_0

    .line 60
    .line 61
    const/4 v3, 0x0

    .line 62
    goto :goto_0

    .line 63
    :cond_0
    iget-object v11, v8, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 64
    .line 65
    check-cast v11, Ll/zej0;

    .line 66
    .line 67
    iget-object v11, v11, Ll/zej0;->b:Ljava/lang/String;

    .line 68
    .line 69
    invoke-virtual {v3, v11}, Lcom/google/android/exoplayer2/drm/DrmInitData;->c(Ljava/lang/String;)Lcom/google/android/exoplayer2/drm/DrmInitData;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    :goto_0
    iget-object v11, v4, Ll/g31$e;->a:[Ll/zej0;

    .line 74
    .line 75
    iget-object v8, v8, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 76
    .line 77
    check-cast v8, Ll/zej0;

    .line 78
    .line 79
    aput-object v8, v11, p8

    .line 80
    .line 81
    :cond_1
    invoke-virtual {v0, v7}, Ll/ig60;->U(I)V

    .line 82
    .line 83
    .line 84
    :cond_2
    const v8, 0x6d317620

    .line 85
    .line 86
    .line 87
    const-string v11, "video/3gpp"

    .line 88
    .line 89
    if-ne v10, v8, :cond_3

    .line 90
    .line 91
    const-string v8, "video/mpeg"

    .line 92
    .line 93
    goto :goto_1

    .line 94
    :cond_3
    const v8, 0x48323633

    .line 95
    .line 96
    .line 97
    if-ne v10, v8, :cond_4

    .line 98
    .line 99
    move-object v8, v11

    .line 100
    goto :goto_1

    .line 101
    :cond_4
    const/4 v8, 0x0

    .line 102
    :goto_1
    const/high16 v14, 0x3f800000    # 1.0f

    .line 103
    .line 104
    const/4 v13, 0x0

    .line 105
    const/4 v15, 0x0

    .line 106
    const/16 v16, 0x0

    .line 107
    .line 108
    const/16 v17, -0x1

    .line 109
    .line 110
    const/16 v18, -0x1

    .line 111
    .line 112
    const/16 v19, -0x1

    .line 113
    .line 114
    const/16 v20, -0x1

    .line 115
    .line 116
    const/16 v21, 0x0

    .line 117
    .line 118
    const/16 v22, 0x0

    .line 119
    .line 120
    const/16 v23, 0x0

    .line 121
    .line 122
    :goto_2
    sub-int v12, v7, v1

    .line 123
    .line 124
    if-ge v12, v2, :cond_5

    .line 125
    .line 126
    invoke-virtual {v0, v7}, Ll/ig60;->U(I)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {v0}, Ll/ig60;->f()I

    .line 130
    .line 131
    .line 132
    move-result v12

    .line 133
    invoke-virtual {v0}, Ll/ig60;->q()I

    .line 134
    .line 135
    .line 136
    move-result v9

    .line 137
    if-nez v9, :cond_6

    .line 138
    .line 139
    invoke-virtual {v0}, Ll/ig60;->f()I

    .line 140
    .line 141
    .line 142
    move-result v24

    .line 143
    sub-int v1, v24, p2

    .line 144
    .line 145
    if-ne v1, v2, :cond_6

    .line 146
    .line 147
    :cond_5
    move-object/from16 v27, v3

    .line 148
    .line 149
    move/from16 v33, v14

    .line 150
    .line 151
    move-object/from16 v28, v15

    .line 152
    .line 153
    move/from16 v12, v18

    .line 154
    .line 155
    move/from16 v3, v20

    .line 156
    .line 157
    const/4 v2, 0x0

    .line 158
    goto/16 :goto_22

    .line 159
    .line 160
    :cond_6
    if-lez v9, :cond_7

    .line 161
    .line 162
    const/4 v1, 0x1

    .line 163
    :goto_3
    const/16 p8, 0x1

    .line 164
    .line 165
    goto :goto_4

    .line 166
    :cond_7
    const/4 v1, 0x0

    .line 167
    goto :goto_3

    .line 168
    :goto_4
    const-string v2, "childAtomSize must be positive"

    .line 169
    .line 170
    invoke-static {v1, v2}, Ll/csf;->a(ZLjava/lang/String;)V

    .line 171
    .line 172
    .line 173
    invoke-virtual {v0}, Ll/ig60;->q()I

    .line 174
    .line 175
    .line 176
    move-result v1

    .line 177
    const v2, 0x61766343

    .line 178
    .line 179
    .line 180
    if-ne v1, v2, :cond_a

    .line 181
    .line 182
    if-nez v8, :cond_8

    .line 183
    .line 184
    move/from16 v1, p8

    .line 185
    .line 186
    :goto_5
    const/4 v2, 0x0

    .line 187
    goto :goto_6

    .line 188
    :cond_8
    const/4 v1, 0x0

    .line 189
    goto :goto_5

    .line 190
    :goto_6
    invoke-static {v1, v2}, Ll/csf;->a(ZLjava/lang/String;)V

    .line 191
    .line 192
    .line 193
    add-int/lit8 v12, v12, 0x8

    .line 194
    .line 195
    invoke-virtual {v0, v12}, Ll/ig60;->U(I)V

    .line 196
    .line 197
    .line 198
    invoke-static {v0}, Ll/pp1;->b(Ll/ig60;)Ll/pp1;

    .line 199
    .line 200
    .line 201
    move-result-object v1

    .line 202
    iget-object v15, v1, Ll/pp1;->a:Ljava/util/List;

    .line 203
    .line 204
    iget v2, v1, Ll/pp1;->b:I

    .line 205
    .line 206
    iput v2, v4, Ll/g31$e;->c:I

    .line 207
    .line 208
    if-nez v23, :cond_9

    .line 209
    .line 210
    iget v14, v1, Ll/pp1;->h:F

    .line 211
    .line 212
    :cond_9
    iget-object v13, v1, Ll/pp1;->i:Ljava/lang/String;

    .line 213
    .line 214
    iget v2, v1, Ll/pp1;->e:I

    .line 215
    .line 216
    iget v8, v1, Ll/pp1;->f:I

    .line 217
    .line 218
    iget v1, v1, Ll/pp1;->g:I

    .line 219
    .line 220
    const-string v12, "video/avc"

    .line 221
    .line 222
    :goto_7
    move/from16 v20, v1

    .line 223
    .line 224
    move/from16 v18, v2

    .line 225
    .line 226
    move-object/from16 v27, v3

    .line 227
    .line 228
    move/from16 v24, v7

    .line 229
    .line 230
    move/from16 v19, v8

    .line 231
    .line 232
    move/from16 v25, v10

    .line 233
    .line 234
    move-object/from16 v26, v11

    .line 235
    .line 236
    move-object v8, v12

    .line 237
    :goto_8
    const/4 v2, 0x0

    .line 238
    goto/16 :goto_21

    .line 239
    .line 240
    :cond_a
    const v2, 0x68766343

    .line 241
    .line 242
    .line 243
    if-ne v1, v2, :cond_d

    .line 244
    .line 245
    if-nez v8, :cond_b

    .line 246
    .line 247
    move/from16 v1, p8

    .line 248
    .line 249
    :goto_9
    const/4 v2, 0x0

    .line 250
    goto :goto_a

    .line 251
    :cond_b
    const/4 v1, 0x0

    .line 252
    goto :goto_9

    .line 253
    :goto_a
    invoke-static {v1, v2}, Ll/csf;->a(ZLjava/lang/String;)V

    .line 254
    .line 255
    .line 256
    add-int/lit8 v12, v12, 0x8

    .line 257
    .line 258
    invoke-virtual {v0, v12}, Ll/ig60;->U(I)V

    .line 259
    .line 260
    .line 261
    invoke-static {v0}, Ll/e2l;->a(Ll/ig60;)Ll/e2l;

    .line 262
    .line 263
    .line 264
    move-result-object v1

    .line 265
    iget-object v15, v1, Ll/e2l;->a:Ljava/util/List;

    .line 266
    .line 267
    iget v2, v1, Ll/e2l;->b:I

    .line 268
    .line 269
    iput v2, v4, Ll/g31$e;->c:I

    .line 270
    .line 271
    if-nez v23, :cond_c

    .line 272
    .line 273
    iget v14, v1, Ll/e2l;->h:F

    .line 274
    .line 275
    :cond_c
    iget-object v13, v1, Ll/e2l;->i:Ljava/lang/String;

    .line 276
    .line 277
    iget v2, v1, Ll/e2l;->e:I

    .line 278
    .line 279
    iget v8, v1, Ll/e2l;->f:I

    .line 280
    .line 281
    iget v1, v1, Ll/e2l;->g:I

    .line 282
    .line 283
    const-string v12, "video/hevc"

    .line 284
    .line 285
    goto :goto_7

    .line 286
    :cond_d
    const v2, 0x64766343

    .line 287
    .line 288
    .line 289
    if-eq v1, v2, :cond_e

    .line 290
    .line 291
    const v2, 0x64767643

    .line 292
    .line 293
    .line 294
    if-ne v1, v2, :cond_f

    .line 295
    .line 296
    :cond_e
    move-object/from16 v27, v3

    .line 297
    .line 298
    move/from16 v24, v7

    .line 299
    .line 300
    move/from16 v25, v10

    .line 301
    .line 302
    move-object/from16 v26, v11

    .line 303
    .line 304
    move/from16 v33, v14

    .line 305
    .line 306
    move-object/from16 v28, v15

    .line 307
    .line 308
    move/from16 v12, v18

    .line 309
    .line 310
    move/from16 v3, v20

    .line 311
    .line 312
    const/4 v2, 0x0

    .line 313
    goto/16 :goto_20

    .line 314
    .line 315
    :cond_f
    const v2, 0x76706343

    .line 316
    .line 317
    .line 318
    move/from16 v24, v7

    .line 319
    .line 320
    const/4 v7, 0x2

    .line 321
    if-ne v1, v2, :cond_14

    .line 322
    .line 323
    if-nez v8, :cond_10

    .line 324
    .line 325
    move/from16 v1, p8

    .line 326
    .line 327
    :goto_b
    const/4 v2, 0x0

    .line 328
    goto :goto_c

    .line 329
    :cond_10
    const/4 v1, 0x0

    .line 330
    goto :goto_b

    .line 331
    :goto_c
    invoke-static {v1, v2}, Ll/csf;->a(ZLjava/lang/String;)V

    .line 332
    .line 333
    .line 334
    const v1, 0x76703038

    .line 335
    .line 336
    .line 337
    if-ne v10, v1, :cond_11

    .line 338
    .line 339
    const-string v1, "video/x-vnd.on2.vp8"

    .line 340
    .line 341
    goto :goto_d

    .line 342
    :cond_11
    const-string v1, "video/x-vnd.on2.vp9"

    .line 343
    .line 344
    :goto_d
    add-int/lit8 v12, v12, 0xc

    .line 345
    .line 346
    invoke-virtual {v0, v12}, Ll/ig60;->U(I)V

    .line 347
    .line 348
    .line 349
    invoke-virtual {v0, v7}, Ll/ig60;->V(I)V

    .line 350
    .line 351
    .line 352
    invoke-virtual {v0}, Ll/ig60;->H()I

    .line 353
    .line 354
    .line 355
    move-result v2

    .line 356
    and-int/lit8 v2, v2, 0x1

    .line 357
    .line 358
    if-eqz v2, :cond_12

    .line 359
    .line 360
    move/from16 v2, p8

    .line 361
    .line 362
    goto :goto_e

    .line 363
    :cond_12
    const/4 v2, 0x0

    .line 364
    :goto_e
    invoke-virtual {v0}, Ll/ig60;->H()I

    .line 365
    .line 366
    .line 367
    move-result v8

    .line 368
    invoke-virtual {v0}, Ll/ig60;->H()I

    .line 369
    .line 370
    .line 371
    move-result v12

    .line 372
    invoke-static {v8}, Ll/df5;->h(I)I

    .line 373
    .line 374
    .line 375
    move-result v18

    .line 376
    if-eqz v2, :cond_13

    .line 377
    .line 378
    move/from16 v19, p8

    .line 379
    .line 380
    goto :goto_f

    .line 381
    :cond_13
    move/from16 v19, v7

    .line 382
    .line 383
    :goto_f
    invoke-static {v12}, Ll/df5;->i(I)I

    .line 384
    .line 385
    .line 386
    move-result v20

    .line 387
    :goto_10
    move-object v8, v1

    .line 388
    :goto_11
    move-object/from16 v27, v3

    .line 389
    .line 390
    move/from16 v25, v10

    .line 391
    .line 392
    move-object/from16 v26, v11

    .line 393
    .line 394
    goto/16 :goto_8

    .line 395
    .line 396
    :cond_14
    const v2, 0x61763143

    .line 397
    .line 398
    .line 399
    if-ne v1, v2, :cond_16

    .line 400
    .line 401
    if-nez v8, :cond_15

    .line 402
    .line 403
    move/from16 v1, p8

    .line 404
    .line 405
    :goto_12
    const/4 v2, 0x0

    .line 406
    goto :goto_13

    .line 407
    :cond_15
    const/4 v1, 0x0

    .line 408
    goto :goto_12

    .line 409
    :goto_13
    invoke-static {v1, v2}, Ll/csf;->a(ZLjava/lang/String;)V

    .line 410
    .line 411
    .line 412
    const-string v1, "video/av01"

    .line 413
    .line 414
    goto :goto_10

    .line 415
    :cond_16
    const v2, 0x636c6c69

    .line 416
    .line 417
    .line 418
    if-ne v1, v2, :cond_18

    .line 419
    .line 420
    if-nez v21, :cond_17

    .line 421
    .line 422
    invoke-static {}, Ll/g31;->a()Ljava/nio/ByteBuffer;

    .line 423
    .line 424
    .line 425
    move-result-object v1

    .line 426
    goto :goto_14

    .line 427
    :cond_17
    move-object/from16 v1, v21

    .line 428
    .line 429
    :goto_14
    const/16 v2, 0x15

    .line 430
    .line 431
    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 432
    .line 433
    .line 434
    invoke-virtual {v0}, Ll/ig60;->D()S

    .line 435
    .line 436
    .line 437
    move-result v2

    .line 438
    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 439
    .line 440
    .line 441
    invoke-virtual {v0}, Ll/ig60;->D()S

    .line 442
    .line 443
    .line 444
    move-result v2

    .line 445
    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 446
    .line 447
    .line 448
    move-object/from16 v21, v1

    .line 449
    .line 450
    goto :goto_11

    .line 451
    :cond_18
    const v2, 0x6d646376

    .line 452
    .line 453
    .line 454
    if-ne v1, v2, :cond_1a

    .line 455
    .line 456
    if-nez v21, :cond_19

    .line 457
    .line 458
    invoke-static {}, Ll/g31;->a()Ljava/nio/ByteBuffer;

    .line 459
    .line 460
    .line 461
    move-result-object v1

    .line 462
    goto :goto_15

    .line 463
    :cond_19
    move-object/from16 v1, v21

    .line 464
    .line 465
    :goto_15
    invoke-virtual {v0}, Ll/ig60;->D()S

    .line 466
    .line 467
    .line 468
    move-result v2

    .line 469
    invoke-virtual {v0}, Ll/ig60;->D()S

    .line 470
    .line 471
    .line 472
    move-result v7

    .line 473
    invoke-virtual {v0}, Ll/ig60;->D()S

    .line 474
    .line 475
    .line 476
    move-result v12

    .line 477
    move/from16 v25, v10

    .line 478
    .line 479
    invoke-virtual {v0}, Ll/ig60;->D()S

    .line 480
    .line 481
    .line 482
    move-result v10

    .line 483
    move-object/from16 v26, v11

    .line 484
    .line 485
    invoke-virtual {v0}, Ll/ig60;->D()S

    .line 486
    .line 487
    .line 488
    move-result v11

    .line 489
    invoke-virtual {v0}, Ll/ig60;->D()S

    .line 490
    .line 491
    .line 492
    move-result v4

    .line 493
    move-object/from16 v27, v3

    .line 494
    .line 495
    invoke-virtual {v0}, Ll/ig60;->D()S

    .line 496
    .line 497
    .line 498
    move-result v3

    .line 499
    move-object/from16 v28, v15

    .line 500
    .line 501
    invoke-virtual {v0}, Ll/ig60;->D()S

    .line 502
    .line 503
    .line 504
    move-result v15

    .line 505
    invoke-virtual {v0}, Ll/ig60;->J()J

    .line 506
    .line 507
    .line 508
    move-result-wide v29

    .line 509
    invoke-virtual {v0}, Ll/ig60;->J()J

    .line 510
    .line 511
    .line 512
    move-result-wide v31

    .line 513
    move/from16 v33, v14

    .line 514
    .line 515
    move/from16 v14, p8

    .line 516
    .line 517
    invoke-virtual {v1, v14}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 518
    .line 519
    .line 520
    invoke-virtual {v1, v11}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 521
    .line 522
    .line 523
    invoke-virtual {v1, v4}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 524
    .line 525
    .line 526
    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 527
    .line 528
    .line 529
    invoke-virtual {v1, v7}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 530
    .line 531
    .line 532
    invoke-virtual {v1, v12}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 533
    .line 534
    .line 535
    invoke-virtual {v1, v10}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 536
    .line 537
    .line 538
    invoke-virtual {v1, v3}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 539
    .line 540
    .line 541
    invoke-virtual {v1, v15}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 542
    .line 543
    .line 544
    const-wide/16 v2, 0x2710

    .line 545
    .line 546
    div-long v10, v29, v2

    .line 547
    .line 548
    long-to-int v4, v10

    .line 549
    int-to-short v4, v4

    .line 550
    invoke-virtual {v1, v4}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 551
    .line 552
    .line 553
    div-long v2, v31, v2

    .line 554
    .line 555
    long-to-int v2, v2

    .line 556
    int-to-short v2, v2

    .line 557
    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 558
    .line 559
    .line 560
    move-object/from16 v21, v1

    .line 561
    .line 562
    move-object/from16 v15, v28

    .line 563
    .line 564
    move/from16 v14, v33

    .line 565
    .line 566
    goto/16 :goto_8

    .line 567
    .line 568
    :cond_1a
    move-object/from16 v27, v3

    .line 569
    .line 570
    move/from16 v25, v10

    .line 571
    .line 572
    move-object/from16 v26, v11

    .line 573
    .line 574
    move/from16 v33, v14

    .line 575
    .line 576
    move-object/from16 v28, v15

    .line 577
    .line 578
    const v2, 0x64323633

    .line 579
    .line 580
    .line 581
    if-ne v1, v2, :cond_1d

    .line 582
    .line 583
    if-nez v8, :cond_1b

    .line 584
    .line 585
    const/4 v1, 0x1

    .line 586
    :goto_16
    const/4 v2, 0x0

    .line 587
    goto :goto_17

    .line 588
    :cond_1b
    const/4 v1, 0x0

    .line 589
    goto :goto_16

    .line 590
    :goto_17
    invoke-static {v1, v2}, Ll/csf;->a(ZLjava/lang/String;)V

    .line 591
    .line 592
    .line 593
    move-object/from16 v8, v26

    .line 594
    .line 595
    :cond_1c
    :goto_18
    move-object/from16 v15, v28

    .line 596
    .line 597
    :goto_19
    move/from16 v14, v33

    .line 598
    .line 599
    goto/16 :goto_21

    .line 600
    .line 601
    :cond_1d
    const/4 v2, 0x0

    .line 602
    const v3, 0x65736473

    .line 603
    .line 604
    .line 605
    if-ne v1, v3, :cond_20

    .line 606
    .line 607
    if-nez v8, :cond_1e

    .line 608
    .line 609
    const/4 v1, 0x1

    .line 610
    goto :goto_1a

    .line 611
    :cond_1e
    const/4 v1, 0x0

    .line 612
    :goto_1a
    invoke-static {v1, v2}, Ll/csf;->a(ZLjava/lang/String;)V

    .line 613
    .line 614
    .line 615
    invoke-static {v0, v12}, Ll/g31;->j(Ll/ig60;I)Ll/g31$b;

    .line 616
    .line 617
    .line 618
    move-result-object v22

    .line 619
    invoke-static/range {v22 .. v22}, Ll/g31$b;->a(Ll/g31$b;)Ljava/lang/String;

    .line 620
    .line 621
    .line 622
    move-result-object v1

    .line 623
    invoke-static/range {v22 .. v22}, Ll/g31$b;->b(Ll/g31$b;)[B

    .line 624
    .line 625
    .line 626
    move-result-object v3

    .line 627
    if-eqz v3, :cond_1f

    .line 628
    .line 629
    invoke-static {v3}, Lcom/google/common/collect/ImmutableList;->of(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList;

    .line 630
    .line 631
    .line 632
    move-result-object v15

    .line 633
    goto :goto_1b

    .line 634
    :cond_1f
    move-object/from16 v15, v28

    .line 635
    .line 636
    :goto_1b
    move-object v8, v1

    .line 637
    goto :goto_19

    .line 638
    :cond_20
    const v3, 0x70617370

    .line 639
    .line 640
    .line 641
    if-ne v1, v3, :cond_21

    .line 642
    .line 643
    invoke-static {v0, v12}, Ll/g31;->r(Ll/ig60;I)F

    .line 644
    .line 645
    .line 646
    move-result v1

    .line 647
    move v14, v1

    .line 648
    move-object/from16 v15, v28

    .line 649
    .line 650
    const/16 v23, 0x1

    .line 651
    .line 652
    goto/16 :goto_21

    .line 653
    .line 654
    :cond_21
    const v3, 0x73763364

    .line 655
    .line 656
    .line 657
    if-ne v1, v3, :cond_22

    .line 658
    .line 659
    invoke-static {v0, v12, v9}, Ll/g31;->s(Ll/ig60;II)[B

    .line 660
    .line 661
    .line 662
    move-result-object v16

    .line 663
    goto :goto_18

    .line 664
    :cond_22
    const v3, 0x73743364

    .line 665
    .line 666
    .line 667
    if-ne v1, v3, :cond_27

    .line 668
    .line 669
    invoke-virtual {v0}, Ll/ig60;->H()I

    .line 670
    .line 671
    .line 672
    move-result v1

    .line 673
    const/4 v3, 0x3

    .line 674
    invoke-virtual {v0, v3}, Ll/ig60;->V(I)V

    .line 675
    .line 676
    .line 677
    if-nez v1, :cond_1c

    .line 678
    .line 679
    invoke-virtual {v0}, Ll/ig60;->H()I

    .line 680
    .line 681
    .line 682
    move-result v1

    .line 683
    if-eqz v1, :cond_26

    .line 684
    .line 685
    const/4 v14, 0x1

    .line 686
    if-eq v1, v14, :cond_25

    .line 687
    .line 688
    if-eq v1, v7, :cond_24

    .line 689
    .line 690
    if-eq v1, v3, :cond_23

    .line 691
    .line 692
    goto :goto_18

    .line 693
    :cond_23
    move/from16 v17, v3

    .line 694
    .line 695
    goto :goto_18

    .line 696
    :cond_24
    move/from16 v17, v7

    .line 697
    .line 698
    goto :goto_18

    .line 699
    :cond_25
    move/from16 v17, v14

    .line 700
    .line 701
    goto :goto_18

    .line 702
    :cond_26
    const/16 v17, 0x0

    .line 703
    .line 704
    goto :goto_18

    .line 705
    :cond_27
    const/4 v14, 0x1

    .line 706
    const v3, 0x636f6c72

    .line 707
    .line 708
    .line 709
    move/from16 v12, v18

    .line 710
    .line 711
    if-ne v1, v3, :cond_2c

    .line 712
    .line 713
    const/4 v1, -0x1

    .line 714
    move/from16 v3, v20

    .line 715
    .line 716
    if-ne v12, v1, :cond_2d

    .line 717
    .line 718
    if-ne v3, v1, :cond_2d

    .line 719
    .line 720
    invoke-virtual {v0}, Ll/ig60;->q()I

    .line 721
    .line 722
    .line 723
    move-result v1

    .line 724
    const v4, 0x6e636c78

    .line 725
    .line 726
    .line 727
    if-eq v1, v4, :cond_29

    .line 728
    .line 729
    const v4, 0x6e636c63

    .line 730
    .line 731
    .line 732
    if-ne v1, v4, :cond_28

    .line 733
    .line 734
    goto :goto_1c

    .line 735
    :cond_28
    new-instance v4, Ljava/lang/StringBuilder;

    .line 736
    .line 737
    const-string v7, "Unsupported color type: "

    .line 738
    .line 739
    invoke-direct {v4, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 740
    .line 741
    .line 742
    invoke-static {v1}, Ll/f31;->a(I)Ljava/lang/String;

    .line 743
    .line 744
    .line 745
    move-result-object v1

    .line 746
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 747
    .line 748
    .line 749
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 750
    .line 751
    .line 752
    move-result-object v1

    .line 753
    const-string v4, "AtomParsers"

    .line 754
    .line 755
    invoke-static {v4, v1}, Ll/kyv;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 756
    .line 757
    .line 758
    goto :goto_1f

    .line 759
    :cond_29
    :goto_1c
    invoke-virtual {v0}, Ll/ig60;->N()I

    .line 760
    .line 761
    .line 762
    move-result v1

    .line 763
    invoke-virtual {v0}, Ll/ig60;->N()I

    .line 764
    .line 765
    .line 766
    move-result v3

    .line 767
    invoke-virtual {v0, v7}, Ll/ig60;->V(I)V

    .line 768
    .line 769
    .line 770
    const/16 v4, 0x13

    .line 771
    .line 772
    if-ne v9, v4, :cond_2a

    .line 773
    .line 774
    invoke-virtual {v0}, Ll/ig60;->H()I

    .line 775
    .line 776
    .line 777
    move-result v4

    .line 778
    and-int/lit16 v4, v4, 0x80

    .line 779
    .line 780
    if-eqz v4, :cond_2a

    .line 781
    .line 782
    move v4, v14

    .line 783
    goto :goto_1d

    .line 784
    :cond_2a
    const/4 v4, 0x0

    .line 785
    :goto_1d
    invoke-static {v1}, Ll/df5;->h(I)I

    .line 786
    .line 787
    .line 788
    move-result v18

    .line 789
    if-eqz v4, :cond_2b

    .line 790
    .line 791
    move/from16 v19, v14

    .line 792
    .line 793
    goto :goto_1e

    .line 794
    :cond_2b
    move/from16 v19, v7

    .line 795
    .line 796
    :goto_1e
    invoke-static {v3}, Ll/df5;->i(I)I

    .line 797
    .line 798
    .line 799
    move-result v20

    .line 800
    goto/16 :goto_18

    .line 801
    .line 802
    :cond_2c
    move/from16 v3, v20

    .line 803
    .line 804
    :cond_2d
    :goto_1f
    move/from16 v20, v3

    .line 805
    .line 806
    move/from16 v18, v12

    .line 807
    .line 808
    goto/16 :goto_18

    .line 809
    .line 810
    :goto_20
    invoke-static {v0}, Ll/c7e;->a(Ll/ig60;)Ll/c7e;

    .line 811
    .line 812
    .line 813
    move-result-object v1

    .line 814
    if-eqz v1, :cond_2d

    .line 815
    .line 816
    iget-object v13, v1, Ll/c7e;->c:Ljava/lang/String;

    .line 817
    .line 818
    const-string v8, "video/dolby-vision"

    .line 819
    .line 820
    goto :goto_1f

    .line 821
    :goto_21
    add-int v7, v24, v9

    .line 822
    .line 823
    move/from16 v1, p2

    .line 824
    .line 825
    move/from16 v2, p3

    .line 826
    .line 827
    move-object/from16 v4, p7

    .line 828
    .line 829
    move/from16 v10, v25

    .line 830
    .line 831
    move-object/from16 v11, v26

    .line 832
    .line 833
    move-object/from16 v3, v27

    .line 834
    .line 835
    goto/16 :goto_2

    .line 836
    .line 837
    :goto_22
    if-nez v8, :cond_2e

    .line 838
    .line 839
    return-void

    .line 840
    :cond_2e
    new-instance v0, Lcom/google/android/exoplayer2/k$b;

    .line 841
    .line 842
    invoke-direct {v0}, Lcom/google/android/exoplayer2/k$b;-><init>()V

    .line 843
    .line 844
    .line 845
    move/from16 v1, p4

    .line 846
    .line 847
    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/k$b;->T(I)Lcom/google/android/exoplayer2/k$b;

    .line 848
    .line 849
    .line 850
    move-result-object v0

    .line 851
    invoke-virtual {v0, v8}, Lcom/google/android/exoplayer2/k$b;->g0(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 852
    .line 853
    .line 854
    move-result-object v0

    .line 855
    invoke-virtual {v0, v13}, Lcom/google/android/exoplayer2/k$b;->K(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 856
    .line 857
    .line 858
    move-result-object v0

    .line 859
    invoke-virtual {v0, v5}, Lcom/google/android/exoplayer2/k$b;->n0(I)Lcom/google/android/exoplayer2/k$b;

    .line 860
    .line 861
    .line 862
    move-result-object v0

    .line 863
    invoke-virtual {v0, v6}, Lcom/google/android/exoplayer2/k$b;->S(I)Lcom/google/android/exoplayer2/k$b;

    .line 864
    .line 865
    .line 866
    move-result-object v0

    .line 867
    move/from16 v14, v33

    .line 868
    .line 869
    invoke-virtual {v0, v14}, Lcom/google/android/exoplayer2/k$b;->c0(F)Lcom/google/android/exoplayer2/k$b;

    .line 870
    .line 871
    .line 872
    move-result-object v0

    .line 873
    move/from16 v1, p5

    .line 874
    .line 875
    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/k$b;->f0(I)Lcom/google/android/exoplayer2/k$b;

    .line 876
    .line 877
    .line 878
    move-result-object v0

    .line 879
    move-object/from16 v9, v16

    .line 880
    .line 881
    invoke-virtual {v0, v9}, Lcom/google/android/exoplayer2/k$b;->d0([B)Lcom/google/android/exoplayer2/k$b;

    .line 882
    .line 883
    .line 884
    move-result-object v0

    .line 885
    move/from16 v1, v17

    .line 886
    .line 887
    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/k$b;->j0(I)Lcom/google/android/exoplayer2/k$b;

    .line 888
    .line 889
    .line 890
    move-result-object v0

    .line 891
    move-object/from16 v9, v28

    .line 892
    .line 893
    invoke-virtual {v0, v9}, Lcom/google/android/exoplayer2/k$b;->V(Ljava/util/List;)Lcom/google/android/exoplayer2/k$b;

    .line 894
    .line 895
    .line 896
    move-result-object v0

    .line 897
    move-object/from16 v1, v27

    .line 898
    .line 899
    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/k$b;->O(Lcom/google/android/exoplayer2/drm/DrmInitData;)Lcom/google/android/exoplayer2/k$b;

    .line 900
    .line 901
    .line 902
    move-result-object v0

    .line 903
    const/4 v1, -0x1

    .line 904
    move/from16 v4, v19

    .line 905
    .line 906
    if-ne v12, v1, :cond_2f

    .line 907
    .line 908
    if-ne v4, v1, :cond_2f

    .line 909
    .line 910
    if-ne v3, v1, :cond_2f

    .line 911
    .line 912
    if-eqz v21, :cond_31

    .line 913
    .line 914
    :cond_2f
    new-instance v1, Ll/df5;

    .line 915
    .line 916
    if-eqz v21, :cond_30

    .line 917
    .line 918
    invoke-virtual/range {v21 .. v21}, Ljava/nio/ByteBuffer;->array()[B

    .line 919
    .line 920
    .line 921
    move-result-object v9

    .line 922
    goto :goto_23

    .line 923
    :cond_30
    move-object v9, v2

    .line 924
    :goto_23
    invoke-direct {v1, v12, v4, v3, v9}, Ll/df5;-><init>(III[B)V

    .line 925
    .line 926
    .line 927
    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/k$b;->L(Ll/df5;)Lcom/google/android/exoplayer2/k$b;

    .line 928
    .line 929
    .line 930
    :cond_31
    if-eqz v22, :cond_32

    .line 931
    .line 932
    invoke-static/range {v22 .. v22}, Ll/g31$b;->d(Ll/g31$b;)J

    .line 933
    .line 934
    .line 935
    move-result-wide v1

    .line 936
    invoke-static {v1, v2}, Lcom/google/common/primitives/Ints;->m(J)I

    .line 937
    .line 938
    .line 939
    move-result v1

    .line 940
    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/k$b;->I(I)Lcom/google/android/exoplayer2/k$b;

    .line 941
    .line 942
    .line 943
    move-result-object v1

    .line 944
    invoke-static/range {v22 .. v22}, Ll/g31$b;->c(Ll/g31$b;)J

    .line 945
    .line 946
    .line 947
    move-result-wide v2

    .line 948
    invoke-static {v2, v3}, Lcom/google/common/primitives/Ints;->m(J)I

    .line 949
    .line 950
    .line 951
    move-result v2

    .line 952
    invoke-virtual {v1, v2}, Lcom/google/android/exoplayer2/k$b;->b0(I)Lcom/google/android/exoplayer2/k$b;

    .line 953
    .line 954
    .line 955
    :cond_32
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/k$b;->G()Lcom/google/android/exoplayer2/k;

    .line 956
    .line 957
    .line 958
    move-result-object v0

    .line 959
    move-object/from16 v4, p7

    .line 960
    .line 961
    iput-object v0, v4, Ll/g31$e;->b:Lcom/google/android/exoplayer2/k;

    .line 962
    .line 963
    return-void
.end method

.method public static F(Ll/ig60;)Lcom/google/android/exoplayer2/metadata/Metadata;
    .locals 5
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/ig60;->D()S

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x2

    .line 6
    invoke-virtual {p0, v1}, Ll/ig60;->V(I)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/ig60;->E(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const/16 v0, 0x2b

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Ljava/lang/String;->lastIndexOf(I)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    const/16 v1, 0x2d

    .line 20
    .line 21
    invoke-virtual {p0, v1}, Ljava/lang/String;->lastIndexOf(I)I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    const/4 v1, 0x0

    .line 30
    :try_start_0
    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-static {v2}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    const/4 v4, 0x1

    .line 43
    sub-int/2addr v3, v4

    .line 44
    invoke-virtual {p0, v0, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-static {p0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    new-instance v0, Lcom/google/android/exoplayer2/metadata/Metadata;

    .line 53
    .line 54
    new-instance v3, Lcom/google/android/exoplayer2/container/Mp4LocationData;

    .line 55
    .line 56
    invoke-direct {v3, v2, p0}, Lcom/google/android/exoplayer2/container/Mp4LocationData;-><init>(FF)V

    .line 57
    .line 58
    .line 59
    new-array p0, v4, [Lcom/google/android/exoplayer2/metadata/Metadata$Entry;

    .line 60
    .line 61
    aput-object v3, p0, v1

    .line 62
    .line 63
    invoke-direct {v0, p0}, Lcom/google/android/exoplayer2/metadata/Metadata;-><init>([Lcom/google/android/exoplayer2/metadata/Metadata$Entry;)V
    :try_end_0
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 64
    .line 65
    .line 66
    return-object v0

    .line 67
    :catch_0
    const/4 p0, 0x0

    .line 68
    return-object p0
.end method

.method public static a()Ljava/nio/ByteBuffer;
    .locals 2

    .line 1
    const/16 v0, 0x19

    .line 2
    .line 3
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    return-object v0
.end method

.method public static b([JJJJ)Z
    .locals 7

    .line 1
    array-length v0, p0

    .line 2
    const/4 v1, 0x1

    .line 3
    sub-int/2addr v0, v1

    .line 4
    const/4 v2, 0x4

    .line 5
    const/4 v3, 0x0

    .line 6
    invoke-static {v2, v3, v0}, Ll/bmk0;->q(III)I

    .line 7
    .line 8
    .line 9
    move-result v4

    .line 10
    array-length v5, p0

    .line 11
    sub-int/2addr v5, v2

    .line 12
    invoke-static {v5, v3, v0}, Ll/bmk0;->q(III)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    aget-wide v5, p0, v3

    .line 17
    .line 18
    cmp-long v2, v5, p3

    .line 19
    .line 20
    if-gtz v2, :cond_0

    .line 21
    .line 22
    aget-wide v4, p0, v4

    .line 23
    .line 24
    cmp-long p3, p3, v4

    .line 25
    .line 26
    if-gez p3, :cond_0

    .line 27
    .line 28
    aget-wide p3, p0, v0

    .line 29
    .line 30
    cmp-long p0, p3, p5

    .line 31
    .line 32
    if-gez p0, :cond_0

    .line 33
    .line 34
    cmp-long p0, p5, p1

    .line 35
    .line 36
    if-gtz p0, :cond_0

    .line 37
    .line 38
    return v1

    .line 39
    :cond_0
    return v3
.end method

.method public static c(I)Z
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-eq p0, v0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    const/4 p0, 0x0

    .line 6
    return p0
.end method

.method public static d(Ll/ig60;III)I
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ParserException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/ig60;->f()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x1

    .line 7
    if-lt v0, p2, :cond_0

    .line 8
    .line 9
    move v3, v2

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    move v3, v1

    .line 12
    :goto_0
    const/4 v4, 0x0

    .line 13
    invoke-static {v3, v4}, Ll/csf;->a(ZLjava/lang/String;)V

    .line 14
    .line 15
    .line 16
    :goto_1
    sub-int v3, v0, p2

    .line 17
    .line 18
    if-ge v3, p3, :cond_3

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/ig60;->U(I)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Ll/ig60;->q()I

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    if-lez v3, :cond_1

    .line 28
    .line 29
    move v4, v2

    .line 30
    goto :goto_2

    .line 31
    :cond_1
    move v4, v1

    .line 32
    :goto_2
    const-string v5, "childAtomSize must be positive"

    .line 33
    .line 34
    invoke-static {v4, v5}, Ll/csf;->a(ZLjava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Ll/ig60;->q()I

    .line 38
    .line 39
    .line 40
    move-result v4

    .line 41
    if-ne v4, p1, :cond_2

    .line 42
    .line 43
    return v0

    .line 44
    :cond_2
    add-int/2addr v0, v3

    .line 45
    goto :goto_1

    .line 46
    :cond_3
    const/4 p0, -0x1

    .line 47
    return p0
.end method

.method public static e(I)I
    .locals 1

    .line 1
    const v0, 0x736f756e

    .line 2
    .line 3
    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0

    .line 8
    :cond_0
    const v0, 0x76696465

    .line 9
    .line 10
    .line 11
    if-ne p0, v0, :cond_1

    .line 12
    .line 13
    const/4 p0, 0x2

    .line 14
    return p0

    .line 15
    :cond_1
    const v0, 0x74657874

    .line 16
    .line 17
    .line 18
    if-eq p0, v0, :cond_4

    .line 19
    .line 20
    const v0, 0x7362746c

    .line 21
    .line 22
    .line 23
    if-eq p0, v0, :cond_4

    .line 24
    .line 25
    const v0, 0x73756274

    .line 26
    .line 27
    .line 28
    if-eq p0, v0, :cond_4

    .line 29
    .line 30
    const v0, 0x636c6370

    .line 31
    .line 32
    .line 33
    if-ne p0, v0, :cond_2

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_2
    const v0, 0x6d657461

    .line 37
    .line 38
    .line 39
    if-ne p0, v0, :cond_3

    .line 40
    .line 41
    const/4 p0, 0x5

    .line 42
    return p0

    .line 43
    :cond_3
    const/4 p0, -0x1

    .line 44
    return p0

    .line 45
    :cond_4
    :goto_0
    const/4 p0, 0x3

    .line 46
    return p0
.end method

.method public static f(Ll/ig60;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/ig60;->f()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x4

    .line 6
    invoke-virtual {p0, v1}, Ll/ig60;->V(I)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Ll/ig60;->q()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const v2, 0x68646c72    # 4.3148E24f

    .line 14
    .line 15
    .line 16
    if-eq v1, v2, :cond_0

    .line 17
    .line 18
    add-int/lit8 v0, v0, 0x4

    .line 19
    .line 20
    :cond_0
    invoke-virtual {p0, v0}, Ll/ig60;->U(I)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static g(Ll/ig60;IIIILjava/lang/String;ZLcom/google/android/exoplayer2/drm/DrmInitData;Ll/g31$e;I)V
    .locals 22
    .param p7    # Lcom/google/android/exoplayer2/drm/DrmInitData;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ParserException;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p2

    .line 4
    .line 5
    move/from16 v2, p3

    .line 6
    .line 7
    move/from16 v3, p4

    .line 8
    .line 9
    move-object/from16 v4, p5

    .line 10
    .line 11
    move-object/from16 v5, p7

    .line 12
    .line 13
    move-object/from16 v6, p8

    .line 14
    .line 15
    add-int/lit8 v7, v1, 0x10

    .line 16
    .line 17
    invoke-virtual {v0, v7}, Ll/ig60;->U(I)V

    .line 18
    .line 19
    .line 20
    const/4 v7, 0x6

    .line 21
    if-eqz p6, :cond_0

    .line 22
    .line 23
    invoke-virtual {v0}, Ll/ig60;->N()I

    .line 24
    .line 25
    .line 26
    move-result v9

    .line 27
    invoke-virtual {v0, v7}, Ll/ig60;->V(I)V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    const/16 v9, 0x8

    .line 32
    .line 33
    invoke-virtual {v0, v9}, Ll/ig60;->V(I)V

    .line 34
    .line 35
    .line 36
    const/4 v9, 0x0

    .line 37
    :goto_0
    const/4 v10, 0x4

    .line 38
    const/4 v11, 0x2

    .line 39
    const/4 v12, 0x1

    .line 40
    const/16 v13, 0x10

    .line 41
    .line 42
    if-eqz v9, :cond_2

    .line 43
    .line 44
    if-ne v9, v12, :cond_1

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_1
    if-ne v9, v11, :cond_31

    .line 48
    .line 49
    invoke-virtual {v0, v13}, Ll/ig60;->V(I)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0}, Ll/ig60;->o()D

    .line 53
    .line 54
    .line 55
    move-result-wide v13

    .line 56
    invoke-static {v13, v14}, Ljava/lang/Math;->round(D)J

    .line 57
    .line 58
    .line 59
    move-result-wide v13

    .line 60
    long-to-int v7, v13

    .line 61
    invoke-virtual {v0}, Ll/ig60;->L()I

    .line 62
    .line 63
    .line 64
    move-result v9

    .line 65
    const/16 v13, 0x14

    .line 66
    .line 67
    invoke-virtual {v0, v13}, Ll/ig60;->V(I)V

    .line 68
    .line 69
    .line 70
    const/4 v15, 0x0

    .line 71
    goto :goto_2

    .line 72
    :cond_2
    :goto_1
    invoke-virtual {v0}, Ll/ig60;->N()I

    .line 73
    .line 74
    .line 75
    move-result v14

    .line 76
    invoke-virtual {v0, v7}, Ll/ig60;->V(I)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {v0}, Ll/ig60;->I()I

    .line 80
    .line 81
    .line 82
    move-result v7

    .line 83
    invoke-virtual {v0}, Ll/ig60;->f()I

    .line 84
    .line 85
    .line 86
    move-result v15

    .line 87
    sub-int/2addr v15, v10

    .line 88
    invoke-virtual {v0, v15}, Ll/ig60;->U(I)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {v0}, Ll/ig60;->q()I

    .line 92
    .line 93
    .line 94
    move-result v15

    .line 95
    if-ne v9, v12, :cond_3

    .line 96
    .line 97
    invoke-virtual {v0, v13}, Ll/ig60;->V(I)V

    .line 98
    .line 99
    .line 100
    :cond_3
    move v9, v14

    .line 101
    :goto_2
    invoke-virtual {v0}, Ll/ig60;->f()I

    .line 102
    .line 103
    .line 104
    move-result v13

    .line 105
    const v14, 0x656e6361

    .line 106
    .line 107
    .line 108
    move/from16 v16, v11

    .line 109
    .line 110
    move/from16 v17, v12

    .line 111
    .line 112
    move/from16 v12, p1

    .line 113
    .line 114
    if-ne v12, v14, :cond_6

    .line 115
    .line 116
    invoke-static {v0, v1, v2}, Ll/g31;->t(Ll/ig60;II)Landroid/util/Pair;

    .line 117
    .line 118
    .line 119
    move-result-object v14

    .line 120
    if-eqz v14, :cond_5

    .line 121
    .line 122
    iget-object v12, v14, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 123
    .line 124
    check-cast v12, Ljava/lang/Integer;

    .line 125
    .line 126
    invoke-virtual {v12}, Ljava/lang/Integer;->intValue()I

    .line 127
    .line 128
    .line 129
    move-result v12

    .line 130
    if-nez v5, :cond_4

    .line 131
    .line 132
    const/4 v5, 0x0

    .line 133
    goto :goto_3

    .line 134
    :cond_4
    iget-object v10, v14, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 135
    .line 136
    check-cast v10, Ll/zej0;

    .line 137
    .line 138
    iget-object v10, v10, Ll/zej0;->b:Ljava/lang/String;

    .line 139
    .line 140
    invoke-virtual {v5, v10}, Lcom/google/android/exoplayer2/drm/DrmInitData;->c(Ljava/lang/String;)Lcom/google/android/exoplayer2/drm/DrmInitData;

    .line 141
    .line 142
    .line 143
    move-result-object v5

    .line 144
    :goto_3
    iget-object v10, v6, Ll/g31$e;->a:[Ll/zej0;

    .line 145
    .line 146
    iget-object v14, v14, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 147
    .line 148
    check-cast v14, Ll/zej0;

    .line 149
    .line 150
    aput-object v14, v10, p9

    .line 151
    .line 152
    :cond_5
    invoke-virtual {v0, v13}, Ll/ig60;->U(I)V

    .line 153
    .line 154
    .line 155
    :cond_6
    const v10, 0x61632d33

    .line 156
    .line 157
    .line 158
    const v14, 0x616c6163

    .line 159
    .line 160
    .line 161
    if-ne v12, v10, :cond_7

    .line 162
    .line 163
    const-string v10, "audio/ac3"

    .line 164
    .line 165
    :goto_4
    move-object/from16 v18, v10

    .line 166
    .line 167
    const/4 v10, -0x1

    .line 168
    goto/16 :goto_8

    .line 169
    .line 170
    :cond_7
    const v10, 0x65632d33

    .line 171
    .line 172
    .line 173
    if-ne v12, v10, :cond_8

    .line 174
    .line 175
    const-string v10, "audio/eac3"

    .line 176
    .line 177
    goto :goto_4

    .line 178
    :cond_8
    const v10, 0x61632d34

    .line 179
    .line 180
    .line 181
    if-ne v12, v10, :cond_9

    .line 182
    .line 183
    const-string v10, "audio/ac4"

    .line 184
    .line 185
    goto :goto_4

    .line 186
    :cond_9
    const v10, 0x64747363

    .line 187
    .line 188
    .line 189
    if-ne v12, v10, :cond_a

    .line 190
    .line 191
    const-string v10, "audio/vnd.dts"

    .line 192
    .line 193
    goto :goto_4

    .line 194
    :cond_a
    const v10, 0x64747368

    .line 195
    .line 196
    .line 197
    if-eq v12, v10, :cond_1d

    .line 198
    .line 199
    const v10, 0x6474736c

    .line 200
    .line 201
    .line 202
    if-ne v12, v10, :cond_b

    .line 203
    .line 204
    goto/16 :goto_7

    .line 205
    .line 206
    :cond_b
    const v10, 0x64747365

    .line 207
    .line 208
    .line 209
    if-ne v12, v10, :cond_c

    .line 210
    .line 211
    const-string v10, "audio/vnd.dts.hd;profile=lbr"

    .line 212
    .line 213
    goto :goto_4

    .line 214
    :cond_c
    const v10, 0x64747378

    .line 215
    .line 216
    .line 217
    if-ne v12, v10, :cond_d

    .line 218
    .line 219
    const-string v10, "audio/vnd.dts.uhd;profile=p2"

    .line 220
    .line 221
    goto :goto_4

    .line 222
    :cond_d
    const v10, 0x73616d72

    .line 223
    .line 224
    .line 225
    if-ne v12, v10, :cond_e

    .line 226
    .line 227
    const-string v10, "audio/3gpp"

    .line 228
    .line 229
    goto :goto_4

    .line 230
    :cond_e
    const v10, 0x73617762

    .line 231
    .line 232
    .line 233
    if-ne v12, v10, :cond_f

    .line 234
    .line 235
    const-string v10, "audio/amr-wb"

    .line 236
    .line 237
    goto :goto_4

    .line 238
    :cond_f
    const v10, 0x6c70636d

    .line 239
    .line 240
    .line 241
    const-string v18, "audio/raw"

    .line 242
    .line 243
    if-eq v12, v10, :cond_1c

    .line 244
    .line 245
    const v10, 0x736f7774

    .line 246
    .line 247
    .line 248
    if-ne v12, v10, :cond_10

    .line 249
    .line 250
    goto :goto_6

    .line 251
    :cond_10
    const v10, 0x74776f73

    .line 252
    .line 253
    .line 254
    if-ne v12, v10, :cond_11

    .line 255
    .line 256
    const/high16 v10, 0x10000000

    .line 257
    .line 258
    goto :goto_8

    .line 259
    :cond_11
    const v10, 0x2e6d7032

    .line 260
    .line 261
    .line 262
    if-eq v12, v10, :cond_1b

    .line 263
    .line 264
    const v10, 0x2e6d7033

    .line 265
    .line 266
    .line 267
    if-ne v12, v10, :cond_12

    .line 268
    .line 269
    goto :goto_5

    .line 270
    :cond_12
    const v10, 0x6d686131

    .line 271
    .line 272
    .line 273
    if-ne v12, v10, :cond_13

    .line 274
    .line 275
    const-string v10, "audio/mha1"

    .line 276
    .line 277
    goto :goto_4

    .line 278
    :cond_13
    const v10, 0x6d686d31

    .line 279
    .line 280
    .line 281
    if-ne v12, v10, :cond_14

    .line 282
    .line 283
    const-string v10, "audio/mhm1"

    .line 284
    .line 285
    goto :goto_4

    .line 286
    :cond_14
    if-ne v12, v14, :cond_15

    .line 287
    .line 288
    const-string v10, "audio/alac"

    .line 289
    .line 290
    goto :goto_4

    .line 291
    :cond_15
    const v10, 0x616c6177

    .line 292
    .line 293
    .line 294
    if-ne v12, v10, :cond_16

    .line 295
    .line 296
    const-string v10, "audio/g711-alaw"

    .line 297
    .line 298
    goto/16 :goto_4

    .line 299
    .line 300
    :cond_16
    const v10, 0x756c6177

    .line 301
    .line 302
    .line 303
    if-ne v12, v10, :cond_17

    .line 304
    .line 305
    const-string v10, "audio/g711-mlaw"

    .line 306
    .line 307
    goto/16 :goto_4

    .line 308
    .line 309
    :cond_17
    const v10, 0x4f707573

    .line 310
    .line 311
    .line 312
    if-ne v12, v10, :cond_18

    .line 313
    .line 314
    const-string v10, "audio/opus"

    .line 315
    .line 316
    goto/16 :goto_4

    .line 317
    .line 318
    :cond_18
    const v10, 0x664c6143

    .line 319
    .line 320
    .line 321
    if-ne v12, v10, :cond_19

    .line 322
    .line 323
    const-string v10, "audio/flac"

    .line 324
    .line 325
    goto/16 :goto_4

    .line 326
    .line 327
    :cond_19
    const v10, 0x6d6c7061

    .line 328
    .line 329
    .line 330
    if-ne v12, v10, :cond_1a

    .line 331
    .line 332
    const-string v10, "audio/true-hd"

    .line 333
    .line 334
    goto/16 :goto_4

    .line 335
    .line 336
    :cond_1a
    const/4 v10, -0x1

    .line 337
    const/16 v18, 0x0

    .line 338
    .line 339
    goto :goto_8

    .line 340
    :cond_1b
    :goto_5
    const-string v10, "audio/mpeg"

    .line 341
    .line 342
    goto/16 :goto_4

    .line 343
    .line 344
    :cond_1c
    :goto_6
    move/from16 v10, v16

    .line 345
    .line 346
    goto :goto_8

    .line 347
    :cond_1d
    :goto_7
    const-string v10, "audio/vnd.dts.hd"

    .line 348
    .line 349
    goto/16 :goto_4

    .line 350
    .line 351
    :goto_8
    move-object/from16 v12, v18

    .line 352
    .line 353
    const/16 v18, 0x0

    .line 354
    .line 355
    const/16 v19, 0x0

    .line 356
    .line 357
    const/16 v20, 0x0

    .line 358
    .line 359
    :goto_9
    sub-int v11, v13, v1

    .line 360
    .line 361
    if-ge v11, v2, :cond_2f

    .line 362
    .line 363
    invoke-virtual {v0, v13}, Ll/ig60;->U(I)V

    .line 364
    .line 365
    .line 366
    invoke-virtual {v0}, Ll/ig60;->q()I

    .line 367
    .line 368
    .line 369
    move-result v11

    .line 370
    if-lez v11, :cond_1e

    .line 371
    .line 372
    move/from16 v14, v17

    .line 373
    .line 374
    goto :goto_a

    .line 375
    :cond_1e
    const/4 v14, 0x0

    .line 376
    :goto_a
    const-string v8, "childAtomSize must be positive"

    .line 377
    .line 378
    invoke-static {v14, v8}, Ll/csf;->a(ZLjava/lang/String;)V

    .line 379
    .line 380
    .line 381
    invoke-virtual {v0}, Ll/ig60;->q()I

    .line 382
    .line 383
    .line 384
    move-result v8

    .line 385
    const v14, 0x6d686143

    .line 386
    .line 387
    .line 388
    if-ne v8, v14, :cond_1f

    .line 389
    .line 390
    add-int/lit8 v8, v11, -0xd

    .line 391
    .line 392
    new-array v14, v8, [B

    .line 393
    .line 394
    add-int/lit8 v1, v13, 0xd

    .line 395
    .line 396
    invoke-virtual {v0, v1}, Ll/ig60;->U(I)V

    .line 397
    .line 398
    .line 399
    const/4 v1, 0x0

    .line 400
    invoke-virtual {v0, v14, v1, v8}, Ll/ig60;->l([BII)V

    .line 401
    .line 402
    .line 403
    invoke-static {v14}, Lcom/google/common/collect/ImmutableList;->of(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList;

    .line 404
    .line 405
    .line 406
    move-result-object v20

    .line 407
    :goto_b
    const/4 v8, -0x1

    .line 408
    const/4 v14, 0x4

    .line 409
    :goto_c
    const/16 v21, 0x0

    .line 410
    .line 411
    goto/16 :goto_13

    .line 412
    .line 413
    :cond_1f
    const v1, 0x65736473

    .line 414
    .line 415
    .line 416
    if-eq v8, v1, :cond_20

    .line 417
    .line 418
    if-eqz p6, :cond_21

    .line 419
    .line 420
    const v14, 0x77617665

    .line 421
    .line 422
    .line 423
    if-ne v8, v14, :cond_21

    .line 424
    .line 425
    :cond_20
    const v2, 0x616c6163

    .line 426
    .line 427
    .line 428
    const/4 v14, 0x4

    .line 429
    const/16 v21, 0x0

    .line 430
    .line 431
    goto/16 :goto_10

    .line 432
    .line 433
    :cond_21
    const v1, 0x64616333

    .line 434
    .line 435
    .line 436
    if-ne v8, v1, :cond_22

    .line 437
    .line 438
    add-int/lit8 v1, v13, 0x8

    .line 439
    .line 440
    invoke-virtual {v0, v1}, Ll/ig60;->U(I)V

    .line 441
    .line 442
    .line 443
    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 444
    .line 445
    .line 446
    move-result-object v1

    .line 447
    invoke-static {v0, v1, v4, v5}, Ll/z8;->d(Ll/ig60;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/exoplayer2/drm/DrmInitData;)Lcom/google/android/exoplayer2/k;

    .line 448
    .line 449
    .line 450
    move-result-object v1

    .line 451
    iput-object v1, v6, Ll/g31$e;->b:Lcom/google/android/exoplayer2/k;

    .line 452
    .line 453
    :goto_d
    const v2, 0x616c6163

    .line 454
    .line 455
    .line 456
    const/4 v8, 0x0

    .line 457
    const/4 v14, 0x4

    .line 458
    goto/16 :goto_f

    .line 459
    .line 460
    :cond_22
    const v1, 0x64656333

    .line 461
    .line 462
    .line 463
    if-ne v8, v1, :cond_23

    .line 464
    .line 465
    add-int/lit8 v1, v13, 0x8

    .line 466
    .line 467
    invoke-virtual {v0, v1}, Ll/ig60;->U(I)V

    .line 468
    .line 469
    .line 470
    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 471
    .line 472
    .line 473
    move-result-object v1

    .line 474
    invoke-static {v0, v1, v4, v5}, Ll/z8;->h(Ll/ig60;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/exoplayer2/drm/DrmInitData;)Lcom/google/android/exoplayer2/k;

    .line 475
    .line 476
    .line 477
    move-result-object v1

    .line 478
    iput-object v1, v6, Ll/g31$e;->b:Lcom/google/android/exoplayer2/k;

    .line 479
    .line 480
    goto :goto_d

    .line 481
    :cond_23
    const v1, 0x64616334

    .line 482
    .line 483
    .line 484
    if-ne v8, v1, :cond_24

    .line 485
    .line 486
    add-int/lit8 v1, v13, 0x8

    .line 487
    .line 488
    invoke-virtual {v0, v1}, Ll/ig60;->U(I)V

    .line 489
    .line 490
    .line 491
    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 492
    .line 493
    .line 494
    move-result-object v1

    .line 495
    invoke-static {v0, v1, v4, v5}, Ll/d9;->b(Ll/ig60;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/exoplayer2/drm/DrmInitData;)Lcom/google/android/exoplayer2/k;

    .line 496
    .line 497
    .line 498
    move-result-object v1

    .line 499
    iput-object v1, v6, Ll/g31$e;->b:Lcom/google/android/exoplayer2/k;

    .line 500
    .line 501
    goto :goto_d

    .line 502
    :cond_24
    const v1, 0x646d6c70

    .line 503
    .line 504
    .line 505
    if-ne v8, v1, :cond_26

    .line 506
    .line 507
    if-lez v15, :cond_25

    .line 508
    .line 509
    move v7, v15

    .line 510
    move/from16 v9, v16

    .line 511
    .line 512
    goto :goto_b

    .line 513
    :cond_25
    new-instance v0, Ljava/lang/StringBuilder;

    .line 514
    .line 515
    const-string v1, "Invalid sample rate for Dolby TrueHD MLP stream: "

    .line 516
    .line 517
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 518
    .line 519
    .line 520
    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 521
    .line 522
    .line 523
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 524
    .line 525
    .line 526
    move-result-object v0

    .line 527
    const/4 v14, 0x0

    .line 528
    invoke-static {v0, v14}, Lcom/google/android/exoplayer2/ParserException;->createForMalformedContainer(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/exoplayer2/ParserException;

    .line 529
    .line 530
    .line 531
    move-result-object v0

    .line 532
    throw v0

    .line 533
    :cond_26
    const/4 v14, 0x0

    .line 534
    const v1, 0x64647473

    .line 535
    .line 536
    .line 537
    if-eq v8, v1, :cond_27

    .line 538
    .line 539
    const v1, 0x75647473

    .line 540
    .line 541
    .line 542
    if-ne v8, v1, :cond_28

    .line 543
    .line 544
    :cond_27
    const v2, 0x616c6163

    .line 545
    .line 546
    .line 547
    const/4 v8, 0x0

    .line 548
    const/4 v14, 0x4

    .line 549
    goto/16 :goto_e

    .line 550
    .line 551
    :cond_28
    const v1, 0x644f7073

    .line 552
    .line 553
    .line 554
    if-ne v8, v1, :cond_29

    .line 555
    .line 556
    add-int/lit8 v1, v11, -0x8

    .line 557
    .line 558
    sget-object v8, Ll/g31;->a:[B

    .line 559
    .line 560
    array-length v14, v8

    .line 561
    add-int/2addr v14, v1

    .line 562
    invoke-static {v8, v14}, Ljava/util/Arrays;->copyOf([BI)[B

    .line 563
    .line 564
    .line 565
    move-result-object v14

    .line 566
    add-int/lit8 v2, v13, 0x8

    .line 567
    .line 568
    invoke-virtual {v0, v2}, Ll/ig60;->U(I)V

    .line 569
    .line 570
    .line 571
    array-length v2, v8

    .line 572
    invoke-virtual {v0, v14, v2, v1}, Ll/ig60;->l([BII)V

    .line 573
    .line 574
    .line 575
    invoke-static {v14}, Ll/w560;->a([B)Ljava/util/List;

    .line 576
    .line 577
    .line 578
    move-result-object v20

    .line 579
    goto/16 :goto_b

    .line 580
    .line 581
    :cond_29
    const v1, 0x64664c61

    .line 582
    .line 583
    .line 584
    if-ne v8, v1, :cond_2a

    .line 585
    .line 586
    add-int/lit8 v1, v11, -0xc

    .line 587
    .line 588
    add-int/lit8 v2, v11, -0x8

    .line 589
    .line 590
    new-array v2, v2, [B

    .line 591
    .line 592
    const/16 v8, 0x66

    .line 593
    .line 594
    const/16 v21, 0x0

    .line 595
    .line 596
    aput-byte v8, v2, v21

    .line 597
    .line 598
    const/16 v8, 0x4c

    .line 599
    .line 600
    aput-byte v8, v2, v17

    .line 601
    .line 602
    const/16 v8, 0x61

    .line 603
    .line 604
    aput-byte v8, v2, v16

    .line 605
    .line 606
    const/4 v8, 0x3

    .line 607
    const/16 v14, 0x43

    .line 608
    .line 609
    aput-byte v14, v2, v8

    .line 610
    .line 611
    add-int/lit8 v8, v13, 0xc

    .line 612
    .line 613
    invoke-virtual {v0, v8}, Ll/ig60;->U(I)V

    .line 614
    .line 615
    .line 616
    const/4 v14, 0x4

    .line 617
    invoke-virtual {v0, v2, v14, v1}, Ll/ig60;->l([BII)V

    .line 618
    .line 619
    .line 620
    invoke-static {v2}, Lcom/google/common/collect/ImmutableList;->of(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList;

    .line 621
    .line 622
    .line 623
    move-result-object v20

    .line 624
    const/4 v8, -0x1

    .line 625
    goto/16 :goto_c

    .line 626
    .line 627
    :cond_2a
    const v2, 0x616c6163

    .line 628
    .line 629
    .line 630
    const/4 v14, 0x4

    .line 631
    if-ne v8, v2, :cond_2b

    .line 632
    .line 633
    add-int/lit8 v1, v11, -0xc

    .line 634
    .line 635
    new-array v7, v1, [B

    .line 636
    .line 637
    add-int/lit8 v8, v13, 0xc

    .line 638
    .line 639
    invoke-virtual {v0, v8}, Ll/ig60;->U(I)V

    .line 640
    .line 641
    .line 642
    const/4 v8, 0x0

    .line 643
    invoke-virtual {v0, v7, v8, v1}, Ll/ig60;->l([BII)V

    .line 644
    .line 645
    .line 646
    invoke-static {v7}, Ll/lc5;->h([B)Landroid/util/Pair;

    .line 647
    .line 648
    .line 649
    move-result-object v1

    .line 650
    iget-object v9, v1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 651
    .line 652
    check-cast v9, Ljava/lang/Integer;

    .line 653
    .line 654
    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    .line 655
    .line 656
    .line 657
    move-result v9

    .line 658
    iget-object v1, v1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 659
    .line 660
    check-cast v1, Ljava/lang/Integer;

    .line 661
    .line 662
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 663
    .line 664
    .line 665
    move-result v1

    .line 666
    invoke-static {v7}, Lcom/google/common/collect/ImmutableList;->of(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList;

    .line 667
    .line 668
    .line 669
    move-result-object v20

    .line 670
    move/from16 v21, v8

    .line 671
    .line 672
    move v7, v9

    .line 673
    const/4 v8, -0x1

    .line 674
    move v9, v1

    .line 675
    goto :goto_13

    .line 676
    :cond_2b
    const/4 v8, 0x0

    .line 677
    goto :goto_f

    .line 678
    :goto_e
    new-instance v1, Lcom/google/android/exoplayer2/k$b;

    .line 679
    .line 680
    invoke-direct {v1}, Lcom/google/android/exoplayer2/k$b;-><init>()V

    .line 681
    .line 682
    .line 683
    invoke-virtual {v1, v3}, Lcom/google/android/exoplayer2/k$b;->T(I)Lcom/google/android/exoplayer2/k$b;

    .line 684
    .line 685
    .line 686
    move-result-object v1

    .line 687
    invoke-virtual {v1, v12}, Lcom/google/android/exoplayer2/k$b;->g0(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 688
    .line 689
    .line 690
    move-result-object v1

    .line 691
    invoke-virtual {v1, v9}, Lcom/google/android/exoplayer2/k$b;->J(I)Lcom/google/android/exoplayer2/k$b;

    .line 692
    .line 693
    .line 694
    move-result-object v1

    .line 695
    invoke-virtual {v1, v7}, Lcom/google/android/exoplayer2/k$b;->h0(I)Lcom/google/android/exoplayer2/k$b;

    .line 696
    .line 697
    .line 698
    move-result-object v1

    .line 699
    invoke-virtual {v1, v5}, Lcom/google/android/exoplayer2/k$b;->O(Lcom/google/android/exoplayer2/drm/DrmInitData;)Lcom/google/android/exoplayer2/k$b;

    .line 700
    .line 701
    .line 702
    move-result-object v1

    .line 703
    invoke-virtual {v1, v4}, Lcom/google/android/exoplayer2/k$b;->X(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 704
    .line 705
    .line 706
    move-result-object v1

    .line 707
    invoke-virtual {v1}, Lcom/google/android/exoplayer2/k$b;->G()Lcom/google/android/exoplayer2/k;

    .line 708
    .line 709
    .line 710
    move-result-object v1

    .line 711
    iput-object v1, v6, Ll/g31$e;->b:Lcom/google/android/exoplayer2/k;

    .line 712
    .line 713
    :goto_f
    move/from16 v21, v8

    .line 714
    .line 715
    const/4 v8, -0x1

    .line 716
    goto :goto_13

    .line 717
    :goto_10
    if-ne v8, v1, :cond_2c

    .line 718
    .line 719
    move v1, v13

    .line 720
    :goto_11
    const/4 v8, -0x1

    .line 721
    goto :goto_12

    .line 722
    :cond_2c
    invoke-static {v0, v1, v13, v11}, Ll/g31;->d(Ll/ig60;III)I

    .line 723
    .line 724
    .line 725
    move-result v1

    .line 726
    goto :goto_11

    .line 727
    :goto_12
    if-eq v1, v8, :cond_2e

    .line 728
    .line 729
    invoke-static {v0, v1}, Ll/g31;->j(Ll/ig60;I)Ll/g31$b;

    .line 730
    .line 731
    .line 732
    move-result-object v18

    .line 733
    invoke-static/range {v18 .. v18}, Ll/g31$b;->a(Ll/g31$b;)Ljava/lang/String;

    .line 734
    .line 735
    .line 736
    move-result-object v12

    .line 737
    invoke-static/range {v18 .. v18}, Ll/g31$b;->b(Ll/g31$b;)[B

    .line 738
    .line 739
    .line 740
    move-result-object v1

    .line 741
    if-eqz v1, :cond_2e

    .line 742
    .line 743
    const-string v2, "audio/mp4a-latm"

    .line 744
    .line 745
    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 746
    .line 747
    .line 748
    move-result v2

    .line 749
    if-eqz v2, :cond_2d

    .line 750
    .line 751
    invoke-static {v1}, Ll/z1;->f([B)Ll/z1$b;

    .line 752
    .line 753
    .line 754
    move-result-object v2

    .line 755
    iget v7, v2, Ll/z1$b;->a:I

    .line 756
    .line 757
    iget v9, v2, Ll/z1$b;->b:I

    .line 758
    .line 759
    iget-object v2, v2, Ll/z1$b;->c:Ljava/lang/String;

    .line 760
    .line 761
    move-object/from16 v19, v2

    .line 762
    .line 763
    :cond_2d
    invoke-static {v1}, Lcom/google/common/collect/ImmutableList;->of(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList;

    .line 764
    .line 765
    .line 766
    move-result-object v20

    .line 767
    :cond_2e
    :goto_13
    add-int/2addr v13, v11

    .line 768
    move/from16 v1, p2

    .line 769
    .line 770
    move/from16 v2, p3

    .line 771
    .line 772
    const v14, 0x616c6163

    .line 773
    .line 774
    .line 775
    goto/16 :goto_9

    .line 776
    .line 777
    :cond_2f
    iget-object v0, v6, Ll/g31$e;->b:Lcom/google/android/exoplayer2/k;

    .line 778
    .line 779
    if-nez v0, :cond_31

    .line 780
    .line 781
    if-eqz v12, :cond_31

    .line 782
    .line 783
    new-instance v0, Lcom/google/android/exoplayer2/k$b;

    .line 784
    .line 785
    invoke-direct {v0}, Lcom/google/android/exoplayer2/k$b;-><init>()V

    .line 786
    .line 787
    .line 788
    invoke-virtual {v0, v3}, Lcom/google/android/exoplayer2/k$b;->T(I)Lcom/google/android/exoplayer2/k$b;

    .line 789
    .line 790
    .line 791
    move-result-object v0

    .line 792
    invoke-virtual {v0, v12}, Lcom/google/android/exoplayer2/k$b;->g0(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 793
    .line 794
    .line 795
    move-result-object v0

    .line 796
    move-object/from16 v1, v19

    .line 797
    .line 798
    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/k$b;->K(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 799
    .line 800
    .line 801
    move-result-object v0

    .line 802
    invoke-virtual {v0, v9}, Lcom/google/android/exoplayer2/k$b;->J(I)Lcom/google/android/exoplayer2/k$b;

    .line 803
    .line 804
    .line 805
    move-result-object v0

    .line 806
    invoke-virtual {v0, v7}, Lcom/google/android/exoplayer2/k$b;->h0(I)Lcom/google/android/exoplayer2/k$b;

    .line 807
    .line 808
    .line 809
    move-result-object v0

    .line 810
    invoke-virtual {v0, v10}, Lcom/google/android/exoplayer2/k$b;->a0(I)Lcom/google/android/exoplayer2/k$b;

    .line 811
    .line 812
    .line 813
    move-result-object v0

    .line 814
    move-object/from16 v1, v20

    .line 815
    .line 816
    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/k$b;->V(Ljava/util/List;)Lcom/google/android/exoplayer2/k$b;

    .line 817
    .line 818
    .line 819
    move-result-object v0

    .line 820
    invoke-virtual {v0, v5}, Lcom/google/android/exoplayer2/k$b;->O(Lcom/google/android/exoplayer2/drm/DrmInitData;)Lcom/google/android/exoplayer2/k$b;

    .line 821
    .line 822
    .line 823
    move-result-object v0

    .line 824
    invoke-virtual {v0, v4}, Lcom/google/android/exoplayer2/k$b;->X(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 825
    .line 826
    .line 827
    move-result-object v0

    .line 828
    if-eqz v18, :cond_30

    .line 829
    .line 830
    invoke-static/range {v18 .. v18}, Ll/g31$b;->d(Ll/g31$b;)J

    .line 831
    .line 832
    .line 833
    move-result-wide v1

    .line 834
    invoke-static {v1, v2}, Lcom/google/common/primitives/Ints;->m(J)I

    .line 835
    .line 836
    .line 837
    move-result v1

    .line 838
    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/k$b;->I(I)Lcom/google/android/exoplayer2/k$b;

    .line 839
    .line 840
    .line 841
    move-result-object v1

    .line 842
    invoke-static/range {v18 .. v18}, Ll/g31$b;->c(Ll/g31$b;)J

    .line 843
    .line 844
    .line 845
    move-result-wide v2

    .line 846
    invoke-static {v2, v3}, Lcom/google/common/primitives/Ints;->m(J)I

    .line 847
    .line 848
    .line 849
    move-result v2

    .line 850
    invoke-virtual {v1, v2}, Lcom/google/android/exoplayer2/k$b;->b0(I)Lcom/google/android/exoplayer2/k$b;

    .line 851
    .line 852
    .line 853
    :cond_30
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/k$b;->G()Lcom/google/android/exoplayer2/k;

    .line 854
    .line 855
    .line 856
    move-result-object v0

    .line 857
    iput-object v0, v6, Ll/g31$e;->b:Lcom/google/android/exoplayer2/k;

    .line 858
    .line 859
    :cond_31
    return-void
.end method

.method public static h(Ll/ig60;II)Landroid/util/Pair;
    .locals 11
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/ig60;",
            "II)",
            "Landroid/util/Pair<",
            "Ljava/lang/Integer;",
            "Ll/zej0;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ParserException;
        }
    .end annotation

    .line 1
    add-int/lit8 v0, p1, 0x8

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    const/4 v3, 0x0

    .line 6
    move v5, v1

    .line 7
    move v7, v2

    .line 8
    move-object v4, v3

    .line 9
    move-object v6, v4

    .line 10
    :goto_0
    sub-int v8, v0, p1

    .line 11
    .line 12
    if-ge v8, p2, :cond_3

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Ll/ig60;->U(I)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Ll/ig60;->q()I

    .line 18
    .line 19
    .line 20
    move-result v8

    .line 21
    invoke-virtual {p0}, Ll/ig60;->q()I

    .line 22
    .line 23
    .line 24
    move-result v9

    .line 25
    const v10, 0x66726d61

    .line 26
    .line 27
    .line 28
    if-ne v9, v10, :cond_0

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/ig60;->q()I

    .line 31
    .line 32
    .line 33
    move-result v6

    .line 34
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 35
    .line 36
    .line 37
    move-result-object v6

    .line 38
    goto :goto_1

    .line 39
    :cond_0
    const v10, 0x7363686d

    .line 40
    .line 41
    .line 42
    if-ne v9, v10, :cond_1

    .line 43
    .line 44
    const/4 v4, 0x4

    .line 45
    invoke-virtual {p0, v4}, Ll/ig60;->V(I)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0, v4}, Ll/ig60;->E(I)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v4

    .line 52
    goto :goto_1

    .line 53
    :cond_1
    const v10, 0x73636869

    .line 54
    .line 55
    .line 56
    if-ne v9, v10, :cond_2

    .line 57
    .line 58
    move v5, v0

    .line 59
    move v7, v8

    .line 60
    :cond_2
    :goto_1
    add-int/2addr v0, v8

    .line 61
    goto :goto_0

    .line 62
    :cond_3
    const-string p1, "cenc"

    .line 63
    .line 64
    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    if-nez p1, :cond_5

    .line 69
    .line 70
    const-string p1, "cbc1"

    .line 71
    .line 72
    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    if-nez p1, :cond_5

    .line 77
    .line 78
    const-string p1, "cens"

    .line 79
    .line 80
    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    move-result p1

    .line 84
    if-nez p1, :cond_5

    .line 85
    .line 86
    const-string p1, "cbcs"

    .line 87
    .line 88
    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    move-result p1

    .line 92
    if-eqz p1, :cond_4

    .line 93
    .line 94
    goto :goto_2

    .line 95
    :cond_4
    return-object v3

    .line 96
    :cond_5
    :goto_2
    const/4 p1, 0x1

    .line 97
    if-eqz v6, :cond_6

    .line 98
    .line 99
    move p2, p1

    .line 100
    goto :goto_3

    .line 101
    :cond_6
    move p2, v2

    .line 102
    :goto_3
    const-string v0, "frma atom is mandatory"

    .line 103
    .line 104
    invoke-static {p2, v0}, Ll/csf;->a(ZLjava/lang/String;)V

    .line 105
    .line 106
    .line 107
    if-eq v5, v1, :cond_7

    .line 108
    .line 109
    move p2, p1

    .line 110
    goto :goto_4

    .line 111
    :cond_7
    move p2, v2

    .line 112
    :goto_4
    const-string v0, "schi atom is mandatory"

    .line 113
    .line 114
    invoke-static {p2, v0}, Ll/csf;->a(ZLjava/lang/String;)V

    .line 115
    .line 116
    .line 117
    invoke-static {p0, v5, v7, v4}, Ll/g31;->u(Ll/ig60;IILjava/lang/String;)Ll/zej0;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    if-eqz p0, :cond_8

    .line 122
    .line 123
    move v2, p1

    .line 124
    :cond_8
    const-string p1, "tenc atom is mandatory"

    .line 125
    .line 126
    invoke-static {v2, p1}, Ll/csf;->a(ZLjava/lang/String;)V

    .line 127
    .line 128
    .line 129
    invoke-static {p0}, Ll/bmk0;->j(Ljava/lang/Object;)Ljava/lang/Object;

    .line 130
    .line 131
    .line 132
    move-result-object p0

    .line 133
    check-cast p0, Ll/zej0;

    .line 134
    .line 135
    invoke-static {v6, p0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 136
    .line 137
    .line 138
    move-result-object p0

    .line 139
    return-object p0
.end method

.method public static i(Ll/f31$a;)Landroid/util/Pair;
    .locals 9
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/f31$a;",
            ")",
            "Landroid/util/Pair<",
            "[J[J>;"
        }
    .end annotation

    .line 1
    const v0, 0x656c7374

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, v0}, Ll/f31$a;->g(I)Ll/f31$b;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    const/4 v0, 0x0

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    return-object v0

    .line 12
    :cond_0
    iget-object p0, p0, Ll/f31$b;->b:Ll/ig60;

    .line 13
    .line 14
    const/16 v1, 0x8

    .line 15
    .line 16
    invoke-virtual {p0, v1}, Ll/ig60;->U(I)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Ll/ig60;->q()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    invoke-static {v1}, Ll/f31;->c(I)I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    invoke-virtual {p0}, Ll/ig60;->L()I

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    new-array v3, v2, [J

    .line 32
    .line 33
    new-array v4, v2, [J

    .line 34
    .line 35
    const/4 v5, 0x0

    .line 36
    :goto_0
    if-ge v5, v2, :cond_4

    .line 37
    .line 38
    const/4 v6, 0x1

    .line 39
    if-ne v1, v6, :cond_1

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/ig60;->M()J

    .line 42
    .line 43
    .line 44
    move-result-wide v7

    .line 45
    goto :goto_1

    .line 46
    :cond_1
    invoke-virtual {p0}, Ll/ig60;->J()J

    .line 47
    .line 48
    .line 49
    move-result-wide v7

    .line 50
    :goto_1
    aput-wide v7, v3, v5

    .line 51
    .line 52
    if-ne v1, v6, :cond_2

    .line 53
    .line 54
    invoke-virtual {p0}, Ll/ig60;->A()J

    .line 55
    .line 56
    .line 57
    move-result-wide v7

    .line 58
    goto :goto_2

    .line 59
    :cond_2
    invoke-virtual {p0}, Ll/ig60;->q()I

    .line 60
    .line 61
    .line 62
    move-result v7

    .line 63
    int-to-long v7, v7

    .line 64
    :goto_2
    aput-wide v7, v4, v5

    .line 65
    .line 66
    invoke-virtual {p0}, Ll/ig60;->D()S

    .line 67
    .line 68
    .line 69
    move-result v7

    .line 70
    if-ne v7, v6, :cond_3

    .line 71
    .line 72
    const/4 v6, 0x2

    .line 73
    invoke-virtual {p0, v6}, Ll/ig60;->V(I)V

    .line 74
    .line 75
    .line 76
    add-int/lit8 v5, v5, 0x1

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_3
    const-string p0, "Unsupported media rate."

    .line 80
    .line 81
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    return-object v0

    .line 85
    :cond_4
    invoke-static {v3, v4}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    return-object p0
.end method

.method public static j(Ll/ig60;I)Ll/g31$b;
    .locals 10

    .line 1
    add-int/lit8 p1, p1, 0xc

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ig60;->U(I)V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x1

    .line 7
    invoke-virtual {p0, p1}, Ll/ig60;->V(I)V

    .line 8
    .line 9
    .line 10
    invoke-static {p0}, Ll/g31;->k(Ll/ig60;)I

    .line 11
    .line 12
    .line 13
    const/4 v0, 0x2

    .line 14
    invoke-virtual {p0, v0}, Ll/ig60;->V(I)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Ll/ig60;->H()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    and-int/lit16 v2, v1, 0x80

    .line 22
    .line 23
    if-eqz v2, :cond_0

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Ll/ig60;->V(I)V

    .line 26
    .line 27
    .line 28
    :cond_0
    and-int/lit8 v2, v1, 0x40

    .line 29
    .line 30
    if-eqz v2, :cond_1

    .line 31
    .line 32
    invoke-virtual {p0}, Ll/ig60;->H()I

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    invoke-virtual {p0, v2}, Ll/ig60;->V(I)V

    .line 37
    .line 38
    .line 39
    :cond_1
    and-int/lit8 v1, v1, 0x20

    .line 40
    .line 41
    if-eqz v1, :cond_2

    .line 42
    .line 43
    invoke-virtual {p0, v0}, Ll/ig60;->V(I)V

    .line 44
    .line 45
    .line 46
    :cond_2
    invoke-virtual {p0, p1}, Ll/ig60;->V(I)V

    .line 47
    .line 48
    .line 49
    invoke-static {p0}, Ll/g31;->k(Ll/ig60;)I

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0}, Ll/ig60;->H()I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    invoke-static {v0}, Ll/kb00;->h(I)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    const-string v0, "audio/mpeg"

    .line 61
    .line 62
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-nez v0, :cond_6

    .line 67
    .line 68
    const-string v0, "audio/vnd.dts"

    .line 69
    .line 70
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    if-nez v0, :cond_6

    .line 75
    .line 76
    const-string v0, "audio/vnd.dts.hd"

    .line 77
    .line 78
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    if-eqz v0, :cond_3

    .line 83
    .line 84
    goto :goto_2

    .line 85
    :cond_3
    const/4 v0, 0x4

    .line 86
    invoke-virtual {p0, v0}, Ll/ig60;->V(I)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {p0}, Ll/ig60;->J()J

    .line 90
    .line 91
    .line 92
    move-result-wide v0

    .line 93
    invoke-virtual {p0}, Ll/ig60;->J()J

    .line 94
    .line 95
    .line 96
    move-result-wide v3

    .line 97
    invoke-virtual {p0, p1}, Ll/ig60;->V(I)V

    .line 98
    .line 99
    .line 100
    invoke-static {p0}, Ll/g31;->k(Ll/ig60;)I

    .line 101
    .line 102
    .line 103
    move-result p1

    .line 104
    move-wide v4, v3

    .line 105
    new-array v3, p1, [B

    .line 106
    .line 107
    const/4 v6, 0x0

    .line 108
    invoke-virtual {p0, v3, v6, p1}, Ll/ig60;->l([BII)V

    .line 109
    .line 110
    .line 111
    move-wide p0, v0

    .line 112
    new-instance v1, Ll/g31$b;

    .line 113
    .line 114
    const-wide/16 v6, 0x0

    .line 115
    .line 116
    cmp-long v0, v4, v6

    .line 117
    .line 118
    const-wide/16 v8, -0x1

    .line 119
    .line 120
    if-lez v0, :cond_4

    .line 121
    .line 122
    goto :goto_0

    .line 123
    :cond_4
    move-wide v4, v8

    .line 124
    :goto_0
    cmp-long v0, p0, v6

    .line 125
    .line 126
    if-lez v0, :cond_5

    .line 127
    .line 128
    move-wide v6, p0

    .line 129
    goto :goto_1

    .line 130
    :cond_5
    move-wide v6, v8

    .line 131
    :goto_1
    invoke-direct/range {v1 .. v7}, Ll/g31$b;-><init>(Ljava/lang/String;[BJJ)V

    .line 132
    .line 133
    .line 134
    return-object v1

    .line 135
    :cond_6
    :goto_2
    new-instance v1, Ll/g31$b;

    .line 136
    .line 137
    const-wide/16 v4, -0x1

    .line 138
    .line 139
    const-wide/16 v6, -0x1

    .line 140
    .line 141
    const/4 v3, 0x0

    .line 142
    invoke-direct/range {v1 .. v7}, Ll/g31$b;-><init>(Ljava/lang/String;[BJJ)V

    .line 143
    .line 144
    .line 145
    return-object v1
.end method

.method public static k(Ll/ig60;)I
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/ig60;->H()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    and-int/lit8 v1, v0, 0x7f

    .line 6
    .line 7
    :goto_0
    const/16 v2, 0x80

    .line 8
    .line 9
    and-int/2addr v0, v2

    .line 10
    if-ne v0, v2, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/ig60;->H()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    shl-int/lit8 v1, v1, 0x7

    .line 17
    .line 18
    and-int/lit8 v2, v0, 0x7f

    .line 19
    .line 20
    or-int/2addr v1, v2

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    return v1
.end method

.method public static l(Ll/ig60;)I
    .locals 1

    .line 1
    const/16 v0, 0x10

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/ig60;->U(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/ig60;->q()I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method public static m(Ll/ig60;I)Lcom/google/android/exoplayer2/metadata/Metadata;
    .locals 2
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/ig60;->V(I)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    :cond_0
    :goto_0
    invoke-virtual {p0}, Ll/ig60;->f()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-ge v1, p1, :cond_1

    .line 16
    .line 17
    invoke-static {p0}, Ll/ka00;->c(Ll/ig60;)Lcom/google/android/exoplayer2/metadata/Metadata$Entry;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-eqz p0, :cond_2

    .line 32
    .line 33
    const/4 p0, 0x0

    .line 34
    return-object p0

    .line 35
    :cond_2
    new-instance p0, Lcom/google/android/exoplayer2/metadata/Metadata;

    .line 36
    .line 37
    invoke-direct {p0, v0}, Lcom/google/android/exoplayer2/metadata/Metadata;-><init>(Ljava/util/List;)V

    .line 38
    .line 39
    .line 40
    return-object p0
.end method

.method public static n(Ll/ig60;)Landroid/util/Pair;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/ig60;",
            ")",
            "Landroid/util/Pair<",
            "Ljava/lang/Long;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/ig60;->U(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/ig60;->q()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    invoke-static {v1}, Ll/f31;->c(I)I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-nez v1, :cond_0

    .line 15
    .line 16
    move v2, v0

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/16 v2, 0x10

    .line 19
    .line 20
    :goto_0
    invoke-virtual {p0, v2}, Ll/ig60;->V(I)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Ll/ig60;->J()J

    .line 24
    .line 25
    .line 26
    move-result-wide v2

    .line 27
    if-nez v1, :cond_1

    .line 28
    .line 29
    const/4 v0, 0x4

    .line 30
    :cond_1
    invoke-virtual {p0, v0}, Ll/ig60;->V(I)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Ll/ig60;->N()I

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    new-instance v0, Ljava/lang/StringBuilder;

    .line 38
    .line 39
    const-string v1, ""

    .line 40
    .line 41
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    shr-int/lit8 v1, p0, 0xa

    .line 45
    .line 46
    and-int/lit8 v1, v1, 0x1f

    .line 47
    .line 48
    add-int/lit8 v1, v1, 0x60

    .line 49
    .line 50
    int-to-char v1, v1

    .line 51
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    shr-int/lit8 v1, p0, 0x5

    .line 55
    .line 56
    and-int/lit8 v1, v1, 0x1f

    .line 57
    .line 58
    add-int/lit8 v1, v1, 0x60

    .line 59
    .line 60
    int-to-char v1, v1

    .line 61
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    and-int/lit8 p0, p0, 0x1f

    .line 65
    .line 66
    add-int/lit8 p0, p0, 0x60

    .line 67
    .line 68
    int-to-char p0, p0

    .line 69
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-static {v0, p0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    return-object p0
.end method

.method public static o(Ll/f31$a;)Lcom/google/android/exoplayer2/metadata/Metadata;
    .locals 10
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const v0, 0x68646c72    # 4.3148E24f

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, v0}, Ll/f31$a;->g(I)Ll/f31$b;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const v1, 0x6b657973

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v1}, Ll/f31$a;->g(I)Ll/f31$b;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    const v2, 0x696c7374

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, v2}, Ll/f31$a;->g(I)Ll/f31$b;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const/4 v2, 0x0

    .line 23
    if-eqz v0, :cond_6

    .line 24
    .line 25
    if-eqz v1, :cond_6

    .line 26
    .line 27
    if-eqz p0, :cond_6

    .line 28
    .line 29
    iget-object v0, v0, Ll/f31$b;->b:Ll/ig60;

    .line 30
    .line 31
    invoke-static {v0}, Ll/g31;->l(Ll/ig60;)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    const v3, 0x6d647461

    .line 36
    .line 37
    .line 38
    if-eq v0, v3, :cond_0

    .line 39
    .line 40
    goto/16 :goto_3

    .line 41
    .line 42
    :cond_0
    iget-object v0, v1, Ll/f31$b;->b:Ll/ig60;

    .line 43
    .line 44
    const/16 v1, 0xc

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Ll/ig60;->U(I)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0}, Ll/ig60;->q()I

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    new-array v3, v1, [Ljava/lang/String;

    .line 54
    .line 55
    const/4 v4, 0x0

    .line 56
    :goto_0
    const/16 v5, 0x8

    .line 57
    .line 58
    if-ge v4, v1, :cond_1

    .line 59
    .line 60
    invoke-virtual {v0}, Ll/ig60;->q()I

    .line 61
    .line 62
    .line 63
    move-result v6

    .line 64
    const/4 v7, 0x4

    .line 65
    invoke-virtual {v0, v7}, Ll/ig60;->V(I)V

    .line 66
    .line 67
    .line 68
    sub-int/2addr v6, v5

    .line 69
    invoke-virtual {v0, v6}, Ll/ig60;->E(I)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v5

    .line 73
    aput-object v5, v3, v4

    .line 74
    .line 75
    add-int/lit8 v4, v4, 0x1

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_1
    iget-object p0, p0, Ll/f31$b;->b:Ll/ig60;

    .line 79
    .line 80
    invoke-virtual {p0, v5}, Ll/ig60;->U(I)V

    .line 81
    .line 82
    .line 83
    new-instance v0, Ljava/util/ArrayList;

    .line 84
    .line 85
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 86
    .line 87
    .line 88
    :goto_1
    invoke-virtual {p0}, Ll/ig60;->a()I

    .line 89
    .line 90
    .line 91
    move-result v4

    .line 92
    if-le v4, v5, :cond_4

    .line 93
    .line 94
    invoke-virtual {p0}, Ll/ig60;->f()I

    .line 95
    .line 96
    .line 97
    move-result v4

    .line 98
    invoke-virtual {p0}, Ll/ig60;->q()I

    .line 99
    .line 100
    .line 101
    move-result v6

    .line 102
    invoke-virtual {p0}, Ll/ig60;->q()I

    .line 103
    .line 104
    .line 105
    move-result v7

    .line 106
    add-int/lit8 v7, v7, -0x1

    .line 107
    .line 108
    if-ltz v7, :cond_2

    .line 109
    .line 110
    if-ge v7, v1, :cond_2

    .line 111
    .line 112
    aget-object v7, v3, v7

    .line 113
    .line 114
    add-int v8, v4, v6

    .line 115
    .line 116
    invoke-static {p0, v8, v7}, Ll/ka00;->f(Ll/ig60;ILjava/lang/String;)Lcom/google/android/exoplayer2/metadata/mp4/MdtaMetadataEntry;

    .line 117
    .line 118
    .line 119
    move-result-object v7

    .line 120
    if-eqz v7, :cond_3

    .line 121
    .line 122
    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    goto :goto_2

    .line 126
    :cond_2
    new-instance v8, Ljava/lang/StringBuilder;

    .line 127
    .line 128
    const-string v9, "Skipped metadata with unknown key index: "

    .line 129
    .line 130
    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v7

    .line 140
    const-string v8, "AtomParsers"

    .line 141
    .line 142
    invoke-static {v8, v7}, Ll/kyv;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 143
    .line 144
    .line 145
    :cond_3
    :goto_2
    add-int/2addr v4, v6

    .line 146
    invoke-virtual {p0, v4}, Ll/ig60;->U(I)V

    .line 147
    .line 148
    .line 149
    goto :goto_1

    .line 150
    :cond_4
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 151
    .line 152
    .line 153
    move-result p0

    .line 154
    if-eqz p0, :cond_5

    .line 155
    .line 156
    return-object v2

    .line 157
    :cond_5
    new-instance p0, Lcom/google/android/exoplayer2/metadata/Metadata;

    .line 158
    .line 159
    invoke-direct {p0, v0}, Lcom/google/android/exoplayer2/metadata/Metadata;-><init>(Ljava/util/List;)V

    .line 160
    .line 161
    .line 162
    return-object p0

    .line 163
    :cond_6
    :goto_3
    return-object v2
.end method

.method public static p(Ll/ig60;IIILl/g31$e;)V
    .locals 0

    .line 1
    add-int/lit8 p2, p2, 0x10

    .line 2
    .line 3
    invoke-virtual {p0, p2}, Ll/ig60;->U(I)V

    .line 4
    .line 5
    .line 6
    const p2, 0x6d657474

    .line 7
    .line 8
    .line 9
    if-ne p1, p2, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/ig60;->B()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ll/ig60;->B()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    if-eqz p0, :cond_0

    .line 19
    .line 20
    new-instance p1, Lcom/google/android/exoplayer2/k$b;

    .line 21
    .line 22
    invoke-direct {p1}, Lcom/google/android/exoplayer2/k$b;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1, p3}, Lcom/google/android/exoplayer2/k$b;->T(I)Lcom/google/android/exoplayer2/k$b;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p1, p0}, Lcom/google/android/exoplayer2/k$b;->g0(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/k$b;->G()Lcom/google/android/exoplayer2/k;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    iput-object p0, p4, Ll/g31$e;->b:Lcom/google/android/exoplayer2/k;

    .line 38
    .line 39
    :cond_0
    return-void
.end method

.method public static q(Ll/ig60;)Ll/g31$c;
    .locals 6

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/ig60;->U(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/ig60;->q()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    invoke-static {v1}, Ll/f31;->c(I)I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-nez v1, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/ig60;->J()J

    .line 17
    .line 18
    .line 19
    move-result-wide v0

    .line 20
    const/4 v2, 0x4

    .line 21
    invoke-virtual {p0, v2}, Ll/ig60;->V(I)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    invoke-virtual {p0}, Ll/ig60;->A()J

    .line 26
    .line 27
    .line 28
    move-result-wide v1

    .line 29
    invoke-virtual {p0, v0}, Ll/ig60;->V(I)V

    .line 30
    .line 31
    .line 32
    move-wide v0, v1

    .line 33
    :goto_0
    const-wide/32 v2, 0x7c25b080

    .line 34
    .line 35
    .line 36
    sub-long/2addr v0, v2

    .line 37
    const-wide/16 v2, 0x3e8

    .line 38
    .line 39
    mul-long/2addr v0, v2

    .line 40
    invoke-virtual {p0}, Ll/ig60;->J()J

    .line 41
    .line 42
    .line 43
    move-result-wide v2

    .line 44
    new-instance p0, Ll/g31$c;

    .line 45
    .line 46
    new-instance v4, Lcom/google/android/exoplayer2/metadata/Metadata;

    .line 47
    .line 48
    new-instance v5, Lcom/google/android/exoplayer2/container/CreationTime;

    .line 49
    .line 50
    invoke-direct {v5, v0, v1}, Lcom/google/android/exoplayer2/container/CreationTime;-><init>(J)V

    .line 51
    .line 52
    .line 53
    const/4 v0, 0x1

    .line 54
    new-array v0, v0, [Lcom/google/android/exoplayer2/metadata/Metadata$Entry;

    .line 55
    .line 56
    const/4 v1, 0x0

    .line 57
    aput-object v5, v0, v1

    .line 58
    .line 59
    invoke-direct {v4, v0}, Lcom/google/android/exoplayer2/metadata/Metadata;-><init>([Lcom/google/android/exoplayer2/metadata/Metadata$Entry;)V

    .line 60
    .line 61
    .line 62
    invoke-direct {p0, v4, v2, v3}, Ll/g31$c;-><init>(Lcom/google/android/exoplayer2/metadata/Metadata;J)V

    .line 63
    .line 64
    .line 65
    return-object p0
.end method

.method public static r(Ll/ig60;I)F
    .locals 0

    .line 1
    add-int/lit8 p1, p1, 0x8

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ig60;->U(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/ig60;->L()I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    invoke-virtual {p0}, Ll/ig60;->L()I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    int-to-float p1, p1

    .line 15
    int-to-float p0, p0

    .line 16
    div-float/2addr p1, p0

    .line 17
    return p1
.end method

.method public static s(Ll/ig60;II)[B
    .locals 4
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    add-int/lit8 v0, p1, 0x8

    .line 2
    .line 3
    :goto_0
    sub-int v1, v0, p1

    .line 4
    .line 5
    if-ge v1, p2, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Ll/ig60;->U(I)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/ig60;->q()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    invoke-virtual {p0}, Ll/ig60;->q()I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    const v3, 0x70726f6a

    .line 19
    .line 20
    .line 21
    if-ne v2, v3, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/ig60;->e()[B

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    add-int/2addr v1, v0

    .line 28
    invoke-static {p0, v0, v1}, Ljava/util/Arrays;->copyOfRange([BII)[B

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0

    .line 33
    :cond_0
    add-int/2addr v0, v1

    .line 34
    goto :goto_0

    .line 35
    :cond_1
    const/4 p0, 0x0

    .line 36
    return-object p0
.end method

.method public static t(Ll/ig60;II)Landroid/util/Pair;
    .locals 4
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/ig60;",
            "II)",
            "Landroid/util/Pair<",
            "Ljava/lang/Integer;",
            "Ll/zej0;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ParserException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/ig60;->f()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    :goto_0
    sub-int v1, v0, p1

    .line 6
    .line 7
    if-ge v1, p2, :cond_2

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/ig60;->U(I)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Ll/ig60;->q()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-lez v1, :cond_0

    .line 17
    .line 18
    const/4 v2, 0x1

    .line 19
    goto :goto_1

    .line 20
    :cond_0
    const/4 v2, 0x0

    .line 21
    :goto_1
    const-string v3, "childAtomSize must be positive"

    .line 22
    .line 23
    invoke-static {v2, v3}, Ll/csf;->a(ZLjava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Ll/ig60;->q()I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    const v3, 0x73696e66

    .line 31
    .line 32
    .line 33
    if-ne v2, v3, :cond_1

    .line 34
    .line 35
    invoke-static {p0, v0, v1}, Ll/g31;->h(Ll/ig60;II)Landroid/util/Pair;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    if-eqz v2, :cond_1

    .line 40
    .line 41
    return-object v2

    .line 42
    :cond_1
    add-int/2addr v0, v1

    .line 43
    goto :goto_0

    .line 44
    :cond_2
    const/4 p0, 0x0

    .line 45
    return-object p0
.end method

.method public static u(Ll/ig60;IILjava/lang/String;)Ll/zej0;
    .locals 11
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    add-int/lit8 v0, p1, 0x8

    .line 2
    .line 3
    :goto_0
    sub-int v1, v0, p1

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-ge v1, p2, :cond_4

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/ig60;->U(I)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/ig60;->q()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-virtual {p0}, Ll/ig60;->q()I

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    const v4, 0x74656e63

    .line 20
    .line 21
    .line 22
    if-ne v3, v4, :cond_3

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/ig60;->q()I

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    invoke-static {p1}, Ll/f31;->c(I)I

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    const/4 p2, 0x1

    .line 33
    invoke-virtual {p0, p2}, Ll/ig60;->V(I)V

    .line 34
    .line 35
    .line 36
    const/4 v0, 0x0

    .line 37
    if-nez p1, :cond_0

    .line 38
    .line 39
    invoke-virtual {p0, p2}, Ll/ig60;->V(I)V

    .line 40
    .line 41
    .line 42
    move v8, v0

    .line 43
    move v9, v8

    .line 44
    goto :goto_1

    .line 45
    :cond_0
    invoke-virtual {p0}, Ll/ig60;->H()I

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    and-int/lit16 v1, p1, 0xf0

    .line 50
    .line 51
    shr-int/lit8 v1, v1, 0x4

    .line 52
    .line 53
    and-int/lit8 p1, p1, 0xf

    .line 54
    .line 55
    move v9, p1

    .line 56
    move v8, v1

    .line 57
    :goto_1
    invoke-virtual {p0}, Ll/ig60;->H()I

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    if-ne p1, p2, :cond_1

    .line 62
    .line 63
    move v4, p2

    .line 64
    goto :goto_2

    .line 65
    :cond_1
    move v4, v0

    .line 66
    :goto_2
    invoke-virtual {p0}, Ll/ig60;->H()I

    .line 67
    .line 68
    .line 69
    move-result v6

    .line 70
    const/16 p1, 0x10

    .line 71
    .line 72
    new-array v7, p1, [B

    .line 73
    .line 74
    invoke-virtual {p0, v7, v0, p1}, Ll/ig60;->l([BII)V

    .line 75
    .line 76
    .line 77
    if-eqz v4, :cond_2

    .line 78
    .line 79
    if-nez v6, :cond_2

    .line 80
    .line 81
    invoke-virtual {p0}, Ll/ig60;->H()I

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    new-array v2, p1, [B

    .line 86
    .line 87
    invoke-virtual {p0, v2, v0, p1}, Ll/ig60;->l([BII)V

    .line 88
    .line 89
    .line 90
    :cond_2
    move-object v10, v2

    .line 91
    new-instance v3, Ll/zej0;

    .line 92
    .line 93
    move-object v5, p3

    .line 94
    invoke-direct/range {v3 .. v10}, Ll/zej0;-><init>(ZLjava/lang/String;I[BII[B)V

    .line 95
    .line 96
    .line 97
    return-object v3

    .line 98
    :cond_3
    move-object v5, p3

    .line 99
    add-int/2addr v0, v1

    .line 100
    goto :goto_0

    .line 101
    :cond_4
    return-object v2
.end method

.method public static v(Ll/ig60;I)Lcom/google/android/exoplayer2/metadata/Metadata;
    .locals 6
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/16 v0, 0xc

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/ig60;->V(I)V

    .line 4
    .line 5
    .line 6
    :goto_0
    invoke-virtual {p0}, Ll/ig60;->f()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    const/4 v2, 0x0

    .line 11
    if-ge v1, p1, :cond_4

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/ig60;->f()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    invoke-virtual {p0}, Ll/ig60;->q()I

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    invoke-virtual {p0}, Ll/ig60;->q()I

    .line 22
    .line 23
    .line 24
    move-result v4

    .line 25
    const v5, 0x73617574

    .line 26
    .line 27
    .line 28
    if-ne v4, v5, :cond_3

    .line 29
    .line 30
    const/16 p1, 0xe

    .line 31
    .line 32
    if-ge v3, p1, :cond_0

    .line 33
    .line 34
    return-object v2

    .line 35
    :cond_0
    const/4 p1, 0x5

    .line 36
    invoke-virtual {p0, p1}, Ll/ig60;->V(I)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Ll/ig60;->H()I

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    if-eq p1, v0, :cond_1

    .line 44
    .line 45
    const/16 v1, 0xd

    .line 46
    .line 47
    if-eq p1, v1, :cond_1

    .line 48
    .line 49
    return-object v2

    .line 50
    :cond_1
    if-ne p1, v0, :cond_2

    .line 51
    .line 52
    const/high16 p1, 0x43700000    # 240.0f

    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_2
    const/high16 p1, 0x42f00000    # 120.0f

    .line 56
    .line 57
    :goto_1
    const/4 v0, 0x1

    .line 58
    invoke-virtual {p0, v0}, Ll/ig60;->V(I)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0}, Ll/ig60;->H()I

    .line 62
    .line 63
    .line 64
    move-result p0

    .line 65
    new-instance v1, Lcom/google/android/exoplayer2/metadata/Metadata;

    .line 66
    .line 67
    new-instance v2, Lcom/google/android/exoplayer2/metadata/mp4/SmtaMetadataEntry;

    .line 68
    .line 69
    invoke-direct {v2, p1, p0}, Lcom/google/android/exoplayer2/metadata/mp4/SmtaMetadataEntry;-><init>(FI)V

    .line 70
    .line 71
    .line 72
    new-array p0, v0, [Lcom/google/android/exoplayer2/metadata/Metadata$Entry;

    .line 73
    .line 74
    const/4 p1, 0x0

    .line 75
    aput-object v2, p0, p1

    .line 76
    .line 77
    invoke-direct {v1, p0}, Lcom/google/android/exoplayer2/metadata/Metadata;-><init>([Lcom/google/android/exoplayer2/metadata/Metadata$Entry;)V

    .line 78
    .line 79
    .line 80
    return-object v1

    .line 81
    :cond_3
    add-int/2addr v1, v3

    .line 82
    invoke-virtual {p0, v1}, Ll/ig60;->U(I)V

    .line 83
    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_4
    return-object v2
.end method

.method public static w(Ll/yej0;Ll/f31$a;Ll/ilj;)Ll/ufj0;
    .locals 36
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ParserException;
        }
    .end annotation

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v0, p1

    .line 4
    .line 5
    const v3, 0x7374737a

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v3}, Ll/f31$a;->g(I)Ll/f31$b;

    .line 9
    .line 10
    .line 11
    move-result-object v3

    .line 12
    if-eqz v3, :cond_0

    .line 13
    .line 14
    new-instance v5, Ll/g31$f;

    .line 15
    .line 16
    iget-object v6, v1, Ll/yej0;->f:Lcom/google/android/exoplayer2/k;

    .line 17
    .line 18
    invoke-direct {v5, v3, v6}, Ll/g31$f;-><init>(Ll/f31$b;Lcom/google/android/exoplayer2/k;)V

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const v3, 0x73747a32

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v3}, Ll/f31$a;->g(I)Ll/f31$b;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    if-eqz v3, :cond_2f

    .line 30
    .line 31
    new-instance v5, Ll/g31$g;

    .line 32
    .line 33
    invoke-direct {v5, v3}, Ll/g31$g;-><init>(Ll/f31$b;)V

    .line 34
    .line 35
    .line 36
    :goto_0
    invoke-interface {v5}, Ll/g31$d;->b()I

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    const/4 v6, 0x0

    .line 41
    if-nez v3, :cond_1

    .line 42
    .line 43
    new-instance v0, Ll/ufj0;

    .line 44
    .line 45
    new-array v2, v6, [J

    .line 46
    .line 47
    new-array v3, v6, [I

    .line 48
    .line 49
    new-array v5, v6, [J

    .line 50
    .line 51
    new-array v6, v6, [I

    .line 52
    .line 53
    const-wide/16 v7, 0x0

    .line 54
    .line 55
    const/4 v4, 0x0

    .line 56
    invoke-direct/range {v0 .. v8}, Ll/ufj0;-><init>(Ll/yej0;[J[II[J[IJ)V

    .line 57
    .line 58
    .line 59
    return-object v0

    .line 60
    :cond_1
    const v7, 0x7374636f

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0, v7}, Ll/f31$a;->g(I)Ll/f31$b;

    .line 64
    .line 65
    .line 66
    move-result-object v7

    .line 67
    const/4 v8, 0x1

    .line 68
    if-nez v7, :cond_2

    .line 69
    .line 70
    const v7, 0x636f3634

    .line 71
    .line 72
    .line 73
    invoke-virtual {v0, v7}, Ll/f31$a;->g(I)Ll/f31$b;

    .line 74
    .line 75
    .line 76
    move-result-object v7

    .line 77
    invoke-static {v7}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object v7

    .line 81
    check-cast v7, Ll/f31$b;

    .line 82
    .line 83
    move v9, v8

    .line 84
    goto :goto_1

    .line 85
    :cond_2
    move v9, v6

    .line 86
    :goto_1
    iget-object v7, v7, Ll/f31$b;->b:Ll/ig60;

    .line 87
    .line 88
    const v10, 0x73747363

    .line 89
    .line 90
    .line 91
    invoke-virtual {v0, v10}, Ll/f31$a;->g(I)Ll/f31$b;

    .line 92
    .line 93
    .line 94
    move-result-object v10

    .line 95
    invoke-static {v10}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object v10

    .line 99
    check-cast v10, Ll/f31$b;

    .line 100
    .line 101
    iget-object v10, v10, Ll/f31$b;->b:Ll/ig60;

    .line 102
    .line 103
    const v11, 0x73747473

    .line 104
    .line 105
    .line 106
    invoke-virtual {v0, v11}, Ll/f31$a;->g(I)Ll/f31$b;

    .line 107
    .line 108
    .line 109
    move-result-object v11

    .line 110
    invoke-static {v11}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    move-result-object v11

    .line 114
    check-cast v11, Ll/f31$b;

    .line 115
    .line 116
    iget-object v11, v11, Ll/f31$b;->b:Ll/ig60;

    .line 117
    .line 118
    const v12, 0x73747373

    .line 119
    .line 120
    .line 121
    invoke-virtual {v0, v12}, Ll/f31$a;->g(I)Ll/f31$b;

    .line 122
    .line 123
    .line 124
    move-result-object v12

    .line 125
    if-eqz v12, :cond_3

    .line 126
    .line 127
    iget-object v12, v12, Ll/f31$b;->b:Ll/ig60;

    .line 128
    .line 129
    goto :goto_2

    .line 130
    :cond_3
    const/4 v12, 0x0

    .line 131
    :goto_2
    const v13, 0x63747473

    .line 132
    .line 133
    .line 134
    invoke-virtual {v0, v13}, Ll/f31$a;->g(I)Ll/f31$b;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    if-eqz v0, :cond_4

    .line 139
    .line 140
    iget-object v0, v0, Ll/f31$b;->b:Ll/ig60;

    .line 141
    .line 142
    goto :goto_3

    .line 143
    :cond_4
    const/4 v0, 0x0

    .line 144
    :goto_3
    new-instance v13, Ll/g31$a;

    .line 145
    .line 146
    invoke-direct {v13, v10, v7, v9}, Ll/g31$a;-><init>(Ll/ig60;Ll/ig60;Z)V

    .line 147
    .line 148
    .line 149
    const/16 v7, 0xc

    .line 150
    .line 151
    invoke-virtual {v11, v7}, Ll/ig60;->U(I)V

    .line 152
    .line 153
    .line 154
    invoke-virtual {v11}, Ll/ig60;->L()I

    .line 155
    .line 156
    .line 157
    move-result v9

    .line 158
    sub-int/2addr v9, v8

    .line 159
    invoke-virtual {v11}, Ll/ig60;->L()I

    .line 160
    .line 161
    .line 162
    move-result v10

    .line 163
    invoke-virtual {v11}, Ll/ig60;->L()I

    .line 164
    .line 165
    .line 166
    move-result v14

    .line 167
    if-eqz v0, :cond_5

    .line 168
    .line 169
    invoke-virtual {v0, v7}, Ll/ig60;->U(I)V

    .line 170
    .line 171
    .line 172
    invoke-virtual {v0}, Ll/ig60;->L()I

    .line 173
    .line 174
    .line 175
    move-result v15

    .line 176
    goto :goto_4

    .line 177
    :cond_5
    move v15, v6

    .line 178
    :goto_4
    const/4 v4, -0x1

    .line 179
    if-eqz v12, :cond_7

    .line 180
    .line 181
    invoke-virtual {v12, v7}, Ll/ig60;->U(I)V

    .line 182
    .line 183
    .line 184
    invoke-virtual {v12}, Ll/ig60;->L()I

    .line 185
    .line 186
    .line 187
    move-result v7

    .line 188
    if-lez v7, :cond_6

    .line 189
    .line 190
    invoke-virtual {v12}, Ll/ig60;->L()I

    .line 191
    .line 192
    .line 193
    move-result v16

    .line 194
    add-int/lit8 v16, v16, -0x1

    .line 195
    .line 196
    move/from16 v17, v6

    .line 197
    .line 198
    goto :goto_5

    .line 199
    :cond_6
    move/from16 v16, v4

    .line 200
    .line 201
    move/from16 v17, v6

    .line 202
    .line 203
    const/4 v12, 0x0

    .line 204
    goto :goto_5

    .line 205
    :cond_7
    move/from16 v16, v4

    .line 206
    .line 207
    move v7, v6

    .line 208
    move/from16 v17, v7

    .line 209
    .line 210
    :goto_5
    invoke-interface {v5}, Ll/g31$d;->c()I

    .line 211
    .line 212
    .line 213
    move-result v6

    .line 214
    move/from16 v18, v8

    .line 215
    .line 216
    iget-object v8, v1, Ll/yej0;->f:Lcom/google/android/exoplayer2/k;

    .line 217
    .line 218
    iget-object v8, v8, Lcom/google/android/exoplayer2/k;->l:Ljava/lang/String;

    .line 219
    .line 220
    if-eq v6, v4, :cond_9

    .line 221
    .line 222
    const-string v4, "audio/raw"

    .line 223
    .line 224
    invoke-virtual {v4, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 225
    .line 226
    .line 227
    move-result v4

    .line 228
    if-nez v4, :cond_8

    .line 229
    .line 230
    const-string v4, "audio/g711-mlaw"

    .line 231
    .line 232
    invoke-virtual {v4, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 233
    .line 234
    .line 235
    move-result v4

    .line 236
    if-nez v4, :cond_8

    .line 237
    .line 238
    const-string v4, "audio/g711-alaw"

    .line 239
    .line 240
    invoke-virtual {v4, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 241
    .line 242
    .line 243
    move-result v4

    .line 244
    if-eqz v4, :cond_9

    .line 245
    .line 246
    :cond_8
    if-nez v9, :cond_9

    .line 247
    .line 248
    if-nez v15, :cond_9

    .line 249
    .line 250
    if-nez v7, :cond_9

    .line 251
    .line 252
    move/from16 p1, v18

    .line 253
    .line 254
    :goto_6
    move-object v8, v5

    .line 255
    goto :goto_7

    .line 256
    :cond_9
    move/from16 p1, v17

    .line 257
    .line 258
    goto :goto_6

    .line 259
    :goto_7
    if-eqz p1, :cond_b

    .line 260
    .line 261
    iget v0, v13, Ll/g31$a;->a:I

    .line 262
    .line 263
    new-array v7, v0, [J

    .line 264
    .line 265
    new-array v0, v0, [I

    .line 266
    .line 267
    :goto_8
    invoke-virtual {v13}, Ll/g31$a;->a()Z

    .line 268
    .line 269
    .line 270
    move-result v8

    .line 271
    if-eqz v8, :cond_a

    .line 272
    .line 273
    iget v8, v13, Ll/g31$a;->b:I

    .line 274
    .line 275
    iget-wide v9, v13, Ll/g31$a;->d:J

    .line 276
    .line 277
    aput-wide v9, v7, v8

    .line 278
    .line 279
    iget v9, v13, Ll/g31$a;->c:I

    .line 280
    .line 281
    aput v9, v0, v8

    .line 282
    .line 283
    goto :goto_8

    .line 284
    :cond_a
    int-to-long v8, v14

    .line 285
    invoke-static {v6, v7, v0, v8, v9}, Ll/mri;->a(I[J[IJ)Ll/mri$b;

    .line 286
    .line 287
    .line 288
    move-result-object v0

    .line 289
    iget-object v6, v0, Ll/mri$b;->a:[J

    .line 290
    .line 291
    iget-object v7, v0, Ll/mri$b;->b:[I

    .line 292
    .line 293
    iget v8, v0, Ll/mri$b;->c:I

    .line 294
    .line 295
    iget-object v9, v0, Ll/mri$b;->d:[J

    .line 296
    .line 297
    iget-object v10, v0, Ll/mri$b;->e:[I

    .line 298
    .line 299
    iget-wide v11, v0, Ll/mri$b;->f:J

    .line 300
    .line 301
    move-object v2, v6

    .line 302
    move v4, v8

    .line 303
    move-object v5, v9

    .line 304
    move-object v6, v10

    .line 305
    const-wide/16 v19, 0x0

    .line 306
    .line 307
    :goto_9
    move-wide v8, v11

    .line 308
    goto/16 :goto_14

    .line 309
    .line 310
    :cond_b
    new-array v6, v3, [J

    .line 311
    .line 312
    const-wide/16 v19, 0x0

    .line 313
    .line 314
    new-array v4, v3, [I

    .line 315
    .line 316
    new-array v5, v3, [J

    .line 317
    .line 318
    move-object/from16 p1, v0

    .line 319
    .line 320
    new-array v0, v3, [I

    .line 321
    .line 322
    move-object/from16 v21, v8

    .line 323
    .line 324
    move-object/from16 v22, v11

    .line 325
    .line 326
    move-object/from16 v24, v12

    .line 327
    .line 328
    move/from16 v8, v16

    .line 329
    .line 330
    move/from16 v11, v17

    .line 331
    .line 332
    move v12, v11

    .line 333
    move/from16 v23, v12

    .line 334
    .line 335
    move/from16 v29, v23

    .line 336
    .line 337
    move-wide/from16 v25, v19

    .line 338
    .line 339
    move-wide/from16 v27, v25

    .line 340
    .line 341
    move/from16 v16, v15

    .line 342
    .line 343
    move v15, v14

    .line 344
    move v14, v10

    .line 345
    move v10, v9

    .line 346
    move/from16 v9, v29

    .line 347
    .line 348
    :goto_a
    const-string v2, "AtomParsers"

    .line 349
    .line 350
    if-ge v11, v3, :cond_14

    .line 351
    .line 352
    move-wide/from16 v30, v27

    .line 353
    .line 354
    move/from16 v27, v23

    .line 355
    .line 356
    move/from16 v23, v18

    .line 357
    .line 358
    :goto_b
    if-nez v27, :cond_c

    .line 359
    .line 360
    invoke-virtual {v13}, Ll/g31$a;->a()Z

    .line 361
    .line 362
    .line 363
    move-result v23

    .line 364
    if-eqz v23, :cond_c

    .line 365
    .line 366
    move/from16 v28, v14

    .line 367
    .line 368
    move/from16 v32, v15

    .line 369
    .line 370
    iget-wide v14, v13, Ll/g31$a;->d:J

    .line 371
    .line 372
    move/from16 v33, v3

    .line 373
    .line 374
    iget v3, v13, Ll/g31$a;->c:I

    .line 375
    .line 376
    move/from16 v27, v3

    .line 377
    .line 378
    move-wide/from16 v30, v14

    .line 379
    .line 380
    move/from16 v14, v28

    .line 381
    .line 382
    move/from16 v15, v32

    .line 383
    .line 384
    move/from16 v3, v33

    .line 385
    .line 386
    goto :goto_b

    .line 387
    :cond_c
    move/from16 v33, v3

    .line 388
    .line 389
    move/from16 v28, v14

    .line 390
    .line 391
    move/from16 v32, v15

    .line 392
    .line 393
    if-nez v23, :cond_d

    .line 394
    .line 395
    const-string v3, "Unexpected end of chunk data"

    .line 396
    .line 397
    invoke-static {v2, v3}, Ll/kyv;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 398
    .line 399
    .line 400
    invoke-static {v6, v11}, Ljava/util/Arrays;->copyOf([JI)[J

    .line 401
    .line 402
    .line 403
    move-result-object v3

    .line 404
    invoke-static {v4, v11}, Ljava/util/Arrays;->copyOf([II)[I

    .line 405
    .line 406
    .line 407
    move-result-object v4

    .line 408
    invoke-static {v5, v11}, Ljava/util/Arrays;->copyOf([JI)[J

    .line 409
    .line 410
    .line 411
    move-result-object v5

    .line 412
    invoke-static {v0, v11}, Ljava/util/Arrays;->copyOf([II)[I

    .line 413
    .line 414
    .line 415
    move-result-object v0

    .line 416
    move-object v6, v3

    .line 417
    move v3, v11

    .line 418
    move/from16 v8, v27

    .line 419
    .line 420
    goto/16 :goto_10

    .line 421
    .line 422
    :cond_d
    if-eqz p1, :cond_f

    .line 423
    .line 424
    move/from16 v2, v29

    .line 425
    .line 426
    :goto_c
    if-nez v2, :cond_e

    .line 427
    .line 428
    if-lez v16, :cond_e

    .line 429
    .line 430
    invoke-virtual/range {p1 .. p1}, Ll/ig60;->L()I

    .line 431
    .line 432
    .line 433
    move-result v2

    .line 434
    invoke-virtual/range {p1 .. p1}, Ll/ig60;->q()I

    .line 435
    .line 436
    .line 437
    move-result v12

    .line 438
    add-int/lit8 v16, v16, -0x1

    .line 439
    .line 440
    goto :goto_c

    .line 441
    :cond_e
    add-int/lit8 v2, v2, -0x1

    .line 442
    .line 443
    move/from16 v29, v2

    .line 444
    .line 445
    :cond_f
    aput-wide v30, v6, v11

    .line 446
    .line 447
    invoke-interface/range {v21 .. v21}, Ll/g31$d;->a()I

    .line 448
    .line 449
    .line 450
    move-result v2

    .line 451
    aput v2, v4, v11

    .line 452
    .line 453
    if-le v2, v9, :cond_10

    .line 454
    .line 455
    move v9, v2

    .line 456
    :cond_10
    int-to-long v2, v12

    .line 457
    add-long v2, v25, v2

    .line 458
    .line 459
    aput-wide v2, v5, v11

    .line 460
    .line 461
    if-nez v24, :cond_11

    .line 462
    .line 463
    move/from16 v2, v18

    .line 464
    .line 465
    goto :goto_d

    .line 466
    :cond_11
    move/from16 v2, v17

    .line 467
    .line 468
    :goto_d
    aput v2, v0, v11

    .line 469
    .line 470
    if-ne v11, v8, :cond_12

    .line 471
    .line 472
    aput v18, v0, v11

    .line 473
    .line 474
    add-int/lit8 v7, v7, -0x1

    .line 475
    .line 476
    if-lez v7, :cond_12

    .line 477
    .line 478
    invoke-static/range {v24 .. v24}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 479
    .line 480
    .line 481
    move-result-object v2

    .line 482
    check-cast v2, Ll/ig60;

    .line 483
    .line 484
    invoke-virtual {v2}, Ll/ig60;->L()I

    .line 485
    .line 486
    .line 487
    move-result v2

    .line 488
    add-int/lit8 v2, v2, -0x1

    .line 489
    .line 490
    move v8, v2

    .line 491
    :cond_12
    move/from16 v14, v32

    .line 492
    .line 493
    int-to-long v2, v14

    .line 494
    add-long v25, v25, v2

    .line 495
    .line 496
    add-int/lit8 v2, v28, -0x1

    .line 497
    .line 498
    if-nez v2, :cond_13

    .line 499
    .line 500
    if-lez v10, :cond_13

    .line 501
    .line 502
    invoke-virtual/range {v22 .. v22}, Ll/ig60;->L()I

    .line 503
    .line 504
    .line 505
    move-result v2

    .line 506
    invoke-virtual/range {v22 .. v22}, Ll/ig60;->q()I

    .line 507
    .line 508
    .line 509
    move-result v3

    .line 510
    add-int/lit8 v10, v10, -0x1

    .line 511
    .line 512
    move v15, v3

    .line 513
    :goto_e
    move v14, v2

    .line 514
    goto :goto_f

    .line 515
    :cond_13
    move v15, v14

    .line 516
    goto :goto_e

    .line 517
    :goto_f
    aget v2, v4, v11

    .line 518
    .line 519
    int-to-long v2, v2

    .line 520
    add-long v2, v30, v2

    .line 521
    .line 522
    add-int/lit8 v23, v27, -0x1

    .line 523
    .line 524
    add-int/lit8 v11, v11, 0x1

    .line 525
    .line 526
    move-wide/from16 v27, v2

    .line 527
    .line 528
    move/from16 v3, v33

    .line 529
    .line 530
    goto/16 :goto_a

    .line 531
    .line 532
    :cond_14
    move/from16 v33, v3

    .line 533
    .line 534
    move/from16 v28, v14

    .line 535
    .line 536
    move/from16 v8, v23

    .line 537
    .line 538
    :goto_10
    int-to-long v11, v12

    .line 539
    add-long v11, v25, v11

    .line 540
    .line 541
    if-eqz p1, :cond_16

    .line 542
    .line 543
    :goto_11
    if-lez v16, :cond_16

    .line 544
    .line 545
    invoke-virtual/range {p1 .. p1}, Ll/ig60;->L()I

    .line 546
    .line 547
    .line 548
    move-result v13

    .line 549
    if-eqz v13, :cond_15

    .line 550
    .line 551
    move/from16 v13, v17

    .line 552
    .line 553
    goto :goto_12

    .line 554
    :cond_15
    invoke-virtual/range {p1 .. p1}, Ll/ig60;->q()I

    .line 555
    .line 556
    .line 557
    add-int/lit8 v16, v16, -0x1

    .line 558
    .line 559
    goto :goto_11

    .line 560
    :cond_16
    move/from16 v13, v18

    .line 561
    .line 562
    :goto_12
    if-nez v7, :cond_17

    .line 563
    .line 564
    if-nez v28, :cond_17

    .line 565
    .line 566
    if-nez v8, :cond_17

    .line 567
    .line 568
    if-nez v10, :cond_17

    .line 569
    .line 570
    if-nez v29, :cond_17

    .line 571
    .line 572
    if-nez v13, :cond_19

    .line 573
    .line 574
    :cond_17
    new-instance v14, Ljava/lang/StringBuilder;

    .line 575
    .line 576
    const-string v15, "Inconsistent stbl box for track "

    .line 577
    .line 578
    invoke-direct {v14, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 579
    .line 580
    .line 581
    iget v15, v1, Ll/yej0;->a:I

    .line 582
    .line 583
    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 584
    .line 585
    .line 586
    const-string v15, ": remainingSynchronizationSamples "

    .line 587
    .line 588
    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 589
    .line 590
    .line 591
    invoke-virtual {v14, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 592
    .line 593
    .line 594
    const-string v7, ", remainingSamplesAtTimestampDelta "

    .line 595
    .line 596
    invoke-virtual {v14, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 597
    .line 598
    .line 599
    move/from16 v7, v28

    .line 600
    .line 601
    invoke-virtual {v14, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 602
    .line 603
    .line 604
    const-string v7, ", remainingSamplesInChunk "

    .line 605
    .line 606
    invoke-virtual {v14, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 607
    .line 608
    .line 609
    invoke-virtual {v14, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 610
    .line 611
    .line 612
    const-string v7, ", remainingTimestampDeltaChanges "

    .line 613
    .line 614
    invoke-virtual {v14, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 615
    .line 616
    .line 617
    invoke-virtual {v14, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 618
    .line 619
    .line 620
    const-string v7, ", remainingSamplesAtTimestampOffset "

    .line 621
    .line 622
    invoke-virtual {v14, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 623
    .line 624
    .line 625
    move/from16 v7, v29

    .line 626
    .line 627
    invoke-virtual {v14, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 628
    .line 629
    .line 630
    if-nez v13, :cond_18

    .line 631
    .line 632
    const-string v7, ", ctts invalid"

    .line 633
    .line 634
    goto :goto_13

    .line 635
    :cond_18
    const-string v7, ""

    .line 636
    .line 637
    :goto_13
    invoke-virtual {v14, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 638
    .line 639
    .line 640
    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 641
    .line 642
    .line 643
    move-result-object v7

    .line 644
    invoke-static {v2, v7}, Ll/kyv;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 645
    .line 646
    .line 647
    :cond_19
    move-object v7, v4

    .line 648
    move-object v2, v6

    .line 649
    move v4, v9

    .line 650
    move-object v6, v0

    .line 651
    goto/16 :goto_9

    .line 652
    .line 653
    :goto_14
    const-wide/32 v10, 0xf4240

    .line 654
    .line 655
    .line 656
    iget-wide v12, v1, Ll/yej0;->c:J

    .line 657
    .line 658
    invoke-static/range {v8 .. v13}, Ll/bmk0;->W0(JJJ)J

    .line 659
    .line 660
    .line 661
    move-result-wide v10

    .line 662
    iget-object v0, v1, Ll/yej0;->h:[J

    .line 663
    .line 664
    const-wide/32 v12, 0xf4240

    .line 665
    .line 666
    .line 667
    if-nez v0, :cond_1a

    .line 668
    .line 669
    iget-wide v8, v1, Ll/yej0;->c:J

    .line 670
    .line 671
    invoke-static {v5, v12, v13, v8, v9}, Ll/bmk0;->Y0([JJJ)V

    .line 672
    .line 673
    .line 674
    new-instance v0, Ll/ufj0;

    .line 675
    .line 676
    move-object v3, v7

    .line 677
    move-wide v7, v10

    .line 678
    invoke-direct/range {v0 .. v8}, Ll/ufj0;-><init>(Ll/yej0;[J[II[J[IJ)V

    .line 679
    .line 680
    .line 681
    return-object v0

    .line 682
    :cond_1a
    move-object/from16 v34, v7

    .line 683
    .line 684
    move v7, v3

    .line 685
    move-object/from16 v3, v34

    .line 686
    .line 687
    array-length v0, v0

    .line 688
    move/from16 v10, v18

    .line 689
    .line 690
    if-ne v0, v10, :cond_1d

    .line 691
    .line 692
    iget v0, v1, Ll/yej0;->b:I

    .line 693
    .line 694
    if-ne v0, v10, :cond_1d

    .line 695
    .line 696
    array-length v0, v5

    .line 697
    const/4 v10, 0x2

    .line 698
    if-lt v0, v10, :cond_1d

    .line 699
    .line 700
    iget-object v0, v1, Ll/yej0;->i:[J

    .line 701
    .line 702
    invoke-static {v0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 703
    .line 704
    .line 705
    move-result-object v0

    .line 706
    check-cast v0, [J

    .line 707
    .line 708
    aget-wide v10, v0, v17

    .line 709
    .line 710
    iget-object v0, v1, Ll/yej0;->h:[J

    .line 711
    .line 712
    aget-wide v21, v0, v17

    .line 713
    .line 714
    iget-wide v14, v1, Ll/yej0;->c:J

    .line 715
    .line 716
    iget-wide v12, v1, Ll/yej0;->d:J

    .line 717
    .line 718
    move-wide/from16 v25, v12

    .line 719
    .line 720
    move-wide/from16 v23, v14

    .line 721
    .line 722
    invoke-static/range {v21 .. v26}, Ll/bmk0;->W0(JJJ)J

    .line 723
    .line 724
    .line 725
    move-result-wide v12

    .line 726
    add-long v13, v10, v12

    .line 727
    .line 728
    move-object/from16 p1, v2

    .line 729
    .line 730
    move-object v0, v3

    .line 731
    move-wide v11, v10

    .line 732
    const-wide/32 v2, 0xf4240

    .line 733
    .line 734
    .line 735
    move-wide v9, v8

    .line 736
    move-object v8, v5

    .line 737
    invoke-static/range {v8 .. v14}, Ll/g31;->b([JJJJ)Z

    .line 738
    .line 739
    .line 740
    move-result v5

    .line 741
    move-wide/from16 v34, v9

    .line 742
    .line 743
    move v10, v5

    .line 744
    move-object v5, v8

    .line 745
    move-wide/from16 v8, v34

    .line 746
    .line 747
    if-eqz v10, :cond_1b

    .line 748
    .line 749
    sub-long v21, v8, v13

    .line 750
    .line 751
    aget-wide v13, v5, v17

    .line 752
    .line 753
    sub-long v23, v11, v13

    .line 754
    .line 755
    iget-object v10, v1, Ll/yej0;->f:Lcom/google/android/exoplayer2/k;

    .line 756
    .line 757
    iget v10, v10, Lcom/google/android/exoplayer2/k;->z:I

    .line 758
    .line 759
    int-to-long v10, v10

    .line 760
    iget-wide v12, v1, Ll/yej0;->c:J

    .line 761
    .line 762
    move-wide/from16 v25, v10

    .line 763
    .line 764
    move-wide/from16 v27, v12

    .line 765
    .line 766
    invoke-static/range {v23 .. v28}, Ll/bmk0;->W0(JJJ)J

    .line 767
    .line 768
    .line 769
    move-result-wide v10

    .line 770
    iget-object v12, v1, Ll/yej0;->f:Lcom/google/android/exoplayer2/k;

    .line 771
    .line 772
    iget v12, v12, Lcom/google/android/exoplayer2/k;->z:I

    .line 773
    .line 774
    int-to-long v12, v12

    .line 775
    iget-wide v14, v1, Ll/yej0;->c:J

    .line 776
    .line 777
    move-wide/from16 v23, v12

    .line 778
    .line 779
    move-wide/from16 v25, v14

    .line 780
    .line 781
    invoke-static/range {v21 .. v26}, Ll/bmk0;->W0(JJJ)J

    .line 782
    .line 783
    .line 784
    move-result-wide v12

    .line 785
    cmp-long v14, v10, v19

    .line 786
    .line 787
    if-nez v14, :cond_1c

    .line 788
    .line 789
    cmp-long v14, v12, v19

    .line 790
    .line 791
    if-eqz v14, :cond_1b

    .line 792
    .line 793
    goto :goto_15

    .line 794
    :cond_1b
    move-object/from16 v2, p1

    .line 795
    .line 796
    move-object v3, v0

    .line 797
    goto :goto_16

    .line 798
    :cond_1c
    :goto_15
    const-wide/32 v14, 0x7fffffff

    .line 799
    .line 800
    .line 801
    cmp-long v16, v10, v14

    .line 802
    .line 803
    if-gtz v16, :cond_1b

    .line 804
    .line 805
    cmp-long v14, v12, v14

    .line 806
    .line 807
    if-gtz v14, :cond_1b

    .line 808
    .line 809
    long-to-int v7, v10

    .line 810
    move-object/from16 v8, p2

    .line 811
    .line 812
    iput v7, v8, Ll/ilj;->a:I

    .line 813
    .line 814
    long-to-int v7, v12

    .line 815
    iput v7, v8, Ll/ilj;->b:I

    .line 816
    .line 817
    iget-wide v7, v1, Ll/yej0;->c:J

    .line 818
    .line 819
    invoke-static {v5, v2, v3, v7, v8}, Ll/bmk0;->Y0([JJJ)V

    .line 820
    .line 821
    .line 822
    iget-object v2, v1, Ll/yej0;->h:[J

    .line 823
    .line 824
    aget-wide v7, v2, v17

    .line 825
    .line 826
    const-wide/32 v9, 0xf4240

    .line 827
    .line 828
    .line 829
    iget-wide v11, v1, Ll/yej0;->d:J

    .line 830
    .line 831
    invoke-static/range {v7 .. v12}, Ll/bmk0;->W0(JJJ)J

    .line 832
    .line 833
    .line 834
    move-result-wide v7

    .line 835
    move-object v3, v0

    .line 836
    new-instance v0, Ll/ufj0;

    .line 837
    .line 838
    move-object/from16 v2, p1

    .line 839
    .line 840
    invoke-direct/range {v0 .. v8}, Ll/ufj0;-><init>(Ll/yej0;[J[II[J[IJ)V

    .line 841
    .line 842
    .line 843
    return-object v0

    .line 844
    :cond_1d
    :goto_16
    iget-object v0, v1, Ll/yej0;->h:[J

    .line 845
    .line 846
    array-length v10, v0

    .line 847
    const/4 v11, 0x1

    .line 848
    if-ne v10, v11, :cond_1f

    .line 849
    .line 850
    aget-wide v10, v0, v17

    .line 851
    .line 852
    cmp-long v10, v10, v19

    .line 853
    .line 854
    if-nez v10, :cond_1f

    .line 855
    .line 856
    iget-object v0, v1, Ll/yej0;->i:[J

    .line 857
    .line 858
    invoke-static {v0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 859
    .line 860
    .line 861
    move-result-object v0

    .line 862
    check-cast v0, [J

    .line 863
    .line 864
    aget-wide v10, v0, v17

    .line 865
    .line 866
    move/from16 v0, v17

    .line 867
    .line 868
    :goto_17
    array-length v7, v5

    .line 869
    if-ge v0, v7, :cond_1e

    .line 870
    .line 871
    aget-wide v12, v5, v0

    .line 872
    .line 873
    sub-long v14, v12, v10

    .line 874
    .line 875
    const-wide/32 v16, 0xf4240

    .line 876
    .line 877
    .line 878
    iget-wide v12, v1, Ll/yej0;->c:J

    .line 879
    .line 880
    move-wide/from16 v18, v12

    .line 881
    .line 882
    invoke-static/range {v14 .. v19}, Ll/bmk0;->W0(JJJ)J

    .line 883
    .line 884
    .line 885
    move-result-wide v12

    .line 886
    aput-wide v12, v5, v0

    .line 887
    .line 888
    add-int/lit8 v0, v0, 0x1

    .line 889
    .line 890
    goto :goto_17

    .line 891
    :cond_1e
    sub-long v12, v8, v10

    .line 892
    .line 893
    const-wide/32 v14, 0xf4240

    .line 894
    .line 895
    .line 896
    iget-wide v7, v1, Ll/yej0;->c:J

    .line 897
    .line 898
    move-wide/from16 v16, v7

    .line 899
    .line 900
    invoke-static/range {v12 .. v17}, Ll/bmk0;->W0(JJJ)J

    .line 901
    .line 902
    .line 903
    move-result-wide v7

    .line 904
    new-instance v0, Ll/ufj0;

    .line 905
    .line 906
    invoke-direct/range {v0 .. v8}, Ll/ufj0;-><init>(Ll/yej0;[J[II[J[IJ)V

    .line 907
    .line 908
    .line 909
    return-object v0

    .line 910
    :cond_1f
    iget v8, v1, Ll/yej0;->b:I

    .line 911
    .line 912
    const/4 v10, 0x1

    .line 913
    if-ne v8, v10, :cond_20

    .line 914
    .line 915
    const/4 v10, 0x1

    .line 916
    goto :goto_18

    .line 917
    :cond_20
    move/from16 v10, v17

    .line 918
    .line 919
    :goto_18
    array-length v8, v0

    .line 920
    new-array v8, v8, [I

    .line 921
    .line 922
    array-length v0, v0

    .line 923
    new-array v0, v0, [I

    .line 924
    .line 925
    iget-object v9, v1, Ll/yej0;->i:[J

    .line 926
    .line 927
    invoke-static {v9}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 928
    .line 929
    .line 930
    move-result-object v9

    .line 931
    check-cast v9, [J

    .line 932
    .line 933
    move/from16 v11, v17

    .line 934
    .line 935
    move v12, v11

    .line 936
    move v13, v12

    .line 937
    move v14, v13

    .line 938
    :goto_19
    iget-object v15, v1, Ll/yej0;->h:[J

    .line 939
    .line 940
    move-object/from16 v16, v0

    .line 941
    .line 942
    array-length v0, v15

    .line 943
    if-ge v11, v0, :cond_24

    .line 944
    .line 945
    move-object v0, v8

    .line 946
    move-object/from16 p1, v9

    .line 947
    .line 948
    aget-wide v8, p1, v11

    .line 949
    .line 950
    const-wide/16 v21, -0x1

    .line 951
    .line 952
    cmp-long v21, v8, v21

    .line 953
    .line 954
    if-eqz v21, :cond_23

    .line 955
    .line 956
    aget-wide v22, v15, v11

    .line 957
    .line 958
    move v15, v11

    .line 959
    move/from16 p2, v12

    .line 960
    .line 961
    iget-wide v11, v1, Ll/yej0;->c:J

    .line 962
    .line 963
    move-wide/from16 v24, v11

    .line 964
    .line 965
    iget-wide v11, v1, Ll/yej0;->d:J

    .line 966
    .line 967
    move-wide/from16 v26, v11

    .line 968
    .line 969
    invoke-static/range {v22 .. v27}, Ll/bmk0;->W0(JJJ)J

    .line 970
    .line 971
    .line 972
    move-result-wide v11

    .line 973
    move-object/from16 v21, v0

    .line 974
    .line 975
    const/4 v0, 0x1

    .line 976
    invoke-static {v5, v8, v9, v0, v0}, Ll/bmk0;->i([JJZZ)I

    .line 977
    .line 978
    .line 979
    move-result v18

    .line 980
    aput v18, v21, v15

    .line 981
    .line 982
    add-long/2addr v8, v11

    .line 983
    move/from16 v11, v17

    .line 984
    .line 985
    invoke-static {v5, v8, v9, v10, v11}, Ll/bmk0;->e([JJZZ)I

    .line 986
    .line 987
    .line 988
    move-result v8

    .line 989
    aput v8, v16, v15

    .line 990
    .line 991
    :goto_1a
    aget v8, v21, v15

    .line 992
    .line 993
    aget v9, v16, v15

    .line 994
    .line 995
    if-ge v8, v9, :cond_21

    .line 996
    .line 997
    aget v12, v6, v8

    .line 998
    .line 999
    and-int/2addr v12, v0

    .line 1000
    if-nez v12, :cond_21

    .line 1001
    .line 1002
    add-int/lit8 v8, v8, 0x1

    .line 1003
    .line 1004
    aput v8, v21, v15

    .line 1005
    .line 1006
    goto :goto_1a

    .line 1007
    :cond_21
    sub-int v12, v9, v8

    .line 1008
    .line 1009
    add-int/2addr v13, v12

    .line 1010
    if-eq v14, v8, :cond_22

    .line 1011
    .line 1012
    move v8, v0

    .line 1013
    goto :goto_1b

    .line 1014
    :cond_22
    move v8, v11

    .line 1015
    :goto_1b
    or-int v12, p2, v8

    .line 1016
    .line 1017
    move v14, v9

    .line 1018
    goto :goto_1c

    .line 1019
    :cond_23
    move-object/from16 v21, v0

    .line 1020
    .line 1021
    move v15, v11

    .line 1022
    move/from16 p2, v12

    .line 1023
    .line 1024
    move/from16 v11, v17

    .line 1025
    .line 1026
    const/4 v0, 0x1

    .line 1027
    :goto_1c
    add-int/lit8 v8, v15, 0x1

    .line 1028
    .line 1029
    move-object/from16 v9, p1

    .line 1030
    .line 1031
    move/from16 v17, v11

    .line 1032
    .line 1033
    move-object/from16 v0, v16

    .line 1034
    .line 1035
    move v11, v8

    .line 1036
    move-object/from16 v8, v21

    .line 1037
    .line 1038
    goto :goto_19

    .line 1039
    :cond_24
    move-object/from16 v21, v8

    .line 1040
    .line 1041
    move/from16 p2, v12

    .line 1042
    .line 1043
    move/from16 v11, v17

    .line 1044
    .line 1045
    const/4 v0, 0x1

    .line 1046
    if-eq v13, v7, :cond_25

    .line 1047
    .line 1048
    move v8, v0

    .line 1049
    goto :goto_1d

    .line 1050
    :cond_25
    move v8, v11

    .line 1051
    :goto_1d
    or-int v0, p2, v8

    .line 1052
    .line 1053
    if-eqz v0, :cond_26

    .line 1054
    .line 1055
    new-array v7, v13, [J

    .line 1056
    .line 1057
    goto :goto_1e

    .line 1058
    :cond_26
    move-object v7, v2

    .line 1059
    :goto_1e
    if-eqz v0, :cond_27

    .line 1060
    .line 1061
    new-array v8, v13, [I

    .line 1062
    .line 1063
    goto :goto_1f

    .line 1064
    :cond_27
    move-object v8, v3

    .line 1065
    :goto_1f
    if-eqz v0, :cond_28

    .line 1066
    .line 1067
    move v4, v11

    .line 1068
    :cond_28
    if-eqz v0, :cond_29

    .line 1069
    .line 1070
    new-array v9, v13, [I

    .line 1071
    .line 1072
    goto :goto_20

    .line 1073
    :cond_29
    move-object v9, v6

    .line 1074
    :goto_20
    new-array v10, v13, [J

    .line 1075
    .line 1076
    move v12, v11

    .line 1077
    move-wide/from16 v22, v19

    .line 1078
    .line 1079
    :goto_21
    iget-object v13, v1, Ll/yej0;->h:[J

    .line 1080
    .line 1081
    array-length v13, v13

    .line 1082
    if-ge v11, v13, :cond_2e

    .line 1083
    .line 1084
    iget-object v13, v1, Ll/yej0;->i:[J

    .line 1085
    .line 1086
    aget-wide v14, v13, v11

    .line 1087
    .line 1088
    aget v13, v21, v11

    .line 1089
    .line 1090
    move/from16 p1, v0

    .line 1091
    .line 1092
    aget v0, v16, v11

    .line 1093
    .line 1094
    move/from16 p2, v4

    .line 1095
    .line 1096
    if-eqz p1, :cond_2a

    .line 1097
    .line 1098
    sub-int v4, v0, v13

    .line 1099
    .line 1100
    invoke-static {v2, v13, v7, v12, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1101
    .line 1102
    .line 1103
    invoke-static {v3, v13, v8, v12, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1104
    .line 1105
    .line 1106
    invoke-static {v6, v13, v9, v12, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1107
    .line 1108
    .line 1109
    :cond_2a
    move/from16 v4, p2

    .line 1110
    .line 1111
    :goto_22
    if-ge v13, v0, :cond_2d

    .line 1112
    .line 1113
    const-wide/32 v24, 0xf4240

    .line 1114
    .line 1115
    .line 1116
    move-object/from16 v17, v2

    .line 1117
    .line 1118
    move-object/from16 v18, v3

    .line 1119
    .line 1120
    iget-wide v2, v1, Ll/yej0;->d:J

    .line 1121
    .line 1122
    move-wide/from16 v26, v2

    .line 1123
    .line 1124
    invoke-static/range {v22 .. v27}, Ll/bmk0;->W0(JJJ)J

    .line 1125
    .line 1126
    .line 1127
    move-result-wide v2

    .line 1128
    aget-wide v24, v5, v13

    .line 1129
    .line 1130
    sub-long v26, v24, v14

    .line 1131
    .line 1132
    const-wide/32 v28, 0xf4240

    .line 1133
    .line 1134
    .line 1135
    move-wide/from16 v24, v2

    .line 1136
    .line 1137
    iget-wide v2, v1, Ll/yej0;->c:J

    .line 1138
    .line 1139
    move-wide/from16 v30, v2

    .line 1140
    .line 1141
    invoke-static/range {v26 .. v31}, Ll/bmk0;->W0(JJJ)J

    .line 1142
    .line 1143
    .line 1144
    move-result-wide v2

    .line 1145
    move/from16 v26, v0

    .line 1146
    .line 1147
    iget v0, v1, Ll/yej0;->b:I

    .line 1148
    .line 1149
    invoke-static {v0}, Ll/g31;->c(I)Z

    .line 1150
    .line 1151
    .line 1152
    move-result v0

    .line 1153
    move-object/from16 v27, v5

    .line 1154
    .line 1155
    if-eqz v0, :cond_2b

    .line 1156
    .line 1157
    move-object v0, v6

    .line 1158
    move-wide/from16 v5, v19

    .line 1159
    .line 1160
    invoke-static {v5, v6, v2, v3}, Ljava/lang/Math;->max(JJ)J

    .line 1161
    .line 1162
    .line 1163
    move-result-wide v2

    .line 1164
    goto :goto_23

    .line 1165
    :cond_2b
    move-object v0, v6

    .line 1166
    move-wide/from16 v5, v19

    .line 1167
    .line 1168
    :goto_23
    add-long v2, v24, v2

    .line 1169
    .line 1170
    aput-wide v2, v10, v12

    .line 1171
    .line 1172
    if-eqz p1, :cond_2c

    .line 1173
    .line 1174
    aget v2, v8, v12

    .line 1175
    .line 1176
    if-le v2, v4, :cond_2c

    .line 1177
    .line 1178
    aget v4, v18, v13

    .line 1179
    .line 1180
    :cond_2c
    add-int/lit8 v12, v12, 0x1

    .line 1181
    .line 1182
    add-int/lit8 v13, v13, 0x1

    .line 1183
    .line 1184
    move-wide/from16 v19, v5

    .line 1185
    .line 1186
    move-object/from16 v2, v17

    .line 1187
    .line 1188
    move-object/from16 v3, v18

    .line 1189
    .line 1190
    move-object/from16 v5, v27

    .line 1191
    .line 1192
    move-object v6, v0

    .line 1193
    move/from16 v0, v26

    .line 1194
    .line 1195
    goto :goto_22

    .line 1196
    :cond_2d
    move-object/from16 v17, v2

    .line 1197
    .line 1198
    move-object/from16 v18, v3

    .line 1199
    .line 1200
    move-object/from16 v27, v5

    .line 1201
    .line 1202
    move-object v0, v6

    .line 1203
    move-wide/from16 v5, v19

    .line 1204
    .line 1205
    iget-object v2, v1, Ll/yej0;->h:[J

    .line 1206
    .line 1207
    aget-wide v13, v2, v11

    .line 1208
    .line 1209
    add-long v22, v22, v13

    .line 1210
    .line 1211
    add-int/lit8 v11, v11, 0x1

    .line 1212
    .line 1213
    move-object/from16 v2, v17

    .line 1214
    .line 1215
    move-object/from16 v5, v27

    .line 1216
    .line 1217
    move-object v6, v0

    .line 1218
    move/from16 v0, p1

    .line 1219
    .line 1220
    goto/16 :goto_21

    .line 1221
    .line 1222
    :cond_2e
    move/from16 p2, v4

    .line 1223
    .line 1224
    const-wide/32 v24, 0xf4240

    .line 1225
    .line 1226
    .line 1227
    iget-wide v2, v1, Ll/yej0;->d:J

    .line 1228
    .line 1229
    move-wide/from16 v26, v2

    .line 1230
    .line 1231
    invoke-static/range {v22 .. v27}, Ll/bmk0;->W0(JJJ)J

    .line 1232
    .line 1233
    .line 1234
    move-result-wide v2

    .line 1235
    new-instance v0, Ll/ufj0;

    .line 1236
    .line 1237
    move-object v6, v9

    .line 1238
    move-object v5, v10

    .line 1239
    move-wide/from16 v34, v2

    .line 1240
    .line 1241
    move-object v2, v7

    .line 1242
    move-object v3, v8

    .line 1243
    move-wide/from16 v7, v34

    .line 1244
    .line 1245
    invoke-direct/range {v0 .. v8}, Ll/ufj0;-><init>(Ll/yej0;[J[II[J[IJ)V

    .line 1246
    .line 1247
    .line 1248
    return-object v0

    .line 1249
    :cond_2f
    const-string v0, "Track has no sample table size information"

    .line 1250
    .line 1251
    const/4 v1, 0x0

    .line 1252
    invoke-static {v0, v1}, Lcom/google/android/exoplayer2/ParserException;->createForMalformedContainer(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/exoplayer2/ParserException;

    .line 1253
    .line 1254
    .line 1255
    move-result-object v0

    .line 1256
    throw v0
.end method

.method public static x(Ll/ig60;IILjava/lang/String;Lcom/google/android/exoplayer2/drm/DrmInitData;Z)Ll/g31$e;
    .locals 12
    .param p4    # Lcom/google/android/exoplayer2/drm/DrmInitData;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ParserException;
        }
    .end annotation

    .line 1
    const/16 v0, 0xc

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/ig60;->U(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/ig60;->q()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    new-instance v7, Ll/g31$e;

    .line 11
    .line 12
    invoke-direct {v7, v0}, Ll/g31$e;-><init>(I)V

    .line 13
    .line 14
    .line 15
    const/4 v11, 0x0

    .line 16
    move v10, v11

    .line 17
    :goto_0
    if-ge v10, v0, :cond_9

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/ig60;->f()I

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    invoke-virtual {p0}, Ll/ig60;->q()I

    .line 24
    .line 25
    .line 26
    move-result v4

    .line 27
    if-lez v4, :cond_0

    .line 28
    .line 29
    const/4 v1, 0x1

    .line 30
    goto :goto_1

    .line 31
    :cond_0
    move v1, v11

    .line 32
    :goto_1
    const-string v2, "childAtomSize must be positive"

    .line 33
    .line 34
    invoke-static {v1, v2}, Ll/csf;->a(ZLjava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Ll/ig60;->q()I

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    const v1, 0x61766331

    .line 42
    .line 43
    .line 44
    if-eq v2, v1, :cond_1

    .line 45
    .line 46
    const v1, 0x61766333

    .line 47
    .line 48
    .line 49
    if-eq v2, v1, :cond_1

    .line 50
    .line 51
    const v1, 0x656e6376

    .line 52
    .line 53
    .line 54
    if-eq v2, v1, :cond_1

    .line 55
    .line 56
    const v1, 0x6d317620

    .line 57
    .line 58
    .line 59
    if-eq v2, v1, :cond_1

    .line 60
    .line 61
    const v1, 0x6d703476

    .line 62
    .line 63
    .line 64
    if-eq v2, v1, :cond_1

    .line 65
    .line 66
    const v1, 0x68766331

    .line 67
    .line 68
    .line 69
    if-eq v2, v1, :cond_1

    .line 70
    .line 71
    const v1, 0x68657631

    .line 72
    .line 73
    .line 74
    if-eq v2, v1, :cond_1

    .line 75
    .line 76
    const v1, 0x73323633

    .line 77
    .line 78
    .line 79
    if-eq v2, v1, :cond_1

    .line 80
    .line 81
    const v1, 0x48323633

    .line 82
    .line 83
    .line 84
    if-eq v2, v1, :cond_1

    .line 85
    .line 86
    const v1, 0x76703038

    .line 87
    .line 88
    .line 89
    if-eq v2, v1, :cond_1

    .line 90
    .line 91
    const v1, 0x76703039

    .line 92
    .line 93
    .line 94
    if-eq v2, v1, :cond_1

    .line 95
    .line 96
    const v1, 0x61763031

    .line 97
    .line 98
    .line 99
    if-eq v2, v1, :cond_1

    .line 100
    .line 101
    const v1, 0x64766176

    .line 102
    .line 103
    .line 104
    if-eq v2, v1, :cond_1

    .line 105
    .line 106
    const v1, 0x64766131

    .line 107
    .line 108
    .line 109
    if-eq v2, v1, :cond_1

    .line 110
    .line 111
    const v1, 0x64766865

    .line 112
    .line 113
    .line 114
    if-eq v2, v1, :cond_1

    .line 115
    .line 116
    const v1, 0x64766831

    .line 117
    .line 118
    .line 119
    if-ne v2, v1, :cond_2

    .line 120
    .line 121
    :cond_1
    move-object v1, p0

    .line 122
    move v5, p1

    .line 123
    move v6, p2

    .line 124
    move-object v8, v7

    .line 125
    move v9, v10

    .line 126
    move-object/from16 v7, p4

    .line 127
    .line 128
    goto/16 :goto_4

    .line 129
    .line 130
    :cond_2
    const v1, 0x6d703461

    .line 131
    .line 132
    .line 133
    if-eq v2, v1, :cond_3

    .line 134
    .line 135
    const v1, 0x656e6361

    .line 136
    .line 137
    .line 138
    if-eq v2, v1, :cond_3

    .line 139
    .line 140
    const v1, 0x61632d33

    .line 141
    .line 142
    .line 143
    if-eq v2, v1, :cond_3

    .line 144
    .line 145
    const v1, 0x65632d33

    .line 146
    .line 147
    .line 148
    if-eq v2, v1, :cond_3

    .line 149
    .line 150
    const v1, 0x61632d34

    .line 151
    .line 152
    .line 153
    if-eq v2, v1, :cond_3

    .line 154
    .line 155
    const v1, 0x6d6c7061

    .line 156
    .line 157
    .line 158
    if-eq v2, v1, :cond_3

    .line 159
    .line 160
    const v1, 0x64747363

    .line 161
    .line 162
    .line 163
    if-eq v2, v1, :cond_3

    .line 164
    .line 165
    const v1, 0x64747365

    .line 166
    .line 167
    .line 168
    if-eq v2, v1, :cond_3

    .line 169
    .line 170
    const v1, 0x64747368

    .line 171
    .line 172
    .line 173
    if-eq v2, v1, :cond_3

    .line 174
    .line 175
    const v1, 0x6474736c

    .line 176
    .line 177
    .line 178
    if-eq v2, v1, :cond_3

    .line 179
    .line 180
    const v1, 0x64747378

    .line 181
    .line 182
    .line 183
    if-eq v2, v1, :cond_3

    .line 184
    .line 185
    const v1, 0x73616d72

    .line 186
    .line 187
    .line 188
    if-eq v2, v1, :cond_3

    .line 189
    .line 190
    const v1, 0x73617762

    .line 191
    .line 192
    .line 193
    if-eq v2, v1, :cond_3

    .line 194
    .line 195
    const v1, 0x6c70636d

    .line 196
    .line 197
    .line 198
    if-eq v2, v1, :cond_3

    .line 199
    .line 200
    const v1, 0x736f7774

    .line 201
    .line 202
    .line 203
    if-eq v2, v1, :cond_3

    .line 204
    .line 205
    const v1, 0x74776f73

    .line 206
    .line 207
    .line 208
    if-eq v2, v1, :cond_3

    .line 209
    .line 210
    const v1, 0x2e6d7032

    .line 211
    .line 212
    .line 213
    if-eq v2, v1, :cond_3

    .line 214
    .line 215
    const v1, 0x2e6d7033

    .line 216
    .line 217
    .line 218
    if-eq v2, v1, :cond_3

    .line 219
    .line 220
    const v1, 0x6d686131

    .line 221
    .line 222
    .line 223
    if-eq v2, v1, :cond_3

    .line 224
    .line 225
    const v1, 0x6d686d31

    .line 226
    .line 227
    .line 228
    if-eq v2, v1, :cond_3

    .line 229
    .line 230
    const v1, 0x616c6163

    .line 231
    .line 232
    .line 233
    if-eq v2, v1, :cond_3

    .line 234
    .line 235
    const v1, 0x616c6177

    .line 236
    .line 237
    .line 238
    if-eq v2, v1, :cond_3

    .line 239
    .line 240
    const v1, 0x756c6177

    .line 241
    .line 242
    .line 243
    if-eq v2, v1, :cond_3

    .line 244
    .line 245
    const v1, 0x4f707573

    .line 246
    .line 247
    .line 248
    if-eq v2, v1, :cond_3

    .line 249
    .line 250
    const v1, 0x664c6143

    .line 251
    .line 252
    .line 253
    if-ne v2, v1, :cond_4

    .line 254
    .line 255
    :cond_3
    move-object v1, p0

    .line 256
    move v5, p1

    .line 257
    move-object v6, p3

    .line 258
    move-object/from16 v8, p4

    .line 259
    .line 260
    move-object v9, v7

    .line 261
    move/from16 v7, p5

    .line 262
    .line 263
    goto :goto_3

    .line 264
    :cond_4
    const v1, 0x54544d4c

    .line 265
    .line 266
    .line 267
    if-eq v2, v1, :cond_5

    .line 268
    .line 269
    const v1, 0x74783367

    .line 270
    .line 271
    .line 272
    if-eq v2, v1, :cond_5

    .line 273
    .line 274
    const v1, 0x77767474

    .line 275
    .line 276
    .line 277
    if-eq v2, v1, :cond_5

    .line 278
    .line 279
    const v1, 0x73747070

    .line 280
    .line 281
    .line 282
    if-eq v2, v1, :cond_5

    .line 283
    .line 284
    const v1, 0x63363038

    .line 285
    .line 286
    .line 287
    if-ne v2, v1, :cond_6

    .line 288
    .line 289
    :cond_5
    move-object v1, p0

    .line 290
    move v5, p1

    .line 291
    move-object v6, p3

    .line 292
    goto :goto_2

    .line 293
    :cond_6
    const v1, 0x6d657474

    .line 294
    .line 295
    .line 296
    if-ne v2, v1, :cond_7

    .line 297
    .line 298
    invoke-static {p0, v2, v3, p1, v7}, Ll/g31;->p(Ll/ig60;IIILl/g31$e;)V

    .line 299
    .line 300
    .line 301
    goto :goto_5

    .line 302
    :cond_7
    const v1, 0x63616d6d

    .line 303
    .line 304
    .line 305
    if-ne v2, v1, :cond_8

    .line 306
    .line 307
    new-instance v1, Lcom/google/android/exoplayer2/k$b;

    .line 308
    .line 309
    invoke-direct {v1}, Lcom/google/android/exoplayer2/k$b;-><init>()V

    .line 310
    .line 311
    .line 312
    invoke-virtual {v1, p1}, Lcom/google/android/exoplayer2/k$b;->T(I)Lcom/google/android/exoplayer2/k$b;

    .line 313
    .line 314
    .line 315
    move-result-object v1

    .line 316
    const-string v2, "application/x-camera-motion"

    .line 317
    .line 318
    invoke-virtual {v1, v2}, Lcom/google/android/exoplayer2/k$b;->g0(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 319
    .line 320
    .line 321
    move-result-object v1

    .line 322
    invoke-virtual {v1}, Lcom/google/android/exoplayer2/k$b;->G()Lcom/google/android/exoplayer2/k;

    .line 323
    .line 324
    .line 325
    move-result-object v1

    .line 326
    iput-object v1, v7, Ll/g31$e;->b:Lcom/google/android/exoplayer2/k;

    .line 327
    .line 328
    goto :goto_5

    .line 329
    :goto_2
    invoke-static/range {v1 .. v7}, Ll/g31;->y(Ll/ig60;IIIILjava/lang/String;Ll/g31$e;)V

    .line 330
    .line 331
    .line 332
    goto :goto_5

    .line 333
    :goto_3
    invoke-static/range {v1 .. v10}, Ll/g31;->g(Ll/ig60;IIIILjava/lang/String;ZLcom/google/android/exoplayer2/drm/DrmInitData;Ll/g31$e;I)V

    .line 334
    .line 335
    .line 336
    move-object v7, v9

    .line 337
    goto :goto_5

    .line 338
    :goto_4
    invoke-static/range {v1 .. v9}, Ll/g31;->E(Ll/ig60;IIIIILcom/google/android/exoplayer2/drm/DrmInitData;Ll/g31$e;I)V

    .line 339
    .line 340
    .line 341
    move-object v7, v8

    .line 342
    move v10, v9

    .line 343
    :cond_8
    :goto_5
    add-int/2addr v3, v4

    .line 344
    invoke-virtual {p0, v3}, Ll/ig60;->U(I)V

    .line 345
    .line 346
    .line 347
    add-int/lit8 v10, v10, 0x1

    .line 348
    .line 349
    goto/16 :goto_0

    .line 350
    .line 351
    :cond_9
    return-object v7
.end method

.method public static y(Ll/ig60;IIIILjava/lang/String;Ll/g31$e;)V
    .locals 4

    .line 1
    add-int/lit8 p2, p2, 0x10

    .line 2
    .line 3
    invoke-virtual {p0, p2}, Ll/ig60;->U(I)V

    .line 4
    .line 5
    .line 6
    const p2, 0x54544d4c

    .line 7
    .line 8
    .line 9
    const-string v0, "application/ttml+xml"

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    const-wide v2, 0x7fffffffffffffffL

    .line 13
    .line 14
    .line 15
    .line 16
    .line 17
    if-ne p1, p2, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const p2, 0x74783367

    .line 21
    .line 22
    .line 23
    if-ne p1, p2, :cond_1

    .line 24
    .line 25
    add-int/lit8 p3, p3, -0x10

    .line 26
    .line 27
    new-array p1, p3, [B

    .line 28
    .line 29
    const/4 p2, 0x0

    .line 30
    invoke-virtual {p0, p1, p2, p3}, Ll/ig60;->l([BII)V

    .line 31
    .line 32
    .line 33
    invoke-static {p1}, Lcom/google/common/collect/ImmutableList;->of(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    const-string v0, "application/x-quicktime-tx3g"

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    const p0, 0x77767474

    .line 41
    .line 42
    .line 43
    if-ne p1, p0, :cond_2

    .line 44
    .line 45
    const-string v0, "application/x-mp4-vtt"

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_2
    const p0, 0x73747070

    .line 49
    .line 50
    .line 51
    if-ne p1, p0, :cond_3

    .line 52
    .line 53
    const-wide/16 v2, 0x0

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_3
    const p0, 0x63363038

    .line 57
    .line 58
    .line 59
    if-ne p1, p0, :cond_4

    .line 60
    .line 61
    const/4 p0, 0x1

    .line 62
    iput p0, p6, Ll/g31$e;->d:I

    .line 63
    .line 64
    const-string v0, "application/x-mp4-cea-608"

    .line 65
    .line 66
    :goto_0
    new-instance p0, Lcom/google/android/exoplayer2/k$b;

    .line 67
    .line 68
    invoke-direct {p0}, Lcom/google/android/exoplayer2/k$b;-><init>()V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0, p4}, Lcom/google/android/exoplayer2/k$b;->T(I)Lcom/google/android/exoplayer2/k$b;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/k$b;->g0(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-virtual {p0, p5}, Lcom/google/android/exoplayer2/k$b;->X(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-virtual {p0, v2, v3}, Lcom/google/android/exoplayer2/k$b;->k0(J)Lcom/google/android/exoplayer2/k$b;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-virtual {p0, v1}, Lcom/google/android/exoplayer2/k$b;->V(Ljava/util/List;)Lcom/google/android/exoplayer2/k$b;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/k$b;->G()Lcom/google/android/exoplayer2/k;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    iput-object p0, p6, Ll/g31$e;->b:Lcom/google/android/exoplayer2/k;

    .line 96
    .line 97
    return-void

    .line 98
    :cond_4
    invoke-static {}, Ll/wpg0;->a()V

    .line 99
    .line 100
    .line 101
    return-void
.end method

.method public static z(Ll/ig60;)Ll/g31$h;
    .locals 12

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/ig60;->U(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/ig60;->q()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    invoke-static {v1}, Ll/f31;->c(I)I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    const/16 v2, 0x10

    .line 15
    .line 16
    if-nez v1, :cond_0

    .line 17
    .line 18
    move v3, v0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    move v3, v2

    .line 21
    :goto_0
    invoke-virtual {p0, v3}, Ll/ig60;->V(I)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Ll/ig60;->q()I

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    const/4 v4, 0x4

    .line 29
    invoke-virtual {p0, v4}, Ll/ig60;->V(I)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Ll/ig60;->f()I

    .line 33
    .line 34
    .line 35
    move-result v5

    .line 36
    if-nez v1, :cond_1

    .line 37
    .line 38
    move v0, v4

    .line 39
    :cond_1
    const/4 v6, 0x0

    .line 40
    move v7, v6

    .line 41
    :goto_1
    const-wide v8, -0x7fffffffffffffffL    # -4.9E-324

    .line 42
    .line 43
    .line 44
    .line 45
    .line 46
    if-ge v7, v0, :cond_5

    .line 47
    .line 48
    invoke-virtual {p0}, Ll/ig60;->e()[B

    .line 49
    .line 50
    .line 51
    move-result-object v10

    .line 52
    add-int v11, v5, v7

    .line 53
    .line 54
    aget-byte v10, v10, v11

    .line 55
    .line 56
    const/4 v11, -0x1

    .line 57
    if-eq v10, v11, :cond_4

    .line 58
    .line 59
    if-nez v1, :cond_2

    .line 60
    .line 61
    invoke-virtual {p0}, Ll/ig60;->J()J

    .line 62
    .line 63
    .line 64
    move-result-wide v0

    .line 65
    goto :goto_2

    .line 66
    :cond_2
    invoke-virtual {p0}, Ll/ig60;->M()J

    .line 67
    .line 68
    .line 69
    move-result-wide v0

    .line 70
    :goto_2
    const-wide/16 v10, 0x0

    .line 71
    .line 72
    cmp-long v5, v0, v10

    .line 73
    .line 74
    if-nez v5, :cond_3

    .line 75
    .line 76
    goto :goto_3

    .line 77
    :cond_3
    move-wide v8, v0

    .line 78
    goto :goto_3

    .line 79
    :cond_4
    add-int/lit8 v7, v7, 0x1

    .line 80
    .line 81
    goto :goto_1

    .line 82
    :cond_5
    invoke-virtual {p0, v0}, Ll/ig60;->V(I)V

    .line 83
    .line 84
    .line 85
    :goto_3
    invoke-virtual {p0, v2}, Ll/ig60;->V(I)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p0}, Ll/ig60;->q()I

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    invoke-virtual {p0}, Ll/ig60;->q()I

    .line 93
    .line 94
    .line 95
    move-result v1

    .line 96
    invoke-virtual {p0, v4}, Ll/ig60;->V(I)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p0}, Ll/ig60;->q()I

    .line 100
    .line 101
    .line 102
    move-result v2

    .line 103
    invoke-virtual {p0}, Ll/ig60;->q()I

    .line 104
    .line 105
    .line 106
    move-result p0

    .line 107
    const/high16 v4, -0x10000

    .line 108
    .line 109
    const/high16 v5, 0x10000

    .line 110
    .line 111
    if-nez v0, :cond_6

    .line 112
    .line 113
    if-ne v1, v5, :cond_6

    .line 114
    .line 115
    if-ne v2, v4, :cond_6

    .line 116
    .line 117
    if-nez p0, :cond_6

    .line 118
    .line 119
    const/16 v6, 0x5a

    .line 120
    .line 121
    goto :goto_4

    .line 122
    :cond_6
    if-nez v0, :cond_7

    .line 123
    .line 124
    if-ne v1, v4, :cond_7

    .line 125
    .line 126
    if-ne v2, v5, :cond_7

    .line 127
    .line 128
    if-nez p0, :cond_7

    .line 129
    .line 130
    const/16 v6, 0x10e

    .line 131
    .line 132
    goto :goto_4

    .line 133
    :cond_7
    if-ne v0, v4, :cond_8

    .line 134
    .line 135
    if-nez v1, :cond_8

    .line 136
    .line 137
    if-nez v2, :cond_8

    .line 138
    .line 139
    if-ne p0, v4, :cond_8

    .line 140
    .line 141
    const/16 v6, 0xb4

    .line 142
    .line 143
    :cond_8
    :goto_4
    new-instance p0, Ll/g31$h;

    .line 144
    .line 145
    invoke-direct {p0, v3, v8, v9, v6}, Ll/g31$h;-><init>(IJI)V

    .line 146
    .line 147
    .line 148
    return-object p0
.end method
