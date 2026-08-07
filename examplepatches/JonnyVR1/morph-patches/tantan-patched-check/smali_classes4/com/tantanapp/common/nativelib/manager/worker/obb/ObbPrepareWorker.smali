.class public final Lcom/tantanapp/common/nativelib/manager/worker/obb/ObbPrepareWorker;
.super Lcom/tantanapp/sharelib/workmanager/Worker;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0011\n\u0002\u0008\u0003\u0018\u00002\u00020\u0001B\u0015\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0002\u0010\u0006J\u0008\u0010\u0007\u001a\u00020\u0008H\u0016J#\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\u000c2\u000c\u0010\r\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u000eH\u0002\u00a2\u0006\u0002\u0010\u000fJ#\u0010\u0010\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\u000c2\u000c\u0010\r\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u000eH\u0002\u00a2\u0006\u0002\u0010\u000f\u00a8\u0006\u0011"
    }
    d2 = {
        "Lcom/tantanapp/common/nativelib/manager/worker/obb/ObbPrepareWorker;",
        "Lcom/tantanapp/sharelib/workmanager/Worker;",
        "appContext",
        "Landroid/content/Context;",
        "workInfo",
        "Lcom/tantanapp/sharelib/workmanager/WorkInfo;",
        "(Landroid/content/Context;Lcom/tantanapp/sharelib/workmanager/WorkInfo;)V",
        "doWork",
        "Lcom/tantanapp/sharelib/workmanager/Result;",
        "loadObbFromAssets",
        "",
        "countDownLatch",
        "Ljava/util/concurrent/CountDownLatch;",
        "results",
        "",
        "(Ljava/util/concurrent/CountDownLatch;[Lcom/tantanapp/sharelib/workmanager/Result;)V",
        "loadObbFromGP",
        "sharedlibrarymanager_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/tantanapp/sharelib/workmanager/WorkInfo;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/tantanapp/sharelib/workmanager/WorkInfo;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-direct {p0, p1, p2}, Lcom/tantanapp/sharelib/workmanager/Worker;-><init>(Landroid/content/Context;Lcom/tantanapp/sharelib/workmanager/WorkInfo;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private final loadObbFromAssets(Ljava/util/concurrent/CountDownLatch;[Lcom/tantanapp/sharelib/workmanager/Result;)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/tantanapp/sharelib/workmanager/Worker;->getInfo()Lcom/tantanapp/sharelib/workmanager/WorkInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/tantanapp/sharelib/workmanager/WorkInfo;->c()Lcom/tantanapp/sharelib/workmanager/Data;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "key_download_info_list"

    .line 10
    .line 11
    invoke-static {}, Lkotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-virtual {v0, v1, v2}, Lcom/tantanapp/sharelib/workmanager/Data;->c(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Ljava/util/List;

    .line 20
    .line 21
    check-cast v0, Ljava/lang/Iterable;

    .line 22
    .line 23
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-eqz v1, :cond_1

    .line 32
    .line 33
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    move-object v2, v1

    .line 38
    check-cast v2, Lcom/tantanapp/common/nativelib/manager/bean/ZipFileInfo;

    .line 39
    .line 40
    invoke-virtual {v2}, Lcom/tantanapp/common/nativelib/manager/bean/ZipFileInfo;->getModule()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    const-string v3, "global"

    .line 45
    .line 46
    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    if-eqz v2, :cond_0

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_1
    const/4 v1, 0x0

    .line 54
    :goto_0
    check-cast v1, Lcom/tantanapp/common/nativelib/manager/bean/ZipFileInfo;

    .line 55
    .line 56
    const/4 v0, 0x0

    .line 57
    if-nez v1, :cond_2

    .line 58
    .line 59
    sget-object p0, Lcom/tantanapp/sharelib/workmanager/Result;->Companion:Lcom/tantanapp/sharelib/workmanager/Result$Companion;

    .line 60
    .line 61
    const-string v1, "Read assets failed"

    .line 62
    .line 63
    invoke-virtual {p0, v1}, Lcom/tantanapp/sharelib/workmanager/Result$Companion;->a(Ljava/lang/String;)Lcom/tantanapp/sharelib/workmanager/Result$Failure;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    aput-object p0, p2, v0

    .line 68
    .line 69
    invoke-virtual {p1}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :cond_2
    new-instance v2, Lcom/tantanapp/sharelib/workmanager/Result$Success;

    .line 74
    .line 75
    new-instance v3, Lcom/tantanapp/sharelib/workmanager/Data$Builder;

    .line 76
    .line 77
    invoke-direct {v3}, Lcom/tantanapp/sharelib/workmanager/Data$Builder;-><init>()V

    .line 78
    .line 79
    .line 80
    const-string v4, "key_download_info"

    .line 81
    .line 82
    invoke-virtual {v3, v4, v1}, Lcom/tantanapp/sharelib/workmanager/Data$Builder;->d(Ljava/lang/String;Ljava/lang/Object;)Lcom/tantanapp/sharelib/workmanager/Data$Builder;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    invoke-virtual {p0}, Lcom/tantanapp/sharelib/workmanager/Worker;->getInput()Lcom/tantanapp/sharelib/workmanager/Data;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-virtual {v1, p0}, Lcom/tantanapp/sharelib/workmanager/Data$Builder;->c(Lcom/tantanapp/sharelib/workmanager/Data;)Lcom/tantanapp/sharelib/workmanager/Data$Builder;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    invoke-virtual {p0}, Lcom/tantanapp/sharelib/workmanager/Data$Builder;->a()Lcom/tantanapp/sharelib/workmanager/Data;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    invoke-direct {v2, p0}, Lcom/tantanapp/sharelib/workmanager/Result$Success;-><init>(Lcom/tantanapp/sharelib/workmanager/Data;)V

    .line 99
    .line 100
    .line 101
    aput-object v2, p2, v0

    .line 102
    .line 103
    invoke-virtual {p1}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 104
    .line 105
    .line 106
    return-void
.end method

.method private final loadObbFromGP(Ljava/util/concurrent/CountDownLatch;[Lcom/tantanapp/sharelib/workmanager/Result;)V
    .locals 0

    .line 1
    sget-object p1, Ll/r3f0;->Companion:Ll/r3f0$a;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/r3f0$a;->a()Ll/r3f0;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Ll/r3f0;->h()Ll/sv5;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/tantanapp/sharelib/workmanager/Worker;->getAppContext()Landroid/content/Context;

    .line 11
    .line 12
    .line 13
    new-instance p0, Ll/i;

    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    throw p0
.end method


# virtual methods
.method public doWork()Lcom/tantanapp/sharelib/workmanager/Result;
    .locals 4
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-direct {v0, v1}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    .line 5
    .line 6
    .line 7
    new-array v1, v1, [Lcom/tantanapp/sharelib/workmanager/Result;

    .line 8
    .line 9
    sget-object v2, Lcom/tantanapp/sharelib/workmanager/Result;->Companion:Lcom/tantanapp/sharelib/workmanager/Result$Companion;

    .line 10
    .line 11
    invoke-virtual {v2}, Lcom/tantanapp/sharelib/workmanager/Result$Companion;->d()Lcom/tantanapp/sharelib/workmanager/Result$Success;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    const/4 v3, 0x0

    .line 16
    aput-object v2, v1, v3

    .line 17
    .line 18
    sget-object v2, Ll/n3f0;->Companion:Ll/n3f0$a;

    .line 19
    .line 20
    invoke-virtual {v2}, Ll/n3f0$a;->a()Ll/n3f0;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-virtual {v2}, Ll/n3f0;->a()Lkotlin/jvm/functions/Function0;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-interface {v2}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    check-cast v2, Ljava/lang/Boolean;

    .line 33
    .line 34
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    if-eqz v2, :cond_0

    .line 39
    .line 40
    invoke-direct {p0, v0, v1}, Lcom/tantanapp/common/nativelib/manager/worker/obb/ObbPrepareWorker;->loadObbFromAssets(Ljava/util/concurrent/CountDownLatch;[Lcom/tantanapp/sharelib/workmanager/Result;)V

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    invoke-direct {p0, v0, v1}, Lcom/tantanapp/common/nativelib/manager/worker/obb/ObbPrepareWorker;->loadObbFromGP(Ljava/util/concurrent/CountDownLatch;[Lcom/tantanapp/sharelib/workmanager/Result;)V

    .line 45
    .line 46
    .line 47
    :goto_0
    :try_start_0
    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->await()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 48
    .line 49
    .line 50
    goto :goto_1

    .line 51
    :catch_0
    move-exception p0

    .line 52
    sget-object v0, Lcom/tantanapp/sharelib/workmanager/Result;->Companion:Lcom/tantanapp/sharelib/workmanager/Result$Companion;

    .line 53
    .line 54
    invoke-virtual {v0, p0}, Lcom/tantanapp/sharelib/workmanager/Result$Companion;->b(Ljava/lang/Throwable;)Lcom/tantanapp/sharelib/workmanager/Result$Failure;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    aput-object p0, v1, v3

    .line 59
    .line 60
    :goto_1
    aget-object p0, v1, v3

    .line 61
    .line 62
    return-object p0
.end method
