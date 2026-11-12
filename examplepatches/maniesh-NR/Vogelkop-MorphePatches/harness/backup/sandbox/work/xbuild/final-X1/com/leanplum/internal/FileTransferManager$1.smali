.class Lcom/leanplum/internal/FileTransferManager$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/leanplum/internal/FileTransferManager;->downloadFile(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/Runnable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/leanplum/internal/FileTransferManager;

.field final synthetic val$dict:Ljava/util/Map;

.field final synthetic val$path:Ljava/lang/String;

.field final synthetic val$request:Lcom/leanplum/internal/Request;

.field final synthetic val$url:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/leanplum/internal/FileTransferManager;Lcom/leanplum/internal/Request;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    .registers 6

    iput-object p1, p0, Lcom/leanplum/internal/FileTransferManager$1;->this$0:Lcom/leanplum/internal/FileTransferManager;

    iput-object p2, p0, Lcom/leanplum/internal/FileTransferManager$1;->val$request:Lcom/leanplum/internal/Request;

    iput-object p3, p0, Lcom/leanplum/internal/FileTransferManager$1;->val$path:Ljava/lang/String;

    iput-object p4, p0, Lcom/leanplum/internal/FileTransferManager$1;->val$url:Ljava/lang/String;

    iput-object p5, p0, Lcom/leanplum/internal/FileTransferManager$1;->val$dict:Ljava/util/Map;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 8

    :try_start_0
    iget-object v0, p0, Lcom/leanplum/internal/FileTransferManager$1;->this$0:Lcom/leanplum/internal/FileTransferManager;

    iget-object v1, p0, Lcom/leanplum/internal/FileTransferManager$1;->val$request:Lcom/leanplum/internal/Request;

    sget-object v2, Lcom/leanplum/internal/Constants;->API_HOST_NAME:Ljava/lang/String;

    sget-object v3, Lcom/leanplum/internal/Constants;->API_SERVLET:Ljava/lang/String;

    iget-object v4, p0, Lcom/leanplum/internal/FileTransferManager$1;->val$path:Ljava/lang/String;

    iget-object v5, p0, Lcom/leanplum/internal/FileTransferManager$1;->val$url:Ljava/lang/String;

    iget-object v6, p0, Lcom/leanplum/internal/FileTransferManager$1;->val$dict:Ljava/util/Map;

    # invokes: Lcom/leanplum/internal/FileTransferManager;->downloadHelper(Lcom/leanplum/internal/Request;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    invoke-static/range {v0 .. v6}, Lcom/leanplum/internal/FileTransferManager;->access$000(Lcom/leanplum/internal/FileTransferManager;Lcom/leanplum/internal/Request;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    :try_end_11
    .catchall {:try_start_0 .. :try_end_11} :catchall_12

    return-void

    :catchall_12
    move-exception v0

    move-object p0, v0

    invoke-static {p0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    return-void
.end method
