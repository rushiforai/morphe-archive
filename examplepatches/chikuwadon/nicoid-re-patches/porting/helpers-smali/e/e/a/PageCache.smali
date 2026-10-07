.class public final Le/e/a/PageCache;
.super Ljava/lang/Object;
.source "PageCache.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/PageCache$Entry;
    }
.end annotation


# static fields
.field static final TTL_NANOS:J = 0x6fc23ac00L

.field private static bytes:I

.field private static generation:J

.field private static final pages:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap<",
            "Ljava/lang/String;",
            "Le/e/a/PageCache$Entry;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .line 13
    new-instance v0, Ljava/util/LinkedHashMap;

    const/high16 v1, 0x3f400000    # 0.75f

    const/4 v2, 0x1

    const/16 v3, 0x10

    invoke-direct {v0, v3, v1, v2}, Ljava/util/LinkedHashMap;-><init>(IFZ)V

    sput-object v0, Le/e/a/PageCache;->pages:Ljava/util/LinkedHashMap;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static input(Ljava/net/HttpURLConnection;)Ljava/io/InputStream;
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 37
    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getURL()Ljava/net/URL;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/URL;->toExternalForm()Ljava/lang/String;

    move-result-object v1

    .line 39
    const-class v0, Le/e/a/PageCache;

    monitor-enter v0

    :try_start_b
    sget-wide v5, Le/e/a/PageCache;->generation:J

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v2

    invoke-static {v1, v2, v3}, Le/e/a/PageCache;->lookup(Ljava/lang/String;J)[B

    move-result-object v2

    monitor-exit v0
    :try_end_16
    .catchall {:try_start_b .. :try_end_16} :catchall_c3

    .line 40
    if-eqz v2, :cond_23

    const-string p0, "List page cache hit"

    invoke-static {p0}, Le/e/a/PageCache;->record(Ljava/lang/String;)V

    new-instance p0, Ljava/io/ByteArrayInputStream;

    invoke-direct {p0, v2}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    return-object p0

    .line 41
    :cond_23
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v7

    .line 43
    invoke-static/range {p0 .. p0}, Le/e/a/Followup3;->http(Ljava/net/HttpURLConnection;)V

    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object p0

    :try_start_2e
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_33
    .catchall {:try_start_2e .. :try_end_33} :catchall_b7

    .line 44
    const/16 v2, 0x2000

    :try_start_35
    new-array v2, v2, [B

    .line 45
    :goto_37
    invoke-virtual {p0, v2}, Ljava/io/InputStream;->read([B)I

    move-result v3

    const/4 v4, -0x1

    if-eq v3, v4, :cond_54

    .line 46
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v4

    add-int/2addr v4, v3

    const/high16 v9, 0x800000

    if-gt v4, v9, :cond_4c

    .line 47
    const/4 v4, 0x0

    invoke-virtual {v0, v2, v4, v3}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_37

    .line 46
    :cond_4c
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Oversized list page"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 49
    :cond_54
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v9
    :try_end_58
    .catchall {:try_start_35 .. :try_end_58} :catchall_ad

    .line 50
    :try_start_58
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_5b
    .catchall {:try_start_58 .. :try_end_5b} :catchall_b7

    if-eqz p0, :cond_60

    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    .line 51
    :cond_60
    new-instance p0, Ljava/lang/String;

    sget-object v0, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {p0, v9, v0}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    .line 52
    const-string v0, "<meta name=\"server-response\" content=\""

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_77

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v3

    move-object v2, v9

    invoke-static/range {v1 .. v6}, Le/e/a/PageCache;->save(Ljava/lang/String;[BJJ)V

    .line 53
    :cond_77
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "List page fetched in "

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    sub-long/2addr v0, v7

    const-wide/32 v2, 0xf4240

    div-long/2addr v0, v2

    invoke-virtual {p0, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, " ms, "

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    array-length v0, v9

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, " bytes"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le/e/a/PageCache;->record(Ljava/lang/String;)V

    .line 54
    new-instance p0, Ljava/io/ByteArrayInputStream;

    invoke-direct {p0, v9}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    return-object p0

    .line 43
    :catchall_ad
    move-exception v1

    :try_start_ae
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_b1
    .catchall {:try_start_ae .. :try_end_b1} :catchall_b2

    goto :goto_b6

    :catchall_b2
    move-exception v0

    :try_start_b3
    invoke-virtual {v1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_b6
    throw v1
    :try_end_b7
    .catchall {:try_start_b3 .. :try_end_b7} :catchall_b7

    :catchall_b7
    move-exception v0

    if-eqz p0, :cond_c2

    :try_start_ba
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_bd
    .catchall {:try_start_ba .. :try_end_bd} :catchall_be

    goto :goto_c2

    :catchall_be
    move-exception p0

    invoke-virtual {v0, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_c2
    :goto_c2
    throw v0

    .line 39
    :catchall_c3
    move-exception p0

    :try_start_c4
    monitor-exit v0
    :try_end_c5
    .catchall {:try_start_c4 .. :try_end_c5} :catchall_c3

    throw p0
.end method

.method static declared-synchronized lookup(Ljava/lang/String;J)[B
    .registers 9

    const-class v0, Le/e/a/PageCache;

    monitor-enter v0

    .line 22
    :try_start_3
    sget-object v1, Le/e/a/PageCache;->pages:Ljava/util/LinkedHashMap;

    invoke-virtual {v1, p0}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/PageCache$Entry;
    :try_end_b
    .catchall {:try_start_3 .. :try_end_b} :catchall_2f

    .line 23
    const/4 v2, 0x0

    if-nez v1, :cond_10

    monitor-exit v0

    return-object v2

    .line 24
    :cond_10
    :try_start_10
    iget-wide v3, v1, Le/e/a/PageCache$Entry;->at:J

    sub-long/2addr p1, v3

    const-wide v3, 0x6fc23ac00L

    cmp-long v5, p1, v3

    if-ltz v5, :cond_2b

    sget-object p1, Le/e/a/PageCache;->pages:Ljava/util/LinkedHashMap;

    invoke-virtual {p1, p0}, Ljava/util/LinkedHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    sget p0, Le/e/a/PageCache;->bytes:I

    iget-object p1, v1, Le/e/a/PageCache$Entry;->data:[B

    array-length p1, p1

    sub-int/2addr p0, p1

    sput p0, Le/e/a/PageCache;->bytes:I
    :try_end_29
    .catchall {:try_start_10 .. :try_end_29} :catchall_2f

    monitor-exit v0

    return-object v2

    .line 25
    :cond_2b
    :try_start_2b
    iget-object p0, v1, Le/e/a/PageCache$Entry;->data:[B
    :try_end_2d
    .catchall {:try_start_2b .. :try_end_2d} :catchall_2f

    monitor-exit v0

    return-object p0

    .line 21
    :catchall_2f
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method private static record(Ljava/lang/String;)V
    .registers 7

    .line 57
    :try_start_0
    const-string v0, "e.e.a.ModernDebug"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v1, "record"

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Class;

    const-class v4, Ljava/lang/String;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v1, v2, [Ljava/lang/Object;

    aput-object p0, v1, v5

    const/4 p0, 0x0

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1c
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_0 .. :try_end_1c} :catch_1d

    goto :goto_1e

    .line 58
    :catch_1d
    move-exception p0

    :goto_1e
    nop

    .line 59
    return-void
.end method

.method public static declared-synchronized refresh()V
    .registers 5

    const-class v0, Le/e/a/PageCache;

    monitor-enter v0

    .line 20
    :try_start_3
    sget-wide v1, Le/e/a/PageCache;->generation:J

    const-wide/16 v3, 0x1

    add-long/2addr v1, v3

    sput-wide v1, Le/e/a/PageCache;->generation:J

    sget-object v1, Le/e/a/PageCache;->pages:Ljava/util/LinkedHashMap;

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->clear()V

    const/4 v1, 0x0

    sput v1, Le/e/a/PageCache;->bytes:I
    :try_end_12
    .catchall {:try_start_3 .. :try_end_12} :catchall_14

    monitor-exit v0

    return-void

    .line 20
    :catchall_14
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method static declared-synchronized save(Ljava/lang/String;[BJJ)V
    .registers 10

    const-class v0, Le/e/a/PageCache;

    monitor-enter v0

    .line 28
    :try_start_3
    sget-wide v1, Le/e/a/PageCache;->generation:J

    cmp-long v3, p4, v1

    if-nez v3, :cond_67

    array-length p4, p1

    const/high16 p5, 0x200000

    if-le p4, p5, :cond_f

    goto :goto_67

    .line 29
    :cond_f
    sget-object p4, Le/e/a/PageCache;->pages:Ljava/util/LinkedHashMap;

    new-instance p5, Le/e/a/PageCache$Entry;

    invoke-direct {p5, p1, p2, p3}, Le/e/a/PageCache$Entry;-><init>([BJ)V

    invoke-virtual {p4, p0, p5}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le/e/a/PageCache$Entry;

    if-eqz p0, :cond_26

    sget p2, Le/e/a/PageCache;->bytes:I

    iget-object p0, p0, Le/e/a/PageCache$Entry;->data:[B

    array-length p0, p0

    sub-int/2addr p2, p0

    sput p2, Le/e/a/PageCache;->bytes:I

    .line 30
    :cond_26
    sget p0, Le/e/a/PageCache;->bytes:I

    array-length p1, p1

    add-int/2addr p0, p1

    sput p0, Le/e/a/PageCache;->bytes:I

    .line 31
    :goto_2c
    sget-object p0, Le/e/a/PageCache;->pages:Ljava/util/LinkedHashMap;

    invoke-virtual {p0}, Ljava/util/LinkedHashMap;->size()I

    move-result p0

    const/16 p1, 0x8

    if-gt p0, p1, :cond_3f

    sget p0, Le/e/a/PageCache;->bytes:I
    :try_end_38
    .catchall {:try_start_3 .. :try_end_38} :catchall_69

    const/high16 p1, 0x800000

    if-le p0, p1, :cond_3d

    goto :goto_3f

    .line 35
    :cond_3d
    monitor-exit v0

    return-void

    .line 32
    :cond_3f
    :goto_3f
    :try_start_3f
    sget-object p0, Le/e/a/PageCache;->pages:Ljava/util/LinkedHashMap;

    invoke-virtual {p0}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Map$Entry;

    .line 33
    sget p1, Le/e/a/PageCache;->bytes:I

    invoke-interface {p0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Le/e/a/PageCache$Entry;

    iget-object p2, p2, Le/e/a/PageCache$Entry;->data:[B

    array-length p2, p2

    sub-int/2addr p1, p2

    sput p1, Le/e/a/PageCache;->bytes:I

    sget-object p1, Le/e/a/PageCache;->pages:Ljava/util/LinkedHashMap;

    invoke-interface {p0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/util/LinkedHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_66
    .catchall {:try_start_3f .. :try_end_66} :catchall_69

    .line 34
    goto :goto_2c

    .line 28
    :cond_67
    :goto_67
    monitor-exit v0

    return-void

    .line 27
    :catchall_69
    move-exception p0

    monitor-exit v0

    throw p0
.end method
