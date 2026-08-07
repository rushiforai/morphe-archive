.class public final Lcom/tantanapp/common/nativelib/manager/worker/DownloadWorker$b;
.super Lcom/tantanapp/common/nativelib/manager/worker/DownloadWorker$a;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tantanapp/common/nativelib/manager/worker/DownloadWorker;->doWork()Lcom/tantanapp/sharelib/workmanager/Result;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001\u00a8\u0006\u0002"
    }
    d2 = {
        "com/tantanapp/common/nativelib/manager/worker/DownloadWorker$b",
        "Lcom/tantanapp/common/nativelib/manager/worker/DownloadWorker$a;",
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
.field public final synthetic a:[Lcom/tantanapp/sharelib/workmanager/Result;

.field public final synthetic b:Lcom/tantanapp/common/nativelib/manager/worker/DownloadWorker;

.field public final synthetic c:Lcom/tantanapp/common/nativelib/manager/bean/ZipFileInfo;

.field public final synthetic d:Ljava/util/concurrent/CountDownLatch;


# direct methods
.method public constructor <init>([Lcom/tantanapp/sharelib/workmanager/Result;Lcom/tantanapp/common/nativelib/manager/worker/DownloadWorker;Lcom/tantanapp/common/nativelib/manager/bean/ZipFileInfo;Ljava/util/concurrent/CountDownLatch;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/common/nativelib/manager/worker/DownloadWorker$b;->a:[Lcom/tantanapp/sharelib/workmanager/Result;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tantanapp/common/nativelib/manager/worker/DownloadWorker$b;->b:Lcom/tantanapp/common/nativelib/manager/worker/DownloadWorker;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/tantanapp/common/nativelib/manager/worker/DownloadWorker$b;->c:Lcom/tantanapp/common/nativelib/manager/bean/ZipFileInfo;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/tantanapp/common/nativelib/manager/worker/DownloadWorker$b;->d:Ljava/util/concurrent/CountDownLatch;

    .line 8
    .line 9
    invoke-direct {p0}, Lcom/tantanapp/common/nativelib/manager/worker/DownloadWorker$a;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method
