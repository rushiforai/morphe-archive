.class public final Le/e/a/CacheComments;
.super Ljava/lang/Object;
.source "CacheComments.java"


# static fields
.field static final LIMIT:I = 0x200000

.field private static final LOCKS:[Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .line 6
    const/16 v0, 0x20

    new-array v0, v0, [Ljava/lang/Object;

    sput-object v0, Le/e/a/CacheComments;->LOCKS:[Ljava/lang/Object;

    .line 7
    const/4 v0, 0x0

    :goto_7
    sget-object v1, Le/e/a/CacheComments;->LOCKS:[Ljava/lang/Object;

    array-length v1, v1

    if-lt v0, v1, :cond_d

    return-void

    :cond_d
    sget-object v1, Le/e/a/CacheComments;->LOCKS:[Ljava/lang/Object;

    new-instance v2, Ljava/lang/Object;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    aput-object v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_7
.end method

.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static clean(Ljava/lang/String;[Ljava/io/File;)V
    .registers 12

    .line 37
    array-length v0, p1

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_3
    if-lt v2, v0, :cond_6

    .line 42
    return-void

    .line 37
    :cond_6
    aget-object v3, p1, v2

    invoke-virtual {v3}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v5, ".comments."

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_16

    :goto_14
    goto/16 :goto_c2

    :cond_16
    invoke-static {v4}, Le/e/a/CacheFolders;->videoId(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    if-nez v5, :cond_1d

    goto :goto_14

    :cond_1d
    invoke-static {p0, v5}, Le/e/a/CacheComments;->lock(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    monitor-enter v6

    .line 38
    :try_start_22
    invoke-static {p0, v5}, Le/e/a/CacheComments;->video(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_2e

    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    monitor-exit v6

    goto/16 :goto_c2

    .line 39
    :cond_2e
    const-string v7, ".partial"

    invoke-virtual {v4, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_4c

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-virtual {v3}, Ljava/io/File;->lastModified()J

    move-result-wide v7

    sub-long/2addr v4, v7

    const-wide/32 v7, 0x5265c00

    cmp-long v9, v4, v7

    if-lez v9, :cond_49

    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    :cond_49
    monitor-exit v6

    goto/16 :goto_c2

    .line 40
    :cond_4c
    const-string v7, ".comments.backup"

    invoke-virtual {v4, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v7

    const/4 v8, 0x1

    if-eqz v7, :cond_8e

    new-instance v4, Le/e/a/CacheFile;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v7, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, ".comments.gz"

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, p0, v5}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v4, v8}, Le/e/a/CacheComments;->readFile(Ljava/io/File;Z)Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_77

    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    goto :goto_8c

    :cond_77
    invoke-static {v3, v8}, Le/e/a/CacheComments;->readFile(Ljava/io/File;Z)Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_8c

    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_89

    invoke-virtual {v4}, Ljava/io/File;->delete()Z

    move-result v5

    if-eqz v5, :cond_8c

    :cond_89
    invoke-virtual {v3, v4}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    :cond_8c
    :goto_8c
    monitor-exit v6

    goto :goto_c2

    .line 41
    :cond_8e
    const-string v7, ".comments.json"

    invoke-virtual {v4, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_c1

    new-instance v4, Le/e/a/CacheFile;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v7, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v9, ".comments.gz"

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v4, p0, v7}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v4, v8}, Le/e/a/CacheComments;->readFile(Ljava/io/File;Z)Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_b8

    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    goto :goto_c1

    :cond_b8
    invoke-static {v3, v1}, Le/e/a/CacheComments;->readFile(Ljava/io/File;Z)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_c1

    invoke-static {p0, v5, v3}, Le/e/a/CacheComments;->save(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :cond_c1
    :goto_c1
    monitor-exit v6

    .line 37
    :goto_c2
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_3

    .line 41
    :catchall_c6
    move-exception p0

    monitor-exit v6
    :try_end_c8
    .catchall {:try_start_22 .. :try_end_c8} :catchall_c6

    throw p0
.end method

.method static copyable(Ljava/io/File;)Z
    .registers 6

    .line 36
    invoke-virtual {p0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, ".comments."

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v1, :cond_30

    invoke-static {v0}, Le/e/a/CacheFolders;->videoId(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2f

    const-string v4, ".comments.json"

    invoke-virtual {v0, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_24

    const-string v4, ".comments.gz"

    invoke-virtual {v0, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2f

    :cond_24
    invoke-virtual {p0}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, v1}, Le/e/a/CacheComments;->video(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_2f

    return v2

    :cond_2f
    return v3

    :cond_30
    const-string p0, ".copy-"

    invoke-virtual {v0, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_41

    const-string p0, ".partial"

    invoke-virtual {v0, p0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_41

    return v2

    :cond_41
    return v3
.end method

.method private static lock(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;
    .registers 4

    .line 8
    sget-object v0, Le/e/a/CacheComments;->LOCKS:[Ljava/lang/Object;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v1, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string p0, "/"

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result p0

    const p1, 0x7fffffff

    and-int/2addr p0, p1

    sget-object p1, Le/e/a/CacheComments;->LOCKS:[Ljava/lang/Object;

    array-length p1, p1

    rem-int/2addr p0, p1

    aget-object p0, v0, p0

    return-object p0
.end method

.method public static read(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 7

    .line 30
    invoke-static {p0, p1}, Le/e/a/CacheComments;->lock(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    .line 31
    :try_start_5
    new-instance v1, Le/e/a/CacheFile;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, ".comments.gz"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v2, 0x1

    invoke-static {v1, v2}, Le/e/a/CacheComments;->readFile(Ljava/io/File;Z)Ljava/lang/String;

    move-result-object v1

    .line 32
    if-nez v1, :cond_40

    new-instance v1, Le/e/a/CacheFile;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, ".comments.backup"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, p0, v3}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v1, v2}, Le/e/a/CacheComments;->readFile(Ljava/io/File;Z)Ljava/lang/String;

    move-result-object v1

    .line 33
    :cond_40
    if-eqz v1, :cond_43

    :goto_42
    goto :goto_61

    :cond_43
    new-instance v1, Le/e/a/CacheFile;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v2, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string p1, ".comments.json"

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p0, p1}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    invoke-static {v1, p0}, Le/e/a/CacheComments;->readFile(Ljava/io/File;Z)Ljava/lang/String;

    move-result-object v1

    goto :goto_42

    :goto_61
    monitor-exit v0

    return-object v1

    .line 30
    :catchall_63
    move-exception p0

    monitor-exit v0
    :try_end_65
    .catchall {:try_start_5 .. :try_end_65} :catchall_63

    throw p0
.end method

.method static readFile(Ljava/io/File;Z)Ljava/lang/String;
    .registers 8

    .line 35
    invoke-virtual {p0}, Ljava/io/File;->isFile()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_8

    return-object v1

    :cond_8
    :try_start_8
    new-instance v0, Le/e/a/CacheInputStream;

    invoke-direct {v0, p0}, Le/e/a/CacheInputStream;-><init>(Ljava/io/File;)V
    :try_end_d
    .catchall {:try_start_8 .. :try_end_d} :catchall_7e

    if-eqz p1, :cond_18

    :try_start_f
    new-instance p0, Ljava/util/zip/GZIPInputStream;

    invoke-direct {p0, v0}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_14
    .catchall {:try_start_f .. :try_end_14} :catchall_15

    goto :goto_19

    :catchall_15
    move-exception p0

    move-object v2, v1

    goto :goto_6b

    :cond_18
    move-object p0, v0

    :goto_19
    :try_start_19
    new-instance p1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {p1}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_1e
    .catchall {:try_start_19 .. :try_end_1e} :catchall_58

    const/16 v2, 0x1000

    :try_start_20
    new-array v2, v2, [B

    :goto_22
    invoke-virtual {p0, v2}, Ljava/io/InputStream;->read([B)I

    move-result v3

    const/4 v4, -0x1

    if-ne v3, v4, :cond_39

    const-string v2, "UTF-8"

    invoke-virtual {p1, v2}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2
    :try_end_2f
    .catchall {:try_start_20 .. :try_end_2f} :catchall_51

    :try_start_2f
    invoke-virtual {p1}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_32
    .catchall {:try_start_2f .. :try_end_32} :catchall_58

    :try_start_32
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_35
    .catchall {:try_start_32 .. :try_end_35} :catchall_15

    :try_start_35
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_38
    .catchall {:try_start_35 .. :try_end_38} :catchall_7e

    return-object v2

    :cond_39
    :try_start_39
    invoke-virtual {p1}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v4
    :try_end_3d
    .catchall {:try_start_39 .. :try_end_3d} :catchall_51

    add-int/2addr v4, v3

    const/high16 v5, 0x200000

    if-le v4, v5, :cond_4c

    :try_start_42
    invoke-virtual {p1}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_45
    .catchall {:try_start_42 .. :try_end_45} :catchall_58

    :try_start_45
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_48
    .catchall {:try_start_45 .. :try_end_48} :catchall_15

    :try_start_48
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_4b
    .catchall {:try_start_48 .. :try_end_4b} :catchall_7e

    return-object v1

    :cond_4c
    const/4 v4, 0x0

    :try_start_4d
    invoke-virtual {p1, v2, v4, v3}, Ljava/io/ByteArrayOutputStream;->write([BII)V
    :try_end_50
    .catchall {:try_start_4d .. :try_end_50} :catchall_51

    goto :goto_22

    :catchall_51
    move-exception v2

    :try_start_52
    invoke-virtual {p1}, Ljava/io/ByteArrayOutputStream;->close()V

    throw v2
    :try_end_56
    .catchall {:try_start_52 .. :try_end_56} :catchall_56

    :catchall_56
    move-exception p1

    goto :goto_5a

    :catchall_58
    move-exception p1

    move-object v2, v1

    :goto_5a
    if-eqz v2, :cond_65

    if-eq v2, p1, :cond_64

    :try_start_5e
    invoke-virtual {v2, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V
    :try_end_61
    .catchall {:try_start_5e .. :try_end_61} :catchall_62

    goto :goto_64

    :catchall_62
    move-exception p0

    goto :goto_6b

    :cond_64
    :goto_64
    move-object p1, v2

    :cond_65
    :try_start_65
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    throw p1
    :try_end_69
    .catchall {:try_start_65 .. :try_end_69} :catchall_69

    :catchall_69
    move-exception p0

    move-object v2, p1

    :goto_6b
    if-eqz v2, :cond_76

    if-eq v2, p0, :cond_75

    :try_start_6f
    invoke-virtual {v2, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V
    :try_end_72
    .catchall {:try_start_6f .. :try_end_72} :catchall_73

    goto :goto_75

    :catchall_73
    move-exception p0

    goto :goto_80

    :cond_75
    :goto_75
    move-object p0, v2

    :cond_76
    :try_start_76
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    throw p0
    :try_end_7a
    .catchall {:try_start_76 .. :try_end_7a} :catchall_7a

    :catchall_7a
    move-exception p1

    move-object v2, p0

    move-object p0, p1

    goto :goto_80

    :catchall_7e
    move-exception p0

    move-object v2, v1

    :goto_80
    if-eqz v2, :cond_88

    if-eq v2, p0, :cond_87

    :try_start_84
    invoke-virtual {v2, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_87
    move-object p0, v2

    :cond_88
    throw p0
    :try_end_89
    .catch Ljava/io/IOException; {:try_start_84 .. :try_end_89} :catch_8b
    .catch Ljava/lang/RuntimeException; {:try_start_84 .. :try_end_89} :catch_89

    :catch_89
    move-exception p0

    goto :goto_8c

    :catch_8b
    move-exception p0

    :goto_8c
    return-object v1
.end method

.method public static save(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 10

    .line 11
    if-eqz p2, :cond_13f

    const-string v0, "\"threads\""

    invoke-virtual {p2, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_c

    goto/16 :goto_13f

    .line 12
    :cond_c
    invoke-static {p0, p1}, Le/e/a/CacheComments;->lock(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    .line 13
    :try_start_11
    invoke-static {p0, p1}, Le/e/a/CacheComments;->video(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_19

    monitor-exit v0

    return-void

    .line 14
    :cond_19
    new-instance v1, Le/e/a/CacheFile;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, ".comments."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".partial"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v2, Le/e/a/CacheFile;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, ".comments.gz"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, p0, v3}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v3, Le/e/a/CacheFile;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, ".comments.backup"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, p0, v4}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_6f
    .catchall {:try_start_11 .. :try_end_6f} :catchall_13c

    .line 16
    :try_start_6f
    const-string v4, "UTF-8"

    invoke-virtual {p2, v4}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object p2

    array-length v4, p2
    :try_end_76
    .catch Ljava/io/IOException; {:try_start_6f .. :try_end_76} :catch_12b
    .catch Ljava/lang/RuntimeException; {:try_start_6f .. :try_end_76} :catch_129
    .catchall {:try_start_6f .. :try_end_76} :catchall_127

    const/high16 v5, 0x200000

    if-le v4, v5, :cond_7f

    .line 27
    :try_start_7a
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    .line 16
    monitor-exit v0
    :try_end_7e
    .catchall {:try_start_7a .. :try_end_7e} :catchall_13c

    return-void

    .line 17
    :cond_7f
    const/4 v4, 0x0

    :try_start_80
    new-instance v5, Ljava/util/zip/GZIPOutputStream;

    new-instance v6, Le/e/a/CacheOutputStream;

    invoke-direct {v6, v1}, Le/e/a/CacheOutputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v5, v6}, Ljava/util/zip/GZIPOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_8a
    .catchall {:try_start_80 .. :try_end_8a} :catchall_11d

    :try_start_8a
    invoke-virtual {v5, p2}, Ljava/io/OutputStream;->write([B)V
    :try_end_8d
    .catchall {:try_start_8a .. :try_end_8d} :catchall_118

    :try_start_8d
    invoke-virtual {v5}, Ljava/io/OutputStream;->close()V
    :try_end_90
    .catchall {:try_start_8d .. :try_end_90} :catchall_11d

    .line 19
    :try_start_90
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result p2

    const/4 v4, 0x1

    if-eqz p2, :cond_d0

    .line 20
    invoke-static {v2, v4}, Le/e/a/CacheComments;->readFile(Ljava/io/File;Z)Ljava/lang/String;

    move-result-object p2

    if-nez p2, :cond_c1

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result p2

    if-eqz p2, :cond_b2

    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    move-result p2

    if-eqz p2, :cond_aa

    goto :goto_b2

    :cond_aa
    new-instance p0, Ljava/io/IOException;

    const-string p1, "Cannot remove incomplete comments"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :goto_b1
    throw p0

    :cond_b2
    :goto_b2
    invoke-virtual {v3, v2}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result p2

    if-eqz p2, :cond_b9

    goto :goto_d0

    :cond_b9
    new-instance p0, Ljava/io/IOException;

    const-string p1, "Cannot restore comments"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto :goto_b1

    .line 21
    :cond_c1
    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    move-result p2

    if-eqz p2, :cond_c8

    goto :goto_d0

    :cond_c8
    new-instance p0, Ljava/io/IOException;

    const-string p1, "Cannot remove previous comment backup"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 23
    :cond_d0
    :goto_d0
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result p2

    if-eqz p2, :cond_e5

    invoke-virtual {v2, v3}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result p2

    if-eqz p2, :cond_dd

    goto :goto_e6

    :cond_dd
    new-instance p0, Ljava/io/IOException;

    const-string p1, "Cannot back up comments"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_e5
    const/4 v4, 0x0

    .line 24
    :goto_e6
    invoke-virtual {v1, v2}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result p2

    if-nez p2, :cond_f9

    if-eqz v4, :cond_f1

    invoke-virtual {v3, v2}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    :cond_f1
    new-instance p0, Ljava/io/IOException;

    const-string p1, "Cannot finalize comments"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 25
    :cond_f9
    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    new-instance p2, Le/e/a/CacheFile;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v2, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string p1, ".comments.json"

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p0, p1}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p2}, Le/e/a/CacheFile;->delete()Z
    :try_end_117
    .catch Ljava/io/IOException; {:try_start_90 .. :try_end_117} :catch_12b
    .catch Ljava/lang/RuntimeException; {:try_start_90 .. :try_end_117} :catch_129
    .catchall {:try_start_90 .. :try_end_117} :catchall_127

    .line 26
    goto :goto_133

    .line 17
    :catchall_118
    move-exception v4

    :try_start_119
    invoke-virtual {v5}, Ljava/io/OutputStream;->close()V

    throw v4
    :try_end_11d
    .catchall {:try_start_119 .. :try_end_11d} :catchall_11d

    :catchall_11d
    move-exception p0

    if-eqz v4, :cond_126

    if-eq v4, p0, :cond_125

    :try_start_122
    invoke-virtual {v4, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_125
    move-object p0, v4

    :cond_126
    throw p0
    :try_end_127
    .catch Ljava/io/IOException; {:try_start_122 .. :try_end_127} :catch_12b
    .catch Ljava/lang/RuntimeException; {:try_start_122 .. :try_end_127} :catch_129
    .catchall {:try_start_122 .. :try_end_127} :catchall_127

    .line 27
    :catchall_127
    move-exception p0

    goto :goto_138

    .line 26
    :catch_129
    move-exception p0

    goto :goto_12c

    :catch_12b
    move-exception p0

    :goto_12c
    :try_start_12c
    const-string p1, "nicoid-cache"

    const-string p2, "Cannot save comments"

    invoke-static {p1, p2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_133
    .catchall {:try_start_12c .. :try_end_133} :catchall_127

    .line 27
    :goto_133
    :try_start_133
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    .line 12
    monitor-exit v0

    .line 29
    return-void

    .line 27
    :goto_138
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    throw p0

    .line 12
    :catchall_13c
    move-exception p0

    monitor-exit v0
    :try_end_13e
    .catchall {:try_start_133 .. :try_end_13e} :catchall_13c

    throw p0

    .line 11
    :cond_13f
    :goto_13f
    return-void
.end method

.method static video(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 5

    .line 9
    new-instance v0, Le/e/a/CacheFile;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, ".mp4"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Le/e/a/CacheFile;->isFile()Z

    move-result v0

    if-nez v0, :cond_5c

    new-instance v0, Le/e/a/CacheFile;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, ".ncache"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Le/e/a/CacheFile;->isFile()Z

    move-result v0

    if-nez v0, :cond_5c

    new-instance v0, Le/e/a/CacheFile;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string p1, ".m3u8"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p0, p1}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Le/e/a/CacheFile;->isFile()Z

    move-result p0

    if-nez p0, :cond_5c

    const/4 p0, 0x0

    return p0

    :cond_5c
    const/4 p0, 0x1

    return p0
.end method
