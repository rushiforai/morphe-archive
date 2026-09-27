.class final Lapp/yydarlinker/deepseekcaptions/SourceCaptionCache;
.super Ljava/lang/Object;
.source "SourceCaptionCache.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lapp/yydarlinker/deepseekcaptions/SourceCaptionCache$Entry;
    }
.end annotation


# static fields
.field private static final MAX_AGE_MS:J = 0x5265c00L

.field private static final MAX_BYTES:J = 0x5000000L

.field private static final MAX_FILES:I = 0xb4

.field private static final VERSION:Ljava/lang/String; = "source-caption-v2-word-provenance"

.field private static final WRITES:Ljava/util/concurrent/ExecutorService;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 27
    new-instance v0, Lapp/yydarlinker/deepseekcaptions/SourceCaptionCache$$ExternalSyntheticLambda1;

    invoke-direct {v0}, Lapp/yydarlinker/deepseekcaptions/SourceCaptionCache$$ExternalSyntheticLambda1;-><init>()V

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/SourceCaptionCache;->WRITES:Ljava/util/concurrent/ExecutorService;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static clear(Landroid/content/Context;)V
    .registers 4

    .line 114
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/SourceCaptionCache;->directory(Landroid/content/Context;)Ljava/io/File;

    move-result-object p0

    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object p0

    if-nez p0, :cond_b

    goto :goto_17

    .line 116
    :cond_b
    array-length v0, p0

    const/4 v1, 0x0

    :goto_d
    if-ge v1, v0, :cond_17

    aget-object v2, p0, v1

    .line 118
    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_d

    :cond_17
    :goto_17
    return-void
.end method

.method private static directory(Landroid/content/Context;)Ljava/io/File;
    .registers 3

    .line 185
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object p0

    const-string v1, "deepseek-source-captions"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 186
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result p0

    if-nez p0, :cond_14

    .line 188
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    :cond_14
    return-object v0
.end method

.method private static first(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 142
    invoke-virtual {p0, p1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/SourceCaptionCache;->safe(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 143
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_17

    invoke-virtual {p0, p2}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/SourceCaptionCache;->safe(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_17
    return-object p1
.end method

.method static get(Landroid/content/Context;Ljava/lang/String;)Lapp/yydarlinker/deepseekcaptions/SourceCaptionCache$Entry;
    .registers 10

    .line 53
    new-instance v0, Ljava/io/File;

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/SourceCaptionCache;->directory(Landroid/content/Context;)Ljava/io/File;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ".source"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 54
    new-instance v1, Ljava/io/File;

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/SourceCaptionCache;->directory(Landroid/content/Context;)Ljava/io/File;

    move-result-object p0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ".type"

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p0, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 55
    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result p0

    const/4 p1, 0x0

    if-nez p0, :cond_3c

    return-object p1

    .line 57
    :cond_3c
    :try_start_3c
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v0}, Ljava/io/File;->lastModified()J

    move-result-wide v4

    sub-long/2addr v2, v4

    const-wide/16 v4, 0x0

    invoke-static {v4, v5, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    const-wide/32 v6, 0x5265c00

    cmp-long p0, v2, v6

    if-gtz p0, :cond_9f

    .line 58
    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v6

    cmp-long p0, v6, v4

    if-lez p0, :cond_9f

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v4

    const-wide/32 v6, 0x1000000

    cmp-long p0, v4, v6

    if-lez p0, :cond_66

    goto :goto_9f

    .line 65
    :cond_66
    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/SourceCaptionCache;->read(Ljava/io/File;)[B

    move-result-object p0

    .line 66
    invoke-virtual {v1}, Ljava/io/File;->isFile()Z

    move-result v4
    :try_end_6e
    .catchall {:try_start_3c .. :try_end_6e} :catchall_a5

    const-string v5, "application/octet-stream"

    if-eqz v4, :cond_82

    .line 67
    :try_start_72
    new-instance v4, Ljava/lang/String;

    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/SourceCaptionCache;->read(Ljava/io/File;)[B

    move-result-object v6

    sget-object v7, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v4, v6, v7}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    goto :goto_83

    :cond_82
    move-object v4, v5

    .line 69
    :goto_83
    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_8a

    goto :goto_8b

    :cond_8a
    move-object v5, v4

    .line 71
    :goto_8b
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    invoke-virtual {v0, v6, v7}, Ljava/io/File;->setLastModified(J)Z

    .line 73
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    invoke-virtual {v1, v6, v7}, Ljava/io/File;->setLastModified(J)Z

    .line 74
    new-instance v0, Lapp/yydarlinker/deepseekcaptions/SourceCaptionCache$Entry;

    invoke-direct {v0, p0, v5, v2, v3}, Lapp/yydarlinker/deepseekcaptions/SourceCaptionCache$Entry;-><init>([BLjava/lang/String;J)V

    return-object v0

    .line 60
    :cond_9f
    :goto_9f
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 62
    invoke-virtual {v1}, Ljava/io/File;->delete()Z
    :try_end_a5
    .catchall {:try_start_72 .. :try_end_a5} :catchall_a5

    :catchall_a5
    return-object p1
.end method

.method private static hex([B)Ljava/lang/String;
    .registers 8

    .line 215
    new-instance v0, Ljava/lang/StringBuilder;

    array-length v1, p0

    mul-int/lit8 v1, v1, 0x2

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 216
    array-length v1, p0

    const/4 v2, 0x0

    move v3, v2

    :goto_b
    if-ge v3, v1, :cond_28

    aget-byte v4, p0, v3

    sget-object v5, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    and-int/lit16 v4, v4, 0xff

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    aput-object v4, v6, v2

    const-string v4, "%02x"

    invoke-static {v5, v4, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v3, v3, 0x1

    goto :goto_b

    .line 217
    :cond_28
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static key(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 36
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/SourceCaptionCache;->stableIdentity(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 37
    const-string v0, "SHA-256"

    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    .line 38
    const-string v1, "source-caption-v2-word-provenance"

    sget-object v2, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v1, v2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/security/MessageDigest;->update([B)V

    const/4 v1, 0x0

    .line 39
    invoke-virtual {v0, v1}, Ljava/security/MessageDigest;->update(B)V

    .line 40
    sget-object v1, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p0, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/security/MessageDigest;->update([B)V

    .line 41
    invoke-virtual {v0}, Ljava/security/MessageDigest;->digest()[B

    move-result-object p0

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/SourceCaptionCache;->hex([B)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$put$1(Landroid/content/Context;Ljava/lang/String;[BLjava/lang/String;)V
    .registers 4

    .line 84
    invoke-static {p0, p1, p2, p3}, Lapp/yydarlinker/deepseekcaptions/SourceCaptionCache;->putNow(Landroid/content/Context;Ljava/lang/String;[BLjava/lang/String;)V

    return-void
.end method

.method static synthetic lambda$static$0(Ljava/lang/Runnable;)Ljava/lang/Thread;
    .registers 3

    .line 28
    new-instance v0, Ljava/lang/Thread;

    const-string v1, "DeepSeekCaptionSourceCache"

    invoke-direct {v0, p0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    const/4 p0, 0x1

    .line 29
    invoke-virtual {v0, p0}, Ljava/lang/Thread;->setDaemon(Z)V

    return-object v0
.end method

.method static synthetic lambda$trim$2(Ljava/io/File;Ljava/lang/String;)Z
    .registers 2

    .line 194
    const-string p0, ".source"

    invoke-virtual {p1, p0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method static put(Landroid/content/Context;Ljava/lang/String;[BLjava/lang/String;)V
    .registers 6

    if-eqz p2, :cond_1d

    .line 81
    array-length v0, p2

    if-eqz v0, :cond_1d

    array-length v0, p2

    const/high16 v1, 0x1000000

    if-le v0, v1, :cond_b

    goto :goto_1d

    .line 82
    :cond_b
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    if-nez v0, :cond_12

    goto :goto_13

    :cond_12
    move-object p0, v0

    .line 84
    :goto_13
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/SourceCaptionCache;->WRITES:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lapp/yydarlinker/deepseekcaptions/SourceCaptionCache$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, p1, p2, p3}, Lapp/yydarlinker/deepseekcaptions/SourceCaptionCache$$ExternalSyntheticLambda0;-><init>(Landroid/content/Context;Ljava/lang/String;[BLjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    :cond_1d
    :goto_1d
    return-void
.end method

.method private static putNow(Landroid/content/Context;Ljava/lang/String;[BLjava/lang/String;)V
    .registers 11

    .line 88
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/SourceCaptionCache;->directory(Landroid/content/Context;)Ljava/io/File;

    move-result-object p0

    .line 89
    new-instance v0, Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ".source"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 90
    new-instance v1, Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ".type"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 91
    new-instance v2, Ljava/io/File;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, ".source.tmp-"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Thread;->getId()J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, p0, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 92
    new-instance v3, Ljava/io/File;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ".type.tmp-"

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Thread;->getId()J

    move-result-wide v5

    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v3, p0, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 94
    :try_start_72
    invoke-static {v2, p2}, Lapp/yydarlinker/deepseekcaptions/SourceCaptionCache;->write(Ljava/io/File;[B)V

    if-nez p3, :cond_79

    .line 95
    const-string p3, "application/octet-stream"

    :cond_79
    sget-object p1, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    .line 96
    invoke-virtual {p3, p1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p1

    .line 95
    invoke-static {v3, p1}, Lapp/yydarlinker/deepseekcaptions/SourceCaptionCache;->write(Ljava/io/File;[B)V

    .line 97
    invoke-static {v2, v0}, Lapp/yydarlinker/deepseekcaptions/SourceCaptionCache;->replace(Ljava/io/File;Ljava/io/File;)V

    .line 98
    invoke-static {v3, v1}, Lapp/yydarlinker/deepseekcaptions/SourceCaptionCache;->replace(Ljava/io/File;Ljava/io/File;)V

    .line 99
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/SourceCaptionCache;->trim(Ljava/io/File;)V
    :try_end_8b
    .catchall {:try_start_72 .. :try_end_8b} :catchall_8c

    return-void

    .line 102
    :catchall_8c
    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    .line 104
    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    return-void
.end method

.method private static read(Ljava/io/File;)[B
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 151
    invoke-virtual {p0}, Ljava/io/File;->length()J

    move-result-wide v0

    long-to-int v0, v0

    new-array v1, v0, [B

    .line 152
    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    const/4 p0, 0x0

    :goto_d
    if-ge p0, v0, :cond_1c

    sub-int v3, v0, p0

    .line 155
    :try_start_11
    invoke-virtual {v2, v1, p0, v3}, Ljava/io/FileInputStream;->read([BII)I

    move-result v3
    :try_end_15
    .catchall {:try_start_11 .. :try_end_15} :catchall_1a

    if-gez v3, :cond_18

    goto :goto_1c

    :cond_18
    add-int/2addr p0, v3

    goto :goto_d

    :catchall_1a
    move-exception p0

    goto :goto_2a

    :cond_1c
    :goto_1c
    if-ne p0, v0, :cond_22

    .line 160
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V

    return-object v1

    .line 159
    :cond_22
    :try_start_22
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v0, "short cache read"

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_2a
    .catchall {:try_start_22 .. :try_end_2a} :catchall_1a

    .line 152
    :goto_2a
    :try_start_2a
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V
    :try_end_2d
    .catchall {:try_start_2a .. :try_end_2d} :catchall_2e

    goto :goto_32

    :catchall_2e
    move-exception v0

    invoke-virtual {p0, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_32
    throw p0
.end method

.method static referenceKey(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 47
    const-string v0, "SHA-256"

    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    .line 48
    const-string v1, "asr-reference-v1\u0000"

    sget-object v2, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v1, v2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/security/MessageDigest;->update([B)V

    .line 49
    sget-object v1, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p0, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/security/MessageDigest;->update([B)V

    new-instance p0, Ljava/lang/StringBuilder;

    const-string v1, "ref-"

    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v0

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/SourceCaptionCache;->hex([B)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static remove(Landroid/content/Context;Ljava/lang/String;)V
    .registers 6

    .line 109
    new-instance v0, Ljava/io/File;

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/SourceCaptionCache;->directory(Landroid/content/Context;)Ljava/io/File;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ".source"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 110
    new-instance v0, Ljava/io/File;

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/SourceCaptionCache;->directory(Landroid/content/Context;)Ljava/io/File;

    move-result-object p0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ".type"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p0, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    return-void
.end method

.method private static replace(Ljava/io/File;Ljava/io/File;)V
    .registers 3

    .line 173
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_10

    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    move-result v0

    if-nez v0, :cond_10

    .line 175
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    return-void

    .line 178
    :cond_10
    invoke-virtual {p0, p1}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result p1

    if-nez p1, :cond_19

    .line 180
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    :cond_19
    return-void
.end method

.method private static safe(Ljava/lang/String;)Ljava/lang/String;
    .registers 1

    if-nez p0, :cond_4

    .line 147
    const-string p0, ""

    :cond_4
    return-object p0
.end method

.method private static stableIdentity(Ljava/lang/String;)Ljava/lang/String;
    .registers 6

    const-string v0, "v="

    .line 124
    :try_start_2
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 125
    const-string v2, "v"

    const-string v3, "video_id"

    invoke-static {v1, v2, v3}, Lapp/yydarlinker/deepseekcaptions/SourceCaptionCache;->first(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 126
    const-string v3, "id"

    const-string v4, "track_id"

    invoke-static {v1, v3, v4}, Lapp/yydarlinker/deepseekcaptions/SourceCaptionCache;->first(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 127
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_22

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_a3

    .line 128
    :cond_22
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "|id="

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "|lang="

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "lang"

    .line 130
    invoke-virtual {v1, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/SourceCaptionCache;->safe(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "|kind="

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "kind"

    .line 131
    invoke-virtual {v1, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/SourceCaptionCache;->safe(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "|name="

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "name"

    .line 132
    invoke-virtual {v1, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/SourceCaptionCache;->safe(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "|fmt="

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "fmt"

    .line 133
    invoke-virtual {v1, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/SourceCaptionCache;->safe(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "|variant="

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "variant"

    .line 134
    invoke-virtual {v1, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/SourceCaptionCache;->safe(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "|exp="

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "exp"

    invoke-virtual {v1, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/SourceCaptionCache;->safe(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0
    :try_end_a2
    .catchall {:try_start_2 .. :try_end_a2} :catchall_a3

    return-object p0

    :catchall_a3
    :cond_a3
    if-nez p0, :cond_a7

    .line 138
    const-string p0, ""

    :cond_a7
    return-object p0
.end method

.method private static trim(Ljava/io/File;)V
    .registers 13

    .line 194
    new-instance v0, Lapp/yydarlinker/deepseekcaptions/SourceCaptionCache$$ExternalSyntheticLambda2;

    invoke-direct {v0}, Lapp/yydarlinker/deepseekcaptions/SourceCaptionCache$$ExternalSyntheticLambda2;-><init>()V

    invoke-virtual {p0, v0}, Ljava/io/File;->listFiles(Ljava/io/FilenameFilter;)[Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_a0

    .line 195
    array-length v1, v0

    if-nez v1, :cond_10

    goto/16 :goto_a0

    .line 196
    :cond_10
    new-instance v1, Ljava/util/ArrayList;

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 197
    new-instance v0, Lapp/yydarlinker/deepseekcaptions/DiskCaptionCache$$ExternalSyntheticLambda2;

    invoke-direct {v0}, Lapp/yydarlinker/deepseekcaptions/DiskCaptionCache$$ExternalSyntheticLambda2;-><init>()V

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticApiModelOutline0;->m(Ljava/util/function/ToLongFunction;)Ljava/util/Comparator;

    move-result-object v0

    invoke-static {v1, v0}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticApiModelOutline0;->m(Ljava/util/List;Ljava/util/Comparator;)V

    .line 199
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const-wide/16 v2, 0x0

    move-wide v4, v2

    :goto_2c
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_42

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/io/File;

    invoke-virtual {v6}, Ljava/io/File;->length()J

    move-result-wide v6

    invoke-static {v2, v3, v6, v7}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v6

    add-long/2addr v4, v6

    goto :goto_2c

    .line 200
    :cond_42
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v0

    .line 201
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_4a
    :goto_4a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_a0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/io/File;

    const-wide/32 v7, 0x5000000

    cmp-long v7, v4, v7

    if-gtz v7, :cond_62

    const/16 v7, 0xb4

    if-gt v0, v7, :cond_62

    goto :goto_a0

    .line 203
    :cond_62
    invoke-virtual {v6}, Ljava/io/File;->length()J

    move-result-wide v7

    invoke-static {v2, v3, v7, v8}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v7

    .line 204
    invoke-virtual {v6}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v6}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v10

    add-int/lit8 v10, v10, -0x7

    const/4 v11, 0x0

    invoke-virtual {v9, v11, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    .line 205
    invoke-virtual {v6}, Ljava/io/File;->delete()Z

    move-result v6

    if-eqz v6, :cond_4a

    .line 207
    new-instance v6, Ljava/io/File;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, ".type"

    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v6, p0, v9}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v6}, Ljava/io/File;->delete()Z

    sub-long/2addr v4, v7

    add-int/lit8 v0, v0, -0x1

    goto :goto_4a

    :cond_a0
    :goto_a0
    return-void
.end method

.method private static write(Ljava/io/File;[B)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 165
    new-instance v0, Ljava/io/FileOutputStream;

    invoke-direct {v0, p0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 166
    :try_start_5
    invoke-virtual {v0, p1}, Ljava/io/FileOutputStream;->write([B)V

    .line 167
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->flush()V
    :try_end_b
    .catchall {:try_start_5 .. :try_end_b} :catchall_16

    .line 168
    :try_start_b
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->getFD()Ljava/io/FileDescriptor;

    move-result-object p0

    invoke-virtual {p0}, Ljava/io/FileDescriptor;->sync()V
    :try_end_12
    .catchall {:try_start_b .. :try_end_12} :catchall_12

    .line 169
    :catchall_12
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V

    return-void

    :catchall_16
    move-exception p0

    .line 165
    :try_start_17
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V
    :try_end_1a
    .catchall {:try_start_17 .. :try_end_1a} :catchall_1b

    goto :goto_1f

    :catchall_1b
    move-exception p1

    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_1f
    throw p0
.end method
