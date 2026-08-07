.class public final Ll/nxw0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/Class;

.field public b:Ljava/util/concurrent/ConcurrentMap;

.field public final c:Ljava/util/List;

.field public d:Ll/oxw0;

.field public e:Ll/nax0;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Class;Ll/mxw0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance p2, Ljava/util/concurrent/ConcurrentHashMap;

    .line 5
    .line 6
    invoke-direct {p2}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p2, p0, Ll/nxw0;->b:Ljava/util/concurrent/ConcurrentMap;

    .line 10
    .line 11
    new-instance p2, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p2, p0, Ll/nxw0;->c:Ljava/util/List;

    .line 17
    .line 18
    iput-object p1, p0, Ll/nxw0;->a:Ljava/lang/Class;

    .line 19
    .line 20
    sget-object p1, Ll/nax0;->b:Ll/nax0;

    .line 21
    .line 22
    iput-object p1, p0, Ll/nxw0;->e:Ll/nax0;

    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/android/gms/internal/ads/w4;)Ll/nxw0;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, p2, p3, v0}, Ll/nxw0;->e(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/android/gms/internal/ads/w4;Z)Ll/nxw0;

    .line 3
    .line 4
    .line 5
    return-object p0
.end method

.method public final b(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/android/gms/internal/ads/w4;)Ll/nxw0;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, p2, p3, v0}, Ll/nxw0;->e(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/android/gms/internal/ads/w4;Z)Ll/nxw0;

    .line 3
    .line 4
    .line 5
    return-object p0
.end method

.method public final c(Ll/nax0;)Ll/nxw0;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nxw0;->b:Ljava/util/concurrent/ConcurrentMap;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iput-object p1, p0, Ll/nxw0;->e:Ll/nax0;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    const-string p0, "setAnnotations cannot be called after build"

    .line 9
    .line 10
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    return-object p0
.end method

.method public final d()Ll/sxw0;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    iget-object v1, p0, Ll/nxw0;->b:Ljava/util/concurrent/ConcurrentMap;

    .line 2
    .line 3
    const/4 v7, 0x0

    .line 4
    if-eqz v1, :cond_0

    .line 5
    .line 6
    iget-object v2, p0, Ll/nxw0;->c:Ljava/util/List;

    .line 7
    .line 8
    new-instance v0, Ll/sxw0;

    .line 9
    .line 10
    iget-object v3, p0, Ll/nxw0;->d:Ll/oxw0;

    .line 11
    .line 12
    iget-object v4, p0, Ll/nxw0;->e:Ll/nax0;

    .line 13
    .line 14
    iget-object v5, p0, Ll/nxw0;->a:Ljava/lang/Class;

    .line 15
    .line 16
    const/4 v6, 0x0

    .line 17
    invoke-direct/range {v0 .. v6}, Ll/sxw0;-><init>(Ljava/util/concurrent/ConcurrentMap;Ljava/util/List;Ll/oxw0;Ll/nax0;Ljava/lang/Class;Ll/rxw0;)V

    .line 18
    .line 19
    .line 20
    iput-object v7, p0, Ll/nxw0;->b:Ljava/util/concurrent/ConcurrentMap;

    .line 21
    .line 22
    return-object v0

    .line 23
    :cond_0
    const-string p0, "build cannot be called twice"

    .line 24
    .line 25
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-object v7
.end method

.method public final e(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/android/gms/internal/ads/w4;Z)Ll/nxw0;
    .locals 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/nxw0;->b:Ljava/util/concurrent/ConcurrentMap;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_b

    .line 5
    .line 6
    if-nez p1, :cond_1

    .line 7
    .line 8
    if-eqz p2, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const-string p0, "at least one of the `fullPrimitive` or `primitive` must be set"

    .line 12
    .line 13
    invoke-static {p0}, Ll/phw0;->a(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-object v1

    .line 17
    :cond_1
    :goto_0
    invoke-virtual/range {p3 .. p3}, Lcom/google/android/gms/internal/ads/w4;->U()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    const/4 v2, 0x3

    .line 22
    if-ne v0, v2, :cond_a

    .line 23
    .line 24
    invoke-virtual/range {p3 .. p3}, Lcom/google/android/gms/internal/ads/w4;->L()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual/range {p3 .. p3}, Lcom/google/android/gms/internal/ads/w4;->P()Lcom/google/android/gms/internal/ads/zzgvz;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    sget-object v4, Lcom/google/android/gms/internal/ads/zzgvz;->zzd:Lcom/google/android/gms/internal/ads/zzgvz;

    .line 37
    .line 38
    if-ne v3, v4, :cond_2

    .line 39
    .line 40
    move-object v0, v1

    .line 41
    :cond_2
    invoke-static {}, Ll/j6x0;->d()Ll/j6x0;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    invoke-virtual/range {p3 .. p3}, Lcom/google/android/gms/internal/ads/w4;->M()Lcom/google/android/gms/internal/ads/t4;

    .line 46
    .line 47
    .line 48
    move-result-object v4

    .line 49
    invoke-virtual {v4}, Lcom/google/android/gms/internal/ads/t4;->Q()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v4

    .line 53
    invoke-virtual/range {p3 .. p3}, Lcom/google/android/gms/internal/ads/w4;->M()Lcom/google/android/gms/internal/ads/t4;

    .line 54
    .line 55
    .line 56
    move-result-object v5

    .line 57
    invoke-virtual {v5}, Lcom/google/android/gms/internal/ads/t4;->P()Lcom/google/android/gms/internal/ads/zzgyl;

    .line 58
    .line 59
    .line 60
    move-result-object v5

    .line 61
    invoke-virtual/range {p3 .. p3}, Lcom/google/android/gms/internal/ads/w4;->M()Lcom/google/android/gms/internal/ads/t4;

    .line 62
    .line 63
    .line 64
    move-result-object v6

    .line 65
    invoke-virtual {v6}, Lcom/google/android/gms/internal/ads/t4;->M()Lcom/google/android/gms/internal/ads/zzgus;

    .line 66
    .line 67
    .line 68
    move-result-object v6

    .line 69
    invoke-virtual/range {p3 .. p3}, Lcom/google/android/gms/internal/ads/w4;->P()Lcom/google/android/gms/internal/ads/zzgvz;

    .line 70
    .line 71
    .line 72
    move-result-object v7

    .line 73
    invoke-static {v4, v5, v6, v7, v0}, Ll/c7x0;->a(Ljava/lang/String;Lcom/google/android/gms/internal/ads/zzgyl;Lcom/google/android/gms/internal/ads/zzgus;Lcom/google/android/gms/internal/ads/zzgvz;Ljava/lang/Integer;)Ll/c7x0;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-static {}, Ll/ayw0;->a()Ll/ayw0;

    .line 78
    .line 79
    .line 80
    move-result-object v4

    .line 81
    invoke-virtual {v3, v0, v4}, Ll/j6x0;->b(Ll/c7x0;Ll/ayw0;)Ll/xww0;

    .line 82
    .line 83
    .line 84
    move-result-object v13

    .line 85
    new-instance v5, Ll/oxw0;

    .line 86
    .line 87
    invoke-virtual/range {p3 .. p3}, Lcom/google/android/gms/internal/ads/w4;->P()Lcom/google/android/gms/internal/ads/zzgvz;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    const/4 v3, 0x5

    .line 96
    const/4 v4, 0x1

    .line 97
    if-eq v0, v4, :cond_6

    .line 98
    .line 99
    const/4 v4, 0x2

    .line 100
    if-eq v0, v4, :cond_5

    .line 101
    .line 102
    if-eq v0, v2, :cond_4

    .line 103
    .line 104
    const/4 v2, 0x4

    .line 105
    if-ne v0, v2, :cond_3

    .line 106
    .line 107
    goto :goto_2

    .line 108
    :cond_3
    const-string p0, "unknown output prefix type"

    .line 109
    .line 110
    invoke-static {p0}, Ll/phw0;->a(Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    return-object v1

    .line 114
    :cond_4
    sget-object v0, Ll/oww0;->a:[B

    .line 115
    .line 116
    :goto_1
    move-object v8, v0

    .line 117
    goto :goto_3

    .line 118
    :cond_5
    :goto_2
    invoke-static {v3}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    const/4 v2, 0x0

    .line 123
    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    invoke-virtual/range {p3 .. p3}, Lcom/google/android/gms/internal/ads/w4;->L()I

    .line 128
    .line 129
    .line 130
    move-result v2

    .line 131
    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    goto :goto_1

    .line 140
    :cond_6
    invoke-static {v3}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    invoke-virtual {v0, v4}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    invoke-virtual/range {p3 .. p3}, Lcom/google/android/gms/internal/ads/w4;->L()I

    .line 149
    .line 150
    .line 151
    move-result v2

    .line 152
    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    goto :goto_1

    .line 161
    :goto_3
    invoke-virtual/range {p3 .. p3}, Lcom/google/android/gms/internal/ads/w4;->U()I

    .line 162
    .line 163
    .line 164
    move-result v9

    .line 165
    invoke-virtual/range {p3 .. p3}, Lcom/google/android/gms/internal/ads/w4;->P()Lcom/google/android/gms/internal/ads/zzgvz;

    .line 166
    .line 167
    .line 168
    move-result-object v10

    .line 169
    invoke-virtual/range {p3 .. p3}, Lcom/google/android/gms/internal/ads/w4;->L()I

    .line 170
    .line 171
    .line 172
    move-result v11

    .line 173
    invoke-virtual/range {p3 .. p3}, Lcom/google/android/gms/internal/ads/w4;->M()Lcom/google/android/gms/internal/ads/t4;

    .line 174
    .line 175
    .line 176
    move-result-object v0

    .line 177
    invoke-virtual {v0}, Lcom/google/android/gms/internal/ads/t4;->Q()Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object v12

    .line 181
    move-object v6, p1

    .line 182
    move-object/from16 v7, p2

    .line 183
    .line 184
    invoke-direct/range {v5 .. v13}, Ll/oxw0;-><init>(Ljava/lang/Object;Ljava/lang/Object;[BILcom/google/android/gms/internal/ads/zzgvz;ILjava/lang/String;Ll/xww0;)V

    .line 185
    .line 186
    .line 187
    iget-object v0, p0, Ll/nxw0;->b:Ljava/util/concurrent/ConcurrentMap;

    .line 188
    .line 189
    iget-object v2, p0, Ll/nxw0;->c:Ljava/util/List;

    .line 190
    .line 191
    new-instance v3, Ljava/util/ArrayList;

    .line 192
    .line 193
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 194
    .line 195
    .line 196
    invoke-interface {v3, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 197
    .line 198
    .line 199
    new-instance v4, Ll/qxw0;

    .line 200
    .line 201
    invoke-virtual {v5}, Ll/oxw0;->g()[B

    .line 202
    .line 203
    .line 204
    move-result-object v6

    .line 205
    invoke-direct {v4, v6, v1}, Ll/qxw0;-><init>([BLl/pxw0;)V

    .line 206
    .line 207
    .line 208
    invoke-static {v3}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    .line 209
    .line 210
    .line 211
    move-result-object v3

    .line 212
    invoke-interface {v0, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 213
    .line 214
    .line 215
    move-result-object v3

    .line 216
    check-cast v3, Ljava/util/List;

    .line 217
    .line 218
    if-eqz v3, :cond_7

    .line 219
    .line 220
    new-instance v6, Ljava/util/ArrayList;

    .line 221
    .line 222
    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 223
    .line 224
    .line 225
    invoke-interface {v6, v3}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 226
    .line 227
    .line 228
    invoke-interface {v6, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 229
    .line 230
    .line 231
    invoke-static {v6}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    .line 232
    .line 233
    .line 234
    move-result-object v3

    .line 235
    invoke-interface {v0, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 236
    .line 237
    .line 238
    :cond_7
    invoke-interface {v2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 239
    .line 240
    .line 241
    if-eqz p4, :cond_9

    .line 242
    .line 243
    iget-object v0, p0, Ll/nxw0;->d:Ll/oxw0;

    .line 244
    .line 245
    if-nez v0, :cond_8

    .line 246
    .line 247
    iput-object v5, p0, Ll/nxw0;->d:Ll/oxw0;

    .line 248
    .line 249
    return-object p0

    .line 250
    :cond_8
    const-string p0, "you cannot set two primary primitives"

    .line 251
    .line 252
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 253
    .line 254
    .line 255
    return-object v1

    .line 256
    :cond_9
    return-object p0

    .line 257
    :cond_a
    const-string p0, "only ENABLED key is allowed"

    .line 258
    .line 259
    invoke-static {p0}, Ll/phw0;->a(Ljava/lang/String;)V

    .line 260
    .line 261
    .line 262
    return-object v1

    .line 263
    :cond_b
    const-string p0, "addPrimitive cannot be called after build"

    .line 264
    .line 265
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 266
    .line 267
    .line 268
    return-object v1
.end method
