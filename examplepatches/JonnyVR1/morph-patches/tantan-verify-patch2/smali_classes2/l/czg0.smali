.class public final Ll/czg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/vfg0;


# direct methods
.method public constructor <init>(Ll/vfg0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/czg0;->a:Ll/vfg0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 7

    .line 1
    iget-object p0, p0, Ll/czg0;->a:Ll/vfg0;

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    iget-object v0, p0, Ll/vfg0;->u:Ljava/util/ArrayList;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    iget-boolean v1, p0, Ll/vfg0;->e:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    :goto_0
    monitor-exit p0

    .line 14
    return-void

    .line 15
    :cond_1
    const/4 v1, 0x1

    .line 16
    :try_start_1
    iput-boolean v1, p0, Ll/vfg0;->e:Z

    .line 17
    .line 18
    iget-object v2, p0, Ll/vfg0;->t:Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 21
    .line 22
    .line 23
    const/4 v0, 0x3

    .line 24
    const/4 v2, 0x0

    .line 25
    :try_start_2
    iget-object v3, p0, Ll/vfg0;->c:Ljava/util/concurrent/atomic/AtomicLong;

    .line 26
    .line 27
    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 28
    .line 29
    .line 30
    move-result-wide v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 31
    const-wide/16 v5, 0x0

    .line 32
    .line 33
    cmp-long v3, v3, v5

    .line 34
    .line 35
    if-gtz v3, :cond_3

    .line 36
    .line 37
    :try_start_3
    iget-object v1, p0, Ll/vfg0;->u:Ljava/util/ArrayList;

    .line 38
    .line 39
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    :goto_1
    if-ge v2, v3, :cond_2

    .line 44
    .line 45
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v4

    .line 49
    add-int/lit8 v2, v2, 0x1

    .line 50
    .line 51
    check-cast v4, Ljava/lang/Integer;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 52
    .line 53
    :try_start_4
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 54
    .line 55
    .line 56
    move-result v4

    .line 57
    invoke-virtual {p0, v4}, Ll/vfg0;->b(I)V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 58
    .line 59
    .line 60
    goto :goto_1

    .line 61
    :catchall_0
    move-exception v0

    .line 62
    goto/16 :goto_8

    .line 63
    .line 64
    :catch_0
    move-exception v4

    .line 65
    :try_start_5
    iget-object v5, p0, Ll/vfg0;->j:Ll/aug0;

    .line 66
    .line 67
    iget v5, v5, Ll/aug0;->b:I

    .line 68
    .line 69
    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    goto :goto_1

    .line 73
    :cond_2
    iget-object v1, p0, Ll/vfg0;->k:Ll/ehg0;

    .line 74
    .line 75
    iget-object v2, p0, Ll/vfg0;->j:Ll/aug0;

    .line 76
    .line 77
    iget v2, v2, Ll/aug0;->b:I

    .line 78
    .line 79
    invoke-interface {v1, v2, v0}, Ll/ehg0;->e(II)V

    .line 80
    .line 81
    .line 82
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 83
    goto/16 :goto_5

    .line 84
    .line 85
    :cond_3
    :try_start_6
    iget-object v3, p0, Ll/vfg0;->n:Ljava/util/concurrent/Future;

    .line 86
    .line 87
    if-eqz v3, :cond_5

    .line 88
    .line 89
    iget-object v3, p0, Ll/vfg0;->n:Ljava/util/concurrent/Future;

    .line 90
    .line 91
    invoke-interface {v3}, Ljava/util/concurrent/Future;->isDone()Z

    .line 92
    .line 93
    .line 94
    move-result v3

    .line 95
    if-nez v3, :cond_5

    .line 96
    .line 97
    iget-object v3, p0, Ll/vfg0;->r:Ljava/lang/String;

    .line 98
    .line 99
    if-nez v3, :cond_4

    .line 100
    .line 101
    iget-object v3, p0, Ll/vfg0;->j:Ll/aug0;

    .line 102
    .line 103
    invoke-virtual {v3}, Ll/aug0;->j()Ljava/io/File;

    .line 104
    .line 105
    .line 106
    move-result-object v3

    .line 107
    if-eqz v3, :cond_4

    .line 108
    .line 109
    iget-object v3, p0, Ll/vfg0;->j:Ll/aug0;

    .line 110
    .line 111
    invoke-virtual {v3}, Ll/aug0;->j()Ljava/io/File;

    .line 112
    .line 113
    .line 114
    move-result-object v3

    .line 115
    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v3

    .line 119
    iput-object v3, p0, Ll/vfg0;->r:Ljava/lang/String;

    .line 120
    .line 121
    goto :goto_2

    .line 122
    :catchall_1
    move-exception v1

    .line 123
    goto :goto_6

    .line 124
    :cond_4
    :goto_2
    invoke-static {}, Ll/jwg0;->a()Ll/jwg0;

    .line 125
    .line 126
    .line 127
    move-result-object v3

    .line 128
    iget-object v3, v3, Ll/jwg0;->f:Ll/qhg0;

    .line 129
    .line 130
    iget-object v3, v3, Ll/qhg0;->a:Ll/ttg0;

    .line 131
    .line 132
    iget-object v4, p0, Ll/vfg0;->r:Ljava/lang/String;

    .line 133
    .line 134
    invoke-virtual {v3, v4}, Ll/ttg0;->c(Ljava/lang/String;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 135
    .line 136
    .line 137
    const/4 v3, -0x1

    .line 138
    :try_start_7
    invoke-virtual {p0, v3, v1}, Ll/vfg0;->c(IZ)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    .line 139
    .line 140
    .line 141
    :try_start_8
    invoke-static {}, Ll/jwg0;->a()Ll/jwg0;

    .line 142
    .line 143
    .line 144
    move-result-object v1

    .line 145
    iget-object v1, v1, Ll/jwg0;->f:Ll/qhg0;

    .line 146
    .line 147
    iget-object v1, v1, Ll/qhg0;->a:Ll/ttg0;

    .line 148
    .line 149
    iget-object v3, p0, Ll/vfg0;->r:Ljava/lang/String;

    .line 150
    .line 151
    invoke-virtual {v1, v3}, Ll/ttg0;->a(Ljava/lang/String;)V

    .line 152
    .line 153
    .line 154
    goto :goto_3

    .line 155
    :catchall_2
    move-exception v1

    .line 156
    invoke-static {}, Ll/jwg0;->a()Ll/jwg0;

    .line 157
    .line 158
    .line 159
    move-result-object v3

    .line 160
    iget-object v3, v3, Ll/jwg0;->f:Ll/qhg0;

    .line 161
    .line 162
    iget-object v3, v3, Ll/qhg0;->a:Ll/ttg0;

    .line 163
    .line 164
    iget-object v4, p0, Ll/vfg0;->r:Ljava/lang/String;

    .line 165
    .line 166
    invoke-virtual {v3, v4}, Ll/ttg0;->a(Ljava/lang/String;)V

    .line 167
    .line 168
    .line 169
    throw v1
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    .line 170
    :cond_5
    :goto_3
    :try_start_9
    iget-object v1, p0, Ll/vfg0;->u:Ljava/util/ArrayList;

    .line 171
    .line 172
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 173
    .line 174
    .line 175
    move-result v3

    .line 176
    :goto_4
    if-ge v2, v3, :cond_6

    .line 177
    .line 178
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 179
    .line 180
    .line 181
    move-result-object v4

    .line 182
    add-int/lit8 v2, v2, 0x1

    .line 183
    .line 184
    check-cast v4, Ljava/lang/Integer;
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 185
    .line 186
    :try_start_a
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 187
    .line 188
    .line 189
    move-result v4

    .line 190
    invoke-virtual {p0, v4}, Ll/vfg0;->b(I)V
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_1
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    .line 191
    .line 192
    .line 193
    goto :goto_4

    .line 194
    :catch_1
    move-exception v4

    .line 195
    :try_start_b
    iget-object v5, p0, Ll/vfg0;->j:Ll/aug0;

    .line 196
    .line 197
    iget v5, v5, Ll/aug0;->b:I

    .line 198
    .line 199
    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 200
    .line 201
    .line 202
    goto :goto_4

    .line 203
    :cond_6
    iget-object v1, p0, Ll/vfg0;->k:Ll/ehg0;

    .line 204
    .line 205
    iget-object v2, p0, Ll/vfg0;->j:Ll/aug0;

    .line 206
    .line 207
    iget v2, v2, Ll/aug0;->b:I

    .line 208
    .line 209
    invoke-interface {v1, v2, v0}, Ll/ehg0;->e(II)V

    .line 210
    .line 211
    .line 212
    monitor-exit p0

    .line 213
    :goto_5
    return-void

    .line 214
    :goto_6
    iget-object v3, p0, Ll/vfg0;->u:Ljava/util/ArrayList;

    .line 215
    .line 216
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 217
    .line 218
    .line 219
    move-result v4

    .line 220
    :goto_7
    if-ge v2, v4, :cond_7

    .line 221
    .line 222
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 223
    .line 224
    .line 225
    move-result-object v5

    .line 226
    add-int/lit8 v2, v2, 0x1

    .line 227
    .line 228
    check-cast v5, Ljava/lang/Integer;
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_0

    .line 229
    .line 230
    :try_start_c
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    .line 231
    .line 232
    .line 233
    move-result v5

    .line 234
    invoke-virtual {p0, v5}, Ll/vfg0;->b(I)V
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_c} :catch_2
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    .line 235
    .line 236
    .line 237
    goto :goto_7

    .line 238
    :catch_2
    move-exception v5

    .line 239
    :try_start_d
    iget-object v6, p0, Ll/vfg0;->j:Ll/aug0;

    .line 240
    .line 241
    iget v6, v6, Ll/aug0;->b:I

    .line 242
    .line 243
    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 244
    .line 245
    .line 246
    goto :goto_7

    .line 247
    :cond_7
    iget-object v2, p0, Ll/vfg0;->k:Ll/ehg0;

    .line 248
    .line 249
    iget-object v3, p0, Ll/vfg0;->j:Ll/aug0;

    .line 250
    .line 251
    iget v3, v3, Ll/aug0;->b:I

    .line 252
    .line 253
    invoke-interface {v2, v3, v0}, Ll/ehg0;->e(II)V

    .line 254
    .line 255
    .line 256
    throw v1
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_0

    .line 257
    :goto_8
    monitor-exit p0

    .line 258
    throw v0
.end method
