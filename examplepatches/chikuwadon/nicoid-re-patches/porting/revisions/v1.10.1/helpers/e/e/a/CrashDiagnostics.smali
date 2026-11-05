.class public final Le/e/a/CrashDiagnostics;
.super Ljava/lang/Object;
.source "CrashDiagnostics.java"


# static fields
.field private static final FILE:Ljava/lang/String; = "nicoid-last-java-crash.txt"

.field private static final LIMIT:I = 0x10000

.field private static installed:Z


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static append(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .registers 8

    .line 50
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object p0

    const-string v1, "nicoid-last-java-crash.txt"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 51
    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result p0

    if-nez p0, :cond_12

    return-object p1

    .line 52
    :cond_12
    const/4 p0, 0x0

    :try_start_13
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, v0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_18
    .catchall {:try_start_13 .. :try_end_18} :catchall_76

    :try_start_18
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_1d
    .catchall {:try_start_18 .. :try_end_1d} :catchall_68

    .line 53
    const/16 v2, 0x1000

    :try_start_1f
    new-array v3, v2, [B

    .line 54
    nop

    :goto_22
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v4

    const/high16 v5, 0x10000

    if-ge v4, v5, :cond_3f

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v4

    sub-int/2addr v5, v4

    invoke-static {v2, v5}, Ljava/lang/Math;->min(II)I

    move-result v4

    const/4 v5, 0x0

    invoke-virtual {v1, v3, v5, v4}, Ljava/io/InputStream;->read([BII)I

    move-result v4

    if-gtz v4, :cond_3b

    goto :goto_3f

    .line 55
    :cond_3b
    invoke-virtual {v0, v3, v5, v4}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_22

    .line 56
    :cond_3f
    :goto_3f
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, "\n\nLast Java crash (retained across restart):\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "UTF-8"

    invoke-virtual {v0, v3}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2
    :try_end_5c
    .catchall {:try_start_1f .. :try_end_5c} :catchall_63

    .line 57
    :try_start_5c
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_5f
    .catchall {:try_start_5c .. :try_end_5f} :catchall_68

    :try_start_5f
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_62
    .catchall {:try_start_5f .. :try_end_62} :catchall_76

    .line 56
    return-object v2

    :catchall_63
    move-exception p0

    .line 57
    :try_start_64
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->close()V

    throw p0
    :try_end_68
    .catchall {:try_start_64 .. :try_end_68} :catchall_68

    :catchall_68
    move-exception v0

    if-eqz p0, :cond_71

    if-eq p0, v0, :cond_72

    :try_start_6d
    invoke-virtual {p0, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_72

    :cond_71
    move-object p0, v0

    :cond_72
    :goto_72
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    throw p0
    :try_end_76
    .catchall {:try_start_6d .. :try_end_76} :catchall_76

    :catchall_76
    move-exception v0

    if-eqz p0, :cond_7f

    if-eq p0, v0, :cond_80

    :try_start_7b
    invoke-virtual {p0, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_80

    :cond_7f
    move-object p0, v0

    :cond_80
    :goto_80
    throw p0
    :try_end_81
    .catch Ljava/io/IOException; {:try_start_7b .. :try_end_81} :catch_81

    :catch_81
    move-exception p0

    return-object p1
.end method

.method public static declared-synchronized install(Landroid/content/Context;)V
    .registers 5

    const-class v0, Le/e/a/CrashDiagnostics;

    monitor-enter v0

    .line 15
    :try_start_3
    sget-boolean v1, Le/e/a/CrashDiagnostics;->installed:Z
    :try_end_5
    .catchall {:try_start_3 .. :try_end_5} :catchall_2e

    if-eqz v1, :cond_9

    monitor-exit v0

    return-void

    .line 16
    :cond_9
    :try_start_9
    invoke-static {p0}, Le/e/a/DebugHeader237;->header(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    .line 17
    const-string v2, "nicoid-debug"

    invoke-static {v2, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 18
    new-instance v2, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object p0

    const-string v3, "nicoid-last-java-crash.txt"

    invoke-direct {v2, p0, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 19
    invoke-static {}, Ljava/lang/Thread;->getDefaultUncaughtExceptionHandler()Ljava/lang/Thread$UncaughtExceptionHandler;

    move-result-object p0

    .line 20
    new-instance v3, Le/e/a/CrashDiagnostics$$ExternalSyntheticLambda0;

    invoke-direct {v3, v2, v1, p0}, Le/e/a/CrashDiagnostics$$ExternalSyntheticLambda0;-><init>(Ljava/io/File;Ljava/lang/String;Ljava/lang/Thread$UncaughtExceptionHandler;)V

    invoke-static {v3}, Ljava/lang/Thread;->setDefaultUncaughtExceptionHandler(Ljava/lang/Thread$UncaughtExceptionHandler;)V

    .line 31
    const/4 p0, 0x1

    sput-boolean p0, Le/e/a/CrashDiagnostics;->installed:Z
    :try_end_2c
    .catchall {:try_start_9 .. :try_end_2c} :catchall_2e

    .line 32
    monitor-exit v0

    return-void

    .line 14
    :catchall_2e
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method static synthetic lambda$0(Ljava/io/File;Ljava/lang/String;Ljava/lang/Thread$UncaughtExceptionHandler;Ljava/lang/Thread;Ljava/lang/Throwable;)V
    .registers 9

    .line 21
    const/4 v0, 0x0

    :try_start_1
    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, p0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_4a

    .line 22
    :try_start_6
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string p1, "Time: "

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {p0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, "\n"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-static {p4}, Le/e/a/CrashDiagnostics;->trace(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "UTF-8"

    invoke-virtual {p0, p1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object p0

    .line 23
    array-length p1, p0

    const/high16 v2, 0x10000

    invoke-static {p1, v2}, Ljava/lang/Math;->min(II)I

    move-result p1

    const/4 v2, 0x0

    invoke-virtual {v1, p0, v2, p1}, Ljava/io/OutputStream;->write([BII)V
    :try_end_40
    .catchall {:try_start_6 .. :try_end_40} :catchall_44

    .line 24
    :try_start_40
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V

    goto :goto_55

    :catchall_44
    move-exception p0

    move-object v0, p0

    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V

    throw v0
    :try_end_4a
    .catchall {:try_start_40 .. :try_end_4a} :catchall_4a

    :catchall_4a
    move-exception p0

    if-eqz v0, :cond_53

    if-eq v0, p0, :cond_52

    :try_start_4f
    invoke-virtual {v0, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_52
    move-object p0, v0

    :cond_53
    throw p0
    :try_end_54
    .catchall {:try_start_4f .. :try_end_54} :catchall_54

    :catchall_54
    move-exception p0

    .line 25
    :goto_55
    if-eqz p2, :cond_5b

    invoke-interface {p2, p3, p4}, Ljava/lang/Thread$UncaughtExceptionHandler;->uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    goto :goto_67

    .line 27
    :cond_5b
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result p0

    invoke-static {p0}, Landroid/os/Process;->killProcess(I)V

    .line 28
    const/16 p0, 0xa

    invoke-static {p0}, Ljava/lang/System;->exit(I)V

    .line 30
    :goto_67
    return-void
.end method

.method static trace(Ljava/lang/Throwable;)Ljava/lang/String;
    .registers 10

    .line 35
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 36
    new-instance v1, Ljava/util/IdentityHashMap;

    invoke-direct {v1}, Ljava/util/IdentityHashMap;-><init>()V

    invoke-static {v1}, Ljava/util/Collections;->newSetFromMap(Ljava/util/Map;)Ljava/util/Set;

    move-result-object v1

    .line 37
    nop

    .line 38
    const/4 v2, 0x0

    move v3, v2

    :goto_11
    if-eqz p0, :cond_57

    add-int/lit8 v4, v3, 0x1

    const/16 v5, 0x8

    if-ge v3, v5, :cond_57

    invoke-interface {v1, p0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_20

    goto :goto_57

    .line 40
    :cond_20
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v5, 0xa

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 41
    invoke-virtual {p0}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v3

    .line 42
    move v6, v2

    :goto_36
    array-length v7, v3

    const/16 v8, 0x40

    invoke-static {v7, v8}, Ljava/lang/Math;->min(II)I

    move-result v7

    if-lt v6, v7, :cond_45

    .line 44
    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object p0

    move v3, v4

    goto :goto_11

    .line 43
    :cond_45
    const-string v7, "  at "

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    aget-object v8, v3, v6

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 42
    add-int/lit8 v6, v6, 0x1

    goto :goto_36

    .line 46
    :cond_57
    :goto_57
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
