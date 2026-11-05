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

    :goto_1c
    array-length v3, p1

    if-lt v2, v3, :cond_3f

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

    :cond_3f
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
    :try_end_53
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_53} :catch_56

    add-int/lit8 v2, v2, 0x1

    goto :goto_1c

    :catch_56
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

    if-eqz p1, :cond_1a

    iget-object v0, p0, Le/e/a/ImageDiskCache;->oldest:Ljava/util/TreeSet;

    invoke-virtual {v0, p1}, Ljava/util/TreeSet;->remove(Ljava/lang/Object;)Z

    iget-wide v0, p0, Le/e/a/ImageDiskCache;->total:J

    iget-wide v2, p1, Le/e/a/ImageDiskCache$Entry;->size:J

    sub-long/2addr v0, v2

    iput-wide v0, p0, Le/e/a/ImageDiskCache;->total:J

    :cond_1a
    return-void
.end method

.method static synthetic lambda$0(Le/e/a/ImageDiskCache$Entry;Le/e/a/ImageDiskCache$Entry;)I
    .registers 6

    .line 9
    iget-wide v0, p0, Le/e/a/ImageDiskCache$Entry;->time:J

    iget-wide v2, p1, Le/e/a/ImageDiskCache$Entry;->time:J

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Long;->compare(JJ)I

    move-result v0

    if-nez v0, :cond_1a

    iget-object p0, p0, Le/e/a/ImageDiskCache$Entry;->file:Ljava/io/File;

    invoke-virtual {p0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object p0

    iget-object p1, p1, Le/e/a/ImageDiskCache$Entry;->file:Ljava/io/File;

    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    :cond_1a
    return v0
.end method

.method private reconcile()V
    .registers 14

    .line 16
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    iget-boolean v2, p0, Le/e/a/ImageDiskCache;->initialized:Z

    if-eqz v2, :cond_16

    iget-wide v2, p0, Le/e/a/ImageDiskCache;->reconciled:J

    sub-long v2, v0, v2

    const-wide v4, 0x45d964b800L

    cmp-long v6, v2, v4

    if-gez v6, :cond_16

    return-void

    :cond_16
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

    if-eqz v2, :cond_6a

    array-length v5, v2

    const/4 v6, 0x0

    :goto_32
    if-lt v6, v5, :cond_35

    goto :goto_6a

    :cond_35
    aget-object v7, v2, v6

    invoke-virtual {v7}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v8

    const-string v9, ".img"

    invoke-virtual {v8, v9}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_47

    invoke-direct {p0, v7}, Le/e/a/ImageDiskCache;->remember(Ljava/io/File;)V

    goto :goto_67

    :cond_47
    const-string v9, "image-"

    invoke-virtual {v8, v9}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_67

    const-string v9, ".tmp"

    invoke-virtual {v8, v9}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_67

    invoke-virtual {v7}, Ljava/io/File;->lastModified()J

    move-result-wide v8

    sub-long v8, v3, v8

    const-wide/32 v10, 0x5265c00

    cmp-long v12, v8, v10

    if-lez v12, :cond_67

    invoke-virtual {v7}, Ljava/io/File;->delete()Z

    :cond_67
    :goto_67
    add-int/lit8 v6, v6, 0x1

    goto :goto_32

    :cond_6a
    :goto_6a
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

    :cond_a
    :goto_a
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_11

    :goto_10
    goto :goto_32

    :cond_11
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Le/e/a/ImageDiskCache$Entry;

    iget-wide v4, p0, Le/e/a/ImageDiskCache;->total:J

    const-wide/32 v6, 0x2000000

    cmp-long v8, v4, v6

    if-gtz v8, :cond_33

    iget-wide v4, v3, Le/e/a/ImageDiskCache$Entry;->time:J

    sub-long v4, v0, v4

    const-wide/32 v6, 0x240c8400

    cmp-long v8, v4, v6

    if-gtz v8, :cond_33

    iget-wide v4, v3, Le/e/a/ImageDiskCache$Entry;->time:J

    cmp-long v6, v0, v4

    if-ltz v6, :cond_33

    goto :goto_10

    :goto_32
    return-void

    :cond_33
    iget-object v4, v3, Le/e/a/ImageDiskCache$Entry;->file:Ljava/io/File;

    invoke-virtual {v4}, Ljava/io/File;->delete()Z

    move-result v4

    if-nez v4, :cond_43

    iget-object v4, v3, Le/e/a/ImageDiskCache$Entry;->file:Ljava/io/File;

    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v4

    if-nez v4, :cond_a

    :cond_43
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

    goto :goto_a
.end method


# virtual methods
.method declared-synchronized get(Ljava/lang/String;)[B
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 17
    :try_start_1
    invoke-direct {p0, p1}, Le/e/a/ImageDiskCache;->file(Ljava/lang/String;)Ljava/io/File;

    move-result-object p1

    invoke-virtual {p1}, Ljava/io/File;->isFile()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_11

    invoke-direct {p0, p1}, Le/e/a/ImageDiskCache;->forget(Ljava/io/File;)V
    :try_end_f
    .catchall {:try_start_1 .. :try_end_f} :catchall_9b

    :cond_f
    :goto_f
    monitor-exit p0

    return-object v1

    :cond_11
    :try_start_11
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {p1}, Ljava/io/File;->lastModified()J

    move-result-wide v4

    sub-long/2addr v2, v4

    const-wide/16 v4, 0x0

    cmp-long v0, v2, v4

    if-ltz v0, :cond_90

    const-wide/32 v4, 0x240c8400

    cmp-long v0, v2, v4

    if-gtz v0, :cond_90

    invoke-virtual {p1}, Ljava/io/File;->length()J

    move-result-wide v2
    :try_end_2b
    .catchall {:try_start_11 .. :try_end_2b} :catchall_9b

    const-wide/32 v4, 0x800000

    cmp-long v0, v2, v4

    if-lez v0, :cond_33

    goto :goto_90

    :cond_33
    :try_start_33
    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_38
    .catchall {:try_start_33 .. :try_end_38} :catchall_86

    :try_start_38
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_3d
    .catchall {:try_start_38 .. :try_end_3d} :catchall_78

    const/16 v3, 0x2000

    :try_start_3f
    new-array v3, v3, [B

    :goto_41
    invoke-virtual {v0, v3}, Ljava/io/InputStream;->read([B)I

    move-result v4

    const/4 v5, -0x1

    if-ne v4, v5, :cond_54

    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p1
    :try_end_4c
    .catchall {:try_start_3f .. :try_end_4c} :catchall_72

    :try_start_4c
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_4f
    .catchall {:try_start_4c .. :try_end_4f} :catchall_78

    :try_start_4f
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_52
    .catchall {:try_start_4f .. :try_end_52} :catchall_86

    monitor-exit p0

    return-object p1

    :cond_54
    :try_start_54
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v5

    add-int/2addr v5, v4

    const/high16 v6, 0x800000

    if-le v5, v6, :cond_6d

    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    move-result v3

    if-eqz v3, :cond_66

    invoke-direct {p0, p1}, Le/e/a/ImageDiskCache;->forget(Ljava/io/File;)V
    :try_end_66
    .catchall {:try_start_54 .. :try_end_66} :catchall_72

    :cond_66
    :try_start_66
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_69
    .catchall {:try_start_66 .. :try_end_69} :catchall_78

    :try_start_69
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_6c
    .catchall {:try_start_69 .. :try_end_6c} :catchall_86

    goto :goto_f

    :cond_6d
    const/4 v5, 0x0

    :try_start_6e
    invoke-virtual {v2, v3, v5, v4}, Ljava/io/ByteArrayOutputStream;->write([BII)V
    :try_end_71
    .catchall {:try_start_6e .. :try_end_71} :catchall_72

    goto :goto_41

    :catchall_72
    move-exception p1

    move-object v1, p1

    :try_start_74
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->close()V

    throw v1
    :try_end_78
    .catchall {:try_start_74 .. :try_end_78} :catchall_78

    :catchall_78
    move-exception p1

    if-eqz v1, :cond_81

    if-eq v1, p1, :cond_82

    :try_start_7d
    invoke-virtual {v1, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_82

    :cond_81
    move-object v1, p1

    :cond_82
    :goto_82
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    throw v1
    :try_end_86
    .catchall {:try_start_7d .. :try_end_86} :catchall_86

    :catchall_86
    move-exception p1

    if-eqz v1, :cond_8f

    if-eq v1, p1, :cond_8e

    :try_start_8b
    invoke-virtual {v1, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_8e
    move-object p1, v1

    :cond_8f
    throw p1

    :cond_90
    :goto_90
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    move-result v0

    if-eqz v0, :cond_f

    invoke-direct {p0, p1}, Le/e/a/ImageDiskCache;->forget(Ljava/io/File;)V

    goto/16 :goto_f

    .line 17
    :catchall_9b
    move-exception p1

    monitor-exit p0
    :try_end_9d
    .catchall {:try_start_8b .. :try_end_9d} :catchall_9b

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
    :try_start_1
    array-length v0, p2

    if-eqz v0, :cond_88

    array-length v0, p2

    const/high16 v1, 0x800000

    if-le v0, v1, :cond_b

    goto/16 :goto_88

    .line 21
    :cond_b
    iget-object v0, p0, Le/e/a/ImageDiskCache;->directory:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-nez v0, :cond_24

    iget-object v0, p0, Le/e/a/ImageDiskCache;->directory:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result v0

    if-eqz v0, :cond_1c

    goto :goto_24

    :cond_1c
    new-instance p1, Ljava/io/IOException;

    const-string p2, "Thumbnail cache unavailable"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_24
    :goto_24
    invoke-direct {p0}, Le/e/a/ImageDiskCache;->reconcile()V

    .line 22
    invoke-direct {p0, p1}, Le/e/a/ImageDiskCache;->file(Ljava/lang/String;)Ljava/io/File;

    move-result-object p1

    const-string v0, "image-"

    const-string v1, ".tmp"

    iget-object v2, p0, Le/e/a/ImageDiskCache;->directory:Ljava/io/File;

    invoke-static {v0, v1, v2}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;

    move-result-object v0
    :try_end_35
    .catchall {:try_start_1 .. :try_end_35} :catchall_8a

    .line 23
    const/4 v1, 0x0

    :try_start_36
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_3b
    .catchall {:try_start_36 .. :try_end_3b} :catchall_79

    :try_start_3b
    invoke-virtual {v2, p2}, Ljava/io/OutputStream;->write([B)V
    :try_end_3e
    .catchall {:try_start_3b .. :try_end_3e} :catchall_74

    :try_start_3e
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V
    :try_end_41
    .catchall {:try_start_3e .. :try_end_41} :catchall_79

    :try_start_41
    invoke-virtual {v0, p1}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result p2

    if-eqz p2, :cond_6c

    invoke-direct {p0, p1}, Le/e/a/ImageDiskCache;->remember(Ljava/io/File;)V

    invoke-direct {p0}, Le/e/a/ImageDiskCache;->trim()V

    iget-wide v1, p0, Le/e/a/ImageDiskCache;->total:J

    const-wide/32 v3, 0x2000000

    cmp-long p2, v1, v3

    if-lez p2, :cond_67

    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    move-result p2

    if-eqz p2, :cond_5f

    invoke-direct {p0, p1}, Le/e/a/ImageDiskCache;->forget(Ljava/io/File;)V

    :cond_5f
    new-instance p1, Ljava/io/IOException;

    const-string p2, "Thumbnail cache limit unavailable"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
    :try_end_66
    .catchall {:try_start_41 .. :try_end_66} :catchall_83

    goto :goto_82

    .line 24
    :cond_67
    :try_start_67
    invoke-virtual {v0}, Ljava/io/File;->delete()Z
    :try_end_6a
    .catchall {:try_start_67 .. :try_end_6a} :catchall_8a

    .line 25
    monitor-exit p0

    return-void

    .line 23
    :cond_6c
    :try_start_6c
    new-instance p1, Ljava/io/IOException;

    const-string p2, "Thumbnail cache write failed"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
    :try_end_73
    .catchall {:try_start_6c .. :try_end_73} :catchall_83

    goto :goto_82

    :catchall_74
    move-exception v1

    :try_start_75
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V

    throw v1
    :try_end_79
    .catchall {:try_start_75 .. :try_end_79} :catchall_79

    :catchall_79
    move-exception p1

    if-eqz v1, :cond_82

    if-eq v1, p1, :cond_81

    :try_start_7e
    invoke-virtual {v1, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_81
    move-object p1, v1

    :cond_82
    :goto_82
    throw p1
    :try_end_83
    .catchall {:try_start_7e .. :try_end_83} :catchall_83

    .line 24
    :catchall_83
    move-exception p1

    :try_start_84
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    throw p1
    :try_end_88
    .catchall {:try_start_84 .. :try_end_88} :catchall_8a

    .line 20
    :cond_88
    :goto_88
    monitor-exit p0

    return-void

    .line 19
    :catchall_8a
    move-exception p1

    :try_start_8b
    monitor-exit p0
    :try_end_8c
    .catchall {:try_start_8b .. :try_end_8c} :catchall_8a

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
    :try_start_1
    invoke-direct {p0, p1}, Le/e/a/ImageDiskCache;->file(Ljava/lang/String;)Ljava/io/File;

    move-result-object p1

    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    move-result v0

    if-nez v0, :cond_11

    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_14

    :cond_11
    invoke-direct {p0, p1}, Le/e/a/ImageDiskCache;->forget(Ljava/io/File;)V
    :try_end_14
    .catchall {:try_start_1 .. :try_end_14} :catchall_16

    :cond_14
    monitor-exit p0

    return-void

    .line 18
    :catchall_16
    move-exception p1

    :try_start_17
    monitor-exit p0
    :try_end_18
    .catchall {:try_start_17 .. :try_end_18} :catchall_16

    throw p1
.end method
