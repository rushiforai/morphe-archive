.class public Lcom/cosmos/mdlog/XLogImpl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/cosmos/mdlog/MDLog$LogImp;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/cosmos/mdlog/XLogImpl$XLoggerInfo;
    }
.end annotation


# static fields
.field public static final AppednerModeAsync:I = 0x0

.field public static final AppednerModeSync:I = 0x1

.field public static final LEVEL_ALL:I = 0x0

.field public static final LEVEL_DEBUG:I = 0x1

.field public static final LEVEL_ERROR:I = 0x5

.field public static final LEVEL_EVENT:I = 0x3

.field public static final LEVEL_FATAL:I = 0x6

.field public static final LEVEL_INFO:I = 0x2

.field public static final LEVEL_NONE:I = 0x7

.field public static final LEVEL_VERBOSE:I = 0x0

.field public static final LEVEL_WARNING:I = 0x4

.field private static consoleTags:Ljava/util/Map; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field private static isConsoleLogOpen:Z = false

.field private static level:I = 0x7

.field private static whiteListTags:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

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

.method private static native addTag(Ljava/lang/String;)V
.end method

.method private static native appenderOpen(IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public static native appenderSetMaxFileSize(J)V
.end method

.method private static native clearAllTags()V
.end method

.method private static decryptTag(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    return-object p0
.end method

.method public static native logWrite(Lcom/cosmos/mdlog/XLogImpl$XLoggerInfo;Ljava/lang/String;)V
.end method

.method public static native logWrite2(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;IIJJLjava/lang/String;)V
.end method

.method public static mdConsolHook(Ljava/lang/String;I)Z
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    sget-object v0, Lcom/cosmos/mdlog/XLogImpl;->consoleTags:Ljava/util/Map;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/Map;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-lez v0, :cond_0

    .line 10
    .line 11
    sget-object v0, Lcom/cosmos/mdlog/XLogImpl;->consoleTags:Ljava/util/Map;

    .line 12
    .line 13
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    check-cast p1, Ljava/util/List;

    .line 22
    .line 23
    if-eqz p1, :cond_0

    .line 24
    .line 25
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-lez v0, :cond_0

    .line 30
    .line 31
    invoke-interface {p1, p0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    return p0

    .line 36
    :cond_0
    const/4 p0, 0x1

    .line 37
    return p0
.end method

.method public static open(ZILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    const-string p0, "mdlog"

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    const/4 p0, 0x7

    .line 9
    invoke-static {p0, p1, p2, p3, p4}, Lcom/cosmos/mdlog/XLogImpl;->appenderOpen(IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static native setAppenderMode(I)V
.end method

.method public static native setConsoleLogOpen(Z)V
.end method

.method public static native setErrLogOpen(Z)V
.end method

.method public static native setLogLevel(I)V
.end method

.method public static setShouldConsoleTags(Ljava/util/List;I)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;I)V"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    const/4 v0, 0x4

    .line 2
    if-lt p1, v0, :cond_0

    .line 3
    .line 4
    return-void

    .line 5
    :cond_0
    sget-object v0, Lcom/cosmos/mdlog/XLogImpl;->consoleTags:Ljava/util/Map;

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    .line 10
    .line 11
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 12
    .line 13
    .line 14
    sput-object v0, Lcom/cosmos/mdlog/XLogImpl;->consoleTags:Ljava/util/Map;

    .line 15
    .line 16
    :cond_1
    sget-object v0, Lcom/cosmos/mdlog/XLogImpl;->consoleTags:Ljava/util/Map;

    .line 17
    .line 18
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Ljava/util/List;

    .line 27
    .line 28
    if-nez v0, :cond_2

    .line 29
    .line 30
    new-instance v0, Ljava/util/ArrayList;

    .line 31
    .line 32
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 33
    .line 34
    .line 35
    :cond_2
    invoke-interface {v0, p0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 36
    .line 37
    .line 38
    sget-object p0, Lcom/cosmos/mdlog/XLogImpl;->consoleTags:Ljava/util/Map;

    .line 39
    .line 40
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-interface {p0, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    return-void
.end method


# virtual methods
.method public native appenderClose()V
.end method

.method public native appenderFlush(Z)V
.end method

.method public clearAllWhiteList()V
    .locals 0

    .line 1
    sget-object p0, Lcom/cosmos/mdlog/XLogImpl;->whiteListTags:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 6
    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    sput-object p0, Lcom/cosmos/mdlog/XLogImpl;->whiteListTags:Ljava/util/List;

    .line 10
    .line 11
    :cond_0
    invoke-static {}, Lcom/cosmos/mdlog/XLogImpl;->clearAllTags()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public getLevel()I
    .locals 0

    .line 1
    :try_start_0
    invoke-virtual {p0}, Lcom/cosmos/mdlog/XLogImpl;->getLogLevel()I

    .line 2
    .line 3
    .line 4
    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    return p0

    .line 6
    :catchall_0
    sget p0, Lcom/cosmos/mdlog/XLogImpl;->level:I

    .line 7
    .line 8
    return p0
.end method

.method public native getLogLevel()I
.end method

.method public getWhiteListTags()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/cosmos/mdlog/XLogImpl;->whiteListTags:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public isLogcatOpen()Z
    .locals 0

    .line 1
    sget-boolean p0, Lcom/cosmos/mdlog/XLogImpl;->isConsoleLogOpen:Z

    .line 2
    .line 3
    return p0
.end method

.method public logD(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIJJLjava/lang/String;)V
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    invoke-static {p1}, Lcom/cosmos/mdlog/XLogImpl;->decryptTag(Ljava/lang/String;)Ljava/lang/String;

    .line 3
    .line 4
    .line 5
    move-result-object p1

    .line 6
    invoke-static/range {p0 .. p10}, Lcom/cosmos/mdlog/XLogImpl;->logWrite2(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;IIJJLjava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public logE(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIJJLjava/lang/String;)V
    .locals 0

    .line 1
    const/4 p0, 0x5

    .line 2
    invoke-static {p1}, Lcom/cosmos/mdlog/XLogImpl;->decryptTag(Ljava/lang/String;)Ljava/lang/String;

    .line 3
    .line 4
    .line 5
    move-result-object p1

    .line 6
    invoke-static/range {p0 .. p10}, Lcom/cosmos/mdlog/XLogImpl;->logWrite2(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;IIJJLjava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public logEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIJJLjava/lang/String;)V
    .locals 0

    .line 1
    const/4 p0, 0x3

    .line 2
    invoke-static {p1}, Lcom/cosmos/mdlog/XLogImpl;->decryptTag(Ljava/lang/String;)Ljava/lang/String;

    .line 3
    .line 4
    .line 5
    move-result-object p1

    .line 6
    invoke-static/range {p0 .. p10}, Lcom/cosmos/mdlog/XLogImpl;->logWrite2(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;IIJJLjava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public logF(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIJJLjava/lang/String;)V
    .locals 0

    .line 1
    const/4 p0, 0x6

    .line 2
    invoke-static {p1}, Lcom/cosmos/mdlog/XLogImpl;->decryptTag(Ljava/lang/String;)Ljava/lang/String;

    .line 3
    .line 4
    .line 5
    move-result-object p1

    .line 6
    invoke-static/range {p0 .. p10}, Lcom/cosmos/mdlog/XLogImpl;->logWrite2(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;IIJJLjava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public logI(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIJJLjava/lang/String;)V
    .locals 0

    .line 1
    const/4 p0, 0x2

    .line 2
    invoke-static {p1}, Lcom/cosmos/mdlog/XLogImpl;->decryptTag(Ljava/lang/String;)Ljava/lang/String;

    .line 3
    .line 4
    .line 5
    move-result-object p1

    .line 6
    invoke-static/range {p0 .. p10}, Lcom/cosmos/mdlog/XLogImpl;->logWrite2(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;IIJJLjava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public logV(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIJJLjava/lang/String;)V
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-static {p1}, Lcom/cosmos/mdlog/XLogImpl;->decryptTag(Ljava/lang/String;)Ljava/lang/String;

    .line 3
    .line 4
    .line 5
    move-result-object p1

    .line 6
    invoke-static/range {p0 .. p10}, Lcom/cosmos/mdlog/XLogImpl;->logWrite2(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;IIJJLjava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public logW(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIJJLjava/lang/String;)V
    .locals 0

    .line 1
    const/4 p0, 0x4

    .line 2
    invoke-static {p1}, Lcom/cosmos/mdlog/XLogImpl;->decryptTag(Ljava/lang/String;)Ljava/lang/String;

    .line 3
    .line 4
    .line 5
    move-result-object p1

    .line 6
    invoke-static/range {p0 .. p10}, Lcom/cosmos/mdlog/XLogImpl;->logWrite2(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;IIJJLjava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public registerWhiteList(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/cosmos/mdlog/XLogImpl;->whiteListTags:Ljava/util/List;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    new-instance p0, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    sput-object p0, Lcom/cosmos/mdlog/XLogImpl;->whiteListTags:Ljava/util/List;

    .line 11
    .line 12
    :cond_0
    sget-object p0, Lcom/cosmos/mdlog/XLogImpl;->whiteListTags:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    if-lez p0, :cond_1

    .line 19
    .line 20
    sget-object p0, Lcom/cosmos/mdlog/XLogImpl;->whiteListTags:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 23
    .line 24
    .line 25
    invoke-static {}, Lcom/cosmos/mdlog/XLogImpl;->clearAllTags()V

    .line 26
    .line 27
    .line 28
    :cond_1
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_2

    .line 37
    .line 38
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    check-cast v0, Ljava/lang/String;

    .line 43
    .line 44
    invoke-static {v0}, Lcom/cosmos/mdlog/XLogImpl;->addTag(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_2
    sget-object p0, Lcom/cosmos/mdlog/XLogImpl;->whiteListTags:Ljava/util/List;

    .line 49
    .line 50
    invoke-interface {p0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public setLevel(I)V
    .locals 0

    .line 1
    sput p1, Lcom/cosmos/mdlog/XLogImpl;->level:I

    .line 2
    .line 3
    invoke-static {p1}, Lcom/cosmos/mdlog/XLogImpl;->setLogLevel(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setLogcatOpen(Z)V
    .locals 0

    .line 1
    sput-boolean p1, Lcom/cosmos/mdlog/XLogImpl;->isConsoleLogOpen:Z

    .line 2
    .line 3
    invoke-static {p1}, Lcom/cosmos/mdlog/XLogImpl;->setConsoleLogOpen(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
