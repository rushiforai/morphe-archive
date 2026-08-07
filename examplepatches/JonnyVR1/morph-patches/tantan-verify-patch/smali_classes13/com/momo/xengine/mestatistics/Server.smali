.class final Lcom/momo/xengine/mestatistics/Server;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final API:Ljava/lang/String; = "https://cosmos-open.immomo.com/cg-monitor/upload"

.field private static final ARS_KEY:Ljava/lang/String; = "KVA1h3qbcSHb"

.field private static final RSA_KEY:Ljava/lang/String; = "MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBAKbj7WvmhEVXZbeqvMGXdMDvGlD6/Aa/MRxkhtUzdMBtB1FzUGOs77Yo7Es3cxt4HQGrioAaPXCyNC4KX1L8qdcCAwEAAQ=="

.field private static final TAG:Ljava/lang/String; = "MEStatistics"

.field private static final singleThreadExecutor:Ljava/util/concurrent/ExecutorService;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, Lcom/momo/xengine/mestatistics/Server;->singleThreadExecutor:Ljava/util/concurrent/ExecutorService;

    .line 6
    .line 7
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

.method public static synthetic a(Lcom/momo/xengine/mestatistics/StatisticalEvent;)V
    .locals 0

    .line 1
    :try_start_0
    invoke-static {p0}, Lcom/momo/xengine/mestatistics/Server;->sendImpl(Lcom/momo/xengine/mestatistics/StatisticalEvent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    .line 3
    .line 4
    :catch_0
    return-void
.end method

.method public static send(Lcom/momo/xengine/mestatistics/StatisticalEvent;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/momo/xengine/mestatistics/Server;->singleThreadExecutor:Ljava/util/concurrent/ExecutorService;

    .line 2
    .line 3
    new-instance v1, Lcom/momo/xengine/mestatistics/a;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/momo/xengine/mestatistics/a;-><init>(Lcom/momo/xengine/mestatistics/StatisticalEvent;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private static sendImpl(Lcom/momo/xengine/mestatistics/StatisticalEvent;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/momo/xengine/mestatistics/StatisticalEvent;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBAKbj7WvmhEVXZbeqvMGXdMDvGlD6/Aa/MRxkhtUzdMBtB1FzUGOs77Yo7Es3cxt4HQGrioAaPXCyNC4KX1L8qdcCAwEAAQ=="

    .line 6
    .line 7
    const-string v1, "KVA1h3qbcSHb"

    .line 8
    .line 9
    invoke-static {v1, v0}, Lcom/momo/xengine/mestatistics/EncryptionTool;->rsa_encrypt(Ljava/lang/String;Ljava/lang/String;)[B

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v1}, Lcom/momo/xengine/mestatistics/EncryptionTool;->SHA256(Ljava/lang/String;)[B

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {p0, v1}, Lcom/momo/xengine/mestatistics/EncryptionTool;->aes_encrypt(Ljava/lang/String;[B)[B

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    new-instance v1, Lcom/momo/xengine/mestatistics/HttpPostMultipart;

    .line 22
    .line 23
    const-string v2, "utf-8"

    .line 24
    .line 25
    const/4 v3, 0x0

    .line 26
    const-string v4, "https://cosmos-open.immomo.com/cg-monitor/upload"

    .line 27
    .line 28
    invoke-direct {v1, v4, v2, v3}, Lcom/momo/xengine/mestatistics/HttpPostMultipart;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 29
    .line 30
    .line 31
    const-string v2, "msc"

    .line 32
    .line 33
    invoke-static {v0}, Lcom/momo/xengine/mestatistics/Base64;->encode([B)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v1, v2, v0}, Lcom/momo/xengine/mestatistics/HttpPostMultipart;->addFormField(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    const-string v0, "mzip"

    .line 41
    .line 42
    invoke-static {p0}, Lcom/momo/xengine/mestatistics/Base64;->encode([B)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {v1, v0, p0}, Lcom/momo/xengine/mestatistics/HttpPostMultipart;->addFormField(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v1}, Lcom/momo/xengine/mestatistics/HttpPostMultipart;->finish()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    return-void
.end method
