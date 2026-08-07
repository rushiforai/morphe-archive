.class Lcom/mm/mmfile/MMFile;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/mm/mmfile/IMMFile;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mm/mmfile/MMFile$MMFileInstanceFetcher;
    }
.end annotation


# static fields
.field private static final SYSTEM_SERVICE_FETCHERS:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Lcom/mm/mmfile/core/FileWriteConfig;",
            "Lcom/mm/mmfile/MMFile$MMFileInstanceFetcher;",
            ">;"
        }
    .end annotation
.end field

.field static final TAG:Ljava/lang/String; = "MMFile"

.field private static volatile isSoLoaded:Z

.field private static volatile libraryLoader:Lcom/mm/mmfile/LibraryLoader;


# instance fields
.field private mNativePtr:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/mm/mmfile/MMFile;->SYSTEM_SERVICE_FETCHERS:Ljava/util/HashMap;

    .line 7
    .line 8
    return-void
.end method

.method private constructor <init>(Lcom/mm/mmfile/core/FileWriteConfig;)V
    .locals 6

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, -0x1

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/mm/mmfile/MMFile;->mNativePtr:J

    .line 7
    .line 8
    invoke-static {}, Lcom/mm/mmfile/MMFile;->checkLoadLibrary()V

    .line 9
    .line 10
    .line 11
    sget-boolean v2, Lcom/mm/mmfile/MMFile;->isSoLoaded:Z

    .line 12
    .line 13
    const-string v3, "MMFile"

    .line 14
    .line 15
    if-eqz v2, :cond_0

    .line 16
    .line 17
    :try_start_0
    invoke-direct {p0, p1}, Lcom/mm/mmfile/MMFile;->nativeCreate(Lcom/mm/mmfile/core/FileWriteConfig;)J

    .line 18
    .line 19
    .line 20
    move-result-wide v4

    .line 21
    iput-wide v4, p0, Lcom/mm/mmfile/MMFile;->mNativePtr:J
    :try_end_0
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :catch_0
    move-exception v2

    .line 25
    invoke-static {v3, v2}, Lcom/mm/mmfile/Logger;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 26
    .line 27
    .line 28
    iput-wide v0, p0, Lcom/mm/mmfile/MMFile;->mNativePtr:J

    .line 29
    .line 30
    const/4 v2, 0x0

    .line 31
    sput-boolean v2, Lcom/mm/mmfile/MMFile;->isSoLoaded:Z

    .line 32
    .line 33
    :cond_0
    :goto_0
    new-instance v2, Lcom/mm/mmfile/EventListenerWrapper;

    .line 34
    .line 35
    invoke-virtual {p1}, Lcom/mm/mmfile/core/FileWriteConfig;->getEventListener()Lcom/mm/mmfile/core/IMMFileEventListener;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    invoke-direct {v2, v4, p1}, Lcom/mm/mmfile/EventListenerWrapper;-><init>(Lcom/mm/mmfile/core/IMMFileEventListener;Lcom/mm/mmfile/core/FileWriteConfig;)V

    .line 40
    .line 41
    .line 42
    invoke-direct {p0, v2}, Lcom/mm/mmfile/MMFile;->setEventListener(Lcom/mm/mmfile/core/IMMFileEventListener;)V

    .line 43
    .line 44
    .line 45
    iget-wide v4, p0, Lcom/mm/mmfile/MMFile;->mNativePtr:J

    .line 46
    .line 47
    cmp-long p1, v4, v0

    .line 48
    .line 49
    if-eqz p1, :cond_1

    .line 50
    .line 51
    :try_start_1
    invoke-direct {p0, v4, v5}, Lcom/mm/mmfile/MMFile;->nativeStart(J)V
    :try_end_1
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_1 .. :try_end_1} :catch_1

    .line 52
    .line 53
    .line 54
    goto :goto_1

    .line 55
    :catch_1
    move-exception p1

    .line 56
    invoke-static {v3, p1}, Lcom/mm/mmfile/Logger;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 57
    .line 58
    .line 59
    iput-wide v0, p0, Lcom/mm/mmfile/MMFile;->mNativePtr:J

    .line 60
    .line 61
    :cond_1
    :goto_1
    return-void
.end method

.method public synthetic constructor <init>(Lcom/mm/mmfile/core/FileWriteConfig;Lcom/mm/mmfile/MMFile$1;)V
    .locals 0

    .line 62
    invoke-direct {p0, p1}, Lcom/mm/mmfile/MMFile;-><init>(Lcom/mm/mmfile/core/FileWriteConfig;)V

    return-void
.end method

.method private static checkLoadLibrary()V
    .locals 6

    .line 1
    sget-boolean v0, Lcom/mm/mmfile/MMFile;->isSoLoaded:Z

    .line 2
    .line 3
    if-nez v0, :cond_3

    .line 4
    .line 5
    const-class v0, Lcom/mm/mmfile/MMFile;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-boolean v1, Lcom/mm/mmfile/MMFile;->isSoLoaded:Z

    .line 9
    .line 10
    if-nez v1, :cond_2

    .line 11
    .line 12
    sget-object v1, Lcom/mm/mmfile/MMFile;->libraryLoader:Lcom/mm/mmfile/LibraryLoader;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    .line 14
    const/4 v2, 0x1

    .line 15
    const/4 v3, 0x0

    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    :try_start_1
    sget-object v1, Lcom/mm/mmfile/MMFile;->libraryLoader:Lcom/mm/mmfile/LibraryLoader;

    .line 19
    .line 20
    const-string v4, "c++_shared"

    .line 21
    .line 22
    invoke-interface {v1, v4}, Lcom/mm/mmfile/LibraryLoader;->loadLibrary(Ljava/lang/String;)Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    sget-object v4, Lcom/mm/mmfile/MMFile;->libraryLoader:Lcom/mm/mmfile/LibraryLoader;

    .line 27
    .line 28
    const-string v5, "mmfile"

    .line 29
    .line 30
    invoke-interface {v4, v5}, Lcom/mm/mmfile/LibraryLoader;->loadLibrary(Ljava/lang/String;)Z

    .line 31
    .line 32
    .line 33
    move-result v4

    .line 34
    if-eqz v1, :cond_0

    .line 35
    .line 36
    if-eqz v4, :cond_0

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    move v2, v3

    .line 40
    :goto_0
    sput-boolean v2, Lcom/mm/mmfile/MMFile;->isSoLoaded:Z
    :try_end_1
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 41
    .line 42
    goto :goto_1

    .line 43
    :catchall_0
    move-exception v1

    .line 44
    goto :goto_2

    .line 45
    :catch_0
    :try_start_2
    sput-boolean v3, Lcom/mm/mmfile/MMFile;->isSoLoaded:Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_1
    :try_start_3
    const-string v1, "c++_shared"

    .line 49
    .line 50
    invoke-static {v1}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    const-string v1, "mmfile"

    .line 54
    .line 55
    invoke-static {v1}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    sput-boolean v2, Lcom/mm/mmfile/MMFile;->isSoLoaded:Z
    :try_end_3
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 59
    .line 60
    goto :goto_1

    .line 61
    :catch_1
    :try_start_4
    sput-boolean v3, Lcom/mm/mmfile/MMFile;->isSoLoaded:Z

    .line 62
    .line 63
    :cond_2
    :goto_1
    monitor-exit v0

    .line 64
    goto :goto_3

    .line 65
    :goto_2
    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 66
    throw v1

    .line 67
    :cond_3
    :goto_3
    return-void
.end method

.method public static get(Lcom/mm/mmfile/core/FileWriteConfig;)Lcom/mm/mmfile/MMFile;
    .locals 1
    .annotation build Lcom/mm/mmfile/Nullable;
    .end annotation

    .line 1
    sget-object v0, Lcom/mm/mmfile/MMFile;->SYSTEM_SERVICE_FETCHERS:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/mm/mmfile/MMFile$MMFileInstanceFetcher;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/mm/mmfile/MMFile$MMFileInstanceFetcher;->getMMFile()Lcom/mm/mmfile/MMFile;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return-object p0
.end method

.method public static getIfCreated(Lcom/mm/mmfile/core/FileWriteConfig;)Lcom/mm/mmfile/MMFile;
    .locals 1
    .annotation build Lcom/mm/mmfile/Nullable;
    .end annotation

    .line 1
    sget-object v0, Lcom/mm/mmfile/MMFile;->SYSTEM_SERVICE_FETCHERS:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/mm/mmfile/MMFile$MMFileInstanceFetcher;

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0

    .line 13
    :cond_0
    invoke-static {p0}, Lcom/mm/mmfile/MMFile$MMFileInstanceFetcher;->access$000(Lcom/mm/mmfile/MMFile$MMFileInstanceFetcher;)Lcom/mm/mmfile/MMFile;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method private native nativeClose(J)V
.end method

.method private native nativeCreate(Lcom/mm/mmfile/core/FileWriteConfig;)J
.end method

.method private native nativeFlush(J)V
.end method

.method private native nativeOpenNewLogFile(J)V
.end method

.method private static native nativePauseAllLogWrite(Z)V
.end method

.method private native nativePauseLogWrite(JZ)V
.end method

.method private native nativeSetEventListener(JLcom/mm/mmfile/core/IMMFileEventListener;)V
.end method

.method private native nativeStart(J)V
.end method

.method private native nativeUpdateCommonInfo(JLjava/lang/String;[Ljava/lang/String;)V
.end method

.method private native nativeWrite(J[Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public static register(Lcom/mm/mmfile/core/FileWriteConfig;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/mm/mmfile/MMFile;->SYSTEM_SERVICE_FETCHERS:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-nez v1, :cond_1

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    new-instance v1, Lcom/mm/mmfile/MMFile$MMFileInstanceFetcher;

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-direct {v1, p0, v2}, Lcom/mm/mmfile/MMFile$MMFileInstanceFetcher;-><init>(Lcom/mm/mmfile/core/FileWriteConfig;Lcom/mm/mmfile/MMFile$1;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, p0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    const-string p0, "fileWriteConfig can not be null"

    .line 22
    .line 23
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    const-string p0, "fileWriteConfig is already registered"

    .line 28
    .line 29
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public static setAllPauseWrite(Z)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/mm/mmfile/MMFile;->checkLoadLibrary()V

    .line 2
    .line 3
    .line 4
    sget-boolean v0, Lcom/mm/mmfile/MMFile;->isSoLoaded:Z

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    :try_start_0
    invoke-static {p0}, Lcom/mm/mmfile/MMFile;->nativePauseAllLogWrite(Z)V
    :try_end_0
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :catch_0
    move-exception p0

    .line 13
    const-string v0, "MMFile"

    .line 14
    .line 15
    invoke-static {v0, p0}, Lcom/mm/mmfile/Logger;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 16
    .line 17
    .line 18
    const/4 p0, 0x0

    .line 19
    sput-boolean p0, Lcom/mm/mmfile/MMFile;->isSoLoaded:Z

    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method private setEventListener(Lcom/mm/mmfile/core/IMMFileEventListener;)V
    .locals 5

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    iget-wide v0, p0, Lcom/mm/mmfile/MMFile;->mNativePtr:J

    .line 5
    .line 6
    const-wide/16 v2, -0x1

    .line 7
    .line 8
    cmp-long v4, v0, v2

    .line 9
    .line 10
    if-eqz v4, :cond_1

    .line 11
    .line 12
    :try_start_0
    invoke-direct {p0, v0, v1, p1}, Lcom/mm/mmfile/MMFile;->nativeSetEventListener(JLcom/mm/mmfile/core/IMMFileEventListener;)V
    :try_end_0
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :catch_0
    move-exception p1

    .line 17
    const-string v0, "MMFile"

    .line 18
    .line 19
    invoke-static {v0, p1}, Lcom/mm/mmfile/Logger;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 20
    .line 21
    .line 22
    iput-wide v2, p0, Lcom/mm/mmfile/MMFile;->mNativePtr:J

    .line 23
    .line 24
    :cond_1
    :goto_0
    return-void
.end method

.method public static setLibraryLoader(Lcom/mm/mmfile/LibraryLoader;)V
    .locals 0

    .line 1
    sput-object p0, Lcom/mm/mmfile/MMFile;->libraryLoader:Lcom/mm/mmfile/LibraryLoader;

    .line 2
    .line 3
    return-void
.end method

.method private varargs updateCommonInfo(Ljava/lang/String;[Ljava/lang/String;)V
    .locals 5

    .line 22
    iget-wide v0, p0, Lcom/mm/mmfile/MMFile;->mNativePtr:J

    const-wide/16 v2, -0x1

    cmp-long v4, v0, v2

    if-eqz v4, :cond_0

    .line 23
    :try_start_0
    invoke-direct {p0, v0, v1, p1, p2}, Lcom/mm/mmfile/MMFile;->nativeUpdateCommonInfo(JLjava/lang/String;[Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 24
    const-string p2, "MMFile"

    invoke-static {p2, p1}, Lcom/mm/mmfile/Logger;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 25
    iput-wide v2, p0, Lcom/mm/mmfile/MMFile;->mNativePtr:J

    :cond_0
    return-void
.end method

.method public static updateCommonInfoInner(Lcom/mm/mmfile/core/FileWriteConfig;Lcom/mm/mmfile/core/MMLogInfo;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/mm/mmfile/MMFile;->SYSTEM_SERVICE_FETCHERS:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/mm/mmfile/MMFile$MMFileInstanceFetcher;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-static {p0, p1}, Lcom/mm/mmfile/MMFile$MMFileInstanceFetcher;->access$200(Lcom/mm/mmfile/MMFile$MMFileInstanceFetcher;Lcom/mm/mmfile/core/MMLogInfo;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method


# virtual methods
.method public close()V
    .locals 5

    .line 1
    iget-wide v0, p0, Lcom/mm/mmfile/MMFile;->mNativePtr:J

    .line 2
    .line 3
    const-wide/16 v2, -0x1

    .line 4
    .line 5
    cmp-long v4, v0, v2

    .line 6
    .line 7
    if-eqz v4, :cond_0

    .line 8
    .line 9
    :try_start_0
    invoke-direct {p0, v0, v1}, Lcom/mm/mmfile/MMFile;->nativeClose(J)V
    :try_end_0
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_0 .. :try_end_0} :catch_0

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :catch_0
    move-exception v0

    .line 14
    const-string v1, "MMFile"

    .line 15
    .line 16
    invoke-static {v1, v0}, Lcom/mm/mmfile/Logger;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 17
    .line 18
    .line 19
    iput-wide v2, p0, Lcom/mm/mmfile/MMFile;->mNativePtr:J

    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public flush()V
    .locals 5

    .line 1
    iget-wide v0, p0, Lcom/mm/mmfile/MMFile;->mNativePtr:J

    .line 2
    .line 3
    const-wide/16 v2, -0x1

    .line 4
    .line 5
    cmp-long v4, v0, v2

    .line 6
    .line 7
    if-eqz v4, :cond_0

    .line 8
    .line 9
    :try_start_0
    invoke-direct {p0, v0, v1}, Lcom/mm/mmfile/MMFile;->nativeFlush(J)V
    :try_end_0
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_0 .. :try_end_0} :catch_0

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :catch_0
    move-exception v0

    .line 14
    const-string v1, "MMFile"

    .line 15
    .line 16
    invoke-static {v1, v0}, Lcom/mm/mmfile/Logger;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 17
    .line 18
    .line 19
    iput-wide v2, p0, Lcom/mm/mmfile/MMFile;->mNativePtr:J

    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public openNewLogFile()V
    .locals 5

    .line 1
    iget-wide v0, p0, Lcom/mm/mmfile/MMFile;->mNativePtr:J

    .line 2
    .line 3
    const-wide/16 v2, -0x1

    .line 4
    .line 5
    cmp-long v4, v0, v2

    .line 6
    .line 7
    if-eqz v4, :cond_0

    .line 8
    .line 9
    :try_start_0
    invoke-direct {p0, v0, v1}, Lcom/mm/mmfile/MMFile;->nativeOpenNewLogFile(J)V
    :try_end_0
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_0 .. :try_end_0} :catch_0

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :catch_0
    move-exception v0

    .line 14
    const-string v1, "MMFile"

    .line 15
    .line 16
    invoke-static {v1, v0}, Lcom/mm/mmfile/Logger;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 17
    .line 18
    .line 19
    iput-wide v2, p0, Lcom/mm/mmfile/MMFile;->mNativePtr:J

    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public restart()V
    .locals 5

    .line 1
    iget-wide v0, p0, Lcom/mm/mmfile/MMFile;->mNativePtr:J

    .line 2
    .line 3
    const-wide/16 v2, -0x1

    .line 4
    .line 5
    cmp-long v4, v0, v2

    .line 6
    .line 7
    if-eqz v4, :cond_0

    .line 8
    .line 9
    :try_start_0
    invoke-direct {p0, v0, v1}, Lcom/mm/mmfile/MMFile;->nativeStart(J)V
    :try_end_0
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_0 .. :try_end_0} :catch_0

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :catch_0
    move-exception v0

    .line 14
    const-string v1, "MMFile"

    .line 15
    .line 16
    invoke-static {v1, v0}, Lcom/mm/mmfile/Logger;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 17
    .line 18
    .line 19
    iput-wide v2, p0, Lcom/mm/mmfile/MMFile;->mNativePtr:J

    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public setPauseWrite(Z)V
    .locals 5

    .line 1
    iget-wide v0, p0, Lcom/mm/mmfile/MMFile;->mNativePtr:J

    .line 2
    .line 3
    const-wide/16 v2, -0x1

    .line 4
    .line 5
    cmp-long v4, v0, v2

    .line 6
    .line 7
    if-eqz v4, :cond_0

    .line 8
    .line 9
    :try_start_0
    invoke-direct {p0, v0, v1, p1}, Lcom/mm/mmfile/MMFile;->nativePauseLogWrite(JZ)V
    :try_end_0
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_0 .. :try_end_0} :catch_0

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :catch_0
    move-exception p1

    .line 14
    const-string v0, "MMFile"

    .line 15
    .line 16
    invoke-static {v0, p1}, Lcom/mm/mmfile/Logger;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 17
    .line 18
    .line 19
    iput-wide v2, p0, Lcom/mm/mmfile/MMFile;->mNativePtr:J

    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public updateCommonInfo(Lcom/mm/mmfile/core/MMLogInfo;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/mm/mmfile/core/MMLogInfo;->getBody()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, Lcom/mm/mmfile/core/MMLogInfo;->getHeaders()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const/4 v1, 0x0

    .line 10
    new-array v1, v1, [Ljava/lang/String;

    .line 11
    .line 12
    invoke-interface {p1, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    check-cast p1, [Ljava/lang/String;

    .line 17
    .line 18
    invoke-direct {p0, v0, p1}, Lcom/mm/mmfile/MMFile;->updateCommonInfo(Ljava/lang/String;[Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public varargs write(Ljava/lang/String;[Ljava/lang/String;)V
    .locals 5

    .line 1
    iget-wide v0, p0, Lcom/mm/mmfile/MMFile;->mNativePtr:J

    .line 2
    .line 3
    const-wide/16 v2, -0x1

    .line 4
    .line 5
    cmp-long v4, v0, v2

    .line 6
    .line 7
    if-eqz v4, :cond_0

    .line 8
    .line 9
    :try_start_0
    invoke-direct {p0, v0, v1, p2, p1}, Lcom/mm/mmfile/MMFile;->nativeWrite(J[Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_0 .. :try_end_0} :catch_0

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :catch_0
    move-exception p1

    .line 14
    const-string p2, "MMFile"

    .line 15
    .line 16
    invoke-static {p2, p1}, Lcom/mm/mmfile/Logger;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 17
    .line 18
    .line 19
    iput-wide v2, p0, Lcom/mm/mmfile/MMFile;->mNativePtr:J

    .line 20
    .line 21
    :cond_0
    return-void
.end method
