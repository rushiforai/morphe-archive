.class public final Lrlj;
.super Ldd7;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public b:Landroid/content/Context;

.field public c:Landroid/net/Uri;


# direct methods
.method public synthetic constructor <init>()V
    .registers 2

    .line 11
    const/4 v0, 0x0

    iput-byte v0, p0, Lrlj;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/net/Uri;)V
    .registers 4

    const/4 v0, 0x1

    iput-byte v0, p0, Lrlj;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lrlj;->b:Landroid/content/Context;

    iput-object p2, p0, Lrlj;->c:Landroid/net/Uri;

    return-void
.end method


# virtual methods
.method public final a()Z
    .registers 6

    iget-byte v0, p0, Lrlj;->a:B

    const-string v1, "mime_type"

    const/4 v2, 0x1

    const/4 v3, 0x0

    packed-switch v0, :pswitch_data_36

    iget-object v0, p0, Lrlj;->b:Landroid/content/Context;

    iget-object p0, p0, Lrlj;->c:Landroid/net/Uri;

    invoke-virtual {v0, p0, v2}, Landroid/content/Context;->checkCallingOrSelfUriPermission(Landroid/net/Uri;I)I

    move-result v4

    if-nez v4, :cond_1d

    invoke-static {v0, p0, v1}, Lz4o;->t0(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_1e

    :cond_1d
    move v2, v3

    :cond_1e
    return v2

    :pswitch_1f
    iget-object v0, p0, Lrlj;->b:Landroid/content/Context;

    iget-object p0, p0, Lrlj;->c:Landroid/net/Uri;

    invoke-virtual {v0, p0, v2}, Landroid/content/Context;->checkCallingOrSelfUriPermission(Landroid/net/Uri;I)I

    move-result v4

    if-nez v4, :cond_33

    invoke-static {v0, p0, v1}, Lz4o;->t0(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_34

    :cond_33
    move v2, v3

    :cond_34
    return v2

    nop

    :pswitch_data_36
    .packed-switch 0x0
        :pswitch_1f
    .end packed-switch
.end method

.method public final b()Z
    .registers 2

    iget-byte v0, p0, Lrlj;->a:B

    packed-switch v0, :pswitch_data_18

    iget-object v0, p0, Lrlj;->b:Landroid/content/Context;

    iget-object p0, p0, Lrlj;->c:Landroid/net/Uri;

    invoke-static {v0, p0}, Lz4o;->q(Landroid/content/Context;Landroid/net/Uri;)Z

    move-result p0

    return p0

    :pswitch_e
    iget-object v0, p0, Lrlj;->b:Landroid/content/Context;

    iget-object p0, p0, Lrlj;->c:Landroid/net/Uri;

    invoke-static {v0, p0}, Lz4o;->q(Landroid/content/Context;Landroid/net/Uri;)Z

    move-result p0

    return p0

    nop

    :pswitch_data_18
    .packed-switch 0x0
        :pswitch_e
    .end packed-switch
.end method

.method public final c()Z
    .registers 2

    iget-byte v0, p0, Lrlj;->a:B

    packed-switch v0, :pswitch_data_24

    :try_start_5
    iget-object v0, p0, Lrlj;->b:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object p0, p0, Lrlj;->c:Landroid/net/Uri;

    invoke-static {v0, p0}, Landroid/provider/DocumentsContract;->deleteDocument(Landroid/content/ContentResolver;Landroid/net/Uri;)Z

    move-result p0
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_11} :catch_12

    goto :goto_13

    :catch_12
    const/4 p0, 0x0

    :goto_13
    return p0

    :pswitch_14
    :try_start_14
    iget-object v0, p0, Lrlj;->b:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object p0, p0, Lrlj;->c:Landroid/net/Uri;

    invoke-static {v0, p0}, Landroid/provider/DocumentsContract;->deleteDocument(Landroid/content/ContentResolver;Landroid/net/Uri;)Z

    move-result p0
    :try_end_20
    .catch Ljava/lang/Exception; {:try_start_14 .. :try_end_20} :catch_21

    goto :goto_22

    :catch_21
    const/4 p0, 0x0

    :goto_22
    return p0

    nop

    :pswitch_data_24
    .packed-switch 0x0
        :pswitch_14
    .end packed-switch
.end method

.method public final d()Z
    .registers 2

    iget-byte v0, p0, Lrlj;->a:B

    packed-switch v0, :pswitch_data_18

    iget-object v0, p0, Lrlj;->b:Landroid/content/Context;

    iget-object p0, p0, Lrlj;->c:Landroid/net/Uri;

    invoke-static {v0, p0}, Lz4o;->Q(Landroid/content/Context;Landroid/net/Uri;)Z

    move-result p0

    return p0

    :pswitch_e
    iget-object v0, p0, Lrlj;->b:Landroid/content/Context;

    iget-object p0, p0, Lrlj;->c:Landroid/net/Uri;

    invoke-static {v0, p0}, Lz4o;->Q(Landroid/content/Context;Landroid/net/Uri;)Z

    move-result p0

    return p0

    nop

    :pswitch_data_18
    .packed-switch 0x0
        :pswitch_e
    .end packed-switch
.end method

.method public final g()Ljava/lang/String;
    .registers 3

    iget-byte v0, p0, Lrlj;->a:B

    packed-switch v0, :pswitch_data_1c

    iget-object v0, p0, Lrlj;->b:Landroid/content/Context;

    iget-object p0, p0, Lrlj;->c:Landroid/net/Uri;

    const-string v1, "_display_name"

    invoke-static {v0, p0, v1}, Lz4o;->t0(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_10
    iget-object v0, p0, Lrlj;->b:Landroid/content/Context;

    iget-object p0, p0, Lrlj;->c:Landroid/net/Uri;

    const-string v1, "_display_name"

    invoke-static {v0, p0, v1}, Lz4o;->t0(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_1c
    .packed-switch 0x0
        :pswitch_10
    .end packed-switch
.end method

.method public final h()Ljava/lang/String;
    .registers 3

    iget-byte v0, p0, Lrlj;->a:B

    packed-switch v0, :pswitch_data_2e

    iget-object v0, p0, Lrlj;->b:Landroid/content/Context;

    iget-object p0, p0, Lrlj;->c:Landroid/net/Uri;

    const-string v1, "mime_type"

    invoke-static {v0, p0, v1}, Lz4o;->t0(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "vnd.android.document/directory"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_18

    const/4 p0, 0x0

    :cond_18
    return-object p0

    :pswitch_19
    iget-object v0, p0, Lrlj;->b:Landroid/content/Context;

    iget-object p0, p0, Lrlj;->c:Landroid/net/Uri;

    const-string v1, "mime_type"

    invoke-static {v0, p0, v1}, Lz4o;->t0(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "vnd.android.document/directory"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2c

    const/4 p0, 0x0

    :cond_2c
    return-object p0

    nop

    :pswitch_data_2e
    .packed-switch 0x0
        :pswitch_19
    .end packed-switch
.end method

.method public final i()Landroid/net/Uri;
    .registers 2

    iget-byte v0, p0, Lrlj;->a:B

    packed-switch v0, :pswitch_data_c

    iget-object p0, p0, Lrlj;->c:Landroid/net/Uri;

    return-object p0

    :pswitch_8
    iget-object p0, p0, Lrlj;->c:Landroid/net/Uri;

    return-object p0

    nop

    :pswitch_data_c
    .packed-switch 0x0
        :pswitch_8
    .end packed-switch
.end method

.method public final j()J
    .registers 5

    iget-byte v0, p0, Lrlj;->a:B

    packed-switch v0, :pswitch_data_20

    iget-object v0, p0, Lrlj;->b:Landroid/content/Context;

    iget-object p0, p0, Lrlj;->c:Landroid/net/Uri;

    const-string v1, "_size"

    const-wide/16 v2, 0x0

    invoke-static {v0, p0, v1, v2, v3}, Lz4o;->s0(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0

    :pswitch_12
    iget-object v0, p0, Lrlj;->b:Landroid/content/Context;

    iget-object p0, p0, Lrlj;->c:Landroid/net/Uri;

    const-string v1, "_size"

    const-wide/16 v2, 0x0

    invoke-static {v0, p0, v1, v2, v3}, Lz4o;->s0(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0

    nop

    :pswitch_data_20
    .packed-switch 0x0
        :pswitch_12
    .end packed-switch
.end method

.method public final k(Ljava/lang/String;)Z
    .registers 5

    iget-byte v0, p0, Lrlj;->a:B

    packed-switch v0, :pswitch_data_1e

    const/4 v0, 0x0

    :try_start_6
    iget-object v1, p0, Lrlj;->b:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    iget-object v2, p0, Lrlj;->c:Landroid/net/Uri;

    invoke-static {v1, v2, p1}, Landroid/provider/DocumentsContract;->renameDocument(Landroid/content/ContentResolver;Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    if-eqz p1, :cond_17

    iput-object p1, p0, Lrlj;->c:Landroid/net/Uri;
    :try_end_16
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_16} :catch_17

    const/4 v0, 0x1

    :catch_17
    :cond_17
    return v0

    :pswitch_18
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p0

    :pswitch_data_1e
    .packed-switch 0x0
        :pswitch_18
    .end packed-switch
.end method

.method public final l()[Ldd7;
    .registers 12

    iget-object v1, p0, Lrlj;->b:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    iget-object v0, p0, Lrlj;->c:Landroid/net/Uri;

    invoke-static {v0}, Landroid/provider/DocumentsContract;->getDocumentId(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Landroid/provider/DocumentsContract;->buildChildDocumentsUriUsingTree(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    const/4 v9, 0x0

    const/4 v10, 0x0

    :try_start_17
    const-string v0, "document_id"

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v4

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v10

    :goto_24
    invoke-interface {v10}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_38

    invoke-interface {v10, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iget-object v2, p0, Lrlj;->c:Landroid/net/Uri;

    invoke-static {v2, v0}, Landroid/provider/DocumentsContract;->buildDocumentUriUsingTree(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v8, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_37
    .catch Ljava/lang/Exception; {:try_start_17 .. :try_end_37} :catch_43
    .catchall {:try_start_17 .. :try_end_37} :catchall_70

    goto :goto_24

    :cond_38
    check-cast v10, Landroid/database/Cursor;

    :try_start_3a
    check-cast v10, Landroid/database/Cursor;

    invoke-static {v10}, Lu35;->p(Landroid/database/Cursor;)V
    :try_end_3f
    .catch Ljava/lang/RuntimeException; {:try_start_3a .. :try_end_3f} :catch_40
    .catch Ljava/lang/Exception; {:try_start_3a .. :try_end_3f} :catch_55

    goto :goto_55

    :catch_40
    move-exception v0

    move-object p0, v0

    throw p0

    :catch_43
    move-exception v0

    move-object p0, v0

    :try_start_45
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;
    :try_end_48
    .catchall {:try_start_45 .. :try_end_48} :catchall_70

    check-cast v10, Landroid/database/Cursor;

    if-eqz v10, :cond_55

    :try_start_4c
    check-cast v10, Landroid/database/Cursor;

    invoke-static {v10}, Lu35;->p(Landroid/database/Cursor;)V
    :try_end_51
    .catch Ljava/lang/RuntimeException; {:try_start_4c .. :try_end_51} :catch_52
    .catch Ljava/lang/Exception; {:try_start_4c .. :try_end_51} :catch_55

    goto :goto_55

    :catch_52
    move-exception v0

    move-object p0, v0

    throw p0

    :catch_55
    :cond_55
    :goto_55
    new-array p0, v9, [Landroid/net/Uri;

    invoke-virtual {v8, p0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Landroid/net/Uri;

    array-length v0, p0

    new-array v0, v0, [Ldd7;

    :goto_60
    array-length v2, p0

    if-ge v9, v2, :cond_6f

    new-instance v2, Lrlj;

    aget-object v3, p0, v9

    invoke-direct {v2, v1, v3}, Lrlj;-><init>(Landroid/content/Context;Landroid/net/Uri;)V

    aput-object v2, v0, v9

    add-int/lit8 v9, v9, 0x1

    goto :goto_60

    :cond_6f
    return-object v0

    :catchall_70
    move-exception v0

    move-object p0, v0

    check-cast v10, Landroid/database/Cursor;

    if-eqz v10, :cond_7f

    :try_start_76
    check-cast v10, Landroid/database/Cursor;

    invoke-static {v10}, Lu35;->p(Landroid/database/Cursor;)V
    :try_end_7b
    .catch Ljava/lang/RuntimeException; {:try_start_76 .. :try_end_7b} :catch_7c
    .catch Ljava/lang/Exception; {:try_start_76 .. :try_end_7b} :catch_7f

    goto :goto_7f

    :catch_7c
    move-exception v0

    move-object p0, v0

    throw p0

    :catch_7f
    :cond_7f
    :goto_7f
    throw p0
.end method
