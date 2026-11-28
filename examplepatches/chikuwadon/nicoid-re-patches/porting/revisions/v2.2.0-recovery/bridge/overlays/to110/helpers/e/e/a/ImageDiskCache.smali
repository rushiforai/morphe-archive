.class final Le/e/a/ImageDiskCache;
.super Ljava/lang/Object;
.source "ImageDiskCache.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/ImageDiskCache$Entry;
    }
.end annotation


# static fields
.field private static final AGE:J = 0x240c8400L

.field private static final LIMIT:J = 0x2000000L

.field private static final RECONCILE_NANOS:J = 0x45d964b800L

.field private static final TEMP_AGE:J = 0x5265c00L


# instance fields
.field private final directory:Ljava/io/File;

.field private initialized:Z

.field private final known:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Le/e/a/ImageDiskCache$Entry;",
            ">;"
        }
    .end annotation
.end field

.field private final oldest:Ljava/util/TreeSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/TreeSet<",
            "Le/e/a/ImageDiskCache$Entry;",
            ">;"
        }
    .end annotation
.end field

.field private reconciled:J

.field reconciliations:I

.field private total:J


# direct methods
.method constructor <init>(Ljava/io/File;)V
    .registers 4

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Le/e/a/ImageDiskCache;->known:Ljava/util/Map;

    .line 9
    new-instance v0, Ljava/util/TreeSet;

    new-instance v1, Le/e/a/ImageDiskCache$$ExternalSyntheticLambda0;

    invoke-direct {v1}, Le/e/a/ImageDiskCache$$ExternalSyntheticLambda0;-><init>()V

    invoke-direct {v0, v1}, Ljava/util/TreeSet;-><init>(Ljava/util/Comparator;)V

    iput-object v0, p0, Le/e/a/ImageDiskCache;->oldest:Ljava/util/TreeSet;

    .line 12
    new-instance v0, Ljava/io/File;

    const-string v1, "nicoid-thumbnails"

    invoke-direct {v0, p1, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v0, p0, Le/e/a/ImageDiskCache;->directory:Ljava/io/File;

    return-void
.end method

.method private file(Ljava/lang/String;)Ljava/io/File;
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    :try_start_0
    const-string v0, "SHA-256"

    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    const-string v1, "UTF-8"

    invoke-virtual {p1, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object p1

    const-string v0, "0123456789abcdef"

    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    array-length v1, p1

    mul-int/lit8 v1, v1, 0x2

    new-array v1, v1, [C

    const/4 v2, 0x0

    :goto_0
    array-length v3, p1

    if-lt v2, v3, :cond_0

    new-instance p1, Ljava/io/File;

    iget-object v0, p0, Le/e/a/ImageDiskCache;->directory:Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    new-instance v3, Ljava/lang/String;

    invoke-direct {v3, v1}, Ljava/lang/String;-><init>([C)V

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, ".img"

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p1, v0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object p1

    :cond_0
    aget-byte v3, p1, v2

    and-int/lit16 v3, v3, 0xff

    mul-int/lit8 v4, v2, 0x2

    ushr-int/lit8 v5, v3, 0x4

    aget-char v5, v0, v5

    aput-char v5, v1, v4

    add-int/lit8 v4, v4, 0x1

    and-int/lit8 v3, v3, 0xf

    aget-char v3, v0, v3

    aput-char v3, v1, v4
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :catch_0
    move-exception p1

    new-instance v0, Ljava/io/IOException;

    invoke-direct {v0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/Throwable;)V

    throw v0
.end method

.method private forget(Ljava/io/File;)V
    .registers 6

    .line 14
    iget-object v0, p0, Le/e/a/ImageDiskCache;->known:Ljava/util/Map;

    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Le/e/a/ImageDiskCache$Entry;

    if-eqz p1, :cond_0

    iget-object v0, p0, Le/e/a/ImageDiskCache;->oldest:Ljava/util/TreeSet;

    invoke-virtual {v0, p1}, Ljava/util/TreeSet;->remove(Ljava/lang/Object;)Z

    iget-wide v0, p0, Le/e/a/ImageDiskCache;->total:J

    iget-wide v2, p1, Le/e/a/ImageDiskCache$Entry;->size:J

    sub-long/2addr v0, v2

    iput-wide v0, p0, Le/e/a/ImageDiskCache;->total:J

    :cond_0
    return-void
.end method

.method static synthetic lambda$0(Le/e/a/ImageDiskCache$Entry;Le/e/a/ImageDiskCache$Entry;)I
    .registers 6

    .line 9
    iget-wide v0, p0, Le/e/a/ImageDiskCache$Entry;->time:J

    iget-wide v2, p1, Le/e/a/ImageDiskCache$Entry;->time:J

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Long;->compare(JJ)I

    move-result v0

    if-nez v0, :cond_0

    iget-object p0, p0, Le/e/a/ImageDiskCache$Entry;->file:Ljava/io/File;

    invoke-virtual {p0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object p0

    iget-object p1, p1, Le/e/a/ImageDiskCache$Entry;->file:Ljava/io/File;

    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    :cond_0
    return v0
.end method

.method private reconcile()V
    .registers 14

    .line 16
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    iget-boolean v2, p0, Le/e/a/ImageDiskCache;->initialized:Z

    if-eqz v2, :cond_0

    iget-wide v2, p0, Le/e/a/ImageDiskCache;->reconciled:J

    sub-long v2, v0, v2

    const-wide v4, 0x45d964b800L

    cmp-long v6, v2, v4

    if-gez v6, :cond_0

    return-void

    :cond_0
    iget-object v2, p0, Le/e/a/ImageDiskCache;->known:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->clear()V

    iget-object v2, p0, Le/e/a/ImageDiskCache;->oldest:Ljava/util/TreeSet;

    invoke-virtual {v2}, Ljava/util/TreeSet;->clear()V

    const-wide/16 v2, 0x0

    iput-wide v2, p0, Le/e/a/ImageDiskCache;->total:J

    iget-object v2, p0, Le/e/a/ImageDiskCache;->directory:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    if-eqz v2, :cond_4

    array-length v5, v2

    const/4 v6, 0x0

    :goto_0
    if-lt v6, v5, :cond_1

    goto :goto_2

    :cond_1
    aget-object v7, v2, v6

    invoke-virtual {v7}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v8

    const-string v9, ".img"

    invoke-virtual {v8, v9}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_2

    invoke-direct {p0, v7}, Le/e/a/ImageDiskCache;->remember(Ljava/io/File;)V

    goto :goto_1

    :cond_2
    const-string v9, "image-"

    invoke-virtual {v8, v9}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_3

    const-string v9, ".tmp"

    invoke-virtual {v8, v9}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_3

    invoke-virtual {v7}, Ljava/io/File;->lastModified()J

    move-result-wide v8

    sub-long v8, v3, v8

    const-wide/32 v10, 0x5265c00

    cmp-long v12, v8, v10

    if-lez v12, :cond_3

    invoke-virtual {v7}, Ljava/io/File;->delete()Z

    :cond_3
    :goto_1
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    :cond_4
    :goto_2
    const/4 v2, 0x1

    iput-boolean v2, p0, Le/e/a/ImageDiskCache;->initialized:Z

    iput-wide v0, p0, Le/e/a/ImageDiskCache;->reconciled:J

    iget v0, p0, Le/e/a/ImageDiskCache;->reconciliations:I

    add-int/2addr v0, v2

    iput v0, p0, Le/e/a/ImageDiskCache;->reconciliations:I

    return-void
.end method

.method private remember(Ljava/io/File;)V
    .registers 7

    .line 15
    invoke-direct {p0, p1}, Le/e/a/ImageDiskCache;->forget(Ljava/io/File;)V

    new-instance v0, Le/e/a/ImageDiskCache$Entry;

    invoke-direct {v0, p1}, Le/e/a/ImageDiskCache$Entry;-><init>(Ljava/io/File;)V

    iget-object v1, p0, Le/e/a/ImageDiskCache;->known:Ljava/util/Map;

    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p1, p0, Le/e/a/ImageDiskCache;->oldest:Ljava/util/TreeSet;

    invoke-virtual {p1, v0}, Ljava/util/TreeSet;->add(Ljava/lang/Object;)Z

    iget-wide v1, p0, Le/e/a/ImageDiskCache;->total:J

    iget-wide v3, v0, Le/e/a/ImageDiskCache$Entry;->size:J

    add-long/2addr v1, v3

    iput-wide v1, p0, Le/e/a/ImageDiskCache;->total:J

    return-void
.end method

.method private trim()V
    .registers 10

    .line 26
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object v2, p0, Le/e/a/ImageDiskCache;->oldest:Ljava/util/TreeSet;

    invoke-virtual {v2}, Ljava/util/TreeSet;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_1

    :goto_1
    goto :goto_2

    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Le/e/a/ImageDiskCache$Entry;

    iget-wide v4, p0, Le/e/a/ImageDiskCache;->total:J

    const-wide/32 v6, 0x2000000

    cmp-long v8, v4, v6

    if-gtz v8, :cond_2

    iget-wide v4, v3, Le/e/a/ImageDiskCache$Entry;->time:J

    sub-long v4, v0, v4

    const-wide/32 v6, 0x240c8400

    cmp-long v8, v4, v6

    if-gtz v8, :cond_2

    iget-wide v4, v3, Le/e/a/ImageDiskCache$Entry;->time:J

    cmp-long v6, v0, v4

    if-ltz v6, :cond_2

    goto :goto_1

    :goto_2
    return-void

    :cond_2
    iget-object v4, v3, Le/e/a/ImageDiskCache$Entry;->file:Ljava/io/File;

    invoke-virtual {v4}, Ljava/io/File;->delete()Z

    move-result v4

    if-nez v4, :cond_3

    iget-object v4, v3, Le/e/a/ImageDiskCache$Entry;->file:Ljava/io/File;

    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v4

    if-nez v4, :cond_0

    :cond_3
    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    iget-object v4, p0, Le/e/a/ImageDiskCache;->known:Ljava/util/Map;

    iget-object v5, v3, Le/e/a/ImageDiskCache$Entry;->file:Ljava/io/File;

    invoke-virtual {v5}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-wide v4, p0, Le/e/a/ImageDiskCache;->total:J

    iget-wide v6, v3, Le/e/a/ImageDiskCache$Entry;->size:J

    sub-long/2addr v4, v6

    iput-wide v4, p0, Le/e/a/ImageDiskCache;->total:J

    goto :goto_0
.end method


# virtual methods
.method declared-synchronized cleanup(Z)Le/e/a/TemporaryCache221$Result;
    .registers 5

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Le/e/a/ImageDiskCache;->directory:Ljava/io/File;

    invoke-static {v0, p1}, Le/e/a/TemporaryCache221;->scan(Ljava/io/File;Z)Le/e/a/TemporaryCache221$Result;

    move-result-object v0

    if-eqz p1, :cond_0

    iget-object v1, p0, Le/e/a/ImageDiskCache;->known:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->clear()V

    iget-object v1, p0, Le/e/a/ImageDiskCache;->oldest:Ljava/util/TreeSet;

    invoke-virtual {v1}, Ljava/util/TreeSet;->clear()V

    const-wide/16 v1, 0x0

    iput-wide v1, p0, Le/e/a/ImageDiskCache;->total:J

    const/4 v1, 0x0

    iput-boolean v1, p0, Le/e/a/ImageDiskCache;->initialized:Z

    :cond_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized get(Ljava/lang/String;)[B
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 17
    :try_start_0
    invoke-direct {p0, p1}, Le/e/a/ImageDiskCache;->file(Ljava/lang/String;)Ljava/io/File;

    move-result-object p1

    invoke-virtual {p1}, Ljava/io/File;->isFile()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_1

    invoke-direct {p0, p1}, Le/e/a/ImageDiskCache;->forget(Ljava/io/File;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    :cond_0
    :goto_0
    monitor-exit p0

    return-object v1

    :cond_1
    :try_start_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {p1}, Ljava/io/File;->lastModified()J

    move-result-wide v4

    sub-long/2addr v2, v4

    const-wide/16 v4, 0x0

    cmp-long v0, v2, v4

    if-ltz v0, :cond_a

    const-wide/32 v4, 0x240c8400

    cmp-long v0, v2, v4

    if-gtz v0, :cond_a

    invoke-virtual {p1}, Ljava/io/File;->length()J

    move-result-wide v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_3

    const-wide/32 v4, 0x800000

    cmp-long v0, v2, v4

    if-lez v0, :cond_2

    goto :goto_3

    :cond_2
    :try_start_2
    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    :try_start_3
    long-to-int v3, v2

    const v4, 0x10000

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v3

    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2, v3}, Ljava/io/ByteArrayOutputStream;-><init>(I)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    const/16 v3, 0x2000

    :try_start_4
    new-array v3, v3, [B

    :goto_1
    invoke-virtual {v0, v3}, Ljava/io/InputStream;->read([B)I

    move-result v4

    const/4 v5, -0x1

    if-ne v4, v5, :cond_3

    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :try_start_5
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    :try_start_6
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    monitor-exit p0

    return-object p1

    :cond_3
    :try_start_7
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v5

    add-int/2addr v5, v4

    const/high16 v6, 0x800000

    if-le v5, v6, :cond_5

    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-direct {p0, p1}, Le/e/a/ImageDiskCache;->forget(Ljava/io/File;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    :cond_4
    :try_start_8
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    :try_start_9
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    goto :goto_0

    :cond_5
    const/4 v5, 0x0

    :try_start_a
    invoke-virtual {v2, v3, v5, v4}, Ljava/io/ByteArrayOutputStream;->write([BII)V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception p1

    move-object v1, p1

    :try_start_b
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->close()V

    throw v1
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_1

    :catchall_1
    move-exception p1

    if-eqz v1, :cond_6

    if-eq v1, p1, :cond_7

    :try_start_c
    invoke-virtual {v1, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_2

    :cond_6
    move-object v1, p1

    :cond_7
    :goto_2
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    throw v1
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_2

    :catchall_2
    move-exception p1

    if-eqz v1, :cond_9

    if-eq v1, p1, :cond_8

    :try_start_d
    invoke-virtual {v1, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_8
    move-object p1, v1

    :cond_9
    throw p1

    :cond_a
    :goto_3
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0, p1}, Le/e/a/ImageDiskCache;->forget(Ljava/io/File;)V

    goto/16 :goto_0

    .line 17
    :catchall_3
    move-exception p1

    monitor-exit p0
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_3

    throw p1
.end method

.method declared-synchronized put(Ljava/lang/String;[B)V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 20
    :try_start_0
    array-length v0, p2

    if-eqz v0, :cond_8

    array-length v0, p2

    const/high16 v1, 0x800000

    if-le v0, v1, :cond_0

    goto/16 :goto_2

    .line 21
    :cond_0
    iget-object v0, p0, Le/e/a/ImageDiskCache;->directory:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Le/e/a/ImageDiskCache;->directory:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    :cond_1
    new-instance p1, Ljava/io/IOException;

    const-string p2, "Thumbnail cache unavailable"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    :goto_0
    invoke-direct {p0}, Le/e/a/ImageDiskCache;->reconcile()V

    .line 22
    invoke-direct {p0, p1}, Le/e/a/ImageDiskCache;->file(Ljava/lang/String;)Ljava/io/File;

    move-result-object p1

    const-string v0, "image-"

    const-string v1, ".tmp"

    iget-object v2, p0, Le/e/a/ImageDiskCache;->directory:Ljava/io/File;

    invoke-static {v0, v1, v2}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    .line 23
    const/4 v1, 0x0

    :try_start_1
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :try_start_2
    invoke-virtual {v2, p2}, Ljava/io/OutputStream;->write([B)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :try_start_4
    invoke-virtual {v0, p1}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result p2

    if-eqz p2, :cond_5

    invoke-direct {p0, p1}, Le/e/a/ImageDiskCache;->remember(Ljava/io/File;)V

    invoke-direct {p0}, Le/e/a/ImageDiskCache;->trim()V

    iget-wide v1, p0, Le/e/a/ImageDiskCache;->total:J

    const-wide/32 v3, 0x2000000

    cmp-long p2, v1, v3

    if-lez p2, :cond_4

    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    move-result p2

    if-eqz p2, :cond_3

    invoke-direct {p0, p1}, Le/e/a/ImageDiskCache;->forget(Ljava/io/File;)V

    :cond_3
    new-instance p1, Ljava/io/IOException;

    const-string p2, "Thumbnail cache limit unavailable"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    goto :goto_1

    .line 24
    :cond_4
    :try_start_5
    invoke-virtual {v0}, Ljava/io/File;->delete()Z
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    .line 25
    monitor-exit p0

    return-void

    .line 23
    :cond_5
    :try_start_6
    new-instance p1, Ljava/io/IOException;

    const-string p2, "Thumbnail cache write failed"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    goto :goto_1

    :catchall_0
    move-exception v1

    :try_start_7
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V

    throw v1
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    :catchall_1
    move-exception p1

    if-eqz v1, :cond_7

    if-eq v1, p1, :cond_6

    :try_start_8
    invoke-virtual {v1, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_6
    move-object p1, v1

    :cond_7
    :goto_1
    throw p1
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    .line 24
    :catchall_2
    move-exception p1

    :try_start_9
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    throw p1
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_3

    .line 20
    :cond_8
    :goto_2
    monitor-exit p0

    return-void

    .line 19
    :catchall_3
    move-exception p1

    :try_start_a
    monitor-exit p0
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_3

    throw p1
.end method

.method declared-synchronized remove(Ljava/lang/String;)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 18
    :try_start_0
    invoke-direct {p0, p1}, Le/e/a/ImageDiskCache;->file(Ljava/lang/String;)Ljava/io/File;

    move-result-object p1

    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    invoke-direct {p0, p1}, Le/e/a/ImageDiskCache;->forget(Ljava/io/File;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    monitor-exit p0

    return-void

    .line 18
    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method
