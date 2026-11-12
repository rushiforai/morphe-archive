.class public final Liri;
.super Landroid/database/sqlite/SQLiteOpenHelper;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 5

    const/4 v0, 0x0

    const/4 v1, 0x2

    const-string v2, "searchengines.db"

    invoke-direct {p0, p1, v2, v0, v1}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    iput-object p1, p0, Liri;->a:Landroid/content/Context;

    return-void
.end method

.method public static o(ILandroid/database/sqlite/SQLiteDatabase;)V
    .registers 5

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    :try_start_3
    const-string v0, "searchengines"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v2, 0x5

    invoke-static {v2}, Lfki;->u(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p0}, Lvep;->A(I)I

    move-result p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p0, v1}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_29
    .catchall {:try_start_3 .. :try_end_29} :catchall_2d

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    return-void

    :catchall_2d
    move-exception p0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw p0
.end method

.method public static p(Ljava/util/concurrent/Callable;Landroid/database/sqlite/SQLiteDatabase;)Ljava/lang/Object;
    .registers 4

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    :try_start_3
    invoke-interface {p0}, Ljava/util/concurrent/Callable;->call()Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_a} :catch_e
    .catchall {:try_start_3 .. :try_end_a} :catchall_17

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    return-object p0

    :catch_e
    move-exception p0

    :try_start_f
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Database update failed."

    invoke-direct {v0, v1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
    :try_end_17
    .catchall {:try_start_f .. :try_end_17} :catchall_17

    :catchall_17
    move-exception p0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw p0
.end method


# virtual methods
.method public final getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;
    .registers 2

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Liri;->h(Z)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p0

    return-object p0
.end method

.method public final getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;
    .registers 2

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Liri;->h(Z)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p0

    return-object p0
.end method

.method public final h(Z)Landroid/database/sqlite/SQLiteDatabase;
    .registers 3

    if-eqz p1, :cond_7

    :try_start_2
    invoke-super {p0}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p0

    return-object p0

    :cond_7
    invoke-super {p0}, Landroid/database/sqlite/SQLiteOpenHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p0
    :try_end_b
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_2 .. :try_end_b} :catch_c

    return-object p0

    :catch_c
    invoke-virtual {p0}, Liri;->k()Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_15

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    :cond_15
    if-eqz p1, :cond_1c

    invoke-super {p0}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p0

    goto :goto_20

    :cond_1c
    invoke-super {p0}, Landroid/database/sqlite/SQLiteOpenHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p0

    :goto_20
    return-object p0
.end method

.method public k()Ljava/io/File;
    .registers 2
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/opera/android/annotations/RequiredForTest;
    .end annotation

    iget-object p0, p0, Liri;->a:Landroid/content/Context;

    const-string v0, "searchengines.db"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getDatabasePath(Ljava/lang/String;)Ljava/io/File;

    move-result-object p0

    return-object p0
.end method

.method public final l(Lwzg;Lp1;Lk6e;)Ljava/util/ArrayList;
    .registers 22

    move-object/from16 v0, p3

    const-string v1, ", "

    const-string v2, " FROM searchengines ORDER BY "

    const-string v3, "SELECT "

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object/from16 v7, p0

    :try_start_11
    invoke-virtual {v7, v5}, Liri;->h(Z)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v7

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/4 v3, 0x1

    invoke-static {v3}, Lfki;->u(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v9, 0x2

    invoke-static {v9}, Lfki;->u(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v9, 0x3

    invoke-static {v9}, Lfki;->u(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v9, 0x4

    invoke-static {v9}, Lfki;->u(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v9, 0x5

    invoke-static {v9}, Lfki;->u(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v10, 0x6

    invoke-static {v10}, Lfki;->u(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v9}, Lfki;->u(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v2, 0x8

    invoke-static {v2}, Lfki;->u(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v1, 0x7

    invoke-static {v1}, Lfki;->u(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v7, v1, v6}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_14a

    :goto_88
    const-string v1, "id"

    invoke-interface {v6, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v6, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    const-string v7, "title"

    invoke-interface {v6, v7}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v7

    invoke-interface {v6, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v12

    const-string v7, "url"

    invoke-interface {v6, v7}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v7

    invoke-interface {v6, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v13

    const-string v7, "icon"

    invoke-interface {v6, v7}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v7

    invoke-interface {v6, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v14

    invoke-static {v9}, Lvep;->B(I)[I

    move-result-object v7

    const-string v8, "source"

    invoke-interface {v6, v8}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v8

    invoke-interface {v6, v8}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v10

    long-to-int v8, v10

    aget v11, v7, v8

    const-string v7, "suggest_url"

    invoke-interface {v6, v7}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v7

    invoke-interface {v6, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v15

    if-eq v11, v9, :cond_112

    invoke-static {v13}, Ll6e;->p(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_ef

    new-instance v10, Lf1a;

    new-instance v7, Li6e;

    invoke-direct {v7, v0, v5}, Li6e;-><init>(Lk6e;B)V

    new-instance v8, Li6e;

    invoke-direct {v8, v0, v3}, Li6e;-><init>(Lk6e;B)V

    move-object/from16 v16, v15

    move v15, v11

    move-object v11, v12

    move-object v12, v13

    move-object v13, v14

    move-object/from16 v14, v16

    move-object/from16 v16, v7

    move-object/from16 v17, v8

    invoke-direct/range {v10 .. v17}, Lf1a;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILi6e;Li6e;)V

    goto :goto_137

    :cond_ef
    sget-object v7, Lwqm;->a:[Ljava/lang/String;

    invoke-static {v13}, Laik;->g(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "\\."

    invoke-virtual {v7, v8}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v7

    array-length v8, v7

    move v10, v5

    :goto_fd
    if-ge v10, v8, :cond_112

    aget-object v3, v7, v10

    const-string v5, "yandex"

    invoke-virtual {v5, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_10f

    new-instance v10, Lfco;

    invoke-direct/range {v10 .. v15}, Ll6e;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_137

    :cond_10f
    add-int/lit8 v10, v10, 0x1

    goto :goto_fd

    :cond_112
    if-eq v11, v9, :cond_132

    sget-object v3, Ll6e;->k:Lhr5;

    const-string v3, "opera-aria://ui/"

    invoke-virtual {v13, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_124

    new-instance v10, Ll42;

    invoke-direct/range {v10 .. v15}, Ll6e;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_137

    :cond_124
    const-string v3, "https://chatgpt.com/?q"

    invoke-virtual {v13, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_132

    new-instance v10, Liu4;

    invoke-direct/range {v10 .. v15}, Ll6e;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_137

    :cond_132
    new-instance v10, Ll6e;

    invoke-direct/range {v10 .. v15}, Ll6e;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :goto_137
    move-object/from16 v3, p1

    iput-object v3, v10, Ll6e;->i:Lwzg;

    move-object/from16 v5, p2

    iput-object v5, v10, Ll6e;->g:Lpqk;

    iput-wide v1, v10, Ll6e;->b:J

    invoke-virtual {v4, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-interface {v6}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1
    :try_end_148
    .catchall {:try_start_11 .. :try_end_148} :catchall_152

    if-nez v1, :cond_14e

    :cond_14a
    invoke-static {v6}, Lxvg;->l(Ljava/io/Closeable;)V

    return-object v4

    :cond_14e
    const/4 v3, 0x1

    const/4 v5, 0x0

    goto/16 :goto_88

    :catchall_152
    move-exception v0

    invoke-static {v6}, Lxvg;->l(Ljava/io/Closeable;)V

    throw v0
.end method

.method public final m(Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .registers 14

    new-instance v0, Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_10

    return-object v0

    :cond_10
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Liri;->h(Z)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p0

    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    const/4 v1, 0x0

    const/4 v2, 0x0

    :try_start_1a
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lj6e;

    iget-object v3, v3, Lj6e;->a:Ll6e;

    iget v3, v3, Ll6e;->h:I

    new-instance v4, Lgt6;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    invoke-direct {v4, p0, v5, v6}, Lgt6;-><init>(Landroid/database/sqlite/SQLiteDatabase;J)V
    :try_end_2d
    .catchall {:try_start_1a .. :try_end_2d} :catchall_60

    :try_start_2d
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v2

    const-wide/16 v5, 0x0

    move-wide v7, v5

    :goto_34
    if-ge v1, v2, :cond_54

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    add-int/lit8 v1, v1, 0x1

    check-cast v9, Lj6e;

    iget-object v10, v9, Lj6e;->a:Ll6e;

    iget v10, v10, Ll6e;->h:I

    if-eq v10, v3, :cond_46

    move-wide v7, v5

    move v3, v10

    :cond_46
    const-wide/16 v10, 0x1

    add-long/2addr v10, v7

    invoke-virtual {v4, v9, v7, v8}, Lgt6;->k(Lj6e;J)Ll6e;

    move-result-object v7

    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move-wide v7, v10

    goto :goto_34

    :goto_52
    move-object v2, v4

    goto :goto_61

    :cond_54
    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_57
    .catchall {:try_start_2d .. :try_end_57} :catchall_5e

    invoke-static {v4}, Lxvg;->l(Ljava/io/Closeable;)V

    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    return-object v0

    :catchall_5e
    move-exception p1

    goto :goto_52

    :catchall_60
    move-exception p1

    :goto_61
    invoke-static {v2}, Lxvg;->l(Ljava/io/Closeable;)V

    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw p1
.end method

.method public final n(Ll6e;)Z
    .registers 8

    iget-wide v0, p1, Ll6e;->b:J

    const-wide/16 v2, 0x0

    cmp-long p1, v0, v2

    const/4 v2, 0x0

    if-gez p1, :cond_a

    return v2

    :cond_a
    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Liri;->h(Z)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p0

    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    :try_start_12
    const-string v3, "searchengines"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p1}, Lfki;->u(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, " = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p0, v3, v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_34
    .catchall {:try_start_12 .. :try_end_34} :catchall_3b

    if-lez v0, :cond_37

    move v2, p1

    :cond_37
    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    return v2

    :catchall_3b
    move-exception p1

    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw p1
.end method

.method public final onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .registers 10

    new-instance p0, Ljava/lang/StringBuilder;

    const-string v0, "CREATE TABLE searchengines ("

    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/16 v0, 0x8

    invoke-static {v0}, Lvep;->B(I)[I

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_f
    if-ge v2, v1, :cond_55

    aget v3, v0, v2

    const/4 v4, 0x0

    packed-switch v3, :pswitch_data_68

    throw v4

    :pswitch_18
    const-string v5, "timestamp"

    goto :goto_2f

    :pswitch_1b
    const-string v5, "position"

    goto :goto_2f

    :pswitch_1e
    const-string v5, "suggest_url"

    goto :goto_2f

    :pswitch_21
    const-string v5, "source"

    goto :goto_2f

    :pswitch_24
    const-string v5, "icon"

    goto :goto_2f

    :pswitch_27
    const-string v5, "url"

    goto :goto_2f

    :pswitch_2a
    const-string v5, "title"

    goto :goto_2f

    :pswitch_2d
    const-string v5, "id"

    :goto_2f
    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v5, 0x20

    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v5, "INTEGER NOT NULL DEFAULT 0"

    const-string v6, "TEXT NULL"

    const-string v7, "TEXT NOT NULL"

    packed-switch v3, :pswitch_data_7c

    throw v4

    :pswitch_41
    const-string v5, "INTEGER NOT NULL"

    goto :goto_4a

    :pswitch_44
    move-object v5, v6

    goto :goto_4a

    :pswitch_46
    move-object v5, v7

    goto :goto_4a

    :pswitch_48
    const-string v5, "INTEGER PRIMARY KEY AUTOINCREMENT"

    :goto_4a
    :pswitch_4a
    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v3, 0x2c

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v2, v2, 0x1

    goto :goto_f

    :cond_55
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    const/16 v1, 0x29

    invoke-virtual {p0, v0, v1}, Ljava/lang/StringBuilder;->setCharAt(IC)V

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    return-void

    :pswitch_data_68
    .packed-switch 0x1
        :pswitch_2d
        :pswitch_2a
        :pswitch_27
        :pswitch_24
        :pswitch_21
        :pswitch_1e
        :pswitch_1b
        :pswitch_18
    .end packed-switch

    :pswitch_data_7c
    .packed-switch 0x1
        :pswitch_48
        :pswitch_46
        :pswitch_46
        :pswitch_44
        :pswitch_41
        :pswitch_44
        :pswitch_4a
        :pswitch_4a
    .end packed-switch
.end method

.method public final onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .registers 5

    const/4 v0, 0x1

    if-ne p2, v0, :cond_e

    const/4 p2, 0x2

    if-lt p3, p2, :cond_e

    new-instance p2, Ly97;

    invoke-direct {p2, p0, p1}, Ly97;-><init>(Liri;Landroid/database/sqlite/SQLiteDatabase;)V

    invoke-static {p2, p1}, Liri;->p(Ljava/util/concurrent/Callable;Landroid/database/sqlite/SQLiteDatabase;)Ljava/lang/Object;

    :cond_e
    return-void
.end method

.method public final q(Ll6e;Ljava/lang/String;)Z
    .registers 8

    const-string v0, "=?"

    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Liri;->h(Z)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p0

    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    :try_start_a
    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    const-string v3, "icon"

    invoke-virtual {v2, v3, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v1}, Lfki;->u(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    iget-wide v3, p1, Ll6e;->b:J

    invoke-static {v3, v4}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object p1

    filled-new-array {p1}, [Ljava/lang/String;

    move-result-object p1

    const-string v0, "searchengines"

    invoke-virtual {p0, v0, v2, p2, p1}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result p1

    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_2f
    .catchall {:try_start_a .. :try_end_2f} :catchall_36

    if-gtz p1, :cond_32

    const/4 v1, 0x0

    :cond_32
    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    return v1

    :catchall_36
    move-exception p1

    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw p1
.end method
