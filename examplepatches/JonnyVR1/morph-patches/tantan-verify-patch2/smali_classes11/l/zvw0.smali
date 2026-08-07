.class public final Ll/zvw0;
.super Ll/kix0;
.source "SourceFile"


# instance fields
.field public final c:Ll/zyw0;

.field public d:Z


# direct methods
.method public constructor <init>(Ll/atx0;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Ll/kix0;-><init>(Ll/atx0;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/zyw0;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/yyx0;->zza()Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const-string v1, "google_app_measurement_local.db"

    .line 11
    .line 12
    invoke-direct {p1, p0, v0, v1}, Ll/zyw0;-><init>(Ll/zvw0;Landroid/content/Context;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iput-object p1, p0, Ll/zvw0;->c:Ll/zyw0;

    .line 16
    .line 17
    return-void
.end method

.method private final F()Z
    .locals 1
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/yyx0;->zza()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "google_app_measurement_local.db"

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/content/Context;->getDatabasePath(Ljava/lang/String;)Ljava/io/File;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public static v(Landroid/database/sqlite/SQLiteDatabase;)J
    .locals 11

    .line 1
    const/4 v1, 0x0

    .line 2
    :try_start_0
    const-string v3, "messages"

    .line 3
    .line 4
    const-string v0, "rowid"

    .line 5
    .line 6
    filled-new-array {v0}, [Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v4

    .line 10
    const-string v5, "type=?"

    .line 11
    .line 12
    const-string v0, "3"

    .line 13
    .line 14
    filled-new-array {v0}, [Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v6

    .line 18
    const-string v9, "rowid desc"

    .line 19
    .line 20
    const-string v10, "1"

    .line 21
    .line 22
    const/4 v7, 0x0

    .line 23
    const/4 v8, 0x0

    .line 24
    move-object v2, p0

    .line 25
    invoke-virtual/range {v2 .. v10}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-eqz p0, :cond_0

    .line 34
    .line 35
    const/4 p0, 0x0

    .line 36
    invoke-interface {v1, p0}, Landroid/database/Cursor;->getLong(I)J

    .line 37
    .line 38
    .line 39
    move-result-wide v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 40
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 41
    .line 42
    .line 43
    return-wide v2

    .line 44
    :catchall_0
    move-exception v0

    .line 45
    move-object p0, v0

    .line 46
    goto :goto_0

    .line 47
    :cond_0
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 48
    .line 49
    .line 50
    const-wide/16 v0, -0x1

    .line 51
    .line 52
    return-wide v0

    .line 53
    :goto_0
    if-eqz v1, :cond_1

    .line 54
    .line 55
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 56
    .line 57
    .line 58
    :cond_1
    throw p0
.end method


# virtual methods
.method public final A(Lcom/google/android/gms/measurement/internal/zzon;)Z
    .locals 3

    .line 1
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {p1, v0, v1}, Lcom/google/android/gms/measurement/internal/zzon;->writeToParcel(Landroid/os/Parcel;I)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/os/Parcel;->marshall()[B

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 14
    .line 15
    .line 16
    array-length v0, p1

    .line 17
    const/high16 v2, 0x20000

    .line 18
    .line 19
    if-le v0, v2, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Ll/d6x0;->C()Ll/l8x0;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const-string p1, "User property too long for local database. Sending directly to service"

    .line 30
    .line 31
    invoke-virtual {p0, p1}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    return v1

    .line 35
    :cond_0
    const/4 v0, 0x1

    .line 36
    invoke-virtual {p0, v0, p1}, Ll/zvw0;->x(I[B)Z

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    return p0
.end method

.method public final B()V
    .locals 3
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/yyx0;->h()V

    .line 2
    .line 3
    .line 4
    :try_start_0
    invoke-virtual {p0}, Ll/zvw0;->E()Landroid/database/sqlite/SQLiteDatabase;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    const-string v1, "messages"

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    invoke-virtual {v0, v1, v2, v2}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-lez v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v1}, Ll/d6x0;->E()Ll/l8x0;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    const-string v2, "Reset local analytics data. records"

    .line 28
    .line 29
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v1, v2, v0}, Ll/l8x0;->b(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :catch_0
    move-exception v0

    .line 38
    goto :goto_0

    .line 39
    :cond_0
    return-void

    .line 40
    :goto_0
    invoke-virtual {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {p0}, Ll/d6x0;->A()Ll/l8x0;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    const-string v1, "Error resetting local analytics data. error"

    .line 49
    .line 50
    invoke-virtual {p0, v1, v0}, Ll/l8x0;->b(Ljava/lang/String;Ljava/lang/Object;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public final C()Z
    .locals 2
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v0, v0, [B

    .line 3
    .line 4
    const/4 v1, 0x3

    .line 5
    invoke-virtual {p0, v1, v0}, Ll/zvw0;->x(I[B)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public final D()Z
    .locals 10
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    const-string v0, "Error deleting app launch break from local database"

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/yyx0;->h()V

    .line 4
    .line 5
    .line 6
    iget-boolean v1, p0, Ll/zvw0;->d:Z

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    return v2

    .line 12
    :cond_0
    invoke-direct {p0}, Ll/zvw0;->F()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-nez v1, :cond_1

    .line 17
    .line 18
    return v2

    .line 19
    :cond_1
    const/4 v1, 0x5

    .line 20
    move v4, v1

    .line 21
    move v3, v2

    .line 22
    :goto_0
    if-ge v3, v1, :cond_7

    .line 23
    .line 24
    const/4 v5, 0x1

    .line 25
    const/4 v6, 0x0

    .line 26
    :try_start_0
    invoke-virtual {p0}, Ll/zvw0;->E()Landroid/database/sqlite/SQLiteDatabase;

    .line 27
    .line 28
    .line 29
    move-result-object v6

    .line 30
    if-nez v6, :cond_3

    .line 31
    .line 32
    iput-boolean v5, p0, Ll/zvw0;->d:Z
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteFullException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Landroid/database/sqlite/SQLiteDatabaseLockedException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 33
    .line 34
    if-eqz v6, :cond_2

    .line 35
    .line 36
    invoke-virtual {v6}, Landroid/database/sqlite/SQLiteClosable;->close()V

    .line 37
    .line 38
    .line 39
    :cond_2
    return v2

    .line 40
    :catchall_0
    move-exception p0

    .line 41
    goto :goto_4

    .line 42
    :catch_0
    move-exception v7

    .line 43
    goto :goto_1

    .line 44
    :catch_1
    move-exception v7

    .line 45
    goto :goto_2

    .line 46
    :cond_3
    :try_start_1
    invoke-virtual {v6}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 47
    .line 48
    .line 49
    const-string v7, "messages"

    .line 50
    .line 51
    const-string v8, "type == ?"

    .line 52
    .line 53
    const/4 v9, 0x3

    .line 54
    invoke-static {v9}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v9

    .line 58
    filled-new-array {v9}, [Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v9

    .line 62
    invoke-virtual {v6, v7, v8, v9}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 63
    .line 64
    .line 65
    invoke-virtual {v6}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v6}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_1
    .catch Landroid/database/sqlite/SQLiteFullException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Landroid/database/sqlite/SQLiteDatabaseLockedException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 69
    .line 70
    .line 71
    invoke-virtual {v6}, Landroid/database/sqlite/SQLiteClosable;->close()V

    .line 72
    .line 73
    .line 74
    return v5

    .line 75
    :goto_1
    if-eqz v6, :cond_4

    .line 76
    .line 77
    :try_start_2
    invoke-virtual {v6}, Landroid/database/sqlite/SQLiteDatabase;->inTransaction()Z

    .line 78
    .line 79
    .line 80
    move-result v8

    .line 81
    if-eqz v8, :cond_4

    .line 82
    .line 83
    invoke-virtual {v6}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 84
    .line 85
    .line 86
    :cond_4
    invoke-virtual {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 87
    .line 88
    .line 89
    move-result-object v8

    .line 90
    invoke-virtual {v8}, Ll/d6x0;->A()Ll/l8x0;

    .line 91
    .line 92
    .line 93
    move-result-object v8

    .line 94
    invoke-virtual {v8, v0, v7}, Ll/l8x0;->b(Ljava/lang/String;Ljava/lang/Object;)V

    .line 95
    .line 96
    .line 97
    iput-boolean v5, p0, Ll/zvw0;->d:Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 98
    .line 99
    if-eqz v6, :cond_5

    .line 100
    .line 101
    invoke-virtual {v6}, Landroid/database/sqlite/SQLiteClosable;->close()V

    .line 102
    .line 103
    .line 104
    goto :goto_3

    .line 105
    :catch_2
    int-to-long v7, v4

    .line 106
    :try_start_3
    invoke-static {v7, v8}, Landroid/os/SystemClock;->sleep(J)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 107
    .line 108
    .line 109
    add-int/lit8 v4, v4, 0x14

    .line 110
    .line 111
    if-eqz v6, :cond_5

    .line 112
    .line 113
    invoke-virtual {v6}, Landroid/database/sqlite/SQLiteClosable;->close()V

    .line 114
    .line 115
    .line 116
    goto :goto_3

    .line 117
    :goto_2
    :try_start_4
    invoke-virtual {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 118
    .line 119
    .line 120
    move-result-object v8

    .line 121
    invoke-virtual {v8}, Ll/d6x0;->A()Ll/l8x0;

    .line 122
    .line 123
    .line 124
    move-result-object v8

    .line 125
    invoke-virtual {v8, v0, v7}, Ll/l8x0;->b(Ljava/lang/String;Ljava/lang/Object;)V

    .line 126
    .line 127
    .line 128
    iput-boolean v5, p0, Ll/zvw0;->d:Z
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 129
    .line 130
    if-eqz v6, :cond_5

    .line 131
    .line 132
    invoke-virtual {v6}, Landroid/database/sqlite/SQLiteClosable;->close()V

    .line 133
    .line 134
    .line 135
    :cond_5
    :goto_3
    add-int/lit8 v3, v3, 0x1

    .line 136
    .line 137
    goto :goto_0

    .line 138
    :goto_4
    if-eqz v6, :cond_6

    .line 139
    .line 140
    invoke-virtual {v6}, Landroid/database/sqlite/SQLiteClosable;->close()V

    .line 141
    .line 142
    .line 143
    :cond_6
    throw p0

    .line 144
    :cond_7
    invoke-virtual {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 145
    .line 146
    .line 147
    move-result-object p0

    .line 148
    invoke-virtual {p0}, Ll/d6x0;->F()Ll/l8x0;

    .line 149
    .line 150
    .line 151
    move-result-object p0

    .line 152
    const-string v0, "Error deleting app launch break from local database in reasonable time"

    .line 153
    .line 154
    invoke-virtual {p0, v0}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 155
    .line 156
    .line 157
    return v2
.end method

.method public final E()Landroid/database/sqlite/SQLiteDatabase;
    .locals 2
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/database/sqlite/SQLiteException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Ll/zvw0;->d:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    return-object v1

    .line 7
    :cond_0
    iget-object v0, p0, Ll/zvw0;->c:Ll/zyw0;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/zyw0;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    iput-boolean v0, p0, Ll/zvw0;->d:Z

    .line 17
    .line 18
    return-object v1

    .line 19
    :cond_1
    return-object v0
.end method

.method public final bridge synthetic a()Ll/ajr0;
    .locals 0
    .annotation runtime Lorg/checkerframework/dataflow/qual/Pure;
    .end annotation

    .line 1
    invoke-super {p0}, Ll/yyx0;->a()Ll/ajr0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final bridge synthetic b()Ll/o7s0;
    .locals 0
    .annotation runtime Lorg/checkerframework/dataflow/qual/Pure;
    .end annotation

    .line 1
    invoke-super {p0}, Ll/yyx0;->b()Ll/o7s0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final bridge synthetic c()Ll/wxw0;
    .locals 0
    .annotation runtime Lorg/checkerframework/dataflow/qual/Pure;
    .end annotation

    .line 1
    invoke-super {p0}, Ll/yyx0;->c()Ll/wxw0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final bridge synthetic d()Ll/ajx0;
    .locals 0
    .annotation runtime Lorg/checkerframework/dataflow/qual/Pure;
    .end annotation

    .line 1
    invoke-super {p0}, Ll/yyx0;->d()Ll/ajx0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final bridge synthetic e()Ll/hny0;
    .locals 0
    .annotation runtime Lorg/checkerframework/dataflow/qual/Pure;
    .end annotation

    .line 1
    invoke-super {p0}, Ll/yyx0;->e()Ll/hny0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final bridge synthetic f()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/v1v0;->f()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final bridge synthetic g()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/v1v0;->g()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final bridge synthetic h()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/v1v0;->h()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final bridge synthetic i()Ll/n9s0;
    .locals 0

    .line 1
    invoke-super {p0}, Ll/v1v0;->i()Ll/n9s0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final bridge synthetic j()Lcom/google/android/gms/measurement/internal/c;
    .locals 0

    .line 1
    invoke-super {p0}, Ll/v1v0;->j()Lcom/google/android/gms/measurement/internal/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final bridge synthetic k()Ll/zvw0;
    .locals 0

    .line 1
    invoke-super {p0}, Ll/v1v0;->k()Ll/zvw0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final bridge synthetic l()Lcom/google/android/gms/measurement/internal/g;
    .locals 0

    .line 1
    invoke-super {p0}, Ll/v1v0;->l()Lcom/google/android/gms/measurement/internal/g;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final bridge synthetic m()Ll/say0;
    .locals 0

    .line 1
    invoke-super {p0}, Ll/v1v0;->m()Ll/say0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final bridge synthetic n()Ll/hcy0;
    .locals 0

    .line 1
    invoke-super {p0}, Ll/v1v0;->n()Ll/hcy0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final bridge synthetic o()Ll/thy0;
    .locals 0

    .line 1
    invoke-super {p0}, Ll/v1v0;->o()Ll/thy0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final u()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public final w(I)Ljava/util/List;
    .locals 21
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List<",
            "Lcom/google/android/gms/common/internal/safeparcel/AbstractSafeParcelable;",
            ">;"
        }
    .end annotation

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    const-string v2, "Error reading entries from local database"

    .line 4
    .line 5
    invoke-virtual {v1}, Ll/yyx0;->h()V

    .line 6
    .line 7
    .line 8
    iget-boolean v0, v1, Ll/zvw0;->d:Z

    .line 9
    .line 10
    const/4 v3, 0x0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    return-object v3

    .line 14
    :cond_0
    new-instance v4, Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-direct {v1}, Ll/zvw0;->F()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    return-object v4

    .line 26
    :cond_1
    const/4 v5, 0x5

    .line 27
    const/4 v6, 0x0

    .line 28
    move v8, v5

    .line 29
    move v7, v6

    .line 30
    :goto_0
    if-ge v7, v5, :cond_13

    .line 31
    .line 32
    const/4 v9, 0x1

    .line 33
    :try_start_0
    invoke-virtual {v1}, Ll/zvw0;->E()Landroid/database/sqlite/SQLiteDatabase;

    .line 34
    .line 35
    .line 36
    move-result-object v10
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteFullException; {:try_start_0 .. :try_end_0} :catch_b
    .catch Landroid/database/sqlite/SQLiteDatabaseLockedException; {:try_start_0 .. :try_end_0} :catch_9
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_8
    .catchall {:try_start_0 .. :try_end_0} :catchall_5

    .line 37
    if-nez v10, :cond_3

    .line 38
    .line 39
    :try_start_1
    iput-boolean v9, v1, Ll/zvw0;->d:Z
    :try_end_1
    .catch Landroid/database/sqlite/SQLiteFullException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Landroid/database/sqlite/SQLiteDatabaseLockedException; {:try_start_1 .. :try_end_1} :catch_7
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 40
    .line 41
    if-eqz v10, :cond_2

    .line 42
    .line 43
    invoke-virtual {v10}, Landroid/database/sqlite/SQLiteClosable;->close()V

    .line 44
    .line 45
    .line 46
    :cond_2
    return-object v3

    .line 47
    :catchall_0
    move-exception v0

    .line 48
    goto/16 :goto_c

    .line 49
    .line 50
    :catch_0
    move-exception v0

    .line 51
    move-object v11, v3

    .line 52
    goto/16 :goto_8

    .line 53
    .line 54
    :catch_1
    move-exception v0

    .line 55
    move-object v11, v3

    .line 56
    goto/16 :goto_a

    .line 57
    .line 58
    :cond_3
    :try_start_2
    invoke-virtual {v10}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 59
    .line 60
    .line 61
    invoke-static {v10}, Ll/zvw0;->v(Landroid/database/sqlite/SQLiteDatabase;)J

    .line 62
    .line 63
    .line 64
    move-result-wide v11

    .line 65
    const-wide/16 v19, -0x1

    .line 66
    .line 67
    cmp-long v0, v11, v19

    .line 68
    .line 69
    if-eqz v0, :cond_4

    .line 70
    .line 71
    const-string v0, "rowid<?"

    .line 72
    .line 73
    new-array v13, v9, [Ljava/lang/String;

    .line 74
    .line 75
    invoke-static {v11, v12}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v11

    .line 79
    aput-object v11, v13, v6

    .line 80
    .line 81
    move-object v14, v13

    .line 82
    move-object v13, v0

    .line 83
    goto :goto_1

    .line 84
    :cond_4
    move-object v13, v3

    .line 85
    move-object v14, v13

    .line 86
    :goto_1
    const-string v11, "messages"

    .line 87
    .line 88
    const-string v0, "rowid"

    .line 89
    .line 90
    const-string v12, "type"

    .line 91
    .line 92
    const-string v15, "entry"

    .line 93
    .line 94
    filled-new-array {v0, v12, v15}, [Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v12

    .line 98
    const-string v17, "rowid asc"

    .line 99
    .line 100
    const/16 v0, 0x64

    .line 101
    .line 102
    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v18

    .line 106
    const/4 v15, 0x0

    .line 107
    const/16 v16, 0x0

    .line 108
    .line 109
    invoke-virtual/range {v10 .. v18}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    .line 110
    .line 111
    .line 112
    move-result-object v11
    :try_end_2
    .catch Landroid/database/sqlite/SQLiteFullException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Landroid/database/sqlite/SQLiteDatabaseLockedException; {:try_start_2 .. :try_end_2} :catch_7
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 113
    :cond_5
    :goto_2
    :try_start_3
    invoke-interface {v11}, Landroid/database/Cursor;->moveToNext()Z

    .line 114
    .line 115
    .line 116
    move-result v0

    .line 117
    if-eqz v0, :cond_a

    .line 118
    .line 119
    invoke-interface {v11, v6}, Landroid/database/Cursor;->getLong(I)J

    .line 120
    .line 121
    .line 122
    move-result-wide v19

    .line 123
    invoke-interface {v11, v9}, Landroid/database/Cursor;->getInt(I)I

    .line 124
    .line 125
    .line 126
    move-result v0

    .line 127
    const/4 v12, 0x2

    .line 128
    invoke-interface {v11, v12}, Landroid/database/Cursor;->getBlob(I)[B

    .line 129
    .line 130
    .line 131
    move-result-object v13

    .line 132
    if-nez v0, :cond_6

    .line 133
    .line 134
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    .line 135
    .line 136
    .line 137
    move-result-object v12
    :try_end_3
    .catch Landroid/database/sqlite/SQLiteFullException; {:try_start_3 .. :try_end_3} :catch_3
    .catch Landroid/database/sqlite/SQLiteDatabaseLockedException; {:try_start_3 .. :try_end_3} :catch_a
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_3 .. :try_end_3} :catch_2
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 138
    :try_start_4
    array-length v0, v13

    .line 139
    invoke-virtual {v12, v13, v6, v0}, Landroid/os/Parcel;->unmarshall([BII)V

    .line 140
    .line 141
    .line 142
    invoke-virtual {v12, v6}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 143
    .line 144
    .line 145
    sget-object v0, Lcom/google/android/gms/measurement/internal/zzbf;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 146
    .line 147
    invoke-interface {v0, v12}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    check-cast v0, Lcom/google/android/gms/measurement/internal/zzbf;
    :try_end_4
    .catch Lcom/google/android/gms/common/internal/safeparcel/SafeParcelReader$ParseException; {:try_start_4 .. :try_end_4} :catch_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 152
    .line 153
    :try_start_5
    invoke-virtual {v12}, Landroid/os/Parcel;->recycle()V

    .line 154
    .line 155
    .line 156
    if-eqz v0, :cond_5

    .line 157
    .line 158
    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_5
    .catch Landroid/database/sqlite/SQLiteFullException; {:try_start_5 .. :try_end_5} :catch_3
    .catch Landroid/database/sqlite/SQLiteDatabaseLockedException; {:try_start_5 .. :try_end_5} :catch_a
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_5 .. :try_end_5} :catch_2
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 159
    .line 160
    .line 161
    goto :goto_2

    .line 162
    :catchall_1
    move-exception v0

    .line 163
    move-object v3, v11

    .line 164
    goto/16 :goto_c

    .line 165
    .line 166
    :catch_2
    move-exception v0

    .line 167
    goto/16 :goto_8

    .line 168
    .line 169
    :catch_3
    move-exception v0

    .line 170
    goto/16 :goto_a

    .line 171
    .line 172
    :catchall_2
    move-exception v0

    .line 173
    goto :goto_3

    .line 174
    :catch_4
    :try_start_6
    invoke-virtual {v1}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 175
    .line 176
    .line 177
    move-result-object v0

    .line 178
    invoke-virtual {v0}, Ll/d6x0;->A()Ll/l8x0;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    const-string v13, "Failed to load event from local database"

    .line 183
    .line 184
    invoke-virtual {v0, v13}, Ll/l8x0;->a(Ljava/lang/String;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 185
    .line 186
    .line 187
    :try_start_7
    invoke-virtual {v12}, Landroid/os/Parcel;->recycle()V

    .line 188
    .line 189
    .line 190
    goto :goto_2

    .line 191
    :goto_3
    invoke-virtual {v12}, Landroid/os/Parcel;->recycle()V

    .line 192
    .line 193
    .line 194
    throw v0

    .line 195
    :cond_6
    if-ne v0, v9, :cond_7

    .line 196
    .line 197
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    .line 198
    .line 199
    .line 200
    move-result-object v12
    :try_end_7
    .catch Landroid/database/sqlite/SQLiteFullException; {:try_start_7 .. :try_end_7} :catch_3
    .catch Landroid/database/sqlite/SQLiteDatabaseLockedException; {:try_start_7 .. :try_end_7} :catch_a
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_7 .. :try_end_7} :catch_2
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 201
    :try_start_8
    array-length v0, v13

    .line 202
    invoke-virtual {v12, v13, v6, v0}, Landroid/os/Parcel;->unmarshall([BII)V

    .line 203
    .line 204
    .line 205
    invoke-virtual {v12, v6}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 206
    .line 207
    .line 208
    sget-object v0, Lcom/google/android/gms/measurement/internal/zzon;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 209
    .line 210
    invoke-interface {v0, v12}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    .line 211
    .line 212
    .line 213
    move-result-object v0

    .line 214
    check-cast v0, Lcom/google/android/gms/measurement/internal/zzon;
    :try_end_8
    .catch Lcom/google/android/gms/common/internal/safeparcel/SafeParcelReader$ParseException; {:try_start_8 .. :try_end_8} :catch_5
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    .line 215
    .line 216
    :try_start_9
    invoke-virtual {v12}, Landroid/os/Parcel;->recycle()V
    :try_end_9
    .catch Landroid/database/sqlite/SQLiteFullException; {:try_start_9 .. :try_end_9} :catch_3
    .catch Landroid/database/sqlite/SQLiteDatabaseLockedException; {:try_start_9 .. :try_end_9} :catch_a
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_9 .. :try_end_9} :catch_2
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    .line 217
    .line 218
    .line 219
    goto :goto_4

    .line 220
    :catchall_3
    move-exception v0

    .line 221
    goto :goto_5

    .line 222
    :catch_5
    :try_start_a
    invoke-virtual {v1}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 223
    .line 224
    .line 225
    move-result-object v0

    .line 226
    invoke-virtual {v0}, Ll/d6x0;->A()Ll/l8x0;

    .line 227
    .line 228
    .line 229
    move-result-object v0

    .line 230
    const-string v13, "Failed to load user property from local database"

    .line 231
    .line 232
    invoke-virtual {v0, v13}, Ll/l8x0;->a(Ljava/lang/String;)V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_3

    .line 233
    .line 234
    .line 235
    :try_start_b
    invoke-virtual {v12}, Landroid/os/Parcel;->recycle()V

    .line 236
    .line 237
    .line 238
    move-object v0, v3

    .line 239
    :goto_4
    if-eqz v0, :cond_5

    .line 240
    .line 241
    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 242
    .line 243
    .line 244
    goto/16 :goto_2

    .line 245
    .line 246
    :goto_5
    invoke-virtual {v12}, Landroid/os/Parcel;->recycle()V

    .line 247
    .line 248
    .line 249
    throw v0

    .line 250
    :cond_7
    if-ne v0, v12, :cond_8

    .line 251
    .line 252
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    .line 253
    .line 254
    .line 255
    move-result-object v12
    :try_end_b
    .catch Landroid/database/sqlite/SQLiteFullException; {:try_start_b .. :try_end_b} :catch_3
    .catch Landroid/database/sqlite/SQLiteDatabaseLockedException; {:try_start_b .. :try_end_b} :catch_a
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_b .. :try_end_b} :catch_2
    .catchall {:try_start_b .. :try_end_b} :catchall_1

    .line 256
    :try_start_c
    array-length v0, v13

    .line 257
    invoke-virtual {v12, v13, v6, v0}, Landroid/os/Parcel;->unmarshall([BII)V

    .line 258
    .line 259
    .line 260
    invoke-virtual {v12, v6}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 261
    .line 262
    .line 263
    sget-object v0, Lcom/google/android/gms/measurement/internal/zzae;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 264
    .line 265
    invoke-interface {v0, v12}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    .line 266
    .line 267
    .line 268
    move-result-object v0

    .line 269
    check-cast v0, Lcom/google/android/gms/measurement/internal/zzae;
    :try_end_c
    .catch Lcom/google/android/gms/common/internal/safeparcel/SafeParcelReader$ParseException; {:try_start_c .. :try_end_c} :catch_6
    .catchall {:try_start_c .. :try_end_c} :catchall_4

    .line 270
    .line 271
    :try_start_d
    invoke-virtual {v12}, Landroid/os/Parcel;->recycle()V
    :try_end_d
    .catch Landroid/database/sqlite/SQLiteFullException; {:try_start_d .. :try_end_d} :catch_3
    .catch Landroid/database/sqlite/SQLiteDatabaseLockedException; {:try_start_d .. :try_end_d} :catch_a
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_d .. :try_end_d} :catch_2
    .catchall {:try_start_d .. :try_end_d} :catchall_1

    .line 272
    .line 273
    .line 274
    goto :goto_6

    .line 275
    :catchall_4
    move-exception v0

    .line 276
    goto :goto_7

    .line 277
    :catch_6
    :try_start_e
    invoke-virtual {v1}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 278
    .line 279
    .line 280
    move-result-object v0

    .line 281
    invoke-virtual {v0}, Ll/d6x0;->A()Ll/l8x0;

    .line 282
    .line 283
    .line 284
    move-result-object v0

    .line 285
    const-string v13, "Failed to load conditional user property from local database"

    .line 286
    .line 287
    invoke-virtual {v0, v13}, Ll/l8x0;->a(Ljava/lang/String;)V
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_4

    .line 288
    .line 289
    .line 290
    :try_start_f
    invoke-virtual {v12}, Landroid/os/Parcel;->recycle()V

    .line 291
    .line 292
    .line 293
    move-object v0, v3

    .line 294
    :goto_6
    if-eqz v0, :cond_5

    .line 295
    .line 296
    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 297
    .line 298
    .line 299
    goto/16 :goto_2

    .line 300
    .line 301
    :goto_7
    invoke-virtual {v12}, Landroid/os/Parcel;->recycle()V

    .line 302
    .line 303
    .line 304
    throw v0

    .line 305
    :cond_8
    const/4 v12, 0x3

    .line 306
    if-ne v0, v12, :cond_9

    .line 307
    .line 308
    invoke-virtual {v1}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 309
    .line 310
    .line 311
    move-result-object v0

    .line 312
    invoke-virtual {v0}, Ll/d6x0;->F()Ll/l8x0;

    .line 313
    .line 314
    .line 315
    move-result-object v0

    .line 316
    const-string v12, "Skipping app launch break"

    .line 317
    .line 318
    invoke-virtual {v0, v12}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 319
    .line 320
    .line 321
    goto/16 :goto_2

    .line 322
    .line 323
    :cond_9
    invoke-virtual {v1}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 324
    .line 325
    .line 326
    move-result-object v0

    .line 327
    invoke-virtual {v0}, Ll/d6x0;->A()Ll/l8x0;

    .line 328
    .line 329
    .line 330
    move-result-object v0

    .line 331
    const-string v12, "Unknown record type in local database"

    .line 332
    .line 333
    invoke-virtual {v0, v12}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 334
    .line 335
    .line 336
    goto/16 :goto_2

    .line 337
    .line 338
    :cond_a
    const-string v0, "messages"

    .line 339
    .line 340
    const-string v12, "rowid <= ?"

    .line 341
    .line 342
    invoke-static/range {v19 .. v20}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    .line 343
    .line 344
    .line 345
    move-result-object v13

    .line 346
    filled-new-array {v13}, [Ljava/lang/String;

    .line 347
    .line 348
    .line 349
    move-result-object v13

    .line 350
    invoke-virtual {v10, v0, v12, v13}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 351
    .line 352
    .line 353
    move-result v0

    .line 354
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 355
    .line 356
    .line 357
    move-result v12

    .line 358
    if-ge v0, v12, :cond_b

    .line 359
    .line 360
    invoke-virtual {v1}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 361
    .line 362
    .line 363
    move-result-object v0

    .line 364
    invoke-virtual {v0}, Ll/d6x0;->A()Ll/l8x0;

    .line 365
    .line 366
    .line 367
    move-result-object v0

    .line 368
    const-string v12, "Fewer entries removed from local database than expected"

    .line 369
    .line 370
    invoke-virtual {v0, v12}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 371
    .line 372
    .line 373
    :cond_b
    invoke-virtual {v10}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V

    .line 374
    .line 375
    .line 376
    invoke-virtual {v10}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_f
    .catch Landroid/database/sqlite/SQLiteFullException; {:try_start_f .. :try_end_f} :catch_3
    .catch Landroid/database/sqlite/SQLiteDatabaseLockedException; {:try_start_f .. :try_end_f} :catch_a
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_f .. :try_end_f} :catch_2
    .catchall {:try_start_f .. :try_end_f} :catchall_1

    .line 377
    .line 378
    .line 379
    invoke-interface {v11}, Landroid/database/Cursor;->close()V

    .line 380
    .line 381
    .line 382
    invoke-virtual {v10}, Landroid/database/sqlite/SQLiteClosable;->close()V

    .line 383
    .line 384
    .line 385
    return-object v4

    .line 386
    :catch_7
    move-object v11, v3

    .line 387
    goto :goto_9

    .line 388
    :catchall_5
    move-exception v0

    .line 389
    move-object v10, v3

    .line 390
    goto :goto_c

    .line 391
    :catch_8
    move-exception v0

    .line 392
    move-object v10, v3

    .line 393
    move-object v11, v10

    .line 394
    :goto_8
    if-eqz v10, :cond_c

    .line 395
    .line 396
    :try_start_10
    invoke-virtual {v10}, Landroid/database/sqlite/SQLiteDatabase;->inTransaction()Z

    .line 397
    .line 398
    .line 399
    move-result v12

    .line 400
    if-eqz v12, :cond_c

    .line 401
    .line 402
    invoke-virtual {v10}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 403
    .line 404
    .line 405
    :cond_c
    invoke-virtual {v1}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 406
    .line 407
    .line 408
    move-result-object v12

    .line 409
    invoke-virtual {v12}, Ll/d6x0;->A()Ll/l8x0;

    .line 410
    .line 411
    .line 412
    move-result-object v12

    .line 413
    invoke-virtual {v12, v2, v0}, Ll/l8x0;->b(Ljava/lang/String;Ljava/lang/Object;)V

    .line 414
    .line 415
    .line 416
    iput-boolean v9, v1, Ll/zvw0;->d:Z
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_1

    .line 417
    .line 418
    if-eqz v11, :cond_d

    .line 419
    .line 420
    invoke-interface {v11}, Landroid/database/Cursor;->close()V

    .line 421
    .line 422
    .line 423
    :cond_d
    if-eqz v10, :cond_10

    .line 424
    .line 425
    invoke-virtual {v10}, Landroid/database/sqlite/SQLiteClosable;->close()V

    .line 426
    .line 427
    .line 428
    goto :goto_b

    .line 429
    :catch_9
    move-object v10, v3

    .line 430
    move-object v11, v10

    .line 431
    :catch_a
    :goto_9
    int-to-long v12, v8

    .line 432
    :try_start_11
    invoke-static {v12, v13}, Landroid/os/SystemClock;->sleep(J)V
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_1

    .line 433
    .line 434
    .line 435
    add-int/lit8 v8, v8, 0x14

    .line 436
    .line 437
    if-eqz v11, :cond_e

    .line 438
    .line 439
    invoke-interface {v11}, Landroid/database/Cursor;->close()V

    .line 440
    .line 441
    .line 442
    :cond_e
    if-eqz v10, :cond_10

    .line 443
    .line 444
    invoke-virtual {v10}, Landroid/database/sqlite/SQLiteClosable;->close()V

    .line 445
    .line 446
    .line 447
    goto :goto_b

    .line 448
    :catch_b
    move-exception v0

    .line 449
    move-object v10, v3

    .line 450
    move-object v11, v10

    .line 451
    :goto_a
    :try_start_12
    invoke-virtual {v1}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 452
    .line 453
    .line 454
    move-result-object v12

    .line 455
    invoke-virtual {v12}, Ll/d6x0;->A()Ll/l8x0;

    .line 456
    .line 457
    .line 458
    move-result-object v12

    .line 459
    invoke-virtual {v12, v2, v0}, Ll/l8x0;->b(Ljava/lang/String;Ljava/lang/Object;)V

    .line 460
    .line 461
    .line 462
    iput-boolean v9, v1, Ll/zvw0;->d:Z
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_1

    .line 463
    .line 464
    if-eqz v11, :cond_f

    .line 465
    .line 466
    invoke-interface {v11}, Landroid/database/Cursor;->close()V

    .line 467
    .line 468
    .line 469
    :cond_f
    if-eqz v10, :cond_10

    .line 470
    .line 471
    invoke-virtual {v10}, Landroid/database/sqlite/SQLiteClosable;->close()V

    .line 472
    .line 473
    .line 474
    :cond_10
    :goto_b
    add-int/lit8 v7, v7, 0x1

    .line 475
    .line 476
    goto/16 :goto_0

    .line 477
    .line 478
    :goto_c
    if-eqz v3, :cond_11

    .line 479
    .line 480
    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    .line 481
    .line 482
    .line 483
    :cond_11
    if-eqz v10, :cond_12

    .line 484
    .line 485
    invoke-virtual {v10}, Landroid/database/sqlite/SQLiteClosable;->close()V

    .line 486
    .line 487
    .line 488
    :cond_12
    throw v0

    .line 489
    :cond_13
    invoke-virtual {v1}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 490
    .line 491
    .line 492
    move-result-object v0

    .line 493
    invoke-virtual {v0}, Ll/d6x0;->F()Ll/l8x0;

    .line 494
    .line 495
    .line 496
    move-result-object v0

    .line 497
    const-string v1, "Failed to read events from database in reasonable time"

    .line 498
    .line 499
    invoke-virtual {v0, v1}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 500
    .line 501
    .line 502
    return-object v3
.end method

.method public final x(I[B)Z
    .locals 17
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    invoke-virtual {v1}, Ll/yyx0;->h()V

    .line 4
    .line 5
    .line 6
    iget-boolean v0, v1, Ll/zvw0;->d:Z

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    return v2

    .line 12
    :cond_0
    new-instance v3, Landroid/content/ContentValues;

    .line 13
    .line 14
    invoke-direct {v3}, Landroid/content/ContentValues;-><init>()V

    .line 15
    .line 16
    .line 17
    const-string v0, "type"

    .line 18
    .line 19
    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 20
    .line 21
    .line 22
    move-result-object v4

    .line 23
    invoke-virtual {v3, v0, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 24
    .line 25
    .line 26
    const-string v0, "entry"

    .line 27
    .line 28
    move-object/from16 v4, p2

    .line 29
    .line 30
    invoke-virtual {v3, v0, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    .line 31
    .line 32
    .line 33
    const/4 v4, 0x5

    .line 34
    move v5, v2

    .line 35
    move v6, v4

    .line 36
    :goto_0
    if-ge v5, v4, :cond_d

    .line 37
    .line 38
    const/4 v7, 0x0

    .line 39
    const/4 v8, 0x1

    .line 40
    :try_start_0
    invoke-virtual {v1}, Ll/zvw0;->E()Landroid/database/sqlite/SQLiteDatabase;

    .line 41
    .line 42
    .line 43
    move-result-object v9
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteFullException; {:try_start_0 .. :try_end_0} :catch_10
    .catch Landroid/database/sqlite/SQLiteDatabaseLockedException; {:try_start_0 .. :try_end_0} :catch_f
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_e
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 44
    if-nez v9, :cond_2

    .line 45
    .line 46
    :try_start_1
    iput-boolean v8, v1, Ll/zvw0;->d:Z
    :try_end_1
    .catch Landroid/database/sqlite/SQLiteFullException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Landroid/database/sqlite/SQLiteDatabaseLockedException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 47
    .line 48
    if-eqz v9, :cond_1

    .line 49
    .line 50
    invoke-virtual {v9}, Landroid/database/sqlite/SQLiteClosable;->close()V

    .line 51
    .line 52
    .line 53
    :cond_1
    return v2

    .line 54
    :catchall_0
    move-exception v0

    .line 55
    goto/16 :goto_e

    .line 56
    .line 57
    :catch_0
    move-exception v0

    .line 58
    move/from16 v16, v2

    .line 59
    .line 60
    move-object v10, v7

    .line 61
    :goto_1
    move/from16 p2, v8

    .line 62
    .line 63
    :goto_2
    move-object v7, v9

    .line 64
    goto/16 :goto_9

    .line 65
    .line 66
    :catch_1
    move/from16 v16, v2

    .line 67
    .line 68
    goto/16 :goto_b

    .line 69
    .line 70
    :catch_2
    move-exception v0

    .line 71
    move/from16 v16, v2

    .line 72
    .line 73
    goto/16 :goto_c

    .line 74
    .line 75
    :cond_2
    :try_start_2
    invoke-virtual {v9}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 76
    .line 77
    .line 78
    const-string v0, "select count(1) from messages"

    .line 79
    .line 80
    invoke-virtual {v9, v0, v7}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    .line 81
    .line 82
    .line 83
    move-result-object v10
    :try_end_2
    .catch Landroid/database/sqlite/SQLiteFullException; {:try_start_2 .. :try_end_2} :catch_d
    .catch Landroid/database/sqlite/SQLiteDatabaseLockedException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_2 .. :try_end_2} :catch_c
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 84
    if-eqz v10, :cond_3

    .line 85
    .line 86
    :try_start_3
    invoke-interface {v10}, Landroid/database/Cursor;->moveToFirst()Z

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    if-eqz v0, :cond_3

    .line 91
    .line 92
    invoke-interface {v10, v2}, Landroid/database/Cursor;->getLong(I)J

    .line 93
    .line 94
    .line 95
    move-result-wide v11
    :try_end_3
    .catch Landroid/database/sqlite/SQLiteFullException; {:try_start_3 .. :try_end_3} :catch_5
    .catch Landroid/database/sqlite/SQLiteDatabaseLockedException; {:try_start_3 .. :try_end_3} :catch_4
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_3 .. :try_end_3} :catch_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 96
    goto :goto_5

    .line 97
    :catchall_1
    move-exception v0

    .line 98
    :goto_3
    move-object v7, v10

    .line 99
    goto/16 :goto_e

    .line 100
    .line 101
    :catch_3
    move-exception v0

    .line 102
    move/from16 v16, v2

    .line 103
    .line 104
    goto :goto_1

    .line 105
    :catch_4
    move/from16 v16, v2

    .line 106
    .line 107
    goto/16 :goto_8

    .line 108
    .line 109
    :catch_5
    move-exception v0

    .line 110
    move/from16 v16, v2

    .line 111
    .line 112
    :goto_4
    move-object v7, v10

    .line 113
    goto/16 :goto_c

    .line 114
    .line 115
    :cond_3
    const-wide/16 v11, 0x0

    .line 116
    .line 117
    :goto_5
    const-wide/32 v13, 0x186a0

    .line 118
    .line 119
    .line 120
    cmp-long v0, v11, v13

    .line 121
    .line 122
    const-string v13, "messages"

    .line 123
    .line 124
    if-ltz v0, :cond_4

    .line 125
    .line 126
    :try_start_4
    invoke-virtual {v1}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    invoke-virtual {v0}, Ll/d6x0;->A()Ll/l8x0;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    const-string v14, "Data loss, local db full"

    .line 135
    .line 136
    invoke-virtual {v0, v14}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    const-wide/32 v14, 0x186a1

    .line 140
    .line 141
    .line 142
    sub-long/2addr v14, v11

    .line 143
    const-string v0, "rowid in (select rowid from messages order by rowid asc limit ?)"

    .line 144
    .line 145
    invoke-static {v14, v15}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object v11

    .line 149
    filled-new-array {v11}, [Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v11

    .line 153
    invoke-virtual {v9, v13, v0, v11}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 154
    .line 155
    .line 156
    move-result v0

    .line 157
    int-to-long v11, v0

    .line 158
    cmp-long v0, v11, v14

    .line 159
    .line 160
    if-eqz v0, :cond_4

    .line 161
    .line 162
    invoke-virtual {v1}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    invoke-virtual {v0}, Ll/d6x0;->A()Ll/l8x0;

    .line 167
    .line 168
    .line 169
    move-result-object v0
    :try_end_4
    .catch Landroid/database/sqlite/SQLiteFullException; {:try_start_4 .. :try_end_4} :catch_a
    .catch Landroid/database/sqlite/SQLiteDatabaseLockedException; {:try_start_4 .. :try_end_4} :catch_4
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_4 .. :try_end_4} :catch_3
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 170
    move/from16 v16, v2

    .line 171
    .line 172
    :try_start_5
    const-string v2, "Different delete count than expected in local db. expected, received, difference"

    .line 173
    .line 174
    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 175
    .line 176
    .line 177
    move-result-object v4
    :try_end_5
    .catch Landroid/database/sqlite/SQLiteFullException; {:try_start_5 .. :try_end_5} :catch_9
    .catch Landroid/database/sqlite/SQLiteDatabaseLockedException; {:try_start_5 .. :try_end_5} :catch_b
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_5 .. :try_end_5} :catch_8
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 178
    move/from16 p2, v8

    .line 179
    .line 180
    :try_start_6
    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 181
    .line 182
    .line 183
    move-result-object v8

    .line 184
    sub-long/2addr v14, v11

    .line 185
    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 186
    .line 187
    .line 188
    move-result-object v11

    .line 189
    invoke-virtual {v0, v2, v4, v8, v11}, Ll/l8x0;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 190
    .line 191
    .line 192
    goto :goto_7

    .line 193
    :catch_6
    move-exception v0

    .line 194
    goto/16 :goto_2

    .line 195
    .line 196
    :catch_7
    move-exception v0

    .line 197
    goto :goto_4

    .line 198
    :catch_8
    move-exception v0

    .line 199
    goto/16 :goto_1

    .line 200
    .line 201
    :catch_9
    move-exception v0

    .line 202
    :goto_6
    move/from16 p2, v8

    .line 203
    .line 204
    goto :goto_4

    .line 205
    :catch_a
    move-exception v0

    .line 206
    move/from16 v16, v2

    .line 207
    .line 208
    goto :goto_6

    .line 209
    :cond_4
    move/from16 v16, v2

    .line 210
    .line 211
    move/from16 p2, v8

    .line 212
    .line 213
    :goto_7
    invoke-virtual {v9, v13, v7, v3}, Landroid/database/sqlite/SQLiteDatabase;->insertOrThrow(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 214
    .line 215
    .line 216
    invoke-virtual {v9}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V

    .line 217
    .line 218
    .line 219
    invoke-virtual {v9}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_6
    .catch Landroid/database/sqlite/SQLiteFullException; {:try_start_6 .. :try_end_6} :catch_7
    .catch Landroid/database/sqlite/SQLiteDatabaseLockedException; {:try_start_6 .. :try_end_6} :catch_b
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_6 .. :try_end_6} :catch_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 220
    .line 221
    .line 222
    if-eqz v10, :cond_5

    .line 223
    .line 224
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    .line 225
    .line 226
    .line 227
    :cond_5
    invoke-virtual {v9}, Landroid/database/sqlite/SQLiteClosable;->close()V

    .line 228
    .line 229
    .line 230
    return p2

    .line 231
    :catch_b
    :goto_8
    move-object v7, v10

    .line 232
    goto :goto_b

    .line 233
    :catch_c
    move-exception v0

    .line 234
    move/from16 v16, v2

    .line 235
    .line 236
    move/from16 p2, v8

    .line 237
    .line 238
    move-object v10, v7

    .line 239
    goto/16 :goto_2

    .line 240
    .line 241
    :catch_d
    move-exception v0

    .line 242
    move/from16 v16, v2

    .line 243
    .line 244
    move/from16 p2, v8

    .line 245
    .line 246
    goto :goto_c

    .line 247
    :catchall_2
    move-exception v0

    .line 248
    move-object v9, v7

    .line 249
    goto/16 :goto_e

    .line 250
    .line 251
    :catch_e
    move-exception v0

    .line 252
    move/from16 v16, v2

    .line 253
    .line 254
    move/from16 p2, v8

    .line 255
    .line 256
    move-object v10, v7

    .line 257
    :goto_9
    if-eqz v7, :cond_6

    .line 258
    .line 259
    :try_start_7
    invoke-virtual {v7}, Landroid/database/sqlite/SQLiteDatabase;->inTransaction()Z

    .line 260
    .line 261
    .line 262
    move-result v2

    .line 263
    if-eqz v2, :cond_6

    .line 264
    .line 265
    invoke-virtual {v7}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 266
    .line 267
    .line 268
    goto :goto_a

    .line 269
    :catchall_3
    move-exception v0

    .line 270
    move-object v9, v7

    .line 271
    goto/16 :goto_3

    .line 272
    .line 273
    :cond_6
    :goto_a
    invoke-virtual {v1}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 274
    .line 275
    .line 276
    move-result-object v2

    .line 277
    invoke-virtual {v2}, Ll/d6x0;->A()Ll/l8x0;

    .line 278
    .line 279
    .line 280
    move-result-object v2

    .line 281
    const-string v4, "Error writing entry to local database"

    .line 282
    .line 283
    invoke-virtual {v2, v4, v0}, Ll/l8x0;->b(Ljava/lang/String;Ljava/lang/Object;)V

    .line 284
    .line 285
    .line 286
    move/from16 v2, p2

    .line 287
    .line 288
    iput-boolean v2, v1, Ll/zvw0;->d:Z
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    .line 289
    .line 290
    if-eqz v10, :cond_7

    .line 291
    .line 292
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    .line 293
    .line 294
    .line 295
    :cond_7
    if-eqz v7, :cond_a

    .line 296
    .line 297
    invoke-virtual {v7}, Landroid/database/sqlite/SQLiteClosable;->close()V

    .line 298
    .line 299
    .line 300
    goto :goto_d

    .line 301
    :catch_f
    move/from16 v16, v2

    .line 302
    .line 303
    move-object v9, v7

    .line 304
    :goto_b
    int-to-long v10, v6

    .line 305
    :try_start_8
    invoke-static {v10, v11}, Landroid/os/SystemClock;->sleep(J)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 306
    .line 307
    .line 308
    add-int/lit8 v6, v6, 0x14

    .line 309
    .line 310
    if-eqz v7, :cond_8

    .line 311
    .line 312
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 313
    .line 314
    .line 315
    :cond_8
    if-eqz v9, :cond_a

    .line 316
    .line 317
    invoke-virtual {v9}, Landroid/database/sqlite/SQLiteClosable;->close()V

    .line 318
    .line 319
    .line 320
    goto :goto_d

    .line 321
    :catch_10
    move-exception v0

    .line 322
    move/from16 v16, v2

    .line 323
    .line 324
    move-object v9, v7

    .line 325
    :goto_c
    :try_start_9
    invoke-virtual {v1}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 326
    .line 327
    .line 328
    move-result-object v2

    .line 329
    invoke-virtual {v2}, Ll/d6x0;->A()Ll/l8x0;

    .line 330
    .line 331
    .line 332
    move-result-object v2

    .line 333
    const-string v4, "Error writing entry; local database full"

    .line 334
    .line 335
    invoke-virtual {v2, v4, v0}, Ll/l8x0;->b(Ljava/lang/String;Ljava/lang/Object;)V

    .line 336
    .line 337
    .line 338
    const/4 v2, 0x1

    .line 339
    iput-boolean v2, v1, Ll/zvw0;->d:Z
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 340
    .line 341
    if-eqz v7, :cond_9

    .line 342
    .line 343
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 344
    .line 345
    .line 346
    :cond_9
    if-eqz v9, :cond_a

    .line 347
    .line 348
    invoke-virtual {v9}, Landroid/database/sqlite/SQLiteClosable;->close()V

    .line 349
    .line 350
    .line 351
    :cond_a
    :goto_d
    add-int/lit8 v5, v5, 0x1

    .line 352
    .line 353
    move/from16 v2, v16

    .line 354
    .line 355
    const/4 v4, 0x5

    .line 356
    goto/16 :goto_0

    .line 357
    .line 358
    :goto_e
    if-eqz v7, :cond_b

    .line 359
    .line 360
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 361
    .line 362
    .line 363
    :cond_b
    if-eqz v9, :cond_c

    .line 364
    .line 365
    invoke-virtual {v9}, Landroid/database/sqlite/SQLiteClosable;->close()V

    .line 366
    .line 367
    .line 368
    :cond_c
    throw v0

    .line 369
    :cond_d
    move/from16 v16, v2

    .line 370
    .line 371
    invoke-virtual {v1}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 372
    .line 373
    .line 374
    move-result-object v0

    .line 375
    invoke-virtual {v0}, Ll/d6x0;->E()Ll/l8x0;

    .line 376
    .line 377
    .line 378
    move-result-object v0

    .line 379
    const-string v1, "Failed to write entry to local database"

    .line 380
    .line 381
    invoke-virtual {v0, v1}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 382
    .line 383
    .line 384
    return v16
.end method

.method public final y(Lcom/google/android/gms/measurement/internal/zzae;)Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/yyx0;->e()Ll/hny0;

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/hny0;->k0(Landroid/os/Parcelable;)[B

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    array-length v0, p1

    .line 9
    const/high16 v1, 0x20000

    .line 10
    .line 11
    if-le v0, v1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Ll/d6x0;->C()Ll/l8x0;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const-string p1, "Conditional user property too long for local database. Sending directly to service"

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    const/4 p0, 0x0

    .line 27
    return p0

    .line 28
    :cond_0
    const/4 v0, 0x2

    .line 29
    invoke-virtual {p0, v0, p1}, Ll/zvw0;->x(I[B)Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    return p0
.end method

.method public final z(Lcom/google/android/gms/measurement/internal/zzbf;)Z
    .locals 3

    .line 1
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {p1, v0, v1}, Lcom/google/android/gms/measurement/internal/zzbf;->writeToParcel(Landroid/os/Parcel;I)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/os/Parcel;->marshall()[B

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 14
    .line 15
    .line 16
    array-length v0, p1

    .line 17
    const/high16 v2, 0x20000

    .line 18
    .line 19
    if-le v0, v2, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Ll/d6x0;->C()Ll/l8x0;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const-string p1, "Event is too long for local database. Sending event directly to service"

    .line 30
    .line 31
    invoke-virtual {p0, p1}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    return v1

    .line 35
    :cond_0
    invoke-virtual {p0, v1, p1}, Ll/zvw0;->x(I[B)Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    return p0
.end method

.method public final bridge synthetic zza()Landroid/content/Context;
    .locals 0
    .annotation runtime Lorg/checkerframework/dataflow/qual/Pure;
    .end annotation

    .line 1
    invoke-super {p0}, Ll/yyx0;->zza()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final bridge synthetic zzb()Lcom/google/android/gms/common/util/Clock;
    .locals 0
    .annotation runtime Lorg/checkerframework/dataflow/qual/Pure;
    .end annotation

    .line 1
    invoke-super {p0}, Ll/yyx0;->zzb()Lcom/google/android/gms/common/util/Clock;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final bridge synthetic zzd()Ll/zbr0;
    .locals 0
    .annotation runtime Lorg/checkerframework/dataflow/qual/Pure;
    .end annotation

    .line 1
    invoke-super {p0}, Ll/yyx0;->zzd()Ll/zbr0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final bridge synthetic zzj()Ll/d6x0;
    .locals 0
    .annotation runtime Lorg/checkerframework/dataflow/qual/Pure;
    .end annotation

    .line 1
    invoke-super {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final bridge synthetic zzl()Ll/qsx0;
    .locals 0
    .annotation runtime Lorg/checkerframework/dataflow/qual/Pure;
    .end annotation

    .line 1
    invoke-super {p0}, Ll/yyx0;->zzl()Ll/qsx0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
