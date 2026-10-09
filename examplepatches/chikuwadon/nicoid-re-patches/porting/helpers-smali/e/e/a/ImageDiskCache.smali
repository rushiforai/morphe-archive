.class final Le/e/a/ImageDiskCache;
.super Ljava/lang/Object;
.source "ImageDiskCache.java"


# static fields
.field private static final AGE:J = 0x240c8400L

.field private static final LIMIT:J = 0x2000000L


# instance fields
.field private final directory:Ljava/io/File;


# direct methods
.method constructor <init>(Ljava/io/File;)V
    .registers 4
    .param p1, "parent"    # Ljava/io/File;

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/io/File;

    const-string v1, "nicoid-thumbnails"

    invoke-direct {v0, p1, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v0, p0, Le/e/a/ImageDiskCache;->directory:Ljava/io/File;

    return-void
.end method

.method private file(Ljava/lang/String;)Ljava/io/File;
    .registers 12
    .param p1, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    :try_start_0
    const-string v0, "SHA-256"

    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    const-string v1, "UTF-8"

    invoke-virtual {p1, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v0

    .line 17
    .local v0, "digest":[B
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .local v1, "name":Ljava/lang/StringBuilder;
    array-length v2, v0

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_18
    if-ge v4, v2, :cond_35

    aget-byte v5, v0, v4

    .local v5, "b":B
    sget-object v6, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    const-string v7, "%02x"

    and-int/lit16 v8, v5, 0xff

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    aput-object v8, v9, v3

    invoke-static {v6, v7, v9}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .end local v5    # "b":B
    add-int/lit8 v4, v4, 0x1

    goto :goto_18

    .line 18
    :cond_35
    new-instance v2, Ljava/io/File;

    iget-object v3, p0, Le/e/a/ImageDiskCache;->directory:Ljava/io/File;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".img"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_4f
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_4f} :catch_50

    return-object v2

    .line 19
    .end local v0    # "digest":[B
    .end local v1    # "name":Ljava/lang/StringBuilder;
    :catch_50
    move-exception v0

    .local v0, "error":Ljava/security/NoSuchAlgorithmException;
    new-instance v1, Ljava/io/IOException;

    invoke-direct {v1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method static synthetic lambda$trim$0(Ljava/io/File;Ljava/lang/String;)Z
    .registers 3
    .param p0, "dir"    # Ljava/io/File;
    .param p1, "name"    # Ljava/lang/String;

    .line 46
    const-string v0, ".img"

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method private trim()V
    .registers 14

    .line 46
    iget-object v0, p0, Le/e/a/ImageDiskCache;->directory:Ljava/io/File;

    new-instance v1, Le/e/a/ImageDiskCache$0;

    invoke-direct {v1}, Le/e/a/ImageDiskCache$0;-><init>()V

    invoke-virtual {v0, v1}, Ljava/io/File;->listFiles(Ljava/io/FilenameFilter;)[Ljava/io/File;

    move-result-object v0

    .local v0, "files":[Ljava/io/File;
    if-nez v0, :cond_e

    return-void

    .line 47
    :cond_e
    new-instance v1, Le/e/a/ImageDiskCache$1;

    invoke-direct {v1}, Le/e/a/ImageDiskCache$1;-><init>()V

    invoke-static {v1}, Ljava/util/Comparator;->comparingLong(Ljava/util/function/ToLongFunction;)Ljava/util/Comparator;

    move-result-object v1

    invoke-static {v0, v1}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    const-wide/16 v1, 0x0

    .line 48
    .local v1, "total":J
    array-length v3, v0

    const/4 v4, 0x0

    const/4 v5, 0x0

    :goto_1f
    if-ge v5, v3, :cond_2b

    aget-object v6, v0, v5

    .local v6, "file":Ljava/io/File;
    invoke-virtual {v6}, Ljava/io/File;->length()J

    move-result-wide v7

    add-long/2addr v1, v7

    .end local v6    # "file":Ljava/io/File;
    add-int/lit8 v5, v5, 0x1

    goto :goto_1f

    .line 49
    :cond_2b
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    .line 50
    .local v5, "now":J
    array-length v3, v0

    :goto_30
    if-ge v4, v3, :cond_56

    aget-object v7, v0, v4

    .local v7, "file":Ljava/io/File;
    const-wide/32 v8, 0x2000000

    cmp-long v10, v1, v8

    if-gtz v10, :cond_48

    invoke-virtual {v7}, Ljava/io/File;->lastModified()J

    move-result-wide v8

    sub-long v8, v5, v8

    const-wide/32 v10, 0x240c8400

    cmp-long v12, v8, v10

    if-lez v12, :cond_53

    :cond_48
    invoke-virtual {v7}, Ljava/io/File;->length()J

    move-result-wide v8

    .local v8, "size":J
    invoke-virtual {v7}, Ljava/io/File;->delete()Z

    move-result v10

    if-eqz v10, :cond_53

    sub-long/2addr v1, v8

    .end local v7    # "file":Ljava/io/File;
    .end local v8    # "size":J
    :cond_53
    add-int/lit8 v4, v4, 0x1

    goto :goto_30

    .line 51
    :cond_56
    return-void
.end method


# virtual methods
.method declared-synchronized get(Ljava/lang/String;)[B
    .registers 14
    .param p1, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 22
    :try_start_1
    invoke-direct {p0, p1}, Le/e/a/ImageDiskCache;->file(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .local v0, "file":Ljava/io/File;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    .line 23
    .local v1, "now":J
    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result v3
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_85

    const/4 v4, 0x0

    if-nez v3, :cond_12

    monitor-exit p0

    return-object v4

    .line 24
    :cond_12
    :try_start_12
    invoke-virtual {v0}, Ljava/io/File;->lastModified()J

    move-result-wide v5

    sub-long v5, v1, v5

    .line 25
    .local v5, "age":J
    const-wide/16 v7, 0x0

    cmp-long v3, v5, v7

    if-ltz v3, :cond_80

    const-wide/32 v7, 0x240c8400

    cmp-long v3, v5, v7

    if-gtz v3, :cond_80

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v7

    const-wide/32 v9, 0x800000

    cmp-long v3, v7, v9

    if-lez v3, :cond_31

    goto :goto_80

    .line 26
    :cond_31
    new-instance v3, Ljava/io/FileInputStream;

    invoke-direct {v3, v0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_36
    .catchall {:try_start_12 .. :try_end_36} :catchall_85

    .local v3, "input":Ljava/io/InputStream;
    :try_start_36
    new-instance v7, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v7}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_3b
    .catchall {:try_start_36 .. :try_end_3b} :catchall_76

    .line 27
    .local v7, "body":Ljava/io/ByteArrayOutputStream;
    const/16 v8, 0x2000

    :try_start_3d
    new-array v8, v8, [B

    .local v8, "buffer":[B
    :goto_3f
    invoke-virtual {v3, v8}, Ljava/io/InputStream;->read([B)I

    move-result v9

    move v10, v9

    .local v10, "n":I
    const/4 v11, -0x1

    if-eq v9, v11, :cond_60

    .line 28
    invoke-virtual {v7}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v9

    add-int/2addr v9, v10

    const/high16 v11, 0x800000

    if-le v9, v11, :cond_5b

    invoke-virtual {v0}, Ljava/io/File;->delete()Z
    :try_end_53
    .catchall {:try_start_3d .. :try_end_53} :catchall_6c

    .line 32
    :try_start_53
    invoke-virtual {v7}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_56
    .catchall {:try_start_53 .. :try_end_56} :catchall_76

    :try_start_56
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_59
    .catchall {:try_start_56 .. :try_end_59} :catchall_85

    .line 28
    monitor-exit p0

    return-object v4

    .line 29
    .end local p0    # "this":Le/e/a/ImageDiskCache;
    :cond_5b
    const/4 v9, 0x0

    :try_start_5c
    invoke-virtual {v7, v8, v9, v10}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_3f

    .line 31
    .end local v10    # "n":I
    :cond_60
    invoke-virtual {v7}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v4
    :try_end_64
    .catchall {:try_start_5c .. :try_end_64} :catchall_6c

    .line 32
    :try_start_64
    invoke-virtual {v7}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_67
    .catchall {:try_start_64 .. :try_end_67} :catchall_76

    :try_start_67
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_6a
    .catchall {:try_start_67 .. :try_end_6a} :catchall_85

    .line 31
    monitor-exit p0

    return-object v4

    .line 26
    .end local v8    # "buffer":[B
    :catchall_6c
    move-exception v4

    :try_start_6d
    invoke-virtual {v7}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_70
    .catchall {:try_start_6d .. :try_end_70} :catchall_71

    goto :goto_75

    :catchall_71
    move-exception v8

    :try_start_72
    invoke-virtual {v4, v8}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v0    # "file":Ljava/io/File;
    .end local v1    # "now":J
    .end local v3    # "input":Ljava/io/InputStream;
    .end local v5    # "age":J
    .end local p1    # "url":Ljava/lang/String;
    :goto_75
    throw v4
    :try_end_76
    .catchall {:try_start_72 .. :try_end_76} :catchall_76

    .end local v7    # "body":Ljava/io/ByteArrayOutputStream;
    .restart local v0    # "file":Ljava/io/File;
    .restart local v1    # "now":J
    .restart local v3    # "input":Ljava/io/InputStream;
    .restart local v5    # "age":J
    .restart local p1    # "url":Ljava/lang/String;
    :catchall_76
    move-exception v4

    :try_start_77
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_7a
    .catchall {:try_start_77 .. :try_end_7a} :catchall_7b

    goto :goto_7f

    :catchall_7b
    move-exception v7

    :try_start_7c
    invoke-virtual {v4, v7}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_7f
    throw v4

    .line 25
    .end local v3    # "input":Ljava/io/InputStream;
    :cond_80
    :goto_80
    invoke-virtual {v0}, Ljava/io/File;->delete()Z
    :try_end_83
    .catchall {:try_start_7c .. :try_end_83} :catchall_85

    monitor-exit p0

    return-object v4

    .line 21
    .end local v0    # "file":Ljava/io/File;
    .end local v1    # "now":J
    .end local v5    # "age":J
    .end local p1    # "url":Ljava/lang/String;
    :catchall_85
    move-exception p1

    :try_start_86
    monitor-exit p0
    :try_end_87
    .catchall {:try_start_86 .. :try_end_87} :catchall_85

    throw p1
.end method

.method declared-synchronized put(Ljava/lang/String;[B)V
    .registers 8
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "data"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 36
    :try_start_1
    array-length v0, p2

    if-eqz v0, :cond_6b

    array-length v0, p2

    const/high16 v1, 0x800000

    if-le v0, v1, :cond_a

    goto :goto_6b

    .line 37
    :cond_a
    iget-object v0, p0, Le/e/a/ImageDiskCache;->directory:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-nez v0, :cond_23

    iget-object v0, p0, Le/e/a/ImageDiskCache;->directory:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result v0

    if-eqz v0, :cond_1b

    goto :goto_23

    :cond_1b
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Thumbnail cache unavailable"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 38
    .end local p0    # "this":Le/e/a/ImageDiskCache;
    :cond_23
    :goto_23
    invoke-direct {p0, p1}, Le/e/a/ImageDiskCache;->file(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .local v0, "target":Ljava/io/File;
    const-string v1, "image-"

    const-string v2, ".tmp"

    iget-object v3, p0, Le/e/a/ImageDiskCache;->directory:Ljava/io/File;

    invoke-static {v1, v2, v3}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;

    move-result-object v1
    :try_end_31
    .catchall {:try_start_1 .. :try_end_31} :catchall_6d

    .line 40
    .local v1, "temporary":Ljava/io/File;
    :try_start_31
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_36
    .catchall {:try_start_31 .. :try_end_36} :catchall_66

    .local v2, "out":Ljava/io/OutputStream;
    :try_start_36
    invoke-virtual {v2, p2}, Ljava/io/OutputStream;->write([B)V
    :try_end_39
    .catchall {:try_start_36 .. :try_end_39} :catchall_5c

    :try_start_39
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V

    .line 41
    .end local v2    # "out":Ljava/io/OutputStream;
    invoke-virtual {v1, v0}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v2

    if-nez v2, :cond_54

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    invoke-virtual {v1, v0}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v2

    if-eqz v2, :cond_4c

    goto :goto_54

    :cond_4c
    new-instance v2, Ljava/io/IOException;

    const-string v3, "Thumbnail cache write failed"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .end local v0    # "target":Ljava/io/File;
    .end local v1    # "temporary":Ljava/io/File;
    .end local p1    # "url":Ljava/lang/String;
    .end local p2    # "data":[B
    throw v2
    :try_end_54
    .catchall {:try_start_39 .. :try_end_54} :catchall_66

    .line 42
    .restart local v0    # "target":Ljava/io/File;
    .restart local v1    # "temporary":Ljava/io/File;
    .restart local p1    # "url":Ljava/lang/String;
    .restart local p2    # "data":[B
    :cond_54
    :goto_54
    :try_start_54
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    .line 43
    invoke-direct {p0}, Le/e/a/ImageDiskCache;->trim()V
    :try_end_5a
    .catchall {:try_start_54 .. :try_end_5a} :catchall_6d

    .line 44
    monitor-exit p0

    return-void

    .line 40
    .restart local v2    # "out":Ljava/io/OutputStream;
    :catchall_5c
    move-exception v3

    :try_start_5d
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V
    :try_end_60
    .catchall {:try_start_5d .. :try_end_60} :catchall_61

    goto :goto_65

    :catchall_61
    move-exception v4

    :try_start_62
    invoke-virtual {v3, v4}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v0    # "target":Ljava/io/File;
    .end local v1    # "temporary":Ljava/io/File;
    .end local p1    # "url":Ljava/lang/String;
    .end local p2    # "data":[B
    :goto_65
    throw v3
    :try_end_66
    .catchall {:try_start_62 .. :try_end_66} :catchall_66

    .line 42
    .end local v2    # "out":Ljava/io/OutputStream;
    .restart local v0    # "target":Ljava/io/File;
    .restart local v1    # "temporary":Ljava/io/File;
    .restart local p1    # "url":Ljava/lang/String;
    .restart local p2    # "data":[B
    :catchall_66
    move-exception v2

    :try_start_67
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    throw v2
    :try_end_6b
    .catchall {:try_start_67 .. :try_end_6b} :catchall_6d

    .line 36
    .end local v0    # "target":Ljava/io/File;
    .end local v1    # "temporary":Ljava/io/File;
    :cond_6b
    :goto_6b
    monitor-exit p0

    return-void

    .line 35
    .end local p1    # "url":Ljava/lang/String;
    .end local p2    # "data":[B
    :catchall_6d
    move-exception p1

    :try_start_6e
    monitor-exit p0
    :try_end_6f
    .catchall {:try_start_6e .. :try_end_6f} :catchall_6d

    throw p1
.end method

.method declared-synchronized remove(Ljava/lang/String;)V
    .registers 3
    .param p1, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 34
    :try_start_1
    invoke-direct {p0, p1}, Le/e/a/ImageDiskCache;->file(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->delete()Z
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_a

    monitor-exit p0

    return-void

    .line 34
    .end local p0    # "this":Le/e/a/ImageDiskCache;
    .end local p1    # "url":Ljava/lang/String;
    :catchall_a
    move-exception p1

    :try_start_b
    monitor-exit p0
    :try_end_c
    .catchall {:try_start_b .. :try_end_c} :catchall_a

    throw p1
.end method
