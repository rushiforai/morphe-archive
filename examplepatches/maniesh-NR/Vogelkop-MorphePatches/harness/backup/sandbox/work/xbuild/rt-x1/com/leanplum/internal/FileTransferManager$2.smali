.class Lcom/leanplum/internal/FileTransferManager$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/leanplum/internal/FileTransferManager;->sendFilesNow(Ljava/util/List;Ljava/util/List;Ljava/util/List;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/leanplum/internal/FileTransferManager;

.field final synthetic val$dict:Ljava/util/Map;

.field final synthetic val$filesToUpload:Ljava/util/List;

.field final synthetic val$request:Lcom/leanplum/internal/Request;

.field final synthetic val$streams:Ljava/util/List;


# direct methods
.method public constructor <init>(Lcom/leanplum/internal/FileTransferManager;Lcom/leanplum/internal/Request;Ljava/util/List;Ljava/util/List;Ljava/util/Map;)V
    .registers 6

    iput-object p1, p0, Lcom/leanplum/internal/FileTransferManager$2;->this$0:Lcom/leanplum/internal/FileTransferManager;

    iput-object p2, p0, Lcom/leanplum/internal/FileTransferManager$2;->val$request:Lcom/leanplum/internal/Request;

    iput-object p3, p0, Lcom/leanplum/internal/FileTransferManager$2;->val$filesToUpload:Ljava/util/List;

    iput-object p4, p0, Lcom/leanplum/internal/FileTransferManager$2;->val$streams:Ljava/util/List;

    iput-object p5, p0, Lcom/leanplum/internal/FileTransferManager$2;->val$dict:Ljava/util/Map;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 10

    const-string v0, "Leanplum: Error sending request: "

    iget-object v1, p0, Lcom/leanplum/internal/FileTransferManager$2;->this$0:Lcom/leanplum/internal/FileTransferManager;

    # getter for: Lcom/leanplum/internal/FileTransferManager;->uploadFileLock:Ljava/lang/Object;
    invoke-static {v1}, Lcom/leanplum/internal/FileTransferManager;->access$100(Lcom/leanplum/internal/FileTransferManager;)Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    const/4 v2, 0x0

    :try_start_a
    new-instance v3, Lcom/leanplum/internal/http/UploadOperation;

    sget-object v4, Lcom/leanplum/internal/Constants;->API_HOST_NAME:Ljava/lang/String;

    sget-object v5, Lcom/leanplum/internal/Constants;->API_SERVLET:Ljava/lang/String;

    iget-object v6, p0, Lcom/leanplum/internal/FileTransferManager$2;->val$request:Lcom/leanplum/internal/Request;

    invoke-virtual {v6}, Lcom/leanplum/internal/Request;->getHttpMethod()Ljava/lang/String;

    move-result-object v6

    sget-boolean v7, Lcom/leanplum/internal/Constants;->API_SSL:Z

    const/16 v8, 0x3c

    invoke-direct/range {v3 .. v8}, Lcom/leanplum/internal/http/UploadOperation;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZI)V
    :try_end_1d
    .catch Lorg/json/JSONException; {:try_start_a .. :try_end_1d} :catch_9a
    .catch Ljava/net/SocketTimeoutException; {:try_start_a .. :try_end_1d} :catch_85
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_1d} :catch_73
    .catchall {:try_start_a .. :try_end_1d} :catchall_d7

    :try_start_1d
    iget-object v2, p0, Lcom/leanplum/internal/FileTransferManager$2;->val$filesToUpload:Ljava/util/List;

    iget-object v4, p0, Lcom/leanplum/internal/FileTransferManager$2;->val$streams:Ljava/util/List;

    iget-object v5, p0, Lcom/leanplum/internal/FileTransferManager$2;->val$dict:Ljava/util/Map;

    invoke-virtual {v3, v2, v4, v5}, Lcom/leanplum/internal/http/UploadOperation;->uploadFiles(Ljava/util/List;Ljava/util/List;Ljava/util/Map;)Z

    move-result v2

    if-eqz v2, :cond_51

    invoke-virtual {v3}, Lcom/leanplum/internal/http/LeanplumHttpConnection;->getJsonResponse()Lorg/json/JSONObject;

    move-result-object v2

    invoke-virtual {v3}, Lcom/leanplum/internal/http/LeanplumHttpConnection;->getResponseCode()I

    move-result v4

    const/16 v5, 0xc8

    if-ne v4, v5, :cond_3f

    iget-object v0, p0, Lcom/leanplum/internal/FileTransferManager$2;->val$request:Lcom/leanplum/internal/Request;

    iget-object v0, v0, Lcom/leanplum/internal/Request;->response:Lcom/leanplum/internal/Request$ResponseCallback;

    if-eqz v0, :cond_61

    invoke-interface {v0, v2}, Lcom/leanplum/internal/Request$ResponseCallback;->response(Lorg/json/JSONObject;)V

    goto :goto_61

    :cond_3f
    new-instance v2, Ljava/lang/Exception;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v2

    :cond_51
    iget-object v0, p0, Lcom/leanplum/internal/FileTransferManager$2;->val$request:Lcom/leanplum/internal/Request;

    iget-object v0, v0, Lcom/leanplum/internal/Request;->error:Lcom/leanplum/internal/Request$ErrorCallback;

    if-eqz v0, :cond_61

    new-instance v2, Ljava/lang/Exception;

    const-string v4, "Leanplum: Unable to read file."

    invoke-direct {v2, v4}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, v2}, Lcom/leanplum/internal/Request$ErrorCallback;->error(Ljava/lang/Exception;)V
    :try_end_61
    .catch Lorg/json/JSONException; {:try_start_1d .. :try_end_61} :catch_70
    .catch Ljava/net/SocketTimeoutException; {:try_start_1d .. :try_end_61} :catch_6d
    .catch Ljava/lang/Exception; {:try_start_1d .. :try_end_61} :catch_6a
    .catchall {:try_start_1d .. :try_end_61} :catchall_65

    :cond_61
    :goto_61
    :try_start_61
    invoke-virtual {v3}, Lcom/leanplum/internal/http/LeanplumHttpConnection;->disconnect()V
    :try_end_64
    .catchall {:try_start_61 .. :try_end_64} :catchall_e1

    goto :goto_ae

    :catchall_65
    move-exception v0

    move-object p0, v0

    move-object v2, v3

    goto/16 :goto_d9

    :catch_6a
    move-exception v0

    move-object v2, v3

    goto :goto_74

    :catch_6d
    move-exception v0

    move-object v2, v3

    goto :goto_86

    :catch_70
    move-exception v0

    move-object v2, v3

    goto :goto_9b

    :catch_73
    move-exception v0

    :goto_74
    :try_start_74
    const-string v3, "Unable to send file."

    invoke-static {v3, v0}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    iget-object v3, p0, Lcom/leanplum/internal/FileTransferManager$2;->val$request:Lcom/leanplum/internal/Request;

    iget-object v3, v3, Lcom/leanplum/internal/Request;->error:Lcom/leanplum/internal/Request$ErrorCallback;

    if-eqz v3, :cond_82

    invoke-interface {v3, v0}, Lcom/leanplum/internal/Request$ErrorCallback;->error(Ljava/lang/Exception;)V

    :cond_82
    if-eqz v2, :cond_ae

    goto :goto_ab

    :catch_85
    move-exception v0

    :goto_86
    const-string v3, "Timeout uploading files. Try again or limit the number of files to upload with parameters to syncResourcesAsync."

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {v3, v4}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v3, p0, Lcom/leanplum/internal/FileTransferManager$2;->val$request:Lcom/leanplum/internal/Request;

    iget-object v3, v3, Lcom/leanplum/internal/Request;->error:Lcom/leanplum/internal/Request$ErrorCallback;

    if-eqz v3, :cond_97

    invoke-interface {v3, v0}, Lcom/leanplum/internal/Request$ErrorCallback;->error(Ljava/lang/Exception;)V

    :cond_97
    if-eqz v2, :cond_ae

    goto :goto_ab

    :catch_9a
    move-exception v0

    :goto_9b
    const-string v3, "Unable to convert to JSON."

    invoke-static {v3, v0}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    iget-object v3, p0, Lcom/leanplum/internal/FileTransferManager$2;->val$request:Lcom/leanplum/internal/Request;

    iget-object v3, v3, Lcom/leanplum/internal/Request;->error:Lcom/leanplum/internal/Request$ErrorCallback;

    if-eqz v3, :cond_a9

    invoke-interface {v3, v0}, Lcom/leanplum/internal/Request$ErrorCallback;->error(Ljava/lang/Exception;)V
    :try_end_a9
    .catchall {:try_start_74 .. :try_end_a9} :catchall_d7

    :cond_a9
    if-eqz v2, :cond_ae

    :goto_ab
    :try_start_ab
    invoke-virtual {v2}, Lcom/leanplum/internal/http/LeanplumHttpConnection;->disconnect()V

    :cond_ae
    :goto_ae
    iget-object v0, p0, Lcom/leanplum/internal/FileTransferManager$2;->val$filesToUpload:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_b4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_d0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/io/File;

    iget-object v3, p0, Lcom/leanplum/internal/FileTransferManager$2;->this$0:Lcom/leanplum/internal/FileTransferManager;

    # getter for: Lcom/leanplum/internal/FileTransferManager;->fileUploadProgress:Ljava/util/Map;
    invoke-static {v3}, Lcom/leanplum/internal/FileTransferManager;->access$200(Lcom/leanplum/internal/FileTransferManager;)Ljava/util/Map;

    move-result-object v3

    const-wide/high16 v4, 0x3ff0000000000000L    # 1.0

    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v4

    invoke-interface {v3, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_b4

    :cond_d0
    iget-object p0, p0, Lcom/leanplum/internal/FileTransferManager$2;->this$0:Lcom/leanplum/internal/FileTransferManager;

    # invokes: Lcom/leanplum/internal/FileTransferManager;->printUploadProgress()V
    invoke-static {p0}, Lcom/leanplum/internal/FileTransferManager;->access$300(Lcom/leanplum/internal/FileTransferManager;)V

    monitor-exit v1

    return-void

    :catchall_d7
    move-exception v0

    move-object p0, v0

    :goto_d9
    if-eqz v2, :cond_de

    invoke-virtual {v2}, Lcom/leanplum/internal/http/LeanplumHttpConnection;->disconnect()V

    :cond_de
    throw p0

    :goto_df
    monitor-exit v1
    :try_end_e0
    .catchall {:try_start_ab .. :try_end_e0} :catchall_e1

    throw p0

    :catchall_e1
    move-exception v0

    move-object p0, v0

    goto :goto_df
.end method
