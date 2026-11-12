.class public final synthetic Low3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lesk;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    iput-byte p3, p0, Low3;->a:B

    iput-object p1, p0, Low3;->b:Ljava/lang/Object;

    iput-object p2, p0, Low3;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 17

    move-object/from16 v0, p0

    iget-byte v1, v0, Low3;->a:B

    const/16 v2, 0xa

    const/4 v3, 0x1

    const/4 v4, 0x0

    const/4 v5, 0x0

    iget-object v6, v0, Low3;->c:Ljava/lang/Object;

    iget-object v0, v0, Low3;->b:Ljava/lang/Object;

    packed-switch v1, :pswitch_data_308

    check-cast v0, Lxbf;

    check-cast v6, Ljava/util/HashSet;

    new-instance v1, Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/HashSet;->size()I

    move-result v3

    invoke-direct {v1, v3}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v6}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_21
    :goto_21
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_d0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/net/Uri;

    :try_start_2d
    invoke-virtual {v0, v6}, Lxbf;->C(Landroid/net/Uri;)Landroid/os/ParcelFileDescriptor;

    move-result-object v7
    :try_end_31
    .catch Ljava/lang/IllegalStateException; {:try_start_2d .. :try_end_31} :catch_b0
    .catch Ljava/io/IOException; {:try_start_2d .. :try_end_31} :catch_b0
    .catchall {:try_start_2d .. :try_end_31} :catchall_a3

    :try_start_31
    new-instance v8, Landroid/os/ParcelFileDescriptor$AutoCloseInputStream;

    invoke-direct {v8, v7}, Landroid/os/ParcelFileDescriptor$AutoCloseInputStream;-><init>(Landroid/os/ParcelFileDescriptor;)V
    :try_end_36
    .catch Ljava/lang/IllegalStateException; {:try_start_31 .. :try_end_36} :catch_9e
    .catch Ljava/io/IOException; {:try_start_31 .. :try_end_36} :catch_9e
    .catchall {:try_start_31 .. :try_end_36} :catchall_9b

    :try_start_36
    new-instance v7, Ljava/io/BufferedReader;

    new-instance v9, Ljava/io/InputStreamReader;

    invoke-direct {v9, v8}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v7, v9}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_40
    .catch Ljava/lang/IllegalStateException; {:try_start_36 .. :try_end_40} :catch_96
    .catch Ljava/io/IOException; {:try_start_36 .. :try_end_40} :catch_96
    .catchall {:try_start_36 .. :try_end_40} :catchall_93

    move v8, v2

    move-object v9, v4

    move-object v10, v9

    :goto_43
    :try_start_43
    invoke-virtual {v7}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v11

    if-eqz v11, :cond_86

    invoke-virtual {v11}, Ljava/lang/String;->isEmpty()Z

    move-result v12

    if-nez v12, :cond_86

    add-int/lit8 v12, v8, -0x1

    if-eqz v8, :cond_86

    invoke-virtual {v11, v5}, Ljava/lang/String;->charAt(I)C

    move-result v8

    const/16 v13, 0x20

    if-eq v8, v13, :cond_84

    const-string v8, "Snapshot-Content-Location:"

    invoke-virtual {v11, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_70

    const/16 v8, 0x1a

    invoke-virtual {v11, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lxbf;->w(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    if-eqz v9, :cond_84

    goto :goto_86

    :cond_70
    const-string v8, "Subject:"

    invoke-virtual {v11, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_84

    const/16 v8, 0x8

    invoke-virtual {v11, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lxbf;->w(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9
    :try_end_82
    .catch Ljava/lang/IllegalStateException; {:try_start_43 .. :try_end_82} :catch_8f
    .catch Ljava/io/IOException; {:try_start_43 .. :try_end_82} :catch_8f
    .catchall {:try_start_43 .. :try_end_82} :catchall_8a

    if-nez v10, :cond_86

    :cond_84
    move v8, v12

    goto :goto_43

    :cond_86
    :goto_86
    invoke-static {v7}, Lxvg;->l(Ljava/io/Closeable;)V

    goto :goto_bf

    :catchall_8a
    move-exception v0

    move-object v8, v4

    move-object v4, v7

    move-object v7, v8

    goto :goto_a6

    :catch_8f
    move-object v8, v4

    move-object v10, v9

    move-object v9, v8

    goto :goto_b4

    :catchall_93
    move-exception v0

    move-object v7, v4

    goto :goto_a6

    :catch_96
    move-object v7, v4

    move-object v10, v7

    move-object v9, v8

    move-object v8, v10

    goto :goto_b4

    :catchall_9b
    move-exception v0

    move-object v8, v4

    goto :goto_a6

    :catch_9e
    move-object v9, v4

    move-object v10, v9

    move-object v8, v7

    move-object v7, v10

    goto :goto_b4

    :catchall_a3
    move-exception v0

    move-object v7, v4

    move-object v8, v7

    :goto_a6
    invoke-static {v4}, Lxvg;->l(Ljava/io/Closeable;)V

    invoke-static {v8}, Lxvg;->l(Ljava/io/Closeable;)V

    invoke-static {v7}, Lxvg;->l(Ljava/io/Closeable;)V

    throw v0

    :catch_b0
    move-object v7, v4

    move-object v8, v7

    move-object v9, v8

    move-object v10, v9

    :goto_b4
    invoke-static {v7}, Lxvg;->l(Ljava/io/Closeable;)V

    invoke-static {v9}, Lxvg;->l(Ljava/io/Closeable;)V

    invoke-static {v8}, Lxvg;->l(Ljava/io/Closeable;)V

    move-object v9, v10

    move-object v10, v4

    :goto_bf
    if-nez v9, :cond_c4

    if-eqz v10, :cond_c4

    move-object v9, v10

    :cond_c4
    if-eqz v10, :cond_21

    new-instance v7, Lfxk;

    invoke-direct {v7, v6, v10, v9}, Lfxk;-><init>(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_21

    :cond_d0
    return-object v1

    :pswitch_d1
    check-cast v0, Lj9k;

    check-cast v6, Lcom/opera/android/Lazy;

    iget-object v1, v0, Lj9k;->a:Landroid/app/Activity;

    iget-object v0, v0, Lj9k;->b:Lumi;

    sget-object v3, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    move-object v8, v1

    check-cast v8, Lcom/opera/android/OperaApplication;

    new-instance v1, Lbk5;

    invoke-virtual {v8}, Lcom/opera/android/OperaApplication;->i()Ljk5;

    move-result-object v3

    iget-object v4, v8, Lcom/opera/android/OperaApplication;->A:Lj4c;

    invoke-virtual {v4}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Llpe;

    new-instance v7, Ls49;

    const/4 v9, 0x4

    invoke-direct {v7, v9}, Ls49;-><init>(B)V

    new-instance v14, Lik5;

    new-instance v9, Lfch;

    invoke-direct {v9, v7}, Lfch;-><init>(Lhcb;)V

    invoke-direct {v14, v0, v4, v9}, Lik5;-><init>(Lumi;Llpe;Lfch;)V

    invoke-static {v8}, Lxnh;->t(Landroid/content/Context;)Lxnh;

    move-result-object v0

    new-instance v7, Lpw3;

    const/4 v12, 0x0

    const/4 v13, 0x6

    const-class v9, Lcom/opera/android/OperaApplication;

    const-string v10, "newsFacade"

    const-string v11, "getNewsFacade()Lcom/opera/android/news/NewsFacade;"

    invoke-direct/range {v7 .. v13}, Lpw3;-><init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    new-instance v4, Lwv1;

    const/4 v15, 0x3

    invoke-direct {v4, v7, v15}, Lwv1;-><init>(Lb6h;B)V

    new-instance v7, Lox3;

    const/4 v10, 0x2

    invoke-direct {v7, v8, v10}, Lox3;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v10, Lkw3;

    invoke-direct {v10, v2}, Lkw3;-><init>(B)V

    new-instance v11, Lqb7;

    new-instance v12, Lc37;

    new-instance v13, Lvzk;

    invoke-direct {v13, v4, v7, v10}, Lvzk;-><init>(Lwv1;Lesk;Lesk;)V

    invoke-direct {v12, v0, v13}, Lc37;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v0, Lzy9;

    invoke-direct {v0, v6}, Lzy9;-><init>(Ljava/lang/Object;)V

    new-instance v4, Lqii;

    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    invoke-direct {v11, v12, v0, v4}, Lqb7;-><init>(Lc37;Lzy9;Lqii;)V

    invoke-virtual {v8}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v0

    new-instance v7, Lpw3;

    const/4 v12, 0x0

    const/4 v13, 0x7

    const-string v10, "newsFacade"

    move-object v4, v11

    const-string v11, "getNewsFacade()Lcom/opera/android/news/NewsFacade;"

    invoke-direct/range {v7 .. v13}, Lpw3;-><init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    new-instance v9, Lwv1;

    invoke-direct {v9, v7, v15}, Lwv1;-><init>(Lb6h;B)V

    invoke-static {v8}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v7

    new-instance v13, Lr9i;

    new-instance v10, Li16;

    new-instance v11, Li3j;

    invoke-direct {v11, v9, v0, v7}, Li3j;-><init>(Lwv1;Lcom/opera/android/settings/SettingsManager;Lru9;)V

    invoke-direct {v10, v0, v11, v2}, Li16;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v2, Lu59;

    const/16 v7, 0x1c

    invoke-direct {v2, v6, v7}, Lu59;-><init>(Ljava/lang/Object;B)V

    new-instance v6, Ls99;

    invoke-direct {v6, v0, v5}, Ls99;-><init>(Lcom/opera/android/settings/SettingsManager;B)V

    invoke-direct {v13, v10, v2, v6}, Lr9i;-><init>(Li16;Lu59;Ls99;)V

    move-object v11, v14

    new-instance v14, Lr99;

    invoke-direct {v14, v8, v5}, Lr99;-><init>(Lcom/opera/android/OperaApplication;B)V

    move-object v9, v1

    move-object v10, v3

    move-object v12, v4

    invoke-direct/range {v9 .. v14}, Lbk5;-><init>(Ljk5;Lik5;Lqb7;Ljw1;Ljava/lang/Runnable;)V

    return-object v9

    :pswitch_17c
    check-cast v0, Lpii;

    check-cast v6, Landroid/content/Context;

    const-string v1, ".save_as_pdf"

    :try_start_182
    invoke-virtual {v6, v1, v5}, Landroid/content/Context;->openFileOutput(Ljava/lang/String;I)Ljava/io/FileOutputStream;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/FileOutputStream;->getFD()Ljava/io/FileDescriptor;

    move-result-object v2

    invoke-static {v2}, Landroid/os/ParcelFileDescriptor;->dup(Ljava/io/FileDescriptor;)Landroid/os/ParcelFileDescriptor;

    move-result-object v2

    iput-object v2, v0, Lpii;->I:Landroid/os/ParcelFileDescriptor;

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
    :try_end_192
    .catch Ljava/io/IOException; {:try_start_182 .. :try_end_192} :catch_193
    .catchall {:try_start_182 .. :try_end_192} :catchall_19c

    goto :goto_198

    :catch_193
    :try_start_193
    invoke-virtual {v6, v1}, Landroid/content/Context;->deleteFile(Ljava/lang/String;)Z

    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
    :try_end_198
    .catchall {:try_start_193 .. :try_end_198} :catchall_19c

    :goto_198
    invoke-static {v4}, Lxvg;->l(Ljava/io/Closeable;)V

    return-object v0

    :catchall_19c
    move-exception v0

    invoke-static {v4}, Lxvg;->l(Ljava/io/Closeable;)V

    throw v0

    :pswitch_1a1
    check-cast v0, Lglh;

    check-cast v6, Landroid/content/Context;

    new-instance v1, Ljava/io/File;

    invoke-virtual {v6}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v2

    const-string v4, "reading"

    invoke-direct {v1, v2, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v1, v0, Lglh;->h:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_1c1

    iget-object v0, v0, Lglh;->h:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->mkdir()Z

    move-result v0

    if-nez v0, :cond_1c1

    move v3, v5

    :cond_1c1
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :pswitch_1c6
    check-cast v0, Lglh;

    check-cast v6, Ljava/lang/String;

    iget-object v0, v0, Lglh;->a:Ljlh;

    invoke-virtual {v0, v6}, Ljlh;->k(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v0

    return-object v0

    :pswitch_1d1
    check-cast v0, Landroid/content/Context;

    check-cast v6, Landroid/net/Uri;

    :try_start_1d5
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-virtual {v0, v6}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v4

    invoke-static {v4}, Lzkg;->a(Ljava/io/InputStream;)Ljava/util/ArrayList;

    move-result-object v0
    :try_end_1e1
    .catch Ljava/io/IOException; {:try_start_1d5 .. :try_end_1e1} :catch_1e2
    .catchall {:try_start_1d5 .. :try_end_1e1} :catchall_1e8

    goto :goto_1e4

    :catch_1e2
    :try_start_1e2
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;
    :try_end_1e4
    .catchall {:try_start_1e2 .. :try_end_1e4} :catchall_1e8

    :goto_1e4
    invoke-static {v4}, Lxvg;->l(Ljava/io/Closeable;)V

    return-object v0

    :catchall_1e8
    move-exception v0

    invoke-static {v4}, Lxvg;->l(Ljava/io/Closeable;)V

    throw v0

    :pswitch_1ed
    check-cast v0, Lvbf;

    check-cast v6, Lvx;

    invoke-virtual {v6}, Lvx;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-nez v1, :cond_20c

    iget-object v0, v0, Lvbf;->w:Ljl6;

    iget-object v0, v0, Ljl6;->e:Ljava/lang/Object;

    check-cast v0, Landroid/animation/AnimatorSet;

    if-eqz v0, :cond_20b

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->isRunning()Z

    move-result v0

    if-nez v0, :cond_20c

    :cond_20b
    move v3, v5

    :cond_20c
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :pswitch_211
    check-cast v0, Lyxe;

    check-cast v6, Laz;

    iget-object v0, v0, Lyxe;->a:Lxd3;

    iget-object v0, v0, Lxd3;->a:Lueg;

    invoke-virtual {v0, v6}, Lueg;->l(Laz;)Ljava/util/List;

    move-result-object v0

    return-object v0

    :pswitch_21e
    check-cast v0, Lq6e;

    check-cast v6, Lj6e;

    iget-object v1, v0, Lq6e;->b:Liri;

    :try_start_224
    invoke-virtual {v1, v3}, Liri;->h(Z)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V
    :try_end_22b
    .catchall {:try_start_224 .. :try_end_22b} :catchall_252

    :try_start_22b
    new-instance v3, Lgt6;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    invoke-direct {v3, v2, v7, v8}, Lgt6;-><init>(Landroid/database/sqlite/SQLiteDatabase;J)V
    :try_end_234
    .catchall {:try_start_22b .. :try_end_234} :catchall_24a

    const-wide/16 v4, 0x0

    :try_start_236
    invoke-virtual {v3, v6, v4, v5}, Lgt6;->k(Lj6e;J)Ll6e;

    move-result-object v0

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_23d
    .catchall {:try_start_236 .. :try_end_23d} :catchall_247

    :try_start_23d
    invoke-static {v3}, Lxvg;->l(Ljava/io/Closeable;)V

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_243
    .catchall {:try_start_23d .. :try_end_243} :catchall_252

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteOpenHelper;->close()V

    return-object v0

    :catchall_247
    move-exception v0

    move-object v4, v3

    goto :goto_24b

    :catchall_24a
    move-exception v0

    :goto_24b
    :try_start_24b
    invoke-static {v4}, Lxvg;->l(Ljava/io/Closeable;)V

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0
    :try_end_252
    .catchall {:try_start_24b .. :try_end_252} :catchall_252

    :catchall_252
    move-exception v0

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteOpenHelper;->close()V

    throw v0

    :pswitch_257
    check-cast v0, Lpc9;

    check-cast v6, Lfvd;

    iget-object v1, v0, Lpc9;->c:Lbf9;

    invoke-virtual {v0}, Lpc9;->c()Ljvd;

    move-result-object v2

    iget-wide v7, v6, Lfvd;->a:J

    iget-object v2, v2, Ljvd;->a:Lcom/opera/android/touch/MessageDatabase_Impl;

    new-instance v9, Lx41;

    const/16 v10, 0xd

    invoke-direct {v9, v7, v8, v10}, Lx41;-><init>(JB)V

    invoke-static {v2, v3, v5, v9}, Lkfo;->Y(Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lfvd;

    if-nez v2, :cond_2ad

    invoke-virtual {v0}, Lpc9;->c()Ljvd;

    move-result-object v2

    iget-object v7, v2, Ljvd;->a:Lcom/opera/android/touch/MessageDatabase_Impl;

    new-instance v8, Ljkc;

    const/16 v9, 0x9

    invoke-direct {v8, v2, v6, v9}, Ljkc;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v7, v5, v3, v8}, Lkfo;->Y(Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    iget-object v2, v0, Lpc9;->j:Ljc9;

    if-eqz v2, :cond_2ad

    invoke-virtual {v1}, Lbf9;->x()Ljavax/crypto/spec/SecretKeySpec;

    move-result-object v2

    if-eqz v2, :cond_299

    iget-object v1, v1, Lbf9;->a:Loji;

    invoke-virtual {v1}, Loji;->u()Ljava/lang/String;

    move-result-object v1

    invoke-static {v6, v2, v1}, Lpc9;->a(Lfvd;Ljavax/crypto/spec/SecretKeySpec;Ljava/lang/String;)Lhb9;

    move-result-object v1

    goto :goto_29a

    :cond_299
    move-object v1, v4

    :goto_29a
    if-eqz v1, :cond_2ad

    iget-object v0, v0, Lpc9;->j:Ljc9;

    iget-wide v2, v1, Lhb9;->b:J

    invoke-virtual {v0, v2, v3}, Ljc9;->a(J)I

    move-result v0

    new-instance v4, Landroid/util/Pair;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-direct {v4, v0, v1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_2ad
    return-object v4

    :pswitch_2ae
    check-cast v0, La21;

    check-cast v6, Lpzh;

    iget-object v1, v6, Lpzh;->g:Lvzh;

    :try_start_2b4
    iget-object v2, v0, La21;->a:Ljava/lang/Object;

    check-cast v2, Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    iget-object v3, v0, La21;->h:Ljava/lang/Object;

    check-cast v3, Landroid/net/Uri;

    const-string v5, "w"

    invoke-virtual {v2, v3, v5}, Landroid/content/ContentResolver;->openAssetFileDescriptor(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    move-result-object v2
    :try_end_2c6
    .catch Ljavax/crypto/BadPaddingException; {:try_start_2b4 .. :try_end_2c6} :catch_2eb
    .catch Ljavax/crypto/IllegalBlockSizeException; {:try_start_2b4 .. :try_end_2c6} :catch_2eb
    .catch Ljava/io/IOException; {:try_start_2b4 .. :try_end_2c6} :catch_2eb
    .catchall {:try_start_2b4 .. :try_end_2c6} :catchall_2e6

    if-eqz v2, :cond_2eb

    :try_start_2c8
    invoke-virtual {v2}, Landroid/content/res/AssetFileDescriptor;->createOutputStream()Ljava/io/FileOutputStream;

    move-result-object v3
    :try_end_2cc
    .catchall {:try_start_2c8 .. :try_end_2cc} :catchall_2dd

    :try_start_2cc
    invoke-virtual {v0, v1, v3}, La21;->d(Lvzh;Ljava/io/FileOutputStream;)Landroid/util/Pair;

    move-result-object v0
    :try_end_2d0
    .catchall {:try_start_2cc .. :try_end_2d0} :catchall_2db

    :try_start_2d0
    invoke-static {v3}, Lxvg;->l(Ljava/io/Closeable;)V

    invoke-virtual {v2}, Landroid/content/res/AssetFileDescriptor;->close()V
    :try_end_2d6
    .catch Ljavax/crypto/BadPaddingException; {:try_start_2d0 .. :try_end_2d6} :catch_2eb
    .catch Ljavax/crypto/IllegalBlockSizeException; {:try_start_2d0 .. :try_end_2d6} :catch_2eb
    .catch Ljava/io/IOException; {:try_start_2d0 .. :try_end_2d6} :catch_2eb
    .catchall {:try_start_2d0 .. :try_end_2d6} :catchall_2e6

    invoke-virtual {v1}, Lvzh;->close()V

    move-object v4, v0

    goto :goto_2ee

    :catchall_2db
    move-exception v0

    goto :goto_2df

    :catchall_2dd
    move-exception v0

    move-object v3, v4

    :goto_2df
    :try_start_2df
    invoke-static {v3}, Lxvg;->l(Ljava/io/Closeable;)V

    invoke-virtual {v2}, Landroid/content/res/AssetFileDescriptor;->close()V

    throw v0
    :try_end_2e6
    .catch Ljavax/crypto/BadPaddingException; {:try_start_2df .. :try_end_2e6} :catch_2eb
    .catch Ljavax/crypto/IllegalBlockSizeException; {:try_start_2df .. :try_end_2e6} :catch_2eb
    .catch Ljava/io/IOException; {:try_start_2df .. :try_end_2e6} :catch_2eb
    .catchall {:try_start_2df .. :try_end_2e6} :catchall_2e6

    :catchall_2e6
    move-exception v0

    invoke-virtual {v1}, Lvzh;->close()V

    throw v0

    :catch_2eb
    :cond_2eb
    invoke-virtual {v1}, Lvzh;->close()V

    :goto_2ee
    return-object v4

    :pswitch_2ef
    check-cast v0, Ltw3;

    check-cast v6, Lcom/opera/android/OperaApplication;

    new-instance v1, Ld7h;

    iget-object v0, v0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    iget-object v2, v6, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object v2, v2, Lxv1;->n:Lj4c;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lf84;

    const/16 v3, 0xb

    invoke-direct {v1, v0, v2, v3}, Ld7h;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    return-object v1

    nop

    :pswitch_data_308
    .packed-switch 0x0
        :pswitch_2ef
        :pswitch_2ae
        :pswitch_257
        :pswitch_21e
        :pswitch_211
        :pswitch_1ed
        :pswitch_1d1
        :pswitch_1c6
        :pswitch_1a1
        :pswitch_17c
        :pswitch_d1
    .end packed-switch
.end method
