.class public final synthetic Lis6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lgx6;
.implements Ln5o;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Z

.field public final synthetic c:Ljava/lang/Object;

.field public final synthetic d:Ljava/lang/Object;

.field public final synthetic e:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;ZB)V
    .registers 6

    iput-byte p5, p0, Lis6;->a:B

    iput-object p1, p0, Lis6;->c:Ljava/lang/Object;

    iput-object p2, p0, Lis6;->d:Ljava/lang/Object;

    iput-object p3, p0, Lis6;->e:Ljava/lang/Object;

    iput-boolean p4, p0, Lis6;->b:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;ZLjava/lang/Object;B)V
    .registers 6

    .line 14
    iput-byte p5, p0, Lis6;->a:B

    iput-object p1, p0, Lis6;->c:Ljava/lang/Object;

    iput-object p2, p0, Lis6;->d:Ljava/lang/Object;

    iput-boolean p3, p0, Lis6;->b:Z

    iput-object p4, p0, Lis6;->e:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(I)V
    .registers 11

    iget-object v0, p0, Lis6;->c:Ljava/lang/Object;

    check-cast v0, Ljs6;

    iget-object v1, p0, Lis6;->d:Ljava/lang/Object;

    check-cast v1, Lyzb;

    iget-object v2, p0, Lis6;->e:Ljava/lang/Object;

    check-cast v2, Lzmc;

    iget-object v3, v0, Ljs6;->f:Ljava/lang/Object;

    check-cast v3, Lj4c;

    iget-object v0, v0, Ljs6;->g:Ljava/lang/Object;

    check-cast v0, Lxoc;

    iget-object v1, v1, Lyzb;->b:Ljava/lang/Object;

    check-cast v1, Lqkc;

    iget-boolean v4, v1, Lqkc;->k:Z

    const/4 v5, 0x1

    if-eqz v4, :cond_60

    invoke-static {p1}, Lvep;->A(I)I

    move-result v4

    if-eqz v4, :cond_3b

    if-eq v4, v5, :cond_37

    const/4 v6, 0x2

    if-eq v4, v6, :cond_33

    const/4 v6, 0x3

    if-ne v4, v6, :cond_2f

    const v4, 0x7f14093e

    goto :goto_3e

    :cond_2f
    invoke-static {}, Lh9o;->p()V

    goto :goto_60

    :cond_33
    const v4, 0x7f14093f

    goto :goto_3e

    :cond_37
    const v4, 0x7f140b70

    goto :goto_3e

    :cond_3b
    const v4, 0x7f140940

    :goto_3e
    new-instance v6, Lrxh;

    invoke-direct {v6, v4}, Lrxh;-><init>(I)V

    iget-object v1, v1, Lqkc;->f:Lwub;

    iget-object v1, v1, Lwub;->a:Ljava/lang/Object;

    check-cast v1, Ltkc;

    iget-object v1, v1, Ltkc;->f:Llu3;

    iget-object v1, v1, Llu3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v1}, Lcom/opera/android/BrowserActivity;->J0()Lysj;

    move-result-object v1

    new-instance v4, Lglj;

    const/16 v7, 0x9c4

    invoke-direct {v4, v6, v7}, Lglj;-><init>(Lpxh;I)V

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v6, Lijm;->b:Lijm;

    invoke-virtual {v1, v4, v6}, Lr22;->b(Ljjm;Lijm;)V

    :cond_60
    :goto_60
    invoke-static {p1}, Lvep;->A(I)I

    move-result p1

    iget-boolean p0, p0, Lis6;->b:Z

    if-eqz p1, :cond_91

    if-ne p1, v5, :cond_b9

    sget-object p1, Ltg0;->d:Ltg0;

    invoke-virtual {v0, p1}, Lxoc;->a(Ltg0;)V

    if-eqz p0, :cond_b9

    sget-object p0, Ltg0;->k:Ltg0;

    invoke-virtual {v0, p0}, Lxoc;->a(Ltg0;)V

    invoke-virtual {v3}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lvs6;

    invoke-interface {v2}, Lzmc;->a()Llmc;

    move-result-object p1

    iget-wide v0, p1, Llmc;->a:J

    invoke-interface {v2}, Lzmc;->a()Llmc;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p1, Lapc;->c:Lapc;

    sget-object v2, Lch9;->a:Lch9;

    invoke-virtual {p0, v0, v1, p1, v5}, Lvs6;->d(JLapc;I)V

    return-void

    :cond_91
    sget-object p1, Ltg0;->c:Ltg0;

    invoke-virtual {v0, p1}, Lxoc;->a(Ltg0;)V

    if-eqz p0, :cond_b9

    sget-object p0, Ltg0;->j:Ltg0;

    invoke-virtual {v0, p0}, Lxoc;->a(Ltg0;)V

    invoke-virtual {v3}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    move-object v3, p0

    check-cast v3, Lvs6;

    invoke-interface {v2}, Lzmc;->a()Llmc;

    move-result-object p0

    iget-wide v4, p0, Llmc;->a:J

    invoke-interface {v2}, Lzmc;->a()Llmc;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v6, Lapc;->c:Lapc;

    const/4 v7, 0x1

    sget-object v8, Lch9;->b:Lch9;

    invoke-virtual/range {v3 .. v8}, Lvs6;->b(JLapc;ILch9;)V

    :cond_b9
    return-void
.end method

.method public final g(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 30

    move-object/from16 v0, p0

    iget-byte v1, v0, Lis6;->a:B

    const/4 v2, 0x0

    iget-boolean v3, v0, Lis6;->b:Z

    const/4 v4, 0x0

    iget-object v5, v0, Lis6;->e:Ljava/lang/Object;

    iget-object v6, v0, Lis6;->d:Ljava/lang/Object;

    iget-object v7, v0, Lis6;->c:Ljava/lang/Object;

    packed-switch v1, :pswitch_data_14c

    check-cast v7, Ls14;

    check-cast v6, Landroid/content/ContentResolver;

    check-cast v5, Landroid/net/Uri;

    move-object/from16 v0, p1

    check-cast v0, Landroid/net/Uri;

    iget-object v0, v7, Ls14;->c:Ljava/lang/Object;

    check-cast v0, Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_2b

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result v0

    if-eqz v0, :cond_2f

    :cond_2b
    invoke-virtual {v7, v6, v5, v2, v3}, Ls14;->H(Landroid/content/ContentResolver;Landroid/net/Uri;IZ)Lkln;

    move-result-object v4

    :cond_2f
    return-object v4

    :pswitch_30
    check-cast v7, Lvnj;

    check-cast v6, Llnj;

    check-cast v5, Ljava/lang/String;

    move-object/from16 v0, p1

    check-cast v0, Ljava/lang/Void;

    iget-object v0, v7, Lvnj;->h:Landroid/database/sqlite/SQLiteDatabase;

    if-nez v0, :cond_40

    move-object v8, v4

    goto :goto_41

    :cond_40
    move-object v8, v0

    :goto_41
    sget v0, Lvnj;->j:I

    iget-object v0, v6, Llnj;->a:Lmnj;

    iget-wide v9, v6, Llnj;->b:J

    move-wide v10, v9

    invoke-static {v0}, Lybh;->x(Lmnj;)Ljava/lang/String;

    move-result-object v9

    const-string v1, "icon"

    filled-new-array {v1}, [Ljava/lang/String;

    move-result-object v1

    invoke-static {v0}, Lybh;->d(Lmnj;)Ljava/lang/String;

    move-result-object v6

    const-string v12, "=?"

    invoke-virtual {v6, v12}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v10, v11}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v13

    filled-new-array {v13}, [Ljava/lang/String;

    move-result-object v13

    const/4 v14, 0x0

    const/4 v15, 0x0

    move-object/from16 v16, v12

    move-object v12, v13

    const/4 v13, 0x0

    move-wide/from16 v26, v10

    move-object v10, v1

    move-object/from16 v1, v16

    move-wide/from16 v16, v26

    move-object v11, v6

    invoke-virtual/range {v8 .. v15}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    check-cast v6, Ljava/io/Closeable;

    :try_start_78
    move-object v8, v6

    check-cast v8, Landroid/database/Cursor;

    invoke-interface {v8}, Landroid/database/Cursor;->moveToNext()Z

    move-result v9

    const/4 v10, 0x1

    if-eqz v9, :cond_f1

    invoke-interface {v8, v2}, Landroid/database/Cursor;->isNull(I)Z

    move-result v9

    if-nez v9, :cond_f1

    invoke-interface {v8, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v8

    if-eqz v3, :cond_d2

    iget-object v3, v7, Lvnj;->h:Landroid/database/sqlite/SQLiteDatabase;

    if-nez v3, :cond_95

    move-object/from16 v18, v4

    goto :goto_97

    :cond_95
    move-object/from16 v18, v3

    :goto_97
    const-string v19, "icons"

    const-string v3, "id"

    filled-new-array {v3}, [Ljava/lang/String;

    move-result-object v20

    const-string v21, "id=? AND origin=?"

    invoke-static {v8, v9}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v3

    filled-new-array {v3, v5}, [Ljava/lang/String;

    move-result-object v22

    const/16 v24, 0x0

    const/16 v25, 0x0

    const/16 v23, 0x0

    invoke-virtual/range {v18 .. v25}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v3

    check-cast v3, Ljava/io/Closeable;
    :try_end_b5
    .catchall {:try_start_78 .. :try_end_b5} :catchall_fa

    :try_start_b5
    move-object v5, v3

    check-cast v5, Landroid/database/Cursor;

    invoke-interface {v5}, Landroid/database/Cursor;->moveToNext()Z

    move-result v5
    :try_end_bc
    .catchall {:try_start_b5 .. :try_end_bc} :catchall_ca

    if-eqz v5, :cond_c6

    :try_start_be
    invoke-static {v3, v4}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V
    :try_end_c1
    .catchall {:try_start_be .. :try_end_c1} :catchall_fa

    invoke-static {v6, v4}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    move v2, v10

    goto :goto_f4

    :cond_c6
    :try_start_c6
    invoke-static {v3, v4}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V
    :try_end_c9
    .catchall {:try_start_c6 .. :try_end_c9} :catchall_fa

    goto :goto_d2

    :catchall_ca
    move-exception v0

    move-object v1, v0

    :try_start_cc
    throw v1
    :try_end_cd
    .catchall {:try_start_cc .. :try_end_cd} :catchall_cd

    :catchall_cd
    move-exception v0

    :try_start_ce
    invoke-static {v3, v1}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw v0

    :cond_d2
    :goto_d2
    iget-object v3, v7, Lvnj;->h:Landroid/database/sqlite/SQLiteDatabase;

    if-nez v3, :cond_d7

    move-object v3, v4

    :cond_d7
    invoke-static {v0}, Lybh;->x(Lmnj;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v0}, Lybh;->d(Lmnj;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static/range {v16 .. v17}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v5, v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_ee
    .catchall {:try_start_ce .. :try_end_ee} :catchall_fa

    goto :goto_f1

    :goto_ef
    move-object v1, v0

    goto :goto_fc

    :cond_f1
    :goto_f1
    invoke-static {v6, v4}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    :goto_f4
    xor-int/2addr v2, v10

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :catchall_fa
    move-exception v0

    goto :goto_ef

    :goto_fc
    :try_start_fc
    throw v1
    :try_end_fd
    .catchall {:try_start_fc .. :try_end_fd} :catchall_fd

    :catchall_fd
    move-exception v0

    invoke-static {v6, v1}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw v0

    :pswitch_102
    check-cast v7, Ldx3;

    check-cast v6, Ljava/lang/String;

    check-cast v5, Landroid/graphics/Bitmap;

    move-object/from16 v0, p1

    check-cast v0, Landroid/content/Intent;

    if-nez v0, :cond_112

    invoke-static {v7, v6}, Lm5h;->B(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_131

    :cond_112
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v1

    if-eqz v3, :cond_12a

    sget-object v2, Landroidx/core/graphics/drawable/IconCompat;->k:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Landroidx/core/graphics/drawable/IconCompat;

    const/4 v3, 0x5

    invoke-direct {v2, v3}, Landroidx/core/graphics/drawable/IconCompat;-><init>(I)V

    iput-object v5, v2, Landroidx/core/graphics/drawable/IconCompat;->b:Ljava/lang/Object;

    goto :goto_12e

    :cond_12a
    invoke-static {v5}, Landroidx/core/graphics/drawable/IconCompat;->b(Landroid/graphics/Bitmap;)Landroidx/core/graphics/drawable/IconCompat;

    move-result-object v2

    :goto_12e
    invoke-static {v7, v1, v6, v2, v0}, Lm5h;->y(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroidx/core/graphics/drawable/IconCompat;Landroid/content/Intent;)V

    :goto_131
    return-object v4

    :pswitch_132
    move-object v9, v7

    check-cast v9, Liji;

    move-object v10, v6

    check-cast v10, Landroid/net/Uri;

    move-object v11, v5

    check-cast v11, Ljava/lang/String;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Void;

    new-instance v8, Lgg7;

    const/4 v13, 0x4

    iget-boolean v12, v0, Lis6;->b:Z

    invoke-direct/range {v8 .. v13}, Lgg7;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;ZB)V

    invoke-virtual {v9, v8}, Liji;->s(Lgg7;)V

    return-object v4

    nop

    :pswitch_data_14c
    .packed-switch 0x2
        :pswitch_132
        :pswitch_102
        :pswitch_30
    .end packed-switch
.end method

.method public final h(ILeyl;[I)Lcsh;
    .registers 15

    iget-object v0, p0, Lis6;->c:Ljava/lang/Object;

    check-cast v0, Ljx6;

    iget-object v1, p0, Lis6;->d:Ljava/lang/Object;

    move-object v6, v1

    check-cast v6, Lbx6;

    iget-object v1, p0, Lis6;->e:Ljava/lang/Object;

    check-cast v1, [I

    new-instance v9, Lww6;

    const/4 v2, 0x0

    invoke-direct {v9, v0, v6, v2}, Lww6;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    aget v10, v1, p1

    invoke-static {}, Lh1b;->p()Lz0b;

    move-result-object v0

    move v5, v2

    :goto_1a
    iget v1, p2, Leyl;->a:I

    if-ge v5, v1, :cond_2f

    new-instance v2, Lxw6;

    aget v7, p3, v5

    iget-boolean v8, p0, Lis6;->b:Z

    move v3, p1

    move-object v4, p2

    invoke-direct/range {v2 .. v10}, Lxw6;-><init>(ILeyl;ILbx6;IZLww6;I)V

    invoke-virtual {v0, v2}, Lv0b;->c(Ljava/lang/Object;)V

    add-int/lit8 v5, v5, 0x1

    goto :goto_1a

    :cond_2f
    invoke-virtual {v0}, Lz0b;->g()Lcsh;

    move-result-object p0

    return-object p0
.end method
