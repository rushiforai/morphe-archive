.class Lcom/leanplum/Leanplum$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/leanplum/CacheUpdateBlock;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/leanplum/Leanplum;->start(Landroid/content/Context;Ljava/lang/String;Ljava/util/Map;Lcom/leanplum/callbacks/StartCallback;Ljava/lang/Boolean;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public updateCache()V
    .registers 1

    # invokes: Lcom/leanplum/Leanplum;->triggerVariablesChanged()V
    invoke-static {}, Lcom/leanplum/Leanplum;->access$000()V

    invoke-static {}, Lcom/leanplum/internal/FileTransferManager;->getInstance()Lcom/leanplum/internal/FileTransferManager;

    move-result-object p0

    invoke-virtual {p0}, Lcom/leanplum/internal/FileTransferManager;->numPendingDownloads()I

    move-result p0

    if-nez p0, :cond_10

    invoke-static {}, Lcom/leanplum/Leanplum;->triggerVariablesChangedAndNoDownloadsPending()V

    :cond_10
    return-void
.end method
