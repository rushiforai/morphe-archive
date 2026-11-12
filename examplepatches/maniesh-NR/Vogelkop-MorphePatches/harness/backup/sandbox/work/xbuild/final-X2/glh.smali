.class public final Lglh;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljlh;

.field public final b:Lh7f;

.field public final c:Lumi;

.field public final d:Lqie;

.field public final e:Landroid/content/ContentResolver;

.field public final f:Lsyd;

.field public final g:Ljava/util/HashSet;

.field public h:Ljava/io/File;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lumi;Lsyd;)V
    .registers 12

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lh7f;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lglh;->b:Lh7f;

    new-instance v0, Lqie;

    const/16 v1, 0x13

    invoke-direct {v0, v1}, Lqie;-><init>(B)V

    iput-object v0, p0, Lglh;->d:Lqie;

    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    iput-object v1, p0, Lglh;->g:Ljava/util/HashSet;

    iput-object p2, p0, Lglh;->c:Lumi;

    new-instance v2, Ljlh;

    const/4 v6, 0x5

    const/4 v7, 0x0

    const-string v4, "reading.db"

    const/4 v5, 0x0

    move-object v3, p1

    invoke-direct/range {v2 .. v7}, Ljlh;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;IB)V

    iput-object v2, p0, Lglh;->a:Ljlh;

    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    iput-object p1, p0, Lglh;->e:Landroid/content/ContentResolver;

    new-instance p1, Low3;

    const/16 v1, 0x8

    invoke-direct {p1, p0, v3, v1}, Low3;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {p2, p1}, Ltcl;->b(Lesk;)Lnml;

    move-result-object p1

    new-instance v1, Loml;

    invoke-direct {v1, p1}, Loml;-><init>(Lnml;)V

    invoke-virtual {v0, v1, v5}, Lqie;->n(Loml;Ljava/lang/Object;)Lp1j;

    iput-object p3, p0, Lglh;->f:Lsyd;

    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 p3, 0x1e

    if-lt p1, p3, :cond_59

    invoke-static {v3}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p1

    iget-object p1, p1, Lru9;->a:Landroid/content/SharedPreferences;

    const-string p3, "readinglist.access_after_upgrade.all_access"

    const/4 v1, 0x0

    invoke-interface {p1, p3, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    if-eqz p1, :cond_5a

    :cond_59
    return-void

    :cond_5a
    new-instance p1, Ldlh;

    invoke-direct {p1, p0, v1}, Ldlh;-><init>(Lglh;B)V

    invoke-interface {p2, p1}, Ltcl;->b(Lesk;)Lnml;

    move-result-object p1

    new-instance p3, Lmgf;

    const/16 v1, 0xc

    invoke-direct {p3, p0, v3, v1}, Lmgf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p2, p3}, Lumi;->f(Ln5o;)Lnml;

    move-result-object p0

    invoke-virtual {p1, p0}, Lnml;->b(Lnml;)V

    new-instance p0, Loml;

    invoke-direct {p0, p1}, Loml;-><init>(Lnml;)V

    invoke-virtual {v0, p0, v5}, Lqie;->n(Loml;Ljava/lang/Object;)Lp1j;

    return-void
.end method


# virtual methods
.method public final a(Ljava/util/Collection;Z)V
    .registers 6

    new-instance v0, Lbu3;

    const/4 v1, 0x4

    invoke-direct {v0, v1, p0, p1, p2}, Lbu3;-><init>(BLjava/lang/Object;Ljava/lang/Object;Z)V

    iget-object p2, p0, Lglh;->c:Lumi;

    invoke-interface {p2, v0}, Ltcl;->c(Ljava/lang/Runnable;)Lnml;

    move-result-object v0

    new-instance v1, Lq2g;

    const/16 v2, 0x13

    invoke-direct {v1, p0, p1, v2}, Lq2g;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {p2, v1}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object p1

    invoke-virtual {v0, p1}, Lnml;->b(Lnml;)V

    new-instance p1, Loml;

    invoke-direct {p1, v0}, Loml;-><init>(Lnml;)V

    const/4 p2, 0x0

    iget-object p0, p0, Lglh;->d:Lqie;

    invoke-virtual {p0, p1, p2}, Lqie;->n(Loml;Ljava/lang/Object;)Lp1j;

    return-void
.end method

.method public final b(Ljava/lang/String;)V
    .registers 5

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    const-string v1, "content"

    invoke-virtual {v0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_16

    :try_start_10
    iget-object p0, p0, Lglh;->e:Landroid/content/ContentResolver;

    invoke-static {p0, v0}, Landroid/provider/DocumentsContract;->deleteDocument(Landroid/content/ContentResolver;Landroid/net/Uri;)Z
    :try_end_15
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_15} :catch_15

    :catch_15
    return-void

    :cond_16
    new-instance p0, Ljava/io/File;

    const-string v1, "file"

    invoke-virtual {v0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_28

    invoke-virtual {v0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object p1

    :cond_28
    invoke-direct {p0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    return-void
.end method

.method public final c(Lcom/opera/api/Callback;J)V
    .registers 6

    new-instance v0, Lgc9;

    const/4 v1, 0x1

    invoke-direct {v0, p0, p2, p3, v1}, Lgc9;-><init>(Ljava/lang/Object;JB)V

    iget-object p2, p0, Lglh;->c:Lumi;

    invoke-interface {p2, v0}, Ltcl;->b(Lesk;)Lnml;

    move-result-object p3

    new-instance v0, Llw0;

    const/4 v1, 0x7

    invoke-direct {v0, p1, v1}, Llw0;-><init>(Lcom/opera/api/Callback;B)V

    invoke-virtual {p2, v0}, Lumi;->f(Ln5o;)Lnml;

    move-result-object p1

    invoke-virtual {p3, p1}, Lnml;->b(Lnml;)V

    new-instance p1, Loml;

    invoke-direct {p1, p3}, Loml;-><init>(Lnml;)V

    const/4 p2, 0x0

    iget-object p0, p0, Lglh;->d:Lqie;

    invoke-virtual {p0, p1, p2}, Lqie;->n(Loml;Ljava/lang/Object;)Lp1j;

    return-void
.end method

.method public final d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLxx1;)V
    .registers 14

    new-instance v0, Lflh;

    move-object v1, p0

    move-object v3, p1

    move-object v4, p2

    move-object v2, p3

    move-wide v5, p4

    invoke-direct/range {v0 .. v6}, Lflh;-><init>(Lglh;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    iget-object p0, v1, Lglh;->c:Lumi;

    invoke-interface {p0, v0}, Ltcl;->b(Lesk;)Lnml;

    move-result-object p1

    new-instance p2, Lmgf;

    invoke-direct {p2, v1, p6, v2}, Lmgf;-><init>(Lglh;Lxx1;Ljava/lang/String;)V

    invoke-virtual {p0, p2}, Lumi;->f(Ln5o;)Lnml;

    move-result-object p0

    invoke-virtual {p1, p0}, Lnml;->b(Lnml;)V

    new-instance p0, Loml;

    invoke-direct {p0, p1}, Loml;-><init>(Lnml;)V

    const/4 p1, 0x0

    iget-object p2, v1, Lglh;->d:Lqie;

    invoke-virtual {p2, p0, p1}, Lqie;->n(Loml;Ljava/lang/Object;)Lp1j;

    return-void
.end method

.method public final e()Z
    .registers 3

    iget-object p0, p0, Lglh;->f:Lsyd;

    iget-object p0, p0, Lsyd;->c:Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    const-string v0, "active"

    const/4 v1, 0x0

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    return p0
.end method

.method public final f(Lcom/opera/api/Callback;)V
    .registers 6

    new-instance v0, Ldlh;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Ldlh;-><init>(Lglh;B)V

    iget-object v1, p0, Lglh;->c:Lumi;

    invoke-interface {v1, v0}, Ltcl;->b(Lesk;)Lnml;

    move-result-object v0

    new-instance v2, Llw0;

    const/4 v3, 0x6

    invoke-direct {v2, p1, v3}, Llw0;-><init>(Lcom/opera/api/Callback;B)V

    invoke-virtual {v1, v2}, Lumi;->f(Ln5o;)Lnml;

    move-result-object p1

    invoke-virtual {v0, p1}, Lnml;->b(Lnml;)V

    new-instance p1, Loml;

    invoke-direct {p1, v0}, Loml;-><init>(Lnml;)V

    const/4 v0, 0x0

    iget-object p0, p0, Lglh;->d:Lqie;

    invoke-virtual {p0, p1, v0}, Lqie;->n(Loml;Ljava/lang/Object;)Lp1j;

    return-void
.end method

.method public final g(JZ)V
    .registers 5

    iget-object v0, p0, Lglh;->g:Ljava/util/HashSet;

    if-eqz p3, :cond_f

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_19

    goto :goto_2f

    :cond_f
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2f

    :cond_19
    iget-object p0, p0, Lglh;->b:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_1f
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_2f

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lclh;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    goto :goto_1f

    :cond_2f
    :goto_2f
    return-void
.end method

.method public final h(Ljava/lang/Runnable;Ljava/lang/String;J)V
    .registers 13

    new-instance v0, Lelh;

    const/4 v5, 0x1

    move-object v1, p0

    move-object v4, p2

    move-wide v2, p3

    invoke-direct/range {v0 .. v5}, Lelh;-><init>(Lglh;JLjava/lang/String;B)V

    iget-object v6, p0, Lglh;->c:Lumi;

    invoke-interface {v6, v0}, Ltcl;->c(Ljava/lang/Runnable;)Lnml;

    move-result-object v7

    new-instance v0, Lni2;

    const/4 v5, 0x5

    move-object v4, p1

    invoke-direct/range {v0 .. v5}, Lni2;-><init>(Ljava/lang/Object;JLjava/lang/Object;B)V

    invoke-interface {v6, v0}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object v0

    invoke-virtual {v7, v0}, Lnml;->b(Lnml;)V

    new-instance v0, Loml;

    invoke-direct {v0, v7}, Loml;-><init>(Lnml;)V

    const/4 v2, 0x0

    iget-object v1, p0, Lglh;->d:Lqie;

    invoke-virtual {v1, v0, v2}, Lqie;->n(Loml;Ljava/lang/Object;)Lp1j;

    return-void
.end method

.method public final i(Ljava/util/ArrayList;)V
    .registers 19

    move-object/from16 v0, p0

    invoke-virtual/range {p1 .. p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    :cond_7
    :goto_7
    if-ge v2, v1, :cond_d8

    move-object/from16 v3, p1

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v2, v2, 0x1

    check-cast v4, Lilh;

    iget-object v5, v4, Lilh;->i:Ljava/lang/Long;

    iget-object v6, v4, Lilh;->e:Ljava/lang/String;

    if-nez v5, :cond_7

    const-wide/16 v7, 0x0

    if-eqz v6, :cond_2d

    new-instance v5, Ljava/io/File;

    invoke-direct {v5, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/io/File;->isDirectory()Z

    move-result v6

    if-nez v6, :cond_2d

    invoke-virtual {v5}, Ljava/io/File;->length()J

    move-result-wide v5

    goto :goto_2e

    :cond_2d
    move-wide v5, v7

    :goto_2e
    iget-object v9, v4, Lilh;->f:Ljava/lang/String;

    invoke-static {v9}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v11

    const-string v10, "content"

    invoke-virtual {v11}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v10, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_7d

    iget-object v10, v0, Lglh;->e:Landroid/content/ContentResolver;

    const-string v9, "_size"

    filled-new-array {v9}, [Ljava/lang/String;

    move-result-object v12

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/4 v13, 0x0

    :try_start_4d
    invoke-virtual/range {v10 .. v15}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v10
    :try_end_51
    .catch Ljava/lang/Exception; {:try_start_4d .. :try_end_51} :catch_77
    .catchall {:try_start_4d .. :try_end_51} :catchall_70

    :try_start_51
    invoke-interface {v10}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v11

    if-eqz v11, :cond_65

    invoke-interface {v10, v9}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v9

    invoke-interface {v10, v9}, Landroid/database/Cursor;->isNull(I)Z

    move-result v11

    if-nez v11, :cond_65

    invoke-interface {v10, v9}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v7
    :try_end_65
    .catch Ljava/lang/Exception; {:try_start_51 .. :try_end_65} :catch_6d
    .catchall {:try_start_51 .. :try_end_65} :catchall_69

    :cond_65
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    goto :goto_9c

    :catchall_69
    move-exception v0

    move-object/from16 v16, v10

    goto :goto_71

    :catch_6d
    move-object/from16 v16, v10

    goto :goto_77

    :catchall_70
    move-exception v0

    :goto_71
    if-eqz v16, :cond_76

    invoke-interface/range {v16 .. v16}, Landroid/database/Cursor;->close()V

    :cond_76
    throw v0

    :catch_77
    :goto_77
    if-eqz v16, :cond_9c

    invoke-interface/range {v16 .. v16}, Landroid/database/Cursor;->close()V

    goto :goto_9c

    :cond_7d
    new-instance v10, Ljava/io/File;

    const-string v12, "file"

    invoke-virtual {v11}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_8f

    invoke-virtual {v11}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v9

    :cond_8f
    invoke-direct {v10, v9}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10}, Ljava/io/File;->isDirectory()Z

    move-result v9

    if-nez v9, :cond_9c

    invoke-virtual {v10}, Ljava/io/File;->length()J

    move-result-wide v7

    :cond_9c
    :goto_9c
    add-long/2addr v5, v7

    iget-wide v7, v4, Lilh;->a:J

    iget-object v9, v0, Lglh;->a:Ljlh;

    invoke-virtual {v9}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v9

    invoke-virtual {v9}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    :try_start_a8
    const-string v10, "id=?"

    invoke-static {v7, v8}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v7

    filled-new-array {v7}, [Ljava/lang/String;

    move-result-object v7

    new-instance v8, Landroid/content/ContentValues;

    invoke-direct {v8}, Landroid/content/ContentValues;-><init>()V

    const-string v11, "filesize"

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v12

    invoke-virtual {v8, v11, v12}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v11, "reading"

    invoke-virtual {v9, v11, v8, v10, v7}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    invoke-virtual {v9}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_c8
    .catchall {:try_start_a8 .. :try_end_c8} :catchall_d3

    invoke-virtual {v9}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    iput-object v5, v4, Lilh;->i:Ljava/lang/Long;

    goto/16 :goto_7

    :catchall_d3
    move-exception v0

    invoke-virtual {v9}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    :cond_d8
    return-void
.end method
