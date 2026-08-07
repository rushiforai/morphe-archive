.class public final Ll/swg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/hog0;


# static fields
.field public static final synthetic o:Z = true


# instance fields
.field public final a:Ljava/util/concurrent/LinkedBlockingQueue;

.field public final b:Ll/kug0;

.field public volatile c:Z

.field public d:I

.field public final e:Ll/wrg0;

.field public final f:I

.field public g:Ljava/nio/ByteBuffer;

.field public h:Ll/irg0;

.field public i:Ljava/lang/String;

.field public j:Ljava/lang/Integer;

.field public k:Ljava/lang/Boolean;

.field public l:J

.field public final m:Ljava/lang/Object;

.field public n:Ll/qmg0;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Ll/kug0;Ll/wrg0;)V
    .locals 5

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/swg0;->c:Z

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    iput v1, p0, Ll/swg0;->d:I

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    iput-object v2, p0, Ll/swg0;->e:Ll/wrg0;

    .line 12
    .line 13
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    iput-object v3, p0, Ll/swg0;->g:Ljava/nio/ByteBuffer;

    .line 18
    .line 19
    iput-object v2, p0, Ll/swg0;->h:Ll/irg0;

    .line 20
    .line 21
    iput-object v2, p0, Ll/swg0;->i:Ljava/lang/String;

    .line 22
    .line 23
    iput-object v2, p0, Ll/swg0;->j:Ljava/lang/Integer;

    .line 24
    .line 25
    iput-object v2, p0, Ll/swg0;->k:Ljava/lang/Boolean;

    .line 26
    .line 27
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 28
    .line 29
    .line 30
    move-result-wide v2

    .line 31
    iput-wide v2, p0, Ll/swg0;->l:J

    .line 32
    .line 33
    new-instance v2, Ljava/lang/Object;

    .line 34
    .line 35
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 36
    .line 37
    .line 38
    iput-object v2, p0, Ll/swg0;->m:Ljava/lang/Object;

    .line 39
    .line 40
    new-instance v2, Ljava/util/concurrent/LinkedBlockingQueue;

    .line 41
    .line 42
    invoke-direct {v2}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    .line 43
    .line 44
    .line 45
    iput-object v2, p0, Ll/swg0;->a:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 46
    .line 47
    new-instance v2, Ljava/util/concurrent/LinkedBlockingQueue;

    .line 48
    .line 49
    invoke-direct {v2}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    .line 50
    .line 51
    .line 52
    iput-object p1, p0, Ll/swg0;->b:Ll/kug0;

    .line 53
    .line 54
    iput v1, p0, Ll/swg0;->f:I

    .line 55
    .line 56
    new-instance p1, Ljava/util/ArrayList;

    .line 57
    .line 58
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 59
    .line 60
    .line 61
    iget-object v1, p2, Ll/wrg0;->c:Ljava/util/ArrayList;

    .line 62
    .line 63
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    move v3, v0

    .line 68
    :goto_0
    if-ge v3, v2, :cond_0

    .line 69
    .line 70
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v4

    .line 74
    add-int/lit8 v3, v3, 0x1

    .line 75
    .line 76
    check-cast v4, Ll/ykg0;

    .line 77
    .line 78
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 79
    .line 80
    .line 81
    new-instance v4, Ll/ykg0;

    .line 82
    .line 83
    invoke-direct {v4}, Ll/ykg0;-><init>()V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    .line 91
    .line 92
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 93
    .line 94
    .line 95
    iget-object p2, p2, Ll/wrg0;->e:Ljava/util/ArrayList;

    .line 96
    .line 97
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    .line 98
    .line 99
    .line 100
    move-result v2

    .line 101
    :goto_1
    if-ge v0, v2, :cond_1

    .line 102
    .line 103
    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object v3

    .line 107
    add-int/lit8 v0, v0, 0x1

    .line 108
    .line 109
    check-cast v3, Ll/dkg0;

    .line 110
    .line 111
    new-instance v4, Ll/dkg0;

    .line 112
    .line 113
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 114
    .line 115
    .line 116
    invoke-direct {v4}, Ll/dkg0;-><init>()V

    .line 117
    .line 118
    .line 119
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    goto :goto_1

    .line 123
    :cond_1
    new-instance p2, Ll/wrg0;

    .line 124
    .line 125
    invoke-direct {p2, p1, v1}, Ll/wrg0;-><init>(Ljava/util/List;Ljava/util/List;)V

    .line 126
    .line 127
    .line 128
    iput-object p2, p0, Ll/swg0;->e:Ll/wrg0;

    .line 129
    .line 130
    return-void
.end method


# virtual methods
.method public final declared-synchronized a(ILjava/lang/String;Z)V
    .locals 8

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget v0, p0, Ll/swg0;->d:I

    .line 3
    .line 4
    const/4 v1, 0x4

    .line 5
    if-eq v0, v1, :cond_c

    .line 6
    .line 7
    const/4 v2, 0x5

    .line 8
    if-eq v0, v2, :cond_c

    .line 9
    .line 10
    const/4 v2, 0x3

    .line 11
    const/4 v3, 0x0

    .line 12
    if-ne v0, v2, :cond_7

    .line 13
    .line 14
    const/16 v0, 0x3ee

    .line 15
    .line 16
    if-ne p1, v0, :cond_2

    .line 17
    .line 18
    sget-boolean v0, Ll/swg0;->o:Z

    .line 19
    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    if-nez p3, :cond_0

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    new-instance p1, Ljava/lang/AssertionError;

    .line 26
    .line 27
    invoke-direct {p1}, Ljava/lang/AssertionError;-><init>()V

    .line 28
    .line 29
    .line 30
    throw p1

    .line 31
    :catchall_0
    move-exception p1

    .line 32
    goto/16 :goto_7

    .line 33
    .line 34
    :cond_1
    :goto_0
    iput v1, p0, Ll/swg0;->d:I

    .line 35
    .line 36
    invoke-virtual {p0, p1, p2, v3}, Ll/swg0;->d(ILjava/lang/String;Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 37
    .line 38
    .line 39
    monitor-exit p0

    .line 40
    return-void

    .line 41
    :cond_2
    :try_start_1
    iget-object v4, p0, Ll/swg0;->e:Ll/wrg0;

    .line 42
    .line 43
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 44
    .line 45
    .line 46
    if-nez p3, :cond_3

    .line 47
    .line 48
    :try_start_2
    iget-object v4, p0, Ll/swg0;->b:Ll/kug0;

    .line 49
    .line 50
    invoke-virtual {v4, p0, p1, p2}, Ll/kug0;->a(Ll/hog0;ILjava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_1
    .catch LSudthrow/Sudfor; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 51
    .line 52
    .line 53
    goto :goto_1

    .line 54
    :catch_0
    move-exception v2

    .line 55
    goto/16 :goto_3

    .line 56
    .line 57
    :catch_1
    move-exception v4

    .line 58
    :try_start_3
    iget-object v5, p0, Ll/swg0;->b:Ll/kug0;

    .line 59
    .line 60
    invoke-virtual {v5, p0, v4}, Ll/kug0;->a(Ll/hog0;Ljava/lang/Exception;)V

    .line 61
    .line 62
    .line 63
    :cond_3
    :goto_1
    iget v4, p0, Ll/swg0;->d:I

    .line 64
    .line 65
    if-ne v4, v2, :cond_6

    .line 66
    .line 67
    new-instance v2, Ll/xqg0;

    .line 68
    .line 69
    invoke-direct {v2}, Ll/xqg0;-><init>()V

    .line 70
    .line 71
    .line 72
    if-nez p2, :cond_4

    .line 73
    .line 74
    const-string v4, ""

    .line 75
    .line 76
    goto :goto_2

    .line 77
    :cond_4
    move-object v4, p2

    .line 78
    :goto_2
    iput-object v4, v2, Ll/xqg0;->i:Ljava/lang/String;

    .line 79
    .line 80
    sget-object v5, Ll/rrg0;->a:Ljava/nio/charset/CodingErrorAction;
    :try_end_3
    .catch LSudthrow/Sudfor; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 81
    .line 82
    :try_start_4
    const-string v5, "UTF8"

    .line 83
    .line 84
    invoke-virtual {v4, v5}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    .line 85
    .line 86
    .line 87
    move-result-object v4
    :try_end_4
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_4 .. :try_end_4} :catch_3
    .catch LSudthrow/Sudfor; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 88
    :try_start_5
    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 89
    .line 90
    .line 91
    move-result-object v5

    .line 92
    iget v6, v2, Ll/xqg0;->h:I

    .line 93
    .line 94
    invoke-virtual {v5, v6}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 95
    .line 96
    .line 97
    const/4 v6, 0x2

    .line 98
    invoke-virtual {v5, v6}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 99
    .line 100
    .line 101
    array-length v7, v4

    .line 102
    add-int/2addr v7, v6

    .line 103
    invoke-static {v7}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 104
    .line 105
    .line 106
    move-result-object v7

    .line 107
    invoke-virtual {v7, v5}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 108
    .line 109
    .line 110
    invoke-virtual {v7, v4}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 111
    .line 112
    .line 113
    invoke-virtual {v7}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 114
    .line 115
    .line 116
    iput-object v7, v2, Ll/phg0;->c:Ljava/nio/ByteBuffer;

    .line 117
    .line 118
    iput p1, v2, Ll/xqg0;->h:I

    .line 119
    .line 120
    const/16 v4, 0x3f7

    .line 121
    .line 122
    if-ne p1, v4, :cond_5

    .line 123
    .line 124
    const/16 v4, 0x3ed

    .line 125
    .line 126
    iput v4, v2, Ll/xqg0;->h:I

    .line 127
    .line 128
    const-string v4, ""

    .line 129
    .line 130
    iput-object v4, v2, Ll/xqg0;->i:Ljava/lang/String;

    .line 131
    .line 132
    :cond_5
    iget-object v4, v2, Ll/xqg0;->i:Ljava/lang/String;
    :try_end_5
    .catch LSudthrow/Sudfor; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 133
    .line 134
    :try_start_6
    const-string v5, "UTF8"

    .line 135
    .line 136
    invoke-virtual {v4, v5}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    .line 137
    .line 138
    .line 139
    move-result-object v4
    :try_end_6
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_6 .. :try_end_6} :catch_2
    .catch LSudthrow/Sudfor; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 140
    :try_start_7
    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 141
    .line 142
    .line 143
    move-result-object v5

    .line 144
    iget v7, v2, Ll/xqg0;->h:I

    .line 145
    .line 146
    invoke-virtual {v5, v7}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 147
    .line 148
    .line 149
    invoke-virtual {v5, v6}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 150
    .line 151
    .line 152
    array-length v7, v4

    .line 153
    add-int/2addr v7, v6

    .line 154
    invoke-static {v7}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 155
    .line 156
    .line 157
    move-result-object v6

    .line 158
    invoke-virtual {v6, v5}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 159
    .line 160
    .line 161
    invoke-virtual {v6, v4}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 162
    .line 163
    .line 164
    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 165
    .line 166
    .line 167
    iput-object v6, v2, Ll/phg0;->c:Ljava/nio/ByteBuffer;

    .line 168
    .line 169
    invoke-virtual {v2}, Ll/xqg0;->a()V

    .line 170
    .line 171
    .line 172
    invoke-static {v2}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 173
    .line 174
    .line 175
    move-result-object v2

    .line 176
    invoke-virtual {p0, v2}, Ll/swg0;->c(Ljava/util/List;)V

    .line 177
    .line 178
    .line 179
    goto :goto_4

    .line 180
    :catch_2
    move-exception v2

    .line 181
    new-instance v4, Ljava/lang/RuntimeException;

    .line 182
    .line 183
    invoke-direct {v4, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 184
    .line 185
    .line 186
    throw v4

    .line 187
    :catch_3
    move-exception v2

    .line 188
    new-instance v4, Ljava/lang/RuntimeException;

    .line 189
    .line 190
    invoke-direct {v4, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 191
    .line 192
    .line 193
    throw v4
    :try_end_7
    .catch LSudthrow/Sudfor; {:try_start_7 .. :try_end_7} :catch_0
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 194
    :goto_3
    :try_start_8
    iget-object v4, p0, Ll/swg0;->b:Ll/kug0;

    .line 195
    .line 196
    invoke-virtual {v4, p0, v2}, Ll/kug0;->a(Ll/hog0;Ljava/lang/Exception;)V

    .line 197
    .line 198
    .line 199
    const-string v2, "generated frame is invalid"

    .line 200
    .line 201
    invoke-virtual {p0, v0, v2, v3}, Ll/swg0;->d(ILjava/lang/String;Z)V

    .line 202
    .line 203
    .line 204
    :cond_6
    :goto_4
    invoke-virtual {p0, p1, p2, p3}, Ll/swg0;->d(ILjava/lang/String;Z)V

    .line 205
    .line 206
    .line 207
    goto :goto_6

    .line 208
    :cond_7
    const/4 v0, -0x3

    .line 209
    if-ne p1, v0, :cond_a

    .line 210
    .line 211
    sget-boolean p1, Ll/swg0;->o:Z

    .line 212
    .line 213
    if-nez p1, :cond_9

    .line 214
    .line 215
    if-eqz p3, :cond_8

    .line 216
    .line 217
    goto :goto_5

    .line 218
    :cond_8
    new-instance p1, Ljava/lang/AssertionError;

    .line 219
    .line 220
    invoke-direct {p1}, Ljava/lang/AssertionError;-><init>()V

    .line 221
    .line 222
    .line 223
    throw p1

    .line 224
    :cond_9
    :goto_5
    const/4 p1, 0x1

    .line 225
    invoke-virtual {p0, v0, p2, p1}, Ll/swg0;->d(ILjava/lang/String;Z)V

    .line 226
    .line 227
    .line 228
    goto :goto_6

    .line 229
    :cond_a
    const/16 v0, 0x3ea

    .line 230
    .line 231
    if-ne p1, v0, :cond_b

    .line 232
    .line 233
    invoke-virtual {p0, p1, p2, p3}, Ll/swg0;->d(ILjava/lang/String;Z)V

    .line 234
    .line 235
    .line 236
    goto :goto_6

    .line 237
    :cond_b
    const/4 p1, -0x1

    .line 238
    invoke-virtual {p0, p1, p2, v3}, Ll/swg0;->d(ILjava/lang/String;Z)V

    .line 239
    .line 240
    .line 241
    :goto_6
    iput v1, p0, Ll/swg0;->d:I

    .line 242
    .line 243
    const/4 p1, 0x0

    .line 244
    iput-object p1, p0, Ll/swg0;->g:Ljava/nio/ByteBuffer;
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 245
    .line 246
    monitor-exit p0

    .line 247
    return-void

    .line 248
    :cond_c
    monitor-exit p0

    .line 249
    return-void

    .line 250
    :goto_7
    :try_start_9
    monitor-exit p0
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 251
    throw p1
.end method

.method public final a(Ll/ueg0;)V
    .locals 0

    .line 252
    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-virtual {p0, p1}, Ll/swg0;->c(Ljava/util/List;)V

    return-void
.end method

.method public final b(Ljava/nio/ByteBuffer;)V
    .locals 11

    .line 1
    sget-boolean v0, Ll/swg0;->o:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/nio/Buffer;->hasRemaining()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-static {}, Ll/aqg0;->a()V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_1
    :goto_0
    iget v1, p0, Ll/swg0;->d:I

    .line 17
    .line 18
    const/4 v2, 0x4

    .line 19
    const/4 v3, 0x3

    .line 20
    const/4 v4, 0x1

    .line 21
    if-eq v1, v4, :cond_2

    .line 22
    .line 23
    if-ne v1, v3, :cond_13

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Ll/swg0;->f(Ljava/nio/ByteBuffer;)V

    .line 26
    .line 27
    .line 28
    goto/16 :goto_9

    .line 29
    .line 30
    :cond_2
    const-string v1, "draft "

    .line 31
    .line 32
    iget-object v5, p0, Ll/swg0;->g:Ljava/nio/ByteBuffer;

    .line 33
    .line 34
    invoke-virtual {v5}, Ljava/nio/Buffer;->capacity()I

    .line 35
    .line 36
    .line 37
    move-result v5

    .line 38
    if-nez v5, :cond_3

    .line 39
    .line 40
    move-object v5, p1

    .line 41
    goto :goto_1

    .line 42
    :cond_3
    iget-object v5, p0, Ll/swg0;->g:Ljava/nio/ByteBuffer;

    .line 43
    .line 44
    invoke-virtual {v5}, Ljava/nio/Buffer;->remaining()I

    .line 45
    .line 46
    .line 47
    move-result v5

    .line 48
    invoke-virtual {p1}, Ljava/nio/Buffer;->remaining()I

    .line 49
    .line 50
    .line 51
    move-result v6

    .line 52
    if-ge v5, v6, :cond_4

    .line 53
    .line 54
    iget-object v5, p0, Ll/swg0;->g:Ljava/nio/ByteBuffer;

    .line 55
    .line 56
    invoke-virtual {v5}, Ljava/nio/Buffer;->capacity()I

    .line 57
    .line 58
    .line 59
    move-result v5

    .line 60
    invoke-virtual {p1}, Ljava/nio/Buffer;->remaining()I

    .line 61
    .line 62
    .line 63
    move-result v6

    .line 64
    add-int/2addr v6, v5

    .line 65
    invoke-static {v6}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 66
    .line 67
    .line 68
    move-result-object v5

    .line 69
    iget-object v6, p0, Ll/swg0;->g:Ljava/nio/ByteBuffer;

    .line 70
    .line 71
    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 72
    .line 73
    .line 74
    iget-object v6, p0, Ll/swg0;->g:Ljava/nio/ByteBuffer;

    .line 75
    .line 76
    invoke-virtual {v5, v6}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 77
    .line 78
    .line 79
    iput-object v5, p0, Ll/swg0;->g:Ljava/nio/ByteBuffer;

    .line 80
    .line 81
    :cond_4
    iget-object v5, p0, Ll/swg0;->g:Ljava/nio/ByteBuffer;

    .line 82
    .line 83
    invoke-virtual {v5, p1}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 84
    .line 85
    .line 86
    iget-object v5, p0, Ll/swg0;->g:Ljava/nio/ByteBuffer;

    .line 87
    .line 88
    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 89
    .line 90
    .line 91
    iget-object v5, p0, Ll/swg0;->g:Ljava/nio/ByteBuffer;

    .line 92
    .line 93
    :goto_1
    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->mark()Ljava/nio/Buffer;

    .line 94
    .line 95
    .line 96
    const/4 v6, 0x0

    .line 97
    :try_start_0
    iget v7, p0, Ll/swg0;->f:I
    :try_end_0
    .catch LSudthrow/Sudnew; {:try_start_0 .. :try_end_0} :catch_1
    .catch LSudthrow/Sudif; {:try_start_0 .. :try_end_0} :catch_0

    .line 98
    .line 99
    const/4 v8, 0x2

    .line 100
    const-string v9, "wrong http function"

    .line 101
    .line 102
    const/16 v10, 0x3ea

    .line 103
    .line 104
    if-ne v7, v8, :cond_7

    .line 105
    .line 106
    :try_start_1
    iget-object v1, p0, Ll/swg0;->e:Ll/wrg0;
    :try_end_1
    .catch LSudthrow/Sudnew; {:try_start_1 .. :try_end_1} :catch_1
    .catch LSudthrow/Sudif; {:try_start_1 .. :try_end_1} :catch_0

    .line 107
    .line 108
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 109
    .line 110
    .line 111
    :try_start_2
    invoke-virtual {v1, v5}, Ll/okg0;->b(Ljava/nio/ByteBuffer;)Ll/mwg0;

    .line 112
    .line 113
    .line 114
    move-result-object v1

    .line 115
    instance-of v7, v1, Ll/xjg0;

    .line 116
    .line 117
    if-nez v7, :cond_5

    .line 118
    .line 119
    invoke-virtual {p0, v10, v9, v6}, Ll/swg0;->d(ILjava/lang/String;Z)V

    .line 120
    .line 121
    .line 122
    goto/16 :goto_9

    .line 123
    .line 124
    :catch_0
    move-exception v0

    .line 125
    goto/16 :goto_7

    .line 126
    .line 127
    :catch_1
    move-exception v0

    .line 128
    goto/16 :goto_6

    .line 129
    .line 130
    :cond_5
    check-cast v1, Ll/xjg0;

    .line 131
    .line 132
    iget-object v7, p0, Ll/swg0;->e:Ll/wrg0;

    .line 133
    .line 134
    invoke-virtual {v7, v1}, Ll/wrg0;->c(Ll/xjg0;)I

    .line 135
    .line 136
    .line 137
    move-result v7

    .line 138
    if-ne v7, v4, :cond_6

    .line 139
    .line 140
    iput v3, p0, Ll/swg0;->d:I
    :try_end_2
    .catch LSudthrow/Sudnew; {:try_start_2 .. :try_end_2} :catch_1
    .catch LSudthrow/Sudif; {:try_start_2 .. :try_end_2} :catch_0

    .line 141
    .line 142
    :try_start_3
    iget-object v3, p0, Ll/swg0;->b:Ll/kug0;

    .line 143
    .line 144
    invoke-virtual {v3, p0, v1}, Ll/kug0;->a(Ll/hog0;Ll/cug0;)V
    :try_end_3
    .catch Ljava/lang/RuntimeException; {:try_start_3 .. :try_end_3} :catch_2
    .catch LSudthrow/Sudnew; {:try_start_3 .. :try_end_3} :catch_1

    .line 145
    .line 146
    .line 147
    goto :goto_2

    .line 148
    :catch_2
    move-exception v1

    .line 149
    :try_start_4
    iget-object v3, p0, Ll/swg0;->b:Ll/kug0;

    .line 150
    .line 151
    invoke-virtual {v3, p0, v1}, Ll/kug0;->a(Ll/hog0;Ljava/lang/Exception;)V

    .line 152
    .line 153
    .line 154
    goto :goto_2

    .line 155
    :cond_6
    const-string v0, "the handshake did finaly not match"

    .line 156
    .line 157
    invoke-virtual {p0, v10, v0, v6}, Ll/swg0;->a(ILjava/lang/String;Z)V

    .line 158
    .line 159
    .line 160
    goto/16 :goto_9

    .line 161
    .line 162
    :cond_7
    if-ne v7, v4, :cond_13

    .line 163
    .line 164
    iget-object v8, p0, Ll/swg0;->e:Ll/wrg0;

    .line 165
    .line 166
    iput v7, v8, Ll/okg0;->a:I

    .line 167
    .line 168
    invoke-virtual {v8, v5}, Ll/okg0;->b(Ljava/nio/ByteBuffer;)Ll/mwg0;

    .line 169
    .line 170
    .line 171
    move-result-object v7

    .line 172
    instance-of v8, v7, Ll/gzg0;

    .line 173
    .line 174
    if-nez v8, :cond_8

    .line 175
    .line 176
    invoke-virtual {p0, v10, v9, v6}, Ll/swg0;->d(ILjava/lang/String;Z)V

    .line 177
    .line 178
    .line 179
    goto/16 :goto_9

    .line 180
    .line 181
    :cond_8
    check-cast v7, Ll/gzg0;

    .line 182
    .line 183
    iget-object v8, p0, Ll/swg0;->e:Ll/wrg0;

    .line 184
    .line 185
    iget-object v9, p0, Ll/swg0;->h:Ll/irg0;

    .line 186
    .line 187
    invoke-virtual {v8, v9, v7}, Ll/wrg0;->d(Ll/irg0;Ll/gzg0;)I

    .line 188
    .line 189
    .line 190
    move-result v8
    :try_end_4
    .catch LSudthrow/Sudnew; {:try_start_4 .. :try_end_4} :catch_1
    .catch LSudthrow/Sudif; {:try_start_4 .. :try_end_4} :catch_0

    .line 191
    if-ne v8, v4, :cond_e

    .line 192
    .line 193
    :try_start_5
    iget-object v1, p0, Ll/swg0;->b:Ll/kug0;

    .line 194
    .line 195
    iget-object v4, p0, Ll/swg0;->h:Ll/irg0;

    .line 196
    .line 197
    invoke-virtual {v1, p0, v4, v7}, Ll/kug0;->a(Ll/hog0;Ll/xjg0;Ll/gzg0;)V
    :try_end_5
    .catch LSudthrow/Sudfor; {:try_start_5 .. :try_end_5} :catch_5
    .catch Ljava/lang/RuntimeException; {:try_start_5 .. :try_end_5} :catch_4

    .line 198
    .line 199
    .line 200
    :try_start_6
    iput v3, p0, Ll/swg0;->d:I
    :try_end_6
    .catch LSudthrow/Sudnew; {:try_start_6 .. :try_end_6} :catch_1
    .catch LSudthrow/Sudif; {:try_start_6 .. :try_end_6} :catch_0

    .line 201
    .line 202
    :try_start_7
    iget-object v1, p0, Ll/swg0;->b:Ll/kug0;

    .line 203
    .line 204
    invoke-virtual {v1, p0, v7}, Ll/kug0;->a(Ll/hog0;Ll/cug0;)V
    :try_end_7
    .catch Ljava/lang/RuntimeException; {:try_start_7 .. :try_end_7} :catch_3
    .catch LSudthrow/Sudnew; {:try_start_7 .. :try_end_7} :catch_1

    .line 205
    .line 206
    .line 207
    goto :goto_2

    .line 208
    :catch_3
    move-exception v1

    .line 209
    :try_start_8
    iget-object v3, p0, Ll/swg0;->b:Ll/kug0;

    .line 210
    .line 211
    invoke-virtual {v3, p0, v1}, Ll/kug0;->a(Ll/hog0;Ljava/lang/Exception;)V
    :try_end_8
    .catch LSudthrow/Sudnew; {:try_start_8 .. :try_end_8} :catch_1
    .catch LSudthrow/Sudif; {:try_start_8 .. :try_end_8} :catch_0

    .line 212
    .line 213
    .line 214
    :goto_2
    iget v1, p0, Ll/swg0;->d:I

    .line 215
    .line 216
    if-ne v1, v2, :cond_9

    .line 217
    .line 218
    goto/16 :goto_9

    .line 219
    .line 220
    :cond_9
    const/4 v3, 0x5

    .line 221
    if-ne v1, v3, :cond_a

    .line 222
    .line 223
    goto/16 :goto_9

    .line 224
    .line 225
    :cond_a
    if-nez v0, :cond_c

    .line 226
    .line 227
    iget-object v0, p0, Ll/swg0;->g:Ljava/nio/ByteBuffer;

    .line 228
    .line 229
    invoke-virtual {v0}, Ljava/nio/Buffer;->hasRemaining()Z

    .line 230
    .line 231
    .line 232
    move-result v0

    .line 233
    invoke-virtual {p1}, Ljava/nio/Buffer;->hasRemaining()Z

    .line 234
    .line 235
    .line 236
    move-result v1

    .line 237
    if-ne v0, v1, :cond_c

    .line 238
    .line 239
    invoke-virtual {p1}, Ljava/nio/Buffer;->hasRemaining()Z

    .line 240
    .line 241
    .line 242
    move-result v0

    .line 243
    if-nez v0, :cond_b

    .line 244
    .line 245
    goto :goto_3

    .line 246
    :cond_b
    invoke-static {}, Ll/aqg0;->a()V

    .line 247
    .line 248
    .line 249
    return-void

    .line 250
    :cond_c
    :goto_3
    invoke-virtual {p1}, Ljava/nio/Buffer;->hasRemaining()Z

    .line 251
    .line 252
    .line 253
    move-result v0

    .line 254
    if-eqz v0, :cond_d

    .line 255
    .line 256
    invoke-virtual {p0, p1}, Ll/swg0;->f(Ljava/nio/ByteBuffer;)V

    .line 257
    .line 258
    .line 259
    goto/16 :goto_9

    .line 260
    .line 261
    :cond_d
    iget-object v0, p0, Ll/swg0;->g:Ljava/nio/ByteBuffer;

    .line 262
    .line 263
    invoke-virtual {v0}, Ljava/nio/Buffer;->hasRemaining()Z

    .line 264
    .line 265
    .line 266
    move-result v0

    .line 267
    if-eqz v0, :cond_13

    .line 268
    .line 269
    iget-object v0, p0, Ll/swg0;->g:Ljava/nio/ByteBuffer;

    .line 270
    .line 271
    invoke-virtual {p0, v0}, Ll/swg0;->f(Ljava/nio/ByteBuffer;)V

    .line 272
    .line 273
    .line 274
    goto/16 :goto_9

    .line 275
    .line 276
    :catch_4
    move-exception v0

    .line 277
    goto :goto_4

    .line 278
    :catch_5
    move-exception v0

    .line 279
    goto :goto_5

    .line 280
    :goto_4
    :try_start_9
    iget-object v1, p0, Ll/swg0;->b:Ll/kug0;

    .line 281
    .line 282
    invoke-virtual {v1, p0, v0}, Ll/kug0;->a(Ll/hog0;Ljava/lang/Exception;)V

    .line 283
    .line 284
    .line 285
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 286
    .line 287
    .line 288
    move-result-object v0

    .line 289
    const/4 v1, -0x1

    .line 290
    invoke-virtual {p0, v1, v0, v6}, Ll/swg0;->d(ILjava/lang/String;Z)V

    .line 291
    .line 292
    .line 293
    goto :goto_9

    .line 294
    :goto_5
    iget v1, v0, LSudthrow/Sudfor;->Suddo:I

    .line 295
    .line 296
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 297
    .line 298
    .line 299
    move-result-object v0

    .line 300
    invoke-virtual {p0, v1, v0, v6}, Ll/swg0;->d(ILjava/lang/String;Z)V

    .line 301
    .line 302
    .line 303
    goto :goto_9

    .line 304
    :cond_e
    new-instance v0, Ljava/lang/StringBuilder;

    .line 305
    .line 306
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 307
    .line 308
    .line 309
    iget-object v1, p0, Ll/swg0;->e:Ll/wrg0;

    .line 310
    .line 311
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 312
    .line 313
    .line 314
    const-string v1, " refuses handshake"

    .line 315
    .line 316
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 317
    .line 318
    .line 319
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 320
    .line 321
    .line 322
    move-result-object v0

    .line 323
    invoke-virtual {p0, v10, v0, v6}, Ll/swg0;->a(ILjava/lang/String;Z)V
    :try_end_9
    .catch LSudthrow/Sudnew; {:try_start_9 .. :try_end_9} :catch_1
    .catch LSudthrow/Sudif; {:try_start_9 .. :try_end_9} :catch_0

    .line 324
    .line 325
    .line 326
    goto :goto_9

    .line 327
    :goto_6
    :try_start_a
    iget v1, v0, LSudthrow/Sudfor;->Suddo:I

    .line 328
    .line 329
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 330
    .line 331
    .line 332
    move-result-object v0

    .line 333
    invoke-virtual {p0, v1, v0, v6}, Ll/swg0;->a(ILjava/lang/String;Z)V
    :try_end_a
    .catch LSudthrow/Sudif; {:try_start_a .. :try_end_a} :catch_0

    .line 334
    .line 335
    .line 336
    goto :goto_9

    .line 337
    :goto_7
    iget-object v1, p0, Ll/swg0;->g:Ljava/nio/ByteBuffer;

    .line 338
    .line 339
    invoke-virtual {v1}, Ljava/nio/Buffer;->capacity()I

    .line 340
    .line 341
    .line 342
    move-result v1

    .line 343
    if-nez v1, :cond_12

    .line 344
    .line 345
    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->reset()Ljava/nio/Buffer;

    .line 346
    .line 347
    .line 348
    iget v0, v0, LSudthrow/Sudif;->Suddo:I

    .line 349
    .line 350
    if-nez v0, :cond_f

    .line 351
    .line 352
    invoke-virtual {v5}, Ljava/nio/Buffer;->capacity()I

    .line 353
    .line 354
    .line 355
    move-result v0

    .line 356
    add-int/lit8 v0, v0, 0x10

    .line 357
    .line 358
    goto :goto_8

    .line 359
    :cond_f
    sget-boolean v1, Ll/swg0;->o:Z

    .line 360
    .line 361
    if-nez v1, :cond_11

    .line 362
    .line 363
    invoke-virtual {v5}, Ljava/nio/Buffer;->remaining()I

    .line 364
    .line 365
    .line 366
    move-result v1

    .line 367
    if-lt v0, v1, :cond_10

    .line 368
    .line 369
    goto :goto_8

    .line 370
    :cond_10
    invoke-static {}, Ll/aqg0;->a()V

    .line 371
    .line 372
    .line 373
    return-void

    .line 374
    :cond_11
    :goto_8
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 375
    .line 376
    .line 377
    move-result-object v0

    .line 378
    iput-object v0, p0, Ll/swg0;->g:Ljava/nio/ByteBuffer;

    .line 379
    .line 380
    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 381
    .line 382
    .line 383
    goto :goto_9

    .line 384
    :cond_12
    iget-object v0, p0, Ll/swg0;->g:Ljava/nio/ByteBuffer;

    .line 385
    .line 386
    invoke-virtual {v0}, Ljava/nio/Buffer;->limit()I

    .line 387
    .line 388
    .line 389
    move-result v1

    .line 390
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 391
    .line 392
    .line 393
    iget-object v0, p0, Ll/swg0;->g:Ljava/nio/ByteBuffer;

    .line 394
    .line 395
    invoke-virtual {v0}, Ljava/nio/Buffer;->capacity()I

    .line 396
    .line 397
    .line 398
    move-result v1

    .line 399
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 400
    .line 401
    .line 402
    :cond_13
    :goto_9
    sget-boolean v0, Ll/swg0;->o:Z

    .line 403
    .line 404
    if-nez v0, :cond_16

    .line 405
    .line 406
    iget v0, p0, Ll/swg0;->d:I

    .line 407
    .line 408
    if-ne v0, v2, :cond_14

    .line 409
    .line 410
    goto :goto_a

    .line 411
    :cond_14
    iget-boolean p0, p0, Ll/swg0;->c:Z

    .line 412
    .line 413
    if-nez p0, :cond_16

    .line 414
    .line 415
    invoke-virtual {p1}, Ljava/nio/Buffer;->hasRemaining()Z

    .line 416
    .line 417
    .line 418
    move-result p0

    .line 419
    if-nez p0, :cond_15

    .line 420
    .line 421
    goto :goto_a

    .line 422
    :cond_15
    invoke-static {}, Ll/aqg0;->a()V

    .line 423
    .line 424
    .line 425
    :cond_16
    :goto_a
    return-void
.end method

.method public final c(Ljava/util/List;)V
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget v1, v0, Ll/swg0;->d:I

    .line 4
    .line 5
    const/4 v2, 0x3

    .line 6
    if-ne v1, v2, :cond_19

    .line 7
    .line 8
    if-eqz p1, :cond_18

    .line 9
    .line 10
    new-instance v1, Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-interface/range {p1 .. p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 20
    .line 21
    .line 22
    move-result v4

    .line 23
    if-eqz v4, :cond_17

    .line 24
    .line 25
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v4

    .line 29
    check-cast v4, Ll/ueg0;

    .line 30
    .line 31
    iget-object v5, v0, Ll/swg0;->e:Ll/wrg0;

    .line 32
    .line 33
    iget-object v6, v5, Ll/wrg0;->b:Ll/ykg0;

    .line 34
    .line 35
    invoke-interface {v4}, Ll/ueg0;->d()Ljava/nio/ByteBuffer;

    .line 36
    .line 37
    .line 38
    move-result-object v6

    .line 39
    iget v7, v5, Ll/okg0;->a:I

    .line 40
    .line 41
    const/4 v8, 0x0

    .line 42
    const/4 v9, 0x1

    .line 43
    if-ne v7, v9, :cond_0

    .line 44
    .line 45
    move v7, v9

    .line 46
    goto :goto_1

    .line 47
    :cond_0
    move v7, v8

    .line 48
    :goto_1
    invoke-virtual {v6}, Ljava/nio/Buffer;->remaining()I

    .line 49
    .line 50
    .line 51
    move-result v10

    .line 52
    const/16 v11, 0x7d

    .line 53
    .line 54
    const/4 v12, 0x2

    .line 55
    const/16 v13, 0x8

    .line 56
    .line 57
    if-gt v10, v11, :cond_1

    .line 58
    .line 59
    move v10, v9

    .line 60
    goto :goto_2

    .line 61
    :cond_1
    invoke-virtual {v6}, Ljava/nio/Buffer;->remaining()I

    .line 62
    .line 63
    .line 64
    move-result v10

    .line 65
    const v11, 0xffff

    .line 66
    .line 67
    .line 68
    if-gt v10, v11, :cond_2

    .line 69
    .line 70
    move v10, v12

    .line 71
    goto :goto_2

    .line 72
    :cond_2
    move v10, v13

    .line 73
    :goto_2
    if-le v10, v9, :cond_3

    .line 74
    .line 75
    add-int/lit8 v11, v10, 0x1

    .line 76
    .line 77
    goto :goto_3

    .line 78
    :cond_3
    move v11, v10

    .line 79
    :goto_3
    add-int/2addr v11, v9

    .line 80
    const/4 v14, 0x4

    .line 81
    if-eqz v7, :cond_4

    .line 82
    .line 83
    move v15, v14

    .line 84
    goto :goto_4

    .line 85
    :cond_4
    move v15, v8

    .line 86
    :goto_4
    add-int/2addr v11, v15

    .line 87
    invoke-virtual {v6}, Ljava/nio/Buffer;->remaining()I

    .line 88
    .line 89
    .line 90
    move-result v15

    .line 91
    add-int/2addr v15, v11

    .line 92
    invoke-static {v15}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 93
    .line 94
    .line 95
    move-result-object v11

    .line 96
    check-cast v4, Ll/phg0;

    .line 97
    .line 98
    iget v15, v4, Ll/phg0;->b:I

    .line 99
    .line 100
    if-ne v15, v9, :cond_5

    .line 101
    .line 102
    move v2, v8

    .line 103
    goto :goto_5

    .line 104
    :cond_5
    if-ne v15, v12, :cond_6

    .line 105
    .line 106
    move v2, v9

    .line 107
    goto :goto_5

    .line 108
    :cond_6
    if-ne v15, v2, :cond_7

    .line 109
    .line 110
    move v2, v12

    .line 111
    goto :goto_5

    .line 112
    :cond_7
    const/4 v2, 0x6

    .line 113
    if-ne v15, v2, :cond_8

    .line 114
    .line 115
    move v2, v13

    .line 116
    goto :goto_5

    .line 117
    :cond_8
    if-ne v15, v14, :cond_9

    .line 118
    .line 119
    const/16 v2, 0x9

    .line 120
    .line 121
    goto :goto_5

    .line 122
    :cond_9
    const/4 v2, 0x5

    .line 123
    if-ne v15, v2, :cond_16

    .line 124
    .line 125
    const/16 v2, 0xa

    .line 126
    .line 127
    :goto_5
    iget-boolean v4, v4, Ll/phg0;->a:Z

    .line 128
    .line 129
    if-eqz v4, :cond_a

    .line 130
    .line 131
    const/16 v4, -0x80

    .line 132
    .line 133
    goto :goto_6

    .line 134
    :cond_a
    move v4, v8

    .line 135
    :goto_6
    int-to-byte v4, v4

    .line 136
    or-int/2addr v2, v4

    .line 137
    int-to-byte v2, v2

    .line 138
    invoke-virtual {v11, v2}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 139
    .line 140
    .line 141
    invoke-virtual {v6}, Ljava/nio/Buffer;->remaining()I

    .line 142
    .line 143
    .line 144
    move-result v2

    .line 145
    move/from16 p1, v14

    .line 146
    .line 147
    int-to-long v14, v2

    .line 148
    new-array v2, v10, [B

    .line 149
    .line 150
    mul-int/lit8 v16, v10, 0x8

    .line 151
    .line 152
    add-int/lit8 v16, v16, -0x8

    .line 153
    .line 154
    move v4, v8

    .line 155
    :goto_7
    if-ge v4, v10, :cond_b

    .line 156
    .line 157
    mul-int/lit8 v17, v4, 0x8

    .line 158
    .line 159
    sub-int v17, v16, v17

    .line 160
    .line 161
    move-wide/from16 v18, v14

    .line 162
    .line 163
    ushr-long v13, v18, v17

    .line 164
    .line 165
    long-to-int v13, v13

    .line 166
    int-to-byte v13, v13

    .line 167
    aput-byte v13, v2, v4

    .line 168
    .line 169
    add-int/lit8 v4, v4, 0x1

    .line 170
    .line 171
    move-wide/from16 v14, v18

    .line 172
    .line 173
    const/16 v13, 0x8

    .line 174
    .line 175
    goto :goto_7

    .line 176
    :cond_b
    if-ne v10, v9, :cond_d

    .line 177
    .line 178
    aget-byte v2, v2, v8

    .line 179
    .line 180
    if-eqz v7, :cond_c

    .line 181
    .line 182
    const/16 v15, -0x80

    .line 183
    .line 184
    goto :goto_8

    .line 185
    :cond_c
    move v15, v8

    .line 186
    :goto_8
    or-int/2addr v2, v15

    .line 187
    int-to-byte v2, v2

    .line 188
    invoke-virtual {v11, v2}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 189
    .line 190
    .line 191
    goto :goto_b

    .line 192
    :cond_d
    if-ne v10, v12, :cond_f

    .line 193
    .line 194
    if-eqz v7, :cond_e

    .line 195
    .line 196
    const/16 v15, -0x80

    .line 197
    .line 198
    goto :goto_9

    .line 199
    :cond_e
    move v15, v8

    .line 200
    :goto_9
    or-int/lit8 v4, v15, 0x7e

    .line 201
    .line 202
    int-to-byte v4, v4

    .line 203
    invoke-virtual {v11, v4}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 204
    .line 205
    .line 206
    invoke-virtual {v11, v2}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 207
    .line 208
    .line 209
    goto :goto_b

    .line 210
    :cond_f
    const/16 v4, 0x8

    .line 211
    .line 212
    if-ne v10, v4, :cond_15

    .line 213
    .line 214
    if-eqz v7, :cond_10

    .line 215
    .line 216
    const/16 v15, -0x80

    .line 217
    .line 218
    goto :goto_a

    .line 219
    :cond_10
    move v15, v8

    .line 220
    :goto_a
    or-int/lit8 v4, v15, 0x7f

    .line 221
    .line 222
    int-to-byte v4, v4

    .line 223
    invoke-virtual {v11, v4}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 224
    .line 225
    .line 226
    invoke-virtual {v11, v2}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 227
    .line 228
    .line 229
    :goto_b
    if-eqz v7, :cond_11

    .line 230
    .line 231
    invoke-static/range {p1 .. p1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 232
    .line 233
    .line 234
    move-result-object v2

    .line 235
    iget-object v4, v5, Ll/wrg0;->i:Ljava/util/Random;

    .line 236
    .line 237
    invoke-virtual {v4}, Ljava/util/Random;->nextInt()I

    .line 238
    .line 239
    .line 240
    move-result v4

    .line 241
    invoke-virtual {v2, v4}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 242
    .line 243
    .line 244
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->array()[B

    .line 245
    .line 246
    .line 247
    move-result-object v4

    .line 248
    invoke-virtual {v11, v4}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 249
    .line 250
    .line 251
    :goto_c
    invoke-virtual {v6}, Ljava/nio/Buffer;->hasRemaining()Z

    .line 252
    .line 253
    .line 254
    move-result v4

    .line 255
    if-eqz v4, :cond_12

    .line 256
    .line 257
    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->get()B

    .line 258
    .line 259
    .line 260
    move-result v4

    .line 261
    rem-int/lit8 v5, v8, 0x4

    .line 262
    .line 263
    invoke-virtual {v2, v5}, Ljava/nio/ByteBuffer;->get(I)B

    .line 264
    .line 265
    .line 266
    move-result v5

    .line 267
    xor-int/2addr v4, v5

    .line 268
    int-to-byte v4, v4

    .line 269
    invoke-virtual {v11, v4}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 270
    .line 271
    .line 272
    add-int/2addr v8, v9

    .line 273
    goto :goto_c

    .line 274
    :cond_11
    invoke-virtual {v11, v6}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 275
    .line 276
    .line 277
    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 278
    .line 279
    .line 280
    :cond_12
    sget-boolean v2, Ll/wrg0;->j:Z

    .line 281
    .line 282
    if-nez v2, :cond_14

    .line 283
    .line 284
    invoke-virtual {v11}, Ljava/nio/Buffer;->remaining()I

    .line 285
    .line 286
    .line 287
    move-result v2

    .line 288
    if-nez v2, :cond_13

    .line 289
    .line 290
    goto :goto_d

    .line 291
    :cond_13
    new-instance v0, Ljava/lang/AssertionError;

    .line 292
    .line 293
    invoke-virtual {v11}, Ljava/nio/Buffer;->remaining()I

    .line 294
    .line 295
    .line 296
    move-result v1

    .line 297
    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(I)V

    .line 298
    .line 299
    .line 300
    throw v0

    .line 301
    :cond_14
    :goto_d
    invoke-virtual {v11}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 302
    .line 303
    .line 304
    invoke-virtual {v1, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 305
    .line 306
    .line 307
    const/4 v2, 0x3

    .line 308
    goto/16 :goto_0

    .line 309
    .line 310
    :cond_15
    const-string v0, "Size representation not supported/specified"

    .line 311
    .line 312
    invoke-static {v0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 313
    .line 314
    .line 315
    return-void

    .line 316
    :cond_16
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 317
    .line 318
    packed-switch v15, :pswitch_data_0

    .line 319
    .line 320
    .line 321
    const/4 v0, 0x0

    .line 322
    throw v0

    .line 323
    :pswitch_0
    const-string v1, "CLOSING"

    .line 324
    .line 325
    goto :goto_e

    .line 326
    :pswitch_1
    const-string v1, "PONG"

    .line 327
    .line 328
    goto :goto_e

    .line 329
    :pswitch_2
    const-string v1, "PING"

    .line 330
    .line 331
    goto :goto_e

    .line 332
    :pswitch_3
    const-string v1, "BINARY"

    .line 333
    .line 334
    goto :goto_e

    .line 335
    :pswitch_4
    const-string v1, "TEXT"

    .line 336
    .line 337
    goto :goto_e

    .line 338
    :pswitch_5
    const-string v1, "CONTINUOUS"

    .line 339
    .line 340
    :goto_e
    const-string v2, "Don\'t know how to handle "

    .line 341
    .line 342
    invoke-virtual {v2, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 343
    .line 344
    .line 345
    move-result-object v1

    .line 346
    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 347
    .line 348
    .line 349
    throw v0

    .line 350
    :cond_17
    invoke-virtual {v0, v1}, Ll/swg0;->g(Ljava/util/List;)V

    .line 351
    .line 352
    .line 353
    return-void

    .line 354
    :cond_18
    invoke-static {}, Ll/fig0;->a()V

    .line 355
    .line 356
    .line 357
    return-void

    .line 358
    :cond_19
    new-instance v0, LSudthrow/Sudcase;

    .line 359
    .line 360
    invoke-direct {v0}, LSudthrow/Sudcase;-><init>()V

    .line 361
    .line 362
    .line 363
    throw v0

    .line 364
    nop

    .line 365
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final declared-synchronized d(ILjava/lang/String;Z)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Ll/swg0;->c:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    monitor-exit p0

    .line 7
    return-void

    .line 8
    :cond_0
    :try_start_1
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p0, Ll/swg0;->j:Ljava/lang/Integer;

    .line 13
    .line 14
    iput-object p2, p0, Ll/swg0;->i:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object v0, p0, Ll/swg0;->k:Ljava/lang/Boolean;

    .line 21
    .line 22
    const/4 v0, 0x1

    .line 23
    iput-boolean v0, p0, Ll/swg0;->c:Z

    .line 24
    .line 25
    iget-object v0, p0, Ll/swg0;->b:Ll/kug0;

    .line 26
    .line 27
    invoke-virtual {v0, p0}, Ll/kug0;->a(Ll/hog0;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 28
    .line 29
    .line 30
    :try_start_2
    iget-object v0, p0, Ll/swg0;->b:Ll/kug0;

    .line 31
    .line 32
    invoke-virtual {v0, p0, p1, p2, p3}, Ll/kug0;->b(Ll/hog0;ILjava/lang/String;Z)V
    :try_end_2
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :catchall_0
    move-exception p1

    .line 37
    goto :goto_1

    .line 38
    :catch_0
    move-exception p1

    .line 39
    :try_start_3
    iget-object p2, p0, Ll/swg0;->b:Ll/kug0;

    .line 40
    .line 41
    invoke-virtual {p2, p0, p1}, Ll/kug0;->a(Ll/hog0;Ljava/lang/Exception;)V

    .line 42
    .line 43
    .line 44
    :goto_0
    iget-object p1, p0, Ll/swg0;->e:Ll/wrg0;

    .line 45
    .line 46
    const/4 p2, 0x0

    .line 47
    if-eqz p1, :cond_1

    .line 48
    .line 49
    iput-object p2, p1, Ll/wrg0;->h:Ljava/nio/ByteBuffer;

    .line 50
    .line 51
    new-instance p3, Ll/ykg0;

    .line 52
    .line 53
    invoke-direct {p3}, Ll/ykg0;-><init>()V

    .line 54
    .line 55
    .line 56
    iput-object p3, p1, Ll/wrg0;->b:Ll/ykg0;

    .line 57
    .line 58
    iput-object p2, p1, Ll/wrg0;->d:Ll/dkg0;

    .line 59
    .line 60
    :cond_1
    iput-object p2, p0, Ll/swg0;->h:Ll/irg0;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 61
    .line 62
    monitor-exit p0

    .line 63
    return-void

    .line 64
    :goto_1
    :try_start_4
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 65
    throw p1
.end method

.method public final declared-synchronized e(ILjava/lang/String;Z)V
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget v0, p0, Ll/swg0;->d:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    const/4 v1, 0x5

    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    monitor-exit p0

    .line 8
    return-void

    .line 9
    :cond_0
    const/4 v2, 0x3

    .line 10
    if-ne v0, v2, :cond_1

    .line 11
    .line 12
    const/16 v0, 0x3ee

    .line 13
    .line 14
    if-ne p1, v0, :cond_1

    .line 15
    .line 16
    const/4 v0, 0x4

    .line 17
    :try_start_1
    iput v0, p0, Ll/swg0;->d:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception p1

    .line 21
    goto :goto_2

    .line 22
    :cond_1
    :goto_0
    :try_start_2
    iget-object v0, p0, Ll/swg0;->b:Ll/kug0;

    .line 23
    .line 24
    invoke-virtual {v0, p0, p1, p2, p3}, Ll/kug0;->a(Ll/hog0;ILjava/lang/String;Z)V
    :try_end_2
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 25
    .line 26
    .line 27
    goto :goto_1

    .line 28
    :catch_0
    move-exception p1

    .line 29
    :try_start_3
    iget-object p2, p0, Ll/swg0;->b:Ll/kug0;

    .line 30
    .line 31
    invoke-virtual {p2, p0, p1}, Ll/kug0;->a(Ll/hog0;Ljava/lang/Exception;)V

    .line 32
    .line 33
    .line 34
    :goto_1
    iget-object p1, p0, Ll/swg0;->e:Ll/wrg0;

    .line 35
    .line 36
    const/4 p2, 0x0

    .line 37
    if-eqz p1, :cond_2

    .line 38
    .line 39
    iput-object p2, p1, Ll/wrg0;->h:Ljava/nio/ByteBuffer;

    .line 40
    .line 41
    new-instance p3, Ll/ykg0;

    .line 42
    .line 43
    invoke-direct {p3}, Ll/ykg0;-><init>()V

    .line 44
    .line 45
    .line 46
    iput-object p3, p1, Ll/wrg0;->b:Ll/ykg0;

    .line 47
    .line 48
    iput-object p2, p1, Ll/wrg0;->d:Ll/dkg0;

    .line 49
    .line 50
    :cond_2
    iput-object p2, p0, Ll/swg0;->h:Ll/irg0;

    .line 51
    .line 52
    iput v1, p0, Ll/swg0;->d:I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 53
    .line 54
    monitor-exit p0

    .line 55
    return-void

    .line 56
    :goto_2
    :try_start_4
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 57
    throw p1
.end method

.method public final f(Ljava/nio/ByteBuffer;)V
    .locals 2

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/swg0;->e:Ll/wrg0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/wrg0;->g(Ljava/nio/ByteBuffer;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Ll/ueg0;

    .line 22
    .line 23
    iget-object v1, p0, Ll/swg0;->e:Ll/wrg0;

    .line 24
    .line 25
    invoke-virtual {v1, p0, v0}, Ll/wrg0;->f(Ll/swg0;Ll/ueg0;)V
    :try_end_0
    .catch LSudthrow/Sudfor; {:try_start_0 .. :try_end_0} :catch_0

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :catch_0
    move-exception p1

    .line 30
    goto :goto_1

    .line 31
    :cond_0
    return-void

    .line 32
    :goto_1
    iget-object v0, p0, Ll/swg0;->b:Ll/kug0;

    .line 33
    .line 34
    invoke-virtual {v0, p0, p1}, Ll/kug0;->a(Ll/hog0;Ljava/lang/Exception;)V

    .line 35
    .line 36
    .line 37
    iget v0, p1, LSudthrow/Sudfor;->Suddo:I

    .line 38
    .line 39
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    const/4 v1, 0x0

    .line 44
    invoke-virtual {p0, v0, p1, v1}, Ll/swg0;->a(ILjava/lang/String;Z)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public final g(Ljava/util/List;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/swg0;->m:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    check-cast v1, Ljava/nio/ByteBuffer;

    .line 19
    .line 20
    iget-object v2, p0, Ll/swg0;->a:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 21
    .line 22
    invoke-interface {v2, v1}, Ljava/util/concurrent/BlockingQueue;->add(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Ll/swg0;->b:Ll/kug0;

    .line 26
    .line 27
    invoke-virtual {v1, p0}, Ll/kug0;->a(Ll/hog0;)V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :catchall_0
    move-exception p0

    .line 32
    goto :goto_1

    .line 33
    :cond_0
    monitor-exit v0

    .line 34
    return-void

    .line 35
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 36
    throw p0
.end method
