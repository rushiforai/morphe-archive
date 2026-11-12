.class public final Lrf7;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lbf7;

.field public final b:Lh7f;

.field public final c:Ljava/util/ArrayList;

.field public volatile d:Z

.field public final e:Ljava/util/ArrayList;

.field public final f:Ljava/util/WeakHashMap;

.field public final g:Lnrl;

.field public final h:Lb59;

.field public final i:Lj4c;

.field public j:Lnc0;

.field public k:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lbf7;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1}, Lbf7;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lrf7;->a:Lbf7;

    new-instance v0, Lh7f;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lrf7;->b:Lh7f;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lrf7;->c:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lrf7;->e:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    iput-object v0, p0, Lrf7;->f:Ljava/util/WeakHashMap;

    new-instance v0, Lnrl;

    const/16 v1, 0x1a

    invoke-direct {v0, v1}, Lnrl;-><init>(B)V

    iput-object v0, p0, Lrf7;->g:Lnrl;

    sget-object v0, Lvml;->d:Lumi;

    const/4 v1, 0x0

    new-array v1, v1, [Lbg1;

    const-string v2, "download-items"

    invoke-static {p1, v0, v2, v1}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    move-result-object v0

    iput-object v0, p0, Lrf7;->h:Lb59;

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    iget-object p1, p1, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object p1, p1, Lxv1;->P0:Lj4c;

    iput-object p1, p0, Lrf7;->i:Lj4c;

    return-void
.end method

.method public static g(Lre7;)Lo29;
    .registers 3

    invoke-static {}, Lc5o;->m()Lc5o;

    move-result-object v0

    invoke-virtual {p0}, Lre7;->f()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0}, Lrf7;->h(Lre7;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, v1, p0}, Lc5o;->o(Ljava/lang/String;Ljava/lang/String;)Lo29;

    move-result-object p0

    return-object p0
.end method

.method public static h(Lre7;)Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lre7;->f()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/webkit/MimeTypeMap;->getFileExtensionFromUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Landroid/webkit/MimeTypeMap;->getSingleton()Landroid/webkit/MimeTypeMap;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/webkit/MimeTypeMap;->getMimeTypeFromExtension(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_22

    iget-object p0, p0, Lre7;->m:Ljava/lang/String;

    return-object p0

    :cond_22
    return-object v0
.end method

.method public static i(Landroid/net/Uri;)Ljava/lang/String;
    .registers 3

    if-nez p0, :cond_5

    const-string p0, "null"

    return-object p0

    :cond_5
    const-string v0, "file"

    invoke-virtual {p0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1f

    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lrf7;->j(Ljava/io/File;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_1f
    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static j(Ljava/io/File;)Ljava/lang/String;
    .registers 3

    :try_start_0
    invoke-virtual {p0}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    move-result-object p0
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_4} :catch_5

    return-object p0

    :catch_5
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "absolute: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static k(Landroid/content/ContentResolver;Landroid/net/Uri;)Ljava/util/HashMap;
    .registers 11

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v0

    const-string v2, "file"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_74

    invoke-static {p1}, Landroid/provider/DocumentsContract;->getTreeDocumentId(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/provider/DocumentsContract;->buildDocumentUriUsingTree(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    invoke-static {p1, v0}, Landroid/provider/DocumentsContract;->buildChildDocumentsUriUsingTree(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    const-string p1, "document_id"

    const-string v0, "_display_name"

    const-string v8, "_size"

    filled-new-array {p1, v0, v8}, [Ljava/lang/String;

    move-result-object v4

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v5, 0x0

    move-object v2, p0

    :try_start_2b
    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0
    :try_end_2f
    .catch Ljava/lang/Exception; {:try_start_2b .. :try_end_2f} :catch_74

    :try_start_2f
    invoke-interface {p0, p1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result p1

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p0, v8}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {p0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v3

    if-eqz v3, :cond_62

    :cond_41
    invoke-interface {p0, v2}, Landroid/database/Cursor;->isNull(I)Z

    move-result v3

    if-nez v3, :cond_51

    invoke-interface {p0, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3

    const-wide/16 v5, 0x0

    cmp-long v3, v3, v5

    if-lez v3, :cond_5c

    :cond_51
    invoke-interface {p0, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {p0, p1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_5c
    invoke-interface {p0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v3
    :try_end_60
    .catchall {:try_start_2f .. :try_end_60} :catchall_66

    if-nez v3, :cond_41

    :cond_62
    :try_start_62
    invoke-interface {p0}, Landroid/database/Cursor;->close()V
    :try_end_65
    .catch Ljava/lang/Exception; {:try_start_62 .. :try_end_65} :catch_74

    return-object v1

    :catchall_66
    move-exception v0

    move-object p1, v0

    if-eqz p0, :cond_73

    :try_start_6a
    invoke-interface {p0}, Landroid/database/Cursor;->close()V
    :try_end_6d
    .catchall {:try_start_6a .. :try_end_6d} :catchall_6e

    goto :goto_73

    :catchall_6e
    move-exception v0

    move-object p0, v0

    :try_start_70
    invoke-virtual {p1, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_73
    :goto_73
    throw p1
    :try_end_74
    .catch Ljava/lang/Exception; {:try_start_70 .. :try_end_74} :catch_74

    :catch_74
    :cond_74
    return-object v1
.end method

.method public static m(Landroid/content/Context;Ldd7;Lo29;Ljava/lang/String;Z)Z
    .registers 7

    if-eqz p4, :cond_a

    invoke-virtual {p1}, Ldd7;->d()Z

    move-result p4

    if-nez p4, :cond_a

    const/4 p0, 0x0

    return p0

    :cond_a
    sget-object p4, Lo29;->i:Lo29;

    const/4 v0, 0x1

    if-eq p2, p4, :cond_4f

    invoke-virtual {p2}, Lo29;->d()Z

    move-result p2

    if-nez p2, :cond_4f

    invoke-virtual {p1}, Ldd7;->i()Landroid/net/Uri;

    move-result-object p1

    new-instance p2, Landroid/content/Intent;

    const-string p4, "android.intent.action.VIEW"

    invoke-direct {p2, p4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const/high16 p4, 0x10000000

    invoke-virtual {p2, p4}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    const-string p4, "file"

    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p4

    if-eqz p4, :cond_3d

    sget-object p4, Laik;->a:[Ljava/lang/String;

    if-nez p3, :cond_38

    const-string p4, ""

    goto :goto_39

    :cond_38
    move-object p4, p3

    :goto_39
    invoke-static {p0, p1, p4}, Lcom/opera/android/downloads/DownloadProvider;->b(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    :cond_3d
    invoke-virtual {p2, p1, p3}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p2, v0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    const-wide/16 p3, 0x0

    invoke-static {p0, p2, p3, p4}, Lr9n;->I(Landroid/content/Context;Landroid/content/Intent;J)Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result p0

    xor-int/2addr p0, v0

    return p0

    :cond_4f
    return v0
.end method

.method public static n(Landroid/content/Context;Lre7;Z)Z
    .registers 8

    invoke-virtual {p1}, Lre7;->e()Ldd7;

    move-result-object v0

    if-nez v0, :cond_17

    new-instance v0, Ljava/io/File;

    invoke-virtual {p1}, Lre7;->f()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lv61;->a(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v0

    invoke-static {p0, v0}, Ldd7;->e(Landroid/content/Context;Landroid/net/Uri;)Lrlj;

    move-result-object v0

    :cond_17
    invoke-static {p1}, Lrf7;->h(Lre7;)Ljava/lang/String;

    move-result-object v1

    invoke-static {}, Lc5o;->m()Lc5o;

    move-result-object v2

    invoke-virtual {p1}, Lre7;->f()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3, v1}, Lc5o;->o(Ljava/lang/String;Ljava/lang/String;)Lo29;

    move-result-object v2

    :try_start_27
    invoke-static {p0, v0, v2, v1, p2}, Lrf7;->m(Landroid/content/Context;Ldd7;Lo29;Ljava/lang/String;Z)Z

    move-result p0
    :try_end_2b
    .catch Ljava/lang/IllegalArgumentException; {:try_start_27 .. :try_end_2b} :catch_2c

    return p0

    :catch_2c
    move-exception p2

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-static {}, Ls29;->c()Ljava/io/File;

    move-result-object v2

    invoke-static {v2}, Lrf7;->j(Ljava/io/File;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "download_dir_env"

    invoke-virtual {v0, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v2

    invoke-static {v2}, Lrf7;->j(Ljava/io/File;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "download_dir_primary"

    invoke-virtual {v0, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {p0}, Ls29;->e(Landroid/content/Context;)Ljava/io/File;

    move-result-object v2

    invoke-static {v2}, Lrf7;->j(Ljava/io/File;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "download_dir_transient"

    invoke-virtual {v0, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object p0

    invoke-virtual {p0}, Lcom/opera/android/settings/SettingsManager;->m()Landroid/net/Uri;

    move-result-object p0

    invoke-static {p0}, Lrf7;->i(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object p0

    const-string v2, "download_dir_default"

    invoke-virtual {v0, v2, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p0, p1, Lre7;->d:Landroid/net/Uri;

    invoke-static {p0}, Lrf7;->i(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object p0

    const-string v2, "download_location"

    invoke-virtual {v0, v2, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p1}, Lre7;->g()Landroid/net/Uri;

    move-result-object p0

    const/4 v2, 0x0

    if-eqz p0, :cond_a3

    invoke-virtual {p1}, Lre7;->f()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_a3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result p0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    sub-int/2addr p0, p1

    invoke-virtual {v3, v2, p0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    :cond_a3
    const-string p1, "download_resolved"

    invoke-static {p0}, Lrf7;->i(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p0, "download_mime"

    invoke-virtual {v0, p0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {p2, v0}, Lks3;->E(Ljava/lang/Throwable;Ljava/util/Map;)V

    return v2
.end method


# virtual methods
.method public final a(Lxf7;Lcom/opera/android/downloads/DownloadItem;Landroid/net/Uri;IIZ)Lre7;
    .registers 17

    iget-boolean v1, p0, Lrf7;->d:Z

    if-nez v1, :cond_f3

    iget-object v1, p0, Lrf7;->f:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p1}, Ljava/util/WeakHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1d

    new-instance v1, Lpf7;

    invoke-direct {v1, p0, p1}, Lpf7;-><init>(Lrf7;Lxf7;)V

    iget-object v3, p0, Lrf7;->f:Ljava/util/WeakHashMap;

    invoke-virtual {v3, p1, v1}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v3, p1, Lxf7;->b:Lcom/opera/android/downloads/DownloadPauseManager;

    iget-object v3, v3, Lcom/opera/android/downloads/DownloadPauseManager;->b:Lh7f;

    invoke-virtual {v3, v1}, Lh7f;->b(Ljava/lang/Object;)Z

    :cond_1d
    const/4 v7, 0x0

    if-nez p6, :cond_5b

    if-nez p4, :cond_5b

    iget-object v1, p0, Lrf7;->i:Lj4c;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/opera/android/settings/SettingsManager;

    const-string v3, "concurrent_downloads"

    invoke-virtual {v1, v3}, Lcom/opera/android/settings/SettingsManager;->n(Ljava/lang/String;)I

    move-result v1

    if-lez v1, :cond_5b

    iget-object v3, p0, Lrf7;->c:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    move v5, v7

    move v6, v5

    :cond_3a
    :goto_3a
    if-ge v6, v4, :cond_4d

    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    add-int/lit8 v6, v6, 0x1

    check-cast v8, Lre7;

    invoke-virtual {v8}, Lre7;->j()Z

    move-result v8

    if-eqz v8, :cond_3a

    add-int/lit8 v5, v5, 0x1

    goto :goto_3a

    :cond_4d
    if-lt v5, v1, :cond_5b

    iget-object v1, p1, Lxf7;->b:Lcom/opera/android/downloads/DownloadPauseManager;

    invoke-interface {p2}, Lcom/opera/android/downloads/DownloadItem;->getId()J

    move-result-wide v3

    const/4 v5, 0x3

    iget-wide v8, v1, Lcom/opera/android/downloads/DownloadPauseManager;->a:J

    invoke-static {v8, v9, v3, v4, v5}, LJ/N;->MUhg9A8g(JJI)V

    :cond_5b
    new-instance v1, Lre7;

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move v5, p4

    move v6, p5

    invoke-direct/range {v1 .. v6}, Lre7;-><init>(Lxf7;Lcom/opera/android/downloads/DownloadItem;Landroid/net/Uri;II)V

    if-eqz p6, :cond_b1

    invoke-virtual {v1}, Lre7;->g()Landroid/net/Uri;

    move-result-object v3

    if-eqz v3, :cond_a6

    sget-object v4, Ls29;->a:Ljava/util/HashSet;

    const-string v4, "file"

    invoke-virtual {v3}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_a6

    new-instance v4, Ljava/io/File;

    invoke-virtual {v3}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v4, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v1}, Lre7;->h()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/io/File;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_a0

    iget-object v2, p1, Lxf7;->d:Lag7;

    iget-object v2, v2, Lag7;->b:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2, v3}, Ljava/io/File;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a6

    :cond_a0
    iget-object v0, p0, Lrf7;->e:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v1

    :cond_a6
    iget-boolean v2, v1, Lre7;->s:Z

    if-nez v2, :cond_ad

    const/4 v2, 0x1

    iput-boolean v2, v1, Lre7;->s:Z

    :cond_ad
    invoke-virtual {v1}, Lre7;->w()V

    goto :goto_d0

    :cond_b1
    invoke-virtual {v1}, Lre7;->c()Lnc0;

    move-result-object v2

    iput-object v2, p0, Lrf7;->j:Lnc0;

    iget-object v2, p0, Lrf7;->h:Lb59;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/SharedPreferences;

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    iget-object v3, p0, Lrf7;->j:Lnc0;

    iget-byte v3, v3, Lnc0;->a:B

    const-string v4, "last_downloaded_file_type"

    invoke-interface {v2, v4, v3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->apply()V

    :goto_d0
    iget-object v2, p0, Lrf7;->c:Ljava/util/ArrayList;

    invoke-virtual {v2, v7, v1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    iget-object v2, p0, Lrf7;->a:Lbf7;

    iget-object v3, v1, Lre7;->u:Lh7f;

    invoke-virtual {v3, v2}, Lh7f;->b(Ljava/lang/Object;)Z

    iget-object v0, p0, Lrf7;->b:Lh7f;

    invoke-static {v0, v0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v0

    :goto_e2
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_f2

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lqf7;

    invoke-interface {v2, v1}, Lqf7;->f(Lre7;)V

    goto :goto_e2

    :cond_f2
    return-object v1

    :cond_f3
    invoke-static {}, Lt40;->e()V

    const/4 v0, 0x0

    return-object v0
.end method

.method public final b(Lqf7;)V
    .registers 2

    iget-object p0, p0, Lrf7;->b:Lh7f;

    invoke-virtual {p0, p1}, Lh7f;->b(Ljava/lang/Object;)Z

    return-void
.end method

.method public final c(Lre7;Lvwh;)V
    .registers 6

    iget-object v0, p0, Lrf7;->c:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3f

    invoke-virtual {p1}, Lre7;->r()V

    invoke-virtual {p1}, Lre7;->e()Ldd7;

    move-result-object v0

    if-eqz v0, :cond_26

    invoke-virtual {v0}, Ldd7;->c()Z

    move-result v0

    if-nez v0, :cond_26

    if-eqz p2, :cond_26

    new-instance v0, Lglj;

    const v1, 0x7f1405ae

    const/16 v2, 0x1388

    invoke-direct {v0, v1, v2}, Lglj;-><init>(II)V

    invoke-interface {p2, v0}, Lvwh;->f(Lo93;)V

    :cond_26
    invoke-virtual {p0, p1}, Lrf7;->t(Lre7;)V

    iget-object p0, p0, Lrf7;->b:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_2f
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_3f

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lqf7;

    invoke-interface {p2, p1}, Lqf7;->d(Lre7;)V

    goto :goto_2f

    :cond_3f
    return-void
.end method

.method public final d(J)Lre7;
    .registers 8

    iget-object p0, p0, Lrf7;->c:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :cond_7
    if-ge v1, v0, :cond_18

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v1, v1, 0x1

    check-cast v2, Lre7;

    iget-wide v3, v2, Lre7;->o:J

    cmp-long v3, v3, p1

    if-nez v3, :cond_7

    return-object v2

    :cond_18
    const/4 p0, 0x0

    return-object p0
.end method

.method public final e(Landroid/net/Uri;I)Lre7;
    .registers 5

    :goto_0
    iget-object v0, p0, Lrf7;->c:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge p2, v1, :cond_1c

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lre7;

    invoke-virtual {v0}, Lre7;->g()Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_19

    return-object v0

    :cond_19
    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_1c
    const/4 p0, 0x0

    return-object p0
.end method

.method public final f(Lre7;Ljava/lang/String;)J
    .registers 13

    :try_start_0
    new-instance v0, Landroid/os/StatFs;

    invoke-direct {v0, p2}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Landroid/os/StatFs;->getAvailableBlocksLong()J

    move-result-wide v1

    invoke-virtual {v0}, Landroid/os/StatFs;->getBlockSizeLong()J

    move-result-wide v3
    :try_end_d
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_d} :catch_59

    mul-long/2addr v3, v1

    invoke-static {p2}, LJ/N;->MtKdjaqG(Ljava/lang/Object;)J

    move-result-wide v0

    iget-object p0, p0, Lrf7;->c:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p2

    const/4 v2, 0x0

    :cond_19
    :goto_19
    if-ge v2, p2, :cond_58

    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v2, v2, 0x1

    check-cast v5, Lre7;

    invoke-virtual {v5}, Lre7;->m()Z

    move-result v6

    if-eqz v6, :cond_19

    invoke-virtual {v5}, Lre7;->i()Z

    move-result v6

    if-eqz v6, :cond_19

    if-eq v5, p1, :cond_19

    iget-object v6, v5, Lre7;->d:Landroid/net/Uri;

    if-eqz v6, :cond_19

    invoke-virtual {v6}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_19

    invoke-virtual {v6}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, LJ/N;->MtKdjaqG(Ljava/lang/Object;)J

    move-result-wide v6

    cmp-long v6, v0, v6

    if-nez v6, :cond_19

    iget-wide v6, v5, Lre7;->j:J

    iget-wide v8, v5, Lre7;->i:J

    sub-long/2addr v6, v8

    const-wide/16 v8, 0x0

    invoke-static {v8, v9, v6, v7}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v5

    sub-long/2addr v3, v5

    goto :goto_19

    :cond_58
    return-wide v3

    :catch_59
    const-wide/16 p0, -0x1

    return-wide p0
.end method

.method public final l()Ljava/util/List;
    .registers 6

    new-instance v0, Ljava/util/ArrayList;

    iget-object p0, p0, Lrf7;->c:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    :cond_10
    :goto_10
    if-ge v2, v1, :cond_2a

    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Lre7;

    invoke-virtual {v3}, Lre7;->p()Z

    move-result v4

    if-eqz v4, :cond_10

    invoke-virtual {v3}, Lre7;->m()Z

    move-result v4

    if-eqz v4, :cond_10

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_10

    :cond_2a
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public final o(Landroid/content/Context;Lre7;Landroid/net/Uri;Lo29;Ljava/lang/String;Z)Z
    .registers 10

    invoke-virtual {p4}, Lo29;->d()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_3f

    if-nez p6, :cond_3f

    new-instance p4, Lgld;

    invoke-direct {p4}, Lgld;-><init>()V

    const/16 p5, 0x1003

    invoke-static {p4, p5}, Lzhj;->a(Lryl;I)Lzhj;

    move-result-object p4

    invoke-virtual {p4, p1}, Lzhj;->c(Landroid/content/Context;)V

    if-eqz p2, :cond_1f

    new-instance p3, Legd;

    invoke-direct {p3, p2}, Legd;-><init>(Lre7;)V

    goto :goto_25

    :cond_1f
    new-instance p4, Legd;

    invoke-direct {p4, p3}, Legd;-><init>(Landroid/net/Uri;)V

    move-object p3, p4

    :goto_25
    sget-object p4, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->x()Ltjg;

    move-result-object p1

    filled-new-array {p3}, [Legd;

    move-result-object p3

    new-instance p4, Lkjg;

    const/4 p5, 0x2

    invoke-direct {p4, p1, p5}, Lkjg;-><init>(Ltjg;B)V

    invoke-virtual {p1, p3, p4}, Ltjg;->e([Legd;Lk37;)V

    goto :goto_9a

    :cond_3f
    invoke-virtual {p4}, Ljava/lang/Enum;->ordinal()I

    move-result p4

    const/4 v0, 0x6

    if-eq p4, v0, :cond_4d

    const/4 v0, 0x7

    if-eq p4, v0, :cond_4d

    const/16 v0, 0xb

    if-ne p4, v0, :cond_5e

    :cond_4d
    if-nez p6, :cond_5e

    invoke-virtual {p3}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p3

    new-instance p4, Lxgf;

    invoke-direct {p4, p3}, Lxgf;-><init>(Ljava/lang/String;)V

    iput-boolean v1, p4, Lxgf;->n:Z

    invoke-static {p1, p4}, Lzi4;->u(Landroid/content/Context;Lic4;)V

    goto :goto_9a

    :cond_5e
    :try_start_5e
    new-instance p4, Landroid/content/Intent;

    const-string v0, "android.intent.action.VIEW"

    invoke-direct {p4, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const/high16 v0, 0x10000000

    invoke-virtual {p4, v0}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    const-string v0, "file"

    invoke-virtual {p3}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_82

    sget-object v0, Laik;->a:[Ljava/lang/String;

    if-nez p5, :cond_7d

    const-string v0, ""

    goto :goto_7e

    :cond_7d
    move-object v0, p5

    :goto_7e
    invoke-static {p1, p3, v0}, Lcom/opera/android/downloads/DownloadProvider;->b(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p3

    :cond_82
    invoke-virtual {p4, p3, p5}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p4, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    if-eqz p6, :cond_95

    const p3, 0x7f14061d

    invoke-virtual {p1, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p3

    invoke-static {p4, p3}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object p4

    :cond_95
    invoke-virtual {p1, p4}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_98
    .catch Landroid/content/ActivityNotFoundException; {:try_start_5e .. :try_end_98} :catch_99

    goto :goto_9a

    :catch_99
    const/4 v1, 0x0

    :goto_9a
    if-eqz v1, :cond_b4

    if-eqz p2, :cond_b4

    iget-object p0, p0, Lrf7;->b:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_a4
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_b4

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lqf7;

    invoke-interface {p1, p2}, Lqf7;->e(Lre7;)V

    goto :goto_a4

    :cond_b4
    return v1
.end method

.method public final p(Lre7;Landroid/content/Context;Lvwh;Z)V
    .registers 12

    invoke-virtual {p1}, Lre7;->g()Landroid/net/Uri;

    move-result-object v3

    if-eqz v3, :cond_26

    const/4 v0, 0x1

    invoke-static {p2, p1, v0}, Lrf7;->n(Landroid/content/Context;Lre7;Z)Z

    move-result v0

    if-eqz v0, :cond_26

    invoke-static {p1}, Lrf7;->h(Lre7;)Ljava/lang/String;

    move-result-object v5

    invoke-static {}, Lc5o;->m()Lc5o;

    move-result-object v0

    invoke-virtual {p1}, Lre7;->f()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, v5}, Lc5o;->o(Ljava/lang/String;Ljava/lang/String;)Lo29;

    move-result-object v4

    move-object v0, p0

    move-object v2, p1

    move-object v1, p2

    move v6, p4

    invoke-virtual/range {v0 .. v6}, Lrf7;->o(Landroid/content/Context;Lre7;Landroid/net/Uri;Lo29;Ljava/lang/String;Z)Z

    move-result p0

    goto :goto_27

    :cond_26
    const/4 p0, 0x0

    :goto_27
    if-nez p0, :cond_36

    new-instance p0, Lglj;

    const p1, 0x7f1405c6

    const/16 p2, 0x9c4

    invoke-direct {p0, p1, p2}, Lglj;-><init>(II)V

    invoke-interface {p3, p0}, Lvwh;->f(Lo93;)V

    :cond_36
    return-void
.end method

.method public final q(Landroid/content/Context;Lvwh;Landroid/net/Uri;Ljava/lang/String;Z)Z
    .registers 16

    const-string v0, "file"

    invoke-virtual {p3}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1b

    new-instance v0, Ljava/io/File;

    invoke-virtual {p3}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    new-instance v1, Lbkh;

    invoke-direct {v1, v0}, Lbkh;-><init>(Ljava/io/File;)V

    goto :goto_1f

    :cond_1b
    invoke-static {p1, p3}, Ldd7;->e(Landroid/content/Context;Landroid/net/Uri;)Lrlj;

    move-result-object v1

    :goto_1f
    invoke-static {}, Lc5o;->m()Lc5o;

    move-result-object v0

    invoke-virtual {v1}, Ldd7;->g()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2, p4}, Lc5o;->o(Ljava/lang/String;Ljava/lang/String;)Lo29;

    move-result-object v7

    const/4 v0, 0x1

    invoke-static {p1, v1, v7, p4, v0}, Lrf7;->m(Landroid/content/Context;Ldd7;Lo29;Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_3d

    const/4 v5, 0x0

    move-object v3, p0

    move-object v4, p1

    move-object v6, p3

    move-object v8, p4

    move v9, p5

    invoke-virtual/range {v3 .. v9}, Lrf7;->o(Landroid/content/Context;Lre7;Landroid/net/Uri;Lo29;Ljava/lang/String;Z)Z

    move-result p0

    goto :goto_3e

    :cond_3d
    const/4 p0, 0x0

    :goto_3e
    if-nez p0, :cond_4d

    new-instance p1, Lglj;

    const p3, 0x7f1405c6

    const/16 p4, 0x9c4

    invoke-direct {p1, p3, p4}, Lglj;-><init>(II)V

    invoke-interface {p2, p1}, Lvwh;->f(Lo93;)V

    :cond_4d
    return p0
.end method

.method public final r()V
    .registers 5

    iget-object p0, p0, Lrf7;->c:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :cond_7
    :goto_7
    if-ge v1, v0, :cond_1f

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v1, v1, 0x1

    check-cast v2, Lre7;

    invoke-virtual {v2}, Lre7;->m()Z

    move-result v3

    if-nez v3, :cond_1b

    iget-boolean v3, v2, Lre7;->w:Z

    if-eqz v3, :cond_7

    :cond_1b
    invoke-virtual {v2}, Lre7;->s()V

    goto :goto_7

    :cond_1f
    return-void
.end method

.method public final s(Lre7;)V
    .registers 3

    iget-object v0, p0, Lrf7;->c:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_24

    invoke-virtual {p1}, Lre7;->r()V

    invoke-virtual {p0, p1}, Lrf7;->t(Lre7;)V

    iget-object p0, p0, Lrf7;->b:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_14
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_24

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lqf7;

    invoke-interface {v0, p1}, Lqf7;->h(Lre7;)V

    goto :goto_14

    :cond_24
    return-void
.end method

.method public final t(Lre7;)V
    .registers 3

    iget-boolean v0, p0, Lrf7;->d:Z

    if-nez v0, :cond_25

    iget-object v0, p0, Lrf7;->c:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    iget-object v0, p0, Lrf7;->a:Lbf7;

    invoke-virtual {p1, v0}, Lre7;->t(Lqe7;)V

    invoke-virtual {p1}, Lre7;->j()Z

    move-result p1

    if-eqz p1, :cond_24

    iget-boolean p1, p0, Lrf7;->k:Z

    if-nez p1, :cond_24

    const/4 p1, 0x1

    iput-boolean p1, p0, Lrf7;->k:Z

    new-instance p1, Lof7;

    const/4 v0, 0x0

    invoke-direct {p1, p0, v0}, Lof7;-><init>(Lrf7;B)V

    invoke-static {p1}, Lvml;->c(Ljava/lang/Runnable;)V

    :cond_24
    return-void

    :cond_25
    invoke-static {}, Lt40;->e()V

    return-void
.end method

.method public final u(Lqf7;)V
    .registers 2

    iget-object p0, p0, Lrf7;->b:Lh7f;

    invoke-virtual {p0, p1}, Lh7f;->c(Ljava/lang/Object;)Z

    return-void
.end method

.method public final v()V
    .registers 2

    iget-boolean v0, p0, Lrf7;->d:Z

    if-nez v0, :cond_8

    const/4 v0, 0x1

    iput-boolean v0, p0, Lrf7;->d:Z

    return-void

    :cond_8
    const-string p0, "nested processing"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-void
.end method

.method public final w()V
    .registers 2

    iget-boolean v0, p0, Lrf7;->d:Z

    if-eqz v0, :cond_8

    const/4 v0, 0x0

    iput-boolean v0, p0, Lrf7;->d:Z

    return-void

    :cond_8
    const-string p0, "no processing"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-void
.end method
