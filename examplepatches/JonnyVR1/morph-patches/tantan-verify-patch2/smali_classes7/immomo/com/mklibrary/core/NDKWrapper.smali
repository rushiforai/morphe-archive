.class public Limmomo/com/mklibrary/core/NDKWrapper;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static volatile libraryLoaded:Z

.field private static final loadLock:Ljava/lang/Object;

.field private static mkpkk:Ljava/lang/String;

.field private static mkpkkRSA:Ljava/lang/String;

.field private static mkstk:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/Object;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Limmomo/com/mklibrary/core/NDKWrapper;->loadLock:Ljava/lang/Object;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static a()V
    .locals 4

    .line 1
    sget-boolean v0, Limmomo/com/mklibrary/core/NDKWrapper;->libraryLoaded:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_3

    .line 6
    :cond_0
    sget-object v0, Limmomo/com/mklibrary/core/NDKWrapper;->loadLock:Ljava/lang/Object;

    .line 7
    .line 8
    monitor-enter v0

    .line 9
    :try_start_0
    sget-boolean v1, Limmomo/com/mklibrary/core/NDKWrapper;->libraryLoaded:Z

    .line 10
    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 14
    return-void

    .line 15
    :catchall_0
    move-exception v1

    .line 16
    goto :goto_4

    .line 17
    :cond_1
    :try_start_1
    invoke-static {}, Ll/lv0;->a()Landroid/content/Context;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    if-eqz v1, :cond_2

    .line 22
    .line 23
    const-string v2, "mkjni"

    .line 24
    .line 25
    invoke-static {v1, v2}, Ll/ylc0;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :catchall_1
    move-exception v1

    .line 30
    goto :goto_1

    .line 31
    :cond_2
    const-string v1, "mkjni"

    .line 32
    .line 33
    invoke-static {v1}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    :goto_0
    const/4 v1, 0x1

    .line 37
    sput-boolean v1, Limmomo/com/mklibrary/core/NDKWrapper;->libraryLoaded:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 38
    .line 39
    goto :goto_2

    .line 40
    :goto_1
    :try_start_2
    const-string v2, "NDKWrapper"

    .line 41
    .line 42
    const-string v3, "load mkjni failure"

    .line 43
    .line 44
    invoke-static {v2, v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 45
    .line 46
    .line 47
    :goto_2
    monitor-exit v0

    .line 48
    :goto_3
    return-void

    .line 49
    :goto_4
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 50
    throw v1
.end method

.method public static b()Ljava/lang/String;
    .locals 3

    .line 1
    const-string v0, "getmkpkk"

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    :try_start_0
    invoke-static {}, Limmomo/com/mklibrary/core/NDKWrapper;->a()V

    .line 6
    .line 7
    .line 8
    sget-object v2, Limmomo/com/mklibrary/core/NDKWrapper;->mkpkk:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {v2}, Limmomo/com/mklibrary/core/NDKWrapper;->d(Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 14
    if-eqz v2, :cond_0

    .line 15
    .line 16
    :try_start_1
    invoke-static {}, Limmomo/com/mklibrary/core/NDKWrapper;->mkpkk()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    sput-object v2, Limmomo/com/mklibrary/core/NDKWrapper;->mkpkk:Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :catchall_0
    move-exception v2

    .line 24
    :try_start_2
    invoke-static {v0, v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :catchall_1
    move-exception v2

    .line 29
    goto :goto_1

    .line 30
    :cond_0
    :goto_0
    sget-object v0, Limmomo/com/mklibrary/core/NDKWrapper;->mkpkk:Ljava/lang/String;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 31
    .line 32
    return-object v0

    .line 33
    :goto_1
    invoke-static {v0, v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 34
    .line 35
    .line 36
    return-object v1
.end method

.method public static c()Ljava/lang/String;
    .locals 3

    .line 1
    const-string v0, "getmkpkkRSA"

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    :try_start_0
    invoke-static {}, Limmomo/com/mklibrary/core/NDKWrapper;->a()V

    .line 6
    .line 7
    .line 8
    sget-object v2, Limmomo/com/mklibrary/core/NDKWrapper;->mkpkkRSA:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {v2}, Limmomo/com/mklibrary/core/NDKWrapper;->d(Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 14
    if-eqz v2, :cond_0

    .line 15
    .line 16
    :try_start_1
    invoke-static {}, Limmomo/com/mklibrary/core/NDKWrapper;->mkpkkRSA()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    sput-object v2, Limmomo/com/mklibrary/core/NDKWrapper;->mkpkkRSA:Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :catchall_0
    move-exception v2

    .line 24
    :try_start_2
    invoke-static {v0, v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :catchall_1
    move-exception v2

    .line 29
    goto :goto_1

    .line 30
    :cond_0
    :goto_0
    sget-object v0, Limmomo/com/mklibrary/core/NDKWrapper;->mkpkkRSA:Ljava/lang/String;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 31
    .line 32
    return-object v0

    .line 33
    :goto_1
    invoke-static {v0, v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 34
    .line 35
    .line 36
    return-object v1
.end method

.method public static d(Ljava/lang/CharSequence;)Z
    .locals 0

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0

    .line 12
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 13
    return p0
.end method

.method private static native mkpkk()Ljava/lang/String;
.end method

.method private static native mkpkkRSA()Ljava/lang/String;
.end method

.method private static native mkstk()Ljava/lang/String;
.end method
