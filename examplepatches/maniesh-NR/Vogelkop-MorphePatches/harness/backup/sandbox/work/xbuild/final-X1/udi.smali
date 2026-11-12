.class public final synthetic Ludi;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lwdi;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lydi;

.field public final synthetic c:Ldp2;


# direct methods
.method public synthetic constructor <init>(Lydi;Ldp2;B)V
    .registers 4

    iput-byte p3, p0, Ludi;->a:B

    iput-object p1, p0, Ludi;->b:Lydi;

    iput-object p2, p0, Ludi;->c:Ldp2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 14

    iget-byte v0, p0, Ludi;->a:B

    iget-object v1, p0, Ludi;->c:Ldp2;

    iget-object p0, p0, Ludi;->b:Lydi;

    packed-switch v0, :pswitch_data_168

    move-object v2, p1

    check-cast v2, Landroid/database/sqlite/SQLiteDatabase;

    iget-object p1, p0, Lydi;->d:Lkn2;

    iget v0, p1, Lkn2;->b:I

    invoke-virtual {p0, v2, v1, v0}, Lydi;->m(Landroid/database/sqlite/SQLiteDatabase;Ldp2;I)Ljava/util/ArrayList;

    move-result-object v0

    invoke-static {}, Lmyg;->values()[Lmyg;

    move-result-object v3

    array-length v4, v3

    const/4 v10, 0x0

    move v5, v10

    :goto_1b
    if-ge v5, v4, :cond_53

    aget-object v6, v3, v5

    iget-object v7, v1, Ldp2;->c:Lmyg;

    if-eq v6, v7, :cond_48

    iget v7, p1, Lkn2;->b:I

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v8

    sub-int/2addr v7, v8

    if-lez v7, :cond_53

    invoke-static {}, Ldp2;->a()Ll45;

    move-result-object v8

    iget-object v9, v1, Ldp2;->a:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ll45;->O(Ljava/lang/String;)V

    if-eqz v6, :cond_4b

    iput-object v6, v8, Ll45;->c:Ljava/lang/Object;

    iget-object v6, v1, Ldp2;->b:[B

    iput-object v6, v8, Ll45;->b:Ljava/lang/Object;

    invoke-virtual {v8}, Ll45;->n()Ldp2;

    move-result-object v6

    invoke-virtual {p0, v2, v6, v7}, Lydi;->m(Landroid/database/sqlite/SQLiteDatabase;Ldp2;I)Ljava/util/ArrayList;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    :cond_48
    add-int/lit8 v5, v5, 0x1

    goto :goto_1b

    :cond_4b
    const-string p0, "Null priority"

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 v0, 0x0

    goto/16 :goto_12b

    :cond_53
    new-instance p0, Ljava/util/HashMap;

    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v1, "event_id IN ("

    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move v1, v10

    :goto_60
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v11, 0x1

    if-ge v1, v3, :cond_81

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lfo2;

    iget-wide v3, v3, Lfo2;->a:J

    invoke-virtual {p1, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    sub-int/2addr v3, v11

    if-ge v1, v3, :cond_7e

    const/16 v3, 0x2c

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_7e
    add-int/lit8 v1, v1, 0x1

    goto :goto_60

    :cond_81
    const/16 v1, 0x29

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v1, "name"

    const-string v3, "value"

    const-string v4, "event_id"

    filled-new-array {v4, v1, v3}, [Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v8, 0x0

    const/4 v9, 0x0

    const-string v3, "event_metadata"

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v2 .. v9}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1

    :try_start_9e
    move-object v1, p1

    check-cast v1, Landroid/database/Cursor;

    :goto_a1
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-eqz v2, :cond_d5

    invoke-interface {v1, v10}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {p0, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Set;

    if-nez v4, :cond_c3

    new-instance v4, Ljava/util/HashSet;

    invoke-direct {v4}, Ljava/util/HashSet;-><init>()V

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {p0, v2, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_c3
    new-instance v2, Lxdi;

    invoke-interface {v1, v11}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    const/4 v5, 0x2

    invoke-interface {v1, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v2, v3, v5}, Lxdi;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v4, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_d4
    .catchall {:try_start_9e .. :try_end_d4} :catchall_12c

    goto :goto_a1

    :cond_d5
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    invoke-virtual {v0}, Ljava/util/ArrayList;->listIterator()Ljava/util/ListIterator;

    move-result-object p1

    :cond_dc
    :goto_dc
    invoke-interface {p1}, Ljava/util/ListIterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_12b

    invoke-interface {p1}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lfo2;

    iget-wide v2, v1, Lfo2;->a:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {p0, v4}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_dc

    iget-object v4, v1, Lfo2;->c:Ljn2;

    invoke-virtual {v4}, Ljn2;->c()Lala;

    move-result-object v4

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {p0, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Set;

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_108
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_11c

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lxdi;

    iget-object v7, v6, Lxdi;->a:Ljava/lang/String;

    iget-object v6, v6, Lxdi;->b:Ljava/lang/String;

    invoke-virtual {v4, v7, v6}, Lala;->b(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_108

    :cond_11c
    iget-object v1, v1, Lfo2;->b:Ldp2;

    invoke-virtual {v4}, Lala;->f()Ljn2;

    move-result-object v4

    new-instance v5, Lfo2;

    invoke-direct {v5, v2, v3, v1, v4}, Lfo2;-><init>(JLdp2;Ljn2;)V

    invoke-interface {p1, v5}, Ljava/util/ListIterator;->set(Ljava/lang/Object;)V

    goto :goto_dc

    :cond_12b
    :goto_12b
    return-object v0

    :catchall_12c
    move-exception v0

    move-object p0, v0

    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    throw p0

    :pswitch_132
    check-cast p1, Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p1, v1}, Lydi;->k(Landroid/database/sqlite/SQLiteDatabase;Ldp2;)Ljava/lang/Long;

    move-result-object p1

    if-nez p1, :cond_140

    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_161

    :cond_140
    invoke-virtual {p0}, Lydi;->h()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p0

    invoke-virtual {p1}, Ljava/lang/Long;->toString()Ljava/lang/String;

    move-result-object p1

    filled-new-array {p1}, [Ljava/lang/String;

    move-result-object p1

    const-string v0, "SELECT 1 FROM events WHERE context_id = ? LIMIT 1"

    invoke-virtual {p0, v0, p1}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0

    :try_start_152
    move-object p1, p0

    check-cast p1, Landroid/database/Cursor;

    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result p1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1
    :try_end_15d
    .catchall {:try_start_152 .. :try_end_15d} :catchall_162

    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    move-object p0, p1

    :goto_161
    return-object p0

    :catchall_162
    move-exception v0

    move-object p1, v0

    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    throw p1

    :pswitch_data_168
    .packed-switch 0x0
        :pswitch_132
    .end packed-switch
.end method
