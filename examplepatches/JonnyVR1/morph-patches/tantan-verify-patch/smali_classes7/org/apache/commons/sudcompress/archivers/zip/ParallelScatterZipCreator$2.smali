.class Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator;->submit(Ljava/util/concurrent/Callable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable<",
        "Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator;

.field final synthetic val$callable:Ljava/util/concurrent/Callable;


# direct methods
.method public constructor <init>(Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator;Ljava/util/concurrent/Callable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator$2;->this$0:Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator;

    .line 2
    .line 3
    iput-object p2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator$2;->val$callable:Ljava/util/concurrent/Callable;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public bridge synthetic call()Ljava/lang/Object;
    .locals 0

    .line 19
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator$2;->call()Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream;

    move-result-object p0

    return-object p0
.end method

.method public call()Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream;
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator$2;->val$callable:Ljava/util/concurrent/Callable;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/concurrent/Callable;->call()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator$2;->this$0:Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator;

    .line 7
    .line 8
    invoke-static {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator;->c(Lorg/apache/commons/sudcompress/archivers/zip/ParallelScatterZipCreator;)Ljava/lang/ThreadLocal;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream;

    .line 17
    .line 18
    return-object p0
.end method
