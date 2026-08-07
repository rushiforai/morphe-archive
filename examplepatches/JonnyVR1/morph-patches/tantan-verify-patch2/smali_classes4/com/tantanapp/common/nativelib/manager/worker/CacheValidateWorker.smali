.class public final Lcom/tantanapp/common/nativelib/manager/worker/CacheValidateWorker;
.super Lcom/tantanapp/sharelib/workmanager/Worker;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000$\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00020\u0001B\u0015\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0002\u0010\u0006J\u0008\u0010\t\u001a\u00020\nH\u0016R\u000e\u0010\u0007\u001a\u00020\u0008X\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u000b"
    }
    d2 = {
        "Lcom/tantanapp/common/nativelib/manager/worker/CacheValidateWorker;",
        "Lcom/tantanapp/sharelib/workmanager/Worker;",
        "appContext",
        "Landroid/content/Context;",
        "info",
        "Lcom/tantanapp/sharelib/workmanager/WorkInfo;",
        "(Landroid/content/Context;Lcom/tantanapp/sharelib/workmanager/WorkInfo;)V",
        "zipFilePath",
        "",
        "doWork",
        "Lcom/tantanapp/sharelib/workmanager/Result;",
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


# instance fields
.field private zipFilePath:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


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
    const-string p1, ""

    .line 11
    .line 12
    iput-object p1, p0, Lcom/tantanapp/common/nativelib/manager/worker/CacheValidateWorker;->zipFilePath:Ljava/lang/String;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public doWork()Lcom/tantanapp/sharelib/workmanager/Result;
    .locals 4
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/tantanapp/sharelib/workmanager/Worker;->getInput()Lcom/tantanapp/sharelib/workmanager/Data;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/tantanapp/common/nativelib/manager/bean/ZipFileInfo;->Companion:Lcom/tantanapp/common/nativelib/manager/bean/ZipFileInfo$Companion;

    .line 6
    .line 7
    invoke-virtual {v1}, Lcom/tantanapp/common/nativelib/manager/bean/ZipFileInfo$Companion;->getEMPTY()Lcom/tantanapp/common/nativelib/manager/bean/ZipFileInfo;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    const-string v3, "key_download_info"

    .line 12
    .line 13
    invoke-virtual {v0, v3, v2}, Lcom/tantanapp/sharelib/workmanager/Data;->c(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p0}, Lcom/tantanapp/sharelib/workmanager/Worker;->getInput()Lcom/tantanapp/sharelib/workmanager/Data;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    const-string v3, "key_module_path"

    .line 22
    .line 23
    invoke-virtual {v2, v3}, Lcom/tantanapp/sharelib/workmanager/Data;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-virtual {v1}, Lcom/tantanapp/common/nativelib/manager/bean/ZipFileInfo$Companion;->getEMPTY()Lcom/tantanapp/common/nativelib/manager/bean/ZipFileInfo;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-eqz v1, :cond_0

    .line 36
    .line 37
    sget-object p0, Lcom/tantanapp/sharelib/workmanager/Result;->Companion:Lcom/tantanapp/sharelib/workmanager/Result$Companion;

    .line 38
    .line 39
    const-string v0, "Target zip file info is empty"

    .line 40
    .line 41
    invoke-virtual {p0, v0}, Lcom/tantanapp/sharelib/workmanager/Result$Companion;->a(Ljava/lang/String;)Lcom/tantanapp/sharelib/workmanager/Result$Failure;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0

    .line 46
    :cond_0
    new-instance v1, Ljava/io/File;

    .line 47
    .line 48
    check-cast v0, Lcom/tantanapp/common/nativelib/manager/bean/ZipFileInfo;

    .line 49
    .line 50
    invoke-virtual {v0}, Lcom/tantanapp/common/nativelib/manager/bean/ZipFileInfo;->getName()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    .line 58
    .line 59
    .line 60
    move-result v2

    .line 61
    if-eqz v2, :cond_2

    .line 62
    .line 63
    invoke-virtual {v0}, Lcom/tantanapp/common/nativelib/manager/bean/ZipFileInfo;->getMd5()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-static {v1}, Ll/o1m;->g(Ljava/io/File;)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-nez v0, :cond_1

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_1
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 83
    .line 84
    .line 85
    goto :goto_1

    .line 86
    :cond_2
    :goto_0
    const-string v0, ""

    .line 87
    .line 88
    :goto_1
    iput-object v0, p0, Lcom/tantanapp/common/nativelib/manager/worker/CacheValidateWorker;->zipFilePath:Ljava/lang/String;

    .line 89
    .line 90
    new-instance v0, Lcom/tantanapp/sharelib/workmanager/Result$Success;

    .line 91
    .line 92
    new-instance v1, Lcom/tantanapp/sharelib/workmanager/Data$Builder;

    .line 93
    .line 94
    invoke-direct {v1}, Lcom/tantanapp/sharelib/workmanager/Data$Builder;-><init>()V

    .line 95
    .line 96
    .line 97
    const-string v2, "key_file_path"

    .line 98
    .line 99
    iget-object v3, p0, Lcom/tantanapp/common/nativelib/manager/worker/CacheValidateWorker;->zipFilePath:Ljava/lang/String;

    .line 100
    .line 101
    invoke-virtual {v1, v2, v3}, Lcom/tantanapp/sharelib/workmanager/Data$Builder;->e(Ljava/lang/String;Ljava/lang/String;)Lcom/tantanapp/sharelib/workmanager/Data$Builder;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    invoke-virtual {p0}, Lcom/tantanapp/sharelib/workmanager/Worker;->getInfo()Lcom/tantanapp/sharelib/workmanager/WorkInfo;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    invoke-virtual {p0}, Lcom/tantanapp/sharelib/workmanager/WorkInfo;->c()Lcom/tantanapp/sharelib/workmanager/Data;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    invoke-virtual {v1, p0}, Lcom/tantanapp/sharelib/workmanager/Data$Builder;->c(Lcom/tantanapp/sharelib/workmanager/Data;)Lcom/tantanapp/sharelib/workmanager/Data$Builder;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    invoke-virtual {p0}, Lcom/tantanapp/sharelib/workmanager/Data$Builder;->a()Lcom/tantanapp/sharelib/workmanager/Data;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    invoke-direct {v0, p0}, Lcom/tantanapp/sharelib/workmanager/Result$Success;-><init>(Lcom/tantanapp/sharelib/workmanager/Data;)V

    .line 122
    .line 123
    .line 124
    return-object v0
.end method
