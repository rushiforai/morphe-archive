.class public final Le/e/a/CachePack;
.super Ljava/lang/Object;
.source "CachePack.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/CachePack$Index;
    }
.end annotation


# static fields
.field private static final ID:Ljava/util/regex/Pattern;

.field private static final indexes:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Le/e/a/CachePack$Index;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .line 5
    const-string v0, "^((?:sm|so|nm|ss)[0-9]+)(?:[._].*)?$"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Le/e/a/CachePack;->ID:Ljava/util/regex/Pattern;

    .line 7
    new-instance v0, Le/e/a/CachePack$1;

    const/high16 v1, 0x3f400000    # 0.75f

    const/4 v2, 0x1

    const/16 v3, 0x8

    invoke-direct {v0, v3, v1, v2}, Le/e/a/CachePack$1;-><init>(IFZ)V

    sput-object v0, Le/e/a/CachePack;->indexes:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static archive(Ljava/io/File;)Ljava/io/File;
    .registers 7
    .param p0, "f"    # Ljava/io/File;

    .line 8
    sget-object v0, Le/e/a/CachePack;->ID:Ljava/util/regex/Pattern;

    invoke-virtual {p0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .local v0, "m":Ljava/util/regex/Matcher;
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v1

    if-eqz v1, :cond_3c

    invoke-virtual {p0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, ".ncache"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_3c

    new-instance v1, Le/e/a/CacheFile;

    invoke-virtual {p0}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v5, 0x1

    invoke-virtual {v0, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v3, v2}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3d

    :cond_3c
    const/4 v1, 0x0

    :goto_3d
    return-object v1
.end method

.method public static completed(Ljava/lang/String;Ljava/lang/String;J)V
    .registers 32
    .param p0, "folder"    # Ljava/lang/String;
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "bytes"    # J

    .line 11
    move-object/from16 v1, p0

    move-object/from16 v2, p1

    const-string v3, "nicoid-cache"

    const-wide/16 v4, 0x0

    cmp-long v0, p2, v4

    if-lez v0, :cond_23c

    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Le/e/a/CacheFolders;->virtual(Ljava/io/File;)Z

    move-result v0

    if-nez v0, :cond_19

    goto/16 :goto_23c

    :cond_19
    new-instance v0, Le/e/a/CacheFile;

    invoke-direct {v0, v1}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;)V

    move-object v4, v0

    .local v4, "root":Ljava/io/File;
    new-instance v0, Le/e/a/CacheFile;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ".ncache.part"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v0, v4, v5}, Le/e/a/CacheFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    move-object v5, v0

    .local v5, "temp":Ljava/io/File;
    new-instance v0, Le/e/a/CacheFile;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ".ncache"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v0, v4, v6}, Le/e/a/CacheFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    move-object v6, v0

    .local v6, "dest":Ljava/io/File;
    new-instance v0, Le/e/a/CacheFile;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ".ncache.backup"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v0, v4, v7}, Le/e/a/CacheFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    move-object v7, v0

    .local v7, "backup":Ljava/io/File;
    const/4 v8, 0x0

    .local v8, "installed":Z
    const/4 v9, 0x0

    .line 13
    .local v9, "backed":Z
    :try_start_6c
    invoke-virtual {v4}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    move-object v10, v0

    .local v10, "all":[Ljava/io/File;
    if-eqz v10, :cond_21b

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    move-object v11, v0

    .local v11, "files":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    array-length v0, v10

    const/4 v13, 0x0

    :goto_7b
    if-ge v13, v0, :cond_c3

    aget-object v14, v10, v13

    .local v14, "f":Ljava/io/File;
    invoke-virtual {v14}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v15

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v12, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    move/from16 v16, v0

    const-string v0, ".m3u8"

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v15, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_bb

    invoke-virtual {v14}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v12, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v15, "_asset_"

    invoke-virtual {v12, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v0, v12}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_be

    :cond_bb
    invoke-interface {v11, v14}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .end local v14    # "f":Ljava/io/File;
    :cond_be
    add-int/lit8 v13, v13, 0x1

    move/from16 v0, v16

    goto :goto_7b

    :cond_c3
    invoke-interface {v11}, Ljava/util/List;->isEmpty()Z

    move-result v0
    :try_end_c7
    .catch Ljava/lang/Exception; {:try_start_6c .. :try_end_c7} :catch_225
    .catchall {:try_start_6c .. :try_end_c7} :catchall_223

    if-eqz v0, :cond_cf

    .line 20
    if-nez v8, :cond_ce

    invoke-virtual {v5}, Ljava/io/File;->delete()Z

    .line 13
    :cond_ce
    return-void

    :cond_cf
    :try_start_cf
    new-instance v0, Le/e/a/CachePack$0;

    invoke-direct {v0}, Le/e/a/CachePack$0;-><init>()V

    invoke-static {v11, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    move-object v12, v0

    .local v12, "index":Ljava/util/List;, "Ljava/util/List<Le/e/a/CachePackIndex$Entry;>;"
    const-wide/16 v13, 0x0

    .line 14
    .local v13, "offset":J
    new-instance v0, Le/e/a/CacheOutputStream;

    invoke-direct {v0, v5}, Le/e/a/CacheOutputStream;-><init>(Ljava/io/File;)V
    :try_end_e4
    .catch Ljava/lang/Exception; {:try_start_cf .. :try_end_e4} :catch_225
    .catchall {:try_start_cf .. :try_end_e4} :catchall_223

    move-object v15, v0

    .local v15, "out":Ljava/io/OutputStream;
    const/high16 v0, 0x10000

    :try_start_e7
    new-array v0, v0, [B

    move-object/from16 v16, v0

    .local v16, "buffer":[B
    invoke-interface {v11}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_ef
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_160

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Ljava/io/File;

    move-object/from16 v18, v17

    .local v18, "f":Ljava/io/File;
    move-wide/from16 v21, v13

    move-object/from16 v17, v0

    .local v21, "start":J
    new-instance v0, Le/e/a/CacheInputStream;

    move-object/from16 v1, v18

    .end local v18    # "f":Ljava/io/File;
    .local v1, "f":Ljava/io/File;
    invoke-direct {v0, v1}, Le/e/a/CacheInputStream;-><init>(Ljava/io/File;)V
    :try_end_108
    .catchall {:try_start_e7 .. :try_end_108} :catchall_210

    move-object/from16 v18, v0

    .local v18, "in":Ljava/io/InputStream;
    :goto_10a
    move-object/from16 v27, v1

    move-object/from16 v1, v16

    move-object/from16 v2, v18

    .end local v16    # "buffer":[B
    .end local v18    # "in":Ljava/io/InputStream;
    .local v1, "buffer":[B
    .local v2, "in":Ljava/io/InputStream;
    .local v27, "f":Ljava/io/File;
    :try_start_110
    invoke-virtual {v2, v1}, Ljava/io/InputStream;->read([B)I

    move-result v0
    :try_end_114
    .catchall {:try_start_110 .. :try_end_114} :catchall_151

    move/from16 v16, v0

    move-object/from16 v18, v2

    .end local v2    # "in":Ljava/io/InputStream;
    .local v16, "n":I
    .restart local v18    # "in":Ljava/io/InputStream;
    const/4 v2, -0x1

    if-eq v0, v2, :cond_12f

    move/from16 v0, v16

    const/4 v2, 0x0

    .end local v16    # "n":I
    .local v0, "n":I
    :try_start_11e
    invoke-virtual {v15, v1, v2, v0}, Ljava/io/OutputStream;->write([BII)V
    :try_end_121
    .catchall {:try_start_11e .. :try_end_121} :catchall_12a

    move-object/from16 v16, v1

    .end local v1    # "buffer":[B
    .local v16, "buffer":[B
    int-to-long v1, v0

    add-long/2addr v13, v1

    move-object/from16 v2, p1

    move-object/from16 v1, v27

    goto :goto_10a

    .end local v0    # "n":I
    .end local v16    # "buffer":[B
    .restart local v1    # "buffer":[B
    :catchall_12a
    move-exception v0

    move-object/from16 v16, v1

    move-object v1, v0

    .end local v1    # "buffer":[B
    .restart local v16    # "buffer":[B
    goto :goto_157

    .restart local v1    # "buffer":[B
    .local v16, "n":I
    :cond_12f
    move/from16 v0, v16

    move-object/from16 v16, v1

    .end local v1    # "buffer":[B
    .local v16, "buffer":[B
    :try_start_133
    invoke-virtual/range {v18 .. v18}, Ljava/io/InputStream;->close()V

    .end local v18    # "in":Ljava/io/InputStream;
    new-instance v19, Le/e/a/CachePackIndex$Entry;

    invoke-virtual/range {v27 .. v27}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v20

    sub-long v23, v13, v21

    invoke-virtual/range {v27 .. v27}, Ljava/io/File;->lastModified()J

    move-result-wide v25

    invoke-direct/range {v19 .. v26}, Le/e/a/CachePackIndex$Entry;-><init>(Ljava/lang/String;JJJ)V

    move-object/from16 v0, v19

    invoke-interface {v12, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_14a
    .catchall {:try_start_133 .. :try_end_14a} :catchall_210

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v0, v17

    goto :goto_ef

    .end local v16    # "buffer":[B
    .restart local v1    # "buffer":[B
    .restart local v2    # "in":Ljava/io/InputStream;
    :catchall_151
    move-exception v0

    move-object/from16 v18, v2

    move-object/from16 v16, v1

    move-object v1, v0

    .end local v1    # "buffer":[B
    .end local v2    # "in":Ljava/io/InputStream;
    .restart local v16    # "buffer":[B
    .restart local v18    # "in":Ljava/io/InputStream;
    :goto_157
    :try_start_157
    invoke-virtual/range {v18 .. v18}, Ljava/io/InputStream;->close()V
    :try_end_15a
    .catchall {:try_start_157 .. :try_end_15a} :catchall_15b

    goto :goto_15f

    :catchall_15b
    move-exception v0

    :try_start_15c
    invoke-virtual {v1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v4    # "root":Ljava/io/File;
    .end local v5    # "temp":Ljava/io/File;
    .end local v6    # "dest":Ljava/io/File;
    .end local v7    # "backup":Ljava/io/File;
    .end local v8    # "installed":Z
    .end local v9    # "backed":Z
    .end local v10    # "all":[Ljava/io/File;
    .end local v11    # "files":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    .end local v12    # "index":Ljava/util/List;, "Ljava/util/List<Le/e/a/CachePackIndex$Entry;>;"
    .end local v13    # "offset":J
    .end local v15    # "out":Ljava/io/OutputStream;
    .end local p0    # "folder":Ljava/lang/String;
    .end local p1    # "id":Ljava/lang/String;
    .end local p2    # "bytes":J
    :goto_15f
    throw v1

    .end local v18    # "in":Ljava/io/InputStream;
    .end local v21    # "start":J
    .end local v27    # "f":Ljava/io/File;
    .restart local v4    # "root":Ljava/io/File;
    .restart local v5    # "temp":Ljava/io/File;
    .restart local v6    # "dest":Ljava/io/File;
    .restart local v7    # "backup":Ljava/io/File;
    .restart local v8    # "installed":Z
    .restart local v9    # "backed":Z
    .restart local v10    # "all":[Ljava/io/File;
    .restart local v11    # "files":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    .restart local v12    # "index":Ljava/util/List;, "Ljava/util/List<Le/e/a/CachePackIndex$Entry;>;"
    .restart local v13    # "offset":J
    .restart local v15    # "out":Ljava/io/OutputStream;
    .restart local p0    # "folder":Ljava/lang/String;
    .restart local p1    # "id":Ljava/lang/String;
    .restart local p2    # "bytes":J
    :cond_160
    invoke-static {v15, v12}, Le/e/a/CachePackIndex;->finish(Ljava/io/OutputStream;Ljava/util/List;)V
    :try_end_163
    .catchall {:try_start_15c .. :try_end_163} :catchall_210

    .end local v16    # "buffer":[B
    :try_start_163
    invoke-virtual {v15}, Ljava/io/OutputStream;->close()V

    .line 16
    .end local v15    # "out":Ljava/io/OutputStream;
    const/4 v2, 0x0

    invoke-static {v5, v2, v2}, Le/e/a/CacheFolders;->open(Ljava/io/File;ZZ)Landroid/os/ParcelFileDescriptor;

    move-result-object v0
    :try_end_16b
    .catch Ljava/lang/Exception; {:try_start_163 .. :try_end_16b} :catch_225
    .catchall {:try_start_163 .. :try_end_16b} :catchall_223

    move-object v1, v0

    .local v1, "fd":Landroid/os/ParcelFileDescriptor;
    :try_start_16c
    new-instance v0, Ljava/io/FileInputStream;

    invoke-virtual {v1}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/io/FileInputStream;-><init>(Ljava/io/FileDescriptor;)V
    :try_end_175
    .catchall {:try_start_16c .. :try_end_175} :catchall_203

    move-object v2, v0

    .local v2, "in":Ljava/io/FileInputStream;
    :try_start_176
    invoke-virtual {v2}, Ljava/io/FileInputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v0

    invoke-static {v0}, Le/e/a/CachePackIndex;->read(Ljava/nio/channels/FileChannel;)Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    invoke-interface {v11}, Ljava/util/List;->size()I

    move-result v15
    :try_end_186
    .catchall {:try_start_176 .. :try_end_186} :catchall_1f8

    if-ne v0, v15, :cond_1f0

    :try_start_188
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V
    :try_end_18b
    .catchall {:try_start_188 .. :try_end_18b} :catchall_203

    .end local v2    # "in":Ljava/io/FileInputStream;
    if-eqz v1, :cond_190

    :try_start_18d
    invoke-virtual {v1}, Landroid/os/ParcelFileDescriptor;->close()V

    .line 17
    .end local v1    # "fd":Landroid/os/ParcelFileDescriptor;
    :cond_190
    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_1b4

    invoke-virtual {v7}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_1ac

    invoke-virtual {v6, v7}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v0

    if-eqz v0, :cond_1a4

    const/4 v9, 0x1

    goto :goto_1b4

    :cond_1a4
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Cannot back up old cache"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .end local v4    # "root":Ljava/io/File;
    .end local v5    # "temp":Ljava/io/File;
    .end local v6    # "dest":Ljava/io/File;
    .end local v7    # "backup":Ljava/io/File;
    .end local v8    # "installed":Z
    .end local v9    # "backed":Z
    .end local p0    # "folder":Ljava/lang/String;
    .end local p1    # "id":Ljava/lang/String;
    .end local p2    # "bytes":J
    :goto_1ab
    throw v0

    .restart local v4    # "root":Ljava/io/File;
    .restart local v5    # "temp":Ljava/io/File;
    .restart local v6    # "dest":Ljava/io/File;
    .restart local v7    # "backup":Ljava/io/File;
    .restart local v8    # "installed":Z
    .restart local v9    # "backed":Z
    .restart local p0    # "folder":Ljava/lang/String;
    .restart local p1    # "id":Ljava/lang/String;
    .restart local p2    # "bytes":J
    :cond_1ac
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Previous cache backup still present"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto :goto_1ab

    .line 18
    :cond_1b4
    :goto_1b4
    invoke-virtual {v5, v6}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v0

    if-eqz v0, :cond_1e8

    const/4 v8, 0x1

    invoke-static {v6}, Le/e/a/CachePack;->invalidate(Ljava/io/File;)V

    invoke-static/range {p0 .. p1}, Le/e/a/CacheFolders;->exportComments(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v11}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1c5
    :goto_1c5
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1dd

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/io/File;

    .local v1, "f":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    move-result v2

    if-nez v2, :cond_1c5

    const-string v2, "A loose cache resource was retained"

    invoke-static {v3, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1c5

    .end local v1    # "f":Ljava/io/File;
    :cond_1dd
    if-eqz v9, :cond_1e2

    invoke-virtual {v7}, Ljava/io/File;->delete()Z
    :try_end_1e2
    .catch Ljava/lang/Exception; {:try_start_18d .. :try_end_1e2} :catch_225
    .catchall {:try_start_18d .. :try_end_1e2} :catchall_223

    .line 20
    .end local v10    # "all":[Ljava/io/File;
    .end local v11    # "files":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    .end local v12    # "index":Ljava/util/List;, "Ljava/util/List<Le/e/a/CachePackIndex$Entry;>;"
    .end local v13    # "offset":J
    :cond_1e2
    if-nez v8, :cond_235

    :goto_1e4
    invoke-virtual {v5}, Ljava/io/File;->delete()Z

    goto :goto_235

    .line 18
    .restart local v10    # "all":[Ljava/io/File;
    .restart local v11    # "files":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    .restart local v12    # "index":Ljava/util/List;, "Ljava/util/List<Le/e/a/CachePackIndex$Entry;>;"
    .restart local v13    # "offset":J
    :cond_1e8
    :try_start_1e8
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Cannot finalize cache container"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .end local v4    # "root":Ljava/io/File;
    .end local v5    # "temp":Ljava/io/File;
    .end local v6    # "dest":Ljava/io/File;
    .end local v7    # "backup":Ljava/io/File;
    .end local v8    # "installed":Z
    .end local v9    # "backed":Z
    .end local p0    # "folder":Ljava/lang/String;
    .end local p1    # "id":Ljava/lang/String;
    .end local p2    # "bytes":J
    throw v0
    :try_end_1f0
    .catch Ljava/lang/Exception; {:try_start_1e8 .. :try_end_1f0} :catch_225
    .catchall {:try_start_1e8 .. :try_end_1f0} :catchall_223

    .line 16
    .local v1, "fd":Landroid/os/ParcelFileDescriptor;
    .restart local v2    # "in":Ljava/io/FileInputStream;
    .restart local v4    # "root":Ljava/io/File;
    .restart local v5    # "temp":Ljava/io/File;
    .restart local v6    # "dest":Ljava/io/File;
    .restart local v7    # "backup":Ljava/io/File;
    .restart local v8    # "installed":Z
    .restart local v9    # "backed":Z
    .restart local p0    # "folder":Ljava/lang/String;
    .restart local p1    # "id":Ljava/lang/String;
    .restart local p2    # "bytes":J
    :cond_1f0
    :try_start_1f0
    new-instance v0, Ljava/io/IOException;

    const-string v15, "Incomplete cache container"

    invoke-direct {v0, v15}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .end local v1    # "fd":Landroid/os/ParcelFileDescriptor;
    .end local v2    # "in":Ljava/io/FileInputStream;
    .end local v4    # "root":Ljava/io/File;
    .end local v5    # "temp":Ljava/io/File;
    .end local v6    # "dest":Ljava/io/File;
    .end local v7    # "backup":Ljava/io/File;
    .end local v8    # "installed":Z
    .end local v9    # "backed":Z
    .end local v10    # "all":[Ljava/io/File;
    .end local v11    # "files":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    .end local v12    # "index":Ljava/util/List;, "Ljava/util/List<Le/e/a/CachePackIndex$Entry;>;"
    .end local v13    # "offset":J
    .end local p0    # "folder":Ljava/lang/String;
    .end local p1    # "id":Ljava/lang/String;
    .end local p2    # "bytes":J
    throw v0
    :try_end_1f8
    .catchall {:try_start_1f0 .. :try_end_1f8} :catchall_1f8

    .restart local v1    # "fd":Landroid/os/ParcelFileDescriptor;
    .restart local v2    # "in":Ljava/io/FileInputStream;
    .restart local v4    # "root":Ljava/io/File;
    .restart local v5    # "temp":Ljava/io/File;
    .restart local v6    # "dest":Ljava/io/File;
    .restart local v7    # "backup":Ljava/io/File;
    .restart local v8    # "installed":Z
    .restart local v9    # "backed":Z
    .restart local v10    # "all":[Ljava/io/File;
    .restart local v11    # "files":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    .restart local v12    # "index":Ljava/util/List;, "Ljava/util/List<Le/e/a/CachePackIndex$Entry;>;"
    .restart local v13    # "offset":J
    .restart local p0    # "folder":Ljava/lang/String;
    .restart local p1    # "id":Ljava/lang/String;
    .restart local p2    # "bytes":J
    :catchall_1f8
    move-exception v0

    move-object v15, v0

    :try_start_1fa
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V
    :try_end_1fd
    .catchall {:try_start_1fa .. :try_end_1fd} :catchall_1fe

    goto :goto_202

    :catchall_1fe
    move-exception v0

    :try_start_1ff
    invoke-virtual {v15, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v1    # "fd":Landroid/os/ParcelFileDescriptor;
    .end local v4    # "root":Ljava/io/File;
    .end local v5    # "temp":Ljava/io/File;
    .end local v6    # "dest":Ljava/io/File;
    .end local v7    # "backup":Ljava/io/File;
    .end local v8    # "installed":Z
    .end local v9    # "backed":Z
    .end local v10    # "all":[Ljava/io/File;
    .end local v11    # "files":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    .end local v12    # "index":Ljava/util/List;, "Ljava/util/List<Le/e/a/CachePackIndex$Entry;>;"
    .end local v13    # "offset":J
    .end local p0    # "folder":Ljava/lang/String;
    .end local p1    # "id":Ljava/lang/String;
    .end local p2    # "bytes":J
    :goto_202
    throw v15
    :try_end_203
    .catchall {:try_start_1ff .. :try_end_203} :catchall_203

    .end local v2    # "in":Ljava/io/FileInputStream;
    .restart local v1    # "fd":Landroid/os/ParcelFileDescriptor;
    .restart local v4    # "root":Ljava/io/File;
    .restart local v5    # "temp":Ljava/io/File;
    .restart local v6    # "dest":Ljava/io/File;
    .restart local v7    # "backup":Ljava/io/File;
    .restart local v8    # "installed":Z
    .restart local v9    # "backed":Z
    .restart local v10    # "all":[Ljava/io/File;
    .restart local v11    # "files":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    .restart local v12    # "index":Ljava/util/List;, "Ljava/util/List<Le/e/a/CachePackIndex$Entry;>;"
    .restart local v13    # "offset":J
    .restart local p0    # "folder":Ljava/lang/String;
    .restart local p1    # "id":Ljava/lang/String;
    .restart local p2    # "bytes":J
    :catchall_203
    move-exception v0

    move-object v2, v0

    if-eqz v1, :cond_20f

    :try_start_207
    invoke-virtual {v1}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_20a
    .catchall {:try_start_207 .. :try_end_20a} :catchall_20b

    goto :goto_20f

    :catchall_20b
    move-exception v0

    :try_start_20c
    invoke-virtual {v2, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v4    # "root":Ljava/io/File;
    .end local v5    # "temp":Ljava/io/File;
    .end local v6    # "dest":Ljava/io/File;
    .end local v7    # "backup":Ljava/io/File;
    .end local v8    # "installed":Z
    .end local v9    # "backed":Z
    .end local p0    # "folder":Ljava/lang/String;
    .end local p1    # "id":Ljava/lang/String;
    .end local p2    # "bytes":J
    :cond_20f
    :goto_20f
    throw v2
    :try_end_210
    .catch Ljava/lang/Exception; {:try_start_20c .. :try_end_210} :catch_225
    .catchall {:try_start_20c .. :try_end_210} :catchall_223

    .line 14
    .end local v1    # "fd":Landroid/os/ParcelFileDescriptor;
    .restart local v4    # "root":Ljava/io/File;
    .restart local v5    # "temp":Ljava/io/File;
    .restart local v6    # "dest":Ljava/io/File;
    .restart local v7    # "backup":Ljava/io/File;
    .restart local v8    # "installed":Z
    .restart local v9    # "backed":Z
    .restart local v15    # "out":Ljava/io/OutputStream;
    .restart local p0    # "folder":Ljava/lang/String;
    .restart local p1    # "id":Ljava/lang/String;
    .restart local p2    # "bytes":J
    :catchall_210
    move-exception v0

    move-object v1, v0

    :try_start_212
    invoke-virtual {v15}, Ljava/io/OutputStream;->close()V
    :try_end_215
    .catchall {:try_start_212 .. :try_end_215} :catchall_216

    goto :goto_21a

    :catchall_216
    move-exception v0

    :try_start_217
    invoke-virtual {v1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v4    # "root":Ljava/io/File;
    .end local v5    # "temp":Ljava/io/File;
    .end local v6    # "dest":Ljava/io/File;
    .end local v7    # "backup":Ljava/io/File;
    .end local v8    # "installed":Z
    .end local v9    # "backed":Z
    .end local p0    # "folder":Ljava/lang/String;
    .end local p1    # "id":Ljava/lang/String;
    .end local p2    # "bytes":J
    :goto_21a
    throw v1

    .line 13
    .end local v11    # "files":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    .end local v12    # "index":Ljava/util/List;, "Ljava/util/List<Le/e/a/CachePackIndex$Entry;>;"
    .end local v13    # "offset":J
    .end local v15    # "out":Ljava/io/OutputStream;
    .restart local v4    # "root":Ljava/io/File;
    .restart local v5    # "temp":Ljava/io/File;
    .restart local v6    # "dest":Ljava/io/File;
    .restart local v7    # "backup":Ljava/io/File;
    .restart local v8    # "installed":Z
    .restart local v9    # "backed":Z
    .restart local p0    # "folder":Ljava/lang/String;
    .restart local p1    # "id":Ljava/lang/String;
    .restart local p2    # "bytes":J
    :cond_21b
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Cannot list cache"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .end local v4    # "root":Ljava/io/File;
    .end local v5    # "temp":Ljava/io/File;
    .end local v6    # "dest":Ljava/io/File;
    .end local v7    # "backup":Ljava/io/File;
    .end local v8    # "installed":Z
    .end local v9    # "backed":Z
    .end local p0    # "folder":Ljava/lang/String;
    .end local p1    # "id":Ljava/lang/String;
    .end local p2    # "bytes":J
    throw v0
    :try_end_223
    .catch Ljava/lang/Exception; {:try_start_217 .. :try_end_223} :catch_225
    .catchall {:try_start_217 .. :try_end_223} :catchall_223

    .line 20
    .end local v10    # "all":[Ljava/io/File;
    .restart local v4    # "root":Ljava/io/File;
    .restart local v5    # "temp":Ljava/io/File;
    .restart local v6    # "dest":Ljava/io/File;
    .restart local v7    # "backup":Ljava/io/File;
    .restart local v8    # "installed":Z
    .restart local v9    # "backed":Z
    .restart local p0    # "folder":Ljava/lang/String;
    .restart local p1    # "id":Ljava/lang/String;
    .restart local p2    # "bytes":J
    :catchall_223
    move-exception v0

    goto :goto_236

    .line 19
    :catch_225
    move-exception v0

    .local v0, "e":Ljava/lang/Exception;
    :try_start_226
    const-string v1, "Cache consolidation failed; loose resources retained"

    invoke-static {v3, v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    if-nez v8, :cond_232

    if-eqz v9, :cond_232

    invoke-virtual {v7, v6}, Ljava/io/File;->renameTo(Ljava/io/File;)Z
    :try_end_232
    .catchall {:try_start_226 .. :try_end_232} :catchall_223

    .line 20
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_232
    if-nez v8, :cond_235

    goto :goto_1e4

    .line 21
    :cond_235
    :goto_235
    return-void

    .line 20
    :goto_236
    if-nez v8, :cond_23b

    invoke-virtual {v5}, Ljava/io/File;->delete()Z

    :cond_23b
    throw v0

    .line 11
    .end local v4    # "root":Ljava/io/File;
    .end local v5    # "temp":Ljava/io/File;
    .end local v6    # "dest":Ljava/io/File;
    .end local v7    # "backup":Ljava/io/File;
    .end local v8    # "installed":Z
    .end local v9    # "backed":Z
    :cond_23c
    :goto_23c
    return-void
.end method

.method static declared-synchronized entry(Ljava/io/File;)Le/e/a/CachePackIndex$Entry;
    .registers 12
    .param p0, "f"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-class v0, Le/e/a/CachePack;

    monitor-enter v0

    .line 9
    :try_start_3
    invoke-static {p0}, Le/e/a/CachePack;->archive(Ljava/io/File;)Ljava/io/File;

    move-result-object v1
    :try_end_7
    .catchall {:try_start_3 .. :try_end_7} :catchall_89

    .local v1, "a":Ljava/io/File;
    const/4 v2, 0x0

    if-nez v1, :cond_c

    monitor-exit v0

    return-object v2

    :cond_c
    :try_start_c
    invoke-static {v1}, Le/e/a/CacheFolders;->stat(Ljava/io/File;)Le/e/a/CacheFolders$Entry;

    move-result-object v3
    :try_end_10
    .catchall {:try_start_c .. :try_end_10} :catchall_89

    .local v3, "info":Le/e/a/CacheFolders$Entry;
    if-nez v3, :cond_14

    monitor-exit v0

    return-object v2

    :cond_14
    :try_start_14
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    .local v4, "path":Ljava/lang/String;
    sget-object v5, Le/e/a/CachePack;->indexes:Ljava/util/Map;

    invoke-interface {v5, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Le/e/a/CachePack$Index;

    .local v5, "index":Le/e/a/CachePack$Index;
    if-eqz v5, :cond_32

    iget-wide v6, v5, Le/e/a/CachePack$Index;->size:J

    iget-wide v8, v3, Le/e/a/CacheFolders$Entry;->size:J

    cmp-long v10, v6, v8

    if-nez v10, :cond_32

    iget-wide v6, v5, Le/e/a/CachePack$Index;->time:J

    iget-wide v8, v3, Le/e/a/CacheFolders$Entry;->time:J

    cmp-long v10, v6, v8

    if-eqz v10, :cond_65

    :cond_32
    new-instance v6, Le/e/a/CachePack$Index;

    invoke-direct {v6, v2}, Le/e/a/CachePack$Index;-><init>(Le/e/a/CachePack$1;)V

    move-object v5, v6

    iget-wide v6, v3, Le/e/a/CacheFolders$Entry;->size:J

    iput-wide v6, v5, Le/e/a/CachePack$Index;->size:J

    iget-wide v6, v3, Le/e/a/CacheFolders$Entry;->time:J

    iput-wide v6, v5, Le/e/a/CachePack$Index;->time:J

    const/4 v2, 0x0

    invoke-static {v1, v2, v2}, Le/e/a/CacheFolders;->open(Ljava/io/File;ZZ)Landroid/os/ParcelFileDescriptor;

    move-result-object v2
    :try_end_45
    .catchall {:try_start_14 .. :try_end_45} :catchall_89

    .local v2, "fd":Landroid/os/ParcelFileDescriptor;
    :try_start_45
    new-instance v6, Ljava/io/FileInputStream;

    invoke-virtual {v2}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/io/FileInputStream;-><init>(Ljava/io/FileDescriptor;)V
    :try_end_4e
    .catchall {:try_start_45 .. :try_end_4e} :catchall_7d

    .local v6, "stream":Ljava/io/FileInputStream;
    :try_start_4e
    invoke-virtual {v6}, Ljava/io/FileInputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v7

    invoke-static {v7}, Le/e/a/CachePackIndex;->read(Ljava/nio/channels/FileChannel;)Ljava/util/Map;

    move-result-object v7

    iput-object v7, v5, Le/e/a/CachePack$Index;->entries:Ljava/util/Map;
    :try_end_58
    .catchall {:try_start_4e .. :try_end_58} :catchall_73

    :try_start_58
    invoke-virtual {v6}, Ljava/io/FileInputStream;->close()V
    :try_end_5b
    .catchall {:try_start_58 .. :try_end_5b} :catchall_7d

    .end local v6    # "stream":Ljava/io/FileInputStream;
    if-eqz v2, :cond_60

    :try_start_5d
    invoke-virtual {v2}, Landroid/os/ParcelFileDescriptor;->close()V

    .end local v2    # "fd":Landroid/os/ParcelFileDescriptor;
    :cond_60
    sget-object v2, Le/e/a/CachePack;->indexes:Ljava/util/Map;

    invoke-interface {v2, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_65
    iget-object v2, v5, Le/e/a/CachePack$Index;->entries:Ljava/util/Map;

    invoke-virtual {p0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v2, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Le/e/a/CachePackIndex$Entry;
    :try_end_71
    .catchall {:try_start_5d .. :try_end_71} :catchall_89

    monitor-exit v0

    return-object v2

    .restart local v2    # "fd":Landroid/os/ParcelFileDescriptor;
    .restart local v6    # "stream":Ljava/io/FileInputStream;
    :catchall_73
    move-exception v7

    :try_start_74
    invoke-virtual {v6}, Ljava/io/FileInputStream;->close()V
    :try_end_77
    .catchall {:try_start_74 .. :try_end_77} :catchall_78

    goto :goto_7c

    :catchall_78
    move-exception v8

    :try_start_79
    invoke-virtual {v7, v8}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v1    # "a":Ljava/io/File;
    .end local v2    # "fd":Landroid/os/ParcelFileDescriptor;
    .end local v3    # "info":Le/e/a/CacheFolders$Entry;
    .end local v4    # "path":Ljava/lang/String;
    .end local v5    # "index":Le/e/a/CachePack$Index;
    .end local p0    # "f":Ljava/io/File;
    :goto_7c
    throw v7
    :try_end_7d
    .catchall {:try_start_79 .. :try_end_7d} :catchall_7d

    .end local v6    # "stream":Ljava/io/FileInputStream;
    .restart local v1    # "a":Ljava/io/File;
    .restart local v2    # "fd":Landroid/os/ParcelFileDescriptor;
    .restart local v3    # "info":Le/e/a/CacheFolders$Entry;
    .restart local v4    # "path":Ljava/lang/String;
    .restart local v5    # "index":Le/e/a/CachePack$Index;
    .restart local p0    # "f":Ljava/io/File;
    :catchall_7d
    move-exception v6

    if-eqz v2, :cond_88

    :try_start_80
    invoke-virtual {v2}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_83
    .catchall {:try_start_80 .. :try_end_83} :catchall_84

    goto :goto_88

    :catchall_84
    move-exception v7

    :try_start_85
    invoke-virtual {v6, v7}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_88
    :goto_88
    throw v6

    .line 9
    .end local v1    # "a":Ljava/io/File;
    .end local v2    # "fd":Landroid/os/ParcelFileDescriptor;
    .end local v3    # "info":Le/e/a/CacheFolders$Entry;
    .end local v4    # "path":Ljava/lang/String;
    .end local v5    # "index":Le/e/a/CachePack$Index;
    .end local p0    # "f":Ljava/io/File;
    :catchall_89
    move-exception p0

    monitor-exit v0
    :try_end_8b
    .catchall {:try_start_85 .. :try_end_8b} :catchall_89

    throw p0
.end method

.method static declared-synchronized invalidate(Ljava/io/File;)V
    .registers 4
    .param p0, "archive"    # Ljava/io/File;

    const-class v0, Le/e/a/CachePack;

    monitor-enter v0

    .line 10
    :try_start_3
    sget-object v1, Le/e/a/CachePack;->indexes:Ljava/util/Map;

    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_e

    monitor-exit v0

    return-void

    .line 10
    .end local p0    # "archive":Ljava/io/File;
    :catchall_e
    move-exception p0

    :try_start_f
    monitor-exit v0
    :try_end_10
    .catchall {:try_start_f .. :try_end_10} :catchall_e

    throw p0
.end method

.method static synthetic lambda$completed$0(Ljava/io/File;Ljava/io/File;)I
    .registers 4
    .param p0, "a"    # Ljava/io/File;
    .param p1, "b"    # Ljava/io/File;

    .line 13
    invoke-virtual {p0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    return v0
.end method
