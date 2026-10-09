.class public Le/e/a/CacheFile;
.super Ljava/io/File;
.source "CacheFile.java"


# direct methods
.method public constructor <init>(Ljava/io/File;Ljava/lang/String;)V
    .registers 4
    .param p1, "parent"    # Ljava/io/File;
    .param p2, "child"    # Ljava/lang/String;

    .line 12
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1, p2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/CacheFolders;->privatePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "path"    # Ljava/lang/String;

    .line 10
    invoke-static {p1}, Le/e/a/CacheFolders;->privatePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "parent"    # Ljava/lang/String;
    .param p2, "child"    # Ljava/lang/String;

    .line 11
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1, p2}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/CacheFolders;->privatePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/net/URI;)V
    .registers 3
    .param p1, "uri"    # Ljava/net/URI;

    .line 13
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/net/URI;)V

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/CacheFolders;->privatePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

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
    .registers 4

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

    .local v1, "uri":Landroid/net/Uri;
    if-eqz v1, :cond_2b

    sget-object v2, Le/e/a/CacheFolders;->context:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    invoke-static {v2, v1}, Landroid/provider/DocumentsContract;->deleteDocument(Landroid/content/ContentResolver;Landroid/net/Uri;)Z

    move-result v2

    if-eqz v2, :cond_2b

    const/4 v2, 0x1

    goto :goto_2c

    :cond_2b
    const/4 v2, 0x0

    .local v2, "removed":Z
    :goto_2c
    if-eqz v2, :cond_31

    invoke-static {p0}, Le/e/a/CacheFolders;->forget(Ljava/io/File;)V
    :try_end_31
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_31} :catch_32

    :cond_31
    return v2

    .end local v1    # "uri":Landroid/net/Uri;
    .end local v2    # "removed":Z
    :catch_32
    move-exception v1

    .local v1, "e":Ljava/lang/Exception;
    return v0
.end method

.method public exists()Z
    .registers 3

    .line 17
    invoke-direct {p0}, Le/e/a/CacheFile;->saf()Z

    move-result v0

    if-nez v0, :cond_b

    invoke-super {p0}, Ljava/io/File;->exists()Z

    move-result v0

    return v0

    :cond_b
    const/4 v0, 0x0

    :try_start_c
    invoke-static {p0}, Le/e/a/CacheFolders;->stat(Ljava/io/File;)Le/e/a/CacheFolders$Entry;

    move-result-object v1
    :try_end_10
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_10} :catch_14

    if-eqz v1, :cond_13

    const/4 v0, 0x1

    :cond_13
    return v0

    :catch_14
    move-exception v1

    .local v1, "e":Ljava/io/IOException;
    return v0
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

    .local v0, "p":Ljava/lang/String;
    if-nez v0, :cond_8

    const/4 v1, 0x0

    goto :goto_d

    :cond_8
    new-instance v1, Le/e/a/CacheFile;

    invoke-direct {v1, v0}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;)V

    :goto_d
    return-object v1
.end method

.method public isDirectory()Z
    .registers 5

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

    .local v1, "e":Le/e/a/CacheFolders$Entry;
    if-eqz v1, :cond_1d

    const-string v2, "vnd.android.document/directory"

    iget-object v3, v1, Le/e/a/CacheFolders$Entry;->mime:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2
    :try_end_1a
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_1a} :catch_1e

    if-eqz v2, :cond_1d

    const/4 v0, 0x1

    :cond_1d
    return v0

    .end local v1    # "e":Le/e/a/CacheFolders$Entry;
    :catch_1e
    move-exception v1

    .local v1, "e":Ljava/io/IOException;
    return v0
.end method

.method public isFile()Z
    .registers 2

    .line 19
    invoke-direct {p0}, Le/e/a/CacheFile;->saf()Z

    move-result v0

    if-eqz v0, :cond_16

    invoke-virtual {p0}, Le/e/a/CacheFile;->exists()Z

    move-result v0

    if-eqz v0, :cond_14

    invoke-virtual {p0}, Le/e/a/CacheFile;->isDirectory()Z

    move-result v0

    if-nez v0, :cond_14

    const/4 v0, 0x1

    goto :goto_1a

    :cond_14
    const/4 v0, 0x0

    goto :goto_1a

    :cond_16
    invoke-super {p0}, Ljava/io/File;->isFile()Z

    move-result v0

    :goto_1a
    return v0
.end method

.method public lastModified()J
    .registers 4

    .line 21
    invoke-direct {p0}, Le/e/a/CacheFile;->saf()Z

    move-result v0

    if-nez v0, :cond_b

    invoke-super {p0}, Ljava/io/File;->lastModified()J

    move-result-wide v0

    return-wide v0

    :cond_b
    const-wide/16 v0, 0x0

    :try_start_d
    invoke-static {p0}, Le/e/a/CacheFolders;->stat(Ljava/io/File;)Le/e/a/CacheFolders$Entry;

    move-result-object v2

    .local v2, "e":Le/e/a/CacheFolders$Entry;
    if-nez v2, :cond_14

    goto :goto_16

    :cond_14
    iget-wide v0, v2, Le/e/a/CacheFolders$Entry;->time:J
    :try_end_16
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_16} :catch_17

    :goto_16
    return-wide v0

    .end local v2    # "e":Le/e/a/CacheFolders$Entry;
    :catch_17
    move-exception v2

    .local v2, "e":Ljava/io/IOException;
    return-wide v0
.end method

.method public length()J
    .registers 4

    .line 20
    invoke-direct {p0}, Le/e/a/CacheFile;->saf()Z

    move-result v0

    if-nez v0, :cond_b

    invoke-super {p0}, Ljava/io/File;->length()J

    move-result-wide v0

    return-wide v0

    :cond_b
    const-wide/16 v0, 0x0

    :try_start_d
    invoke-static {p0}, Le/e/a/CacheFolders;->stat(Ljava/io/File;)Le/e/a/CacheFolders$Entry;

    move-result-object v2

    .local v2, "e":Le/e/a/CacheFolders$Entry;
    if-nez v2, :cond_14

    goto :goto_16

    :cond_14
    iget-wide v0, v2, Le/e/a/CacheFolders$Entry;->size:J
    :try_end_16
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_16} :catch_17

    :goto_16
    return-wide v0

    .end local v2    # "e":Le/e/a/CacheFolders$Entry;
    :catch_17
    move-exception v2

    .local v2, "e":Ljava/io/IOException;
    return-wide v0
.end method

.method public list()[Ljava/lang/String;
    .registers 5

    .line 30
    invoke-virtual {p0}, Le/e/a/CacheFile;->listFiles()[Ljava/io/File;

    move-result-object v0

    .local v0, "fs":[Ljava/io/File;
    if-nez v0, :cond_8

    const/4 v1, 0x0

    return-object v1

    :cond_8
    array-length v1, v0

    new-array v1, v1, [Ljava/lang/String;

    .local v1, "names":[Ljava/lang/String;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_c
    array-length v3, v1

    if-ge v2, v3, :cond_1a

    aget-object v3, v0, v2

    invoke-virtual {v3}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_c

    .end local v2    # "i":I
    :cond_1a
    return-object v1
.end method

.method public list(Ljava/io/FilenameFilter;)[Ljava/lang/String;
    .registers 6
    .param p1, "filter"    # Ljava/io/FilenameFilter;

    .line 31
    invoke-virtual {p0, p1}, Le/e/a/CacheFile;->listFiles(Ljava/io/FilenameFilter;)[Ljava/io/File;

    move-result-object v0

    .local v0, "fs":[Ljava/io/File;
    if-nez v0, :cond_8

    const/4 v1, 0x0

    return-object v1

    :cond_8
    array-length v1, v0

    new-array v1, v1, [Ljava/lang/String;

    .local v1, "names":[Ljava/lang/String;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_c
    array-length v3, v1

    if-ge v2, v3, :cond_1a

    aget-object v3, v0, v2

    invoke-virtual {v3}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_c

    .end local v2    # "i":I
    :cond_1a
    return-object v1
.end method

.method public listFiles()[Ljava/io/File;
    .registers 9

    .line 27
    invoke-direct {p0}, Le/e/a/CacheFile;->saf()Z

    move-result v0

    if-nez v0, :cond_b

    invoke-super {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    return-object v0

    :cond_b
    const/4 v0, 0x0

    :try_start_c
    invoke-static {p0}, Le/e/a/CacheFolders;->tree(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v1

    .local v1, "tree":Landroid/net/Uri;
    const/4 v2, 0x0

    invoke-static {p0, v2}, Le/e/a/CacheFolders;->document(Ljava/io/File;Z)Landroid/net/Uri;

    move-result-object v2

    .local v2, "parent":Landroid/net/Uri;
    if-nez v2, :cond_18

    return-object v0

    :cond_18
    invoke-static {v2, v1}, Le/e/a/CacheFolders;->cacheChildren(Landroid/net/Uri;Landroid/net/Uri;)Ljava/util/List;

    move-result-object v3

    .local v3, "es":Ljava/util/List;, "Ljava/util/List<Le/e/a/CacheFolders$Entry;>;"
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    new-array v4, v4, [Ljava/io/File;

    .local v4, "files":[Ljava/io/File;
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_23
    array-length v6, v4

    if-ge v5, v6, :cond_38

    new-instance v6, Le/e/a/CacheFile;

    invoke-interface {v3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Le/e/a/CacheFolders$Entry;

    iget-object v7, v7, Le/e/a/CacheFolders$Entry;->name:Ljava/lang/String;

    invoke-direct {v6, p0, v7}, Le/e/a/CacheFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    aput-object v6, v4, v5
    :try_end_35
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_35} :catch_39

    add-int/lit8 v5, v5, 0x1

    goto :goto_23

    .end local v5    # "i":I
    :cond_38
    return-object v4

    .end local v1    # "tree":Landroid/net/Uri;
    .end local v2    # "parent":Landroid/net/Uri;
    .end local v3    # "es":Ljava/util/List;, "Ljava/util/List<Le/e/a/CacheFolders$Entry;>;"
    .end local v4    # "files":[Ljava/io/File;
    :catch_39
    move-exception v1

    .local v1, "e":Ljava/io/IOException;
    return-object v0
.end method

.method public listFiles(Ljava/io/FileFilter;)[Ljava/io/File;
    .registers 9
    .param p1, "filter"    # Ljava/io/FileFilter;

    .line 29
    invoke-virtual {p0}, Le/e/a/CacheFile;->listFiles()[Ljava/io/File;

    move-result-object v0

    .local v0, "fs":[Ljava/io/File;
    if-eqz v0, :cond_2a

    if-nez p1, :cond_9

    goto :goto_2a

    :cond_9
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .local v1, "out":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/io/File;>;"
    array-length v2, v0

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_11
    if-ge v4, v2, :cond_21

    aget-object v5, v0, v4

    .local v5, "f":Ljava/io/File;
    invoke-interface {p1, v5}, Ljava/io/FileFilter;->accept(Ljava/io/File;)Z

    move-result v6

    if-eqz v6, :cond_1e

    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .end local v5    # "f":Ljava/io/File;
    :cond_1e
    add-int/lit8 v4, v4, 0x1

    goto :goto_11

    :cond_21
    new-array v2, v3, [Ljava/io/File;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/io/File;

    return-object v2

    .end local v1    # "out":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/io/File;>;"
    :cond_2a
    :goto_2a
    return-object v0
.end method

.method public listFiles(Ljava/io/FilenameFilter;)[Ljava/io/File;
    .registers 9
    .param p1, "filter"    # Ljava/io/FilenameFilter;

    .line 28
    invoke-virtual {p0}, Le/e/a/CacheFile;->listFiles()[Ljava/io/File;

    move-result-object v0

    .local v0, "fs":[Ljava/io/File;
    if-eqz v0, :cond_2e

    if-nez p1, :cond_9

    goto :goto_2e

    :cond_9
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .local v1, "out":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/io/File;>;"
    array-length v2, v0

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_11
    if-ge v4, v2, :cond_25

    aget-object v5, v0, v4

    .local v5, "f":Ljava/io/File;
    invoke-virtual {v5}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-interface {p1, p0, v6}, Ljava/io/FilenameFilter;->accept(Ljava/io/File;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_22

    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .end local v5    # "f":Ljava/io/File;
    :cond_22
    add-int/lit8 v4, v4, 0x1

    goto :goto_11

    :cond_25
    new-array v2, v3, [Ljava/io/File;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/io/File;

    return-object v2

    .end local v1    # "out":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/io/File;>;"
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
    .param p1, "dest"    # Ljava/io/File;

    .line 26
    invoke-direct {p0}, Le/e/a/CacheFile;->saf()Z

    move-result v0

    if-nez v0, :cond_b

    invoke-super {p0, p1}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v0

    return v0

    :cond_b
    const/4 v0, 0x0

    :try_start_c
    invoke-static {p1}, Le/e/a/CacheFolders;->virtual(Ljava/io/File;)Z

    move-result v1

    if-eqz v1, :cond_48

    invoke-static {p0}, Le/e/a/CacheFolders;->tree(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v1

    invoke-static {p1}, Le/e/a/CacheFolders;->tree(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_48

    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_27

    goto :goto_48

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

    .local v1, "renamed":Landroid/net/Uri;
    if-eqz v1, :cond_45

    invoke-static {p0}, Le/e/a/CacheFolders;->forget(Ljava/io/File;)V

    invoke-static {p1, v1}, Le/e/a/CacheFolders;->remember(Ljava/io/File;Landroid/net/Uri;)V
    :try_end_45
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_45} :catch_49

    :cond_45
    if-eqz v1, :cond_48

    const/4 v0, 0x1

    .end local v1    # "renamed":Landroid/net/Uri;
    :cond_48
    :goto_48
    return v0

    :catch_49
    move-exception v1

    .local v1, "e":Ljava/lang/Exception;
    return v0
.end method
