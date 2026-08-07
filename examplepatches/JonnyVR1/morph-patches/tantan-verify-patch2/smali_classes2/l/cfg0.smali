.class public final Ll/cfg0;
.super Ljava/lang/Thread;
.source "SourceFile"


# instance fields
.field public final synthetic a:Ll/agg0;


# direct methods
.method public constructor <init>(Ll/agg0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/cfg0;->a:Ll/agg0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a(Landroid/util/SparseArray;Ljava/util/List;Ljava/util/HashMap;)V
    .locals 5

    .line 1
    iget-object p0, p0, Ll/cfg0;->a:Ll/agg0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/agg0;->b:Ll/izg0;

    .line 4
    .line 5
    monitor-enter p0

    .line 6
    :try_start_0
    iget-object v0, p0, Ll/izg0;->a:Landroid/util/SparseArray;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-lez v0, :cond_0

    .line 15
    .line 16
    goto/16 :goto_3

    .line 17
    .line 18
    :catchall_0
    move-exception p1

    .line 19
    goto/16 :goto_4

    .line 20
    .line 21
    :cond_0
    iget-object v0, p0, Ll/izg0;->f:Ljava/util/ArrayList;

    .line 22
    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-lez v0, :cond_1

    .line 30
    .line 31
    goto/16 :goto_3

    .line 32
    .line 33
    :cond_1
    iget-object v0, p0, Ll/izg0;->b:Ljava/util/HashMap;

    .line 34
    .line 35
    if-eqz v0, :cond_2

    .line 36
    .line 37
    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-lez v0, :cond_2

    .line 42
    .line 43
    goto/16 :goto_3

    .line 44
    .line 45
    :cond_2
    iget-object v0, p0, Ll/izg0;->d:Landroid/util/SparseArray;

    .line 46
    .line 47
    if-eqz v0, :cond_3

    .line 48
    .line 49
    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-lez v0, :cond_3

    .line 54
    .line 55
    goto/16 :goto_3

    .line 56
    .line 57
    :cond_3
    iget-object v0, p0, Ll/izg0;->e:Ljava/util/ArrayList;

    .line 58
    .line 59
    if-eqz v0, :cond_4

    .line 60
    .line 61
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-lez v0, :cond_4

    .line 66
    .line 67
    goto/16 :goto_3

    .line 68
    .line 69
    :cond_4
    if-eqz p1, :cond_7

    .line 70
    .line 71
    iget-object v0, p0, Ll/izg0;->a:Landroid/util/SparseArray;

    .line 72
    .line 73
    if-eqz v0, :cond_7

    .line 74
    .line 75
    const/4 v0, 0x0

    .line 76
    move v1, v0

    .line 77
    :goto_0
    invoke-virtual {p1}, Landroid/util/SparseArray;->size()I

    .line 78
    .line 79
    .line 80
    move-result v2

    .line 81
    if-ge v1, v2, :cond_5

    .line 82
    .line 83
    iget-object v2, p0, Ll/izg0;->a:Landroid/util/SparseArray;

    .line 84
    .line 85
    invoke-virtual {p1, v1}, Landroid/util/SparseArray;->keyAt(I)I

    .line 86
    .line 87
    .line 88
    move-result v3

    .line 89
    invoke-virtual {p1, v1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object v4

    .line 93
    check-cast v4, Ll/bog0;

    .line 94
    .line 95
    invoke-virtual {v2, v3, v4}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 96
    .line 97
    .line 98
    add-int/lit8 v1, v1, 0x1

    .line 99
    .line 100
    goto :goto_0

    .line 101
    :cond_5
    iget-object v1, p0, Ll/izg0;->e:Ljava/util/ArrayList;

    .line 102
    .line 103
    if-eqz v1, :cond_7

    .line 104
    .line 105
    invoke-virtual {p1}, Landroid/util/SparseArray;->size()I

    .line 106
    .line 107
    .line 108
    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 109
    :goto_1
    iget-object v2, p0, Ll/izg0;->e:Ljava/util/ArrayList;

    .line 110
    .line 111
    if-ge v0, v1, :cond_6

    .line 112
    .line 113
    :try_start_1
    invoke-virtual {p1, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object v3

    .line 117
    check-cast v3, Ll/bog0;

    .line 118
    .line 119
    iget v3, v3, Ll/bog0;->a:I

    .line 120
    .line 121
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 122
    .line 123
    .line 124
    move-result-object v3

    .line 125
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 126
    .line 127
    .line 128
    add-int/lit8 v0, v0, 0x1

    .line 129
    .line 130
    goto :goto_1

    .line 131
    :cond_6
    invoke-static {v2}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 132
    .line 133
    .line 134
    :cond_7
    if-eqz p2, :cond_8

    .line 135
    .line 136
    iget-object p1, p0, Ll/izg0;->f:Ljava/util/ArrayList;

    .line 137
    .line 138
    if-eqz p1, :cond_8

    .line 139
    .line 140
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 141
    .line 142
    .line 143
    :cond_8
    if-eqz p3, :cond_9

    .line 144
    .line 145
    iget-object p1, p0, Ll/izg0;->b:Ljava/util/HashMap;

    .line 146
    .line 147
    if-eqz p1, :cond_9

    .line 148
    .line 149
    invoke-virtual {p3}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    .line 150
    .line 151
    .line 152
    move-result-object p1

    .line 153
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 154
    .line 155
    .line 156
    move-result-object p1

    .line 157
    :goto_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 158
    .line 159
    .line 160
    move-result p2

    .line 161
    if-eqz p2, :cond_9

    .line 162
    .line 163
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 164
    .line 165
    .line 166
    move-result-object p2

    .line 167
    check-cast p2, Ljava/lang/String;

    .line 168
    .line 169
    invoke-virtual {p3, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 170
    .line 171
    .line 172
    move-result-object v0

    .line 173
    check-cast v0, Ljava/lang/String;

    .line 174
    .line 175
    iget-object v1, p0, Ll/izg0;->b:Ljava/util/HashMap;

    .line 176
    .line 177
    invoke-virtual {v1, p2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 178
    .line 179
    .line 180
    goto :goto_2

    .line 181
    :cond_9
    :goto_3
    monitor-exit p0

    .line 182
    return-void

    .line 183
    :goto_4
    monitor-exit p0

    .line 184
    throw p1
.end method

.method public final run()V
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-super {v0}, Ljava/lang/Thread;->run()V

    .line 4
    .line 5
    .line 6
    iget-object v1, v0, Ll/cfg0;->a:Ll/agg0;

    .line 7
    .line 8
    iget-object v1, v1, Ll/agg0;->a:Ll/owg0;

    .line 9
    .line 10
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    new-instance v2, Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 17
    .line 18
    .line 19
    new-instance v3, Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 22
    .line 23
    .line 24
    const/4 v4, 0x0

    .line 25
    :try_start_0
    const-string v5, "SELECT * FROM breakpoint"

    .line 26
    .line 27
    invoke-virtual {v1, v5, v4}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    .line 28
    .line 29
    .line 30
    move-result-object v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_8

    .line 31
    :goto_0
    :try_start_1
    invoke-interface {v5}, Landroid/database/Cursor;->moveToNext()Z

    .line 32
    .line 33
    .line 34
    move-result v6

    .line 35
    if-eqz v6, :cond_0

    .line 36
    .line 37
    new-instance v6, Ll/eug0;

    .line 38
    .line 39
    invoke-direct {v6, v5}, Ll/eug0;-><init>(Landroid/database/Cursor;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :catchall_0
    move-exception v0

    .line 47
    move-object v6, v4

    .line 48
    :goto_1
    move-object v4, v5

    .line 49
    goto/16 :goto_b

    .line 50
    .line 51
    :cond_0
    const-string v6, "SELECT * FROM block"

    .line 52
    .line 53
    invoke-virtual {v1, v6, v4}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    .line 54
    .line 55
    .line 56
    move-result-object v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 57
    :goto_2
    :try_start_2
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    .line 58
    .line 59
    .line 60
    move-result v6

    .line 61
    if-eqz v6, :cond_1

    .line 62
    .line 63
    new-instance v6, Ll/lrg0;

    .line 64
    .line 65
    invoke-direct {v6, v1}, Ll/lrg0;-><init>(Landroid/database/Cursor;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 69
    .line 70
    .line 71
    goto :goto_2

    .line 72
    :catchall_1
    move-exception v0

    .line 73
    move-object v6, v1

    .line 74
    goto :goto_1

    .line 75
    :cond_1
    invoke-interface {v5}, Landroid/database/Cursor;->close()V

    .line 76
    .line 77
    .line 78
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 79
    .line 80
    .line 81
    new-instance v1, Landroid/util/SparseArray;

    .line 82
    .line 83
    invoke-direct {v1}, Landroid/util/SparseArray;-><init>()V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 87
    .line 88
    .line 89
    move-result v5

    .line 90
    const/4 v6, 0x0

    .line 91
    :goto_3
    if-ge v6, v5, :cond_4

    .line 92
    .line 93
    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object v7

    .line 97
    add-int/lit8 v6, v6, 0x1

    .line 98
    .line 99
    check-cast v7, Ll/eug0;

    .line 100
    .line 101
    new-instance v8, Ll/bog0;

    .line 102
    .line 103
    iget v9, v7, Ll/eug0;->a:I

    .line 104
    .line 105
    iget-object v10, v7, Ll/eug0;->b:Ljava/lang/String;

    .line 106
    .line 107
    new-instance v11, Ljava/io/File;

    .line 108
    .line 109
    iget-object v12, v7, Ll/eug0;->d:Ljava/lang/String;

    .line 110
    .line 111
    invoke-direct {v11, v12}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    iget-object v12, v7, Ll/eug0;->e:Ljava/lang/String;

    .line 115
    .line 116
    iget-boolean v13, v7, Ll/eug0;->f:Z

    .line 117
    .line 118
    invoke-direct/range {v8 .. v13}, Ll/bog0;-><init>(ILjava/lang/String;Ljava/io/File;Ljava/lang/String;Z)V

    .line 119
    .line 120
    .line 121
    iget-object v9, v7, Ll/eug0;->c:Ljava/lang/String;

    .line 122
    .line 123
    iput-object v9, v8, Ll/bog0;->c:Ljava/lang/String;

    .line 124
    .line 125
    iget-boolean v7, v7, Ll/eug0;->g:Z

    .line 126
    .line 127
    iput-boolean v7, v8, Ll/bog0;->i:Z

    .line 128
    .line 129
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 130
    .line 131
    .line 132
    move-result-object v7

    .line 133
    :cond_2
    :goto_4
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    .line 134
    .line 135
    .line 136
    move-result v9

    .line 137
    if-eqz v9, :cond_3

    .line 138
    .line 139
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 140
    .line 141
    .line 142
    move-result-object v9

    .line 143
    check-cast v9, Ll/lrg0;

    .line 144
    .line 145
    iget v10, v9, Ll/lrg0;->a:I

    .line 146
    .line 147
    iget v11, v8, Ll/bog0;->a:I

    .line 148
    .line 149
    if-ne v10, v11, :cond_2

    .line 150
    .line 151
    new-instance v12, Ll/akg0;

    .line 152
    .line 153
    iget-wide v13, v9, Ll/lrg0;->b:J

    .line 154
    .line 155
    iget-wide v10, v9, Ll/lrg0;->c:J

    .line 156
    .line 157
    move/from16 v19, v5

    .line 158
    .line 159
    iget-wide v4, v9, Ll/lrg0;->d:J

    .line 160
    .line 161
    move-wide/from16 v17, v4

    .line 162
    .line 163
    move-wide v15, v10

    .line 164
    invoke-direct/range {v12 .. v18}, Ll/akg0;-><init>(JJJ)V

    .line 165
    .line 166
    .line 167
    iget-object v4, v8, Ll/bog0;->g:Ljava/util/ArrayList;

    .line 168
    .line 169
    invoke-virtual {v4, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 170
    .line 171
    .line 172
    invoke-interface {v7}, Ljava/util/Iterator;->remove()V

    .line 173
    .line 174
    .line 175
    move/from16 v5, v19

    .line 176
    .line 177
    const/4 v4, 0x0

    .line 178
    goto :goto_4

    .line 179
    :cond_3
    move/from16 v19, v5

    .line 180
    .line 181
    iget v4, v8, Ll/bog0;->a:I

    .line 182
    .line 183
    invoke-virtual {v1, v4, v8}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 184
    .line 185
    .line 186
    const/4 v4, 0x0

    .line 187
    goto :goto_3

    .line 188
    :cond_4
    iget-object v2, v0, Ll/cfg0;->a:Ll/agg0;

    .line 189
    .line 190
    iget-object v2, v2, Ll/agg0;->a:Ll/owg0;

    .line 191
    .line 192
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 193
    .line 194
    .line 195
    new-instance v3, Ljava/util/ArrayList;

    .line 196
    .line 197
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 198
    .line 199
    .line 200
    :try_start_3
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    .line 201
    .line 202
    .line 203
    move-result-object v2

    .line 204
    const-string v4, "SELECT * FROM taskFileDirty"
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_7

    .line 205
    .line 206
    const/4 v5, 0x0

    .line 207
    :try_start_4
    invoke-virtual {v2, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    .line 208
    .line 209
    .line 210
    move-result-object v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_6

    .line 211
    :goto_5
    :try_start_5
    invoke-interface {v2}, Landroid/database/Cursor;->moveToNext()Z

    .line 212
    .line 213
    .line 214
    move-result v4

    .line 215
    if-eqz v4, :cond_5

    .line 216
    .line 217
    const-string v4, "id"

    .line 218
    .line 219
    invoke-interface {v2, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    .line 220
    .line 221
    .line 222
    move-result v4

    .line 223
    invoke-interface {v2, v4}, Landroid/database/Cursor;->getInt(I)I

    .line 224
    .line 225
    .line 226
    move-result v4

    .line 227
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 228
    .line 229
    .line 230
    move-result-object v4

    .line 231
    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 232
    .line 233
    .line 234
    goto :goto_5

    .line 235
    :catchall_2
    move-exception v0

    .line 236
    move-object v4, v2

    .line 237
    goto :goto_a

    .line 238
    :cond_5
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    .line 239
    .line 240
    .line 241
    iget-object v2, v0, Ll/cfg0;->a:Ll/agg0;

    .line 242
    .line 243
    iget-object v2, v2, Ll/agg0;->a:Ll/owg0;

    .line 244
    .line 245
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    .line 246
    .line 247
    .line 248
    move-result-object v2

    .line 249
    new-instance v4, Ljava/util/HashMap;

    .line 250
    .line 251
    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 252
    .line 253
    .line 254
    :try_start_6
    const-string v5, "SELECT * FROM okdownloadResponseFilename"
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_5

    .line 255
    .line 256
    const/4 v6, 0x0

    .line 257
    :try_start_7
    invoke-virtual {v2, v5, v6}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    .line 258
    .line 259
    .line 260
    move-result-object v2
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_4

    .line 261
    :goto_6
    :try_start_8
    invoke-interface {v2}, Landroid/database/Cursor;->moveToNext()Z

    .line 262
    .line 263
    .line 264
    move-result v5

    .line 265
    if-eqz v5, :cond_6

    .line 266
    .line 267
    const-string v5, "url"

    .line 268
    .line 269
    invoke-interface {v2, v5}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    .line 270
    .line 271
    .line 272
    move-result v5

    .line 273
    invoke-interface {v2, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 274
    .line 275
    .line 276
    move-result-object v5

    .line 277
    const-string v6, "filename"

    .line 278
    .line 279
    invoke-interface {v2, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    .line 280
    .line 281
    .line 282
    move-result v6

    .line 283
    invoke-interface {v2, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 284
    .line 285
    .line 286
    move-result-object v6

    .line 287
    invoke-virtual {v4, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    .line 288
    .line 289
    .line 290
    goto :goto_6

    .line 291
    :catchall_3
    move-exception v0

    .line 292
    move-object v4, v2

    .line 293
    goto :goto_8

    .line 294
    :cond_6
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    .line 295
    .line 296
    .line 297
    new-instance v2, Ll/peg0;

    .line 298
    .line 299
    invoke-direct {v2, v0, v1, v3, v4}, Ll/peg0;-><init>(Ll/cfg0;Landroid/util/SparseArray;Ljava/util/List;Ljava/util/HashMap;)V

    .line 300
    .line 301
    .line 302
    invoke-static {v2}, Ltech/sud/gip/base/ThreadUtils;->postUITask(Ljava/lang/Runnable;)V

    .line 303
    .line 304
    .line 305
    return-void

    .line 306
    :catchall_4
    move-exception v0

    .line 307
    :goto_7
    move-object v4, v6

    .line 308
    goto :goto_8

    .line 309
    :catchall_5
    move-exception v0

    .line 310
    const/4 v6, 0x0

    .line 311
    goto :goto_7

    .line 312
    :goto_8
    if-eqz v4, :cond_7

    .line 313
    .line 314
    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    .line 315
    .line 316
    .line 317
    :cond_7
    throw v0

    .line 318
    :catchall_6
    move-exception v0

    .line 319
    move-object v6, v5

    .line 320
    :goto_9
    move-object v4, v6

    .line 321
    goto :goto_a

    .line 322
    :catchall_7
    move-exception v0

    .line 323
    const/4 v6, 0x0

    .line 324
    goto :goto_9

    .line 325
    :goto_a
    if-eqz v4, :cond_8

    .line 326
    .line 327
    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    .line 328
    .line 329
    .line 330
    :cond_8
    throw v0

    .line 331
    :catchall_8
    move-exception v0

    .line 332
    move-object v6, v4

    .line 333
    :goto_b
    if-eqz v4, :cond_9

    .line 334
    .line 335
    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    .line 336
    .line 337
    .line 338
    :cond_9
    if-eqz v6, :cond_a

    .line 339
    .line 340
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 341
    .line 342
    .line 343
    :cond_a
    throw v0
.end method
