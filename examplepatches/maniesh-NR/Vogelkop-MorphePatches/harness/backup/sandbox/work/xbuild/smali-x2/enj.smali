.class public final synthetic Lenj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lvnj;

.field public final synthetic c:Llnj;

.field public final synthetic d:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lvnj;Llnj;Ljava/lang/String;B)V
    .registers 5

    iput-byte p4, p0, Lenj;->a:B

    iput-object p1, p0, Lenj;->b:Lvnj;

    iput-object p2, p0, Lenj;->c:Llnj;

    iput-object p3, p0, Lenj;->d:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 19

    move-object/from16 v0, p0

    iget-byte v1, v0, Lenj;->a:B

    const-string v2, "id"

    const/4 v3, 0x0

    iget-object v4, v0, Lenj;->d:Ljava/lang/String;

    iget-object v5, v0, Lenj;->c:Llnj;

    iget-object v0, v0, Lenj;->b:Lvnj;

    const/4 v6, 0x0

    packed-switch v1, :pswitch_data_122

    iget-object v1, v5, Llnj;->a:Lmnj;

    iget-object v7, v0, Lvnj;->h:Landroid/database/sqlite/SQLiteDatabase;

    if-nez v7, :cond_19

    move-object v8, v3

    goto :goto_1a

    :cond_19
    move-object v8, v7

    :goto_1a
    filled-new-array {v2}, [Ljava/lang/String;

    move-result-object v10

    filled-new-array {v4}, [Ljava/lang/String;

    move-result-object v12

    const/4 v14, 0x0

    const/4 v15, 0x0

    const-string v9, "icons"

    const-string v11, "origin=?"

    const/4 v13, 0x0

    invoke-virtual/range {v8 .. v15}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    check-cast v2, Ljava/io/Closeable;

    :try_start_2f
    move-object v4, v2

    check-cast v4, Landroid/database/Cursor;

    invoke-interface {v4}, Landroid/database/Cursor;->moveToNext()Z

    move-result v7

    if-eqz v7, :cond_65

    invoke-interface {v4, v6}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v6

    new-instance v4, Landroid/content/ContentValues;

    invoke-direct {v4}, Landroid/content/ContentValues;-><init>()V

    const-string v8, "icon"

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-virtual {v4, v8, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    sget v6, Lvnj;->j:I

    invoke-static {v1}, Lybh;->d(Lmnj;)Ljava/lang/String;

    move-result-object v6

    iget-wide v7, v5, Llnj;->b:J

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v4, v6, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    iget-object v0, v0, Lvnj;->h:Landroid/database/sqlite/SQLiteDatabase;

    if-nez v0, :cond_5e

    move-object v0, v3

    :cond_5e
    invoke-static {v1}, Lybh;->x(Lmnj;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    :try_end_65
    .catchall {:try_start_2f .. :try_end_65} :catchall_69

    :cond_65
    invoke-static {v2, v3}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    return-void

    :catchall_69
    move-exception v0

    move-object v1, v0

    :try_start_6b
    throw v1
    :try_end_6c
    .catchall {:try_start_6b .. :try_end_6c} :catchall_6c

    :catchall_6c
    move-exception v0

    invoke-static {v2, v1}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw v0

    :pswitch_71
    invoke-virtual {v0, v5}, Lvnj;->k(Llnj;)V

    iget-object v1, v0, Lvnj;->h:Landroid/database/sqlite/SQLiteDatabase;

    if-nez v1, :cond_7a

    move-object v7, v3

    goto :goto_7b

    :cond_7a
    move-object v7, v1

    :goto_7b
    filled-new-array {v2}, [Ljava/lang/String;

    move-result-object v9

    filled-new-array {v4}, [Ljava/lang/String;

    move-result-object v11

    const/4 v13, 0x0

    const/4 v14, 0x0

    const-string v8, "icons"

    const-string v10, "origin=?"

    const/4 v12, 0x0

    invoke-virtual/range {v7 .. v14}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    check-cast v1, Ljava/io/Closeable;

    :try_start_90
    move-object v2, v1

    check-cast v2, Landroid/database/Cursor;

    invoke-interface {v2}, Landroid/database/Cursor;->moveToNext()Z

    move-result v4

    if-eqz v4, :cond_116

    invoke-interface {v2, v6}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    sget-object v2, Lmnj;->e:Lh58;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v7, Lw4;

    invoke-direct {v7, v2, v6}, Lw4;-><init>(Ljava/lang/Object;B)V

    :cond_a7
    invoke-virtual {v7}, Lw4;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_f6

    invoke-virtual {v7}, Lw4;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lmnj;

    iget-object v8, v0, Lvnj;->h:Landroid/database/sqlite/SQLiteDatabase;

    if-nez v8, :cond_b9

    move-object v9, v3

    goto :goto_ba

    :cond_b9
    move-object v9, v8

    :goto_ba
    sget v8, Lvnj;->j:I

    invoke-static {v2}, Lybh;->x(Lmnj;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v2}, Lybh;->d(Lmnj;)Ljava/lang/String;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/String;

    move-result-object v11

    const-string v12, "icon=?"

    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/String;

    move-result-object v13

    const-string v17, "1"

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    invoke-virtual/range {v9 .. v17}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    check-cast v2, Ljava/io/Closeable;
    :try_end_de
    .catchall {:try_start_90 .. :try_end_de} :catchall_11a

    :try_start_de
    move-object v8, v2

    check-cast v8, Landroid/database/Cursor;

    invoke-interface {v8}, Landroid/database/Cursor;->moveToNext()Z

    move-result v8
    :try_end_e5
    .catchall {:try_start_de .. :try_end_e5} :catchall_ee

    if-eqz v8, :cond_e8

    const/4 v6, 0x1

    :cond_e8
    :try_start_e8
    invoke-static {v2, v3}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V
    :try_end_eb
    .catchall {:try_start_e8 .. :try_end_eb} :catchall_11a

    if-eqz v6, :cond_a7

    goto :goto_f6

    :catchall_ee
    move-exception v0

    move-object v3, v0

    :try_start_f0
    throw v3
    :try_end_f1
    .catchall {:try_start_f0 .. :try_end_f1} :catchall_f1

    :catchall_f1
    move-exception v0

    :try_start_f2
    invoke-static {v2, v3}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw v0

    :cond_f6
    :goto_f6
    if-nez v6, :cond_116

    iget-object v2, v0, Lvnj;->h:Landroid/database/sqlite/SQLiteDatabase;

    if-nez v2, :cond_fd

    move-object v2, v3

    :cond_fd
    const-string v6, "icons"

    const-string v7, "id=?"

    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v8

    filled-new-array {v8}, [Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v2, v6, v7, v8}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    invoke-virtual {v0, v4, v5}, Lvnj;->i(J)Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->delete()Z
    :try_end_113
    .catchall {:try_start_f2 .. :try_end_113} :catchall_11a

    goto :goto_116

    :goto_114
    move-object v2, v0

    goto :goto_11c

    :cond_116
    :goto_116
    invoke-static {v1, v3}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    return-void

    :catchall_11a
    move-exception v0

    goto :goto_114

    :goto_11c
    :try_start_11c
    throw v2
    :try_end_11d
    .catchall {:try_start_11c .. :try_end_11d} :catchall_11d

    :catchall_11d
    move-exception v0

    invoke-static {v1, v2}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw v0

    :pswitch_data_122
    .packed-switch 0x0
        :pswitch_71
    .end packed-switch
.end method
