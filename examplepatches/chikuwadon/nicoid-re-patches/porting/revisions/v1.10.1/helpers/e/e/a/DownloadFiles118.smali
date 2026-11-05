.class public final Le/e/a/DownloadFiles118;
.super Ljava/lang/Object;
.source "DownloadFiles118.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static forget(Landroid/content/Context;Le/e/a/DownloadJobs115$Job;)Z
    .registers 5

    .line 7
    const-class v0, Le/e/a/DownloadJobs115;

    monitor-enter v0

    :try_start_3
    const-string v1, "\u30a8\u30e9\u30fc"

    const-string v2, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    iget-object v2, p1, Le/e/a/DownloadJobs115$Job;->phase:Ljava/lang/String;

    invoke-interface {v1, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_32

    invoke-static {p1}, Le/e/a/DownloadWorker115;->running(Le/e/a/DownloadJobs115$Job;)Z

    move-result v1

    if-eqz v1, :cond_1f

    goto :goto_32

    :cond_1f
    invoke-static {p1}, Le/e/a/DownloadWorker115;->unqueue(Le/e/a/DownloadJobs115$Job;)V

    sget-object v1, Le/e/a/DownloadJobs115;->jobs:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_2c

    monitor-exit v0

    return v2

    :cond_2c
    invoke-static {p0}, Le/e/a/DownloadJobs115;->changed(Landroid/content/Context;)V

    monitor-exit v0

    const/4 p0, 0x1

    return p0

    :cond_32
    :goto_32
    monitor-exit v0

    return v2

    :catchall_34
    move-exception p0

    monitor-exit v0
    :try_end_36
    .catchall {:try_start_3 .. :try_end_36} :catchall_34

    throw p0
.end method

.method static listed(Landroid/content/Context;Ljava/lang/String;)Ljava/util/Set;
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 5
    const/4 v0, 0x0

    :try_start_1
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    invoke-static {p1}, Landroid/provider/DocumentsContract;->getTreeDocumentId(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1}, Landroid/provider/DocumentsContract;->buildChildDocumentsUriUsingTree(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_d} :catch_78

    :try_start_d
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string p0, "document_id"

    filled-new-array {p0}, [Ljava/lang/String;

    move-result-object v4

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0

    if-nez p0, :cond_26

    if-eqz p0, :cond_25

    invoke-interface {p0}, Landroid/database/Cursor;->close()V
    :try_end_25
    .catchall {:try_start_d .. :try_end_25} :catchall_6d

    :cond_25
    return-object v0

    :cond_26
    :try_start_26
    invoke-interface {p0}, Landroid/database/Cursor;->getExtras()Landroid/os/Bundle;

    move-result-object p1

    const/4 v1, 0x0

    if-eqz p1, :cond_43

    const-string v2, "loading"

    invoke-virtual {p1, v2, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-nez v2, :cond_3d

    const-string v2, "error"

    invoke-virtual {p1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1
    :try_end_3b
    .catchall {:try_start_26 .. :try_end_3b} :catchall_64

    if-eqz p1, :cond_43

    :cond_3d
    if-eqz p0, :cond_42

    :try_start_3f
    invoke-interface {p0}, Landroid/database/Cursor;->close()V
    :try_end_42
    .catchall {:try_start_3f .. :try_end_42} :catchall_6d

    :cond_42
    return-object v0

    :cond_43
    :try_start_43
    new-instance p1, Ljava/util/HashSet;

    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    :goto_48
    invoke-interface {p0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2
    :try_end_4c
    .catchall {:try_start_43 .. :try_end_4c} :catchall_64

    if-nez v2, :cond_54

    if-eqz p0, :cond_53

    :try_start_50
    invoke-interface {p0}, Landroid/database/Cursor;->close()V
    :try_end_53
    .catchall {:try_start_50 .. :try_end_53} :catchall_6d

    :cond_53
    return-object p1

    :cond_54
    :try_start_54
    invoke-interface {p0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2
    :try_end_58
    .catchall {:try_start_54 .. :try_end_58} :catchall_64

    if-nez v2, :cond_60

    if-eqz p0, :cond_5f

    :try_start_5c
    invoke-interface {p0}, Landroid/database/Cursor;->close()V
    :try_end_5f
    .catchall {:try_start_5c .. :try_end_5f} :catchall_6d

    :cond_5f
    return-object v0

    :cond_60
    :try_start_60
    invoke-interface {p1, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_63
    .catchall {:try_start_60 .. :try_end_63} :catchall_64

    goto :goto_48

    :catchall_64
    move-exception p1

    if-eqz p0, :cond_6a

    :try_start_67
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    :cond_6a
    throw p1
    :try_end_6b
    .catchall {:try_start_67 .. :try_end_6b} :catchall_6b

    :catchall_6b
    move-exception p0

    goto :goto_6f

    :catchall_6d
    move-exception p0

    move-object p1, v0

    :goto_6f
    if-eqz p1, :cond_77

    if-eq p1, p0, :cond_76

    :try_start_73
    invoke-virtual {p1, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_76
    move-object p0, p1

    :cond_77
    throw p0
    :try_end_78
    .catch Ljava/lang/Exception; {:try_start_73 .. :try_end_78} :catch_78

    :catch_78
    move-exception p0

    return-object v0
.end method

.method static reconcile(Landroid/content/Context;)V
    .registers 9

    .line 6
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-static {}, Le/e/a/DownloadJobs115;->all()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_d
    :goto_d
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_14

    return-void

    :cond_14
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Le/e/a/DownloadJobs115$Job;

    iget-object v3, v2, Le/e/a/DownloadJobs115$Job;->uri:Ljava/lang/String;

    iget-object v4, v2, Le/e/a/DownloadJobs115$Job;->tree:Ljava/lang/String;

    const-string v5, "\u4fdd\u5b58\u6e08\u307f"

    iget-object v6, v2, Le/e/a/DownloadJobs115$Job;->phase:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_d

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_2f

    goto :goto_d

    :cond_2f
    :try_start_2f
    invoke-interface {v0, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_3c

    invoke-static {p0, v4}, Le/e/a/DownloadFiles118;->listed(Landroid/content/Context;Ljava/lang/String;)Ljava/util/Set;

    move-result-object v5

    invoke-interface {v0, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_3c
    invoke-interface {v0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Set;

    if-eqz v5, :cond_d

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v6

    invoke-static {v6}, Landroid/provider/DocumentsContract;->getDocumentId(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_53

    goto :goto_d

    :cond_53
    const-class v5, Le/e/a/DownloadJobs115;

    monitor-enter v5
    :try_end_56
    .catch Ljava/lang/Exception; {:try_start_2f .. :try_end_56} :catch_80

    :try_start_56
    const-string v6, "\u4fdd\u5b58\u6e08\u307f"

    iget-object v7, v2, Le/e/a/DownloadJobs115$Job;->phase:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_7b

    iget-object v6, v2, Le/e/a/DownloadJobs115$Job;->uri:Ljava/lang/String;

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_7b

    iget-object v3, v2, Le/e/a/DownloadJobs115$Job;->tree:Ljava/lang/String;

    invoke-static {v4, v3}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_7b

    sget-object v3, Le/e/a/DownloadJobs115;->jobs:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7b

    invoke-static {p0}, Le/e/a/DownloadJobs115;->changed(Landroid/content/Context;)V

    :cond_7b
    monitor-exit v5

    goto :goto_d

    :catchall_7d
    move-exception v2

    monitor-exit v5
    :try_end_7f
    .catchall {:try_start_56 .. :try_end_7f} :catchall_7d

    :try_start_7f
    throw v2
    :try_end_80
    .catch Ljava/lang/Exception; {:try_start_7f .. :try_end_80} :catch_80

    :catch_80
    move-exception v2

    goto :goto_d
.end method
