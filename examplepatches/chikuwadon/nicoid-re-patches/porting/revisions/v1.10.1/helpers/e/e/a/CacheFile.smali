.class public Le/e/a/CacheFile;
.super Ljava/io/File;
.source "CacheFile.java"


# direct methods
.method public constructor <init>(Ljava/io/File;Ljava/lang/String;)V
    .registers 4

    .line 12
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1, p2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Le/e/a/CacheFolders;->privatePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 2

    .line 10
    invoke-static {p1}, Le/e/a/CacheFolders;->privatePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    .line 11
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1, p2}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Le/e/a/CacheFolders;->privatePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/net/URI;)V
    .registers 3

    .line 13
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/net/URI;)V

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Le/e/a/CacheFolders;->privatePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method private saf()Z
    .registers 2

    .line 14
    invoke-static {p0}, Le/e/a/CacheFolders;->virtual(Ljava/io/File;)Z

    move-result v0

    return v0
.end method


# virtual methods
.method public createNewFile()Z
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 24
    invoke-direct {p0}, Le/e/a/CacheFile;->saf()Z

    move-result v0

    if-nez v0, :cond_b

    invoke-super {p0}, Ljava/io/File;->createNewFile()Z

    move-result v0

    return v0

    :cond_b
    invoke-virtual {p0}, Le/e/a/CacheFile;->exists()Z

    move-result v0

    if-eqz v0, :cond_13

    const/4 v0, 0x0

    return v0

    :cond_13
    const/4 v0, 0x1

    invoke-static {p0, v0}, Le/e/a/CacheFolders;->document(Ljava/io/File;Z)Landroid/net/Uri;

    return v0
.end method

.method public delete()Z
    .registers 6

    .line 25
    invoke-direct {p0}, Le/e/a/CacheFile;->saf()Z

    move-result v0

    if-nez v0, :cond_b

    invoke-super {p0}, Ljava/io/File;->delete()Z

    move-result v0

    return v0

    :cond_b
    const/4 v0, 0x0

    :try_start_c
    invoke-static {p0}, Le/e/a/CacheFolders;->relative(Ljava/io/File;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_17

    return v0

    :cond_17
    invoke-static {p0, v0}, Le/e/a/CacheFolders;->document(Ljava/io/File;Z)Landroid/net/Uri;

    move-result-object v1

    if-eqz v1, :cond_2b

    sget-object v2, Le/e/a/CacheFolders;->context:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    invoke-static {v2, v1}, Landroid/provider/DocumentsContract;->deleteDocument(Landroid/content/ContentResolver;Landroid/net/Uri;)Z

    move-result v1

    if-eqz v1, :cond_2b

    const/4 v1, 0x1

    goto :goto_2c

    :cond_2b
    const/4 v1, 0x0

    :goto_2c
    if-eqz v1, :cond_3d

    invoke-static {p0}, Le/e/a/CacheFolders;->forget(Ljava/io/File;)V
    :try_end_31
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_31} :catch_3e

    :try_start_31
    invoke-static {p0}, Le/e/a/CacheFolders;->cleanupVideoFolder(Ljava/io/File;)V
    :try_end_34
    .catch Ljava/io/IOException; {:try_start_31 .. :try_end_34} :catch_35
    .catch Ljava/lang/Exception; {:try_start_31 .. :try_end_34} :catch_3e

    goto :goto_3d

    :catch_35
    move-exception v2

    :try_start_36
    const-string v3, "nicoid-cache"

    const-string v4, "Cache folder cleanup failed"

    invoke-static {v3, v4, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_3d
    .catch Ljava/lang/Exception; {:try_start_36 .. :try_end_3d} :catch_3e

    :cond_3d
    :goto_3d
    return v1

    :catch_3e
    move-exception v1

    return v0
.end method

.method public exists()Z
    .registers 4

    .line 17
    invoke-direct {p0}, Le/e/a/CacheFile;->saf()Z

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez v0, :cond_1b

    invoke-super {p0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_f

    return v1

    :cond_f
    :try_start_f
    invoke-static {p0}, Le/e/a/CachePack;->entry(Ljava/io/File;)Le/e/a/CachePackIndex$Entry;

    move-result-object v0
    :try_end_13
    .catch Ljava/io/IOException; {:try_start_f .. :try_end_13} :catch_19
    .catch Ljava/lang/RuntimeException; {:try_start_f .. :try_end_13} :catch_17

    if-eqz v0, :cond_16

    return v1

    :cond_16
    return v2

    :catch_17
    move-exception v0

    goto :goto_1a

    :catch_19
    move-exception v0

    :goto_1a
    return v2

    :cond_1b
    :try_start_1b
    invoke-static {p0}, Le/e/a/CacheFolders;->stat(Ljava/io/File;)Le/e/a/CacheFolders$Entry;

    move-result-object v0
    :try_end_1f
    .catch Ljava/io/IOException; {:try_start_1b .. :try_end_1f} :catch_25
    .catch Ljava/lang/RuntimeException; {:try_start_1b .. :try_end_1f} :catch_23

    if-eqz v0, :cond_22

    return v1

    :cond_22
    return v2

    :catch_23
    move-exception v0

    goto :goto_26

    :catch_25
    move-exception v0

    :goto_26
    return v2
.end method

.method public getAbsoluteFile()Ljava/io/File;
    .registers 3

    .line 16
    new-instance v0, Le/e/a/CacheFile;

    invoke-virtual {p0}, Le/e/a/CacheFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public getParentFile()Ljava/io/File;
    .registers 3

    .line 15
    invoke-virtual {p0}, Le/e/a/CacheFile;->getParent()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_8

    const/4 v0, 0x0

    goto :goto_e

    :cond_8
    new-instance v1, Le/e/a/CacheFile;

    invoke-direct {v1, v0}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;)V

    move-object v0, v1

    :goto_e
    return-object v0
.end method

.method public isDirectory()Z
    .registers 4

    .line 18
    invoke-direct {p0}, Le/e/a/CacheFile;->saf()Z

    move-result v0

    if-nez v0, :cond_b

    invoke-super {p0}, Ljava/io/File;->isDirectory()Z

    move-result v0

    return v0

    :cond_b
    const/4 v0, 0x0

    :try_start_c
    invoke-static {p0}, Le/e/a/CacheFolders;->stat(Ljava/io/File;)Le/e/a/CacheFolders$Entry;

    move-result-object v1

    if-eqz v1, :cond_1d

    const-string v2, "vnd.android.document/directory"

    iget-object v1, v1, Le/e/a/CacheFolders$Entry;->mime:Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1
    :try_end_1a
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_1a} :catch_20
    .catch Ljava/lang/RuntimeException; {:try_start_c .. :try_end_1a} :catch_1e

    if-eqz v1, :cond_1d

    const/4 v0, 0x1

    :cond_1d
    return v0

    :catch_1e
    move-exception v1

    goto :goto_21

    :catch_20
    move-exception v1

    :goto_21
    return v0
.end method

.method public isFile()Z
    .registers 5

    .line 19
    invoke-direct {p0}, Le/e/a/CacheFile;->saf()Z

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez v0, :cond_16

    invoke-virtual {p0}, Le/e/a/CacheFile;->exists()Z

    move-result v0

    if-eqz v0, :cond_15

    invoke-super {p0}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-nez v0, :cond_15

    return v1

    :cond_15
    return v2

    :cond_16
    :try_start_16
    invoke-static {p0}, Le/e/a/CacheFolders;->stat(Ljava/io/File;)Le/e/a/CacheFolders$Entry;

    move-result-object v0

    if-eqz v0, :cond_27

    const-string v3, "vnd.android.document/directory"

    iget-object v0, v0, Le/e/a/CacheFolders$Entry;->mime:Ljava/lang/String;

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0
    :try_end_24
    .catch Ljava/io/IOException; {:try_start_16 .. :try_end_24} :catch_2a
    .catch Ljava/lang/RuntimeException; {:try_start_16 .. :try_end_24} :catch_28

    if-nez v0, :cond_27

    return v1

    :cond_27
    return v2

    :catch_28
    move-exception v0

    goto :goto_2b

    :catch_2a
    move-exception v0

    :goto_2b
    return v2
.end method

.method public lastModified()J
    .registers 4

    .line 21
    invoke-direct {p0}, Le/e/a/CacheFile;->saf()Z

    move-result v0

    const-wide/16 v1, 0x0

    if-nez v0, :cond_21

    invoke-super {p0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_13

    invoke-super {p0}, Ljava/io/File;->lastModified()J

    move-result-wide v0

    return-wide v0

    :cond_13
    :try_start_13
    invoke-static {p0}, Le/e/a/CachePack;->entry(Ljava/io/File;)Le/e/a/CachePackIndex$Entry;

    move-result-object v0

    if-nez v0, :cond_1a

    goto :goto_1c

    :cond_1a
    iget-wide v1, v0, Le/e/a/CachePackIndex$Entry;->time:J
    :try_end_1c
    .catch Ljava/io/IOException; {:try_start_13 .. :try_end_1c} :catch_1f
    .catch Ljava/lang/RuntimeException; {:try_start_13 .. :try_end_1c} :catch_1d

    :goto_1c
    return-wide v1

    :catch_1d
    move-exception v0

    goto :goto_20

    :catch_1f
    move-exception v0

    :goto_20
    return-wide v1

    :cond_21
    :try_start_21
    invoke-static {p0}, Le/e/a/CacheFolders;->stat(Ljava/io/File;)Le/e/a/CacheFolders$Entry;

    move-result-object v0

    if-nez v0, :cond_28

    goto :goto_2a

    :cond_28
    iget-wide v1, v0, Le/e/a/CacheFolders$Entry;->time:J
    :try_end_2a
    .catch Ljava/io/IOException; {:try_start_21 .. :try_end_2a} :catch_2d
    .catch Ljava/lang/RuntimeException; {:try_start_21 .. :try_end_2a} :catch_2b

    :goto_2a
    return-wide v1

    :catch_2b
    move-exception v0

    goto :goto_2e

    :catch_2d
    move-exception v0

    :goto_2e
    return-wide v1
.end method

.method public length()J
    .registers 4

    .line 20
    invoke-direct {p0}, Le/e/a/CacheFile;->saf()Z

    move-result v0

    const-wide/16 v1, 0x0

    if-nez v0, :cond_21

    invoke-super {p0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_13

    invoke-super {p0}, Ljava/io/File;->length()J

    move-result-wide v0

    return-wide v0

    :cond_13
    :try_start_13
    invoke-static {p0}, Le/e/a/CachePack;->entry(Ljava/io/File;)Le/e/a/CachePackIndex$Entry;

    move-result-object v0

    if-nez v0, :cond_1a

    goto :goto_1c

    :cond_1a
    iget-wide v1, v0, Le/e/a/CachePackIndex$Entry;->size:J
    :try_end_1c
    .catch Ljava/io/IOException; {:try_start_13 .. :try_end_1c} :catch_1f
    .catch Ljava/lang/RuntimeException; {:try_start_13 .. :try_end_1c} :catch_1d

    :goto_1c
    return-wide v1

    :catch_1d
    move-exception v0

    goto :goto_20

    :catch_1f
    move-exception v0

    :goto_20
    return-wide v1

    :cond_21
    :try_start_21
    invoke-static {p0}, Le/e/a/CacheFolders;->stat(Ljava/io/File;)Le/e/a/CacheFolders$Entry;

    move-result-object v0

    if-nez v0, :cond_28

    goto :goto_2a

    :cond_28
    iget-wide v1, v0, Le/e/a/CacheFolders$Entry;->size:J
    :try_end_2a
    .catch Ljava/io/IOException; {:try_start_21 .. :try_end_2a} :catch_2d
    .catch Ljava/lang/RuntimeException; {:try_start_21 .. :try_end_2a} :catch_2b

    :goto_2a
    return-wide v1

    :catch_2b
    move-exception v0

    goto :goto_2e

    :catch_2d
    move-exception v0

    :goto_2e
    return-wide v1
.end method

.method public list()[Ljava/lang/String;
    .registers 6

    .line 30
    invoke-virtual {p0}, Le/e/a/CacheFile;->listFiles()[Ljava/io/File;

    move-result-object v0

    if-nez v0, :cond_8

    const/4 v0, 0x0

    return-object v0

    :cond_8
    array-length v1, v0

    new-array v2, v1, [Ljava/lang/String;

    const/4 v3, 0x0

    :goto_c
    if-lt v3, v1, :cond_f

    return-object v2

    :cond_f
    aget-object v4, v0, v3

    invoke-virtual {v4}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_c
.end method

.method public list(Ljava/io/FilenameFilter;)[Ljava/lang/String;
    .registers 6

    .line 31
    invoke-virtual {p0, p1}, Le/e/a/CacheFile;->listFiles(Ljava/io/FilenameFilter;)[Ljava/io/File;

    move-result-object p1

    if-nez p1, :cond_8

    const/4 p1, 0x0

    return-object p1

    :cond_8
    array-length v0, p1

    new-array v1, v0, [Ljava/lang/String;

    const/4 v2, 0x0

    :goto_c
    if-lt v2, v0, :cond_f

    return-object v1

    :cond_f
    aget-object v3, p1, v2

    invoke-virtual {v3}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_c
.end method

.method public listFiles()[Ljava/io/File;
    .registers 8

    .line 27
    invoke-direct {p0}, Le/e/a/CacheFile;->saf()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_27

    invoke-super {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    if-nez v0, :cond_10

    new-array v0, v1, [Ljava/io/File;

    return-object v0

    :cond_10
    array-length v2, v0

    new-array v2, v2, [Ljava/io/File;

    :goto_13
    array-length v3, v0

    if-lt v1, v3, :cond_17

    return-object v2

    :cond_17
    new-instance v3, Le/e/a/CacheFile;

    aget-object v4, v0, v1

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;)V

    aput-object v3, v2, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_13

    :cond_27
    :try_start_27
    invoke-static {p0}, Le/e/a/CacheFolders;->tree(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v0

    invoke-static {p0, v1}, Le/e/a/CacheFolders;->document(Ljava/io/File;Z)Landroid/net/Uri;

    move-result-object v2

    if-nez v2, :cond_34

    new-array v0, v1, [Ljava/io/File;

    return-object v0

    :cond_34
    invoke-static {v2, v0}, Le/e/a/CacheFolders;->cacheChildren(Landroid/net/Uri;Landroid/net/Uri;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    new-array v3, v2, [Ljava/io/File;

    const/4 v4, 0x0

    :goto_3f
    if-lt v4, v2, :cond_42

    return-object v3

    :cond_42
    new-instance v5, Le/e/a/CacheFile;

    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Le/e/a/CacheFolders$Entry;

    iget-object v6, v6, Le/e/a/CacheFolders$Entry;->name:Ljava/lang/String;

    invoke-direct {v5, p0, v6}, Le/e/a/CacheFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    aput-object v5, v3, v4
    :try_end_51
    .catch Ljava/io/IOException; {:try_start_27 .. :try_end_51} :catch_56
    .catch Ljava/lang/RuntimeException; {:try_start_27 .. :try_end_51} :catch_54

    add-int/lit8 v4, v4, 0x1

    goto :goto_3f

    :catch_54
    move-exception v0

    goto :goto_57

    :catch_56
    move-exception v0

    :goto_57
    new-array v0, v1, [Ljava/io/File;

    return-object v0
.end method

.method public listFiles(Ljava/io/FileFilter;)[Ljava/io/File;
    .registers 9

    .line 29
    invoke-virtual {p0}, Le/e/a/CacheFile;->listFiles()[Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_2a

    if-nez p1, :cond_9

    goto :goto_2a

    :cond_9
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    array-length v2, v0

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_11
    if-lt v4, v2, :cond_1c

    new-array p1, v3, [Ljava/io/File;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Ljava/io/File;

    return-object p1

    :cond_1c
    aget-object v5, v0, v4

    invoke-interface {p1, v5}, Ljava/io/FileFilter;->accept(Ljava/io/File;)Z

    move-result v6

    if-eqz v6, :cond_27

    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_27
    add-int/lit8 v4, v4, 0x1

    goto :goto_11

    :cond_2a
    :goto_2a
    return-object v0
.end method

.method public listFiles(Ljava/io/FilenameFilter;)[Ljava/io/File;
    .registers 9

    .line 28
    invoke-virtual {p0}, Le/e/a/CacheFile;->listFiles()[Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_2e

    if-nez p1, :cond_9

    goto :goto_2e

    :cond_9
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    array-length v2, v0

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_11
    if-lt v4, v2, :cond_1c

    new-array p1, v3, [Ljava/io/File;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Ljava/io/File;

    return-object p1

    :cond_1c
    aget-object v5, v0, v4

    invoke-virtual {v5}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-interface {p1, p0, v6}, Ljava/io/FilenameFilter;->accept(Ljava/io/File;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_2b

    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_2b
    add-int/lit8 v4, v4, 0x1

    goto :goto_11

    :cond_2e
    :goto_2e
    return-object v0
.end method

.method public mkdir()Z
    .registers 2

    .line 22
    invoke-direct {p0}, Le/e/a/CacheFile;->saf()Z

    move-result v0

    if-eqz v0, :cond_b

    invoke-virtual {p0}, Le/e/a/CacheFile;->isDirectory()Z

    move-result v0

    goto :goto_f

    :cond_b
    invoke-super {p0}, Ljava/io/File;->mkdir()Z

    move-result v0

    :goto_f
    return v0
.end method

.method public mkdirs()Z
    .registers 2

    .line 23
    invoke-direct {p0}, Le/e/a/CacheFile;->saf()Z

    move-result v0

    if-eqz v0, :cond_b

    invoke-virtual {p0}, Le/e/a/CacheFile;->isDirectory()Z

    move-result v0

    goto :goto_f

    :cond_b
    invoke-super {p0}, Ljava/io/File;->mkdirs()Z

    move-result v0

    :goto_f
    return v0
.end method

.method public renameTo(Ljava/io/File;)Z
    .registers 6

    .line 26
    invoke-direct {p0}, Le/e/a/CacheFile;->saf()Z

    move-result v0

    if-nez v0, :cond_b

    invoke-super {p0, p1}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result p1

    return p1

    :cond_b
    const/4 v0, 0x0

    :try_start_c
    invoke-static {p1}, Le/e/a/CacheFolders;->virtual(Ljava/io/File;)Z

    move-result v1

    if-eqz v1, :cond_49

    invoke-static {p0}, Le/e/a/CacheFolders;->tree(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v1

    invoke-static {p1}, Le/e/a/CacheFolders;->tree(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_49

    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_27

    goto :goto_49

    :cond_27
    sget-object v1, Le/e/a/CacheFolders;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    invoke-static {p0, v0}, Le/e/a/CacheFolders;->document(Ljava/io/File;Z)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Le/e/a/CacheFolders;->physicalName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Landroid/provider/DocumentsContract;->renameDocument(Landroid/content/ContentResolver;Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    if-eqz v1, :cond_45

    invoke-static {p0}, Le/e/a/CacheFolders;->forget(Ljava/io/File;)V

    invoke-static {p1, v1}, Le/e/a/CacheFolders;->remember(Ljava/io/File;Landroid/net/Uri;)V
    :try_end_45
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_45} :catch_4a

    :cond_45
    if-eqz v1, :cond_49

    const/4 p1, 0x1

    return p1

    :cond_49
    :goto_49
    return v0

    :catch_4a
    move-exception p1

    return v0
.end method
