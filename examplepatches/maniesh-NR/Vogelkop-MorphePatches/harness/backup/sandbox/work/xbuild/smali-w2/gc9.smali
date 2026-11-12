.class public final synthetic Lgc9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lesk;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:J

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;JB)V
    .registers 5

    iput-byte p4, p0, Lgc9;->a:B

    iput-object p1, p0, Lgc9;->c:Ljava/lang/Object;

    iput-wide p2, p0, Lgc9;->b:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 13

    iget-byte v0, p0, Lgc9;->a:B

    const/4 v1, 0x0

    iget-wide v2, p0, Lgc9;->b:J

    iget-object p0, p0, Lgc9;->c:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_ae

    check-cast p0, Lglh;

    iget-object p0, p0, Lglh;->a:Ljlh;

    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v4

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/String;

    move-result-object v8

    :try_start_1a
    new-instance p0, Lhlh;

    const-string v5, "reading"

    sget-object v6, Ljlh;->b:[Ljava/lang/String;

    const-string v7, "id=?"

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v9, 0x0

    invoke-virtual/range {v4 .. v11}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    invoke-direct {p0, v0}, Lhlh;-><init>(Landroid/database/Cursor;)V
    :try_end_2c
    .catchall {:try_start_1a .. :try_end_2c} :catchall_3e

    :try_start_2c
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_37

    new-instance v1, Lilh;

    invoke-direct {v1, p0}, Lilh;-><init>(Lhlh;)V
    :try_end_37
    .catchall {:try_start_2c .. :try_end_37} :catchall_3b

    :cond_37
    invoke-static {p0}, Lxvg;->l(Ljava/io/Closeable;)V

    return-object v1

    :catchall_3b
    move-exception v0

    move-object v1, p0

    goto :goto_3f

    :catchall_3e
    move-exception v0

    :goto_3f
    invoke-static {v1}, Lxvg;->l(Ljava/io/Closeable;)V

    throw v0

    :pswitch_43
    check-cast p0, Lpc9;

    invoke-virtual {p0}, Lpc9;->c()Ljvd;

    move-result-object v0

    iget-object v0, v0, Ljvd;->a:Lcom/opera/android/touch/MessageDatabase_Impl;

    new-instance v4, Lx41;

    const/16 v5, 0xc

    invoke-direct {v4, v2, v3, v5}, Lx41;-><init>(JB)V

    const/4 v5, 0x0

    const/4 v6, 0x1

    invoke-static {v0, v5, v6, v4}, Lkfo;->Y(Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    iget-object p0, p0, Lpc9;->j:Ljc9;

    if-eqz p0, :cond_ac

    iget-object p0, p0, Ljc9;->a:Ljava/util/HashMap;

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    if-nez v0, :cond_6b

    const/4 p0, -0x1

    goto :goto_a6

    :cond_6b
    invoke-virtual {p0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_73
    :goto_73
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_a2

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-le v3, v4, :cond_73

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    sub-int/2addr v3, v6

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map$Entry;->setValue(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_73

    :cond_a2
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    :goto_a6
    if-ltz p0, :cond_ac

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    :cond_ac
    return-object v1

    nop

    :pswitch_data_ae
    .packed-switch 0x0
        :pswitch_43
    .end packed-switch
.end method
