.class public final Lwyd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;
.implements Lhh4;


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lcom/opera/android/settings/SettingsManager;

.field public final c:Lglh;

.field public final d:Ljava/util/concurrent/ExecutorService;

.field public final e:Ljava/util/HashSet;

.field public f:Lpad;

.field public g:Z

.field public h:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/opera/android/settings/SettingsManager;Ljava/util/concurrent/ExecutorService;Lglh;Lpad;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lwyd;->e:Ljava/util/HashSet;

    iput-object p1, p0, Lwyd;->a:Landroid/content/Context;

    iput-object p2, p0, Lwyd;->b:Lcom/opera/android/settings/SettingsManager;

    iput-object p3, p0, Lwyd;->d:Ljava/util/concurrent/ExecutorService;

    iput-object p4, p0, Lwyd;->c:Lglh;

    iput-object p5, p0, Lwyd;->f:Lpad;

    return-void
.end method

.method public static b(Landroid/content/ContentResolver;Landroid/net/Uri;)Ljava/lang/String;
    .registers 10

    const-string v0, "_display_name"

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v3

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v4, 0x0

    move-object v1, p0

    move-object v2, p1

    :try_start_c
    invoke-virtual/range {v1 .. v6}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_10} :catch_35
    .catchall {:try_start_c .. :try_end_10} :catchall_2d

    const/4 p1, 0x0

    :try_start_11
    aget-object p1, v3, p1

    invoke-interface {p0, p1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result p1

    invoke-interface {p0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_25

    invoke-interface {p0, p1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1
    :try_end_21
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_21} :catch_36
    .catchall {:try_start_11 .. :try_end_21} :catchall_29

    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    return-object p1

    :cond_25
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    return-object v7

    :catchall_29
    move-exception v0

    move-object p1, v0

    move-object v7, p0

    goto :goto_2f

    :catchall_2d
    move-exception v0

    move-object p1, v0

    :goto_2f
    if-eqz v7, :cond_34

    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    :cond_34
    throw p1

    :catch_35
    move-object p0, v7

    :catch_36
    if-eqz p0, :cond_3b

    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    :cond_3b
    return-object v7
.end method

.method public static c(Landroid/net/Uri;Landroid/net/Uri;)Z
    .registers 6

    invoke-virtual {p0}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object p0

    invoke-virtual {p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object p1

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    add-int/2addr v0, v1

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    const/4 v3, 0x0

    if-ne v0, v2, :cond_24

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    invoke-interface {p1, v3, v0}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object p1

    invoke-interface {p0, p1}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_24

    return v1

    :cond_24
    return v3
.end method


# virtual methods
.method public final a(Ljava/util/List;)V
    .registers 16

    iget-boolean v0, p0, Lwyd;->h:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_9

    invoke-virtual {p0, v1}, Lwyd;->d(Z)V

    return-void

    :cond_9
    iget-object v0, p0, Lwyd;->b:Lcom/opera/android/settings/SettingsManager;

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Lcom/opera/android/settings/SettingsManager;->t(Z)Landroid/net/Uri;

    move-result-object v0

    move v3, v1

    :goto_11
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v4

    if-ge v3, v4, :cond_17d

    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lilh;

    iget-wide v5, v4, Lilh;->a:J

    iget-object v7, v4, Lilh;->f:Ljava/lang/String;

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    iget-object v6, p0, Lwyd;->e:Ljava/util/HashSet;

    invoke-virtual {v6, v5}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_177

    invoke-static {v7}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    invoke-virtual {v5}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v6

    if-nez v6, :cond_40

    new-instance v5, Ljava/io/File;

    invoke-direct {v5, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v5}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v5

    :cond_40
    move-object v10, v5

    invoke-virtual {v0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v10}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    const/16 v6, 0x16

    const-string v7, "multipart/related"

    iget-object v8, p0, Lwyd;->a:Landroid/content/Context;

    const-string v9, "file"

    const/4 v11, 0x0

    if-eqz v5, :cond_aa

    invoke-virtual {v10}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v9, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_7a

    invoke-virtual {v10}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_117

    invoke-static {v0, v10}, Lwyd;->c(Landroid/net/Uri;Landroid/net/Uri;)Z

    move-result v8

    if-nez v8, :cond_117

    invoke-static {v2, v5}, Lam2;->l(ILjava/util/List;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    goto/16 :goto_f4

    :cond_7a
    invoke-virtual {v10}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v12

    const/4 v13, 0x2

    if-lt v12, v13, :cond_117

    const-string v12, "tree"

    invoke-interface {v5, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v12, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_117

    invoke-static {v0}, Landroid/provider/DocumentsContract;->getTreeDocumentId(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v10}, Landroid/provider/DocumentsContract;->getTreeDocumentId(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v5, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_117

    invoke-virtual {v8}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    invoke-static {v5, v10}, Lwyd;->b(Landroid/content/ContentResolver;Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v5

    if-nez v5, :cond_f4

    goto :goto_117

    :cond_aa
    invoke-virtual {v10}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v9, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_ea

    invoke-virtual {v10}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_117

    const-string v12, "content"

    invoke-virtual {v0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_f4

    invoke-static {v8, v0}, Lv61;->d(Landroid/content/Context;Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object v8

    if-eqz v8, :cond_f4

    invoke-virtual {v8}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v8

    invoke-virtual {v8, v5}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v8

    invoke-virtual {v8}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v8

    invoke-virtual {v8, v10}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_f4

    sget v8, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v9, 0x1e

    if-lt v8, v9, :cond_117

    new-instance v11, Lrn9;

    invoke-direct {v11, v6, v0, v5, v2}, Lrn9;-><init>(BLjava/lang/Object;Ljava/lang/Object;Z)V

    goto :goto_117

    :cond_ea
    invoke-virtual {v8}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    invoke-static {v5, v10}, Lwyd;->b(Landroid/content/ContentResolver;Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_117

    :cond_f4
    :goto_f4
    invoke-virtual {v10}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v9, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_112

    invoke-static {v1}, Lcom/opera/android/settings/SettingsManager;->o(Z)Landroid/net/Uri;

    move-result-object v8

    invoke-static {v8, v10}, Lwyd;->c(Landroid/net/Uri;Landroid/net/Uri;)Z

    move-result v8

    if-eqz v8, :cond_112

    iget-object v5, v4, Lilh;->b:Ljava/lang/String;

    iget-object v8, v4, Lilh;->c:Ljava/lang/String;

    invoke-static {v5, v8, v7}, LJ/N;->MHVVbhjw(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    :cond_112
    new-instance v11, Lrn9;

    invoke-direct {v11, v6, v0, v5, v1}, Lrn9;-><init>(BLjava/lang/Object;Ljava/lang/Object;Z)V

    :cond_117
    :goto_117
    if-eqz v11, :cond_177

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    iget-object v0, p0, Lwyd;->f:Lpad;

    if-eqz v0, :cond_146

    iget-object v0, v0, Lpad;->b:Ljava/lang/Object;

    check-cast v0, Lesg;

    if-eqz v0, :cond_146

    iget-object v0, v0, Lesg;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/readlater/MigrationWorker;

    iget-object v0, v0, Lcom/opera/android/readlater/MigrationWorker;->h:Lac1;

    if-eqz v0, :cond_146

    iget v1, v0, Lac1;->a:I

    if-ne v1, v3, :cond_137

    iget v1, v0, Lac1;->b:I

    if-eq v1, p1, :cond_146

    :cond_137
    iput v3, v0, Lac1;->a:I

    iput p1, v0, Lac1;->b:I

    invoke-static {}, Lwub;->D()Lwub;

    move-result-object p1

    invoke-virtual {v0}, Lac1;->c()Li16;

    move-result-object v0

    invoke-virtual {p1, v0}, Lwub;->H(Li16;)V

    :cond_146
    iget-wide v8, v4, Lilh;->a:J

    iget-object p1, v4, Lilh;->j:Ljava/lang/String;

    if-nez p1, :cond_16a

    invoke-virtual {v10}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/webkit/MimeTypeMap;->getFileExtensionFromUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "mhtml"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_168

    invoke-static {}, Landroid/webkit/MimeTypeMap;->getSingleton()Landroid/webkit/MimeTypeMap;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/webkit/MimeTypeMap;->getMimeTypeFromExtension(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    if-nez v7, :cond_168

    const-string v7, "application/octet-stream"

    :cond_168
    move-object v12, v7

    goto :goto_16b

    :cond_16a
    move-object v12, p1

    :goto_16b
    new-instance v6, Lbf1;

    move-object v7, p0

    invoke-direct/range {v6 .. v12}, Lbf1;-><init>(Lwyd;JLandroid/net/Uri;Lrn9;Ljava/lang/String;)V

    iget-object p0, v7, Lwyd;->d:Ljava/util/concurrent/ExecutorService;

    invoke-interface {p0, v6}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void

    :cond_177
    move-object v7, p0

    add-int/lit8 v3, v3, 0x1

    move-object p0, v7

    goto/16 :goto_11

    :cond_17d
    move-object v7, p0

    invoke-virtual {v7, v2}, Lwyd;->d(Z)V

    return-void
.end method

.method public final cancel()V
    .registers 3

    iget-boolean v0, p0, Lwyd;->h:Z

    if-nez v0, :cond_1b

    const/4 v0, 0x1

    iput-boolean v0, p0, Lwyd;->h:Z

    iget-object v0, p0, Lwyd;->f:Lpad;

    if-eqz v0, :cond_1b

    iget-object v1, v0, Lpad;->c:Ljava/lang/Object;

    check-cast v1, Lsyd;

    iget-object v1, v1, Lsyd;->e:Lbpd;

    iget-object v1, v1, Lbpd;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayDeque;

    invoke-virtual {v1, p0}, Ljava/util/ArrayDeque;->remove(Ljava/lang/Object;)Z

    const/4 p0, 0x0

    iput-object p0, v0, Lpad;->b:Ljava/lang/Object;

    :cond_1b
    return-void
.end method

.method public final d(Z)V
    .registers 7

    iget-object v0, p0, Lwyd;->f:Lpad;

    if-nez v0, :cond_5

    return-void

    :cond_5
    iget-object v1, v0, Lpad;->c:Ljava/lang/Object;

    check-cast v1, Lsyd;

    if-eqz p1, :cond_19

    iget-object v2, v1, Lsyd;->c:Lb59;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/SharedPreferences;

    const-string v3, "active"

    const/4 v4, 0x0

    invoke-static {v2, v3, v4}, Lcom/appsflyer/internal/j;->d(Landroid/content/SharedPreferences;Ljava/lang/String;Z)V

    :cond_19
    iget-object v1, v1, Lsyd;->e:Lbpd;

    const/4 v2, 0x0

    iput-object v2, v1, Lbpd;->b:Ljava/lang/Object;

    iget-object v3, v1, Lbpd;->c:Ljava/lang/Object;

    check-cast v3, Ljava/util/ArrayDeque;

    invoke-virtual {v3}, Ljava/util/ArrayDeque;->poll()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lwyd;

    iput-object v3, v1, Lbpd;->b:Ljava/lang/Object;

    if-eqz v3, :cond_2f

    invoke-virtual {v3}, Lwyd;->run()V

    :cond_2f
    iget-object v1, v0, Lpad;->b:Ljava/lang/Object;

    check-cast v1, Lesg;

    if-eqz v1, :cond_4c

    iget-object v1, v1, Lesg;->c:Ljava/lang/Object;

    check-cast v1, Ll94;

    if-eqz p1, :cond_44

    new-instance p1, Lyic;

    invoke-direct {p1}, Lyic;-><init>()V

    invoke-virtual {v1, p1}, Ll94;->b(Ljava/lang/Object;)Z

    goto :goto_4c

    :cond_44
    new-instance p1, Lwic;

    invoke-direct {p1}, Lwic;-><init>()V

    invoke-virtual {v1, p1}, Ll94;->b(Ljava/lang/Object;)Z

    :cond_4c
    :goto_4c
    iput-object v2, v0, Lpad;->b:Ljava/lang/Object;

    iput-object v2, p0, Lwyd;->f:Lpad;

    return-void
.end method

.method public final run()V
    .registers 4

    iget-boolean v0, p0, Lwyd;->g:Z

    if-nez v0, :cond_8

    iget-boolean v0, p0, Lwyd;->h:Z

    if-eqz v0, :cond_9

    :cond_8
    return-void

    :cond_9
    const/4 v0, 0x1

    iput-boolean v0, p0, Lwyd;->g:Z

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v0, p0, Lwyd;->a:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    iget-object v1, v1, Lcom/opera/android/OperaApplication;->n:Lorg/chromium/base/CommandLine;

    if-nez v1, :cond_1b

    const/4 v1, 0x0

    :cond_1b
    invoke-static {v0, v1}, Lfsp;->g(Landroid/content/Context;Lorg/chromium/base/CommandLine;)V

    new-instance v1, Lwt2;

    const/4 v2, 0x4

    invoke-direct {v1, p0, v2}, Lwt2;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0, v1}, Le7d;->a(Landroid/content/Context;Lc7d;)V

    return-void
.end method
