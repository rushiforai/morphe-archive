.class public Lcom/leanplum/internal/FileTransferManager;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/leanplum/internal/FileTransferManager$NoPendingDownloadsCallback;
    }
.end annotation


# static fields
.field private static final INSTANCE:Lcom/leanplum/internal/FileTransferManager;


# instance fields
.field private final fileTransferStatus:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private final fileUploadProgress:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/io/File;",
            "Ljava/lang/Double;",
            ">;"
        }
    .end annotation
.end field

.field private fileUploadProgressString:Ljava/lang/String;

.field private final fileUploadSize:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/io/File;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private noPendingDownloadsBlock:Lcom/leanplum/internal/FileTransferManager$NoPendingDownloadsCallback;

.field private pendingDownloads:I

.field private final uploadFileLock:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lcom/leanplum/internal/FileTransferManager;

    invoke-direct {v0}, Lcom/leanplum/internal/FileTransferManager;-><init>()V

    sput-object v0, Lcom/leanplum/internal/FileTransferManager;->INSTANCE:Lcom/leanplum/internal/FileTransferManager;

    return-void
.end method

.method private constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/leanplum/internal/FileTransferManager;->fileTransferStatus:Ljava/util/Map;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/leanplum/internal/FileTransferManager;->fileUploadSize:Ljava/util/Map;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/leanplum/internal/FileTransferManager;->fileUploadProgress:Ljava/util/Map;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/leanplum/internal/FileTransferManager;->uploadFileLock:Ljava/lang/Object;

    const-string v0, ""

    iput-object v0, p0, Lcom/leanplum/internal/FileTransferManager;->fileUploadProgressString:Ljava/lang/String;

    return-void
.end method

.method public static synthetic a(Ljava/lang/Runnable;Lorg/json/JSONObject;)V
    .registers 2

    invoke-static {p0, p1}, Lcom/leanplum/internal/FileTransferManager;->lambda$downloadFile$0(Ljava/lang/Runnable;Lorg/json/JSONObject;)V

    return-void
.end method

.method public static synthetic access$000(Lcom/leanplum/internal/FileTransferManager;Lcom/leanplum/internal/Request;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    .registers 7

    invoke-direct/range {p0 .. p6}, Lcom/leanplum/internal/FileTransferManager;->downloadHelper(Lcom/leanplum/internal/Request;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public static synthetic access$100(Lcom/leanplum/internal/FileTransferManager;)Ljava/lang/Object;
    .registers 1

    iget-object p0, p0, Lcom/leanplum/internal/FileTransferManager;->uploadFileLock:Ljava/lang/Object;

    return-object p0
.end method

.method public static synthetic access$200(Lcom/leanplum/internal/FileTransferManager;)Ljava/util/Map;
    .registers 1

    iget-object p0, p0, Lcom/leanplum/internal/FileTransferManager;->fileUploadProgress:Ljava/util/Map;

    return-object p0
.end method

.method public static synthetic access$300(Lcom/leanplum/internal/FileTransferManager;)V
    .registers 1

    invoke-direct {p0}, Lcom/leanplum/internal/FileTransferManager;->printUploadProgress()V

    return-void
.end method

.method public static synthetic b(Ljava/lang/Runnable;Ljava/lang/Exception;)V
    .registers 2

    invoke-static {p0, p1}, Lcom/leanplum/internal/FileTransferManager;->lambda$downloadFile$1(Ljava/lang/Runnable;Ljava/lang/Exception;)V

    return-void
.end method

.method private downloadHelper(Lcom/leanplum/internal/Request;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    .registers 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/leanplum/internal/Request;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    const-string v0, "Leanplum: Error sending request to: "

    invoke-virtual {p1}, Lcom/leanplum/internal/Request;->getHttpMethod()Ljava/lang/String;

    move-result-object v5

    const/4 v8, 0x0

    if-nez p5, :cond_16

    :try_start_9
    new-instance v1, Lcom/leanplum/internal/http/NetworkOperation;

    sget-boolean v6, Lcom/leanplum/internal/Constants;->API_SSL:Z

    sget v7, Lcom/leanplum/internal/Constants;->NETWORK_TIMEOUT_SECONDS_FOR_DOWNLOADS:I

    move-object v2, p2

    move-object v3, p3

    move-object v4, p6

    invoke-direct/range {v1 .. v7}, Lcom/leanplum/internal/http/NetworkOperation;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;ZI)V

    goto :goto_24

    :cond_16
    move-object v2, p2

    new-instance v1, Lcom/leanplum/internal/http/NetworkOperation;

    const-string p2, "https://"

    invoke-virtual {p5, p2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p2

    sget p3, Lcom/leanplum/internal/Constants;->NETWORK_TIMEOUT_SECONDS_FOR_DOWNLOADS:I

    invoke-direct {v1, p5, v5, p2, p3}, Lcom/leanplum/internal/http/NetworkOperation;-><init>(Ljava/lang/String;Ljava/lang/String;ZI)V
    :try_end_24
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_24} :catch_c4
    .catchall {:try_start_9 .. :try_end_24} :catchall_125

    :goto_24
    :try_start_24
    invoke-virtual {v1}, Lcom/leanplum/internal/http/LeanplumHttpConnection;->getURL()Ljava/net/URL;

    move-result-object p2
    :try_end_28
    .catch Ljava/lang/Exception; {:try_start_24 .. :try_end_28} :catch_c0
    .catchall {:try_start_24 .. :try_end_28} :catchall_bb

    :try_start_28
    invoke-virtual {v1}, Lcom/leanplum/internal/http/LeanplumHttpConnection;->connect()V

    invoke-virtual {v1}, Lcom/leanplum/internal/http/LeanplumHttpConnection;->getResponseCode()I

    move-result p3

    const/16 p6, 0xc8

    if-ne p3, p6, :cond_9a

    new-instance p3, Ljava/util/Stack;

    invoke-direct {p3}, Ljava/util/Stack;-><init>()V

    move-object p6, p4

    :goto_39
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object p6

    if-eqz p6, :cond_48

    invoke-virtual {p3, p6}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_39

    :cond_48
    :goto_48
    invoke-virtual {p3}, Ljava/util/AbstractCollection;->isEmpty()Z

    move-result p6

    if-nez p6, :cond_6d

    invoke-virtual {p3}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object p6

    check-cast p6, Ljava/lang/String;

    invoke-static {p6}, Lcom/leanplum/internal/FileManager;->fileRelativeToDocuments(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p6

    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->mkdir()Z

    move-result v0

    if-nez v0, :cond_48

    const-string v0, "Failed to create directory: "

    filled-new-array {p6}, [Ljava/lang/Object;

    move-result-object p6

    invoke-static {v0, p6}, Lcom/leanplum/internal/Log;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_48

    :cond_6d
    new-instance p3, Ljava/io/FileOutputStream;

    new-instance p6, Ljava/io/File;

    invoke-static {p4}, Lcom/leanplum/internal/FileManager;->fileRelativeToDocuments(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p6, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {p3, p6}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-virtual {v1, p3}, Lcom/leanplum/internal/http/LeanplumHttpConnection;->saveResponse(Ljava/io/OutputStream;)V

    iget p3, p0, Lcom/leanplum/internal/FileTransferManager;->pendingDownloads:I

    add-int/lit8 p3, p3, -0x1

    iput p3, p0, Lcom/leanplum/internal/FileTransferManager;->pendingDownloads:I

    iget-object p3, p1, Lcom/leanplum/internal/Request;->response:Lcom/leanplum/internal/Request$ResponseCallback;

    if-eqz p3, :cond_8b

    invoke-interface {p3, v8}, Lcom/leanplum/internal/Request$ResponseCallback;->response(Lorg/json/JSONObject;)V

    :cond_8b
    iget p3, p0, Lcom/leanplum/internal/FileTransferManager;->pendingDownloads:I

    if-nez p3, :cond_96

    iget-object p3, p0, Lcom/leanplum/internal/FileTransferManager;->noPendingDownloadsBlock:Lcom/leanplum/internal/FileTransferManager$NoPendingDownloadsCallback;

    if-eqz p3, :cond_96

    invoke-interface {p3}, Lcom/leanplum/internal/FileTransferManager$NoPendingDownloadsCallback;->noPendingDownloads()V
    :try_end_96
    .catch Ljava/lang/Exception; {:try_start_28 .. :try_end_96} :catch_b4
    .catchall {:try_start_28 .. :try_end_96} :catchall_bb

    :cond_96
    invoke-virtual {v1}, Lcom/leanplum/internal/http/LeanplumHttpConnection;->disconnect()V

    return-void

    :cond_9a
    :try_start_9a
    new-instance p6, Ljava/lang/Exception;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ", HTTP status code: "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-direct {p6, p3}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p6
    :try_end_b4
    .catch Ljava/lang/Exception; {:try_start_9a .. :try_end_b4} :catch_b4
    .catchall {:try_start_9a .. :try_end_b4} :catchall_bb

    :catch_b4
    move-exception v0

    move-object p3, v0

    move-object v8, p3

    move-object p3, p2

    move-object p2, v8

    :goto_b9
    move-object v8, v1

    goto :goto_c7

    :catchall_bb
    move-exception v0

    move-object p0, v0

    move-object v8, v1

    goto/16 :goto_127

    :catch_c0
    move-exception v0

    move-object p2, v0

    move-object p3, v8

    goto :goto_b9

    :catch_c4
    move-exception v0

    move-object p2, v0

    move-object p3, v8

    :goto_c7
    :try_start_c7
    instance-of p6, p2, Ljava/io/EOFException;

    if-eqz p6, :cond_f0

    if-eqz v8, :cond_f0

    invoke-virtual {v8}, Lcom/leanplum/internal/http/LeanplumHttpConnection;->getURL()Ljava/net/URL;

    move-result-object p6

    invoke-virtual {p6, p3}, Ljava/net/URL;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-nez p3, :cond_f0

    invoke-virtual {v8}, Lcom/leanplum/internal/http/LeanplumHttpConnection;->getURL()Ljava/net/URL;

    move-result-object p2

    invoke-virtual {p2}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v4

    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    const/4 v3, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v5, p4

    move-object v6, p5

    invoke-direct/range {v1 .. v7}, Lcom/leanplum/internal/FileTransferManager;->downloadHelper(Lcom/leanplum/internal/Request;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    :try_end_ec
    .catchall {:try_start_c7 .. :try_end_ec} :catchall_125

    invoke-virtual {v8}, Lcom/leanplum/internal/http/LeanplumHttpConnection;->disconnect()V

    return-void

    :cond_f0
    move-object v1, p0

    move-object v2, p1

    move-object v5, p4

    :try_start_f3
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string p1, "Error downloading resource:"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, p2}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    iget p0, v1, Lcom/leanplum/internal/FileTransferManager;->pendingDownloads:I

    add-int/lit8 p0, p0, -0x1

    iput p0, v1, Lcom/leanplum/internal/FileTransferManager;->pendingDownloads:I

    iget-object p0, v2, Lcom/leanplum/internal/Request;->error:Lcom/leanplum/internal/Request$ErrorCallback;

    if-eqz p0, :cond_114

    invoke-interface {p0, p2}, Lcom/leanplum/internal/Request$ErrorCallback;->error(Ljava/lang/Exception;)V

    :cond_114
    iget p0, v1, Lcom/leanplum/internal/FileTransferManager;->pendingDownloads:I

    if-nez p0, :cond_11f

    iget-object p0, v1, Lcom/leanplum/internal/FileTransferManager;->noPendingDownloadsBlock:Lcom/leanplum/internal/FileTransferManager$NoPendingDownloadsCallback;

    if-eqz p0, :cond_11f

    invoke-interface {p0}, Lcom/leanplum/internal/FileTransferManager$NoPendingDownloadsCallback;->noPendingDownloads()V
    :try_end_11f
    .catchall {:try_start_f3 .. :try_end_11f} :catchall_125

    :cond_11f
    if-eqz v8, :cond_124

    invoke-virtual {v8}, Lcom/leanplum/internal/http/LeanplumHttpConnection;->disconnect()V

    :cond_124
    return-void

    :catchall_125
    move-exception v0

    move-object p0, v0

    :goto_127
    if-eqz v8, :cond_12c

    invoke-virtual {v8}, Lcom/leanplum/internal/http/LeanplumHttpConnection;->disconnect()V

    :cond_12c
    throw p0
.end method

.method public static getInstance()Lcom/leanplum/internal/FileTransferManager;
    .registers 1

    sget-object v0, Lcom/leanplum/internal/FileTransferManager;->INSTANCE:Lcom/leanplum/internal/FileTransferManager;

    return-object v0
.end method

.method private static getSizeAsString(I)Ljava/lang/String;
    .registers 3

    const/16 v0, 0x400

    if-ge p0, v0, :cond_b

    const-string v0, " B"

    invoke-static {p0, v0}, Lu35;->g(ILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_b
    const/high16 v0, 0x100000

    if-ge p0, v0, :cond_1d

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    shr-int/lit8 p0, p0, 0xa

    const-string v1, " KB"

    invoke-static {p0, v1, v0}, Lp3p;->k(ILjava/lang/String;Ljava/lang/StringBuilder;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_1d
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    shr-int/lit8 p0, p0, 0x14

    const-string v1, " MB"

    invoke-static {p0, v1, v0}, Lp3p;->k(ILjava/lang/String;Ljava/lang/StringBuilder;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static synthetic lambda$downloadFile$0(Ljava/lang/Runnable;Lorg/json/JSONObject;)V
    .registers 2

    if-eqz p0, :cond_5

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    :cond_5
    return-void
.end method

.method private static synthetic lambda$downloadFile$1(Ljava/lang/Runnable;Ljava/lang/Exception;)V
    .registers 2

    if-eqz p0, :cond_5

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    :cond_5
    return-void
.end method

.method private printUploadProgress()V
    .registers 13

    iget-object v0, p0, Lcom/leanplum/internal/FileTransferManager;->fileUploadSize:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    iget-object v1, p0, Lcom/leanplum/internal/FileTransferManager;->fileUploadSize:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    const/4 v2, 0x0

    move v3, v2

    move v4, v3

    move v5, v4

    :goto_14
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_4c

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Map$Entry;

    invoke-interface {v6}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/io/File;

    invoke-interface {v6}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Long;

    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    iget-object v6, p0, Lcom/leanplum/internal/FileTransferManager;->fileUploadProgress:Ljava/util/Map;

    invoke-interface {v6, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Double;

    invoke-virtual {v6}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v6

    const-wide/high16 v10, 0x3ff0000000000000L    # 1.0

    cmpl-double v10, v6, v10

    if-nez v10, :cond_44

    add-int/lit8 v3, v3, 0x1

    :cond_44
    long-to-double v10, v8

    mul-double/2addr v10, v6

    double-to-int v6, v10

    add-int/2addr v4, v6

    int-to-long v5, v5

    add-long/2addr v5, v8

    long-to-int v5, v5

    goto :goto_14

    :cond_4c
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v6, "Uploading resources. "

    invoke-direct {v1, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 v3, 0x2f

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " files completed; "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v4}, Lcom/leanplum/internal/FileTransferManager;->getSizeAsString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-static {v5}, Lcom/leanplum/internal/FileTransferManager;->getSizeAsString(I)Ljava/lang/String;

    move-result-object v0

    const-string v3, " transferred."

    invoke-static {v1, v0, v3}, Lz1m;->l(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/leanplum/internal/FileTransferManager;->fileUploadProgressString:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_86

    iput-object v0, p0, Lcom/leanplum/internal/FileTransferManager;->fileUploadProgressString:Ljava/lang/String;

    new-array p0, v2, [Ljava/lang/Object;

    invoke-static {v0, p0}, Lcom/leanplum/internal/Log;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_86
    return-void
.end method


# virtual methods
.method public downloadFile(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/Runnable;)V
    .registers 13

    sget-boolean v0, Lcom/leanplum/internal/Constants;->isTestMode:Z

    if-nez v0, :cond_53

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    iget-object v1, p0, Lcom/leanplum/internal/FileTransferManager;->fileTransferStatus:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_53

    invoke-static {}, Lcom/leanplum/internal/RequestBuilder;->withDownloadFileAction()Lcom/leanplum/internal/RequestBuilder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/leanplum/internal/RequestBuilder;->create()Lcom/leanplum/internal/Request;

    move-result-object v4

    new-instance v1, Lqj;

    const/4 v2, 0x2

    invoke-direct {v1, p3, v2}, Lqj;-><init>(Ljava/lang/Runnable;B)V

    invoke-virtual {v4, v1}, Lcom/leanplum/internal/Request;->onResponse(Lcom/leanplum/internal/Request$ResponseCallback;)V

    new-instance p3, Lqj;

    const/4 v1, 0x3

    invoke-direct {p3, p4, v1}, Lqj;-><init>(Ljava/lang/Runnable;B)V

    invoke-virtual {v4, p3}, Lcom/leanplum/internal/Request;->onError(Lcom/leanplum/internal/Request$ErrorCallback;)V

    iget p3, p0, Lcom/leanplum/internal/FileTransferManager;->pendingDownloads:I

    add-int/lit8 p3, p3, 0x1

    iput p3, p0, Lcom/leanplum/internal/FileTransferManager;->pendingDownloads:I

    const-string p3, "Downloading resource: %s"

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p4

    invoke-static {p3, p4}, Lcom/leanplum/internal/Log;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object p3, p0, Lcom/leanplum/internal/FileTransferManager;->fileTransferStatus:Ljava/util/Map;

    invoke-interface {p3, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {v4}, Lcom/leanplum/internal/RequestSender;->createArgsDictionary(Lcom/leanplum/internal/Request;)Ljava/util/Map;

    move-result-object v7

    const-string p3, "filename"

    invoke-interface {v7, p3, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {}, Lcom/leanplum/internal/APIConfig;->getInstance()Lcom/leanplum/internal/APIConfig;

    move-result-object p3

    invoke-virtual {p3, v7}, Lcom/leanplum/internal/APIConfig;->attachApiKeys(Ljava/util/Map;)Z

    move-result p3

    if-nez p3, :cond_54

    :cond_53
    return-void

    :cond_54
    invoke-static {}, Lcom/leanplum/internal/OperationQueue;->sharedInstance()Lcom/leanplum/internal/OperationQueue;

    move-result-object p3

    new-instance v2, Lcom/leanplum/internal/FileTransferManager$1;

    move-object v3, p0

    move-object v5, p1

    move-object v6, p2

    invoke-direct/range {v2 .. v7}, Lcom/leanplum/internal/FileTransferManager$1;-><init>(Lcom/leanplum/internal/FileTransferManager;Lcom/leanplum/internal/Request;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    invoke-virtual {p3, v2}, Lcom/leanplum/internal/OperationQueue;->addParallelOperation(Ljava/lang/Runnable;)V

    return-void
.end method

.method public numPendingDownloads()I
    .registers 1

    iget p0, p0, Lcom/leanplum/internal/FileTransferManager;->pendingDownloads:I

    return p0
.end method

.method public onNoPendingDownloads(Lcom/leanplum/internal/FileTransferManager$NoPendingDownloadsCallback;)V
    .registers 2

    iput-object p1, p0, Lcom/leanplum/internal/FileTransferManager;->noPendingDownloadsBlock:Lcom/leanplum/internal/FileTransferManager$NoPendingDownloadsCallback;

    return-void
.end method

.method public sendFilesNow(Ljava/util/List;Ljava/util/List;Ljava/util/List;)V
    .registers 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lorg/json/JSONObject;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Ljava/io/InputStream;",
            ">;)V"
        }
    .end annotation

    invoke-static {}, Lcom/leanplum/internal/RequestBuilder;->withUploadFileAction()Lcom/leanplum/internal/RequestBuilder;

    move-result-object v0

    const-string v1, "data"

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Lcom/leanplum/internal/RequestBuilder;->andParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/leanplum/internal/RequestBuilder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/leanplum/internal/RequestBuilder;->create()Lcom/leanplum/internal/Request;

    move-result-object v2

    sget-boolean p1, Lcom/leanplum/internal/Constants;->isTestMode:Z

    if-nez p1, :cond_8f

    invoke-static {v2}, Lcom/leanplum/internal/RequestSender;->createArgsDictionary(Lcom/leanplum/internal/Request;)Ljava/util/Map;

    move-result-object v5

    invoke-static {}, Lcom/leanplum/internal/APIConfig;->getInstance()Lcom/leanplum/internal/APIConfig;

    move-result-object p1

    invoke-virtual {p1, v5}, Lcom/leanplum/internal/APIConfig;->attachApiKeys(Ljava/util/Map;)Z

    move-result p1

    if-eqz p1, :cond_8f

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    const/4 p1, 0x0

    move v0, p1

    :goto_2b
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_89

    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    if-eqz v1, :cond_86

    sget-object v4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    iget-object v6, p0, Lcom/leanplum/internal/FileTransferManager;->fileTransferStatus:Ljava/util/Map;

    invoke-interface {v6, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_86

    new-instance v4, Ljava/io/File;

    invoke-direct {v4, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    :try_start_4c
    invoke-interface {p3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/io/InputStream;

    invoke-virtual {v6}, Ljava/io/InputStream;->available()I

    move-result v6
    :try_end_56
    .catch Ljava/io/IOException; {:try_start_4c .. :try_end_56} :catch_64
    .catch Ljava/lang/NullPointerException; {:try_start_4c .. :try_end_56} :catch_58

    int-to-long v6, v6

    goto :goto_68

    :catch_58
    const-string v4, "Unable to read file "

    invoke-virtual {v4, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-array v4, p1, [Ljava/lang/Object;

    invoke-static {v1, v4}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_86

    :catch_64
    invoke-virtual {v4}, Ljava/io/File;->length()J

    move-result-wide v6

    :goto_68
    iget-object v8, p0, Lcom/leanplum/internal/FileTransferManager;->fileTransferStatus:Ljava/util/Map;

    sget-object v9, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-interface {v8, v1, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v1, p0, Lcom/leanplum/internal/FileTransferManager;->fileUploadSize:Ljava/util/Map;

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-interface {v1, v4, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, p0, Lcom/leanplum/internal/FileTransferManager;->fileUploadProgress:Ljava/util/Map;

    const-wide/16 v6, 0x0

    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v6

    invoke-interface {v1, v4, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_86
    :goto_86
    add-int/lit8 v0, v0, 0x1

    goto :goto_2b

    :cond_89
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-nez p1, :cond_90

    :cond_8f
    return-void

    :cond_90
    invoke-direct {p0}, Lcom/leanplum/internal/FileTransferManager;->printUploadProgress()V

    invoke-static {}, Lcom/leanplum/internal/OperationQueue;->sharedInstance()Lcom/leanplum/internal/OperationQueue;

    move-result-object p1

    new-instance v0, Lcom/leanplum/internal/FileTransferManager$2;

    move-object v1, p0

    move-object v4, p3

    invoke-direct/range {v0 .. v5}, Lcom/leanplum/internal/FileTransferManager$2;-><init>(Lcom/leanplum/internal/FileTransferManager;Lcom/leanplum/internal/Request;Ljava/util/List;Ljava/util/List;Ljava/util/Map;)V

    invoke-virtual {p1, v0}, Lcom/leanplum/internal/OperationQueue;->addParallelOperation(Ljava/lang/Runnable;)V

    return-void
.end method
