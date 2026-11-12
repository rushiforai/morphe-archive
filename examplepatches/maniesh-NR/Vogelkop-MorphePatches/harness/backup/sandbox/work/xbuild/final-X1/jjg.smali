.class public final synthetic Ljjg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lesk;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Ljjg;->a:B

    iput-object p1, p0, Ljjg;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 12

    iget-byte v0, p0, Ljjg;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x1

    iget-object p0, p0, Ljjg;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_21a

    check-cast p0, Lq0o;

    iget-boolean p0, p0, Lq0o;->i:Z

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_13
    check-cast p0, Lsz4;

    return-object p0

    :pswitch_16
    check-cast p0, Lztn;

    new-instance v0, Lmlh;

    invoke-direct {v0, p0, v3}, Lmlh;-><init>(Landroidx/recyclerview/widget/d;B)V

    return-object v0

    :pswitch_1e
    check-cast p0, Lndn;

    iget-boolean p0, p0, Lndn;->r:Z

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_27
    check-cast p0, Landroid/view/ViewGroup;

    const v0, 0x7f0a0a8c

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/view/ViewGroup;

    return-object p0

    :pswitch_33
    check-cast p0, Lv3m;

    iget-object v0, p0, Lv3m;->a:Landroid/content/Context;

    invoke-static {v0}, Lv3m;->c(Landroid/content/Context;)Ljava/util/Set;

    move-result-object v0

    new-instance v1, Lf15;

    const/4 v2, 0x5

    invoke-direct {v1, p0, v2}, Lf15;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0, v1}, Lsfe;->Q(Ljava/lang/Iterable;Lsrg;)Lzlb;

    move-result-object p0

    invoke-static {p0}, Lnb6;->J(Ljava/lang/Iterable;)Ljava/util/ArrayList;

    move-result-object p0

    return-object p0

    :pswitch_4a
    check-cast p0, Ljava/io/File;

    const-string v0, " (size: "

    :try_start_4e
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_53
    .catch Ljava/io/IOException; {:try_start_4e .. :try_end_53} :catch_98
    .catchall {:try_start_4e .. :try_end_53} :catchall_a2

    :try_start_53
    invoke-virtual {v1}, Ljava/io/InputStream;->available()I

    move-result p0

    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2, p0}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    invoke-static {v1, v2}, Lxvg;->n(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v3, Lf8a;->h:Lf8a;

    invoke-virtual {v3, p0}, Lf8a;->b([B)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    array-length p0, p0

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, ")"

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0
    :try_end_8c
    .catch Ljava/io/IOException; {:try_start_53 .. :try_end_8c} :catch_94
    .catchall {:try_start_53 .. :try_end_8c} :catchall_90

    invoke-static {v1}, Lxvg;->l(Ljava/io/Closeable;)V

    goto :goto_a1

    :catchall_90
    move-exception v0

    move-object p0, v0

    move-object v2, v1

    goto :goto_a4

    :catch_94
    move-exception v0

    move-object p0, v0

    move-object v2, v1

    goto :goto_9a

    :catch_98
    move-exception v0

    move-object p0, v0

    :goto_9a
    :try_start_9a
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p0
    :try_end_9e
    .catchall {:try_start_9a .. :try_end_9e} :catchall_a2

    invoke-static {v2}, Lxvg;->l(Ljava/io/Closeable;)V

    :goto_a1
    return-object p0

    :catchall_a2
    move-exception v0

    move-object p0, v0

    :goto_a4
    invoke-static {v2}, Lxvg;->l(Ljava/io/Closeable;)V

    throw p0

    :pswitch_a8
    check-cast p0, Lmgh;

    iget-object p0, p0, Lmgh;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-static {p0}, Landroid/app/WallpaperManager;->getInstance(Landroid/content/Context;)Landroid/app/WallpaperManager;

    move-result-object p0

    return-object p0

    :pswitch_b3
    check-cast p0, Lxbf;

    iget-object v0, p0, Lxbf;->c:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v0}, Lcom/opera/android/settings/SettingsManager;->O()Z

    move-result v4

    if-nez v4, :cond_169

    invoke-virtual {v0, v1}, Lcom/opera/android/settings/SettingsManager;->t(Z)Landroid/net/Uri;

    move-result-object v0

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    const-string v5, "file"

    invoke-virtual {v0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_105

    new-instance p0, Ljava/io/File;

    invoke-virtual {v0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_169

    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_169

    new-instance v0, Lo3b;

    invoke-direct {v0, v3}, Lo3b;-><init>(B)V

    invoke-virtual {p0, v0}, Ljava/io/File;->listFiles(Ljava/io/FilenameFilter;)[Ljava/io/File;

    move-result-object p0

    if-eqz p0, :cond_169

    array-length v0, p0

    :goto_f5
    if-ge v1, v0, :cond_103

    aget-object v2, p0, v1

    invoke-static {v2}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_f5

    :cond_103
    :goto_103
    move-object v2, v4

    goto :goto_169

    :cond_105
    iget-object p0, p0, Lxbf;->b:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    invoke-static {v0}, Landroid/provider/DocumentsContract;->getTreeDocumentId(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Landroid/provider/DocumentsContract;->buildDocumentUriUsingTree(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-static {v1, p0}, Landroid/provider/DocumentsContract;->buildChildDocumentsUriUsingTree(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v6

    const-string p0, "document_id"

    const-string v1, "_display_name"

    filled-new-array {p0, v1}, [Ljava/lang/String;

    move-result-object v7

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v8, 0x0

    :try_start_124
    invoke-virtual/range {v5 .. v10}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v3
    :try_end_128
    .catch Ljava/lang/Exception; {:try_start_124 .. :try_end_128} :catch_163
    .catchall {:try_start_124 .. :try_end_128} :catchall_15b

    :try_start_128
    invoke-interface {v3, p0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result p0

    invoke-interface {v3, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v3}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v5

    if-eqz v5, :cond_153

    :cond_136
    invoke-interface {v3, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    const-string v6, ".mhtml"

    invoke-virtual {v5, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_14d

    invoke-interface {v3, p0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v0, v5}, Landroid/provider/DocumentsContract;->buildDocumentUriUsingTree(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_14d
    invoke-interface {v3}, Landroid/database/Cursor;->moveToNext()Z

    move-result v5
    :try_end_151
    .catch Ljava/lang/Exception; {:try_start_128 .. :try_end_151} :catch_164
    .catchall {:try_start_128 .. :try_end_151} :catchall_157

    if-nez v5, :cond_136

    :cond_153
    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    goto :goto_103

    :catchall_157
    move-exception v0

    move-object p0, v0

    move-object v2, v3

    goto :goto_15d

    :catchall_15b
    move-exception v0

    move-object p0, v0

    :goto_15d
    if-eqz v2, :cond_162

    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    :cond_162
    throw p0

    :catch_163
    move-object v3, v2

    :catch_164
    if-eqz v3, :cond_169

    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    :cond_169
    :goto_169
    return-object v2

    :pswitch_16a
    check-cast p0, Lnr8;

    check-cast p0, Lcom/opera/android/favorites/e;

    iget-object p0, p0, Lcom/opera/android/favorites/e;->f:Lcom/opera/android/favorites/b;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Ltkj;

    invoke-direct {v0, p0}, Ltkj;-><init>(Ltq8;)V

    check-cast v0, Ltq8;

    const/16 p0, 0x32

    invoke-static {v0, p0}, Lsfe;->N0(Ltq8;I)Ljava/util/List;

    move-result-object p0

    return-object p0

    :pswitch_181
    check-cast p0, Lipk;

    iget-object p0, p0, Lipk;->f:Lwok;

    invoke-virtual {p0}, Lno7;->i()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lvok;

    iget p0, p0, Lvok;->a:I

    and-int/lit8 p0, p0, 0x4

    if-eqz p0, :cond_192

    move v1, v3

    :cond_192
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_197
    check-cast p0, Lz7j;

    iget-object p0, p0, Lz7j;->a:Landroid/content/Context;

    invoke-static {p0}, Lx7d;->o(Landroid/content/Context;)Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_1a4
    check-cast p0, Lx7j;

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object p0, p0, Lx7j;->b:Ljava/lang/Object;

    check-cast p0, Landroid/app/Activity;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    iget-object p0, p0, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object p0, p0, Lxv1;->r1:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lb1o;

    return-object p0

    :pswitch_1bd
    check-cast p0, Ljlh;

    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteOpenHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p0

    const-string v0, "reading"

    invoke-static {p0, v0, v2}, Landroid/database/DatabaseUtils;->queryNumEntries(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    return-object p0

    :pswitch_1ce
    check-cast p0, Lbeh;

    iget-object p0, p0, Lbeh;->h:Lpde;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ltta;

    return-object p0

    :pswitch_1d9
    check-cast p0, Ldj9;

    invoke-virtual {p0}, Lno7;->i()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcj9;

    iget-object p0, p0, Lcj9;->a:Ljava/lang/String;

    return-object p0

    :pswitch_1e4
    check-cast p0, Le3j;

    invoke-virtual {p0}, Lno7;->i()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ld3j;

    const/16 v0, 0x2b

    invoke-virtual {p0, v0, v1}, Ld3j;->d(IZ)Lc3j;

    move-result-object p0

    if-eqz p0, :cond_20d

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "https://"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, "/"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    if-nez p0, :cond_213

    :cond_20d
    const-string p0, "https://product.opera-api.com/"

    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    :cond_213
    return-object p0

    :pswitch_214
    check-cast p0, Ltjg;

    iget-object p0, p0, Ltjg;->n:Ljx6;

    return-object p0

    nop

    :pswitch_data_21a
    .packed-switch 0x0
        :pswitch_214
        :pswitch_1e4
        :pswitch_1d9
        :pswitch_1ce
        :pswitch_1bd
        :pswitch_1a4
        :pswitch_197
        :pswitch_181
        :pswitch_16a
        :pswitch_b3
        :pswitch_a8
        :pswitch_4a
        :pswitch_33
        :pswitch_27
        :pswitch_1e
        :pswitch_16
        :pswitch_13
    .end packed-switch
.end method
