.class public final Lg0d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Closeable;


# static fields
.field public static final f:[B

.field public static final g:J

.field public static final h:[B

.field public static final i:[B


# instance fields
.field public final a:Lumi;

.field public final b:Lz4f;

.field public final c:Landroid/database/sqlite/SQLiteDatabase;

.field public final d:Lvzc;

.field public e:Ljava/lang/Boolean;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    const/4 v0, 0x3

    new-array v0, v0, [B

    fill-array-data v0, :array_26

    sput-object v0, Lg0d;->f:[B

    sget-object v0, Lpn7;->b:Lon7;

    const/4 v0, 0x1

    sget-object v1, Lun7;->f:Lun7;

    invoke-static {v0, v1}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    sput-wide v0, Lg0d;->g:J

    const/4 v0, 0x4

    new-array v0, v0, [B

    fill-array-data v0, :array_2c

    sput-object v0, Lg0d;->h:[B

    const/16 v0, 0x20

    new-array v0, v0, [B

    fill-array-data v0, :array_32

    sput-object v0, Lg0d;->i:[B

    return-void

    nop

    :array_26
    .array-data 1
        0x0t
        -0x1t
        0x0t
    .end array-data

    :array_2c
    .array-data 1
        0x0t
        0x0t
        0x0t
        0x0t
    .end array-data

    :array_32
    .array-data 1
        0x1ct
        0x0t
        0x0t
        0x0t
        0x8t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x4t
        0x0t
        0x0t
        0x0t
        0x6et
        0x75t
        0x6ct
        0x6ct
    .end array-data
.end method

.method public constructor <init>(Lumi;Lvx;Ljava/lang/String;)V
    .registers 34

    move-object/from16 v0, p0

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    move-object/from16 v1, p1

    iput-object v1, v0, Lg0d;->a:Lumi;

    new-instance v1, Lqzc;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    new-instance v2, Lz4f;

    move-object/from16 v3, p2

    invoke-direct {v2, v3}, Lz4f;-><init>(Lvx;)V

    iput-object v2, v0, Lg0d;->b:Lz4f;

    const/16 v4, 0x10

    const/4 v5, 0x0

    move-object/from16 v6, p3

    invoke-static {v6, v5, v4, v1}, Landroid/database/sqlite/SQLiteDatabase;->openDatabase(Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;ILandroid/database/DatabaseErrorHandler;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v6

    const-wide/16 v7, 0x800

    invoke-virtual {v6, v7, v8}, Landroid/database/sqlite/SQLiteDatabase;->setPageSize(J)V

    const/16 v1, 0x20

    invoke-virtual {v6, v1}, Landroid/database/sqlite/SQLiteDatabase;->setMaxSqlCacheSize(I)V

    const-string v4, "PRAGMA journal_mode=TRUNCATE"

    invoke-virtual {v6, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v4

    check-cast v4, Ljava/io/Closeable;

    :try_start_32
    move-object v7, v4

    check-cast v7, Landroid/database/Cursor;

    invoke-interface {v7}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_38
    .catchall {:try_start_32 .. :try_end_38} :catchall_3b7

    invoke-static {v4, v5}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    const/4 v4, 0x1

    invoke-virtual {v6, v4}, Landroid/database/sqlite/SQLiteDatabase;->setForeignKeyConstraintsEnabled(Z)V

    invoke-virtual {v6}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    :try_start_42
    new-instance v7, Lnv6;

    invoke-direct {v7, v6}, Lnv6;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    const-string v8, "last_compatible_version"

    invoke-virtual {v7, v8}, Lnv6;->y(Ljava/lang/String;)I

    move-result v8
    :try_end_4d
    .catchall {:try_start_42 .. :try_end_4d} :catchall_3b2

    const-string v14, ""

    const/16 v9, 0x2b

    if-gt v8, v9, :cond_3ac

    :try_start_53
    const-string v8, "version"

    invoke-virtual {v7, v8}, Lnv6;->y(Ljava/lang/String;)I

    move-result v7

    const/4 v15, 0x2

    if-ne v7, v4, :cond_78

    const-string v8, "password_type"

    invoke-static {v6, v8}, Ldyg;->i(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)Z

    move-result v8

    const-string v10, "possible_usernames"

    invoke-static {v6, v10}, Ldyg;->i(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_6c

    add-int/lit8 v8, v8, 0x1

    :cond_6c
    if-eq v8, v4, :cond_72

    if-ne v8, v15, :cond_78

    move v7, v15

    goto :goto_78

    :cond_72
    new-instance v0, Llv0;

    invoke-direct {v0, v14}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_78
    :goto_78
    const/4 v8, 0x3

    if-ne v7, v15, :cond_84

    const-string v10, "times_used"

    invoke-static {v6, v10}, Ldyg;->i(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_84

    move v7, v8

    :cond_84
    if-ne v7, v8, :cond_8f

    const-string v8, "form_data"

    invoke-static {v6, v8}, Ldyg;->i(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_8f

    const/4 v7, 0x4

    :cond_8f
    const/16 v8, 0x19

    if-ge v7, v8, :cond_9c

    const-string v10, "date_last_used"

    invoke-static {v6, v10}, Ldyg;->i(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_9c

    move v7, v8

    :cond_9c
    if-lt v7, v9, :cond_3a6

    invoke-virtual {v6}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_a1
    .catchall {:try_start_53 .. :try_end_a1} :catchall_3b2

    invoke-virtual {v6}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    iput-object v6, v0, Lg0d;->c:Landroid/database/sqlite/SQLiteDatabase;

    const-string v7, "metadata"

    const-string v8, "SYNC-ENTITIES-METADATA"

    const-string v9, "AES-256-CBC"

    const-string v10, "crypto_keys"

    const-string v11, "encrypted_key"

    invoke-virtual {v6}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    :try_start_b3
    invoke-static {v6, v10}, Ldyg;->j(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)Z

    move-result v12

    if-nez v12, :cond_be

    const-string v12, "CREATE TABLE crypto_keys (\'algorithm\' STRING UNIQUE PRIMARY KEY, \'encrypted_key\' BLOB NOT NULL)"

    invoke-virtual {v6, v12}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :cond_be
    move-object v12, v7

    const-string v7, "crypto_keys"

    move-object v13, v8

    filled-new-array {v11}, [Ljava/lang/String;

    move-result-object v8

    move-object/from16 v16, v9

    const-string v9, "algorithm == ?"

    move-object/from16 v17, v10

    filled-new-array/range {v16 .. v16}, [Ljava/lang/String;

    move-result-object v10

    move-object/from16 v18, v12

    const/4 v12, 0x0

    move-object/from16 v19, v13

    const/4 v13, 0x0

    move-object/from16 v20, v11

    const/4 v11, 0x0

    move-object/from16 v15, v17

    move-object/from16 v21, v18

    move-object/from16 v5, v20

    invoke-virtual/range {v6 .. v13}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    check-cast v7, Ljava/io/Closeable;
    :try_end_e5
    .catchall {:try_start_b3 .. :try_end_e5} :catchall_3a1

    :try_start_e5
    move-object v8, v7

    check-cast v8, Landroid/database/Cursor;

    invoke-interface {v8}, Landroid/database/Cursor;->moveToNext()Z

    move-result v9
    :try_end_ec
    .catchall {:try_start_e5 .. :try_end_ec} :catchall_398

    const-string v10, "AES"

    const/4 v12, 0x0

    const-string v13, "algorithm"

    move/from16 p3, v9

    const-string v9, "logins"

    const/16 v18, 0x100

    const-string v11, "password_value"

    if-eqz p3, :cond_16b

    :try_start_fb
    invoke-static {v8, v12}, Lwyh;->y(Landroid/database/Cursor;I)[B

    move-result-object v8

    invoke-virtual {v2, v8}, Lz4f;->a([B)[B

    move-result-object v2

    if-eqz v2, :cond_108

    array-length v2, v2

    if-eq v2, v1, :cond_153

    :cond_108
    sget-object v2, Lq36;->a:Ljava/security/SecureRandom;

    sget-object v2, Lm36;->a:[Lm36;

    invoke-static/range {v18 .. v18}, Lq36;->a(I)Z

    move-result v2

    if-nez v2, :cond_114

    const/4 v2, 0x0

    goto :goto_120

    :cond_114
    new-array v1, v1, [B

    sget-object v2, Lq36;->a:Ljava/security/SecureRandom;

    invoke-virtual {v2, v1}, Ljava/security/SecureRandom;->nextBytes([B)V

    new-instance v2, Ljavax/crypto/spec/SecretKeySpec;

    invoke-direct {v2, v1, v10}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    :goto_120
    if-eqz v2, :cond_15f

    invoke-virtual {v2}, Ljavax/crypto/spec/SecretKeySpec;->getEncoded()[B

    move-result-object v1

    array-length v2, v1

    if-eqz v2, :cond_133

    invoke-virtual {v3}, Lvx;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lc36;

    invoke-virtual {v2, v1}, Lc36;->d([B)[B

    move-result-object v1

    :cond_133
    move-object v8, v1

    if-eqz v8, :cond_159

    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1, v4}, Landroid/content/ContentValues;-><init>(I)V

    invoke-virtual {v1, v5, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    const-string v2, "algorithm == ?"

    filled-new-array/range {v16 .. v16}, [Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v6, v15, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1, v4}, Landroid/content/ContentValues;-><init>(I)V

    invoke-virtual {v1, v11}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    const/4 v2, 0x0

    invoke-virtual {v6, v9, v1, v2, v2}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    :cond_153
    move-object v1, v7

    move v4, v12

    move-object v3, v13

    const/4 v2, 0x0

    goto/16 :goto_260

    :cond_159
    new-instance v0, Llv0;

    invoke-direct {v0, v14}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_15f
    new-instance v0, Llv0;

    invoke-direct {v0, v14}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_165
    .catchall {:try_start_fb .. :try_end_165} :catchall_169

    :goto_165
    move-object v2, v0

    move-object v1, v7

    goto/16 :goto_39b

    :catchall_169
    move-exception v0

    goto :goto_165

    :cond_16b
    :try_start_16b
    sget-object v3, Lq36;->a:Ljava/security/SecureRandom;

    sget-object v3, Lm36;->a:[Lm36;

    invoke-static/range {v18 .. v18}, Lq36;->a(I)Z

    move-result v3

    if-nez v3, :cond_177

    const/4 v3, 0x0

    goto :goto_183

    :cond_177
    new-array v1, v1, [B

    sget-object v3, Lq36;->a:Ljava/security/SecureRandom;

    invoke-virtual {v3, v1}, Ljava/security/SecureRandom;->nextBytes([B)V

    new-instance v3, Ljavax/crypto/spec/SecretKeySpec;

    invoke-direct {v3, v1, v10}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    :goto_183
    if-eqz v3, :cond_38f

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V
    :try_end_18a
    .catchall {:try_start_16b .. :try_end_18a} :catchall_398

    move-object v8, v7

    :try_start_18b
    const-string v7, "logins"

    const-string v10, "id"

    filled-new-array {v10, v11}, [Ljava/lang/String;

    move-result-object v10
    :try_end_193
    .catchall {:try_start_18b .. :try_end_193} :catchall_38c

    move/from16 v18, v12

    const/4 v12, 0x0

    move-object/from16 v20, v13

    const/4 v13, 0x0

    move-object/from16 v22, v9

    const/4 v9, 0x0

    move-object/from16 v23, v8

    move-object v8, v10

    const/4 v10, 0x0

    move-object/from16 v24, v11

    const/4 v11, 0x0

    move/from16 v4, v18

    move-object/from16 v26, v20

    move-object/from16 v27, v22

    move-object/from16 v25, v23

    move-object/from16 v28, v24

    :try_start_1ad
    invoke-virtual/range {v6 .. v13}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    check-cast v7, Ljava/io/Closeable;
    :try_end_1b3
    .catchall {:try_start_1ad .. :try_end_1b3} :catchall_387

    :try_start_1b3
    move-object v8, v7

    check-cast v8, Landroid/database/Cursor;

    :goto_1b6
    invoke-interface {v8}, Landroid/database/Cursor;->moveToNext()Z

    move-result v9
    :try_end_1ba
    .catchall {:try_start_1b3 .. :try_end_1ba} :catchall_37d

    if-eqz v9, :cond_1e4

    :try_start_1bc
    invoke-interface {v8, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v9

    const/4 v11, 0x1

    invoke-static {v8, v11}, Lwyh;->z(Landroid/database/Cursor;I)[B

    move-result-object v12

    if-nez v12, :cond_1c9

    new-array v12, v4, [B

    :cond_1c9
    invoke-virtual {v0, v12}, Lg0d;->h([B)Ljava/lang/String;

    move-result-object v11

    if-nez v11, :cond_1d0

    move-object v11, v14

    :cond_1d0
    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    new-instance v10, Lkotlin/Pair;

    invoke-direct {v10, v9, v11}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v1, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1dc
    .catchall {:try_start_1bc .. :try_end_1dc} :catchall_1e2

    goto :goto_1b6

    :goto_1dd
    move-object v2, v0

    move-object/from16 v1, v25

    goto/16 :goto_381

    :catchall_1e2
    move-exception v0

    goto :goto_1dd

    :cond_1e4
    const/4 v8, 0x0

    :try_start_1e5
    invoke-static {v7, v8}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v7
    :try_end_1ec
    .catchall {:try_start_1e5 .. :try_end_1ec} :catchall_387

    move v12, v4

    :goto_1ed
    if-ge v12, v7, :cond_234

    :try_start_1ef
    invoke-virtual {v1, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    add-int/lit8 v12, v12, 0x1

    check-cast v8, Lkotlin/Pair;

    new-instance v9, Landroid/content/ContentValues;

    const/4 v11, 0x1

    invoke-direct {v9, v11}, Landroid/content/ContentValues;-><init>(I)V

    iget-object v10, v8, Lkotlin/Pair;->b:Ljava/lang/Object;

    check-cast v10, Ljava/lang/String;

    invoke-static {v10, v3}, Lwyh;->u(Ljava/lang/String;Ljava/security/Key;)[B

    move-result-object v10

    if-eqz v10, :cond_228

    move-object/from16 v11, v28

    invoke-virtual {v9, v11, v10}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    const-string v10, "id == ?"

    iget-object v8, v8, Lkotlin/Pair;->a:Ljava/lang/Object;

    check-cast v8, Ljava/lang/Number;

    invoke-virtual {v8}, Ljava/lang/Number;->longValue()J

    move-result-wide v22

    invoke-static/range {v22 .. v23}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v8

    filled-new-array {v8}, [Ljava/lang/String;

    move-result-object v8

    move-object/from16 v13, v27

    invoke-virtual {v6, v13, v9, v10, v8}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-object/from16 v28, v11

    move-object/from16 v27, v13

    goto :goto_1ed

    :cond_228
    new-instance v0, Llv0;

    invoke-direct {v0, v14}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_22e
    .catchall {:try_start_1ef .. :try_end_22e} :catchall_22e

    :catchall_22e
    move-exception v0

    move-object v2, v0

    move-object/from16 v1, v25

    goto/16 :goto_39b

    :cond_234
    :try_start_234
    invoke-virtual {v3}, Ljavax/crypto/spec/SecretKeySpec;->getEncoded()[B

    move-result-object v1

    array-length v3, v1

    if-eqz v3, :cond_247

    iget-object v2, v2, Lz4f;->a:Lvx;

    invoke-virtual {v2}, Lvx;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lc36;

    invoke-virtual {v2, v1}, Lc36;->d([B)[B

    move-result-object v1

    :cond_247
    move-object v8, v1

    if-eqz v8, :cond_375

    new-instance v1, Landroid/content/ContentValues;

    const/4 v2, 0x2

    invoke-direct {v1, v2}, Landroid/content/ContentValues;-><init>(I)V

    move-object/from16 v2, v16

    move-object/from16 v3, v26

    invoke-virtual {v1, v3, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v5, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    const/4 v2, 0x0

    invoke-virtual {v6, v15, v2, v1}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    :try_end_25e
    .catchall {:try_start_234 .. :try_end_25e} :catchall_387

    move-object/from16 v1, v25

    :goto_260
    :try_start_260
    invoke-static {v1, v2}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    new-instance v1, Lvzc;

    invoke-direct {v1, v0, v8}, Lvzc;-><init>(Lg0d;[B)V

    iget-object v2, v0, Lg0d;->c:Landroid/database/sqlite/SQLiteDatabase;

    const-string v23, "crypto_keys"

    filled-new-array {v5}, [Ljava/lang/String;

    move-result-object v24

    const-string v25, "algorithm == ?"

    filled-new-array/range {v19 .. v19}, [Ljava/lang/String;

    move-result-object v26

    const/16 v28, 0x0

    const/16 v29, 0x0

    const/16 v27, 0x0

    move-object/from16 v22, v2

    invoke-virtual/range {v22 .. v29}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    check-cast v2, Ljava/io/Closeable;
    :try_end_284
    .catchall {:try_start_260 .. :try_end_284} :catchall_3a1

    :try_start_284
    move-object v7, v2

    check-cast v7, Landroid/database/Cursor;

    invoke-interface {v7}, Landroid/database/Cursor;->moveToNext()Z

    move-result v8
    :try_end_28b
    .catchall {:try_start_284 .. :try_end_28b} :catchall_36d

    const-string v9, "USE-AES-256-CBC"

    if-eqz v8, :cond_2a8

    :try_start_28f
    invoke-static {v7, v4}, Lwyh;->y(Landroid/database/Cursor;I)[B

    move-result-object v3

    sget-object v4, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v9, v4}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v4

    invoke-static {v3, v4}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v3

    if-eqz v3, :cond_2a2

    const/4 v8, 0x0

    goto/16 :goto_359

    :cond_2a2
    new-instance v0, Llv0;

    invoke-direct {v0, v14}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2a8
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    iget-object v8, v0, Lg0d;->c:Landroid/database/sqlite/SQLiteDatabase;

    const-string v23, "sync_entities_metadata"

    const-string v10, "storage_key"

    move-object/from16 v12, v21

    filled-new-array {v10, v12}, [Ljava/lang/String;

    move-result-object v24

    const/16 v28, 0x0

    const/16 v29, 0x0

    const/16 v25, 0x0

    const/16 v26, 0x0

    const/16 v27, 0x0

    move-object/from16 v22, v8

    invoke-virtual/range {v22 .. v29}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    check-cast v8, Ljava/io/Closeable;
    :try_end_2cb
    .catchall {:try_start_28f .. :try_end_2cb} :catchall_36d

    :try_start_2cb
    move-object v10, v8

    check-cast v10, Landroid/database/Cursor;

    :goto_2ce
    invoke-interface {v10}, Landroid/database/Cursor;->moveToNext()Z

    move-result v11

    if-eqz v11, :cond_2f4

    invoke-interface {v10, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v11

    move/from16 v18, v4

    const/4 v13, 0x1

    invoke-static {v10, v13}, Lwyh;->y(Landroid/database/Cursor;I)[B

    move-result-object v4

    invoke-virtual {v0, v4}, Lg0d;->h([B)Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_2e6

    move-object v4, v14

    :cond_2e6
    new-instance v13, Lkotlin/Pair;

    invoke-direct {v13, v11, v4}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v7, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_2ee
    .catchall {:try_start_2cb .. :try_end_2ee} :catchall_365

    move/from16 v4, v18

    goto :goto_2ce

    :goto_2f1
    move-object v1, v0

    goto/16 :goto_367

    :cond_2f4
    move/from16 v18, v4

    const/4 v4, 0x0

    :try_start_2f7
    invoke-static {v8, v4}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v4

    move/from16 v8, v18

    :goto_300
    if-ge v8, v4, :cond_341

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    add-int/lit8 v8, v8, 0x1

    check-cast v10, Lkotlin/Pair;

    iget-object v11, v10, Lkotlin/Pair;->b:Ljava/lang/Object;

    check-cast v11, Ljava/lang/String;

    invoke-virtual {v1}, Lvzc;->a()Ljava/security/Key;

    move-result-object v13

    invoke-static {v11, v13}, Lwyh;->u(Ljava/lang/String;Ljava/security/Key;)[B

    move-result-object v11

    if-eqz v11, :cond_33b

    new-instance v13, Landroid/content/ContentValues;

    move/from16 p1, v4

    const/4 v4, 0x1

    invoke-direct {v13, v4}, Landroid/content/ContentValues;-><init>(I)V

    invoke-virtual {v13, v12, v11}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    const-string v11, "sync_entities_metadata"

    move-object/from16 p2, v7

    const-string v7, "storage_key == ?"

    move/from16 v16, v8

    new-array v8, v4, [Ljava/lang/String;

    iget-object v4, v10, Lkotlin/Pair;->a:Ljava/lang/Object;

    aput-object v4, v8, v18

    invoke-virtual {v6, v11, v13, v7, v8}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move/from16 v4, p1

    move-object/from16 v7, p2

    move/from16 v8, v16

    goto :goto_300

    :cond_33b
    new-instance v0, Llv0;

    invoke-direct {v0, v14}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_341
    new-instance v4, Landroid/content/ContentValues;

    const/4 v11, 0x1

    invoke-direct {v4, v11}, Landroid/content/ContentValues;-><init>(I)V

    move-object/from16 v13, v19

    invoke-virtual {v4, v3, v13}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v3, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v9, v3}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v3

    invoke-virtual {v4, v5, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    const/4 v8, 0x0

    invoke-virtual {v6, v15, v8, v4}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    :try_end_359
    .catchall {:try_start_2f7 .. :try_end_359} :catchall_36d

    :goto_359
    :try_start_359
    invoke-static {v2, v8}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    iput-object v1, v0, Lg0d;->d:Lvzc;

    invoke-virtual {v6}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_361
    .catchall {:try_start_359 .. :try_end_361} :catchall_3a1

    invoke-virtual {v6}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    return-void

    :catchall_365
    move-exception v0

    goto :goto_2f1

    :goto_367
    :try_start_367
    throw v1
    :try_end_368
    .catchall {:try_start_367 .. :try_end_368} :catchall_368

    :catchall_368
    move-exception v0

    :try_start_369
    invoke-static {v8, v1}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw v0
    :try_end_36d
    .catchall {:try_start_369 .. :try_end_36d} :catchall_36d

    :catchall_36d
    move-exception v0

    move-object v1, v0

    :try_start_36f
    throw v1
    :try_end_370
    .catchall {:try_start_36f .. :try_end_370} :catchall_370

    :catchall_370
    move-exception v0

    :try_start_371
    invoke-static {v2, v1}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw v0
    :try_end_375
    .catchall {:try_start_371 .. :try_end_375} :catchall_3a1

    :cond_375
    move-object/from16 v1, v25

    :try_start_377
    new-instance v0, Llv0;

    invoke-direct {v0, v14}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_37d
    .catchall {:try_start_377 .. :try_end_37d} :catchall_396

    :catchall_37d
    move-exception v0

    move-object/from16 v1, v25

    move-object v2, v0

    :goto_381
    :try_start_381
    throw v2
    :try_end_382
    .catchall {:try_start_381 .. :try_end_382} :catchall_382

    :catchall_382
    move-exception v0

    :try_start_383
    invoke-static {v7, v2}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw v0

    :catchall_387
    move-exception v0

    move-object/from16 v1, v25

    :goto_38a
    move-object v2, v0

    goto :goto_39b

    :catchall_38c
    move-exception v0

    move-object v1, v8

    goto :goto_38a

    :cond_38f
    move-object v1, v7

    new-instance v0, Llv0;

    invoke-direct {v0, v14}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_396
    .catchall {:try_start_383 .. :try_end_396} :catchall_396

    :catchall_396
    move-exception v0

    goto :goto_38a

    :catchall_398
    move-exception v0

    move-object v1, v7

    goto :goto_38a

    :goto_39b
    :try_start_39b
    throw v2
    :try_end_39c
    .catchall {:try_start_39b .. :try_end_39c} :catchall_39c

    :catchall_39c
    move-exception v0

    :try_start_39d
    invoke-static {v1, v2}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw v0
    :try_end_3a1
    .catchall {:try_start_39d .. :try_end_3a1} :catchall_3a1

    :catchall_3a1
    move-exception v0

    invoke-virtual {v6}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    :cond_3a6
    :try_start_3a6
    new-instance v0, Llv0;

    invoke-direct {v0, v14}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_3ac
    new-instance v0, Llv0;

    invoke-direct {v0, v14}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_3b2
    .catchall {:try_start_3a6 .. :try_end_3b2} :catchall_3b2

    :catchall_3b2
    move-exception v0

    invoke-virtual {v6}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    :catchall_3b7
    move-exception v0

    move-object v1, v0

    :try_start_3b9
    throw v1
    :try_end_3ba
    .catchall {:try_start_3b9 .. :try_end_3ba} :catchall_3ba

    :catchall_3ba
    move-exception v0

    invoke-static {v4, v1}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw v0
.end method


# virtual methods
.method public final close()V
    .registers 1

    iget-object p0, p0, Lg0d;->c:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteClosable;->close()V

    return-void
.end method

.method public final h([B)Ljava/lang/String;
    .registers 7

    array-length v0, p1

    const/4 v1, 0x3

    if-lt v0, v1, :cond_33

    new-instance v0, Lkotlin/ranges/IntRange;

    const/4 v2, 0x1

    const/4 v3, 0x2

    const/4 v4, 0x0

    invoke-direct {v0, v4, v3, v2}, Lkotlin/ranges/a;-><init>(III)V

    invoke-static {p1, v0}, Le82;->z([BLkotlin/ranges/IntRange;)[B

    move-result-object v0

    sget-object v2, Lg0d;->f:[B

    invoke-static {v0, v2}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v0

    if-eqz v0, :cond_33

    array-length v0, p1

    invoke-static {v1, v0}, Ldjh;->j(II)Lkotlin/ranges/IntRange;

    move-result-object v0

    invoke-static {p1, v0}, Le82;->z([BLkotlin/ranges/IntRange;)[B

    move-result-object p1

    iget-object p0, p0, Lg0d;->b:Lz4f;

    invoke-virtual {p0, p1}, Lz4f;->a([B)[B

    move-result-object p0

    if-eqz p0, :cond_31

    sget-object p1, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, p0, p1}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    return-object v0

    :cond_31
    const/4 p0, 0x0

    return-object p0

    :cond_33
    sget-object p0, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, p1, p0}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    return-object v0
.end method

.method public final k([B)Lz5i;
    .registers 6

    sget-object v0, Lwzc;->x:Lwzc;

    iget-object v1, p0, Lg0d;->d:Lvzc;

    if-eqz v1, :cond_53

    invoke-virtual {v1}, Lvzc;->a()Ljava/security/Key;

    move-result-object v1

    if-eqz v1, :cond_53

    array-length v2, p1

    const/16 v3, 0x20

    if-lt v2, v3, :cond_47

    array-length v2, p1

    const/16 v3, 0x10

    sub-int/2addr v2, v3

    rem-int/2addr v2, v3

    if-nez v2, :cond_47

    const/4 p0, 0x0

    invoke-static {p0, v3}, Ldjh;->j(II)Lkotlin/ranges/IntRange;

    move-result-object p0

    invoke-static {p1, p0}, Le82;->z([BLkotlin/ranges/IntRange;)[B

    move-result-object p0

    array-length v2, p1

    invoke-static {v3, v2}, Ldjh;->j(II)Lkotlin/ranges/IntRange;

    move-result-object v2

    invoke-static {p1, v2}, Le82;->z([BLkotlin/ranges/IntRange;)[B

    move-result-object p1

    const-string v2, "AES/CBC/PKCS5Padding"

    invoke-static {v2}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v2

    :try_start_30
    new-instance v3, Ljavax/crypto/spec/IvParameterSpec;

    invoke-direct {v3, p0}, Ljavax/crypto/spec/IvParameterSpec;-><init>([B)V

    const/4 p0, 0x2

    invoke-virtual {v2, p0, v1, v3}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    invoke-virtual {v2, p1}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object p0

    sget-object p1, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, p0, p1}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V
    :try_end_44
    .catch Ljava/lang/Exception; {:try_start_30 .. :try_end_44} :catch_45

    goto :goto_4b

    :catch_45
    const/4 v1, 0x0

    goto :goto_4b

    :cond_47
    invoke-virtual {p0, p1}, Lg0d;->h([B)Ljava/lang/String;

    move-result-object v1

    :goto_4b
    if-eqz v1, :cond_53

    new-instance p0, Lxzc;

    invoke-direct {p0, v1}, Lxzc;-><init>(Ljava/lang/String;)V

    return-object p0

    :cond_53
    return-object v0
.end method

.method public final l(Lv3g;)Le0d;
    .registers 13

    sget-object v0, Lszc;->b:[Lszc;

    const-string v0, "password_value"

    const-string v1, "keychain_identifier"

    const-string v2, "id"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v5

    iget-object v0, p1, Lv3g;->d:Ljava/lang/String;

    iget-object v1, p1, Lv3g;->j:Ljava/lang/String;

    iget-object v2, p1, Lv3g;->k:Ljava/lang/String;

    iget-object v3, p1, Lv3g;->m:Ljava/lang/String;

    iget-object p1, p1, Lv3g;->c:Ljava/lang/String;

    filled-new-array {v0, v1, v2, v3, p1}, [Ljava/lang/String;

    move-result-object v7

    const/4 v9, 0x0

    const/4 v10, 0x0

    iget-object v3, p0, Lg0d;->c:Landroid/database/sqlite/SQLiteDatabase;

    const-string v4, "logins"

    const-string v6, "origin_url == ? AND username_element == ? AND username_value == ? AND password_element == ? AND signon_realm == ?"

    const/4 v8, 0x0

    invoke-virtual/range {v3 .. v10}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1

    check-cast p1, Ljava/io/Closeable;

    :try_start_29
    move-object v0, p1

    check-cast v0, Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1
    :try_end_30
    .catchall {:try_start_29 .. :try_end_30} :catchall_6a

    const-string v2, ""

    const/4 v3, 0x0

    if-eqz v1, :cond_5f

    const/4 v1, 0x0

    :try_start_36
    invoke-interface {v0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lwyh;->y(Landroid/database/Cursor;I)[B

    move-result-object v1

    const/4 v6, 0x2

    invoke-static {v0, v6}, Lwyh;->z(Landroid/database/Cursor;I)[B

    move-result-object v0

    invoke-virtual {p0, v1}, Lg0d;->k([B)Lz5i;

    move-result-object p0

    instance-of v1, p0, Lxzc;

    if-eqz v1, :cond_56

    new-instance v1, Le0d;

    check-cast p0, Lxzc;

    iget-object p0, p0, Lxzc;->x:Ljava/lang/String;

    invoke-direct {v1, p0, v4, v5, v0}, Le0d;-><init>(Ljava/lang/String;J[B)V

    goto :goto_5b

    :cond_56
    new-instance v1, Le0d;

    invoke-direct {v1, v2, v4, v5, v0}, Le0d;-><init>(Ljava/lang/String;J[B)V
    :try_end_5b
    .catchall {:try_start_36 .. :try_end_5b} :catchall_6a

    :goto_5b
    invoke-static {p1, v3}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    return-object v1

    :cond_5f
    invoke-static {p1, v3}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    new-instance p0, Le0d;

    const-wide/16 v0, -0x1

    invoke-direct {p0, v2, v0, v1, v3}, Le0d;-><init>(Ljava/lang/String;J[B)V

    return-object p0

    :catchall_6a
    move-exception v0

    move-object p0, v0

    :try_start_6c
    throw p0
    :try_end_6d
    .catchall {:try_start_6c .. :try_end_6d} :catchall_6d

    :catchall_6d
    move-exception v0

    invoke-static {p1, p0}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw v0
.end method

.method public final m(Landroid/database/Cursor;Z)Ly9m;
    .registers 55

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-object v2, v0, Lg0d;->e:Ljava/lang/Boolean;

    if-nez v2, :cond_c

    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    iput-object v2, v0, Lg0d;->e:Ljava/lang/Boolean;

    :cond_c
    invoke-static {}, Lkotlin/collections/a;->b()Lehc;

    move-result-object v2

    const/4 v3, 0x0

    move v4, v3

    :goto_12
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v5

    if-eqz v5, :cond_430

    sget-object v5, Lszc;->b:[Lszc;

    const/16 v5, 0xa

    invoke-interface {v1, v5}, Landroid/database/Cursor;->getInt(I)I

    move-result v6

    const/16 v7, 0xb

    invoke-interface {v1, v7}, Landroid/database/Cursor;->isNull(I)Z

    move-result v8

    if-eqz v8, :cond_2a

    const/4 v7, 0x0

    goto :goto_32

    :cond_2a
    invoke-interface {v1, v7}, Landroid/database/Cursor;->getInt(I)I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    :goto_32
    if-eqz v7, :cond_39

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    goto :goto_3a

    :cond_39
    move v7, v3

    :goto_3a
    const/16 v8, 0x12

    invoke-interface {v1, v8}, Landroid/database/Cursor;->isNull(I)Z

    move-result v10

    if-eqz v10, :cond_44

    const/4 v8, 0x0

    goto :goto_4c

    :cond_44
    invoke-interface {v1, v8}, Landroid/database/Cursor;->getInt(I)I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    :goto_4c
    if-eqz v8, :cond_53

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v8

    goto :goto_54

    :cond_53
    move v8, v3

    :goto_54
    const/16 v10, 0x14

    invoke-interface {v1, v10}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v10

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v16

    const/4 v12, 0x1

    invoke-interface {v1, v12}, Landroid/database/Cursor;->isNull(I)Z

    move-result v13

    if-eqz v13, :cond_67

    const/4 v13, 0x0

    goto :goto_6b

    :cond_67
    invoke-interface {v1, v12}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v13

    :goto_6b
    const-string v14, ""

    if-nez v13, :cond_72

    move-object/from16 v17, v14

    goto :goto_74

    :cond_72
    move-object/from16 v17, v13

    :goto_74
    const/4 v13, 0x2

    invoke-interface {v1, v13}, Landroid/database/Cursor;->isNull(I)Z

    move-result v15

    if-eqz v15, :cond_7d

    const/4 v15, 0x0

    goto :goto_81

    :cond_7d
    invoke-interface {v1, v13}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v15

    :goto_81
    if-nez v15, :cond_86

    move-object/from16 v19, v14

    goto :goto_88

    :cond_86
    move-object/from16 v19, v15

    :goto_88
    const/4 v15, 0x3

    invoke-interface {v1, v15}, Landroid/database/Cursor;->isNull(I)Z

    move-result v18

    if-eqz v18, :cond_92

    const/16 v18, 0x0

    goto :goto_96

    :cond_92
    invoke-interface {v1, v15}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v18

    :goto_96
    if-nez v18, :cond_9b

    move-object/from16 v20, v14

    goto :goto_9d

    :cond_9b
    move-object/from16 v20, v18

    :goto_9d
    const/4 v9, 0x4

    invoke-interface {v1, v9}, Landroid/database/Cursor;->isNull(I)Z

    move-result v18

    if-eqz v18, :cond_a7

    const/16 v18, 0x0

    goto :goto_ab

    :cond_a7
    invoke-interface {v1, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v18

    :goto_ab
    if-nez v18, :cond_b0

    move-object/from16 v22, v14

    goto :goto_b2

    :cond_b0
    move-object/from16 v22, v18

    :goto_b2
    const/16 v12, 0x1c

    invoke-static {v1, v12}, Lwyh;->z(Landroid/database/Cursor;I)[B

    move-result-object v23

    const/4 v12, 0x6

    invoke-interface {v1, v12}, Landroid/database/Cursor;->isNull(I)Z

    move-result v21

    if-eqz v21, :cond_c1

    const/4 v12, 0x0

    goto :goto_c5

    :cond_c1
    invoke-interface {v1, v12}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v12

    :goto_c5
    if-nez v12, :cond_c8

    move-object v12, v14

    :cond_c8
    const/4 v13, 0x7

    invoke-interface {v1, v13}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v13

    const/16 v15, 0x8

    invoke-interface {v1, v15}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v30

    const/16 v15, 0x9

    invoke-interface {v1, v15}, Landroid/database/Cursor;->getInt(I)I

    move-result v15

    if-lez v15, :cond_de

    const/16 v32, 0x1

    goto :goto_e0

    :cond_de
    move/from16 v32, v3

    :goto_e0
    sget-object v15, Lx3g;->c:Lh58;

    invoke-virtual {v15}, Lz4;->iterator()Ljava/util/Iterator;

    move-result-object v15

    :cond_e6
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v25

    if-eqz v25, :cond_fb

    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v25

    move-object/from16 v26, v25

    check-cast v26, Lx3g;

    invoke-virtual/range {v26 .. v26}, Ljava/lang/Enum;->ordinal()I

    move-result v9

    if-ne v9, v6, :cond_e6

    goto :goto_fd

    :cond_fb
    const/16 v25, 0x0

    :goto_fd
    check-cast v25, Lx3g;

    if-nez v25, :cond_103

    sget-object v25, Lx3g;->a:Lx3g;

    :cond_103
    sget-object v6, Ly3g;->d:Lh58;

    invoke-virtual {v6}, Lz4;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_109
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_11d

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    move-object v15, v9

    check-cast v15, Ly3g;

    invoke-virtual {v15}, Ljava/lang/Enum;->ordinal()I

    move-result v15

    if-ne v15, v7, :cond_109

    goto :goto_11e

    :cond_11d
    const/4 v9, 0x0

    :goto_11e
    check-cast v9, Ly3g;

    if-nez v9, :cond_124

    sget-object v9, Ly3g;->a:Ly3g;

    :cond_124
    move-object/from16 v33, v9

    sget-object v6, Lszc;->b:[Lszc;

    const/16 v6, 0x13

    invoke-static {v1, v6}, Lwyh;->z(Landroid/database/Cursor;I)[B

    move-result-object v6

    const/16 v7, 0xc

    invoke-interface {v1, v7}, Landroid/database/Cursor;->isNull(I)Z

    move-result v9

    if-eqz v9, :cond_138

    const/4 v7, 0x0

    goto :goto_140

    :cond_138
    invoke-interface {v1, v7}, Landroid/database/Cursor;->getInt(I)I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    :goto_140
    if-eqz v7, :cond_149

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    move/from16 v34, v7

    goto :goto_14b

    :cond_149
    move/from16 v34, v3

    :goto_14b
    const/16 v7, 0xd

    invoke-static {v1, v7}, Lwyh;->z(Landroid/database/Cursor;I)[B

    move-result-object v35

    const/16 v7, 0xe

    invoke-interface {v1, v7}, Landroid/database/Cursor;->isNull(I)Z

    move-result v9

    if-eqz v9, :cond_15b

    const/4 v7, 0x0

    goto :goto_15f

    :cond_15b
    invoke-interface {v1, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    :goto_15f
    if-nez v7, :cond_164

    move-object/from16 v37, v14

    goto :goto_166

    :cond_164
    move-object/from16 v37, v7

    :goto_166
    const/16 v7, 0xf

    invoke-interface {v1, v7}, Landroid/database/Cursor;->isNull(I)Z

    move-result v9

    if-eqz v9, :cond_170

    const/4 v7, 0x0

    goto :goto_174

    :cond_170
    invoke-interface {v1, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    :goto_174
    if-nez v7, :cond_179

    move-object/from16 v38, v14

    goto :goto_17b

    :cond_179
    move-object/from16 v38, v7

    :goto_17b
    const/16 v7, 0x10

    invoke-interface {v1, v7}, Landroid/database/Cursor;->isNull(I)Z

    move-result v9

    if-eqz v9, :cond_185

    const/4 v7, 0x0

    goto :goto_189

    :cond_185
    invoke-interface {v1, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    :goto_189
    if-nez v7, :cond_18e

    move-object/from16 v39, v14

    goto :goto_190

    :cond_18e
    move-object/from16 v39, v7

    :goto_190
    const/16 v7, 0x11

    invoke-interface {v1, v7}, Landroid/database/Cursor;->isNull(I)Z

    move-result v9

    if-eqz v9, :cond_19a

    const/4 v7, 0x0

    goto :goto_1a2

    :cond_19a
    invoke-interface {v1, v7}, Landroid/database/Cursor;->getInt(I)I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    :goto_1a2
    if-eqz v7, :cond_1a9

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    goto :goto_1aa

    :cond_1a9
    move v7, v3

    :goto_1aa
    if-lez v7, :cond_1af

    const/16 v40, 0x1

    goto :goto_1b1

    :cond_1af
    move/from16 v40, v3

    :goto_1b1
    sget-object v7, Ljv9;->c:Lh58;

    invoke-virtual {v7}, Lz4;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_1b7
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_1cb

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    move-object v15, v9

    check-cast v15, Ljv9;

    invoke-virtual {v15}, Ljava/lang/Enum;->ordinal()I

    move-result v15

    if-ne v15, v8, :cond_1b7

    goto :goto_1cc

    :cond_1cb
    const/4 v9, 0x0

    :goto_1cc
    check-cast v9, Ljv9;

    if-nez v9, :cond_1d2

    sget-object v9, Ljv9;->a:Ljv9;

    :cond_1d2
    move-object/from16 v36, v9

    sget-object v7, Lszc;->b:[Lszc;

    const/16 v7, 0x15

    invoke-interface {v1, v7}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v7

    const/16 v9, 0x1e

    invoke-interface {v1, v9}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v26

    const/16 v9, 0x16

    invoke-static {v1, v9}, Lwyh;->z(Landroid/database/Cursor;I)[B

    move-result-object v41

    const/16 v9, 0x17

    invoke-interface {v1, v9}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v28

    const/16 v9, 0x18

    invoke-interface {v1, v9}, Landroid/database/Cursor;->isNull(I)Z

    move-result v15

    if-eqz v15, :cond_1f8

    const/4 v9, 0x0

    goto :goto_1fc

    :cond_1f8
    invoke-interface {v1, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    :goto_1fc
    if-nez v9, :cond_201

    move-object/from16 v42, v14

    goto :goto_203

    :cond_201
    move-object/from16 v42, v9

    :goto_203
    const/16 v9, 0x19

    invoke-interface {v1, v9}, Landroid/database/Cursor;->isNull(I)Z

    move-result v15

    if-eqz v15, :cond_20d

    const/4 v9, 0x0

    goto :goto_211

    :cond_20d
    invoke-interface {v1, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    :goto_211
    if-nez v9, :cond_216

    move-object/from16 v43, v14

    goto :goto_218

    :cond_216
    move-object/from16 v43, v9

    :goto_218
    const/16 v9, 0x1d

    invoke-interface {v1, v9}, Landroid/database/Cursor;->isNull(I)Z

    move-result v15

    if-eqz v15, :cond_222

    const/4 v9, 0x0

    goto :goto_226

    :cond_222
    invoke-interface {v1, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    :goto_226
    if-nez v9, :cond_22b

    move-object/from16 v44, v14

    goto :goto_22d

    :cond_22b
    move-object/from16 v44, v9

    :goto_22d
    const/16 v9, 0x1a

    invoke-interface {v1, v9}, Landroid/database/Cursor;->isNull(I)Z

    move-result v14

    if-eqz v14, :cond_237

    const/4 v9, 0x0

    goto :goto_23f

    :cond_237
    invoke-interface {v1, v9}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v14

    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    :goto_23f
    if-eqz v9, :cond_248

    invoke-virtual {v9}, Ljava/lang/Long;->longValue()J

    move-result-wide v14

    :goto_245
    move-wide/from16 v45, v14

    goto :goto_24b

    :cond_248
    const-wide/16 v14, 0x0

    goto :goto_245

    :goto_24b
    const/16 v9, 0x1b

    invoke-interface {v1, v9}, Landroid/database/Cursor;->getInt(I)I

    move-result v9

    if-lez v9, :cond_256

    const/16 v47, 0x1

    goto :goto_258

    :cond_256
    move/from16 v47, v3

    :goto_258
    const/16 v9, 0x1f

    invoke-interface {v1, v9}, Landroid/database/Cursor;->getInt(I)I

    move-result v9

    if-lez v9, :cond_266

    const/16 v48, 0x1

    :goto_262
    move-object/from16 v18, v12

    const/4 v9, 0x1

    goto :goto_269

    :cond_266
    move/from16 v48, v3

    goto :goto_262

    :goto_269
    new-instance v12, Lv3g;

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    const v49, 0x600020e0

    const/16 v50, 0x0

    move-object/from16 v21, v6

    move-object v15, v13

    move-object/from16 v14, v25

    const/4 v6, 0x3

    move-wide/from16 v24, v7

    move-object v13, v10

    const/4 v7, 0x2

    invoke-direct/range {v12 .. v50}, Lv3g;-><init>(Ljava/lang/Long;Lx3g;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[BLjava/lang/String;[BJJJJZLy3g;I[BLjv9;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z[BLjava/lang/String;Ljava/lang/String;Ljava/lang/String;JZZII)V

    iget-object v8, v12, Lv3g;->a:Ljava/lang/Long;

    invoke-virtual {v8}, Ljava/lang/Long;->longValue()J

    move-result-wide v10

    new-instance v8, Lu9d;

    invoke-direct {v8}, Lu9d;-><init>()V

    sget-object v13, Ltzc;->c:Lh58;

    new-instance v14, Ljava/util/ArrayList;

    invoke-static {v13, v5}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v15

    invoke-direct {v14, v15}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v13}, Lz4;->iterator()Ljava/util/Iterator;

    move-result-object v13

    :goto_29b
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_2ad

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ltzc;

    iget-object v15, v15, Ltzc;->a:Ljava/lang/String;

    invoke-virtual {v14, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_29b

    :cond_2ad
    new-array v13, v3, [Ljava/lang/String;

    invoke-virtual {v14, v13}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v13

    move-object/from16 v16, v13

    check-cast v16, [Ljava/lang/String;

    sget-object v13, Ltzc;->b:[Ltzc;

    invoke-static {v10, v11}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v10

    filled-new-array {v10}, [Ljava/lang/String;

    move-result-object v18

    const/16 v20, 0x0

    const/16 v21, 0x0

    iget-object v14, v0, Lg0d;->c:Landroid/database/sqlite/SQLiteDatabase;

    const-string v15, "insecure_credentials"

    const-string v17, "parent_id == ?"

    const/16 v19, 0x0

    invoke-virtual/range {v14 .. v21}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v10

    check-cast v10, Ljava/io/Closeable;

    :try_start_2d3
    move-object v11, v10

    check-cast v11, Landroid/database/Cursor;

    :goto_2d6
    invoke-interface {v11}, Landroid/database/Cursor;->moveToNext()Z

    move-result v13

    if-eqz v13, :cond_333

    sget-object v13, Ltzc;->b:[Ltzc;

    invoke-interface {v11, v9}, Landroid/database/Cursor;->getInt(I)I

    move-result v13

    sget-object v14, Ln9b;->c:Lh58;

    invoke-virtual {v14}, Lz4;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :cond_2e8
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_2fd

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    move-object/from16 v16, v15

    check-cast v16, Ln9b;

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Enum;->ordinal()I

    move-result v9

    if-ne v9, v13, :cond_2e8

    goto :goto_2fe

    :cond_2fd
    const/4 v15, 0x0

    :goto_2fe
    check-cast v15, Ln9b;

    if-nez v15, :cond_304

    sget-object v15, Ln9b;->a:Ln9b;

    :cond_304
    new-instance v9, Lo9b;

    sget-object v13, Ltzc;->b:[Ltzc;

    invoke-interface {v11, v7}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v13

    invoke-interface {v11, v6}, Landroid/database/Cursor;->getInt(I)I

    move-result v16

    if-lez v16, :cond_315

    const/4 v7, 0x1

    :goto_313
    const/4 v6, 0x4

    goto :goto_317

    :cond_315
    move v7, v3

    goto :goto_313

    :goto_317
    invoke-interface {v11, v6}, Landroid/database/Cursor;->getInt(I)I

    move-result v16

    if-lez v16, :cond_31f

    const/4 v6, 0x1

    goto :goto_320

    :cond_31f
    move v6, v3

    :goto_320
    invoke-direct {v9}, Ljava/lang/Object;-><init>()V

    iput-wide v13, v9, Lo9b;->a:J

    iput-boolean v7, v9, Lo9b;->b:Z

    iput-boolean v6, v9, Lo9b;->c:Z

    invoke-virtual {v8, v15, v9}, Lu9d;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_32c
    .catchall {:try_start_2d3 .. :try_end_32c} :catchall_427

    const/4 v6, 0x3

    const/4 v7, 0x2

    const/4 v9, 0x1

    goto :goto_2d6

    :goto_330
    move-object v1, v0

    goto/16 :goto_42a

    :cond_333
    const/4 v6, 0x0

    invoke-static {v10, v6}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    invoke-virtual {v8}, Lu9d;->g()Lu9d;

    move-result-object v6

    iput-object v6, v12, Lv3g;->D:Ljava/util/Map;

    iget-object v6, v12, Lv3g;->a:Ljava/lang/Long;

    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    invoke-static {}, Lkotlin/collections/a;->b()Lehc;

    move-result-object v8

    sget-object v9, Luzc;->c:Lh58;

    new-instance v10, Ljava/util/ArrayList;

    invoke-static {v9, v5}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v5

    invoke-direct {v10, v5}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v9}, Lz4;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_356
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_368

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Luzc;

    iget-object v9, v9, Luzc;->a:Ljava/lang/String;

    invoke-virtual {v10, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_356

    :cond_368
    new-array v5, v3, [Ljava/lang/String;

    invoke-virtual {v10, v5}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v5

    move-object/from16 v27, v5

    check-cast v27, [Ljava/lang/String;

    sget-object v5, Luzc;->b:[Luzc;

    invoke-static {v6, v7}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v5

    filled-new-array {v5}, [Ljava/lang/String;

    move-result-object v29

    const/16 v31, 0x0

    const/16 v32, 0x0

    iget-object v5, v0, Lg0d;->c:Landroid/database/sqlite/SQLiteDatabase;

    const-string v26, "password_notes"

    const-string v28, "parent_id == ?"

    const/16 v30, 0x0

    move-object/from16 v25, v5

    invoke-virtual/range {v25 .. v32}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v5

    check-cast v5, Ljava/io/Closeable;

    :try_start_390
    move-object v6, v5

    check-cast v6, Landroid/database/Cursor;

    :cond_393
    :goto_393
    invoke-interface {v6}, Landroid/database/Cursor;->moveToNext()Z

    move-result v7

    const/4 v9, 0x5

    if-eqz v7, :cond_3e8

    sget-object v7, Luzc;->b:[Luzc;

    const/4 v7, 0x3

    invoke-static {v6, v7}, Lwyh;->z(Landroid/database/Cursor;I)[B

    move-result-object v10

    if-nez v10, :cond_3a5

    new-array v10, v3, [B

    :cond_3a5
    invoke-virtual {v0, v10}, Lg0d;->k([B)Lz5i;

    move-result-object v10

    instance-of v11, v10, Lxzc;

    if-eqz v11, :cond_393

    check-cast v10, Lxzc;

    iget-object v10, v10, Lxzc;->x:Ljava/lang/String;

    new-instance v22, Lt4g;

    const/4 v11, 0x2

    invoke-interface {v6, v11}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v25

    const/4 v13, 0x4

    invoke-interface {v6, v13}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v23

    invoke-interface {v6, v9}, Landroid/database/Cursor;->isNull(I)Z

    move-result v14

    if-eqz v14, :cond_3c5

    const/4 v9, 0x0

    goto :goto_3cd

    :cond_3c5
    invoke-interface {v6, v9}, Landroid/database/Cursor;->getInt(I)I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    :goto_3cd
    if-eqz v9, :cond_3d4

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v9

    goto :goto_3d5

    :cond_3d4
    move v9, v3

    :goto_3d5
    if-lez v9, :cond_3dc

    const/16 v27, 0x1

    :goto_3d9
    move-object/from16 v26, v10

    goto :goto_3df

    :cond_3dc
    move/from16 v27, v3

    goto :goto_3d9

    :goto_3df
    invoke-direct/range {v22 .. v27}, Lt4g;-><init>(JLjava/lang/String;Ljava/lang/String;Z)V

    move-object/from16 v9, v22

    invoke-virtual {v8, v9}, Lehc;->add(Ljava/lang/Object;)Z
    :try_end_3e7
    .catchall {:try_start_390 .. :try_end_3e7} :catchall_41f

    goto :goto_393

    :cond_3e8
    const/4 v6, 0x0

    invoke-static {v5, v6}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    invoke-static {v8}, Lkotlin/collections/a;->a(Lehc;)Lehc;

    move-result-object v5

    iput-object v5, v12, Lv3g;->E:Ljava/util/List;

    if-eqz p2, :cond_41a

    sget-object v5, Lszc;->b:[Lszc;

    invoke-static {v1, v9}, Lwyh;->z(Landroid/database/Cursor;I)[B

    move-result-object v5

    if-nez v5, :cond_3fe

    new-array v5, v3, [B

    :cond_3fe
    invoke-virtual {v0, v5}, Lg0d;->k([B)Lz5i;

    move-result-object v5

    instance-of v6, v5, Lwzc;

    if-eqz v6, :cond_409

    const/4 v4, 0x1

    goto/16 :goto_12

    :cond_409
    instance-of v6, v5, Lxzc;

    if-eqz v6, :cond_414

    check-cast v5, Lxzc;

    iget-object v5, v5, Lxzc;->x:Ljava/lang/String;

    iput-object v5, v12, Lv3g;->n:Ljava/lang/String;

    goto :goto_41a

    :cond_414
    invoke-static {}, Lh9o;->p()V

    const/16 v51, 0x0

    return-object v51

    :cond_41a
    :goto_41a
    invoke-virtual {v2, v12}, Lehc;->add(Ljava/lang/Object;)Z

    goto/16 :goto_12

    :catchall_41f
    move-exception v0

    move-object v1, v0

    :try_start_421
    throw v1
    :try_end_422
    .catchall {:try_start_421 .. :try_end_422} :catchall_422

    :catchall_422
    move-exception v0

    invoke-static {v5, v1}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw v0

    :catchall_427
    move-exception v0

    goto/16 :goto_330

    :goto_42a
    :try_start_42a
    throw v1
    :try_end_42b
    .catchall {:try_start_42a .. :try_end_42b} :catchall_42b

    :catchall_42b
    move-exception v0

    invoke-static {v10, v1}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw v0

    :cond_430
    invoke-static {v2}, Lkotlin/collections/a;->a(Lehc;)Lehc;

    move-result-object v0

    if-eqz v4, :cond_439

    sget-object v0, La0d;->q:La0d;

    return-object v0

    :cond_439
    new-instance v1, Lb0d;

    invoke-direct {v1, v0}, Lb0d;-><init>(Lehc;)V

    return-object v1
.end method

.method public final n(JLjava/util/List;)V
    .registers 11

    sget-object v0, Luzc;->b:[Luzc;

    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lg0d;->c:Landroid/database/sqlite/SQLiteDatabase;

    const-string v2, "password_notes"

    const-string v3, "parent_id == ?"

    invoke-virtual {v1, v2, v3, v0}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p3

    :cond_17
    :goto_17
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_80

    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lt4g;

    iget-object v3, v0, Lt4g;->b:Ljava/lang/String;

    sget-object v4, Lyzc;->t:Lyzc;

    iget-object v5, p0, Lg0d;->d:Lvzc;

    if-eqz v5, :cond_3c

    invoke-virtual {v5}, Lvzc;->a()Ljava/security/Key;

    move-result-object v5

    if-eqz v5, :cond_3c

    invoke-static {v3, v5}, Lwyh;->u(Ljava/lang/String;Ljava/security/Key;)[B

    move-result-object v3

    if-eqz v3, :cond_3c

    new-instance v4, Lzzc;

    invoke-direct {v4, v3}, Lzzc;-><init>([B)V

    :cond_3c
    instance-of v3, v4, Lzzc;

    if-eqz v3, :cond_17

    check-cast v4, Lzzc;

    iget-object v3, v4, Lzzc;->t:[B

    new-instance v4, Landroid/content/ContentValues;

    sget-object v5, Luzc;->c:Lh58;

    invoke-virtual {v5}, La4;->d()I

    move-result v5

    invoke-direct {v4, v5}, Landroid/content/ContentValues;-><init>(I)V

    const-string v5, "parent_id"

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v5, "key"

    iget-object v6, v0, Lt4g;->a:Ljava/lang/String;

    invoke-virtual {v4, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v5, "value"

    invoke-virtual {v4, v5, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    iget-wide v5, v0, Lt4g;->c:J

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    const-string v5, "date_created"

    invoke-virtual {v4, v5, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    iget-boolean v0, v0, Lt4g;->d:Z

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    const-string v3, "confidential"

    invoke-virtual {v4, v3, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    const/4 v0, 0x0

    const/4 v3, 0x5

    invoke-virtual {v1, v2, v0, v4, v3}, Landroid/database/sqlite/SQLiteDatabase;->insertWithOnConflict(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;I)J

    goto :goto_17

    :cond_80
    return-void
.end method
