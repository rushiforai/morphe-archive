.class public final Lt28;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lumi;

.field public final c:Lck3;

.field public d:Ls28;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lumi;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lt28;->a:Landroid/content/Context;

    iput-object p2, p0, Lt28;->b:Lumi;

    new-instance p2, Lck3;

    invoke-direct {p2, p1}, Lck3;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lt28;->c:Lck3;

    return-void
.end method


# virtual methods
.method public final a(Ljavax/crypto/CipherOutputStream;Lumi;)V
    .registers 29

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    iget-object v0, v1, Lt28;->a:Landroid/content/Context;

    const-string v4, "opera"

    const/4 v5, 0x0

    invoke-virtual {v0, v4, v5}, Landroid/content/Context;->getDir(Ljava/lang/String;I)Ljava/io/File;

    move-result-object v4

    new-instance v6, Ljava/io/File;

    const-string v7, "Login Data"

    invoke-direct {v6, v4, v7}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v6}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    sget-object v6, Li0i;->a:Lnx1;

    invoke-virtual {v6, v0}, Li7c;->d(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lc36;

    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    const/4 v7, 0x3

    const/4 v8, 0x1

    const/4 v9, 0x0

    :try_start_2a
    invoke-static {v4, v9, v8}, Landroid/database/sqlite/SQLiteDatabase;->openDatabase(Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v10
    :try_end_2e
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_2a .. :try_end_2e} :catch_108

    :try_start_2e
    const-string v11, "crypto_keys"

    const-string v4, "algorithm"

    const-string v12, "encrypted_key"

    filled-new-array {v4, v12}, [Ljava/lang/String;

    move-result-object v12

    const-string v13, "algorithm=\'AES-256-CBC\'"

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    invoke-virtual/range {v10 .. v17}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v4
    :try_end_44
    .catchall {:try_start_2e .. :try_end_44} :catchall_fb

    :try_start_44
    invoke-interface {v4}, Landroid/database/Cursor;->moveToNext()Z

    move-result v11

    if-eqz v11, :cond_73

    invoke-interface {v4, v8}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v11

    array-length v12, v11

    if-lt v12, v7, :cond_73

    new-array v12, v7, [B

    fill-array-data v12, :array_244

    invoke-static {v11, v12}, Lkfo;->E([B[B)Z

    move-result v12

    if-eqz v12, :cond_73

    array-length v12, v11

    invoke-static {v11, v7, v12}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object v11

    invoke-virtual {v0, v11}, Lc36;->b([B)[B

    move-result-object v0

    if-eqz v0, :cond_73

    new-instance v11, Ljavax/crypto/spec/SecretKeySpec;

    const-string v12, "AES"

    invoke-direct {v11, v0, v12}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V
    :try_end_6e
    .catchall {:try_start_44 .. :try_end_6e} :catchall_ee

    move-object v0, v11

    goto :goto_74

    :goto_70
    move-object v7, v0

    goto/16 :goto_f0

    :cond_73
    move-object v0, v9

    :goto_74
    :try_start_74
    invoke-interface {v4}, Landroid/database/Cursor;->close()V
    :try_end_77
    .catchall {:try_start_74 .. :try_end_77} :catchall_fb

    if-nez v0, :cond_7f

    :try_start_79
    invoke-virtual {v10}, Landroid/database/sqlite/SQLiteClosable;->close()V
    :try_end_7c
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_79 .. :try_end_7c} :catch_108

    move-object v6, v9

    goto/16 :goto_108

    :cond_7f
    :try_start_7f
    const-string v4, "AES/CBC/PKCS5Padding"

    invoke-static {v4}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v4
    :try_end_85
    .catch Ljava/lang/Exception; {:try_start_7f .. :try_end_85} :catch_e9
    .catchall {:try_start_7f .. :try_end_85} :catchall_fb

    :try_start_85
    const-string v11, "logins"

    const-string v12, "password_value"

    const-string v13, "signon_realm"

    const-string v14, "username_value"

    filled-new-array {v12, v13, v14}, [Ljava/lang/String;

    move-result-object v12

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    invoke-virtual/range {v10 .. v17}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v11
    :try_end_9c
    .catchall {:try_start_85 .. :try_end_9c} :catchall_fb

    :goto_9c
    :try_start_9c
    invoke-interface {v11}, Landroid/database/Cursor;->moveToNext()Z

    move-result v12

    if-eqz v12, :cond_d5

    invoke-interface {v11, v5}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v12

    invoke-interface {v11, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v13

    const/4 v14, 0x2

    invoke-interface {v11, v14}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v15

    array-length v7, v12

    const/16 v8, 0x10

    if-le v7, v8, :cond_d3

    invoke-static {v12, v5, v8}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object v7

    new-instance v9, Ljavax/crypto/spec/IvParameterSpec;

    invoke-direct {v9, v7}, Ljavax/crypto/spec/IvParameterSpec;-><init>([B)V
    :try_end_bd
    .catchall {:try_start_9c .. :try_end_bd} :catchall_dc

    :try_start_bd
    invoke-virtual {v4, v14, v0, v9}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    array-length v7, v12

    sub-int/2addr v7, v8

    invoke-virtual {v4, v12, v8, v7}, Ljavax/crypto/Cipher;->doFinal([BII)[B

    move-result-object v7

    new-instance v8, Lu5g;

    new-instance v9, Ljava/lang/String;

    invoke-direct {v9, v7}, Ljava/lang/String;-><init>([B)V

    invoke-direct {v8, v13, v15, v9}, Lu5g;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_d3
    .catch Ljava/lang/Exception; {:try_start_bd .. :try_end_d3} :catch_d3
    .catchall {:try_start_bd .. :try_end_d3} :catchall_dc

    :catch_d3
    :cond_d3
    const/4 v8, 0x1

    goto :goto_9c

    :cond_d5
    :try_start_d5
    invoke-interface {v11}, Landroid/database/Cursor;->close()V
    :try_end_d8
    .catchall {:try_start_d5 .. :try_end_d8} :catchall_fb

    :try_start_d8
    invoke-virtual {v10}, Landroid/database/sqlite/SQLiteClosable;->close()V
    :try_end_db
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_d8 .. :try_end_db} :catch_108

    goto :goto_108

    :catchall_dc
    move-exception v0

    move-object v4, v0

    if-eqz v11, :cond_e8

    :try_start_e0
    invoke-interface {v11}, Landroid/database/Cursor;->close()V
    :try_end_e3
    .catchall {:try_start_e0 .. :try_end_e3} :catchall_e4

    goto :goto_e8

    :catchall_e4
    move-exception v0

    :try_start_e5
    invoke-virtual {v4, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_e8
    :goto_e8
    throw v4
    :try_end_e9
    .catchall {:try_start_e5 .. :try_end_e9} :catchall_fb

    :catch_e9
    :try_start_e9
    invoke-virtual {v10}, Landroid/database/sqlite/SQLiteClosable;->close()V
    :try_end_ec
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_e9 .. :try_end_ec} :catch_108

    const/4 v6, 0x0

    goto :goto_108

    :catchall_ee
    move-exception v0

    goto :goto_70

    :goto_f0
    if-eqz v4, :cond_fa

    :try_start_f2
    invoke-interface {v4}, Landroid/database/Cursor;->close()V
    :try_end_f5
    .catchall {:try_start_f2 .. :try_end_f5} :catchall_f6

    goto :goto_fa

    :catchall_f6
    move-exception v0

    :try_start_f7
    invoke-virtual {v7, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_fa
    :goto_fa
    throw v7
    :try_end_fb
    .catchall {:try_start_f7 .. :try_end_fb} :catchall_fb

    :catchall_fb
    move-exception v0

    move-object v4, v0

    if-eqz v10, :cond_107

    :try_start_ff
    invoke-virtual {v10}, Landroid/database/sqlite/SQLiteClosable;->close()V
    :try_end_102
    .catchall {:try_start_ff .. :try_end_102} :catchall_103

    goto :goto_107

    :catchall_103
    move-exception v0

    :try_start_104
    invoke-virtual {v4, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_107
    :goto_107
    throw v4
    :try_end_108
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_104 .. :try_end_108} :catch_108

    :catch_108
    :goto_108
    if-nez v6, :cond_10c

    sget-object v6, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    :cond_10c
    const/4 v0, -0x1

    invoke-static {v2, v0}, Lna2;->a0(Ljavax/crypto/CipherOutputStream;I)V

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v0

    invoke-static {v2, v0}, Lna2;->a0(Ljavax/crypto/CipherOutputStream;I)V

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_11b
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_13d

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lu5g;

    iget-object v6, v4, Lu5g;->a:Ljava/lang/String;

    invoke-static {v2, v6}, Lna2;->b0(Ljavax/crypto/CipherOutputStream;Ljava/lang/String;)V

    iget-object v6, v4, Lu5g;->c:Ljava/lang/String;

    invoke-static {v2, v6}, Lna2;->b0(Ljavax/crypto/CipherOutputStream;Ljava/lang/String;)V

    iget-object v4, v4, Lu5g;->b:Ljava/lang/String;

    sget-object v6, Laik;->a:[Ljava/lang/String;

    if-nez v4, :cond_139

    const-string v4, ""

    :cond_139
    invoke-static {v2, v4}, Lna2;->b0(Ljavax/crypto/CipherOutputStream;Ljava/lang/String;)V

    goto :goto_11b

    :cond_13d
    iget-object v0, v1, Lt28;->a:Landroid/content/Context;

    const-string v4, "opera"

    invoke-virtual {v0, v4, v5}, Landroid/content/Context;->getDir(Ljava/lang/String;I)Ljava/io/File;

    move-result-object v4

    new-instance v6, Ljava/io/File;

    const-string v7, "Web Data"

    invoke-direct {v6, v4, v7}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v6}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    sget-object v6, Li0i;->a:Lnx1;

    invoke-virtual {v6, v0}, Li7c;->d(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lc36;

    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    const/4 v7, 0x1

    const/4 v8, 0x0

    :try_start_15f
    invoke-static {v4, v8, v7}, Landroid/database/sqlite/SQLiteDatabase;->openDatabase(Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v18
    :try_end_163
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_15f .. :try_end_163} :catch_1d7

    :try_start_163
    const-string v19, "credit_cards"

    const-string v4, "guid"

    const-string v7, "card_number_encrypted"

    filled-new-array {v4, v7}, [Ljava/lang/String;

    move-result-object v20

    const/16 v24, 0x0

    const/16 v25, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x0

    invoke-virtual/range {v18 .. v25}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v4
    :try_end_17b
    .catchall {:try_start_163 .. :try_end_17b} :catchall_1ca

    :cond_17b
    :goto_17b
    :try_start_17b
    invoke-interface {v4}, Landroid/database/Cursor;->moveToNext()Z

    move-result v7

    if-eqz v7, :cond_1b6

    invoke-interface {v4, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x1

    invoke-interface {v4, v8}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v9

    if-eqz v9, :cond_17b

    array-length v10, v9

    const/4 v11, 0x3

    if-lt v10, v11, :cond_17b

    new-array v10, v11, [B

    fill-array-data v10, :array_24a

    invoke-static {v9, v10}, Lkfo;->E([B[B)Z

    move-result v10

    if-eqz v10, :cond_17b

    array-length v10, v9

    invoke-static {v9, v11, v10}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object v9

    invoke-virtual {v0, v9}, Lc36;->b([B)[B

    move-result-object v9

    if-eqz v9, :cond_17b

    new-instance v10, Ln16;

    new-instance v12, Ljava/lang/String;

    invoke-direct {v12, v9}, Ljava/lang/String;-><init>([B)V

    invoke-direct {v10, v7, v12}, Ln16;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1b3
    .catchall {:try_start_17b .. :try_end_1b3} :catchall_1bd

    goto :goto_17b

    :goto_1b4
    move-object v7, v0

    goto :goto_1bf

    :cond_1b6
    :try_start_1b6
    invoke-interface {v4}, Landroid/database/Cursor;->close()V
    :try_end_1b9
    .catchall {:try_start_1b6 .. :try_end_1b9} :catchall_1ca

    :try_start_1b9
    invoke-virtual/range {v18 .. v18}, Landroid/database/sqlite/SQLiteClosable;->close()V
    :try_end_1bc
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_1b9 .. :try_end_1bc} :catch_1d7

    goto :goto_1d7

    :catchall_1bd
    move-exception v0

    goto :goto_1b4

    :goto_1bf
    if-eqz v4, :cond_1c9

    :try_start_1c1
    invoke-interface {v4}, Landroid/database/Cursor;->close()V
    :try_end_1c4
    .catchall {:try_start_1c1 .. :try_end_1c4} :catchall_1c5

    goto :goto_1c9

    :catchall_1c5
    move-exception v0

    :try_start_1c6
    invoke-virtual {v7, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_1c9
    :goto_1c9
    throw v7
    :try_end_1ca
    .catchall {:try_start_1c6 .. :try_end_1ca} :catchall_1ca

    :catchall_1ca
    move-exception v0

    move-object v4, v0

    if-eqz v18, :cond_1d6

    :try_start_1ce
    invoke-virtual/range {v18 .. v18}, Landroid/database/sqlite/SQLiteClosable;->close()V
    :try_end_1d1
    .catchall {:try_start_1ce .. :try_end_1d1} :catchall_1d2

    goto :goto_1d6

    :catchall_1d2
    move-exception v0

    :try_start_1d3
    invoke-virtual {v4, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_1d6
    :goto_1d6
    throw v4
    :try_end_1d7
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_1d3 .. :try_end_1d7} :catch_1d7

    :catch_1d7
    :goto_1d7
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-static {v2, v0}, Lna2;->a0(Ljavax/crypto/CipherOutputStream;I)V

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_1e2
    if-ge v5, v0, :cond_1f7

    invoke-virtual {v6, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v5, v5, 0x1

    check-cast v4, Ln16;

    iget-object v7, v4, Ln16;->a:Ljava/lang/String;

    invoke-static {v2, v7}, Lna2;->b0(Ljavax/crypto/CipherOutputStream;Ljava/lang/String;)V

    iget-object v4, v4, Ln16;->b:Ljava/lang/String;

    invoke-static {v2, v4}, Lna2;->b0(Ljavax/crypto/CipherOutputStream;Ljava/lang/String;)V

    goto :goto_1e2

    :cond_1f7
    iget-object v0, v1, Lt28;->a:Landroid/content/Context;

    new-instance v1, Lj16;

    invoke-direct {v1, v0, v3}, Lj16;-><init>(Landroid/content/Context;Lumi;)V

    invoke-interface {v3, v1}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object v0

    const/4 v8, 0x0

    invoke-virtual {v0, v8}, Lnml;->a(Ljava/lang/Object;)Loml;

    iget-object v3, v1, Lj16;->c:Ljava/lang/Object;

    monitor-enter v3

    :goto_209
    :try_start_209
    iget-object v0, v1, Lj16;->d:Ljava/util/Collection;

    if-eqz v0, :cond_210

    monitor-exit v3
    :try_end_20e
    .catchall {:try_start_209 .. :try_end_20e} :catchall_241

    move-object v9, v0

    goto :goto_218

    :cond_210
    :try_start_210
    iget-object v0, v1, Lj16;->c:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->wait()V
    :try_end_215
    .catch Ljava/lang/InterruptedException; {:try_start_210 .. :try_end_215} :catch_216
    .catchall {:try_start_210 .. :try_end_215} :catchall_241

    goto :goto_209

    :catch_216
    :try_start_216
    monitor-exit v3
    :try_end_217
    .catchall {:try_start_216 .. :try_end_217} :catchall_241

    move-object v9, v8

    :goto_218
    if-nez v9, :cond_21c

    sget-object v9, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    :cond_21c
    invoke-interface {v9}, Ljava/util/Collection;->size()I

    move-result v0

    invoke-static {v2, v0}, Lna2;->a0(Ljavax/crypto/CipherOutputStream;I)V

    invoke-interface {v9}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_227
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_23e

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lh16;

    iget-object v3, v1, Lh16;->a:Ljava/lang/String;

    invoke-static {v2, v3}, Lna2;->b0(Ljavax/crypto/CipherOutputStream;Ljava/lang/String;)V

    iget-object v1, v1, Lh16;->b:Ljava/lang/String;

    invoke-static {v2, v1}, Lna2;->b0(Ljavax/crypto/CipherOutputStream;Ljava/lang/String;)V

    goto :goto_227

    :cond_23e
    return-void

    :goto_23f
    :try_start_23f
    monitor-exit v3
    :try_end_240
    .catchall {:try_start_23f .. :try_end_240} :catchall_241

    throw v0

    :catchall_241
    move-exception v0

    goto :goto_23f

    nop

    :array_244
    .array-data 1
        0x76t
        0x31t
        0x31t
    .end array-data

    :array_24a
    .array-data 1
        0x76t
        0x31t
        0x31t
    .end array-data
.end method

.method public final b(Ljavax/crypto/CipherInputStream;Lumi;)V
    .registers 12

    invoke-static {p1}, Lna2;->M(Ljavax/crypto/CipherInputStream;)I

    move-result v0

    const/4 v1, 0x0

    if-ltz v0, :cond_9

    move v2, v1

    goto :goto_10

    :cond_9
    invoke-static {p1}, Lna2;->M(Ljavax/crypto/CipherInputStream;)I

    move-result v2

    move v8, v2

    move v2, v0

    move v0, v8

    :goto_10
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3, v0}, Ljava/util/ArrayList;-><init>(I)V

    :goto_15
    add-int/lit8 v4, v0, -0x1

    const/4 v5, 0x0

    if-lez v0, :cond_33

    invoke-static {p1}, Lna2;->O(Ljavax/crypto/CipherInputStream;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1}, Lna2;->O(Ljavax/crypto/CipherInputStream;)Ljava/lang/String;

    move-result-object v6

    const/4 v7, -0x1

    if-gt v2, v7, :cond_29

    invoke-static {p1}, Lna2;->O(Ljavax/crypto/CipherInputStream;)Ljava/lang/String;

    move-result-object v5

    :cond_29
    new-instance v7, Lu5g;

    invoke-direct {v7, v0, v5, v6}, Lu5g;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v3, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move v0, v4

    goto :goto_15

    :cond_33
    new-instance v0, Lo16;

    const/4 v2, 0x1

    invoke-direct {v0, v3, v2}, Lo16;-><init>(Ljava/util/ArrayList;B)V

    invoke-interface {p2, v0}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object v0

    invoke-virtual {v0, v5}, Lnml;->a(Ljava/lang/Object;)Loml;

    invoke-static {p1}, Lna2;->M(Ljavax/crypto/CipherInputStream;)I

    move-result v0

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2, v0}, Ljava/util/ArrayList;-><init>(I)V

    :goto_49
    add-int/lit8 v3, v0, -0x1

    if-lez v0, :cond_5f

    invoke-static {p1}, Lna2;->O(Ljavax/crypto/CipherInputStream;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1}, Lna2;->O(Ljavax/crypto/CipherInputStream;)Ljava/lang/String;

    move-result-object v4

    new-instance v6, Ln16;

    invoke-direct {v6, v0, v4}, Ln16;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move v0, v3

    goto :goto_49

    :cond_5f
    new-instance v0, Lo16;

    invoke-direct {v0, v2, v1}, Lo16;-><init>(Ljava/util/ArrayList;B)V

    invoke-interface {p2, v0}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object v0

    invoke-virtual {v0, v5}, Lnml;->a(Ljava/lang/Object;)Loml;

    invoke-static {p1}, Lna2;->M(Ljavax/crypto/CipherInputStream;)I

    move-result v0

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(I)V

    :goto_74
    add-int/lit8 v2, v0, -0x1

    if-lez v0, :cond_8a

    invoke-static {p1}, Lna2;->O(Ljavax/crypto/CipherInputStream;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1}, Lna2;->O(Ljavax/crypto/CipherInputStream;)Ljava/lang/String;

    move-result-object v3

    new-instance v4, Lh16;

    invoke-direct {v4, v0, v3}, Lh16;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move v0, v2

    goto :goto_74

    :cond_8a
    new-instance p1, Lk16;

    iget-object p0, p0, Lt28;->a:Landroid/content/Context;

    invoke-direct {p1, p0, p2, v1}, Lk16;-><init>(Landroid/content/Context;Lumi;Ljava/util/ArrayList;)V

    invoke-interface {p2, p1}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object p0

    invoke-virtual {p0, v5}, Lnml;->a(Ljava/lang/Object;)Loml;

    return-void
.end method
