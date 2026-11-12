.class public final Lorg/chromium/base/VirtualDocumentPath;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/chromium/base/VirtualDocumentPath$CreateOrOpenResult;
    }
.end annotation


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;

.field public final d:Landroid/content/ContentResolver;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/chromium/base/VirtualDocumentPath;->a:Ljava/lang/String;

    iput-object p2, p0, Lorg/chromium/base/VirtualDocumentPath;->b:Ljava/lang/String;

    iput-object p3, p0, Lorg/chromium/base/VirtualDocumentPath;->c:Ljava/lang/String;

    sget-object p1, Lt8;->a:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    iput-object p1, p0, Lorg/chromium/base/VirtualDocumentPath;->d:Landroid/content/ContentResolver;

    return-void
.end method

.method public static parse(Ljava/lang/String;)Lorg/chromium/base/VirtualDocumentPath;
    .registers 8
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    const-string v0, "/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    const-string v2, ""

    const/4 v3, 0x0

    if-eqz v1, :cond_5b

    const-string v1, "//"

    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_14

    return-object v3

    :cond_14
    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-eqz v1, :cond_20

    invoke-static {v4, v5, p0}, Lp3p;->h(IILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    :cond_20
    const/4 v1, 0x6

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object p0

    array-length v0, p0

    const/4 v1, 0x5

    if-ge v0, v1, :cond_2a

    return-object v3

    :cond_2a
    aget-object v0, p0, v5

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_33

    return-object v3

    :cond_33
    aget-object v0, p0, v4

    const-string v4, "SAF"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3e

    return-object v3

    :cond_3e
    const/4 v0, 0x2

    aget-object v0, p0, v0

    const/4 v4, 0x3

    aget-object v4, p0, v4

    const/4 v5, 0x4

    aget-object v5, p0, v5

    array-length v6, p0

    if-le v6, v1, :cond_4c

    aget-object v2, p0, v1

    :cond_4c
    const-string p0, "tree"

    invoke-virtual {v4, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_55

    return-object v3

    :cond_55
    new-instance p0, Lorg/chromium/base/VirtualDocumentPath;

    invoke-direct {p0, v0, v5, v2}, Lorg/chromium/base/VirtualDocumentPath;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object p0

    :cond_5b
    const-string v0, "content://"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_8c

    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    invoke-static {p0}, Landroid/provider/DocumentsContract;->isTreeUri(Landroid/net/Uri;)Z

    move-result v0

    if-nez v0, :cond_6e

    return-object v3

    :cond_6e
    :try_start_6e
    invoke-static {p0}, Landroid/provider/DocumentsContract;->getDocumentId(Landroid/net/Uri;)Ljava/lang/String;
    :try_end_71
    .catch Ljava/lang/IllegalArgumentException; {:try_start_6e .. :try_end_71} :catch_72

    return-object v3

    :catch_72
    invoke-virtual {p0}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_8c

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_8c

    invoke-static {p0}, Landroid/provider/DocumentsContract;->getTreeDocumentId(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    new-instance v1, Lorg/chromium/base/VirtualDocumentPath;

    invoke-direct {v1, v0, p0, v2}, Lorg/chromium/base/VirtualDocumentPath;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v1

    :cond_8c
    return-object v3
.end method


# virtual methods
.method public final a()Landroid/net/Uri;
    .registers 22

    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/chromium/base/VirtualDocumentPath;->c:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_e

    new-array v1, v3, [Ljava/lang/String;

    goto :goto_14

    :cond_e
    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    :goto_14
    iget-object v2, v0, Lorg/chromium/base/VirtualDocumentPath;->b:Ljava/lang/String;

    invoke-static {v2}, Landroid/net/Uri;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iget-object v4, v0, Lorg/chromium/base/VirtualDocumentPath;->a:Ljava/lang/String;

    invoke-static {v4, v2}, Landroid/provider/DocumentsContract;->buildTreeDocumentUri(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-static {v2}, Landroid/provider/DocumentsContract;->getTreeDocumentId(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "_display_name"

    const-string v6, "document_id"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v9

    const-string v10, "_display_name = ?"

    array-length v13, v1

    move v14, v3

    :goto_30
    if-ge v14, v13, :cond_7e

    aget-object v15, v1, v14

    invoke-static {v2, v4}, Landroid/provider/DocumentsContract;->buildChildDocumentsUriUsingTree(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v8

    :try_start_38
    iget-object v7, v0, Lorg/chromium/base/VirtualDocumentPath;->d:Landroid/content/ContentResolver;

    filled-new-array {v15}, [Ljava/lang/String;

    move-result-object v11

    const/4 v12, 0x0

    invoke-virtual/range {v7 .. v12}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7
    :try_end_43
    .catch Ljava/lang/Exception; {:try_start_38 .. :try_end_43} :catch_9d

    if-eqz v7, :cond_9d

    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v8

    if-eqz v8, :cond_9d

    invoke-interface {v7, v5}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v8

    invoke-interface {v7, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v11

    :cond_53
    invoke-interface {v7, v8}, Landroid/database/Cursor;->isNull(I)Z

    move-result v12

    if-nez v12, :cond_6f

    invoke-interface {v7, v11}, Landroid/database/Cursor;->isNull(I)Z

    move-result v12

    if-nez v12, :cond_6f

    invoke-interface {v7, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v15, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_6f

    invoke-interface {v7, v11}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    const/4 v8, 0x1

    goto :goto_76

    :cond_6f
    invoke-interface {v7}, Landroid/database/Cursor;->moveToNext()Z

    move-result v12

    if-nez v12, :cond_53

    move v8, v3

    :goto_76
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    if-eqz v8, :cond_9d

    add-int/lit8 v14, v14, 0x1

    goto :goto_30

    :cond_7e
    invoke-static {v2, v4}, Landroid/provider/DocumentsContract;->buildDocumentUriUsingTree(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v16

    array-length v1, v1

    if-nez v1, :cond_9f

    :try_start_85
    iget-object v15, v0, Lorg/chromium/base/VirtualDocumentPath;->d:Landroid/content/ContentResolver;

    filled-new-array {v6}, [Ljava/lang/String;

    move-result-object v17

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v18, 0x0

    invoke-virtual/range {v15 .. v20}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    if-eqz v0, :cond_9d

    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0
    :try_end_9b
    .catch Ljava/lang/Exception; {:try_start_85 .. :try_end_9b} :catch_9d

    if-nez v0, :cond_9f

    :catch_9d
    :cond_9d
    const/4 v0, 0x0

    return-object v0

    :cond_9f
    return-object v16
.end method

.method public final b()Landroid/util/Pair;
    .registers 7

    iget-object v0, p0, Lorg/chromium/base/VirtualDocumentPath;->c:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    const-string v2, "/"

    const/4 v3, 0x0

    if-eqz v1, :cond_e

    new-array v0, v3, [Ljava/lang/String;

    goto :goto_12

    :cond_e
    invoke-virtual {v0, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    :goto_12
    array-length v1, v0

    if-nez v1, :cond_17

    const/4 p0, 0x0

    return-object p0

    :cond_17
    array-length v1, v0

    add-int/lit8 v1, v1, -0x1

    new-array v4, v1, [Ljava/lang/String;

    invoke-static {v0, v3, v4, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    new-instance v1, Landroid/util/Pair;

    new-instance v3, Lorg/chromium/base/VirtualDocumentPath;

    iget-object v5, p0, Lorg/chromium/base/VirtualDocumentPath;->b:Ljava/lang/String;

    invoke-static {v2, v4}, Ljava/lang/String;->join(Ljava/lang/CharSequence;[Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2

    iget-object p0, p0, Lorg/chromium/base/VirtualDocumentPath;->a:Ljava/lang/String;

    invoke-direct {v3, p0, v5, v2}, Lorg/chromium/base/VirtualDocumentPath;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    array-length p0, v0

    add-int/lit8 p0, p0, -0x1

    aget-object p0, v0, p0

    invoke-direct {v1, v3, p0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v1
.end method

.method public final createOrOpen()Lorg/chromium/base/VirtualDocumentPath$CreateOrOpenResult;
    .registers 5
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    invoke-virtual {p0}, Lorg/chromium/base/VirtualDocumentPath;->b()Landroid/util/Pair;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_8

    return-object v1

    :cond_8
    iget-object v2, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v2, Lorg/chromium/base/VirtualDocumentPath;

    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p0}, Lorg/chromium/base/VirtualDocumentPath;->a()Landroid/net/Uri;

    move-result-object v3

    if-eqz v3, :cond_1d

    new-instance p0, Lorg/chromium/base/VirtualDocumentPath$CreateOrOpenResult;

    const/4 v0, 0x0

    invoke-direct {p0, v0, v3}, Lorg/chromium/base/VirtualDocumentPath$CreateOrOpenResult;-><init>(ZLandroid/net/Uri;)V

    return-object p0

    :cond_1d
    invoke-virtual {v2}, Lorg/chromium/base/VirtualDocumentPath;->a()Landroid/net/Uri;

    move-result-object v2

    if-nez v2, :cond_24

    return-object v1

    :cond_24
    :try_start_24
    iget-object p0, p0, Lorg/chromium/base/VirtualDocumentPath;->d:Landroid/content/ContentResolver;

    const-string v3, ""

    invoke-static {p0, v2, v3, v0}, Landroid/provider/DocumentsContract;->createDocument(Landroid/content/ContentResolver;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    if-nez p0, :cond_2f

    return-object v1

    :cond_2f
    new-instance v0, Lorg/chromium/base/VirtualDocumentPath$CreateOrOpenResult;

    const/4 v2, 0x1

    invoke-direct {v0, v2, p0}, Lorg/chromium/base/VirtualDocumentPath$CreateOrOpenResult;-><init>(ZLandroid/net/Uri;)V
    :try_end_35
    .catch Ljava/lang/Exception; {:try_start_24 .. :try_end_35} :catch_36

    return-object v0

    :catch_36
    return-object v1
.end method

.method public final mkdir()Z
    .registers 5

    invoke-virtual {p0}, Lorg/chromium/base/VirtualDocumentPath;->b()Landroid/util/Pair;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_8

    return v1

    :cond_8
    iget-object v2, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v2, Lorg/chromium/base/VirtualDocumentPath;

    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p0}, Lorg/chromium/base/VirtualDocumentPath;->a()Landroid/net/Uri;

    move-result-object v3

    if-eqz v3, :cond_17

    return v1

    :cond_17
    invoke-virtual {v2}, Lorg/chromium/base/VirtualDocumentPath;->a()Landroid/net/Uri;

    move-result-object v2

    if-nez v2, :cond_1e

    return v1

    :cond_1e
    :try_start_1e
    iget-object p0, p0, Lorg/chromium/base/VirtualDocumentPath;->d:Landroid/content/ContentResolver;

    const-string v3, "vnd.android.document/directory"

    invoke-static {p0, v2, v3, v0}, Landroid/provider/DocumentsContract;->createDocument(Landroid/content/ContentResolver;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0
    :try_end_26
    .catch Ljava/lang/Exception; {:try_start_1e .. :try_end_26} :catch_2a

    if-eqz p0, :cond_2a

    const/4 p0, 0x1

    return p0

    :catch_2a
    :cond_2a
    return v1
.end method

.method public final resolveToContentUriString()Ljava/lang/String;
    .registers 1

    invoke-virtual {p0}, Lorg/chromium/base/VirtualDocumentPath;->a()Landroid/net/Uri;

    move-result-object p0

    if-nez p0, :cond_9

    const-string p0, ""

    return-object p0

    :cond_9
    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 6

    iget-object v0, p0, Lorg/chromium/base/VirtualDocumentPath;->c:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    const-string v2, "/tree/"

    const-string v3, "/SAF/"

    iget-object v4, p0, Lorg/chromium/base/VirtualDocumentPath;->b:Ljava/lang/String;

    iget-object p0, p0, Lorg/chromium/base/VirtualDocumentPath;->a:Ljava/lang/String;

    if-eqz v1, :cond_15

    invoke-static {v3, p0, v2, v4}, Lp3p;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_15
    const-string v1, "/"

    invoke-static {v3, p0, v2, v4, v1}, Lz1m;->n(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final writeFile([B)Z
    .registers 5

    invoke-virtual {p0}, Lorg/chromium/base/VirtualDocumentPath;->createOrOpen()Lorg/chromium/base/VirtualDocumentPath$CreateOrOpenResult;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_16

    :try_start_7
    iget-object p0, p0, Lorg/chromium/base/VirtualDocumentPath;->d:Landroid/content/ContentResolver;

    iget-object v2, v0, Lorg/chromium/base/VirtualDocumentPath$CreateOrOpenResult;->a:Landroid/net/Uri;

    invoke-virtual {p0, v2}, Landroid/content/ContentResolver;->openOutputStream(Landroid/net/Uri;)Ljava/io/OutputStream;

    move-result-object p0

    if-nez p0, :cond_17

    if-eqz p0, :cond_16

    invoke-virtual {p0}, Ljava/io/OutputStream;->close()V
    :try_end_16
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_16} :catch_29

    :cond_16
    return v1

    :cond_17
    :try_start_17
    invoke-virtual {p0, p1}, Ljava/io/OutputStream;->write([B)V
    :try_end_1a
    .catchall {:try_start_17 .. :try_end_1a} :catchall_1f

    const/4 p1, 0x1

    :try_start_1b
    invoke-virtual {p0}, Ljava/io/OutputStream;->close()V
    :try_end_1e
    .catch Ljava/lang/Exception; {:try_start_1b .. :try_end_1e} :catch_29

    return p1

    :catchall_1f
    move-exception p1

    :try_start_20
    invoke-virtual {p0}, Ljava/io/OutputStream;->close()V
    :try_end_23
    .catchall {:try_start_20 .. :try_end_23} :catchall_24

    goto :goto_28

    :catchall_24
    move-exception p0

    :try_start_25
    invoke-virtual {p1, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_28
    throw p1
    :try_end_29
    .catch Ljava/lang/Exception; {:try_start_25 .. :try_end_29} :catch_29

    :catch_29
    iget-object p0, v0, Lorg/chromium/base/VirtualDocumentPath$CreateOrOpenResult;->a:Landroid/net/Uri;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    return v1
.end method
