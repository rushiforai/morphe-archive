.class public final Ll/o0z0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/izy0;
.implements Ll/hzy0;


# instance fields
.field public final a:[Ll/izy0;

.field public final b:Ljava/util/IdentityHashMap;

.field public final c:Ljava/util/ArrayList;

.field public final d:Ljava/util/HashMap;

.field public e:Ll/hzy0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public f:Ll/q2z0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public g:[Ll/izy0;

.field public h:Ll/h2z0;

.field public final i:Ll/vyy0;


# direct methods
.method public varargs constructor <init>(Ll/vyy0;[J[Ll/izy0;)V
    .locals 5

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/o0z0;->i:Ll/vyy0;

    .line 5
    .line 6
    iput-object p3, p0, Ll/o0z0;->a:[Ll/izy0;

    .line 7
    .line 8
    new-instance p1, Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Ll/o0z0;->c:Ljava/util/ArrayList;

    .line 14
    .line 15
    new-instance p1, Ljava/util/HashMap;

    .line 16
    .line 17
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object p1, p0, Ll/o0z0;->d:Ljava/util/HashMap;

    .line 21
    .line 22
    const/4 p1, 0x0

    .line 23
    new-array v0, p1, [Ll/h2z0;

    .line 24
    .line 25
    new-instance v1, Ll/uyy0;

    .line 26
    .line 27
    invoke-direct {v1, v0}, Ll/uyy0;-><init>([Ll/h2z0;)V

    .line 28
    .line 29
    .line 30
    iput-object v1, p0, Ll/o0z0;->h:Ll/h2z0;

    .line 31
    .line 32
    new-instance v0, Ljava/util/IdentityHashMap;

    .line 33
    .line 34
    invoke-direct {v0}, Ljava/util/IdentityHashMap;-><init>()V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Ll/o0z0;->b:Ljava/util/IdentityHashMap;

    .line 38
    .line 39
    new-array v0, p1, [Ll/izy0;

    .line 40
    .line 41
    iput-object v0, p0, Ll/o0z0;->g:[Ll/izy0;

    .line 42
    .line 43
    :goto_0
    array-length v0, p3

    .line 44
    if-ge p1, v0, :cond_1

    .line 45
    .line 46
    aget-wide v0, p2, p1

    .line 47
    .line 48
    const-wide/16 v2, 0x0

    .line 49
    .line 50
    cmp-long v2, v0, v2

    .line 51
    .line 52
    if-eqz v2, :cond_0

    .line 53
    .line 54
    iget-object v2, p0, Ll/o0z0;->a:[Ll/izy0;

    .line 55
    .line 56
    new-instance v3, Ll/n2z0;

    .line 57
    .line 58
    aget-object v4, p3, p1

    .line 59
    .line 60
    invoke-direct {v3, v4, v0, v1}, Ll/n2z0;-><init>(Ll/izy0;J)V

    .line 61
    .line 62
    .line 63
    aput-object v3, v2, p1

    .line 64
    .line 65
    :cond_0
    add-int/lit8 p1, p1, 0x1

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_1
    return-void
.end method


# virtual methods
.method public final a(Ll/gay0;)Z
    .locals 4

    .line 1
    iget-object v0, p0, Ll/o0z0;->c:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ll/o0z0;->c:Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v1, 0x0

    .line 16
    move v2, v1

    .line 17
    :goto_0
    if-ge v2, v0, :cond_0

    .line 18
    .line 19
    iget-object v3, p0, Ll/o0z0;->c:Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    check-cast v3, Ll/izy0;

    .line 26
    .line 27
    invoke-interface {v3, p1}, Ll/izy0;->a(Ll/gay0;)Z

    .line 28
    .line 29
    .line 30
    add-int/lit8 v2, v2, 0x1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    return v1

    .line 34
    :cond_1
    iget-object p0, p0, Ll/o0z0;->h:Ll/h2z0;

    .line 35
    .line 36
    invoke-interface {p0, p1}, Ll/h2z0;->a(Ll/gay0;)Z

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    return p0
.end method

.method public final b(J)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/o0z0;->h:Ll/h2z0;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Ll/h2z0;->b(J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final bridge synthetic c(Ll/h2z0;)V
    .locals 0

    .line 1
    check-cast p1, Ll/izy0;

    .line 2
    .line 3
    iget-object p1, p0, Ll/o0z0;->e:Ll/hzy0;

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    invoke-interface {p1, p0}, Ll/g2z0;->c(Ll/h2z0;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final d(Ll/izy0;)V
    .locals 10

    .line 1
    iget-object v0, p0, Ll/o0z0;->c:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/o0z0;->c:Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-nez p1, :cond_0

    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object p1, p0, Ll/o0z0;->a:[Ll/izy0;

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    move v1, v0

    .line 19
    move v2, v1

    .line 20
    :goto_0
    array-length v3, p1

    .line 21
    if-ge v1, v3, :cond_1

    .line 22
    .line 23
    aget-object v3, p1, v1

    .line 24
    .line 25
    invoke-interface {v3}, Ll/izy0;->zzh()Ll/q2z0;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    iget v3, v3, Ll/q2z0;->a:I

    .line 30
    .line 31
    add-int/2addr v2, v3

    .line 32
    add-int/lit8 v1, v1, 0x1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    new-array p1, v2, [Ll/t2u0;

    .line 36
    .line 37
    move v1, v0

    .line 38
    move v2, v1

    .line 39
    :goto_1
    iget-object v3, p0, Ll/o0z0;->a:[Ll/izy0;

    .line 40
    .line 41
    array-length v4, v3

    .line 42
    if-ge v1, v4, :cond_3

    .line 43
    .line 44
    aget-object v3, v3, v1

    .line 45
    .line 46
    invoke-interface {v3}, Ll/izy0;->zzh()Ll/q2z0;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    iget v4, v3, Ll/q2z0;->a:I

    .line 51
    .line 52
    move v5, v0

    .line 53
    :goto_2
    if-ge v5, v4, :cond_2

    .line 54
    .line 55
    invoke-virtual {v3, v5}, Ll/q2z0;->b(I)Ll/t2u0;

    .line 56
    .line 57
    .line 58
    move-result-object v6

    .line 59
    iget-object v7, v6, Ll/t2u0;->b:Ljava/lang/String;

    .line 60
    .line 61
    new-instance v8, Ljava/lang/StringBuilder;

    .line 62
    .line 63
    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    const-string v9, ":"

    .line 70
    .line 71
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v7

    .line 81
    invoke-virtual {v6, v7}, Ll/t2u0;->c(Ljava/lang/String;)Ll/t2u0;

    .line 82
    .line 83
    .line 84
    move-result-object v7

    .line 85
    iget-object v8, p0, Ll/o0z0;->d:Ljava/util/HashMap;

    .line 86
    .line 87
    invoke-virtual {v8, v7, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    add-int/lit8 v6, v2, 0x1

    .line 91
    .line 92
    aput-object v7, p1, v2

    .line 93
    .line 94
    add-int/lit8 v5, v5, 0x1

    .line 95
    .line 96
    move v2, v6

    .line 97
    goto :goto_2

    .line 98
    :cond_2
    add-int/lit8 v1, v1, 0x1

    .line 99
    .line 100
    goto :goto_1

    .line 101
    :cond_3
    new-instance v0, Ll/q2z0;

    .line 102
    .line 103
    invoke-direct {v0, p1}, Ll/q2z0;-><init>([Ll/t2u0;)V

    .line 104
    .line 105
    .line 106
    iput-object v0, p0, Ll/o0z0;->f:Ll/q2z0;

    .line 107
    .line 108
    iget-object p1, p0, Ll/o0z0;->e:Ll/hzy0;

    .line 109
    .line 110
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 111
    .line 112
    .line 113
    invoke-interface {p1, p0}, Ll/hzy0;->d(Ll/izy0;)V

    .line 114
    .line 115
    .line 116
    return-void
.end method

.method public final e([Ll/n5z0;[Z[Ll/f2z0;[ZJ)J
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p3

    .line 6
    .line 7
    array-length v3, v1

    .line 8
    new-array v4, v3, [I

    .line 9
    .line 10
    new-array v3, v3, [I

    .line 11
    .line 12
    const/4 v5, 0x0

    .line 13
    move v6, v5

    .line 14
    :goto_0
    array-length v7, v1

    .line 15
    if-ge v6, v7, :cond_3

    .line 16
    .line 17
    aget-object v7, v2, v6

    .line 18
    .line 19
    if-nez v7, :cond_0

    .line 20
    .line 21
    const/4 v8, 0x0

    .line 22
    goto :goto_1

    .line 23
    :cond_0
    iget-object v8, v0, Ll/o0z0;->b:Ljava/util/IdentityHashMap;

    .line 24
    .line 25
    invoke-virtual {v8, v7}, Ljava/util/IdentityHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v7

    .line 29
    move-object v8, v7

    .line 30
    check-cast v8, Ljava/lang/Integer;

    .line 31
    .line 32
    :goto_1
    const/4 v7, -0x1

    .line 33
    if-nez v8, :cond_1

    .line 34
    .line 35
    move v8, v7

    .line 36
    goto :goto_2

    .line 37
    :cond_1
    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    .line 38
    .line 39
    .line 40
    move-result v8

    .line 41
    :goto_2
    aput v8, v4, v6

    .line 42
    .line 43
    aget-object v8, v1, v6

    .line 44
    .line 45
    if-eqz v8, :cond_2

    .line 46
    .line 47
    invoke-interface {v8}, Ll/r5z0;->zze()Ll/t2u0;

    .line 48
    .line 49
    .line 50
    move-result-object v7

    .line 51
    iget-object v7, v7, Ll/t2u0;->b:Ljava/lang/String;

    .line 52
    .line 53
    const-string v8, ":"

    .line 54
    .line 55
    invoke-virtual {v7, v8}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 56
    .line 57
    .line 58
    move-result v8

    .line 59
    invoke-virtual {v7, v5, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v7

    .line 63
    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 64
    .line 65
    .line 66
    move-result v7

    .line 67
    aput v7, v3, v6

    .line 68
    .line 69
    goto :goto_3

    .line 70
    :cond_2
    aput v7, v3, v6

    .line 71
    .line 72
    :goto_3
    add-int/lit8 v6, v6, 0x1

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_3
    iget-object v6, v0, Ll/o0z0;->b:Ljava/util/IdentityHashMap;

    .line 76
    .line 77
    invoke-virtual {v6}, Ljava/util/IdentityHashMap;->clear()V

    .line 78
    .line 79
    .line 80
    iget-object v6, v0, Ll/o0z0;->a:[Ll/izy0;

    .line 81
    .line 82
    new-array v9, v7, [Ll/f2z0;

    .line 83
    .line 84
    new-array v13, v7, [Ll/f2z0;

    .line 85
    .line 86
    new-array v11, v7, [Ll/n5z0;

    .line 87
    .line 88
    new-instance v10, Ljava/util/ArrayList;

    .line 89
    .line 90
    array-length v6, v6

    .line 91
    invoke-direct {v10, v6}, Ljava/util/ArrayList;-><init>(I)V

    .line 92
    .line 93
    .line 94
    move-wide/from16 v15, p5

    .line 95
    .line 96
    move v6, v5

    .line 97
    :goto_4
    iget-object v12, v0, Ll/o0z0;->a:[Ll/izy0;

    .line 98
    .line 99
    array-length v12, v12

    .line 100
    if-ge v6, v12, :cond_e

    .line 101
    .line 102
    move v12, v5

    .line 103
    :goto_5
    array-length v14, v1

    .line 104
    if-ge v12, v14, :cond_6

    .line 105
    .line 106
    aget v14, v4, v12

    .line 107
    .line 108
    if-ne v14, v6, :cond_4

    .line 109
    .line 110
    aget-object v14, v2, v12

    .line 111
    .line 112
    goto :goto_6

    .line 113
    :cond_4
    const/4 v14, 0x0

    .line 114
    :goto_6
    aput-object v14, v13, v12

    .line 115
    .line 116
    aget v14, v3, v12

    .line 117
    .line 118
    if-ne v14, v6, :cond_5

    .line 119
    .line 120
    aget-object v14, v1, v12

    .line 121
    .line 122
    invoke-virtual {v14}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 123
    .line 124
    .line 125
    const/16 v17, 0x0

    .line 126
    .line 127
    iget-object v8, v0, Ll/o0z0;->d:Ljava/util/HashMap;

    .line 128
    .line 129
    invoke-interface {v14}, Ll/r5z0;->zze()Ll/t2u0;

    .line 130
    .line 131
    .line 132
    move-result-object v5

    .line 133
    invoke-virtual {v8, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    move-result-object v5

    .line 137
    check-cast v5, Ll/t2u0;

    .line 138
    .line 139
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 140
    .line 141
    .line 142
    new-instance v8, Ll/n0z0;

    .line 143
    .line 144
    invoke-direct {v8, v14, v5}, Ll/n0z0;-><init>(Ll/n5z0;Ll/t2u0;)V

    .line 145
    .line 146
    .line 147
    aput-object v8, v11, v12

    .line 148
    .line 149
    goto :goto_7

    .line 150
    :cond_5
    const/16 v17, 0x0

    .line 151
    .line 152
    aput-object v17, v11, v12

    .line 153
    .line 154
    :goto_7
    add-int/lit8 v12, v12, 0x1

    .line 155
    .line 156
    const/4 v5, 0x0

    .line 157
    goto :goto_5

    .line 158
    :cond_6
    const/16 v17, 0x0

    .line 159
    .line 160
    iget-object v5, v0, Ll/o0z0;->a:[Ll/izy0;

    .line 161
    .line 162
    aget-object v5, v5, v6

    .line 163
    .line 164
    move-object v12, v10

    .line 165
    move-object v10, v5

    .line 166
    move-object v5, v12

    .line 167
    move-object/from16 v12, p2

    .line 168
    .line 169
    move-object/from16 v14, p4

    .line 170
    .line 171
    invoke-interface/range {v10 .. v16}, Ll/izy0;->e([Ll/n5z0;[Z[Ll/f2z0;[ZJ)J

    .line 172
    .line 173
    .line 174
    move-result-wide v18

    .line 175
    if-nez v6, :cond_7

    .line 176
    .line 177
    move-wide/from16 v15, v18

    .line 178
    .line 179
    goto :goto_8

    .line 180
    :cond_7
    cmp-long v8, v18, v15

    .line 181
    .line 182
    if-nez v8, :cond_d

    .line 183
    .line 184
    :goto_8
    const/4 v8, 0x0

    .line 185
    const/4 v10, 0x0

    .line 186
    :goto_9
    array-length v12, v1

    .line 187
    if-ge v8, v12, :cond_b

    .line 188
    .line 189
    aget v12, v3, v8

    .line 190
    .line 191
    if-ne v12, v6, :cond_8

    .line 192
    .line 193
    aget-object v10, v13, v8

    .line 194
    .line 195
    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 196
    .line 197
    .line 198
    aput-object v10, v9, v8

    .line 199
    .line 200
    iget-object v12, v0, Ll/o0z0;->b:Ljava/util/IdentityHashMap;

    .line 201
    .line 202
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 203
    .line 204
    .line 205
    move-result-object v14

    .line 206
    invoke-virtual {v12, v10, v14}, Ljava/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 207
    .line 208
    .line 209
    const/4 v10, 0x1

    .line 210
    goto :goto_b

    .line 211
    :cond_8
    aget v12, v4, v8

    .line 212
    .line 213
    if-ne v12, v6, :cond_a

    .line 214
    .line 215
    aget-object v12, v13, v8

    .line 216
    .line 217
    if-nez v12, :cond_9

    .line 218
    .line 219
    const/4 v14, 0x1

    .line 220
    goto :goto_a

    .line 221
    :cond_9
    const/4 v14, 0x0

    .line 222
    :goto_a
    invoke-static {v14}, Ll/lev0;->f(Z)V

    .line 223
    .line 224
    .line 225
    :cond_a
    :goto_b
    add-int/lit8 v8, v8, 0x1

    .line 226
    .line 227
    goto :goto_9

    .line 228
    :cond_b
    if-eqz v10, :cond_c

    .line 229
    .line 230
    iget-object v8, v0, Ll/o0z0;->a:[Ll/izy0;

    .line 231
    .line 232
    aget-object v8, v8, v6

    .line 233
    .line 234
    invoke-virtual {v5, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 235
    .line 236
    .line 237
    :cond_c
    add-int/lit8 v6, v6, 0x1

    .line 238
    .line 239
    move-object v10, v5

    .line 240
    const/4 v5, 0x0

    .line 241
    goto/16 :goto_4

    .line 242
    .line 243
    :cond_d
    const-string v0, "Children enabled at different positions."

    .line 244
    .line 245
    invoke-static {v0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 246
    .line 247
    .line 248
    const-wide/16 v0, 0x0

    .line 249
    .line 250
    return-wide v0

    .line 251
    :cond_e
    move v1, v5

    .line 252
    move-object v5, v10

    .line 253
    invoke-static {v9, v1, v2, v1, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 254
    .line 255
    .line 256
    new-array v1, v1, [Ll/izy0;

    .line 257
    .line 258
    invoke-virtual {v5, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 259
    .line 260
    .line 261
    move-result-object v1

    .line 262
    check-cast v1, [Ll/izy0;

    .line 263
    .line 264
    iput-object v1, v0, Ll/o0z0;->g:[Ll/izy0;

    .line 265
    .line 266
    new-instance v2, Ll/uyy0;

    .line 267
    .line 268
    invoke-direct {v2, v1}, Ll/uyy0;-><init>([Ll/h2z0;)V

    .line 269
    .line 270
    .line 271
    iput-object v2, v0, Ll/o0z0;->h:Ll/h2z0;

    .line 272
    .line 273
    return-wide v15
.end method

.method public final f(JLl/gfy0;)J
    .locals 3

    .line 1
    iget-object v0, p0, Ll/o0z0;->g:[Ll/izy0;

    .line 2
    .line 3
    array-length v1, v0

    .line 4
    const/4 v2, 0x0

    .line 5
    if-lez v1, :cond_0

    .line 6
    .line 7
    aget-object p0, v0, v2

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object p0, p0, Ll/o0z0;->a:[Ll/izy0;

    .line 11
    .line 12
    aget-object p0, p0, v2

    .line 13
    .line 14
    :goto_0
    invoke-interface {p0, p1, p2, p3}, Ll/izy0;->f(JLl/gfy0;)J

    .line 15
    .line 16
    .line 17
    move-result-wide p0

    .line 18
    return-wide p0
.end method

.method public final g(JZ)V
    .locals 3

    .line 1
    iget-object p0, p0, Ll/o0z0;->g:[Ll/izy0;

    .line 2
    .line 3
    array-length p3, p0

    .line 4
    const/4 v0, 0x0

    .line 5
    move v1, v0

    .line 6
    :goto_0
    if-ge v1, p3, :cond_0

    .line 7
    .line 8
    aget-object v2, p0, v1

    .line 9
    .line 10
    invoke-interface {v2, p1, p2, v0}, Ll/izy0;->g(JZ)V

    .line 11
    .line 12
    .line 13
    add-int/lit8 v1, v1, 0x1

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    return-void
.end method

.method public final h(I)Ll/izy0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/o0z0;->a:[Ll/izy0;

    .line 2
    .line 3
    aget-object p0, p0, p1

    .line 4
    .line 5
    instance-of p1, p0, Ll/n2z0;

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    check-cast p0, Ll/n2z0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/n2z0;->h()Ll/izy0;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    :cond_0
    return-object p0
.end method

.method public final k(Ll/hzy0;J)V
    .locals 2

    .line 1
    iput-object p1, p0, Ll/o0z0;->e:Ll/hzy0;

    .line 2
    .line 3
    iget-object p1, p0, Ll/o0z0;->c:Ljava/util/ArrayList;

    .line 4
    .line 5
    iget-object v0, p0, Ll/o0z0;->a:[Ll/izy0;

    .line 6
    .line 7
    invoke-static {p1, v0}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    :goto_0
    iget-object v0, p0, Ll/o0z0;->a:[Ll/izy0;

    .line 12
    .line 13
    array-length v1, v0

    .line 14
    if-ge p1, v1, :cond_0

    .line 15
    .line 16
    aget-object v0, v0, p1

    .line 17
    .line 18
    invoke-interface {v0, p0, p2, p3}, Ll/izy0;->k(Ll/hzy0;J)V

    .line 19
    .line 20
    .line 21
    add-int/lit8 p1, p1, 0x1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    return-void
.end method

.method public final l(J)J
    .locals 3

    .line 1
    iget-object v0, p0, Ll/o0z0;->g:[Ll/izy0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    aget-object v0, v0, v1

    .line 5
    .line 6
    invoke-interface {v0, p1, p2}, Ll/izy0;->l(J)J

    .line 7
    .line 8
    .line 9
    move-result-wide p1

    .line 10
    const/4 v0, 0x1

    .line 11
    :goto_0
    iget-object v1, p0, Ll/o0z0;->g:[Ll/izy0;

    .line 12
    .line 13
    array-length v2, v1

    .line 14
    if-ge v0, v2, :cond_1

    .line 15
    .line 16
    aget-object v1, v1, v0

    .line 17
    .line 18
    invoke-interface {v1, p1, p2}, Ll/izy0;->l(J)J

    .line 19
    .line 20
    .line 21
    move-result-wide v1

    .line 22
    cmp-long v1, v1, p1

    .line 23
    .line 24
    if-nez v1, :cond_0

    .line 25
    .line 26
    add-int/lit8 v0, v0, 0x1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    const-string p0, "Unexpected child seekToUs result."

    .line 30
    .line 31
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    const-wide/16 p0, 0x0

    .line 35
    .line 36
    return-wide p0

    .line 37
    :cond_1
    return-wide p1
.end method

.method public final zzb()J
    .locals 2

    .line 1
    iget-object p0, p0, Ll/o0z0;->h:Ll/h2z0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/h2z0;->zzb()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public final zzc()J
    .locals 2

    .line 1
    iget-object p0, p0, Ll/o0z0;->h:Ll/h2z0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/h2z0;->zzc()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public final zzd()J
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Ll/o0z0;->g:[Ll/izy0;

    .line 4
    .line 5
    array-length v2, v1

    .line 6
    const-wide v4, -0x7fffffffffffffffL    # -4.9E-324

    .line 7
    .line 8
    .line 9
    .line 10
    .line 11
    move-wide v7, v4

    .line 12
    const/4 v6, 0x0

    .line 13
    :goto_0
    if-ge v6, v2, :cond_8

    .line 14
    .line 15
    aget-object v9, v1, v6

    .line 16
    .line 17
    invoke-interface {v9}, Ll/izy0;->zzd()J

    .line 18
    .line 19
    .line 20
    move-result-wide v10

    .line 21
    cmp-long v12, v10, v4

    .line 22
    .line 23
    const-wide/16 v13, 0x0

    .line 24
    .line 25
    const-string v15, "Unexpected child seekToUs result."

    .line 26
    .line 27
    if-eqz v12, :cond_5

    .line 28
    .line 29
    cmp-long v12, v7, v4

    .line 30
    .line 31
    if-nez v12, :cond_3

    .line 32
    .line 33
    iget-object v7, v0, Ll/o0z0;->g:[Ll/izy0;

    .line 34
    .line 35
    array-length v8, v7

    .line 36
    const/4 v12, 0x0

    .line 37
    :goto_1
    if-ge v12, v8, :cond_2

    .line 38
    .line 39
    aget-object v3, v7, v12

    .line 40
    .line 41
    if-ne v3, v9, :cond_0

    .line 42
    .line 43
    goto :goto_2

    .line 44
    :cond_0
    invoke-interface {v3, v10, v11}, Ll/izy0;->l(J)J

    .line 45
    .line 46
    .line 47
    move-result-wide v16

    .line 48
    cmp-long v3, v16, v10

    .line 49
    .line 50
    if-nez v3, :cond_1

    .line 51
    .line 52
    add-int/lit8 v12, v12, 0x1

    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_1
    invoke-static {v15}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    return-wide v13

    .line 59
    :cond_2
    :goto_2
    move-wide v7, v10

    .line 60
    goto :goto_3

    .line 61
    :cond_3
    cmp-long v3, v10, v7

    .line 62
    .line 63
    if-nez v3, :cond_4

    .line 64
    .line 65
    goto :goto_3

    .line 66
    :cond_4
    const-string v0, "Conflicting discontinuities."

    .line 67
    .line 68
    invoke-static {v0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    return-wide v13

    .line 72
    :cond_5
    cmp-long v3, v7, v4

    .line 73
    .line 74
    if-eqz v3, :cond_7

    .line 75
    .line 76
    invoke-interface {v9, v7, v8}, Ll/izy0;->l(J)J

    .line 77
    .line 78
    .line 79
    move-result-wide v9

    .line 80
    cmp-long v3, v9, v7

    .line 81
    .line 82
    if-nez v3, :cond_6

    .line 83
    .line 84
    goto :goto_3

    .line 85
    :cond_6
    invoke-static {v15}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    return-wide v13

    .line 89
    :cond_7
    :goto_3
    add-int/lit8 v6, v6, 0x1

    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_8
    return-wide v7
.end method

.method public final zzh()Ll/q2z0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/o0z0;->f:Ll/q2z0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public final zzk()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Ll/o0z0;->a:[Ll/izy0;

    .line 3
    .line 4
    array-length v2, v1

    .line 5
    if-ge v0, v2, :cond_0

    .line 6
    .line 7
    aget-object v1, v1, v0

    .line 8
    .line 9
    invoke-interface {v1}, Ll/izy0;->zzk()V

    .line 10
    .line 11
    .line 12
    add-int/lit8 v0, v0, 0x1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    return-void
.end method

.method public final zzp()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/o0z0;->h:Ll/h2z0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/h2z0;->zzp()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
