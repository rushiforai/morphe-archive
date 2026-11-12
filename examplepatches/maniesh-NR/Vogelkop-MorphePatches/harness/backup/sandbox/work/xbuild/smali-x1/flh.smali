.class public final synthetic Lflh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lesk;


# instance fields
.field public final synthetic a:Lglh;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:J


# direct methods
.method public synthetic constructor <init>(Lglh;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lflh;->a:Lglh;

    iput-object p2, p0, Lflh;->b:Ljava/lang/String;

    iput-object p3, p0, Lflh;->c:Ljava/lang/String;

    iput-object p4, p0, Lflh;->d:Ljava/lang/String;

    iput-wide p5, p0, Lflh;->e:J

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 14

    iget-object v0, p0, Lflh;->d:Ljava/lang/String;

    const-string v1, "multipart/related"

    iget-object v2, p0, Lflh;->a:Lglh;

    iget-object v3, v2, Lglh;->a:Ljlh;

    iget-object v4, p0, Lflh;->b:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljlh;->k(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v5

    const/4 v6, 0x3

    iget-object v7, p0, Lflh;->c:Ljava/lang/String;

    if-eqz v5, :cond_53

    invoke-static {v5}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v5

    const/4 v8, 0x1

    invoke-virtual {v3, v5, v8}, Ljlh;->h(Ljava/util/Collection;Z)Ljava/util/ArrayList;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v9

    const/4 v10, 0x0

    :cond_21
    :goto_21
    if-ge v10, v9, :cond_35

    invoke-virtual {v8, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    add-int/lit8 v10, v10, 0x1

    check-cast v11, Ljava/lang/String;

    invoke-virtual {v11, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_21

    invoke-virtual {v2, v11}, Lglh;->b(Ljava/lang/String;)V

    goto :goto_21

    :cond_35
    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    new-instance v8, Lr40;

    const-string v9, ","

    invoke-direct {v8, v9, v6}, Lr40;-><init>(Ljava/lang/String;B)V

    check-cast v5, Ljava/util/Collection;

    invoke-virtual {v8, v5}, Lr40;->b(Ljava/util/Collection;)Ljava/lang/String;

    move-result-object v5

    filled-new-array {v5}, [Ljava/lang/Object;

    move-result-object v5

    const-string v8, "DELETE FROM reading WHERE id IN (%1$s)"

    invoke-static {v8, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :cond_53
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    :try_start_5e
    new-instance v3, Landroid/content/ContentValues;

    invoke-direct {v3}, Landroid/content/ContentValues;-><init>()V

    const-string v5, "url"

    invoke-virtual {v3, v5, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v4, "title"

    invoke-virtual {v3, v4, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "content_path"

    invoke-virtual {v3, v0, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "content_mime_type"

    invoke-virtual {v3, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_77
    .catchall {:try_start_5e .. :try_end_77} :catchall_ac

    const-wide/16 v0, -0x1

    iget-wide v4, p0, Lflh;->e:J

    cmp-long p0, v4, v0

    if-lez p0, :cond_88

    :try_start_7f
    const-string p0, "filesize"

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v3, p0, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    :cond_88
    const-string p0, "timestamp"

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v3, p0, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string p0, "transcoded"

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v3, p0, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string p0, "reading"

    const/4 v0, 0x0

    invoke-virtual {v2, p0, v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v0

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_a4
    .catchall {:try_start_7f .. :try_end_a4} :catchall_ac

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    return-object p0

    :catchall_ac
    move-exception p0

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw p0
.end method
