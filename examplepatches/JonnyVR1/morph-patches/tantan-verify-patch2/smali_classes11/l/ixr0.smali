.class public final Ll/ixr0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public b:J

.field public final synthetic c:Ll/opr0;


# direct methods
.method public constructor <init>(Ll/opr0;Ljava/lang/String;)V
    .locals 2

    .line 1
    iput-object p1, p0, Ll/ixr0;->c:Ll/opr0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const-wide/16 v0, -0x1

    .line 7
    .line 8
    iput-wide v0, p0, Ll/ixr0;->b:J

    .line 9
    .line 10
    invoke-static {p2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    iput-object p2, p0, Ll/ixr0;->a:Ljava/lang/String;

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public final a()Ljava/util/List;
    .locals 19
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/evr0;",
            ">;"
        }
    .end annotation

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    new-instance v2, Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v6, "app_id = ? and rowid > ?"

    .line 9
    .line 10
    iget-object v0, v1, Ll/ixr0;->a:Ljava/lang/String;

    .line 11
    .line 12
    iget-wide v3, v1, Ll/ixr0;->b:J

    .line 13
    .line 14
    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    filled-new-array {v0, v3}, [Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v7

    .line 22
    const/4 v12, 0x0

    .line 23
    :try_start_0
    iget-object v0, v1, Ll/ixr0;->c:Ll/opr0;

    .line 24
    .line 25
    invoke-virtual {v0}, Ll/opr0;->v()Landroid/database/sqlite/SQLiteDatabase;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    const-string v4, "raw_events"

    .line 30
    .line 31
    const-string v13, "rowid"

    .line 32
    .line 33
    const-string v14, "name"

    .line 34
    .line 35
    const-string v15, "timestamp"

    .line 36
    .line 37
    const-string v16, "metadata_fingerprint"

    .line 38
    .line 39
    const-string v17, "data"

    .line 40
    .line 41
    const-string v18, "realtime"

    .line 42
    .line 43
    filled-new-array/range {v13 .. v18}, [Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v5

    .line 47
    const-string v10, "rowid"

    .line 48
    .line 49
    const-string v11, "1000"

    .line 50
    .line 51
    const/4 v8, 0x0

    .line 52
    const/4 v9, 0x0

    .line 53
    invoke-virtual/range {v3 .. v11}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    .line 54
    .line 55
    .line 56
    move-result-object v12

    .line 57
    invoke-interface {v12}, Landroid/database/Cursor;->moveToFirst()Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-nez v0, :cond_0

    .line 62
    .line 63
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 64
    .line 65
    invoke-interface {v12}, Landroid/database/Cursor;->close()V

    .line 66
    .line 67
    .line 68
    return-object v0

    .line 69
    :catchall_0
    move-exception v0

    .line 70
    goto/16 :goto_4

    .line 71
    .line 72
    :catch_0
    move-exception v0

    .line 73
    goto/16 :goto_2

    .line 74
    .line 75
    :cond_0
    const/4 v0, 0x0

    .line 76
    :try_start_1
    invoke-interface {v12, v0}, Landroid/database/Cursor;->getLong(I)J

    .line 77
    .line 78
    .line 79
    move-result-wide v4

    .line 80
    const/4 v3, 0x3

    .line 81
    invoke-interface {v12, v3}, Landroid/database/Cursor;->getLong(I)J

    .line 82
    .line 83
    .line 84
    move-result-wide v6

    .line 85
    const/4 v3, 0x5

    .line 86
    invoke-interface {v12, v3}, Landroid/database/Cursor;->getLong(I)J

    .line 87
    .line 88
    .line 89
    move-result-wide v8

    .line 90
    const-wide/16 v10, 0x1

    .line 91
    .line 92
    cmp-long v3, v8, v10

    .line 93
    .line 94
    const/4 v8, 0x1

    .line 95
    if-nez v3, :cond_1

    .line 96
    .line 97
    move v0, v8

    .line 98
    :cond_1
    const/4 v3, 0x4

    .line 99
    invoke-interface {v12, v3}, Landroid/database/Cursor;->getBlob(I)[B

    .line 100
    .line 101
    .line 102
    move-result-object v3

    .line 103
    iget-wide v9, v1, Ll/ixr0;->b:J

    .line 104
    .line 105
    cmp-long v9, v4, v9

    .line 106
    .line 107
    if-lez v9, :cond_2

    .line 108
    .line 109
    iput-wide v4, v1, Ll/ixr0;->b:J
    :try_end_1
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 110
    .line 111
    :cond_2
    :try_start_2
    invoke-static {}, Lcom/google/android/gms/internal/measurement/y;->V()Lcom/google/android/gms/internal/measurement/y$a;

    .line 112
    .line 113
    .line 114
    move-result-object v9

    .line 115
    invoke-static {v9, v3}, Ll/vmy0;->K(Ll/i9y0;[B)Ll/i9y0;

    .line 116
    .line 117
    .line 118
    move-result-object v3

    .line 119
    check-cast v3, Lcom/google/android/gms/internal/measurement/y$a;
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 120
    .line 121
    :try_start_3
    invoke-interface {v12, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v8

    .line 125
    if-eqz v8, :cond_3

    .line 126
    .line 127
    goto :goto_0

    .line 128
    :cond_3
    const-string v8, ""

    .line 129
    .line 130
    :goto_0
    invoke-virtual {v3, v8}, Lcom/google/android/gms/internal/measurement/y$a;->D(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/y$a;

    .line 131
    .line 132
    .line 133
    move-result-object v8

    .line 134
    const/4 v9, 0x2

    .line 135
    invoke-interface {v12, v9}, Landroid/database/Cursor;->getLong(I)J

    .line 136
    .line 137
    .line 138
    move-result-wide v9

    .line 139
    invoke-virtual {v8, v9, v10}, Lcom/google/android/gms/internal/measurement/y$a;->G(J)Lcom/google/android/gms/internal/measurement/y$a;

    .line 140
    .line 141
    .line 142
    move-object v8, v3

    .line 143
    new-instance v3, Ll/evr0;

    .line 144
    .line 145
    invoke-virtual {v8}, Lcom/google/android/gms/internal/measurement/u0$b;->H()Ll/m9y0;

    .line 146
    .line 147
    .line 148
    move-result-object v8

    .line 149
    check-cast v8, Lcom/google/android/gms/internal/measurement/u0;

    .line 150
    .line 151
    move-object v9, v8

    .line 152
    check-cast v9, Lcom/google/android/gms/internal/measurement/y;

    .line 153
    .line 154
    move v8, v0

    .line 155
    invoke-direct/range {v3 .. v9}, Ll/evr0;-><init>(JJZLcom/google/android/gms/internal/measurement/y;)V

    .line 156
    .line 157
    .line 158
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 159
    .line 160
    .line 161
    goto :goto_1

    .line 162
    :catch_1
    move-exception v0

    .line 163
    iget-object v3, v1, Ll/ixr0;->c:Ll/opr0;

    .line 164
    .line 165
    invoke-virtual {v3}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 166
    .line 167
    .line 168
    move-result-object v3

    .line 169
    invoke-virtual {v3}, Ll/d6x0;->A()Ll/l8x0;

    .line 170
    .line 171
    .line 172
    move-result-object v3

    .line 173
    const-string v4, "Data loss. Failed to merge raw event. appId"

    .line 174
    .line 175
    iget-object v5, v1, Ll/ixr0;->a:Ljava/lang/String;

    .line 176
    .line 177
    invoke-static {v5}, Ll/d6x0;->p(Ljava/lang/String;)Ljava/lang/Object;

    .line 178
    .line 179
    .line 180
    move-result-object v5

    .line 181
    invoke-virtual {v3, v4, v5, v0}, Ll/l8x0;->c(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 182
    .line 183
    .line 184
    :goto_1
    invoke-interface {v12}, Landroid/database/Cursor;->moveToNext()Z

    .line 185
    .line 186
    .line 187
    move-result v0
    :try_end_3
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 188
    if-nez v0, :cond_0

    .line 189
    .line 190
    invoke-interface {v12}, Landroid/database/Cursor;->close()V

    .line 191
    .line 192
    .line 193
    goto :goto_3

    .line 194
    :goto_2
    :try_start_4
    iget-object v3, v1, Ll/ixr0;->c:Ll/opr0;

    .line 195
    .line 196
    invoke-virtual {v3}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 197
    .line 198
    .line 199
    move-result-object v3

    .line 200
    invoke-virtual {v3}, Ll/d6x0;->A()Ll/l8x0;

    .line 201
    .line 202
    .line 203
    move-result-object v3

    .line 204
    const-string v4, "Data loss. Error querying raw events batch. appId"

    .line 205
    .line 206
    iget-object v1, v1, Ll/ixr0;->a:Ljava/lang/String;

    .line 207
    .line 208
    invoke-static {v1}, Ll/d6x0;->p(Ljava/lang/String;)Ljava/lang/Object;

    .line 209
    .line 210
    .line 211
    move-result-object v1

    .line 212
    invoke-virtual {v3, v4, v1, v0}, Ll/l8x0;->c(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 213
    .line 214
    .line 215
    if-eqz v12, :cond_4

    .line 216
    .line 217
    invoke-interface {v12}, Landroid/database/Cursor;->close()V

    .line 218
    .line 219
    .line 220
    :cond_4
    :goto_3
    return-object v2

    .line 221
    :goto_4
    if-eqz v12, :cond_5

    .line 222
    .line 223
    invoke-interface {v12}, Landroid/database/Cursor;->close()V

    .line 224
    .line 225
    .line 226
    :cond_5
    throw v0
.end method
