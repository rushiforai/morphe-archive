.class public final Lcom/opera/android/crashhandler/MainProcessCrashHandler;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lqz5;


# instance fields
.field public final a:Lwom;

.field public final b:Lis3;

.field public final c:I

.field public final d:Lay;

.field public final e:Lks3;


# direct methods
.method public constructor <init>(Lcom/opera/android/OperaApplication;Lwom;Lis3;Lks3;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/opera/android/crashhandler/MainProcessCrashHandler;->a:Lwom;

    iput-object p3, p0, Lcom/opera/android/crashhandler/MainProcessCrashHandler;->b:Lis3;

    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result p2

    iput p2, p0, Lcom/opera/android/crashhandler/MainProcessCrashHandler;->c:I

    iput-object p4, p0, Lcom/opera/android/crashhandler/MainProcessCrashHandler;->e:Lks3;

    new-instance p2, Lay;

    invoke-direct {p2, p0, p1}, Lay;-><init>(Lcom/opera/android/crashhandler/MainProcessCrashHandler;Lcom/opera/android/OperaApplication;)V

    sget-object p1, Lvml;->d:Lumi;

    invoke-static {p2, p1}, Lcom/opera/android/Lazy;->e(Lcom/opera/android/Lazy;Lumi;)V

    iput-object p2, p0, Lcom/opera/android/crashhandler/MainProcessCrashHandler;->d:Lay;

    return-void
.end method


# virtual methods
.method public final a(J)V
    .registers 7

    iget p0, p0, Lcom/opera/android/crashhandler/MainProcessCrashHandler;->c:I

    int-to-long v0, p0

    cmp-long v0, p1, v0

    const-string v1, "Auxiliary stack, thread="

    if-nez v0, :cond_33

    sget-object p0, Lvml;->a:Ljava/util/concurrent/ScheduledExecutorService;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object p0

    invoke-virtual {p0}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object p1

    new-instance p2, Ljava/lang/Exception;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p2, p0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/Throwable;->setStackTrace([Ljava/lang/StackTraceElement;)V

    invoke-virtual {p2}, Ljava/lang/Throwable;->printStackTrace()V

    return-void

    :cond_33
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v0

    sget-object v2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "cat /proc/"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, "/task/"

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p0, "/comm"

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object p0

    invoke-static {p0}, Lxvg;->z(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object p0

    const-string p1, "\n"

    const-string p2, ""

    invoke-virtual {p0, p1, p2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    invoke-static {}, Ljava/lang/Thread;->getAllStackTraces()Ljava/util/Map;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_74
    :goto_74
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_ba

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/Map$Entry;

    invoke-interface {p2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_74

    invoke-virtual {v0, p0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_74

    invoke-interface {p2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Thread;

    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, [Ljava/lang/StackTraceElement;

    new-instance v2, Ljava/lang/Exception;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p2}, Ljava/lang/Throwable;->setStackTrace([Ljava/lang/StackTraceElement;)V

    invoke-virtual {v2}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_74

    :cond_ba
    return-void
.end method

.method public final b(Ljava/io/File;)V
    .registers 6

    :try_start_0
    const-string v0, "https://crashstats-collector.opera.com/collector/submit"

    monitor-enter v0
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_3} :catch_24
    .catchall {:try_start_0 .. :try_end_3} :catchall_1d

    :try_start_3
    new-instance v1, Leq6;

    invoke-direct {v1, p1}, Leq6;-><init>(Ljava/lang/Object;)V

    iget-object v2, p0, Lcom/opera/android/crashhandler/MainProcessCrashHandler;->e:Lks3;

    invoke-virtual {v1, v2}, Leq6;->Q(Lks3;)V

    iget-object p0, p0, Lcom/opera/android/crashhandler/MainProcessCrashHandler;->a:Lwom;

    invoke-interface {p0}, Lwom;->c()V

    sget-object p0, Lpz5;->b:Ljava/util/regex/Pattern;

    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    monitor-exit v0

    return-void

    :goto_19
    monitor-exit v0
    :try_end_1a
    .catchall {:try_start_3 .. :try_end_1a} :catchall_1b

    :try_start_1a
    throw p0
    :try_end_1b
    .catch Ljava/io/IOException; {:try_start_1a .. :try_end_1b} :catch_24
    .catchall {:try_start_1a .. :try_end_1b} :catchall_1d

    :catchall_1b
    move-exception p0

    goto :goto_19

    :catchall_1d
    move-exception p0

    sget-object v0, Lpz5;->b:Ljava/util/regex/Pattern;

    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    throw p0

    :catch_24
    sget-object p0, Lpz5;->b:Ljava/util/regex/Pattern;

    invoke-virtual {p1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object p0

    const-string v0, ".try"

    invoke-static {p0}, Lpz5;->b(Ljava/lang/String;)I

    move-result v1

    if-ltz v1, :cond_49

    add-int/lit8 v2, v1, 0x1

    invoke-static {v1, v0}, Lsko;->i(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    goto :goto_4f

    :cond_49
    const-string v0, ".try1"

    invoke-virtual {p0, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    :goto_4f
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v0

    if-nez v0, :cond_5b

    const/4 p0, 0x0

    :cond_5b
    if-nez p0, :cond_61

    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    return-void

    :cond_61
    invoke-static {p0}, Lpz5;->b(Ljava/lang/String;)I

    move-result p1

    if-gez p1, :cond_68

    const/4 p1, 0x0

    :cond_68
    const/4 v0, 0x3

    if-lt p1, v0, :cond_73

    new-instance p1, Ljava/io/File;

    invoke-direct {p1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    :cond_73
    return-void
.end method

.method public final d()V
    .registers 4

    iget-object v0, p0, Lcom/opera/android/crashhandler/MainProcessCrashHandler;->d:Lay;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lpz5;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Ljava/io/File;

    iget-object v0, v0, Lpz5;->a:Ljava/io/File;

    const-string v2, "Crashpad"

    invoke-direct {v1, v0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    const-string v1, "CrashReporter"

    invoke-static {p0, v0, v1}, LJ/N;->MkFw6nJp(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)J

    new-instance v0, Lyzb;

    const/16 v1, 0x10

    invoke-direct {v0, p0, v1}, Lyzb;-><init>(Ljava/lang/Object;B)V

    sput-object v0, Lorg/chromium/components/crash/browser/ChildProcessCrashObserver;->a:Lyzb;

    sget-object p0, Lrz5;->a:Lorg/chromium/components/crash/CrashKeys;

    invoke-virtual {p0}, Lorg/chromium/components/crash/CrashKeys;->flushToNative()V

    return-void
.end method

.method public final g(Lis3;)V
    .registers 13

    iget-object v0, p0, Lcom/opera/android/crashhandler/MainProcessCrashHandler;->d:Lay;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lpz5;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lpz5;->a(Ljava/util/regex/Pattern;)[Ljava/io/File;

    move-result-object v1

    array-length v2, v1

    const/4 v3, 0x0

    move v4, v3

    move v5, v4

    :goto_11
    if-ge v4, v2, :cond_3e

    aget-object v6, v1, v4

    new-instance v7, Ljava/util/Date;

    invoke-direct {v7}, Ljava/util/Date;-><init>()V

    invoke-virtual {v7}, Ljava/util/Date;->getTime()J

    move-result-wide v7

    invoke-virtual {v6}, Ljava/io/File;->lastModified()J

    move-result-wide v9

    sub-long/2addr v7, v9

    const-wide/32 v9, 0x5265c00

    div-long/2addr v7, v9

    const-wide/16 v9, 0x1e

    cmp-long v7, v7, v9

    if-lez v7, :cond_31

    invoke-virtual {v6}, Ljava/io/File;->delete()Z

    goto :goto_3b

    :cond_31
    const/16 v7, 0xa

    if-ge v5, v7, :cond_38

    add-int/lit8 v5, v5, 0x1

    goto :goto_3b

    :cond_38
    invoke-virtual {v6}, Ljava/io/File;->delete()Z

    :goto_3b
    add-int/lit8 v4, v4, 0x1

    goto :goto_11

    :cond_3e
    sget-object v1, Lpz5;->c:Ljava/util/regex/Pattern;

    invoke-virtual {v0, v1}, Lpz5;->a(Ljava/util/regex/Pattern;)[Ljava/io/File;

    move-result-object v0

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    array-length v2, v0

    move v4, v3

    :goto_4b
    if-ge v4, v2, :cond_63

    aget-object v5, v0, v4

    invoke-virtual {v5}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lpz5;->b(Ljava/lang/String;)I

    move-result v6

    if-gez v6, :cond_5a

    move v6, v3

    :cond_5a
    const/4 v7, 0x3

    if-ge v6, v7, :cond_60

    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_60
    add-int/lit8 v4, v4, 0x1

    goto :goto_4b

    :cond_63
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    new-array v0, v0, [Ljava/io/File;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/io/File;

    array-length v1, v0

    :goto_70
    if-ge v3, v1, :cond_8d

    aget-object v2, v0, v3

    :try_start_74
    iget-object v4, p0, Lcom/opera/android/crashhandler/MainProcessCrashHandler;->a:Lwom;

    invoke-interface {v4}, Lwom;->d()Z

    move-result v4

    if-eqz v4, :cond_80

    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    goto :goto_8a

    :cond_80
    invoke-virtual {p0, v2}, Lcom/opera/android/crashhandler/MainProcessCrashHandler;->b(Ljava/io/File;)V
    :try_end_83
    .catchall {:try_start_74 .. :try_end_83} :catchall_84

    goto :goto_8a

    :catchall_84
    move-exception v2

    iget-object v4, p1, Lis3;->a:Lks3;

    invoke-virtual {v4, v2}, Lks3;->H(Ljava/lang/Throwable;)V

    :goto_8a
    add-int/lit8 v3, v3, 0x1

    goto :goto_70

    :cond_8d
    return-void
.end method

.method public final h(Ljava/util/HashMap;)V
    .registers 7

    const/4 v0, 0x0

    invoke-static {v0}, Ltz5;->d(Z)V

    iget-object v1, p0, Lcom/opera/android/crashhandler/MainProcessCrashHandler;->a:Lwom;

    invoke-interface {v1}, Lwom;->d()Z

    move-result v1

    if-nez v1, :cond_7e

    iget-object v1, p0, Lcom/opera/android/crashhandler/MainProcessCrashHandler;->d:Lay;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lpz5;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Ljava/io/File;

    new-instance v3, Ljava/io/File;

    iget-object v1, v1, Lpz5;->a:Ljava/io/File;

    const-string v4, "crash_dumps"

    invoke-direct {v3, v1, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, ".dmp"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v4, ".try0"

    invoke-virtual {v1, v4}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v3, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    new-instance v1, Lsxd;

    invoke-direct {v1, v2, p1, v0}, Lsxd;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v1}, Lsxd;->a()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_5e

    :try_start_5a
    invoke-virtual {p0, v2}, Lcom/opera/android/crashhandler/MainProcessCrashHandler;->b(Ljava/io/File;)V
    :try_end_5d
    .catch Lf13; {:try_start_5a .. :try_end_5d} :catch_5e

    return-void

    :catch_5e
    :cond_5e
    const-string v0, "https://crashstats-collector.opera.com/collector/submit"

    new-instance v1, Lhvj;

    iget-object p0, p0, Lcom/opera/android/crashhandler/MainProcessCrashHandler;->e:Lks3;

    invoke-direct {v1, p0}, Lhvj;-><init>(Lks3;)V

    :try_start_67
    new-instance p0, Ljava/net/URL;

    invoke-direct {p0, v0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Lhvj;->h(Ljava/net/URL;)V

    invoke-virtual {v1, p1}, Lhvj;->m(Ljava/util/HashMap;)V

    invoke-virtual {v1}, Lhvj;->l()V
    :try_end_75
    .catch Ljava/io/IOException; {:try_start_67 .. :try_end_75} :catch_7b
    .catchall {:try_start_67 .. :try_end_75} :catchall_76

    goto :goto_7b

    :catchall_76
    move-exception p0

    invoke-static {v1}, Lxvg;->l(Ljava/io/Closeable;)V

    throw p0

    :catch_7b
    :goto_7b
    invoke-static {v1}, Lxvg;->l(Ljava/io/Closeable;)V

    :cond_7e
    return-void
.end method

.method public final onNativeCrash(J)V
    .registers 3

    :try_start_0
    invoke-virtual {p0, p1, p2}, Lcom/opera/android/crashhandler/MainProcessCrashHandler;->a(J)V
    :try_end_3
    .catchall {:try_start_0 .. :try_end_3} :catchall_3

    :catchall_3
    const/4 p1, 0x1

    invoke-static {p1}, Ltz5;->d(Z)V

    iget-object p1, p0, Lcom/opera/android/crashhandler/MainProcessCrashHandler;->a:Lwom;

    invoke-interface {p1}, Lwom;->d()Z

    move-result p1

    if-nez p1, :cond_1c

    iget-object p0, p0, Lcom/opera/android/crashhandler/MainProcessCrashHandler;->b:Lis3;

    iget-object p0, p0, Lis3;->a:Lks3;

    iget-object p0, p0, Lks3;->b:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    const-wide/16 p1, 0xa

    invoke-static {p1, p2, p0}, Lcom/opera/android/crashhandler/CrashReportProcessingService;->c(JLandroid/content/Context;)V

    :cond_1c
    return-void
.end method
