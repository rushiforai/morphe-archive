.class Lcom/mm/mmfile/MMFile$MMFileInstanceFetcher;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mm/mmfile/MMFile;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MMFileInstanceFetcher"
.end annotation


# instance fields
.field private final mFileWriteConfig:Lcom/mm/mmfile/core/FileWriteConfig;

.field private mmFile:Lcom/mm/mmfile/MMFile;


# direct methods
.method private constructor <init>(Lcom/mm/mmfile/core/FileWriteConfig;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/mm/mmfile/MMFile$MMFileInstanceFetcher;->mFileWriteConfig:Lcom/mm/mmfile/core/FileWriteConfig;

    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Lcom/mm/mmfile/core/FileWriteConfig;Lcom/mm/mmfile/MMFile$1;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lcom/mm/mmfile/MMFile$MMFileInstanceFetcher;-><init>(Lcom/mm/mmfile/core/FileWriteConfig;)V

    return-void
.end method

.method public static synthetic access$000(Lcom/mm/mmfile/MMFile$MMFileInstanceFetcher;)Lcom/mm/mmfile/MMFile;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/mm/mmfile/MMFile$MMFileInstanceFetcher;->mmFile:Lcom/mm/mmfile/MMFile;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$200(Lcom/mm/mmfile/MMFile$MMFileInstanceFetcher;Lcom/mm/mmfile/core/MMLogInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/mm/mmfile/MMFile$MMFileInstanceFetcher;->updateCommonInfo(Lcom/mm/mmfile/core/MMLogInfo;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private updateCommonInfo(Lcom/mm/mmfile/core/MMLogInfo;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/mm/mmfile/MMFile$MMFileInstanceFetcher;->mFileWriteConfig:Lcom/mm/mmfile/core/FileWriteConfig;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {v0, p1}, Lcom/mm/mmfile/core/FileWriteConfig;->updateCommonInfo(Lcom/mm/mmfile/core/MMLogInfo;)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/mm/mmfile/MMFile$MMFileInstanceFetcher;->mmFile:Lcom/mm/mmfile/MMFile;

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lcom/mm/mmfile/MMFile;->updateCommonInfo(Lcom/mm/mmfile/core/MMLogInfo;)V

    .line 14
    .line 15
    .line 16
    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method public declared-synchronized getMMFile()Lcom/mm/mmfile/MMFile;
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/mm/mmfile/MMFile$MMFileInstanceFetcher;->mmFile:Lcom/mm/mmfile/MMFile;

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    const-string v0, "MMFile"

    .line 7
    .line 8
    const-string v1, "create FileWriteConfig instance: %s"

    .line 9
    .line 10
    iget-object v2, p0, Lcom/mm/mmfile/MMFile$MMFileInstanceFetcher;->mFileWriteConfig:Lcom/mm/mmfile/core/FileWriteConfig;

    .line 11
    .line 12
    invoke-virtual {v2}, Lcom/mm/mmfile/core/FileWriteConfig;->getFilePrefix()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-static {v0, v1, v2}, Lcom/mm/mmfile/Logger;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    new-instance v0, Lcom/mm/mmfile/MMFile;

    .line 24
    .line 25
    iget-object v1, p0, Lcom/mm/mmfile/MMFile$MMFileInstanceFetcher;->mFileWriteConfig:Lcom/mm/mmfile/core/FileWriteConfig;

    .line 26
    .line 27
    const/4 v2, 0x0

    .line 28
    invoke-direct {v0, v1, v2}, Lcom/mm/mmfile/MMFile;-><init>(Lcom/mm/mmfile/core/FileWriteConfig;Lcom/mm/mmfile/MMFile$1;)V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Lcom/mm/mmfile/MMFile$MMFileInstanceFetcher;->mmFile:Lcom/mm/mmfile/MMFile;

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :catchall_0
    move-exception v0

    .line 35
    goto :goto_1

    .line 36
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/mm/mmfile/MMFile$MMFileInstanceFetcher;->mmFile:Lcom/mm/mmfile/MMFile;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 37
    .line 38
    monitor-exit p0

    .line 39
    return-object v0

    .line 40
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 41
    throw v0
.end method
