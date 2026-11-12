.class public Lcom/opera/android/crashhandler/CrashReportProcessingService;
.super Lilf;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    return-void
.end method

.method public static c(JLandroid/content/Context;)V
    .registers 7

    const-wide/16 v0, 0x0

    cmp-long v0, p0, v0

    const-class v1, Lcom/opera/android/crashhandler/CrashReportProcessingService;

    if-nez v0, :cond_15

    new-instance p0, Landroid/content/Intent;

    const-string p1, "com.opera.android.crash.PROCESS_REPORTS"

    invoke-direct {p0, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const/16 p1, 0x3f4

    invoke-static {p2, v1, p1, p0}, Lilf;->a(Landroid/content/Context;Ljava/lang/Class;ILandroid/content/Intent;)V

    return-void

    :cond_15
    const-string v0, "alarm"

    invoke-virtual {p2, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2, p2, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "com.opera.android.crash.DELAYED_PROCESS_REPORTS"

    invoke-virtual {v2, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {p2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    const/4 v2, 0x0

    const/high16 v3, 0x4000000

    invoke-static {p2, v2, v1, v3}, Landroid/app/PendingIntent;->getService(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p2

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v3, p0, p1}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide p0

    add-long/2addr p0, v1

    const/4 v1, 0x3

    invoke-virtual {v0, v1, p0, p1, p2}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    return-void
.end method


# virtual methods
.method public final b(Landroid/content/Intent;)V
    .registers 18

    invoke-static/range {p0 .. p0}, Lsfe;->g0(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_12

    const-string v0, "com.opera.android.crash.PROCESS_REPORTS"

    invoke-virtual/range {p1 .. p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_13

    :cond_12
    return-void

    :cond_13
    new-instance v0, Lpz5;

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v1

    invoke-direct {v0, v1}, Lpz5;-><init>(Ljava/io/File;)V

    :try_start_20
    sget-object v2, Lwbc;->g:Lwbc;

    invoke-virtual {v2}, Lwbc;->a()V
    :try_end_25
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_20 .. :try_end_25} :catch_3e
    .catch Lh1h; {:try_start_20 .. :try_end_25} :catch_3e

    new-instance v2, Ljava/io/File;

    const-string v3, "Crashpad"

    invoke-direct {v2, v1, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    new-instance v3, Ljava/io/File;

    const-string v4, "crash_dumps"

    invoke-direct {v3, v1, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, LJ/N;->MjZjkDM7(Ljava/lang/Object;Ljava/lang/Object;)V

    :catch_3e
    const-string v1, ".try0"

    sget-object v2, Lpz5;->b:Ljava/util/regex/Pattern;

    invoke-virtual {v0, v2}, Lpz5;->a(Ljava/util/regex/Pattern;)[Ljava/io/File;

    move-result-object v0

    array-length v2, v0

    const/4 v4, 0x0

    move v5, v4

    const/4 v6, 0x0

    :goto_4a
    if-ge v5, v2, :cond_1b0

    aget-object v7, v0, v5

    new-instance v8, Ljava/util/HashMap;

    invoke-direct {v8}, Ljava/util/HashMap;-><init>()V

    :try_start_53
    sget-object v9, Lcom/opera/android/crashhandler/OperaCrashKeys;->c:[Ljava/lang/String;

    const/16 v10, 0x23

    aget-object v9, v9, v10

    invoke-static {}, Ltz5;->b()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v9, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    invoke-virtual {v7}, Ljava/io/File;->lastModified()J

    move-result-wide v11

    sub-long/2addr v9, v11

    const-wide/32 v11, 0x36ee80

    div-long/2addr v9, v11
    :try_end_6d
    .catchall {:try_start_53 .. :try_end_6d} :catchall_8e

    const-wide/16 v11, 0xc

    cmp-long v9, v9, v11

    if-gez v9, :cond_b1

    if-nez v6, :cond_7c

    :try_start_75
    invoke-static {}, Lk1g;->w()Ljava/util/List;

    move-result-object v6
    :try_end_79
    .catch Ljava/lang/Exception; {:try_start_75 .. :try_end_79} :catch_7a
    .catchall {:try_start_75 .. :try_end_79} :catchall_8e

    goto :goto_7c

    :catch_7a
    :try_start_7a
    sget-object v6, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    :cond_7c
    :goto_7c
    invoke-interface {v6}, Ljava/util/List;->isEmpty()Z

    move-result v9

    if-nez v9, :cond_b1

    const-string v9, "Logs"

    const-string v10, "\n"

    invoke-static {v10, v6}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v9, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_8d
    .catchall {:try_start_7a .. :try_end_8d} :catchall_8e

    goto :goto_b1

    :catchall_8e
    invoke-virtual {v8}, Ljava/util/HashMap;->isEmpty()Z

    move-result v9

    if-eqz v9, :cond_b1

    new-instance v8, Ljava/io/File;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v8}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    goto/16 :goto_1a4

    :cond_b1
    :goto_b1
    new-instance v9, Ljava/io/File;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    const-string v10, "\r\n--"

    const-string v11, "--"

    new-instance v12, Ljava/io/File;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v14, ".tmp"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    :try_start_e7
    invoke-static {v7}, Lfsp;->x(Ljava/io/File;)Ljava/lang/String;

    move-result-object v13

    if-nez v13, :cond_111

    new-instance v13, Ljava/util/Random;

    invoke-direct {v13}, Ljava/util/Random;-><init>()V

    new-instance v14, Ljava/math/BigInteger;

    const/16 v15, 0x40

    invoke-direct {v14, v15, v13}, Ljava/math/BigInteger;-><init>(ILjava/util/Random;)V

    sget-object v13, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v15, "%016x"

    filled-new-array {v14}, [Ljava/lang/Object;

    move-result-object v14

    invoke-static {v13, v15, v14}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    const-string v14, "--------------------------"

    invoke-virtual {v14, v13}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    const/4 v14, 0x1

    goto :goto_112

    :goto_10d
    const/4 v3, 0x0

    const/4 v15, 0x0

    goto/16 :goto_1a9

    :cond_111
    move v14, v4

    :goto_112
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v15, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v11, "\r\n"

    invoke-virtual {v15, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    new-instance v15, Ljava/io/BufferedOutputStream;

    new-instance v3, Ljava/io/FileOutputStream;

    invoke-direct {v3, v12}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v15, v3}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_12d
    .catch Ljava/io/IOException; {:try_start_e7 .. :try_end_12d} :catch_199
    .catchall {:try_start_e7 .. :try_end_12d} :catchall_196

    :try_start_12d
    invoke-static {v15, v8, v11}, Lfsp;->K(Ljava/io/BufferedOutputStream;Ljava/util/HashMap;Ljava/lang/String;)V

    new-instance v3, Ljava/io/BufferedInputStream;

    new-instance v8, Ljava/io/FileInputStream;

    invoke-direct {v8, v7}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v3, v8}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_13a
    .catch Ljava/io/IOException; {:try_start_12d .. :try_end_13a} :catch_194
    .catchall {:try_start_12d .. :try_end_13a} :catchall_191

    if-eqz v14, :cond_17a

    :try_start_13c
    invoke-virtual {v11}, Ljava/lang/String;->getBytes()[B

    move-result-object v8

    invoke-virtual {v15, v8}, Ljava/io/OutputStream;->write([B)V

    sget-object v8, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v8, "Content-Disposition: form-data; name=\"IsEncapsulatedCrash\"\r\n\r\n1\r\n"

    invoke-virtual {v8}, Ljava/lang/String;->getBytes()[B

    move-result-object v8

    invoke-virtual {v15, v8}, Ljava/io/OutputStream;->write([B)V

    invoke-virtual {v11}, Ljava/lang/String;->getBytes()[B

    move-result-object v8

    invoke-virtual {v15, v8}, Ljava/io/OutputStream;->write([B)V

    const-string v8, "Content-Disposition: form-data; name=\"upload_file_minidump\"; filename=\"dump\"\r\nContent-Type: application/octet-stream\r\n\r\n"

    invoke-virtual {v8}, Ljava/lang/String;->getBytes()[B

    move-result-object v8

    invoke-virtual {v15, v8}, Ljava/io/OutputStream;->write([B)V

    invoke-static {v3, v15}, Lxvg;->n(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v10, "--\r\n"

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->getBytes()[B

    move-result-object v8

    invoke-virtual {v15, v8}, Ljava/io/OutputStream;->write([B)V

    goto :goto_17d

    :cond_17a
    invoke-static {v3, v15}, Lxvg;->n(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    :try_end_17d
    .catch Ljava/io/IOException; {:try_start_13c .. :try_end_17d} :catch_19b
    .catchall {:try_start_13c .. :try_end_17d} :catchall_1a8

    :goto_17d
    invoke-static {v3}, Lxvg;->l(Ljava/io/Closeable;)V

    invoke-static {v15}, Lxvg;->l(Ljava/io/Closeable;)V

    invoke-virtual {v12, v9}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v3

    if-eqz v3, :cond_18d

    invoke-virtual {v7}, Ljava/io/File;->delete()Z

    goto :goto_1a4

    :cond_18d
    invoke-virtual {v12}, Ljava/io/File;->delete()Z

    goto :goto_1a4

    :catchall_191
    move-exception v0

    const/4 v3, 0x0

    goto :goto_1a9

    :catch_194
    const/4 v3, 0x0

    goto :goto_19b

    :catchall_196
    move-exception v0

    goto/16 :goto_10d

    :catch_199
    const/4 v3, 0x0

    const/4 v15, 0x0

    :catch_19b
    :goto_19b
    :try_start_19b
    invoke-virtual {v12}, Ljava/io/File;->delete()Z
    :try_end_19e
    .catchall {:try_start_19b .. :try_end_19e} :catchall_1a8

    invoke-static {v3}, Lxvg;->l(Ljava/io/Closeable;)V

    invoke-static {v15}, Lxvg;->l(Ljava/io/Closeable;)V

    :goto_1a4
    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_4a

    :catchall_1a8
    move-exception v0

    :goto_1a9
    invoke-static {v3}, Lxvg;->l(Ljava/io/Closeable;)V

    invoke-static {v15}, Lxvg;->l(Ljava/io/Closeable;)V

    throw v0

    :cond_1b0
    sget-object v0, Lks3;->k:Lks3;

    iget-object v1, v0, Lks3;->g:Ljava/lang/Object;

    check-cast v1, Lqz5;

    new-instance v2, Lis3;

    invoke-direct {v2, v0}, Lis3;-><init>(Lks3;)V

    invoke-interface {v1, v2}, Lqz5;->g(Lis3;)V

    return-void
.end method

.method public final onStartCommand(Landroid/content/Intent;II)I
    .registers 6

    const/4 p2, 0x2

    if-eqz p1, :cond_1b

    const-string v0, "com.opera.android.crash.DELAYED_PROCESS_REPORTS"

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1b

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    const-wide/16 v0, 0x0

    invoke-static {v0, v1, p1}, Lcom/opera/android/crashhandler/CrashReportProcessingService;->c(JLandroid/content/Context;)V

    invoke-virtual {p0, p3}, Landroid/app/Service;->stopSelf(I)V

    :cond_1b
    return p2
.end method
