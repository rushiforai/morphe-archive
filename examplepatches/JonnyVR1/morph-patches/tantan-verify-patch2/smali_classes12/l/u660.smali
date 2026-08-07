.class public Ll/u660;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/u660$c;,
        Ll/u660$d;,
        Ll/u660$e;
    }
.end annotation


# static fields
.field private static e:Ll/u660;


# instance fields
.field public a:Ljava/util/concurrent/atomic/AtomicInteger;

.field private b:Ljava/util/concurrent/ExecutorService;

.field private c:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ll/u660$c;",
            ">;"
        }
    .end annotation
.end field

.field private final d:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/u660;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/u660;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/u660;->e:Ll/u660;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 5
    .line 6
    const/16 v1, 0x3e8

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Ll/u660;->a:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 12
    .line 13
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Ll/u660;->b:Ljava/util/concurrent/ExecutorService;

    .line 18
    .line 19
    new-instance v0, Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Ll/u660;->c:Ljava/util/ArrayList;

    .line 25
    .line 26
    new-instance v0, Ljava/lang/Object;

    .line 27
    .line 28
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Ll/u660;->d:Ljava/lang/Object;

    .line 32
    .line 33
    return-void
.end method

.method public static synthetic a(Ll/u660;)Ljava/util/ArrayList;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u660;->c:Ljava/util/ArrayList;

    .line 2
    .line 3
    return-object p0
.end method

.method public static d()Ll/u660;
    .locals 1

    .line 1
    sget-object v0, Ll/u660;->e:Ll/u660;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public b(ILjava/lang/String;Ljava/lang/String;[B)V
    .locals 11

    .line 1
    const/4 v0, 0x3

    .line 2
    if-ne p1, v0, :cond_0

    .line 3
    .line 4
    sget v0, Ll/t0g0$a;->g:I

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-static {v0, v1}, Ll/t0g0;->e(ILjava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    if-eqz p4, :cond_2

    .line 11
    .line 12
    if-eqz p2, :cond_2

    .line 13
    .line 14
    if-eqz p3, :cond_2

    .line 15
    .line 16
    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_2

    .line 21
    .line 22
    invoke-virtual {p3}, Ljava/lang/String;->isEmpty()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    iget-object v1, p0, Ll/u660;->d:Ljava/lang/Object;

    .line 30
    .line 31
    monitor-enter v1

    .line 32
    :try_start_0
    iget-object p0, p0, Ll/u660;->c:Ljava/util/ArrayList;

    .line 33
    .line 34
    new-instance v0, Ll/u660$c;

    .line 35
    .line 36
    invoke-direct {v0, p1, p2, p3, p4}, Ll/u660$c;-><init>(ILjava/lang/String;Ljava/lang/String;[B)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    monitor-exit v1

    .line 43
    return-void

    .line 44
    :catchall_0
    move-exception v0

    .line 45
    move-object p0, v0

    .line 46
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 47
    throw p0

    .line 48
    :cond_2
    :goto_0
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    sget-object p4, Lcom/idv/identity/platform/log/RecordLevel;->LOG_ERROR:Lcom/idv/identity/platform/log/RecordLevel;

    .line 53
    .line 54
    const-string v0, "addUploadFile"

    .line 55
    .line 56
    const-string v1, "status"

    .line 57
    .line 58
    const-string v2, "error"

    .line 59
    .line 60
    const-string v3, "fileIdx"

    .line 61
    .line 62
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v4

    .line 66
    const-string v5, "bucketName"

    .line 67
    .line 68
    const-string v7, "fileName"

    .line 69
    .line 70
    const-string v9, "errMsg"

    .line 71
    .line 72
    const-string v10, "fileContent is null"

    .line 73
    .line 74
    move-object v6, p2

    .line 75
    move-object v8, p3

    .line 76
    filled-new-array/range {v1 .. v10}, [Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    invoke-virtual {p0, p4, v0, p1}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public c()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u660;->a:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public e(I)Ljava/lang/String;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/u660;->d:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Ll/u660;->c:Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_1

    .line 15
    .line 16
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Ll/u660$c;

    .line 21
    .line 22
    iget v2, v1, Ll/u660$c;->a:I

    .line 23
    .line 24
    if-ne v2, p1, :cond_0

    .line 25
    .line 26
    iget-object p0, v1, Ll/u660$c;->c:Ljava/lang/String;

    .line 27
    .line 28
    monitor-exit v0

    .line 29
    return-object p0

    .line 30
    :catchall_0
    move-exception p0

    .line 31
    goto :goto_0

    .line 32
    :cond_1
    const-string p0, ""

    .line 33
    .line 34
    monitor-exit v0

    .line 35
    return-object p0

    .line 36
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 37
    throw p0
.end method

.method public f()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/u660;->d:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    new-instance v1, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v1, p0, Ll/u660;->c:Ljava/util/ArrayList;

    .line 10
    .line 11
    monitor-exit v0

    .line 12
    return-void

    .line 13
    :catchall_0
    move-exception p0

    .line 14
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    throw p0
.end method

.method public g(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[B)Z
    .locals 1

    .line 1
    new-instance v0, Lcom/alibaba/sdk/android/oss/common/auth/OSSStsTokenCredentialProvider;

    .line 2
    .line 3
    invoke-direct {v0, p3, p4, p5}, Lcom/alibaba/sdk/android/oss/common/auth/OSSStsTokenCredentialProvider;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance p3, Lcom/alibaba/sdk/android/oss/ClientConfiguration;

    .line 7
    .line 8
    invoke-direct {p3}, Lcom/alibaba/sdk/android/oss/ClientConfiguration;-><init>()V

    .line 9
    .line 10
    .line 11
    const/16 p4, 0x3a98

    .line 12
    .line 13
    invoke-virtual {p3, p4}, Lcom/alibaba/sdk/android/oss/ClientConfiguration;->setConnectionTimeout(I)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p3, p4}, Lcom/alibaba/sdk/android/oss/ClientConfiguration;->setSocketTimeout(I)V

    .line 17
    .line 18
    .line 19
    const/4 p4, 0x5

    .line 20
    invoke-virtual {p3, p4}, Lcom/alibaba/sdk/android/oss/ClientConfiguration;->setMaxConcurrentRequest(I)V

    .line 21
    .line 22
    .line 23
    const/4 p4, 0x3

    .line 24
    invoke-virtual {p3, p4}, Lcom/alibaba/sdk/android/oss/ClientConfiguration;->setMaxErrorRetry(I)V

    .line 25
    .line 26
    .line 27
    new-instance p4, Lcom/alibaba/sdk/android/oss/OSSClient;

    .line 28
    .line 29
    invoke-direct {p4, p1, p2, v0, p3}, Lcom/alibaba/sdk/android/oss/OSSClient;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/alibaba/sdk/android/oss/common/auth/OSSCredentialProvider;Lcom/alibaba/sdk/android/oss/ClientConfiguration;)V

    .line 30
    .line 31
    .line 32
    new-instance p1, Lcom/alibaba/sdk/android/oss/model/ObjectMetadata;

    .line 33
    .line 34
    invoke-direct {p1}, Lcom/alibaba/sdk/android/oss/model/ObjectMetadata;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-static {p8}, Lcom/alibaba/sdk/android/oss/common/utils/BinaryUtil;->calculateMd5([B)[B

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    invoke-static {p2}, Lcom/alibaba/sdk/android/oss/common/utils/BinaryUtil;->toBase64String([B)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    invoke-virtual {p1, p2}, Lcom/alibaba/sdk/android/oss/model/ObjectMetadata;->setContentMD5(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    new-instance p2, Lcom/alibaba/sdk/android/oss/model/PutObjectRequest;

    .line 49
    .line 50
    invoke-direct {p2, p6, p7, p8, p1}, Lcom/alibaba/sdk/android/oss/model/PutObjectRequest;-><init>(Ljava/lang/String;Ljava/lang/String;[BLcom/alibaba/sdk/android/oss/model/ObjectMetadata;)V

    .line 51
    .line 52
    .line 53
    new-instance p1, Ll/u660$e;

    .line 54
    .line 55
    const/4 p3, 0x0

    .line 56
    invoke-direct {p1, p3}, Ll/u660$e;-><init>(Ll/u660$a;)V

    .line 57
    .line 58
    .line 59
    new-instance p3, Ll/u660$b;

    .line 60
    .line 61
    invoke-direct {p3, p0, p6, p7, p1}, Ll/u660$b;-><init>(Ll/u660;Ljava/lang/String;Ljava/lang/String;Ll/u660$e;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p4, p2, p3}, Lcom/alibaba/sdk/android/oss/OSSClient;->asyncPutObject(Lcom/alibaba/sdk/android/oss/model/PutObjectRequest;Lcom/alibaba/sdk/android/oss/callback/OSSCompletedCallback;)Lcom/alibaba/sdk/android/oss/internal/OSSAsyncTask;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-virtual {p0}, Lcom/alibaba/sdk/android/oss/internal/OSSAsyncTask;->waitUntilFinished()V

    .line 69
    .line 70
    .line 71
    iget-boolean p0, p1, Ll/u660$e;->a:Z

    .line 72
    .line 73
    return p0
.end method

.method public h()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/u660;->f()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public i(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/u660$d;)V
    .locals 10

    .line 1
    sget v0, Ll/t0g0$a;->h:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/t0g0;->e(ILjava/lang/String;)V

    .line 5
    .line 6
    .line 7
    iget-object v1, p0, Ll/u660;->d:Ljava/lang/Object;

    .line 8
    .line 9
    monitor-enter v1

    .line 10
    :try_start_0
    iget-object v0, p0, Ll/u660;->b:Ljava/util/concurrent/ExecutorService;

    .line 11
    .line 12
    new-instance v2, Ll/u660$a;

    .line 13
    .line 14
    move-object v3, p0

    .line 15
    move-object v4, p1

    .line 16
    move-object v5, p2

    .line 17
    move-object v6, p3

    .line 18
    move-object v7, p4

    .line 19
    move-object v8, p5

    .line 20
    move-object/from16 v9, p6

    .line 21
    .line 22
    invoke-direct/range {v2 .. v9}, Ll/u660$a;-><init>(Ll/u660;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/u660$d;)V

    .line 23
    .line 24
    .line 25
    invoke-interface {v0, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 26
    .line 27
    .line 28
    monitor-exit v1

    .line 29
    return-void

    .line 30
    :catchall_0
    move-exception v0

    .line 31
    move-object p0, v0

    .line 32
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 33
    throw p0
.end method
