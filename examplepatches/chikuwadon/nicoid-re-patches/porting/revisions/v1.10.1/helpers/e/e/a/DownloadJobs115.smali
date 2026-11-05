.class final Le/e/a/DownloadJobs115;
.super Ljava/lang/Object;
.source "DownloadJobs115.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/DownloadJobs115$Job;
    }
.end annotation


# static fields
.field static final MAIN:Landroid/os/Handler;

.field static app:Landroid/content/Context;

.field static final jobs:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Le/e/a/DownloadJobs115$Job;",
            ">;"
        }
    .end annotation
.end field

.field static loaded:Z

.field static revision:J


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 4
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Le/e/a/DownloadJobs115;->jobs:Ljava/util/ArrayList;

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Le/e/a/DownloadJobs115;->MAIN:Landroid/os/Handler;

    return-void
.end method

.method constructor <init>()V
    .registers 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static declared-synchronized all()Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Le/e/a/DownloadJobs115$Job;",
            ">;"
        }
    .end annotation

    const-class v0, Le/e/a/DownloadJobs115;

    monitor-enter v0

    .line 8
    :try_start_3
    new-instance v1, Ljava/util/ArrayList;

    sget-object v2, Le/e/a/DownloadJobs115;->jobs:Ljava/util/ArrayList;

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
    :try_end_a
    .catchall {:try_start_3 .. :try_end_a} :catchall_c

    monitor-exit v0

    return-object v1

    .line 8
    :catchall_c
    move-exception v1

    :try_start_d
    monitor-exit v0
    :try_end_e
    .catchall {:try_start_d .. :try_end_e} :catchall_c

    throw v1
.end method

.method static declared-synchronized changed(Landroid/content/Context;)V
    .registers 5

    const-class p0, Le/e/a/DownloadJobs115;

    monitor-enter p0

    .line 9
    :try_start_3
    sget-wide v0, Le/e/a/DownloadJobs115;->revision:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    sput-wide v0, Le/e/a/DownloadJobs115;->revision:J

    invoke-static {}, Le/e/a/DownloadJobs115;->save()V
    :try_end_d
    .catchall {:try_start_3 .. :try_end_d} :catchall_f

    monitor-exit p0

    return-void

    .line 9
    :catchall_f
    move-exception v0

    :try_start_10
    monitor-exit p0
    :try_end_11
    .catchall {:try_start_10 .. :try_end_11} :catchall_f

    throw v0
.end method

.method static control(Le/e/a/DownloadJobs115$Job;Z)V
    .registers 4

    .line 14
    const-string v0, "\u4fdd\u5b58\u6e08\u307f"

    iget-object v1, p0, Le/e/a/DownloadJobs115$Job;->phase:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    return-void

    :cond_b
    iput-boolean p1, p0, Le/e/a/DownloadJobs115$Job;->paused:Z

    xor-int/lit8 v0, p1, 0x1

    iput-boolean v0, p0, Le/e/a/DownloadJobs115$Job;->cancelled:Z

    invoke-static {p0}, Le/e/a/DownloadWorker115;->cancel(Le/e/a/DownloadJobs115$Job;)V

    invoke-static {p0}, Le/e/a/DownloadWorker115;->running(Le/e/a/DownloadJobs115$Job;)Z

    move-result v0

    if-nez v0, :cond_2b

    if-eqz p1, :cond_1f

    const-string p1, "\u4e00\u6642\u505c\u6b62"

    goto :goto_21

    :cond_1f
    const-string p1, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    :goto_21
    iput-object p1, p0, Le/e/a/DownloadJobs115$Job;->phase:Ljava/lang/String;

    invoke-static {p0}, Le/e/a/DownloadWorker115;->unqueue(Le/e/a/DownloadJobs115$Job;)V

    sget-object p0, Le/e/a/DownloadJobs115;->app:Landroid/content/Context;

    invoke-static {p0}, Le/e/a/DownloadJobs115;->changed(Landroid/content/Context;)V

    :cond_2b
    return-void
.end method

.method static document(Landroid/net/Uri;)Landroid/net/Uri;
    .registers 2

    .line 16
    invoke-static {p0}, Landroid/provider/DocumentsContract;->getTreeDocumentId(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Landroid/provider/DocumentsContract;->buildDocumentUriUsingTree(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    return-object p0
.end method

.method static declared-synchronized enqueue(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;I)Le/e/a/DownloadJobs115$Job;
    .registers 10

    const-class v0, Le/e/a/DownloadJobs115;

    monitor-enter v0

    .line 12
    :try_start_3
    invoke-static {p0}, Le/e/a/DownloadJobs115;->init(Landroid/content/Context;)V

    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v1, "mp4_tree_uri"

    const-string v2, ""

    invoke-interface {p0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    sget-object v1, Le/e/a/DownloadJobs115;->jobs:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_18
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_35

    new-instance v1, Le/e/a/DownloadJobs115$Job;

    invoke-direct {v1}, Le/e/a/DownloadJobs115$Job;-><init>()V

    iput-object p1, v1, Le/e/a/DownloadJobs115$Job;->id:Ljava/lang/String;

    iput-object p2, v1, Le/e/a/DownloadJobs115$Job;->title:Ljava/lang/String;

    iput p3, v1, Le/e/a/DownloadJobs115$Job;->height:I

    iput-object p0, v1, Le/e/a/DownloadJobs115$Job;->tree:Ljava/lang/String;

    sget-object p0, Le/e/a/DownloadJobs115;->jobs:Ljava/util/ArrayList;

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-static {}, Le/e/a/DownloadJobs115;->save()V
    :try_end_33
    .catchall {:try_start_3 .. :try_end_33} :catchall_5f

    monitor-exit v0

    return-object v1

    :cond_35
    :try_start_35
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Le/e/a/DownloadJobs115$Job;

    iget-object v3, v2, Le/e/a/DownloadJobs115$Job;->id:Ljava/lang/String;

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_18

    iget v3, v2, Le/e/a/DownloadJobs115$Job;->height:I

    if-ne v3, p3, :cond_18

    const-string v3, "\u4fdd\u5b58\u6e08\u307f"

    const-string v4, "\u30a8\u30e9\u30fc"

    const-string v5, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    filled-new-array {v3, v4, v5}, [Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    iget-object v4, v2, Le/e/a/DownloadJobs115$Job;->phase:Ljava/lang/String;

    invoke-interface {v3, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3
    :try_end_5b
    .catchall {:try_start_35 .. :try_end_5b} :catchall_5f

    if-nez v3, :cond_18

    monitor-exit v0

    return-object v2

    .line 12
    :catchall_5f
    move-exception p0

    :try_start_60
    monitor-exit v0
    :try_end_61
    .catchall {:try_start_60 .. :try_end_61} :catchall_5f

    throw p0
.end method

.method static export(Landroid/content/Context;Le/e/a/DownloadJobs115$Job;Ljava/io/File;)V
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 17
    const-string v0, "\u4fdd\u5b58\u4e2d"

    iput-object v0, p1, Le/e/a/DownloadJobs115$Job;->phase:Ljava/lang/String;

    iget-object v0, p1, Le/e/a/DownloadJobs115$Job;->tree:Ljava/lang/String;

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    const/4 v1, 0x0

    :try_start_b
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    invoke-static {v0}, Le/e/a/DownloadJobs115;->document(Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object v0

    const-string v3, "video/mp4"

    new-instance v4, Ljava/lang/StringBuilder;

    iget-object v5, p1, Le/e/a/DownloadJobs115$Job;->title:Ljava/lang/String;

    iget-object v6, p1, Le/e/a/DownloadJobs115$Job;->id:Ljava/lang/String;

    invoke-static {v5, v6}, Le/e/a/Mp4Playlist115;->filename(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, ".part"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v0, v3, v4}, Landroid/provider/DocumentsContract;->createDocument(Landroid/content/ContentResolver;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0
    :try_end_34
    .catchall {:try_start_b .. :try_end_34} :catchall_ea

    if-eqz v0, :cond_df

    :try_start_36
    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, p2}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_3b
    .catchall {:try_start_36 .. :try_end_3b} :catchall_d5

    :try_start_3b
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string v4, "wt"

    invoke-virtual {v3, v0, v4}, Landroid/content/ContentResolver;->openOutputStream(Landroid/net/Uri;Ljava/lang/String;)Ljava/io/OutputStream;

    move-result-object v3
    :try_end_45
    .catchall {:try_start_3b .. :try_end_45} :catchall_c7

    if-eqz v3, :cond_b9

    const/high16 v4, 0x10000

    :try_start_49
    new-array v4, v4, [B

    :goto_4b
    invoke-virtual {v2, v4}, Ljava/io/InputStream;->read([B)I

    move-result v5
    :try_end_4f
    .catchall {:try_start_49 .. :try_end_4f} :catchall_b6

    const/4 v6, -0x1

    if-ne v5, v6, :cond_99

    if-eqz v3, :cond_57

    :try_start_54
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V
    :try_end_57
    .catchall {:try_start_54 .. :try_end_57} :catchall_c7

    :cond_57
    :try_start_57
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_5a
    .catchall {:try_start_57 .. :try_end_5a} :catchall_d5

    :try_start_5a
    iget-boolean v1, p1, Le/e/a/DownloadJobs115$Job;->cancelled:Z

    if-nez v1, :cond_93

    iget-boolean v1, p1, Le/e/a/DownloadJobs115$Job;->paused:Z

    if-nez v1, :cond_93

    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    iget-object v2, p1, Le/e/a/DownloadJobs115$Job;->title:Ljava/lang/String;

    iget-object v3, p1, Le/e/a/DownloadJobs115$Job;->id:Ljava/lang/String;

    invoke-static {v2, v3}, Le/e/a/Mp4Playlist115;->filename(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v0, v2}, Landroid/provider/DocumentsContract;->renameDocument(Landroid/content/ContentResolver;Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1
    :try_end_72
    .catchall {:try_start_5a .. :try_end_72} :catchall_e7

    if-eqz v1, :cond_8b

    :try_start_74
    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p1, Le/e/a/DownloadJobs115$Job;->uri:Ljava/lang/String;

    invoke-virtual {p2}, Ljava/io/File;->length()J

    move-result-wide v2

    iput-wide v2, p1, Le/e/a/DownloadJobs115$Job;->bytes:J

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, p1, Le/e/a/DownloadJobs115$Job;->savedAt:J

    const-string p2, "\u4fdd\u5b58\u6e08\u307f"

    iput-object p2, p1, Le/e/a/DownloadJobs115$Job;->phase:Ljava/lang/String;
    :try_end_8a
    .catchall {:try_start_74 .. :try_end_8a} :catchall_ea

    return-void

    :cond_8b
    :try_start_8b
    new-instance p1, Ljava/io/IOException;

    const-string p2, "\u4fdd\u5b58\u3092\u78ba\u5b9a\u3067\u304d\u307e\u305b\u3093"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :cond_92
    :goto_92
    throw p1

    :cond_93
    new-instance p1, Ljava/io/InterruptedIOException;

    invoke-direct {p1}, Ljava/io/InterruptedIOException;-><init>()V
    :try_end_98
    .catchall {:try_start_8b .. :try_end_98} :catchall_e7

    goto :goto_92

    :cond_99
    :try_start_99
    iget-boolean v6, p1, Le/e/a/DownloadJobs115$Job;->cancelled:Z

    if-nez v6, :cond_b0

    iget-boolean v6, p1, Le/e/a/DownloadJobs115$Job;->paused:Z

    if-nez v6, :cond_b0

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v6

    if-nez v6, :cond_b0

    const/4 v6, 0x0

    invoke-virtual {v3, v4, v6, v5}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_4b

    :cond_b0
    new-instance p1, Ljava/io/InterruptedIOException;

    invoke-direct {p1}, Ljava/io/InterruptedIOException;-><init>()V

    :goto_b5
    throw p1

    :catchall_b6
    move-exception p1

    move-object v1, p1

    goto :goto_c1

    :cond_b9
    new-instance p1, Ljava/io/IOException;

    const-string p2, "\u4fdd\u5b58\u5148\u3092\u958b\u3051\u307e\u305b\u3093"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
    :try_end_c0
    .catchall {:try_start_99 .. :try_end_c0} :catchall_b6

    goto :goto_b5

    :goto_c1
    if-eqz v3, :cond_c6

    :try_start_c3
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V

    :cond_c6
    throw v1
    :try_end_c7
    .catchall {:try_start_c3 .. :try_end_c7} :catchall_c7

    :catchall_c7
    move-exception p1

    if-eqz v1, :cond_d0

    if-eq v1, p1, :cond_d1

    :try_start_cc
    invoke-virtual {v1, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_d1

    :cond_d0
    move-object v1, p1

    :cond_d1
    :goto_d1
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    throw v1
    :try_end_d5
    .catchall {:try_start_cc .. :try_end_d5} :catchall_d5

    :catchall_d5
    move-exception p1

    if-eqz v1, :cond_92

    if-eq v1, p1, :cond_dd

    :try_start_da
    invoke-virtual {v1, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_dd
    move-object p1, v1

    goto :goto_92

    :cond_df
    new-instance p1, Ljava/io/IOException;

    const-string p2, "\u4fdd\u5b58\u5148\u306b\u30d5\u30a1\u30a4\u30eb\u3092\u4f5c\u6210\u3067\u304d\u307e\u305b\u3093"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
    :try_end_e6
    .catchall {:try_start_da .. :try_end_e6} :catchall_e7

    goto :goto_92

    :catchall_e7
    move-exception p1

    move-object v1, v0

    goto :goto_eb

    :catchall_ea
    move-exception p1

    :goto_eb
    if-eqz v1, :cond_fd

    :try_start_ed
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    invoke-static {p0, v1}, Landroid/provider/DocumentsContract;->deleteDocument(Landroid/content/ContentResolver;Landroid/net/Uri;)Z
    :try_end_f4
    .catch Ljava/lang/Exception; {:try_start_ed .. :try_end_f4} :catch_f5

    goto :goto_fd

    :catch_f5
    move-exception p0

    const-string p2, "nicoid-download"

    const-string v0, "Could not remove partial document"

    invoke-static {p2, v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_fd
    :goto_fd
    throw p1
.end method

.method static declared-synchronized find(Ljava/lang/String;)Le/e/a/DownloadJobs115$Job;
    .registers 5

    const-class v0, Le/e/a/DownloadJobs115;

    monitor-enter v0

    .line 7
    :try_start_3
    sget-object v1, Le/e/a/DownloadJobs115;->jobs:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_9
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2
    :try_end_d
    .catchall {:try_start_3 .. :try_end_d} :catchall_22

    if-nez v2, :cond_12

    monitor-exit v0

    const/4 p0, 0x0

    return-object p0

    :cond_12
    :try_start_12
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Le/e/a/DownloadJobs115$Job;

    iget-object v3, v2, Le/e/a/DownloadJobs115$Job;->token:Ljava/lang/String;

    invoke-virtual {v3, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3
    :try_end_1e
    .catchall {:try_start_12 .. :try_end_1e} :catchall_22

    if-eqz v3, :cond_9

    monitor-exit v0

    return-object v2

    .line 7
    :catchall_22
    move-exception p0

    :try_start_23
    monitor-exit v0
    :try_end_24
    .catchall {:try_start_23 .. :try_end_24} :catchall_22

    throw p0
.end method

.method static format(J)Ljava/lang/String;
    .registers 7

    .line 15
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    const-wide/32 v1, 0x40000000

    cmp-long v1, p0, v1

    if-ltz v1, :cond_e

    const-string v2, "%.2f GB"

    goto :goto_10

    :cond_e
    const-string v2, "%.1f MB"

    :goto_10
    long-to-double p0, p0

    if-ltz v1, :cond_16

    const-wide/high16 v3, 0x41d0000000000000L    # 1.073741824E9

    goto :goto_18

    :cond_16
    const-wide/high16 v3, 0x4130000000000000L    # 1048576.0

    :goto_18
    div-double/2addr p0, v3

    invoke-static {p0, p1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {v0, v2, p0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static declared-synchronized init(Landroid/content/Context;)V
    .registers 8

    const-class v0, Le/e/a/DownloadJobs115;

    monitor-enter v0

    .line 6
    :try_start_3
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    sput-object p0, Le/e/a/DownloadJobs115;->app:Landroid/content/Context;

    sget-boolean p0, Le/e/a/DownloadJobs115;->loaded:Z
    :try_end_b
    .catchall {:try_start_3 .. :try_end_b} :catchall_d8

    if-eqz p0, :cond_f

    :goto_d
    monitor-exit v0

    return-void

    :cond_f
    const/4 p0, 0x1

    :try_start_10
    sput-boolean p0, Le/e/a/DownloadJobs115;->loaded:Z

    new-instance v1, Ljava/io/File;

    sget-object v2, Le/e/a/DownloadJobs115;->app:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v2

    const-string v3, "mp4-downloads115.json"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_1f
    .catchall {:try_start_10 .. :try_end_1f} :catchall_d8

    :try_start_1f
    invoke-virtual {v1}, Ljava/io/File;->isFile()Z

    move-result v2

    if-nez v2, :cond_26

    goto :goto_d

    :cond_26
    new-instance v2, Ljava/lang/String;

    invoke-virtual {v1}, Ljava/io/File;->toPath()Ljava/nio/file/Path;

    move-result-object v1

    invoke-static {v1}, Ljava/nio/file/Files;->readAllBytes(Ljava/nio/file/Path;)[B

    move-result-object v1

    const-string v3, "UTF-8"

    invoke-direct {v2, v1, v3}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1, v2}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    const/4 v2, 0x0

    :goto_3b
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-lt v2, v3, :cond_42

    goto :goto_d

    :cond_42
    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    new-instance v4, Le/e/a/DownloadJobs115$Job;

    invoke-direct {v4}, Le/e/a/DownloadJobs115$Job;-><init>()V

    const-string v5, "token"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Le/e/a/DownloadJobs115$Job;->token:Ljava/lang/String;

    const-string v5, "id"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Le/e/a/DownloadJobs115$Job;->id:Ljava/lang/String;

    const-string v5, "title"

    iget-object v6, v4, Le/e/a/DownloadJobs115$Job;->id:Ljava/lang/String;

    invoke-virtual {v3, v5, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Le/e/a/DownloadJobs115$Job;->title:Ljava/lang/String;

    const-string v5, "tree"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Le/e/a/DownloadJobs115$Job;->tree:Ljava/lang/String;

    const-string v5, "height"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v5

    iput v5, v4, Le/e/a/DownloadJobs115$Job;->height:I

    const-string v5, "quality"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Le/e/a/DownloadJobs115$Job;->quality:Ljava/lang/String;

    const-string v5, "phase"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Le/e/a/DownloadJobs115$Job;->phase:Ljava/lang/String;

    const-string v5, "uri"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Le/e/a/DownloadJobs115$Job;->uri:Ljava/lang/String;

    const-string v5, "error"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Le/e/a/DownloadJobs115$Job;->error:Ljava/lang/String;

    const-string v5, "bytes"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v5

    iput-wide v5, v4, Le/e/a/DownloadJobs115$Job;->bytes:J

    const-string v5, "savedAt"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v5

    iput-wide v5, v4, Le/e/a/DownloadJobs115$Job;->savedAt:J

    const-string v3, "\u4fdd\u5b58\u6e08\u307f"

    const-string v5, "\u30a8\u30e9\u30fc"

    const-string v6, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    filled-new-array {v3, v5, v6}, [Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    iget-object v5, v4, Le/e/a/DownloadJobs115$Job;->phase:Ljava/lang/String;

    invoke-interface {v3, v5}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_c5

    const-string v3, "\u4e00\u6642\u505c\u6b62"

    iput-object v3, v4, Le/e/a/DownloadJobs115$Job;->phase:Ljava/lang/String;

    iput-boolean p0, v4, Le/e/a/DownloadJobs115$Job;->paused:Z

    const-string v3, "\u30a2\u30d7\u30ea\u7d42\u4e86\u306b\u3088\u308a\u4e2d\u65ad\u3057\u307e\u3057\u305f\u3002\u518d\u958b\u6642\u306f\u53d6\u5f97\u3092\u3084\u308a\u76f4\u3057\u307e\u3059\u3002"

    iput-object v3, v4, Le/e/a/DownloadJobs115$Job;->error:Ljava/lang/String;

    :cond_c5
    sget-object v3, Le/e/a/DownloadJobs115;->jobs:Ljava/util/ArrayList;

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_ca
    .catch Ljava/lang/Exception; {:try_start_1f .. :try_end_ca} :catch_ce
    .catchall {:try_start_1f .. :try_end_ca} :catchall_d8

    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_3b

    :catch_ce
    move-exception p0

    :try_start_cf
    const-string v1, "nicoid-download"

    const-string v2, "Cannot read download history"

    invoke-static {v1, v2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_d

    .line 6
    :catchall_d8
    move-exception p0

    monitor-exit v0
    :try_end_da
    .catchall {:try_start_cf .. :try_end_da} :catchall_d8

    throw p0
.end method

.method static intent(Landroid/content/Context;Le/e/a/DownloadJobs115$Job;)Landroid/content/Intent;
    .registers 4

    .line 11
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    const-string v1, "com.sauzask.nicoid.NicoidDownloadCache"

    invoke-virtual {v0, p0, v1}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    const-string v0, "nicoid_mp4_job115"

    iget-object v1, p1, Le/e/a/DownloadJobs115$Job;->token:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    const-string v0, "id"

    iget-object v1, p1, Le/e/a/DownloadJobs115$Job;->id:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    const-string v0, "title"

    iget-object p1, p1, Le/e/a/DownloadJobs115$Job;->title:Ljava/lang/String;

    invoke-virtual {p0, v0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    return-object p0
.end method

.method static declared-synchronized save()V
    .registers 7

    const-class v0, Le/e/a/DownloadJobs115;

    monitor-enter v0

    .line 10
    :try_start_3
    sget-object v1, Le/e/a/DownloadJobs115;->app:Landroid/content/Context;
    :try_end_5
    .catchall {:try_start_3 .. :try_end_5} :catchall_87

    if-nez v1, :cond_9

    :goto_7
    monitor-exit v0

    return-void

    :cond_9
    :try_start_9
    new-instance v1, Ljava/io/File;

    sget-object v2, Le/e/a/DownloadJobs115;->app:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v2

    const-string v3, "mp4-downloads115.json.tmp"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    new-instance v2, Ljava/io/File;

    sget-object v3, Le/e/a/DownloadJobs115;->app:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v3

    const-string v4, "mp4-downloads115.json"

    invoke-direct {v2, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_23
    .catchall {:try_start_9 .. :try_end_23} :catchall_87

    :try_start_23
    new-instance v3, Lorg/json/JSONArray;

    invoke-direct {v3}, Lorg/json/JSONArray;-><init>()V

    sget-object v4, Le/e/a/DownloadJobs115;->jobs:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_2e
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5
    :try_end_32
    .catch Ljava/lang/Exception; {:try_start_23 .. :try_end_32} :catch_7e
    .catchall {:try_start_23 .. :try_end_32} :catchall_87

    if-nez v5, :cond_70

    const/4 v4, 0x0

    :try_start_35
    new-instance v5, Ljava/io/FileOutputStream;

    invoke-direct {v5, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_3a
    .catchall {:try_start_35 .. :try_end_3a} :catchall_66

    :try_start_3a
    invoke-virtual {v3}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v6, "UTF-8"

    invoke-virtual {v3, v6}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v3

    invoke-virtual {v5, v3}, Ljava/io/FileOutputStream;->write([B)V

    invoke-virtual {v5}, Ljava/io/FileOutputStream;->getFD()Ljava/io/FileDescriptor;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/FileDescriptor;->sync()V
    :try_end_4e
    .catchall {:try_start_3a .. :try_end_4e} :catchall_60

    :try_start_4e
    invoke-virtual {v5}, Ljava/io/FileOutputStream;->close()V
    :try_end_51
    .catchall {:try_start_4e .. :try_end_51} :catchall_66

    :try_start_51
    invoke-virtual {v1, v2}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v1

    if-eqz v1, :cond_58

    goto :goto_7

    :cond_58
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Cannot finalize history"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :cond_5f
    :goto_5f
    throw v1
    :try_end_60
    .catch Ljava/lang/Exception; {:try_start_51 .. :try_end_60} :catch_7e
    .catchall {:try_start_51 .. :try_end_60} :catchall_87

    :catchall_60
    move-exception v1

    move-object v4, v1

    :try_start_62
    invoke-virtual {v5}, Ljava/io/FileOutputStream;->close()V

    throw v4
    :try_end_66
    .catchall {:try_start_62 .. :try_end_66} :catchall_66

    :catchall_66
    move-exception v1

    if-eqz v4, :cond_5f

    if-eq v4, v1, :cond_6e

    :try_start_6b
    invoke-virtual {v4, v1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_6e
    move-object v1, v4

    goto :goto_5f

    :cond_70
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Le/e/a/DownloadJobs115$Job;

    invoke-virtual {v5}, Le/e/a/DownloadJobs115$Job;->json()Lorg/json/JSONObject;

    move-result-object v5

    invoke-virtual {v3, v5}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_7d
    .catch Ljava/lang/Exception; {:try_start_6b .. :try_end_7d} :catch_7e
    .catchall {:try_start_6b .. :try_end_7d} :catchall_87

    goto :goto_2e

    :catch_7e
    move-exception v1

    :try_start_7f
    const-string v2, "nicoid-download"

    const-string v3, "Cannot save download history"

    invoke-static {v2, v3, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_7

    .line 10
    :catchall_87
    move-exception v1

    monitor-exit v0
    :try_end_89
    .catchall {:try_start_7f .. :try_end_89} :catchall_87

    throw v1
.end method

.method static submit(Landroid/content/Context;Le/e/a/DownloadJobs115$Job;)V
    .registers 5

    .line 13
    const/4 v0, 0x0

    iput-boolean v0, p1, Le/e/a/DownloadJobs115$Job;->cancelled:Z

    iput-boolean v0, p1, Le/e/a/DownloadJobs115$Job;->paused:Z

    const-string v1, ""

    iput-object v1, p1, Le/e/a/DownloadJobs115$Job;->error:Ljava/lang/String;

    const-wide/16 v1, 0x0

    iput-wide v1, p1, Le/e/a/DownloadJobs115$Job;->bytes:J

    const-wide/16 v1, -0x1

    iput-wide v1, p1, Le/e/a/DownloadJobs115$Job;->total:J

    iput v0, p1, Le/e/a/DownloadJobs115$Job;->finishedAssets:I

    iput v0, p1, Le/e/a/DownloadJobs115$Job;->assets:I

    const-string v0, "\u30ad\u30e5\u30fc\u5f85\u3061"

    iput-object v0, p1, Le/e/a/DownloadJobs115$Job;->phase:Ljava/lang/String;

    invoke-static {p0}, Le/e/a/DownloadJobs115;->changed(Landroid/content/Context;)V

    :try_start_1c
    invoke-static {p0, p1}, Le/e/a/DownloadJobs115;->intent(Landroid/content/Context;Le/e/a/DownloadJobs115$Job;)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/content/Context;->startForegroundService(Landroid/content/Intent;)Landroid/content/ComponentName;
    :try_end_23
    .catch Ljava/lang/Exception; {:try_start_1c .. :try_end_23} :catch_24

    goto :goto_30

    :catch_24
    move-exception v0

    const-string v0, "\u30a8\u30e9\u30fc"

    iput-object v0, p1, Le/e/a/DownloadJobs115$Job;->phase:Ljava/lang/String;

    const-string v0, "\u30c0\u30a6\u30f3\u30ed\u30fc\u30c9\u3092\u958b\u59cb\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f"

    iput-object v0, p1, Le/e/a/DownloadJobs115$Job;->error:Ljava/lang/String;

    invoke-static {p0}, Le/e/a/DownloadJobs115;->changed(Landroid/content/Context;)V

    :goto_30
    return-void
.end method
