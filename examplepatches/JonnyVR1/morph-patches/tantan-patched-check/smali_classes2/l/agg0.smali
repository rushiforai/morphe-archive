.class public final Ll/agg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ehg0;


# instance fields
.field public final a:Ll/owg0;

.field public final b:Ll/izg0;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/owg0;

    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-direct {v0, p1}, Ll/owg0;-><init>(Landroid/content/Context;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Ll/agg0;->a:Ll/owg0;

    .line 14
    .line 15
    new-instance p1, Ll/izg0;

    .line 16
    .line 17
    invoke-direct {p1}, Ll/izg0;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object p1, p0, Ll/agg0;->b:Ll/izg0;

    .line 21
    .line 22
    new-instance p1, Ll/cfg0;

    .line 23
    .line 24
    invoke-direct {p1, p0}, Ll/cfg0;-><init>(Ll/agg0;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    .line 28
    .line 29
    .line 30
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/agg0;->b:Ll/izg0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final b(Ll/bog0;)Z
    .locals 10

    .line 1
    iget-object v0, p0, Ll/agg0;->b:Ll/izg0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/izg0;->b(Ll/bog0;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Ll/agg0;->a:Ll/owg0;

    .line 8
    .line 9
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 14
    .line 15
    .line 16
    const/4 v3, 0x0

    .line 17
    :try_start_0
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    .line 18
    .line 19
    .line 20
    move-result-object v4

    .line 21
    const-string v5, "SELECT id FROM breakpoint WHERE id = ? LIMIT 1"

    .line 22
    .line 23
    iget v6, p1, Ll/bog0;->a:I

    .line 24
    .line 25
    invoke-static {v6}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v6

    .line 29
    filled-new-array {v6}, [Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v6

    .line 33
    invoke-virtual {v4, v5, v6}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    .line 34
    .line 35
    .line 36
    move-result-object v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_4

    .line 37
    :try_start_1
    invoke-interface {v4}, Landroid/database/Cursor;->moveToNext()Z

    .line 38
    .line 39
    .line 40
    move-result v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_3

    .line 41
    if-nez v5, :cond_0

    .line 42
    .line 43
    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_0
    :try_start_2
    iget v5, p1, Ll/bog0;->a:I

    .line 51
    .line 52
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    .line 53
    .line 54
    .line 55
    move-result-object v6

    .line 56
    const-string v7, "breakpoint"

    .line 57
    .line 58
    const-string v8, "id = ?"

    .line 59
    .line 60
    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v9

    .line 64
    filled-new-array {v9}, [Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v9

    .line 68
    invoke-virtual {v6, v7, v8, v9}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 69
    .line 70
    .line 71
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    .line 72
    .line 73
    .line 74
    move-result-object v6

    .line 75
    const-string v7, "block"

    .line 76
    .line 77
    const-string v8, "breakpoint_id = ?"

    .line 78
    .line 79
    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v5

    .line 83
    filled-new-array {v5}, [Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v5

    .line 87
    invoke-virtual {v6, v7, v8, v5}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 88
    .line 89
    .line 90
    invoke-virtual {v1, p1}, Ll/owg0;->b(Ll/bog0;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_3

    .line 94
    .line 95
    .line 96
    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    .line 97
    .line 98
    .line 99
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 100
    .line 101
    .line 102
    :goto_0
    iget-object v1, p1, Ll/bog0;->f:Ll/mhg0;

    .line 103
    .line 104
    iget-object v1, v1, Ll/mhg0;->a:Ljava/lang/String;

    .line 105
    .line 106
    invoke-virtual {p1}, Ll/bog0;->toString()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    iget-boolean v2, p1, Ll/bog0;->h:Z

    .line 110
    .line 111
    if-eqz v2, :cond_4

    .line 112
    .line 113
    if-eqz v1, :cond_4

    .line 114
    .line 115
    iget-object p0, p0, Ll/agg0;->a:Ll/owg0;

    .line 116
    .line 117
    iget-object p1, p1, Ll/bog0;->b:Ljava/lang/String;

    .line 118
    .line 119
    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    new-instance v2, Landroid/content/ContentValues;

    .line 124
    .line 125
    const/4 v4, 0x2

    .line 126
    invoke-direct {v2, v4}, Landroid/content/ContentValues;-><init>(I)V

    .line 127
    .line 128
    .line 129
    const-string v4, "url"

    .line 130
    .line 131
    invoke-virtual {v2, v4, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    const-string v4, "filename"

    .line 135
    .line 136
    invoke-virtual {v2, v4, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    invoke-virtual {p1}, Ljava/lang/String;->intern()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v4

    .line 143
    monitor-enter v4

    .line 144
    :try_start_3
    const-string v5, "SELECT filename FROM okdownloadResponseFilename WHERE url = ?"

    .line 145
    .line 146
    filled-new-array {p1}, [Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object p1

    .line 150
    invoke-virtual {p0, v5, p1}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    .line 151
    .line 152
    .line 153
    move-result-object p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 154
    :try_start_4
    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    .line 155
    .line 156
    .line 157
    move-result v5

    .line 158
    if-eqz v5, :cond_1

    .line 159
    .line 160
    const-string v5, "filename"

    .line 161
    .line 162
    invoke-interface {p1, v5}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    .line 163
    .line 164
    .line 165
    move-result v5

    .line 166
    invoke-interface {p1, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object v5

    .line 170
    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 171
    .line 172
    .line 173
    move-result v1

    .line 174
    if-nez v1, :cond_2

    .line 175
    .line 176
    const-string v1, "okdownloadResponseFilename"

    .line 177
    .line 178
    invoke-virtual {p0, v1, v3, v2}, Landroid/database/sqlite/SQLiteDatabase;->replace(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 179
    .line 180
    .line 181
    goto :goto_1

    .line 182
    :catchall_0
    move-exception p0

    .line 183
    move-object v3, p1

    .line 184
    goto :goto_2

    .line 185
    :cond_1
    const-string v1, "okdownloadResponseFilename"

    .line 186
    .line 187
    invoke-virtual {p0, v1, v3, v2}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 188
    .line 189
    .line 190
    :cond_2
    :goto_1
    :try_start_5
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    .line 191
    .line 192
    .line 193
    monitor-exit v4

    .line 194
    return v0

    .line 195
    :catchall_1
    move-exception p0

    .line 196
    goto :goto_3

    .line 197
    :catchall_2
    move-exception p0

    .line 198
    :goto_2
    if-eqz v3, :cond_3

    .line 199
    .line 200
    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    .line 201
    .line 202
    .line 203
    :cond_3
    throw p0

    .line 204
    :goto_3
    monitor-exit v4
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 205
    throw p0

    .line 206
    :cond_4
    return v0

    .line 207
    :catchall_3
    move-exception p0

    .line 208
    move-object v3, v4

    .line 209
    goto :goto_4

    .line 210
    :catchall_4
    move-exception p0

    .line 211
    :goto_4
    if-eqz v3, :cond_5

    .line 212
    .line 213
    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    .line 214
    .line 215
    .line 216
    :cond_5
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 217
    .line 218
    .line 219
    throw p0
.end method

.method public final c(Ll/aug0;)Ll/bog0;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/agg0;->b:Ll/izg0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/izg0;->c(Ll/aug0;)Ll/bog0;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object p0, p0, Ll/agg0;->a:Ll/owg0;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/owg0;->b(Ll/bog0;)V

    .line 10
    .line 11
    .line 12
    return-object p1
.end method

.method public final d(I)Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/agg0;->b:Ll/izg0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/izg0;->d(I)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/agg0;->a:Ll/owg0;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    filled-new-array {p1}, [Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    const-string v0, "taskFileDirty"

    .line 24
    .line 25
    const-string v1, "id = ?"

    .line 26
    .line 27
    invoke-virtual {p0, v0, v1, p1}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 28
    .line 29
    .line 30
    const/4 p0, 0x1

    .line 31
    return p0

    .line 32
    :cond_0
    const/4 p0, 0x0

    .line 33
    return p0
.end method

.method public final e(II)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/agg0;->b:Ll/izg0;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne p2, v1, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ll/izg0;->remove(I)V

    .line 7
    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    :goto_0
    if-ne p2, v1, :cond_1

    .line 14
    .line 15
    iget-object p0, p0, Ll/agg0;->a:Ll/owg0;

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    filled-new-array {v0}, [Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const-string v1, "breakpoint"

    .line 30
    .line 31
    const-string v2, "id = ?"

    .line 32
    .line 33
    invoke-virtual {p2, v1, v2, v0}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    filled-new-array {p1}, [Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    const-string p2, "block"

    .line 49
    .line 50
    const-string v0, "breakpoint_id = ?"

    .line 51
    .line 52
    invoke-virtual {p0, p2, v0, p1}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 53
    .line 54
    .line 55
    :cond_1
    return-void
.end method

.method public final f(I)Z
    .locals 3

    .line 1
    iget-object v0, p0, Ll/agg0;->b:Ll/izg0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/izg0;->f(I)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/agg0;->a:Ll/owg0;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    new-instance v0, Landroid/content/ContentValues;

    .line 16
    .line 17
    const/4 v1, 0x1

    .line 18
    invoke-direct {v0, v1}, Landroid/content/ContentValues;-><init>(I)V

    .line 19
    .line 20
    .line 21
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    const-string v2, "id"

    .line 26
    .line 27
    invoke-virtual {v0, v2, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 28
    .line 29
    .line 30
    const-string p1, "taskFileDirty"

    .line 31
    .line 32
    const/4 v2, 0x0

    .line 33
    invoke-virtual {p0, p1, v2, v0}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 34
    .line 35
    .line 36
    return v1

    .line 37
    :cond_0
    const/4 p0, 0x0

    .line 38
    return p0
.end method

.method public final g(Ll/bog0;IJ)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/agg0;->b:Ll/izg0;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2, p3, p4}, Ll/izg0;->g(Ll/bog0;IJ)V

    .line 4
    .line 5
    .line 6
    iget-object p3, p1, Ll/bog0;->g:Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-virtual {p3, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p3

    .line 12
    check-cast p3, Ll/akg0;

    .line 13
    .line 14
    iget-object p3, p3, Ll/akg0;->c:Ljava/util/concurrent/atomic/AtomicLong;

    .line 15
    .line 16
    invoke-virtual {p3}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 17
    .line 18
    .line 19
    move-result-wide p3

    .line 20
    iget-object p0, p0, Ll/agg0;->a:Ll/owg0;

    .line 21
    .line 22
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 23
    .line 24
    .line 25
    new-instance v0, Landroid/content/ContentValues;

    .line 26
    .line 27
    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 31
    .line 32
    .line 33
    move-result-object p3

    .line 34
    const-string p4, "current_offset"

    .line 35
    .line 36
    invoke-virtual {v0, p4, p3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    iget p1, p1, Ll/bog0;->a:I

    .line 44
    .line 45
    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p2

    .line 53
    filled-new-array {p1, p2}, [Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    const-string p2, "block"

    .line 58
    .line 59
    const-string p3, "breakpoint_id = ? AND block_index = ?"

    .line 60
    .line 61
    invoke-virtual {p0, p2, v0, p3, p1}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public final get(I)Ll/bog0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/agg0;->b:Ll/izg0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/izg0;->a:Landroid/util/SparseArray;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Ll/bog0;

    .line 10
    .line 11
    return-object p0
.end method

.method public final remove(I)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/agg0;->b:Ll/izg0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/izg0;->remove(I)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/agg0;->a:Ll/owg0;

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    filled-new-array {v1}, [Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    const-string v2, "breakpoint"

    .line 21
    .line 22
    const-string v3, "id = ?"

    .line 23
    .line 24
    invoke-virtual {v0, v2, v3, v1}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    filled-new-array {p1}, [Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    const-string v0, "block"

    .line 40
    .line 41
    const-string v1, "breakpoint_id = ?"

    .line 42
    .line 43
    invoke-virtual {p0, v0, v1, p1}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 44
    .line 45
    .line 46
    return-void
.end method
