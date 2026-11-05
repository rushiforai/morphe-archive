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
    .registers 6

    .line 8
    sget-object v0, Le/e/a/CachePack;->ID:Ljava/util/regex/Pattern;

    invoke-virtual {p0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

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

    move-result-object p0

    new-instance v3, Ljava/lang/StringBuilder;

    const/4 v4, 0x1

    invoke-virtual {v0, v4}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, p0, v0}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3d

    :cond_3c
    const/4 v1, 0x0

    :goto_3d
    return-object v1
.end method

.method public static completed(Ljava/lang/String;Ljava/lang/String;J)V
    .registers 28

    .line 11
    move-object/from16 v0, p0

    const-string v1, "nicoid-cache"

    const-wide/16 v2, 0x0

    cmp-long v4, p2, v2

    if-lez v4, :cond_21e

    new-instance v4, Ljava/io/File;

    invoke-direct {v4, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v4}, Le/e/a/CacheFolders;->virtual(Ljava/io/File;)Z

    move-result v4

    if-nez v4, :cond_17

    goto/16 :goto_21e

    :cond_17
    new-instance v4, Le/e/a/CacheFile;

    invoke-direct {v4, v0}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;)V

    new-instance v5, Le/e/a/CacheFile;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-static/range {p1 .. p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v7, ".ncache.part"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v4, v6}, Le/e/a/CacheFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    new-instance v6, Le/e/a/CacheFile;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-static/range {p1 .. p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v8, ".ncache"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v4, v7}, Le/e/a/CacheFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    new-instance v7, Le/e/a/CacheFile;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-static/range {p1 .. p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v9, ".ncache.backup"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v4, v8}, Le/e/a/CacheFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 13
    const/4 v8, 0x0

    :try_start_65
    invoke-virtual {v4}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v4

    if-eqz v4, :cond_1fa

    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    array-length v10, v4

    const/4 v11, 0x0

    :goto_72
    if-lt v11, v10, :cond_1b7

    invoke-interface {v9}, Ljava/util/List;->isEmpty()Z

    move-result v4
    :try_end_78
    .catch Ljava/lang/Exception; {:try_start_65 .. :try_end_78} :catch_204
    .catchall {:try_start_65 .. :try_end_78} :catchall_202

    if-eqz v4, :cond_7e

    .line 20
    invoke-virtual {v5}, Ljava/io/File;->delete()Z

    .line 13
    return-void

    :cond_7e
    :try_start_7e
    new-instance v4, Le/e/a/CachePack$$ExternalSyntheticLambda0;

    invoke-direct {v4}, Le/e/a/CachePack$$ExternalSyntheticLambda0;-><init>()V

    invoke-static {v9, v4}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V
    :try_end_8b
    .catch Ljava/lang/Exception; {:try_start_7e .. :try_end_8b} :catch_204
    .catchall {:try_start_7e .. :try_end_8b} :catchall_202

    .line 14
    const/4 v10, 0x0

    :try_start_8c
    new-instance v11, Le/e/a/CacheOutputStream;

    invoke-direct {v11, v5}, Le/e/a/CacheOutputStream;-><init>(Ljava/io/File;)V
    :try_end_91
    .catchall {:try_start_8c .. :try_end_91} :catchall_1ac

    const/high16 v12, 0x10000

    :try_start_93
    new-array v12, v12, [B

    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v13

    move-wide/from16 v16, v2

    :goto_9b
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_160

    invoke-static {v11, v4}, Le/e/a/CachePackIndex;->finish(Ljava/io/OutputStream;Ljava/util/List;)V
    :try_end_a4
    .catchall {:try_start_93 .. :try_end_a4} :catchall_1a6

    :try_start_a4
    invoke-virtual {v11}, Ljava/io/OutputStream;->close()V
    :try_end_a7
    .catchall {:try_start_a4 .. :try_end_a7} :catchall_1ac

    .line 16
    :try_start_a7
    invoke-static {v5, v8, v8}, Le/e/a/CacheFolders;->open(Ljava/io/File;ZZ)Landroid/os/ParcelFileDescriptor;

    move-result-object v2
    :try_end_ab
    .catchall {:try_start_a7 .. :try_end_ab} :catchall_155

    :try_start_ab
    new-instance v3, Ljava/io/FileInputStream;

    invoke-virtual {v2}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/FileInputStream;-><init>(Ljava/io/FileDescriptor;)V
    :try_end_b4
    .catchall {:try_start_ab .. :try_end_b4} :catchall_145

    :try_start_b4
    invoke-virtual {v3}, Ljava/io/FileInputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v4

    invoke-static {v4}, Le/e/a/CachePackIndex;->read(Ljava/nio/channels/FileChannel;)Ljava/util/Map;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Map;->size()I

    move-result v4

    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v11
    :try_end_c4
    .catchall {:try_start_b4 .. :try_end_c4} :catchall_13f

    if-ne v4, v11, :cond_137

    :try_start_c6
    invoke-virtual {v3}, Ljava/io/FileInputStream;->close()V
    :try_end_c9
    .catchall {:try_start_c6 .. :try_end_c9} :catchall_145

    if-eqz v2, :cond_ce

    :try_start_cb
    invoke-virtual {v2}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_ce
    .catchall {:try_start_cb .. :try_end_ce} :catchall_155

    .line 17
    :cond_ce
    :try_start_ce
    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :cond_f3

    invoke-virtual {v7}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_eb

    invoke-virtual {v6, v7}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v2

    if-eqz v2, :cond_e3

    const/4 v2, 0x1

    goto :goto_f4

    :cond_e3
    new-instance v0, Ljava/io/IOException;

    const-string v2, "Cannot back up old cache"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :goto_ea
    throw v0

    :cond_eb
    new-instance v0, Ljava/io/IOException;

    const-string v2, "Previous cache backup still present"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
    :try_end_f2
    .catch Ljava/lang/Exception; {:try_start_ce .. :try_end_f2} :catch_204
    .catchall {:try_start_ce .. :try_end_f2} :catchall_202

    goto :goto_ea

    :cond_f3
    const/4 v2, 0x0

    .line 18
    :goto_f4
    :try_start_f4
    invoke-virtual {v5, v6}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v4
    :try_end_f8
    .catch Ljava/lang/Exception; {:try_start_f4 .. :try_end_f8} :catch_134
    .catchall {:try_start_f4 .. :try_end_f8} :catchall_202

    if-eqz v4, :cond_12c

    :try_start_fa
    invoke-static {v6}, Le/e/a/CachePack;->invalidate(Ljava/io/File;)V

    invoke-static/range {p0 .. p1}, Le/e/a/CacheFolders;->exportComments(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_104
    :goto_104
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_112

    if-eqz v2, :cond_110

    invoke-virtual {v7}, Ljava/io/File;->delete()Z

    .line 19
    nop

    .line 20
    :cond_110
    goto/16 :goto_217

    .line 18
    :cond_112
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/io/File;

    invoke-virtual {v4}, Ljava/io/File;->delete()Z

    move-result v4

    if-nez v4, :cond_104

    const-string v4, "A loose cache resource was retained"

    invoke-static {v1, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_123
    .catch Ljava/lang/Exception; {:try_start_fa .. :try_end_123} :catch_128
    .catchall {:try_start_fa .. :try_end_123} :catchall_124

    goto :goto_104

    .line 20
    :catchall_124
    move-exception v0

    const/4 v8, 0x1

    goto/16 :goto_218

    .line 19
    :catch_128
    move-exception v0

    const/4 v8, 0x1

    goto/16 :goto_206

    .line 18
    :cond_12c
    :try_start_12c
    new-instance v0, Ljava/io/IOException;

    const-string v3, "Cannot finalize cache container"

    invoke-direct {v0, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_134
    .catch Ljava/lang/Exception; {:try_start_12c .. :try_end_134} :catch_134
    .catchall {:try_start_12c .. :try_end_134} :catchall_202

    .line 19
    :catch_134
    move-exception v0

    goto/16 :goto_206

    .line 16
    :cond_137
    :try_start_137
    new-instance v0, Ljava/io/IOException;

    const-string v4, "Incomplete cache container"

    invoke-direct {v0, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_13f
    .catchall {:try_start_137 .. :try_end_13f} :catchall_13f

    :catchall_13f
    move-exception v0

    move-object v10, v0

    :try_start_141
    invoke-virtual {v3}, Ljava/io/FileInputStream;->close()V

    throw v10
    :try_end_145
    .catchall {:try_start_141 .. :try_end_145} :catchall_145

    :catchall_145
    move-exception v0

    if-nez v10, :cond_14a

    move-object v10, v0

    goto :goto_14f

    :cond_14a
    if-eq v10, v0, :cond_14f

    :try_start_14c
    invoke-virtual {v10, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_14f
    :goto_14f
    if-eqz v2, :cond_154

    invoke-virtual {v2}, Landroid/os/ParcelFileDescriptor;->close()V

    :cond_154
    throw v10
    :try_end_155
    .catchall {:try_start_14c .. :try_end_155} :catchall_155

    :catchall_155
    move-exception v0

    if-eqz v10, :cond_15e

    if-eq v10, v0, :cond_15f

    :try_start_15a
    invoke-virtual {v10, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_15f

    :cond_15e
    move-object v10, v0

    :cond_15f
    :goto_15f
    throw v10
    :try_end_160
    .catch Ljava/lang/Exception; {:try_start_15a .. :try_end_160} :catch_204
    .catchall {:try_start_15a .. :try_end_160} :catchall_202

    .line 14
    :cond_160
    :try_start_160
    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/io/File;
    :try_end_166
    .catchall {:try_start_160 .. :try_end_166} :catchall_1a6

    :try_start_166
    new-instance v3, Le/e/a/CacheInputStream;

    invoke-direct {v3, v2}, Le/e/a/CacheInputStream;-><init>(Ljava/io/File;)V
    :try_end_16b
    .catchall {:try_start_166 .. :try_end_16b} :catchall_19b

    move-wide/from16 v22, v16

    :goto_16d
    :try_start_16d
    invoke-virtual {v3, v12}, Ljava/io/InputStream;->read([B)I

    move-result v14
    :try_end_171
    .catchall {:try_start_16d .. :try_end_171} :catchall_195

    const/4 v15, -0x1

    if-ne v14, v15, :cond_18e

    :try_start_174
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_177
    .catchall {:try_start_174 .. :try_end_177} :catchall_19b

    :try_start_177
    new-instance v3, Le/e/a/CachePackIndex$Entry;

    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v15

    sub-long v18, v22, v16

    invoke-virtual {v2}, Ljava/io/File;->lastModified()J

    move-result-wide v20

    move-object v14, v3

    invoke-direct/range {v14 .. v21}, Le/e/a/CachePackIndex$Entry;-><init>(Ljava/lang/String;JJJ)V

    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_18a
    .catchall {:try_start_177 .. :try_end_18a} :catchall_1a6

    move-wide/from16 v16, v22

    goto/16 :goto_9b

    :cond_18e
    :try_start_18e
    invoke-virtual {v11, v12, v8, v14}, Ljava/io/OutputStream;->write([BII)V
    :try_end_191
    .catchall {:try_start_18e .. :try_end_191} :catchall_195

    int-to-long v14, v14

    add-long v22, v22, v14

    goto :goto_16d

    :catchall_195
    move-exception v0

    move-object v10, v0

    :try_start_197
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V

    throw v10
    :try_end_19b
    .catchall {:try_start_197 .. :try_end_19b} :catchall_19b

    :catchall_19b
    move-exception v0

    if-eqz v10, :cond_1a4

    if-eq v10, v0, :cond_1a5

    :try_start_1a0
    invoke-virtual {v10, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_1a5

    :cond_1a4
    move-object v10, v0

    :cond_1a5
    :goto_1a5
    throw v10
    :try_end_1a6
    .catchall {:try_start_1a0 .. :try_end_1a6} :catchall_1a6

    :catchall_1a6
    move-exception v0

    move-object v10, v0

    :try_start_1a8
    invoke-virtual {v11}, Ljava/io/OutputStream;->close()V

    throw v10
    :try_end_1ac
    .catchall {:try_start_1a8 .. :try_end_1ac} :catchall_1ac

    :catchall_1ac
    move-exception v0

    if-eqz v10, :cond_1b5

    if-eq v10, v0, :cond_1b6

    :try_start_1b1
    invoke-virtual {v10, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_1b6

    :cond_1b5
    move-object v10, v0

    :cond_1b6
    :goto_1b6
    throw v10

    .line 13
    :cond_1b7
    aget-object v12, v4, v11

    invoke-virtual {v12}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v13

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-static/range {p1 .. p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v15, ".m3u8"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_1f3

    invoke-virtual {v12}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v13

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-static/range {p1 .. p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v15, "_asset_"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_1f6

    :cond_1f3
    invoke-interface {v9, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_1f6
    add-int/lit8 v11, v11, 0x1

    goto/16 :goto_72

    :cond_1fa
    new-instance v0, Ljava/io/IOException;

    const-string v2, "Cannot list cache"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_202
    .catch Ljava/lang/Exception; {:try_start_1b1 .. :try_end_202} :catch_204
    .catchall {:try_start_1b1 .. :try_end_202} :catchall_202

    .line 20
    :catchall_202
    move-exception v0

    goto :goto_218

    .line 19
    :catch_204
    move-exception v0

    const/4 v2, 0x0

    :goto_206
    :try_start_206
    const-string v3, "Cache consolidation failed; loose resources retained"

    invoke-static {v1, v3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    if-nez v8, :cond_212

    if-eqz v2, :cond_212

    invoke-virtual {v7, v6}, Ljava/io/File;->renameTo(Ljava/io/File;)Z
    :try_end_212
    .catchall {:try_start_206 .. :try_end_212} :catchall_202

    .line 20
    :cond_212
    if-nez v8, :cond_217

    invoke-virtual {v5}, Ljava/io/File;->delete()Z

    .line 21
    :cond_217
    :goto_217
    return-void

    .line 20
    :goto_218
    if-nez v8, :cond_21d

    invoke-virtual {v5}, Ljava/io/File;->delete()Z

    :cond_21d
    throw v0

    .line 11
    :cond_21e
    :goto_21e
    return-void
.end method

.method static declared-synchronized entry(Ljava/io/File;)Le/e/a/CachePackIndex$Entry;
    .registers 12
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
    .catchall {:try_start_3 .. :try_end_7} :catchall_b0

    const/4 v2, 0x0

    if-nez v1, :cond_c

    :goto_a
    monitor-exit v0

    return-object v2

    :cond_c
    :try_start_c
    invoke-static {v1}, Le/e/a/CacheFolders;->virtual(Ljava/io/File;)Z

    move-result v3

    if-eqz v3, :cond_17

    invoke-static {v1}, Le/e/a/CacheFolders;->stat(Ljava/io/File;)Le/e/a/CacheFolders$Entry;

    move-result-object v3

    goto :goto_2f

    :cond_17
    invoke-virtual {v1}, Ljava/io/File;->isFile()Z

    move-result v3

    if-nez v3, :cond_1e

    goto :goto_a

    :cond_1e
    new-instance v3, Le/e/a/CacheFolders$Entry;

    invoke-direct {v3}, Le/e/a/CacheFolders$Entry;-><init>()V

    invoke-virtual {v1}, Ljava/io/File;->length()J

    move-result-wide v4

    iput-wide v4, v3, Le/e/a/CacheFolders$Entry;->size:J

    invoke-virtual {v1}, Ljava/io/File;->lastModified()J

    move-result-wide v4

    iput-wide v4, v3, Le/e/a/CacheFolders$Entry;->time:J

    :goto_2f
    if-nez v3, :cond_32

    goto :goto_a

    :cond_32
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    sget-object v5, Le/e/a/CachePack;->indexes:Ljava/util/Map;

    invoke-interface {v5, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Le/e/a/CachePack$Index;

    if-eqz v5, :cond_50

    iget-wide v6, v5, Le/e/a/CachePack$Index;->size:J

    iget-wide v8, v3, Le/e/a/CacheFolders$Entry;->size:J

    cmp-long v10, v6, v8

    if-nez v10, :cond_50

    iget-wide v6, v5, Le/e/a/CachePack$Index;->time:J

    iget-wide v8, v3, Le/e/a/CacheFolders$Entry;->time:J

    cmp-long v10, v6, v8

    if-eqz v10, :cond_82

    :cond_50
    new-instance v5, Le/e/a/CachePack$Index;

    invoke-direct {v5, v2}, Le/e/a/CachePack$Index;-><init>(Le/e/a/CachePack$Index;)V

    iget-wide v6, v3, Le/e/a/CacheFolders$Entry;->size:J

    iput-wide v6, v5, Le/e/a/CachePack$Index;->size:J

    iget-wide v6, v3, Le/e/a/CacheFolders$Entry;->time:J

    iput-wide v6, v5, Le/e/a/CachePack$Index;->time:J
    :try_end_5d
    .catchall {:try_start_c .. :try_end_5d} :catchall_b0

    const/4 v3, 0x0

    :try_start_5e
    invoke-static {v1, v3, v3}, Le/e/a/CacheFolders;->open(Ljava/io/File;ZZ)Landroid/os/ParcelFileDescriptor;

    move-result-object v1
    :try_end_62
    .catchall {:try_start_5e .. :try_end_62} :catchall_a6

    :try_start_62
    new-instance v3, Ljava/io/FileInputStream;

    invoke-virtual {v1}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v6

    invoke-direct {v3, v6}, Ljava/io/FileInputStream;-><init>(Ljava/io/FileDescriptor;)V
    :try_end_6b
    .catchall {:try_start_62 .. :try_end_6b} :catchall_96

    :try_start_6b
    invoke-virtual {v3}, Ljava/io/FileInputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v6

    invoke-static {v6}, Le/e/a/CachePackIndex;->read(Ljava/nio/channels/FileChannel;)Ljava/util/Map;

    move-result-object v6

    iput-object v6, v5, Le/e/a/CachePack$Index;->entries:Ljava/util/Map;
    :try_end_75
    .catchall {:try_start_6b .. :try_end_75} :catchall_90

    :try_start_75
    invoke-virtual {v3}, Ljava/io/FileInputStream;->close()V
    :try_end_78
    .catchall {:try_start_75 .. :try_end_78} :catchall_96

    if-eqz v1, :cond_7d

    :try_start_7a
    invoke-virtual {v1}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_7d
    .catchall {:try_start_7a .. :try_end_7d} :catchall_a6

    :cond_7d
    :try_start_7d
    sget-object v1, Le/e/a/CachePack;->indexes:Ljava/util/Map;

    invoke-interface {v1, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_82
    iget-object v1, v5, Le/e/a/CachePack$Index;->entries:Ljava/util/Map;

    invoke-virtual {p0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object p0

    invoke-interface {v1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le/e/a/CachePackIndex$Entry;
    :try_end_8e
    .catchall {:try_start_7d .. :try_end_8e} :catchall_b0

    monitor-exit v0

    return-object p0

    :catchall_90
    move-exception p0

    move-object v2, p0

    :try_start_92
    invoke-virtual {v3}, Ljava/io/FileInputStream;->close()V

    throw v2
    :try_end_96
    .catchall {:try_start_92 .. :try_end_96} :catchall_96

    :catchall_96
    move-exception p0

    if-nez v2, :cond_9b

    move-object v2, p0

    goto :goto_a0

    :cond_9b
    if-eq v2, p0, :cond_a0

    :try_start_9d
    invoke-virtual {v2, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_a0
    :goto_a0
    if-eqz v1, :cond_a5

    invoke-virtual {v1}, Landroid/os/ParcelFileDescriptor;->close()V

    :cond_a5
    throw v2
    :try_end_a6
    .catchall {:try_start_9d .. :try_end_a6} :catchall_a6

    :catchall_a6
    move-exception p0

    if-eqz v2, :cond_af

    if-eq v2, p0, :cond_ae

    :try_start_ab
    invoke-virtual {v2, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_ae
    move-object p0, v2

    :cond_af
    throw p0
    :try_end_b0
    .catchall {:try_start_ab .. :try_end_b0} :catchall_b0

    .line 9
    :catchall_b0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method static declared-synchronized invalidate(Ljava/io/File;)V
    .registers 3

    const-class v0, Le/e/a/CachePack;

    monitor-enter v0

    .line 10
    :try_start_3
    sget-object v1, Le/e/a/CachePack;->indexes:Ljava/util/Map;

    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p0

    invoke-interface {v1, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_e

    monitor-exit v0

    return-void

    .line 10
    :catchall_e
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method static synthetic lambda$0(Ljava/io/File;Ljava/io/File;)I
    .registers 2

    .line 13
    invoke-virtual {p0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result p0

    return p0
.end method
