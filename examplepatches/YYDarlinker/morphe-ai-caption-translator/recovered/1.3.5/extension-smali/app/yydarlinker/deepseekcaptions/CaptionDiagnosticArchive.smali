.class final Lapp/yydarlinker/deepseekcaptions/CaptionDiagnosticArchive;
.super Ljava/lang/Object;
.source "CaptionDiagnosticArchive.java"


# static fields
.field private static final IO:Ljava/util/concurrent/ThreadPoolExecutor;

.field static final RETENTION_MS:J = 0x5265c00L

.field static final SEGMENTS:I = 0x20

.field static final SEGMENT_BYTES:I = 0x40000

.field private static final dropped:Ljava/util/concurrent/atomic/AtomicLong;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    .line 13
    new-instance v0, Ljava/util/concurrent/ThreadPoolExecutor;

    sget-object v5, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v6, Ljava/util/concurrent/ArrayBlockingQueue;

    const/16 v1, 0x100

    invoke-direct {v6, v1}, Ljava/util/concurrent/ArrayBlockingQueue;-><init>(I)V

    new-instance v7, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnosticArchive$$ExternalSyntheticLambda5;

    invoke-direct {v7}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnosticArchive$$ExternalSyntheticLambda5;-><init>()V

    const/4 v1, 0x1

    const/4 v2, 0x1

    const-wide/16 v3, 0x1e

    invoke-direct/range {v0 .. v7}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnosticArchive;->IO:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 15
    new-instance v1, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v1}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    sput-object v1, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnosticArchive;->dropped:Ljava/util/concurrent/atomic/AtomicLong;

    const/4 v1, 0x1

    .line 16
    invoke-virtual {v0, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->allowCoreThreadTimeOut(Z)V

    return-void
.end method

.method constructor <init>()V
    .registers 1

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static append(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .registers 6

    .line 18
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object p0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "caption-diagnostics-r25/"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p0, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 19
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p0

    const p1, 0xea60

    if-le p0, p1, :cond_36

    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v1, 0x0

    invoke-virtual {p2, v1, p1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " [record truncated at 60000 chars]"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 20
    :cond_36
    :try_start_36
    sget-object p0, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnosticArchive;->IO:Ljava/util/concurrent/ThreadPoolExecutor;

    new-instance p1, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnosticArchive$$ExternalSyntheticLambda2;

    invoke-direct {p1, v0, p2}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnosticArchive$$ExternalSyntheticLambda2;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V
    :try_end_40
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_36 .. :try_end_40} :catch_41

    return-void

    .line 21
    :catch_41
    sget-object p0, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnosticArchive;->dropped:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicLong;->incrementAndGet()J

    return-void
.end method

.method static appendNow(Ljava/io/File;Ljava/lang/String;)V
    .registers 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 29
    invoke-virtual {p0}, Ljava/io/File;->mkdirs()Z

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 30
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnosticArchive;->files(Ljava/io/File;)[Ljava/io/File;

    move-result-object v2

    array-length v3, v2

    const/4 v4, 0x0

    move v5, v4

    :goto_e
    if-ge v5, v3, :cond_25

    aget-object v6, v2, v5

    invoke-virtual {v6}, Ljava/io/File;->lastModified()J

    move-result-wide v7

    sub-long v7, v0, v7

    const-wide/32 v9, 0x5265c00

    cmp-long v7, v7, v9

    if-lez v7, :cond_22

    invoke-virtual {v6}, Ljava/io/File;->delete()Z

    :cond_22
    add-int/lit8 v5, v5, 0x1

    goto :goto_e

    .line 31
    :cond_25
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnosticArchive;->files(Ljava/io/File;)[Ljava/io/File;

    move-result-object v2

    array-length v3, v2

    const/4 v5, 0x1

    if-nez v3, :cond_2f

    const/4 v3, 0x0

    goto :goto_33

    :cond_2f
    array-length v3, v2

    sub-int/2addr v3, v5

    aget-object v3, v2, v3

    .line 32
    :goto_33
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v6

    const v7, 0xea60

    if-le v6, v7, :cond_51

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, v4, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " [record truncated at 60000 chars]"

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 33
    :cond_51
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\n"

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    sget-object v6, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p1, v6}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p1

    if-eqz v3, :cond_78

    .line 34
    invoke-virtual {v3}, Ljava/io/File;->length()J

    move-result-wide v6

    array-length v8, p1

    int-to-long v8, v8

    add-long/2addr v6, v8

    const-wide/32 v8, 0x40000

    cmp-long v6, v6, v8

    if-lez v6, :cond_a8

    .line 35
    :cond_78
    array-length v2, v2

    if-nez v2, :cond_7c

    goto :goto_93

    :cond_7c
    invoke-virtual {v3}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v3, ".log"

    const-string v6, ""

    invoke-virtual {v2, v3, v6}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v2

    const-wide/16 v6, 0x1

    add-long/2addr v2, v6

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    .line 36
    :goto_93
    new-instance v3, Ljava/io/File;

    sget-object v2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    new-array v1, v5, [Ljava/lang/Object;

    aput-object v0, v1, v4

    const-string v0, "%019d.log"

    invoke-static {v2, v0, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v3, p0, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 38
    :cond_a8
    new-instance v0, Ljava/io/FileOutputStream;

    invoke-direct {v0, v3, v5}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V

    :try_start_ad
    invoke-virtual {v0, p1}, Ljava/io/FileOutputStream;->write([B)V
    :try_end_b0
    .catchall {:try_start_ad .. :try_end_b0} :catchall_c5

    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V

    .line 39
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnosticArchive;->files(Ljava/io/File;)[Ljava/io/File;

    move-result-object p0

    :goto_b7
    array-length p1, p0

    add-int/lit8 p1, p1, -0x20

    if-ge v4, p1, :cond_c4

    aget-object p1, p0, v4

    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    add-int/lit8 v4, v4, 0x1

    goto :goto_b7

    :cond_c4
    return-void

    :catchall_c5
    move-exception p0

    .line 38
    :try_start_c6
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V
    :try_end_c9
    .catchall {:try_start_c6 .. :try_end_c9} :catchall_ca

    goto :goto_ce

    :catchall_ca
    move-exception p1

    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_ce
    throw p0
.end method

.method static clear(Landroid/content/Context;)V
    .registers 4

    .line 53
    :try_start_0
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnosticArchive;->IO:Ljava/util/concurrent/ThreadPoolExecutor;

    new-instance v1, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnosticArchive$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnosticArchive$$ExternalSyntheticLambda1;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    move-result-object p0

    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v1, 0x1e

    invoke-interface {p0, v1, v2, v0}, Ljava/util/concurrent/Future;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;
    :try_end_12
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_12} :catch_12

    :catch_12
    return-void
.end method

.method private static files(Ljava/io/File;)[Ljava/io/File;
    .registers 2

    .line 24
    new-instance v0, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnosticArchive$$ExternalSyntheticLambda3;

    invoke-direct {v0}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnosticArchive$$ExternalSyntheticLambda3;-><init>()V

    invoke-virtual {p0, v0}, Ljava/io/File;->listFiles(Ljava/io/FilenameFilter;)[Ljava/io/File;

    move-result-object p0

    if-nez p0, :cond_f

    const/4 p0, 0x0

    .line 25
    new-array p0, p0, [Ljava/io/File;

    return-object p0

    .line 26
    :cond_f
    new-instance v0, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnosticArchive$$ExternalSyntheticLambda4;

    invoke-direct {v0}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnosticArchive$$ExternalSyntheticLambda4;-><init>()V

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticApiModelOutline0;->m(Ljava/util/function/Function;)Ljava/util/Comparator;

    move-result-object v0

    invoke-static {p0, v0}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    return-object p0
.end method

.method static synthetic lambda$append$1(Ljava/io/File;Ljava/lang/String;)V
    .registers 2

    .line 20
    :try_start_0
    invoke-static {p0, p1}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnosticArchive;->appendNow(Ljava/io/File;Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_3} :catch_4

    return-void

    :catch_4
    sget-object p0, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnosticArchive;->dropped:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicLong;->incrementAndGet()J

    return-void
.end method

.method static synthetic lambda$clear$4(Landroid/content/Context;)V
    .registers 9

    .line 53
    const-string v0, "history"

    const-string v1, "quality"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    move v2, v1

    :goto_a
    const/4 v3, 0x2

    if-ge v2, v3, :cond_39

    aget-object v3, v0, v2

    new-instance v4, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "caption-diagnostics-r25/"

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v4, v5, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v4}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnosticArchive;->files(Ljava/io/File;)[Ljava/io/File;

    move-result-object v3

    array-length v4, v3

    move v5, v1

    :goto_2c
    if-ge v5, v4, :cond_36

    aget-object v6, v3, v5

    invoke-virtual {v6}, Ljava/io/File;->delete()Z

    add-int/lit8 v5, v5, 0x1

    goto :goto_2c

    :cond_36
    add-int/lit8 v2, v2, 0x1

    goto :goto_a

    :cond_39
    sget-object p0, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnosticArchive;->dropped:Ljava/util/concurrent/atomic/AtomicLong;

    const-wide/16 v0, 0x0

    invoke-virtual {p0, v0, v1}, Ljava/util/concurrent/atomic/AtomicLong;->set(J)V

    return-void
.end method

.method static synthetic lambda$files$2(Ljava/io/File;Ljava/lang/String;)Z
    .registers 2

    .line 24
    const-string p0, ".log"

    invoke-virtual {p1, p0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method static synthetic lambda$read$3(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 43
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    .line 44
    new-instance v3, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object p0

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "caption-diagnostics-r25/"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v3, p0, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v3}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnosticArchive;->files(Ljava/io/File;)[Ljava/io/File;

    move-result-object p0

    array-length p1, p0

    const/4 v3, 0x0

    move v4, v3

    :goto_27
    if-ge v4, p1, :cond_6f

    aget-object v5, p0, v4

    .line 45
    invoke-virtual {v5}, Ljava/io/File;->lastModified()J

    move-result-wide v6

    sub-long v6, v1, v6

    const-wide/32 v8, 0x5265c00

    cmp-long v6, v6, v8

    if-lez v6, :cond_3c

    invoke-virtual {v5}, Ljava/io/File;->delete()Z

    goto :goto_62

    .line 46
    :cond_3c
    new-instance v6, Ljava/io/FileInputStream;

    invoke-direct {v6, v5}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    :try_start_41
    invoke-virtual {v5}, Ljava/io/File;->length()J

    move-result-wide v7

    long-to-int v5, v7

    new-array v7, v5, [B

    move v8, v3

    :goto_49
    if-ge v8, v5, :cond_55

    sub-int v9, v5, v8

    invoke-virtual {v6, v7, v8, v9}, Ljava/io/InputStream;->read([BII)I

    move-result v9

    if-lez v9, :cond_55

    add-int/2addr v8, v9

    goto :goto_49

    :cond_55
    new-instance v5, Ljava/lang/String;

    sget-object v9, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v5, v7, v3, v8, v9}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_5f
    .catchall {:try_start_41 .. :try_end_5f} :catchall_65

    invoke-virtual {v6}, Ljava/io/InputStream;->close()V

    :goto_62
    add-int/lit8 v4, v4, 0x1

    goto :goto_27

    :catchall_65
    move-exception p0

    :try_start_66
    invoke-virtual {v6}, Ljava/io/InputStream;->close()V
    :try_end_69
    .catchall {:try_start_66 .. :try_end_69} :catchall_6a

    goto :goto_6e

    :catchall_6a
    move-exception p1

    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_6e
    throw p0

    .line 48
    :cond_6f
    sget-object p0, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnosticArchive;->dropped:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmp-long p1, v1, v3

    if-lez p1, :cond_8c

    const-string p1, "\n[archive dropped records: "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide p0

    invoke-virtual {v0, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p0, "]\n"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    :cond_8c
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$static$0(Ljava/lang/Runnable;)Ljava/lang/Thread;
    .registers 3

    .line 14
    new-instance v0, Ljava/lang/Thread;

    const-string v1, "caption-diagnostics"

    invoke-direct {v0, p0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    const/4 p0, 0x1

    invoke-virtual {v0, p0}, Ljava/lang/Thread;->setDaemon(Z)V

    return-object v0
.end method

.method static read(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 42
    :try_start_0
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnosticArchive;->IO:Ljava/util/concurrent/ThreadPoolExecutor;

    new-instance v1, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnosticArchive$$ExternalSyntheticLambda6;

    invoke-direct {v1, p0, p1}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnosticArchive$$ExternalSyntheticLambda6;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    move-result-object p0

    sget-object p1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v0, 0x1e

    .line 50
    invoke-interface {p0, v0, v1, p1}, Ljava/util/concurrent/Future;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;
    :try_end_15
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_15} :catch_16

    return-object p0

    :catch_16
    move-exception p0

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "[archive read failed: "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "]"

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
