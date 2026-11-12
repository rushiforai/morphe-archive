.class Lcom/leanplum/internal/FileManager$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/leanplum/internal/FileManager;->enableResourceSyncing(Ljava/util/List;Ljava/util/List;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$compiledExcludePatterns:Ljava/util/List;

.field final synthetic val$compiledIncludePatterns:Ljava/util/List;


# direct methods
.method public constructor <init>(Ljava/util/List;Ljava/util/List;)V
    .registers 3

    iput-object p1, p0, Lcom/leanplum/internal/FileManager$1;->val$compiledIncludePatterns:Ljava/util/List;

    iput-object p2, p0, Lcom/leanplum/internal/FileManager$1;->val$compiledExcludePatterns:Ljava/util/List;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    :try_start_0
    iget-object v0, p0, Lcom/leanplum/internal/FileManager$1;->val$compiledIncludePatterns:Ljava/util/List;

    iget-object p0, p0, Lcom/leanplum/internal/FileManager$1;->val$compiledExcludePatterns:Ljava/util/List;

    # invokes: Lcom/leanplum/internal/FileManager;->enableResourceSyncing(Ljava/util/List;Ljava/util/List;)V
    invoke-static {v0, p0}, Lcom/leanplum/internal/FileManager;->access$000(Ljava/util/List;Ljava/util/List;)V
    :try_end_7
    .catchall {:try_start_0 .. :try_end_7} :catchall_8

    return-void

    :catchall_8
    move-exception p0

    invoke-static {p0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    return-void
.end method
